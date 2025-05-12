Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138F3C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:12:04 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.46055.1747041122443722384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTZdN2dH;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so55408666d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747041121; x=1747645921; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+RaiAmPC1nxGM5UaowAJtth7M/7eny0/GuIePd2Hb8=;
        b=BTZdN2dH+5UbhinaA8DzmhzNVRSUCmMUPscBVhsenrXL9IKuFKSc1tFavEs4alfj9h
         d4zLEArz+rF5faejazQNI0dAEcnIFLGu8nY7mgypBl5sYrElwlsXzibQ6eVEyQqXag+U
         5PFaCPs0aI2MvyGWeDYihPOovNhOflnT1PIALeXXxA6jTgGmjbuuh5aidYqOwXGoH7wu
         D5tr2uFuz+pU+iuyw+TEkfPhQtB4z2XUu3I0ZBVuaN+fQZ2Nm3eSG2Xoivzgf0D8Ad7s
         GlXFnYlUjbMKLgTmlOw9v0GzD3h9acV4xDwf7txx5BkjFa7QcfwUQKbHi73kAobgmZOe
         WmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041121; x=1747645921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+RaiAmPC1nxGM5UaowAJtth7M/7eny0/GuIePd2Hb8=;
        b=VR/3iPKl0zSR/6+bpT5mVXTxlIroTuH6IqY+hfg5DNksLgOVB5L2642p0kDKiCn0PH
         M14VdayCGngh707pYNw3HE8lQy07tr9NR52RpfxTQ6oEZQutOqNoqHE07szdFj6skI0X
         d4ThZmsGgHbutgeV/hk6aaCIZx1lDta9yN8Fecw/k/8TFQ3D2qa2f5mySo0PLSH4m+Nb
         5tfRto9jBXHXf64Hq2pU7KJ+F3cA5Eml9hNrZzCFsJxNBWlV1Y6nem8HJyYZwSPLfKVV
         ZNjeFQsZHk+lOhrIXrPlsQng7BNpwrprgFw4Q6KiKw5Vdwk40GSWkwVzJneb87e7ofEx
         +Wqw==
X-Gm-Message-State: AOJu0Yz2EAGCoAfQL/EMVmiHYj82wKHPr94NH30y6k8lVY2Qk76TXPSm
	vbfyxcWHvtTle2RDzHhldyJhsfIswloTxedIg9Qt1EhNdTEUNrOLQdmrQraZmQhJ1KumWudVIhw
	MfW3+p1QYUy2/VWyRANZq3FZmtTw=
X-Gm-Gg: ASbGncvCuWgda2DM3SC3f+kgpv6JHbFyeiLGiuDPOnSAtS4bbigj+pL5Mj8tPCkKPEz
	awPXb8yN3wrikOUsYudYOCDWLKK4OxtSXcIHUUvglRfnV3ZgIglCZZS5icxGwX7n3dhSOd8/um8
	OsiqaFtSVdTXB0li4DOJd4AMawRE3b7qZCew==
X-Google-Smtp-Source: AGHT+IEiSGRSZWDA5cugzdyXZCkyLlFPQN6BJQwJdvYl2v255MR+smopjklnJ1qGRTmk/yru7GPf6riyzEhHrDLlpqU=
X-Received: by 2002:ad4:5768:0:b0:6d4:1425:6d2d with SMTP id
 6a1803df08f44-6f6e4840d0bmr175023076d6.43.1747041121524; Mon, 12 May 2025
 02:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <PJWL.1746887210684093988.qpOD@lists.openembedded.org>
In-Reply-To: <PJWL.1746887210684093988.qpOD@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 May 2025 11:11:51 +0200
X-Gm-Features: AX0GCFuOcAH652Toj3El5U-3IfjUMws3HKmdDy9YkYlmNn4oYkZipsfcheoglpw
Message-ID: <CANNYZj-uD+Qvs10W7VsRGMtxHP6kZ6W-jFsXSDTxu6Ptt3NOFQ@mail.gmail.com>
Subject: Re: [OE-core] IMAGE_FEATURES VS PACKAGEGROUP
To: emailaddress.ashish@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216355

On Sat, 10 May 2025 at 16:26, Ashish Mishra via lists.openembedded.org
<emailaddress.ashish=gmail.com@lists.openembedded.org> wrote:
> I was unable to appreciate the exact difference and role to have these two entity separately.
> Below is my understanding, hence though to check with members to get the clearer picture
>
> IMAGE_FEATURES  : Acts like top level wrapper to have set of packages added in image implicitly
>                                        - By implicitly i mean which packages will be added is controlled by Yocto layer rather than user
>
> PACKAGEGROUP    : Acts like top level wrapper to have set of packages added in image explicitly
>                                        - By explicitly i mean which packages will be added is controlled by user
>
> So in my understanding i have mapped IMAGE_FEATURES as "predefined yocto PACKAGEGROUP"
>
> Can members please help to get the exact usage here

packagegroups are empty packages that only contain dependencies on
other packages. They're defined with recipes, and otherwise behave
like any other recipe, and packages produced by them can be added to
the image in the same way as packages from regular recipes. They're
beneficial when you want to group packages and install them as a set,
without modifying image recipes directly. This scales better in
maintenance of the product.

IMAGE_FEATURES are loosely defined as properties of the image. Some of
those features indeed are about what gets installed (e.g. dev-pkgs),
but others (e.g. read-only-rootfs) are about how the image as a whole
is configured. You basically tell yocto: I want this feature in my
image, please figure it out by installing what is needed and doing
other tweaks.

Alex

