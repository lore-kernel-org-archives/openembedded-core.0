Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE43AC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 20:11:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36.1788466262705318042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 13:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IvGL+8/O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so2573405e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788466261; x=1789071061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Xnj7L54EW2TTBFug1yIn8PtgQgx9kNWvHceWal3we0=;
        b=IvGL+8/OHnUWLCTnC/QYbVNU3CYlsNei4RouQBw5YxoWR1+J0+9Syq7oWd/k5kulPD
         m+n70BfEVTCMvCM4sDwGmjbXzhxrFssoL9Tny3D/bX9MDoQZesIdrk/ceoYnf103uwDR
         Yem7FVQPwA6+VOYeRIz2aAz9ry6kZFRmEPo6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466261; x=1789071061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Xnj7L54EW2TTBFug1yIn8PtgQgx9kNWvHceWal3we0=;
        b=dFMDWABRSXmYZKdzjFz8lgY+a9INNYMvXAUfcWLwewC1ZO8t3KlOh+ZJk5M6nnqYNM
         rauDVCL3hHOcWDOvLoPfYjavNThBNvAZhWDIsKzJjr+sCdu5ADXO8X8QbZL8Subd793P
         I/oN/jFuLACza4HCzF5QdHTBJbe8gHfxM3d/iYqDBXUjeJjWre8PN7ehWLZ2fHHvPUwh
         CXaEQiQ/as/xSWq2nLAABGxnchC4DpUter1+pz89FkrmCHigp9zPrUd2O949Oar3F3rx
         zK/3c40Mr9Lp32hJJYGj0jUfB0bdEWCIRYl0Rl8qWb5BZehoVsbbUcF/fcxhRP7nbMsE
         Y4cw==
X-Gm-Message-State: AFuF++n9T3SB7zH1HqEFXKaIRukE2dvYM0qPt5DFLc3j7NbuTw0N14N/
	2pZgeUpyTLpIFPuEkJfIVeM1YDnrslDavyp/wd4dfiTE55qF6qh+rPdSxF6xdAfE+r9oDjwC2Vf
	vljmhbr8=
X-Gm-Gg: AYBFou2KqqUwBJZEkH8kNcl4ZmcRHVn6t6u3WHXR54ur2Hl22ErRDmE8O/FRlJdijxg
	bSOhTPAdyuVFyVARv5dcuRqrmHWyYsS2Fv4HBI/+cEtHBUXgMLl4xEdJkqZ7071nOjga5QhEOkB
	TqPGwyBaqGbYjM2CullEAMO2XufzeoaJENKjE8sZJwfA1oUZTVGMhUFxrc2wNPGksK0X9uVd7nR
	ys4uLrh6BnfLOJaZQ9KKOilRN/FUurzdM85U2M7IU3sd3Pj1HQA3jtJ64l4FWsXipMTsRTN3dy5
	YIajn9SPhgIIe13+EGYYcaS8Ux93XsiaxCtG/qHlT1wXo/iokv03lh/r3DWc3Fhd1sqAsWb4iT6
	bs+uURdOflbrxv2uySojeGKq2pdI5W5dQH5Wo6x+VQsUhsjDcXOORyge5ISdNpUnROeTOp1BNWY
	6KQ/zbNro+RbcA7AIgOxNb5GnCWZfYQWUbyr+kA+MuZqe1vlwD9DFthxeIuo9e08G9ldnoEMWt9
	sp37RVEbVPK8HlYGAAIS58xGHo=
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr11321165e9.0.1788466260774;
        Thu, 03 Sep 2026 13:11:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm947091f8f.7.2026.09.03.13.10.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:11:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta-selftest/devtool/bbpath: Add missing import
Date: Thu,  3 Sep 2026 21:10:58 +0100
Message-ID: <20260903201058.368406-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 20:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245040

The file uses the os module but doesn't import it. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/lib/devtool/bbpath.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/lib/devtool/bbpath.py b/meta-selftest/lib/devtool/bbpath.py
index 5e8ffb3af6b..17965544763 100644
--- a/meta-selftest/lib/devtool/bbpath.py
+++ b/meta-selftest/lib/devtool/bbpath.py
@@ -1,4 +1,5 @@
 import argparse
+import os
 
 already_loaded = False
 kept_context = None

