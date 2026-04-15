Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9D4FA0C51
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:43:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14271.1776242629148258799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mWY3QQUE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4404148f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776242627; x=1776847427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PyNFV+LqV56/V3pDBtFrgawle/M5IpztJxy9cLIipI=;
        b=mWY3QQUECr+6J8BQY8FPoa+hbYa/K938Fawe3QmzAbUIyfQtX1Bcu3yMorpQS4JxpS
         jK/N4C+AEFlQVXPnx3eAtkJ8w/OhH213BHaGYyqIH4h12aLWWuMhNUsX/IWbT+Ag4Bqj
         4St71aYUAZZ4gESNIkxUaa/ckHGTRrzC4I1WgJtp3SGAGIGkmUmUsYK2AqSUt4KmgGrS
         x5cAsosST50X8NtqemjnspfsSxmZxSQs6rnrZ0mxtcvMiXG6dno4HB37yxpdOnplK86m
         FA9TcCaNYAT+hzcmI7KcXB5Bbz79l/yzNdpnGEiHgzkCj3YBlB1qhTKfomJNLaFuZKzt
         +n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776242627; x=1776847427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PyNFV+LqV56/V3pDBtFrgawle/M5IpztJxy9cLIipI=;
        b=PCANfUQVnPRK19JEs1aF34rc8cVB7hY4APuL92Kfo9pbtp1zLv7Lak86kKBnsNkt0P
         QbSBpnQcx3zz/F9QIPJ1cbtdqOu7yROfq5tjsF+LPaIP2LN8Xl6tY0ZAZKBkRfDC+MFE
         E22LAZnRACE1ioc1/5tVPEKU4laOWR9bgmcq22p7Xl65Ievq7wIWk1v8YZEM3hB4z4cK
         Mf5hb1dkZ/aCoaJSPuoM5nDWtumlPZWO6vR6Tc+MfrZFz7l1Ue27xodDiByEp6kjjo5h
         o5ZxscrfNJAUcYpidQG6xtpV+r9EOe8Iac3zrcEDLlX0P6rS2uVaALS14R8B2eE912fa
         tetg==
X-Gm-Message-State: AOJu0YyT7KB3GPm3JQ3ShA80TN5T+uKeSiAKF2GwLYj9GYTD0+vCFLAZ
	y++PqLGwu28+TaTJNfDttGV9DVvwzpeuHv9OwqEqiHJ/CnIYKS9hARXmHTv5diK9
X-Gm-Gg: AeBDiet2uNbPBES8MexAkxzoqIG/FHpk3bTJYL5/g9/7E558bETmVr50RXOJFTkDten
	DDZ/x6A0Hr0dufEHyySAwWu0GjIBZU76qsVSN/zk/zTrybV1btthHy1D4c3MYIM9Yf2/2JJtDlb
	0q+G2WfIRpGSKgOBPNmY8MTfz+ScDuPrZt7rT0DDR2UGsZt0aprTl4BrY61df76Csds7Tousdj4
	FrjPhyAfwLyWTokbrlbYg660kfcwzt6mY7Yddc/IsLIikBx2FFvFaAGxHnlNjgzjZnfisMCSubs
	ouotOVG/ErPSFZj/T2DP1nNFNXYcKihie8sIvrgsVKloVq37/e6GXg+MCiOTW/HXe/xfFd/FeNf
	wRPM7/0dzPbpU3pi/7S87vaUKXZegzVOqYhTZxzfLw5PkKg7yUnkQz4E4hg/R8IXT/WHBClGG3O
	iYGVYj1KCO7dvhwwtNiEhbtunk+j/GrsT7/hoWfYQdmhrkDE1NHqybCRDNQ9QO
X-Received: by 2002:a05:6000:420a:b0:43e:ae9a:66f7 with SMTP id ffacd0b85a97d-43eae9a6771mr728968f8f.27.1776242626522;
        Wed, 15 Apr 2026 01:43:46 -0700 (PDT)
Received: from CTW01359.. (28.76.166.178.rev.vodafone.pt. [178.166.76.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead402ee8sm3350584f8f.37.2026.04.15.01.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:43:46 -0700 (PDT)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] waf: Use Python 3 built by the build system
Date: Wed, 15 Apr 2026 09:43:44 +0100
Message-ID: <20260415084344.43909-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235183

From: Fabio Berton <fabio.berton@ctw.bmwgroup.com>

Inherit python3native bbclass to call waf using Python 3 built by the
build system instead of the host Python 3.

Signed-off-by: Fabio Berton <fabio.berton@ctw.bmwgroup.com>
---
 meta/classes-recipe/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/waf.bbclass b/meta/classes-recipe/waf.bbclass
index 01707c8e2c..5077e3aeea 100644
--- a/meta/classes-recipe/waf.bbclass
+++ b/meta/classes-recipe/waf.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit python3native
+
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
-- 
2.43.0


