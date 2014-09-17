Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 684A260809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 09:13:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H9DUjc011793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 02:13:30 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Sep 2014 02:13:29 -0700
Message-ID: <541950B7.6080008@windriver.com>
Date: Wed, 17 Sep 2014 17:13:27 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <ross.burton@intel.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.231]
Cc: jslater@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] V2: Add machine qemuaarch64
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
X-List-Received-Date: Wed, 17 Sep 2014 09:13:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月16日 23:06, Kai Kang wrote:
> V2:
> * fix kernel linux-yocto build faiure
> * redefine position of dynamic linker from /lib to /lib64
> * other fixes of userspace packages
>
> Test with Joe Slater's patches:
> * siteinfo: account for 32 and 64 bit arm
> * sysprof: add aarch64 support

Add there are 2 known failures of build world:
1 meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb: it needs a 
valid kernel config. CONFIG_MODULES is not set for now.
2 meta/recipes-support/libunwind/libunwind_1.1.bb: it was added recently 
and seems not support aarch64. Maybe we should exclude it from world for 
aarch64.

Regards,
Kai

>
> The following changes since commit fceef0cace6670a8c5f15cd2f31a191176732730:
>
>    bitbake: data_smart: Fix remove operator and its interaction with data expansion (2014-09-13 08:52:49 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/qemuarm64
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64
>
> Kai Kang (9):
>    linux-yocto: depend on libgcc for aarch64
>    Add machine qemuarm64
>    gcc-4.9: redefine dynamic linker for aarch64
>    libatomics-ops: add aarch64 target iniitial support
>    qt4-native: add aarch64 support
>    qt4: add aarch64 support
>    qt4-embedded: disable webkit
>    libpng: add neon option for aarch64
>    perf: disable libunwind support for aarch64
>
>   meta/conf/bitbake.conf                             |   1 +
>   meta/conf/machine/include/arm/arch-armv8.inc       |  20 +
>   meta/conf/machine/qemuarm64.conf                   |  12 +
>   meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
>   .../0056-redefine-dynamic-linker-for-aarch64.patch |  34 ++
>   meta/recipes-kernel/linux/linux-yocto.inc          |   1 +
>   meta/recipes-kernel/perf/perf-features.inc         |   1 +
>   meta/recipes-multimedia/libpng/libpng_1.6.13.bb    |   1 +
>   .../0001-libatomic_ops-Aarch64-basic-port.patch    | 239 ++++++++++
>   .../pulseaudio/libatomics-ops_7.2.bb               |   1 +
>   meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   4 +
>   .../0029-aarch64_arm64_fix_arch_detection.patch    |  53 +++
>   .../0030-aarch64_arm64_qatomic_support.patch       | 491 +++++++++++++++++++++
>   .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ++++++
>   .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |  18 +
>   meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb          |   1 +
>   meta/recipes-qt/qt4/qt4-native.inc                 |   4 +
>   meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb          |   3 +
>   meta/recipes-qt/qt4/qt4_arch.inc                   |   1 +
>   19 files changed, 1010 insertions(+)
>   create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>   create mode 100644 meta/conf/machine/qemuarm64.conf
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
>   create mode 100644 meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
>


-- 
Regards,
Neil | Kai Kang


