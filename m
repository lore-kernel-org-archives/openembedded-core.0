Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E64D1269D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 10:25:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11983.1764757539955243245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 02:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Sd8D4BaD;
 spf=pass (domain: snapchat.com, ip: 209.85.215.180, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b98a619f020so4964628a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764757539; x=1765362339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBAHCWb7qvg3xkzor15L4k1mdIZn5aDGRRipS7NFov4=;
        b=Sd8D4BaDwpXmCkzsS5nRjSVHrz6BzHS8tXcQtCQezbBwygsqpL5tXT2m/GXSd3WU9H
         nLrqmecsc8YKhtQmPR8Yt9zdZ+HDb/821YqO0oZO12O0YB1+D4Sk0zDtGZ6DYV4sQhiP
         VcD8TGQrkPxaFblugW1DA1PGXoQUto9Nbt/Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764757539; x=1765362339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBAHCWb7qvg3xkzor15L4k1mdIZn5aDGRRipS7NFov4=;
        b=GafrYLHkMXGC/6wLsLFr6odX/ezYOGCkk70JHVNMXKTjbIACt9RuNrZ9dA6xaYzunJ
         oFAl3AxO16SEzEDHAWS1Am+eMOrPJWBv1Qt1bZpiAOdRW+oeds8PBQEo41pFFfE98J4A
         JQ/QSP4ZvjL2xeMe5SLMoTV4ztUe9gohCrzOExFpLJSeJ+MgcLxx59ZdXOcELv6QTRtA
         z9PMzjzP8+QqxOey2O8AgdASYE3FdT+uUz4oMS/XCAuQNkVZRsHjQXHmVYvaTLqnZywS
         aA003p+aH8dthzO6OoO+kacuvYXWfmR0gYmWYhdL4b3o4I/Jd2phl4bXkajxRxVniMJc
         vJQg==
X-Gm-Message-State: AOJu0Yy/JCqR2Y2MjO0WJAhnVjaoviRcFgq8nPmqsD4gOM90LgHVmyxm
	hb62WXz8L3PqB18niYSyOBaolv1CmqvGd/YWnFdB/ZKc5fdC8BAPqP3uYRcJQjlhEwPFsoCf7eX
	vE+X7iVY=
X-Gm-Gg: ASbGncsQNvh5uepaH0+kTpWwGqpROn+Z7uTZ7aQ0Hg32mRsyEpBxcKYq3Wd3sGr0tWL
	5rvspJeDYdfkzLR+a4k2zHVFGRlOTEEH2vv/Kst9KDq1V0q3tlXUQw1GFq4Uio1P2dWWqSBqnqo
	ouD3D5r08lNwb8G7PrFwmeisfxcLvtjJ2kSIcDF1jyrdq0LOcHlP5cu/eRLk6qCRGeCfy4TaDRz
	5OvkuKInjcNz57j69cr7qUzv6k0liN8oncuA/K9QN3Jyp1w4kfJ1IPwEnCG6L+nKeGiCf7bTfYF
	iHLB3VXyXTPRdzV4PXxIE09AGFFJuVPBx32FkJUI71pwUhbgoUPJ8bTiPaTbkG10CLr09GsQuO/
	yZKlnTj+HtYhsVKiJrMKMC3XmLvi77LxQHv7TbGBoNMfNdZ4oQWInl5NnC0V0qXuUQBZXmiexne
	4tLPvQXQUryvhk5E3zGXZR4Vs5lFhboNz6HcUvzMcXUCXQ5kLMoCvrSA==
X-Google-Smtp-Source: AGHT+IGj+Vlax1M7LNT4eNtAnZqIJG5NR2c70WWH2d5e6dUvqoXyIZMNHcs5hK3O5cFDN31qLiJPDQ==
X-Received: by 2002:a05:7300:de42:b0:2a7:127e:bff4 with SMTP id 5a478bee46e88-2ab92e2e0c9mr1044023eec.24.1764757538565;
        Wed, 03 Dec 2025 02:25:38 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee660asm91345650c88.3.2025.12.03.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 02:25:37 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [OE-core][PATCH v2 2/2] opkg: add PACKAGECONFIG options for acl and xattr
Date: Wed,  3 Dec 2025 11:25:14 +0100
Message-ID: <20251203102514.3969401-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203102514.3969401-1-ecordonnier@snap.com>
References: <20251203102514.3969401-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 10:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227214

From: Etienne Cordonnier <ecordonnier@snap.com>

During the last opkg update the application's ACL feature was
enabled by default, which requires acl recipe as a dependency,
however it wasn't enabled in the recipe, making compilation
fail when libacl wasn't in the sysroot.

This change adds a PACKAGECONFIG that makes acl an optional
dependency, and it is only enabled automatically if "acl"
is present in DISTRO_FEATURES.

It also enables xattr per default when the corresponding DISTRO_FEATURES
is enabled.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/opkg_0.9.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
index f021fd9b5a..7551f1bc49 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -32,7 +32,7 @@ inherit cmake pkgconfig ptest
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= "libsolv"
+PACKAGECONFIG ??= "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)}"
 
 PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
     gnupg gpgme libgpg-error,\
@@ -41,6 +41,8 @@ PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
 PACKAGECONFIG[curl] = "-DWITH_CURL=ON,-DWITH_CURL=OFF,curl"
 PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
 PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
+PACKAGECONFIG[acl] = "-DWITH_ACL=ON, -DWITH_ACL=OFF, acl"
+PACKAGECONFIG[xattr] = "-DUSE_XATTR=ON, -DUSE_XATTR=OFF"
 PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
 
 EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
-- 
2.43.0


