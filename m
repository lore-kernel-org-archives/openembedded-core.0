Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63DECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:38:29 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.35773.1756982308873715709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtDbHTt7;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7251e6b2f9eso4273876d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756982308; x=1757587108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JAGjhFDOJtcinPxvj4tx3+l4SVfHwTtIGQBeNrHOODA=;
        b=BtDbHTt7VkajGddNPejJ+evv/2tlO2Y0N3BQwNEQVU3jNjFznHhOgWClwPIzG1c0PH
         jd/8aTG4ifC3NH2mh1miO6uBiPwG3N8YbZ5yfxxAamb7MyZ1SSJgovS6d0aCRT8mkIG+
         +GkmSHS5aIJvaJl1yDRlE3gnjVbBeguByVD8dOtlmcWUQehxzkh0UjIgcbleDJn99UiC
         cTOC7EM7ncPfZf6bwxqsl5mxfMMEOZ7dZo6DbgkNeZdm/NPbk23DcG6ihkf4OGwACodW
         aRi7RNKG153gqFc3lryKugRKdGX3R0Apk4NOd1cx98fxm8hZic3dzsqMC9D9J5mdDgG5
         mVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982308; x=1757587108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAGjhFDOJtcinPxvj4tx3+l4SVfHwTtIGQBeNrHOODA=;
        b=Z/uqTszlypdcVC/sdZ9icdTggvO4ftbbyiH9kC8ao+e2L4aCYvcFc2J6hAAxp6PkKm
         aXYik58sYJ+xE5SFMPb537d2byK6spTTMXWCTldF9UezCEGKg5wg44oAjEpbzaHrcIEq
         RDuDZT2kzvYj5gC8WrbxBb9gHMzZC2R0LZXu0ZOE1veG2avSAEVrEEyfKKOai+0CfqfR
         kv/SB+L4QVPyucHnhxR0t6fS8YIpoPr5r/KJ7VeXSnpB6ylMY+nGMbdRFTvBp8IiRvWG
         QwSic8Hpveaja3MBE8xQmZoGA/AYm1JK9yJri9TKrZDHeobU8yA9NOmkAEGkIWhSB7bJ
         JQXA==
X-Gm-Message-State: AOJu0Yy2dJ7h9243gJSLOWOVtKDcg7J8/ZIHMZkdTCqYlnWwKy/xH5GV
	OrlXKkGO9/be3DeCJk9rT8o/hBVdFqQM2oBq9cpp8mJtbpFamJrdwqaVYvhHGi9LdNetJfzO9TZ
	D+9ZSjEiuBtrgZvHiKzFlOvzGJDlRx+SNoeLp
X-Gm-Gg: ASbGncu705DC/rabUyD/l0YYXmA6EFRadn/ro7jdR8aUY5TeDetFAbZXshCx1qp58H0
	QM4RgZa+ZS8dHG3vnhZWuGylLjQjYb+Wp7JcJWMZBndtrmloYAE9PS8jmf3zvL58RvwJyhMaMEL
	YTizJGoH3Z6x0Kb1wOhlh04hCkpeQljOawxv3RYU775jJJqRiKuN/csFNTSqBprrcEWVUMZutPL
	wh3fGBLvPx0j2k1o6f08lOPYgaA9URkXrpZwgyNvgmL3/72Hv2hIKSNS74i7JpmzLpj5yFUdNMX
	b8JUIf9i4YUJCwvAlY1kKdTBv4R9FFeBIM77SWYs
X-Google-Smtp-Source: AGHT+IEtMpy0EIcpglOVFMgmCRQO3Y9swPzWF6flsY98AV6Fd29g57ZxXZE+TV4cWCtFkETvBntf5Bmz+OJCiyqpNNM=
X-Received: by 2002:a05:6214:765:b0:709:e251:c29e with SMTP id
 6a1803df08f44-70fac6f8965mr233414096d6.10.1756982307723; Thu, 04 Sep 2025
 03:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com> <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
In-Reply-To: <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Sep 2025 12:38:16 +0200
X-Gm-Features: Ac12FXxBQgCTvYjLr7llWH8JbmbV-Gi9j1gaC5F6gpb4da-00Qj6_u8weMh4LrY
Message-ID: <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222914

On Thu, 4 Sept 2025 at 04:59, Haixiao Yan <haixiao.yan.cn@windriver.com> wrote:
> > <Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
> >> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
> >> and environment.d-git.sh have the same issue and should be fixed
> >> similarly.
> > Which means we either have to fix everything (and somehow ensure it
> > won't regress), or just have a requirement that 'set -u' is not used.
> > I don't think it's right to fix such issues halfway.
> This patch addresses all the affected files introduced by the commit
> https://git.openembedded.org/openembedded-core/commit/meta?id=8a7ec52e9b35654bee48cd948c6c34c63db3e265.
>
>
> Could you please clarify what you mean by "fix everything"?

There are a lot of scripts in oe-core itself, and in the content
produced by recipes, and I can imagine most of them are going to have
the same issue with set -u, because generally shell code is not
written with the guards for it.

I would like to understand what makes these particular scripts
special. Why are they causing problems for you but not anything else
written in shell? It's difficult to believe that nothing else hits the
same problem.

Please describe how, and why you use set -u.

Alex

