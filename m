Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2C05731FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:34:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u088Yshh026827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Jan 2016 00:34:54 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Jan 2016 00:34:53 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <568F74AB.70102@windriver.com>
Date: Fri, 8 Jan 2016 16:34:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 0/9] Move Qt4 recipes to a separate meta-qt4 layer
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
X-List-Received-Date: Fri, 08 Jan 2016 08:34:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/03/2015 10:33 PM, Alexander Kanavin wrote:
> Qt4 is reaching end of life at the end of 2015, and will not be supported
> upstream. Qt4 recipes are moved out of oe-core to a separate meta-qt4 layer
> available here:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/about/
>
> This patchset removes Qt4 from oe-core. I cannot send it to the list for review
> because it contains very long lines that SMTP cannot handle.
>
> The following changes since commit 698c74c373110ed081a7586e21d4a27b8b44c89b:
>
>    libsdl: remove redundant configure_tweak patch (2015-12-01 21:32:15 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib akanavin/remove-qt4
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/remove-qt4
>
> Alexander Kanavin (9):
>    qt4: remove recipes and classes

There are a few recipes in meta-oe requires qmake2.bbclass which had been
removed by this PULL:

meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:inherit qmake2 
pythonnative python-dir distro_features_check
meta-oe/recipes-navigation/monav/monav_0.3.bb:inherit qmake2 qt4x11
meta-oe/recipes-extended/sip/sip_4.16.4.bb:inherit qmake2 python-dir 
pythonnative distro_features_check

What's the plan for these recipes, please ? Move them into meta-qt4 ?

// Robert

>    core-image.bbclass: drop qt4 references
>    core-image-sato-sdk: drop qt4 references
>    recipes.txt: drop qt4 references
>    documentation.conf: drop qt4 references
>    default-distrovars.inc: drop qt4 references
>    distro_alias.inc: drop qt4 references
>    package_regex.inc: drop qt4 references
>    packagegroup-core-lsb: treat qt4 packages same as qt3 packages
>
>   meta/classes/core-image.bbclass                    |   2 -
>   meta/classes/qmake2.bbclass                        |  27 --
>   meta/classes/qmake_base.bbclass                    | 119 -----
>   meta/classes/qt4e.bbclass                          |  21 -
>   meta/classes/qt4x11.bbclass                        |  14 -
>   meta/conf/distro/include/default-distrovars.inc    |   2 -
>   meta/conf/distro/include/distro_alias.inc          |  20 -
>   meta/conf/distro/include/package_regex.inc         |  11 -
>   meta/conf/documentation.conf                       |   1 -
>   .../packagegroups/packagegroup-core-lsb.bb         |  12 +-
>   meta/recipes-qt/images/qt4e-demo-image.bb          |  14 -
>   meta/recipes-qt/meta/meta-toolchain-qt.bb          |   5 -
>   meta/recipes-qt/meta/meta-toolchain-qt.inc         |  35 --
>   meta/recipes-qt/meta/meta-toolchain-qte.bb         |   6 -
>   .../nativesdk-packagegroup-qt-toolchain-host.bb    |   3 -
>   .../nativesdk-packagegroup-qt-toolchain-host.inc   |   6 -
>   .../nativesdk-packagegroup-qte-toolchain-host.bb   |   3 -
>   .../packagegroups/packagegroup-core-qt.bb          |  22 -
>   .../packagegroups/packagegroup-core-qt4e.bb        |  52 ---
>   .../packagegroup-qt-toolchain-target.bb            |  15 -
>   .../packagegroup-qt-toolchain-target.inc           |  39 --
>   .../packagegroup-qte-toolchain-target.bb           |   7 -
>   .../ExportWizard-depends-on-ui_wizard.patch        |  18 -
>   meta/recipes-qt/qt-apps/fotowall_0.9.bb            |  29 --
>   meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |  26 --
>   meta/recipes-qt/qt-apps/qmmp_0.8.6.bb              |  76 ----
>   meta/recipes-qt/qt-apps/quicky_0.4.bb              |  19 -
>   meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |  55 ---
>   meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  19 -
>   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |  25 --
>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        | 125 ------
>   meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb   |   6 -
>   meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  68 ---
>   ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  43 --
>   ...tty_qws-fix-build-with-old-kernel-headers.patch |  50 ---
>   ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  34 --
>   ...make-is-already-built-in-qt4-tools-native.patch |  29 --
>   ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  28 --
>   ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  38 --
>   ...-const-usage-that-causes-compile-failure-.patch |  34 --
>   ...llow-building-a-separate-qmake-for-the-ta.patch |  29 --
>   ...e-fix-source-file-references-in-qmake.pri.patch |  52 ---
>   ...ack-to-not-use-the-pg_config-of-the-host-.patch |  46 --
>   .../qt4-4.8.7/0011-freetype-host-includes.patch    |  29 --
>   .../qt4/qt4-4.8.7/0012-Add-2bpp-support.patch      | 318 -------------
>   .../0013-configure-add-crossarch-option.patch      |  51 ---
>   ...tions-fix-phony-translation-linking-error.patch |  41 --
>   ...-configure-add-nostrip-for-debug-packages.patch |  32 --
>   .../qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch  |  37 --
>   ...nsure-we-identify-the-compiler-as-g-in-co.patch |  46 --
>   ...ure-make-pulseaudio-a-configurable-option.patch |  46 --
>   ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |  63 ---
>   ...ake-qt4-native-work-with-long-building-pa.patch |  95 ----
>   ...ls.pro-disable-qmeegographicssystemhelper.patch |  28 --
>   .../0030-aarch64_arm64_qatomic_support.patch       | 491 ---------------------
>   .../qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch | 124 ------
>   .../qt4/qt4-4.8.7/0032-aarch64_add_header.patch    |  18 -
>   ...figure-support-c-0x-standard-for-directfd.patch |  40 --
>   .../0034-Fix-kmap2qmap-build-with-clang.patch      |  34 --
>   .../Fix-QWSLock-invalid-argument-logs.patch        |  98 ----
>   .../qt4/qt4-4.8.7/add_check_for_aarch64_32.patch   |  55 ---
>   meta/recipes-qt/qt4/qt4-4.8.7/g++.conf             |  40 --
>   meta/recipes-qt/qt4/qt4-4.8.7/linux.conf           |  66 ---
>   meta/recipes-qt/qt4/qt4-4.8.7/qte.sh               |   7 -
>   meta/recipes-qt/qt4/qt4-embedded.inc               |  74 ----
>   meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb          |   9 -
>   meta/recipes-qt/qt4/qt4-native.inc                 | 112 -----
>   meta/recipes-qt/qt4/qt4-native_4.8.7.bb            |   6 -
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |  38 --
>   meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb          |   9 -
>   meta/recipes-qt/qt4/qt4.inc                        | 391 ----------------
>   meta/recipes-qt/qt4/qt4_arch.inc                   |  22 -
>   meta/recipes-sato/images/core-image-sato-sdk.bb    |   6 +-
>   meta/recipes.txt                                   |   1 -
>   74 files changed, 12 insertions(+), 3700 deletions(-)
>   delete mode 100644 meta/classes/qmake2.bbclass
>   delete mode 100644 meta/classes/qmake_base.bbclass
>   delete mode 100644 meta/classes/qt4e.bbclass
>   delete mode 100644 meta/classes/qt4x11.bbclass
>   delete mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
>   delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.bb
>   delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.inc
>   delete mode 100644 meta/recipes-qt/meta/meta-toolchain-qte.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
>   delete mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
>   delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
>   delete mode 100644 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
>   delete mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
>   delete mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9.bb
>   delete mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
>   delete mode 100644 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
>   delete mode 100644 meta/recipes-qt/qt-apps/quicky_0.4.bb
>   delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
>   delete mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
>   delete mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
>   delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
>   delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7.inc
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-references-in-qmake.pri.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-translation-linking-error.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debug-packages.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-configurable-option.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work-with-long-building-pa.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographicssystemhelper.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standard-for-directfd.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/g++.conf
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/linux.conf
>   delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/qte.sh
>   delete mode 100644 meta/recipes-qt/qt4/qt4-embedded.inc
>   delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb
>   delete mode 100644 meta/recipes-qt/qt4/qt4-native.inc
>   delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.7.bb
>   delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free.inc
>   delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb
>   delete mode 100644 meta/recipes-qt/qt4/qt4.inc
>   delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc
>

