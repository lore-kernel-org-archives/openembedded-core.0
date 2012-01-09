Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RkIAf-0005ah-Jh
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 17:34:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q09GQbMQ025059
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jan 2012 08:26:37 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Jan 2012 08:26:37 -0800
Message-ID: <4F0B153D.4000602@windriver.com>
Date: Mon, 9 Jan 2012 10:26:37 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
	<1326096548.3234.3.camel@lenovo.internal.reciva.com>
In-Reply-To: <1326096548.3234.3.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Mon, 09 Jan 2012 16:34:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/12 2:09 AM, Phil Blundell wrote:
> You could take a look at the busybox-config.inc stuff in oe-classic as a
> starting point.  It doesn't do PACKAGECONFIG (since oe-classic doesn't
> have that) but it can do the equivalent with DISTRO_FEATURES.

At Wind River we've discussed using the kernel configuration fragment patching 
process as a way to control busybox.  This would allow the recipe to provide a 
default fragment (configuration), with machines, architectures, and other 
configurations providing additional fragments -- that together would produce the 
busybox that the end use wants.

I think this is a better long term approach then hacking the defconfig file each 
time it's not quite right for a system.  (We may still need to modify it over 
time, but the modifications need to be considered "generic" based on the use of 
busybox in say core-image-minimal...)

--Mark

> p.
>
> On Mon, 2012-01-09 at 05:08 +0000, McClintock Matthew-B29882 wrote:
>> Is anyone working on more fine grained control of busybox? Some ideas include:
>>
>> 1) configure via PACKAGECONFIG?
>>
>> 2) supply a defconfig for busybox?
>>
>> 3) multiple busybox recipes?
>>
>> -M
>>
>> On Sun, Jan 8, 2012 at 6:03 PM, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>>
>>> Enable 64-bit math support in the expr applet. This will make
>>> the applet slightly larger, but will allow computation with very
>>> large numbers.
>>>
>>> [YOCTO #1767]
>>>
>>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>>> ---
>>>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>>> index 1990f28..ebd751d 100644
>>> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>>> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>>> @@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=y
>>>   # CONFIG_EXPAND is not set
>>>   # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
>>>   CONFIG_EXPR=y
>>> -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
>>> +CONFIG_EXPR_MATH_SUPPORT_64=y
>>>   CONFIG_FALSE=y
>>>   # CONFIG_FOLD is not set
>>>   # CONFIG_FSYNC is not set
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



