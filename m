Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 481D87F8B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 14:24:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2019 06:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="213544862"
Received: from sptommas-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.55.33])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2019 06:24:09 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191104124251.21923-1-ross.burton@intel.com>
	<20191104140115.GA5390@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e1411b32-8500-2971-ff45-ec717c14d3be@intel.com>
Date: Mon, 4 Nov 2019 14:24:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104140115.GA5390@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Mon, 04 Nov 2019 14:24:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/11/2019 14:01, Adrian Bunk wrote:
> On Mon, Nov 04, 2019 at 12:42:51PM +0000, Ross Burton wrote:
>> This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
>> recipe.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
>> index 66af2f3d60e..07970e14360 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
>> @@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
>>   FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +# CVE-2019-17371 is actually a memory leak in gif2png 2.x
>> +CVE_CHECK_WHITELIST = "CVE-2019-17371"
> 
> These should use += to not overwrite whitelists defined by
> the distribution or the user.

IMHO, the distribution or user should be using _append.   The whitelist 
should be explicitly per-recipe: there's a CVE which is tagged 
incorrectly as being in openssl *and* mod_ssl, we don't want to 
whitelist it globally but only in openssl.

V2 incoming, just to be safe, though.

Ross

