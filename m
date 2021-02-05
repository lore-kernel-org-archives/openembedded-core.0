Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6840.1612524759030421935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 03:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZG49ZzWZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u14so7336312wri.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbaIHLMFdus1dW3GG8Lvl5xiOX3/z77epR4nOQIK5bk=;
        b=ZG49ZzWZ4H7z6IWAMX0DXBylF4SHiMHPV4VI9vQpMtfWEyA/pnsibk1V9gqYfCQJeZ
         8duO3Njo+KPdH+dBvSCcxFj/PBubK92FF2FdnZzkRd2VAtuoek3gVMCml8nkMC6PZyt5
         so4MpPRqRJEvISFsXs7nuNgkw/ICAN4lr79qzOF7VG5dhYZvUsYKTpiME8l1htuebuCD
         vPkhRAnnaYFAUyfHef0RJX4VXc0N3KO5lx6hFkwnHSqiFX0JxQlW1ZJQjX/B8IdWGv4z
         YZP/XXM6z6D5yjSiC9VmZBywWVwD3TOiI8wfRcjz1sgv5ExKkf6T847ps8Sjwl2FsBM/
         mKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbaIHLMFdus1dW3GG8Lvl5xiOX3/z77epR4nOQIK5bk=;
        b=dcFbLk6YSHPlocqPlYNxxpF/cmi32ZZ/46zXNcPyn3cykuzpt9EJopSZEHHchsl482
         TLpI6V2e39Zxqvwz4OruyOdCRC91qhb/RYRkip2eYNEkSRAVlopTpROr2JEpB1OLuvTm
         qqSxblChjjKZdyo2TNmrroFojM2F2fIIRbu+48wsFmyhZb4uNnnn+C/3uEiR/HD26zP1
         xsh3pyQzy7+yJVagIDGqApJsJZz7zfTsgqbcKrCvkwWGOv1kEUFD9hlXqHhj1gmNqibU
         BGV3mazgKg902++c24q+8PazRMHbBT/2InN2rxvcLqUvWqqonwBAOvGBYvqUrP1KG7RE
         GfqQ==
X-Gm-Message-State: AOAM532qXIlXCFgNTjlrxIiJJ20P0+BOBmPUe92UxHSAcxRB26UTlQqf
	VHdfDAmCPMLYPjF7CD9cR4WsP550pOM=
X-Google-Smtp-Source: ABdhPJzrLTo8lFEbAd3UbG1IdS3tYDSNk9B5lKuSUbD9ziXSK3xgBYbrUK8kdLqfRupMb3brfU2lng==
X-Received: by 2002:adf:e392:: with SMTP id e18mr4466128wrm.116.1612524757493;
        Fri, 05 Feb 2021 03:32:37 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f016e992fe439d49478b28e.dip0.t-ipconnect.de. [2003:f0:7f01:6e99:2fe4:39d4:9478:b28e])
        by smtp.gmail.com with ESMTPSA id c5sm11782375wrn.77.2021.02.05.03.32.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 03:32:36 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][V2] openssl: re-enable whirlpool
Date: Fri,  5 Feb 2021 12:32:29 +0100
Message-Id: <20210205113229.933277-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it breaks KDE's qca and dependencies
* it is not deprecated. Openssl 3.0 (currently alpha) will deprecate whirlpool

[1] https://www.openssl.org/news/changelog.html#openssl-30

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Add comment for whirlpool
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 5617f337e0..99b1566740 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -65,7 +65,8 @@ CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/bu
 # rc2 (mailx)
 # psk (qt5)
 # srp (libest)
-DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
+# whirlpool (qca)
+DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4"
 
 do_configure () {
 	os=${HOST_OS}
-- 
2.26.2

