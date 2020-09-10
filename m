Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20667.1599740597235790941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EhsSjJg3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id q9so5449806wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZyxI9+Au5R3mzq4nU96Aqqx811SdmVBps2W9VBJjbk=;
        b=EhsSjJg3HIu7u8V7kWQxEyC5rPgWHSijbdW8wJWFlCZJKmxXiChEQtCxkoUoepW6VS
         MnJNrMZiRoIkN6EGNvuGUvdg8UTm6dE3hTyDYOR2Ro10O5Pijh4QsmtTp7v2Q4s9xvre
         J0h8ZNYbzeWQSc3QE7XoGJEqyQZRwBZKjXiec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZyxI9+Au5R3mzq4nU96Aqqx811SdmVBps2W9VBJjbk=;
        b=AJpuJFBTGpu7mkSdO7A+AG84MXsB3UMf0ZyGUxNvrR4pV5zO+4rBeZhVJ1kfMJuWrO
         5Z4ZCLVJRmMm+qPurJI/FiFlH04QvDLDnVXLsDbHSDLS2OaQI0vOH0Zg9b50CSTsN/Y6
         WDkoUfVWuVNBb3KlnrO1innCiSNKLgXCjRmXTNaRV18xaZ9Mc5uf+Lg93bcAetFYPdVW
         fQUUkY8lO5bBIgHbFLSaVDebOFqWRfcPjyXmJ+b6yZ6t8Pki0LdNBbzSKdQ3lvE2x+5u
         BCSyAB7ycVdIpeEH2jS24Kj82g0Nwmx+7XT9VsgmiEhKwDmFHvIeoli2LU3QbG8S0nxG
         yJFQ==
X-Gm-Message-State: AOAM5314Qf5VTDqr/XwhlXxhzVtVrgt/OFYhdAZbXSX/WjOo74uMjM9I
	CN+/866AZ3LI8mF1Stg7kzyIJwmSjYS8TQ==
X-Google-Smtp-Source: ABdhPJxz7TWCNuUc3eRCY+iCoEOKFe3Jg3GIixrN2mjlJguLQD2FFR55Ssvl2k9vV7c/60gcXvKgCw==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr8277195wmj.101.1599740595534;
        Thu, 10 Sep 2020 05:23:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][warrior 10/22] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Thu, 10 Sep 2020 13:22:54 +0100
Message-Id: <20200910122306.2040194-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

(From OE-Core rev: 197f1d5d14b8e57295f5a81c03c86abba5328614)

(From OE-Core rev: 35c6ab2501672083cf8b974d8b9c3daa3202de36)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 95ebda7fa15..aba10b4cd69 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.25.1

