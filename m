Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89825C54798
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 10:29:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9999.1709980184032268360
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 02:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lraRaGvt;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=646E4Y/5SenJlnZcgiG1IoJMAbJQaD195gHLEPpy0SY=; b=lraRaGvt+xkoaFORP8SkXoW0h+
	1mzcpfk99BqpUgxC09TScYBB7WbeCBWPX7rQQOO3BQ6bkL/21hNMF/qVAsMkIX7OTCxgfaa1vmNd5
	OUwyMvn0Wya616nWUH43Pf/uZkyQLcM1xJiZFaA16+r01aYWIU95CcjKJeQLx4/k7qrKlPVUrgFlU
	tvs5QIhhMa2zZkHC6ok38DkDCVZd9D7+PiM8kCyUPoUvStCVsdx4/G+oTTivf4JwyQKaLmqOjRlof
	vKD7WDY5Bks4OlmtcgTbgbkCJgzXdqo+nmlT46WcYK6d9PyXd3218EHGo/R2wWfKmqPeWXCMvEDWV
	b8DutEFg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:47384 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ritxP-00A4FQ-0Q
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2024 05:29:41 -0500
Date: Sat, 9 Mar 2024 05:29:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ptest: test for PTEST_ENABLED instead of DISTRO_FEATURES
Message-ID: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 10:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196868


As ptest.bbclass defines the more intuitive ptest-related variable:

  PTEST_ENABLED =
    "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"

modify a number of obvious recipe ptest checks to use that simpler
form.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i did a simple textual substitution so as long as that's all that's
needed, this should work.

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index e963001d09..bb01fa7466 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1371,7 +1371,7 @@ python do_qa_patch() {
         return False

     srcdir = d.getVar('S')
-    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if not bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.6.bb
index eabfc89575..6420b2231b 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.lua.org/"

 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "

 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index e07355d3f5..98d7b1c2a2 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -51,7 +51,7 @@ python populate_packages:prepend() {
     # Put all *.t files from the lib dir in the ptest package
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
-    if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if bb.utils.contains('PTEST_ENABLED', '1', True, False, d):
         do_split_packages(d, d.expand('${libdir}/perl/${PV}'), r'.*\.t()',
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 93fa645f33..4e6ca5e074 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"

 DEPENDS += "python3-cffi-native"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' -fuse-ld=bfd', '', d)}"

 SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 74ac7ec9d5..c0f3784261 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"

 DEPENDS = " \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'boost', '', d)} \
         "

 SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index bd3e5a9406..dce9339643 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -60,7 +60,7 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"

 KERNEL_VERSION_SANITY_SKIP = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e80594b45e..acf90b8f99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -44,5 +44,5 @@ KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0f62dea29a..c7e411b5fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -62,8 +62,8 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("PTEST_ENABLED", "1", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"




-- 

rday

