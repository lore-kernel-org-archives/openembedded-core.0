Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4057CD342A
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:58:48 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.36073.1725274723518718857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QqVD8ql4;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334c018913so3765073e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725274722; x=1725879522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=QqVD8ql4G0pLkZlZzaggMYSH3D96PogPNEozquem1RoBb4QjGAsArpSE/WNoiuYa+C
         BuctJb355zEE5IG3NeMT7pVu9dIIyW5yszyaZ5qflNiD8oALDY8v8ZF8KdpPumlVbc/t
         5ky42lVklG5U61w4aMOtAtHtfub1N7tSQ1Ixn2RoW21upsi1Kbx/XweU9Wlcn+eRrI1R
         Ts5m57n80x+oF6OietydkYHokoNV1boz0y/rlKdUTW3kxj4SrB21er0roBN7Yiae+j+x
         h60RbTfqrccNzXLRqQ/ZBbhm3bfeuFIJBRgGU35/CNn5FS5EiMEIAhsRF0/airCyNTl1
         7eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725274722; x=1725879522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=ng3ZSpHw8JdDXAhY0/FxP+fO1JTbG0NmwkBL6959B4Elytk4FoDa1muMpbPDXf5Z/5
         TCh0XLs4R5NHu8NoTzjG6v9++5D2/yTAJ5T5T6GbXQauBUm7PjmBCGxnubcRRLNXyzKO
         y9vhA1banijIKet54nJzZQ4fjt5N1eQc6i1duvBvMoXC71ImUpOiaQuQv+VlWGKqM9OT
         mgt0GUB7uBlCiIRiH6Jzub8TLBHuZ0cPcC3OJFlRkghumapvr25882idCjuqP8wMSq8q
         0tprneBwN/h643WpGK/bNSGfCKfPSvPKNqEB5+ZcGlUi/K//C/MKvDAaqt7jDTxA1pRt
         zpEw==
X-Gm-Message-State: AOJu0YzrpQHPvHKaf1FlUw/Z1bW8KO0HrtCumGbrfY5JLRNHIydByMO6
	Trtc0Jls5RDtnt4D+3DhQ8G8CLt/0unPyXm3un/I0XPcttSfMQxmMqixlAnZnptwQlmNpxcIjMG
	QGSo=
X-Google-Smtp-Source: AGHT+IGPsKM9F1aJxdHEI6r6HYZs/iTb07l2SymJ5Z+7OepFBKO5S7HCVN8LnVWj/JVnzvedzWqYLQ==
X-Received: by 2002:a05:6512:118e:b0:530:dfab:930c with SMTP id 2adb3069b0e04-53546b34ddcmr6049103e87.28.1725274721284;
        Mon, 02 Sep 2024 03:58:41 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac5e9sm1599036e87.100.2024.09.02.03.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:58:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] systemd-boot-native: add runtime dependency to python3-pefile-native
Date: Mon,  2 Sep 2024 13:58:24 +0300
Message-ID: <20240902105825.40177-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902105825.40177-1-mikko.rapeli@linaro.org>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204091

It's needed to run the ukify script.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_256.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
index 73db59b14e..58db408dcf 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
@@ -13,3 +13,5 @@ addtask install after do_unpack
 PACKAGES = "${PN}"
 
 FILES:${PN} = "${bindir}/ukify"
+
+RDEPENDS:${PN} += "python3-pefile-native"
-- 
2.34.1


