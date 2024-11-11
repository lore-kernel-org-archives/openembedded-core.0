Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036B6D2E9D8
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 10:49:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.56547.1731322172422914078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 02:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXFN0w15;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so7249727e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731322170; x=1731926970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OPlKndMk5BO2/C92HyG7iTD7ziX2AoUpxzTmtLHDdMg=;
        b=CXFN0w154CFSJ58FVcUvLmAEsczX2gglSHGCIpK4fwHpmF6KpBjYL33D+y23NjkVk2
         usrPl/vs8vItwlKmn0Ng1Qv+o7nOjKf5SVukW5nZvUfP8fcUlYEPOtlufSqHap19dJ6g
         E4IzQexsIokizDSy0x/1QQBDallNGhU4GRC9aQDMTM7TYh2GOWo0NwLMm4l1ER97HZaJ
         LJy0Tzl0IRCy+wsRp4rv7wwmoMUvAlknWTArtJaSNIQFp/xBX0zWUdO/yZEfBleONH2D
         FkBoj0OJe/slkXcdPYJKtLmo8W9a7JgPPwcH6EHXd10y7CYjg39+WknYVS61SG3+Gwat
         PomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322170; x=1731926970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPlKndMk5BO2/C92HyG7iTD7ziX2AoUpxzTmtLHDdMg=;
        b=ZePCRbLBseZVnUBaNBQSeftwAXWneQpPDMUAUYN/fdQaHXo25lZ5o4r3DwSZ5p0XQD
         mptGrUFi3ZA3Z/abgNv1skuCwyL23mXNgV19MH/9kvRvpwzAjkV9FC25LS1NIrX2raIu
         uzi1IegUaHlie5kRPlNvWGuhAR0xbq/NILwpNEchnAatGTOYYX4MvvqcteAV4WNMJuYQ
         zbnHDXjSl0hEGNqoxRt+5jvwbaF2oMioXrpYEjeaO93xXvd22J9B6aPNtYgoSpRhYUPd
         tDemvrYyTxt0B1UEAalD4WFSpveQAP8mCfvziUt321x0szAh0/q+Rb+Tt5o8Ex4Lgs3H
         GlZA==
X-Forwarded-Encrypted: i=1; AJvYcCWIprpBO8uwJepIJu2p8xvxIw2fJrOdwaFNNuNonvKF9jtYYc4Q3zUwcKm7GrOOt1yFbmOu86Fe8MXstIUE7f9hrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzmlge7VfNEGDeA43jffCBSfzTsk0xD+n28thYgNPUgPjTCYeI/
	F+UXmr5/fJbuxDpHaD1fJKxuywIQ2ySaHPYKZb+v53WTkHRmbxRkw6NWzZFTqm2URApqCHEvJ4m
	rRxNvAmrmqfAYnBylbgpV7+ZvXZM=
X-Google-Smtp-Source: AGHT+IGpqMbrOy1+eeB1BgAVBLd6kDHZwY5nQTB8kXEUe+MQGeLKu/lpOZF/5Oz6c7a6ooYmaike8GdZMkKs+yHPOJw=
X-Received: by 2002:a05:651c:b2b:b0:2fb:3ca8:efcd with SMTP id
 38308e7fff4ca-2ff2021b3admr50781871fa.12.1731322169880; Mon, 11 Nov 2024
 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20241110132848.2135721-1-f_l_k@t-online.de> <02ea8fa9-b33d-4f10-b8a9-98a4f62c1d1f@windriver.com>
In-Reply-To: <02ea8fa9-b33d-4f10-b8a9-98a4f62c1d1f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Nov 2024 11:49:18 +0100
Message-ID: <CANNYZj_4vOpEQfi3H5eR28WXwLbhQ-dYQFAXyDxP+CfFOAf-JA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Qi.Chen@windriver.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206944

On Mon, 11 Nov 2024 at 08:07, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> 2) How could this help avoid reproducibility issues?

Reproducibility is slightly incorrect term to use here, a better one
is 'build determinism'. When a component is using auto-detection to
enable (or not) features, the result build configuration can quietly
change behind your back depending on what was found (or not) in a
sysroot, or on the build host. We constantly have to fix such issues
by adding missing PACKAGECONFIGs, or forcing parameters in
EXTRA_OECONF etc. An option to blanket-disable such auto-detection
across all of meson is most welcome.

Alex

