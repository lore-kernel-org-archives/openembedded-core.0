Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 677A374AB8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2018 09:50:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2018 02:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,443,1520924400"; d="scan'208";a="50448459"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2018 02:50:58 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org,
	"Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <055a6008-6237-5535-61c5-60162c3e7729@linux.intel.com>
Date: Sat, 26 May 2018 12:51:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 01/24] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Sat, 26 May 2018 09:50:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/25/2018 05:48 AM, Robert Yang wrote:
> +def buildcfg_multilibs(d):
> +    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
> +    for variant in variants.split():
> +        localdata = bb.data.createCopy(d)
> +        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
> +        localdata.setVar("OVERRIDES", overrides)
> +        bb.data.update_data(localdata)
> +        statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
> +        for var in statusvars:
> +            origvalue = d.getVar(var, True)
> +            variantvalue = localdata.getVar(var, True)
> +            if origvalue is not None and variantvalue is not None and origvalue != variantvalue:
> +                yield '%-7s %-17s = "%s"' % (variant + ":", var, variantvalue)
> +

There are helper functions in utils.bbclass that take care of multilib 
datastore setup, please use them instead of re-implementing what they 
do. USe all_multlilib_tune_values() in particular.


Alex

