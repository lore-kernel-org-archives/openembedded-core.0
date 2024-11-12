Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E07D32D82
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:56:26 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.82818.1731405384858127281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QlSINm9N;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so46737161fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 01:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731405383; x=1732010183; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVQO6WsX7ZTLjRg4FHcUJZClUyLk39nUgrzOnBCdswE=;
        b=QlSINm9NSRGlnOS94Yplkoj7r6/7Dtdpd3K2Q2yjQuviJEC8yoHJo5Ckplr+/F4lR1
         XlVDlOzG7/pSs/sNZBoQkO1Dgdu6CK6B/LpnTFuFIrd6WqD8InSDW4YUC23LWdJdqGUc
         f1AGL/RS8BV6z6uH8ogwTEbfj+F52eATCwecjE18PL2J6ECscqb7roLEPsoThel1+ecd
         GDWUyY8BC6FSUfc/++QnxOmIIQxja82XECt2Yw+8sv+8XvwmVWLOgVqdg8qiiDeN8H97
         x2iH46U0rpAvnLbAc5ZUiU8W+FhgHeOKw4ZnGH7+rBuTaVRMyuMwpkzrMskA/NdIrqnA
         V9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731405383; x=1732010183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVQO6WsX7ZTLjRg4FHcUJZClUyLk39nUgrzOnBCdswE=;
        b=xA/ASiCXiiGgVZqnkFZ1DpiJJe0kofjqp8rMixYHieI10ut3yLp6jB7DRf7jj2PXaJ
         1rWi5j3Tes2/QuqJBpGnMiRNRsuMvW2hsNkp6R/vIoaMO3cTVN2EaoAjk74BcWgmv6Tt
         481PKBwzlm9Lty/DMgpC5YVG5tRdmb/0xY3J+NSSF8ZgU4vS9IWdgpncpFdFCq/9mFUU
         s9T7mtGr4Ody1o8fBMptj+I52LZymhcSvnrev2WXMuGGY3mk8Ga3NOMANmyIbtSb1rHr
         yBHIqsolp1an7pXVe3vADpu1AoFLUJTESG8Liu9cK8L5L6c8k5ekLkRv7nq8oW44tbe/
         fVZg==
X-Gm-Message-State: AOJu0YxrKBatgYbARUCk+tWpwQi62FwNkuU5A3NSiHND0j9H2WL8JP0b
	T5HzUqqGmkPcekyGzQ96zSD6y4KvJuzhVWuQT5Dy7bCHznohnzYECdIOP/350xKN3BASRnA+O3Y
	r7kUPS9KxUQUhTt5fXABAnvhABT8=
X-Google-Smtp-Source: AGHT+IFJkrNxdJWvOkvQmpAkT1jiuxbe40Sl+MhV6/GNa55CMaAoN1QIe+vmhOcktI6+CIYWZUAAPBY1uoXINv4kezY=
X-Received: by 2002:a2e:a913:0:b0:2fb:5d2c:7509 with SMTP id
 38308e7fff4ca-2ff201824damr73020341fa.14.1731405382504; Tue, 12 Nov 2024
 01:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20241111173421.44377-1-gudni.m.g@gmail.com> <20241111173421.44377-3-gudni.m.g@gmail.com>
In-Reply-To: <20241111173421.44377-3-gudni.m.g@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 10:56:11 +0100
Message-ID: <CANNYZj8dY5dwRZnuMEYvi7=PkDo+miZvcTafCn3XhMbzJ5Ah7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207038

On Mon, 11 Nov 2024 at 18:34, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
> +# Enable support for AF_BLUETOOTH socket family
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
, 'bluetooth', 'bluez5-native', '', d)}"

This is brittle and can be improved. If bluez5-native arrives into
sysroot through some other way than the distro feature, then the
python support will be quetly enabled even if it wasn't asked for.

The correct way can be seen in e.g. strace recipe:

PACKAGECONFIG[bluez] =3D
"ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetooth_=
h=3Dno,bluez5"

Alex

