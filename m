Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A7ACD98F0
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5794.1781637416156008845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sK8WtLUB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so49784935e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637414; x=1782242214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od9z1LWQXJuEpHbbkjLkAsVsSFcHeizxTc2Nrv6uKdA=;
        b=sK8WtLUBq9iZ/yhX81eJCOlHcPHi3zod7pDQG0zBDHM5Bssjutob7VqQR72k/lb7TZ
         niKrDg6n0C22/Vweh91fVLdHbxW1kOt/2iPfgkcg2VqFfwJU3uitH7c7E6xm9i2oQMbr
         1DY5c7ADIr430hWw8OonstHJ/XdfSpECNurPrGy5AbCZtwPpkkzSllufkRDvSClST1/M
         Xh3oJtapbDWupqHLlqV3HcNwkksssxIH/khn8vmKoMsqVx4SIQmrRcz+xkBpiqI5UpjA
         myYLKtQJKgCSP1fUg9yz249zgPjgKHXswfRnutinrD+nQ3kZf58whqB7/mAgtejwi7QI
         99Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637414; x=1782242214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=od9z1LWQXJuEpHbbkjLkAsVsSFcHeizxTc2Nrv6uKdA=;
        b=hZaugiin3C/u3Vkxbo/gcreVL/V6VESga+V7Crn4eLnY7g1TxUk+tJNQDEc+vcigdG
         pIYhg4kwxfGyEmTRQ9kW2PpvyiZRfbEK5ew1k981LZq4UBF9yoVLgaIzkhXnu5w8uNsx
         bGFx6edI7iP66yZyZdQFo1sYY2LTXVSPVMHmFZAgxg8abnwxpSpp5THkT2szEEHO45om
         lEnyWrGrPsfUZdzcPH91wPomn0mgAUz6WlO9fUrARu4OZCfPSZ8Ws3eQ8/qs7ZXJb37d
         +ubzHdqT1Ub8nBT2qgE3N8RLLXOFlvm2p6H35HIxnaPSIc4yzd8qX/4qTUlqEh8ctQk0
         tQjw==
X-Gm-Message-State: AOJu0YxtgLxmmwn9nfSCbILpqII2rl1BfXNSIFJsZtpRcfYBPsFDj+M+
	+O2ErLnbJ8AlKOfIPbfCENaboQAi7T8cTrQXi11qG4m8uH+iTqx7A6Gz3AlRgwtE
X-Gm-Gg: Acq92OHuOyynvpR0rXK4DC73nK+lHtQSGdaW9agkVEyuxVWx+PKE1umLD3hM9oYJyHu
	RfNhd2EC4Qt4TtHP0KZPSJfIlDSpbcwh9EhlIFJUP/RprDheQbNJvMMdHOprygtgAHAZzsqXOR8
	3QJE+FbDEWC8DLo4JzGQtxX5i3+gEwtrnlh3UpqfI8jtN3WMzETnOzncjPUbLqJntXuHuhKbv+T
	aNWv7xiHzchS3HuBXiJ1QDuozpv4G4zeCkp/zDS/VYJRQMAZoG1A9LUb/U0+8CS+ZeKhYg0uEN7
	Qlm1gCtGW+al+YmhMqOrWwMu9Y3I6k32XbWcnlV6psjEPeATGB9mPR/TVyHdOpPhMjJy4ePNphf
	XrFjfcA6wSK6AcF5Vsqn3bfrtxThCGwC/Z0W1cHZNp7hPgcb4Z9Rz6nUuw/kwhw1q41MdXaJlqa
	3ycBAs/xVin7cuLlq55SKSHC28qPTbwTLUkmx5anGZn6hOWmMm3m5Xhd3Iam4=
X-Received: by 2002:a05:600c:6045:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-49234104447mr45085e9.11.1781637414246;
        Tue, 16 Jun 2026 12:16:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/30] libcap-ng: upgrade 0.9.1 -> 0.9.3
Date: Tue, 16 Jun 2026 21:16:17 +0200
Message-ID: <20260616191628.2014553-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238946

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb}  | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                  | 4 ++--
 .../libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 9d65c889bd..32f37987d9 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
+SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
 
-inherit lib_package autotools pkgconfig
+inherit lib_package autotools pkgconfig bash-completion
 
 do_configure:prepend() {
     touch ${S}/NEWS
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
-- 
2.47.3


