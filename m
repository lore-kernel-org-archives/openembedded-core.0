Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775B5EE49BE
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 14:37:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.23325.1726065461835520516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fgHPqV4I;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53661a131b4so5457829e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726065460; x=1726670260; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAxWrIfs7Hpf0fDZWI76iFQcMff/MepXBAwXb5nLLMs=;
        b=fgHPqV4IIqODixgpf80laJDQBw5TQZR0970JWbqGi6Fi1Anb9THH0uAfyBgfgxX8qT
         QT5xsNw3Sum3REXB8xORTpdq6dc2vQhuByAeA/PJ2Hb7pxCAompliEh5u3KWSTEV3pJ/
         CGVwdp4WoZzPQQ5yZ4OuSyTlcNo985lEttREq7KNNpMev7sdPvOfh+3fLRcB4714Rky+
         LtjgsyWfgf+RlnS9BMH+AwPgY74bRLsFBtttfBWjYj+ecD9w7Ky7j95/GV7XSr4e3j7x
         UF4OicQ7sOnEfgrn8kWzDLfbwAs7zw5yVxHfYu5Pyys1OKNywqDXKvcVj1vYG9XLDMkd
         hwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065460; x=1726670260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAxWrIfs7Hpf0fDZWI76iFQcMff/MepXBAwXb5nLLMs=;
        b=sDkKL03P60I0ZDBiOqdo5LF0g0sA6EVS9C6xD4YPeZGHLunjq7N2E/9lAYpeZtV4ZH
         3rdsJ7Z4aukIoCywkt8LBXS8YM5vAmnOj78BC/1YQNZJg6iULGuXtnsKucNtlUryR1fL
         9JhSPH9EZ0yvJrb2ajpNSJmo06Zsr6Z2sPmgdb5bJ0k3+aiujYAH0dgbeIyB980CZFx5
         HyZg8szR/6+KPgNfIh9aHwmBWcqw5+fJcF5TY0QBF342aex+OQVHt6VhFNNNHCgkvK5m
         bD3Lwxud59mIcpeIGYendDIJNCFNRg41OQhQtXvdIykhBWYIZT85hqr3A8dxeVNij3Cv
         oLEw==
X-Gm-Message-State: AOJu0Yw6t8FNOmNZfItjpEHpYOSVgyGx+zoYWoyan4hcVexLC1VNfPLq
	etp7EFfdL/NfbpYvACCGvICZQQQ5WdJeZXx6yqFz8oNhe7m7mvWLewDpdzZqH0WYmHPijapmvx2
	jUgFRDbf82jkcjbH/TyFxy/iGuBRmmQ==
X-Google-Smtp-Source: AGHT+IF081srMzTD3OXTJVh3WBP26/oR6gQ2EjtZEP8qf9BbvKkSDoPKXFNxDSPAnlBh6t4x8KRiiy5tcOK87Haoopk=
X-Received: by 2002:a05:6512:2514:b0:536:5827:8778 with SMTP id
 2adb3069b0e04-536588130d9mr12832370e87.53.1726065459580; Wed, 11 Sep 2024
 07:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726059965.git.liezhi.yang@windriver.com>
 <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726059965.git.liezhi.yang@windriver.com>
 <CANNYZj9JE_syrcCA1t=O-AYT=UhZXb=TY+v5Q1cON7oPKQEPRg@mail.gmail.com> <cbb94a55-956f-43cb-8498-be809dd87058@windriver.com>
In-Reply-To: <cbb94a55-956f-43cb-8498-be809dd87058@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 16:37:28 +0200
Message-ID: <CANNYZj8tE2OW9H-UfUUShZ1izHcKCRXmQ8dWyw6rJaOODdDQ0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] classes: Print bitbake branch and revision
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 14:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204393

On Wed, 11 Sept 2024 at 16:31, Robert Yang <liezhi.yang@windriver.com> wrote:
> Yes, I can find the code with "git reflog", V3 is coming:

Thanks, v3 lgtm.

Alex

