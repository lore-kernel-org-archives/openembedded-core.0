Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C01C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:55:24 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.11569.1747313723571258205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYl6sjS5;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774d68c670so15087251cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747313722; x=1747918522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bx2mJFTxRnYlzo1fYlqCywg/I23xHuHBa2MWRIVi+sU=;
        b=QYl6sjS5yTPn98w9uunC3DtJrGz3OuMkn/7o8GBWurDY77JXYKdeeQr413YKQnfZOf
         m9pqs/CnLG1C20HeRbDVGW9VDscKSU447VxpPFbt/5c7F1DvHyyWTegjySZ8LjeJioqs
         yNNJVX1mEfUJf1XLOTLd64lWsPeMH5bikfSiZmrwL1NFrYG0jhDBW6FwfcSXPNBdJAjQ
         QOZ6zSCeV/oCRNRFW3PRa+RhHkXiJaqAfJdrrD/HzsWz7gwgB0B76S3cdbrxKP3FtHyr
         J28Trm1zvinxn+BoGEHDNG6HFNBKnMYKnj3Xiq5tQOp1/lafyn1N0M+57mlPxYcOP27q
         mXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313722; x=1747918522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bx2mJFTxRnYlzo1fYlqCywg/I23xHuHBa2MWRIVi+sU=;
        b=gmRXlV9UFmHY0pvwyZ4cJ9azjFX2FU9Z0GAs9+Sb2xbwoBtGalqLq/U4ouYD14lVWO
         Wq5+paqyOfBQSMkrFtk/RqilqqVgwdzf5NTgi+fHgi778lTnVjnLtB9ETXcaHXUMkX+G
         EkHTvjuQuNGMOfI0Czfwhn4EMjJYw2a8+J0krPnINE6SCIJSmBjdoPxowZqFydeb7MVm
         Y+qVog0TvpXX21MKHaGt1byUQgYiUf+YfEz0F2RWT5POLu3Qll/7+sr0byKsPZh/4Ult
         a1ynfl3svQqe9uKbDnC79l8UtZcoDJkeYU3wW2X4Exxqf+3Sp7//iFUHJknyMGFeXvgx
         E8Xw==
X-Gm-Message-State: AOJu0Yy23nnaiOSabV3RR22yRC25/QZztSextoUU/CCMUDFjik+kcOMb
	D4mbRqOy4xn15k3XhW8Twi1IR3TXXaVmwZ00H8TRn3rdl6JdotJZWcnOIkMlD6irETLmeq+7swr
	z7gE22d2WKVuQA7IflBg9sB6xWiU=
X-Gm-Gg: ASbGncueFTPLwL47JqglYqohPLMhjjExo+9Yzn9ZAFri27ZIKXeY1qeBNJBRsyNTM6x
	DGHvqMBVf9y6wxZrPIn16leD0griJnMoKFNdYYDikQlq/sktmf8RX84J+F7tUuQAF7pNNarbU5H
	n90ta6IBIzLk+DH/lHyYbH3t5Jrt89J/yuHsn9h3Ac2hwsuyHkewVRcWI+vUDYzS5W
X-Google-Smtp-Source: AGHT+IEeD41cFucoARWLhnBq2fSySQbsj6C1DnC4T/2llOIX+3S91wmsvEVJ9mrYoxq9e2sgLhfE1bGjG7xrAz02FF8=
X-Received: by 2002:ad4:5ba7:0:b0:6f8:8df1:648 with SMTP id
 6a1803df08f44-6f8a4b874b6mr45342616d6.7.1747313718482; Thu, 15 May 2025
 05:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-g5MYbo7Nv5OzTjW=W2ECFCzNLi8s91RjtmDjrSO7_Wg@mail.gmail.com>
 <1013.1747236930335189561@lists.openembedded.org>
In-Reply-To: <1013.1747236930335189561@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 May 2025 14:55:06 +0200
X-Gm-Features: AX0GCFstjpBynm6OglvixsPi6cxp8yBR3V2DLnDahFK8Woj1cD0s8zeZVqWIZGI
Message-ID: <CANNYZj_MGGaG_GnZB=OtEHqd9xzmq7+2JQePc1szNJxxFNU2hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216668

On Wed, 14 May 2025 at 17:35, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> You have the same approach in openembedded-core layer.
> See meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
>
> SUMMARY = "Host packages for the standalone SDK or external toolchain"
> inherit packagegroup
> inherit_defer nativesdk

That does not answer the question, and oe-core doing it doesn't mean
it's correct or necessary. Oe-core makes mistakes or forgets to clean
up obsolete code too :)

In this case, this packagegroup is bundled together with other
packagegroups in the SDK code, and those other packagegroups don't
inherit nativesdk:

TOOLCHAIN_HOST_TASK ?= " \
    nativesdk-packagegroup-sdk-host \
    packagegroup-cross-canadian-${MACHINE} \
    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go',
'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust',
'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
"
Alex

Alex

