Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C03F65C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:47:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u58Gl0JT028041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Jun 2016 09:47:00 -0700
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 8 Jun 2016 09:46:59 -0700
To: Herve Jourdain <herve.jourdain@neuf.fr>
References: <1465381435600.39214@gin.de>
	<02b101d1c184$93336d80$b99a4880$@neuf.fr> <1465400599707.30401@gin.de>
	<2ed9a471-32c1-5ec1-b5e1-fb019afa1dc2@windriver.com>
	<B39D3DBB-B9C1-4119-9687-03A571ED29AE@neuf.fr>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <bac958a1-9a5e-3bdc-0d83-0dcff153dd22@windriver.com>
Date: Wed, 8 Jun 2016 11:47:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <B39D3DBB-B9C1-4119-9687-03A571ED29AE@neuf.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 16:47:02 -0000
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit

On 6/8/16 11:17 AM, Herve Jourdain wrote:
> Hi Mark,
> 
> In my case, the issue was due to an empty problem list, which after Daniel's fix did trigger a retry, which failed because the packages were already installed.
> But the code for a non-empty problem list does also trigger a retry, and I suppose it would run also in the same "package already installed" issue, if it were to be triggered - not sure though, since I never had that case yet.
> Do you think we need to check and potentially fix that case? Or shall we remove the retry feature altogether instead?

We should definitely get the fix suggested here in place and resolve the
immediate issue.

I'm not sure if we can intentionally trigger the faults or not.  If we can, then
we can add a test case to the existing harness.

The normal way to test this is inject a pre/post install script fault -- but the
cross install process protects against that already.

I can't think of any way to trigger the fault in an automated fashion (cause a
failure during install vs during transaction config)

--Mark

> Herv¨¦
> 
>> Le 9 juin 2016 ¨¤ 00:05, Mark Hatle <mark.hatle@windriver.com> a ¨¦crit :
>>
>>> On 6/8/16 10:43 AM, Klauer, Daniel wrote:
>>> Hello,
>>>
>>>> You also need to add another check just before raising the error, or you
>>>> would end up getting an "unknown error" raised there.
>>>> I basically replaced:
>>>> -        if (probs is not None) and (not retry):
>>>> +       if (probs is not None) and ((len(probs) != 0) or not
>>>> sysconf.has("attempt-install", soft=True)) and (not retry):
>>>
>>> Hmm, it sounds like the attempt mode wants to ignore installation failures
>>> (empty problems list) like before the patch, which makes sense to me. Afterall,
>>> attempt mode wants to try installation and ignore failures. So it seems good to
>>> fix this regression too.
>>>
>>> However, I wonder why it never ignored a non-empty problems list, which would
>>> also trigger an error. Maybe that case just never happens in practice, because
>>> it's always just file conflicts. Those trigger a retry, which prevents the error
>>> from being raised.
>>>
>>>> BUT reflecting on the whole scheme, I'm wondering how it will work in case
>>>> of file found conflict, since the problem package gets removed from the
>>>> list, but the list is committed again, with most packages already
>>>> installed...
>>
>> File conflicts are discovered prior to the transaction being committed
>> (installation time).  Problems reported during installation are 'different' (and
>> generally do not happen).  I'm not sure if a pre/post install failure, bad
>> package (signature or otherwise) or whatever would do here.  I'm not sure it's
>> been tested.
>>
>> (The items above can't generally happen based on the way the system is designed..)
>>
>> --Mark
>>
>>>> I therefore wonder that there could be the same error that I got in the end,
>>>> i.e failing with package already installed - which should not fail for
>>>> attempt only.
>>>
>>> Indeed, I'm curious about that too...
>>>
>>> If you could put together the patch, that would be great and fine with me.
>>>
>>> Thanks,
>>> Daniel
>>>
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


