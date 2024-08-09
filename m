Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83B7C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 06:27:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.78479.1723184827127450123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 23:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MoqvI/RQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d19d768c2so1349094b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 23:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723184826; x=1723789626; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDv9pNHbTfY6BCc/CtLhE92fxuwOZl7OiDYEAizBxY4=;
        b=MoqvI/RQbWOo2cqrmECJtHLnbm/gFmZf1Z8xtReAIainTHboD5H8mFg5Aof6AjtSHv
         KpfIhTCJuXUHmPdwqewFuaJSKjHj01gGGGCqIH/DVgdXCBdz5qYZVbCu8/AV6fhER65l
         gV2hyF7bE5MZQiXbPF0AHGinopTvCvon7NVXO0gAdkv4k6iRYPflCBcywQepwrSxa26R
         QEVK1b9xhtc6b8dTgV2iRmqMLLc/JzGg/dYN9e8bhylh7bDZiipyQSVpugmlCoqdtsRg
         9BtmiJOZLzMAooaofIlGlDzkoUzbzcnxvEdyLlzrGHdDiIFjCMOhzYzvc1bk5a+oz084
         XwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723184826; x=1723789626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDv9pNHbTfY6BCc/CtLhE92fxuwOZl7OiDYEAizBxY4=;
        b=W+yr6N2xyRVylKvH5eFiI3FL5WyQzK5sEjzc0fi7gi8ZaIiJnXteFaI4710VrubBcn
         EzoeVeNFhBKqHR4IlW2p6egcXGt9a/GB24AZTlmT7+20jn53aEi04F0VLEnLa/fzqhql
         l2IZ8smbToO4LY2ixh9V+uzFOzt2kJ63IUfa05LCCJD1KyO2wHeD+5PbzgCq6aIcCFsp
         dxjHnoa1DvIU/TvKdlDhHxeAiFvGNu1xHuBkOHeUZo+iRk8hV9nnMu2YvUtb2pouH0MG
         VQSbtz98/+e841qP9RGbdLsU4PDICDQIs05FUexTUlkgirr8xNGadmTUDBAxViGO+c+i
         pQ7g==
X-Gm-Message-State: AOJu0Yy7GMX2uYvBaZqhXMn2HHF7IiV3oi8Iskie60Xzv3VS/IjXhxSy
	AKAgpbw2kK4YRBjBNSxiua6rgZQA4iC+svJdqbtHWKBEz+JUTdlCBok2UYNwYC+11tsN2BqMkWh
	yp5yLh8bHMdWEZg4jYVJ2rH54THlwcg==
X-Google-Smtp-Source: AGHT+IFC5Qq80JOdcaGu+OwBxnOmvod6e6YZe4xACSw0crzMpnq+ndv3ZAyO4nEHYIHBBB11Qvo4EKRIOlnSFix6eJg=
X-Received: by 2002:a05:6a00:b93:b0:710:9d5e:555c with SMTP id
 d2e1a72fcca58-710dcaef8d2mr567297b3a.23.1723184825913; Thu, 08 Aug 2024
 23:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <17E9FB4B96EB9027.28314@lists.openembedded.org>
In-Reply-To: <17E9FB4B96EB9027.28314@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 9 Aug 2024 08:26:54 +0200
Message-ID: <CAApg2=QfajoUEwzzsLeRstWQaZUBxysOnT+bx6ccigFQY0pRVw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>, rybczynska@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000006e5b00061f3a3b0c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203153

--0000000000006e5b00061f3a3b0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 8:24=E2=80=AFAM Marta Rybczynska via lists.openembed=
ded.org
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

> CVE_STATUS contains assesment of a given CVE, but until now it didn't hav=
e
> include the affected vendor/product. In the case of a global system
> include,
> that CVE_STATUS was visible in all recipes.
>
> This patch allows encoding of affected product/vendor to each CVE_STATUS
> assessment, also for groups. We can then filter them later and use only
> CVEs that correspond to the recipe.
>
> This is going to be used in
> meta/conf/distro/include/cve-extra-exclusions.inc
> and similar places.


This is what I came with for the encoding of CPEs. If the idea is OK, I
integrate in the cve-check/vex patchset,
and we're going to add a few test cases for this too...

Kind regards,
Marta

--0000000000006e5b00061f3a3b0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 9, 2024 at 8:24=E2=80=AFA=
M Marta Rybczynska via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">CVE_STATUS contains assesment of=
 a given CVE, but until now it didn&#39;t have<br>
include the affected vendor/product. In the case of a global system include=
,<br>
that CVE_STATUS was visible in all recipes.<br>
<br>
This patch allows encoding of affected product/vendor to each CVE_STATUS<br=
>
assessment, also for groups. We can then filter them later and use only<br>
CVEs that correspond to the recipe.<br>
<br>
This is going to be used in meta/conf/distro/include/cve-extra-exclusions.i=
nc<br>
and similar places.</blockquote><div><br></div><div>This is what I came wit=
h for the encoding of CPEs. If the idea is OK, I integrate in the cve-check=
/vex patchset,</div><div>and we&#39;re going to add a few test cases for th=
is too...<br></div><div><br></div><div>Kind regards,</div><div>Marta <br></=
div></div></div>

--0000000000006e5b00061f3a3b0c--

