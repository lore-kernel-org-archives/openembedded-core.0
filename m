Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C56406C4C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:36:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n133so3437780wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=nLoVuNeSYwI23rIB2pEhexuqFVPzr9R35I0Fk6BqlOM=;
	b=e15BjfkaM5EPMjiyDEnhrUkLIHXtFm2BQV5EfxiYqigL55utOXnlZUJ3zItpcRdwC9
	o22rF1wc/EiEnPNBvtZVoff4x+y/Pu0WfCd/MtocD4aSELmMn+UcYlVOCrnYDuTMublX
	tzmpC+FEvNXonDznVZHsmkHRcMeIJ8W5Ij8PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nLoVuNeSYwI23rIB2pEhexuqFVPzr9R35I0Fk6BqlOM=;
	b=e6JOAISyRsBisVxLgmE7cduprxoijNix6qrkDp93jRu1WnylJD0MtYNMrz9pQjk8hy
	CZhJX1z/veghnYHhl4khj+Zfp3wcBZXAMqJC2uJRrxnP1Ax6les+e1Eow7bD51n4z4Bj
	eJMoTI+SJbzedIp7xx+QWMKmCy5UrIwpTM4trWY0ctVmwGpON1fG+Qnl6qP41mfVJbQD
	ZIwBfi0EDdcRPCuvhm6Ipn9aYYvfdLvtp/AGoqTZPhvGCPHJ7+HQ7svelYsVQ2gRceBF
	hrZYIHjyeM3raP7BAC7nakBJWTfaJ+5aAD1hpDxfvKI6gQ5w2p8m64UaeFV2pGGmuLnI
	ozMA==
X-Gm-Message-State: AA+aEWaT5Tps8OAFij1o9Qjt7BPbIsf6tydPQkfKyfFLKWkybuDaWK2N
	V2PZt6ZwQGyuQXvFAzuVpomE43MQaoQ=
X-Google-Smtp-Source: AFSGD/XHV1TCLUEQq8r/j08/7fNH0bpf/CmGeGHx18g/ORAhOvYTa3BsxxuQFAYsLBOL4TtWY55bSA==
X-Received: by 2002:a1c:1b95:: with SMTP id b143mr3708152wmb.3.1543426593163; 
	Wed, 28 Nov 2018 09:36:33 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a62sm1809943wmf.47.2018.11.28.09.36.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 09:36:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:36:30 +0000
Message-Id: <20181128173631.18288-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] scripts/runqemu: Tidy up lock handling code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 17:36:34 -0000

Various tweaks:
- Balance up the aquire/release functions
- Use debug messge for both acquiring and release message for consistency in logs
- Use None instead of an empty string
- Reset the value of the field if we don't have the lock any more

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3786646c5d7..d25de42f27d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -220,7 +220,7 @@ class BaseConfig(object):
         self.tcpserial_portnum = ''
         self.custombiosdir = ''
         self.lock = ''
-        self.lock_descriptor = ''
+        self.lock_descriptor = None
         self.bitbake_e = ''
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
@@ -254,13 +254,17 @@ class BaseConfig(object):
                 logger.info(msg)
             if self.lock_descriptor:
                 self.lock_descriptor.close()
+                self.lock_descriptor = None
             return False
         return True
 
     def release_lock(self):
-        fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
-        self.lock_descriptor.close()
-        os.remove(self.lock)
+        if self.lock_descriptor:
+            logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
+            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
+            self.lock_descriptor.close()
+            os.remove(self.lock)
+            self.lock_descriptor = None
 
     def get(self, key):
         if key in self.d:
@@ -1237,9 +1241,7 @@ class BaseConfig(object):
             cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % cmd)
             subprocess.check_call(cmd, shell=True)
-        if self.lock_descriptor:
-            logger.info("Releasing lockfile for tap device '%s'" % self.tap)
-            self.release_lock()
+        self.release_lock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-- 
2.17.1


