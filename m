Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A77EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 17:15:35 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.1700.1689182130349177326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 10:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YPobPG7L;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso11747544e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689182128; x=1691774128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97YV2S6NG5HELOevA+ZymWHGhdc52t/lvMawHQnCIuI=;
        b=YPobPG7LhSbvXMFMTejC+9xuQlD43QtYlPL8/X2ebzG0o3oD0gJ1Dh1NjtQAdmimT9
         fqNUPrWgke39cVFni9QiOeNbxnjwgkmct8WGLtE22S3jOT+J6p6sr/Zwt+1p63XU5Mps
         GQR0CvWkPYP6Tb1yL3UYgx4t/UAYeroxLXIqr92K6f+ECjg2z58PdKef4iF0W0Qlywoh
         9p9aOzVW/NFFV6molGNvi/noLYCIzxqTv1ZrFAVurydLWr/IyC1cWqh9uBbsTjNSm2uq
         4bRFHJAs2Om4rYJ0NiaC/lGWg99Iud+ikgxcGkbPgFDHbeYAYeFiR/IoH/n5whjab34k
         ZeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689182128; x=1691774128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97YV2S6NG5HELOevA+ZymWHGhdc52t/lvMawHQnCIuI=;
        b=alAFsagGDNXLzetN3WIjXqhmGUrOY5hOa3bC3u0GJR4fF42PSUhr4VvIC8Lfh9RL/N
         kybyMaILPMWvx/EGDQkHUQZr2ZdWBFR0YD4va4YhG8TibB6GJTE8VFzRJSxRJsxyCI61
         HSWvfKMPqoH/oV12Qmvfpsv8IKK8QN1hhjXH8XKpDNMjpCF3Z3AZ3TIvQxwtq6eTq7px
         tl2ThZoRWykPDm+oHmqnspYSOt/GEBGJFl5/NraeJeePV/92LVwJ+ThvNJ6TDSUT8oEz
         sBBJ1cNvKkyaqKg4RKVtpGEyY3k+jmmsfPmhVT+pkH1JKiHOLIMIqkoV23lIW7U31TbH
         11ug==
X-Gm-Message-State: ABy/qLYZhRW5T/zqxhHeQW3GKC7EUZyi8yL+gEsItqBGmk4Pk0ZH90SS
	6eed0JVsDky/kVFuw3HPtR5eQARoY3Byz3u3w9E=
X-Google-Smtp-Source: APBJJlGuogox1tu2y/esofQoJkTZjIU3D3wi1Z1G6t7OseZCDr3XBCsFC2psh/4Zu7m0afpdv7hM0oj66XLbz3Mry7o=
X-Received: by 2002:a05:6512:3112:b0:4f9:5519:78b8 with SMTP id
 n18-20020a056512311200b004f9551978b8mr14925355lfb.63.1689182128247; Wed, 12
 Jul 2023 10:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230712122558.711029-1-p.lobacz@welotec.com> <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
In-Reply-To: <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jul 2023 19:15:16 +0200
Message-ID: <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 17:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184210

On Wed, 12 Jul 2023 at 19:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Just to be clear, I know what Alex said but after further thought, acl
> needs to move into DISTRO_FEATURES_NATIVE in my opinion (and Ross'
> too).
>
> I suspect Alex will agree with that too after thinking about the
> arguments I put forward about simplifying sstate reuse.

My comment was strictly about using the best syntactic sugar, and not
about the merits of conditional (or not) enabling of these features.
I'm fine if they're always enabled.

Alex

