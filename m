Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63AEF41983
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:29:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14939.1776245377218633228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZjISM+G/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so80313565e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776245375; x=1776850175; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vliOLcSkwutsHQdk17RwvM7z4L3HIm1nstxZDvAezBc=;
        b=ZjISM+G/myMqIKxNRu4hYcAlBprwb6chApcoewz1JkPiR8eOgaVfqaE0ZgsaHbrhWa
         DPNrxjDQyC4OKpxH7OF64Io/PY7XjyvAc7PBWlajovk3m0V7+g7VZrpdE6cOFF0v76y1
         q2uIdIvO35AbYVJHUsOnzHzFyZAnzFQreK+28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245375; x=1776850175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vliOLcSkwutsHQdk17RwvM7z4L3HIm1nstxZDvAezBc=;
        b=fvQq66fYA87eW+kdROZD/QrTjhR0AWnGYmMmpvHNuUx9MSaiM1qLeoYXMIGeWX92d8
         Xhp/1hiciJw/NbNTIt2c08yyz074pIrRFPHJEwkfg2URil9kNQ5USg/AkXe2i2EvaLtc
         FPAfPuDedteyZN2gdeiFmZ+AqmVRX4ESo4z9KkCW6sEJTk6m0G/x1LNkEnPvf/xb3YRr
         NLPXKB3P2mBnotvGEDY9b0D5bynpuhLTL5y4ohdwP+bOiaov9TMqn1Z2ShvWkXIyFJZE
         G4E0WVU8bSeLZwniBjT8Wk1ZWlypYuea1D5HwkYosn5OYCEUiIx38AeQ8eFRPimtLWt/
         W6pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wLpmxPNRq8jeKoVo5SR1JsyHUdz+WUjk8Vh8Erjv059IQ9UGaJKVc72NzN9T6UChby/Qlv72dTTgGigNXK5mC1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQE6SQv1gy/Rkhviu91TQjqrgvzT/yLZOb5gbtokIfTsCW8TM8
	0B54MBOPHbVl2nH23iSysV6D82tMX2A0vQXTMCGrwUExNON+uBCSQW+s8uxUJpjxFQv5+cwvk+o
	Y/A9ypx4=
X-Gm-Gg: AeBDietshk5JYsVwDwPkyvDwbfqHSbWO9rWvrhWJNYVjcDP+V3Pncdzc1ol/TT8Dr1e
	TxJbzknpL+b1APrgv7RSLjj8ZFr5xdrvT+GN5gwebEHUYaFFW+CU0YbX5ocgsP9E1npWc+TXdiC
	Iq6vgrJOOcO67cl9t6w4hU48Hiuu/OfmbDEaIV+Hf1h0k7fYGJhRVbkm5yHv+DfsK1frKu7dZJJ
	B/LwIEBvIIQAv3SJ74PfkoxcnBjjwqT7x20bDq3FA6qPgQAF3tYbhK4YIscaoNxT3rk+SrHJ+2z
	d/K0R7idITHIq0vApOISCCcRsC2AItMYsTyUtUtMn0r4GONXogYLu3EzFSG/bfskTQ6pILWXAz5
	j1cIMeNaGZ/pPCZacDMsiKwfFZL6FYNsnA2l768+K+eDM7+RvKE4z09SlXU3JKTDnPWnxSxHhs9
	dw9BVvKnAywYmZiih9LrcXyFK+YL4Ju5BpcErIAYKcv5rlR8AxYZYe8e3yqez/tSyxg70evaLzl
	/Tb5AkNYwECJ+RvhFoCzOZF2CQ=
X-Received: by 2002:a05:6000:40dc:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d642bac24mr31112020f8f.44.1776245375413;
        Wed, 15 Apr 2026 02:29:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b93f:ee00:4e55:7087? ([2001:8b0:aba:5f3c:b93f:ee00:4e55:7087])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3ebaf1sm3473096f8f.33.2026.04.15.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:29:34 -0700 (PDT)
Message-ID: <58af6d456e153cfd7810fc48a199d170a592f2f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Add fallback when hardlink fails
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael@rndt.dev, openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2026 10:29:34 +0100
In-Reply-To: <20260415085824.1730569-1-michael@rndt.dev>
References: <20260415085824.1730569-1-michael@rndt.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 09:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235189

On Wed, 2026-04-15 at 10:58 +0200, Michael Arndt via lists.openembedded.org=
 wrote:
> Previously the sstate didn't work on file systems that don't support hard=
links.
> For example when using WebDAV to share the sstate. This change avoids the
> problem by adding a fallback in case the hardlink fails.
>=20
> Signed-off-by: Michael Arndt <michael@rndt.dev>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 12 ++++++++++--
> =C2=A01 file changed, 10 insertions(+), 2 deletions(-)

The change makes it unconditionally overwrite the file in the case of
any failure. This totally breaks the point of the existing code :(.

The challenge is that the sstate directory is shared, so two builds can
write to the same file at the same time. Our policy is "first wins" and
anything later is just skipped. The code also needs to make sure that
if the sstate file is written, the paired signature matches.

I appreciate the issue you're trying to solve but this isn't the right
fix. Generic try/except cases are almost always a red flag in general.

Cheers,

Richard

