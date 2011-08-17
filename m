Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtiUP-0006P5-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 17:57:10 +0200
Received: by ywe9 with SMTP id 9so832778ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=h3UuAujXCxbq6DCSq95tNQCf5LXwV5yokrhDh8Vl4WU=;
	b=nDmhJKI9mNDmz+ltm3ZXN7EoYcXy0tpW80Jo5I1Ao/sB3d5gpq4IbEqaUxIJfLJAeV
	eNubT95xKnXoL/HYi9c5Ei0NLZszEL+t/fMNWNnftdpBNp5ykrtL0T1C484bBQ5pB8aT
	+QjzhxJ3Q+hBS2oY6ywyMBjBos0Wu9kdJ5cwg=
Received: by 10.142.59.21 with SMTP id h21mr527006wfa.404.1313596349077; Wed,
	17 Aug 2011 08:52:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Wed, 17 Aug 2011 08:51:59 -0700 (PDT)
In-Reply-To: <1312495226.3169.8.camel@lenovo.internal.reciva.com>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
	<1312495226.3169.8.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2011 08:51:59 -0700
Message-ID: <CAMKF1sqtyWZH8kJ3BdfAGtEK-8euhjXtsGDP_5WsHG05VRhqLA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Wed, 17 Aug 2011 15:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 3:00 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-08-03 at 08:19 +0200, Koen Kooi wrote:
>> Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
>>
>> > It does look a bit weird. =C2=A0That code was introduced in 561d8754,
>> > ostensibly as a merger of the eglibc and glibc equivalents. =C2=A0But,=
 the
>> > original code from glibc-package.bbclass did:
>> >
>> > =C2=A0 =C2=A0 =C2=A0 def output_locale_binary_rdepends(name, pkgname, =
locale, encoding):
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match("(.*)\=
.(.*)", name)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 glibc_name =3D "%s.%s" % (m.group(1), m.group(2).lower().replace("-"=
,""))
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 glibc_name =3D name
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('RDEPE=
NDS_%s' % pkgname, legitimize_package_name('glibc-binary-localedata-%s' % g=
libc_name), d)
>> >
>> > ... i.e. it was using the "." separator both for splitting and joining=
,
>> > which seems reasonable. =C2=A0But somehow when it showed up in
>> > libc-package.bbclass it had gotten transmogrified so that it split on
>> > "_" but joined with "." as you showed below. =C2=A0That seems bogus to=
 me.
>
> I'm not sure whether your original locale problem is still an issue, but
> I am still fairly convinced that the change to the regex in the code
> above was incorrect. =C2=A0Unless the author of 561d8754 wants to speak u=
p in
> its defence soon, I will submit a patch to change it back to using ".".

yes I think that would be right thing to do. Will you submit a patch please=
 ?

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


