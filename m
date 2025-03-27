Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14779C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 11:22:49 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.47344.1743074567391559176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 04:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPdUVFBk;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-477296dce8dso9103301cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743074566; x=1743679366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=smBlOKshmqn8eswKoljxVT1fm0kz5TnLvunE6xOKdUU=;
        b=VPdUVFBkVQmRELxmpAcqiFcLhy5ONuCqtwznLq2nZpNyuVosiijeGhdjWq6aJtCuEV
         pzAKr/ifc9iYdK2cOyU9xHhPjvnkBhbH/FPBe0xHEgDAasbXKhGue2pP6cZuXwPLuU+b
         r/lS78799CVckT9cagjgXaccNygkqrXXUH5Fd/rrP2Y0ND32Q6t8KNRc80ZdJSywcKFd
         WBEL/cpqn5sgQkFu+wq9rkA26m733XD2vuyc74OI6ex33IxT9aI8qoztUd0yMlcE74tn
         9xEFwLXiQZ9F+97Rz7Tr1YFkohm0TAQCecmxBvDirb5+WEFODFWNbLouYJCIAeFQfFS3
         yhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074566; x=1743679366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smBlOKshmqn8eswKoljxVT1fm0kz5TnLvunE6xOKdUU=;
        b=hFL4EcxOcgJ3rfDVRw7P8ZLUyPX0hcaT01nzMMHST/FbOuCFo4swKmbq3LHYptWf5d
         IAFTSzAD5Km8abdzUwtqaPP3kEiRiTfOJMoxGOVTWorAyDoq+wuXhVQlVrOeE/HW+lfT
         3RKS3ryf1ezsr/OWjllu0vNY2T0Kgd9Ro52klbzYGAVXxmUHlFE42IeEMln5Hj4bP0vs
         UVxEcAq1ny0HJOz7zcFGpVFgXDEmbvz2r6kCs+quLnuBuAuuWJykSTdD0lA6nM1wQeED
         VfC+sHjOC/UmozkmTMsf9yqDn3JXqaPakoVzg3siXLVG/t/voa9rEZZyIfjKGVDcSXXM
         jyCg==
X-Gm-Message-State: AOJu0YxH/7hyukAuAMDHyShfGzEfxZf7Tr4ojDGoBpfSI8hXh1/4nIKh
	yPNwcCTZQ/aBL4rdgjdAk6z6UtGuCEmTJo8OV9Z77jLw+sI/YZfGpma2FKshr8bEcCDgnpccqFL
	fy44p84bZHdxF6G54K4iwt4MXFRnWAg==
X-Gm-Gg: ASbGncvM+0YyAnkfY01jGFEr1itpN8kVQxTGZUYvWBE5WPwIbxXgQhDubLR5X6phh4U
	GbDg2WN0L5PD8rUG3o/PWXvQZlJUM5t+UUhNePcSchyPLUigkJPL22qKe+hAbH6cbJ7xubcshMF
	eBM7MMXcAGuZSKMvrwC/dzpU7xaNwHXJWqvGLIWLBu280WcMDfbtg3FlLc8TrA
X-Google-Smtp-Source: AGHT+IFiAGt2c9fFM4Fb9RZMJPsN6OFxtQihadTPUfzY85GZW5iZ4LyCRSE/d0F0SsFR9EDp+oG0bpV1z7Jx4hDBAIo=
X-Received: by 2002:ad4:5d4b:0:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6ed23891584mr53559446d6.7.1743074566169; Thu, 27 Mar 2025
 04:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1743052694.git.Qi.Chen@windriver.com> <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
In-Reply-To: <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 12:22:35 +0100
X-Gm-Features: AQ5f1JoKwXe0g-MaOwgAQ_Myr_rsKAaDgY05hN8tEcofnB7-VBvuW5PkLoxkIa4
Message-ID: <CANNYZj-hqZOEcwtvnCdSY-FrVBfR8bZxS3OgjUmWLLQ__+307A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] version-check.conf: add mechanism for
 checking version mismatch
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213724

On Thu, 27 Mar 2025 at 07:22, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> The basic idea is to use qemu to run executables at build time, extract
> possible versions, and check if there's a mismatch found.

Should this check be in its own layer for now? If it's in core, there
should be evidence that it's broadly useful and used (and no one's
asked for it before as far as I'm aware), and it should be tested for
correct behaviour and against regressions. I don't feel it meets these
criteria at the moment.

Git fetcher has recently gained the ability to match up source
revisions with tags specified in recipes, and will error out if SRCREV
is set wrongly. We just need to update recipes to specify tags (with
${PV} in them somewhere, so they remain valid on version updates). So
sending in those updates would be most welcome.

Alex

