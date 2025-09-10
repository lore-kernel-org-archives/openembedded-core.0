Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F391BCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:29:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.17980.1757510938484596536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9Wp/aff;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso1671455e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757510937; x=1758115737; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N/hxVcNRZo/Rl/US5ekEeegdTOhsrWyUR53KlSdUa7I=;
        b=W9Wp/affeFfMV0+1cX0Smzb0F1Mv2WvoNjMPgnTKc90djcFSNmgMKBNCFjb9Pu3NBl
         2HiBaLxNVgV1F4CfeqAg0FXeABdZExvbXpPLpFstiDCCkwM+GXLAjR1Xjv3+BgwkumM8
         gzPQfMf+YtyAWcs9B/x7ByXuvtkiQ+xfG45yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510937; x=1758115737;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/hxVcNRZo/Rl/US5ekEeegdTOhsrWyUR53KlSdUa7I=;
        b=vlBPOpXVEH7amifPIyyRWXuPao+7YywUDZrTErIHrMEChPnyHE5KKyGry6vcM81oPQ
         XM2wwz2uZVGElbIarbNTFgm2Ygog2IvgjJsUGSafWv/h5TABwe3R+WWx5Fj+JQOtx4S8
         vPAXRd3FGpSnvOjJ9Wmpwo4qkzfHkxML4YbQ2l8pspmwexfVrF/h6tkToW/m5F9rJNzT
         8vnMpx5tWO+BirDPibLFd08eUSTpkt72EiWe1Lczbc7fHXYGpnLAm0qVTFi1//LjFAXe
         YJr+PiYhdjnZ/XXYZmxKgU0T7gKb8/QS2OCbOf9WsXv0ejDalI2xVvJTeaaDAaKoiWso
         bryA==
X-Gm-Message-State: AOJu0Yw7sHAWT/2LVoRSdBlosSTZzB3gcni9d7d0Do8H0z7LeJ51rhhj
	j1rufD1wJxU7ukvolPSOrgoXttRdF7vXn7+OS5FXBmR8lyqqpFwUQHovA50e/W9ILDU=
X-Gm-Gg: ASbGnctBbjvhN2BF+uM//UG32PRoK8xtcFY9LcEc8pvknJjoq5lQ6G/GzeF7FZhti2q
	1/sA02FI6xulSdBNuFJkM9IUra6T30ExBU/vAMbEn+pQYV4jf3Jan+fJU/oGcliHR5teLwE0ZEd
	2CHTILcaWGjB1XuK5a0MTtedUIDCnSFdNMeJD2HjZTR2bmBJ8/ylIeONKGbvX58x94ep41BpU6R
	ODJqW5elJT4mNvi8mCmcLGk4H991mPEw6vwAx7kEw26xTi5JQqrf0EFQRuCLXNVRBoFPRvw7DdA
	EYhdpCq7DoncrOH6delBT8EddVQvtVkgi6Oh79RBh2SdI2a8uFEqTEgYwLargXI3cXGspIVHzh3
	ksVoc2QtU4fwAWbS97hFuJILlURM0Kk1hQhJPJ2X7zsQZpVch8bv8oh0SPUtiaYifLt7+2oMKxW
	+virmHThgFTX671SzbJjG3YA==
X-Google-Smtp-Source: AGHT+IH/Xjc4BFwGE30xghfgwvVlsloCbBxJp97BG5cVDjYckUSCzGt3uYvvHeRzlpIQ+FOBCE4dXA==
X-Received: by 2002:a05:600c:3103:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-45dddeeaa9emr150920595e9.31.1757510936800;
        Wed, 10 Sep 2025 06:28:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8? ([2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bfd97sm6678555f8f.7.2025.09.10.06.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:28:56 -0700 (PDT)
Message-ID: <9c6f4b6c0b3123efbd81349d6f29bacfffee5a2c.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Date: Wed, 10 Sep 2025 14:28:55 +0100
In-Reply-To: <aMF8jgdGtg6M0TAj@nuoska>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
	 <aMF8jgdGtg6M0TAj@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223211

On Wed, 2025-09-10 at 16:26 +0300, Mikko Rapeli wrote:
> I missed "poky: bump default kernel reference to 6.16" from
> emails and can't find from list archives, but it's leaving
> "poky-altcfg" distro with 6.12 kernel. Is this the plan?
>=20
> When building "poky-altcfg" distro, the machines can't override
> kernel version. I would like to see genericarm64 systemd
> builds, e.g. "poky-altcfg" distro with the new kernel.
>=20
> Plain old "poky" sysvinit without systemd, udev etc is hard
> to support on broad range of HW. Thus I am testing genericarm64
> with "poky-altcfg", which can't easily update to 6.16 kernel,
> at least without https://lists.yoctoproject.org/g/poky/message/13742

The policy has always been to test one kernel in one configuration and
the other kernel in the other configuration so this is intentional.

Cheers,

Richard

