Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E2DCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:13:58 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.7066.1758791630584254917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 02:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gpxZzZ9q;
 spf=pass (domain: smile.fr, ip: 209.85.208.169, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso7728381fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758791628; x=1759396428; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CHE2sQ7rSprltJo//jqmcX9T8x9XJw6AfwV6RQn4lKQ=;
        b=gpxZzZ9qjngQkUeMtvwQIAiu24ktB92N68SRgx5SN6d15fv1tJyaShiAN3fgovIkOV
         btEbsfRIl4tKsLT6l/4nVmGfUetfIQGAAG5Bqe/7fCcWlrYtubehO6+UHi/x7NsAd2Oc
         dEa/bSBwdlR3nCtXU9ODTrGc5HOn09s6majww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791628; x=1759396428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHE2sQ7rSprltJo//jqmcX9T8x9XJw6AfwV6RQn4lKQ=;
        b=cN2WvBSA49qbMVzmSvfyGQUuWfHBNDRTev4qU/ZSmoS3XRT2EgUVFabkGTy2Rfl3WC
         I7PKVMgHYbDaN6H3Ib+OKoryxrG6m7mzgGwJhkKH9A46KwM1YNRIj6+uIzhxm9HIMlD6
         YPDUMuNOQIeo9gzv6lQxvYM0JI7BFSp6/3RghBe2ouBmbwt68pbXV79Sh/oZBxhM0Je/
         munTNkAsfVKR2J9ICZp3OmUZH7cqC2BbWVo0LXNoriXw3PxrmWC357U6M+XcQ38t8/ei
         tAY/M8w8okAtt93kVWcDKbUDOxU0OCKnivng/Ln7Ndahuu0DErCJisuiwoYx0ekOsSgD
         swKw==
X-Forwarded-Encrypted: i=1; AJvYcCVv6JToVO1l/UPa6/lYvyXU2BY5U2Svshfa8+Q/0TkqWbnnq1KZbX7/hZYVXFoR/kQeUBd4alOYuhc/SPc9RdDtZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNV5dOMiLODmbfvFZGGsW8DTLJSIKThd0Vl0nQBCIoiYQk3cwH
	RN8nnKe1Qjp+jgfMbaDT9SXdp1ix7wtLhckmDGcf+1t4LMVmAXj3ddMsZZwNnQQjBucF7yXXrkv
	V1z4gr+vzSXBUw2LDQqAXOQq7/egL1fbkujvBKkTCiA==
X-Gm-Gg: ASbGncvsyWINNJgetcSSz8kemgeseOVrfhrOcG8P7nsMlnWSeWcSEjuS4BCnfn68Bmt
	1CsVT+sfn7d8Jl5qcMw9bsD44CIgSnCDhQYJXY8hyXuVc1oWu5+P+RG4UjEbFm60h1nN4Cvr/QV
	89Zmk9e2eVlIlB0ykzz8iz4nBft4q4Erd79C4osylBg1EZ2qetc1RqhyIyJ47yqx5HoUeBN1nii
	nqotQshD9CTCaL5Dw==
X-Google-Smtp-Source: AGHT+IFmwwDH644lXYNt9C/WQIwoCPoRIdah1DiPFAhxaIS+FO4e4gSSjdETySVOzfmttyGSRvgOxwMAXtWrRO17u3c=
X-Received: by 2002:a05:651c:2123:b0:335:352a:3c3 with SMTP id
 38308e7fff4ca-36fb0eb33cbmr5384051fa.8.1758791628320; Thu, 25 Sep 2025
 02:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr> <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
 <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
In-Reply-To: <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Thu, 25 Sep 2025 11:13:37 +0200
X-Gm-Features: AS18NWDOodIwLZBLVUjBvl2kep-KiGAHjrdlESi7P8YJ9smNno-8fcjA_yDqHNk
Message-ID: <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d868a063f9c96be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 09:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224009

--0000000000003d868a063f9c96be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe these 'extra' partitions are populated at runtime (first boot) from
the rootfs?
I wrote this plugin for a project because I couldn=E2=80=99t find an easy w=
ay like
bootimg_partition to install 'extra' files at build time.
If a similar solution already exists in Yocto, I=E2=80=99d be interested to=
 know.

Pierre-Loup,

On Thu, Sep 25, 2025 at 10:23=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Thu, 25 Sept 2025 at 09:56, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
> >> The extra_partition plugin allows populating an extra partition with
> >> files listed in the new IMAGE_EXTRA_FILES variable. The implementation
> >> is similar to the bootimg_partition plugin.
> >>
> >> This plugin provides an easy way to install files that are not part of
> >> the rootfs.
> >>
> >> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
> >
> >
> > To confirm, I indeed did review it internally.
>
> I don't object to the plugin, but this looks like a very common use
> case. How have people been handling it up to now? I'm sure I saw
> builds and products with such 'extra' partitions, but I can't for the
> life of me remember how those were configured. Did they all write
> custom wic plugins for themselves?
>
> Alex
>

--0000000000003d868a063f9c96be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Maybe these &#39;extra&#39; partitions are populated =
at runtime (first boot) from the rootfs?</div><div>I wrote this plugin for =
a project because I couldn=E2=80=99t find an easy way like <code class=3D"g=
mail-font-weight-400 gmail-rounded-md gmail-bg-state-ghost-hover gmail-p-1 =
gmail-text-sm gmail-whitespace-normal">bootimg_partition<font face=3D"arial=
,sans-serif">=C2=A0to install &#39;extra&#39; files at build time.</font></=
code></div><div>If a similar solution already exists in Yocto, I=E2=80=99d =
be interested to know.</div><div><br></div><div>Pierre-Loup,</div></div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Sep 25, 2025 at 10:23=E2=80=AFAM Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 25=
 Sept 2025 at 09:56, Yoann Congal via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" targe=
t=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt;&gt; The extra_partition plugin allows populating an extra partition wi=
th<br>
&gt;&gt; files listed in the new IMAGE_EXTRA_FILES variable. The implementa=
tion<br>
&gt;&gt; is similar to the bootimg_partition plugin.<br>
&gt;&gt;<br>
&gt;&gt; This plugin provides an easy way to install files that are not par=
t of<br>
&gt;&gt; the rootfs.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup=
.gosse@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt;&gt; Reviewed-by: Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal@smile=
.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; To confirm, I indeed did review it internally.<br>
<br>
I don&#39;t object to the plugin, but this looks like a very common use<br>
case. How have people been handling it up to now? I&#39;m sure I saw<br>
builds and products with such &#39;extra&#39; partitions, but I can&#39;t f=
or the<br>
life of me remember how those were configured. Did they all write<br>
custom wic plugins for themselves?<br>
<br>
Alex<br>
</blockquote></div>

--0000000000003d868a063f9c96be--

