Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC27FC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 09:57:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.6140.1740823071956243368
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 01:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=da36sAiK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so18437195e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 01:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740823070; x=1741427870; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQotqx5l2I07aAAxsrx5SxKZER9U3Cja7UZWs7WFhVc=;
        b=da36sAiKfEL67UPNHSNtcqU+IDk4x5jTjtNrF5b5wDT0BE2uOqkA8HTECxRQVsHDMU
         C16bt0YiBH0NysjoFhqB55z+HEghm05iLAC5Q4mMX1wPNyNlIpK9yoJs4H0kcUWwcijZ
         3NwDkYNaIw5+x0bjgCMK81MtGyFj2H27jvOEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740823070; x=1741427870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQotqx5l2I07aAAxsrx5SxKZER9U3Cja7UZWs7WFhVc=;
        b=TjBZuS0w2t0B+bfd0SL3Q6cFiQfmhLhe6mp0IThWzya4of0shvIyn4PMW49HKpGRVG
         biSF1s6a4qu4t08+2dQk8wciAQVSfB04aXY00AG5ZqPthytsRflM1m70m2suAb6mWyoU
         gS94/ER6AzhyskNXiCBZVG2JBxPIXr5vqJbf4jONuchAlVSRy7uq8JPUIYjz2Pn5/IQw
         sKWqgxIoihprcv1XudZSZCpbIVE9qsw3vZ+X2DrFP6/fdCMRT0NONAxHKiq/g5yY6VMV
         kw//JxJ5MV8tZHg30o5xX1YYakM7JUraJAPV9MzJpRzSfuY/utZjMBL1XKfdb8FXKU+M
         ewpA==
X-Gm-Message-State: AOJu0YwWQHWqD0Werm8QeyT+/5g9THNoyQRgClqxcNw2hV1AfEnuhbEh
	vEMx4Qn98P8eJ3hqXSfEALAGj0q4DXEW/VDsLQphnA2xkekWHSV/+xhCvb/K64w=
X-Gm-Gg: ASbGnctEFVUvasPeQ1V0+Pq2vJ59gdQLOz8g6RZeZW3Nbi6Iju+8eXAiU0vh3n5sgY/
	GlOYy1/cVSTEkEUhFPx2+6Hk4cK/MqiA1bXi1Oh9O43cwxb4UK7BFHzxQoyQ6C7bvLDuCCJf8f8
	MkDE8eePyyIUIsa7MfWU0cQDEQivjzaHtwXsR6i8MntUYoqepc7aejfg5ykLhxaoZt2Ewiu1QCG
	lz9o3bjMG5dJVsAlZ8K/HlCOUvjXiJS1j1aAxpbDMZjfG+zXx0TbN+nolr3muB6FF5uj+8wtLwm
	hRJV8+Z4UGTBDus4LYkdw45sCE2YEM52Stdlisd0hUm+sO3eHKQGs8wlpzBRjGh5FLdxBkvZiXv
	XqHnREw5nVaAsUsSjWiIJHdjDjv2fGXG09Q==
X-Google-Smtp-Source: AGHT+IE4B9Kaj9CvhoiWBQzWLfaeNxc1AI0zx60aESTH4pHXmObworsGtUG5DWiBj2fvokTryFZPeA==
X-Received: by 2002:a05:600c:17d1:b0:439:8a64:db3c with SMTP id 5b1f17b1804b1-43afdd93cf0mr90350455e9.1.1740823070342;
        Sat, 01 Mar 2025 01:57:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e284:a315:76e8:2897? ([2001:8b0:aba:5f3c:e284:a315:76e8:2897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm8065000f8f.17.2025.03.01.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 01:57:49 -0800 (PST)
Message-ID: <0a146fbccc15be5f79f2cfdf668da2fdf5ad400e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: openembedded-core@lists.openembedded.org, Quentin Schulz
	 <quentin.schulz@cherry.de>
Date: Sat, 01 Mar 2025 09:57:48 +0000
In-Reply-To: <87ikotnlkp.fsf@gnu.org>
References: <20250204103744.27883-1-othacehe@gnu.org>
		<11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
		<87frjysae1.fsf@gnu.org>
		<0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
	 <87ikotnlkp.fsf@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 09:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212093

On Sat, 2025-03-01 at 10:31 +0100, Mathieu Othacehe wrote:
>=20
> Hello Richard,
>=20
> > You're using this with minidebuginfo so does it not make sense to add
> > this as one of the debug sections injected there with the rest of the
> > minidebug info?
>=20
> Well minidebuginfo is about having compressed symbols in an ELF section,
> and keeping .debug_frame is about having unwinding material in another
> ELF section. In the end both of them are needed to get human-readable
> backtraces on target.

I think the name has been misleading me as I imagined minidebuginfo as
a small subset of the main debug information rather than just the
symbols. You're saying it is just the symbols and there is no way to
extend the compressed information?

> Now, keeping .debug_frame when minidebuginfo is enabled seems a bit
> odd. We could only keep .debug_frame on the needed architectures (ARMv7)
> and rely on the more generic .eh_frame sections that are never stripped
> on other architectures (aarch64, x86_64). Yet, picking what to strip
> based on whether minidebuginfo is enabled does not feel right.

My point was more that if you're enabling minidebuginfo, you are
probably going to want good unwinding information.

I'm struggling to see users enabling one without really wanting the
other.

> Maybe, we could go for a DISTRO_FEATURE that would be even more generic,
> such as "backtrace_on_target" that would enable minidebuginfo and keep
> the suitable unwinding sections based on the architecture. That way,
> users would have unwinding materials and symbols so that GDB, libunwind,
> systemd-coredump and other backtracing tools always work on target with
> a minimal overhead. People could enable "backtrace_on_target", see if
> the image overhead is acceptable to them, and have backtraces without
> diving into complex details.
>=20
> I think it would still be needed to offer minidebuginfo and
> PACKAGE_KEEP_SECTIONS so that users willing to invest more time can
> decide precisely what do they want on the target in terms of symbols and
> unwinding material.
>=20
> What would you think about that?

OE is about choice but I'm still thinking that if someone enables
minidebuginfo, they are most likely expecting stack traces to work as
otherwise the extra symbol information isn't much use. Am is missing
some key usage?

If PACKAGE_KEEP_SECTIONS worked well for all targets, I think I'd be
happier to consider it but the problem is that it is all very
architecture dependent :(

Cheers,

Richard









