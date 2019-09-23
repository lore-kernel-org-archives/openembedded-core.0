Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 952B474813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:16:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 13:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="339845210"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga004.jf.intel.com with ESMTP; 23 Sep 2019 13:16:48 -0700
To: openembedded-core@lists.openembedded.org
References: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <47210e81-33a4-4f87-c258-e7b63b71482e@intel.com>
Date: Mon, 23 Sep 2019 21:16:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Mon, 23 Sep 2019 20:16:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/09/2019 19:01, Trevor Gamblin wrote:
> From: Trevor Gamblin<trevor.gamblin@windriver.com>
> 
> lighttpd builds fail if "fam" (and therefore gamin) is enabled.
> 
> In conf/local.conf:
> 
>      CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
>      PACKAGECONFIG_append_pn-lighttpd = " fam"
> 
> bitbake error:
> 
>      ERROR: Nothing PROVIDES 'gamin' (but /yow-lpggp31/tgamblin/oe-core.git/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
>      NOTE: Runtime target 'lighttpd' is unbuildable, removing...
>      Missing or unbuildable dependency chain was: ['lighttpd', 'gamin']
>      ERROR: Required build target 'core-image-minimal' has no buildable providers.
>      Missing or unbuildable dependency chain was: ['core-image-minimal', 'lighttpd', 'gamin']
> 
> Since gamin doesn't appear to have a recipe and hasn't been
> maintained for several years, this should be removed from the
> list of lighttpd PACKAGECONFIG options.

Non-default PACKAGECONFIGs are allowed to depend on recipes that are not 
in core, plenty of recipes do this.  Otherwise there'd be no way to turn 
on options that have dependencies in other layers.

However, the fact that Gamin is very much dead is a good reason to 
remove the PACKAGECONFIG and simply hardcode --without-fam for good measure.

Ross

