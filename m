Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id CEF9D60017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 14:47:13 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so1174574ieb.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=es24JAMz1+LHvKQ8japrzReRSCL+kaE2Hj/FOU48Gyc=;
	b=seeCSZwXDZfiveOQ4Io97bE7sW0OFKc0u3Y7RHteM/NXHo6JA9zpYa8jWw+QbRr72q
	1+MMhr9TurNQ4pUneT8aOLylYmK0Px5S38JjdDrINAsw8AuKUE43czZtObFWEU8e9M0+
	fa1HEp8+VqV+98GVAicZXlpANaGzjNoBAhO3S6EeCmn2eI3cXDIYizGow81cYI0LBxFv
	ICem2wRr0ElKINku4JzuGv7eviGC6b2ilEXs0UWKhWAJQ5PvPrgkw1PfZRsuLOHENI+C
	YhYQKCN/M5NY5eh0mn4jME5GaYabNWZDF5hlZXcxZgBsDnTE75FJzvuDjDiiBlLvoKl3
	+MNA==
MIME-Version: 1.0
X-Received: by 10.42.82.6 with SMTP id b6mr6089928icl.51.1407250034689; Tue,
	05 Aug 2014 07:47:14 -0700 (PDT)
Received: by 10.50.126.103 with HTTP; Tue, 5 Aug 2014 07:47:14 -0700 (PDT)
In-Reply-To: <53E0A45C.4070507@pabigot.com>
References: <53DF9F25.1060404@pabigot.com> <20140804223948.GC11951@haswell>
	<53E0A45C.4070507@pabigot.com>
Date: Tue, 5 Aug 2014 07:47:14 -0700
Message-ID: <CAMKF1sqOf9mcRkwyfktXxZQ9SHLMLxb6zp2StvLjeCmbHGFGOw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: blocking pie in recipes that build shared object files
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
X-List-Received-Date: Tue, 05 Aug 2014 14:47:17 -0000
Content-Type: multipart/alternative; boundary=485b397dd7016d8a9004ffe2ee77

--485b397dd7016d8a9004ffe2ee77
Content-Type: text/plain; charset=UTF-8

On Tuesday, August 5, 2014, Peter A. Bigot <pab@pabigot.com> wrote:

> On 08/04/2014 05:39 PM, Khem Raj wrote:
>
>> On 14-08-04 09:56:37, Peter A. Bigot wrote:
>>
>>> I've now hit two recipes in meta-openembedded that fail on armv7-a
>>> because
>>> SECURITY_CFLAGS has -pie as an option that leaks into a link command
>>> building a shared object file.  This produces:
>>>
>>> |
>>> /prj/oe/omap/build-beaglebone-master/tmp/sysroots/
>>> beaglebone/usr/lib/Scrt1.o:
>>> In function `_start':
>>> | /prj/oe/omap/build-beaglebone-master/tmp/work/cortexa8hf-
>>> vfp-neon-poky-linux-gnueabi/eglibc/2.19-r0/eglibc-2.19/
>>> libc/csu/../ports/sysdeps/arm/start.S:128:
>>> undefined reference to `main'
>>> | collect2: error: ld returned 1 exit status
>>> | error: command 'arm-poky-linux-gnueabi-gcc' failed with exit status 1
>>>
>>> In openembedded-core meta/conf/distro/include/security_flags.inc
>>> provides a
>>> bunch of package-specific overrides to use SECURITY_NO_PIE_CFLAGS for
>>> this
>>> sort of package.
>>>
>>> It's not clear to me how that should be accomplished for recipes that are
>>> not part of openembedded-core.  For
>>> http://patches.openembedded.org/patch/77165/ for python-smbus in
>>> meta-python
>>> I chose to override it in the bb file.
>>>
>>> What is the best-practices solution to this problem?
>>>
>> may be add SECURITY_CFLAGS_pn-blah = "${SECURITY_NO_PIE_CFLAGS}"
>> to layer.conf of given layer where recipe resides
>>
>
> Could do that.  Is there precedent?


Don't think so. But you can compare to things like how package blacklisting
is done in meta-OE.

>
> Looking into this more, the reason I'm hitting this is I'm using
> DISTRO=poky-lsb, which gives me oe-core's conf/distro/include/security_flags.inc
> automatically.
>
> Now that I know more I'm uncomfortable about putting a distro-specific
> workaround in each recipe patch I submit, and more uncomfortable about
> creating new precedent by putting distro-specific workarounds in layer.conf
> files. Updates to python-smbus in meta-python and rrdtool in meta-oe are
> affected by this, plus the 42 package exceptions already listed in
> security_flags.inc.
>
>
I don't think it's so distro related. Security flags is a general OE
feature.  So layers have to deal with it in distro independent way and IMO
it's best place to dictate what recipes in a given layer can support, you
can also add this to recipe itself and if numbers of recipes to deal with
are less. It's similar to blacklisting feature.

I'm going to stop using poky-lsb for now to hide the problem, but for the
> future we need guidance on how to make recipes/layers compatible with
> distros that want to enable security_flags.inc.


> Peter
>

--485b397dd7016d8a9004ffe2ee77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, August 5, 2014, Peter A. Bigot &lt;<a href=3D"mailto:pa=
b@pabigot.com">pab@pabigot.com</a>&gt; wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
On 08/04/2014 05:39 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 14-08-04 09:56:37, Peter A. Bigot wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;ve now hit two recipes in meta-openembedded that fail on armv7-a beca=
use<br>
SECURITY_CFLAGS has -pie as an option that leaks into a link command<br>
building a shared object file. =C2=A0This produces:<br>
<br>
|<br>
/prj/oe/omap/build-beaglebone-<u></u>master/tmp/sysroots/<u></u>beaglebone/=
usr/lib/Scrt1.o:<br>
In function `_start&#39;:<br>
| /prj/oe/omap/build-beaglebone-<u></u>master/tmp/work/cortexa8hf-<u></u>vf=
p-neon-poky-linux-gnueabi/<u></u>eglibc/2.19-r0/eglibc-2.19/<u></u>libc/csu=
/../ports/sysdeps/arm/<u></u>start.S:128:<br>
undefined reference to `main&#39;<br>
| collect2: error: ld returned 1 exit status<br>
| error: command &#39;arm-poky-linux-gnueabi-gcc&#39; failed with exit stat=
us 1<br>
<br>
In openembedded-core meta/conf/distro/include/<u></u>security_flags.inc pro=
vides a<br>
bunch of package-specific overrides to use SECURITY_NO_PIE_CFLAGS for this<=
br>
sort of package.<br>
<br>
It&#39;s not clear to me how that should be accomplished for recipes that a=
re<br>
not part of openembedded-core. =C2=A0For<br>
<a href=3D"http://patches.openembedded.org/patch/77165/" target=3D"_blank">=
http://patches.openembedded.<u></u>org/patch/77165/</a> for python-smbus in=
 meta-python<br>
I chose to override it in the bb file.<br>
<br>
What is the best-practices solution to this problem?<br>
</blockquote>
may be add SECURITY_CFLAGS_pn-blah =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot=
;<br>
to layer.conf of given layer where recipe resides<br>
</blockquote>
<br>
Could do that. =C2=A0Is there precedent?</blockquote><div><br></div><div>Do=
n&#39;t think so.=C2=A0But you can compare to things like how package black=
listing is done in meta-OE.</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Looking into this more, the reason I&#39;m hitting this is I&#39;m using DI=
STRO=3Dpoky-lsb, which gives me oe-core&#39;s conf/distro/include/security_=
<u></u>flags.inc automatically.<br>
<br>
Now that I know more I&#39;m uncomfortable about putting a distro-specific =
workaround in each recipe patch I submit, and more uncomfortable about crea=
ting new precedent by putting distro-specific workarounds in layer.conf fil=
es. Updates to python-smbus in meta-python and rrdtool in meta-oe are affec=
ted by this, plus the 42 package exceptions already listed in security_flag=
s.inc.<br>

<br></blockquote><div><br></div><div>I don&#39;t think it&#39;s so distro r=
elated. Security flags is a general OE feature.=C2=A0=C2=A0So layers have t=
o deal with it in distro independent way and IMO it&#39;s best place to dic=
tate what recipes in a given layer can support, you can also add this to re=
cipe itself and if numbers of recipes to deal with are less. It&#39;s simil=
ar to blacklisting feature.=C2=A0</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
I&#39;m going to stop using poky-lsb for now to hide the problem, but for t=
he future we need guidance on how to make recipes/layers compatible with di=
stros that want to enable security_flags.inc.=C2=A0</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">

<br>
Peter<br>
</blockquote>

--485b397dd7016d8a9004ffe2ee77--
