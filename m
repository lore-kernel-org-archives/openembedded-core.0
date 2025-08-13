Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D90C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 08:57:10 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.96563.1755075428744424807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 01:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpM14mkD;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7074a74248dso57114956d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755075428; x=1755680228; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l7J+UBFBqAZEiYP6oQnv3/oU4A5I/DfexvBFbSArw/E=;
        b=MpM14mkDI+N9Qgu1A2MpYLP0NPehTdV+SAgpAzPeS9pWmfRN+mW4ezvDELuzoFi+uz
         a0r/RBzMBU3o7LThEcTzTSuekemQqK5bmIk0gSMCNDfMS0ae92Q0XVmeFmJt33Lf2PEK
         Vw+vBBE9QWSXIYaepE36Zbh6OJNl86YdscRrYR5GduVSNmoN4DsjauQBghnkKAmf1BXx
         MzGXtqxss8TD1/0MG8n/uu4OYjlI80OloG8Gv5JYBvjgNO5Yl3yo08tRAoZLPSysUoX7
         YGrNgUnTcB9atjaXnABPjqznVTOSVJNI/l1vyhi09V/nJGQvWgWSfcIyGU1Lz0qaeLc+
         sJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075428; x=1755680228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7J+UBFBqAZEiYP6oQnv3/oU4A5I/DfexvBFbSArw/E=;
        b=MlKDQEFuSjtbln8kE3/aeqycnToQJxNFqYylYGP+dzGFfJO5v8uMbMWZjyqTXDU8Z0
         rsJZnYVTyTMNWI8QhqtwEs9qWpv+ueGT+tI5smsINUc0uW4suX513M9BVCk4gan0qYkQ
         ibjHsQfFr3qrclC7TwWtNFIlL4kM9DiNgO0lQeu0yB/5OVHnwiiQcfsVw2vAa26zNa0e
         Ls+cxl8w73eQ7u1bNllJCuCa8+vLZuEIsEqyxG8u2QnLGWu15kB/whWrs5t0tuW2xwSd
         ELMBPgUISwSaObOZRci4j7HdaMznxasr++QmuD6zrEzzYHswVv2MTGjSazLaRh2tVEAI
         EBFg==
X-Gm-Message-State: AOJu0Yw2JLgXb40OfhRQ9AYaaIxmNfTiTPYXNoluku/dYPEZEOaV4yf8
	B+T5Aa/0vqqmiBth2qlZOiE2Y37JXb6IXc6qdInbXnJmOg7z6hI/ELZr3b+vt9ZS06AkAgPf9Lg
	+bRmfTyYJp8CKrvzQsgUk3QZpywhD+ec=
X-Gm-Gg: ASbGncv+rbW6l9EWfPKdtxSgBaL922pTs/+oTyp8DbOvG7EGBpWytc5q+8XplkqCrB2
	NwpwSgAQCbvUQoi4hSH4tDL77M+6UwLNVCS344GoC4WSoJlE8C1n+FZZ3b4ZWOiuG3kI69pgvlD
	nFcJ8gWhXwoOwbg18w3zBVLEmbCn7tH5nd0l2AsyJGOCIpEUSb9y0UDeiE8dkge5JUY910WyNW/
	8hAJWac1IOpXf3YohK/LO6nrWfzxOHrMck4MF0N0A==
X-Google-Smtp-Source: AGHT+IGXRNU3vIfE6fL4Tl7PxRWJduHoAxnyEhyo9ryLuhFF51l9b6R/Fz0EN5VLExWprCMA+BxTGAVPu1PGlhT+bZs=
X-Received: by 2002:a05:6214:1d2d:b0:709:22e8:af63 with SMTP id
 6a1803df08f44-709e89bd01bmr24651626d6.43.1755075427763; Wed, 13 Aug 2025
 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250812211424.76559-1-pkj@axis.com>
In-Reply-To: <20250812211424.76559-1-pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Aug 2025 10:56:56 +0200
X-Gm-Features: Ac12FXy22rQgteOELWt-vtghvlnKclpBTVKhfV5qk4puuYjA6dmeRapOIpf0k7A
Message-ID: <CANNYZj-k_aGqkW6VOpT8R_CJQzPmRR0y4aer=1brezTebrhkTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as intended
To: peter.kjellerstedt@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 08:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221791

On Tue, 12 Aug 2025 at 23:14, Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
> -       if [ -z "$D" ]; then
> +       if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then

etc.

Ugh. Is it possible to *not* do this >dev/null 2>dev/null thing?
Discarding output, and especially discarding stderr has been shown
time and again to cause headaches when things go wrong (and they do).

Alex

