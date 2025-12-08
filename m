Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C954AD3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 18:26:44 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1907.1765218402168575667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 10:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hejwzuot;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88059c28da1so45982316d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 10:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765218401; x=1765823201; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nxybzaWLVuys6Y+zDiDdoq3TDxMrJ3FGE0IEibag3V0=;
        b=hejwzuotxIWRHOJ1MitLwMB1UHCvEcCSO+pvfsgXIk6RkLrWvFP4krVPB1QrJOurDQ
         YSxJOpFhvtAHw5tmP2Fz+uyGLT2TfyrWs0JKNCjd/F44cAJrBOqaRrEJszm13WHRHaO5
         FquvNhu1RkFIus4CX2t6mGBBDkqPe9lORu9QRhVrPxomjPfCvT25mishTAMIqnNqC+gV
         1By7kgWU8SGceasyYtA+R20+wEpEjxHAFh7/ruYwAfHhcVBmbaT7olBgaFN46cGGZKR6
         orSI1voNPR/qTR3eFARP5TmLk3QSKoViEERpEBCYy6Sb6q9M2AP4o4lZO7uzXj640/zJ
         rSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765218401; x=1765823201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxybzaWLVuys6Y+zDiDdoq3TDxMrJ3FGE0IEibag3V0=;
        b=GQDZgTNlKCkwbtUmRPx2HEagkZV1MVaXnM8XbJetXC6uAS+93NfmIKBNkKuFU58TZF
         rVwwA3FsNDP01bUBfBHmffNRdqsAax0hXD7NSZeX8YsUIMi2Qys3LlO6EXLtOlEOhwvl
         ApaxYVOCW2tXOIuX1zQ5xMvshcaAKQUrAwJlFiqkcqH6K0WWxf9slxBenFdcMEXh+Xqj
         hhjBJ/jbHLh68StpOh7c7DIspBF5cEh1bKu+4LcMjyrlO2ph6VOSldJmhbNl8kMk2OP1
         iZjqOpjmCYHd3cQHtE29mAxttStrOAbSrNDHwsPHGjlc34Az/P43203TXaM7e/Y8TJX+
         zOTA==
X-Forwarded-Encrypted: i=1; AJvYcCW37YBuaNMH247seddkN3NyXb7YWsZgz2keUJ30ZqInHqnfi+PRVmg09w50G5h7EQR2dkjGHAVVtqz0lM6C2b3XEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzL476zkR7pY2o8P6EURhG4Ry8HiDnoEVDycUkQeNly8KGBiTe2
	TpQBRONkiAiuZXKHOR8dIcPXjEXGZQvTFtkOKcEGfJKPw5cO7O5ORKSBuPXlG9MrdmRZe/JA+vL
	U+STfwTSJ0C4d3n9OfTls0IIx0VSwSXI=
X-Gm-Gg: ASbGncvTMl5ViZmHDf4vnR+orlZsMS8SV7uIebRPJgmqAQahoYldS6EFb/4XAuE55PE
	+5Z607ah0WNdaVjNfSenPOwsH8bOpVIFQ9Bzb7AGdx81Tb5Dig3MyOUCcFsIzomnPfg+mZ8RPMN
	ouRZ91s/MwB9MQw13xwg6GLV9YM49xpBuF7J7cGSALPTE3G/WfddVLlOjQy1WMgddCdE2upkI73
	xPhZAUdQ7DiVof4OyXCyV5a73zDJDvI7ei+SH9R2w/p3UyrucqN2ym939kHwB7lJqyNVStUBGLH
	9h7i+XeyGUZqDNRjc9K0/K1Si5F2Xg==
X-Google-Smtp-Source: AGHT+IEHLNa1nC3r21bkZN3iJP1+qh8763fzT4iUoC+wm9l8VCIyXYCrVUhOUKszb0o30k2bQvu0/jUfe1wsLT1BMkc=
X-Received: by 2002:a05:6214:e8e:b0:882:6797:3a67 with SMTP id
 6a1803df08f44-8883daba866mr152789416d6.13.1765218401010; Mon, 08 Dec 2025
 10:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20251203082404.2732162-1-hongxu.jia@windriver.com>
 <20251203082404.2732162-2-hongxu.jia@windriver.com> <3f6b542b-4cc3-4c9c-a4c3-6e20067626bc@windriver.com>
In-Reply-To: <3f6b542b-4cc3-4c9c-a4c3-6e20067626bc@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Dec 2025 19:26:30 +0100
X-Gm-Features: AQt7F2rza5Accb_wuSNoH2R3ugxQ_HT1LpXxl6s-dACojSXVh5hJmAdkmhJX6iI
Message-ID: <CANNYZj_AoTyv2H6gvu29OThVKEAqr7dats9+V8kMH==qJi7e5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] itstool: switch from libxml2 to python3-lxml
To: randy.macleod@windriver.com
Cc: hongxu.jia@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 18:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227402

On Mon, 8 Dec 2025 at 19:14, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> We reviewed this commit
> and the libxml2: upgrade 2.14.6 -> 2.15.1 one during the patch review meeting today but
> the consensus was to not merge yet.
>
> There's a big patch that we'd prefer to see merged upstream rather than carry it.
>
> Upstream seem to be blocked since late May, 2025:
>    https://github.com/itstool/itstool/pull/57
> Can you help them get unstuck?

It seems there's a bigger problem. The project is basically abandoned
at this point:
https://github.com/itstool/itstool/commits/master/
https://github.com/itstool/itstool/issues/53

We can try to ping them once more, but I suspect there won't be a reaction.

Alex

