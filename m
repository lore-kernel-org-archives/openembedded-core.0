Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RcVnq-0002u4-TR
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:30:23 +0100
Received: by dake40 with SMTP id e40so2954344dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 21:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kDWJxjrKt0wN5nLkri8EjE2x1H5GkJdM1+Hdf6LYXfk=;
	b=M90QiPIf6lVkzUtCDgL7PvaChbNfNGqpzZuUo0K/En6t0uwsENzdjjtS3kV77SFDQL
	Fdg0P1miRdpbVPQey4fBAex4bzq87O/9UTlh3AN5dFhX3BZo5/XwysTDt1L6aHS1p19x
	24Pwj6+zf7rNrrW6w0NCiEas/193QVuSkXYZY=
MIME-Version: 1.0
Received: by 10.68.74.98 with SMTP id s2mr36815506pbv.46.1324272199076; Sun,
	18 Dec 2011 21:23:19 -0800 (PST)
Received: by 10.143.18.10 with HTTP; Sun, 18 Dec 2011 21:23:19 -0800 (PST)
In-Reply-To: <CAMKF1spq-m3dYd2nNhAH8CrZsvjmQrcoWa8Na8g1zng=DBJTgw@mail.gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
	<FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
	<CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
	<CAMKF1spq-m3dYd2nNhAH8CrZsvjmQrcoWa8Na8g1zng=DBJTgw@mail.gmail.com>
Date: Mon, 19 Dec 2011 00:23:19 -0500
Message-ID: <CADkTA4Oxj9AMymZ0vNBOEYA5YHJOZmhkd9JyfqkqK3643o2JYQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 05:30:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 19, 2011 at 12:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Dec 18, 2011 at 5:39 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Sun, Dec 18, 2011 at 4:19 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 18 dec. 2011, om 21:27 heeft Bruce Ashfield het volgende geschreven:
>>>
>>>> On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>>
>>>>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>>>>>
>>>>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>>>>>> separate task from do_deploy. This way the do_install task can also
>>>>>> benefit from generated uImage.
>>>>>>
>>>>>> The only major feature of oe-core's version (not to recreate uImage
>>>>>> if it exists) is retained in this patch.
>>>>>
>>>>> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.
>>>>
>>>> In that case, shouldn't people doing u-boot development (or other
>>>> non-kernel developers),
>>>> be building a uImage via something that isn't in kernel.bbclass ?
>>>
>
> i think we have UBOOT_ENTRYPOINT, UBOOT_ENTRYSYMBOL and
> UBOOT_LOADADDRESS which are then used to generate the uImage
> and sometimes defaults from kernel build system may not be usable as
> it might be generating the image using some other values and we are not
> able to control the image generation. Now is that fixable in kernel I guess
> it could be but why not have flexibility of generating the image.

I'm all for flexibility (see my comments earlier in the thread), have a variable
or some other construct that specifies how you'd like to construct the uImage
(kernel vs non-kernel, as a basic attempt to differentiate the two).

I'm just driving for the details to see if we can remedy the situation in the
medium to long term, since burying the details of how to construct any sort
of image in multiple places .. is not ideal (but I state the obvious).

Cheers,

Bruce

>
>>> I use the kernel.bbclass in meta-oe, that does what I need.
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


