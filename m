Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8012C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:02:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10387.1787468566627476734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dP7imiJj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f6609c657so1016640f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787468565; x=1788073365; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tY8XiiRSDA12DiBJqCbg1VZnpVwgZuQaiwx7pXUnhYc=;
        b=dP7imiJj9RuBB0oKRz1chBjVtiEHmb4xQ7lryUL8PvIXwKFI6YDsYn1+Y1y0GxAK+w
         UZJUc/4wRxw7pE/IG+gp3rlORhzrAtqfJv66GuNkDnumWwHEyQAnr4YLWPnAh0XxV4eH
         /OvDI5RNhy0eeeNA2RNhJu8KGD3czFHO5bNPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787468565; x=1788073365;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY8XiiRSDA12DiBJqCbg1VZnpVwgZuQaiwx7pXUnhYc=;
        b=SSWx8yi1h68H5ePCgnjRVds3sCVO02aTpau3q7lLA9HFW4mLhNAMbiEMCCr1l7XWYL
         t0gdzqRiYhNprYzK9CJSveXNsbdmPHZ1Wa7jS0MoikcX1ruh8wkeRdxrpH9htDsprCbo
         wdls2Uvuoe6Ug4jWtcAgHF02yOynlDekgw7K6kgqEUviyOroegKV65mr+MYb/4zs+ZuB
         grRG8bI9Qs+YNRCRjqZyxAKEgJdoCgK/b1jtqaQa/Vq24o5jz6zpr00GfEzRpgtpPgtB
         qzJfC2Ax5JaDp0Bk+jkrva2Oxi9gL1rG4XlcrCwgEzrlIMCYUsDI+dnR60LY1SwM0tXX
         j/FQ==
X-Forwarded-Encrypted: i=1; AHgh+RoObuRAOvToo8spVzWap4NihiGHYv3+KGZoLcoQWLA1UyXXT3wQxVAlcG0yu6RCD7IqfNAWyXXPDwoj4A68ZuoiRw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mWaMQhFeFzDlMPC0g6ITRBzvaOkBYSpywQ4NTHq+b8H9OW2IPI
	54mTIecwwTbFVIIo8lgmyC992b9KUQOdWBB2OzTvXG2Xd0ULllQntcUaxiks5Aq/gKg=
X-Gm-Gg: AR+sD12Rj28UC8vJutP1VV07MDPrduBJtCvbFJk+bFntxPdd6WaXEl4YBYUMLs3+77N
	9k1pZlsqkvMlW7W8VkAC+cAxsdpXzV7ugZr3A0SOf3wpeRHEgpPzh8EBk53EzT0HgyIqFWJ7e3z
	W5K2yk5y1CWh24DUT+K4Y5xd9AZFtIPFQR+Bzp6MJuoaCCoy7TdGsGNXeEpyxiE5hzioPErUEbG
	WXnlyhHatf1yLGJscpcC6L836K5WNhcaNgAaBYRfiJhpYEBMG1hqR++PciN+sV+Gv8rSWZUG0P7
	NBpGVAYGYsyWcExrAo1lG7Ff2pM0kk0qiNLVwaD1G0bOeNlW7hJ5m0PVodudSfqqBuFeF/Fe36D
	ULKr4DoWKSFfe8jIn2gal10ygpfzS7xUxFRGDBZ+Nf9HTMoguFjyyerYQ91BrpPMDukXnpDGVMF
	QcEDy7yQNFNicXWMEfBPLq2bLnk3UreimNO3lrwy8/UNlb5ehuPQJD6f9qxM5Nn3OA9Wt2piBFE
	MPQBVYGkupC/03FZyVhs47W1fXAe6gauf3bm4L7Xovairg5RkfNHw==
X-Received: by 2002:a05:600c:a313:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-499bf8cd003mr101748245e9.2.1787468564590;
        Sun, 23 Aug 2026 00:02:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8601:39db:494d:605c? ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3553681sm40700365e9.1.2026.08.23.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:02:42 -0700 (PDT)
Message-ID: <7a100e486f8bcc7f48ec0073ccaa95fabeb8b59f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC v4 0/6] openssl: upgrade 3.5.7 -> 4.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Sun, 23 Aug 2026 08:02:40 +0100
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
	 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244011

On Sat, 2026-08-22 at 19:51 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> Upgrade OpenSSL from 3.5.7 to 4.0.1 and fix all dependent recipe
> breakages in oe-core.
>=20
> OpenSSL 4.0 is a major version bump that removes the ENGINE API,
> removes the c_rehash script, makes ASN1_STRING fully opaque, adds
> const qualifiers to X509 accessor return types, and removes
> per-version TLS method functions.
>=20
> This series fixes python3, socat, serf, u-boot, and kea to build
> against OpenSSL 4.0.
>=20
> Changes since v3:
> =C2=A0 - u-boot: fix malformed patch (hunk line count mismatch from pkcs1=
1
> =C2=A0=C2=A0=C2=A0 modification). Regenerated patch properly.
>=20
> Changes since v2:
> =C2=A0 - openssl: remove c_rehash from MULTILIB_SCRIPTS and FILES (fixes
> =C2=A0=C2=A0=C2=A0 multilib do_package failure)
> =C2=A0 - python3: add backports from CPython PR #149783 for the
> =C2=A0=C2=A0=C2=A0 got_eof_error fix (fixes test_https/test_https_sni pte=
st failures
> =C2=A0=C2=A0=C2=A0 caused by OpenSSL 4.0 changing EOF signaling behavior)
> =C2=A0 - u-boot: update Upstream-Status to lore link per reviewer feedbac=
k,
> =C2=A0=C2=A0=C2=A0 include doc/Dockerfile hunks from upstream v4, make pk=
cs11
> =C2=A0=C2=A0=C2=A0 provider loading optional (fixes fitimage signing fail=
ure when
> =C2=A0=C2=A0=C2=A0 pkcs11-provider is not installed)
>=20
> Changes since v1:
> =C2=A0 - u-boot: move patch from u-boot-tools to u-boot-common.inc (fixes
> =C2=A0=C2=A0=C2=A0 riscv64 build failure)
> =C2=A0 - serf/socat: fix Upstream-Status tags

Thanks, definitely getting better!

There was one failure in core I spotted in barebox:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4689

I think that is openssl related but it is hard to be 100% sure.

Cheers,

Richard


