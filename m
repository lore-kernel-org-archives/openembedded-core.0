Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7263731F0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 05:57:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0G5vKpe002773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 21:57:20 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 21:57:19 -0800
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<1cb0662447098b5f24ec3e02e471a3e288a69a04.1447371049.git.chris_larson@mentor.com>
	<5698BA9F.4020809@windriver.com>
	<CABcZAN=Y3UnMXjxVdxeYALSuR190YXPEp5bFnK44OsT0X87YDg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5699DBBE.5010601@windriver.com>
Date: Sat, 16 Jan 2016 13:57:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=Y3UnMXjxVdxeYALSuR190YXPEp5bFnK44OsT0X87YDg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] opkg-utils: add update-alternatives PACKAGECONFIG
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
X-List-Received-Date: Sat, 16 Jan 2016 05:57:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/16/2016 04:07 AM, Christopher Larson wrote:
>
> On Fri, Jan 15, 2016 at 2:23 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>     I've afraid this patch can't work well, when opkg-utils doesn't provide
>     virtual/update-alternatives, then chkconfig would be built and there would
>     be dependency loops for example,
>
>     PACKAGECONFIG = "python"
>     $ bitbake core-image-minimal
>
>     [snip]
>     ERROR:
>     Dependency loop #1 found:
>        Task 747
>     (/buildarea/lyang1/poky/meta/recipes-support/libpcre/libpcre_8.38.bb
>     <http://libpcre_8.38.bb>, do_packagedata) (dependent Tasks ['libpcre,
>     do_package'])
>        Task 2067
>     (/buildarea/lyang1/poky/meta/recipes-extended/slang/slang_2.2.4.bb
>     <http://slang_2.2.4.bb>, do_package) (dependent Tasks ['gcc-runtime,
>     do_packagedata', 'pseudo, do_populate_sysroot', 'slang, do_install',
>     'libpcre, do_packagedata', 'libtool-cross, do_packagedata', 'glibc,
>     do_packagedata', 'rpm, do_populate_sysroot'])
>        Task 2064
>     (/buildarea/lyang1/poky/meta/recipes-extended/slang/slang_2.2.4.bb
>     <http://slang_2.2.4.bb>, do_packagedata) (dependent Tasks ['slang, do_package'])
>        Task 1876
>     (/buildarea/lyang1/poky/meta/recipes-extended/newt/libnewt_0.52.18.bb
>     <http://libnewt_0.52.18.bb>, do_package) (dependent Tasks ['slang,
>     do_packagedata', 'gcc-runtime, do_packagedata', 'pseudo,
>     do_populate_sysroot', 'libnewt, do_install', 'libtool-cross,
>     do_packagedata', 'glibc, do_packagedata', 'popt, do_packagedata', 'rpm,
>     do_populate_sysroot'])
>        Task 1873
>     (/buildarea/lyang1/poky/meta/recipes-extended/newt/libnewt_0.52.18.bb
>     <http://libnewt_0.52.18.bb>, do_packagedata) (dependent Tasks ['libnewt,
>     do_package'])
>        Task 1405
>     (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>     <http://chkconfig_1.3.58.bb>, do_package) (dependent Tasks ['gcc-runtime,
>     do_packagedata', 'pseudo, do_populate_sysroot', 'glibc, do_packagedata',
>     'libnewt, do_packagedata', 'chkconfig, do_install', 'popt, do_packagedata',
>     'gettext, do_packagedata', 'rpm, do_populate_sysroot'])
>        Task 1402
>     (/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>     <http://chkconfig_1.3.58.bb>, do_packagedata) (dependent Tasks ['chkconfig,
>     do_package'])
>        Task 853
>     (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>     <http://bzip2_1.0.6.bb>, do_package) (dependent Tasks ['gcc-runtime,
>     do_packagedata', 'bzip2, do_install_ptest_base', 'bzip2, do_install',
>     'libtool-cross, do_packagedata', 'glibc, do_packagedata', 'pseudo,
>     do_populate_sysroot', 'chkconfig, do_packagedata', 'rpm, do_populate_sysroot'])
>        Task 850
>     (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>     <http://bzip2_1.0.6.bb>, do_packagedata) (dependent Tasks ['bzip2, do_package'])
>        Task 750
>     (/buildarea/lyang1/poky/meta/recipes-support/libpcre/libpcre_8.38.bb
>     <http://libpcre_8.38.bb>, do_package) (dependent Tasks ['libpcre,
>     do_install_ptest_base', 'libpcre, do_install', 'gcc-runtime,
>     do_packagedata', 'pseudo, do_populate_sysroot', 'libtool-cross,
>     do_packagedata', 'glibc, do_packagedata', 'bzip2, do_packagedata', 'zlib,
>     do_packagedata', 'rpm, do_populate_sysroot'])
>
>
> Afaict it should work for the native case, just not target, if you use the
> chkconfig-alternatives-native recipe. In meta-mentor we have that recipe for
> target as well, to cover both cases, I'll see about submitting that. We've been
> using the chkconfig update-alternatives implementation for a few releases now.

If I understand correctly, maybe we need make PACKAGECONFIG only
be available for opkg-utils-native ?

// Robert

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

