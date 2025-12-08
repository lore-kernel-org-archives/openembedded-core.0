Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6426FD3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 10:42:21 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5521.1765190531937551008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 02:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipks0PZt;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88056cab4eeso31479786d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765190531; x=1765795331; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DbaK7ZkHG60/H02kMlgFS2YQsMYG/+q0wtAllvBZ6rw=;
        b=ipks0PZtqY3g6D6y3m3jHxAbuyRrmkMZVoB0QxDRNLEXCD/k6j07qRtLWRlSWfoHD0
         VWh4xPMm7uGOuZUBKe5efAJjkg3QiUl2gmiyxWggL038FFeBKytEJQLWC2W5xHsAGmil
         7BL+fHejxdx/jpoILNDnfp7MYcRoR8jNfrJuO+Q7OpfHyKgwBsJz9RXEnr4ZQZrkUcsX
         jLkRnUQd19O03+o/q+zlvnwxN2So24QwnWZKgtn/HDw/CL+ObSxH8jkJdQwhTznZU1Vl
         MpE6m62pk5YBIr9FMqyd6M6u5pumW2zaarfMFvGHiet7K0URyDVzSFM/I8nNldartkHB
         4A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190531; x=1765795331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbaK7ZkHG60/H02kMlgFS2YQsMYG/+q0wtAllvBZ6rw=;
        b=aOXOSCHIcxeLPf6/GkTCEFIWzHX9KLJnwuPhquFVZHHVvxpDufaWyHcA8JCBuzqtVD
         TpcbfOxbV3W/HhARPRN9iKgXSxrQgqK8oCg20fka3Kff/YYejoO1JXm9UDBforrsenR2
         8FMJcSTSOpGFF/SgU2XQA5b8pmo23VzRU4lm7uybZDA3bwylXDRPbGBpC1zUWbRdQJ3c
         eVFEeWCiogSz3xfwWfCOYObJeYwpd8hBy+eRx/nowLrKzQQDgRKWQbiXEIZrAXW7dA7Q
         a9ObyGvG7/TRWOHVCLEscXF4bj6gmO2jTIdPjq/WtGgCxJhh6LuUsAIEFNLPl+Ad3P8+
         rypg==
X-Gm-Message-State: AOJu0Yz1YIsb9ht/sbO7UIOQnHvYxV+E0Dw6VD8DLBvSYhPpp2iQkzep
	mGwbnPGc+0YsOsBu8I3p0l5t6Mu6iGmQpRozszbRRtYJRJfKChzy17f8CYi49FIuhGqYjHDHR5P
	3zxuLaYBed8ZWM6LwRdFWDDtE4bq4oKA35A==
X-Gm-Gg: ASbGnctqqSL6E4UU26BW1orq1Q4IrFtbdFKC9oqngHjT/dvKEb8F5uHHprx1y9m01kd
	7nc8UXEScxxJRC+D8fWM2D/t8yTju/WjycpyXFz5bXC2kPCI692UHcNmzsIALlucb19gYIkGxun
	Nt7yDzwlaWwqQr54iwPIFzFmKQ0jEkJih7bEoT+4cvMAdHYZLNO6DUkdH0+JTdMUjRkUvds5RDQ
	ufsFuxXLb8UBP/T58Zj4c+3dWMJjsFbxLeceV0V3/Hw1OexlZujxTcnjpcBfrA8Fk7jw17y1TGP
	vbkLg5eJAFnkYnUE0LRIpRreuzYfL895F9786Nhl
X-Google-Smtp-Source: AGHT+IGvFurJs642blsbKfHkl55219Qqsig3giu0NAg+8n8ugzJV21cnOtyf5xi65ezCFhIfsgLAYHBKNAZBHfbAAvc=
X-Received: by 2002:a05:6214:5285:b0:882:45ba:be8b with SMTP id
 6a1803df08f44-8883dc4266emr133998096d6.59.1765190530760; Mon, 08 Dec 2025
 02:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20251208091148.368769-1-changqing.li@windriver.com>
In-Reply-To: <20251208091148.368769-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Dec 2025 11:41:59 +0100
X-Gm-Features: AQt7F2q8XRwbo6vgLzENnDYpMq7nhlx5jgCy8ysC1NIFA5HucOdyEu3mtKUQ1Qg
Message-ID: <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 10:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227388

On Mon, 8 Dec 2025 at 10:11, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:

> This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
> ${WORKDIR}/go-build-tmp so that the path no longer matches ${B}. This
> prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
> restores reproducibility.

Wait. Go does not have reproducibility problems right now: it is a
part of reproducibility test, and not in the exclusion list. So how
can the issues that this patch set aims to fix be observed?

Alex

