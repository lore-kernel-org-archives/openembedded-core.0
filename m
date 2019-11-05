Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C9F327CBDD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 10:38:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 02:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="353110242"
Received: from sptommas-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.55.33])
	by orsmga004.jf.intel.com with ESMTP; 05 Nov 2019 02:38:33 -0800
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20191104205504.24428-1-bunk@stusta.de>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <aa3aa480-65d5-789c-71c0-3997d742424e@intel.com>
Date: Tue, 5 Nov 2019 10:38:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104205504.24428-1-bunk@stusta.de>
Subject: Re: [PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Tue, 05 Nov 2019 10:38:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/11/2019 20:55, Adrian Bunk wrote:
> +# Fixed in 2000-10-10, but the versioning of iputils
> +# breaks the version order.
> +CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"

So the problem is that our PV matches the upstream git tags, which don't 
match the naming convention in the CPE entries.

The tags are of the form s20190709, but the CPE uses 2010-10-10.

If we assume that the CPE version scheme will remain the same then we 
can handle this for all cases in the recipe:

def cve_version(d):
     import re
     m = re.match(r"s(\d{4})(\d{2})(\d{2})", d.getVar("PV"))
     return "-".join(m.groups())
CVE_VERSION = "${@cve_version(d)}"

Ross

