Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B8B806AA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 15:11:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2013 08:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,867,1363158000"; d="scan'208";a="353375721"
Received: from unknown (HELO [10.255.12.161]) ([10.255.12.161])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2013 08:11:01 -0700
Message-ID: <51BB3286.8020902@linux.intel.com>
Date: Fri, 14 Jun 2013 08:11:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <1371197373-10741-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1371197373-10741-1-git-send-email-jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] do not pass CFLAGS to gcc while building libcap
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
X-List-Received-Date: Fri, 14 Jun 2013 15:11:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2013 01:09 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> During do_configure(), we modify the BUILD_CFLAGS used
> but do not remove the default inclusion of CFLAGS
> in BUILD_CFLAGS.  This fix removes CFLAGS inclusion
> by modifying do_configure().
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   meta/recipes-support/libcap/libcap.inc |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
> index 2fd5718..5ace7d7 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -12,15 +12,17 @@ DEPENDS_class-native = "perl-native-runtime"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz"
>
> -PR = "r2"
> +PR = "r3"
>
No PR bumps needed here or in your other patch, in this case they cause 
trouble if the 2 patches are not applied in order!

Sau!


>   inherit lib_package
>
> +# do NOT pass target cflags to host compilations
> +#
>   do_configure() {
>   	# libcap uses := for compilers, fortunately, it gives us a hint
>   	# on what should be replaced with ?=
>   	sed -e 's,:=,?=,g' -i Make.Rules
> -	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
> +	sed -e 's,^BUILD_CFLAGS ?= $(CFLAGS),BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
>   }
>
>   EXTRA_OEMAKE = " \
> --
> 1.7.4.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

