Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02275C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:14:36 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2839.1750407272378256608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iCzpvOVT;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d21f21baf7so184210985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750407271; x=1751012071; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlouaHGQAtJFqWGYYD6Y7haKF1i5uG/avfgEP2sMG0w=;
        b=iCzpvOVT7t46uL+Ykb/sAm6Wt6i0RnCYxslL0+EpcOPUXu90S0qjXYTY91E63mFqc/
         WC0byz27540qlQAyRZJ1r+rgNsVWie3Qf2ohexF8h2fB67MaJLTD35g1emzCu07LwJgy
         YZAjocY1DfD+T4ohwBMqw6+VUqjdJxAR9f2a5/kC+S5tg98GukHJiF86CEv0ve/vY0vm
         UT8v5p54QjdkOV++bp+jmRQd/GU/JsyC0DbbVyRwU+P0TN4r0OzhaIBUaXRdP6b+HlE5
         6/wruyTWt7qvqaDRfKVTO5eWSDBI5GpQwTE2qi8/bSen2jFZWKmNHfPJZEiABefw+D0x
         ykJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407271; x=1751012071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlouaHGQAtJFqWGYYD6Y7haKF1i5uG/avfgEP2sMG0w=;
        b=GvJP00svtbcZ7iH9lgsJVRCSRrwHBL6Zh/DQzFLw65GSne2cKwT7qnmykAe2x58kjL
         LxP0pJJk8LoVrDzE26ST/h5HaWeENDHG/cty9SR9pNyikDkDt5T2IXBq2XaVU5VFHLMS
         yGynzaLF/6fJAC1PgokBfABmfaArvmJTJ7FvwAXhfPuSJsFQ9e1cbrVDWF2pPYJaWfpP
         c2LvLZtXO9/4IhZ51KnjvkWbE0WxlSv2s6lMnnRxBmpofqL/qtRrhKFvDpGk06JFD9sK
         487/X7OaqR0HATzwtGn/x3NdxQ78iaCRjZrEBO0UoMXk7UaH3hUKifXLp/E3xRezPFse
         Q0dg==
X-Gm-Message-State: AOJu0Yxa2MZ/f7uvJARo1uRiORZdMV3jsEXC84pE8rQvNZqDrtVEGPp2
	6TwJV30LRPbuUQn2PwFo6Qk3M5XqomOH33Yu02oINqttqvwRmfwXSRo94hprsLMUbcFA7wpciyD
	1mg/1HCiHDeAKpshmREzuVNjSRhqnUQHg7A==
X-Gm-Gg: ASbGncuYuhLSkYmJI1MOvxjNStDIAxcxEe3bzx5mEZ9gS2TpOfdrk8DRf2nK91Eacop
	aCMGXycRvU3jk1Oh+H+FeX8/OCxrPtkLaU2Jf6sEx1ToQ3GjjytLkqn3ZP1R1Tb9p3Hw+vLAKqO
	Wq/EkenL73ufCkm+hgz4mG80YA/nywepRVheouxTptYqsJ0OY4RmK4whEVc86N+JVvVzyrlqf4r
	yxYdA==
X-Google-Smtp-Source: AGHT+IHBJh+He/L6ve/xD88eDGLaS5x8taCKzfyVJn7kZtMOnCM1MFvmTpkjGCrf5t9LCQ3Idw+Sv0OY1rHonwbbfPM=
X-Received: by 2002:a05:6214:d65:b0:6fa:fbb4:6408 with SMTP id
 6a1803df08f44-6fd0a468d1bmr35896316d6.7.1750407271161; Fri, 20 Jun 2025
 01:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250620080840.562802-1-adrian.freihofer@siemens.com> <20250620080840.562802-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250620080840.562802-5-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jun 2025 10:14:19 +0200
X-Gm-Features: Ac12FXyUWiJ8gpD5QRR2p63ui379vbl2I7XaR8m67NrBPtSylkEggYR2VLACqiU
Message-ID: <CANNYZj_8XRvkDLwiysEVtx48_v3GJyMBwHrFpd+qQhLS_zfzZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] oe-selftest: devtool: split tap detection
 into function
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219112

On Fri, 20 Jun 2025 at 10:08, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
> +    if not os.path.exists('/etc/runqemu-nosudo'):
> +        return False

While this is being refactored, can we please drop this bit? This file
is created only by runqemu-gen-tapdevs, and it's possible to use other
ways to make the devices (e.g. runqemu-ifup).

I've recently had to comment this out in order to be able to run the tests.

Alex

