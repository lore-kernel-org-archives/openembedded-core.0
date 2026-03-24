Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEE3E9A75F
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:26:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16359.1774347971841264676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JZBNn7K+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so1902756f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774347970; x=1774952770; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1eHD+Dy+1n5ezUt2fe28p1BuVhKURq1GqKlu2R2URsQ=;
        b=JZBNn7K+11VAif1jCcS+YAtEInQMcOe0gXyPDExzimR3ihluDbYo7itvLvsu/NeXDs
         scZCoDx9I9xlMIqxPTl1k/Tdu8xnUUp/3kxctq4aOiVP7AfQW2l8x/jCdyYMxtyLtDLr
         vrgbPLpB0D6jjQq8teC6D/EwCLpCZiN96SAeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347970; x=1774952770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eHD+Dy+1n5ezUt2fe28p1BuVhKURq1GqKlu2R2URsQ=;
        b=e7pdsMnvUI7O3QlXqGDyBhjXg+vvhi34zaJ7lgMRJPmvtZMnAJG8+dCjsA2NwmTo1n
         y/Q6unFbEOfLQXAtdzUSY2UcYFZSajzE9EHr8XgbNhSaVmXc6mXIj2jNZEwy9sg7LKtS
         twXrR+9eOHKED0+ir/sF4WcZTgsJvZi3LX9hHXa0OvF5EKZ63gQxsgj6yc72U+r46gIW
         W+D/TuyftIDgWhwcr4x/Uuz0XMIa+LOa/eBiJKQ+qIYLmYP9ZiXzbwQUiQ0fdapoV14/
         SR4H4k4Bo12j45inTwbdVxwKK76POxiftxeNXIiWlJ+uJBWph4ESK5TocEYsVyxUk3Xl
         e8iw==
X-Forwarded-Encrypted: i=1; AJvYcCXyyNo0pN63vDemVo36ekES6siZDD1J38Q6xhpLMd2O2vzztz2Pedh76LBEyevWV7DvXSGZ7vJtx/k8dXbXjuwz5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7VHiOSoBdtSm3GtpH9hD6n9nyu7jrkbbgL1vbmjuXK2OlHAAD
	5Baj5I4Y8TIqfWiXMdlMWq0hvfQs2UiZwIurVi5KgXeXONp8gbiMCD5pTGvs7IsQJK8=
X-Gm-Gg: ATEYQzxeYqM6ZYyAL2aFq9702ORowv6iP1MPaLW+FTW9VN1Y74S0HpNhFMeKPQBpiMK
	IW4ZzebevkeeptnA61rQYGh8tSELBLBWdq8NN9s0RxqsEHqxN22nKnoC9lfAkfZbtAc2Skt3zBZ
	gokAvTm3/7bneAgydKkBtpYRfJGvBuZuwZLB09dfYu+m3TQSZAH46mQKBogvHLCxyO3+5fXOhTe
	ghXG7zHXdVqojlqKT2Kjp4tnlc0EhPXVX73/+5JxzMOKSIAh1ahVvm6KcHf+MXhCftKQ58ltO9a
	Dv+8m0fwlHNBXfDuiqUGUe9miGH7Fy12ApcIHdaTF+7tt9Ha7CMaA26KbQWdrpRGIQW02a3gICe
	4SSqWBmWMtYW+1n0Yc+hP/O6c92O3WZeNpReiY6VZ+hrRmmYziHTAa/55RfpMIoQBUXNeBp7TU6
	xKkD9slH4cVhvnqke+ktIDvKNA2eXDFqZm5MHp9PQbYmZ6Lw8yvEx/MMRqBVfY1WI0eZaDHVcXJ
	DTf3xaKZSLcdwr0
X-Received: by 2002:a05:6000:26d2:b0:43b:3d9d:bf4f with SMTP id ffacd0b85a97d-43b64281adamr24755923f8f.41.1774347970216;
        Tue, 24 Mar 2026 03:26:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a42d:49b6:a690:7df7? ([2001:8b0:aba:5f3c:a42d:49b6:a690:7df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm37033250f8f.27.2026.03.24.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:26:09 -0700 (PDT)
Message-ID: <408cd407250a349c0ec89c2e695aaeffa4eb0670.camel@linuxfoundation.org>
Subject: Re: [PATCH v13 4/4] oeqa/selftest: Add tests for source download
 enrichment
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefano Tondo <stondo@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, jpewhacker@gmail.com,
 stefano.tondo.ext@siemens.com, 	peter.marko@siemens.com,
 adrian.freihofer@siemens.com, 	mathieu.dubois-briand@bootlin.com
Date: Tue, 24 Mar 2026 10:26:08 +0000
In-Reply-To: <20260323210745.1337169-5-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
	 <20260323210745.1337169-5-stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233782

On Mon, 2026-03-23 at 22:07 +0100, Stefano Tondo wrote:
> Add comprehensive tests for the new source download SPDX features:
>=20
> test_download_location_defensive_handling:
> =C2=A0 Verify that packages with no download location (e.g. packagegroups=
,
> =C2=A0 images, virtual providers) are handled gracefully without crashing
> =C2=A0 the SPDX generation pipeline.
>=20
> test_version_extraction_patterns:
> =C2=A0 Verify that Git source packages get SRCREV as their version in the
> =C2=A0 SPDX output, rather than the recipe PV.
>=20
> test_packageconfig_spdx:
> =C2=A0 Verify that PACKAGECONFIG features are correctly recorded in SPDX
> =C2=A0 build parameters when SPDX_INCLUDE_PACKAGECONFIG is enabled.
>=20
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 104 +++++++++++++++++++++---=
---
> =C2=A01 file changed, 83 insertions(+), 21 deletions(-)

This seems to be breaking some of the existing tests:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3602
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3385
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3498

Cheers,

Richard

