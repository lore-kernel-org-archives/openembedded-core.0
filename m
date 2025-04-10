Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2B5C369A9
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:28 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.29036.1744270705221464556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8bK0LZH;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso5155136d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744270704; x=1744875504; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p8PAFrOSWQpfGr4UbVfqZc1exSGpSeBV+wcVjyWf7DY=;
        b=G8bK0LZHMqkf0XnhScAcU00+Tdjc+QTK+AofmnIjkK/VxARLMUI+RWamocSMVto02F
         f5dJrPGyq6D5foYQPT+tWvo/N0x6IRXEw7/421bCd20aP7xLdwpWzNRZYghwOJQrrAC2
         IVf3KhWmozYNuKTWvPEBT8e5dizW9Z2IMiExgF70vitN0o91C/loOXVJQyOvXV4u7lcn
         5t8+ehHz7fkCkkdW/pgrCc/K0GyL80fAAhaJ26mDJcZeIwH4G92+RfLdA/MjF4Q03DJy
         Fx3aYZk3aMSBcMKdEaF5U+uyTQxVKQorhE2hXUi2bBnrkaHZokCSlEhAMahbx19eoGif
         MDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270704; x=1744875504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8PAFrOSWQpfGr4UbVfqZc1exSGpSeBV+wcVjyWf7DY=;
        b=OhbrgbOmLvdPPJfpoyAq/Qe+bT7lVfwBLnGTrP5LW+0ORpt54/6/l9IQYc2mX1scKx
         aXYC07mHTFbPFAuPGoVuXvI4ggVsheYuMYxGEjDNySK0gHpmBcQCbrq1sFREGrP8xxHw
         74Gpa7DJ9c1o0D1LWpwXrTun4VltPEi5nW845Xf6RQJks6KuOj0OmXYopxcC1PZkvAjr
         xDgUOn2q0xYV1dGThcTz3dU0TMPHtbvGs4iC31Q9vEPs3lEMnmSNCxbOvgTrLlwQ+dJz
         +dQvCZw5M3Xa51wvuYIYM2npc3LQu15+Z+8L3uE3iqZ7UGBPxWnkcLhCfI2c15egzQXG
         LDEg==
X-Gm-Message-State: AOJu0Yzcb4A0c0hjbLvwNw2ankuFlqfYQddDkvx7ClHKkcpt8rXHZtu8
	rSpQf9FYVsJ4XpSyNX2KYqDHkNgcDuWC/ikj5rWSqHSsa8ETav2ciz3y2X+3BjPiJI+WDi5F/+2
	hGDuIsMWHOSKHHPLi5Cq9zXuBicQ=
X-Gm-Gg: ASbGncsC5hOiMGuA4vzMHAqp3j3H+Z+guNpCvAwlvOM24RJk6zjKpiBt8Hiamripugf
	GjlbJVOlOdfVuEXJhecunt04UT8b+BkuGJOddPwQVh7oXTqFVoTpWmwQvsSsU0Rtx22qPNcnVzs
	ov0z7TZksbVjoe0TB0kuCP4a4j43Pr3IdCf5Vmqu97ZwKpuxds6k3l8RY5vOxWwmn9QFs=
X-Google-Smtp-Source: AGHT+IEIjPJzvsc3kaDN+HzDJiAKOQ0tgCCJJTn5uHIjEgSVrtqOIHdZPQiEa3on/xSvTGSg0cDUxEqG+rQk0u5qnwQ=
X-Received: by 2002:a05:6214:252e:b0:6e4:2c6e:7cdc with SMTP id
 6a1803df08f44-6f0e5c0c11amr30066116d6.25.1744270704159; Thu, 10 Apr 2025
 00:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com> <20250410-mesa-25-v7-8-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-8-59d715c66e19@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 09:38:12 +0200
X-Gm-Features: ATxdqUE-BAPpTVYrCHMO_EMJV3mF0lYdFFC8mokUnAhnR_JkBaV1UAtFuclx7OM
Message-ID: <CANNYZj9Y8cWXMi6uqOFyYKeZXuVye2+_XFmESBRD0a2nJG7HJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 08/12] llvm: add SPIRV-LLVM-Translator support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214626

On Thu, 10 Apr 2025 at 04:55, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Upstream-Status: Pending [will be submitted upstream after internal clearance]

Note that we trust that you follow through with this, and it won't
take long. Adding Pending patches isn't particularly liked, as we have
a history of people misusing that status to basically leave actual
upstream submission to someone else, for example me:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=33379

It's also a bit surprising Qualcomm doesn't already have full
clearance for contributing to such key items for its business as mesa
and llvm.

Alex

