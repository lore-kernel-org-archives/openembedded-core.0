Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606F8C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 08:49:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7960.1753346944181184805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 01:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=egG2aM1o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45619d70c72so15522505e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753346942; x=1753951742; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sYG8VsHkclnJZZxJPM6QFhYHgIPjI7tE21PvD0ROBg=;
        b=egG2aM1o5ipe4Pus0eJgtZkjyZSwewAr4YTWk9ZbLEPRxIYll50iHtI8SGBb9auhbP
         etb8nXH/KXpRmrug4Hpnt+1f9p8mr+PzzNqLs81r3LERW9nNHmJJIx3BgadswtEhfdcH
         jB2PHVsLi+I3bgBl5UpIxNZ2hVOLLonjQ3zOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753346942; x=1753951742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sYG8VsHkclnJZZxJPM6QFhYHgIPjI7tE21PvD0ROBg=;
        b=Q+nngLD5fr9/5C2Dpy3R7yTDvzASsDAKiAxHvpB2eYDbyBF/qG/3aknjNAMRxDW0qm
         PgcaS/tWA3c0PpTapHgeA5QuwsbxHBgrwGtsrmt+vfobzGQGoMSAy6TZcLwnuYoujkf/
         VaJxzlYQge/MyGcXkRU44bZrcj04TePpsn4xfov19b8cmKKIX7L20shDNNl7JOgduimK
         QOJUGyCA/5EqK2n7rEgy8v5reQ81YX189pGaIexUzpF6IO521wkYBodCBWeKNCudyOGJ
         n9j4gOA84X4/wbHQlNH0sUzX7Lf2wGETUfsxsI9kMGloBsHfaIxNR56T/x1H1kqmaqLa
         bpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo2ChmY9UVwQNW25uDfzryCS8wRmW5SdbkAQWvrcbl0u1reCzhHn6+BzU5yALCbDksQYigduGEPXH2VpHpWqayhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzez2Kf6hkPjQlBZ4NkqGGcLeYeoDjyQqlqKyANnmD/S+JcIDNW
	ThVH9Pb7D/lt4tSq22E0cq+FdsKLgKV5deb4aHBtpPuGdnw9v4PNe6Az7ubBE8Tq1Go=
X-Gm-Gg: ASbGnct8FHMQ6VPXTp5HFVPj9i0gtG50gijxfmiqelEICH3VkaChRtnZD44WlW90FYx
	o8FakzP+xGT/HMzllawYEYIEtEJipjW00f59LII8v8LyLUfsLbrUBSENbbEiz0bzNeQxzlW2uyu
	gWVhZAc52Iq/ycrQQuZhDCgiiNMUJIIOFEWi0r0eIfTVQ53r4yfDFvNK3LjrxrK26woOFPIiGh9
	lBKIgp2UcEInX3JWIvR6/1zKI2C52R9ZhpNmvcrrD6RfIRz/uiFk1j2iVQVXEeq5znx1DJ2lLv2
	deExgF+zoNJo3SuDowtUdjAXDC7rkZ68AB/I5oFr6aIUftWGxZnxTPztIlhiY4ezkeyaIcYDzso
	u3K7z0gzen54PMNbTCNPOh4+ne3TNxWZX8g2uxfLl/xiXajRlGPQlu7vSN2xZ1/k89eI4s1uKtQ
	25igcrxNzxFxX7ht+CIio=
X-Google-Smtp-Source: AGHT+IGGzLfWVQBBNqv0d/0RM8yeo/okkbUarFqx65+mRKhn19PsH91dAvjBfCsl2Emr2GkVH/VNng==
X-Received: by 2002:a05:6000:2002:b0:3b7:6e64:bed8 with SMTP id ffacd0b85a97d-3b77137d611mr1014667f8f.28.1753346942413;
        Thu, 24 Jul 2025 01:49:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:baad:fac0:4458:968? ([2001:8b0:aba:5f3c:baad:fac0:4458:968])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc605afsm1459271f8f.9.2025.07.24.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:49:01 -0700 (PDT)
Message-ID: <87ebfac2c9a92437785cf7abf24fda9405a984d3.camel@linuxfoundation.org>
Subject: Re: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M2.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qa-build-notification@lists.yoctoproject.org, 
 "yocto@lists.yoctoproject.org"	 <yocto@lists.yoctoproject.org>, Pokybuild
 User <pokybuild@yoctoproject.org>, 
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2025 09:49:00 +0100
In-Reply-To: <DM4PR11MB7760B9AA59C54498E0D234B1A15EA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: 
	<010101983a5e30f8-4ea5cf3b-f053-45ed-add0-f139865ee87d-000000@us-west-2.amazonses.com>
	 <DM4PR11MB7760B9AA59C54498E0D234B1A15EA@DM4PR11MB7760.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 08:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220825

On Thu, 2025-07-24 at 08:40 +0000, Jing Hui Tham via
lists.yoctoproject.org wrote:
> Hi all,
> =C2=A0
> Intel and WR YP QA is planning for QA execution for YP build yocto-
> 5.3_M2.rc1. We are planning to execute following tests for this
> cycle:
> =C2=A0
> OEQA-manual tests for following module:
> 1. OE-Core
> 2. BSP-hw
> =C2=A0
> Runtime auto test for following platforms:
> 	1. MinnowBoard Turbot - 32bit
> 	2. Alder Lake-S=20
> 	3. Arrow Lake=20
> 	4. Meteor Lake-P=20
> 	5. Amston Lake
> 	6. Bartlett lake-S
> 	7. Twin Lake
> 	8. Beaglebone
> 	9. BeaglePlay
> =C2=A0
> =C2=A0
> ETA for completion: Tuesday, 29 July 2025.

Unfortunately this has a failure in build-appliance so I think we
should hold off on QA and aim for an rc2 with that issue fixed.

Cheers,

Richard

