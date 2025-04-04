Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC59C369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 12:29:53 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.10149.1743769788540072964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 05:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3VVZBIN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e904f53151so16951266d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743769787; x=1744374587; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPWrAuEcxapkTZ1evI0czFgFzuVTy/fzvU4tUPTcByA=;
        b=l3VVZBIN/9OhcXKHy9mytA7w2DeqBeFzNXZQORFZTgU9nrvSOIX4Rhi6GrLunl88lF
         fV32IP9oPbDmQ1FP43h2zXP8dINx6aKNnG3tWHlmoHKLmNcSXgPMUJcTKiJPQ4W+wKeb
         g1R30dyebAwMg2TPqJpaN92mRQuDY2RnL3+prESa6N8aZKUq/LQ0NP8eeU4aROsijPyy
         MeJ6AANKB5zG2sPu9kdhkA6vcWQH87WULLvFNHMs+Ilqq6qUgPOJ7myePiN3qbGuKB7g
         gXcL/eV9tZ6S15QAc5n1zKBs/7YhW2XtHKG/IeRQJXCi/m2IyYtVTdUvgdVM87M4MvxH
         9+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769787; x=1744374587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPWrAuEcxapkTZ1evI0czFgFzuVTy/fzvU4tUPTcByA=;
        b=g7ploOQuOphWQRGX40cFljrBnqmxtUvxwl37Eh+8EHadgWyAkZ7eXtSxwMtK5eK7uV
         euhpS1p0UJ3lXY0gVbN9vENJBRmI19NQ4P8ou7fowLH68BBLKgOcJRdHObxP3iaM9FZG
         TGJbtrUQw8XiYVnfOXXzi+W6eRsEQjDPY6I8bzh0vUcwlkBLh61lT19ee0gjwnU/v14h
         v75SBE6WIhwTp1iRBLCeIOmYvz8iXh62VtsrixydwSW3s4T8h/XOTeuOjbqD1N5zBYc7
         baf2dSpMVq6cQAlbMpbJiGX5ISP2/N5ScWlgp5i3wuBtUNKRMg+ihNx9zJ1ezS75yZcN
         5cpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhxRdDlNET1d99/je79kk4xxvTO0Lotp5T8Xk3gpS9WEPwhAGsj+Z3DFLXk2Hicf8CfpzB7hOh6PtffH12tjzO5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyI+0HpUGYpgo9Zd3KfX0auDOtrMNrQXb1MKw4IbmGD0I3FH0R
	N0g9YgzKHH8rOufUXkoXyLQLa49pRHXZp1/TfKsI+wLmrKompCZ7yaJ1v3w1cx/INebQ+vGdrW3
	juT1aB8wKrYyKuiPBW4ZQ1Nq+05c=
X-Gm-Gg: ASbGncs0eeJ8mMBDfa7VMB5ReRNttMV9ord8QVOAj/SQrbUV4psp3mXFr2ZYtosJ+Hx
	gWOZAgXzubMmY0BxhsHhDDx+iHwDakKyfumtfSN1bcinBDWd66ZTz+NfT1mV9emrEJvO7yM1wVj
	V1Wi0TSO9S6mtxLsDck04FyVS94bdiHfuF+796esL0MdZLwzftEisCSLpSu61W
X-Google-Smtp-Source: AGHT+IGKVMQCfLevq+hBybOpBL3qYyyMDpxUDD83aAnRlEcFkFbnQDJzhabhdugjwbq5To/4s1hrN6CP9hEFM2W9gzs=
X-Received: by 2002:ad4:5ae3:0:b0:6e6:9ce0:da9d with SMTP id
 6a1803df08f44-6f0584b7d76mr44989216d6.27.1743769787555; Fri, 04 Apr 2025
 05:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
 <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
 <CAO5Uq5T3xN9s5J4EqcQ5+SxmGf-pFWY-w9xrcmufbCNWxuM=1Q@mail.gmail.com> <038C7174-D53A-4C2B-AEAE-04F61B93A8C8@arm.com>
In-Reply-To: <038C7174-D53A-4C2B-AEAE-04F61B93A8C8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Apr 2025 14:29:35 +0200
X-Gm-Features: ATxdqUHUbl-RmbiqsqoQZJd5ncQmhM4XXuLw1AhMMcqiCcxHl36_I6rJd7qXEQQ
Message-ID: <CANNYZj9x3Y8S8Xh+b28H_T_Je5OLJVHZh=J7_ksPJmedgNkvxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as PACKAGECONFIG
To: ross.burton@arm.com
Cc: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 12:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214345

On Fri, 4 Apr 2025 at 14:03, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> Each option we expose is another combination that is ideally tested, but =
is explicitly supported.  Do we really need to expose _every_ option that c=
onnman has?  I much prefer exposing a limited set of options that make sens=
e, over flooding the recipe with every option possible.

I'd add that exposing some option should also come with an explicit
decision/explanation of enabling it (or not), for example by saying
'this is the upstream default'. Otherwise, it may deviate from those
upstream defaults, which are usually sensible and serve common uses.
One exception is when the default is 'floating' auto-detection, then
an explicitly set option is a must.

Alex

