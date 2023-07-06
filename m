Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AAEC001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.26469.1688656033771762189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4exvidLC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b7e6512973so5105545ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656033; x=1691248033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17UF527Ezwx0RQqDAZ2dnucMkqNz+vlyEqQO4SBu33Y=;
        b=4exvidLClOyIF3004A3ExBzoiOB3kVe4GWAlK6gjWvSSCZpnj2W6+b25gmubRnxOJw
         Dl/B234xP39yNitXWlQ/F41nfOMYdEL1/VXn0UcSJq1PtmJfC/FNPN3zCYLbPiOIjChy
         hCdBcpVuzycQGoI7jKLuN8EnBjaBJv/fB2Bx7mU3mdG8ycSK9gnW4mPgj6Zq3ThYcPGG
         9x+5Q3aM+MhCjsTmVhySB/Wu11fxfBkMqmweZjGAdFzLQKOMV+FquV5jKrFFSUzDdtkG
         bbfFUtbF6Vc1AeIcWxSUFgy0mtP+M50pFr0vZ8++qHCtqzILsC6M+shgd08H2nd6Svfs
         Mk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656033; x=1691248033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17UF527Ezwx0RQqDAZ2dnucMkqNz+vlyEqQO4SBu33Y=;
        b=Cew/pna0x8xkMKChHIdSbweQIhRqEpjPybnkhClUtqWVYKxJ6G86o+bFPqIKRxFsEh
         rlbjMbHzbYNUD+Ln6awFDs1ugwNvO6Ucwsm103Xd+LuY7HkEqMElShgGeDQTKhbtTIuN
         XEDPtLsxceUkNQXoA0urXGQo/lAm15w5GR+Kx6qLX9h36QQ8Q52LWTbghPqJzH5gH9ql
         rmSfz+RpeXHqiP4Xity9nY+HBaE29qQRbH4DgouCgWIpzHR1SaXCgOkp5XgRvbQUbOxk
         F47RxBJTgybR+Pro5MBfizIQUxz0HxIKkBatjoHclBZPUVuR9BCrivEY9gAxqfI61D9l
         wFVA==
X-Gm-Message-State: ABy/qLY30GDa6MDY6JOHoQJIqsM2fsjHJXlz9qEuo7dH8XKdgFVE/gyE
	BqV/HXrHHBE50xnhS7/G6urbX0M9SEGZ4VXN7Vs=
X-Google-Smtp-Source: APBJJlEN3a9BGhDjXYX3a1rrew3pUUDLm5q/VHy0o/oQv8GpDhtWsKt08Ohzj0s2PfdAjg8opOs4DQ==
X-Received: by 2002:a17:903:41d2:b0:1b5:6312:4c5b with SMTP id u18-20020a17090341d200b001b563124c5bmr2214069ple.63.1688656032841;
        Thu, 06 Jul 2023 08:07:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/28] scripts/runqemu: split lock dir creation into a reusable function
Date: Thu,  6 Jul 2023 05:06:19 -1000
Message-Id: <2ada5f426e71e3873ba8c47dd925d8cfc103524b.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183969

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 004d6bcb067ecf1d796801fa43a98820c4efd3c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5a98abfffe..f275cf7813 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1062,6 +1062,17 @@ class BaseConfig(object):
         self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
             self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
 
+    def make_lock_dir(self, lockdir):
+        if not os.path.exists(lockdir):
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
+            except FileExistsError:
+                pass
+        return
+
     def setup_slirp(self):
         """Setup user networking"""
 
@@ -1080,14 +1091,7 @@ class BaseConfig(object):
         mac = 2
 
         lockdir = "/tmp/qemu-port-locks"
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         # Find a free port to avoid conflicts
         for p in ports[:]:
@@ -1127,14 +1131,7 @@ class BaseConfig(object):
             logger.error("ip: %s" % ip)
             raise OEPathError("runqemu-ifup, runqemu-ifdown or ip not found")
 
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         cmd = (ip, 'link')
         logger.debug('Running %s...' % str(cmd))
-- 
2.34.1


