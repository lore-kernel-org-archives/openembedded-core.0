Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2C001609BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 11:23:42 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id p9so1092032lbv.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6jNCkxbubzdKXnS7azWmVNM0eaxOana1BCk5kXib5Kg=;
	b=JmgyIF3BM2Qal7IkPVBQn+qJ7HQNpsahfJZQPqtxl35xlec5p/HJmcda/ok5/BLk0d
	dxxrlpIT9SSgyRqzvGKsbJCM36zWO/FvOO6fTQIKlltKWZHPqd1PW+Fdk8MhoZ3msi7i
	5MJ4VoEICyU4RQYS22CGEz/0Rsf+XBFUj9UOJNkfPlZliwBH0vDuOKlOKsfDF+2TMWXJ
	wAGYKhlRHHbaD4U7ydAhH1CH08CZ3b9aXfMbaZWYWMzXUbIxQo3ZrOuK40tvRtD05zyT
	b2MM4j7ZWy63LzmL/LK1l8OaSNxZneluygZBTMvlCKb12+MvzF3AUzTbQoom46V2ymFf
	cf2Q==
X-Received: by 10.112.164.148 with SMTP id yq20mr40191905lbb.22.1399461822377; 
	Wed, 07 May 2014 04:23:42 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id vr5sm1490773lbb.21.2014.05.07.04.23.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 May 2014 04:23:39 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org
Date: Wed,  7 May 2014 13:23:35 +0200
Message-Id: <1399461815-6753-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.0.0.rc0
Subject: [PATCH] package_manager: Fix NoneType Object on do_populate_sdk
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
X-List-Received-Date: Wed, 07 May 2014 11:23:47 -0000

PACKAGE_EXCLUDE can be not defined or empty, leading to a build error.

File: '/var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/meta/lib/oe/package_manager.py', lineno: 1649, function: _create_configs
     1645:                    "Pin-Priority: %d\n\n" % (arch, priority))
     1646:
     1647:                priority += 5
     1648:
 *** 1649:            for pkg in self.d.getVar('PACKAGE_EXCLUDE', True).split():
     1650:                prefs_file.write(
     1651:                    "Package: %s\n"
     1652:                    "Pin: release *\n"
     1653:                    "Pin-Priority: -1\n\n" % pkg)
Exception: AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/bobcat_64-poky-linux/meta-toolchain/1.0-r7/temp/log.do_populate_sdk.21363
NOTE: recipe meta-toolchain-1.0-r7: task do_populate_sdk: Failed
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/lib/oe/package_manager.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a8360fe..b33ee60 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1637,7 +1637,8 @@ class DpkgPM(PackageManager):
 
                 priority += 5
 
-            for pkg in self.d.getVar('PACKAGE_EXCLUDE', True).split():
+            pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE', True) or ""
+            for pkg in pkg_exclude:
                 prefs_file.write(
                     "Package: %s\n"
                     "Pin: release *\n"
-- 
2.0.0.rc0


