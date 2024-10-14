Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231D7D1627F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:55:57 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.56973.1728917754427726732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNjJHAzZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so3226024a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728917754; x=1729522554; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=asBKyxNY9n5enmUKt8EOyOv4GAsxLyMdIb8OYSve/eA=;
        b=lNjJHAzZAy4Lqg7CpvR1b8ezf3whGYrc7MtnfbVMvR4Cn0xpGDy25DaorVmZNuMPJN
         ih010VeCSDGIFOlwDCGquJsQ3ca0AQlidLIPhQtVQTY9asdB67oqzPiRPqIULO4PE9gD
         36L/FbM91r4POLyk0YgSv3lKLZRbnaf8kXr4sppu3L0mUNbTqR8PNQtrxR1seijESCNI
         VcSNuyNnEWTWWITXeGlHW4bZtuSs3lQmlii+mj+pXVC6Hf1AFbRLvff+N6QfmUCuI+LJ
         DMw7+7HaH2jrO6DqO4cJIyKvq/9OqiXYBm3GoO8dwdcVde6SsYs6W9DCW8Es0Muhcgxj
         bNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917754; x=1729522554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asBKyxNY9n5enmUKt8EOyOv4GAsxLyMdIb8OYSve/eA=;
        b=aImPxMGyzyME2RXKzF8Wg4Gz6AuK4IRWvThU+ldbsIjlGmSwRXppPyWo3iyBIPvRUw
         NJocPsspDzBI/NcKXmgFho4+seeizBSGDrifRoYIdiAKcA6vU3aF1AaEzNUP0GCbgRU3
         q6XsYB2Xlw+0m6oF8Hvqc7CtzJxl4mUJFo3n2t4a8xKg6Ta2ltN7DTgagDTD4Ftdz3rJ
         wOHWVYqeDjZdSxlarpY1/Yi6oMJ+503jKDfvp+zRHiiHfjB1GvvNU39+OgOXTKyetvR0
         3fberdjUTUh9Gi2x5RnnsRxymV8ThfLxvhoTcwaWKCt9nilUkX4vX6vbeREtGJKvZqTA
         y0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXGbNHQRt+EtwtaSFNN7VfrLs9xvIh5Py9GLsJJMKUjlGt3cIYHd2+ADU6wlJ6xFqCJEOQiPtzCtDh/P+J1tCgEBQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySU5Dkn9QcttOD25G7Q+BQl8tMBYGRM1iL2wbXn3dYz2h87ak+
	bAS5/wBs5vM17zh4qvMVxZzdFPzTJD11LOLDpFBo0lyfaAgsHNGIc1hStkPcMmHmeCr21XyVWVk
	LmdfKFpuMhIGeyyYvtlDbIfO+mdM=
X-Google-Smtp-Source: AGHT+IHjx9j67kXot2QxA6+s4EFF8qj3UMRzouLfMk92Do7+3q8+DW/5G9ZKiwC3XsHImIa2eaNN+ZkFivlY2HtLv+M=
X-Received: by 2002:a17:90b:3b90:b0:2e2:cd6b:c6ca with SMTP id
 98e67ed59e1d1-2e3153589c9mr10266329a91.25.1728917753569; Mon, 14 Oct 2024
 07:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
 <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr> <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
 <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com>
 <b0778cf2-cb73-4f29-bd6c-474f23639844@smile.fr> <CANNYZj8F7rS1aFF0Zzsf3W-CqH4COk5cVMamcxy=04uTLwYsOg@mail.gmail.com>
 <CANx9H-D6i6jX1hOw5F6Y-8t0jYDu_M4yfYWxDgGD74z2WKyoyQ@mail.gmail.com>
In-Reply-To: <CANx9H-D6i6jX1hOw5F6Y-8t0jYDu_M4yfYWxDgGD74z2WKyoyQ@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Mon, 14 Oct 2024 16:55:42 +0200
Message-ID: <CAJo0Az7fgvc8R-EDoXXyeAmVK0_QcDqs9osH1ud1un8LMEfweg@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Tim Orling <ticotimo@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c2c1d0624710897"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 14:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205784

--0000000000008c2c1d0624710897
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I'll push a V3 of the patch with the comments of Tim added this
evening.

On Mon, Oct 14, 2024, 4:14=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrote=
:

>
>
> On Mon, Oct 14, 2024 at 4:33=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>
>> On Mon, 14 Oct 2024 at 13:22, Yoann Congal <yoann.congal@smile.fr> wrote=
:
>> > > 1) Maturin creates a .whl (zip archive) where files are listed in a
>> > > non-deterministic order in the archive index. I'm not 100% sure if
>> > > your patch addresses this problem - does it? Are the files supplied =
to
>> > > the zip writer in sorted order?
>> >
>> > We did not address this point with the patch, if that is fixed, its a
>> > welcomed unintended side-effect.
>>
>> If you do submit upstream, then confirm that first please. I think
>> it's still a worthy fix, as there can be use cases for installing .whl
>> into target images.
>
>
> We actually did address the zip file (.whl) ordering as well, in the late=
r
> part of that patch. The git commit log needs to be reworded to highlight
> that. We should also sanity check that it is doing what we expect with th=
e
> .whl
>
>>
>>
>> > Awesome, then the python3-cryptography 43.0.1 upgrade should be merged
>> > after your patch?
>
>
> It still has ptest issues in the most recent version from Tom. See my
> branch for outstanding issues (including RDEPENDS issue in
> python3-pytest-subtests).
>
>>
>>
>> Something like that, yes. I've developed that in a broader effort to
>> update python to 3.13 (contained in the same branch as the above
>> installer fix), as existing cryptography version fails to build with
>> 3.13.
>>
>> If you have a bit of time to help, these are the meta-oe fails:
>>
>> https://valkyrie.yoctoproject.org//#/builders/81/builds/42/steps/14/logs=
/stdio
>>
>> (package_qa stuff is unrelated, so 12 hard recipe fails)
>>
>> Alex
>>
>

--0000000000008c2c1d0624710897
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Yes, I&#39;ll push a V3 of the patch with the comments of Ti=
m added this evening.</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Oct 14, 2024, 4:14=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Oct 14, 2024 at 4:33=E2=80=AFAM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">On Mon, 14 Oct 2024 at 13:22, Yoann Congal &lt;<a href=3D"mailto:yoann=
.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.f=
r</a>&gt; wrote:<br>
&gt; &gt; 1) Maturin creates a .whl (zip archive) where files are listed in=
 a<br>
&gt; &gt; non-deterministic order in the archive index. I&#39;m not 100% su=
re if<br>
&gt; &gt; your patch addresses this problem - does it? Are the files suppli=
ed to<br>
&gt; &gt; the zip writer in sorted order?<br>
&gt;<br>
&gt; We did not address this point with the patch, if that is fixed, its a<=
br>
&gt; welcomed unintended side-effect.<br>
<br>
If you do submit upstream, then confirm that first please. I think<br>
it&#39;s still a worthy fix, as there can be use cases for installing .whl<=
br>
into target images.</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">We actually did address the zip file (.whl) ordering as well, in the lat=
er part of that patch. The git commit log needs to be reworded to highlight=
 that. We should also sanity check that it is doing what we expect with the=
 .whl</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; Awesome, then the python3-cryptography 43.0.1 upgrade should be merged=
<br>
&gt; after your patch?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">It still has ptest issues in the most recent version from Tom. See my=
 branch for outstanding issues (including RDEPENDS issue in python3-pytest-=
subtests).</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Something like that, yes. I&#39;ve developed that in a broader effort to<br=
>
update python to 3.13 (contained in the same branch as the above<br>
installer fix), as existing cryptography version fails to build with<br>
3.13.<br>
<br>
If you have a bit of time to help, these are the meta-oe fails:<br>
<a href=3D"https://valkyrie.yoctoproject.org//#/builders/81/builds/42/steps=
/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank">https://val=
kyrie.yoctoproject.org//#/builders/81/builds/42/steps/14/logs/stdio</a><br>
<br>
(package_qa stuff is unrelated, so 12 hard recipe fails)<br>
<br>
Alex<br>
</blockquote></div></div>
</blockquote></div>

--0000000000008c2c1d0624710897--

