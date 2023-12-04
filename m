Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DD0C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:13:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.69522.1701699227146585989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 06:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTNZIKM3;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50bf1e32571so1568914e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701699225; x=1702304025; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uubb9C70FHBIIEuu2GafxlFF8KPX59OlGo8N3CWfoQs=;
        b=YTNZIKM39VlYfobgliRxOJ7XIj6mI9kRuO33SbVHHOym51UnfBiIZIA5j2M/ZvA7uu
         IDIlovmNb88g7UbBCCQY9xtuh2RVvYYVb5uFQBabekZ6043WrcOJmSxm3Em2EGlCbCxh
         ob/xJUct9qb15QFCrN0kRMJ42X36tzxLGMsdwA64NvzmTxskrxUGgI0WjigB/BgxIQ6f
         TXhngdJWh7MrS3MYZWLjuZMPLvHWBV8YX9up+Kp/IunEeyEbQ+AmCjJekLzchUIRo6OU
         hx0SB0jXZfHQ/Ie+EoCxoSO3kbIMoxx/DpHTIVR2R+pxSzzgZljfIfrQwaQZDFeRV+de
         Gjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699225; x=1702304025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uubb9C70FHBIIEuu2GafxlFF8KPX59OlGo8N3CWfoQs=;
        b=pln39GmozZFUv2Kn8cg//JQn8Ryabi4f+scMwZBhz6UaQc7rE+0W/3uRO3vcZgSXwz
         O7TqLrLZ+cwToTplkqgMudcqUXevPsKjTFBDUiUjFmf0yL4CsUggI0oORfxyup3qSLEH
         HeGeFKexXdsjVrT8jFpcCsk4ev1683goSih6x1b7ya3bS8Trckk8p2tJXyNFpCJU3Bww
         hk9kpKWXPRnIAAUZORtzSAK71mkIce6WnNWOg8EVM0PQOum7O28STTV88auZddLFjrQ1
         V4Rtts7o8nBleyqFu3B14Sf/rx2Aldl1h1bratbW/tEQjKVbB5blcmPWrg1YO4YK6hUU
         cPwg==
X-Gm-Message-State: AOJu0YwGrE6K24DfwxnArrKqpP71KQYnps4mENPBE9K3J+vKXZIPy7PZ
	/2KRYDpQCLDXUBMFy1goCuUv+sGdvn0fAcbpTMI=
X-Google-Smtp-Source: AGHT+IHAKRz5m8zzXhN7h/AtI0Q31XJV/ClDNXRbT4rTpFh1KBjZknhY0msAAe9uYG0hgdStTM0IVM8+B+7e91x+W0g=
X-Received: by 2002:a05:6512:2c95:b0:50b:c253:ae10 with SMTP id
 dw21-20020a0565122c9500b0050bc253ae10mr3535441lfb.62.1701699225078; Mon, 04
 Dec 2023 06:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20231130161624.1833206-1-andrey.popov@yadro.com>
In-Reply-To: <20231130161624.1833206-1-andrey.popov@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 15:13:33 +0100
Message-ID: <CANNYZj9DFQqUwJ4_QXc3o8wZEDLHBZvHxzqdH6qFt8J1eNQZ6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 14:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191739

On Thu, 30 Nov 2023 at 17:16, Andrey Popov <andrey.popov@yadro.com> wrote:
> -       # EFI only
> -       if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
> -               # Work around bug in isohybrid where it requires isolinux.bin
> -               # In the boot catalog, even though it is not used
> -               mkdir -p ${ISODIR}/${ISOLINUXDIR}
> -               install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> -       fi
> -

Why is this snippet removed? I don't see anything that replaces it. If
the removal is valid, do we still need syslinux?

Alex

