Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09CBCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20841.1782220484227881661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GMmRZlPA;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b7866869so55594735e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220482; x=1782825282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0M1v6M9AN7y0F8rum/iWIFJ8EiM9u40kMzPowt9N4k=;
        b=GMmRZlPA+2is0+f8cwNjLmkTthPi4g5isy2a627suYcmumwOYwKQ0kWDwcTmPZ/g42
         MOqRc6QHuZh0W82QTqWMqDu3PpVhXjCVYgR0z6vwThmph/T5WBOYl7js2kncVPeIJR97
         nFWgrItCPTxgmXCDxZlPwwI7pw0m2JuXgpGRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220482; x=1782825282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p0M1v6M9AN7y0F8rum/iWIFJ8EiM9u40kMzPowt9N4k=;
        b=W1bCu45LpCJavnbei/JI9iouSDWic9uLwPMmUaJxUXZx/KR+p6QuOqWhD1NAB/bQHZ
         cpOs60SUshyxhPyETxN9C13tLmxGwN+azCEYxRJpfsG7AaJi2lWAA/Jm3jRo8kehclyX
         H6DtAlnbyncJWeOnLJXz5SZ5TFr8MkfnH3/biyg9vfDEaxu/dWDfTkePq38kwGAuxq8L
         RIQ7+2OFOAtuXkG9Y+9FR/oDaCzGoYFaVxoSc/WHIQI+0g9fi+V+gPVV8aRE0FoZYhpq
         /In45/JyecPZi9x6QftZEc2187gPVT56tSReKM3baF3LYXFTkMAHKeM9HVHImfVTQZdS
         zEvA==
X-Gm-Message-State: AOJu0Yz9cuUZdNlXHQ8gpOcDhBizhbevO1geaWujW7FJl2CKQklDiYPJ
	oOOOlLpaqVRc4rQx7p5CgO1i4FqSbCx+MPQNdzljkFmvX8EuHsmtf0eFxo6Xa8XqmIc2vBsWCp+
	uFFou
X-Gm-Gg: AfdE7cnVqp5AYuNwqjro/ks+03H/ja1hkWNgQQnSks1U1CHWQYtD9mKYTbixnZr0V4n
	ZkUK5H6v2a9AxzieLU0XQthRt6/9m88IGxwFJsV8IpYbat+LbVrx4yqosxhWPfcJzMw2Z1wjvBb
	TZcw5Fy+1eYk1e5jfgp4ibQnntM0Dp6ymaWmaoUKZ/+6e6lrHVDaxtHqp04bOaSaLjJkXMeJkv1
	EykOucKGiH8WRkXCY7VYN2+zDA0UNTW5bCIve6kmHMaYyEb65C8GKusupvqpp8lxcGzLiK1rX+U
	smj9vKKCpZwPE3Wo8BphTXEAtZd6iHuWiAmzEwvsU4CdO9PTy5/eCK/fnrfA9EUMZbEQkNQ27c6
	CgVzgPVly3Y+9duKZ5LCw67v6O9uP6GO1AxYeQFU3jrDnw/pWQAFYgN69124QKsrHklkLXGPUqX
	+yRbdm/KBsxoRJLR36H2AUNJpeyqVVgm+2bFUNsv6U9xnz2VDi/i856cscjBotHJ/7hmxCbtKIR
	so6ggY13Q9Au4OwLQMaEI+4Vpr/
X-Received: by 2002:a05:600c:870f:b0:492:3445:ecf8 with SMTP id 5b1f17b1804b1-4925b34a38amr40976235e9.3.1782220482433;
        Tue, 23 Jun 2026 06:14:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/26] apr-util: Add CVE_PRODUCT to support product name
Date: Tue, 23 Jun 2026 15:14:03 +0200
Message-ID: <3a157840148e14ec9019a008ab94e7f708baac05.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239388

From: Himanshu Jadon <hjadon@cisco.com>

apr-util is tracked in NVD under apache:apr-util, while a smaller set
of newer CVEs also appears under apache:portable_runtime_utility.
Set CVE_PRODUCT accordingly so cve-check can cover both the historical
and current NVD product identities used for APR-util.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 927b505c982ed7443aed348ca54b0073ac63d938)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 1371e262ddb..3a5f52d2501 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -95,3 +95,6 @@ do_install_ptest() {
 	  cp -r ${B}/test/$i $t; \
 	done
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"

