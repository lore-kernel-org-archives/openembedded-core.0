Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A61CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:58:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4652.1761645535437749808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIsgeDc0;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-87c103928ffso52262706d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645534; x=1762250334; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HIy8NVQkG3ldgdtLURf8Uuw02YcAFJw+oX4+Y7PDTQY=;
        b=WIsgeDc0HC1T4VJ+pvX2Nr9YP+bTcLnSGtO14tS6RdpgYAU7YzcXJdvgm0mJnd2EC0
         7hUeOqY63FaX7gFzmBgvWk157Rg9wXYh1ma0ysXw2/msq6ebKT/cthMeAsW/1vW+YbDG
         VwTk0QGixucHwXP5f7+YSUqd8MGKwT1ywilq+xQvBWQwEmR8cxON0AcO3oyOdMMxATnz
         92DCJ/2Hzw6NXFVbCcI/V1Skireg0aIoPYZ8CEPjd3Aw8rQXHRB2m4pmXhdRPaGoGR1w
         425Tkhg1ga95PgSo+CmA3IDSmePifpCp09JGdwfs2G5f/wpwGR+njzV/ZIzfFrJq0nck
         Clkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645534; x=1762250334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIy8NVQkG3ldgdtLURf8Uuw02YcAFJw+oX4+Y7PDTQY=;
        b=vlcgtik/EyLPLujy9G1jtNuTvXlAe3YkospdwAu+7NAYTNVOslzmEFZr2OS+kAFHFy
         jpr0J3CoYwuTQ8VCUPak9sfTTevjx9FfKLb0Mc8B9iKLhnWrzIfDUY0MsJwJCo71w4J3
         TZjAkDKqORP2MJkCZ2mmgPkdYU/JcIab1QjYD9mQYk0ITptuG51qQaJ3BIGgwY3PuFwC
         usm3U5IgHC9u4HYkDFw6QIldGHfzJywQNPLpOq+3Sr7NRxw2b2fi4KMJ6JAECrtajKRm
         YMQyHzDNnrpaINxl0mhtFhBPBWfrVSobCEGaYaGZ4lpgFZRQM8AxhGhlUb85BS8kkDQB
         nMNA==
X-Gm-Message-State: AOJu0YxzYAd22rtiLieAC4Kyu0q4q9XUszrsUofenZZjGJ6CC0M3PoTG
	eP2hbyelh8kFf+Vxw0Rd1op/plLCfzf0A0tQGddpFFSLlp6h8DFsXerkrL9KC/rL5GSEFdG7TFx
	3s5JhNdnCcd17jDBOHDElQ4Rvs8vswwrv3w==
X-Gm-Gg: ASbGncuVHNf0XTe1TdcGnvHdIwdspRmqxOE4BPIZ6ejS3MCOuXByoJywGFUFzFUAq7P
	0+fdeCYxkxF84h1LUpukWzNBV+OnzdJivcBNQj049e7h4jAMn5NulzEerijEpcQbSO/doyS5WGM
	P2woKL4/xwsU2Wvu8gf+UsugvBUyw+pz5jGY55OIAirkqN1snJ+LhpJPVKw26hruCFXYh0j2bKs
	vAlUBODoP3cUz4I6HszBG3NTOGiICP+fIpq3ur4jGmp39SWd2m/446iBPuEZ4rhKoK7MJIV9xyD
	ufiIQR2h/w/1V2jpGgxCiVi8GXg7xtSt622WNimPcKs156Ll32fGR/0o9rxX0yAV1TM64IsGFFO
	3MyL1sv7b+N3eHeQfYw==
X-Google-Smtp-Source: AGHT+IEQI2OAiRjxLeaqOz1s0/3f3C6g0XC3fOGpVZdcyHH8+ZxxtD5G62pCmjAdJR2ezcAIIzuBQYMSk7ijYygSZZs=
X-Received: by 2002:a05:6214:21c7:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-87ffb046a42mr33620116d6.22.1761645534371; Tue, 28 Oct 2025
 02:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251027164236.2324092-1-contact@schnwalter.eu>
In-Reply-To: <20251027164236.2324092-1-contact@schnwalter.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Oct 2025 10:58:42 +0100
X-Gm-Features: AWmQ_bm64j6CKtRlEUsLbNLp51iNw2tHtgUkwC1VIY7WvcHBdnn_gLWGOp4IUfM
Message-ID: <CANNYZj-JpmwPdMVUnbowCeDSKtBpWuOxN27yT74H2mHxn-9AKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] core-image-weston: Add wayland as required feature.
To: contact@schnwalter.eu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 09:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225384

On Mon, 27 Oct 2025 at 17:43, Walter Werner SCHNEIDER via
lists.openembedded.org <contact=schnwalter.eu@lists.openembedded.org>
wrote:
> +REQUIRED_DISTRO_FEATURES = "wayland"

It would help to add to the commit message an explanation of what is
improved by the change. What is the issue you ran into?

Alex

