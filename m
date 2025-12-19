Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4190D767DC
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:24:48 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14852.1766143483590128972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amfnRp0I;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7881b67da53so13821637b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766143483; x=1766748283; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EhWTLcp80u+YTZBV5VnXIqtHWedf3sQR9E7isXHUlI8=;
        b=amfnRp0IytEM/ZhHZxA/ZS/oL14oOh8Aanoew56dYk/JDQ/b2X5uxKHLb99y4aYby0
         gTGDbHfpebgz3/HFv9xEdxGps6uo41qJ/JrGxtgHLq4ufi0Q2RqlR/siwgqYvWV1DkQ5
         6Kd1m47xU58lAyvNX7YlBw3Ep2hreoltbuVv15zjJvVL5ZxVR5xr2Pk23T46ZlnbYJtt
         y6YlK6PvKsYSXopqg7OK1FIsg9+k/BfZvTplmuiFDmWQH4NQO84WunOofjImw1hqqTCp
         dy9uYVY8Nr0jTedkVmojaW7pnS/O93Byg5PluESzZEXgVZbzxMW9RW6MyjeYP2VcRSCZ
         Xrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143483; x=1766748283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhWTLcp80u+YTZBV5VnXIqtHWedf3sQR9E7isXHUlI8=;
        b=wm2yznrvzIyG5byjLxepu2zK1qlPVJpfFdjeVB6MmfFdKuo2NRvJkfzYOEUOP2nIhg
         bJAW/nrzd8vg9TH0X2q/0vgNmiMrjfxNeg7JEvlupav/ZWaCaUdVnR0Ydu1hZ292U20K
         SJTvwGknZI9Z+3Vj7TdDZREwFdfnzt2qQJ2wFQmtXSh55DoAbeWSJo1ia1WBrFGDXEaE
         ZacMQrZJgPmcODDrcdCJxet4UVROYZr+vuQzga1qEDiWQOYtK+Jztjahkngf5Q+p419I
         72h03ks4NyrxQTEeMEvRdr7jdfhjSvMQHQcS7SY5JyjeU/2AqOO0QCa/SiJPR2LNJFFL
         tu6w==
X-Gm-Message-State: AOJu0YzNoRtMZ4FvFhSP3EcD7SlzPVcJ+bgBZECct5dcQY5Gwnv1/wde
	o1HLAdswBn98xBSISDoDU2+5qvhO5ERb0xJtEEphJv8mIq3X7CaL3jE2B60Mo94x/mabHi4zQhU
	ZbqgINh6bDtbd+OvtrPEyOa6i74YpFlU=
X-Gm-Gg: AY/fxX5wS0mEtTsPiOFB7KBYdSIIIdiso7IU0WHmGr9rPfs3JcqYzfFyaw3qLHbppue
	g8h6ugy50nEE+0BzBFQTmhSVQMioYCGMgG7WsmNasEiwAWbG3FHat1Bsp6Ni/rQbYeUXaMD8bmj
	NjR9136HmvoA05M8uKFRmJFx2DO1rkkMidabhKQkQBcMshIT8G7uODHpM/V3JtUPD6bqH3ImwdW
	vemzxia8WQdnYrVTGJQzgmqvuOWZ6kI+EBANFLugtvKe6lqo/7ZVpMJZY4gmQ9BBChx8BZ7w1ex
	slaVc4nubqSRVjx8KoDxYhepGri2oIcxsvAJ1HIqLtPl7MpO8E3FW6RlTV5zBHacsJtidkWAbEg
	HU4N1y3ekEHeiid1jpY5XRbc=
X-Google-Smtp-Source: AGHT+IGPsKl7Zbss6uXzE34N9hwihFOQ4eEj/XhfH4ltszwd+rFOKuSAMBa26BpUSqgLyKC35gdjcgzXpfUKjhNA/l8=
X-Received: by 2002:a05:690c:660d:b0:787:f5c5:c631 with SMTP id
 00721157ae682-78fb40bbad4mr21965117b3.65.1766143482561; Fri, 19 Dec 2025
 03:24:42 -0800 (PST)
MIME-Version: 1.0
References: <18829727D052ED19.1342979@lists.openembedded.org> <201700b0-186f-45cc-83f0-5eb40a1de1bc@windriver.com>
In-Reply-To: <201700b0-186f-45cc-83f0-5eb40a1de1bc@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Dec 2025 07:24:30 -0400
X-Gm-Features: AQt7F2qEiX698eWW0Bw6Hskw217NOtRSy3I_JyRbc3Pnd6nER_Rm4v1lIW_NzdY
Message-ID: <CAMKF1sofmWnHb5MQJvqND12HUf0fCvTP2g4AgkkbQ2fjONevGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-go-sdk-target: remove go from packagegroup
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6877f06464c5227"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228213

--000000000000e6877f06464c5227
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this reveals that go packaging needs to be addressed for multilib

On Fri, Dec 19, 2025 at 6:31=E2=80=AFAM Changqing Li <changqing.li@windrive=
r.com>
wrote:

> Hi, Khem
>
> go is added by you in this commit:
>
>
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/p=
ackagegroups/packagegroup-go-sdk-target.bb?id=3D14db3e42faf28b8157a04435ea7=
4e86b5e7d440a
>
> Could you help to double check this is necessary? Thanks
>
> //Changqing
>
> On 12/19/25 18:29, Changqing Li via lists.openembedded.org wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > This is for fixing the following error of 'bitbake meta-go-toolchain'
> > when multilib is enabled:
> > Error: Transaction test error:
> >    file /usr/bin/go conflicts between attempted installs of
> go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
> >    file /usr/bin/gofmt conflicts between attempted installs of
> go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
> >
> > Package go only contains some tools, it is not needed to be installed
> > into sdk, target go tools is not expected to be used in sdk.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/
> packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/
> packagegroup-go-sdk-target.bb
> > index c03918acc8..52dba3d2ff 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
> > @@ -3,7 +3,6 @@ SUMMARY =3D "Target packages for the Go SDK"
> >   inherit packagegroup goarch
> >
> >   RDEPENDS:${PN} =3D " \
> > -    go \
> >       go-runtime \
> >       go-runtime-dev \
> >   "
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228207):
> https://lists.openembedded.org/g/openembedded-core/message/228207
> > Mute This Topic: https://lists.openembedded.org/mt/116857356/3616873
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> changqing.li@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e6877f06464c5227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think this reveals that go packaging needs to be addres=
sed for multilib=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 19, 2025 at 6:=
31=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com=
">changqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hi, K=
hem<br>
<br>
go is added by you in this commit:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/recip=
es-core/packagegroups/packagegroup-go-sdk-target.bb?id=3D14db3e42faf28b8157=
a04435ea74e86b5e7d440a" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/openembedded-core/commit/meta/recipes-core/packagegroups/pac=
kagegroup-go-sdk-target.bb?id=3D14db3e42faf28b8157a04435ea74e86b5e7d440a</a=
><br>
<br>
Could you help to double check this is necessary? Thanks<br>
<br>
//Changqing<br>
<br>
On 12/19/25 18:29, Changqing Li via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;<br>
&gt; This is for fixing the following error of &#39;bitbake meta-go-toolcha=
in&#39;<br>
&gt; when multilib is enabled:<br>
&gt; Error: Transaction test error:<br>
&gt;=C2=A0 =C2=A0 file /usr/bin/go conflicts between attempted installs of =
go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32<br>
&gt;=C2=A0 =C2=A0 file /usr/bin/gofmt conflicts between attempted installs =
of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32<br>
&gt;<br>
&gt; Package go only contains some tools, it is not needed to be installed<=
br>
&gt; into sdk, target go tools is not expected to be used in sdk.<br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/packagegroups/<a href=3D"http://packageg=
roup-go-sdk-target.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-go=
-sdk-target.bb</a> | 1 -<br>
&gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://package=
group-go-sdk-target.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-g=
o-sdk-target.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-go-sdk-target.bb" rel=3D"noreferrer" target=3D"_blank">packagegro=
up-go-sdk-target.bb</a><br>
&gt; index c03918acc8..52dba3d2ff 100644<br>
&gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-g=
o-sdk-target.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-go-sdk-t=
arget.bb</a><br>
&gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-g=
o-sdk-target.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-go-sdk-t=
arget.bb</a><br>
&gt; @@ -3,7 +3,6 @@ SUMMARY =3D &quot;Target packages for the Go SDK&quot;=
<br>
&gt;=C2=A0 =C2=A0inherit packagegroup goarch<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 go \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0go-runtime \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0go-runtime-dev \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#228207): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/228207" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/228207</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11685735=
6/3616873" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116857356/3616873</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:changqing.li@windrive=
r.com" target=3D"_blank">changqing.li@windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000e6877f06464c5227--

