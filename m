Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CE4C7EE30
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 07:05:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.13075.1751180739119298310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 00:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VbEYtlWd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453749aef9eso11839555e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751180737; x=1751785537; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It7unbvLHLVOuk3ljXXC1+p02rT1p2UJxCx3tWUpsBo=;
        b=VbEYtlWdq3/0kFJtQfig3gmg7Tf+bItCEGXldPnTno3pXQ54zmOMNgtWk7bT8uh5H2
         6WCaft+L8PD7zkkYyRgjmRgysKshLbXHzUK7D25KwjhQdtufDBzXkmpDYelbgYem1xWu
         05lBCPL1TpJD1YTzxqIHVLi4IPwlRLRq6CKlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751180737; x=1751785537;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=It7unbvLHLVOuk3ljXXC1+p02rT1p2UJxCx3tWUpsBo=;
        b=Yeu86drGMMiGShJVIlzcHHOl7FrRy4AChmj30LTL+NlhAopnhuAgQynA/9y2TmgbPS
         zuJoYdVq9lhUulLPqw7553xxVaq56CADek80r8jFHX9DcTbWlsE8TjODbdX5FdCPNzDp
         2T9oYPvbj96xAlyrAnTv5RGpR1uCh6GZbDM2GFr6ZTFGDEHii5MI9a0E8s1AGVn6uo1B
         PxUq/CRBclOdMv31LV+MPEMF/jnbHVNNecDwkk4gNX5Jq8ndI7eNICiFfw5es9sGqmAv
         7xYaKzHddqXhetkhIVHEONrxS5ANpZtD3K++NWDzVdr4ct9xyNwNqz5pUdxY4m7qrDuM
         9H8A==
X-Forwarded-Encrypted: i=1; AJvYcCXCgIxiycuV4wCoHEWUyUp+dpEQlu6wk8MeItxzIQ8sAodgly711ZXUKVM2Ukdz3dHpn7G+mhtr6EaL+4KL9bFVvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqF4m+iFj5yXHQoSYPXkP0UeDJUbTy+2aDc+S6MAnBrCyQ4XaE
	tKzNS5UuImmSIUKqCJcoaVL/QcLKXoD6ovz8+nLeVwobfkOr7IygLgQ2QhZBr/9UhQM=
X-Gm-Gg: ASbGnctmFZCwoMSdZBixj0vHbZvzXPExPCDytwB+DBPBvxqCk4ki22tYK3B+lWNdaPC
	wsjWNDPSrS4bOXCjLh9l8zSGKSGjNvDfOBwvvHo21LgmJEerB4CpkZWvpzfOldmHjvLvRcT8T0q
	agaDCslUxZNE6R9ukKn5mTyJ2RvuxZhABxt9SXdv5FbOYJDM6oC26+UAksta84FzzpHKqbnLEXD
	yKWg+DEDIGse02PC2rus9umr+QGfSD5dMH9d9oaqEKOs/mDHX7rBqMOQ8NcbdA7dTa+kStczYd9
	p9WqHkZ0m9aNUMa9/qRdTaQxGdc8OA92tAcAbRwpVlg9izVsBvOL+PCZsolC9TZP6NH3tnnx24O
	FxMWSU0uUnJ9xL39ffI37Km51lLDsXcMGXND+4Q5v9HlTUtxNsCg=
X-Google-Smtp-Source: AGHT+IFqyJ8QNSfXa/Ir3HawhY6+vjJF/sqYCd+MHhhs9XFMYN607WJeZYvMQRUdGd8OOjQxeLQbZA==
X-Received: by 2002:a05:600c:8708:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-4539667bf46mr45369765e9.3.1751180737429;
        Sun, 29 Jun 2025 00:05:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81c4:3967:adbe:b687? ([2001:8b0:aba:5f3c:81c4:3967:adbe:b687])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c4acsm125492575e9.1.2025.06.29.00.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 00:05:36 -0700 (PDT)
Message-ID: <85be83126120136b7892d5bfe1ab80e78999f030.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] testexport.bbclass oe-test: capture tests
 and data from all layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Sun, 29 Jun 2025 08:05:35 +0100
In-Reply-To: <20250627063004.781560-5-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
	 <20250627063004.781560-5-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 07:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219438

On Fri, 2025-06-27 at 09:30 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> testexport.bbclass only copied files from core layer to
> the testexport.tar.gz to run tests. Then it removed
> all tests and files which were not specified in
> TEST_SUITES variable.
>=20
> Stop removing files to include for example parselogs.py
> test data files which are machine and/or layer specific.
> TEST_SUITES variable is now read from build time exported
> data store when running tests.
>=20
> Then copy oeqa runtime files from all layers so that tests and
> test data like parselogs ignore files will be provided
> to testexport.tar.gz.
>=20
> Adapt oe-test script to find "lib" directories from
> the new structure with layer specific paths.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/testexport.bbclass | 43 +++++++++++++----------=
---
> =C2=A0scripts/oe-test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12 ++++---
> =C2=A02 files changed, 30 insertions(+), 25 deletions(-)

The patch does things which aren't really spelt out in the commit
message. This change removes the target specific filtering, putting all
tests into the output and not just the ones applicable to the target in
question.

Once you do that, "testexport" may as well be a script rather than a
task as it is no longer target specific.

As I've said elsewhere, I'm not against doing it but the commit message
should be clear, and it does raise the question of whether we just jump
to that external script and remove this class?

Cheers,

Richard

