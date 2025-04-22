Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C878C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 23:32:36 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.834.1745364750446408744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 16:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwRA2DtD;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f2b05f87fdso53494976d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 16:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745364749; x=1745969549; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ADhJPc0eePabYq/TLNLxlJJf0Mr2iSJX8y7yxHAlIM=;
        b=EwRA2DtD9nLA2QXWSQ28+MpmsV8yWVqmaJGK1MHnjlRn+OxkFgRSThwHTMzRZ715lX
         f47beETaw3I7A7JUqEncBBLgnrihJDfN1NSAyMqnlTe3UgoQvHi5utqLu14SmqjDl0Kz
         1pKLMH1Gx6MtzEvvngIGyOX6CoSDim57Tk0R6P1kNwpIHKlYlOu6CboRwC/Ht6vnMsH8
         1OkshklyE45LI9cGrbzvAYj1SUn7gVHYrcF4Fw4idUvm/N5TexjgGCZEKqqLNbEJwVP1
         Z9q3joUUCeVNP2ASCa3LiW0IyKPDkvXgXHDamYmse9eCvuRL+KER7/rZQwzfwVIg1qTO
         ArjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745364749; x=1745969549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ADhJPc0eePabYq/TLNLxlJJf0Mr2iSJX8y7yxHAlIM=;
        b=EjuDyZwEoc2/G0hgMk74zIYhssc4K5PXqgZ/vau92Obyi5cN7mpCjX4F41OzVHo08w
         3FkIj+0ZOc51Wlgg65u/bua9T+UKPmBCnkWwnbeK/HjWh7Ah/cXzdvD37U1g0MWy7AD5
         NCul/liLmVTqDppHjk8PE2omcPZKSJ96ZxOB5Owomb1dcpq0vFv9OLt7vXkSVvCBG/nS
         FgEGkKKEZCE9n+50iD4hYZii0/omt6jB0DuuAnTOgoA9DaIP8JQsykX5DJO86p828aHM
         H/XP0zTnLcuBL7AQ1yLlkVUNbS4kHexmeKsEIIKhuLk9r7OuNaIr0CVL8HkflfA65veT
         7dFQ==
X-Gm-Message-State: AOJu0YyhOFZSkHf1BBk884S7SlqUHlZW09bf40RArxDaWLJIlQ4DeeGW
	p9/GUK/XJxiJJK+5Q1Vf1BNDNW7hxegNcAWWA8hOVcF8mXbv5ZwaECVdISRA6yb0aYJ0u83SfCA
	jVlB3GS7MyCkXQqeshnZKINNy5kk=
X-Gm-Gg: ASbGnct4gLSW+9S1mDnEqNyv8sqANiIzj1ICmaaxDhqkVcHkMgXDaFbSz75YnBcarjf
	RM74Hl0GwdTj/Ryo/lqoX9trzSEArT2Fh46b+0nc2A6h7NajW/sMnjyFzd/Vsa9YQAs2YSGjNZs
	SZQmp9dLkgu7C4c8vXNW2Xy8xGsaZip2sgZ5AvOsiDZZb1mZBUlC3+OZRj
X-Google-Smtp-Source: AGHT+IH1AyRh4WGfFx/usdjLCSc3IGb3Wet4mmVk67XEm8CB66Sm4lXcZRgMO6x/5/vvtD+FmJe9GP+pV/M4LIZbjiU=
X-Received: by 2002:a05:6214:19c8:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6f2c450e7d5mr333099106d6.7.1745364749527; Tue, 22 Apr 2025
 16:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
 <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com> <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
In-Reply-To: <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Apr 2025 01:32:18 +0200
X-Gm-Features: ATxdqUG9kIVFMpIVPL84jJy8wXg6ZpvkLrvaVAAK3TpTpn3HIa_742IL8znczig
Message-ID: <CANNYZj-pPc7iFL8y31aiffm8TjLPXy5iZ54fQSy8wuKD+WzHwA@mail.gmail.com>
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 23:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215251

On Wed, 23 Apr 2025 at 00:44, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> So having an option to turn DEBUG_BUILD propagation to non-target
> packages can in fact help the majority of use-cases where OE is used.

As Peter said, there's
DEBUG_BUILD:class-target = "1"

We should perhaps better document this, but I don't think there should
be special-case hidden magic otherwise.

Alex

