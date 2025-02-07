Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9615AC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 10:25:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.66579.1738923944611212491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 02:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkbE3xOn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dcb33cba1so206648f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 02:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738923943; x=1739528743; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39tHPfh2M0xFVznirGL/wGKIJIVnfld790w1nU+oEdk=;
        b=PkbE3xOnNVpZBaUHfF38KPluuuzyOg4pSy6U/jHypsBV9IYAWSzYLzFqOnOZyVbaRw
         OLcGTxMlL+UxkA058i9YGvCXPd7mwkBMGkmUXqxcLbEEAgJlBBRQSyP8kcznl7fpG55w
         tMhSMWaEzMpAI7Wnbj1XpvHosHsWz+efERxgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738923943; x=1739528743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39tHPfh2M0xFVznirGL/wGKIJIVnfld790w1nU+oEdk=;
        b=XxFXxHrc1cvZlpFanSwa3E0Zl9+qPcjGDcEWpszhAHKmdTgb/oHi7oP4V5XhkMtzvu
         crQdiFWuENrmdHwyc4V4jzXdGJnyzI4XF9GVOKVnJ6xEQSnaMLLRPw7olpGA5tzrkY15
         S1FoKGMXTXRz5TkEXXBcpnQhZE/gNq5vKXjVkRLR+EIBDhV+BxO62dEkPo5EhEURoZY6
         tRJSmjMIa/oxFoFaOgWUZ7nxJVWjfv5/VW3WglAh9ZsdPKM8qf8t4RiTn+SeXFrkZAWd
         BvKLpOWuqX6uOMI8bnIMN2n/aiBVChtBN/V4gD6T13aZrhqo9u3XPAG2Agb0UOx7ci1W
         qIKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLCt/eNZlpez4Umpcc9/LXF6AVIYmoZdW2qeM5wR4gWt3M4lUn8vNGwjlMszQGJnS8U9LUhB76mLW8hQgN5NisZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywg962zKN+qoBYSmph4QG0CcF9rpuRuQ5RDu1whzZhPJdX43yFh
	3zSaf7FIk+VNa5oIDyTxa9W5xX52kyHqmC7PSYbCyIBCdgj0T4LaaJfJNY9DDHc=
X-Gm-Gg: ASbGncvana7haoKLwqkWh/JxDQ8ebZhde9VJqCgGssjndIAieT9XwwqS/oANWh5vA5N
	JqjMdMDNMTnE/aE9TNG5sgSB3nydFbXsTW/VIQi0NWZOfmWMO4zBDXvKtTaeb1oC9sUlxcmM3aZ
	gq5y5DbIOfDRIImoE4kgR0JBV0dOUvF8mbNPGSlMdHvlElJRT3ZvBsL/ijzoprPSzRZD9t1GrPl
	5BawDmWUIpWFKYqL5jUq2Xe3WRbxJY9d3Am4buSAI8vCKLTzLvuYeiZtS3USXCzs1xPAHcIZac5
	Ne2YX07I3c/Bygm0GJr6E0H+Jx7pqgX6YFZe04uUfey8MIpjER1zo35dkevHQKRTVfeN31uvguX
	47rFk
X-Google-Smtp-Source: AGHT+IFf3Ma3KH1ysE85ZPML1A6xvftCbPgYfEudvneqDBCLX6eN56DPnKX/uTjpsDbwDEk/Yn+VBg==
X-Received: by 2002:a05:6000:2a7:b0:38d:b448:65c4 with SMTP id ffacd0b85a97d-38dc959fec4mr1678859f8f.55.1738923943006;
        Fri, 07 Feb 2025 02:25:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm997385f8f.9.2025.02.07.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:25:42 -0800 (PST)
Message-ID: <3e8003570397e8eb864a55cad9a2f8668d114112.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v9 1/5] rpm-sequoia-crypto-policy: New recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 07 Feb 2025 10:25:41 +0000
In-Reply-To: <20250206114547.3441965-1-zboszor@gmail.com>
References: <20250206114547.3441965-1-zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210979

On Thu, 2025-02-06 at 12:45 +0100, Zoltan Boszormenyi via lists.openembedde=
d.org wrote:
> This ships a crypto policy file for rpm-sequoia.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0...1-Make-xsltproc-settable-as-XSLTPROC.patch | 43 ++++++++++++++++=
+++
> =C2=A0...002-Don-t-use-hardcoded-python3-path.patch | 41 ++++++++++++++++=
++
> =C2=A0.../rpm-sequoia-crypto-policy_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 34 +++++++++++++++
> =C2=A04 files changed, 119 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-cr=
ypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
> =C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-cr=
ypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
> =C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-cr=
ypto-policy_git.bb

The new recipe doesn't seem to build on musl:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/969
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/985/steps=
/11/logs/stdio

and the policy recipe is struggling in world builds such:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/958/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/956/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/956
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/887/step=
s/11/logs/stdio

and in reproducibility testing as a build failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/993/step=
s/12/logs/stdio

Cheers,

Richard

