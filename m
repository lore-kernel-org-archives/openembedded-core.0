Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352C7C54FCC
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 07:00:01 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33235.1771569358276596340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0KgfVO8;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: careers.myinfo@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e62834439so1783864e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771569356; cv=none;
        d=google.com; s=arc-20240605;
        b=jNjCWYfR2TuxTyLzdWffx/bd+7/fSF26b/oNt5coQJmuSSD8hdk95S0V106N/Vi2YO
         SjO+bclNfXFoT2FlR2JqnW8Uy9VSr/EF3qM7TnvaZvmPbn+rSceSlv6qYHYhK7fSIjmi
         MUuuuN1nsdT9XrZYWx3jTuil2k9YoWyu0QkyOVrhEU7Dl5dya27377GWNwo8pEI4Z+Ol
         cxfmIlNA4AoSvcLLdTK95QbVlYcEhJpzrZrsNCLVnWVr4ocCGDMrUsTS/dRBVRTtCbvm
         Uy7NTpWkvFBXZ8TJdgZDBG6WV9O5jBjM4lHiRvN9cpq2oPfZibGyR2KJCLhFWhSib9mu
         fDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2TBjFIjSsyyW9SYRdFqtd96kVDJ+I+YfZr0xbV5elc=;
        fh=zTzMGrF2EYywbj70LAGwvzXJftkSWxB23dxoD4BYw3o=;
        b=hTzRSdNKvWuI1H/CvbigxVQYIBicZtk3/kHtiEh1v+4uw8sY/B0UQCohlKi3sddcHJ
         LQDlzBoP/SBuT3pRwDt5QDnJ+0ai65rbo6p2AXePyGYFqMSTcWmLRGEwGOOM5CWQo6cm
         2T9HfdfMKTqPrOaMSmvTrSRcj8CoZSPVN4xuzllNJ0P29ekH/cav9Vl1et/u4qMexmYE
         1LwHmDoDgkD6fwSt2tehTXZk5/p2X37Ylzkxa3Jpjbe9z8tkePzWxo/t1YCy6EHTrZtc
         T88H51XmR096+//3scneakfp5214VJrE1GaI8CdssCY0MG3K/MV63qp5egZkjYJlTeFI
         N11Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771569356; x=1772174156; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J2TBjFIjSsyyW9SYRdFqtd96kVDJ+I+YfZr0xbV5elc=;
        b=H0KgfVO8NACPFxyKGe71PGDfi0M1KEB77j/nv9Id7iSokMFku+tA8NITxg/py8v5Bv
         WDf/mxO5sKg+ed0SjQVQPn9ifIcvjPIEsSg6Y7XfxFzu54NuCsvuMJe7lJCxefmn4ija
         1ufrneUNt+yGDNNHdqFOobSzLQmRNLI5WfpEL+eOk7HsbiQ/VlA5j3x9tqt8QCdL0fte
         HDf/t/Pyw4tL87Cggue7Q6ZbYjqmJDo51oRpSVMoT0wo7u4G1SHK+UxBhCCBERtRhReD
         kKB976msLydPz6hfhMhMBQERIbXi0Ira7Rmrub9xgcNKppKhRWPIBvkEGGvTR3GL0qpd
         HApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771569356; x=1772174156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2TBjFIjSsyyW9SYRdFqtd96kVDJ+I+YfZr0xbV5elc=;
        b=OeTMRnpmNfxQ4SpvdFye6uJYtMy3UxXA7kW3lekr3kiSiHBRjrKpyREimoy5RXc3qE
         QRponsbHGwDMj1iy6p4Mf36IFwz7qvsM/1t7956BZbX8J6w6Yc2/15R8Okgth2GWdr2z
         sYK1zvLq34q6afhyBuhbJEC+sNnBJJRPMY8t5yPnU8rKqEmU1MwjNyDIa+rc0BPSQ6NY
         KWqZopO7i8zwVToUp3fvqyiYAERxj976pkTyyeO2zOu4jEemEo9CxA5uetvLeqEd/zYh
         VZ76eBLuRN10EmFSsl7TZuepOCtF/K3GSZR12ZmqdBkpYprSELUQNEavbIL2W8sRXROy
         POeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjPg5J8yqtkfURvpi0PJz7nNqnqES0Ei0xczTcSBqW48INuZ+F4Rqce3lOgmWGMTUD+Va9/2IkpZ+bDdsKiDcv6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpSDJbuwoPmR670h+aaMMWxQPqRNqC+erk95nWrlB0SY20987v
	8co1NxO/rfmXA5mukSXPlJ4+W+s5ze7wSZCs3dO5XtdUeTh6mJLPJqmYM2YxfiBK3DoBrQpqRDh
	UP6STtF7ptEZvPrWO39aoXaq6GBZzb8w0Aw==
X-Gm-Gg: AZuq6aLaAGaq4YJuuvLZ8KM3HtUr0L9SBM0sM674nPvFiwN1NeGVjwaKsnYrKdj1Z9u
	3gibidClE21EM80M8VgDNA2uUq7h/VRgUWTdRI8zdDi3Lml+ZsKcSORuTN6UZW9IYSv5xNJkHO7
	55N1PD30YIi47d6e6c/idzCdiu5Tjpt/F1pXLjBcNR64hpl3dYyTrl6dD6GT5RbaCmFL1Fi+oMF
	mUo2ijsPvxH7pWCmNT1R5YGjJP9xbvTPWD8II4K+RoUqD2vzLPW4nLzsDRt960WIF0oIc59sCJ4
	FGlbI8qdYB5bA2iCRqIvkOXlBmRvxUn49aGqcQ==
X-Received: by 2002:a17:907:7f9e:b0:b87:b0ba:5d2c with SMTP id
 a640c23a62f3a-b904def1becmr341549366b.56.1771568991470; Thu, 19 Feb 2026
 22:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20260211072322.79206-1-moins@kpit.com> <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
 <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
 <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr> <AS1PR10MB5697ED75CACEF217DC9722B7FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DGJ0I1AYCUMK.2QUHJL111LVBU@smile.fr>
In-Reply-To: <DGJ0I1AYCUMK.2QUHJL111LVBU@smile.fr>
From: Shaik Moin <careers.myinfo@gmail.com>
Date: Fri, 20 Feb 2026 11:59:39 +0530
X-Gm-Features: AaiRm51I4loS39h2qgUQuN3L_cykF-JF8ny-qheU5X5G91e1nRj2m8K4OR_dasc
Message-ID: <CAN01=z3togLyyoG_iFpTDwne0uauLFR5uzdTJmBoh4jquTh4jQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
To: Yoann Congal <yoann.congal@smile.fr>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e87aa064b3b8cea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231493

--0000000000006e87aa064b3b8cea
Content-Type: text/plain; charset="UTF-8"

Hi Yoann,

We are not going including this patch as per policy. I have addressed the
comments of master branch and informed that here. Please review that patch.

Thanks,
Moin

On Thu, 19 Feb 2026, 8:05 pm Yoann Congal, <yoann.congal@smile.fr> wrote:

> On Wed Feb 18, 2026 at 9:16 AM CET, Peter Marko wrote:
> > Could we add "adding/improving tests" to the allowed LTS backport items?
> > I think we're shooting ourselves in the foot here.
>
> FYI, I've asked the Yocto Project TSC about this.
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000006e87aa064b3b8cea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Yoann,<div dir=3D"auto"><br></div><div dir=3D"auto">We=
 are not going including this patch as per policy. I have addressed the com=
ments of master branch and informed that here. Please review that patch.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"a=
uto">Moin</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 19 Feb 2026, 8:05 pm Yoann Con=
gal, &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed Feb 18, 2026 at =
9:16 AM CET, Peter Marko wrote:<br>
&gt; Could we add &quot;adding/improving tests&quot; to the allowed LTS bac=
kport items?<br>
&gt; I think we&#39;re shooting ourselves in the foot here.<br>
<br>
FYI, I&#39;ve asked the Yocto Project TSC about this.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000006e87aa064b3b8cea--

