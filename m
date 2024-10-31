Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C8BE6895B
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 07:53:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7524.1730361232147127418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 00:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ToWqJLtQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so5515205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730361230; x=1730966030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4U/UKRpJkrfALuVnk4leLilrFqKlOhTUYnftCqHOCao=;
        b=ToWqJLtQSI2zAunZu9/WGHsAxErV294O+P71TDGxDg7gxVr7N6VNeGPr8nW4eWbSMm
         jQUnMBprMsGzI6wy3CBlCTRnb/eR4DYVD2thRKDBSYgT+/5uaFLlXLaxPLCBJ4oLKYQR
         ZjMy/qqV1aYMHmBJBLv+nz+wf5LEkIF7HrO4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730361230; x=1730966030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4U/UKRpJkrfALuVnk4leLilrFqKlOhTUYnftCqHOCao=;
        b=XZ67rp1YUHSEKWsZ6M7ZpBEMNByY/s7T2AkQlN62SS2ayN9u/UkPLzPPGFFWSe96HN
         rIUf3RcciQSIWtvuxNb0AggSM13iGmTGJChnltOF7JgKDmmd0jDEIokTO+mjl7R1iubn
         /DJ6RA9Vj6kRrEG8oDOo66bM38w999v3BwDpi6J4EL2afqm1BSrwDbX75UAIPnoGT7z/
         AG+zR7Z/t9xjuY8cecQ5LF2cXzlqRCIvvuHWXPRJNKnE/UqgOPwGwXenKFGAeMzxGD28
         hUsw+LdA5B2GLvCBiS4TxiLOidAnJYeMmX1zfNnB4vgcBxLISbFpAE62LlxZLbNq5ixz
         OqMA==
X-Gm-Message-State: AOJu0Yy1UpacicWGgq5uPleHepBtC2T+j0vUY16s8Fht6HsGFxj9IfKh
	sgBRJ+t5YsZYdrL9pN5t0XCK/xFz+hnMAWtCMoewkV9/c46HWC/kLe1+Fmn8WLs9LoYziejqs1I
	U3kI=
X-Google-Smtp-Source: AGHT+IFIBvpSYFJz+1fQA7sXmusfr8kCzQFWpNSfDQNUd3BRxKb1pZ7Yw6l5CJtHNFWdA0qwP0DJAA==
X-Received: by 2002:a05:6000:4009:b0:37d:453f:4469 with SMTP id ffacd0b85a97d-381be7c7931mr2059074f8f.22.1730361229804;
        Thu, 31 Oct 2024 00:53:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5ae1:4e1f:1ed0:3d82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm1289004f8f.112.2024.10.31.00.53.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:53:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Fix SDK environment script to avoid unbound variable
Date: Thu, 31 Oct 2024 07:53:48 +0000
Message-ID: <20241031075348.494810-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 07:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206569

Avoid errors like:

buildtools/sysroots/x86_64-pokysdk-linux/environment-setup.d/openssl.sh: line 6: BB_ENV_PASSTHROUGH_ADDITIONS: unbound variable

by setting an explicit empty default value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/openssl/files/environment.d-openssl.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index f90088aab7f..aadf1edcb6b 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -3,4 +3,4 @@ export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
 export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-export BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"

