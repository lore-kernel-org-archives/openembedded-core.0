Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2DCC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 12:47:29 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.50971.1748350039958874949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 05:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bc8X4RCd;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fab467aacdso5421706d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748350039; x=1748954839; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIT5Kqk4uPhOwc6H4S0ObQI2pJWQxzWdxODKxtbrPe8=;
        b=Bc8X4RCdxDd50jKopGaakD6xcG3BnpmpAfGywPCuxSTF8YO9fMgcr3bkgVJKftTcbJ
         ltE/XX/lS4vo90pMLLHjEFj8vkPPAJV6peO5Npqh7Ppow4QJCebaECzlo88w0hbuhF75
         XyV+4ZiWYVODfW3dZYjUawsMhHvphY0HUnNtXahhHJBTewcrTTY+TNYoffgsUE6J3gAc
         TEWYZiGWxW7kg77gz6BoNNZpZ1aQKhAGoYtKMOFxeGDp/S7q0EuZEIGXubFpa8n0FoU2
         XVdiFB+Y00hBkcmxyJaAVQTR8TvPixh4qgCZ81gyAgCe0P/q2lMG9wYd/Y4uOAw94oXE
         9wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748350039; x=1748954839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIT5Kqk4uPhOwc6H4S0ObQI2pJWQxzWdxODKxtbrPe8=;
        b=ajMEDNFoRARs8w6rqhlS0hRmqYknsKELQ7y7MA7ap0c7ggmShVH6uWPoa08WerflUv
         QgMEmJC+UNiR1jiSeKhG9viaoa6kIDH5Se1SUpUpu00MH4QpO3bYxLd+lfTuMjVG/KpF
         zIjIjBEaHdFNHwTpvx1sUL3aeOv9BbDgEQvu98xw31zrttfaRO9drOQ4w68hFaExxf8n
         v/Tb4eFXqIk6vudplyhrmxlpYG1HG407sslqvLTQNQffyaSoHz82Bk3vAw9fcIfxX8zT
         jxIVDtL04XKtMFRAvWgxuNsVUsDvoxduCtKknNn29rV8TjhXFM0JKrLnfyBBAtd1vw6R
         2FgA==
X-Gm-Message-State: AOJu0YzMxRGrOfdZyeOOSjli/lbuRHwgEgPa3p0Ln+LX/IBbA7MEFNBZ
	COfrXClOFxdZpDHU/o9we4ikWRdxSZe0gXqMK9EhDgFpqX2xvm86hIOO+UWnnc79o2KYP5ZYSgk
	eBwZHDPA88iMpJ8boJQU1M5DsCIs17mbFjw==
X-Gm-Gg: ASbGncsOx4lYk5o0zYcGnRkRR9gtTwdtOWZnFc93EnN5WZ4NkRtM+CYYtEp6IYtFK1o
	xgBnvs7aVCnoV17AzLIBzrZ87nXQBffrl7WX4exn8FZlUxMbw0askvZa4UzOqtGZrI3/VXrjCrY
	pEMc5rz6msNSQSPcxD7fvz7AjFfvFsRIA=
X-Google-Smtp-Source: AGHT+IGi8j+86h/9+DQmD+TIJaSPdGV5zuBQ17/8x5IWmxLhNDhxlSTEwdDQbx4fPfDvVGy7i8us4jsuZnqfoW1YqfQ=
X-Received: by 2002:ad4:4eec:0:b0:6fa:ae8f:d029 with SMTP id
 6a1803df08f44-6faae8fd10amr84482636d6.23.1748350038880; Tue, 27 May 2025
 05:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
In-Reply-To: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 May 2025 14:47:07 +0200
X-Gm-Features: AX0GCFth-4-l8-zEqh-CPv1qMcJT6qZJA7-zTFvWuW9aDo1kJ7VcOmPuvF3DPjU
Message-ID: <CANNYZj_c-4fHeSOG1XxTZJNA_ORc9QTaYBiyRwsW75MNByQJ3g@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Yash.Shinde@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217301

On Fri, 23 May 2025 at 18:22, Yash Shinde via lists.openembedded.org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:

> Although including ldflags in INSANE_SKIP isn=E2=80=99t ideal, but that p=
roved
> effective after trying other alternatives.
>
> Please review the proposed upgrade changes.
> I would appreciate any feedback or suggestions.

Hello Yash,

I'll try to see if ldflags issue can be addressed properly, but first
I have to note that there's a significant build performance regression
in rust-native: where 1.85 do_install finishes on my machine in under
9 minutes, 1.86 from your branch took 23 minutes. You need to
carefully review the logs to see if somehow rust-native builds the
whole set of tools, rather than just the compiler. Or if it's doing a
full bootstrap, where 1.85 is able to avoid stage2 because it's
building a native compiler.

Alex

