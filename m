Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493A8CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:49:41 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.13104.1759312171209518881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WR4i8up/;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-80ff41475cdso72007546d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759312170; x=1759916970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+FLjPNBKvORjYbsieT6x8PL9PtVIheOI5DgHloY7Zc=;
        b=WR4i8up/ltesKNmIHR5MtQZWPyabEe9mdaL1VF+zdK9Yd77hjY6YZUHmd3ZLV5ExjS
         D5v/xYTSdI0+opUTWV1d7lNaklstiXHiaRCjcB9QBEGf2wXYETxZ22puYHY5tifLLqYF
         r8yKELMGysivHxMFejECESEMHtOGmhqpANvVwQqeB/MfxAunHfMcE5S06rYOobfg+Yrw
         /folNxQ3aftENet45RwUf5pYN9+LQGw84WFrlK0A/RTNefK2dJCLGNSWZmHzmJXQLWGx
         0uf1+qmku5mdvCf7NUdagLuNhylsCiEmOyZgGCl2u6yJlSw23RtD2RPbpqeOeSgNYkag
         rUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759312170; x=1759916970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+FLjPNBKvORjYbsieT6x8PL9PtVIheOI5DgHloY7Zc=;
        b=dbhH8Pn8t1j5DfaXwGTjBaQnElqr38Kczm/c2WkrqEPH15tbGGvIZhrtPSaCCe2S1D
         /is3EALLbjTWSjvaUemw+a9kMFF3aShOkoQFbtFhFZc1e+eB28NJ8tHJyEyxA4vcIk1Y
         2Ocu1ipCZGvfC2zNDCmU+lNT8Yy1PTNSio1b8zKPK+WfZ2Dg+62cm3xnOl50XYuCnlTS
         VdHwnn3dL40nAIRYZBn23KvdoNUJEstCMc1DZINq+l6scUTpO4+9ULMKXjsAbndLeFS3
         /5h2tkOG/sbzNwtfYRmCLQkDikcQdk1amcun1Zgl0FFiWqZJ52dHJQwnaNNftQomnZsL
         xaaw==
X-Gm-Message-State: AOJu0Yz/A+rKKxvQPiyA8CH1KnOMklV9eAJyFLvT0fM+6O9S3CaDbVpu
	+d3RlSufYI7sGsHGjQLImiZlWAfV2IaE3lLDn84pgLm58jvyQMpN8phfqR09auAY9IBhor05sFF
	F9Pwt9ccIxMEOLeeLK6YlrBM9R8RBW2o=
X-Gm-Gg: ASbGnctbOV8dd/jJLaTuTxidGtqpLADapR+C0AzaaCvLYUBL9CCTAz74jFBB81fuQhn
	H8dkTCjrx/QDvvsoRip6RhsgesXIhtbVfZWZOre29naIuq+NCxA8/d7J65xfOjf1ijHttvcc9p1
	KfPV2FFMsf4X0fTT2l7MCMwq47ynUxaq5nf61Y2XN1+VxSHV5lyFv68Zxtu1sqakwBC+kRWuncB
	S2JuI3+4XDJnI9vYcZvjOgb2VchExoCEJ48lz6zVMWkGoDMTd3A9hPndes12LxOVJAgeGEwYNen
	du+x5VuAaUeRagRwSfEkmyBeH9AL6fiySJQaAkPae4o7u/YI2JKtXvhWbw0IjD4y
X-Google-Smtp-Source: AGHT+IF5bNPvRRDRUu9xDoYL6ReLA24ydNC6HbCmVHO0v2is0yd5/2qhApb/xLIjv8DHKKOaASZzDRPxrhO0h0sfqyE=
X-Received: by 2002:a05:6214:c4d:b0:822:edb1:fc5f with SMTP id
 6a1803df08f44-873a96a6813mr30198766d6.46.1759312170219; Wed, 01 Oct 2025
 02:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001093453.185784-1-liu.ming50@gmail.com>
In-Reply-To: <20251001093453.185784-1-liu.ming50@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Oct 2025 11:49:19 +0200
X-Gm-Features: AS18NWCKymHaZPc-k8u0HvG__hg9eXiwZgytVxy0H7Xsnu5EGq7FJyE8PPdYvr0
Message-ID: <CANNYZj8ka0t576ifJKNvrahors+QsPz+0xj2JZNZ8x91sJX=hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split.bbclass: support muti-lines
 in module conf
To: liu.ming50@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Mathias Thore <mathias.thore@atlascopco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 09:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224203

On Wed, 1 Oct 2025 at 11:35, Ming Liu via lists.openembedded.org
<liu.ming50=gmail.com@lists.openembedded.org> wrote:
>
> The expanded bitbake variables are raw strings so it does not support
> writting multiple lines to a kernel module conf, add the support by
> decoding it with 'unicode-escape'.
> -                f.write("%s\n" % modconf)
> +                f.write("%s\n" % modconf.encode().decode('unicode-escape'))

Can you provide an example of such a variable which causes the issue?

Alex

