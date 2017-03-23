Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AEF6D77B3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490298907; x=1521834907;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=2NZLCI2wz7xToHS3gY8/CVTF41BfJOKGNmfMD6VYafY=;
	b=kFBbIdSKrAQbS87hwrC10feAKgHQCLW0f4lJUP92xNZlL80YZ17Vbakp
	WyWf5bjzQR0NcL6CVcXTPo2ChSWLWw==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 12:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,211,1486454400"; d="scan'208";a="70107429"
Received: from bitbang.jf.intel.com (HELO [10.7.159.60]) ([10.7.159.60])
	by orsmga004.jf.intel.com with ESMTP; 23 Mar 2017 12:55:06 -0700
To: Vedang Patel <vedang.patel@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1490225634.15509.40.camel@intel.com>
	<1490231158-6151-1-git-send-email-vedang.patel@intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <ee7db60c-985e-49a5-8e64-0632e40d2db2@linux.intel.com>
Date: Thu, 23 Mar 2017 12:55:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490231158-6151-1-git-send-email-vedang.patel@intel.com>
Subject: Re: [PATCH v2] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Thu, 23 Mar 2017 19:55:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patel,

On 03/22/2017 06:05 PM, Vedang Patel wrote:
> Add support to enable python bindings for libxslt using PACKAGECONFIG.
> This will include --with-python argument while compiling the package.
> The support is disabled by default.
>
> Signed-off-by: Vedang Patel <vedang.patel@intel.com>
> ---
>  meta/recipes-support/libxslt/libxslt_1.1.29.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> index be747e608d9d..1e00306207c5 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG = "${bindir}/xslt-config"
>
> -inherit autotools pkgconfig binconfig-disabled lib_package
> +inherit autotools pkgconfig binconfig-disabled lib_package distutils-common-base
>
>  # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
>  do_configure_prepend () {
> @@ -33,7 +33,9 @@ do_configure_prepend () {
>  	touch ${S}/doc/xsltproc.1
>  }
>
> -EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
> +EXTRA_OECONF = "--without-debug --without-mem-debug --without-crypto"
> +PACKAGECONFIG[libxslt-python] = "--with-python=${PYTHON_BASE_VERSION}, --without-python"
> +
You kept "libxslt-python", and I think you meant to change it to "python".

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES_${PN}-bin += "${PN}-utils"
>  RCONFLICTS_${PN}-bin += "${PN}-utils"
>


