Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E301CC54EBE
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 18:34:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.64217.1673548458077232102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 10:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SPN2ekK6;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bf43so29702998lfb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 10:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnCn0XrXrYm4zJKRajeaVoWFUOJ+/Z1Kd41CodpGJCw=;
        b=SPN2ekK6hdBkGV8k9NVubNaJWMkiId9H69URbGYhA6gA5VX690T2QmajLP88KQBaK5
         GR6YbPF6/ai+llylnxmMME3lBzvv/IDbFItfgG+U8ncMLrSdyaVZTR3HEJq6Va4+BH/u
         wgUe3zoHQjRd9dGzfzq5jy+8uokNAPkezdETmh875ySW+ycuQ07lmuNCa0p3SmheHi25
         +hVBf/l/TAgbRmrJg4EH9iWOwp5KXZL1aPGmJp+i7ohuzqlkNNR+HCaoTv92J4UptyUG
         1VLixFfMtpv7YTtJ0qpnSOItX4TE3Yz2wq8mg1GkPQg3o33z2A0GYwSW8yMtyJ0LoAQU
         COfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnCn0XrXrYm4zJKRajeaVoWFUOJ+/Z1Kd41CodpGJCw=;
        b=rE97LnMhhjzmPR9NJSP255G/yVfc5NHFqMhybP6XLC4W/rZBjs0DYLRdimO1oCSGEK
         ZUdDc3r2i3e11aITM8ohTtxT8A+POwOei8g1C9Z1DUw4xz1Xs2E+KULBy/9B/NSSooa7
         MbuzR847B9lz47A48EkT/5iLtqsZmMiKZKirjihOya3zE+XjQRi2GSjPNbTeyDjWOT3u
         WwcxN4jxsoZFtiSFWNmJAHtC/l/Sizj4/Cf6ZNS9ShJex4vFUq9deWS7Uih0c6uYzclu
         dJQVPM1SFvaMI7O6afddG7605OYYupHI+y+8aYhOIy2Gng3hmmOVSHvFyMVsQuFDcEIM
         X/VA==
X-Gm-Message-State: AFqh2kpg+9asXUjumwSdFC2z4bSh9Frp/lC/sU9haKW4Lp9fpR9VHblb
	WfFkMeMU8dpH1a5P3ooHWG0oFJfv08r9/mkHKYc=
X-Google-Smtp-Source: AMrXdXv+D6i7f2Wk7wATGd6kUpUq+n9RgZODdr8Uada5gIqwxVu7aw+e/SpN+Tz9IvtYvDwTILq3bLN5veRM5sf5XJs=
X-Received: by 2002:ac2:568e:0:b0:4cb:4404:1bc3 with SMTP id
 14-20020ac2568e000000b004cb44041bc3mr1467586lfr.263.1673548456350; Thu, 12
 Jan 2023 10:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20230112154135.2284006-1-alex@linutronix.de> <CAMKF1so_hJxZJC33XwUKSAfBtgBxkHRrKeQqjtZ8fom41fJGQg@mail.gmail.com>
In-Reply-To: <CAMKF1so_hJxZJC33XwUKSAfBtgBxkHRrKeQqjtZ8fom41fJGQg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Jan 2023 19:34:04 +0100
Message-ID: <CANNYZj-R0fEqdsou3N75UgWmLw9L0f7rVqdTzVp2h_RrdO1U3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/virgl: use pkg-config from the host
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175804

On Thu, 12 Jan 2023 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:
> I have seen minimal distros with yocto prerequisites installs but no
> pkgconfig installed. So it will be good to add pkgconfig to
> pre-requisites explicitly as well.

This is only needed if you want virgl acceleration. And even then,
runqemu will prompt you to install the needed pieces if it can't find
them.

Alex

