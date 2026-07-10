Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C267C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:14:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11242.1783685659956741567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 05:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cF1sl1Yq;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso5287585e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 05:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783685658; cv=none;
        d=google.com; s=arc-20260327;
        b=NYxe7BbwbxBjhaGuThJYiyMI/4Cw0zpZCDlhnIeIGU1DQYs3rCXaV/XExw7+xX5oBu
         vcxyI8whG3y2kqbuPm1iQdyA12P401cVOondxWSbg53goU9RRxjTPCnuwtm9SKlGKpCC
         9UV5rtuqjJiXcdfh6YbtQVAREvNVW0Nnf3yguwKccUmGlFjQOu0FC0Yn4m/n1QQ89blo
         9bOv/wnEGlB9FTYGmroIi2mVes9PZQiyq8sOqovb+VQA9CUDrcL8CifwVMM0eX+6T1iT
         bk5D6Oko/OtcsNBt4KC0L0xue8ZrKTBZI6GCT0EKBLdso1WJqvVh3ZNN2eJTshJ1Yqvn
         eCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+EI4PEt2BOTY0ZBrnK2n+eflkKoUQaQrKfRt5ZhRaIU=;
        fh=y2ZzEpokxloFPd1n0toRW68xTNIei7xMVb7ZlXKSGps=;
        b=jFQ6XdTJyZeV4KgGqhL1ZsQCMseqmkoLCijkBJEGqkja5ccbp6lCas4rnfKHmIYanT
         sZGNdNB+XmnDwXto3bTysXWztOZ02QsWgo9uUARP6Ys7QJ3LHwCUPxFWd4I7cV/EsZ2x
         ho21JlYY6nheE5jyJEHCxuGQIwpHPrAJMT3H2934ZfzhMLCpx4hg14v4bszumdshPmWc
         aAL2fuP27C6UEadeX4lpnWApnPbSKIfzxT6KcFz1TAkbfjhHsIbZRXpg3nv0WFRBhKXz
         DpHJIQnG2wMTcdkbU5IUp94tkKiI5g7PjpZ56vhxc7Mlq7XcXQ5lXLvxWxgZdh9z8NLM
         73lA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783685658; x=1784290458; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EI4PEt2BOTY0ZBrnK2n+eflkKoUQaQrKfRt5ZhRaIU=;
        b=cF1sl1Yqfksb+sSAwmlxc1D7L1Ej//PUIiwgMa49sVH/n1ObEBb4XbYNJNNiS6Ihgx
         o/Uv/8Gbc8tFi3R8h4qgf6HXhUHT0RjV6zwAbpVJC3B85KIcnTMweBIOaqn/AJj+Q+Uv
         0bYBCiDJz+TOCx6oK8LD73GxPdZ7btQCmUvuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685658; x=1784290458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EI4PEt2BOTY0ZBrnK2n+eflkKoUQaQrKfRt5ZhRaIU=;
        b=a/SliB2tQf/2qMEWGoL59LvD3xpctMgpsz3j0vDrr3+oK/GrfdPZGVtw6zfjCOytdf
         ehsXn/GCpN+Ph6OwnAlzvytxuALG7Kwi/RaTVuuNDyTCsmXBXIHjck7/NB/PqJWNZrUV
         Pe/R5hDay5+/3Ib2422Gt9y41I12iwCGBwXB5puytPUO2SWSUVJotLScyA4lj8HzxTmI
         cCJsMbCETKy9Tleg3OI929PeqPbD7V9jbayIb5JuOWzZk+Mtnsdi6XqXKI7UqazRbqId
         XA5w2lFl+urw/mCmrIOsTyCq6O2Yijq6C/0xF2uO73mmBpPEbZqjsy9ljfTI4XNxukoH
         dSEg==
X-Gm-Message-State: AOJu0Yz0cX0p9tJhGyLZinGV2Na8ePU54/iDKLxupojQflSM19NfT2N3
	2nVxyCGJJeH8gxYhsA3LczzhccleucOaz7DQpD5UKTNfhaJc665nCSS/w9QFiiS1xJW7PImdRxZ
	3UwzcqIJa+so3txva1tbQMnO4kJg35J6kSaW5sS+xcg==
X-Gm-Gg: AfdE7cnDZ4RIJ4CaayQr3wE6Fm/E9+VrkMkzshXhwMa6oB1R/k8eDX0/cAzrdAWxshX
	5ysbGlkwyz8+VhVIzTo3Vh2TsSEpQjLEc06nySW25f7FR9jwzAcADC5tkzhMcU12Eq8DVNhWNfN
	CsOh7aQWYkDaWB7usaiKp6O2wWpeSqD8sKtsIV/298VgMFDWcIeJH1PM5qCVjKjBY+RPaPcg+/r
	+x906Zhn8JrvNxi2iS9US9o5+goD8lk+04VPPvT/jem6Jl6BzGIwRR/qjv6owsfE85mbhir5210
	44w4GhJ+bdrUbS+VFH7DOr+gruXnDpY=
X-Received: by 2002:a05:600c:3b2a:b0:493:c182:6b08 with SMTP id
 5b1f17b1804b1-493e68ecf7bmr117935975e9.36.1783685658052; Fri, 10 Jul 2026
 05:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260708142249.916053-1-pidge@baylibre.com> <DJUSZJTUMA4P.2YSMPEY5JDSXH@smile.fr>
 <CAOo+uBXS8BC78jsh80h5Xz41_FRfWtxi1_py=eyc=5Ba3tA3dA@mail.gmail.com>
In-Reply-To: <CAOo+uBXS8BC78jsh80h5Xz41_FRfWtxi1_py=eyc=5Ba3tA3dA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 10 Jul 2026 14:13:51 +0200
X-Gm-Features: AUfX_mxu9AN2lHeTe4Z01Xepja4S9rAjtYH5RHXddNmXiaMtjjrK_qVI1Y3586Y
Message-ID: <CAMSfU+5r-+hpQ9XTa51=HG28s6pqRA5FmzxQP7u8BTj9_5BxXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
To: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000a1f10065640aeba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 12:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240633

--0000000000000a1f10065640aeba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 10 juil. 2026 =C3=A0 14:00, Eil=C3=ADs N=C3=AD Fhlannag=C3=A1in <pi=
dge@baylibre.com> a
=C3=A9crit :

> On Fri, 10 Jul 2026 at 11:02, Yoann Congal <yoann.congal@smile.fr> wrote:
> >
> > On Wed Jul 8, 2026 at 4:22 PM CEST, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in via
> lists.openembedded.org wrote:
> > > The tpm PACKAGECONFIG passed "-D TPM_ENABLE=3DTRUE/FALSE", but ovmf
> > > renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
> > > ("OvmfPkg: rework TPM configuration", first released in
> > > edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
> > > that edk2 ignores, so TPM2 support was never compiled in, even for
> > > MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.
> >
> > Hello,
> >
> > By looking at the version only, should'nt this be backported to
> > scarthgap as well? It has ovmf edk2-stable202402.
> >
>
> Yes, I wasn't looking at scarthgap, but yes, if it has
> edk2-stable202402, then it should be applied there as well.
>

The cherry-pick has no conflict so I'll put that in my review branch.

Thanks!
--=20
Yoann Congal
Smile ECS

--0000000000000a1f10065640aeba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 10=
 juil. 2026 =C3=A0=C2=A014:00, Eil=C3=ADs N=C3=AD Fhlannag=C3=A1in &lt;<a h=
ref=3D"mailto:pidge@baylibre.com">pidge@baylibre.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
10 Jul 2026 at 11:02, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile=
.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed Jul 8, 2026 at 4:22 PM CEST, Eil=C3=ADs &#39;pidge&#39; N=C3=AD=
 Fhlannag=C3=A1in via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; The tpm PACKAGECONFIG passed &quot;-D TPM_ENABLE=3DTRUE/FALSE&quo=
t;, but ovmf<br>
&gt; &gt; renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0<br>
&gt; &gt; (&quot;OvmfPkg: rework TPM configuration&quot;, first released in=
<br>
&gt; &gt; edk2-stable202202). Since then TPM_ENABLE has been an unknown mac=
ro<br>
&gt; &gt; that edk2 ignores, so TPM2 support was never compiled in, even fo=
r<br>
&gt; &gt; MACHINEs with &#39;tpm&#39;/&#39;tpm2&#39; in MACHINE_FEATURES.<b=
r>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; By looking at the version only, should&#39;nt this be backported to<br=
>
&gt; scarthgap as well? It has ovmf edk2-stable202402.<br>
&gt;<br>
<br>
Yes, I wasn&#39;t looking at scarthgap, but yes, if it has<br>
edk2-stable202402, then it should be applied there as well.<br></blockquote=
><div><br></div><div>The cherry-pick has no conflict so I&#39;ll put that i=
n my review branch.</div><div><br></div><div>Thanks!</div></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</fo=
nt><div><font face=3D"Raleway, regular">Smile ECS</font></div></div></div><=
/div>

--0000000000000a1f10065640aeba--

