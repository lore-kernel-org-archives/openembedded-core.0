Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF986D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:45:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2019 02:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="179766428"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga007.jf.intel.com with ESMTP; 25 Sep 2019 02:45:50 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1569403775.git.liezhi.yang@windriver.com>
	<f2f0747a348d329c7a20feb8ea54c90c38b75b68.1569403775.git.liezhi.yang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <eaf7556f-0459-d8bd-5535-25f4ce39015f@intel.com>
Date: Wed, 25 Sep 2019 10:45:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f2f0747a348d329c7a20feb8ea54c90c38b75b68.1569403775.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/3] net-tools: Fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:45:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/09/2019 10:30, Robert Yang wrote:
> Fixed:
> $ bitbake nativesdk-net-tools
> ERROR: nativesdk-net-tools-1.60-26-r0 do_package: QA Issue: nativesdk-net-tools: Files/directories were installed but not shipped in any package:
>    /usr
>    /usr/share
>    /usr/share/man
> [snip]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> index b565fd0..0be9913 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> @@ -109,6 +109,14 @@ do_install() {
>   	fi
>   }
>   
> +do_install_append_class-nativesdk() {
> +    install -d ${D}${datadir}
> +    src_dir="${D}${target_datadir}"
> +    mv $src_dir/* ${D}${datadir}
> +    par_dir=`dirname $src_dir`
> +    rmdir $src_dir $par_dir
> +}
> +

Isn't this solved better by fixing the currently hardcoded value in 
man/Makefile:

mandir=/usr/share/man

Ross


