Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AB5EE01F4
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:01:01 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.2311.1694624454426162217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SrKKp38O;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-655d1cf74faso307676d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694624453; x=1695229253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fJPDyVO1WteoYHUQfhEUD+bZIVlckBnayji1SRxeLM=;
        b=SrKKp38ObbGS6BDfcofmApgocOR/58eQIsn/00qgyOwFf1X3ZQ4pv2dXWa5dpV9wKz
         NLoCpJxi6ZAgykl1Ckx/51AZTHBQAI4qY2JSc+L6eo9K2GD8eBUglSbF1XfzUiOcByyI
         yROOZPLE5XxF/g3Lp3fp2nst8Aky1IvTUkA2p0Nfx5WBnTnaZrQdmPYszWBdUz1uxBP5
         9t95UXv5LVBWqd80l2oJthk1/n0slzu3MwXqrGjxqIzlMChlfnIuB79CTBDJ1GTg2jli
         rpxG5k75U+xJlbJl6fji0YtWuKKff7TG05cXkGDawSYmqBUvS+3pBlze3kf32+wErXYc
         StEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624453; x=1695229253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fJPDyVO1WteoYHUQfhEUD+bZIVlckBnayji1SRxeLM=;
        b=PS375lj4whoThMeyOwKUfjF8tWe91PJLEgibgWeHVxrn4OwFbtpDcZDc4C1LcjBpoc
         m5prPoeaK1BUSspuhO3PFo71Ynr+TRG6ruD6SBwzospwXNWP9iiLOogY7p3qqgWV5LpJ
         Wk4Dj7TiGxumW7IWWXN25ekJ4U2Dbx+LgCv3jcEBefmJzzeJLRWAiaQLpQZ/I9N/ibYN
         qG3ZviwY748Z+RCu2rBNNpytBPdlxhvAmlLh4UaYdrljwpqMIyEsT77qTdR4zWg21Omi
         AhEBPYl1xhTXmt2OiT1BZxrDg9QfRRcysrJOSHNpdYt6QuOLMyLNDGrDKzbcrD8M6wTG
         imMg==
X-Gm-Message-State: AOJu0YxvT6Wvez953wRxX8jkzkAgiKGB4k02sOP1beoasZdTibEsu1bo
	p39ibb+SZsynwZVBRZoxS+K46eaR4qTJbE8g7QeMkA==
X-Google-Smtp-Source: AGHT+IEMW4Z13synasSHRlOCDD13+NjqlNAoO3FqgyTHxk1tKaK0y+lo1rk7RT1qqMm3nami9dNzfg==
X-Received: by 2002:a05:6214:560c:b0:649:8f20:5528 with SMTP id mg12-20020a056214560c00b006498f205528mr2634467qvb.60.1694624453388;
        Wed, 13 Sep 2023 10:00:53 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l4-20020a0ce504000000b0064a5de64668sm4512014qvm.141.2023.09.13.10.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:00:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] patchtest: add requirements.txt
Date: Wed, 13 Sep 2023 13:00:48 -0400
Message-ID: <20230913170049.1622451-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913170049.1622451-1-tgamblin@baylibre.com>
References: <20230913170049.1622451-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187615

Add a requirements.txt file with the Python modules needed for Patchtest
to run.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/requirements.txt | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta/lib/patchtest/requirements.txt

diff --git a/meta/lib/patchtest/requirements.txt b/meta/lib/patchtest/requirements.txt
new file mode 100644
index 0000000000..785aa469f6
--- /dev/null
+++ b/meta/lib/patchtest/requirements.txt
@@ -0,0 +1,4 @@
+jinja2
+pylint
+pyparsing>=3.0.9
+unidiff
-- 
2.41.0


