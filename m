Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0E8CFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:04:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17300.1763913852426486794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScgYhck/;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so33730706d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763913851; x=1764518651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=drDjPTk/aYy9+tiU40EWwEGJ+WNU9CWhKf+ZErNZj7Q=;
        b=ScgYhck/foVsGjbMRTQou3Q0JwBpPWdHFx0nx88N3+nowsohCdaCMLSs075P9yYNb7
         BwLXWbGf3Dd3mekxNYCJ7wE87LwD5C9mpnCKwivdM9TsK9vA65kVzrOjROFR6mbe6G9h
         w4R1Of14KbJ/cQGIxUkur9rdDulaX7V3uOtLKBgzkZ32wg/53y0fZerJKDjidbdpImiP
         RMUqVIRf3wCtJXJ3I61B32/26xTqcqK+oJbXVkKvaH1Su+hBsmOPDSf+SLSSaXFLamR9
         wkNm9eBpdZ841u0/2k6XpsELCO5zPtw0WksZ+d1wqlIYlBxo3KPqe/gLks9CDZg4m0Kh
         zMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763913851; x=1764518651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drDjPTk/aYy9+tiU40EWwEGJ+WNU9CWhKf+ZErNZj7Q=;
        b=bPKSzFLWaHzV3liY3koaexQ/WlFKBdPqXWXJWA7070VkrcfSyynIZBj9EAMqDiw0pw
         3dZPn+Fh7pWeAvFPLZV96nh3PDAPo5v1mOW0hQOSJG03wlRYvv6mWG6GmDk4Y7QgB1tT
         Q1b+9Kf11DUdPhfcPCMJ4KnGo+aj7m9+jlFImo/aX1WrFlbQwn/NOARNYYtR7/MiPZ6l
         ZfM4jhLLIUOzq3O3O1RfCY5FZEIn3ukc0tZPfG/gX205vlkwvfB2E9n9wdWnrDl08Ve2
         ZGMC9B8cUhx9CdgieAcBAyij6U/3rDlw/UZTFFEj1LFVszLgWuIGWwwiPYDZnWfIlxML
         6S1A==
X-Gm-Message-State: AOJu0YzaP1oi0LX1bo+xzuZCITQvErpIz6W7i3iv5LqT5Fjy2ftGkxKJ
	9vsh4/LOjYgKEXsRHINA1Ezb+FnyVfQovfIOBq0dUVUN39AC6y15gMxgEdrXirRMUjsU2HYKiFv
	7FMTkxrVEY+InhDEZG0r6PvIp18/dFkM=
X-Gm-Gg: ASbGnctukcSt63pQrIzifCL4r7lNz2ljvg0/blnUP2AxdPFv5B1E1CZ3yBBbdtbvV7d
	/eyJlX3tWoGd1i8QBY1TT6ZJ8/Iyeh3FpeCoZRGZ0AMK4AeCeCqYrBvobCpArZe865nHO2reZF6
	PM469/INuEV4BM58b5Jki5rJwtgK1bkTCdbziNXFd4E/0DPaBOjM6HqiWcsKZyfywnkQaOYNXmi
	XAC4B5fkgeFCmtxWsZxCq+7vLGa4gDcbw2j3ex/CNp3qUj9vDmMfUIwLV2TtxkVEIAgUb5ES8iT
	8ZbIEtEfmWw8lgtUuEmjqlifaBStdg==
X-Google-Smtp-Source: AGHT+IGOQqGyYM4cR7X693DqgNrCbLaswE4gxShWfNJnyQzGMiZhubOb5bs+iP3H1WrMzuwcPiudYEzXOLxxWEOynGM=
X-Received: by 2002:a05:6214:cca:b0:87c:1d9a:d0c8 with SMTP id
 6a1803df08f44-8847c4c7e9cmr126152516d6.27.1763913851352; Sun, 23 Nov 2025
 08:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20251001093453.185784-1-liu.ming50@gmail.com> <CANNYZj8ka0t576ifJKNvrahors+QsPz+0xj2JZNZ8x91sJX=hw@mail.gmail.com>
 <CALatG=61tOh728dLdkmTwuKRSd9Tm1O0cTOrWncCW8Y=uPkzLg@mail.gmail.com> <CALatG=431+x-TwfAdo=88gfzQOV4qvhFLyRVZkM5j2J9cz=haQ@mail.gmail.com>
In-Reply-To: <CALatG=431+x-TwfAdo=88gfzQOV4qvhFLyRVZkM5j2J9cz=haQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Nov 2025 17:04:00 +0100
X-Gm-Features: AWmQ_bkkPR_WonkwmzsqawAo3QqZAc_sza9oDe0YYEsv-fjKpczne99Yhzt2D6U
Message-ID: <CANNYZj-t2yTGruDyJDu7GmDT=wD5uHZ=8wLUy+AXQexeQZrn2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split.bbclass: support muti-lines
 in module conf
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathias Thore <mathias.thore@atlascopco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 16:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226728

On Sat, 22 Nov 2025 at 13:24, Ming Liu <liu.ming50@gmail.com> wrote:
> Could you please kindly help me review this MR? It's pending for a while.

Please note the release cycles, and where we are now: deep feature freeze.

The patch is deferred to until after release. Mathieu's branch has it:
https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next

Alex

