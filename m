Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F502D78797
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:50:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3261.1732207827832913146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NFvwsN4B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-431695fa98bso8905685e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732207826; x=1732812626; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y2dccFEW6e55y57yENL4Ir7qMBNEJiX6uAztOLukdLw=;
        b=NFvwsN4BN4qdSiVcQkOKZfEux+/d2UWKiKcMebcnppOh0OancEd8crYKYY2rXabOGj
         NSPi7dFxQjhiQaI3RGmbIuNpQM45OxmI+uPn+AakDaF6fMPlaXWof378yWMgEAIzRP1F
         5EMDILnUGzzcgbtzIO9H2Q7G0fUI6s2xrTV0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732207826; x=1732812626;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2dccFEW6e55y57yENL4Ir7qMBNEJiX6uAztOLukdLw=;
        b=bbGB7t19ZKPM0Oj96MsX0pkoimn+760QDNecnGTgMFAhQo58Pel+0AHbxcgsAitF/5
         TGFLUQvA+bYkHPDSxvZhMmGW5TLWhTD5FK+jWh+b56s0X3g80JhKqlK5LPZpRA87Q5R4
         qdanIEwBjvflHHhQGCdeQU3Q/E91I3xqYzVhr0gqiJr0AAeu3KQYz7TS9GkMCX0buF6d
         Jt1uGd2Dux5eEW6iiJFDUBbDTGL4b7looapSsQhTGPjd0jdXJ1CNJ62NW/Ex/rhun1Yr
         bNIokiXBadCx/OPOMw/wc492rW///XRTdMdDlchbm+3QMh163s4GixuPfoUbLk9KB8DK
         /7QA==
X-Gm-Message-State: AOJu0Yyph8vqxDkrELHxZn2LU67ppYTxSEH/d2yP7rcz6aL5gD8cSwiM
	MGVXo5ebkYa6ANwPD/P3lDIptajXw/sy8CpqqP5Rd7Dr6ZwleP09kGkikjZWPnc=
X-Gm-Gg: ASbGnctJD5+8HwE5xq8P7kcBQVfZRyEnQjWP1+ojcU+f836MInitMrpTCenWvbjAsGO
	5pu8JRYG52EuS84dfqSy78TA+c/x9oW3TFfsXDj9bLEeFtbcTvBaUH5sEbKYtGiaav1PmimzOWM
	PYpOddy8gKctyqOHen9yelLYt668TVlJAVEl0rHb35NzuxMbz8WJd8wLcXu9idUVlNq3Q5+IaYh
	AZjnVp2Fco1AcZnh9eJSDjBUru8hiD8wX3FJswJdpNhCbzwFakVcuede6d7feZs7f4kDPYZliK1
	Vgm0mkNbHQEpPI70bC/doAfW8J7SMOoH8TSgpvM=
X-Google-Smtp-Source: AGHT+IGU9IGhs0hXiDbaCqucYAyKcRj4HwnJQW4iIIxRsv7fl7fQUtbIFF2qRnPY5JOt5dbHqT0VtA==
X-Received: by 2002:a05:600c:1912:b0:431:5522:e009 with SMTP id 5b1f17b1804b1-433489b3d7dmr71411805e9.12.1732207826262;
        Thu, 21 Nov 2024 08:50:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4ee:c091:1f03:6404? ([2001:8b0:aba:5f3c:a4ee:c091:1f03:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463aba6sm61421485e9.34.2024.11.21.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:50:25 -0800 (PST)
Message-ID: <b9e4809388f7a71ec1d5cf85e6fec7aa1fee65b6.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2024 16:50:24 +0000
In-Reply-To: <cover.1732162137.git.bruce.ashfield@gmail.com>
References: <cover.1732162137.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207551

On Wed, 2024-11-20 at 23:13 -0500, bruce.ashfield@gmail.com wrote:
> Here are the -stable bumps that I've gathered. The 6.6 updates will
> help the CVEs in master, but 6.10 will continue to drag for another
> couple of weeks until I'm ready to fully send v6.12 as the new
> reference kernel and I remove it from master.
>=20
> I've also included a couple of devsrc changes that I previously
> sent (at least I think I previously sent them).
>=20
> Finally, the biggest change in this pull is the libc-headers update.
> I've tested it against glibc and musl, and didn't find any issues.
> I do expect that something will break, but it needs some extended
> AB testing to weed out any remaining issues.
>=20
> Getting the libc-headers in early will ease the introduction of
> the 6.12 reference kernel.
>=20

Thanks for these. So far on the test build there was a genericarm64
warning which Ross has sent a patch for. It is definitely good to get
that headers change in to start with!

I didn't take the devsrc one as it was already merged.

Cheers,

Richard

