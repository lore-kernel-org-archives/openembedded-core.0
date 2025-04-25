Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE1CC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:42:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1424.1745563331497112691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DcYN/Jiw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1671160f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745563330; x=1746168130; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dga95sk/v0dZSQznrguo2CMtDbY9dkvu49FOpPhvEZI=;
        b=DcYN/Jiw4/At56tBcPcVV3TCyEEsPS6o6tRowx0Mnf0+hTBxNydH0bx6UHnixolTfX
         kI8nA86CgIsjSV/U08sq7OJfCEaHyLXeOVCty+h7sucP9AD8robovHXL38+N9cwNPjJA
         grw1nC1GpzcffjlaExx88u+ba+RPWuV8/3O6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745563330; x=1746168130;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dga95sk/v0dZSQznrguo2CMtDbY9dkvu49FOpPhvEZI=;
        b=fa5GMYqAxBWkJRlzsPUSK2beRIO7JQR6eqBTNlXlO9ElJJfhx/At8hFNx7qyih7t2v
         XQWxxVoYDYXH5JTjeAnrFDlXDwWylie64AHdJhhqwqMWtCd1nJ0rgo8BebxwriTlN/pa
         adarOd2GFRKudWDybfl0i/dK5FCkaeRXb77c4+0FDLo/LEpgARuzv+G6A/JvuEbhghKD
         XK+As4qqsyqyMfoDmbs+QXcPy/W7HclB8BAi1YPsP1T4nL6r88dJb8fUBoyE5Fy+14R7
         vheyGor2embs4oDHrVyVWHkC5atON+hQp6HAVLymEvNKKVCR2u+JvCAtgqoglT+72b9F
         Julg==
X-Forwarded-Encrypted: i=1; AJvYcCVDKKiwtF2bWRxetaJ6ctO0zV7AkyY/FDmD16/q2KKZYutzeY0kur6wGYZ34UdKfx95WlFrYHrpHjZJ3uAIZBKYEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1+0N8SzqYDtQXV2PkC7AMl2JK8gnTOXUuTpcgelHW9XESwIR4
	wfl2K7bmMRpNHVZ+vaUQMThZYWXEc4DxVB1ott4x3PkBS84up2DZx/Zd8pyIMqk=
X-Gm-Gg: ASbGncsGarCE1E4DUhoa2Vy6tvKeV6nbAOc6Q3dJPC7mz8JvRjr6oavkmBUiVnHB+Vo
	iSurESugG47rOnXAPYkzBp0t8Rfu7M+43S52DKiP6esBYKNktUyPlkiyfTmiIJtpgZ8qGcCd8Fx
	rvoDijKieDykCNFCb266xJ+Dp8fQuKVOwAeYek1TZTe6rW4jG9p3WZGMrbmhb/Ld9y9vl+SsN+g
	Ov43cq7/GqNlifwBNa/HlkBZ8DuKuBXQGkqDPkEqq5THD/kRqdIafR6h/qbBEkGrUFYhkkcVNKm
	9WpqikYxzBMULkzEHzWYVo+40FCRDiexKghh7ey1pOqaCZEVzfqNjZ1C+ZyniytPTC307c2wBfu
	SOnqztk/rrCtf1R7WSkU3TAJM+aF6PA==
X-Google-Smtp-Source: AGHT+IFA4Vo2P6RXk+xJKc6uVMrjs7gn0+2UsjQEVJGhfsVifiK/O2zValeca/lk9Jdy0R9WmxCRug==
X-Received: by 2002:a5d:5885:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-3a074f10d75mr698705f8f.37.1745563329783;
        Thu, 24 Apr 2025 23:42:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4cbcsm1383560f8f.25.2025.04.24.23.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:42:08 -0700 (PDT)
Message-ID: <8ab17e2462bcca79323eec7c7bbde32dc7238874.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install
 under hosttools
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2025 07:42:06 +0100
In-Reply-To: <947fa28b-20a1-4367-84b2-a2332381064a@windriver.com>
References: <20250422130702.1337476-1-changqing.li@windriver.com>
	 <d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org>
	 <947fa28b-20a1-4367-84b2-a2332381064a@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215428

On Fri, 2025-04-25 at 09:25 +0800, Changqing Li wrote:
> =C2=A0
> On 4/24/25 18:33, Richard Purdie wrote:
> =C2=A0
> > Does this work if you just use:
> >=20
> > ac_cv_path_install=3D'install -c'
> >=20
> > ?
>=20
> It works well,=C2=A0 bitbake icu can build successfully.=C2=A0 And it can=
 also fix the original do_package_qa issue:
> =C2=A0
>=20
>=20
>=20
> in function remove_build_host_references, only hosttool path is removed('=
s:${HOSTTOOLS_DIR}/::g'),
> =C2=A0
>=20
>=20
>=20
> so when install under STAGING_BINDIR_NATIVE is used,=C2=A0 qa error happe=
ned.
> =C2=A0=C2=A0
> But if use ac_cv_path_install=3D'install -c',  the actually used install =
maybe under STAGING_BINDIR_NATIVE or HOSTTOOLS_DIR,
> =C2=A0decide if install is under STAGING_BINDIR_NATIVE when do_install is=
 runned.=C2=A0=20
> =C2=A0=C2=A0
> So I use '${HOSTTOOLS_DIR}/install -c' to make install under hosttools is=
 always used.
> =C2=A0

We use the tool from PATH everywhere else in the project so it should
be fine to do that here as well. I would be concerned if that tool
behaved differently between the two and we'd have bigger problems if it
did. This therefore should be fine.

Cheers,

Richard



