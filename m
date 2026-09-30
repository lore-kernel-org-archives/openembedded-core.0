Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088B3CA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:50:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12643.1790772643307283189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X6o1rSUV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0766E4E410CB
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B9F60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:50:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2AF5103283D1;
	Wed, 30 Sep 2026 14:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790772640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5H+k7dZ7bmKZ/HkIZ7IROFGDZmiMnl73GOSAImh3uhU=;
	b=X6o1rSUV3PCjtqfYQ3d9BrNcP06aRsROEA+dhD1zgXZgDPKs0wfLKSM/JcrwZs5ytrTUWI
	FDgpcXveHFVIT5xHJtkash3xnkUUMcD/eYOadM3E4WFxJuOriyexm3M1Nrb+PhSU9COXjX
	TO0yuHBokhJHVjre/8k9Hevts9TzWUDoPTesipz7pPrsnNhjYPKybQNC+jPhQBrhZXpiyZ
	+LGKkG0q+XWt2540vzUL0IxDNROohH6hpmq16C+kllEWoq8ilOi4FijruAytbrZuDN6+PY
	kVSrIVEMgoXs2QXW96ha1NQ92mNIk8A+P68+3841Yqfi9LJfwp7dkWjl9N3Bmw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 14:50:22 +0200
Subject: [PATCH] tcl: upgrade 9.0.4 -> 9.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-tcl-9-1-v1-1-1182d4d2bec1@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAI0FvWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3dzEkozM1FLdkuQcXUtdQ90UUxMTU8PkZENDYzMloK6CotS0zAq
 widGxtbUA3CeV22EAAAA=
X-Change-ID: 20260930-mathieu-tcl-9-1-d54451cc1136
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790772639; l=6043;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=E/oXI4yYp3C19QNHqvgZ1wf+PbdgFRsl+3XHzv3yLGg=;
 b=mrfFf3YJaDlnLaZeQrAICYN0NidRnSuja717zxQGUh/tHCUZlgo7+3j6ESWAam4AHMaSZD81U
 epxbzk92rJNB4BbUJCznWhnwiYPyQGiateFkSJfDuQbc6PlBZYZQ0fe
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246968

Changelog:

- Incompatibilities
  - Remove `expr` behavior from `lseq`
  - File paths are now treated as case-insensitive on MacOS
  - New command `tcl::registry` as replacement for the `registry`
    command without needing the registry package to be loaded. The
    registry module is now part of the core Tcl DLL in all build
    configurations.
  - Custom applications must call Tcl\_FindExecutable or
    TclZipfs_AppHook to initialize Tcl
  - Search path for locating Tcl core script and encodings is changed

- New commands and options
  - New options `-backslashes`, `-commands` and `-variables` for `subst`
    command
  - New command `unicode` for Unicode normalization
  - New `timer` command, switch to monotonic clock and microsecond
    resolution
  - New `lfilter` command for selecting items from a list
  - Many new functions from C99, specifically: `acosh()`, `asinh()`,
    `atanh()`, `cbrt()`, `copysign()`, `dim()`,  `erf()`, `erfc()`,
    `exp2()`, `expm1()`, `fma()`, `gamma()`, `ldexp()`, `lgamma()`,
    `log1p()`, `log2()`, `logb()`, `nextafter()`, `remainder()`,
    `signbit()`, and `trunc()`, and (for functions that return multiple
    values in their C99 API) the commands: `divmod`, `frexp`, `modf`,
    and `remquo`.
  - New `switch` option `-integer` to compare values as integers
  - Reading and writing of child interpreter variables
  - Updated Tcl Bytecode opcodes
  - Add support for `\z` in regex as end-of-string anchor
  - New `tcltest::configure` option `-iterations` to control number of
    iterations of each test.

- New public C API
  - `Tcl_IsEmpty()` &mdash; checks if the string representation of a
    value would be the empty string
  - `Tcl_GetEncodingNameForUser()` &mdash; returns name of encoding from
    user settings
  - `Tcl_AttemptCreateHashEntry()` &mdash; version of
    `Tcl_CreateHashEntry()` that returns NULL instead of panic'ing on
    memory allocation errors
  - `Tcl_ListObjRange()`, `Tcl_ListObjRepeat()`, `Tcl_ListObjReverse()`
    &mdash; C API for new list operations
  - `Tcl_UtfToNormalized()`, `Tcl_UtfToNormalizedDString()` &mdash; C
    API for Unicode normalization
  - `Tcl_UtfToExternalEx()` and `Tcl_ExternalToUtfEx()` &mdash; C
    encoding API supporting output buffers larger than INT_MAX
  - New API for monotonic clock and microseconds resolution
  - Windows `auto_execok` enhancements and `exec` search reform
  - New timer API using long long in stead of Tcl_Time
  - `Tcl_RegisterPostInitProc` callback for post-initialization of
    interpreters

- Performance
  - Memory efficient internal representations for list operations on
    large lists.
  - Continued 64-bit capacity: Command line arguments larger than 2Gb
  - Support for long paths on Windows
  - Faster UTF-8 encoding and I/O
  - Faster interpreter creation

- Bug fixes
  - Inconsistent `glob` matching on MacOS
  - `file normalize` does not uniquely identify a file on MacOS
  - Inconsistencies between `cd` and `file normalize` for
    volume-relative paths on Windows
  - Tcl cannot run from an arbitrary build directory with
    --disable-zipfs
  - Crash on finalization with an active thread running.
  - Crash on use-after-free in Windows socket thread.

- Updated bundled packages, libraries, standards, data
  - Unicode 18.0.0
  - platorm 1.2.0: Add support for musl C runtime

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/tcltk/{tcl_9.0.4.bb => tcl_9.1.0.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/tcltk/tcl_9.0.4.bb
rename to meta/recipes-devtools/tcltk/tcl_9.1.0.bb
index 97ba82d5fa1c..6e8a97c729e3 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch \
            file://0004-tcl-update-the-header-location.patch \
            "
-SRC_URI[sha256sum] = "5d265f3499b588681825d8093177830707b7035ad866b17189a3a6ab6dade0ff"
+SRC_URI[sha256sum] = "ba11ae7035ec4b0caf2c489b20d5aa2abb1cf001a7e65b0fa2fbac86908c643b"
 
 UPSTREAM_CHECK_URI = "https://www.tcl-lang.org/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
@@ -37,6 +37,9 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
 
 EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9 --disable-zipfs"
 
+# Override some paths to not include TMPDIR into binaries
+EXTRA_OEMAKE = "ABS_BUILD_DIR=/build TCL_BUILDTIME_LIBRARY=/build/lib"
+
 PACKAGECONFIG ??= ""
 # Use of system tzdata is not recommended at present:
 # https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b094ffa1a
@@ -46,7 +49,7 @@ do_install() {
 	autotools_do_install
 	oe_runmake 'DESTDIR=${D}' install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
-	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
+	ln -sf tclsh9.1 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
@@ -61,8 +64,8 @@ do_install() {
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
 PACKAGES =+ "tcl-lib"
-FILES:tcl-lib = "${libdir}/libtcl9.0.so.*"
-FILES:${PN} += "${libdir}/tcl${VER} ${libdir}/tcl9.0 ${libdir}/tcl9"
+FILES:tcl-lib = "${libdir}/libtcl9.1.so.*"
+FILES:${PN} += "${libdir}/tcl${VER} ${libdir}/tcl9.1 ${libdir}/tcl9"
 FILES:${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
 # isn't getting picked up by shlibs code

---
base-commit: 3182386f3a8e9d51ffabfdb3e7df63e989ac7c4a
change-id: 20260930-mathieu-tcl-9-1-d54451cc1136

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


