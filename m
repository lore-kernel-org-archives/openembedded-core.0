Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ABDC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 11:03:26 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.8528.1743159802324741799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 04:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QG6EYW6q;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so32998376d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743159801; x=1743764601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5n9Ii3GY06GjNzOYZ9IzXKltzkLMYlZyy8BBkpYNC1Y=;
        b=QG6EYW6qcFvkbztBT3FzbeoyddOvIOlpPl4j307wWkQ2EHJQkb+GWWSUGqtxxEzqV3
         leYesM5WzVmRnNnnELG61/pbftDR+ATQJeGHozYHAX6I2Qa6P0rtTll/+BVpTc3vEqPI
         IXe/ZXLjznpopAkPv0RjIqlniQkUNJ5cag+J74C4wqy5L8MajfQgv+XvGrOBza2XQT8D
         jLmVAVwS0ajPSrMBe/Sb/QepdPFm+pdnTS5Tk+GvdlaofW6Wt5Hlc/cpuuBrY8M6h3+7
         Y7k1A5MsRtR6ztf4V1WefrZCGYBxiHx0nynpS+8VbqeESb8a970XhYut13feCQd9L+GC
         pfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159801; x=1743764601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n9Ii3GY06GjNzOYZ9IzXKltzkLMYlZyy8BBkpYNC1Y=;
        b=qVW9EWSvICIrvGVqnOCYAHTJ8UDH4oixlkxNM3AZEbek7KpGNzgAOE29v9QY1RYRAw
         zhqWs+UYt5CAk9JnO5JXaoeiFohSn/1bRH1Oo0OAMUv61GWTQ2xAUOUfmDBEVzXIM/DG
         RKplj7rQDWpgkAYVu/nCmq5Wye54snxH3wENvXaREnIVv7K7WWWevex+gEOKq/L42w3s
         T/fOhu2Mx5XtPM9l4E6FLhCyxGFwBtDcjGWmR+g6u37de7bq0tewbcCndT8KupaYFVRs
         Sjo6kp23ZsQwYM0GYU4xVaLtvzqSrW1/bn2zROkNolSJZr1HyRQsjGIvCzSa1DXcfUVE
         ebkg==
X-Forwarded-Encrypted: i=1; AJvYcCUeyRz8jUM/3XusxUXBQvvmJe+hrA9so+n10VRw9JOxwxYmR7853wUQTg3zK6AZcKWEx7nZADA/gchvNDX87Y+UUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJsYQmTB7pBhpChHtbiPsoJ5/lMa1gyvkrP36SRanWPQ8VbGQD
	/hJyEEGfOBb1aSknYetsoZoki9v/2zlMs4sKXHNR8Sb2Cqzj8/9lWbJiYaSbv/ZCTY1tU6aJd12
	KdFN+U8R6QT0C4Fr0VUfKkQ7v4Bc=
X-Gm-Gg: ASbGncua9d5XkM/VLpyrY+Fqrh8Gy+zDG9MuNbJHGdG0ZTwlggO84gLZ4+RncsY2+OQ
	2Gp+fHcWODTpxVHed1Yx02JQyIUzYCGDVGlY/0gr1x1nAywujFvNfezpAT6Ai828NFV32T9mmHA
	VFK/5ILacyLwWMeYrSpemGvqNvKfb5uZSyb8zLzuS0dwPhWgQc8pehlVPGZVPo
X-Google-Smtp-Source: AGHT+IGqvl1Ql3Wyn8Tfepm1dihmj1eCuva+f/dGLefl8hfzaCkEU9ywBWnWkmvieiFXxJwP8rZ669WCPPSGELd2DoE=
X-Received: by 2002:a05:620a:3944:b0:7c0:a264:4de1 with SMTP id
 af79cd13be357-7c5f9c20d6cmr365737185a.24.1743159800464; Fri, 28 Mar 2025
 04:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqc5pj33tDH0XMSSSM33H+8FxsWZ+rGvpNxM7N4PN=QyA@mail.gmail.com> <z6pzamb2kcloqwx5zlr6x47umloya4zevxxunmuoosokdfcczd@d4zligpbwr5b>
In-Reply-To: <z6pzamb2kcloqwx5zlr6x47umloya4zevxxunmuoosokdfcczd@d4zligpbwr5b>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 12:03:09 +0100
X-Gm-Features: AQ5f1JrjSJiyV8FtNarKUGvhwUNfP340B2h2-cpAeaYBAKiOL0SB4WQa8nGX04A
Message-ID: <CANNYZj8gt0c9EF62wQ5CGByh5_GwGypKqrDmw6pWLutb=X=6Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/7] mesa: upgrade to 25.0.2
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213830

On Fri, 28 Mar 2025 at 12:01, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> As I wrote earlier, I think we should not be left with the outdated
> Mesa. Otherwise, we lack modern hardware support. I really fear that
> it will take several more months to land proper Clang support (sorry).

Just to be clear, I fully support you here. Outdated mesa is starting
to hurt the project. I only want the patches to be as high quality,
well-documented, and maintainable as they can be.

Alex

