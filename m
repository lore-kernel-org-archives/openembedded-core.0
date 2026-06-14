Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC92FCD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105049.1781424240118050525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DKFPBGNd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso17156275e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424238; x=1782029038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZToRg6zERXVVcj/oTkt1fruMYmxVpkHXpYbhii19dE=;
        b=DKFPBGNddM1xxMnkGObYRiM21pBMMMRhyHHiKH1jXuFS8cCzXRDU2HO+Vg0vDRVjMy
         VssrPee55GCLkeczKK58rAG/xfeWkvEsPO7HG7LaQb71uYdQ1loG8H2780ub5D+T1LSu
         l0q5LB2FWTYVdGbrhgVUvpM6mlTqWPoGxc2VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424238; x=1782029038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZToRg6zERXVVcj/oTkt1fruMYmxVpkHXpYbhii19dE=;
        b=Hb4tz7Ti2Y7HTUVR48nTewl9tddvQSp4cF3xcMy+ZlMboIkHiVZcwgSVbxc8yHv+kC
         bLimFlpfN3C+vHvs1ymPDZtQupWyegg/rCarAIlxalFKfLzDtAs6urvJlQUvO+PwkSR0
         8C11SVfAP0ENmA2vKUFijkxC1RdXA3SqCwkkaJBTX9pgNDwqM7hjXHPcq3jURkD+uZV+
         CI+PYLjGhxNw1dxd/kB+1Qtuzb+cMQu6VXgzxDFL3V+nFX3PiWYKxQH5UK6hlswxrsB0
         O1fVzKrbXCr8Tlu86d0aad00sCDvtR7gNPjYUgq8GjhlAKFHRza+vOFdnlBjkehMksfN
         4sLQ==
X-Gm-Message-State: AOJu0Yw355EmSgZI/orySlw9xdsgrkd8M5ouuQrgbLUrlJXRvcj604c4
	I/g0QIrNAPQdwTyycmQHsODVL/XNdTbidjsD80BgSo5w2OwYEyOLn1lmWE69f5RMuGz2Fm/gNkP
	nOxiX
X-Gm-Gg: Acq92OE4Koi9Js28U5pWbGTGcU69AqGDTPe1HAAWWSFGuCeIxws5Xu1PGlNqWNWrIax
	8rvSU/oRai8OeRQt3uGOiBv4cC09KMoXGFm8DwCuC9jkF0eu5hBEraNcgxukRy+rOheTjeVfUyz
	uWGgkF2nRQGirULSLhKSTlBHtFUMz5KFTiFjefQmhXSP6Vgmhsw20o0uf1t34VGdsfaFi3ZirfH
	CTiLsTe6jgd4KTG9r4X8qptjlgcgyZvyRr/hpk+QSFhP2tP7sUUGxwUNRybUXk+DwMZNq04/kJN
	+DAQzA+xjUD25QbHOopPdbcgOd/O+BhFuSDJ1uZbca+0yDhPlt0LAy+B3Sq/XUTB9B1GcDGb3Hz
	Lud0qC297BH/L4Z6WjY1kRiiBT6gJWNElVLNcpgL79vKbXBPc0qz+SZLT713b8mMdde42TItY2P
	+3u6mXhP5iJZEUqHr9FWyQszNRjCEZyyWJq0Xr7A8fUUgi/ArMT+u7
X-Received: by 2002:a05:600c:3209:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490ec4d65b4mr78080725e9.8.1781424238250;
        Sun, 14 Jun 2026 01:03:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/56] python3-hypothesis: upgrade 6.152.4 -> 6.155.2
Date: Sun, 14 Jun 2026 09:02:41 +0100
Message-ID: <20260614080307.4017177-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238714

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
index f08e0bad792..c828671ac8f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "31c8f9ce619716f543e2710b489b1633c833586641d9e6c94cee03f109a5afc4"
+SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

