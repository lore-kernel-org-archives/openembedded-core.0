Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4237AC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:31:38 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.44097.1745832694140701322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+ouzQLa;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4774d68c670so80762951cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745832693; x=1746437493; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tiwrqBb/IuWY7eF7OS6ogklaRmxtClrqiqIlyhlKkvw=;
        b=Y+ouzQLaBfbahGI5zxBMAa0h/KbN/gBNtrfkrzo8Qr0hr2FtG0vkM41EKw6e3oXbjR
         U6mc8T4hwdVx1I7+9CiM0EY32jQ5ejWzrUvXx/ohs/YVN1KM34YZvIj/yEkuQT4B3Jox
         4taCAB3C3JzKMWMauvamjoILc3O4Nhr3erVMiFM5AbFWtSS7HDkA9uurReA5tc2C/gDY
         G4OabPIPMDqN2NBLtALNv8mXPEoPb3MC2FaY/GByrngB2WlN1n73zlkBzaKYpMa9azZv
         cAxeOMn3a3K5RQ5hsaEFDHej2+6Ms+4QvmgOiEc9fCINw4CngoRxkg1VeXOiyQ2ricaa
         wr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832693; x=1746437493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiwrqBb/IuWY7eF7OS6ogklaRmxtClrqiqIlyhlKkvw=;
        b=Em4t3ccFCgHHWkiqhqVlSAvILChIvCkSv+IphG9l7kXOs8Wi7GfPqQPKd0s21MtBNy
         lC4tzq/xXPutoo5H8atDpNqVWGCFpzmL20BcX7lVzraBDeIFU4HeGU4dne20UbrK/Vpd
         HYh+w6URpfSkF41byR1SkC9LmtfMLAr+2RomADs54+orM3nDsLJMRqAZy/Uj1fqT+LNl
         /oFIRinbPTYwgdclIBUK2VnZIGm/+GUYaROxmHYUi8CoiaRZa2oSLOL7QR+OSBWErwbT
         T1BsS31Yodapm6bFxadb7BMnM+jnJvmEgwx2EsiGKl0ChaRSBVIdeAjYKJaYddTx3lbH
         667w==
X-Gm-Message-State: AOJu0YxkpgTV0VOFQsZinHBO1Lq9y9jfb956DrRqNh2KkZuIfKvR9vdd
	EyrB5f5Hpr57oo2xCkvTCqBHIhjy3EaeM6bz7CccUCelp1jhz4/JpWxaC84SgwrhnSaYw8Jy/I4
	PGQ6ZbnetJQ17XZtFp2FDKDDln30=
X-Gm-Gg: ASbGncsRmZ9MMw/XAfm4G2Mr9iddtMY5el8cFLtCGot9gjPaj0l+GVuAZJwlZO5Xuz6
	U9CvA/rsVTflmOpkU3vo6w8ur0wMCXLMJTXjgwk7KpSAb52g3j26ci0posmrvo1h17zgXtE8/Ka
	bjP7Ke9OGjvTR10Dc3MfrH+x3Jome8F+w2PjkbXkXF5BTKWM1FxYblca04
X-Google-Smtp-Source: AGHT+IGndB6vEvCL7MxchRLqcrC349nzhhmwIfvQjMH+IhesCnQsyJRq8WBuvd5qGghCpcm+5BcWyrvx8yVz5oeeRAg=
X-Received: by 2002:a05:6214:529e:b0:6e8:fb92:dffa with SMTP id
 6a1803df08f44-6f4d1f1a8eemr154856916d6.25.1745832692980; Mon, 28 Apr 2025
 02:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250426080352.2358278-1-hongxu.jia@windriver.com>
In-Reply-To: <20250426080352.2358278-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Apr 2025 11:31:21 +0200
X-Gm-Features: ATxdqUH0IIDebxtPmnV2DVm6HAQs5bpgmVSAzJmJujAuLNo1RSkGPxveSdcyo-8
Message-ID: <CANNYZj-ZjfSiT_K0nx-WyM50d6fFvyjhE=RkwpQRgeLPrFi9=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO
 live failed
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, hongxu.jia@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215586

On Sat, 26 Apr 2025 at 10:03, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:

> +Upstream-Status: Inappropriate [upstream https://sourceforge.net/projects/cdrtools/ is not alive since 2019]

We have a dedicated status for this situation: Inactive-Upstream.

But, there is an actively maintained fork of the original cdrtools here:
https://codeberg.org/schilytools/schilytools

Can you check if that can be used, and whether this fix is still needed there?

Alex

