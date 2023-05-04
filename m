Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438D9C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:35:05 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.44427.1683185698625428328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 00:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kNZY8jLm;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ernstp@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-38e3a1a07c8so108704b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185698; x=1685777698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLG+PwQUmY6RHvMxesnSJbuBXK5nDx70Zlm5/clbAuU=;
        b=kNZY8jLms9X+NxIY/1mlUIcPwkoM+Uq96s2xKtQS+YQ6LWJgBRnTHtxCvAbp0PlZoo
         85kljji7AFcJZw6m/940LM3Rwg1cJHK+jtrzTXGalXKyPbNtcmjFFxwAa81ugfHJvyFD
         ozHjzBG6a/KZ9qrn1Pf49nenbNkzyME9lc6NUPAn12ps7C0PV9TrbNhlR5NOMJGlMdiQ
         OdFgiMkFgVMwTTfQ+FypzU6XLnJVbL0EoFO23XuqtOg4xorWJ/VRlQos1Qn7kuF6zuCB
         SvajKZgutDNiB/+chf6S3yXkvXy7Nim2C3YJ16C1megKErDDiRjFY5K5hCLV4pXcV3zL
         xVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185698; x=1685777698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLG+PwQUmY6RHvMxesnSJbuBXK5nDx70Zlm5/clbAuU=;
        b=dgbPa4g7zsLn/XGbPFR/9A/IZJJWCWbO4Uq4j6vTDSZlBhe/uTUNnY+9ipATiIe/4Y
         FkjL3l0DKvsjr1fqKp2s2aK+HCqbyuPfZP9QRq5YqrP9eS0UXs+jVQiDk0Tym7mwy9tb
         Ezqupj3lQfm22BeSFLVKIiCpxH/Je8WLUM4/XhfoNsVrGOTCQn63mYyeFxhDueetEdfZ
         hnIHwOpNjer1K1LASlNa/4lLFPyIapGr+TvIVIAV+n0WUatidYjJ/BCWVRgzvXbj6/x0
         pE+S5r/aSQjmWjWYNp57FDnn/vy3TnLkucRmj5ATmn8Wg+ynnZ2+QZJpNe46JnMWGtbc
         9e+Q==
X-Gm-Message-State: AC+VfDyf9q19M+iiR4RA1Qk7IEsNk73pLnA7PvQfxw5TbkYVeKXYuaRQ
	m5/0L/c61Sa0kt2K77qfxIetFryGjVCtCvxIjJY=
X-Google-Smtp-Source: ACHHUZ6lN89BJPKd3tTRenzAfm9frt7kJGpzlW19icvAxCtQyEbdlocyoIH2LPTS3NmCwAOM9Gf2X1doC2oO9xI3+X4=
X-Received: by 2002:a05:6808:2010:b0:38e:46ed:7738 with SMTP id
 q16-20020a056808201000b0038e46ed7738mr1473889oiw.0.1683185697882; Thu, 04 May
 2023 00:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230502173422.1439794-1-ernstp@gmail.com> <20230502173422.1439794-2-ernstp@gmail.com>
 <CANx9H-AYYY-5mo0xmxNcO15Fimo_MHTc9_tZtnWjKSOw5MROXg@mail.gmail.com> <CANx9H-B-orGrYEMy6koKZNZDF1tMSA_d1hRMfbwJBuNF-Vg9zg@mail.gmail.com>
In-Reply-To: <CANx9H-B-orGrYEMy6koKZNZDF1tMSA_d1hRMfbwJBuNF-Vg9zg@mail.gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Thu, 4 May 2023 09:34:46 +0200
Message-ID: <CAD=4a=VwagGRjqiAA=7aWvYBMQkqP-N42vKCxRC=a_XsLkWO_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/6] python3-fixtures: add recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d074b05fad935f4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 07:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180852

--0000000000009d074b05fad935f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, both these are added as dependencies in their respective next
commits but I will make the commit
messages self contained of course. V2 in a couple of days.
Still thinking about how I can handle python3 standard library modules
compared to PyPI modules...

Den tors 4 maj 2023 kl 06:47 skrev Tim Orling <ticotimo@gmail.com>:

>
>
> On Wed, May 3, 2023 at 9:47 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>> Please add some reason that it needs to be added to core. Empty commit
>> logs do not help future users know =E2=80=9Cwhy?=E2=80=9D
>>
>> On Tue, May 2, 2023 at 10:35 AM Ernst Sj=C3=B6strand <ernstp@gmail.com> =
wrote:
>>
>>> Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>
>>> ---
>>>  .../python/python3-fixtures_4.0.1.bb          | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/python/
>>> python3-fixtures_4.0.1.bb
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
>>> b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
>>> new file mode 100644
>>> index 00000000000..f71eec6497e
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
>>> @@ -0,0 +1,19 @@
>>> +SUMMARY =3D "Python fixtures for testing / resource management"
>>> +HOMEPAGE =3D "https://github.com/testing-cabal/fixtures"
>>> +SECTION =3D "devel/python"
>>> +LICENSE =3D "BSD-3-Clause"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D239e2f4698b85aad5ed39bae5d2=
ef226"
>>> +
>>> +inherit pypi setuptools3
>>> +
>>> +SRC_URI[sha256sum] =3D
>>> "d2758826400d095b79666cf93a32a84f50ff8cd179831927efb48cd1e3ca7466"
>>> +
>>> +DEPENDS +=3D " \
>>> +    ${PYTHON_PN}-pbr-native \
>>> +    "
>>> +
>>> +RDEPENDS:${PN} +=3D "\
>>> +    ${PYTHON_PN}-pbr \
>>> +    "
>>> +
>>> +BBCLASSEXTEND =3D "nativesdk"
>>> --
>>> 2.39.2
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#180757):
>>> https://lists.openembedded.org/g/openembedded-core/message/180757
>>> Mute This Topic: https://lists.openembedded.org/mt/98644245/924729
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> ticotimo@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--0000000000009d074b05fad935f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Right, both these are added as dependencies in their re=
spective next commits but I will make the commit</div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">messages self cont=
ained of course. V2 in a couple of days.</div><div class=3D"gmail_default" =
style=3D"font-family:arial,helvetica,sans-serif">Still thinking about how I=
 can handle python3 standard library modules compared to PyPI modules...<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Den tors 4 maj 2023 kl 06:47 skrev Tim Orling &lt;<a href=3D"mailto:=
ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 3, 2023 at 9:47 =
PM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">t=
icotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto">Please add some reason that it needs to =
be added to core. Empty commit logs do not help future users know =E2=80=9C=
why?=E2=80=9D</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, May 2, 2023 at 10:35 AM Ernst Sj=C3=B6strand &lt;=
<a href=3D"mailto:ernstp@gmail.com" target=3D"_blank">ernstp@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signe=
d-off-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gmail.com" targ=
et=3D"_blank">ernstp@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-fixtures_4.0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-fixtures_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtur=
es_4.0.1.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-fixture=
s_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-fixtures_4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a><br>
new file mode 100644<br>
index 00000000000..f71eec6497e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-fixtures_4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;Python fixtures for testing / resource management&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/testing-cabal/fixtures" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/testing-cabal/fixtur=
es</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D239e2f4698b85aad5ed39bae5d=
2ef226&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;d2758826400d095b79666cf93a32a84f50ff8cd179831=
927efb48cd1e3ca7466&quot;<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pbr-native \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180757): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180757" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180757</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98644245/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98644245/924729</a><br>
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
</blockquote></div></div>
</blockquote></div>

--0000000000009d074b05fad935f4--

