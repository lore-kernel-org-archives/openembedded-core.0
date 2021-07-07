Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19289.1625653070185342327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 03:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6aL4aBx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso1310381wmj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0p5Eh2R9e18RLtr3WFXbdWYwqpa7WlwG+DXF+7vAlI=;
        b=F6aL4aBxGs/gLHSAvm56Y+y+cUyS7UQnSiKlHXIefTl3LfT8G92cfuFfKMUZ2r1TCI
         OFfpFrx5i7BAgJyLcxThuA51Z6qVsIg+fvF4mJ0OFU3tOWjuLV+1J6KWZyU44I6+25YU
         a+wWOtVJd8BlQBs4mgWCzxonMJUZIm2uXNL9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0p5Eh2R9e18RLtr3WFXbdWYwqpa7WlwG+DXF+7vAlI=;
        b=lMmuxbzESqy3yRT8mJPmncy1y6YI7myDpFf3xffxbS8Bd/Xisp1a67X4Soffd/L3W0
         O/O518mpoegfk8/buiW2ZnAKtl6F8Fv7dTBfD4e9xLeKW7lCBphhTj+KD/QRl1d8DPN8
         Xu9b6FTbvbDjDrT6AooQk1oKprJI0ycuTVK1Oehn8M2RSoyAbv44PKBQewFsrTXlUn7z
         YSDlalTjAnQYIs64ln0QImxx37vW63OErt4NkHmRMn2tAYUjgxhusaRupYp1ZUivUbGL
         6MmGas+9zhhyWIFUarFkFfWnlMHaPf1M8o2A39bFuuLM6h9S2iaQ83+xqpRMrMXyj7XG
         cl/w==
X-Gm-Message-State: AOAM533ZwE8KJZGkxqHcLLQD9r33MWMWFIcJYvLdNlpDLCOz5kohMv/t
	9RvYFJmVTGsG6gm388OGnk8KnNxarL0cXA==
X-Google-Smtp-Source: ABdhPJwOq9kwGHBoQJrn/GAYlcBj4RtWfxk2xhMPX6R9i/GVBc96afl3zJO3vhNle0RHE+xzLlv/VA==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr19184869wmq.26.1625653068528;
        Wed, 07 Jul 2021 03:17:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id q1sm15828170wma.27.2021.07.07.03.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:17:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] runqemu: Remove potential lock races around tap device handling
Date: Wed,  7 Jul 2021 11:17:46 +0100
Message-Id: <20210707101747.2689765-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qemu tap device handling is potentially race ridden. We pass the
fd to the main qemu subprocess which is good as it means the lock is held
as long as the qemu process exists. This means we shouldn't unlock it
ourselves though, only close the file. We also can't delete the file
as we have no idea if qemu is still using it. We could try and obtain
an exclusive new lock, then the file would be safe to unlink but it
doesn't seem worth it.

Also fix the same issue in the port lock code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1f332ef5252..2914f15d06c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -233,9 +233,12 @@ class BaseConfig(object):
     def release_taplock(self):
         if self.taplock_descriptor:
             logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
-            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
+            # We pass the fd to the qemu process and if we unlock here, it would unlock for
+            # that too. Therefore don't unlock, just close
+            # fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
             self.taplock_descriptor.close()
-            os.remove(self.taplock)
+            # Removing the file is a potential race, don't do that either
+            # os.remove(self.taplock)
             self.taplock_descriptor = None
 
     def check_free_port(self, host, port, lockdir):
@@ -273,17 +276,23 @@ class BaseConfig(object):
 
     def release_portlock(self, lockfile=None):
         if lockfile != None:
-           logger.debug("Releasing lockfile '%s'" % lockfile)
-           fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
-           self.portlocks[lockfile].close()
-           os.remove(lockfile)
-           del self.portlocks[lockfile]
+            logger.debug("Releasing lockfile '%s'" % lockfile)
+            # We pass the fd to the qemu process and if we unlock here, it would unlock for
+            # that too. Therefore don't unlock, just close
+            # fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
+            self.portlocks[lockfile].close()
+            # Removing the file is a potential race, don't do that either
+            # os.remove(lockfile)
+            del self.portlocks[lockfile]
         elif len(self.portlocks):
             for lockfile, descriptor in self.portlocks.items():
                 logger.debug("Releasing lockfile '%s'" % lockfile)
-                fcntl.flock(descriptor, fcntl.LOCK_UN)
+                # We pass the fd to the qemu process and if we unlock here, it would unlock for
+                # that too. Therefore don't unlock, just close
+                # fcntl.flock(descriptor, fcntl.LOCK_UN)
                 descriptor.close()
-                os.remove(lockfile)
+                # Removing the file is a potential race, don't do that either
+                # os.remove(lockfile)
             self.portlocks = {}
 
     def get(self, key):
-- 
2.30.2

