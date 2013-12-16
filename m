Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2463D6DE01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 02:11:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBG2BrIK027238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 18:11:53 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 15 Dec 2013 18:11:53 -0800
Message-ID: <52AE6180.60905@windriver.com>
Date: Mon, 16 Dec 2013 10:12:16 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
	<2024453.Je7eP6C3oy@helios>
In-Reply-To: <2024453.Je7eP6C3oy@helios>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Mon, 16 Dec 2013 02:11:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2013 12:51 AM, Paul Eggleton wrote:
> Hi Qi,
>
> On Friday 13 December 2013 11:09:01 Qi.Chen@windriver.com wrote:
>> It's a very common situation in OE/Yocto that the recipe authors/maintainers
>> either forget to set the CONFFILES variable or set it wrong.
>>
>> For example, we don't have CONFFILES set in the shadow recipe. As a result,
>> /etc/login.defs from the shadow package is not treated as a config file.
>> Another example is the base-files recipe. We set the CONFFILES variable, but
>> it's not a complete list. Basically, all files under /etc should be treated
>> as config files for this recipe.
>>
>> Such mistakes are not easy to find, because when we add or upgrade a recipe,
>> we usually only test whether it functions well, we don't take into
>> consideration the on-target upgrade process.
>>
>> So we need to improve the situation here.
>>
>> This patchset consists of two patches. The first one is the main patch which
>> changes the way CONFFILES is handled in our project. The second one serves
>> as an example how to fix individual recipes.
>>
>> As almost all files under /etc should be considerred as config files, we
>> don't need to modify a lot of recipes after the first patch. Take shadow as
>> an example. We don't need to modify that recipe after this change. The ones
>> that need to be paid attention to are those that set CONFFILES in their
>> recipes. The second patch serves as an exmple how to fix this.
> This definitely sounds like a good idea, but do we need to give special
> consideration to /etc/init.d/ since files under there aren't really
> configuration files?
>
> Cheers,
> Paul
>

I thought about this issue. I then referenced ubuntu to see how it 
treated files under /etc/init.d/.
On ubuntu, files under /etc/init.d/ are also treated as configuration 
files. I think the rational behind
this decision might be that if the user modifies some init script, he 
must have modified it for some
reason which can not be silently ignored.

That's why I didn't deal with /etc/init.d/ specially.

Best Regards,
Chen Qi

