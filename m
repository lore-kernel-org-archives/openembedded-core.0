Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F72C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 21:15:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.1396.1666818928801709983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 14:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhBncBDy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5so3348393wmo.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDzWNnKQyxXJR245l4cEru2l7w09efRnjkf9gF2adcY=;
        b=WhBncBDyvAX020ffrfXgeOD0vr9bXgi/r/jd5xxUcSRM1CPpmq2TxWUexHCya4PnB/
         IZElzwT1FQz99cDnXvjKLc1lfrWrDBTcU/DMgaUMd0B0dxAXFJXIgBuuspLCeTG7jrcS
         aCcmLW1hfbNZ5QGkHihj1eaPu0I9Ji5FNsNCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDzWNnKQyxXJR245l4cEru2l7w09efRnjkf9gF2adcY=;
        b=nFuwKFwB61HwlARudmGuXyl7XDcvDUZsUzRinGkR6965ToxffhnDFmoOk2NE3t0Qbe
         MyRHb25dDx76kUtcB6PKDTG/qnUcGjYvvjPXOA8usUoG8r/G3aFqnbFe5CAyKPv09MUh
         tovmuyZSyUhyp9lynrTKRbn42TQpOvNcnwv+U4sKxWbgNW9/bScv7GEhorkRl/yFSJ4H
         UJhfSuQ+/9qDuLfMa3H1vte71YJslEqAJl4/Dz3refGy6HYTAuuVeaaRNcZp1GdJ4OR5
         /HdWFgi0IjiIPiS0/Tia3uywnRrg0GnR1NpJ1bxPIOC4e+G7PUR9qN3WeEv1TG2dlVwB
         3JcQ==
X-Gm-Message-State: ACrzQf1mFBlCDxmkZ44wxDeuKOs2aV6afgR9wbCvFLBa7xXCi+S7yfch
	F88rPOmBeEi8r/9FpGS3BKQoSqtwDk484Q==
X-Google-Smtp-Source: AMsMyM6yX75URchVddRFiVAA3YnHGWSh26KUPhIJKHvwLb1819/gwzkkCVHvUjvMqTaGPKCN6zQPBA==
X-Received: by 2002:a1c:7716:0:b0:3c5:6e61:bd1d with SMTP id t22-20020a1c7716000000b003c56e61bd1dmr3722914wmi.17.1666818926375;
        Wed, 26 Oct 2022 14:15:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a815:5d52:bbbb:d081])
        by smtp.gmail.com with ESMTPSA id v26-20020a5d591a000000b0022cd96b3ba6sm7475195wrd.90.2022.10.26.14.15.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 14:15:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Fix SSL_CERT_FILE to match ca-certs location
Date: Wed, 26 Oct 2022 22:15:23 +0100
Message-Id: <20221026211523.3793582-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 21:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172175

In OE-Core d6b15d1e70b99185cf245d829ada5b6fb99ec1af,
"openssl: export necessary env vars in SDK", the value added for
SSL_CERT_FILE was in conflict with the value used elsewhere, such as
in buildtools. This makes them match and fixes buildtools testsdk
failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/openssl/files/environment.d-openssl.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 516bbd1c560..6f23490c872 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,5 +1,5 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
 export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/cert.pem"
+export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-- 
2.34.1


