Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C89E87852
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 17:29:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22588.1770139768839069463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 09:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kro73B9h;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8837152db5so935914266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 09:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139767; cv=none;
        d=google.com; s=arc-20240605;
        b=G7f445KG5c+A29rwQ6GASc2AiF60xgh3onYWvg0X2gp5US2FfPcyOt8yopaqQjzcx9
         avH4b74l1Dr9nvRsFO6Gm0A8ZQoOVZDQY3tvQ6jUk+HBO1hG9iFRHy7v8GuY0h+yv9yZ
         YYCQvfw4BCJdbo1NxrfydA4nqUFVIEXhywSqy2NzRt+K5zn9gG5yqBGhovE9u50JgFZh
         ApJ4zP8cuAQRVtqhltb1TMyj58M/842Udoqf+lWqx1Bo7ilmAlDVwYVKz0OM7XJe8heT
         1mQp2GJinYeT9Eu+0Qa/OY0AFgtEdXvSfcOYn7bDsDM/Lk7sZx1KUt7JOL8FUck+d9ir
         IO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ntI670K6IE+G2UZYhxKC6Mz2SlZh/Hy+GNoylZHEdsY=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=inmM/08zqU8IZeXvOoucKuMQEnucHESNf6h9tKH6pKM5SmuaqARkzYY25A3okRpqFp
         ApOqdAKENq1SfogB2G/nwL6ZRdK7HTqQHZCDtvm4G2XrxVtmpJXjXCPcHFtT72D/4ylD
         v/82E1miT6d425f351Y4W9NBB8nLXT1jD2+5V5yJmaD7jaTV1MPu3rRTfjB5gtrJX+Co
         LkCFRdX26NRMXKDAxpYIB6Aa4v78l1jpmcqcIQIxWRRGZML2xykmjhW/CP1azd4oO9IL
         2uV1BlfcaqGGoiyiaw0bJ/rEh9Z74YmktFsCumoAlCwC6HFTPG70dITo8qcQnwAoTGSQ
         CGaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770139767; x=1770744567; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntI670K6IE+G2UZYhxKC6Mz2SlZh/Hy+GNoylZHEdsY=;
        b=kro73B9hnMyZuAmmQYsY9/pzFNZ7d6VkyLMbNNwTsOxGTaTxoThlBw90Aw7Q4Gu4LX
         Y8BbkQYKLR8M2q5biAHaIi7PdNT2kDWa68c5E4C5I22JvZ3SSjKbp7fe+Nd5YzL/co/k
         EUj0PwW+nA3znqCihLJIuX/dUWyDjsJQiGYezaMsFRYP0nWdaCPSriYDDGbBMlQYY8VO
         dR83yuB6XpA5mHZAi+VWEXkDEfOM1iNtmnHH4Qc989h2UAkyr7mzjpdTXxR65lNBt0lQ
         gRoZQ0P+N5cbicvC3aWrQEYvrzsG4VwtzUddcVxC8lmUc6Jzf9FBCZyFwmL2jNUOu9Ra
         +wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139767; x=1770744567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntI670K6IE+G2UZYhxKC6Mz2SlZh/Hy+GNoylZHEdsY=;
        b=W7WhwuOQkNtMZ5a8ZC5Vn+3AyZc8lp/vP5FCh5j0VyVmoI2bo94y0IcSoBKalE3/4N
         ssIsUt675rs9dq1O6HQALyvbVULwYzUgSOvHwoikNLI2Syc/cw6qDpy3c5O34CF5Gh7L
         4TVDkc4BH7TXXxiJt9UneiY7H6NHkWA8oX9kNfnEpnDVoSD7H6f7vwZDHJyyU1rnWpwa
         X+grpI+0QCfRNxnhOlgzGVlA4dLfr/S0gkYDKULv4RGvsM54s6lRWZ6IMDm8b53g0B1k
         Gaz5waS9/6UBROeCzmgI9vVgkqjo1YNocqOzmgiR7IKBr3AYNX2b1auwy2K0DHk0smZJ
         dYqA==
X-Gm-Message-State: AOJu0YwUoBo8wXo2fyyuGHapDGOjCYHlXkcDaQobjSlL+iQEAsAoyM/1
	W+NLzhQLu9OcK0uETVUeAg/sJQgcgJVI9bKpIHhRZQUBl770isLc/psyhXG18nl+QatIjZfUJqK
	i9YfCKoPhFlzdW6h7V29X5dNyA4xNp6c=
X-Gm-Gg: AZuq6aJmPuONITLGFAyyfRUgta/2IBP8U8lrj8mHwvjwctpzejm+SEDvZMOpTtXvl1o
	2SfpJBxIFxVkXXVxEXA+RlqOmm3ID0YimTp3zNiYyk/vLwL5izVj0SS6YSUkcg3tQaqpcErVyEQ
	BeYvFbw0Z333HanFyxp38wf02zhNKpAXrR/OMnY5AFMOHFXBXBilXDlMlE6ZxtBAFqrJ+A5Yc0A
	zX+VRa6cbQqWDTKkHr03a2wFJrM5kSWJg8FjOKldE9nTd+/ir9SFjr+ILHuFlWZKym5k18BmJNx
	8A3k
X-Received: by 2002:a17:907:86a1:b0:b8e:796a:fd5c with SMTP id
 a640c23a62f3a-b8e9f0d4b28mr22009966b.27.1770139766998; Tue, 03 Feb 2026
 09:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20260203143434.3117764-1-samuli.piippo@qt.io> <CANNYZj_WD666FjyPdrrrWCGqsSb+cgLen+y2K8rD-Vhx-UcpYg@mail.gmail.com>
 <CABXoSoVRGebfQDmN8Sc2X7v93gbxkZ7dY5u8tXLdPGfFs-MBYA@mail.gmail.com> <CANNYZj971x3HpzeNAyT7JNmynkZOg0cTTF7jOb38g4LD2hA7wA@mail.gmail.com>
In-Reply-To: <CANNYZj971x3HpzeNAyT7JNmynkZOg0cTTF7jOb38g4LD2hA7wA@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 3 Feb 2026 19:29:14 +0200
X-Gm-Features: AZwV_Qi6ErODrjSiLZQsZWyMSQcxMC47eCZ2rPudtOoH_ZYzHmydiDn-FXQDv04
Message-ID: <CABXoSoViMVD6XN2PUnAEnoz_x8kZmiVAmCrmCn7Q1ivHouwc6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe/utils: filter license packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003c9570649eec844"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 17:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230467

--00000000000003c9570649eec844
Content-Type: text/plain; charset="UTF-8"

Issue is inconsistency, that's all.
When lic-pkgs is not used in IMAGE_FEATURES, then only these few license
packages are installed.

Does autobuilder have a build config with LICENSE_CREATE_PACKAGE = "1"
needed to create the -lic packages?

I'll update the commit message.

On Tue, 3 Feb 2026 at 19:08, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 3 Feb 2026 at 17:57, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
> > The function is used at least in PACKAGESPLITFUNCS to filter out all the
> system packages
> > and then settings rdepends/recommends/etc for the remaining dynamic
> packages.
> > Without this commit, the *-lic license package gets pulled in
> unintentionally.
>
> But what was the issue caused by -lic packages being pulled in? This
> does not cause problems in testing, so it would be good to know how
> you arrived at having to change this.
>
> All of this should go into the v2 commit message.
>
> Alex
>

--00000000000003c9570649eec844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Issue is inconsistency, that&#39;s all.</div><div>Whe=
n lic-pkgs is not used in=C2=A0IMAGE_FEATURES, then only these few license =
packages are installed.</div><div><br></div><div>Does autobuilder have a bu=
ild config with=C2=A0LICENSE_CREATE_PACKAGE =3D &quot;1&quot; needed to cre=
ate the -lic packages?</div><div><br></div><div>I&#39;ll update the commit =
message.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Feb 2026 at 19:08, Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, 3 Feb 2026 at 17:57, Samuli Piippo &lt;<a href=3D"mailto:samuli.pi=
ippo@gmail.com" target=3D"_blank">samuli.piippo@gmail.com</a>&gt; wrote:<br=
>
&gt; The function is used at least in PACKAGESPLITFUNCS to filter out all t=
he system packages<br>
&gt; and then settings rdepends/recommends/etc for the remaining dynamic pa=
ckages.<br>
&gt; Without this commit, the *-lic license package gets pulled in unintent=
ionally.<br>
<br>
But what was the issue caused by -lic packages being pulled in? This<br>
does not cause problems in testing, so it would be good to know how<br>
you arrived at having to change this.<br>
<br>
All of this should go into the v2 commit message.<br>
<br>
Alex<br>
</blockquote></div>

--00000000000003c9570649eec844--

