Received: from mail-la0-f52.google.com ([209.85.215.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UUJTW-0000zB-L4
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 18:20:18 +0200
Received: by mail-la0-f52.google.com with SMTP id fd20so1716598lab.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=povz42dbOjWImmLHk+IH/cO2lGTK8nHvpEMaz+JboNM=;
	b=qFZ0Yw6iUGkwRLu14/jJ4eG7WD/DSIt6nE0v/Z2HoTHB+i/+jzwgsUWJgSY8ppuBmT
	VjP6bp7n1V8Bd+d9MY7hPtZqjnQVJQw5A0clTUfoydmQzb+3xBnfifL2SjnfDd4ybhg6
	s+ugLHBl1SWG7i0nfC5JW009KlFaKgvTptmtDKa1Z4/5GMezE7IkrZ05OpltzGmDJJEF
	535QUWoq997jP220jdf1jOQs+h292CsqrOMSIxwvn3leXV9DNbf0yXxxx1N2BjI4bT8k
	BEDgG/kY/gMJjBhEdWBaoyXBZSz86rkMIXB+NlajY2uYQG9VrSpodGtZA2zPceYoNmN9
	kPeA==
MIME-Version: 1.0
X-Received: by 10.112.161.38 with SMTP id xp6mr13518499lbb.32.1366646559232;
	Mon, 22 Apr 2013 09:02:39 -0700 (PDT)
Received: by 10.112.131.228 with HTTP; Mon, 22 Apr 2013 09:02:39 -0700 (PDT)
In-Reply-To: <CADkTA4ORJX1i2jsnULdTp3ju_j56hYZ+AVtQXh6=pZLwUJbi4w@mail.gmail.com>
References: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
	<CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
	<CADV-EXFMz=FZq5Y25gf-eKi8JZTwXk78LNhZP+DHVFAeQN5y5Q@mail.gmail.com>
	<CADkTA4ORJX1i2jsnULdTp3ju_j56hYZ+AVtQXh6=pZLwUJbi4w@mail.gmail.com>
Date: Mon, 22 Apr 2013 18:02:39 +0200
Message-ID: <CAAQYJAtZ0bJG1Ez0oqogd-sucDeEV7fYx8TWFZp6QxSRvZe+OQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Embed initramfs into kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 16:20:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 5:06 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Apr 22, 2013 at 10:11 AM, Yevhen Kyriukha <kirgene@gmail.com> wro=
te:
>> Thanks!
>>
>> I was trying to build the kernel and I got the following error:
>> Aborted dependency loops search after 10 matches.
>>
>> I copied core-image-minimal-initramfs and changed IMAGE_INSTALL:
>> IMAGE_INSTALL =3D "initramfs-live-boot busybox udev base-passwd".
>> Also I added
>> INITRAMFS_IMAGE =3D "custom-initramfs"
>> to my kernel recipe.
>>
>> As far as I understand initramfs image depends on the kernel that depend=
s on
>> initramfs image.

Assuming the custom-kernel you're building will not be the one in
rootfs you're almost there... now explicitely remove the extra
dependencies of your initramfs image

# avoid circular dependencies
EXTRA_IMAGEDEPENDS =3D ""

Note that you'll have then to hack around the "ERROR: Multiple .bb
files are due to be built which each provide virtual/kernel"

See for an example   http://kexecboot.org/documentation/crosscompiling/oe-y=
octo

>
> Correct. That's something that commonly happens in my experience. You can=
't have
> anything in your dependency chain that causes that circular depend .. whi=
ch is
> what the boot tasks will pull in.
>
> We are working to enhance / fix this in yocto 1.5, but for now, that
> is the restriction.
>
> Have you looked at: classes/image-live.bbclass ? Which is a current user =
of
> core-image-minimal-initramfs and gets around the circular dependency prob=
lem.
>
> Cheers,
>
> Bruce

On the other side, this way you'll end up embedding the custom-kernel
in the rootfs.
Pls note here INITRD_IMAGE and INITRD are used instead of INITRAMFS_IMAGE.

Cheers

Andrea


>
>>
>>
>> Best regards,
>> Yevhen
>>
>>
>> 2013/4/22 Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha <kirgene@gmail.com>
>>> wrote:
>>> > Hi!
>>> >
>>> > I have a custom kernel recipe and initramfs image recipe.
>>> > How can I embed initramfs into kernel?
>>> > Is there any example available?
>>>
>>> The support is in oe-core, so checking the yocto docs is a good startin=
g
>>> point:
>>>
>>> http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
>>>
>>> And in particular:
>>>
>>> "core-image-minimal-initramfs: A core-image-minimal image that has the
>>> Minimal RAM-based Initial Root Filesystem (initramfs) as part of the
>>> kernel, which allows the system to find the first =93init=94 program mo=
re
>>> efficiently."
>>>
>>> There is also meta-initramfs:
>>>
>>> https://github.com/openembedded/meta-oe/tree/master/meta-initramfs
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>> >
>>> > Best regards,
>>> > Yevhen
>>> >
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>> >
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


