Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48ACE83F1F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:01:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20903.1770213674250513159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zw6DrJ5f;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359108fd24so505544f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770213673; x=1770818473; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Znei5Ci/04aWnaxb4czIBMDoXKD65TB1Im4So6YmAzg=;
        b=zw6DrJ5fTVfhGO2X367Z6xoXloZ9xRFQUKw/cnTiaOffCtSx3EneO/rrGTjQpNT8Iu
         N+tp6ziw8/YdVXhlBgVe7qFjI14WM6ZUxFDTUUGD90LVVx5wzuC6CkIjZUVY4QfoIL6c
         fExu8XDR6eOXtWthGl6MA57SFHRUPn88FzkQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213673; x=1770818473;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Znei5Ci/04aWnaxb4czIBMDoXKD65TB1Im4So6YmAzg=;
        b=rJXBq4TgLmrVx5yfi6XOK0BwKh4h8syeKoZ941AKDQIpT2pY0dmnnrdIhDBbbxruB1
         lLzPitUdqw4IR0nfujXrkPArBC3J8kui3dXtSZ1aeMjged5CJI+9EThzhdryUackxVJq
         m9JE7CpTGhpFvBEVf5muthHSpUF5lmbIJifQPM1Wohi0i4RYgBjDT26ZtpoLagLQL4U1
         iuatzDPtT0tWD/2omrNOh0iOAZ8rYb5wYW3nksT/zzhwXeK1Mj3Nxs8NfZiSt1RndObh
         Meq8Rk9uIXMdZdWxLRTT93ajBwsfI18ZSQZuSwKAIPHJ4yloRAbi5YWQzmXcsSxDQFFm
         z6VA==
X-Forwarded-Encrypted: i=1; AJvYcCVRqR8PvyfPqAhU8FaFNmJwa7U/e0GnTmEkv5223SrlB4GyvVA2AM5i1Gkl3/syW0A8DBpagxELiDZWhxGtoeYbgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxK+IdqpNywQAH+sl6hCggN5MNU4eHGMc1eCcqwtXAalR/bWRmG
	BUnGCqHaduNHs8/9DuSuxXWoEzbaodgESG+QSo+fbYSYQmRrk3GxvxyfC9aD2Y+d7jw=
X-Gm-Gg: AZuq6aLHwpsVLHrBNNPDLcJEiXCPOjlJ+y7MJyQ/LmJsrGqs6OzLTFY+poLpQJP0uO9
	TmASGMIPUCh3KAKJ1pl3IxEZw/LBygbTz3A0ZGGWBpDyGrTMlS6aGPGtiKypnGYKJP+SLMlDgG9
	wB0+GMrSvx0XcqFPsW9ho1pFdudP2Cr4qqClg7Px2fsIoPXrUf6cagcJGxWxh/NJ1XrHfmZoC2U
	bLg6RQZS4/zZiWSWfK6UxVJNApOn8r/iYebAL5UNbtCCMx7NEyKDFHYULOZDYtGhkKSsBzUDe57
	DFFgySz+XhS1hL+36SAj8Y0MpPeztd+Tj1GTIgVFAchwIhSN2mMJ9H+UJ3RQobb85Pbx2dQwJht
	cGqCSZzTtuOMH3kCFwwTIUZH91WqL1knlSAve0pN3NNpHb1xs1AIX6b32BPbp+QMtDPHz5UcOSZ
	em/Fn1SpclmR+nHZ+hhW6M9pGnH5kVkeJG/QcVpIvkNUJ53pOBVxfT9lRD2J3LIJERB5+XnAtfK
	ny97EVCrpPmfA==
X-Received: by 2002:a5d:64c7:0:b0:436:5b3:6992 with SMTP id ffacd0b85a97d-43617e3020amr4224032f8f.4.1770213672349;
        Wed, 04 Feb 2026 06:01:12 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25d0dsm6791613f8f.7.2026.02.04.06.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 06:01:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 15:01:11 +0100
Message-Id: <DG68DI3DMUCL.11DNWKJV5TK6S@smile.fr>
Subject: Re: [OE-core][PATCH] expat: upgrade 2.7.3 -> 2.7.4
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260131145306.3770983-1-peter.marko@siemens.com>
In-Reply-To: <20260131145306.3770983-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230530

On Sat Jan 31, 2026 at 3:53 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Changelog [1]:
>         Security fixes:
>            #1131  CVE-2026-24515 -- Function XML_ExternalEntityParserCrea=
te
>                     failed to copy the encoding handler data passed to
>                     XML_SetUnknownEncodingHandler from the parent to the =
new
>                     subparser. This can cause a NULL dereference (CWE-476=
) from
>                     external entities that declare use of an unknown enco=
ding.
>                     The expected impact is denial of service. It takes us=
e of
>                     both functions XML_ExternalEntityParserCreate and
>                     XML_SetUnknownEncodingHandler for an application to b=
e
>                     vulnerable.
>            #1075  CVE-2026-25210 -- Add missing check for integer overflo=
w
>                     related to buffer size determination in function doCo=
ntent
>
>         Bug fixes:
>            #1073  lib: Fix missing undoing of group size expansion in doP=
rolog
>                     failure cases
>            #1107  xmlwf: Fix a memory leak
>            #1104  WASI: Fix format specifiers for 32bit WASI SDK
>
>         Other changes:
>            #1105  lib: Fix strict aliasing
>            #1106  lib: Leverage feature "flexible array member" of C99
>            #1051  lib: Swap (size_t)(-1) for C99 equivalent SIZE_MAX
>            #1109  lib|xmlwf: Return NULL instead of 0 for pointers
>            #1068  lib|Windows: Clean up use of macro _MSC_EXTENSIONS with=
 MSVC
>            #1112  lib: Remove unused import
>            #1110  xmlwf: Warn about XXE in --help output (and man page)
>      #1102 #1103  WASI: Stop using getpid
>
> ... and additional docs/autotools/cmake/infrastructure changes
>
> [1] https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb} (92%=
)

Note to the master review team: I have related CVE fixing patches queued
for whinlatter and scarthgap.
This patch is currently in contrib/mathieu/master-next-success.
--=20
Yoann Congal
Smile ECS


