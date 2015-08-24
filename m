Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBF772B1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 03:36:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O3apU9029672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Aug 2015 20:36:51 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 23 Aug 2015 20:36:50 -0700
Message-ID: <55DA9151.5040103@windriver.com>
Date: Mon, 24 Aug 2015 11:36:49 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1439906147-14749-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1439906147-14749-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] glibc-package: use ${PN} in INSANE_SKIP
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
X-List-Received-Date: Mon, 24 Aug 2015 03:36:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/18/2015 09:55 PM, Martin Jansa wrote:
> * INSANE_SKIP_${PN}_append_aarch64 is causing following warning in some
>    setups:
>    WARNING: Variable key INSANE_SKIP_${PN} () replaces original key INSANE_SKIP_glibc ().
> * in worst case this will be applied also for glibc-initial package
>    which is using the same glibc-package.inc, but glibc-initial doesn't
>    create any packages so we should be fine
> * someone building for aarch64 should confirm verify that this
>    INSANE_SKIP is still needed and cannot be fixed properly it was

Hi Martin,

I verified that we still need the patch, otherwise warnings:

MACHINE ?= "qemuarm64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7a"

$ bitbake glibc -ccleansstate && bitbake glibc
WARNING: QA Issue: glibc: found library in wrong location: 
/lib/ld-linux-aarch64.so.1 [libdir]

// Robert

>    introduced in:
>      commit aeb6f53dd607ceb0d2265a05c27f751109c73752
>      Author: Mark Hatle <mark.hatle@windriver.com>
>      Date:   Thu Dec 18 16:51:13 2014 +0800
>
>      glibc-package: aarch64 enable symlink for ABI compliance
>
>      aarch64 requires the ld.so to be present in /lib, even if the rest
>      of the libraries are installed into an alternative directory.
>
>      See: https://sourceware.org/glibc/wiki/ABIList
>
>      Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index def0e0c..c72a49e 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -35,7 +35,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
>   RPROVIDES_${PN}-dbg = "eglibc-dbg"
>   libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>   libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
> -INSANE_SKIP_glibc_append_aarch64 = " libdir"
> +INSANE_SKIP_${PN}_append_aarch64 = " libdir"
>
>   FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
>   FILES_ldd = "${bindir}/ldd"
>

