Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8551BCD98DC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 20:21:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2342.1763065283519652066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 12:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KcymuGZL;
 spf=pass (domain: smile.fr, ip: 209.85.208.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso3985050a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763065282; x=1763670082; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oo5POh7UPzKl/e08i4UJaX8Vd46JYJajcf2budo+Cns=;
        b=KcymuGZLy27ASKel9987C8fa9s89sUu5oqukxZY377Z6E7H/JE5QxEQe8uqPNSjBIT
         88niSfCsi+KcEDsvvrOl0ePANX34D3V5REHeAl9b7mBjmcZqF/zkp7vxtfoVU+5Rfx+q
         5IuXgmaO1jX98xPhdBKYHDBW70ErJ5PhfKd5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763065282; x=1763670082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo5POh7UPzKl/e08i4UJaX8Vd46JYJajcf2budo+Cns=;
        b=JxHCSfqGr1ZcRKPO3hQ23bHLZRHQfn2uKQnMpqfDfJtIzOzz/xcp/40/KPPK4WmbgI
         9MIW9jj9YW3ssdEfmLjQechjqhOhnhT4pVTWaozIpiF16B/0V+ajLmLBqb6+RCl8nsSs
         5ArCwkvr/utYv+zssvkGXu89kFBHVumwasujMa4Lv4+t5pmFJFNs2BDS4lTKLLIm93FQ
         PjDFhk9Txx3ALLN9zEd5OUYA1vcQgt5TOFr1WbcYto3olzpnWRTYum+DJsJ242St/r4B
         LanZUAEy8k4kjqZ1dyYHlThjprX735FnBLBkEswc9DtkcFJATTbcR1i0WdCMSeUi0nUi
         9CLw==
X-Forwarded-Encrypted: i=1; AJvYcCVpN0CfOBlQ87gQJ+Ts9ScEKDUxAslEHqRMZZM609hSeotcSEvMXBZ40bjy5Vm/K2+W21ejKhNj1l92xuPl+vaTmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1/N32MlUc7sjZ0pCjfI1UQnK6Sd5wZM/ZHQnT0+g827To4Wb8
	1+PragR08MBaFCWjOIhmQBJEds4IwQy7gcB3LDSbd8q0pqq/8pzNVwIoHZhglfp43Sxs3gO5k5X
	lOJ4MLiCiVKv3tIB6SqgA8XIv2AldyEZd5p8Nw0hwog==
X-Gm-Gg: ASbGncvSFddRIsNgUrBwB3ekw6X2d9va2OqcaOPCQQrNRQ1p1dCqbKax+D+TBObOhSa
	wsDXPSjyNbrldyRkCw6Kj1mIOLoUu3wx5b81D7V+0AXkl9rcvPpfhknryl/PkhFJikG5eBDtXNF
	59srrd5zrXDySdVa+4ebX/7iPSVaa4wpP6ElEwcC5XiAM7fH9Xtj1kfgARIGwVDuOguMxw1Z0Ky
	+7fyxGQYw0mT92zlff+mTNQ80xGG2k7iGDLzNK0qYd0p0Y0qIK7pzKF4MQNhlAPHxGy2w3Oc5Ei
	MW/GPDvFd+qSodSYUHk=
X-Google-Smtp-Source: AGHT+IE96UpqC7PkPc8J+c1LX0Nd3Pirgl6vo0JM7JnQpl9gU92Dyw/9WDdfhB8yAfND3/PduDj7KpIuu6clyTCW9GE=
X-Received: by 2002:a05:6402:44c9:b0:641:270:2c8a with SMTP id
 4fb4d7f45d1cf-6434f9756c9mr585236a12.14.1763065281777; Thu, 13 Nov 2025
 12:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20251113181157.410053-1-corentin.guillevic@smile.fr>
 <20251113181157.410053-2-corentin.guillevic@smile.fr> <AS1PR10MB56971551CC05881D1874F72BFDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56971551CC05881D1874F72BFDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Nov 2025 21:20:50 +0100
X-Gm-Features: AWmQ_blyXhAk1S4JnQVWATipCIJAEj_gEjR2DWHPgwOA3nii0-_ZVlHYZku8SrM
Message-ID: <CAMSfU+6DNwyJGjK7hdc60OS0PD7z0qtp+id=Odz5VsU8M6418g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] layer.conf: enable test for revision
 alongside a git URI
To: peter.marko@siemens.com
Cc: "corentin.guillevic@smile.fr" <corentin.guillevic@smile.fr>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d621d406437f9f26"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 20:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226266

--000000000000d621d406437f9f26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 13 nov. 2025 =C3=A0 20:34, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> Perhaps this could be a warning by default in insane class and meta-poky
> could upgrade it via WARN_TO_ERROR_QA?
>

Yes, but it would warn on the supported use case of targeting the moving
tip of a git branch.
It is wrong to do that in OE layers (oe-core to meta-oe) but it should be
possible in downstream user-layers.

If I remember correctly, when I talked about this idea in a call (can't
remember which one), the consensus was to use "layer-specific" QA checks to
enforce it on oe-core (and most likely meta-openembedded) but not by
default.
... but it can be revisited.

Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Corentin Guillevic via
> > lists.openembedded.org
> > Sent: Thursday, November 13, 2025 19:12
> > To: openembedded-core@lists.openembedded.org
> > Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
> > Subject: [OE-core] [PATCH 2/2] layer.conf: enable test for revision
> alongside a git
> > URI
> >
> > As meta is the main layer, its recipes should fully comply with revisio=
ns
> > for git URIs. Enable the check for this layer only.
> >
> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> > ---
> >  meta/conf/layer.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index ba25ca3029..1f95867165 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-
> > core"
> >  # Set a variable to get to the top of the metadata location
> >  COREBASE =3D '${@os.path.normpath("${LAYERDIR}/../")}'
> >
> > +# Raise an error if no revision is provided with a git URI
> > +ERROR_QA:append:layer-core =3D " missing-srcrev"
> > +
> >  # opkg-utils is for update-alternatives :(
> >  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> >    sysvinit-inittab \
> > --
> > 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226265):
> https://lists.openembedded.org/g/openembedded-core/message/226265
> Mute This Topic: https://lists.openembedded.org/mt/116278978/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d621d406437f9f26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 13 nov. 2025 =C3=A0=C2=A020:=
34, Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openemb=
edded.org">siemens.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</=
div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Perhaps this could be a warning by default in i=
nsane class and meta-poky could upgrade it via WARN_TO_ERROR_QA?<br></block=
quote><div><br></div><div>Yes, but it would warn on the supported use case =
of targeting the moving tip of a git branch.</div><div>It is wrong to do th=
at in OE layers (oe-core to meta-oe) but it should be possible in downstrea=
m user-layers.</div><div><br></div><div>If I remember correctly, when I tal=
ked about this idea in a call (can&#39;t remember which one), the consensus=
=C2=A0was to use &quot;layer-specific&quot; QA checks to enforce it on oe-c=
ore (and most likely meta-openembedded) but not by default.</div><div>... b=
ut it can be revisited.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Corentin Guillevic via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Thursday, November 13, 2025 19:12<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guillevic@smile.=
fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 2/2] layer.conf: enable test for revision al=
ongside a git<br>
&gt; URI<br>
&gt; <br>
&gt; As meta is the main layer, its recipes should fully comply with revisi=
ons<br>
&gt; for git URIs. Enable the check for this layer only.<br>
&gt; <br>
&gt; Signed-off-by: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guill=
evic@smile.fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/layer.conf | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
&gt; index ba25ca3029..1f95867165 100644<br>
&gt; --- a/meta/conf/layer.conf<br>
&gt; +++ b/meta/conf/layer.conf<br>
&gt; @@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core =3D &quot;openembedded=
-<br>
&gt; core&quot;<br>
&gt;=C2=A0 # Set a variable to get to the top of the metadata location<br>
&gt;=C2=A0 COREBASE =3D &#39;${@os.path.normpath(&quot;${LAYERDIR}/../&quot=
;)}&#39;<br>
&gt; <br>
&gt; +# Raise an error if no revision is provided with a git URI<br>
&gt; +ERROR_QA:append:layer-core =3D &quot; missing-srcrev&quot;<br>
&gt; +<br>
&gt;=C2=A0 # opkg-utils is for update-alternatives :(<br>
&gt;=C2=A0 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 sysvinit-inittab \<br>
&gt; --<br>
&gt; 2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226265): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226265" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226265</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116278978/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116278978/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000d621d406437f9f26--

