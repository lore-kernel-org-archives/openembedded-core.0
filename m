Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A67FC3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:25:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.12966.1721215503878439688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UueF5Z8o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea0f18500so6837202e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721215502; x=1721820302; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/v1PR97Z5MgzOWTUTtLrwlCrgizF6D5/AyQTPeHmmcQ=;
        b=UueF5Z8oUJsYIWi+Ic5tP5F6tYj7ebaZXeEX56LfqU2Np84k/ws7f38NXDMgdC7yt0
         513pJelwE6fjWd3bZS8WeGMG1C+6Onf9HLT86Z2wjCmQrVd0GVDQF0HBWh/1XVjkPrV+
         9Bxft1bMLF//etm2N0loozJLBMfXw5Ga5aSuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721215502; x=1721820302;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/v1PR97Z5MgzOWTUTtLrwlCrgizF6D5/AyQTPeHmmcQ=;
        b=TURNGtIZKvH0uJ3yUEYfKmTF78st5Q29MS2C9zpJWMJiS2yKsqiZ1/2AjrBc8Ms7qN
         mYdyGqpMycgqpXzEd3oWIhw9yLgWSRidRxUw0dYd+ml9RuAzbwlMpP1s4B3WaJ2EIvPp
         Llioa9M7juKq1oTpZ6eF+dXO554QB11/2P+Gdsizu+EU4Dl5V+5+0q2s0SA6kGePYQ1t
         qK3yzKqlJg4aZMwSOUCGYWR6GD+0EfDMiwUczbpVvx22OvmZZMDED+9SzGYE1YZEJRiv
         XJDlmtpXF1WzSdFFyOlTWzFGnnWNDWHCvbAO3FDtppRjfr5edc65Ev796cqesWylwoqZ
         w5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUp8LzJpcKBaC+W4V+pH1hnQ/PvyPxDKcRS/cdpzDjL5yL0rPM42qRIHSFyFiBDJMhK9Ub8jl/SR3sGKQfXVORppXQRX0clJM6mHclsCZhJ1u70+wtvLnq2
X-Gm-Message-State: AOJu0Yy4I1TvzBwMZGNV+HXLaQ1W3Tmhx5TUfUY2rCyYlRcticxqVJ4d
	5oOUOJ2HMB4hLMtFEXKiK5Ha94laOgpKMZpZb4ELDge+Qs96o9QRtB9dkHC0DvA=
X-Google-Smtp-Source: AGHT+IFk0hpDdVU3e5zpSzBnqhAN+/ll7NFWIfUHxGL1H2paIWbrFBCu/xcSBxgRw6REYyS8H/GtCQ==
X-Received: by 2002:a05:6512:ad2:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52ee53bb440mr1038836e87.14.1721215500678;
        Wed, 17 Jul 2024 04:25:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a16:3e6:efff:89c6? ([2001:8b0:aba:5f3c:9a16:3e6:efff:89c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb50fsm167753285e9.38.2024.07.17.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:25:00 -0700 (PDT)
Message-ID: <bba4dbd4a126e4a63bdb4f6c47c318bae4db8c84.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Revert "testimage: retrieve ptests directory
 when ptests fail"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: alexis.lothore@bootlin.com, Jose Quaresma <jose.quaresma@foundries.io>
Date: Wed, 17 Jul 2024 12:24:59 +0100
In-Reply-To: <20240717110050.2515243-1-jose.quaresma@foundries.io>
References: <20240717110050.2515243-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202157

On Wed, 2024-07-17 at 12:00 +0100, Jose Quaresma via lists.openembedded.org=
 wrote:
> This reverts commit d1ac9bb1bd2132cd121f0e80829302298d8a8a64.
>=20
> The variable TESTIMAGE_FAILED_QA_ARTIFACTS is not parsed as expected [1]
> and is making some noise on the testimage output log as can be seen bello=
w [2]:
>=20
> [1]:
>=20
> bitbake-getvar -r core-image-minimal TESTIMAGE_FAILED_QA_ARTIFACTS
> TESTIMAGE_FAILED_QA_ARTIFACTS=3D"=C2=A0=C2=A0=C2=A0 /var/log=C2=A0=C2=A0=
=C2=A0=C2=A0 /etc/version=C2=A0=C2=A0=C2=A0=C2=A0 /etc/os-release \${@bb.ut=
ils.contains('DISTRO_FEATURES', 'ptest', '/usr/lib/\${MCNAME}/ptest', '', d=
)}"

It is because MCNAME isn't defined outside the ptest images. We should
move that line into the ptest images that use mcextend, or swap MCNAME
for a wildcard if that would work.

Cheers,

Richard

