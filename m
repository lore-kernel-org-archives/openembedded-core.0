Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8273A6028A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:13:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23KDO1A016734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 12:13:24 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 12:13:23 -0800
Message-ID: <5314E263.3020505@windriver.com>
Date: Mon, 3 Mar 2014 14:13:23 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
	<CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
In-Reply-To: <CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Mon, 03 Mar 2014 20:13:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/14, 12:17 PM, Khem Raj wrote:
> On Mon, Mar 3, 2014 at 6:37 AM, Olof Johansson <olof.johansson@axis.com> wrote:
>> With this change, you can use shell like globbing expressions (as
>> supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
>> This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
>> are supported" with the entry "Debian-7.*".
>
> I dont think its a good thing. We should be strict about it as we are.
> otherwise it can end up
> with bigger problems to save few  typing words

We (and I know other commercial vendors) are already using patches similar to 
this to do exactly the same thing.

I'd hope that a generic mechanism (like this) could be put in place.. and that 
oe-core/Yocto Project would choose -not- to use it for their distributions.  (To 
avoid the exact problems you mention...)

The commercial folks like me can then use it, as we have to deal with the 
problems anyway.

--Mark

>>
>> [YOCTO #5265]
>>
>> Signed-off-by: Olof Johansson <olof.johansson@axis.com>
>> ---
>>   meta/classes/sanity.bbclass | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index bae010d..d79db8f 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -246,6 +246,8 @@ def check_connectivity(d):
>>       return retval
>>
>>   def check_supported_distro(sanity_data):
>> +    from fnmatch import fnmatch
>> +
>>       tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
>>       if not tested_distros:
>>           return
>> @@ -255,12 +257,15 @@ def check_supported_distro(sanity_data):
>>       except Exception:
>>           distro = None
>>
>> -    if distro:
>> -        if distro not in [x.strip() for x in tested_distros.split('\\n')]:
>> -            bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
>> -    else:
>> +    if not distro:
>>           bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
>>
>> +    for supported in [x.strip() for x in tested_distros.split('\\n')]:
>> +        if fnmatch(distro, supported):
>> +            return
>> +
>> +    bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
>> +
>>   # Checks we should only make if MACHINE is set correctly
>>   def check_sanity_validmachine(sanity_data):
>>       messages = ""
>> --
>> 1.8.5.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


