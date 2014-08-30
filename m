Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD8D7054E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 13:35:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7UDZS2T011045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 30 Aug 2014 06:35:29 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sat, 30 Aug 2014 06:35:27 -0700
Message-ID: <5401D31F.4060601@windriver.com>
Date: Sat, 30 Aug 2014 08:35:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1409333952.29296.195.camel@ted>		 <5400C83C.3020306@windriver.com>
	<1409349774.29296.208.camel@ted>	 <5400FAED.8030903@windriver.com>
	<1409351521.29296.210.camel@ted>
In-Reply-To: <1409351521.29296.210.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm: Add optional improved directory handling
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
X-List-Received-Date: Sat, 30 Aug 2014 13:35:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 5:32 PM, Richard Purdie wrote:
> On Fri, 2014-08-29 at 17:13 -0500, Mark Hatle wrote:
>> On 8/29/14, 5:02 PM, Richard Purdie wrote:
>>> On Fri, 2014-08-29 at 13:36 -0500, Mark Hatle wrote:
>>> Going back in time, I remember us specifically talking about directory
>>> ownership and how we likely should try and reach a point where the
>>> common system directories do become owned by specific packages. With
>>> this kind of DIRFILES support we could move in the direction. The perms
>>> tables obviously help to a point ensuring consistent permissions but
>>> they don't help the ownership problem. Or is this less of an issue since
>>> we last discussed it (which admittedly was a while ago)?
>>
>> No there is currently nothing that says I exclusively own a directory (or link).
>>    The fs-perms.txt could be extended to do this (in a transparent way).
>>
>> My concern with the DIRFILES as it appears to be implemented can be shown in the
>> existing example:
>>
>> I create a new recipe that writes:
>>
>> /etc/foo.conf
>> /usr/bin/foo
>>
>> (that's it)
>>
>>
>> In the SMACK case, the /etc and /usr/bin directories shouldn't be included.. so
>> how do we define DIRFILES?  If it's blank, they'll be included.. but we don't
>> have any directories to set it to... so do we need to do:
>>      DIRFILES = "something_random_so_it_works"
>>
>> That seems very counter intuitive to me.
>>
>> This is why I'm suggesting an inverse relationship..  We include everything
>> other then explicitly listed directories.  That way the user can globally define
>> /etc, /usr/bin, ... and individual recipes can augment this with their own
>> custom values if appropriate.
>>
>> and in the default (oe-core) case no change means the directories will continue
>> to be included -- no flag days required.
>
> I'm more thinking that when we reach this stage, the core would end up
> setting:
>
> DIRFILES = ""
>
> as the default (think a core class or conf file), then recipes can
> override as needed. You don't need something_random_so_it_works, I had
> the empty value specifically in mind to trigger this from the core (as
> opposed to None where the variable isn't set at all).

So the switch then is empty value vs not defined?

If so that is what I was missing.

--Mark

> Cheers,
>
> Richard
>
>
>


