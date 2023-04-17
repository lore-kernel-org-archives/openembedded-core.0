Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4E2C77B61
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 05:01:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.47243.1681707655520024137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 22:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TEWp0Nkd;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a66b9bd893so9954285ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 22:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681707655; x=1684299655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abHRGLHJ+MZ171r9kN1OatHVCuBr2upOu/Mx4tyhJAQ=;
        b=TEWp0NkdEWCsPCAo9tORzTJYwCiCOP/0JXLk+3FPW95GhiyMYISOQRqSGAMM29wI9B
         YUfEUFq6CPGpj5Qb+HOLlwpsJeeCel1ywpU0O+U1Xlh2RK6T1FyPl70GA2tLmSlTtu4g
         hqr9Fo2l8gUKGNRRTmXAzCA1jLPiVMGTEWPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681707655; x=1684299655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abHRGLHJ+MZ171r9kN1OatHVCuBr2upOu/Mx4tyhJAQ=;
        b=i92rMU4q/ieqHP6zncMxyu4OOmZzetDUC2ZMbnRqZ2aBCKHWRZwb+XNHj6+/qysDNB
         XWVtPP1DaTsMvVNpqXnAuvAwTzmgpQN49nuQWOhwRvvuIfr6D5jHP+kYk2bDOocxGMRW
         zWqDHmgbhdTMe/5vMt/8LscvncOquRApIIYxShyTbJ8Ysu8vtz1mByQ2FoEgdvrxQjmr
         KgGg13YAHi1pSZTZT+a+Ti9r2o6X1V8ZZm/ILhOyZoh6d03VIzjHxeEscvRfg00aiNoq
         lN/fAObWZz9p+I32FULYCgKMy1VXd6g2JQfp6LCD0PyIIKk5XTvrs4n46bf9RUBac6NV
         W07w==
X-Gm-Message-State: AAQBX9f0NGHW6pvWr9Lq4ZWXDdax76ECMH1+n4XHVzU/zNpI2iCV6cbD
	u2TMSjkb+SAzrFXYlwob/HB6oL0AUk9p/VpR4/Q=
X-Google-Smtp-Source: AKy350aDfzFSfYa3uvcmVrxQ/QXQ1sisAaHU3nmC1rkx1BwcmRBIaSf2E5+2ww5fgDu/vkWhqy7trw==
X-Received: by 2002:a05:6a00:2191:b0:63b:599b:a2da with SMTP id h17-20020a056a00219100b0063b599ba2damr18018952pfi.27.1681707654772;
        Sun, 16 Apr 2023 22:00:54 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.209])
        by smtp.gmail.com with ESMTPSA id x17-20020a62fb11000000b0063b96574b8bsm1102348pfm.220.2023.04.16.22.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 22:00:54 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 17 Apr 2023 10:30:49 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] curl: CVE-2023-27538 fix SSH connection too eager reuse
Date: Mon, 17 Apr 2023 10:30:48 +0530
Message-Id: <20230417050048.73565-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 05:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180118

Upstream-Status: Backport from https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
new file mode 100644
index 0000000000..6c40989d3b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
@@ -0,0 +1,31 @@
+From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 10 Mar 2023 08:22:51 +0100
+Subject: [PATCH] url: fix the SSH connection reuse check
+
+Reported-by: Harry Sintonen
+Closes #10735
+
+CVE: CVE-2023-27538
+Upstream-Status: Backport [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 8da0245..9f14a7b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1266,7 +1266,7 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
+-      if(get_protocol_family(needle->handler->protocol) == PROTO_FAMILY_SSH) {
++      if(get_protocol_family(needle->handler->protocol) & PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index a7f4f5748f..46ee25da3a 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-43552.patch \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27538.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


