Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC80CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:15:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13723.1782400524963594017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cVifgXTY;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8de88d06509so10442156d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782400524; cv=none;
        d=google.com; s=arc-20260327;
        b=INuWzLrTFX6YgLp8mYryxs4UQ2k+o43tLWtHht2jLA7vnEpvJuGFo5HetXmbrGJ7im
         gHJuEgz1IpqHu292ksD2Ow64zdpJMAdjdpv5vzTm+1qe+Xt3acv3f2wnRBBZnfPYElmk
         SCkgIdnito6rDmApdc1xF7T5g4SsUl/Jx02pc1ONr5aYiW54G53KPlJ5iHLUhTFNxsP9
         GeqgS1eJs4Rl6Yo2pS1on0p7G1QkIa+LkMWbEuoxvl0v7/sWya9PfQE4nbdJltBvvbw7
         kMieKyUBt0+hhPNmKRyOvCj7GtEypWnQZexpyQkXnPf3boDtfCbH3+yan8Eo146OcK2u
         Ut8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d3goMl8zxh0+BP0ZM6PPqF8FnDmtonoZe0IpdZu9dDQ=;
        fh=GdwBnR3LvlLTEv75Ufd9sTT9aMnQnW0ygJJoMacso18=;
        b=pCdqozmhEt5y7Zu02TFkb5BK5glICpy9+CP495lhIzMrJqmQYg6IgbcOH/TiZSkADw
         F55v1J7pquVcCzWQMRohcprFTc+6DrOQ06sl5UX5Pm+/HTWR6UvgBLTP+PhWtZOSFLGE
         nxgCe/HcDoTYbC/0hGzRYypSusvky1g3TT/SOEhaYF6FJGu8u3oiZYjvOW13n57wOrjI
         YrIINOaTZngRwmq3XwMM2ZWxsvJkRpiX1zX9/OipVYZGxmktbxqMnqfIxsddWeG+PKVk
         +4oOs3w55W9YrCRmM5m8WNgyziu4U+bQF8gsmzW84aH45KDUhrnFU+wKkL4mqiKkEOny
         rtFw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400524; x=1783005324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3goMl8zxh0+BP0ZM6PPqF8FnDmtonoZe0IpdZu9dDQ=;
        b=cVifgXTY3N6PnsuYnHgFYTkzC+nBp2Okt+wdYZgq36CWoUsy+juVru3dOWRmtLPc2A
         18nWkxoI1ICoshbGxxrsHzj9TNfKBL4hd5Qec80XHW9aXtZHARDR7PqoX+E+pkW9e8f5
         /axR8i+1NMrLgB8LJ41zxxNpW5QznJHjoMxFa9NbmwSpeqCdQV/0Za7faIlf7ijcz/pd
         np2ccaQh5G0pTiFDZnQOSEfXOg2o235Ypy/t9eQOONJ4ciNAiirnSnR54OtoveF5M79C
         k8TWCAk3KNjK6a9BDqLn+2QRck4XsW5ephGAzgIxMznrtIr1S43hNx59wUB6lE++aqbT
         rWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400524; x=1783005324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3goMl8zxh0+BP0ZM6PPqF8FnDmtonoZe0IpdZu9dDQ=;
        b=QozANNN+zUuQH/eFMMlWMJhtB7i8SKubOOkDO+ueQ0WoCT9aHGd81g1ybJFyZXpDDU
         rutZ9bTNxwQeZgMnCunrbvhp+Zlb8KvOJ94PTTpV049HODmnl5FHmg5K6lbBQ1oWeRjt
         4W8wZ9AW0tDkEJQ65G0RYTGRXiTbBeNKjfjKlmez4nECWOCd9kvRHTXQx6w4W742ZNWQ
         O9elHAlCvv46GMqMcm4/+dddaQ2FwwpmF6IHp/4Sd0b7LOJnx8Cem+txGWmp0lEahLDw
         YJcW0u6AA+D6R/gwLfpqywmosc9ufzRwnbhbCUeH9i0D02DCgQ0ZB/f1vHHwTbbMm1bV
         HI4w==
X-Gm-Message-State: AOJu0YxnrouprdekuMloZ9Mk6t9dlLn60jXGH3sFBRRTBr+u/Mwl6PjU
	kiUfSOx1Y8+QB+FYDPBBZx2BUTBO5lfjEPqG1v/Uxw+2GNL8P7SAhte5o1f7cV4LCnZtzDUEhd6
	p4o2u9O/voB3KW1/Oni0xUXiiGfCQEVw=
X-Gm-Gg: AfdE7cmkog9ktJ2E3hkiQ4c4C33AFK8yJTjcI32tygPqyYjRYXqzbbDcywr9aVFxTLU
	jtB8nTogXmh+gtVVtcm66nH3tjcTYJOLNzIeatWgUhwltoHoLeHGzake6RegSxI4dfIXS6Sh5jC
	MYfzCCaNZuuJstlpzBt/YqPRamYjpSX2nYScMQG4Fw+yzR2jyl31sis1QWJosUwR3p91G2e9QNC
	K0q4O4yuSZubmMz+P9olfmvg287GUMfjoa/V2pLjQrCpFgZe6OgAXrP5qlzBRcoArPlThINbw==
X-Received: by 2002:a05:6214:5c47:b0:8e2:d38:2983 with SMTP id
 6a1803df08f44-8e3b4448974mr192120866d6.7.1782400523504; Thu, 25 Jun 2026
 08:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
In-Reply-To: <20260624223336.1254487-1-kris.gavvala@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:15:12 +0200
X-Gm-Features: AVVi8CdShey0_V77vlQB0xN8PPErsfBida1csNHg84AwdQwwQlqthb2iaO1V9WY
Message-ID: <CANNYZj_Qe5U8DfhC1-YtSnNS_oHn40XiE6sZ0zuOnSf25NTY8A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
To: Kris.Gavvala@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239575

On Thu, 25 Jun 2026 at 00:35, Gavvala, Kris via lists.openembedded.org
<Kris.Gavvala=windriver.com@lists.openembedded.org> wrote:
> In python3 ptests for whinlatter, tracemalloc_track_race fails with a segfault.
> To avoid ptest failures for now, skip test_tracemalloc_track_race in ptests if using glibc or musl.
> Making the change on master to backport to whinlatter.

Does the issue happen on master? If it does not, then the fix should
not be added there.

Alex

