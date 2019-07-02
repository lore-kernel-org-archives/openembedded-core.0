Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7A57E7A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 03:34:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x623YYHS006610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 20:34:35 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 1 Jul 2019 20:34:34 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1561724112.git.liezhi.yang@windriver.com>
	<8ed4c92b7a1618a5bc2781e7af04889f65b0baa7.1561724112.git.liezhi.yang@windriver.com>
	<d3c2fc6e48254b073b9c1f828246dcc575694330.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <aa3f655b-34c8-7896-3493-17f896cf3a52@windriver.com>
Date: Tue, 2 Jul 2019 11:35:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d3c2fc6e48254b073b9c1f828246dcc575694330.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] devupstream.bbclass: Disable devupstream when multilib is enabled
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
X-List-Received-Date: Tue, 02 Jul 2019 03:34:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/30/19 4:04 PM, Richard Purdie wrote:
> On Fri, 2019-06-28 at 20:15 +0800, Robert Yang wrote:
>> Fixed:
>> MACHINE = "qemux86-64"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> PREFERRED_VERSION_lttng-modules = "2.10.10+git%"
>>
>> $ bitbake world
>>
>> NOTE: preferred version 2.10.10+git% of lttng-modules not available
>> (for item lib32-lttng-modules)
>> NOTE: versions of lttng-modules available: 2.10.10
>> ERROR: Multiple versions of lttng-modules are due to be built
>> (/path/to/lttng-modules_2.10.10.bb
>> virtual:devupstream:target:/path/to/lttng-modules_2.10.10.bb). Only
>> one version of a given PN should be built in any given build. You
>> likely need to set PREFERRED_VERSION_lttng-modules to select the
>> correct version or don't depend on multiple versions.
>>
>> This is because 2.10.10+git% will be built for non-multilib lttng-
>> modules since
>> the PREFERRED_VERSION is set, but this version doesn't provide
>> lib32-lttng-modules, so 2.10.10 will be built, then the error
>> happens.
>>
>> Bitbake can't extend an extended recipe, for example:
>> virtual:multilib:lib32:virtual:devupstream:target
>>
>> Or in a reverse order:
>> virtual:devupstream:target:virtual:multilib:lib32
>>
>> So disable devupstream when multilib is enabled.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/devupstream.bbclass | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/classes/devupstream.bbclass
>> b/meta/classes/devupstream.bbclass
>> index 7780c54..25403da 100644
>> --- a/meta/classes/devupstream.bbclass
>> +++ b/meta/classes/devupstream.bbclass
>> @@ -19,6 +19,12 @@
>>   CLASSOVERRIDE .= ":class-devupstream"
>>   
>>   python devupstream_virtclass_handler () {
>> +    # bitbake can't extend an extended recipe, for example:
>> +    # virtual:multilib:lib32:virtual:devupstream:target
>> +    # So disable devupstream when multilib is enabled.
>> +    if d.getVar('MULTILIBS'):
>> +        raise bb.parse.SkipRecipe("Disable devupstream when multilib
>> is enabled")
>> +
>>       # Do nothing if this is inherited, as it's for BBCLASSEXTEND
>>       if "devupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
>>           bb.error("Don't inherit devupstream, use BBCLASSEXTEND")
> 
> 
> This is a bit of a serious problem with devupstream as it means we
> can't rely upon it for default recipes. We need to file a bug about
> this and find a way to fix it, perhaps teaching multilib about
> devupstream so it can set BBCLASSEXTEND accordingly.

I filed a bug and assigned it you:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13424

After more investigations, it seems that we should modify 
ast.py:multi_finalize(), although I file the bug in oe-core product.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

