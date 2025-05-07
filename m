Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B481C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 13:45:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.9499.1746625515267701676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 06:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ODKusiYM;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f548a4ea4dso2481396d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746625514; x=1747230314; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n+P7ixpKzg1GS1P4FNBQdMfEDCXT0q20sHi2fndnkY=;
        b=ODKusiYM8sMxWVY7NOuVdNWn+xzQCbDNCLz2c6kwTa6nQXwuXC6JbjbhDGd+PZt6U4
         KA1TnntJk8jvi52HfirniIbkGGlwN7HnZhfmzGqAuwZNGleJV+PFrro48XgJb4YJ+fvQ
         jJAeLTt7a80wiO9AyXfyVf+AakDemoF3172KKXt0KejrGBTQhMCb681zprxRs2cUho0R
         Hb118R61nA1ufB1fbYznk8C4u+M9Lr70ChLITmpuW0RnxnTGtN6HIgF04LNwP0VaLZ+e
         KQKqUxCSEthay3eeW1KSowBdm9Y+KgkMKnJzVeotVHSN6m/ui48HYTaGrpei+sKx6ulB
         PO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625514; x=1747230314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n+P7ixpKzg1GS1P4FNBQdMfEDCXT0q20sHi2fndnkY=;
        b=sSucz9zAbfBpRs18DrSY04w+HLIKvRhmNgbx7mu0JWFq9XR/aw61dNbp18R0LGUHTP
         gr6uos8zAWyCdPCM6yc2HVKVvcQx8gf8KNiKTU0fMfLEZU8wOF8ZZhy7AAG2+coyaxHA
         X4LxbdoRY0aowkCKOppOritKeCbyORc8sbm7J7YYBZqY5K4qI8GgfneMKqu3SR4R3QlL
         bXU5Xm+Purb6yfytBTKeW00ABqAwz7Qs+TRlLZTFvWpekBsxm++7Gz8c74IbC7eyJC29
         P1XdDSh+8zRdtitKo2LMCi5Lftog9E7m9NeEy2kdayi0Ph0CPzDh6VydVndYinQA3lpk
         GFCg==
X-Gm-Message-State: AOJu0YyfY8LLAJrJMpmGuFb2rAB6OoYnBbHv6zTuL3qMb/vmLZf3Ferp
	5ILRw50+uyYfjlQN2bCyEVI+cVdsMpvo2dnIfQyNjkpz4WtqoIVjkKyVet3sah1DSbovqNn/wsw
	MaOiwcTnnRpwuoa+Pyy64AmAio4Y=
X-Gm-Gg: ASbGnctGhGDoUrjJDvhgbmAbcAQDtnB+xhQtIgS/L7FVwcNCLtwYIy31zRTfoLHuAjj
	xLInTf/4KT4+v4uscQN/k6DpEFUMdNJGrGEbjG+5hC+tdNeCBPH6fIGLI9oa+AXXhHdT0jngE34
	2rOt2IkCreIC1hCRQzXU4fvDk=
X-Google-Smtp-Source: AGHT+IHK/pslIRHf7NJjwpkkmAjWxmz3cdP91gQ9N2w0cNT3bkcPdVamiRmMON0POw/UfRn+jjmAxVdA2sxC4JhrQLw=
X-Received: by 2002:a05:6214:5196:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f542ad2588mr52718026d6.34.1746625513967; Wed, 07 May 2025
 06:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250506110344.2129531-1-zboszor@gmail.com> <CANNYZj9tUVnuB144GuKWzdLfwB_3eWd0OO=Rkv3+yKb-CSFWYA@mail.gmail.com>
 <2fcfa888-1bb5-433c-99c5-cf5d1d590108@gmail.com>
In-Reply-To: <2fcfa888-1bb5-433c-99c5-cf5d1d590108@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 May 2025 15:45:01 +0200
X-Gm-Features: ATxdqUES7ZPFp8Rbvt8MtQh7DbAsEqsPgEddfqCWWrPbu0IwwR-FYos1Znx1N2U
Message-ID: <CANNYZj_i_47eThOSDKpagk7=qVLVrRnKsB4ouC-BEaYBFW=hAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Allow using semantic version suffix
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 13:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216112

On Wed, 7 May 2025 at 12:35, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> Because 25.1.0-rc3 > 25.1.0 according to package managers
> and that breaks package upgrades.

TBH, I'd rather pull those rc releases from mesa's git. Then you are
not restricted to those particular tarballs, but can pick any commit
you want (e.g. that adds an important later fix)

See the lttng-modules recipe for an example of how to support fetching
both stable releases from tarballs and development pre-releases from
git repo.

Alex

