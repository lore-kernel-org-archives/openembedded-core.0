Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.6758.1612523676274679608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 03:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q3Uv8FNv;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id w2so11257164ejk.13
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mCPuQnOMW9qzZqX2o8ZVo7SuoIRsFmSDEB5cnkhKMsU=;
        b=q3Uv8FNvNnPGLJukjLjvoWtu6DJRPwEgg8EZ8nMto/fkj3PIKjQylMgJNtfvy86WET
         Yp7LY21pLb8qGLLVquqMSIVU3E+obmXMF8X1tj6Fu0P2QcEPIMknS30ofkttpzB4631V
         Z/uOv5TqcldU+T8yEguympIlT8JzIhAZ8wedYeDD+ovijTdXG5vjE06mU+Cxf5FFP1Lj
         +LpaYl+ae/ABPKsyOnYm/T4HdB75amDfwF5J+X+pinjA6zwkjvGPk2r276vnRuRl9pxO
         +4fKM3RjlbukbQBhpz7MfSdOklRCWbHvx8/vkcfy4t6ZW+lppzdBcnAwl3kRaSnhWkOA
         1eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mCPuQnOMW9qzZqX2o8ZVo7SuoIRsFmSDEB5cnkhKMsU=;
        b=BoxNySAi6h2K4/v0/2Ue1E/dGrw8cZW3dU8ZZlqPMdjQMap7ADrSqrDr+a1JcHZz2x
         pLyRmiLRsaadeQHshKIv5mBGOzLUh0UHDTwN2Ko9JT5Zm2Qb+2tvJeovObaB8QFBEL6D
         7IxKt9DcxQZEP4aWOVzp7mWlg3pVlAK4JFBGoj3SjTSRZ0VURDgh60u84igLxlE2faed
         Zvd8h4Od+Hkwk17TEcJH622tW8+5gNDeYPT9q5ogeSPFsEUzRHFo9m9nOxjmDJm0qAMD
         vfV7WgIaeF2cqt6Co3oKskvxvVyZYE4YSQ+hQajJCg/ZhtRVngklQrX/LHrwDnEokt35
         flQw==
X-Gm-Message-State: AOAM531prC3meZYxzjYZS0t9FBUZILy9jaGx7ulWdQUL7XljYVAY3U7Z
	LbVwlGOdggkC/8fSTIIUOrgEfXN4Fi8=
X-Google-Smtp-Source: ABdhPJzeMrVaw04avXb3KqKtdONH2Vu0eC8A0b1bpjW+AZ7T958MuZ+hefabWebo8cjvT2/9G6Kbxg==
X-Received: by 2002:a17:906:f0c4:: with SMTP id dk4mr3502913ejb.6.1612523674731;
        Fri, 05 Feb 2021 03:14:34 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f016e992fe439d49478b28e.dip0.t-ipconnect.de. [2003:f0:7f01:6e99:2fe4:39d4:9478:b28e])
        by smtp.gmail.com with ESMTPSA id r3sm3835089edi.49.2021.02.05.03.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 03:14:33 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: re-enable whirlpool
Date: Fri,  5 Feb 2021 12:14:22 +0100
Message-Id: <20210205111422.932634-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it breaks KDE's qca and dependencies
* it is not deprecated. Openssl 3.0 (currently alpha) will deprecate whirlpool

[1] https://www.openssl.org/news/changelog.html#openssl-30

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index ffa261a1be..774341c719 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -65,7 +65,7 @@ CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/bu
 # rc2 (mailx)
 # psk (qt5)
 # srp (libest)
-DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
+DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4"
 
 do_configure () {
 	os=${HOST_OS}
-- 
2.26.2

