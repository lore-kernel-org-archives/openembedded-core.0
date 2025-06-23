Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E34C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 21:33:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6627.1750714409970780119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 14:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z23c7ZRa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450dd065828so34183965e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750714408; x=1751319208; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPPVse8iO8xJPHdrC3ZaRU42KQUTjmpWVyz1zmKJXec=;
        b=Z23c7ZRayVwcsOhFV5Qo5wZ0iSSzM1Rc2AZerne272TWP6+2850zU4mwy9WWo2OzWX
         EQ8cfS3P3iq2JkLFG7hWUCSUEx1rco9CM9Ae52lxpX1ONWPGEGQ/q3LM/Q+XCB+cRwBK
         r32kE6UVMsdxSN/BOkJziqa9A645fnrfnpU4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750714408; x=1751319208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPPVse8iO8xJPHdrC3ZaRU42KQUTjmpWVyz1zmKJXec=;
        b=SMTRnxlqcDwdAcNtYYXgCon+P9p7kg63AcdRnbt0X4C1ZShzxZnw5OJ5BE94gbNvhQ
         zaAisdv/oWy7D9pXiIEcrBAe+OR3V6gIR3Isb7oNeQSU5A7+wRFvokJIuYBOdnxk15tj
         9CtKBQGaUu7b1mYgbn7KAtOSu92pTHsSBy/6gAKmza7AvDoRT9shEphyNjTnTzpBvy3n
         64SN1YIOoRkVo59q7E6ex3fa9mPcl7AwvGog1kMPO+r9JMmozlq10Fb3aUfiyenpAPzi
         Hep8DXFHfTnUcZMbTK/zAsbZz2nHLNrxR7nCibBEe5UFXFYjs7f620bHsYFHMPh2LxNq
         TXsg==
X-Gm-Message-State: AOJu0Yx+wGH3bS9sVInTF+JMD61YG/H1/JsApOWt0DIeWO9eUbdRxGbG
	NtWBybOBhx9Qc/sMvyTmVfBO57O0bd6gsawFgyTh2Zru+ro2mLqb6CxxB++uLfD1pFI=
X-Gm-Gg: ASbGncszN40vpWmTZB6LqxdAq3xhkzWN4jNOGJtq2fQtBlnkr7orQbhCVx+XO1ZFkzd
	G9W5d+P58uA0UyYW5aUTh7Jx2qTBTGvJvnnThFGVtt8bg6MalKDeJ6pQTbYPdY4kN5p5f7nzc5l
	tSVaObZGhfFmSVYjJs0GZXxES1zzUfI2obIyupgfU6lf1ZKkqb1jePbG28AL1MW2/y6U7UicS/j
	HpWOOjx8J0qZiNw8M9fWT2X1jzeyMHHYfkJ7ddOyeW0KR58X2ZyBBz/u38HKx52eByAodqYnBSk
	i9oVpFuzR34NEdKUI8V9vRjXurkaJKVyQsq/JNPZsEDTT5lXhOdvaV3ncTkMgXzSJrl5pxFbBsR
	no359l8hInu2fZGQKJ4ZC3Ad9I/liZd3LgHYYFZAXcKTjuqzgl5kywM8obtq64w==
X-Google-Smtp-Source: AGHT+IE1cZxCOo83JEhRrmp7SdhKl9fr8mvF8rDtsqhipogxbthrZ6ADpwOYL9+GDSC3XPrdJIQCxg==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr106647455e9.20.1750714408387;
        Mon, 23 Jun 2025 14:33:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a? ([2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470415csm120902935e9.31.2025.06.23.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:33:27 -0700 (PDT)
Message-ID: <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources
 in PKGDESTWORK as json
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>, Yocto TSC <tsc@lists.yoctoproject.org>
Date: Mon, 23 Jun 2025 22:33:26 +0100
In-Reply-To: <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
	 <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 21:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219223

On Thu, 2025-06-19 at 08:23 -0700, Steve Sakoman wrote:
> Since this is a feature addition the TSC will need to approve it
> before I can take this backport.
>=20
> I've copied the TSC so they can add this to the agenda for their next
> meeting.

The TSC discussed this today.=C2=A0The change adds a single data file to
packagedata based on existing information we already calculate during
the build so the potential risk and impact on existing users is low.

Whilst this is a feature change, the uses for security and handling
CVEs are extremely useful so on balance the TSC thinks this can be
merged.

Cheers,

Richard
(on behalf of the YP TSC)

