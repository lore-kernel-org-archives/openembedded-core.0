Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772BFFF8842
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32614.1777064231687654209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ElGGs3i3;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64693435e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064230; x=1777669030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTLHSjDoqmlaX1MmDJug9ZbwOf+r0zpVPBbPmg4ujvU=;
        b=ElGGs3i3Xe+PHMNATVjCs4oVXfpJNz3FiKPQXyhFdhWdfKMwxQRhdxwwzI/bpXSFJU
         MZqxaCOHWXGcQwDcDlXRop+zgfJTXFP9K4yA4Prk3f2MXlVViNNnm9mwydik/lm9GQBD
         OD9u4i3mknLSVZ3Z8aT5EQN8HUEZbPdy49/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064230; x=1777669030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTLHSjDoqmlaX1MmDJug9ZbwOf+r0zpVPBbPmg4ujvU=;
        b=LjrAHKP/8a1R8lUr7hP7bx5glDB+vLnO6XUaLFsHhEZ4Fc+UTQ5NoudwNGtrCojJr3
         Gk4a3U+PTeJU0PXRbu8XbYGIu6iYiNcPsjfdvZRhTr7btTjeeGnF1U91R/QnlI8ecwPN
         lFcNV8g7InPN2Uu/tIaNj1DinQ0R/E0pl8BOgaSnLf8D+IPpl+xllOFcYsf/dfIW9E1w
         57P9jNbB7/+S5uGc1ASujQjUvwd0gIIcydULm9Omo2PHTxHNsSUrSlexqRkJT5IKY2R9
         KF2OGmtXWTTtIILIwqBfDGeT3G+OGDR3Il3TxSYO7oRgG/5Qeb2BHHSSUU+C2N8yEEnJ
         bxsg==
X-Gm-Message-State: AOJu0Yx1BWsnzcZr1Q0yHCZZ08MbAwUm59dD3L7FULql5loGQ0XIrEPw
	GBR2OOez9gWIUg3CRiuLGYwdqtiI9ktdDiLfiWLPj6n1EKBRheKWX0rkhjo/jC6OIRxPpHGOSBY
	l77DO6HBEKTo4
X-Gm-Gg: AeBDievNt0F4kLNBNmJ52ZK8YTQ3+4JQ3BmiN7bgxR2YmeL6OZMb1eanh7j9d0x7BLL
	hKnavjonnZb7AUmpKlbpuzVM5Wap12RZxRunjn4kKySfDY/Hi6JYCjcGPjk14/gNekU21bvjgt/
	QNoTjS8sUgv6XyWtX8jbrRZtriDL2+6fa+ywZFHc/b52TZGdPh+siJuaNuxLqo+/7caV9lYjj6g
	yavedmfZ3Eb/QAMP4fdzJY6ByI0tqR8s8v03YCqBAY/8+IeaUdK/KK1UXHNee3lVznfskSJur09
	B/ntki/zuoWicY1GcpWnOO/WdOI4cirpNu9eANqVNBZ7nQww1ekWji7SiASpU/++z4oLQFEXqTV
	zXxKySZ07LhwuZo7QUFmfnxP3Vw2M5nvwNz2wXILR5cRKU0rQA73AjxBPkw1lJthJsy5tklyYy6
	Cs00IxrAkam4zducccSzog+jBnHV2CFpc3ujBbIdGJXDDrjtnZFlhbeaubOW0EDIpxt7FOEGIXX
	kYmsVPYyDP+h67eHQn8H0zYx0g+1jDB67daMA==
X-Received: by 2002:a05:600c:3e8f:b0:48a:65a5:751f with SMTP id 5b1f17b1804b1-48a65a57799mr61946225e9.31.1777064229822;
        Fri, 24 Apr 2026 13:57:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 57/66] apt: Fix build with GCC 15
Date: Fri, 24 Apr 2026 22:55:56 +0200
Message-ID: <3e565b8ea4b0694fd3ded7b3b0f9d93d1a7ccbab.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235930

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac53f79999bb8301380d7c58025f6fed75e40c9a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...l-Add-missing-include-cstdint-gcc-15.patch | 26 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch b/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
new file mode 100644
index 00000000000..b86ed8bb92d
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
@@ -0,0 +1,26 @@
+From 9da1b0dbdcc90455bc9de49f73a96e7d18f83493 Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Tue, 18 Feb 2025 10:29:40 +0100
+Subject: [PATCH] strutl: Add missing #include <cstdint> [gcc 15]
+
+Closes: #1096322
+
+Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/f82dcd7e4ebb3f70d28e9feb3621676f8c0cc024]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/contrib/strutl.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 67100f1..c0a1cbc 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -26,6 +26,7 @@
+ 
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+ #include <iomanip>
+ #include <limits>
+ #include <locale>
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index e688d30cae8..436e2e8cade 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
+           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
            "
 
 SRC_URI:append:class-native = " \

