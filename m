Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SwFX1-0005nS-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 18:42:51 +0200
Received: by qcad10 with SMTP id d10so3667617qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/3ELZqnnhcXSrXGt4XKxkcxUptBoaq2hkgq3+9gNzX4=;
	b=rF+fY/JtoX1fTUhbFmHqQa0vOq2LXihBPXBT7rHsGcmAtrwcil5moW84L/Ap2mQgPT
	waonOKoCv7t8H8xtCaKgnwsWu4DQxGuaO37YqKthcpoKgUaC4l8sqt5BGB41EzvT4C7q
	f2fqXMazfFkBSynI/OiSRTQtrRJlNBb7ZvtgQJnzY9SZxkdjxh59Do3kNyj9NlN+JX1s
	JV1nEjXhSug5avYk9tNVom7WxwxGT9Q1WGVVEIq0Gv2va9D8gYV92MEqkYenHSIWwaIa
	Mj+2R3+2dz+cvXftWlIOLnO2oB29lBf0VTyYwUP1wZ0k3UKc9Mk5RsdgQ7bXEOPDwksN
	hieQ==
MIME-Version: 1.0
Received: by 10.224.216.7 with SMTP id hg7mr30560024qab.3.1343752273871; Tue,
	31 Jul 2012 09:31:13 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 31 Jul 2012 09:31:13 -0700 (PDT)
In-Reply-To: <50180584.4030305@linux.intel.com>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
	<CADkTA4MGir+Ag=PnP2hLE941vQMNnKQRs2NRvj1NUW4c9CaB4Q@mail.gmail.com>
	<50180584.4030305@linux.intel.com>
Date: Tue, 31 Jul 2012 12:31:13 -0400
Message-ID: <CADkTA4O4c=F8FR67adWZyiZ5kOAqbB7bmjRMCsGEctgiwYK_FA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
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
X-List-Received-Date: Tue, 31 Jul 2012 16:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 31, 2012 at 12:19 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 07/31/2012 08:16 AM, Bruce Ashfield wrote:
>> On Tue, Jul 31, 2012 at 11:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> asm/unistd.h includes asm/unistd_64.h on x86_64
>>> and asm/unistd_32.h on i386 but these files are
>>> generated files in 3.4 and when we do 'make clean' they get
>>> deleted and it shows up as an error when building
>>> external modules. May be its a 3.4 kernel bug may be not
>>> but make clean should have left the tree in
>>> a shape to build modules but it does not.
>>>
>>> Probably we should run make modules_prepare after having
>>> run make clean.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/classes/kernel.bbclass |    2 ++
>>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index b19ed4c..4ac3d48 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -197,6 +197,8 @@ kernel_do_install() {
>>>         if [ -f include/generated/bounds.h ]; then
>>>                 cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>>>         fi
>>> +       mkdir -p $kerneldir/arch/${ARCH}/include/generated/
>>> +       cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
>>
>> If we take the blanket protection, we should be able to drop the
>> bounds.h specific
>> case a the same time .. right ?
>
> No, different dirs (one is ARCH)

Aha. I missed that, but can we back up a directory and take everything from
generated/* ? .. assuming your question about binaries being in those
directory is "no".

Cheers,

Bruce

>
>>
>> I'm ok with this, but I can run a test with 'make modules_prepare'
>> being run if you
>> already haven't.
>
> We really can't, this builds scripts, which we don't want as this
> results in native binaries being installed on the target :(
>
> We need some cross-build-system-friendly make targets for this.
>
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>>         # Remove the following binaries which cause strip or arch QA errors
>>>         # during do_package for cross-compiled platforms
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


