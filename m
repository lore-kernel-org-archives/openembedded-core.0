Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE01C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:04:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.55426.1680271450937902270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gQ7n4nUn;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id h25so29018857lfv.6
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680271449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rj23YHhpnhJwsxrsMPxiygmSpSxONN/JDelYWWgqpjg=;
        b=gQ7n4nUn6cVWtV8Cmraqyp6bfH4t573IHpGV6SbnRf7IwMzlMgyomO2iZgq1x4OHqM
         93O+QofJRIqCNHjsANpWF40Gyeq5eZ1lziNWxih/tkl+S3vIvHG9QlV5CQ1Pe7WQk4ta
         k4sw84GX6g94yzmsN1DMBJAGAL5hM5wgOFqyyusQKDf7C2if45s98AdXtfsRLjGbKDM/
         f9dHQTkDRg5kKLFydoMrLQDk3KGMyo7zhGLYt8Wo9iq90sGsegPGP7nCphff+xtTwld8
         YnfwAkNvNgA8ehqPTWZ2UItTaBZopnqEhfgqGhSm/K9T8Y2tgG1d1GeJ9lkv31kBAdth
         mOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rj23YHhpnhJwsxrsMPxiygmSpSxONN/JDelYWWgqpjg=;
        b=EMZ+d9osveNYYeb2DIzgTMnxiFFwp8OavrJc4Z7Z+LDROqwa4pKvOpf/qsZuQLT6Rc
         MlP5cq7wTkQD5cPghAFTq0c0uayhw8PW0ZSk7gmZ2m75JR/7uL4p707J2lrs9eHiK6ee
         k/9GbTL2epCEN7fPGEjHn/Ph1O3HZj2ze2lZNqq5Jtgl+YcE7bqHbVVbB1TU73URU2Ks
         RPlyg6lWQL+vrQj+ET+a9d0GSdu2zAFIMv4fuvbyhytuh26qSIauwYWstZJrheMdLcfG
         Qjm6NBliFlsdwjEqkOXhY3Ha6bu4BKS8jJ5+kmQ45/RIr534JdBPdUoB929aYhb90dkl
         F8WA==
X-Gm-Message-State: AAQBX9fgHR4vvKDYgu7gf7UqDNR1WovUMZo2rVJ0KI7w0h02zAkaCJlY
	pPvLGGvS+hr7WvQiXf3ziX8dhdvTU/kSekzwsO4=
X-Google-Smtp-Source: AKy350YK2bYtTUsvisbn1p1Pi2EGfkQkL3p4aDIIN4YBYAuVPSNJYRkFqTVahwEMs+jwHNz8y9DJ5bdiR/OCSYZLy2Y=
X-Received: by 2002:a19:5518:0:b0:4dd:a9e5:aa09 with SMTP id
 n24-20020a195518000000b004dda9e5aa09mr7897472lfe.11.1680271448682; Fri, 31
 Mar 2023 07:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de>
In-Reply-To: <20230331104025.1478393-1-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 16:03:57 +0200
Message-ID: <CANNYZj9eEiRD2VaS-V7yL7gMYgrKTR+sRwEBdUw78ayYAwTtcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add barebox bootloader support (and testing)
To: Enrico Jorns <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 14:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179445

On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> v2:
>   * set myself as maintainer in maintainers.inc
>   * move doc from documentation.conf to recipe
>   * update to barebox v2023.03 (including fixes for musl, etc.)
>   * set standard configs for qemu machines to allow building them
>   * add better efi dir support in barebox recipe
>   * enable testing bootloaders in oeqa
>   * add test cases for barebox (and u-boot)

Thanks for persevering with this! The patchset is mostly fine (I'll
write a couple comments now), and just needs to get a verdict from the
autobuilder.

Alex

