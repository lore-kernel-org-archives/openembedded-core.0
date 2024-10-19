Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E800FD3C92A
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 18:48:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.11587.1729363711013348316
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 11:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FqM/YCzc;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e6d988ecfso2474858b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729363710; x=1729968510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wl6nLSpkzsyF5NuLU1kDNp17A0V7/m6TQCfzQSJxG4=;
        b=FqM/YCzcr2sXwOw/CYaZKeKvD8p4ok3AFsW/uJfz936TS1bg6Enp+mesASahxR5o5v
         Rhg1vnkSqNEaKJ1GjV8SmVmczZ/tGunfp7SMjAsK7/eNLqXOMPegqSB5rIuaZFNvfDPz
         dxWTYDNHHymZdbDctzbnAttyzlhd6sMSgW7QDaNsvuKYP1Pmn+QfueITciUoT2AS54df
         ZqzDdDshbvVhHcRVltndiDNotByKdcGnQYumgzqcff+WJv64a3A4w8ukwlGzQqSfnRd5
         SMsfH9m1H8p7CBW8r4zmpiNflvWor5tF8iXQWv+W7opBz5MT1ndb2xybCAB6963BumA+
         T6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729363710; x=1729968510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wl6nLSpkzsyF5NuLU1kDNp17A0V7/m6TQCfzQSJxG4=;
        b=XmZJ1JVa50S6snsT8jSCIzm7DZYaLSZeyimxlZJLjBxbcJzGjwFjKCrFiiFJOuJMrT
         OYzZCThqgwMS2QkfnKO7aPeKMoZto8BFykD4GCMRnYIhl1Sb1SKglNY3DFizFXAgnVxr
         UHWVSvlbd14fNlP9Tp1/Ea4nOUcnSmXz40MHLxIUtslpLQX0QsxkmcRbOhLjlkvqCwWi
         EQUgwr3kAzJ41iYGVsP1hxBApn3Tv5/0NxLBe7emjA/HT+OXWehyHVVdo1un+KduQDsq
         P/CJRWMLBJksGygF7/cvlYGbf/yuT0vl0jFoRpzpgYa8OvII8bn1vSBdP/ZWlEnwSWYZ
         VZBA==
X-Gm-Message-State: AOJu0YwBngQKDG2bU4XTpxJQynLkcGYNnlzf8nARYwi9Td2yPuouCqXj
	L1dhu92U2OIKPA5mnm334c4XJJQVQIdzi+WLnSQd6GCaH8y410xAxDI3OWDI
X-Google-Smtp-Source: AGHT+IFuOv6mFM9xCRk9yA4Eoi0nSUJUd17+aebWrYuCUMKZ9XaSzXYclDnHSj14p5/kNY/L3W3vGw==
X-Received: by 2002:a05:6a00:17a0:b0:71e:8049:474e with SMTP id d2e1a72fcca58-71ea32fe902mr8233938b3a.26.1729363709922;
        Sat, 19 Oct 2024 11:48:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6310])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d73f5sm61825b3a.104.2024.10.19.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 11:48:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] python3-packaging: Ignore old glibc tests on musl
Date: Sat, 19 Oct 2024 11:48:23 -0700
Message-ID: <20241019184824.1338594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 18:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206085

These tests expect glibc to be the system C library
ignore them for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-packaging_24.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/meta/recipes-devtools/python/python3-packaging_24.1.bb
index 20bcd55fbad..f8465d9fdb7 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
@@ -25,6 +25,10 @@ do_install_ptest() {
     rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
 }
 
+do_install_ptest:append:libc-musl() {
+    sed -i -e '/^pytest/ s|$| --deselect tests/test_manylinux.py::test_is_manylinux_compatible_old --ignore=tests/test_tags.py|' ${D}${PTEST_PATH}/run-ptest
+}
+
 RDEPENDS:${PN}-ptest = "\
     python3-ctypes \
     python3-pretend \

