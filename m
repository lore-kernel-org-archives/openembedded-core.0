Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A15D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 14:11:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16745.1764339072646054432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 06:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixfQW+E7;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78ab03c30ceso16695837b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764339072; x=1764943872; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm/fsbHdy8+b+gSn3km2aljO4t6fFQhzzZ096WBrScc=;
        b=ixfQW+E7uTksz9dfZf49Wl3aH7XtMOZGCfdZqrStozMp3s+oBa70XF5RfsLe83ISlO
         nmpdKesGGPkb/in7IirgCUw9DN509UIFXbBPKfw+zFHXVOpOG7EzUlKVhzBjjdVHlb+O
         Z60v8hI7Su5exRsH8httHqWzTEYN8sfNGXaV4nRZGqBr/hPAUSpPIYnH6+g7Ap9W9pEk
         e/t1wi+C8ZegTPxvYdaAaSfyN2MhCBsuWEX31Bc+KLzlCIjrPxYyQylizN0fprSyH3xQ
         GOIPjZPqHcQHYUE3+daNfLraF5tI4ZyTjd7VtaTp3Ge9Sl33A03QZrsId2afPTjPDvyx
         RB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339072; x=1764943872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm/fsbHdy8+b+gSn3km2aljO4t6fFQhzzZ096WBrScc=;
        b=BL9tcGsPGpyZ2UhycXGPzcIeGKoYX3Ib1q2eDxdUkHu84oSId3+Ajyp77SK05EuZsR
         gHv+8s7a0yY7B8gkOFwA7uhMqBIaGEmQsgqXZdRKdQEqaeIhZ7NUZuW4HeS0Nnk6Ss2I
         yxTGWnU2rIAZQlZrdxpCHXNgteIUG1i7pQtvx6zpiDin96E/7t2KXbywe5KbCF9JwiwT
         e1YqlM/Iq51Z17jQm1B/4HFirqau9kuIbPNsCsloaJvDqx5L0h+cFHVqA+WEu3tOvTwL
         r4M9qBPsvoT+CFiT9OCTPTMfZfg8vS0u6HKy2PQjNVPsvGTBLVrGVn9fRGhPFKODoYd9
         xH8Q==
X-Gm-Message-State: AOJu0YwTDrGON4IwiJtNsg5H5AOh+0g+raM7nrK+owPRwbns5RnPqiWT
	bbDK7Xdv8paeWPhCw0Lk7V4Z1FNAV/ivhbMpYrnj+LIhN2iFiBF5MQSmaJy2Tt307hFwN9Cb2bP
	95I63VGazArRX4KrufuUeagxRF6kpeVM=
X-Gm-Gg: ASbGncvugAvrZMoF5f+d26RxyxBDrVvVZKwLc56euTQRsFqyxC9+ITOZ2Z3l8e2t9c1
	0uV81P0GwHsa85lR1cpDIzofniMDXBrWCXtSdoTE12WAwpCZCQdmFHbDBs2ZuXcMkYeby6JtiIt
	XefmYhJq4FkboawuZyfy2G9rd1/sMIyzuZLdwKWdScTcIIneFCyKHY43KxwiNKX+N90MqsRD72z
	PXqcxaeZcIL7sAYzV8KEc57sGIddS5VUgU2S1bltfEs98YiJOlkqyNSCDejc3vkZ2zVm/yChkzF
	iUzxtLwxoQ3dMvO9zrsoi685PSHo3A==
X-Google-Smtp-Source: AGHT+IEc4CkMB+AqYl0yX4Jk20gSKawzbmONCr8qFokEXZ1LgOQmK/k40/UvU1ZfvKaIt7af4V2PseAdWrCHYqexiR4=
X-Received: by 2002:a05:690c:67c6:b0:786:5450:22eb with SMTP id
 00721157ae682-78a8b493efdmr239360257b3.15.1764339071534; Fri, 28 Nov 2025
 06:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20251128091606.3465381-1-Qi.Chen@windriver.com>
In-Reply-To: <20251128091606.3465381-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Nov 2025 15:11:00 +0100
X-Gm-Features: AWmQ_blFNUFIArjZGolFKXFGW-CbXcDolmIT29m5chUXY_TOPXEkVwL3cKbwsig
Message-ID: <CANNYZj98Wvbc6dnt6cKT59VyBB7XtO+ywj4XzB2zJH0KzgLEzg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rootfs-postcommands.bbclass: fix adding 'no
 password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 14:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226915

On Fri, 28 Nov 2025 at 10:16, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.

Wait. The check is for the 'empty-root-password' IMAGE_FEATURE, so is
your setup having that feature enabled, and then setting a root
password somewhere else anyway?

I'd say the correct thing to do is to refuse to set a password if the
feature is enabled. Can you show where and how it is done?

> We need to ensure that the function runs after set_user_group function
> from extrausers.bbclass. So change to use :append.

Why? What does the function do, and why this needs to run after?

> Besides the above check, the '\n' at the end of the banner is also
> removed. The '\n' in /etc/issue means hostname instead of new line.

Please do not bundle the unrelated changes, they should be all separate commits.

Alex

