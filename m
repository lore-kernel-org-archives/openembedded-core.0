Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3110DC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 21:11:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.58299.1674681063837798992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 13:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EIdHcyIT;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id o20so31093511lfk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 13:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FZhHZtMZr+xky+DrL09AMWftrldwFQiQ8f11Qdp6k+E=;
        b=EIdHcyITZoNsJpYY/Iy2HCBLdFdcJn5gJQ7CYTt2xyP0Y0BHuDT1PYK/ONtnSKop71
         tbWg2QEXDdID/egGRTdI2F3pUyOPrElxZvdjF+AumryDHc6YPk4BKTdORUT6GDnyGCsw
         RZ8TAJa+V3Y+he0RgqkWTZ4RXvIft4LZgPnfdCoZTZBSWe2nTeeYWYpEEG+KBa4csN7+
         E3rkG3MyKVf6MiYA8Aqo4n2VnnorHEjVx7q57BRPf2HU1ups3x2fqB0V6H7x5kHNPU/l
         sVWB5iU1HyADYCKcI2qJJdlqUA2txA5JUq0dTYuW54DCM6bV1eqQ7FGHvM5sajrJGiHh
         If/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZhHZtMZr+xky+DrL09AMWftrldwFQiQ8f11Qdp6k+E=;
        b=gZZqQ6Qi/N8Z8Fw0ozp3zT/oXz23BBhbHgHXrQdSSovgk44unqOubaRh/duHQlKyh3
         F10HaeNHO52VRA4xtlVSvpQOu5fo4qKcEZiwmvtuaglllWmnpLrpZqoJfHlugosxMAGF
         GlTfePJ/6FbAXa56TjQSFV6dgENfkcjnThfuZoSs0jI5glwy0n0e0L4mhCWU+QASW4Dz
         m9nkY/xfSxXgXJZLAnpOIwBL3ZC19Ev19X1ewqBwqCAt+6iW0TO4NChMXceVYiyzocu0
         9h9pm6NoqSjfi5ye7IkIVE/AeZIZSOl1v2fhW8IHuvNA/XZtHh5lmDnxWFzVcpCAQ33T
         tW5w==
X-Gm-Message-State: AFqh2kpYYRkxzs3LBUK+X+lv1cU3K4SRHylkruteKtED2rU/DTzeJmZX
	egKE0mUGJvDpe0wvTpOybmUQiiKncSan5IfvvpkfKdGJ
X-Google-Smtp-Source: AMrXdXuWgJoEAZVq6l3VJv0f0J8B0yFMR1Y6fO3+12oGy8b1d/VW+FCofGYIS7HDIJePcg5kOvlGZh1MCzPJRNHVvmE=
X-Received: by 2002:ac2:48b9:0:b0:4d3:b528:99e8 with SMTP id
 u25-20020ac248b9000000b004d3b52899e8mr3797881lfg.2.1674681062023; Wed, 25 Jan
 2023 13:11:02 -0800 (PST)
MIME-Version: 1.0
References: <173C0B9603DBAB46.24231@lists.openembedded.org>
 <Y9DgI+HyBTGNmiFa@nuoska> <CANNYZj-Qq8rOob5y2mkdLczFzwNx3Hr_CHKbn370fe3CVa7EQQ@mail.gmail.com>
 <Y9EhcnpE3gtLKAOR@nuoska>
In-Reply-To: <Y9EhcnpE3gtLKAOR@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Jan 2023 22:10:50 +0100
Message-ID: <CANNYZj8DrpJci-7qAb_QkC1kvayMnfRk04jqxvSTjHFiWH9k6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] oeqa runtime tests when qemu hangs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 21:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176377

On Wed, 25 Jan 2023 at 13:32, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> Major difference is that with the series full boot log is do_testimage
> task debug output. It's not in bitbake output though, that remains
> unchanged. Now if there are any hangs, timeouts or other problems, the
> do_testimage logs with the patch series will contain information where
> exactly the failure happened. And without this patch series, a hang in
> qemu goes undetected and whole test execution hangs, and in multiple
> locations: first in test ssh command output select() read() loop for
> every command executed on target and then in the QMP debug output
> for every ssh command which fails with return value 255.

Unfortunately I tend to agree with RP: if everything works normally,
and even if the tests themselves fail, this amount of output is
excessive, and is just noise. If you are experiencing hangs, then the
verbosity needs to be conditionally enabled, and off by default.

Alex

