Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958EEC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:42:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.46175.1722440573037591053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/WO4wiy;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so3782189a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722440572; x=1723045372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jHLZ8yF4WT/2rGuX9jD7ZbA7mXlIr/YklJuy0sI+HD4=;
        b=A/WO4wiy2qTBuGuUmgGdDjpZT5SE6xUtMlYbD2nDpMJUVUArcfyAZ8+lRKe7qDBoRU
         eRG3PDfds26JVvJl3x1rjmZazG1a0+jGCHs5uaJ7BiA3gyESAZuYLiOmH8L6aVn0JNKA
         AIVNtiKSWcxGcU8YvutarQrOHzdErmMvu6SwQ+k/DKdlGmhoSdeGLryrPSej42Z7fNmw
         /KN+ibJDs+8/OCuOzt0BZGrkMtoC47NNBsC11cpzmy0bDLz2URaj2kt+RkVDPiGVWXrw
         eLZycC6v69tVCuAHKbG3ViKdlNr4rai6GZHdPaURYHCbd996WUQS8sp123k7ew08ttWG
         ntXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722440572; x=1723045372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHLZ8yF4WT/2rGuX9jD7ZbA7mXlIr/YklJuy0sI+HD4=;
        b=HEcGqqvdav1+gB9AOylvpTNG93T7/CIz7v7yautFkb4j2spoB9rnPfmnYyF3L6UR5W
         4/V1yDxpftxNOX773dMXK7StX7BjjuAkvw1AnSd1pudWvdbcjlIafr5KJuqcXdm2MduY
         AtUu4DrewptBor1LafIWCcHQ9LJi1jMPMH/cenZFr77LRVrXs0eWZKbElczlQY8UkL90
         oX96kTUWWXY/CJ3F4O/uvDhxfW7TO5rc3er8Mb+CoZL+/DhJAAVAiDsF5S7kpJ7A70vH
         wAjnREizJKzIUJNZM6zwebNhV1EacTCoceWk1fCa2j4QyGyu7i+ZpIzKyXPRmaclKRFq
         FHeg==
X-Gm-Message-State: AOJu0YzXiutrOxsl+ebpeSpgJ9+fSjB1c0LsNeZy+n8gmgVLaHh4xN6e
	iqAWYMB02ycvLutC5hS32PjV/OhnsmStG//0OeUU1Cx4Z7dWm961IFlqMQRhsR7rt1vybcOsRAa
	h23rCTeZ5RjQRWwoef17UbDx/4tk=
X-Google-Smtp-Source: AGHT+IGlb9XYKf5tZgjxvJwRMZH2wcWc1SVBkIzJRGwC87ZHRkJfvuHkm1Ohpk0NUnPUUO1Jz3tVX53slty+Z1xnJAo=
X-Received: by 2002:a17:90a:eb09:b0:2c9:9eb3:8477 with SMTP id
 98e67ed59e1d1-2cf7e1c81a4mr13073124a91.16.1722440572310; Wed, 31 Jul 2024
 08:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240728144905.554155-1-raj.khem@gmail.com> <CAApg2=Tgj=FKDcV6xGZuAuYTjQozre+T9z2353Hv_G-QC9k8bg@mail.gmail.com>
 <CAMKF1sr3m_UpEezEJKDNp5=rzkY2+4GNXtZ-1+rdV6sEmjOpzg@mail.gmail.com>
In-Reply-To: <CAMKF1sr3m_UpEezEJKDNp5=rzkY2+4GNXtZ-1+rdV6sEmjOpzg@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 31 Jul 2024 17:42:40 +0200
Message-ID: <CAApg2=Tp_XN8zqRY9eE3P+C0XY6SxLHCrP8mRGD8ouv+nOxAig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libyaml: Update status of CVE-2024-35328
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000759b6e061e8cf2ca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 15:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202715

--000000000000759b6e061e8cf2ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Wed, Jul 31, 2024 at 1:47=E2=80=AFAM Marta Rybczynska <rybczynska@gmai=
l.com>
> wrote:
>
>>
>>
>> On Sun, Jul 28, 2024 at 4:49=E2=80=AFPM Khem Raj via lists.openembedded.=
org
>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>> This is open yet but seems to be disputed
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>>> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>>> index 4cb5717ece8..2d6f27af1fc 100644
>>> --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>>> +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>>> @@ -18,4 +18,6 @@ inherit autotools
>>>  DISABLE_STATIC:class-nativesdk =3D ""
>>>  DISABLE_STATIC:class-native =3D ""
>>>
>>> +CVE_STATUS[CVE-2024-35328] =3D "disputed: Upstream thinks there is no
>>> working code that is exploitable -
>>> https://github.com/yaml/libyaml/issues/302"
>>> +
>>>  BBCLASSEXTEND =3D "native nativesdk"
>>>
>>> Khem, formally this one isn't "disputed". "disputed" is a formal CVE
>> programme tag, which isn't there for CVE-2024-35328 as of today.
>>
>
> Fair enough. We shall change it. Is ignored ok ?
>

Wontfix will do for now. If the libyaml team has asked for a refusal and it
will be granted, they might be even removed. But this is a direct MITRE
filling, so will take time.

Regards,
Marta

--000000000000759b6e061e8cf2ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 31, 2024 at 4:35=E2=80=AF=
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jul 31, 2024 at 1:47=E2=80=AFAM Marta Rybczynska &lt;<a =
href=3D"mailto:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
</div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun, Jul 28, 2024 at 4:49=E2=80=AFPM Khem Raj via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded=
.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">This is open yet but see=
ms to be disputed<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.b=
b" rel=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> b/meta/recipes=
-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libyaml_0.2.5.bb</a><br>
index 4cb5717ece8..2d6f27af1fc 100644<br>
--- a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
+++ b/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
@@ -18,4 +18,6 @@ inherit autotools<br>
=C2=A0DISABLE_STATIC:class-nativesdk =3D &quot;&quot;<br>
=C2=A0DISABLE_STATIC:class-native =3D &quot;&quot;<br>
<br>
+CVE_STATUS[CVE-2024-35328] =3D &quot;disputed: Upstream thinks there is no=
 working code that is exploitable - <a href=3D"https://github.com/yaml/liby=
aml/issues/302" rel=3D"noreferrer" target=3D"_blank">https://github.com/yam=
l/libyaml/issues/302</a>&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br></blockquote></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv>Khem, formally this one isn&#39;t &quot;disputed&quot;. &quot;disputed&q=
uot; is a formal CVE programme tag, which isn&#39;t there for CVE-2024-3532=
8 as of today.</div></div></div></blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Fair enough. We shall change it. Is ignored ok ?</div></div=
></div></blockquote><div><br></div><div>Wontfix will do for now. If the lib=
yaml team has asked for a refusal and it will be granted, they might be eve=
n removed. But this is a direct MITRE filling, so will take time.</div><div=
><br></div><div>Regards,</div><div>Marta <br></div></div></div>

--000000000000759b6e061e8cf2ca--

