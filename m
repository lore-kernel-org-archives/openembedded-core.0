Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E15C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 12:32:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.48410.1685363572506343567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 05:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=PTKcsJ0W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso21417685e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685363570; x=1687955570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoWgyxGO2q6QFWq0h6cu00AS3nAd9rUR8hbedKixUp0=;
        b=PTKcsJ0WGYl6tGQllLu3yip2YFgYyBnyx2/HaXLD2B58zWbuiPsz4qIKs6xqJIbXxH
         1RAnTQCS77tUvN3CarNd5bJu+OF7/jYdOhkxIKnuEe/3sSMOM6JNhzrscUbFsI8Ayw9x
         E86++Z0QDOkYVsE1W8WVGMNEqmz9NQz3Ei+nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685363570; x=1687955570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoWgyxGO2q6QFWq0h6cu00AS3nAd9rUR8hbedKixUp0=;
        b=EPudJnJ13LaRxSalLNp1s94WVQg+oeuFZ2KzhyT2DP68TtPZksqoA6rMJGA8pDWQCI
         r+Qm0+wtIuYJLP1oCmM7GTews/bpv1GzOgHwrJsZIKlli/aqNg/RKXgYK1hxc2WTRzcC
         gGNpSdZVufvEdR98efITQqow3k0qygXFF2wXe499/kEMG4WD2XrzgnNBVMvLiiB0AE/F
         /GEDlmRhCwe75nkpJVB2Q1xLETn/LOQAzHVLq83rPcjxxq5abYkJG4fFA/+EjGij+SWV
         f9BojMLJ3d4XrLw8QN6VHU8IqJAIReA6n9weTlgS3k5JBfUDOFUlmOdCEem3Q8g/1Spf
         6xzA==
X-Gm-Message-State: AC+VfDxFTSN52SNTsLDUfy159qp943WVqtUcWTyl93zIwPTSpDk51cU9
	WU0rNG2OYwsE8pl5rOwhH3gxh2dLTmHwKLsrbHA=
X-Google-Smtp-Source: ACHHUZ4doMnmyaHwDgZ9ib5j/eeapLpeAvsjSu8xQGzq0r/tb8kBi6IoVhdEdfq5fRV6YrUKGae9CA==
X-Received: by 2002:a7b:c3c7:0:b0:3f6:38f:aa07 with SMTP id t7-20020a7bc3c7000000b003f6038faa07mr10042559wmj.24.1685363570288;
        Mon, 29 May 2023 05:32:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c378b00b003f195d540d9sm17801241wmr.14.2023.05.29.05.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 05:32:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "python3/ruby/shadow: Revert add libxcrypt-native dependency"
Date: Mon, 29 May 2023 13:32:48 +0100
Message-Id: <20230529123248.3128648-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 12:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181869

This reverts commit c6198e1b1c3e3a3413b6ff9f014b40114f1850db.
This reverts commit 167c2c9f15c1bfe401c0512e420a76fa1379c012.
This reverts commit 65532fc751dc00e5568e256166f7b259d3a3c06c.

The dependencies should not be a -native in the target case. Revert
these whilst the proper patch is worked out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
 meta/recipes-devtools/ruby/ruby_3.2.2.bb       | 2 +-
 meta/recipes-extended/shadow/shadow.inc        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
index 1ca4ad35bea..421a305e22f 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses libxcrypt-native"
+DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
 DEPENDS:append:class-target = " python3-native"
 DEPENDS:append:class-nativesdk = " python3-native"
 
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index d1900bfa4bc..481fe7c23d8 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://LEGAL;md5=bcd74b47bbaf2051c5e49811a5faa97a \
                     "
 
-DEPENDS = "zlib openssl libyaml gdbm readline libffi libxcrypt-native"
+DEPENDS = "zlib openssl libyaml gdbm readline libffi"
 DEPENDS:append:class-target = " ruby-native"
 DEPENDS:append:class-nativesdk = " ruby-native"
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7206bfdf020..cf05a3af93c 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
                     file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
                     "
 
-DEPENDS = "virtual/crypt libxcrypt-native"
+DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-- 
2.39.2


