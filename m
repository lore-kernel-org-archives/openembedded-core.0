Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9895FC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 16:18:32 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.57.1667578704537125746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 09:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZCf4LqfG;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b9so7074907ljr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9KHbyFiqdJI/uIaqMqwLAapkWNQ2A/zCFpod3gFI+0=;
        b=ZCf4LqfGNFc20GLe3v+lM3ivasXYWi1Qw3T283D+RSRVcZRjpXP7N7fY0/U5VDaWNw
         7xc6zsYAxy+q9tR7aEMpA/SvhPBWprnsW8n5euyxe7UK9M39x3pLrfPlupMJQsLzTmnj
         Y/wHkB4KSLU6j/hnJDVAeiIt0vUXDSY75khP0YgEBJNfqsqT77yg44ts13WnpbXKK91U
         F2xxhHuKqZaA4CVl9u/iGpMBMRgPHHqorGe12mXsRP8+Crsa5vYetJh+PbeSSN3hCz6q
         jyfDk/eHYNqL0hUkzVOMqurt9PBiNjr/j6TkTW9nOsFvdZeBK8soWhczC4VJwx4/KwqS
         75xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9KHbyFiqdJI/uIaqMqwLAapkWNQ2A/zCFpod3gFI+0=;
        b=ebGaQ23KXuplMWiO8dkp/og6HmikbJk3CL7FyPNM8VTXp7GTVEGkHZYu84xhL6jV4T
         zN23h5IR+puMjUj86FtZNR84xoOqAAnUrP8nJQBr1i9fNBP7nNqYumhT5ahEufNjLuFU
         B6CtpMm7fZPnifkxcQmy7UxYdi+VyBoLMH9fPyutD7Cwqlh3PwQF9zhY6QTQdW72Ka/m
         toCBQoeJ2iKB4gqkC1q9tZEBORsqNu0DUCBGDiLcnkQot029HvFvNukyIeU7AuFImLoY
         Ye3H5oZZDjrW1eGs3vvemWHrnZsBaa/lkuq8y6wx1KyE5YIjZ5++pwdMgXFk4lUmZ1xI
         WfsQ==
X-Gm-Message-State: ACrzQf1YPPm4C3T/JFPLlXPxBBcCjx21Sl/99Uqb8QwUxhgWHN5TYGP9
	zkIpwPC9n65ej7wjYsG1AVVnhCXcbjEe93FC7pQ=
X-Google-Smtp-Source: AMsMyM5+9UieIsdPadzvg9VAJj3yyjNGNamSPHcZgSpQvSQZnNTwF9PZPftUJSlo0afoyUz5Djk2Kq6N6P1IvQJyytg=
X-Received: by 2002:a2e:2405:0:b0:277:524c:f83d with SMTP id
 k5-20020a2e2405000000b00277524cf83dmr2329135ljk.217.1667578702700; Fri, 04
 Nov 2022 09:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com> <22885.1667573983338145032@lists.openembedded.org>
In-Reply-To: <22885.1667573983338145032@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Nov 2022 17:18:10 +0100
Message-ID: <CANNYZj_xkk2y-SuQ8VOFLWc-mYNrfMLe2uVTX3o5KEi=J1ixhg@mail.gmail.com>
Subject: Re: [OE-core] How to use linux-firmware to install single firmware
 package? #kirkstone
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 16:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172721

On Fri, 4 Nov 2022 at 15:59, Vincent Davis Jr <vince@underview.tech> wrote:
> I can confirm I'm seeing something similar with MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "linux-firmware-amdgpu"
>
> I use with OE-core kirkstone HEAD + custom distro config. Was wondering of the best way to debug why issue occurs.
>
> Is there anything else besides bitbake -g <your-image> and INHERIT += "buildhistory" that I can try?
> How would one best check what happens during rootfs creation?

There is a log for it like for any other task - look in
WORKDIR/temp/log.do_rootfs for it. You'll see exact commands issued to
the package manager for one thing. That may help pinpoint where
unwanted packages are being requested and installed.

Alex

