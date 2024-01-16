Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842FC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 18:57:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.26183.1705431428549158493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 10:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EF+57tag;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ff5be20308so5736167b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431428; x=1706036228; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1q7lIiHlKuQyD46J2UTwiNsucFFWwTbGGEGlwTkWl4U=;
        b=EF+57tag+RLnBIxfTIS0bX9GEp0VhJHMIqH6N7fckvXoWBMvLqMQ7vFCBznpkkkys/
         N5a0S7k0tkoi1ocCtw/oJM9pdp5RvHnPbFLoPGGc2wh6GTFD+ddSvWkBas4vlBu9wfzN
         l/C7sVybMB0Ke1GnLg8tVk1XWPQfW0X03D+Ty1tsvZ4lLuIccGlj+i8vJLt7hDR8/0uk
         LtApIbraJhKE0CAG75kCxaRQ7BS3LwKgqPi7ZZRYdPu06yBHQd31LCTt4zrHPQVbWv3E
         CwYvfwESo4uhe4evLQE2yr9+A+KfZSjROJtL1E+9ZTYhvIeUiZF/Qjn2j/mqGtR0D5jG
         idwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431428; x=1706036228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q7lIiHlKuQyD46J2UTwiNsucFFWwTbGGEGlwTkWl4U=;
        b=pJDyaUY9iYb5/KwLXIfKh0cuJK4QlBixSamrtabKUD677TcwG/4mj4aEeKIku5YgYq
         ooaPTmybQi6jw3v9OFniCM3gQqpSqD6aDC+rkTkazZs+pygeBLoHEFFw156FFnDFhARh
         Z5bYmy+5V5kpz2kQ+av12AipKZhK0ZbEYV+G9H/ehBkxkRdIdb0TJAUxp2fNAFEs08/Z
         +Buz75bdD7WFSvVRVkSYx9sES5t/JM4wXXDv/ITS094hxDuXMeqBIql61IKEiTwws5xD
         LejU1i0RwFDivS9xuspqgGFsruVG6SqgyrrOVL0rQAkI7M4AtcEj8aathfLV6WlIIBIE
         LoGw==
X-Gm-Message-State: AOJu0Yz19GvZsNqpxFQhpaCwrg4aIAbPt6GVNu7mIhPSt8J3mVCYafDn
	xu4dOsvsP0x0js7seEgIUe8yYb1X7ifAGj7GEWY=
X-Google-Smtp-Source: AGHT+IFiQQzFVpRKH7MLFoCimK1eEogW9a4sm1/GsAZXWvBfUctQcTqoVjLzVqHBKOVusAXJe2js/JseATMKXn6nfrg=
X-Received: by 2002:a81:7e03:0:b0:5d7:1a33:5ad7 with SMTP id
 o3-20020a817e03000000b005d71a335ad7mr4543129ywn.36.1705431427607; Tue, 16 Jan
 2024 10:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20240116165602.2053194-1-William.Lyu@windriver.com>
 <20240116165602.2053194-2-William.Lyu@windriver.com> <CANNYZj_OVth=cfNE_+VY4gb27hNcx45VagwZf1J_eEUEm0Ltvg@mail.gmail.com>
In-Reply-To: <CANNYZj_OVth=cfNE_+VY4gb27hNcx45VagwZf1J_eEUEm0Ltvg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 16 Jan 2024 10:56:56 -0800
Message-ID: <CANx9H-B19_Fk2KgK-G=-nCU=D8xfBPim_t810BWu5n1jkvOQUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] openssl: Fix ptest dependencies on
 perl-module-* being ignored by COMPLEMENTARY_GLOB
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, william.lyu@windriver.com
Content-Type: multipart/alternative; boundary="0000000000006e7102060f14b291"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 18:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193872

--0000000000006e7102060f14b291
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 9:21=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> How about simple depending on specific module packages? I don=E2=80=99t t=
hink
> OpenSSL truly needs all modules.
>

Agreed. I don=E2=80=99t see a compelling reason to add the perl-modules-for=
ce-all
complication. This will add confusion in my opinion.

Iterate the tests and add the required perl-module-* sub-packages one by
one (or by inspection if the test cases)

In almost all cases, RDEPENDS on perl-modules is a short cut and should be
avoided in favor of being explicit.


> Alex
>
> On Tue 16. Jan 2024 at 17.56, Lyu, William via lists.openembedded.org
> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> From: William Lyu <William.Lyu@windriver.com>
>>
>> Change the openssl-ptest RDEPENDS from perl-modules to
>> perl-modules-force-all which RDEPENDS on the same set of packages
>> perl-module-* recommended by perl-modules. So, when openssl-ptest is
>> added via COMPLEMENTARY_GLOB "ptest-pkgs", its dependencies on these
>> perl-module-* packages still get added.
>>
>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_3.2.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>> b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>> index d041d2d214..7076bd3a7b 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>> @@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D
>> "${sysconfdir}/ssl/openssl.cnf"
>>
>>  RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
>>  RDEPENDS:${PN}-misc =3D "perl"
>> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
>> +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules-force-all bash
>> sed"
>>
>>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
>>
>> --
>> 2.43.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193868):
> https://lists.openembedded.org/g/openembedded-core/message/193868
> Mute This Topic: https://lists.openembedded.org/mt/103766390/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006e7102060f14b291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 16, 2024 at 9:21=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)"><div dir=3D"auto">How about simple depend=
ing on specific module packages? I don=E2=80=99t think OpenSSL truly needs =
all modules.</div><div dir=3D"auto"></div></blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Agreed. I don=E2=80=99t see a compelling reason t=
o add the perl-modules-force-all complication. This will add confusion in m=
y opinion.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Iterate the t=
ests and add the required perl-module-* sub-packages one by one (or by insp=
ection if the test cases)</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">In almost all cases, RDEPENDS on perl-modules is a short cut and should b=
e avoided in favor of being explicit.</div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)"><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue =
16. Jan 2024 at 17.56, Lyu, William via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> &lt;william.lyu=3D<a hr=
ef=3D"mailto:windriver.com@lists.openembedded.org" target=3D"_blank">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Fro=
m: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com" target=3D"_=
blank">William.Lyu@windriver.com</a>&gt;<br>
<br>
Change the openssl-ptest RDEPENDS from perl-modules to<br>
perl-modules-force-all which RDEPENDS on the same set of packages<br>
perl-module-* recommended by perl-modules. So, when openssl-ptest is<br>
added via COMPLEMENTARY_GLOB &quot;ptest-pkgs&quot;, its dependencies on th=
ese<br>
perl-module-* packages still get added.<br>
<br>
Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com"=
 target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.2.0.bb</a><br>
index d041d2d214..7076bd3a7b 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
@@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D &quot;${sysconfdir}/ssl/open=
ssl.cnf&quot;<br>
<br>
=C2=A0RRECOMMENDS:libcrypto +=3D &quot;openssl-conf ${PN}-ossl-module-legac=
y&quot;<br>
=C2=A0RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
-RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash sed&quo=
t;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules-force-all ba=
sh sed&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-bin +=3D &quot;openssl-conf&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193868): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193868" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193868</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103766390/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103766390/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006e7102060f14b291--

