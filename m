Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10278C3ABBE
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 16:51:59 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.55306.1746463912358671941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 09:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNmeM4fw;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so63114246d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746463911; x=1747068711; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6Zdkye7VthQeSwh2ASJaFwEM5VYwCQQ7EtzlxXBIio=;
        b=FNmeM4fwLNciysrXeVIyddokchA3B3tb9tS71sPMLx5S8/9rA5QAHqdI2tlfLuNbI7
         guaycU1rHrNkpnMEL56+CLuZ0ryLzrA3L11kLqxhX8oaNeXQ356CcBKr77Bh2GrHnZxI
         1gEhTVOypkYeKHbOgZdWMfRD0VFdE3LUbQRHebCa0ZbAU75jKGI1mGHmXwMbO/x4vhlf
         owUg7cqq2gSvJPvo+YEexkg9OkMvS+oaFCT8bwZkEdjtrkoVuyZ14E7u8rHnCtTW7+ga
         AvebJl6y8bnZexS2OWynqGU6HzYBSm5bulNX3+N07/MYsjgpce6ELLNTvzu68LJ21kqA
         Kpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746463911; x=1747068711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6Zdkye7VthQeSwh2ASJaFwEM5VYwCQQ7EtzlxXBIio=;
        b=WBgzETiUjY4o2LqSR/KC0aWRtWQLErHLsjOds6Us+CyGIdE+qCHXDTyXT5fxbQi6a0
         BPCE1atnOOCeaqnZqTpVnxFZwUfrT8DAy+vIKRCOvyqX/IrbOFSFDPO9sDk5KwoGN029
         Dti1cUhVVkZv+u6GjF8YminOrv2M6lMZWkSJDDEPaHJSht4PvyweFU8Ct+6AH2AKm5c7
         iInzX5IrSovR7P+a1vuK5ILxsj9EyJqtAgT9VV9H6eRWmvwfSqTq/iEeMRlh1wKxArZI
         SpSS6HrV1Z+5IVqoRexcUWPMDu9mJtquJavD6vuSGToVEB7VTteA6hXTYwxd2aaGyYBa
         J9yg==
X-Gm-Message-State: AOJu0YzHasuGnxozQDAPRoETNiIy4mt/I9TA3LvNxmFlugtMWV8S0JF3
	13BByuG5Wr59L+xp6bKt3Kfow8QxVNcW/QJ5GS8pqI/bVRpKV0HbQAN3WyM9ACPRrrezJ0W5pgA
	Y/6NjrMxTytmAIvHMgDp4MQQacbj4vA==
X-Gm-Gg: ASbGncsBdpc8P5R4mv5WA766GhuP9ngb6IVnCtJhnS0sed685wiDhPN/+l3fJpeDSYm
	ftgR2hNHLS52kKPm/O8gwMzD2CoybbZ+agmf4U2rInUNxFlEJ7cuug19TmkZuk9CTqE4b2QP/4X
	/SKt7oZ4ET2SfN1bJWf9E2B2rdEXGy+Q==
X-Google-Smtp-Source: AGHT+IGlt+R0pauRqrFOPbHpWtHXoEYDRKHm6whFYBd2FIf8N7ZQ5tGqATIHWJeWP1ZsjcqwMYfP0lbdA8pJaL4goMo=
X-Received: by 2002:a05:6214:2a89:b0:6e8:ec18:a1be with SMTP id
 6a1803df08f44-6f535342662mr3211096d6.7.1746463911421; Mon, 05 May 2025
 09:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250505101642.9255-2-ines.kchelfi@smile.fr>
In-Reply-To: <20250505101642.9255-2-ines.kchelfi@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 May 2025 18:51:40 +0200
X-Gm-Features: ATxdqUFZHnQVlH6acdaH4VrV09loXIj1Loo1L7EQuv9SIA-ChYB3fVLGH53gw80
Message-ID: <CANNYZj9u7=F533yq-KEiYY3jVmm3DWh3VjLaoMhYV6=EZW20Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia: add ptest
To: ines.kchelfi@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 16:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216016

On Mon, 5 May 2025 at 12:17, ines.kchelfi via lists.openembedded.org
<ines.kchelfi=smile.fr@lists.openembedded.org> wrote:
> Also patch the libray name to match what is installed.
> +Subject: [PATCH] Force the use of librpm_sequoia.so.1 instead of librpm_sequoia.so
> +-        lib.push("librpm_sequoia.so");
> ++        lib.push("librpm_sequoia.so.1");

Rather than do this, how about making -ptest package RDEPEND on -dev
package (which contains the unversioned symlink to the library)?

Alex

