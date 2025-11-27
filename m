Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA14ED111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 17:41:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.214.1764265303936530624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 09:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRopWNuv;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so10454065e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 09:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764265302; x=1764870102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxZF00LexhWYpNNKmUHkaAQnIbrQHU/wtYy7MAO+sXY=;
        b=CRopWNuv+w1L8l6CYey/GphZv0cJ7502FYsEXpXxDVsm8HTflA/U1YqSOeOqBgYbvd
         LQo1VqAT8qGw9NEBKrO+POMNAU1Od07fyavUuW48/fh0TXCNRAhSCbrh78XS+Iwtzoc+
         PDGNli54KhAKUwUesqXNWvwcE6ZWQ4OywNA1KZZ2L4p3knNo8RwXDDu093giDLF+0+Qc
         X6rgB+SbpuBTtrAJQ5NHzEcZSuHDGnRrP4W5z19u7UUBbIksc5Y7QzS+HUFLH4S2NzfB
         OCSmcpaAlLDmfOnzVC/I8+BKd6OvXDFqZ1jf5Xfp4xxCK6rohCB5eYEyN4POi5tlJeDq
         SRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764265302; x=1764870102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxZF00LexhWYpNNKmUHkaAQnIbrQHU/wtYy7MAO+sXY=;
        b=tj6Ee2o6MHHYwd/HEQG2ndESyZQcUZdbiq2cicJpdsQ4hXqdSyavgp68jzN923NUOz
         Yy+kom+q222hc6bnf2EYLCtLEcm8sr6lDSNHyPR8bQ6eQzMHUEiINEDI6n1IedpJyTl9
         8faHBDlicFH7t+ARTysxGt1sk6Uc0UGqW5lhSiuezrQUBFtmU1sHpnzz1oWsl8lTol7n
         uSbPipbY5OLoCJgc0dIhTwDQxoCPsOA6Zi3ky2coY9cM+0vGuQ4WlEpInQtTiw5Xwn1O
         KOGwjPs50U3x3YActvqGOAWaxI7k7b9bmaorbYgrvwNm635UJ0uzWJGgLUaQx8FnH71Y
         0dqA==
X-Gm-Message-State: AOJu0YxG2TD+LoiahDB8tlhMk1lXPsiQUMnqnEU8xD2pUWuM9C+d+hOQ
	IC9cMxSZQvMT0iOsVwmtbCbsSkk57AUze+DlB19dIO0JXNpuDYGgKCktKpmwOg==
X-Gm-Gg: ASbGncuNGhzfMLiES3DO84obAmZXxZRDghaWtnuwUCuGgqDOyTnr93ePwGfo5phIXYF
	YBO0eToZGSNckytpogM4LY4hA60jPpuq8XebiOjEPFGgCevNNd8qlkmKEJd4lEHWj9e/+MsBNwb
	znVUNoT4XXFfThfc1bpEHc+xLjJ2IMBe4zI5PadhdifIdy4CKD5pQmlUlmiP+QqDhxhfcGcx2rL
	8jSDwBSU0KXspvvxptITUUaCtpt6jeicv2OOYrwqcxHskH00e+BsaSWs2l3ojCLLxxbZp1gOjZQ
	pHV1oEkLexGa4afdzbc+aTD5AlcTUjfaYAG2T0JsfSUYhW6+yuR9j+21n6ntbaYJA/Nqf38I+NK
	f30XSRNv1PJhvoHndkGVSM2n2cianJWKEVY28zZ2TeOJSn4rcptCISUUDEaesJon6ihs7l1WYS5
	tjBSC3WwIi
X-Google-Smtp-Source: AGHT+IGZDdxEN7vucVrUH9ZGsxwOFAF6hyVuaMEdBJyD/uavCEVNc+6LxXQiIzRstB5P/f1d6SqU9w==
X-Received: by 2002:a05:600c:3ba3:b0:477:aed0:f403 with SMTP id 5b1f17b1804b1-477c110d91dmr236395515e9.8.1764265302201;
        Thu, 27 Nov 2025 09:41:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052b3f5fsm72374025e9.4.2025.11.27.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:41:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ecordonnier@snap.com
Subject: [PATCH] opkg: enable ACL only when present in DISTRO_FEATURES
Date: Thu, 27 Nov 2025 18:41:40 +0100
Message-ID: <20251127174140.906490-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226854

During the last opkg update the application's ACL feature was
enabled by default, which requires acl recipe as a dependency,
however it wasn't enabled in the recipe, making compilation
fail when libacl wasn't in the sysroot.

This change adds a PACKAGECONFIG that makes acl an optional
dependency, and it is only enabled automatically if "acl"
is present in DISTRO_FEATURES.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-devtools/opkg/opkg_0.9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
index ed2f36d636..0b3bb3d24c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -31,7 +31,7 @@ inherit cmake pkgconfig ptest
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= "libsolv"
+PACKAGECONFIG ??= "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
 
 PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
     gnupg gpgme libgpg-error,\
@@ -41,6 +41,7 @@ PACKAGECONFIG[curl] = "-DWITH_CURL=ON,-DWITH_CURL=OFF,curl"
 PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
 PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
 PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
+PACKAGECONFIG[acl] = "-DUSE_ACL=ON, -DUSE_ACL=OFF, acl"
 
 EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
 EXTRA_OECMAKE:append:class-native = " -DVARDIR=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"

