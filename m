Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A3C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.6589.1635842588049171349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eYd9ptTq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so1484171wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8AUDjs87VIGPPIJkowyynLDv6IgLxOQK38QNncc2tE0=;
        b=eYd9ptTqMAh6y+yjOeXz6rGsrbXGfLVYsFBQlTBDyJTpGpC18LnrffRwfUC4ifjVG9
         /g9j32nVzgHgUKy20r3qz4Spj5YJBmDp4GSDcmpzw8FyATNMwjqEteBJH/gNIVYwPzu6
         4M0K8SuwjXWCjh5LocfqO6TBKD8DpTwX8+ADZ6X4guwjXtUeMBNzeZqc6BBGhFjIlzQL
         lk1T9TN3s72l6qUuUy+9/8Kfu7Mqm1goR0k8Jmu1IeHiH0UnxRMuxYG+2yvxrp8//Q0H
         ouWbbrNUG5+1LQBuAgW3TaN7SILOQW+WaXLnclRM150ImxRS5LMKeurHWUn8k1eCRwPa
         uFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8AUDjs87VIGPPIJkowyynLDv6IgLxOQK38QNncc2tE0=;
        b=PsNZeejw1nx06WKewvW4ZMNJKOUlmuupgWoi5jxPfgEKvmodRshzVL8kVM/DJm0JUV
         2qLWo7ZZdk8RBv9lB9TBDahg6HY9d2SEUG+ODwWprJbVYZyTMJeyH7f3H/Z+C6AOqQ4z
         Qq8jsCUg0/wLBGy6ViHOAdS5TUVnON2ROMnnPIgcNYPc794oJoOdPxRex8LpEcMCycot
         C3LqEoe46Oqa3LtErxT2l2Hdgb3rOcm4xLjlzcCDS4c9W0qGJj3Bv48ZgDLE127ow/jY
         pl5HaZGgmmbSzof94bRvfUXO34vubA74p4HgwGlITJDPvpF1hin+/nYG0NsmjOPMkK57
         34JQ==
X-Gm-Message-State: AOAM530ModRCTKc0n5AHxkMl3ybwDPhHAByzOeBVnJcoWYbMOJMWQlHH
	R8NI3XW4vtaGHgRAjo9edEPu7Z7wR5k=
X-Google-Smtp-Source: 
 ABdhPJwEeUYafKvXuaKwQEcckjhw0qdwBI/qDEkx8F85aitqJIEPeakFTFLts0EgID0qekRs/ISqFg==
X-Received: by 2002:a1c:35c4:: with SMTP id
 c187mr3685594wma.193.1635842586550;
        Tue, 02 Nov 2021 01:43:06 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/33] bind: upgrade 9.16.21 -> 9.16.22
Date: Tue,  2 Nov 2021 09:42:33 +0100
Message-Id: <20211102084303.2974802-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157741

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/bind9                   | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/conf.patch              | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/named.service           | 0
 .../bind/{bind_9.16.21.bb => bind_9.16.22.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.21.bb => bind_9.16.22.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/bind9 b/meta/recipes-connectivity/bind/bind-9.16.22/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.22/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.22/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/named.service b/meta/recipes-connectivity/bind/bind-9.16.22/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.22/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.21.bb b/meta/recipes-connectivity/bind/bind_9.16.22.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.21.bb
rename to meta/recipes-connectivity/bind/bind_9.16.22.bb
index 390c84248d..bde9a793b0 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.22.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "65da5fd4fb80b7d0d7452876f81fd6d67cdcee54a5e3c1d65610334665dfa815"
+SRC_URI[sha256sum] = "65e7b2af6479db346e2fc99bcfb6ec3240066468e09dbec575ebc7c57d994061"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


