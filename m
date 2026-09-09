Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9195C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.723.1788986015553047377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VJdBev4+;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso7560118a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986015; x=1789590815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0lubS32xwR32MaMP51tzqIhvcp0FtZJ1FVxEUwQ+UE=;
        b=VJdBev4+duvk6022rw+wC7JTq96IuIZW/2VMEgAHuZhoZe0ISUtLm8RzUhFK9z2PVv
         tsZ9lD/cs5Np7oIt93zPB8v+SIj3FDEtc8qWQxlbFvDN2JWOXe/4dWQFxtxnBYdI3A9h
         NrmfN9V/muQa81JcazaEnmplsnptd0vkAjz00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986015; x=1789590815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0lubS32xwR32MaMP51tzqIhvcp0FtZJ1FVxEUwQ+UE=;
        b=XYDo3Vkk9ixJO8tNyquI/SuJigX1Kuj+lFd//XnC5UxtNHsN5fwf6VDBuSSW9YkJm2
         JvYvav+KsbLnGg5a+MV3Hyndi5vxkTBV8rprBhWcY/FSDxRI+MKcs4tZtDw1/Y63QQDJ
         QkUVUZpxypCxtfX5mXRg1lxwTr79TalOIZN1y5gXYhG7jUmpirBQHgNzIE3+VtqE8O/M
         lvlmHsNWCaXClXnjxI5dcX+qYwt256qKkmYxeKhB9ovbZ9tiRzuHFyZBYfwTEYu+SWvk
         KGOiHFLmUhhZIhNsu2qQKraX6v7yuDLkhBWqWVPpA/msofXj6QwC5zlSRPxWIGuCTvaF
         nhkA==
X-Gm-Message-State: AFuF++k8o+4TZyxBeWosRFDXwDVPKwp8j92yd+3RiIf+ztHtDGJGeBLf
	g2/fRemYZjzoLGahZWepSAhjJhNqslGVEkEey2xkdQAQq4vT2UoQ2AM0AWfRtUv8+/lZF1xPxz7
	a15zZ
X-Gm-Gg: AYBFou1c+zCSDIYApN3xs1/dKLfeQinyvkQb77FV2+VaRVLGxi85UfUsIs06Xci3UHj
	UmVsCLoCrd6L+a6CxXMcNzpII7YzatUlBUGdMPiqnRfsnx84iGe1qKP8JDImc0hkRm2H4+A4MCP
	U4inpuRCm3heLc//Yjg+B5lixNWq5QZEmCFn4+OLXprpCs4t4u5/z2hm+DkjNZp+QnqC8tmMpOH
	oyjmVzUZK+zYAkM+Fxo6DJiPRx26rbQlP4PP7lfRKrzuzRtJD8aKoYu9CZ2D8IPmSaF1jQwVVcp
	H7jdHckXl6FQDQfKg1xTH5YfxA+fMmJs+9341Eqsw4Gkf+mvJNFnwD1eFWDBPTn4dJbAclP9Cq1
	x0py3MMigUaK9B3Cq4NQes2e/uXqCAPIfr7pmSOWVKhJDCFJBvL5qyQ0A6/knnfj5S0dyiFzAUQ
	kG4KVdzlBGEsgjSqtNNZFxo1k3gqQVGy+kyCq87iSg7KW/3atTrEl0hppQ2/kDif4rLi4hzQ74P
	bmCYL++/eyk4EDRfw==
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr58131827a91.20.1788986014800;
        Wed, 09 Sep 2026 13:33:34 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:34 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 1/6] curl: Security Fix for CVE-2026-13608
Date: Thu, 10 Sep 2026 02:03:19 +0530
Message-Id: <20260909203324.765094-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245494

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-13608.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-13608

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-13608.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-13608.patch b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
new file mode 100644
index 0000000000..4df7595c8f
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
index 7497337cb9..c20987ca29 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
+    file://CVE-2026-13608.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


