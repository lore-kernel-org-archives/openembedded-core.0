Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAFED13592
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 01:32:17 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.42070.1730079133308045585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 18:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WlXqt+q3;
 spf=pass (domain: mvista.com, ip: 209.85.208.169, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso33731431fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 18:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1730079131; x=1730683931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m9CPgP/FulWIPzdmkAy5mv79PN+P4NxT1NB54BcEgdY=;
        b=WlXqt+q3mumqOhbAV2FXKYBWViuq0MDlkWupXbxlIaNmHbhL3JFMHD5vcDAMGZ/tjE
         SiAD8akPiiWeGDTH/iU2BE4V/4KZRK2slCaAJc1rJ4xjOArd42yA04ovHprgsr96d1LJ
         H8a3Pl0rxNCpQbs6Fjxez2oBIx1E9EuCrP0WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730079131; x=1730683931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9CPgP/FulWIPzdmkAy5mv79PN+P4NxT1NB54BcEgdY=;
        b=PZk+4+5MWvS2BYzu3G4+GhhpiUozruCji5oZUF1PI5WU1q8VoLal1bPNc7CYTbYYlJ
         i7q5DfUHr8kr9iiGGFHa4B/Vj19U9l4xfTWIrdqdOmH7onF0PCkyMNZ6sF4koJzPux14
         cGTCz2VEOdeY7XJRoAZnM49/QF/6e9UfZGmPye61BHf6cB0J1NUrmVtsDD84eGcPb6M6
         rU2n+Rh9zaMDPC5BtxxqqsRn1cM0rs0/2RQRenjV7UCIHwG/JRvv31WtIEO5D2VqAigD
         TEg4RfKcDVJoSFzFVE9exAabo33ZgV7Jvd1K5ija8HMkSj7CLLGJDAODlDtheLyj+d16
         qQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9wnQjztyxJRZxHiz6sAfwfYja49MDUV8NYAIV4dv9UFYPFD/Vs/qzb3KbTY19P334KFoF0CeiywsHFmCqCzFvUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+cRMWaMWW4xJGtEWh4/Xn1vupkR70igUTbVH3eNrakAi71Q69
	a2nzAcZMW/hGQjonmZwmWVO+/xtKyvLf8qKSopKib9b+oM+ejab7Bqiln+cO5alsk3qdOStSbHh
	h/iFB2q5BdhjpeQFmYhZIUkTEiBwrur28gdDyHA==
X-Google-Smtp-Source: AGHT+IGgpvAm6DjZz0wUOQo8W9C0yjskavwHREZNqCW4YdQFAYB2NkLAKzbJG89bNIcCsTcbD66aXsgURvstyvc/ovU=
X-Received: by 2002:a05:651c:a0a:b0:2f3:b71a:1e91 with SMTP id
 38308e7fff4ca-2fcbdf7d66amr23202031fa.17.1730079131060; Sun, 27 Oct 2024
 18:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723551231.git.steve@sakoman.com> <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
 <DS7PR10MB4926DCB745BE2CB39CA0A994FA6F2@DS7PR10MB4926.namprd10.prod.outlook.com>
 <CANNYZj-xXKRZSX8TWZnJSEsYc8+-7uKVdWy==4g5Uz0x5_q1cA@mail.gmail.com>
In-Reply-To: <CANNYZj-xXKRZSX8TWZnJSEsYc8+-7uKVdWy==4g5Uz0x5_q1cA@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 28 Oct 2024 07:01:59 +0530
Message-ID: <CANQUz187fQEeEcZXpGCz0kbN06h8QeD2Jyn7v1N07CVEz+60HQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
To: alex.kanavin@gmail.com, Steve Sakoman <steve@sakoman.com>
Cc: Arturo.Buzarra@digi.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000a6c5806257f70be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 01:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206416

--0000000000000a6c5806257f70be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

orc updated in master to the version 0.4.40 which resolves the above
mentioned issue.

could you please merge it to scarthgap, styhead and kirkstone.

Thanks & Regards,
Vijay

On Tue, Sep 24, 2024 at 12:10=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> This needs to be updated in master first, and then you can send a backpor=
t.
>
> Alex
>
> On Mon, 23 Sept 2024 at 15:33, abuzarra via lists.openembedded.org
> <Arturo.Buzarra=3Ddigi.com@lists.openembedded.org> wrote:
> >
> > Hi all,
> >
> > After this update of the ORC recipe for the kirkstone branch the build
> is broken with Ubuntu 18.04 due to an issue with the GCC version supporte=
d
> on that version ( GCC < 8 ).
> >
> > The build throws an unexpected error related with a missing _xgetbv
> intrinsic function that apparently was introduced in GCC > 8
> >
> > I notice that there is a new version ORC v0.4.40 that fixes the build
> issues, is there a plan to backport this ORC version to kirkstone branch?
> >
> > Thanks in advance,
> >
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Steve Sakoman
> > Sent: martes, 13 de agosto de 2024 14:17
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
> >
> > [EXTERNAL E-MAIL] Warning! This email originated outside of the
> organization! Do not click links or open attachments unless you recognize
> the sender and know the content is safe.
> >
> >
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Include security fix CVE-2024-40897
> >
> > Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-devtools/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> meta/recipes-devtools/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} (92%)
> >
> > diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb
> b/meta/recipes-devtools/orc/orc_0.4.39.bb
> > similarity index 92%
> > rename from meta/recipes-devtools/orc/orc_0.4.32.bb
> > rename to meta/recipes-devtools/orc/orc_0.4.39.bb
> > index 829255f110..320abf536a 100644
> > --- a/meta/recipes-devtools/orc/orc_0.4.32.bb
> > +++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d8=
5797e"
> >
> >  SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz=
"
> > -SRC_URI[sha256sum] =3D
> "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
> > +SRC_URI[sha256sum] =3D
> "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
> >
> >  inherit meson pkgconfig gtk-doc
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204824):
> https://lists.openembedded.org/g/openembedded-core/message/204824
> Mute This Topic: https://lists.openembedded.org/mt/107874802/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000a6c5806257f70be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Steve,<br><br></div>orc updated in maste=
r to the version 0.4.40 which resolves the above mentioned issue.<br><br></=
div>could you please merge it to scarthgap, styhead and kirkstone.<br><br><=
/div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 24, 20=
24 at 12:10=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This nee=
ds to be updated in master first, and then you can send a backport.<br>
<br>
Alex<br>
<br>
On Mon, 23 Sept 2024 at 15:33, abuzarra via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><=
br>
&lt;Arturo.Buzarra=3D<a href=3D"mailto:digi.com@lists.openembedded.org" tar=
get=3D"_blank">digi.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; After this update of the ORC recipe for the kirkstone branch the build=
 is broken with Ubuntu 18.04 due to an issue with the GCC version supported=
 on that version ( GCC &lt; 8 ).<br>
&gt;<br>
&gt; The build throws an unexpected error related with a missing _xgetbv in=
trinsic function that apparently was introduced in GCC &gt; 8<br>
&gt;<br>
&gt; I notice that there is a new version ORC v0.4.40 that fixes the build =
issues, is there a plan to backport this ORC version to kirkstone branch?<b=
r>
&gt;<br>
&gt; Thanks in advance,<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Steve Sakoman<br>
&gt; Sent: martes, 13 de agosto de 2024 14:17<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -&gt; 0.4.39<b=
r>
&gt;<br>
&gt; [EXTERNAL E-MAIL] Warning! This email originated outside of the organi=
zation! Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Include security fix CVE-2024-40897<br>
&gt;<br>
&gt; Ref: <a href=3D"https://github.com/GStreamer/orc/blob/0.4.39/RELEASE" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/GStreamer/orc/blob/=
0.4.39/RELEASE</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/orc/{<a href=3D"http://orc_0.4.32.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.32.bb</a> =3D&gt; <a href=3D"http=
://orc_0.4.39.bb" rel=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a>} |=
 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)=C2=A0 rename meta/=
recipes-devtools/orc/{<a href=3D"http://orc_0.4.32.bb" rel=3D"noreferrer" t=
arget=3D"_blank">orc_0.4.32.bb</a> =3D&gt; <a href=3D"http://orc_0.4.39.bb"=
 rel=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a>} (92%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.32.bb=
" rel=3D"noreferrer" target=3D"_blank">orc_0.4.32.bb</a> b/meta/recipes-dev=
tools/orc/<a href=3D"http://orc_0.4.39.bb" rel=3D"noreferrer" target=3D"_bl=
ank">orc_0.4.39.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.32.bb"=
 rel=3D"noreferrer" target=3D"_blank">orc_0.4.32.bb</a><br>
&gt; rename to meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.39.bb" r=
el=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a><br>
&gt; index 829255f110..320abf536a 100644<br>
&gt; --- a/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.32.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.32.bb</a><br>
&gt; +++ b/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.39.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot=
;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1400bd9d09e8af56=
b9ec982b3d85797e&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/sr=
c/orc/orc-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gst=
reamer.freedesktop.org/src/orc/orc-${PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8=
370de7ce134ba73da4af18f0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;33ed2387f49b825fa1b9c3b0072e05f259141b89=
5474ad085ae51143d3040cc0&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit meson pkgconfig gtk-doc<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204824): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204824" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204824</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107874802/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107874802/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000a6c5806257f70be--

