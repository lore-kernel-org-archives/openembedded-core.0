Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ED2C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:43:30 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.5134.1720643369222286704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jR72Bfxg;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: jeremigraveline@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e04196b7603so155978276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720643368; x=1721248168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tpZ6/fOJ94vLiJlVb6UO7ZWFemo2DV1mL7J0UigQIB0=;
        b=jR72BfxgHp3ZKG9FLLvRPZp9d2W6DSjYuog/xH7gke1QmoZU4HaNnB36Y6jEVU3rax
         affOFaMipq0a8nnIoPKROdyCCm4GERqDGq2LZBl6XQwBvZIdt2QTx0p799BW5qS7iUk/
         nNwb8RPJkK9GCC7tCGDoaH/NoG+KCkYj66SpfP6tnsk0xSO+9CdGDaX6G4XKHwfkbPDV
         kKFwkwd61miqvpNzNmqIeWywOFskZJKxXDuZH2M7FEsIfFAnMuMyG825T1MUoMhGqMSF
         PIamorPym86sgcFfDwYo+59wgaJ9HzpblljN+0whH0pVBr0t1mxLlXxjZTeQIiMyJrqv
         bkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720643368; x=1721248168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpZ6/fOJ94vLiJlVb6UO7ZWFemo2DV1mL7J0UigQIB0=;
        b=W3hIEeSqGYpVCxcl3MAR5UdNS1HbI1/Snx50ZsgBGlP4ViFdEB+I3V5JPNoaCIegm5
         22ITZJxR2re+xepkSeGT5fr1mKJxuX+wLWsXzwDm3k34oVxBaXACTe9lnqPeC+CLXHfF
         WEQGhgi+DfhzAHyOo0nbreog37Iz/51kmrOf38sFZUAjyh/jj3rEhEl5ZJyIFcRPrfNv
         J475yg7Njogk1jMoEWAIREBb9s9XZzkS3Un+QVRhcNqF2bDTrcQv5BBfmxsEfHNmm3DU
         nPEsOZgz3FEQj/wXEICsBxNVNXCQdvA/6BqmW0z8LkN88bKyZ+n290ItcoSwW3GFov/Y
         /n6Q==
X-Gm-Message-State: AOJu0YyVmoCmy1TFc1X0Gved6Q5MZwF0E/+bBhml5M8UzCbXVpREzqQu
	agFmG1pLzQ+imeLEfUNkAIJPkNNabOqzJixD2ldEL43FZs7VeE4pu+MRgBYmMzc5UDNvIwRRU6L
	i7+T1bwRWVy9ebGEaPc5hqkvNVhgghA==
X-Google-Smtp-Source: AGHT+IHPd2Azvvd6HlF+Xd7NuDh01mXtpfM/fNwh7jQQRC2lLI+SwjOto8YZ9OD1LSwn83csY3+a38booPzaMgMEZeU=
X-Received: by 2002:a5b:48f:0:b0:e03:229d:69e5 with SMTP id
 3f1490d57ef6-e041b058796mr7242906276.17.1720643368398; Wed, 10 Jul 2024
 13:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240710193743.3686800-1-jeremi.graveline@gmail.com> <CANNYZj8BmMQPjfVTh_x80ssbYaaxLzsw-ZpxVJFuZT_9WiJ9EA@mail.gmail.com>
In-Reply-To: <CANNYZj8BmMQPjfVTh_x80ssbYaaxLzsw-ZpxVJFuZT_9WiJ9EA@mail.gmail.com>
From: "jermigra" <jeremigraveline@gmail.com>
Date: Wed, 10 Jul 2024 16:29:17 -0400
Message-ID: <CABGZR5rATZYeLP5c1TudH-2ky48X2MOaWOuXXuMEhka6eimMSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Use override style append so generated code passes oelint-adv.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2362d061cea809a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201746

--000000000000c2362d061cea809a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I understand, it is true it doesn't really happen in real recipes. Is the
new version of the class bad though? I cannot find a way to suppress the
error from the recipe itself and wish not to edit the generated include
file.

Thank you !

J=C3=A9r=C3=A9mi






On Wed, 10 Jul 2024 at 16:03, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> But does this fix any actual issue? It=E2=80=99s not enough to justify th=
e change
> with a =E2=80=98linter is complaining=E2=80=99. Reading the link, it=E2=
=80=99s about supporting a
> hypothetical weak assignment to SRC_URI, which basically never happens in
> real recipes.
>
> Alex
>
> On Wed 10. Jul 2024 at 21.47, jermigra via lists.openembedded.org
> <jeremigraveline=3Dgmail.com@lists.openembedded.org> wrote:
>
>> The oelint-adv linter checks fails when linting the recipe generated whe=
n
>> inheriting cargo-update-recipe-crates class.
>> It fails with the the oelint.bars.srcuriappend error. See
>> https://github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelin=
t.vars.srcuriappend.md#oelintvarssrcuriappend
>> Fixed by using override style append instead of the +=3D syntax.
>>
>> Signed-off-by: jermigra <jeremi.graveline@gmail.com>
>> ---
>>  meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> index a19ce16b46..88a5b0e4dd 100644
>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> @@ -31,7 +31,7 @@ do_update_crates() {
>>  def get_crates(f):
>>      import tomllib
>>      c_list =3D '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}'=
)
>> -    c_list +=3D '\nSRC_URI +=3D " \\\'
>> +    c_list +=3D '\nSRC_URI:append =3D " \\\'
>>      crates =3D tomllib.load(open(f, 'rb'))
>>
>>      # Build a list with crates info that have crates.io in the source
>> --
>> 2.25.1
>>
>>
>>=20
>>
>>

--000000000000c2362d061cea809a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br><br>I understand, it is true it doesn&#39;t r=
eally happen in real recipes. Is the new version of the class bad though? I=
 cannot find a way to suppress the error from the recipe itself and wish no=
t to edit the generated include file. <br><br></div>Thank you ! <br><br>J=
=C3=A9r=C3=A9mi<br><div><br><br><div><br></div><div><br></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, 10 Jul 2024 at 16:03, Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto">But does this =
fix any actual issue? It=E2=80=99s not enough to justify the change with a =
=E2=80=98linter is complaining=E2=80=99. Reading the link, it=E2=80=99s abo=
ut supporting a hypothetical weak assignment to SRC_URI, which basically ne=
ver happens in real recipes.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Alex</div></div><div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed 10. Jul 2024 at 21.47, jermigra via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;jeremigraveline=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">The oelint-adv linter=
 checks fails when linting the recipe generated when inheriting cargo-updat=
e-recipe-crates class.<br>
It fails with the the oelint.bars.srcuriappend error. See <a href=3D"https:=
//github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint.vars.sr=
curiappend.md#oelintvarssrcuriappend" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint.v=
ars.srcuriappend.md#oelintvarssrcuriappend</a><br>
Fixed by using override style append instead of the +=3D syntax.<br>
<br>
Signed-off-by: jermigra &lt;<a href=3D"mailto:jeremi.graveline@gmail.com" t=
arget=3D"_blank">jeremi.graveline@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass<br>
index a19ce16b46..88a5b0e4dd 100644<br>
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
@@ -31,7 +31,7 @@ do_update_crates() {<br>
=C2=A0def get_crates(f):<br>
=C2=A0 =C2=A0 =C2=A0import tomllib<br>
=C2=A0 =C2=A0 =C2=A0c_list =3D &#39;# from %s&#39; % os.path.relpath(f, &#3=
9;${CARGO_LOCK_SRC_DIR}&#39;)<br>
-=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI +=3D &quot; \\\&#39;<br>
+=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI:append =3D &quot; \\\&#39;<br>
=C2=A0 =C2=A0 =C2=A0crates =3D tomllib.load(open(f, &#39;rb&#39;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Build a list with crates info that have <a href=3D"ht=
tp://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a> in the s=
ource<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</div>
</blockquote></div>

--000000000000c2362d061cea809a--

