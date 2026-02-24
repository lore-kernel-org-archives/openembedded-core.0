Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C06F357B3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21286.1771943128596613933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ihgIutKK;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so34026165e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943127; x=1772547927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMwBm/IGIERSvYhp2x+2vkpj9avsSRowL63W0h/tqYU=;
        b=ihgIutKK5r/M7SNaJbW7V/JuLsQKrJrkdE2+VWhDc1g9pP8O/QJQ9tUjXvGOzoFcCi
         mnpISHabJ/38TzhyJcLEMGK8aE9nGFdftt5Bzmf+lb9nUEzvbfl/7dDEjLn00US5IYuu
         q6IbnqyMmm1e2kQ5fIhq/HTtOKWw9Sa8IS68c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943127; x=1772547927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMwBm/IGIERSvYhp2x+2vkpj9avsSRowL63W0h/tqYU=;
        b=AUaBxcanQwqNoTW8Sp09Z/b5YlM/V3bFpeTsIChB0VocTOSuy12xZKF8hRlCDX4esV
         AXsbdy7DzYSetm7rRgiaVZBREfDMYCxnCAI373mQhl2rIHJPI1xQ+bpxz+wUoD/w93fs
         OOmx/mQ7UnvjU7I4SbLPi6nMti0PnETtygf/IuA8vfy0g5RNswJDji1ogr2fO2G8YXAm
         ExRbH1I0K1HXsHHg/pVLG4bnX7wqV8vLTUbHpeszJXwfw+sSRY3T9MwQbeQRpnv5OmLh
         9V9KjBBqN1AqnC8Tyw1ZBiSw01jgoNWMmE6/akA7Tw8iAoOEU03McltL/ZWYCj/rx9OM
         xFPg==
X-Gm-Message-State: AOJu0Yym/NlazPeFTGeJSBgLvt2eRrVkjm1CI29egqddm51XOdTbSjHr
	x10evglzpWnzes/BDv6Hs2B43qfdU1MmZrb2GSx5w2YtKOP9VdU16Nfw56kF9QiRsl0qcFpXweU
	7MOn6
X-Gm-Gg: AZuq6aKmZHDYQ0gDHXvY92kkJswTf+IS3lHoBIx0iI9t4qInbPX0XasSujbSR8wCClD
	nUocYheyej62RmFQx7wItywLhlTrWfpLw6ALWvvk4SzjpX2vg3zKwz5jg7BaOnqRM72YR282Ij/
	/SBYFdtrGxuCyUoKcgGTnX8e50QERaEvpp5eM/UhW6DO1n5rU3mmzerAiEga29IpbbE1pZ0MOPi
	aaVKKdIiO10/xj6JzV1aWf9q7Gv7WzScHZWy+bYtMYPtOeGpPtZNbTwVJPKky86nb2HsM4yI/l7
	114gKXBQAF8Mi7X+977Mclm4zLyq57YnfR0lF7anp7K3Ek8KxkBZxTBbW3mRkdcMNMkIhoPfRan
	vyM9brS+uAHpc1REUsRHZwHEdCJoonOQrYol1BkXUiUeqHGirUH7q6mEnfKJIpWIxTgsUBC5cnP
	Vau5HOrrnLsSf5AGZ/TG4mtsO/kp3SamLOnRwzy7DIgLmEdzDBZx44LZtGQUyQas9536mjxYp1f
	Zb2uyZG4Y0/B99En1kItq5ilF9cn1JMaA==
X-Received: by 2002:a05:600d:8446:20b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-483a960eeccmr149438225e9.33.1771943126768;
        Tue, 24 Feb 2026 06:25:26 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/38] pseudo: Update to include a fix for systems with kernel <5.6
Date: Tue, 24 Feb 2026 15:24:26 +0100
Message-ID: <959aa2bd41e292a294beb0395cdab01d9c1b07f3.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231800

From: Yoann Congal <yoann.congal@smile.fr>

 $ git log --oneline --no-decorate  9ab513512d8b5180a430ae4fa738cb531154cdef..43cbd8fb4914328094ccdb4bb827d74b1bac2046
43cbd8f ports/linux: define __NR_openat2 if missing

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9a35f32b983de724d2c2e436c017b49d5b70469)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index db3951f23c1..6ebe4f457ed 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
+SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

