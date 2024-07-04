Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FCDC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 19:38:12 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.3200.1720121887622070476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 12:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cneKJ7RO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee90f56e31so6335691fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720121885; x=1720726685; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2EF8miNQNY3XTCVQQsueahmjmXl8KEHQ/CY05lgp+k=;
        b=cneKJ7RO2VefpUNeMr8RXV+RYAerNv5jKMGmP/UdDD5sWm9tXH+sVpDWNYCvxUcNA9
         YOjzDHizo1G5FON2u/oJ2k1k2MlHXzACxSt7De1dLleJQBoFl+BY7GxtxiEu8l6Z63GR
         kkrrfoPxO/HLo9cxZddsw5lWhm3VW+bwpb3v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720121885; x=1720726685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2EF8miNQNY3XTCVQQsueahmjmXl8KEHQ/CY05lgp+k=;
        b=ayhQqC/+JprlcSzyKG7R1Y1pa+97qWftBoRhyqIoFFGysrv+TW2Od6HXuuv4DEDy5y
         BWDIfmqIJADa8dASlts4ZGjnPZ2C/4mGKIqQ8ydxWvsyClDyUfrZBfXtUvXmY8vpv45N
         Fw/3BctADh/nR1UYI6vyc+PP9B32IhRcUVLJiwkQS4XgNkTGxUvnKtXlXSJk5OTrNXPI
         lfd2IhFvyQeipRRVb2ntDOwSREMhPgJKxURMQKID7g9aajdc5FmxgLlMm+/UreCkqE+W
         Bk7e2AJFwtKwdV6oCsf/Ll21SBlIYftuBIQtNqGemyT4jWS7Lmtzyukke1SY1K8zMUAs
         JlKw==
X-Forwarded-Encrypted: i=1; AJvYcCXsw/cQWbrj4KelKbVve+oVPQCqislX/Lco3V/UsmpQKRCgzwQAnyxmMUCTygJ/vv6lCC5jEQbV5ku/mxbpJfdT3xjneke8T3jStZSyZZh/zUe/7INbNaGC
X-Gm-Message-State: AOJu0YwHixsWS1WHIZmOqh7R55JuErJDVfU29y2fqbzp8qpvBZ9RPGMY
	fGw5LSSz/5QGm6Ef6HAdBoOwRYZ8T/jiwnE7zfwBaGBq3JkPoCZN2SBnMZP6aSQ=
X-Google-Smtp-Source: AGHT+IETrNEhV82DkwlstDR5QLqL4GqN0FbgmC7mIVXYJ+Y/lPi2HB1v27t/oXBaJ1A/tLjwueWBTg==
X-Received: by 2002:a2e:96c6:0:b0:2ec:681b:5b50 with SMTP id 38308e7fff4ca-2ee8ed22754mr18600161fa.11.1720121885412;
        Thu, 04 Jul 2024 12:38:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:51b8:7897:e495:c586? ([2001:8b0:aba:5f3c:51b8:7897:e495:c586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d0b19sm35082145e9.10.2024.07.04.12.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 12:38:04 -0700 (PDT)
Message-ID: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: do not pass O=$B, if $B = $S
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org
Date: Thu, 04 Jul 2024 20:38:05 +0100
In-Reply-To: <9e5273afdef2797f48970927998cd5f6d5b1e63f.1720120588.git.joerg.sommer@navimatix.de>
References: 
	<9e5273afdef2797f48970927998cd5f6d5b1e63f.1720120588.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 19:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201585

On Thu, 2024-07-04 at 21:18 +0200, J=C3=B6rg Sommer via
lists.openembedded.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> The u-boot Makefile (even v2024.07) doesn't like it, when `O=3D=E2=80=A6`=
 is
> the same
> directory as the source directory and complains about a dirty source
> directory; see below. This happens when `UBOOT_MACHINE` is set and
> not
> `UBOOT_CONFIG`.
>=20
> ```
> % make O=3D$PWD all
> make[1]: Entering directory '/home/joerg/git/u-boot'
> =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_autogenera=
ted.h
> =C2=A0 Using /home/joerg/git/u-boot as source for U-Boot
> =C2=A0 /home/joerg/git/u-boot is not clean, please run 'make mrproper'
> =C2=A0 in the '/home/joerg/git/u-boot' directory.
> make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
> make[1]: Leaving directory '/home/joerg/git/u-boot'
> make: *** [Makefile:177: sub-make] Error 2
> ```
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)

Can we not just always ensure B is set to somewhere different to S?

Building in S is generally a bad idea and we try to avoid that with
anything that supports it.

Cheers,

Richard

