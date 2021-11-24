Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B80EC433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:49 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.3999.1637788488029788293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTAgbhEk;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id p4so5046855qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2XmWYQR/IPnZpB4RwdB6c95HN8TSNLPpA4UTx77lEHs=;
        b=pTAgbhEkoaHKLyhxETIm3TzeR98msB8wEMI3jcqUaE7x3xC3KwSOX4HKRceYJNl1si
         /yuC+kUYOkxGKHgOw/AzegBTnoiNcO/ZbCCWbgNHLnpoymEDjSAhWeZYjCDLGKBnpHd6
         m+HpPWBijVDClJdL9AjX2sB+arKNZGWxqcAwP0seXSDtpdtLxLoISLX2wCnq5vRcOg0J
         EqYQE++2kMSf4/oKffefqyezkZCVr5sBWvvqM7S+VTKlbH43sbsZ5GJgu44TsRBJMvJs
         MEl27YE8KFCb6navIIRFscIVZ66yBucEawsbQbXeFh0JpHHuCIM+ZJo3IpbbPWmw8zJ3
         60vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2XmWYQR/IPnZpB4RwdB6c95HN8TSNLPpA4UTx77lEHs=;
        b=ejR19PiNVd47VueAl4SnzfXqhv/z8kq4GMAUIOwGd95Jmjisdt3idNsiK+aOfkyMzn
         jaHUXZzTYpRhh7bq0S4DfFrt8v6uRugbv3q5JLvBt/Pb+ZuIc6+HVDdZPTyek7YHZ17x
         vDKtA2lfErI6zCSyvghv14tAfySo39/fGqJ6hQRDxx6yFC5WaRbHayTVtgKdvF/qj99j
         vw0qQKCzb9WW4yqYJnvy+T2hojzt+NJY9g3I2hABm/K6LiZh0W79bjxFO/wasrQM7FmK
         PQsta7FOl63nItFKzyi+a0Z2Ykin1++BDk2zHA50uiNen7trCZdi/yzPf7WZ85ok8Ndu
         6sNg==
X-Gm-Message-State: AOAM5329OZGO72ZNEC1JhUBVJs+u5KJ/vjY1P5A2/cUilqAFZ+srYYTX
	C9HqS1WDBrkCoM2teoarnyN0U3PEPfXTsQ==
X-Google-Smtp-Source: 
 ABdhPJwrhs31JxxTdMHU7iw9Gdy+SXl+5BC1V/pN9koIS6+259ABU7Dpvr3hv1Ma1HBnDVKZXKHTCA==
X-Received: by 2002:a37:a4b:: with SMTP id 72mr1488417qkk.725.1637788487209;
        Wed, 24 Nov 2021 13:14:47 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 18/20] linux-yocto-dev: introduce dt-validation PACKAGECONFIG
Date: Wed, 24 Nov 2021 16:14:24 -0500
Message-Id: 
 <95d9a2e9dcf95e0539e0be86abb0d6d96226af84.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158764

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Add a PACKAGECONFIG to control which type of dt-validation
is installed (full, or wrapped).

This is currently in linux-yocto-dev, as 5.16 introduces
the functionality of required dt schema validation.

Other v5.16 providing recipes can use the base functionality
as they desire (with or without PACKAGECONFIG).

Over time, we can migrate the support the the core
kernel classes .. in particular when more providers are at
v5.16+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ed94ab2517..6b6ea9a7e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -39,8 +39,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
-# yaml and dtschema are required for 5.16+ device tree validation
-DEPENDS += "libyaml-native python3-dtschema-native"
+
+# yaml and dtschema are required for 5.16+ device tree validation, libyaml is checked
+# via pkgconfig, so must always be present, but we can wrap the others to make them
+# conditional
+DEPENDS += "libyaml-native"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
+# we need the wrappers if validation isn't in the packageconfig
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
-- 
2.19.1


