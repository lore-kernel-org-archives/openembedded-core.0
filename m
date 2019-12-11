Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3535A7DE74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 22:13:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2019 14:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="415020087"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2019 14:13:01 -0800
To: openembedded-core@lists.openembedded.org
References: <20191211172334.11377-1-twoerner@gmail.com>
	<CAMKF1srKC=Z5r56=hZj5Q7trKW+LG-NDp7JqLXZqaoWGcDqinQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ba1800a3-2a7c-fc40-dcb2-1dc75db15970@intel.com>
Date: Wed, 11 Dec 2019 22:13:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srKC=Z5r56=hZj5Q7trKW+LG-NDp7JqLXZqaoWGcDqinQ@mail.gmail.com>
Subject: Re: [PATCH] mesa.inc: allow the user to choose the build type
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
X-List-Received-Date: Wed, 11 Dec 2019 22:13:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/12/2019 18:40, Khem Raj wrote:
> On Wed, Dec 11, 2019 at 9:23 AM Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> Upstream mesa can either be built as a debug release (the default) or a
>> production release. This patch allows the user to choose which one they
>> want by setting MESA_BUILD_TYPE to either 'production' or 'debug' as
>> they see fit. Under OpenEmbedded a production build will be performed by
>> default.
>>
>> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 5838207e6b..9ad9f2e370 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -46,6 +46,19 @@ export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
>>
>>   MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
>>
>> +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
>> +# by default the upstream mesa sources build a debug release
>> +# here we assume the user will want a release build by default
>> +MESA_BUILD_TYPE ?= "release"
>> +def check_buildtype(d):
>> +    _buildtype = d.getVar('MESA_BUILD_TYPE')
>> +    if _buildtype not in ['release', 'debug']:
>> +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
>> +    if _buildtype == 'debug':
>> +        return 'debugoptimized'
>> +    return 'plain'
>> +MESON_BUILDTYPE = "${@check_buildtype(d)}"
>> +
> 
> Should this also be controlled with DEBUG_BUILD knob

Not convinced.  From what Trevor said on IRC, a Mesa debug build is more 
than just symbols but full on debug output.

Ross

