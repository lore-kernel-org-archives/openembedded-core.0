Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SoDs2-0000ot-IA
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 15:19:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69D8BiQ011939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 06:08:11 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 9 Jul 2012 06:08:11 -0700
Message-ID: <4FFAD7C2.5040309@windriver.com>
Date: Mon, 9 Jul 2012 08:08:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1341601764.git.mark.hatle@windriver.com>
	<ba80d76cae689a4023327da4e38a83e1c5c88306.1341601764.git.mark.hatle@windriver.com>
	<1341830385.8066.8.camel@ted>
In-Reply-To: <1341830385.8066.8.camel@ted>
Subject: Re: [PATCH 2/3] multilib: Enable multilib remapping for SDK generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 13:19:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/12 5:39 AM, Richard Purdie wrote:
> On Fri, 2012-07-06 at 14:14 -0500, Mark Hatle wrote:
>> Enable the remapping for SDK generation, this is required to be able to
>> create an SDK that targets an alternative multilib.  Note, this work does
>> not finish SDK/multilib support, but it is one more step toward making
>> it work properly.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/multilib.bbclass |    6 ++++++
>>   1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
>> index f3e7618..b92a3ff 100644
>> --- a/meta/classes/multilib.bbclass
>> +++ b/meta/classes/multilib.bbclass
>> @@ -54,6 +54,12 @@ python __anonymous () {
>>           d.setVar("LINGUAS_INSTALL", "")
>>           # FIXME, we need to map this to something, not delete it!
>>           d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
>> +
>> +    if bb.data.inherits_class('populate_sdk_base', d):
>> +        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
>> +        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY")
>> +
>> +    if bb.data.inherits_class('image', d) or bb.data.inherits_class('populate_sdk_base', d):
>>           return
>>
>
> There is something odd going on with this patch. You've removed the
> earlier return but this patch doesn't show that...

I didn't remove it, I 'moved' it later.  Otherwise the populate_sdk_base case is 
never run, when the image case has already been loaded.

So the flow goes from:

if image class:
   do work
   return

do other stuff

to

if image class:
   do work

if sdk class:
   do other work

if either image or sdk class:
   return

do other stuff

The behavior is the same for the image only class, the only new behavior is 
adding in the remap for the SDK only (or combined w/ the image) case.

--Mark

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




