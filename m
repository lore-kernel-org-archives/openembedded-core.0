Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F47561222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 15:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7GFNM53002596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 08:23:22 -0700 (PDT)
Received: from [147.11.152.84] (147.11.152.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 16 Aug 2013 08:23:22 -0700
Message-ID: <520E43E9.7040801@windriver.com>
Date: Fri, 16 Aug 2013 08:23:21 -0700
From: Yang Shi <yang.shi@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1376498514-23057-1-git-send-email-yang.shi@windriver.com>
	<1376498514-23057-2-git-send-email-yang.shi@windriver.com>
	<1376503856.12272.217.camel@dvhart-mobl4.amr.corp.intel.com>
	<520BCDE4.3010307@windriver.com>
In-Reply-To: <520BCDE4.3010307@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "hello-mod: Ensure the produced package name begins with kernel-module-"
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
X-List-Received-Date: Fri, 16 Aug 2013 15:23:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2013 11:35 AM, Mark Hatle wrote:
> On 8/14/13 1:10 PM, Darren Hart wrote:
>> On Wed, 2013-08-14 at 09:41 -0700, Yang Shi wrote:
>>> [YOCTO #4286]
>>>
>>> The package runtime mapping rename issue is already fixed by
>>> commit 0bc564af07c1bae8112f834a60aea3b72af7de13, the 
>>> "kernel-module-" workaround
>>> is not necessary anymore for out-of-tree module package, so revert 
>>> that commit.
>>>
>>> This reverts commit 71aafc214fe407b7620e747c11dfb8326c867b1c.
>>>
>>
>> Is runtime mapping rename the right solution to this? I don't have any
>> experience with it, I'm not objecting, just asking the question. Is
>> runtime mapping rename a catchall for things that don't do the right
>> thing in the first place, or is it the preferred mechanism?
>
> There we two patches that went into the main oe-core that make this 
> change no longer relevant.  The first is a change 
> 51928b6b5ca0a46a9dcd754483a19af58b95fa18, by Martin Jansa.  This 
> automatically adds the kernel-module- prefix to kernel module packages.
>
> The second was the recent commit 
> 0bc564af07c1bae8112f834a60aea3b72af7de13 that allowed this change to 
> work in a multilib environment.  To keep the example being as 'clean' 
> as possible, we want to revert the workaround as it is no longer needed.
>
>> My uninformed initial reaction is that it makes more sense to be
>> explicit with this sort of thing so people can know what to expect as
>> the output from recipes like this without having to track down what the
>> runtime mapping rename will do to the package output.
>
> The initial bug and feature request was that users creating packages 
> that provide kernel-modules shouldn't have to know they need 
> 'kernel-module-' in the name.  (Without that there are numerous QA and 
> other checks that fail, some in ways that make it hard to figure out 
> what went wrong.)
>
>> As things stand now, I can see from the hello-mod recipe that the
>> package will be called kernel-module-hello-mod, if we drop this, I would
>> expect it to be hello-mod if I didn't have a deep knowledge of this
>> rename mechanism...
>
> Perhaps the need then is to document that the inherit of the modules 
> bbclass will automatically name module packages w/ kernel-module- as 
> required by the oe-core build environment?

Any further comment on this?

So, per Mark's comment, this workaround makes no sense so we should 
revert it.

Thanks,
Yang

>
>> My 0.02 USD.
>>
>>> Signed-off-by: Yang Shi <yang.shi@windriver.com>
>>> ---
>>>   .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    8 --------
>>>   1 files changed, 0 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb 
>>> b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>>> index 621f700..64a6dda 100644
>>> --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>>> +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
>>> @@ -13,11 +13,3 @@ SRC_URI = "file://Makefile \
>>>             "
>>>
>>>   S = "${WORKDIR}"
>>> -
>>> -# Kernel module packages MUST begin with 'kernel-module-', otherwise
>>> -# multilib image generation can fail.
>>> -#
>>> -# The following line is only necessary if the recipe name does not 
>>> begin
>>> -# with kernel-module-.
>>> -#
>>> -PKG_${PN} = "kernel-module-${PN}"
>>
>
>
>


