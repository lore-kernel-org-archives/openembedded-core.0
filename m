Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF368CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 10:26:17 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14395.1762856772129033733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 02:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZIrvUsz8;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8823dfa84c5so32174616d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762856771; x=1763461571; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGBcHC94XXUys/GhH3rnTHRihu2gur1Y9NHCYGMNKXw=;
        b=ZIrvUsz8jGll0pKvEQXIrr8pqEAJAIJXlmV97YSenQRMe3o6OpKbeWKYcE+GXP+YbP
         td0Se1u7CdIFxX1VkEk7CAGkQ0+Rt/YlClQLKBWY/uWqoMlUbyUbdbIi5eiUFsFEvCPY
         Q0YR/Ps13pjKUOeyk0sAx/Y1l2lByGhZq5C1xLaXGeDVz9LZqkQ2eXKFrzRDyKQd5+uy
         1A1Z5qWzGMM3V21UExzcZi8HeAFq5l4fshg3fQy97C7vilakNuL696gKrvOEUE12guk0
         1sET7jzIRuhIgx/L+Xty/nHMzgzWRaAOPpP5y2DPoNqHiYB9S91VAghNOqRcpZzt33JB
         KfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856771; x=1763461571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGBcHC94XXUys/GhH3rnTHRihu2gur1Y9NHCYGMNKXw=;
        b=lGaTpAY/BfISDvMH7ZKQ49jhglNt+8HDBoiIWrR1kxPjjxSu305fMDD4lLBHhcCpmo
         BSbJs2gFME5jnNHs0hPwJ60tVLfxptdXMKHlJO0CpFifOkgriKMKdLzsDb59IFzQInrR
         IHLeRrHr1yZRPCPnNcUoJNbVqdvy3sltOimTgV/HhLbxM6o/fd9WV7wd9MwnMo9bu5hW
         rZ9vk6W8L9LZ73vhH0Atn47fxuikrUzIXuW9zNU0XOSX6nZhUp/WNVxvn4CV3Vur9Sf8
         4JbkLjweTuq0xjgvltFoX/ZIZreBV/CLOy3zsS1Cftf9DNvP2rgQ7NHTfHeJBqHq5B5t
         jBig==
X-Gm-Message-State: AOJu0Yw9JzKfP+aKTOZyxsWZotqpHaMyCyDaEgzY6Z+VFHvd3vwM8Y8T
	CEfeY15/Vr9AU2+vfOJcBUoje5s+ZtjaS5aH8Ir8j0+amYK4lKlXPS7TMoED4+mcoAjrEOFc/1G
	PmWGp3O/pEeAMJAA+gi8BiprjNLc0T41aRdsd
X-Gm-Gg: ASbGncs7aRqjw3Ahy7MDgxzgWIlH9WjagbAosBeFrpeMJ9hppaUdi0epCrIcmEiETfX
	+x+3IG1ZPt9f3l3Q0dHWTXw0UJkhtlwL7lgGOBSbPcfq2ontYxnNRcAvgLEH/8fklT3F1gGGqDN
	c15+3Gubp8KPMDdwaAAJpdn6AIwUbRjhkB14dtnswuIthxxq6LM//GU1psEE85sQBHvzz03Qb2E
	DHhYsduyzA0xnZVJHYGR9Z71DwSnd2Oeht+Erjv2xzIOq5gxuFLFfX7M+Id8kw=
X-Google-Smtp-Source: AGHT+IG7HTjbaBhTcJ//EWdsspcdcEw8G09hPCCM91foBFFRDIkRQ20+yDTfaWK6YMBQmrm49+SpO6zf5HSPwwnKB6Y=
X-Received: by 2002:a05:6214:c81:b0:880:5730:d3db with SMTP id
 6a1803df08f44-882385ec7b2mr146471466d6.21.1762856771117; Tue, 11 Nov 2025
 02:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20251110095650.3192469-1-mingli.yu@windriver.com>
In-Reply-To: <20251110095650.3192469-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 11:25:59 +0100
X-Gm-Features: AWmQ_bmhyGM1D8kzElMf884kXK6mdm0jIsZgWLGk14Em4u59SlOE14oVsUNYn9w
Message-ID: <CANNYZj_pfYkrDkxxt3Vg22jyO=x6JmNT4RMnoeJ0eZn=FPymRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Upgrade 3.25.1 -> 3.26.0
To: mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 10:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226154

On Mon, 10 Nov 2025 at 10:56, Yu, Mingli via lists.openembedded.org
<mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] getdents_filter.c: workaround off64_t not defined in musl
> +
> +Fixes:
> +  getdents_filter.c:18:5: error: unknown type name 'off64_t'; did you mean 'off_t'?
> +   18 |     off64_t  d_off;
> +      |     ^~~~~~~
> +      |     off_t
> +  make[5]: *** [Makefile:920: getdents_filter.o] Error 1
> +
> +Upstream-Status: Pending

Pending status should not be without a reason that tells why it is not
sent upstream yet. And the newly added patches should be mentioned in
the commit message.

Alex

