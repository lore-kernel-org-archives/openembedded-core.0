Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9D34071A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:46:10 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id y123so99989334vka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RG4g2PtPOUNZTrP7kphd8yOXo5jFnDx7k9lQzpIVA10=;
	b=LW4A7lr8qq3rvf2ROebia6TFRquf+VCw2+HruvClE7HJC/zKoaGSv7obEmWFZXIO+j
	+cVJ7wJMVzAH4oMVtnh6FvjJwq+So7+MVM59PxBdOUHTl22hrSFT96PEnMO7B+mcdR/E
	YQxhBqxSR1hb0528rm+IneKoU2vnJ8oQlpWRxHC0B9Bpo8C55xds7gcYX3K3kuT1xvxb
	c+32vbQoNN5ljK70RhEl0tOiyqmD08xJKkxeUZ0DuB5U8Wbhl7k35JlUynUdAOwvfOhi
	f//qv0u9SlpwN33LzP5GlwDa+smAgQNTFuSC3v4GbqB/EAWH60Es5fNjheBQdgtGiK1c
	4VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RG4g2PtPOUNZTrP7kphd8yOXo5jFnDx7k9lQzpIVA10=;
	b=Nda6tQcUa20rTQjSUiaFwuEZoeAcoFwC8eiiLEBTfMJoFXk4k5ZWA6PXeIaYbFImNZ
	d9tfj17Na1X27ptULxJgOPlnoERXN7HE2jGeBp9CihjrTeEayrMSXN/6Jqg9AtO19a28
	XHB5QNpCc5tcS5PR1RqBRqG0Jn234vu3r0eEDrN62JwRMNruaprj9CnHFpPw55bHzqPB
	P16HIYA4E/sG8UVMLI+a5Vgm3AW5gx7sOcCxLxOKgfdViBfMOc9dDwyQ4jC6oKsQ0axF
	ickMInuspir24v/4bHtqCWn6sb1Sk1TLPoBiqoQVfxB1pRnqwISzgNoJRG246g5AFvhm
	YtFA==
X-Gm-Message-State: ABUngvdrQUF93FZour0w9VhRYFcWKAfjMQjEauGoOrkPduN6nZWKfiTwcYNymBWtZTJAP94nz6fpWXfkADfw4X8L
X-Received: by 10.31.128.208 with SMTP id b199mr23011604vkd.117.1477903571987; 
	Mon, 31 Oct 2016 01:46:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.87.91 with HTTP; Mon, 31 Oct 2016 01:45:41 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
References: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 31 Oct 2016 10:45:41 +0200
Message-ID: <CAHiDW_F-h8DuKRv4aMBbB4T+nLUWeRa4o+uSgEBAEunxNpMwZQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: couple questions about proper PACKAGECONFIG usage
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
X-List-Received-Date: Mon, 31 Oct 2016 08:46:11 -0000
Content-Type: multipart/alternative; boundary=001a114235be6bc2920540253d74

--001a114235be6bc2920540253d74
Content-Type: text/plain; charset=UTF-8

On 29 October 2016 at 11:08, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   one or two curiosities(?) i've run across re: PACKAGECONFIG usage,
> and as i'm writing a short tutorial page on that feature, i better
> make sure i understand the nuance.
>
>   first, AIUI, for any recipe, *any* possible flag value that can be
> assigned to PACKAGECONFIG should be accompanied by the actual set of
> values assigned to that ... flag(?). random example: gnutls.inc:
>
>   PACKAGECONFIG ??= "libidn zlib"
>
>   PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
>   PACKAGECONFIG[libtasn1] =
"--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>   PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>   PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
>   PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
>
> so while the default PACKAGECONFIG flag settings are "libidn" and
> "zlib", that recipe clearly(?) defines five possible flags. i'm
> assuming it would be an error for any possible flag value to not be
> accompanied by a corresponding flag setting (not sure of the correct
> terminology here, i better check that).
>
>   next, i've noticed a very small number of recipes that define
> "empty" flag strings, like this from opkg-utils_git.bb:
>
>   PACKAGECONFIG = "python update-alternatives"
>   PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
>   PACKAGECONFIG[update-alternatives] = ",,,"      <----- there
>
> that last line clearly represents a no-op in the context of
> PACKAGECONFIG, and i was puzzled for a minute until it occurred that
> the only way it would have value is if it were tested somewhere else
> in the recipe, and sure enough, further down:
>
>   do_install() {
>         oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>         if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives',
'true', 'false', d)}; then
>                 rm -f "${D}${bindir}/update-alternatives"
>         fi
>   }
>
> so "no-op" PACKAGECONFIG flag settings like that:
>
> meta/recipes-devtools/opkg-utils/opkg-utils_git.bb:PACKAGECONFIG[update-alternatives]
= ",,,"
>
meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAGECONFIG[autospawn-for-root]
= ",,,"
> meta/recipes-connectivity/openssl/openssl.inc:PACKAGECONFIG[perl] = ",,,"
>
> appear to be just a kludgy way to pass a config value to a recipe that
> really just uses the PACKAGECONFIG mechanism to hand it over, without
> using actual PACKAGECONFIG processing, is that a fair way to describe
> that? (put another way, if any recipe defines a "no-op" like that, it
> better test that setting somewhere else manually; otherwise, there's
> no real point to it, yes?)

PACKAGECONFIG provides a means of (en/dis)abling features on a per-recipe
basis. How the recipe accomplishes that is really just an implementation
detail. It would be nice if the upstream project supported the required
configure flags but sometimes it does not. Without knowing the opkg-utils
case in detail I'd guess the best option would have been to add a
"--enable-update-alternatives" configuration flag upstream and making
install work without 'kludges' but that may have been considerably more
work than modifying do_install() in the recipe.

If PACKAGECONFIG sets no configure flags or dependencies and it is not used
elsewhere in the recipe to modify the resulting build or packaging, it is
indeed not doing anything.

>   actually, that might be it for this post ... am i missing any other
> subtleties involving PACKAGECONFIG worth mentioning? another
> PACAKGECONFIG-related post coming shortly, but it's more focused so
> i'll post it separately.

No additional monkey business that I know of.

Cheers,
  Jussi

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114235be6bc2920540253d74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 October 2016 at 11:08, Robert P. J. Day &lt;<a href=
=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>&=
gt;<br>&gt;<br>&gt; =C2=A0 one or two curiosities(?) i&#39;ve run across re=
: PACKAGECONFIG usage,<br>&gt; and as i&#39;m writing a short tutorial page=
 on that feature, i better<br>&gt; make sure i understand the nuance.<br>&g=
t;<br>&gt; =C2=A0 first, AIUI, for any recipe, *any* possible flag value th=
at can be<br>&gt; assigned to PACKAGECONFIG should be accompanied by the ac=
tual set of<br>&gt; values assigned to that ... flag(?). random example: gn=
utls.inc:<br>&gt;<br>&gt; =C2=A0 PACKAGECONFIG ??=3D &quot;libidn zlib&quot=
;<br>&gt;<br>&gt; =C2=A0 PACKAGECONFIG[libidn] =3D &quot;--with-idn,--witho=
ut-idn,libidn&quot;<br>&gt; =C2=A0 PACKAGECONFIG[libtasn1] =3D &quot;--with=
-included-libtasn1=3Dno,--with-included-libtasn1,libtasn1&quot;<br>&gt; =C2=
=A0 PACKAGECONFIG[p11-kit] =3D &quot;--with-p11-kit,--without-p11-kit,p11-k=
it&quot;<br>&gt; =C2=A0 PACKAGECONFIG[tpm] =3D &quot;--with-tpm,--without-t=
pm,trousers&quot;<br>&gt; =C2=A0 PACKAGECONFIG[zlib] =3D &quot;--with-zlib,=
--without-zlib,zlib&quot;<br>&gt;<br>&gt; so while the default PACKAGECONFI=
G flag settings are &quot;libidn&quot; and<br>&gt; &quot;zlib&quot;, that r=
ecipe clearly(?) defines five possible flags. i&#39;m<br>&gt; assuming it w=
ould be an error for any possible flag value to not be<br>&gt; accompanied =
by a corresponding flag setting (not sure of the correct<br>&gt; terminolog=
y here, i better check that).<br>&gt;<br>&gt; =C2=A0 next, i&#39;ve noticed=
 a very small number of recipes that define<br>&gt; &quot;empty&quot; flag =
strings, like this from <a href=3D"http://opkg-utils_git.bb">opkg-utils_git=
.bb</a>:<br>&gt;<br>&gt; =C2=A0 PACKAGECONFIG =3D &quot;python update-alter=
natives&quot;<br>&gt; =C2=A0 PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDE=
PS}&quot;<br>&gt; =C2=A0 PACKAGECONFIG[update-alternatives] =3D &quot;,,,&q=
uot; =C2=A0 =C2=A0 =C2=A0&lt;----- there<br>&gt;<br>&gt; that last line cle=
arly represents a no-op in the context of<br>&gt; PACKAGECONFIG, and i was =
puzzled for a minute until it occurred that<br>&gt; the only way it would h=
ave value is if it were tested somewhere else<br>&gt; in the recipe, and su=
re enough, further down:<br>&gt;<br>&gt; =C2=A0 do_install() {<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} insta=
ll<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! ${@bb.utils.contains(&#39;PACKA=
GECONFIG&#39;, &#39;update-alternatives&#39;, &#39;true&#39;, &#39;false&#3=
9;, d)}; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rm -f &quot;${D}${bindir}/update-alternatives&quot;<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=A0 }<br>&gt;<br>&gt; so &quot;no-op&quot; =
PACKAGECONFIG flag settings like that:<br>&gt;<br>&gt; meta/recipes-devtool=
s/opkg-utils/opkg-utils_git.bb:PACKAGECONFIG[update-alternatives] =3D &quot=
;,,,&quot;<br>&gt; meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAG=
ECONFIG[autospawn-for-root] =3D &quot;,,,&quot;<br>&gt; meta/recipes-connec=
tivity/openssl/openssl.inc:PACKAGECONFIG[perl] =3D &quot;,,,&quot;<br>&gt;<=
br>&gt; appear to be just a kludgy way to pass a config value to a recipe t=
hat<br>&gt; really just uses the PACKAGECONFIG mechanism to hand it over, w=
ithout<br>&gt; using actual PACKAGECONFIG processing, is that a fair way to=
 describe<br>&gt; that? (put another way, if any recipe defines a &quot;no-=
op&quot; like that, it<br>&gt; better test that setting somewhere else manu=
ally; otherwise, there&#39;s<br>&gt; no real point to it, yes?)<br><br>PACK=
AGECONFIG provides a means of (en/dis)abling features on a per-recipe basis=
. How the recipe accomplishes that is really just an implementation detail.=
 It would be nice if the upstream project supported the required configure =
flags but sometimes it does not. Without knowing the opkg-utils case in det=
ail I&#39;d guess the best option would have been to add a &quot;--enable-u=
pdate-alternatives&quot; configuration flag upstream and making install wor=
k without &#39;kludges&#39; but that may have been considerably more work t=
han modifying do_install() in the recipe.<div><br></div><div>If PACKAGECONF=
IG sets no configure flags or dependencies and it is not used elsewhere in =
the recipe to modify the resulting build or packaging, it is indeed not doi=
ng anything.=C2=A0<br><div><br>&gt; =C2=A0 actually, that might be it for t=
his post ... am i missing any other<br>&gt; subtleties involving PACKAGECON=
FIG worth mentioning? another<br>&gt; PACAKGECONFIG-related post coming sho=
rtly, but it&#39;s more focused so<br>&gt; i&#39;ll post it separately.</di=
v><div><br></div><div>No additional monkey business that I know of.<br><br>=
Cheers,</div><div>=C2=A0 Jussi<br><br>&gt; rday<br>&gt;<br>&gt; --<br>&gt;<=
br>&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>&gt; Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ottawa, Onta=
rio, CANADA<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://crashcourse.ca">http://crash=
course.ca</a><br>&gt;<br>&gt; Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://twitter.com/rpjday">http://twitt=
er.com/rpjday</a><br>&gt; LinkedIn: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://ca.linkedin.com/in/rpjday">http://ca.linkedin.com/in/rpjday</a><=
br>&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>&gt;<br>&gt; --<br>&gt; _______________________________________________=
<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembed=
ded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</=
a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openem=
bedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re</a></div></div></div>

--001a114235be6bc2920540253d74--
