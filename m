Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08BCA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23553.1791708063745757095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DKizT6WE;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso863951f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708062; x=1792312862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XxrNC/IQ2cVlrvZjo3AB5P+cC2Fk24Mha2MmQ2ABUtU=;
        b=DKizT6WEvXIAc3N6wV/Dcfh44/y/SDqjD006gZOvKid5cjYuzRYk6z/E/5zHDFthgs
         LFW9rkBoITHuLxtUwhBvpot/JvCmStW/fl87e0FsZH/YoA8Py4o6nJQ7yANakWnqh7Uy
         vPHQIXIfGPOeIBf/8my6Bm1bvSbVoGYvZOWak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708062; x=1792312862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XxrNC/IQ2cVlrvZjo3AB5P+cC2Fk24Mha2MmQ2ABUtU=;
        b=KOx7QnLOfeJj1OxP03X2K7E3vSU2XbBrvP/OTbG44AnBa0LxstKiVoPPMdHAReMnj9
         EHSNTtiDf8UAS3DtCl1zX51F+jWeJJS55JvC6VPXGUsrZkENahFki68uuTaGbNRGtyVf
         I3GDXgOdRUQ794o1ESfaG03db6AK0ZGsNjygAwRMAKocZ8/uDJrZRSoJFQsTWnP2TMO/
         /IAqzzmDptFbwtK/VKIZzCkPfCWa7oupXtNq4tvyLjZgbIKN18xp22ihB4Og28Nb4UNt
         wXegvv5G3AkkMWzEC6lwwGOVlr83H21yZFooe9dloytlE1Tn7nHwvzfei3oA1FYAYyOE
         ysEw==
X-Gm-Message-State: AFq9FYI2u6/RWuJx2aEzUF65yxoUfK0oU0s2RnGVCTAGWYMMsPavlmNC
	VC7aCvUz10wFZ7bNBboRh2EIuo0oB6UdqJJ2YVfAv1+atdZo2+UihVaabUW5o0hhPE+JMYakIzq
	qXSn3PxQ=
X-Gm-Gg: AYBFou2IvX1cyoJ6NWodDvK0Qb8cPjftoRxwiexXJRcTnfGW0+dX744ll5vo/m8yqWu
	MifqQm1j9f9z1eECEZZrRNGDTQq6pCdrLlXpuiJdJc88O4rS3o11nB2hrOKjr+PcH7c56iAmo/e
	1d6E3mAhsjY+0iya+GljfYKMfBCa+CUnLkOaP4H2vLJdEDyOtlvXULYDsPSJtfkTiLG2w6NSuDr
	hAT3lJikU7EPj3lx5PtYuBwLY+S9aEF0KxpzCsCtwhrC6JVBjN/+9r+Swpv1TduJe7G2UV7lsZ1
	CDHyIA6wJ7OcR5sjGnRGP7LL7Uh4Dsi+W5dI97lMRNlEpNz63P9WN7pNCtUa5vXAI+jsZfrXW3h
	RY9VCdVpcbrQqTV4y3iTydCAkFNtBE2HwAafQ+5IOzDFMmPj4FgZvzCKWOpMPooQ3SoIBVDH2Ah
	FTCP7QWSuB7sJG/1dq7lRRIOHrxZwiMoJCsCtze9x26fvRJCHmBYQxSSq4uUh4RtMMDxG5KAbZo
	W+NWHyCXQ/K/a0fFdkZ1sSpBtijcy24DnqgR32oo2o28aBRy/wmSIl+VAt8Z3ah9YesWF5q3w==
X-Received: by 2002:a05:6000:2407:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48dbace40cfmr10701350f8f.44.1791708061749;
        Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/60] nfs-utils: set status for CVE-2025-12801
Date: Sun, 11 Oct 2026 10:39:37 +0200
Message-ID: <5a823c360be13dcc60a870eea6f1af1b60b95f0b.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247513

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

This is RedHat version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2bb062e403c7093734de6467c49503a7d8970d9e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
index 7693a88682f..a5ebf7043e7 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
@@ -147,3 +147,5 @@ do_install:append () {
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
 }
+
+CVE_STATUS[CVE-2025-12801] = "fixed-version: Fixed since v2.8.6"

