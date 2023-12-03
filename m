Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB82C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 11:24:53 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.37501.1701602687639749573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 03:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BziHlOZ8;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fb06f38df0so1374526fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 03:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701602686; x=1702207486; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EeZ5qlv4vaZ1aJ7bEX3Bo8p4jUhnsiS6lJmIPqR04w0=;
        b=BziHlOZ8cQ8u1j421HQrFu8P65qWa9X/lj4BTO8FWXX5M6d6S2SKqtJOKoGCCPwje+
         C2DHxnFSi5g1u8bYzFghx/oHmcGXBJRUOZoWjlIFvvqgoRslrJZJYbLo72detZ0JPoK1
         SqGYSzKHQJgYqdq+LKwZ2fWbQQmCiZ29CujDdKW+WwAtjM7Ede+DDWMK2k+MKRo9MX8H
         67so6a4w+TO9IiPDCayFbekkTgqIpvVGwk6yn8f0EQFqK1bV2+W8boQII183D42b7WMn
         fXJwwjRZP0SFUFL1BpvfM4pe480BjIakRGH0UeyvVDduDfoG9ZQqTe5N+w4oTHFx7LLe
         utQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602686; x=1702207486;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeZ5qlv4vaZ1aJ7bEX3Bo8p4jUhnsiS6lJmIPqR04w0=;
        b=RpxxIvx2u14XBNnp+qht59kcTjGKjmYTLDvBfcl2vWzfcGeCOD4XKMc3rLyJr0R+FN
         20AFbB8pm0Gz0DkelxRW3iAXg47EzbLplgs7XVAzXYsb94fGi6LvRFSdjvLnhbWa/sTL
         1duTgmJs2dffwiwjLX38tXoKKzHHVgJbs5ha1c8aW8wZG6/Sq+jm18YAO//g4LUSVNEy
         ax3+yvIEIxlK+58hxu6ChhBZpXoktoONbs+gm25QLeprWzS9oTwyo3Rv9hg9LmpnWpEP
         zwv/JXv1d82YHVDfLOAwll1LPhd5hkF006pFLZhVAg7MjKtWLLSScBuNyQ1dA2t4NC8G
         fX+g==
X-Gm-Message-State: AOJu0YzmXvKj4y+2USe2/kTimFU+MouWgcB3qZNDfBYyRNG0w2bXuv09
	4deURSayIHf/Pgydqft2XdTjVC/zdDiApBxZf/S4kAHfnME=
X-Google-Smtp-Source: AGHT+IFrTuLEGxZMPa+RY9O2fAsdbqMO0Zu48ewDvJ2YMzFWMcg+FHnG6uV0xl6PO5hGHh1V80ozKFbWyvTZFBo7Nxw=
X-Received: by 2002:a05:6870:7a07:b0:1fa:2d4d:873c with SMTP id
 hf7-20020a0568707a0700b001fa2d4d873cmr3352555oab.24.1701602686458; Sun, 03
 Dec 2023 03:24:46 -0800 (PST)
MIME-Version: 1.0
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Sun, 3 Dec 2023 12:24:35 +0100
Message-ID: <CAB2nKc9c1Lyk+vsVvQKWq9VL_5=jw1CyRtFvxZ7rn_-uzohaJA@mail.gmail.com>
Subject: packagegroup-base.bb override syntax
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 11:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191710

Hello,

I just came back to Yocto after several years of pause, I see that
there is a new override syntax, and I'm wondering why the following
line is not changed ?

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-base.bb?h=master-next#n125

DEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"

(and not DEPENDS:packagegroup-distro-base)

Sorry by advance if this question has trivial response

Best regards,
Vincent

