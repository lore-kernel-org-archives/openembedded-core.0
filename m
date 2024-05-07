Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D43C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 10:15:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.8173.1715076911802992941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 03:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SoTKDdZG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-518931f8d23so2884499e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715076910; x=1715681710; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GbF3zTFooe/KVbaCrXo9DYfHhUIhsqIoqY9Th4TCtZo=;
        b=SoTKDdZGMa237anGkRA5ORZualZMC0yGpEiC2uablM38WQsQdjlvndKA7WW5Ql4yky
         d/c5ZIBsdwtH0JcYyFUSy63Z/5/M2zm4xuGkPXd4bGmztw9pkaTQbFV4X5JnTLilW+dY
         yotZvcFjkePSqqSxx8priRXhAk/WZjo1piRiQq1b+BB/BOXNNGLRwt2nwUiLWw++u5e7
         Z7Pe9g49A9245+FEB/q05f7aiYXF0DX8T1ybVuUXMRqzf/HkSN6kTIJ7GN6J83d/mFfm
         1UxLuu5MI6zUpwCfb6YfqlcTHVEfBZ4pm+TiOCTUo4S0Ed5t4PITKi8UhnBhcv08Z+iu
         bm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076910; x=1715681710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbF3zTFooe/KVbaCrXo9DYfHhUIhsqIoqY9Th4TCtZo=;
        b=CmKK3TZyDkrFI+cgd6OnfEfPQF74IXzRF3AGFon9jmwehrj7p3hL2f0OLnhiwhABdy
         FwVRFF7XigTN7CE3KDzNyNWE+q+s2EjxjU0OJZ7ELcVUUYHpnZWQt3lAZUCZjdAbxaM+
         +zWzWTejLl4WPwxrATTq7KhChCKpXrmNvixm28ekluPxC1Yr1B3b6IGNOToNIG/pWXLd
         nykYUR7DCfIu4xFNh2IaSICLqeLNb7xBXGVepJAfpTP5rC4ExG/qM1qezMNqKF/tNNz1
         nuUzz7kcHU1XRPwyjmwAbEHWJIjUUBSQ5tblzRa8KQWY23/01Hg7zG0u/lvBfSp3xyo3
         YykQ==
X-Gm-Message-State: AOJu0YyZ16qMNHHHInpx/qBbes7C9dw3rACM2FkP8Y++Y3z0e6SB6q6d
	fHnqmv1B0M8xQYR7k1f/lTIlai0wTfXAHT0lB1zWOlIa0YcD5T7HPFXlAwhKUlKFtUvqK+y9tZF
	1GEty1PULeb90Wb2XJc6w0W3l2/8=
X-Google-Smtp-Source: AGHT+IG7qFBwGBd1QxX9Nu/+TxRl4ZC4IP+hoae/Kf9a2+YwuF2wpbFJVtzHg5bLi7CvCJzuYf71NF4KIZL8/HgdFys=
X-Received: by 2002:a19:5210:0:b0:51f:5a66:adce with SMTP id
 m16-20020a195210000000b0051f5a66adcemr7788802lfb.14.1715076909888; Tue, 07
 May 2024 03:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
In-Reply-To: <20240507053320.1566814-7-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2024 12:14:58 +0200
Message-ID: <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 10:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199083

On Tue, 7 May 2024 at 07:33, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:

> +CXXFLAGS:remove = "-fvisibility-inlines-hidden"

Same comment as v1: this seems like the wrong way around. Why do we
have it as a global glibc/musl setting in the first place? Shouldn't
we just remove it from there? I did some digging and this line was
imported from oe-classic in 2010 with eglibc definition,  so most
likely whatever reasons there used to be are long obsolete.

Alex

