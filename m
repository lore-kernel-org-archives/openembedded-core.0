Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 508E578ABC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5BGBquL012701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jun 2018 09:11:53 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 11 Jun 2018 09:11:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jun 2018 12:11:23 -0400
Message-ID: <1528733483-19785-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1528733483-19785-1-git-send-email-bruce.ashfield@windriver.com>
References: <1528733483-19785-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.15: crypto: aes-generic - fix aes-generic regression on powerpc
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
X-List-Received-Date: Mon, 11 Jun 2018 16:11:53 -0000
Content-Type: text/plain

Integrating the following upstream commit to fix gcc regression:

    crypto: aes-generic - fix aes-generic regression on powerpc

    commit 6e36719fbe90213fbba9f50093fa2d4d69b0e93c upstream

    My last bugfix added -Os on the command line, which unfortunately
    caused  a build regression on powerpc in some configurations.

    I've done some more analysis of the original problem and found
    slightly different workaround that avoids this regression and also
    results in better performance on gcc-7.0: -fcode-hoisting is an
    optimization step that got added in gcc-7 and that for all gcc-7 versions causes
    worse performance.

    This disables -fcode-hoisting on all compilers that understand the
    option. For gcc-7.1 and 7.2 I found the same performance as my previous
    patch (using -Os), in gcc-7.0 it was even better. On gcc-8 I could see
    no change in performance from this patch. In theory, code hoisting
    should not be able make things better for the AES cipher, so leaving it
    disabled for gcc-8 only serves to simplify the Makefile
    change.

    Reported-by: kbuild test robot <fengguang.wu@intel.com>
    Link: https://www.mail-archive.com/linux-crypto@vger.kernel.org/msg30418.html
    Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83356
    Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83651
    Fixes: 148b974deea9 ("crypto: aes-generic - build with -Os on gcc-7+")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index aa8571fecf33..7cec80e02df5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index a809b7c0ab73..05b076af6cb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.15.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 77b9110cfb88..6e708550fa4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "da407e5a3514aa6cfc579f52aca8afa279b10669"
-SRCREV_machine_qemuarm64 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_machine_qemumips ?= "8d8f48f09e07bc9ba4db489eab80ae653709fb91"
-SRCREV_machine_qemuppc ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_machine_qemux86 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_machine_qemux86-64 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
-SRCREV_machine_qemumips64 ?= "9435d73112c64ae058372322d8c7a41ae9e8c000"
-SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine_qemuarm ?= "2e7f1aeb11d0aedec2ba2ce995933221a0bfddeb"
+SRCREV_machine_qemuarm64 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine_qemumips ?= "43122d3a461b6216ca1a4a568378eea8143cf927"
+SRCREV_machine_qemuppc ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine_qemux86 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine_qemux86-64 ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
+SRCREV_machine_qemumips64 ?= "4cc6d70306ff8bd235008d18adee0bc676dc2798"
+SRCREV_machine ?= "683cfd2540fcb659774458352e8fb121ec764e0e"
 SRCREV_meta ?= "45c256a5ca6f9478bce212fec19e2bc273472631"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


