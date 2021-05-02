Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.24854.1619986349483198314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 13:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RACV32br;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id m12so2270332pgr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsHeaFYBh4k3uU1PKIGzNMvHFQjvEUxW3RQBUPi0odc=;
        b=RACV32br0M39IHlQoilK69tOj4KlIq99QcorwCIiE9JynEoQJM//GADuzSw/R8NefO
         1oDDErzzm+5+qOzLMe7NZAEHBTOn8mdokt3vwlCRQVa0hVCS1l8L4fwgUsHR7paJDzYw
         EEsRSiDgQYPjfoXgKWS3Uo5JQHiRblkgiUB/Lj23/YutWYoCw2XdRp8/LXBoxzJOq2Tg
         XDYA8ug3we0O0tdAVNHQ3/IgW1xk7jI/+rI8R72439QHj8UcnoD+A4ipyJtxUNrZW9E+
         oeiwnR3/zVL6/k3T8qsWqnOlRx4NBFk2De21nOSs0V1NSMaTAIMMtJJpHiZL4DsxGkTD
         Oe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsHeaFYBh4k3uU1PKIGzNMvHFQjvEUxW3RQBUPi0odc=;
        b=ETGc3vDQW5rKqu6LtXA35UgXjAgZ281RSt2j3am1aPs/dVkEmdHcqZcaujp9xGip46
         DI4HS+OtlwtsOMwJDGZJsmHQ/rTU/MFbIbSLLoYBHxokIg8GYfRaCyyF+zHSUKEq0J6J
         EhCAnxijtVxDBFJNIKAMCvRfoyq/9BcA0crDK+8KHIltPt4EL8zV5ERveGSSgLj4hwER
         TmTmC1Nv97UN7lKQcmvG3qlkrC1mmrmGzOTQY15sN1g48XJfpzhaoToE4zedIOrPQERz
         UiWW3sJgcWw6cLrkP/UOSnB5c1A2ckIyOnfMi8VVf5gqWwVZTu7neMNlF0Rxtc5/ec93
         jZSQ==
X-Gm-Message-State: AOAM533JpNlNDQ3Jp53cesiuoCtNznk2zNVe6RTJwO4b+X/dN4zzjLpo
	z2P5FnPKk4SiA7QZf6OO+kAo1qBP6vc4HQ==
X-Google-Smtp-Source: ABdhPJzD41T07Noz4rTGLdLcGgWAnVjFriQF0qlCYI9PqM/9X4I7XQPPlXNi18n4hTw+6/K2vxUQRQ==
X-Received: by 2002:a65:6a50:: with SMTP id o16mr15205179pgu.6.1619986348758;
        Sun, 02 May 2021 13:12:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id y15sm8500530pgq.63.2021.05.02.13.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:12:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage: hangs if missing debug-tweaks
Date: Sun,  2 May 2021 20:12:27 +0000
Message-Id: <20210502201227.3587958-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only clue is this:

WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into serial console as root using blank password
WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
root
Login incorrect
qemux86 login:
Login timed out after 60 seconds

Poky (Yocto Project Reference Distro) 3.3+snapshot-65e75bd5d40c10509a3416026e551b7b7111c42a qemux86 /dev/ttyS1

qemux86 login: <<< run_serial(): command timed out after 120 seconds without output >>>

Hangs here....

We should issue a error and quit.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/testimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 43de9d4d767..18ebbf90ec5 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -142,6 +142,10 @@ do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
 def testimage_sanity(d):
+    if (bb.utils.contains("IMAGE_FEATURES", [ 'debug-tweaks'], False, True, d)):
+        bb.fatal('testimage requires a blank root password'
+                'Please check if debug-tweaks is IMAGE_FEATURES.')
+
     if (d.getVar('TEST_TARGET') == 'simpleremote'
         and (not d.getVar('TEST_TARGET_IP')
              or not d.getVar('TEST_SERVER_IP'))):
-- 
2.25.1

