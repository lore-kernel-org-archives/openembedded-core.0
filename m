Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F5FC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:35:09 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.44255.1722436505009867748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 07:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D3dz5+IZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2611da054fbso3735103fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722436504; x=1723041304; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnawte9ax6HvcJ8QbTtNGxaG/cFLxuZOpIYtk2ct7U0=;
        b=D3dz5+IZO3rODcEt5kgynFsb7gse89jNonf+iqyu9zaV/KxrnTGF5X3nAW3UNS1YHb
         ZDkmC4UhRPU0Znwc3wbg4qfEjWZlP3CBUQehuA2Ua1Q7Wy0aqxoVJiNMAutBYi89xQ3f
         1Me6MP5Ij9ohUEVUWgdkoFUN2MfyQcd12Pwz9jYgmfWtaFUlZgbFhY9XSnFMoRUPc8az
         ob18IjNwxG6j7BOUWrTKJtbQa1xp38AcLJrOhwiaM6i2foPN9w2LoQs7qrKaonIYqeob
         I70sLL7JUIp1iiaXOiEb/3ILxVhXZZLNXDLv/zRM7FO+E6VRiKojYpE+AricGKb34++L
         yZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722436504; x=1723041304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnawte9ax6HvcJ8QbTtNGxaG/cFLxuZOpIYtk2ct7U0=;
        b=oSFw2ScP4/6dxNGeibbVlH/n5xC+GormLp1nM9skNqqFYxlZYiWPU+8uc2278LTv77
         9GDHLxYWKTEIpLKvTSVEI5bzb+vP32NpIjLy8Kktd431+eycJY1cW287cadV7QadTilw
         9DzSU5OpPy2RPoVDOMeziaRerLEkIVws4OeOcCBqmvVJaJfGIWytL+UKI+qMSSUC5saO
         bqUxUpBel8pmsxvbvaqEfDsAn/PEHfCj9xFKeJ+H53NznCjmiO8UIAu1DsW41luwLqdJ
         /vfntJefwyRAEjsXai5b0bOFOPnyZiVCQa2iy1cQllC7cJb3AEyfL5TILLavXDc82UQn
         hLyw==
X-Gm-Message-State: AOJu0YxMYEc4yQ+mr2frbjr860ZOHmkEXG6Nkd8JPr9yH9nyG/JfzEHA
	eN/rFiLgZNFf1sh94ocYS7i+mtx/V7Q8TukOAtKCJmc7rV2VoE90d9s7xLj09mUUvHQUEJN02QL
	3AXYlfMBLT+6BzgVobCaXSxMNL50=
X-Google-Smtp-Source: AGHT+IGYygeIGA0al1qsfp2vCNdUGRUdNxXBNNUm40i4w8AlgLokmnUPhe7kK2Q2r1c8pIn35+uBRvjMQ6cKtN0j67k=
X-Received: by 2002:a05:6871:70f:b0:261:446:c405 with SMTP id
 586e51a60fabf-267d4d12d37mr16686634fac.4.1722436504152; Wed, 31 Jul 2024
 07:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240728144905.554155-1-raj.khem@gmail.com> <CAApg2=Tgj=FKDcV6xGZuAuYTjQozre+T9z2353Hv_G-QC9k8bg@mail.gmail.com>
In-Reply-To: <CAApg2=Tgj=FKDcV6xGZuAuYTjQozre+T9z2353Hv_G-QC9k8bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2024 07:34:52 -0700
Message-ID: <CAMKF1sr3m_UpEezEJKDNp5=rzkY2+4GNXtZ-1+rdV6sEmjOpzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libyaml: Update status of CVE-2024-35328
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa765e061e8bffde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 14:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202711

--000000000000fa765e061e8bffde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 1:47=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com>
wrote:

>
>
> On Sun, Jul 28, 2024 at 4:49=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>> This is open yet but seems to be disputed
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>> index 4cb5717ece8..2d6f27af1fc 100644
>> --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>> +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
>> @@ -18,4 +18,6 @@ inherit autotools
>>  DISABLE_STATIC:class-nativesdk =3D ""
>>  DISABLE_STATIC:class-native =3D ""
>>
>> +CVE_STATUS[CVE-2024-35328] =3D "disputed: Upstream thinks there is no
>> working code that is exploitable -
>> https://github.com/yaml/libyaml/issues/302"
>> +
>>  BBCLASSEXTEND =3D "native nativesdk"
>>
>> Khem, formally this one isn't "disputed". "disputed" is a formal CVE
> programme tag, which isn't there for CVE-2024-35328 as of today.
>

Fair enough. We shall change it. Is ignored ok ?

>
>
> Regards,
> Marta
>

--000000000000fa765e061e8bffde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 31, 2024 at 1:47=E2=80=AFAM Marta Rybczynska &l=
t;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><br></div><br><div class=3D"gmail_quote"></div></div><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 2=
8, 2024 at 4:49=E2=80=AFPM Khem Raj via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">This is open yet but seems to be disputed<br>
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
iv dir=3D"auto">Fair enough. We shall change it. Is ignored ok ?</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div =
dir=3D"auto"> <br></div><div><br></div><div>Regards,</div><div>Marta<br></d=
iv></div></div>
</blockquote></div></div>

--000000000000fa765e061e8bffde--

