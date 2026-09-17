Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E515C982E2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1702.1789682901772741043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ptalHHiS;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1481905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682900; x=1790287700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XG3HsL2GvE3NLczUFPbWuudQTEQ5TY3mc37bdjbw8N0=;
        b=ptalHHiSF/Y034xNIn5OfUxPEy/cU468ht+bFPyOnzqvUj18Gtn+naTYoPA9IUnwVD
         wPl25mv4BF4k39F4SHODxM9faTrgpMWUrhWLqkokYdWYG4/XOspGCqgVuCJ5w0Nfg89k
         7VDbb3WQBeLTjFPigRvHp9stb6fXTBk8T5hTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682900; x=1790287700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XG3HsL2GvE3NLczUFPbWuudQTEQ5TY3mc37bdjbw8N0=;
        b=TOnvDmi97JCD1XVxBb60thuVHb7hCvxVyR9jH78NCc4CqY80JV6xWX7lqSWiVnPfTv
         MaKdSrSHBBVq5Rh7fPzTeYeynmvrzEoz79zA6ciELHBexSwE4WUXtjijAw0rzPgnHD9t
         TnbWEpI3XsnPxGpm1JXW3dahhyJ3IcS4ysVU2HR2OpgpYH8ZsAtvOVINreHXdH1RJgVX
         yCqbBaXEdYQl4Eq+sfifE9dMu29FEmeeTRANasmSwAPI8FjlaftKavtvXppqLzJKWYZw
         itWwVeRhz0sGWlhV2vnOhC3VtrEadAMmXuLD/8qbrSq8bt7jvS6nasMjPzR2jZG5tVgh
         Q1QQ==
X-Gm-Message-State: AFuF++kw4XC2Ttv6n8KuJ9EzFUa5XohE0f390qPhVaOV/zQiEA/T9soh
	HrjDbb3p6mlBb7XCRmgoDGkMcmKDXRc7cUZOGTJGjpWh7moH+xDLXCB+so/EIwCF+n1XvVzjwMP
	3/Mkk1Cg=
X-Gm-Gg: AYBFou3+rTqaI2ggfex7GjEXTtORlM8N8GvFmiLG/qoUpUP0hvZhpI/OV1iO6gn9apQ
	NFERIiYZa/VBirMvTjRKwwPBFpla+xIRMOM5CvTQpFUMkUcJRp3NzqVvVxCV8vZL0Oo/n5oh6kK
	1EkgKtCuqwk4bpSwxBh8c/DRJ515i6Vhp9/uRhySqblkeqRTEqTob3gYtKdcykVk2jch/ilM2GV
	SZFWRpj7spTVYQmx8gx9vMjkqQXBSDFId0N9sMmzaQ+Pb2p1Geyg0w8KNpBUIS+YARSEAPXaKxF
	QPT51OaSYOtdBlfeMGJW7Rh3P64t9r6TnLZtzqv8m+Ozu8aWMFhzxX9MDpmfgIhis38Kjkm9lB7
	o4PEbblmIpD1JegvETADLIAczGQfZEEXZPF5E1rtiICJYBbQbksevUP0JlnvYBUEtP139HXNwnE
	l8xOZ8DbXXr4i46ZSoKil2euQzpO9ZryzQ2r94gDDEHPTy84E+MdMyTROHeqkZaMVv2PoK89Rel
	P9BnG1cvtXl4iC4HUslNBdbL15FY3zarFQdKYNXTCv5/fLU3XJRRyHXt6WbkqFcpVNFHTxviU0T
X-Received: by 2002:a05:600c:4e89:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49fc5681267mr3262515e9.1.1789682899848;
        Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 57/79] curl: Security Fix for CVE-2026-13608
Date: Fri, 18 Sep 2026 00:06:42 +0200
Message-ID: <eeee57c41acb6f5ce6a54f0a63a4e7e9eccfcf74.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246152

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-13608.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-13608

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-13608.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-13608.patch b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
new file mode 100644
index 00000000000..4df7595c8f0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
@@ -0,0 +1,48 @@
+From 25df759f0f0c1aeaee066a4502bb36a8a86fb22e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Jun 2026 10:44:47 +0200
+Subject: [PATCH 1/5] openldap: handle Curl_sasl_continue() returns better
+
+Similar to how it gets treated already in other protocol handlers.
+
+Follow-up to eeca818b1e8d1e61c2d4
+
+Reported-by: Eunsoo Kim
+Closes #22213
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ea71c3b6b60e563651ea8596a975aef0c8199519]
+CVE: CVE-2026-13608
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/openldap.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/openldap.c b/lib/openldap.c
+index 95f7681..4a1e93a 100644
+--- a/lib/openldap.c
++++ b/lib/openldap.c
+@@ -778,8 +778,19 @@ static CURLcode oldap_state_sasl_resp(struct Curl_easy *data,
+   }
+   else {
+     result = Curl_sasl_continue(&li->sasl, data, code, &progress);
+-    if(!result && progress != SASL_INPROGRESS)
+-      oldap_state(data, li, OLDAP_STOP);
++    if(!result) {
++      switch(progress) {
++      case SASL_DONE:
++        oldap_state(data, li, OLDAP_STOP);   /* Authenticated */
++        break;
++      case SASL_IDLE:            /* No mechanism left after cancellation */
++        failf(data, "Authentication cancelled");
++        result = CURLE_LOGIN_DENIED;
++        break;
++      default:
++        break;
++      }
++    }
+   }
+ 
+   if(li->servercred)
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index dfc28539380..21d887cb399 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-9545-01.patch \
     file://CVE-2026-9545-02.patch \
     file://CVE-2026-9079.patch \
+    file://CVE-2026-13608.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

