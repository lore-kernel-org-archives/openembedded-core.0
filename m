Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F65AC001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 13:35:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.42895.1691760945716426966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 06:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BPfkKpfj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbea147034so17514725e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691760943; x=1692365743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GOoiFqwGYdoc2LgxMJvpMGuzeigNUBPNpVc1sSKyx4=;
        b=BPfkKpfjEjIbkWUoa+qKo5roCNEkEqBpo5EA3weEe9YfDXS/OMw15j/Dn0kUmWDMOb
         ccB3dy8BGj2KVzjhVVPB2cZ00uXvU8I1UQs5B7PktO+6HFuP/2QuXNigWPdOe/95iBXe
         tXreHnQOOjHAohakSL3+ap/etpp5mQSKdFfhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691760943; x=1692365743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GOoiFqwGYdoc2LgxMJvpMGuzeigNUBPNpVc1sSKyx4=;
        b=jEluPYK4uFr4ROBaXqDZ1xB4Vq5j9sKhHSpLOmbc7sK92UWTp1WKjGdTQDLT1wJYHn
         jj3D/U2GabrANh1RY9OsHj1WWULcfXSYbzwgLGqX+mW8qEGuCQOyywrKAEinny2rbnZ6
         xl2SxSNf3oNv1QtmBhznuk5b2pA6hPDtqcJi3+KxRWnQU2z1SdGpCzndY0qFlHRUyyPd
         FFPDpQvtwtkZsFxCiJSqW6lt8MaB1is778w+EE70BiqDqksNsYRwbhBMjzVl22aJec7o
         WyOBY3LM7RR9IKXsbGQrhvO7fG0e2Bz9fim11r8u0EOl8oe/9630uKlc44xP1G8IVpFB
         e8VA==
X-Gm-Message-State: AOJu0YzpWDtEdxtY0o/GoWufrMcBtXrdtg23Ujif58Cve1CJdg6mAKah
	3BrrBS7oBuhE0f8OVoNHe3OBoDU6dZm/ISoJgVs=
X-Google-Smtp-Source: AGHT+IFwLH+VcBwdHx7N8HGTqYPFNh62IL0Py3R3+FH4RefnsVseThHKYzqtqTbHSZ2o94bEfjW61w==
X-Received: by 2002:a05:600c:c8:b0:3fb:a102:6d7a with SMTP id u8-20020a05600c00c800b003fba1026d7amr1623924wmm.28.1691760942874;
        Fri, 11 Aug 2023 06:35:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b003fc00892c13sm5363144wmj.35.2023.08.11.06.35.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 06:35:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes/classes/scripts: Drop SRCPV usage in OE-Core
Date: Fri, 11 Aug 2023 14:35:41 +0100
Message-Id: <20230811133541.32176-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 13:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185842

Now that SRCPV isn't needed we can simplify things in a few places...

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb       | 2 +-
 .../devtool/devtool-upgrade-test2_git.bb.upgraded           | 2 +-
 .../recipes-test/gitunpackoffline/gitunpackoffline.bb       | 2 +-
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb    | 2 +-
 meta/classes-global/sstate.bbclass                          | 4 ----
 meta/classes-recipe/devupstream.bbclass                     | 2 +-
 meta/classes/externalsrc.bbclass                            | 2 --
 meta/conf/bitbake.conf                                      | 2 +-
 meta/conf/documentation.conf                                | 1 -
 meta/lib/oe/recipeutils.py                                  | 4 +---
 meta/lib/oeqa/selftest/cases/devtool.py                     | 6 +++---
 meta/lib/oeqa/selftest/cases/recipetool.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py                 | 1 -
 meta/recipes-bsp/efivar/efivar_38.bb                        | 2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                | 2 +-
 meta/recipes-core/musl/gcompat_git.bb                       | 2 +-
 meta/recipes-core/musl/libc-test_git.bb                     | 2 +-
 meta/recipes-core/musl/musl-locales_git.bb                  | 2 +-
 meta/recipes-core/musl/musl_git.bb                          | 2 +-
 meta/recipes-core/newlib/newlib.inc                         | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                    | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb          | 2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb                  | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb            | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                  | 2 +-
 meta/recipes-devtools/python/python3-dtc_1.6.1.bb           | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb            | 2 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb                 | 2 +-
 .../baremetal-example/baremetal-helloworld_git.bb           | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb          | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                  | 2 +-
 .../xcursor-transparent-theme_git.bb                        | 2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb              | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb   | 2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb                | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb     | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb                | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb             | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb             | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb           | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb           | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb                | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb                | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                    | 2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb                    | 2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb          | 2 +-
 .../recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb | 2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb                    | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_git.bb           | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb     | 2 +-
 scripts/lib/recipetool/create.py                            | 2 +-
 scripts/lib/scriptutils.py                                  | 2 +-
 52 files changed, 50 insertions(+), 60 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 203f4b61c2e..2558a22ce57 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "dbus"
 
 # Note: this is intentionally not the latest version in the original .bb
 SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 3d45fc48572..eaa8bd898da 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -8,7 +8,7 @@ DEPENDS = "dbus"
 
 # Note: this is intentionally not the latest version in the original .bb
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
index 597c89b1993..a687bcc2a7c 100644
--- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
@@ -2,4 +2,4 @@ require gitunpackoffline-fail.bb
 
 TAGVALUE = "2.11"
 
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 6062f8422c0..9437240fcff 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -64,7 +64,7 @@ LINUX_VERSION_EXTENSION:append = "-custom"
 # tag: v4.2 64291f7db5bd8150a74ad2036f1037e6a0428df2
 SRCREV_machine="64291f7db5bd8150a74ad2036f1037e6a0428df2"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 # Override COMPATIBLE_MACHINE to include your machine in a copy of this recipe
 # file. Leaving it empty here ensures an early explicit build failure.
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 95373fd60a5..c50198449c2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -769,7 +769,6 @@ def pstaging_fetch(sstatefetch, d):
     localdata.setVar('FILESPATH', dldir)
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
-    localdata.setVar('SRCPV', d.getVar('SRCPV'))
 
     # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
     # we'll want to allow network access for the current set of fetches.
@@ -795,9 +794,6 @@ def pstaging_fetch(sstatefetch, d):
         except bb.fetch2.BBFetchException:
             pass
 
-pstaging_fetch[vardepsexclude] += "SRCPV"
-
-
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
diff --git a/meta/classes-recipe/devupstream.bbclass b/meta/classes-recipe/devupstream.bbclass
index 1529cc8fca4..d941763fb75 100644
--- a/meta/classes-recipe/devupstream.bbclass
+++ b/meta/classes-recipe/devupstream.bbclass
@@ -46,7 +46,7 @@ python devupstream_virtclass_handler () {
     pv = d.getVar("PV")
     proto_marker = "+" + uri.scheme
     if proto_marker not in pv and not d.getVar("PV:class-devupstream"):
-        d.setVar("PV", pv + proto_marker + "${SRCPV}")
+        d.setVar("PV", pv + proto_marker)
 
     if variant == "native":
         pn = d.getVar("PN")
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index aedd78a03aa..e90002a4e74 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -73,8 +73,6 @@ python () {
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
 
-        # Dummy value because the default function can't be called with blank SRC_URI
-        d.setVar('SRCPV', '999')
         # sstate is never going to work for external source trees, disable it
         d.setVar('SSTATE_SKIP_CREATION', '1')
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c7ada2c49e9..cf7ff3328c4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -961,7 +961,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
-BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=no-pn METADATA_REVISION=1234 SRC_URI= SRCPV=1234"
+BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=no-pn METADATA_REVISION=1234 SRC_URI="
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 66b8e2f24fd..9a88b1fb20d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -393,7 +393,6 @@ SPECIAL_PKGSUFFIX[doc] = "A list of prefixes for PN used by the OpenEmbedded bui
 SRC_URI[doc] = "The list of source files - local or remote. This variable tells the OpenEmbedded build system what bits to pull in for the build and how to pull them in."
 SRC_URI_OVERRIDES_PACKAGE_ARCH[doc] = "By default, the OpenEmbedded build system automatically detects whether SRC_URI contains files that are machine-specific. If so, the build system automatically changes PACKAGE_ARCH. Setting this variable to '0' disables this behavior."
 SRCDATE[doc] = "The date of the source code used to build the package. This variable applies only if the source was fetched from a Source Code Manager (SCM)."
-SRCPV[doc] = "Returns the version string of the current package. This string is used to help define the value of PV."
 SRCREV[doc] = "The revision of the source code used to build the package. This variable applies to Subversion, Git, Mercurial and Bazaar only."
 SSTATE_DIR[doc] = "The directory for the shared state cache."
 SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other mirror locations for prebuilt cache data objects before building out the data. You can specify a filesystem directory or a remote URL such as HTTP or FTP."
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 5a902c23f6d..6996e426ec0 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
 from bb.utils import vercmp_string
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
@@ -421,8 +421,6 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
             # Ensure we handle class-target if we're dealing with one of the variants
             variants.append('target')
             for variant in variants:
-                if variant.startswith("devupstream"):
-                    localdata.setVar('SRCPV', 'git')
                 localdata.setVar('CLASSOVERRIDE', 'class-%s' % variant)
                 fetch_urls(localdata)
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 14a80d5ff4c..a2b77e528de 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -433,7 +433,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['LICENSE'] = 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '0.1+git${SRCPV}'
+        checkvars['PV'] = '0.1+git'
         checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
@@ -572,7 +572,7 @@ class DevtoolAddTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.0+git${SRCPV}'
+        checkvars['PV'] = '1.0+git'
         checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
@@ -591,7 +591,7 @@ class DevtoolAddTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.5+git${SRCPV}'
+        checkvars['PV'] = '1.5+git'
         checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index a5c0f7164a3..48661bee6f2 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -368,7 +368,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] = 'LGPL-2.1-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.11+git${SRCPV}'
+        checkvars['PV'] = '1.11+git'
         checkvars['SRC_URI'] = srcuri + ';branch=master'
         checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
         inherits = ['autotools', 'pkgconfig']
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 3fa3038218c..bdad9088d37 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -188,7 +188,6 @@ class SStateBase(OESelftestTestCase):
 class SStateTests(SStateBase):
     def test_autorev_sstate_works(self):
         # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
-        # when PV does not contain SRCPV
 
         tempdir = tempfile.mkdtemp(prefix='sstate_autorev')
         tempdldir = tempfile.mkdtemp(prefix='sstate_autorev_dldir')
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 411e951a5a0..d88eb3fef53 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            "
 SRCREV = "90e88b221e8bc60dc50f3246051369b8f580c0d0"
-PV .= "+39+git${SRCPV}"
+PV .= "+39+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index bc846de2169..09ba515a61e 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "dbus"
 
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 11f3c58769e..ba802e3caaa 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=cu
 SRC_URI:append:powerpc = "\
            file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
            "
-PV = "1.0.0+1.1+git${SRCPV}"
+PV = "1.0.0+1.1+git"
 SRCREV = "c6921a1aa454bb87671f9bd1ecfe47d80d1620aa"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 6d64592f0c6..d18c967e138 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-PV = "0+git${SRCPV}"
+PV = "0+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 6ffac4faded..1373c60daf4 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
 
 SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 297c5581a37..4a4fe978f93 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -8,7 +8,7 @@ SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
 
 BASEVER = "1.2.4"
 
-PV = "${BASEVER}+git${SRCPV}"
+PV = "${BASEVER}+git"
 
 # mirror is at git://github.com/kraj/musl.git
 
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 5351a9f9912..da753f11ada 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 		"
 
 BASEVER = "4.3.0"
-PV = "${BASEVER}+git${SRCPV}"
+PV = "${BASEVER}+git"
 SRC_URI = "git://sourceware.org/git/newlib-cygwin.git;protocol=https;branch=main"
 SRCREV="9e09d6ed83cce4777a5950412647ccc603040409"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 78960e1e4cc..17704a02f69 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eaca
 DEPENDS = "gdk-pixbuf-native"
 
 SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
            file://psplash-init \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 080704753d1..2a0e6f8e41f 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -10,7 +10,7 @@ DEPENDS:class-native = "hostperl-runtime-native"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRCREV = "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
-PV = "20230216+git${SRCPV}"
+PV = "20230216+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 373ada2026a..879c179dd73 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1
 SRCBRANCH ?= "master"
 SRCREV = "958227890690290ee766aaad1b92f3413f67048c"
 
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 68f624c80a3..16e6c5b6099 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
-PV = "0.29.2+git${SRCPV}"
+PV = "0.29.2+git"
 
 SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;protocol=https \
            file://pkg-config-esdk.in \
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c3c4bb0ed92..4ba752f1745 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -15,7 +15,7 @@ SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c
 
 SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
 S = "${WORKDIR}/git"
-PV = "1.9.0+git${SRCPV}"
+PV = "1.9.0+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
index a868bd0109d..95ab0be4747 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c9
 
 SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
 
-PV = "1.6.1+git${SRCPV}"
+PV = "1.6.1+git"
 S = "${WORKDIR}/git"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 7d151d4642a..4d2ca5f1b0b 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -7,7 +7,7 @@ LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
-PV = "1.8.0+git${SRCPV}"
+PV = "1.8.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 5e3fac7a60c..d5a0e69849e 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-PV .= "+0.0.29+git${SRCPV}"
+PV .= "+0.0.29+git"
 
 inherit autotools
 
diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index c5d3e04ed55..fde75ec2fd9 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
 
 SRCREV = "fc7c43d138185028b6ac14c83f6492fce26eca95"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
 UPSTREAM_VERSION_UNKNOWN="1"
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index c9c828a8c42..5f902d3a67e 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "libxtst"
 SECTION = "x11/wm"
 
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
-PV = "0.3+git${SRCPV}"
+PV = "0.3+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index cd97ee53547..62cada75906 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRCREV = "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
 # (when PV goes above 1.0 remove the trailing r)
-PV = "1.0+gitr${SRCPV}"
+PV = "1.0+gitr"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index b65a3bea562..40b77422bf6 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SECTION = "x11/base"
 
 SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
-PV = "0.1.1+git${SRCPV}"
+PV = "0.1.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 3f49df6258b..05f07c190e9 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
 DEPENDS = "virtual/libx11 libxi libxrandr"
 
-PV = "0.7.5+git${SRCPV}"
+PV = "0.7.5+git"
 PR = "r6"
 
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 21b499e6666..2e526bd7999 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -10,7 +10,7 @@ Infrastructure (DRI)."
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
-PV = "2.99.917+git${SRCPV}"
+PV = "2.99.917+git"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d0eeba32088..d4f5bac84f1 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libaio"
 
 SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
-PV = "1.3.0+git${SRCPV}"
+PV = "1.3.0+git"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 388d8feebce..5127c70f446 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "git-native"
 
 SRCREV = "2d01f24bc78256c709728eb3f204491bce13e0e5"
-PV = "0.3+git${SRCPV}"
+PV = "0.3+git"
 
 inherit native
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index e695e2d83ea..1d404bd7c6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "li
 
 LINUX_VERSION ?= "6.5"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 0645458d11c..2e35748cae8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 2f051844d8c..30aab9a23cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index dfc1e5e5d6d..5f84454fd64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 SRCREV_machine ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
 SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 64dfb3a3791..863c9ae7cef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
 SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 2f804d379d6..d50838f4939 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -47,7 +47,7 @@ SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.1.43"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index d0d96c4d108..0c0cb851b64 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -46,7 +46,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.4.9"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
+PV = "${LINUX_VERSION}+git"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 2ac2b6f1a67..e7d9e75e8de 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRCREV = "baee400fa9ced6f5481a728138fed6e867b0ff7f"
 
-PV = "r3039+git${SRCPV}"
+PV = "r3039+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 56cbe6bc8d3..55400839284 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
-PV = "0.8.18.1.11+git${SRCPV}"
+PV = "0.8.18.1.11+git"
 SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 490bd582b25..caa34966ccc 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -13,7 +13,7 @@ SRCREV = "7182e603357250952aa24d90f6d89345f93da7ce"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-PV = "0.2+git${SRCPV}"
+PV = "0.2+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index a1f236b40ff..f91c593f784 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -12,7 +12,7 @@ SECTION = "x11/utils"
 SRCREV = "99e6eb7db1b5fef110973d96194eec992a2515a2"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-PV = "0.2+git${SRCPV}"
+PV = "0.2+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 960b5d3b110..04338a603b5 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
 PE = "2"
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 89b7bf2b93c..1de95c8e524 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
 BASEVER = "3.6"
-PV = "${BASEVER}+git${SRCPV}"
+PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 60918a38927..ff336b38208 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "4148e75284e443fc8ffaef425c467aa5523528ff"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e99e0714bf4..f9dda3c2f96 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -690,7 +690,7 @@ def create_recipe(args):
             srcpvprefix = 'svnr'
         else:
             srcpvprefix = scheme
-        lines_before.append('PV = "%s+%s${SRCPV}"' % (realpv or '1.0', srcpvprefix))
+        lines_before.append('PV = "%s+%s"' % (realpv or '1.0', srcpvprefix))
         pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f433106c9a8..f23e53cba93 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -177,7 +177,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 f.write('BB_STRICT_CHECKSUM = "ignore"\n')
                 f.write('SRC_URI = "%s"\n' % srcuri)
                 f.write('SRCREV = "%s"\n' % srcrev)
-                f.write('PV = "0.0+${SRCPV}"\n')
+                f.write('PV = "0.0+"\n')
                 f.write('WORKDIR = "%s"\n' % tmpworkdir)
                 # Set S out of the way so it doesn't get created under the workdir
                 f.write('S = "%s"\n' % os.path.join(tmpdir, 'emptysrc'))
-- 
2.39.2


