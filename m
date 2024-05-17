Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BD8C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 21:09:56 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.6722.1715980187838599920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 14:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DdQnXPzI;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de46b113a5dso619960276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715980187; x=1716584987; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuasuxgqJ1YBGIns83QOQSZp+dp+SfTfMcU7m/FMvFg=;
        b=DdQnXPzIS6RkdxgFZwNuv5ntIhDz9Hn5ZsBsmB4YtEcNI1MQQRUu0eFEH98m48QdJS
         /JboQoye3hPKaIalUnC28nfa8I8jWIz58opCIRrNhy5lqUgLEgpREjm0n1hJgzXelrDA
         3+VdbZySIDuycElRTxgJxwhsLUJI338sEFPid2PJntkEKD8ovLTfwUuC7opXWBPs/3pS
         q5w8PRpu4Vi3ChvmtL7/Cv69AOF37cQcN84W8hFxMsXDCo+IJp4rIhgtt1TpoeHHfRj/
         CkQyW96pV1lgvrnk5yrJdM+Ckx6UMTEjDXqZF6iVTksjYJaX286dbDYhgi08y1JLySg0
         nCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715980187; x=1716584987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuasuxgqJ1YBGIns83QOQSZp+dp+SfTfMcU7m/FMvFg=;
        b=GcUwglR0VxYSLC29sZmK2YMxUfj4EoI4FcVbLysaKt2QGnk22R3DOuqhK0CzUp2Dus
         TL94O5x7+CkAnxVK3Tr8AIUXrp1umzCJdmvA7njKq9l8+a+U1alEO9wslTTMhcx/snwX
         uQfjHFfAVW2fxHDkvhnQAg1U74Vt5NZU+bPXRe/OH/Kt17eUnpbQkz1O6dnldHfr2/+w
         vFceVJqrAiUIC116+Ck6Vvz6m/bSJGA+qXC48Mg+01dIIA31OdNWzFUJFa5u6VgcZaGY
         TXuOp0mPcPtQkwxB9JGlyDn2h3VTxjuKcr3s6d1MnpzKiG037YPKAej+5CEeXqjgj/x5
         serg==
X-Forwarded-Encrypted: i=1; AJvYcCVe9OVtMBj9uVjAULtTygZgL6V0YdYKesLoR1ddrkBw8t7pZKhOH7Q9YvRqSVYo9WBNyaAArQUhb2gTh8YOOJujRzivQwTdF2109fm/+4LK2VWUNhgUYa5a
X-Gm-Message-State: AOJu0YxOxzH21UGhW54DBQPkSucbxvz9Stb5RNyo58FE0cTDAEbcOxdB
	O0rIMJ/WkT8COTCYJwesRYZ0nfMMkR0RhdVMGi1MN5UtssZaKsbkJ3ng/DXyeGbHMRiKgAeZxR3
	PpO7PqJhIclKMVwvyidziBKtHREL3ggVU5uXqYA==
X-Google-Smtp-Source: AGHT+IFsx1vznn4vEp+Mj1+p1SN+hrTYsxikzB61QMOtbZ30Mq0BsXYQOHEfuH2J8Cp3QxiNikOnSz+F1/1wdVoP3nY=
X-Received: by 2002:a25:6802:0:b0:de6:1494:f144 with SMTP id
 3f1490d57ef6-dee4f2fe15fmr21659805276.28.1715980186970; Fri, 17 May 2024
 14:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com> <AS1PR10MB56974286E1B0CFDCC67896C5FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56974286E1B0CFDCC67896C5FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 17 May 2024 14:09:36 -0700
Message-ID: <CAOSpxdb8276Tg4iSOux9O0E88OpSh7eqVHfwdBpt6sd2wpt8+Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates.
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "sundeep.kokkonda@windriver.com" <sundeep.kokkonda@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>, 
	"naveen.gowda@windriver.com" <naveen.gowda@windriver.com>, 
	"shivaprasad.moodalappa@windriver.com" <shivaprasad.moodalappa@windriver.com>, 
	"yash.shinde@windriver.com" <yash.shinde@windriver.com>, 
	"deepthi.hemraj@windriver.com" <deepthi.hemraj@windriver.com>, 
	"harish.sadineni@windriver.com" <harish.sadineni@windriver.com>, 
	"umesh.kallapa@windriver.com" <umesh.kallapa@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 21:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199528

On Fri, May 17, 2024 at 9:53=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> This will not apply to scarthgap-nut as that already has the same version=
 as master...

Shouldn't be a problem, when it hits master I can cherry-pick that
version for scarthgap.

Steve

