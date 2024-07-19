Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50297C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 06:49:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13361.1721371763634307054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 23:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NvaKxx8e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so8268295e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721371762; x=1721976562; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7TLtuZjvQ4mH8dM6w+m2CGUR8iAJInN44B1VhgFZLoc=;
        b=NvaKxx8eSoX3fYC99bTk+kDjm6egao2jn1ULgbGDR95eGvRidV7br0pi+q76kLPFXf
         n4b4XlOYp2pZsW4QfFjuqO2wgXQFm8rF5kIMYw7faO7rxjvlbJRMFHUWV1kU38oz88Gz
         LPey6E1myJvAodiXmPegzCQ0up+p9D8a+5v5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721371762; x=1721976562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TLtuZjvQ4mH8dM6w+m2CGUR8iAJInN44B1VhgFZLoc=;
        b=uXcEIdrSt2rRjfejnqMCA1LThmdmx88xQYzD/kyJe56pUartRSLxd4HKstJYs9tAoH
         pDyN/AkzeUWHgwf7yR6P6mo2Jk1xcT7xihRHMTw6O2dMf84E338a2atHyWpRKcOkUihI
         F5aVMNpiZhH5+pMZKNzwfkNPDS4z1IubpFzzYYY7lRCr4Pkho5fLnvwBSsK1G2ZAMnlO
         lKGHuYzxcMEevYiHRj2RlcYYm8KrFP+w0Ev2FiHogI08LbnK33QnGnxz5hRrTDGiyJui
         TeyTapKReX6irMS3g6eljIMVCwOkYEE/eG28H1J97NUCaIhkBXTDWks2ccZe5zSR+60d
         Zkdg==
X-Forwarded-Encrypted: i=1; AJvYcCXa4dVDSJtIxWaBzY+aYJT6tMkAIQ5bQ+H7qWpbHVQcJ0N4lLhShnH2Kjr1XYKNbRnRGG4/BN7C3P9FfKK5gyTf76cuDpeOnZCaPwHahzQNVA5fxoDcVzFk
X-Gm-Message-State: AOJu0YxTortu2y2dV++UglTSaFROMqmLIlwipov+OECzrCYzqOq4wWib
	qwA67xvv8Fa6rEF6nBguetngJr/0S3scCshnpnH41taWgR8aKX7hlLyb/rVxpK8=
X-Google-Smtp-Source: AGHT+IEpFyEL86bJjhKboEZOF7+kOPOEjjr9z5RCzqFQ7EsdC0eSJKbbXAroW1juBeOXV93lWQ434g==
X-Received: by 2002:a05:600c:1c97:b0:426:5269:9838 with SMTP id 5b1f17b1804b1-427d7281eb8mr6238055e9.4.1721371761953;
        Thu, 18 Jul 2024 23:49:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a3b6:f332:43e1:b3f5? ([2001:8b0:aba:5f3c:a3b6:f332:43e1:b3f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6934ec6sm12683985e9.41.2024.07.18.23.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 23:49:21 -0700 (PDT)
Message-ID: <a0074123bff1eafead40e16f30c19d48d273b58b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/4] selftest-hardlink: Add additional test
 cases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Date: Fri, 19 Jul 2024 07:49:20 +0100
In-Reply-To: <1721345282-10901-5-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1721345282-10901-5-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202251

On Thu, 2024-07-18 at 18:28 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> Additional test cases for debug symlink generation both binaries
> and static libraries.
>=20
> This also has the side effect of testing for race conditions in the
> hardlink debug generation and stripping.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> =C2=A0.../selftest-hardlink/selftest-hardlink.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++++++++
> =C2=A0meta/lib/oeqa/selftest/cases/package.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++++++++++++++
> =C2=A02 files changed, 37 insertions(+)

This caused selftest failures, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6984/step=
s/14/logs/stdio

Cheers,

Richard

