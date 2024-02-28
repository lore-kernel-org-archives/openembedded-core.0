Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B83C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 09:45:33 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.9810.1709113524396420549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 01:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYaMxdtM;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512f3e75391so4434600e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709113522; x=1709718322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=54MkdH9DZ7cDnNqDRY9mVIt7aLCPCuNiibIJoI7R75o=;
        b=iYaMxdtMC4nE1Ymq+9cFhIKvzxpdiXRJLEHCjyxuonZNZDsEKpRxHahaZOY7XZrn7m
         Q9TmEQY0vg4pAsDmpuVoeNG7Kv7x8/kLw/707Zgs/+m+8WiUaNzOQVf4G+9zz6+9EEHR
         5enloOytlywbH7uFhIdbmkZDuW9sNZJXciyT5/TjlKHOHwR2TRidxRz1kVeJTgQmP+bG
         3WYiVWkFcSV1YqJ53h1Zc5QM6fCtMFKT/bYjUZAPFuf7sv7Z4ZnVu8iKYI7sHWJOfDTX
         B8LDTORoAYz8shmZaPVWUn5iZmEeCE+8vygSxGzrA3BgS/au2rdzFX5Jk8MpKk0dIYYm
         rmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709113522; x=1709718322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54MkdH9DZ7cDnNqDRY9mVIt7aLCPCuNiibIJoI7R75o=;
        b=dKpt6P9Rw0j+OFqvrg7lqbuNWsnwD/IJXcrqjhEMxtznBQ2DfXzt5A3pMqW6M72MGT
         1v1GRvxQcFJRsundT6RRRR6HJjPjO2HR1e1TSr5+XkxB/J5MFm7LFZeB5YSbpxXnIU2y
         P0b1RypMeBBQkOr+zHuiP644fVppn6xperigredcHBLZ9/cW0VAiy6qRMisx91590eAZ
         nFksES8pVi9RHIIdOWh0il2RirRTKJdEbvm1ALX/F3zHcKYfr5gQ31zdN9q19zL8v7WX
         qSuptzwFZOB9yATm7aoKdzbHTpWRigHuZimnQIps9Gm+69Fw3ZGdRK6ntuMKas/B7s7i
         8mfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiEDRvY0iwiAhy9HawEapJKlaI/EimGumrsb5tAiX1o/hdD39QAUxu3Edb7W779+ZAjwdZ3gmdnDqUhbLM+FpP7e5qsltsOzGOOE0EBA3UZlGDIQ3SxBRc
X-Gm-Message-State: AOJu0YxGjgh4hCCHOYxwHa3aAm1D+aAA8Vmo2dwxo/E64/uGT/vwdOyN
	3ioNtysAp3C14CtVk7zb1lPUwinqse2AKUNkPDDyy3e41QubfHcbrfb5AZPBe1UiBrXUaLc3i8n
	K2N2UT3wHUmnMaKjHhHVm7z4rJD8=
X-Google-Smtp-Source: AGHT+IFoqVCmXPM04SVRI8OTbVj25v0ReeFwMmViq5EvjxK4z65aJzFSWfxMbov2yuDCSm37rzxuAfAV8O4yHs0rU+k=
X-Received: by 2002:ac2:5388:0:b0:512:e8eb:f978 with SMTP id
 g8-20020ac25388000000b00512e8ebf978mr7734899lfh.4.1709113522416; Wed, 28 Feb
 2024 01:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com> <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
In-Reply-To: <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 10:45:11 +0100
Message-ID: <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 09:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196380

On Wed, 28 Feb 2024 at 04:19, Changqing Li <changqing.li@windriver.com> wrote:
> 1.
>
> Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this is in package systemd),
>
> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
>
> This line will create an link to "${datadir}/doc/systemd/README.logs" during boot,
>
> and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So there will be dead link when systemd-doc is not installed.
>
> So that's why I create another legacy-doc.conf packaged into systemd-doc

Then legacy.conf and README.logs should be placed into the same
package. I would suggest that README.logs just goes into main systemd
package. (the other option is placing legacy.conf into systemd-doc,
but that file is not doc-specific, and should stay in systemd package,
especially if more entries are added to it).

> 2.
>
> The symlink in legacy.conf use relative path.  but for oe, when VOLATILE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so
>
> /var/log/README need link to ../../../usr/share/doc/systemd/README.logs,
>
> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
>
> need link to ../../usr/share/doc/systemd/README.logs.
>
> After change it to absolute path, checking of VOLATILE_LOG_DIR is not needed.

That's ok, but can you make fixing the path to an absolute one a
separate, second commit then?

Thanks,
Alex

