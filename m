Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEB9CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 17:10:58 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18709.1791825056608972321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 10:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XkpfpU/n;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-918f75a68f0so37985056d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791825055; cv=none;
        d=google.com; s=arc-20260327;
        b=GxhMJWKn5McSYaDYbxs5dNLenDZnur2jfcXIRnK+DcGE7ETe0kpgs8zetAkBdKubhV
         lKiD/8+J6rh/YHFPL+TDuLYTKbIV+B0e3kdh3+JcwEM58AjdAj8o2ltsnCAbvQh3sLsa
         iomNgYb91ZxCJaES7vJD7o+b99x/+vb6RztNL4RTeheNntnHuhEC9GIPWvCbubuOg0GM
         gJUYERhJZScio0aQjiXRrMDKi1UP2L17sH3NaznjeTxeliFpkgHBHdwYGXE+TT7kygpF
         zfIK4/Javn9wQxuoPiuVDirzqAI43p8czXCLRWSyY6Z3V+SeIwg2nT246v1ZIuW/ojcr
         bCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hcYIXqkLUD/Bj4cZDz74Iwi0/k8c3fvDCXtTlDgPKuM=;
        fh=hThK4KWvWGKkZiUGelWVRBfNqFjCPwj6T9E05Ls2uEw=;
        b=FvzaZ1MwGI/pFUtE6X/j+KaHZzOAjkhJqKnF0+PeVbhumup99slgH2n7OuqXwP7iFz
         fbmjOC7pay3REa5W1fqGqWRj+RpQDrz9h6ixd25Xtq0x/6rVv77CDN7NVsPuPw9H6ISi
         db8J2do2bcgrG4owfXH1aCf4/o+xDMgxaLWV0eLNKVFJTnx0iZSOsG9FHA8A0a982wuQ
         NMftHS/aoUNSkwROfBxvKGxKPfHZF5lO0oTmgTW09rA7uxEw/7RFSM2+dApkFDKJGmsu
         Y3AZK8oEn4ybGdw4o4xv13lD+RvO6YLZ3OBeSxXGlnXvV66TuFfyB7a1Z9neyKvQmcLg
         HH3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825055; x=1792429855; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcYIXqkLUD/Bj4cZDz74Iwi0/k8c3fvDCXtTlDgPKuM=;
        b=XkpfpU/nAO+N5lKEf9X2wKdnENTmLy0taIRssVLSXqdm4T4qPMq/rv6DdV9uqioATU
         wBeb9R+cOiZyRYt2IEEszTotkL7j7YDxeIRI3dveDQBKQeO/NksUPJAV3VqqWYc5nj7J
         /37XhntQ/6GeO2cWBQ1hJ+ek+nXIqnBGL0mtt179w8B4Ys1bhOxHL2qgHVGaCDClA3Xc
         t+ol4hgtjZKEmbeiGBokBq/B17kF/DH1MbHHE5N5hVHEAd77kcT+CQzNjptgt7wWzgPF
         kmV7oL+ij8vfI5JQZrAnHvqL6NZ1s8VXxD4bvVNwa+0ddbndkXVqeVXa98sHZAIYri8h
         ArgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825055; x=1792429855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hcYIXqkLUD/Bj4cZDz74Iwi0/k8c3fvDCXtTlDgPKuM=;
        b=2A3m9GsJgaxrcSbszLalQut0Kx9NaK8gBU4XIyIQxfiNQ8d/xk98wah3Ojxz6vB8vC
         MKdDqgMyrbfvN0TSJ3PaOpuN3XsT88MdBgO/6MFN4ZPKIUjpVzMs/zFqeDCp3ePXwIzW
         yF7Wk4iIb4xUsnZ5fboh3GjrQqOqJTazQdUTMoeeYudFDp+CM4aoNUdEbSfeVambNQLE
         8dqUc33jEjvY6aadypHeAR/Ccj7e7lG/yQbM8vViB9kpWvtAxP1rNN29JxjsaxjWKyw4
         VvLiHgLgac85+w5GRLAddJq7z8qDi9VEnDfBSVcL7a/FXEQnjVhu/6YojYjIaWHtW/V3
         oUnQ==
X-Gm-Message-State: AFq9FYI3IQbR223azCl+NXrypZD2utkS7qZsTSqh0Gk3nwqXR/05edN0
	AkZfVUJX7RCUL9yKslX4rwsFihPwlGbCKJbpp+SXdQHeCJrcfo85mUJ7XHBkmErGXhChiRR+5qk
	bJiFMhNPwPnBhaeep4qX7tuD1cIv7+aw=
X-Gm-Gg: AYBFou3q3toXWBvfu1m6C7d05w6Y+QXIT/vzKvqezfi+JSIQdMKKTpOxdsOl+ieUDBb
	SVCVHSsTzgej8sarusFOgYLyiiQ9tBTL6DECVQnCPf7lJD65BfNljzA26qvuyj4DzJn/LGdg7yt
	rXh6yEE9cqx7os7nyf5mynGaN0u/+0KakSaEQMse6s69jxFJg0xk2j6R9DG2dWscHMfdvezN65E
	Sj0IkN7DcijUGR0YNn3aTAOTkZx0AXfmsq+TzH1TvDsismY0epU0JwYDt87Nw3IOWDN8aEcEqXR
	8qEOYQ9eVp8492q6VARMhLYSBWP6XZj8cxfmcXpzRoz4DvkiCUiVr/cC+SUNyHFtDOePAM8CT/7
	Lz5Ay22ZVZHEeNA==
X-Received: by 2002:a05:6214:469f:b0:917:7b68:c929 with SMTP id
 6a1803df08f44-91b550b544cmr190111806d6.0.1791825055339; Mon, 12 Oct 2026
 10:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261007055820.59633-5-jaipaul.cheernam@est.tech> <20261008182158.8783-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261008182158.8783-1-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2026 19:10:43 +0200
X-Gm-Features: AclHuK_Vo16Qpagweihq5Txh45XZ9j8n055uhABW_yQCCpCMxeQ3xuwkwhfVbMU
Message-ID: <CANNYZj_jMnU7HKc+F-WF7NooAG587zM=E=ucPrxKTXaCouRNxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-more-itertools: upgrade 10.8.0 -> 11.1.0
To: jaipaul.cheernam@est.tech, Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec60e5065da7c790"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 17:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247672

--000000000000ec60e5065da7c790
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 20:22, Jaipaul Cheernam via lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:

> - Extend the ptest-runner timeout to 1800s on riscv32/riscv64 for the new
> slow TestConcurrentTee.test_concurrent_consumers.
>
>   qemux86-64        PASS      18s
>   qemux86-64-musl   PASS      19s
>   qemuarm64-musl    PASS      27s
>   qemuarm64         PASS      28s
>   qemuriscv64       PASS      1654s
>   qemuriscv32       PASS      1702s
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Changes since v1:
>    - TestConcurrentTee.test_concurrent_consumers test is test spins up 100
> threads,
>      each fully consuming an independent tee of a 100,000-element
> iterator, with locking/synchronization between them.
>      This values are hard coded, so either test case needs to deselect or
> timeout needs to increase.
>      So, I choose to increase timeout for riscv64/riscv32 rather than
> deslect.
>


The consensus in the patch review was that a nearly 100x time increase in
TCG vs. real silicon is still pathological and needs to be investigated
(assuming all targets run exact same test code). So can you look into that,
perhaps with guidance from Trevor (or maybe Trevor can also check what is
happening)?

Also a 1800s timeout when the test takes 1702s is too close, and that can
easily go over on loaded autobuilder machines. For reliability, it would
need to be at least double what you observe. But if we don't make progress
with figuring out the slowness, we should probably disable the specific
slow test, rather than let it run for 30 minutes.

Alex

--000000000000ec60e5065da7c790
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 8 Oct 2026 at 20:22, Jaipaul Chee=
rnam via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tech@lists.openembedded.org=
">est.tech@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"gmail_q=
uote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">- Extend the ptest-runner timeout to 1800s on riscv32/riscv64 for the ne=
w<br>
slow TestConcurrentTee.test_concurrent_consumers.<br>
<br>
=C2=A0 qemux86-64=C2=A0 =C2=A0 =C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 18s<b=
r>
=C2=A0 qemux86-64-musl=C2=A0 =C2=A0PASS=C2=A0 =C2=A0 =C2=A0 19s<br>
=C2=A0 qemuarm64-musl=C2=A0 =C2=A0 PASS=C2=A0 =C2=A0 =C2=A0 27s<br>
=C2=A0 qemuarm64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PASS=C2=A0 =C2=A0 =C2=A0 =
28s<br>
=C2=A0 qemuriscv64=C2=A0 =C2=A0 =C2=A0 =C2=A0PASS=C2=A0 =C2=A0 =C2=A0 1654s=
<br>
=C2=A0 qemuriscv32=C2=A0 =C2=A0 =C2=A0 =C2=A0PASS=C2=A0 =C2=A0 =C2=A0 1702s=
<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
Changes since v1:<br>
=C2=A0 =C2=A0- TestConcurrentTee.test_concurrent_consumers test is test spi=
ns up 100 threads,<br>
=C2=A0 =C2=A0 =C2=A0each fully consuming an independent tee of a 100,000-el=
ement iterator, with locking/synchronization between them.<br>
=C2=A0 =C2=A0 =C2=A0This values are hard coded, so either test case needs t=
o deselect or timeout needs to increase.<br>
=C2=A0 =C2=A0 =C2=A0So, I choose to increase timeout for riscv64/riscv32 ra=
ther than deslect.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/blockquote></div><div class=3D"gmail_quote gmail_quote_container"><br></di=
v><div class=3D"gmail_quote gmail_quote_container">The consensus in the pat=
ch review was that a nearly 100x time increase in TCG vs. real silicon is s=
till pathological and needs to be investigated (assuming all targets run ex=
act same test code). So can you look into that, perhaps with guidance from =
Trevor (or maybe Trevor can also check what is happening)?</div><div class=
=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote =
gmail_quote_container">Also a 1800s timeout when the test takes 1702s is to=
o close, and that can easily go over on loaded autobuilder machines. For re=
liability, it would need to be at least double what you observe. But if we =
don&#39;t make progress with figuring out the slowness, we should probably =
disable the specific slow test, rather than let it run for 30 minutes.</div=
><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"g=
mail_quote gmail_quote_container">Alex</div></div>

--000000000000ec60e5065da7c790--

