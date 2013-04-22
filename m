Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UUIba-0004C6-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 17:24:36 +0200
Received: by mail-la0-f54.google.com with SMTP id es20so1711017lab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=+dDFjl1fE8UiICbHDptO/ho0a1+4LnL6CXP1TwIY6uU=;
	b=R7u0tlKM7sdCoVI63G7vuwq71uLmzkHIk/CTqV+eGxlTIUYQmVSAha5/oYzi4E+2Qx
	WISkP9MCKoO1MR/uX6ZY9+s+Q/GDDOZvChSHW3ziF8s80KZ5ey+8b48AN59CvfiCPLyw
	4Ni5pK18+44X/Z7o3h5Bf1tmYo3B6YRT9hhKr5qEeWdqOddhLYF5BgZ+ulGTvowYtWSt
	TntglZneSJfL7SnloLI5VrUEUOn6uxm2S1CwkDVW7LZ6Oje88x0huUtTCpU7IiN3AePp
	Qx1BtMr9Rxs36J/v6cwtYB8Wj+Dhmk49863AU9/NkzJMESFi7Jxm1TDEO+umeeORP3YW
	DX0g==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr13341780lbb.26.1366643214766; 
	Mon, 22 Apr 2013 08:06:54 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 22 Apr 2013 08:06:54 -0700 (PDT)
In-Reply-To: <CADV-EXFMz=FZq5Y25gf-eKi8JZTwXk78LNhZP+DHVFAeQN5y5Q@mail.gmail.com>
References: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
	<CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
	<CADV-EXFMz=FZq5Y25gf-eKi8JZTwXk78LNhZP+DHVFAeQN5y5Q@mail.gmail.com>
Date: Mon, 22 Apr 2013 11:06:54 -0400
Message-ID: <CADkTA4ORJX1i2jsnULdTp3ju_j56hYZ+AVtQXh6=pZLwUJbi4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 22 Apr 2013 15:24:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 10:11 AM, Yevhen Kyriukha <kirgene@gmail.com> wrote=
:
> Thanks!
>
> I was trying to build the kernel and I got the following error:
> Aborted dependency loops search after 10 matches.
>
> I copied core-image-minimal-initramfs and changed IMAGE_INSTALL:
> IMAGE_INSTALL =3D "initramfs-live-boot busybox udev base-passwd".
> Also I added
> INITRAMFS_IMAGE =3D "custom-initramfs"
> to my kernel recipe.
>
> As far as I understand initramfs image depends on the kernel that depends=
 on
> initramfs image.

Correct. That's something that commonly happens in my experience. You can't=
 have
anything in your dependency chain that causes that circular depend .. which=
 is
what the boot tasks will pull in.

We are working to enhance / fix this in yocto 1.5, but for now, that
is the restriction.

Have you looked at: classes/image-live.bbclass ? Which is a current user of
core-image-minimal-initramfs and gets around the circular dependency proble=
m.

Cheers,

Bruce

>
>
> Best regards,
> Yevhen
>
>
> 2013/4/22 Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha <kirgene@gmail.com>
>> wrote:
>> > Hi!
>> >
>> > I have a custom kernel recipe and initramfs image recipe.
>> > How can I embed initramfs into kernel?
>> > Is there any example available?
>>
>> The support is in oe-core, so checking the yocto docs is a good starting
>> point:
>>
>> http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
>>
>> And in particular:
>>
>> "core-image-minimal-initramfs: A core-image-minimal image that has the
>> Minimal RAM-based Initial Root Filesystem (initramfs) as part of the
>> kernel, which allows the system to find the first =93init=94 program mor=
e
>> efficiently."
>>
>> There is also meta-initramfs:
>>
>> https://github.com/openembedded/meta-oe/tree/master/meta-initramfs
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Best regards,
>> > Yevhen
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


