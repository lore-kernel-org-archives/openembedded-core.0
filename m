Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20896C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:44:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15187.1737733458578227744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4+JZzGg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: marc.ferland@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeef97ff02so416758266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737733457; x=1738338257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p7LVJVr5AiIVb0TbiiqEaGgKx8hrXoT1cWP53bHPGG8=;
        b=N4+JZzGgiMMMhggUeoaCQfdXnOaqQdO3QyhsANtcwKDhR9HEnkTMu3B9FFCWsOEt5Z
         FYZLoNygX+VtNNY1jZS/f0EkZggUwhHjTrfQjPH6z9xSQ1sW6A+TwSMZIRRxG8Cqf+EO
         g4BqNuC2EkwOb289/aDzTq3/qJ0Kv2Gnn7z0WG4eaZ1hwiNu0ZQ7kwq71z8aD9vVRtNl
         mWwy6G6Cwzp+UrxJcrlRDWlexu4c/0gLIZLOOCT9GnVY0VXsW8iPXhy2gphGD5haCZd3
         xwcAcufnkvayLpKT/En6kBkz7fMiWvs6tFRSRulFiHupeYdbqdxD/kWYqRn2ADUqZpmm
         CqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737733457; x=1738338257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7LVJVr5AiIVb0TbiiqEaGgKx8hrXoT1cWP53bHPGG8=;
        b=Oyl9aCsIynMplQkwEablWbRbn7ShHSKgnboTRmX88M5qog9snzRNZuZH1CEUEgEnTK
         MQodhezvFHBCNMMQ7q57pYvX/iINj9TfL6FtwhiXngAnmfmckoeNQKmxnxy1/YYkwMRs
         ug/NNV+o9hEecChCWwILLIRjzkMSll+6GNekzflXfK0XK8MxSe3g9CT9/FY5jgVk3L01
         //KOsQOCAQYIPnZBoejGim2vd4FEGXYQbpI5WkzspsYgNECJRLvZghApXC51B4Y6boV6
         J88tyPTYNFSPwTFZ509dBWfsNaK9Rpt8/3y8TmNBVzW6cwNjEP15UkOz0unyXB+E3vOG
         HucA==
X-Gm-Message-State: AOJu0YxSUbqNbevMmrwk6E4HKI1rM3j4TZthblS9cAIXxXmfRXaWJpk/
	pitatoZpSVZZVdKM910lqwdzv3j3hdjbE+s2koInV1ngAovDEvFYu/TyjbZot0VidQPBY23qENd
	bLpB1U8h7FH7nUNoTQeef0/OX8qA=
X-Gm-Gg: ASbGnctcprqVflWZ+kbO8AtSVnqLVn3pAiodnTMplorfIm6lwkLic4pYGIyBv5CyDpU
	tbvFoCNj8/iWFqx4x970IbIpq6hFjfg8mHuaVKfF89gSItFUYh3vcLvoqtxK0l2g=
X-Google-Smtp-Source: AGHT+IGgOn2DREfa7NsKp7+dCRM15jWUoXCFoqbcfzazk9+KOveIsphN8U+R2L+5Hxlj1FdSjDSEQPGOkNE72hm+AD8=
X-Received: by 2002:a17:907:7296:b0:aab:75f1:e51a with SMTP id
 a640c23a62f3a-ab38b44e04emr3199679566b.38.1737733456513; Fri, 24 Jan 2025
 07:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20250120154605.3023068-1-marc.ferland@sonatest.com> <z6jsvvuyc2x23pqa6yw7dandwpfukuu3uxm27fznrzbaui7ocg@h2yyduzllnny>
In-Reply-To: <z6jsvvuyc2x23pqa6yw7dandwpfukuu3uxm27fznrzbaui7ocg@h2yyduzllnny>
From: Marc Ferland <marc.ferland@gmail.com>
Date: Fri, 24 Jan 2025 10:44:05 -0500
X-Gm-Features: AWEUYZmkWSGYxe7CRKwg1Ivj6PVGHkyRo0oZxgpVgcQOJoWqE6rMiJXVXYiJGh4
Message-ID: <CAMRMzCAnupFh7jnU6T1dbA2=uDwDEEcZxK+L6Zdpg1xMNZRJoQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] linux-firmware: split ath10k firmwares in separate packages
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Content-Type: multipart/alternative; boundary="00000000000063fd84062c759928"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210226

--00000000000063fd84062c759928
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 5:48=E2=80=AFAM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> Hello,
>
> On Mon, Jan 20, 2025 at 10:46:03AM -0500, marc.ferland@gmail.com wrote:
> > From: Marc Ferland <marc.ferland@sonatest.com>
> >
> > This patch introduces the following packages for ath10k based chips:
> >
> > - linux-firmware-ath10k-qca4019
> > - linux-firmware-ath10k-qca6174
> > - linux-firmware-ath10k-qca9377
> > - linux-firmware-ath10k-qca9887
> > - linux-firmware-ath10k-qca9888
> > - linux-firmware-ath10k-qca988x
> > - linux-firmware-ath10k-qca9984
> > - linux-firmware-ath10k-qca99x0
> > - linux-firmware-ath10k-misc: catches all firmwares that are not
> >   already included in the other -ath10k- packages (currently empty).
> >
> > linux-firmware-ath10k is now a meta package that depends on all of the
> > split-out ath10k packages.
>
> This is a very nice idea. Would you mind introducing the same kind of
> changes for ath12k/ and for the qca/ BT firmware?
>
> Thanks, I'll take a look.
Marc

--00000000000063fd84062c759928
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 24, 2025 at 5:48=E2=80=AFAM Dmitr=
y Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org">dmitry.barys=
hkov@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hello,<br>
<br>
On Mon, Jan 20, 2025 at 10:46:03AM -0500, <a href=3D"mailto:marc.ferland@gm=
ail.com" target=3D"_blank">marc.ferland@gmail.com</a> wrote:<br>
&gt; From: Marc Ferland &lt;<a href=3D"mailto:marc.ferland@sonatest.com" ta=
rget=3D"_blank">marc.ferland@sonatest.com</a>&gt;<br>
&gt; <br>
&gt; This patch introduces the following packages for ath10k based chips:<b=
r>
&gt; <br>
&gt; - linux-firmware-ath10k-qca4019<br>
&gt; - linux-firmware-ath10k-qca6174<br>
&gt; - linux-firmware-ath10k-qca9377<br>
&gt; - linux-firmware-ath10k-qca9887<br>
&gt; - linux-firmware-ath10k-qca9888<br>
&gt; - linux-firmware-ath10k-qca988x<br>
&gt; - linux-firmware-ath10k-qca9984<br>
&gt; - linux-firmware-ath10k-qca99x0<br>
&gt; - linux-firmware-ath10k-misc: catches all firmwares that are not<br>
&gt;=C2=A0 =C2=A0already included in the other -ath10k- packages (currently=
 empty).<br>
&gt; <br>
&gt; linux-firmware-ath10k is now a meta package that depends on all of the=
<br>
&gt; split-out ath10k packages.<br>
<br>
This is a very nice idea. Would you mind introducing the same kind of<br>
changes for ath12k/ and for the qca/ BT firmware?<br>
<br></blockquote><div>Thanks, I&#39;ll take a look.</div><div>Marc <br></di=
v></div></div>

--00000000000063fd84062c759928--

