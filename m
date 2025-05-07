Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8890EC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 11:18:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6009.1746616686598769196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 04:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zc3L8Cl0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-440685d6afcso59726915e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746616685; x=1747221485; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1GI9IBP51Q0Ph5LU9IwRi/UXzddiz/xuqG9D2motu6c=;
        b=Zc3L8Cl0RZUp/UjncjdMI8XUcefU0kHw5G5LqCAeqO/OMnlkaDwg7OU6buwWlGElAa
         lSU7XqIQhorodzEUN2t+Ar8KFh6IyODBBcso7lQnA8yVgIM1w9V+HL5uJD2vgHsKjF8a
         3Z7R11sVd/CGpe+NCzcppncS11v+NNmeqjAoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616685; x=1747221485;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GI9IBP51Q0Ph5LU9IwRi/UXzddiz/xuqG9D2motu6c=;
        b=fiRgTk9PlRBCQeVzhv6+66dNHrEbjplYAVJwhrK6OM8J7dx5zhJWbXZXy6/illuGNh
         nlAGlmwYxCIoo+0zmAS1uGjeLPLql/sFLSHStH3mPixu7VtDqAi1xIDgu8s82/ewmhde
         JKRrw6ktzA0gsfATTZuP6PoNeCe5DA6WWMWUBm+LUyKkx7lsVpw67ijaog/1MwI1nfkq
         zaj9yk206QtCBgR+bW2tVEY+eARYzxVmdYjX2PGyydZXi+aU2WzDZshPpQOPpqr+uD7j
         5G+w9X3Yun1YKp7m+Nrh3JiABXmoX7uFRZKm23YaA1oQ7t2R05FXQVPYj2de13nElBq6
         of3Q==
X-Gm-Message-State: AOJu0YykXE5/kYAFdulFXrkxrWEps7D5kHlKEUtZ4Znr7VDO52sINZg2
	SnPp8XdbKi80h16Gxi91WF9rNTzvLt8G50cQ4wO/6BMf4tCMAR19vuxmUwkbelM=
X-Gm-Gg: ASbGncttG8McZanLTtUair6UDMbfRaOmlWb6l648qLBM8HmT/DMEK/JQ59Io9Whz1GY
	m4Czev54p4OzQ8owOsaj2MtTGIkmayMJmwdp9gDalTh94eKueJl6083O+R8VMfiNY65aNDltrBo
	U31T2D5iGx4T3SGBI8epBBysg5hcThSU2P4iZ7P0LBo6CO4s5fvevnFeSOYOH3VPuAh93G45aJO
	8irxm1rlx4jK3EOTQpxRWVUP82sZnHdVgQxc05b9W4UePPIRbF9640MNmnwf8QQxVSsxx7PRvdG
	TvtMtTrY/qNJL6Fidc5dyuxj3qUeOYAb74XU1ajqX8MlD0hWZT+lK3lRezubSnLPqUdbzlkEyEK
	94TlJkazTcPo622HXqYYg+k95dGI=
X-Google-Smtp-Source: AGHT+IEfuu4C4jMLGH+qTJmxeyjc4Is9edGG9e33gQ4KdEHYiP+LsDMnKQVOBq3Ay9b3tIojLdxHYw==
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-441d44bcdc3mr27244595e9.3.1746616684874;
        Wed, 07 May 2025 04:18:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2? ([2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43cb584sm29646795e9.8.2025.05.07.04.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:18:03 -0700 (PDT)
Message-ID: <161efc5b043277d6ca648087f9e6fcab9f72981d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 May 2025 12:18:03 +0100
In-Reply-To: <183D2FC291E34522.16348@lists.openembedded.org>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
		 <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com>
	 <183D2FC291E34522.16348@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216106

On Wed, 2025-05-07 at 08:58 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2025-05-07 at 09:42 +0200, Mathieu Dubois-Briand wrote:
> > On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via
> > lists.openembedded.org wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > Hi Richard,
> > >=20
> > > Now that I'm back at my desk, here are the queued -stable,
> > > configuration
> > > and feature changes that I have queued.
> > >=20
> > > I'll be sending -stable updates to the LTS branches as well.
> > >=20
> > > Note: once patch #1 is in the tree and doesn't need any more
> > > tweaks, I'll
> > > send a documenation update. This is the patch that we need to
> > > enable the
> > > modular initrd work in kernel-yocto references.
> >=20
> > I took this series in my branch and everything seems to be fine so
> > far,
> > except for a warning:
> >=20
> > WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configcheck:
> > [kernel config]: specified values did not make it into the kernel's
> > final configuration:
> >=20
> > =C2=A0=C2=A0=C2=A0 [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) a=
nd .config
> > val (n) do not match
> > =C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565
>=20
> There are a few, it likely depends which build built a component
> first.
> I think there are three groups of failures, I've listed them all for
> completeness:
>=20
> Another qemuarm poky-tiny:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/50/builds/1564
> qemuarm:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/16/builds/1563
> qemuarm-alt:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/74/builds/1532
> qemuarm nodistro:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/1531
>=20
>=20
> lttng-tools ptest failure:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1445

The ptest failure didn't appear on a second run so it is an
intermittent AB issue rather than anything specific to this patch
series.

Cheers,

Richard

