Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F27C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:13:46 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32706.1789622023443816178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 22:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kVT9q5uS;
 spf=pass (domain: gmail.com, ip: 74.125.230.234, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so2985021cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 22:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622022; x=1790226822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNRiAMPR4WxQB2smoieJ71hFY95DJjQp3t3h59FP6vg=;
        b=kVT9q5uS5G0F+FzJArewEa1spO8+yXFcLF+KsOvoliGPv/5cI9iLBg2leZp7L0P28h
         mI1+DNW5eu2FRRUP/Nsw4LFOMHySIYoc+Nj+7t1RbH8nptFeWKIa+wXD0KZK61GZVIkm
         2/9JInHM8zJUt9GYHqeFhQbg/1eiu672ta6VxJvmCGHXRHLJ9qt2CLsP9cS8qvrdUxSl
         UUOO65n6XfDXPmLVh+Brtq+nIYrkiftOWtrRNUbxAsp19f6nUm8Yk+Q8wcCKID9EpeS0
         BcWXwQhQSNHqmIxqoLvkIygp6f9d3Jj8n1AE/ggSMWDm8TcdhVJCdZHT27c+acLbI5U6
         f7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622022; x=1790226822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNRiAMPR4WxQB2smoieJ71hFY95DJjQp3t3h59FP6vg=;
        b=KduqeyTo50J7E4JyGZXnP+l8cKmueLJsf8JiR5xS8r7qgxan8SMqQ6HwqAOpyzg59P
         5AxlHrAOS1VnTYvFxrSbR1z9t4OQ4eyCeIGLDRMABg4MSDEitzWMfDritAjnVFRl9PSa
         +9pfSpmADGBop8o257AVEMzqGL03eM50V+ErX4s1w09Br9VSpGWJKQRaXb8iDGLP2PZg
         E6TJXwpEfLFEo/e9U7NS6UwRXu6bVVXmls+DDpChvTNu6lun6PWO4jevYqn2RlmTwYQQ
         YZbqweO/UBCRSqgU52yP8cN26j9E14CSkB0avymD9o4apYLBRm6M5IwH9OlHt0av2VFb
         Ertw==
X-Gm-Message-State: AFuF++mA/c26Lc/zPOrqwMCCP9WVtpiyKuJXC2hPtLggXxB5XiZYlc97
	AUroHiGI5/bsocrn3mEIWu4eWouDHVPIsytppz1WnAWupDtyLmgff80a
X-Gm-Gg: AYBFou0ne8bteOSVjjHuYHFO0+SbNY/6za2Ph17NGWQFpWWCsK2QZ04tWREtQrjIvMO
	5crSljRvPHsrhgZJlFhLkTfjVXHu8in+1uPIT+PaH61AgkUEqZ1N9ym/cNAoPHUcDgxipHvXGZA
	ZiDR2gFI3Zs5Ck8ecApTWL18fum0/yioVqF87TCK74tDtNh6j9OIczWKxUU8mIKMt+GPg4E3edJ
	lgLq1q/bOnth6fijNTKY8oC5v8+FvPuf1gJgXLR2ozxxpaX2ieZWaCg+/hAVsMhbWcupb47ZWEt
	Z/s4Ozaejq9n0hxfs+XbpGq9lFxNbU6XJktzlOtqzsQu7oLtjE7yuyj5R4NGmuR8kh/lMOk+iBa
	saoVukqyhTzSupvpk/RhzQ48MfYtgU7Gj+ubjUd+DHUGRCoDvpWXto6fU195pHpOjKVjpisG6y4
	WTQhsTMgaWa/DhN0JpFFKb9dgOl/H8eEyVJzHPQM8ox1eTaPtm1P8bk5Pejshlb2enap2cfJyG+
	IOpFR2Dm13jUndVcW/OgKY+BkQ79TyIGgdC/bURywMcAmHbacybMZ+Y+gdbq2qjp1GCMTsNGDF/
	rtuIHY9E/lYY3p0/3WNnOhrtergetug0rJ6fGenmOjaolWmrPHwJooft+y9io8yRGARbdel7igO
	y9xyNhPeUKph6mhmv
X-Received: by 2002:a05:622a:2487:b0:530:b2e2:2f4 with SMTP id d75a77b69052e-5327f1cba53mr116923351cf.54.1789622022211;
        Wed, 16 Sep 2026 22:13:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fd4cc4sm39481161cf.6.2026.09.16.22.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:13:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: cosolidated pull request
Date: Thu, 17 Sep 2026 01:13:33 -0400
Message-ID: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246010

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the pending stable updates, one of which I think I sent before, but I'm
resening it to be complete.

We also have a fix for the autobuilder issue. I wasn't able to reproduce the
problem here, but this is a temporary fix until upstream merges something.
It didn't break my existing use case, so let's try it on the AB.

I went back to a unified patch series for this one, just to keep us on our
toes.

Bruce

openembedded-core (4):
  linux-yocto/6.18: update to v6.18.50
  linux-yocto/6.18: update to v6.18.52
  linux-yocto/7.2: update to v7.2.6
  linux-yocto/7.2: drm/client: avoid spurious vblank-timeout

meta-yocto (2):
  yocto-bsps: update to v6.18.50
  yocto-bsps: update to v6.18.52

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++------------
 6 files changed, 36 insertions(+), 36 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

