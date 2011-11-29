Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVWje-0001LO-P4
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:05:10 +0100
Received: by lagj5 with SMTP id j5so28426lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 14:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=z/ctiT2hDBA+vdvxTISLMKQO0MOfgQZ4IVnlw6xPtsQ=;
	b=eOw0EU2eZW7OwRL8KrsTJbCC+yawqITGZKDacocgRBjqgtRnOLgY9n/gSNui59Z7JR
	UxI4LfXWF1t0YbX+EwIdLUkaSUk6vCHjnnjFDenCm/oM7rNHndzDGGKg3zDxkXrgVmr5
	AAZCHV514haY7ZJUjmKfFFk47Wzm1fl+A/yus=
Received: by 10.152.111.1 with SMTP id ie1mr20383825lab.7.1322607511097; Tue,
	29 Nov 2011 14:58:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 29 Nov 2011 14:58:00 -0800 (PST)
In-Reply-To: <1321908500.3347.4.camel@lenovo.internal.reciva.com>
References: <1321906980-16016-1-git-send-email-raj.khem@gmail.com>
	<1321908500.3347.4.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2011 14:58:00 -0800
Message-ID: <CAMKF1sqeJYheY+9a3XqnO7sSj4B7u-9naj7S9zSa_owixb5Tvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: Unbreak native build when using TCLIBC=uclibc
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
X-List-Received-Date: Tue, 29 Nov 2011 23:05:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 12:48 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-11-21 at 12:23 -0800, Khem Raj wrote:
>> A recent change introduced EXTRA_OECONF_append_libc-uclibc =3D "
>> --with-versioned=3Dno " this change has a side effect when
>> building alsa-lib-native using TCLIBC=3Duclibc the override
>> kicks in uninvited and hence build the native package without symbol
>> version information. This mean libasound.so which is needed by other
>> packages from build host e.g. libSDL.so does not have required symbols
>> and linking with libSDL fails, one such case ends in SDL support
>> in qemu-native being silently disabled.
>>
>> We make sure that override is only enabled for target recipe
>
> This seems like the wrong solution to the problem. =C2=A0Shouldn't you be
> inhibiting the libc-uclibc OVERRIDE at source for native builds
> (assuming the host system isn't using uClibc)?
>
> It also seems as though there ought to be a more generic place to encode
> the knowledge that uClibc doesn't do symbol versioning. =C2=A0Having to h=
ack
> it into EXTRA_OECONF for every recipe seems... suboptimal.
>

I have posted another patch which is broader in impact and solves
these kind of problems
here http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/0=
13375.html

Thanks
-Khem


