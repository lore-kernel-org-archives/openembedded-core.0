Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SwcLT-0000HL-Bm
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 19:04:27 +0200
Received: by qaat11 with SMTP id t11so763667qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Lq/MCkX1Z1glcMfgGIO32G9aC4WG9+ZVK0qG/ttCX9c=;
	b=cNF9j/Ln6dnIXsDO9UPg/YKLHkGLcpP/fYHQAAGuyQLOPxeC5xyTc4FMNzoBg3kEwm
	TWkJceTA9NT6NQCewDuQ1OjOxeEqpDO6jt7iCHUqQQ0PUmSYJvUyRZipNwxSMrjzdlWV
	hkjyxq32CuA1KL6qqji+kQsrhjHV1ET+ofdtueT/mCKcTDAKHmeB5J5psYrQYtaFOuq3
	4oTbZBenE9cipzHyK6mqQDbSz/FDNU12JGec22WA402hHOA8tVnSye8/k7zVAvwqs4jq
	74dv/OFPGG32IQTqKAZe0HtEFIN99ubfwIHcZTI/GxWLz0SL2eQoKLkSbkvHX49yB+1W
	PY2w==
MIME-Version: 1.0
Received: by 10.224.106.138 with SMTP id x10mr37541763qao.1.1343839968420;
	Wed, 01 Aug 2012 09:52:48 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 1 Aug 2012 09:52:48 -0700 (PDT)
In-Reply-To: <50195E2C.1090706@linux.intel.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com> <50195E2C.1090706@linux.intel.com>
Date: Wed, 1 Aug 2012 12:52:48 -0400
Message-ID: <CADkTA4MMKA9H2PUCXBoXNPRnrOGa0iN_zGaLV4FXJ6FiMzzL1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: static busybox?
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
X-List-Received-Date: Wed, 01 Aug 2012 17:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 12:49 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 08/01/2012 09:36 AM, Mark Hatle wrote:
>> On 8/1/12 11:21 AM, Stuart Yoder wrote:
>>> On Tue, Jul 31, 2012 at 3:07 PM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> wrote:
>>>> On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>>>>>
>>>>>> We are doing some work with LXC (containers) and one of the templates
>>>>>> is for busybox.  For LXC, the busybox package needs to be built statically
>>>>>> and
>>>>>> there is a config option for this.
>>>>>>
>>>>>> A couple possible approaches:
>>>>>>
>>>>>>      -create a new 'busybox_static' recipe that the lxc package
>>>>>>       depends on that turns on the needed build options.   Pretty
>>>>>>       straightforward, but now there are 2 variants of the busybox
>>>>>>       package.
>>>>>>
>>>>>>      -somehow propagate some configuration options through to
>>>>>>       the standard busybox recipe so it turns on the config
>>>>>>       option to build things statically.   Not sure how to
>>>>>>       do this, and seems like it could get pretty messy.
>>>>>>
>>>>>> Any thoughts?
>>>>>
>>>>>
>>>>> We've been talking about this as well..  I'm currently of the opinion that
>>>>> the kernel's config fragement processing be added to busybox.  This way
>>>>> someone can simply add a configuration fragment via a bbappend, or other
>>>>> approach and it'll pick it up.   That same can be used to specify how to
>>>>> enable other optional pieces of busybox.
>>>>
>>>> merge_config.pl can be yanked out of the kernel source tree (it's upstream) and
>>>> packaged as something for use by busy box.
>>>>
>>>> I wouldn't recommend all the scaffolding that the kernel has (it's
>>>> overkill, since
>>>> there are more configs, patches and git manipulations in play for the
>>>> kernel), but a\
>>>> simple scheme to collect the fragments from the SRC_URI and fire them through
>>>> merge_config.pl would be a pretty simple python routine.
>>>
>>> So how would this work from the user's point of view?   I somehow
>>> need to get busybox's CONFIG_STATIC config option set.   Does the lxc
>>> recipe somehow
>>> specify this?   Or does the lxc recipe reference a busybox-static
>>> dependency that sets the option?
>>
>> You would be able to add a .bbappend that would have a configuration fragment in
>> it.  This fragment would be added to the busybox configuration to override any
>> built in items.
>>
>> So you'd need to simply have a file that says:
>>
>> CONFIG_STATIC = y
>
> Exactly.
>
> And merge_config is a .sh, no perl required :-)

.. details, details ;)

Bruce

>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


