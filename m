Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6773CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 18:02:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95225.1781373756957949766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 11:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CPXw1FUu;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51784eb2ba0so16130871cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 11:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781373756; cv=none;
        d=google.com; s=arc-20240605;
        b=llypFOH3XTDIhrlq4/m1WgQ4XDry2fzpD+g7tGtvdjxqo+wANADckx9pxgJHd+FxXH
         OFTMIMSlPjswXii5tvHNWTT2rBimX6wxkDFOp2f7xlCPtnQF+Tsf8BiXbZO3L/tNZiVK
         V9Jbnt5uJyJp4ZO8V7qDU+b+yUSN80+LeqOzgv2849RZAMZqXk79/1XZihxbvrc6vDn6
         Tx69W3Q18bkmHILZnBIO7WxrG8dFtr4HXF2GIVn+idFOGGQdHfpzu7ZwdhImmDsHzkvM
         VZYhfV0/rzlBAorruWN3xGdGf/7l3V6netpQI5iJb9uHK7n0ZcGAcuRLwLbxuROFvgl3
         qhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MnLKqtIwkOikASISsATjkq2rnwo2H64eQv0T43ArHfI=;
        fh=glOPBBjIioIRIEuLD7s50Gagk8xGDy4GRLMEwRZgQTE=;
        b=Tk+bHAHzld9y/mlsTIj70ANFKNG5PL6J0dSp96ZzD9dSRojEHEW42/GPC4ypq+7gel
         5ELV/N56MkgWuvBAIKPl1vzWmwlfUV7M/cJsSkVMvZUSq9xAE0RJDdHLptl8w5B/cgXl
         MdNYOulsD/frFomqMQZKx9wPPL6Q4GE/zOvDpsZIBkzh3VXb7EFxOmI/uppvNjmDGY+C
         FICrU1joTHqD12smArQf7FwpJggik6suSbMYUYHMv83n8u+YVOEA1reHOBjmT45Z1+Ub
         G9tRDJ0ZG6wksiuU04WfiBwWjuFqAKaEP+/IvCDs7+/wZ4yaPr9H8ra3ztKQ4l6OYG+j
         nkqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781373756; x=1781978556; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnLKqtIwkOikASISsATjkq2rnwo2H64eQv0T43ArHfI=;
        b=CPXw1FUu1W709J2Xpzev0iNeX/WPmODf/mHXk9GP9BfaSkg/faWAgsxg4uwSRTI83q
         KkFiSTjz3+CVEKfjOfjAxl2E9jB9B43c1V2aFcVmafOSxjY0b+nOqER3l9JgbDtJ7X1w
         KsTQi+Mq7bHZq3/RP0odDcjPOmPfsm5IdGudp8MDKmRwE9qckWWkNWLq5k7ZphO9T0nX
         EFBXMQtaY3ggiYschG6WXQc7tDCLx2OQqGbGJxHe95l9MnwwnBTo1eJ1etN/OLT9UkFZ
         wxiPqcVkJcXaoeiZi6luv3VaXbbMyyjDQN0rXUewsDqzvSw64nDzjULAT8zTQBIdbmKw
         IEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781373756; x=1781978556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnLKqtIwkOikASISsATjkq2rnwo2H64eQv0T43ArHfI=;
        b=SzuJU+61jGWZOpqDyBQ2B4mUzJPdj+rlVf6qu9gx3SuQQoEBOJpza4TrqPAEL4ntYP
         O64fOrB4EIF7NXKN8dBXHXMrhr9MHMVJiepu+2J80oHn/KDDeEazH1J4q+0lxjEIxBqQ
         xsrAJ5EBr/ZePu+bBAKCLmwepfAPSo7zirHO6kJT8DDztFFy5apKQrwX28DGFmKf1G6R
         pgo7joeBEQJgNJtpeOWL63TJFz+HJymdT62v+DuHDag8ZHDHHcXzdMJk2LKaHd/+k/yG
         hVqitIvwu6+FZ3HmAmzQ2ej197DYXB4+BXn/qXptYzL+8rIeO0RgK8e+t7To3TSTqgVL
         1EIA==
X-Forwarded-Encrypted: i=1; AFNElJ/wLtOpRHIw8Dx5vpknnnRayQ1SWupYNBL3ZzT6aGx4BtNtzZ4HkLDVsEuXXBcSWeUJ6zkzwabSw9HKx3JXdZKyyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxERvHUBW2+ehDp5j7sDJQbu2rn+yDUA+lQBv5bgJp3vzoqaZar
	wScmQUQwj8i1tNcckwkok/625clViVvYgbzM5saH1BsSvg+mIN7VaTtCoWSvsi2Xsc9mpzJ5OUG
	3jjuPPsHqcOJMe48Ydm1Mh72JZOagArM=
X-Gm-Gg: Acq92OF8u1k7s6oYAzzHSTsSTnnBHYA42XX6ZDh3vpbXjLE/i3PjMJ6NLW7WOCxqguv
	4OV17yVN5/tNwu7YgRjoWfx9bcGNcQEYxQUyyAGL2kTxR8xOxKp5JUINZSIKHwx/qRacheRM2eA
	OpviHp2/wfgJ52leBokrwOw3NeqzvZCRgDA9n2ZxMyIw4ojrC2jm0gAIpq7mhJvNjJ+movNcFtp
	IhvRTzmuHVXPECcvTrDfL/M0Q/YKa47qlyY3upHndb6wlOa6wOH6XSGf7G0NrnxX5imMN2dkqY3
	6CRmnFAdyXyOVbS1nYhtQhcjGPFn3CDARFM8U9uQrQ==
X-Received: by 2002:a0c:f403:0:b0:8ce:c4cd:90b5 with SMTP id
 6a1803df08f44-8d32e30db3fmr152719896d6.35.1781373755653; Sat, 13 Jun 2026
 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260610094932.2264-1-wangmy@fujitsu.com> <20260610094932.2264-15-wangmy@fujitsu.com>
 <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com> <OSCPR01MB13427F610C3A42F7ADB33ED9CDC182@OSCPR01MB13427.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB13427F610C3A42F7ADB33ED9CDC182@OSCPR01MB13427.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Jun 2026 20:02:24 +0200
X-Gm-Features: AVVi8Cf0oNLswieBcYdLIYiAdXDCInNAVAZLiUSXSLdJ3k5FBLEXL3E5TjAcP5w
Message-ID: <CANNYZj-FbxWBK=F_hMeD3oJc7WF_4KOKjB8Jz7s_=JX_8ADEZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 -> 26.1.2
To: wangmy@fujitsu.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 18:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238682

On Fri, 12 Jun 2026 at 11:26, wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> If we want to upgrade mesa to 26.1.x now, we likely need to bump the mini=
mum GCC version to 13 (or at least ensure GCC 13 is used for mesa).
>
> Alternatively, we could hold off on the mesa upgrade.

I don't think we can hold it off, because that would require waiting
until all affected host distros reach end of life. For example, Debian
12 still has two years of support.

Equally adding buildtools requirement to relatively recent
distributions isn't a great option.

Looking at the logs, they show only one file where the issue happens:

| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_ir.h:582:22:
error: expected identifier or =E2=80=98(=E2=80=99 before =E2=80=98:=E2=80=
=99 token
|   582 | enum jay_predication : uint8_t {
|       |                      ^

Can you patch out the ': uint8_t' part and see if the rest of it
builds without errors? Maybe adding an 'Upstream-status:
Inappropriate' patch with that tweak is the easiest way out.

Alex

