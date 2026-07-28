Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07692C54F57
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2805.1785277330836646609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N/fODEFb;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47df43bfb07so146681f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277329; x=1785882129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upRRZV6qMKso5v9M7fyACNrWoe8tbEXajTDM+Llyl/Y=;
        b=N/fODEFbssJuxAxjqYrwLAVECuqhCPnXZx8v7qNXU83mUNiLTfpEpNNyK62CyAdKey
         UFoYUG+RCRGlqLydqiqK1FdBWWV87cXfo7BJ3dgtPbWqLa7T5SBdKCoU5Tt/dFX/FRbd
         mauX6GkvCcnwtAC76RzQZ0GX+aLFMfEV48/vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277329; x=1785882129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=upRRZV6qMKso5v9M7fyACNrWoe8tbEXajTDM+Llyl/Y=;
        b=JLkAe5RlQcuPkHCBclEfgXOgfB0O6BqbA/UsxgjOXGAINCmf/9++zDNLJqQ7rbMt9m
         E0UA3+0jzDHD5ouGTIT+MEA6ijy+piWTHDPdvVKSRkvW2Vi20uha0dRyqUfhcmfphl6w
         V0bPtWeyXS1B79fGOLJQX8km4Y+Jst5Cy2qJXnM/vdyXfXnPkU5lErQJKtZe0yAojKZr
         6HQlT1+zd/mUCDkmHb+V4U7VrAucdXbFG3zwAyhMh+t4gwOuFXsGvQ86WUC3UvA/cMMw
         ztvw187jMaLDGW5gl/cCXcAaoDTmJLk/HuRoxi3hwOhUSi34glgAfWZTAxt51tHtzr5y
         iLnA==
X-Gm-Message-State: AOJu0YxA+zhuKF5ZKl0OUJt8caLCQwLZh0IeSp8atm+OiJ1yJTQmO4p9
	/B/xqaHaiJ0QsPYefvZ2C13ccd401zAYujYH1a4rJweveiwkoSoRH05FP8AToBobE1JNC9bjuyk
	xRnWkPfM=
X-Gm-Gg: AR+sD112Sx9Pz6og4ay4tJYoSOCbLz+9jpR+b9FjPgGRhp/FK0mc93+gtfJUOl1CQc9
	fmgyxwGbhD406xlEue0Gl+bFMV2f+yYHuqhd0MvvUK+VRrjzEjTMCZjsGIZ6TvsTiu36MF8CoTc
	gN5E1BBM25V7WIM/sjjV7ftJC0VnT8gXqbueoHcZZ8t6k+7PVNlLzODABuYWrdQIdXHkTvLpSa8
	4x4y3CXlZSyIEhHRNrBu1E5D2td6ezc7P2xz6pM80XGc+uia1PAp1WDJet098wV1IPLJP2PoKeD
	I1tZj0e+Db6SZr6OWgkMzvCVk8eSlYozZfV34h7mJxD4uhKKH3KwMiRM4F2CF5rvEudms9Gw6JJ
	f3R7XjNoUlEbjcI/QUGxUr1aujfoOybLgOACoAOHXK9OnAmL79M9HlIUY3H6Xf3A5sGfAgIY6IA
	0Ep1+IsmeTvXGsPY4X65uWGfNuk1eV/jPfwY4PCB4+qgNEfYEf3EIpGxusqhfwsWm9xUr6ra88l
	XB7jocFfW2cHI1gKS1+NpgSf5KsPGsBkIjlDCxoZzySRLXCaSJAK1e75Wxhk2bVHiafRzpDej6p
X-Received: by 2002:a05:600c:1c1c:b0:493:dcad:84da with SMTP id 5b1f17b1804b1-496c640fc12mr41164475e9.1.1785277328938;
        Tue, 28 Jul 2026 15:22:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/19] python3-pyasn1: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 00:21:44 +0200
Message-ID: <4c2a8f74464cf3b7143bd9e978eef976aea6315e.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242212

From: mark.yang <mark.yang@lge.com>

The default python:pyasn1 does not match the NVD/CNA entries which use
pyasn1 as vendor, so CVEs like CVE-2026-30922 are never reported. Use
the exact pyasn1:pyasn1 pair.

Note: Original commit was for python3-pyasn1_0.6.3.bb. This is adjusted
for scarthgap where recipe version is python3-pyasn1_0.5.1.bb.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4971337840e8855740409e8f5dadb3ab3661f033)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
index 0519ba5edb0..3f2d444826f 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
@@ -1,3 +1,4 @@
 inherit pypi setuptools3
 require python-pyasn1.inc
 
+CVE_PRODUCT = "pyasn1:pyasn1"

