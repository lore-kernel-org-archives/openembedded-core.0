Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US3Bi-0002rG-B5
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 12:32:34 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so154484eaf.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 03:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zUA1K8W82gH6MNHHdHVVPj5d0pdAYwvlfhWiH8Dym+4=;
	b=dtyAqE2bjCqXZ8Ot9RxQmmpmD87bwqZi//TdMgImH39YGAjg/MJN39bIWXr5cdeNGJ
	V1dAdoOGWLdVYkNlLCRZIDt0ml5S26bkfH7yFD+jF2Qr4IaX6qfwV6JUR+zpnNyimXth
	Sd1qjgPANwwu0zY46rKJVNOfhTsVkV6n7MwEj6uNQQO4psrezL/NPHh8pkhHHrqsK+jz
	gxglW/2fCzHpLlmNjgf6cj50p4NnvJeEMNXRYLeWmkUKca1AjEZ4xrmGr0ykTUfOQqO1
	I8J6jqA5kgzo7iI2l7OU2LkNrBsSzYT+g1xXfdlVvAEmp8pY0i78gfzxkr+jf3MIiW87
	ZzZQ==
X-Received: by 10.15.48.4 with SMTP id g4mr4841941eew.28.1366107304253;
	Tue, 16 Apr 2013 03:15:04 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a2sm1952144eem.11.2013.04.16.03.15.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 03:15:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366106906.8670.93.camel@ted>
Date: Tue, 16 Apr 2013 12:15:02 +0200
Message-Id: <271823C3-DC02-4A98-9C2A-2706220C328D@dominion.thruhere.net>
References: <1366103412-10924-1-git-send-email-koen@dominion.thruhere.net>
	<1366106058.8670.89.camel@ted>
	<EDFD893A-99B8-4C91-86DB-FFD37D78200E@dominion.thruhere.net>
	<1366106906.8670.93.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlKrvt+ODXePZkgc6gJB768PS8lUT3Ob3qSPyOAWxCcjaRfmu/IAgUDZRwW8/zIwcyqwQC8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: add libpng to DEPENDS
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
X-List-Received-Date: Tue, 16 Apr 2013 10:32:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2013, om 12:08 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Tue, 2013-04-16 at 11:59 +0200, Koen Kooi wrote:
>> Op 16 apr. 2013, om 11:54 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Tue, 2013-04-16 at 11:10 +0200, Koen Kooi wrote:
>>>> Pango links indirectly to libpng through the cairo-png dependency, =
but
>>>> does encode the libpng version in its .la files. Changing libpng
>>>> versions will make a rebuild fail, so let's cheat a bit to let =
sstate
>>>> rebuild pango as well to get around this.
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> meta/recipes-graphics/pango/pango.inc | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> This doesn't follow. If pango -> cairo -> libpng and libpng changes,
>>> both cairo and pango will rebuild.
>>=20
>> If it did get rebuilt it still had references to non-existent
>> libpng16  .la in its .la files.
>=20
> Autotools/libtool being broken then, the DEPENDS change might appear =
to
> help but it doesn't, only way to deal with it is either the change =
below
> or to clean the recipe in question.

OK, let's discard this patch :)

>>> What might be the problem is that autotools (or more likely libtool)
>>> isn't rebuilding correctly. This was solved with the separate build
>>> directory code. Have you enabled that?
>>=20
>> Not that I know off. How do I do that?
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta-yocto?id=3D9e366e153=
234114ab3c51e4bb8e3452593f64070
>=20
> It was was made opt in since people didn't want it as the default. =
I've
> made it the default for poky as I believe its a good thing and helps
> cases like this.
>=20
> The only downside is that to change to this you need a clean build
> directory as autotools throws a fit about this change when you re-run
> configure on an existing directory. Nothing we can do about that one,
> its autotools :(.

Thanks, I'll make it the default for angstrom as well.

regards,

Koen=


