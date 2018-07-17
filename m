Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5112E78882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 04:56:19 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id 94-v6so4354747ple.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fDo9TOxPyf9/N2t+TR5ZEWOKKetZyaGSkkfBCYpOp7g=;
	b=Ksl89WdYvBrgM7H1nNso72VGYnwKssxKxrHbj7wT2pdsm555Sz3kiDj/9cQkJHFUDr
	yejXXJ3Q14TUwNi4aCPTGEwJtxGFR2xK3m+MkUTi93f47zmkFKjrYjujsrkMbsk7vm3t
	OlfQC6coV6mtwGM4BnJesZWOXRq6gZnbzVFRvNHKID4VXSiF4mL0G0wgYF9JeWKOVDeP
	pHm2x5Pjcl3Fh6hXVR1xFwks+doLXFJlo0oW3fcSJXE+2zd7gJdSlT9WrBnoJWAb3gbu
	PoIXoVhGSSRjtWkfEqg4SeZaHyi8PMTGLTNp/USQXvrHB1H4vIuAuYjGJASaAASMJN0b
	Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fDo9TOxPyf9/N2t+TR5ZEWOKKetZyaGSkkfBCYpOp7g=;
	b=SUmemz6qwm9Ut8G5GOT0Q9qC+M5Gzf9PWBDePjGTOUqYEPUtj8zasW7HZQXwQ5zXMe
	i+OCUX8/td0DsF096XNzO9/dLn1c0JOYFHMXaOcUWMXpVC7PzRCRQe5EMXAP52lweT3y
	FQccRP/cE18atAMTA9LruWr67mYDli+Q8MtIZRyzJRknvG/8PvhQQef9RrY4ZfolUk5w
	5g0H92Ktoa5S5qeiF91m0VC2e20hEnDGeB09nuz8iFsFjMudsWMe746DxJQAgM9xlwyD
	8Q7z51zdBioJkz35c+eaqZ5KD6WnVgT8AVmzs/wJVgkfTfq3Zsq4TbMmxEb6WMS8eN8G
	FKnQ==
X-Gm-Message-State: AOUpUlHIa0ePQmokxiI2g2xH2/J/KrgEiRFoamin7OJRiOQtaISo/QnU
	/507boXCSFH5WikBPtq429Jk6g==
X-Google-Smtp-Source: AAOMgpd3eOhDr321OFEUP6BZu0a+90vw7iDQ/TIFw3NFEEXwO6pznUL4P0RJJtzSf0DnVTTOuMVdNA==
X-Received: by 2002:a17:902:2006:: with SMTP id
	n6-v6mr71672pla.325.1531803379999; 
	Mon, 16 Jul 2018 21:56:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	y12-v6sm12556pfe.139.2018.07.16.21.56.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 21:56:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 21:56:11 -0700
Message-Id: <20180717045611.9006-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] recipes: Enforce ARM ISA just for arm arches <= armv5
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
X-List-Received-Date: Tue, 17 Jul 2018 04:56:19 -0000

armv7+ used thumb2 ISA and it compiles fine with thumb2
issues are only when using thumb1 ISA

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb        | 5 ++++-
 meta/classes/goarch.bbclass                                | 6 +++++-
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 4 +++-
 meta/recipes-gnome/gcr/gcr_3.28.0.bb                       | 4 +++-
 meta/recipes-gnome/libsecret/libsecret_0.18.6.bb           | 4 +++-
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb               | 4 +++-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb             | 5 ++++-
 7 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 073cf5665c..922518bc39 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -28,5 +28,8 @@ FILES_${PN} = "${bindir}/aspell"
 FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_libpspell-dev = "${libdir}/libpspell* ${bindir}/pspell-config ${includedir}/pspell"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
+
 inherit autotools gettext
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index bb36cc8142..b2c94faddb 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -33,7 +33,11 @@ COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
-ARM_INSTRUCTION_SET = "arm"
+
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
+
 TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_CFLAGS_mipsarch = "${SECURITY_NOPIE_CFLAGS}"
 SECURITY_NOPIE_CFLAGS ??= ""
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index a8baca51e3..4bee3713a7 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -36,6 +36,8 @@ do_install () {
 	install -m 0755 unsquashfs ${D}${sbindir}/
 }
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-gnome/gcr/gcr_3.28.0.bb b/meta/recipes-gnome/gcr/gcr_3.28.0.bb
index 6777ad2277..0796362e4b 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.0.bb
@@ -21,7 +21,9 @@ FILES_${PN} += " \
 "
 
 # http://errors.yoctoproject.org/Errors/Details/20229/
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # These files may be out of date or missing our fixes
 # libgcrypt.m4 in particular is calling into libgcrypt-config
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
index cdc41e762a..518c71feb1 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
@@ -12,7 +12,9 @@ SRC_URI[archive.md5sum] = "c6cf132a56bd346fbf49a43abb02e5c2"
 SRC_URI[archive.sha256sum] = "5efbc890ba41a323ffe0599cd260fd12bd8eb62a04aa1bd1b2762575d253d66f"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # vapigen.m4 bundled with the tarball does not yet have our cross-compilation fixes
 do_configure_prepend() {
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb
index feafce2580..e105ea2c00 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb
@@ -30,7 +30,9 @@ SRC_URI[md5sum] = "1cc9e8cb027b9fd4c54f598f51002c19"
 SRC_URI[sha256sum] = "ed945daf40b124e77a685893cc025d086f638bc703183460aff49508edb3a43f"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # Should be API compatible with libav (which was a fork of ffmpeg)
 # libpostproc was previously packaged from a separate recipe
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 19a7155d66..161bb5ce20 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -25,7 +25,10 @@ FILES_${PN} = "${bindir}/aspell"
 FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_${PN}-dev += "${bindir}/pspell-config"
 
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
+
 inherit autotools-brokensep gettext texinfo binconfig-disabled
 
 BINCONFIG = "${bindir}/pspell-config"
-- 
2.18.0


