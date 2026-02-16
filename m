Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA22E7BDBD
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:34:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19552.1771248852220152740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gCO1bqiH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so15673195e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771248851; x=1771853651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uol68aocnnJxbIheNlkkRqEX9JZzmMtP1o9h8dXl8y4=;
        b=gCO1bqiHiSFgmcMitH73t8Aegrzkos/Agmzn6Z8n3nKwcQGV6NNKjgC6GaRnQPmEsL
         cPBF03F/2o6WEP/dMztcKiHj8Nos9f00QJKGadimEgKmWJBOa0k7ely35Q4N9ic2CnV/
         3f3XBbX9xO/6jGjAMCki4wUNUlIzKrro/ZUzYjb5M6Zq1TC1A/TRDS0PAZTGOJjZybwC
         LBO/Vg1qWh/Np/FD/bDelKMkdVN3sMg8YB6qksWgnQY7xZa4+2+GXU77R7QU5BOH6lOK
         VPttsosXhHa3DGaDFp/JNtnardVhIp1/1e8nH4gOSMoS5savJDmFTLqjtxfu6LxY0xFQ
         4iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248851; x=1771853651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uol68aocnnJxbIheNlkkRqEX9JZzmMtP1o9h8dXl8y4=;
        b=Fa8erFmqFU2fe6KOyeCT7LZ4kBR1uyC46EYgwnbOkS2LQzVATCTdZeOZhdcSsd8r2y
         Pc2rnGrvcDlxhqIJrlOL3Bqo4molLnE+9j2JiOuEDOFan974cG/AK6W0eRnbZ4Qyprb+
         0xSwHJkSNiKW5bOO/lkRNGTCkMmBse1uJ0MlGMlV3F9nX2f9EN+CzuRuamv73UAukmIx
         TFENkF/SACG5c/GBHdMXkLp3eAF4zQ8wfA/OktdDdVymJhlzz93IyXkdWseamjokPL6W
         3gyCtoPqCsu61/wC015bEHpxgo5+2IF+A7yqwAB5npvpu+SQrKq1tp+L0pfAE9Vt+z46
         Jo5g==
X-Gm-Message-State: AOJu0YzAVRw5m5NqztnkyUSWfUuFNkn51O1v7sGUOMINcl7HrwFq507b
	mNy7BdfpEhOc6lti03ehCrorLs5IMsl4nQo5oV6JsQGdVE/5v+VoVK6LZvx4LQ==
X-Gm-Gg: AZuq6aJGIHIS+5hLr5mJ4Vb3HI++PXHUZDm7HzZKqOdCrHGq54aTcrnJsYJAAXgF8dh
	+UPpO/EUMoEn57z6HABmwSrXFURg9352KPWknvhP2NZfcRduHBU7kxGUFUJkS5dhR4ZhCyNw6Qb
	d8vtfgFClsCQTq4i0oE2HbG8KUaFgaoVzo9wGq78yApzJXEQgkQwdGUdMYrCvepYMRf1Wodv86W
	pRhYdCbpringbQICtHPWdRcHpm+4juif5Vv8WHHZHi8sUJzCp1z7zMevNNr5NFd6XiO7SnIKCTd
	UgdOWNHAs5c1VZ0bWWN4nQEUlkZPX6+JoR35zZpNCJPjU7hJNm4en02CCxKitMvg5eNmvuHc6Pt
	mq7fr3COgK/M2rhzFs4MWceFOSbasARdZHa6qxfvVrHbPPyF/OJj6Npry9YY5hpj4zsmfud45f3
	KkO0TTzck81YHZ7OxgUMmiHfG2EHEiOSeewiAjGGaQhjh4dLmfUGiYWJHbZNo=
X-Received: by 2002:a05:600c:37cc:b0:483:702f:4633 with SMTP id 5b1f17b1804b1-48379b8c016mr132114945e9.4.1771248850538;
        Mon, 16 Feb 2026 05:34:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm340037485e9.4.2026.02.16.05.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:34:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] lttng-tools: add missing python3-multiprocessing dependency to ptests
Date: Mon, 16 Feb 2026 14:33:48 +0100
Message-ID: <20260216133351.1034740-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216133351.1034740-1-alex.kanavin@gmail.com>
References: <20260216133351.1034740-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231199

From: Alexander Kanavin <alex@linutronix.de>

This restores the not-running tests, and everything is again able
to run (and pass).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 46bf59c271..1106867aeb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -15,7 +15,7 @@ include lttng-platforms.inc
 DEPENDS = "liburcu popt libxml2 util-linux bison-native babeltrace2"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
-RDEPENDS:${PN}-ptest += "make perl bash gawk procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils"
+RDEPENDS:${PN}-ptest += "make perl bash gawk procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils python3-multiprocessing"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
-- 
2.47.3


