Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QF0Ve-0007cF-QY
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 10:54:12 +0200
Received: by fxm19 with SMTP id 19so1133303fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=1CKIQ+oYRqfpm59sB2GeBZ/uCG5aDKbdz/NaFHFb/AM=;
	b=tA6XiyWlH5WqloUjbmUKCDWYLE9Tu2H2LDScGhZUu9alEq6OmKEl9HPHm+SzS5WgEY
	CLrtavR++hk1QhNZVIUk1EnrD5YbAyWwpAhFyXxZBkfhZ6wt6Q+CQq8ZPdeO/ip+n3mn
	y1Eog08x4Zel8xqzLxFUejEjkm67GrRvefKWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=xg3zM/2XvBJDvR6tr5j6BBZoWWZnz+5HjN6wIiSSN4W4mmqKhxxVzZiYe+OrUgiwR4
	ZGZw6xgg3jNZGjK2+OeAftxb5VwaGlpLUvp/diGYAzg5FeWzJFzEK6rbJ2LmE39bsc37
	diBejV076TOK4N6kq1lS65HEggBe1+DYmFI/E=
Received: by 10.223.27.14 with SMTP id g14mr1528798fac.129.1303894300398; Wed,
	27 Apr 2011 01:51:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.14 with HTTP; Wed, 27 Apr 2011 01:47:00 -0700 (PDT)
In-Reply-To: <BANLkTikFic0tCbDWFMwP3HxmjvhF+KOrEQ@mail.gmail.com>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
	<ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
	<1301581599.24596.106.camel@rex> <20110404183138.GA30816@jama.jama.net>
	<20110418055406.GH25122@jama.jama.net> <1303109834.5518.57.camel@rex>
	<BANLkTikFic0tCbDWFMwP3HxmjvhF+KOrEQ@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Wed, 27 Apr 2011 10:47:00 +0200
Message-ID: <BANLkTinDSgqbOjvZhpfH9AKc-Vbt+P+GSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 27 Apr 2011 08:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

[usually not answering myself, but:]

The culprit is:
 * distutils.bbclass tries to make python recognize staged libs by
setting STAGING_LIBDIR (correct)
 * distutils recognizes STAGING_LIBDIR and tries to load
python<pyver>/config/Makefile (correct?)
 * since this contains the Makefile that is installed on the target
this brings in -L/usr/lib (obivously not correct)

Without patching the distutils package this leaves us with patching
the Makefile for the target, after packaging it for the target. This
could be done using  SYSROOT_PREPROCESS_FUNCS?

Any comments?

-Michael

2011/4/27 Michael Lippautz <michael.lippautz@gmail.com>:
>> This isn't a libtool problem, we've patched that problem out in oe-core
>> (and I think in OE-dev too now). In this case something is adding
>> "-L/usr/lib" to the compiler arguments and that is the reason things are
>> failing. I'd suggesting finding out where that is coming from and fixing
>> it at source.
>>
> Right.
>
> I also noticed this behaviour and started to look after the cause. It
> seems that distutils somehow grabs the target (python configured)
> Makefile instead of the staging one.
>
> Start of the trouble seems to be [1] where LIBDIR should point into
> staging but is reported to be -L/usr/lib from sysconfig.
>
> Maybe someone with more experience on python staging that can follow up.
>
> Regards,
> Michael
>
> [1] https://bitbucket.org/carljm/python-distutils/src/48c42eeaee44/command/build_ext.py#cl-286
>


