Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9F45E7FA8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:04:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471LjQ2k59z3P
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572188666;
	bh=Ll2ED1FhVgpI8Nh3q5WAVAkyCBKjTkUxoyHDBcVP7NE=;
	h=From:To:Subject:Date:From;
	b=Urx9SNSTqMRD62aMIrPb5dpe7RFtgdzQ6sO+PPg+uENAhfmIGiJIixEIiflHzKAOC
	i1JJVYBz0oHrc/HdjRPACr/+GT3Tm/yQLIayQy1xybYkct9RM5kxxDKYLnAoEN45cg
	SYFMyZ7Mh2J8+g0UzHOEaWD23n4DyYan8FXRrjLsUH3HuKZggTxpO+YbnYymQ51jFO
	mEndkTitN1MDMM9TfCgGwUoRqGLhfEVTBGDdvLcMg79UlgaVSmqseS1UqAf9Ep24Cv
	EmOUzIiJrfPiMWQD7VyMyUbDBfXWM4hr5nCc1uLYDB/hPvOUZHIDcmiNnCWJxanuo9
	B5ANiO3yN3z2gWrIiH7MENjhHUd8cVat0U97a2Hh0Sqs/xW61Bx8y10rx4uoVgPk99
	tJB5t+5oMXDOlDffBZlO4yNFjkVAcAMTtR+maCst5/Xp3xetbCLkhJkczf36sM5IJU
	xp8GXq0F+VzSD2VdXCxbp9Mq+BUXXwLGaFbrv7mzrpLO+QOdF61WcPVxSdTGvGg0w8
	5J4bPgXRgib47DmTKCRTF+H9Z41i0oVREvN/YdhgNSWfWTEFUmtZmgzyJVts0nfrOn
	2dhwEU5kLNOr48u5HGjKQrX4LroJnCPYyojaJqKCtYb1QfCk5Z4rLatjPNlrBnkk7h
	bJ1Zx4wyEMAvl8yoRmOcCux8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 17:04:25 +0200
Message-Id: <20191027150425.13079-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Sun, 27 Oct 2019 15:04:25 -0000

This LD_PRELOAD trick is not really suitable for busybox,
so can be the only part of coreutils needed.

coreutils depends on the new package,
so nothing changes when installing coreutils.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v3: coreutils-native fixed
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 4a74f619af..8b74ff1916 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -49,7 +49,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
                 pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
-                sha384sum sha512sum shred shuf sort split stdbuf sum tac tail tee test timeout \
+                sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
@@ -58,6 +58,10 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill l
 
 sbindir_progs= "chroot"
 
+PACKAGE_BEFORE_PN_class-target += "coreutils-stdbuf"
+FILES_coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
+RDEPENDS_coreutils += "coreutils-stdbuf"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.17.1


