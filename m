Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1141C25B0E
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 10:45:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.9215.1660301118933046209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=btGYSKxn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 d24-20020a1c7318000000b003a5c1bf4f27so341421wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0bCsZ1SoX9ybRQorcZn6cnh+1mIqa3cphjeptmNN5Ls=;
        b=btGYSKxn1Foy0ecIcwBRcY6amqGaOhJRbn1HpYzRkgi2+iQMKcHUxVsEO4DYb6ja9D
         F0VoYWxcOrdQFbL7BooNXpgxlsMYSwjAXxSc7e9uBFB0MKzRmBKEKNzHVV8Er0t44VAf
         n/duzj0o7lXFfR4DoF54eZiBXwJ8KqXCuUH5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0bCsZ1SoX9ybRQorcZn6cnh+1mIqa3cphjeptmNN5Ls=;
        b=6CEu8p4VMsT56EAWVWa0OCP9UN7d80gy8PCMi6aDn/jWUO3ZN9VZBmMXrPG0XCCzmy
         vI7ANKJ29Shl+5vktSPCoej8GtH8bBg2a2caSx83iYODN7W+bjZ7XvVucQSh6NOltxVv
         DSSapJAWe8Vsx34u820X4wM8Zw+vCg7dejk72vjB36LeNtM0oQVhIKWyp+mc8YVjVIUj
         b/mVo8gFZlaXnkT6ZoEUiWLdtcjkKT0nAOYwLYxvGANeEhCQdV2szZzs6vaJFK1y1/cq
         TPi9KidXFP6CAuae2dAogD0Yvwqly5aogkPQX0JejAcgtRjZv3Kj4X7sLyKbv+tsEmyX
         CXAg==
X-Gm-Message-State: ACgBeo101VD+lbaHhyaOTFT0IT69ilCPAQguAS7+dD2Sv4PcfBFhH+GV
	JRnYuK7xXVVffmemtPML5CYpUcCzPw5B8A==
X-Google-Smtp-Source: 
 AA6agR5d9nhyjxHVTqt/Wg3iViNWt4zjy59bi7wwLKdIsIzWzm96U7YOJNct8uqY1dzdCAbZuYpjqg==
X-Received: by 2002:a05:600c:1e8f:b0:3a4:e0f0:4bad with SMTP id
 be15-20020a05600c1e8f00b003a4e0f04badmr2216313wmb.133.1660301117159;
        Fri, 12 Aug 2022 03:45:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c425:95a5:4141:7147])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00220628ef654sm1587732wrw.24.2022.08.12.03.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:45:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] testexport: Fix to work as an image class
Date: Fri, 12 Aug 2022 11:45:13 +0100
Message-Id: <20220812104514.825820-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
References: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 10:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169279

The class is mainly an image based class but one recipe does need to look
at values shared with the class and isn't an image. Move this to a conf
file instead, avoiding the need to pollute all recipes globally.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testexport.bbclass              | 5 ++---
 meta/conf/testexport.conf                    | 3 +++
 meta/recipes-core/meta/testexport-tarball.bb | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 meta/conf/testexport.conf

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 01656455e84..98468c96fd1 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -23,10 +23,9 @@ TEST_TARGET ?= "simpleremote"
 TEST_TARGET_IP ?= ""
 TEST_SERVER_IP ?= ""
 
-TEST_EXPORT_SDK_PACKAGES ?= ""
+require conf/testexport.conf
+
 TEST_EXPORT_SDK_ENABLED ?= "0"
-TEST_EXPORT_SDK_NAME ?= "testexport-tools-nativesdk"
-TEST_EXPORT_SDK_DIR ?= "sdk"
 
 TEST_EXPORT_DEPENDS = ""
 TEST_EXPORT_DEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
diff --git a/meta/conf/testexport.conf b/meta/conf/testexport.conf
new file mode 100644
index 00000000000..d7c28de7a75
--- /dev/null
+++ b/meta/conf/testexport.conf
@@ -0,0 +1,3 @@
+TEST_EXPORT_SDK_PACKAGES ?= ""
+TEST_EXPORT_SDK_DIR ?= "sdk"
+TEST_EXPORT_SDK_NAME ?= "testexport-tools-nativesdk"
\ No newline at end of file
diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index bb9f8ded48c..abdd0092528 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "SDK type target for standalone tarball containing packages define
 SUMMARY = "Standalone tarball for test systems with missing software"
 LICENSE = "MIT"
 
-TEST_EXPORT_SDK_PACKAGES ??= ""
+require conf/testexport.conf
 
 TOOLCHAIN_TARGET_TASK ?= ""
 
-- 
2.34.1


