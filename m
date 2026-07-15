Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA19C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:56:21 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89.1784138174581417719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GksQ3mmW;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6682259cae6so437652d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138173; cv=none;
        d=google.com; s=arc-20260327;
        b=iGeU9gmg2656CkjUYtGhhkTg/e552bfh+ex1EiUYEqBoAsLODL1xa2Y3roOva3K2fh
         pRiKkhgh5ZXV6OtXGO6oc7vIYX9JOwR5D5Dlbzk72qjNBbP68+RZXwaXP34KUH7D8kIE
         D/eCeqa2HgucIhZ8gwZDG18Oy+hxCSUDC5qtkg4my70MhFFvj15nCtOpqOyh5iw1u/mi
         V5ZjdtFcSI46U+dDMzDYZSEx1V4YTqmdQ5oCOGAI0BRXW8cxEOBcHbABrY8NxOzDWHKQ
         lDQGIwiEqyCBMDbw/RjQ/JcFrmeKbeOslbufg05SCG7uc2xxsgr9N2+ebIAbl+LfOBtM
         MNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pu8maWMMRfAYS0SkkPX1Vk0JlfdDA8qgRuXNcgnJz/Q=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=Cf1vYZ9wWHkzZ7wirLohBDNQAGUL9IYmaufnWH3jUUuC7Hm0dHHNdt9mEpbqXV+MDi
         Bb26vxP6PTqX+twvP8VucQZOR7kZP4/Ge2HG1rn2hcTeF3r50+gkm+L+VyuzKJKZ1/Mb
         Qs1FBAkvHOWs5ruPk5O9rManlgodny5CBr/o8HfAG89tnJ70JI+iBo/panyKGEpeP4H6
         Q5VP6UU+V8Uldd49QNz+mA73vZ0VdUyOl9bQ8ER0BImaTYyxO+ZJcFKXR1kxGY+iiDjL
         RD8kWawHh5+HMVFf+3CnrhKxxOAdOWndBRLTLXdDgn3PXuUai7D60cibzi8dMtDsBFdy
         YLIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784138173; x=1784742973; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pu8maWMMRfAYS0SkkPX1Vk0JlfdDA8qgRuXNcgnJz/Q=;
        b=GksQ3mmWtrO/VAInJPLudituuNMaISjhgUVQKmPqpTvGUjNvcqC+sS+pKoQ4aiVNpL
         AJg/gYJBE7UbTgP2FYg/RgaUimrLLuNpWt0VzlQDXj2Jg2jviWwl+v63dTC/OfAw+531
         a8GUAHes3174Hs7voarZhHSaLrGuUv1BmoSDjletSMq34iEmCjQYWxTOZbzq1sNHPYkh
         rxiRUvs8gSZ2Jv7R/0IedwGfptu+ceYQmlqNmWiB8fpIli0RPUJz3zYG7ZpAvyZciXem
         GhpjI+DRTxy9qctsioC+vKswkeRvScA/JKjDUCpBg9L3G9sWZuvxrk7Ih6lq+jmdY5L5
         HUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138173; x=1784742973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pu8maWMMRfAYS0SkkPX1Vk0JlfdDA8qgRuXNcgnJz/Q=;
        b=XZdZ1K6XtBua2Mbos3t2oaTVmZpqiFChaCIuiTl+ITL/W48yqU/HWgdAwWdyWB/iPF
         BC4jAa1eCL9kEEPTqvnZSevLphbZt8A+oPBBBHPacJn0Io6gK8eyMOAKslPUWWxXUasE
         2PbZHz0YSkMUvzKJ5kVY4lzSGV7WpANSlX2gMADdvRdoaTAxoE0eUZ+qrPDkuVKxqMs/
         aA7grldjI+Kzi0NtxdGmzRwBuo0/sM2vnDg/57+zPpfz+Av44lWMuT6HGzExXIfqFNWr
         oNFB1jQXfw9/xbSMrKqkvvdkksNmYhsjJwHymSYXl3mf3PEKlR/h6Q/P+wyYSYcWPO4b
         NzOA==
X-Gm-Message-State: AOJu0YzBB6BK8qziQJtZjnx6+dCmrLCALLhXYcWHe+2k8qiy4sd6DBxp
	+dgwTskswr1VPXtlGtI8dO+tzx39bN3e83lLBE7CXh2Tb931bJHeZopdvO13pRnnM/8FAmaNuL1
	S1LTZprK3OJnu3cHqcMINDfaI9VUeopE=
X-Gm-Gg: AfdE7cmdN3GDKVbWr7RQsWbwPHgVnmYyShegjXtdmu3vpli/vZHqCZCTR1uEiH5YF4W
	Q9pqPiyCuFk5Lq/gzEhxP+Tz7GOQTZwvQlqGHoAuxsXy+GsVFlK553/DEGqR0ZxLwgo7lXuf6vm
	b+HQriEQkEJejDgJZbjX01ReYrsOFcBECNcgLWRSk+02poQmkMVcoXGj5x+QaX4JFnsuC5Qli3E
	aZYGag8JD7K6TsmBp3G16CDroxIqeZYcRP2KT1+gvPbLeE1Pg1VCZurfg7xNrzva9l37kG0cMLn
	wY4nwsSJUvc/uxorDDxO
X-Received: by 2002:a53:b54c:0:b0:667:8b91:244e with SMTP id
 956f58d0204a3-6681349f5dcmr2222110d50.101.1784138173563; Wed, 15 Jul 2026
 10:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com> <b6095f7ae705b87895634e1d8143e2ca399e0618.camel@pbarker.dev>
In-Reply-To: <b6095f7ae705b87895634e1d8143e2ca399e0618.camel@pbarker.dev>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 15 Jul 2026 11:56:01 -0600
X-Gm-Features: AUfX_mxfE8h2NVubMWS6Sba8S4msT_Y7ydvA52fKGjmCuDmUPcgTPPa08yMH3sk
Message-ID: <CAJdd5GaMjP_dUwRUKVQf7FCVgn1HrC6xULmWhpp52kEyPJ2B=w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License Expressions
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000010cd970656aa0af8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241032

--00000000000010cd970656aa0af8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Paul Barker <paul@pbarker.dev> wro=
te:

> On Wed, 2026-07-15 at 10:44 -0600, Joshua Watt via
> lists.openembedded.org wrote:
> > Reworks the way that the LICENSE variable is used so that it uses valid
> > SPDX License Expressions instead of the custom expressions that were
> > used previously (which are based on Python syntax). This includes
> > support for the SPDX "WITH" operator which allows a license exception t=
o
> > be attached to a license identifier.
> >
> > The old licenses expressions are still allowed, and will still be
> > correctly parsed, however a warning will be issued that indicates the
> > new license string that should be used.
> >
> > Most layers should be able to use the newly-revised
> > scripts/contrib/convert-spdx-licenses.py script to do the majority of
> > the conversion work, although some manual work may still be required if
> > conditional or complex LICENSE expressions are encountered.
> >
> > SPDX License Expressions require that all licenses listed are either a
> > known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
> > "LicenseRef-" which indicates a custom license. When converting from ol=
d
> > expressions to new one this will need to be followed (the suggested new
> > license in the warning and the conversion script will automatically add
> > this prefix for any unrecognized license identifiers). This will most
> > commonly be the case for NO_GENERIC_LICENSE files; for a good example o=
f
> > what needs to be done here see the changes to the linux-firmware recipe=
.
> > When adding new LicenseRef- licenses to a recipe, the actual license
> > name should be prefixed with the name of the recipe (e.g.
> > "LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
> > multiple license documents together (e.g. in an image).
> >
> > SPDX also introduces the "WITH" operator to add an exception to a
> > license instead of using a bespoke identifier to combine the two, as wa=
s
> > done with the legacy license expressions. Because of this, the logic fo=
r
> > dealing with the INCOMPATIBLE_LICENSE family of variables has changed
> > slightly. The main difference is that INCOMPATIBLE_LICENSE will now
> > match the LHS of a "WITH" expression (where as previously this was
> > "ignored" since it was a bespoke license ID). In order to allow a
> > license that would normally be rejected, but can be allowed with an
> > exception, specifically allowed exceptions can be added to the
> > INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS here
> > means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
> > License Exceptions). If an SPDX exception is present here, any license
> > that has that exception will be allowed, even if it would normally matc=
h
> > INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
> > those with the GCC exception, use:
> >
> >     INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0*"
> >     INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "GCC-exception-3.1" # This new
> line is required
> >
> >
> > Additionally, "PD" ("Public Domain") is not allowed as a generic licens=
e
> > identifier. Aside from "PD" not being a valid SPDX License Identifier,
> > most "Public Domain" licenses do have some sort of text associated with
> > them (see the HPND family of SPDX Licenses, or use the (SPDX License
> > Match Website)[1] ). In addition, the meaning of "Public Domain" can va=
ry
> > by jurisdiction, so the actual text with a LicenseRef- or a SPDX Licens=
e
> > Identifier needs to be used instead.
> >
> > Finally, "CLOSED" is also no longer allowed as a license expression
> > (since it is not a valid SPDX License Identifier). Instead use a
> > LicenseRef- to point to a file that contains the actual license text
> > (usually something like "Copyright <name>, all rights reserved")
>
> Hi Joshua,
>
> I've had a skim through but not reviewed in detail, this looks good in
> general.
>
> I'm concerned about removing support for "CLOSED" as a license
> expression though, that has been used extensively on downstream projects
> I've worked on over the years. It's helpful to be able to bypass license
> checking where it may not be needed.
>

My reason for getting rid of it was along the same lines as trying to get
rid of "PD" as a license; there is certainly some license text that is
relevant, and the exact text might vary by jurisdiction so having a single
identifier that tries to lump it all together may not be a good idea. For
example, in the US, I might have something like "Copyright Joshua Watt, all
rights reserved". It should be noted that a LicenseRef- licenses can
reference something in a layer LICENSE_DIR, so I can for example create a
file named "JoshuaProprietaryLicense" in my layer, then use
"LicenseRef-JoshuaProprietaryLicense" in my LICENSE expression to refer to
it as necessary. We _could_ potentially make a "CLOSED" file in oe-core
with the text "All rights reserved" in it, then recipes could use
"LicenseRef-CLOSED" in it; but that strays into legal territory and I don't
really want to assume that's the correct "closed" license text in all
jurisdictions.

CLOSED is not a valid SPDX license identifier, so it can't really be
propagated around in SPDX license expressions. That said, if we want to
treat the line 'LICENSE =3D "CLOSED"' to effectively mean "no license" (whe=
re
you simply get no SPDX license expression when you parse it) that should be
doable.


>
> After applying this series there is still handling for "CLOSED" in
> several places such as populate_lic_qa_checksum() in insane.bbclass.
>

Some of them are kept around for compatibility with "legacy" license
expressions, and some I probably just missed.


>
> Best regards,
>
> --
> Paul Barker
>
>

--00000000000010cd970656aa0af8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 15,=
 2026 at 11:11=E2=80=AFAM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.de=
v">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, 2026-07-15 at 10:44 -0600, Joshua Watt via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Reworks the way that the LICENSE variable is used so that it uses vali=
d<br>
&gt; SPDX License Expressions instead of the custom expressions that were<b=
r>
&gt; used previously (which are based on Python syntax). This includes<br>
&gt; support for the SPDX &quot;WITH&quot; operator which allows a license =
exception to<br>
&gt; be attached to a license identifier.<br>
&gt; <br>
&gt; The old licenses expressions are still allowed, and will still be<br>
&gt; correctly parsed, however a warning will be issued that indicates the<=
br>
&gt; new license string that should be used.<br>
&gt; <br>
&gt; Most layers should be able to use the newly-revised<br>
&gt; scripts/contrib/convert-spdx-licenses.py script to do the majority of<=
br>
&gt; the conversion work, although some manual work may still be required i=
f<br>
&gt; conditional or complex LICENSE expressions are encountered.<br>
&gt; <br>
&gt; SPDX License Expressions require that all licenses listed are either a=
<br>
&gt; known identifier (e.g. &quot;GPL-2.0-or-later&quot;) or start with the=
 prefix<br>
&gt; &quot;LicenseRef-&quot; which indicates a custom license. When convert=
ing from old<br>
&gt; expressions to new one this will need to be followed (the suggested ne=
w<br>
&gt; license in the warning and the conversion script will automatically ad=
d<br>
&gt; this prefix for any unrecognized license identifiers). This will most<=
br>
&gt; commonly be the case for NO_GENERIC_LICENSE files; for a good example =
of<br>
&gt; what needs to be done here see the changes to the linux-firmware recip=
e.<br>
&gt; When adding new LicenseRef- licenses to a recipe, the actual license<b=
r>
&gt; name should be prefixed with the name of the recipe (e.g.<br>
&gt; &quot;LicenseRef-myrecipe-mylicense&quot;) to prevent conflicts when m=
erging<br>
&gt; multiple license documents together (e.g. in an image).<br>
&gt; <br>
&gt; SPDX also introduces the &quot;WITH&quot; operator to add an exception=
 to a<br>
&gt; license instead of using a bespoke identifier to combine the two, as w=
as<br>
&gt; done with the legacy license expressions. Because of this, the logic f=
or<br>
&gt; dealing with the INCOMPATIBLE_LICENSE family of variables has changed<=
br>
&gt; slightly. The main difference is that INCOMPATIBLE_LICENSE will now<br=
>
&gt; match the LHS of a &quot;WITH&quot; expression (where as previously th=
is was<br>
&gt; &quot;ignored&quot; since it was a bespoke license ID). In order to al=
low a<br>
&gt; license that would normally be rejected, but can be allowed with an<br=
>
&gt; exception, specifically allowed exceptions can be added to the<br>
&gt; INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS her=
e<br>
&gt; means &quot;exceptions to INCOMPATIBLE_LICENSES&quot;, not specificall=
y SPDX<br>
&gt; License Exceptions). If an SPDX exception is present here, any license=
<br>
&gt; that has that exception will be allowed, even if it would normally mat=
ch<br>
&gt; INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for<br=
>
&gt; those with the GCC exception, use:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0INCOMPATIBLE_LICENSE =3D &quot;GPL-3.0* LGPL-3.0*&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0INCOMPATIBLE_LICENSE_EXCEPTIONS =3D &quot;GCC-excep=
tion-3.1&quot; # This new line is required<br>
&gt; <br>
&gt; <br>
&gt; Additionally, &quot;PD&quot; (&quot;Public Domain&quot;) is not allowe=
d as a generic license<br>
&gt; identifier. Aside from &quot;PD&quot; not being a valid SPDX License I=
dentifier,<br>
&gt; most &quot;Public Domain&quot; licenses do have some sort of text asso=
ciated with<br>
&gt; them (see the HPND family of SPDX Licenses, or use the (SPDX License<b=
r>
&gt; Match Website)[1] ). In addition, the meaning of &quot;Public Domain&q=
uot; can vary<br>
&gt; by jurisdiction, so the actual text with a LicenseRef- or a SPDX Licen=
se<br>
&gt; Identifier needs to be used instead.<br>
&gt; <br>
&gt; Finally, &quot;CLOSED&quot; is also no longer allowed as a license exp=
ression<br>
&gt; (since it is not a valid SPDX License Identifier). Instead use a<br>
&gt; LicenseRef- to point to a file that contains the actual license text<b=
r>
&gt; (usually something like &quot;Copyright &lt;name&gt;, all rights reser=
ved&quot;)<br>
<br>
Hi Joshua,<br>
<br>
I&#39;ve had a skim through but not reviewed in detail, this looks good in<=
br>
general.<br>
<br>
I&#39;m concerned about removing support for &quot;CLOSED&quot; as a licens=
e<br>
expression though, that has been used extensively on downstream projects<br=
>
I&#39;ve worked on over the years. It&#39;s helpful to be able to bypass li=
cense<br>
checking where it may not be needed.<br></blockquote><div><br></div><div>My=
 reason for getting rid of it was along the same lines as trying to get rid=
 of &quot;PD&quot; as a license; there is certainly=C2=A0some license text =
that is relevant, and the exact text might vary by jurisdiction=C2=A0so hav=
ing a single identifier that tries to lump it all together may not be a goo=
d idea. For example, in the US, I might have something like &quot;Copyright=
 Joshua Watt, all rights reserved&quot;. It should be noted that a LicenseR=
ef- licenses can reference something in a layer LICENSE_DIR, so I can for e=
xample create a file named &quot;JoshuaProprietaryLicense&quot; in my=C2=A0=
layer, then use &quot;LicenseRef-JoshuaProprietaryLicense&quot; in my LICEN=
SE expression to refer to it as necessary. We _could_ potentially make a &q=
uot;CLOSED&quot; file in oe-core with the text &quot;All rights reserved&qu=
ot; in it, then recipes could use &quot;LicenseRef-CLOSED&quot; in it; but =
that strays into legal territory and I don&#39;t really want to assume that=
&#39;s the correct &quot;closed&quot; license text in all jurisdictions.</d=
iv><div><br></div><div>CLOSED is not a valid SPDX license identifier, so it=
 can&#39;t really be propagated around in SPDX license expressions. That sa=
id, if we want to treat the line &#39;LICENSE =3D &quot;CLOSED&quot;&#39; t=
o effectively mean &quot;no license&quot; (where you simply get no SPDX lic=
ense expression when you parse it) that should be doable.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
After applying this series there is still handling for &quot;CLOSED&quot; i=
n<br>
several places such as populate_lic_qa_checksum() in insane.bbclass.<br></b=
lockquote><div><br></div><div>Some of them are kept around for compatibilit=
y with &quot;legacy&quot; license expressions, and some I probably just mis=
sed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--00000000000010cd970656aa0af8--

