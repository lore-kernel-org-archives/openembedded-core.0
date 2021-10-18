Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F36C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:32:12 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.37112.1634567531773518382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NLv2sfsT;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id h19so2355756uax.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ToRybG+qcWljp4IvPOOKUtGxTeuUt9yVjDRmlagFb8I=;
        b=NLv2sfsT2Qi4usaIXNd/KDt9pKprFzthtBziLqri7OUgN4hiPLMKYX35uY0+jQt3V8
         0ooZ3I3vRsISM9o3RLiL2xXBlXL8CKu+YkInlM+FtnZM/sOHi7o1Gcmloh/t5qsHYl6z
         aNyDrTQ7uUxSNbZ5SRxhbWVwzbjQyclajGpjXiekVc/PvlRQyfO4OuqLsCSR7TnDlC7d
         /Psf0JJ6wiUHO0jRlwMFu4e7jxnDqz8fUX0v+gaZxfO3D86ikpYQWyvBiBWiebyL9Dgu
         4VyE6uAnlG5BI0JhEvyhEXdskliz0v8GcTUp9oyF1Rt483SULP5s0qtlR/jN+guCfGJn
         YO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ToRybG+qcWljp4IvPOOKUtGxTeuUt9yVjDRmlagFb8I=;
        b=Vciaz/y3md3zHnTncIfubg+pSe7H/kL4rWLHRppTsRbRF3G6wYvBRy/BW+pO4/TVmb
         ZPHSdMwtG0g9ojIABU2uoKM4wMj6OrPAeULTjB9ywHUHGaNEqY93mZ9g726U+qNxWaSl
         qSIK7GwjcWKyVV/eCMelmL8fzTHsmK8CejSKM17x+qP1ANp7ybW9M7D+YfnO/9x6DP84
         pQ9bUZhgTzzoRgtcYFckF+WcF0Nej/uLi8+9jRr6AAhQDxiTxL/OISHRmA3O+6Sk0KH8
         tZ6bAgsS1tcStwBGplx89iHIr38xVvc3aJSmIOcYlxhYr1RfcV1LS+2ULZkW2lbByb29
         QWow==
X-Gm-Message-State: AOAM532nWXhO4Se41AG3Cxf/XqkGqmY/ttUEH65mGAuTIGw9JgGOiTcx
	DZeuLvzPxFzhzJnjxiMLzy/2b9RSukeZywiMaXA=
X-Google-Smtp-Source: 
 ABdhPJw/Kph6g36/cJoxRyFYw9rhkbBOEzUfrcA3Czxs8Wboe+Yo7hrvjWWidk4Ln3oW2gel9J3bsDVz8Mo87lPxlo4=
X-Received: by 2002:ab0:3c93:: with SMTP id a19mr27172743uax.93.1634567530874;
 Mon, 18 Oct 2021 07:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
In-Reply-To: 
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:31:59 +0200
Message-ID: 
 <CANNYZj_-scmARFF6BmDU-fpG3-me+AfyDyCtrt-0V9f4_-e5vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000a0bef05cea169e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:32:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157071

--0000000000000a0bef05cea169e2
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Oct 2021 at 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:

> OK, I'll simply PNBLACKLIST all the recipes your AUH upgrades break or
> stop doing the CI builds completely.
>
> Having latest versions is nice, but this approach to regressions
> introduced by version upgrades is quite a pain already.
>

I do test all my upgrades on the AB. For major ones like python or openssl,
I run meta-oe builds too.

If the AB gives a green pass (which it did), then the upgrade works as
intended. If you think AB is not doing enough testing, find the gaps in the
AB matrix and address them.

Alex

--0000000000000a0bef05cea169e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 16:20=
, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bla=
nk">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">OK, I&#39;ll simply PNBLACKLIST =
all the recipes your AUH upgrades break or stop doing the CI builds complet=
ely.<div><br></div><div>Having latest versions is nice, but this approach t=
o regressions introduced by version upgrades is quite a pain already.</div>=
</div></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D=
"gmail_quote">I do test all my upgrades on the AB. For major ones like pyth=
on or openssl, I run meta-oe builds too.<br></div><div class=3D"gmail_quote=
"><br></div><div class=3D"gmail_quote">If the AB gives a green pass (which =
it did), then the upgrade works as intended. If you think AB is not doing e=
nough testing, find the gaps in the AB matrix and address them. <br></div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></di=
v></div>
</div>

--0000000000000a0bef05cea169e2--

