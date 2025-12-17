Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E504BD65C43
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:46:46 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14129.1765975602076746417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCMWpf83;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a367a1db0so50791116d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765975601; x=1766580401; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u4WUeyhz0tvj+GqSU4vxrcfsPLw1mJXwSB3ZmMlVXg8=;
        b=BCMWpf83pwnnxQrOu3YOyLv0UcbqCpien4iIWMhiDMJ7njicZlAdKA5ByaHf3U/R9T
         SYtIr8YQ+lTjqGw0Pbl2RRk2iYiRDbzTP/ZVxv+ykggXurrQYZ4wBX339xIgg7imskLt
         lSuR688HC3YGoe1Vnza4Ri6bqAbVY/HFHO+ypMHtKrFpCO76LYViqZPyOcSLBb0qPdl6
         YcLLKxr4pYbMHgl8iv/Esig8xka+ZK406CXoDQIuImjpytN2eW2+gYT0JPRtidkeUmaW
         s4/cA7o5y/FwealBfNdrfUpjiqlRarxoWgH4jmCTvPwtELUhttV4s2/zELCC/Q/EdINL
         5otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765975601; x=1766580401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4WUeyhz0tvj+GqSU4vxrcfsPLw1mJXwSB3ZmMlVXg8=;
        b=rgaQLrh0unNSWZGE4y8EOB1JNYw0z//HchjHfddHTiMOnb5EIYllwnVR+jQTVu0q0H
         4eLVBp7OCLoAa+ku9l01HejF1wth72MFhJHia3fHPhdhtnPP5vIcAsC3hmsbfMlpY1XY
         k+PkoGJzV1TOZjl3iz4L7XWd8j78Lk1S7G9nui1mfgeGe90IEHa0X4FB2lMKTcdE1Hyn
         GyBS2WgAx0d4Z8+M4vjWpHcy990JBYMkfOyBFiFRdTfz6YG/A0MOzDRChYaQCSDiJaWW
         FyD7WWeZMSalTa23phJxSiYf++I6rfQ0FhrddTqfMdrEJHvHT4qm12UktX2dwM5FsWY2
         KGKw==
X-Forwarded-Encrypted: i=1; AJvYcCXEXpcuyA3Ypu4xV/r8LcDNDoLvykddYcJ5Xki1E+RqoOJI1Ltob95dw9eg+A23Ll3Fob2awWsnnjZ+sZqVdTu5JA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywb/6Uf9ZpNUdbHvsh5HapffQX3vWObRQQ7In7Eg8uSnbYi9HPY
	M5vFEG+Xf798KijL2B6cpZdfUX1ghNsyLSWqX24xE8rFpCaHEHFDmy7XyRNAaEKFA7or5AXnsND
	Hc4XIb77ln4FYYa/PjIz+08H9XyzjmQycAg==
X-Gm-Gg: AY/fxX5zr/F3U+QvOaAKssi8OBu5xo+YbMkmjOZqPkSN+aIfCg6DRES9L6Vqw/1sbS9
	d+eoSc2QJnRWONM5RhrduIGwmXoMWxJHonCnrjZPYUnTUjtDVKdyiy14xf1Y5UhShdSltS8ZP+8
	vDHKRt30+Y712ogrTqaWc5Zgx4CrKQke/m3LUa0/clcZz/h1xT9YRfjVFTq0iykXWaLJCtwsvXj
	BFpLVfSSCxjFpJ6lyk/rDKOhQMbSOF9GlhDQnrcUBZmbr4HRYkcFTW9n8kGqjrCF3dlc9tr5TXb
	hboQzvIzBTS1aGJW3j6zLQ2/AS1llA==
X-Google-Smtp-Source: AGHT+IHZ0ZDMQgaeIOCBEOAk1B7xoqg/gOmPRTIWGw42GnSDLTDQKe5hpmYs5L9uE9j4cUBdMCikMkm3nMVLXwLpdhs=
X-Received: by 2002:a05:6214:518b:b0:880:9151:2dfe with SMTP id
 6a1803df08f44-8887e1129f9mr266227456d6.44.1765975600994; Wed, 17 Dec 2025
 04:46:40 -0800 (PST)
MIME-Version: 1.0
References: <0101019b262ede8c-49d9befe-c250-4b00-a166-8ac8b9a5461e-000000@us-west-2.amazonses.com>
 <2a314131-0dc4-4a21-9963-03063761b8f1@rootcommit.com> <CANNYZj-TZkRiX01Pu6i713YfT+UwdVrk+m0FVVB2TobqtkWp5Q@mail.gmail.com>
 <41d6d403-a531-457b-bf10-dd6591e3faa3@rootcommit.com>
In-Reply-To: <41d6d403-a531-457b-bf10-dd6591e3faa3@rootcommit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 13:46:28 +0100
X-Gm-Features: AQt7F2qgVrLtjg8K4nUfkiukjkmKrrQKvdTJgl7Hb2LMV8KHZTI4W3j6gSCPwNc
Message-ID: <CANNYZj_qSGaE-2FA0hW+Z8hMoUGhzhZgWrKPM3ynkgzvfdPjGA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.15 FAILED
To: michael.opdenacker@rootcommit.com
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228037

On Wed, 17 Dec 2025 at 13:41, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=rootcommit.com@lists.openembedded.org> wrote:
> No, glibc and systemd (poky-altcfg) on qemux86-64.
>
> Indeed, that's a different platform :)
> I guess I should try qemu with musl then too.

AUH tests these two, so if glibc succeeds, but musl fails, it's almost
certainly a musl-specific fail.

Alex

