Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46FDE60809
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 02:39:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5S2diTh003726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jun 2014 19:39:44 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 27 Jun 2014 19:39:43 -0700
Message-ID: <53AE2AEE.3020705@windriver.com>
Date: Sat, 28 Jun 2014 10:39:42 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Henning Heinold <henning@itconsulting-heinold.de>,
	<openembedded-core@lists.openembedded.org>
References: <1403645687-19655-1-git-send-email-henning@itconsulting-heinold.de>
	<1403645687-19655-3-git-send-email-henning@itconsulting-heinold.de>
In-Reply-To: <1403645687-19655-3-git-send-email-henning@itconsulting-heinold.de>
Subject: Re: [PATCH 2/3][for-dora] perf: split packging
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
X-List-Received-Date: Sat, 28 Jun 2014 02:39:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/25/2014 05:34 AM, Henning Heinold wrote:
> * some fundamental perf commands can work
>    without the dependency on perl, python or bash
>    make them separate packages and RSUGGEST them
>
> * bump PR

Why you need bump the PR, please ?

// Robert

>
> The patch was sponsored by sysmocom
>
> Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
> ---
>   meta/recipes-kernel/perf/perf.bb | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 31c2c8e..e43f053 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -9,7 +9,7 @@ as well."
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
> -PR = "r8"
> +PR = "r9"
>
>   require perf-features.inc
>
> @@ -27,9 +27,6 @@ DEPENDS = "virtual/kernel \
>              bison flex \
>             "
>
> -SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> -RDEPENDS_${PN} += "elfutils bash ${SCRIPTING_RDEPENDS}"
> -
>   PROVIDES = "virtual/perf"
>
>   inherit linux-kernel-base kernel-arch pythonnative
> @@ -124,6 +121,18 @@ python do_package_prepend() {
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -FILES_${PN} += "${libexecdir}/perf-core"
> +PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
> +
> +RDEPENDS_${PN} += "elfutils"
> +RDEPENDS_${PN}-archive =+ "bash"
> +RDEPENDS_${PN}-python =+ "bash python"
> +RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
> +
> +RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
> +RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
> +
>   FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
> -FILES_${PN} += "${libdir}/python*/site-packages"
> +FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
> +FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
> +FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
> +FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
>

