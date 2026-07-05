Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFFFC44506
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140029.1783291383495788102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ME2El5oj;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474303f3c72so1336054f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291382; x=1783896182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGR5j+D74ziDX0JVcB3wcM8A2fhVEbGA081tRfOF8gk=;
        b=ME2El5ojIcm5K/JFLzIesaEXWkV6ivLwRZNJd1UHhiUsaltxQaZTs2CsGwWnAApuOu
         mrRN0lLuOajwJ0DxmyvuAEmm5EXvqNKY2gA0Pg1BRajoYALxTC0wFnBa4/l0rLes7yPd
         715QRvaOU6fO/90J05nEsBG8waZ98aS7E1RTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291382; x=1783896182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZGR5j+D74ziDX0JVcB3wcM8A2fhVEbGA081tRfOF8gk=;
        b=KS9Jhsx3Ml6NJn4Czy+SdiikZ6Jng9L8amCB0GiHZaVcYqpZa0CAee0N0zgPCg+Jpz
         gdS4+nCNNTu+Y3rLlXnR7x4S7k8E1GvFz1G3xVpkirbC3OXYhEolN4fQWBjBEKBIN4Qv
         2v/V6+T1wHYekzjRI1SDo0t9xDx2QFA13qlieEnhOhseaeW1HqDGjEQvdurcOw36sJHF
         ZsbhO2Vz3GtBauubzaUmLfU9trOIe/PA8I4MHS0oZprPscyX/u6rPl4KWnIgpSS7+DXG
         6bQj2hRWvKTSji0kURLyBx0/ZVlu6076gzwWTrQ92pttoyDqZ+EkF4ds6Srv5kSKjCLV
         2/ZA==
X-Gm-Message-State: AOJu0YzabkFrLCq/TXaEsBLRoYvOAGX0WC/jOGvLqNg/xDRJ+ZXOJZBL
	UWhdqfMqvmIFrOzZv7qejxCPZo6Prt+/jmxO+6EDlu8h4owbFBZDawHfQ9G2f7XfPPg6p0W5/3w
	j996Nhus=
X-Gm-Gg: AfdE7clTsoPUsAePvRDiGwaZYSAKx0b2xy/JxtbWu8Py0Z7CB1lSsy+JbuCKwMHz2+v
	U/V13Sg+vIL7Dxjj5GqzWRcdKNx0v7VnB4/o3GzDVTwecE/uBOsEfdijZIFefmNAmiPIozwkFhU
	j32vQ1kkGCwM8y6qJBFgXDaaYLLHGNU1yMvaqllMI4ud6K1XBqF4xYHzhasEZctV2Bnv6McEf28
	EeqZdrleUlxT2DH8fy4L4WJBU6klsYX89r0//3cDogasqlaRQs1hw5X27YSmrbmZwcQ5qU7MU0N
	OZ9HyGHs/yhQ+IKITDVVx5g7FG2vjRTU0lWGMcKWiOSBW9+SSBNyl1ofNMKGqZDYmetB5zv3jJT
	jXcjCidqhOjpP3XYRmpBVwKxROZh8I7IjtKmUlGBDC+Z9NpaZUufU7hQ4WCcXbRfHhdiMY0VOcN
	wvGx/I10aFcQaMO9sdIjZI2QigOA==
X-Received: by 2002:a05:6000:1785:b0:47a:1f6b:ddb8 with SMTP id ffacd0b85a97d-47aaadc9ee6mr10196854f8f.39.1783291381684;
        Sun, 05 Jul 2026 15:43:01 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/55] dhcpcd: patch CVE-2026-56116
Date: Mon,  6 Jul 2026 00:41:22 +0200
Message-ID: <1201816880c79ad203ab358e801db58519f2b63a.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240186

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0

[2] https://security-tracker.debian.org/tracker/CVE-2026-56116

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56116.patch         | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index 8195cea029f..e214c03416e 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56116.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
new file mode 100644
index 00000000000..a329f92e6f9
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
@@ -0,0 +1,31 @@
+From d37f45a39aed5fd5d0d2c87f62b22f5eed7495bd Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 00:34:58 +0100
+Subject: [PATCH] IPv6ND: Free routeinfo when it expires (#670)
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
+
+CVE: CVE-2026-56116
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/ipv6nd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipv6nd.c b/src/ipv6nd.c
+index ccf71241..557ff50e 100644
+--- a/src/ipv6nd.c
++++ b/src/ipv6nd.c
+@@ -1789,6 +1789,7 @@ ipv6nd_expirera(void *arg)
+ 				logwarnx("%s: expired route %s",
+ 				    rap->iface->name, rinfo->sprefix);
+ 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
++				free(rinfo);
+ 			}
+ 		}
+ 
+-- 
+2.43.0
+

