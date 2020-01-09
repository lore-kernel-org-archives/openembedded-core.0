Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB937F99E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 01:28:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0091Slv9029507
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 8 Jan 2020 17:28:47 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 8 Jan 2020 17:28:46 -0800
To: Stefano Babic <sbabic@denx.de>, <openembedded-core@lists.openembedded.org>
References: <20200103123322.8396-1-sbabic@denx.de>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <33870edb-953c-0b64-d7b9-884a53395749@windriver.com>
Date: Thu, 9 Jan 2020 09:29:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200103123322.8396-1-sbabic@denx.de>
X-Originating-IP: [128.224.162.184]
Subject: Re: [PATCH V4] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 09 Jan 2020 01:28:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Resend as previous email forgets to add Stefano.

In case of multilib, the do_package fails with

ERROR: libubootenv-0.2-r0 do_package: QA Issue: libubootenv: 
Files/directories were installed but not shipped in any package:
   /usr/lib/libubootenv.so
   /usr/lib/libubootenv.so.0.2

Regards,
Chen Qi

On 01/03/2020 08:33 PM, Stefano Babic wrote:
> libubootenv is a replacement for u-boot-fw-utils. It is
> hardware-independent and provides fw_printenv and fw_setenv tools that
> are full compatible with the ones provided by U-Boot. A library is
> provided to access the environment from an own application.
> License is LGPL-2.1 and this allow to link the library to proprietary
> code. The user of the tools should install the configuration file
> "fw_env.config", as he is already used to with u-boot-fw-utils. The
> configuration file is compatible with u-boot-fw-utils.
> A full discussion about issues on current u-boot-fw-utils can be read on
> U-Boot's ML at:
>
> http://u-boot.10912.n7.nabble.com/SWUpdate-U-Boot-environment-library-dependency-tt340530.html#none
>
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
> Changes since V3:
> 	- Update maintainers.inc (R. Purdie)
> 	- Add link to U-Boot's ML in commit message (R. Purdie)
> Changes since V2:
> 	- drop .inc file (R. Burton)
> Changes since V1:
> 	- drop PACKAGE_ARCH (M. Jansa)
>
>   meta/conf/distro/include/maintainers.inc   |  1 +
>   meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 26 ++++++++++++++++++++++
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 39eee9475c..09453e7343 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -398,6 +398,7 @@ RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
>   RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> new file mode 100644
> index 0000000000..23230d132e
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "U-Boot libraries and tools to access environment"
> +DEPENDS += "mtd-utils"
> +
> +DESCRIPTION = "This package contains tools and libraries to read \
> +and modify U-Boot environment. \
> +It provides a hardware-independent replacement for fw_printenv/setenv utilities \
> +provided by U-Boot"
> +
> +HOMEPAGE = "https://github.com/sbabic/libubootenv"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "libs"
> +
> +SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> +
> +PROVIDES += "u-boot-fw-utils"
> +RPROVIDES_${PN} += "u-boot-fw-utils"
> +
> +BBCLASSEXTEND = "native"



