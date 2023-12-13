Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422E2C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:30:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.46972.1702499422068176691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GKIzGCp2;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c2a444311so71294145e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702499420; x=1703104220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67zKYmsG/lnBx+spYtLneoN2o4qPjs2GIW29SUpfLKY=;
        b=GKIzGCp2R+uc80tfQ+kuVg7yWXb4y+zRxQjpRTh1oejnaFaT7SFKGy6UdW5FW3bM9X
         fdqr5Z7fFrTbZW+NpqDJu8ZButMRjNQ6VZS3TxdnP+GzLtHQB+CggSVVWPVd+mWp4kcJ
         KoSqwTNJxCjdIogwznr1hDVb5+EozL4+HGrTSHUdpQZfaEQzZQvQKXb0YhchYq4/LaxG
         x1Auh7hNbgqwomriYfMn0dBt9UGlf5rG7T9rsjbX8BzioRLjHhukgPlEkddeQl/m47db
         0YsslcxL7gkrhdsGOVuhn5z1NG/KxDOVK/LYH6RtBVsemjprje5ZZbAFj83oKn/swEMB
         gXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499420; x=1703104220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67zKYmsG/lnBx+spYtLneoN2o4qPjs2GIW29SUpfLKY=;
        b=AGIO2YYiT9GyPWJdHsxgI85sLXxa0WOLVG+Kfr12yxbHjSzlkoUc866D+1BC81pX3X
         LonAC9g8p0nljN3QFLiFflX2dVRpBOC/jXPb5HSjz4yafZSuoRoqrbOnDci+qxFyvGno
         ExMiTK87Q6083fmewB48CLQb0Jpd//Keb7krILNLMni0waYq96rKbW8oS8N5c3hsjTrw
         VR4MCe5g0oEA3M5QSwnQmxnOmoCEUOGCd34VTeUZhCxsmalB3iiyHmzzgGsMife3v39r
         ULbMh6e6hIpn4F9PZQuelEF3wIRJcAGH9mkwmoqA4hJHKIcSsedF1jhQD+Bic4cIHsMY
         Oe2A==
X-Gm-Message-State: AOJu0YwJhwgEcaXvP4u4kqlAFsmGHMXUpJtHzQXjwHbbKL7t3o2uzu5s
	j7QEtQKVJ6wsv+W+W/H67vfoHsXQP+YXjlvmPjFHiQ==
X-Google-Smtp-Source: AGHT+IFsgv5d3aOQbs/lgXscdkxIUrDfwvsspn0+2QMVdcUWCtsv6iBCXadj6VsrgBdvkhgLBmJH9w==
X-Received: by 2002:a05:600c:1d09:b0:40b:29f2:968f with SMTP id l9-20020a05600c1d0900b0040b29f2968fmr2207830wms.26.1702499420270;
        Wed, 13 Dec 2023 12:30:20 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d444a000000b00336371fafe6sm2945312wrr.16.2023.12.13.12.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:30:20 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCHv2 1/4] qemurunner: remove unused import
Date: Wed, 13 Dec 2023 20:30:12 +0000
Message-Id: <3f62675389b26935bb2572acbaf0742f465f85ff.1702499299.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702499299.git.pidge@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192313

From: Ross Burton <ross.burton@arm.com>

Removes unused logging import

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 29fe2719762..ee367078000 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -19,7 +19,6 @@ import errno
 import string
 import threading
 import codecs
-import logging
 import tempfile
 from collections import defaultdict
 import importlib
-- 
2.34.1


