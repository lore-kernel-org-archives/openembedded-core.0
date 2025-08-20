Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3232CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 07:16:18 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.14304.1755674177720023338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 00:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzGiShF+;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e870689dedso442624485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755674177; x=1756278977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TX3qzRZSftwrygqvoK2DIL6/KSukccI5lhgaiLbhqrM=;
        b=QzGiShF+l8nDrhoJZvsd/2INjd0ER52VsB223zMBFSB3gee+lcV+slOt8DqW815Gql
         LxYcOcDRNJBqx0ssGkF0pRXFcJaeDyhMcbxTm3X1EXnFJyUwgYItPdrlHfU/vAGmGbC0
         f2IB8jklpewYrFgbvS9NVV+/3IOTX0YpRUgFCni54oukDrX19gZdTRsRH4AlmW9TTzpv
         elZG6S1+B6HmXcy2hdlZoMD8xIDkz+Ny3QPTrjszffM9ea8mHxog9NGwD6mXlC9tCWuc
         x5U+DxZyANgJfxLiScVOHTJOpVGQ4/mD734YRKnPoErsy/DuMTR8/iERw+DMAXsT6bzW
         Crow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755674177; x=1756278977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TX3qzRZSftwrygqvoK2DIL6/KSukccI5lhgaiLbhqrM=;
        b=Z5eR2epSLSglZgkPC6cT4Zt8oahoQ31ePC9JBTNWda41UOB1K7fN3/yZTj4VoVNLyx
         L1CuRKkNMItUlc3B87jvCwxuAH9HHIG7LLnkk3Kq6vzu6DZs6d2YJKdL7DnG0ZwfSHMH
         85eM5A6RmgezSIIUBbfcqmjcDiRv172nA6aLGCmEFFPnBwOp+mBL47fvg9TnATUfp7I2
         znOW7022WkwkeR56wBc8CLnLh25md9/g0CJK4Jnu/9eIjFVrljx8Sfn083FEGlNjK6OC
         XI9lzJVAlGcC4xowgiN9OX9Zq5RNnkNxess/d4Pu40udj5/Uji/pGRc3JELOoYkBpnFL
         z7AA==
X-Forwarded-Encrypted: i=1; AJvYcCWdxIwxqKBgdsa0UXhaAidNMcHCqKsGc1S82jfVLzVTJ6k4BI/yQVOJdPFuxYyqaod873cYWnkJt5zbU6H5bjcNAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yym93F2Gx+zzGbJ8bv8gEg9+KCF/x4XzLXKpaBPtEBO4VsjyPZS
	5exG0dgG+X9KJdYBT0Gk9XoIbkfbsbxlPOVlOGk/ad6X4eNXX1oxukIYJDvm5gxmC2bTW62c5vA
	3wa5/fkTjbd9pXb1k/w/Zlz4SAeA8X0s=
X-Gm-Gg: ASbGncupF9Ge1GmPNindyANEbauoiMAdWNxvyS8UsuArDoILWw8c/J/QwPrU8SzDY1V
	OeBJsH4u2dstIw+FtEBEi1ugOwzEQ+2UU1WPalLKzcyPM9ALz5aeQY7raMQoTTbxhCwVoY2XqE5
	vVyFlP4/qP2rb1Js90cGulLFKnmEai/EwepzDcpYXeZFVcWkolR7csRzNc5HAYGpa4MRRv8Ccvd
	YZPJB07g76IbKneSJmulkblHASOOCo5IdLgMw7yWrQZPoEJC949
X-Google-Smtp-Source: AGHT+IH8IDvk/WDydlXtAGxfSBl62o86S2oQNUJZJ0chFDKIGNMGOBpCEUoAV3tH5VtXPXy6FgrInSfND5oRnNT0j9w=
X-Received: by 2002:ad4:5aa7:0:b0:70d:6df3:9a8e with SMTP id
 6a1803df08f44-70d771fa23fmr18348386d6.62.1755674176613; Wed, 20 Aug 2025
 00:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com> <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com> <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Aug 2025 09:16:05 +0200
X-Gm-Features: Ac12FXzuacsMRMxTUH4PUrJaT4uM129lJPGaToQ17MvoTSHPNA1c4dssgsCRg5g
Message-ID: <CANNYZj_DZA5C5Cjtf9F7RBkxpFN-n4YbJNTh+tCVAn4NDx2Umg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
To: Tony Rex <tony.rex@ericsson.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 07:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222159

On Tue, 19 Aug 2025 at 23:10, Tony Rex <tony.rex@ericsson.com> wrote:
> Ok, so the patch fixes a bug and then the floating tag/branch function is in place again.
> The floating tag/branch function is broken due to the bug and the patch fixes it.

Right. But this is different to a 'recipe parsing race issue'. Does
this patch fix the problem?

https://git.yoctoproject.org/poky/commit/?id=3d451f3452643a6fcaa7ff9345a6f955392daec3

Alex

