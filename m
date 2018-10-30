Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 37A3079CB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:53:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r63-v6so12513672wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=d6KX8wDv3V4L5afKvoxLC5ZVTGvQ2ZZR3cM1+jEwITE=;
	b=TY6LMIK3cW3dnV9c/KQMybXBqk3IYQyT8ySAJ/UopQI7YLreKpeGwDCC3U45PK3DfL
	cjLT/y/UazKVlig2QGLm3qBMaVleOgtdgoIK8s4P8F3tKRDUtsql0LP/vGOnLA6fKQ3D
	FvfEEPtQQHUJTt5SOEiiTA4AdQBBJF1IZlUYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d6KX8wDv3V4L5afKvoxLC5ZVTGvQ2ZZR3cM1+jEwITE=;
	b=rOX1gFvmw/mmSuVtgYJnyA12w11vs8OJUXTMi6P0nwDZe5sB8OHQmUWG57aS7WhIZH
	OXPh2NBccdRINkk84VP53Iphp4GiXQ1K29jAA78BMmJs83SJ1bnnNx+/IqwPakDeelxr
	aRKaRhDGLKU9jtu2Hpu7sDrD1VcSJrtQkCPwoJA62BbiMfrzzsgeU8yrGFq8AMoaxQR7
	7pahvNSd3n2nhwxSzIMM37IHITnnloJMvOJDxQtCbYsTS0VKP39MkIpw0MfXOmJmJkIC
	75RhaUBMSHZ5FMWHKFAebmclNWUEAxMU+z90ySWepfe7LEB/JEtFa75um+pygltt8exS
	ZrLQ==
X-Gm-Message-State: AGRZ1gJZ7HRinpqdLDHD4WrphX6ZTtWFfiIujzwkE+KbY+6PWqFA0D8m
	e02KkFu4sBnvH9SFT7c9gURuJ+gsyIs=
X-Google-Smtp-Source: AJdET5dlj6uVXEGePXm+q4oHDIVrwOiw6DDZvTYkohk3CE2F95sqndByaT0tR9ATvOyrH+dERajKxg==
X-Received: by 2002:a7b:c0cc:: with SMTP id
	s12-v6mr2564205wmh.39.1540918427329; 
	Tue, 30 Oct 2018 09:53:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a193-v6sm11973480wma.19.2018.10.30.09.53.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 09:53:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 16:53:43 +0000
Message-Id: <20181030165343.27354-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oe-init-buildenv/base: Relax python version checks in favour of HOSTTOOLS manipulation
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
X-List-Received-Date: Tue, 30 Oct 2018 16:53:47 -0000

Several distros are now shipping "python" as python v3 contra to the original
python guidelines. This causes users confusion/pain in trying to use our tools.

We can just force "python" to "python2" within HOSTTOOLS to avoid this issue
and hide the complexity from the user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass    |  6 ++++++
 meta/conf/bitbake.conf       |  3 ++-
 scripts/oe-buildenv-internal | 11 +----------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index df11c8b270e..57b69492ce3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -128,6 +128,12 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
                 os.symlink(srctool, desttool)
             else:
                 notfound.append(tool)
+    # Force "python" -> "python2"
+    desttool = os.path.join(dest, "python")
+    if not os.path.exists(desttool):
+        srctool = "python2"
+        os.symlink(srctool, desttool)
+
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93aee1ae462..dcf20078831 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -476,12 +476,13 @@ export PATH
 HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
+# python is special cased to point at python2
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
+    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 67738723261..52ce32987c0 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -40,16 +40,7 @@ if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
     return 1
 fi
 
-# Make sure we're not using python v3.x as 'python', we don't support it.
-py_v2_check=$(/usr/bin/env python --version 2>&1 | grep "Python 3")
-if [ -n "$py_v2_check" ]; then
-    echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
-    echo >&2 "Please set up python v2 as your default 'python' interpreter."
-    return 1
-fi
-unset py_v2_check
-
-py_v27_check=$(python -c 'import sys; print sys.version_info >= (2,7,3)')
+py_v27_check=$(python2 -c 'import sys; print sys.version_info >= (2,7,3)')
 if [ "$py_v27_check" != "True" ]; then
     echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
     echo >&2 "Please upgrade your python v2."
-- 
2.17.1


