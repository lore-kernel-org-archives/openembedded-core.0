Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F6CC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:01:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.4152.1704736885743768437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 10:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=luTkoq5H;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28c5af37d3aso484142a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704736885; x=1705341685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH1pxYMR/g8pmrEx+V610DwnEvhySbY97XIESq83Ei0=;
        b=luTkoq5HrNNJDU2ENqwXmo/E5wWFqn2HZMEH162o0B6sAUSGsWCeNokIF1Uj+UODO1
         sIKiJo6ILUrTUuxKF/BMr4BYnwy9jGYPsCAJgLcVmaPPo9UDUIY1yokWqkawEX5iaT2g
         tn1AY8yJpKXsOyqV+H7uij1kuWP6B6u2hd0cKOAPGyuuYOvJGLAE010faOj6qAq0QWyg
         UzCs79KJMMsr5mxlu79ItAiodLA9Ssrsb/u5Tq6YQ44B66OjliY0xHZlJR8UsAOGojsU
         5X00Sv74NW1ISWbn4zi9LCNTgwTMiheBdy73JLvUeQaEO9yIhd+vEMUyqkvZye7zobsz
         zkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704736885; x=1705341685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tH1pxYMR/g8pmrEx+V610DwnEvhySbY97XIESq83Ei0=;
        b=q4PVQOqR7QbMT6v+MMsXB3PihxDTC96yb82m/s2p/Td9CbZMIsGlKLpzFqf5Ty7SiQ
         Qtris0XSX/YojYpf9x9rZE3SysigOTJlTkKGQmYO9mKcUDk2NTvWG9cQ9f7NIo4tlebR
         9bkPNHYQ2gfGEp3hH9QHbeYfcsqnjKH7GkbIRlhNFcNJnVbTZ9cPg/AQBXBwCJ83kYMo
         Wt5PLQtg63nCt/moOeIwgnKaAtFBLnof9xykveYJbYi+YY0+44JF0TaKpqFFFWgfkHRu
         2Dtkz6fmBOJmK92VShIyuw++wivQ74Hza/WFw9/CjhnvpTEnDi3IqJj2QI2e+a3RtDUy
         go5A==
X-Gm-Message-State: AOJu0YzAzku/0Dsr7tT/rDJNZghONIdWN91IsqPSps1fvx22Zx30llwn
	SZotXP6om1Srez3a0EXnrak+K6XhnUdlZgT9L1A=
X-Google-Smtp-Source: AGHT+IHuKPblHdmS02qNTNUZfV776etbZtL9Fq51bU8C6j3/DBCrmM3Gri0yFrhswoc/IlO06SwIZEV3JnJEi39Y/K0=
X-Received: by 2002:a17:90a:4962:b0:28c:5a9:de71 with SMTP id
 c89-20020a17090a496200b0028c05a9de71mr6002772pjh.4.1704736884795; Mon, 08 Jan
 2024 10:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20231226123810.495126-1-festevam@gmail.com> <CA+chaQfLcVr62n8xOCXJoc7TXM2Ut_qkMa_uM5OoscUQCyHnEQ@mail.gmail.com>
 <CAOMZO5Bn23X5T2t++H22VBYS9rF8SUinXFCQ7OXr5L7hG_J6xA@mail.gmail.com> <CA+chaQeYKWdD0Kz82OpZB_cMeGHPRwKXfcOZBRd4_sSHkOUMKw@mail.gmail.com>
In-Reply-To: <CA+chaQeYKWdD0Kz82OpZB_cMeGHPRwKXfcOZBRd4_sSHkOUMKw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Jan 2024 15:01:13 -0300
Message-ID: <CAOMZO5CPF1ne2QvUC-GuqJnm6hTObsU-6AEcLH7erm+LN9A3iQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmscube: Upgrade to latest revision
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193429

On Mon, Jan 8, 2024 at 2:26=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> On this platform it doesn't as GL/gl.h is not available, but it builds fi=
ne after replacing GL/gl.h with GLES3/gl3.h (for GL_DEPTH24_STENCIL8).

Thanks for the suggestion. I will send a fix upstream.

