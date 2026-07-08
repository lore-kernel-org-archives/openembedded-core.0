Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435A3C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 06:20:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2703.1783491632200018363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 23:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qiix7Sn6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b691cb44so1595915e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 23:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783491630; x=1784096430; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mHNre5Whz5YrDD4vQBB3vbjFvCpJHD+QTxHJURyek6o=;
        b=Qiix7Sn65WQT76T+PhIiyZyfHPPEUqtwGYCDPQdqVS5dFZWgEE/Cl2ONO2Ji7pS6Du
         +UlU+tqy4e55LSf3KCKVKlM3tSfr7SMDaSddS7fayQbC1LqyhzDYJfXVcGK0dqxZiZHr
         rdxYcTR9gLFJhl1W1ykcVTu3D+l8DvqbsQTkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491630; x=1784096430;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHNre5Whz5YrDD4vQBB3vbjFvCpJHD+QTxHJURyek6o=;
        b=EUKgC3axCMFnjOdMU2CwmCRcnfOiKp/NtfKegvhp++AIRVxkiwWOCKRF6pzT6XREy3
         Vnt2zeOaaOQuJrLv25TfxGpeEneofuoXv/m8z2ZmtLnR2Ga/eNR6CD+quHfkGs4Wo4MY
         yLdPB0CfPMo2nuRNMYynmy6J99F4zCTMBiXbtgRaLPS+GtSd05xMisA8pi35xzQD/tOW
         AOj/sfblzzOWCNdvs+5AlEFX2N/oEsGE+2FQR/cFHpxyZ1EZSCF9Hm60afJGhjq1+zFW
         TAa/g8fBO22Vl0DqfbDT/j0CJkauDSkVpqi0LjEYxXVa+xUeGgPeiW1HP1BPt725qNOe
         Jr0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBUbeTTxtLuVDzyV6TyiwFkcqeKCtM0VCUkUH41rUN3S6zXottvOroYtnqhgEPeir6E8SuMdc8bw5RNTcRViyuYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzE0AwS52wAAvBBFQTGdYvx8TSbX43ca3Y0jfhZYx9DfGZJX3oB
	lDsvYFsF3/DZiS1owak71DxrjhBZ0cUASCwjj05L10vmvlXZ9/wRl/WUBR0GJJWwQ88=
X-Gm-Gg: AfdE7ckWos4WnEEuW5P9ZVvnjaB7DIbcrgQK5UbauH8T9TDw+03PKRtutx+hoM+YKQ6
	MA3A6S4RR/2CbXJ1wWgsaE9RYVz+hrdyCZ1ANb7nIKMH1EI6Ez5dn5iuwS3HniA8suPMZf2NLoM
	kIjZdDV0nRZWIOR+z/crTcpa+xvgFHjZRB9VbKtSS5yGqgiCGxd3DUJCd+OUjYT3rtye9PVHIt7
	8rwD0zpsR/8/4/jobMSpduRmzDfbz5WUgwvwx8QjyFDnURlYBK1QnKuu5/pMSQv89owGW74/z4F
	nH4I1t0etfC3X+2nChiaWqptoAiZAG0ewQkMn34AZiu+NPQy6x4GKOamqpJEOtvv5+wqVNbXgia
	sFIhxedpLSaYE40DdqvTS9cRXNoSc3rYp16gh0ezDacFoUk1FWiwRAtVf79rUN7+SZJr7T7yHGl
	LBUz1J1QS7ij9Xr24TUgeHk5dmf+tAVaYGFrULDaZSeaghj+q2422S+2fFc8RCyVXJPaWdfmszq
	UtPkg==
X-Received: by 2002:a05:600c:a55:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493e6859a16mr9155375e9.1.1783491630397;
        Tue, 07 Jul 2026 23:20:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b60a:b356:19ef:1131? ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm46232318f8f.17.2026.07.07.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:20:29 -0700 (PDT)
Message-ID: <def5d9f32f9aa7d9ed9693037c6da342fb24a53a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] gstreamer1.0-plugins-rs: add new package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tarun@centricular.com, openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com
Date: Wed, 08 Jul 2026 07:20:29 +0100
In-Reply-To: <20260707081701.1525114-1-tarun@centricular.com>
References: <20260524012357.3178877-1-tarun@centricular.com>
	 <20260707081701.1525114-1-tarun@centricular.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 06:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240436

On Tue, 2026-07-07 at 13:47 +0530, Taruntej Kanakamalla via lists.openembed=
ded.org wrote:
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-5-brgl@bgdev.pl
>=20
> Update the recipe to track the latest upstream release of the official
> GStreamer Rust plugins.
>=20
> Remove the `flavors` and `ffv1` plugins from local manifest file because
> they depend on packages that are not published on crates.io and also they
> are not actively maintained in the gst-plugins-rs upstream anyway.
>=20
> Unlike the other GStreamer submodules, the Rust plugins follow a
> separate release cycle and versioning scheme. These plugins are fully
> stable and required for a fully-featured GStreamer installation, as most
> new features and plugins are being written in Rust. They are also shipped
> by multiple Linux distributions such as Fedora.

I put this into testing and it showed there was no maintainer entry for the=
 new recipe:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2830

WARNING: gstreamer1.0-plugins-rs-0.15.3-r0 do_recipe_qa: QA Issue:
Recipe gstreamer1.0-plugins-rs in /srv/pokybuild/yocto-worker/musl-
qemuarm64/build/layers/openembedded-core/meta/recipes-
multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb does not have an
assigned maintainer. Please add an entry into
meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Cheers,

Richard


