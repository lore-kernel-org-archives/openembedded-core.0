Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4911065FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 15:23:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2014 08:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,868,1392192000"; d="scan'208";a="434006607"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2014 08:23:20 -0700
Message-ID: <537A21E8.5010000@linux.intel.com>
Date: Mon, 19 May 2014 08:23:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1400124104-10777-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1400124104-10777-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] perl-5.14.3:fix CVE-2010-4777
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
X-List-Received-Date: Mon, 19 May 2014 15:23:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2014 08:21 PM, rongqing.li@windriver.com wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> The Perl_reg_numbered_buff_fetch function in Perl 5.10.0, 5.12.0,
> 5.14.0, and other versions, when running with debugging enabled,
> allows context-dependent attackers to cause a denial of service
> (assertion failure and application exit) via crafted input that
> is not properly handled when using certain regular expressions,
> as demonstrated by causing SpamAssassin and OCSInventory to
> crash.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4777
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../perl-5.14.3-fix-CVE-2010-4777.patch            |   30 ++++++++++++++++++++
>   meta/recipes-devtools/perl/perl-native_5.14.3.bb   |    3 +-
>   meta/recipes-devtools/perl/perl_5.14.3.bb          |    3 +-
>   3 files changed, 34 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
>
> diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
> new file mode 100644
> index 0000000..bb726c8
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
> @@ -0,0 +1,30 @@

Another .patch file missing Upstream-Status and Signed-off-by

Sau!

> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -11868,8 +11868,25 @@ Perl_save_re_context(pTHX)
> +
> + 		if (gvp) {
> + 		    GV * const gv = *gvp;
> +-		    if (SvTYPE(gv) == SVt_PVGV && GvSV(gv))
> +-			save_scalar(gv);
> ++		    if (SvTYPE(gv) == SVt_PVGV && GvSV(gv)) {
> ++			/* this is a copy of save_scalar() without the GETMAGIC call, RT#76538 */
> ++			SV ** const sptr = &GvSVn(gv);
> ++			SV * osv = *sptr;
> ++			SV * nsv = newSV(0);
> ++			save_pushptrptr(SvREFCNT_inc_simple(gv),
> ++			SvREFCNT_inc(osv), SAVEt_SV);
> ++			if (SvTYPE(osv) >= SVt_PVMG && SvMAGIC(osv) &&
> ++			    SvTYPE(osv) != SVt_PVGV) {
> ++			    if (SvGMAGICAL(osv)) {
> ++				const bool oldtainted = PL_tainted;
> ++				SvFLAGS(osv) |= (SvFLAGS(osv) &
> ++				    (SVp_IOK|SVp_NOK|SVp_POK)) >> PRIVSHIFT;
> ++				PL_tainted = oldtainted;
> ++			    }
> ++			    mg_localize(osv, nsv, 1);
> ++			}
> ++			*sptr = nsv;
> ++		    }
> + 		}
> + 	    }
> + 	}
> diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
> index 2ef0a51..c38be41 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
> @@ -17,7 +17,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>              file://MM_Unix.pm.patch \
>              file://debian/errno_ver.diff \
>              file://dynaloaderhack.patch \
> -           file://perl-build-in-t-dir.patch"
> +           file://perl-build-in-t-dir.patch \
> +           file://perl-5.14.3-fix-CVE-2010-4777.patch "
>
>   SRC_URI[md5sum] = "f6a3d878c688d111b495c87db56c5be5"
>   SRC_URI[sha256sum] = "03638a4f01bc26b81231233671524b4163849a3a9ea5cc2397293080c4ea339f"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
> index c307b99..fcd665b 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.3.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
> @@ -74,7 +74,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>           file://config.sh-32-be \
>           file://config.sh-64 \
>           file://config.sh-64-le \
> -        file://config.sh-64-be"
> +        file://config.sh-64-be \
> +        file://perl-5.14.3-fix-CVE-2010-4777.patch "
>   #	file://debian/fakeroot.diff
>
>   SRC_URI[md5sum] = "f6a3d878c688d111b495c87db56c5be5"
>

