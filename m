Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BBECA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2517.1755816203603399870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTdkqFWC;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso223052266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816202; x=1756421002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDLXCQdjEYHG1u2IGGnocVwlrpBjtfN0p0EAwgiOjwQ=;
        b=MTdkqFWCX4Ii6+tEdRmtnF6hz9BFkOIGX3UjC0A0YiWS0xA13bLvUl4gey1+gyIVGq
         C84/jlWYw1ENJ9EPdWzq0q9xRXZ0oa69gRrap81Ylzy11gWJJVY9gJUjeeBEaVwcG1va
         bEEdnrETz6eWsmMoyEHAzO9T/C1OyKbkYyPC3MkNLVjeyQ7E6Zbzz/xre0wTG0221UhY
         pvHJmaKFioORlIn04dGMl/IfAqMltfrHWxj64U2zktL9AOebKvWETBraTB0f7z5o6eiy
         1moWmnflMIFHEtG+v1w3KZSGIZbBriJI6Cnqo2utimFw3aX3B8Q0H8CGL+5KMS9HJJ6U
         z5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816202; x=1756421002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDLXCQdjEYHG1u2IGGnocVwlrpBjtfN0p0EAwgiOjwQ=;
        b=lY7vkhRHrWRS+wYddcaLKZE/MGyor8xc3Btre46HOqXTa8OdTJPw9Ptv8Nlraox3ze
         Gyf4HZxEBfB+vN+uVSJaMZoUmRFBIHQPkcSKzF0lkKuiypnp4MWZ5fjRNiDbbCC9Wg56
         f2ouwW0sbAtiseYrZji4X8MBzGP9NCi2Z5BFgdGKquUoafNCpK74bnk3u8Rb61je/GAn
         Elo+YJ83uJstFQtFTog/og08S9j2npNEXB7J0Q562qlBFvgxqhVcHE4yRTrRyybhI11T
         wXqhVjAG7KsQRoSoQc1fAvw+JkZm9RlZEffOGLh9iv3eSbxBJ0sh5mEHDUu+5DJXv0pe
         KW7w==
X-Gm-Message-State: AOJu0YyMsAmR10iOHe4MYVe/77gBSOISmvZlpG1VeKLj0YKUIhPUghbP
	UNJrZhQ1BLtEv0IIN00ynmGHMlppD6Qo8DRYyZHlVkuERvVlaa2e8E+G4AHWPQ==
X-Gm-Gg: ASbGncuHM3NcwD8ZqediOjwYZgBKO5GPyBw7Rw6Aq/P3/K8fDrbDJ3Cw+R34fPlOQLv
	HBlBZrshP+twaiVMuINUaDk9zQVx4pjqflx6fTApGQa3YJK3bp/93pRiOKfCy8FCr6BHl0pHEZT
	enC4sO3TjoWPQuYgv9k4y2Cd9MRemp6bAImRzyb2DvkSfBqpUXApxqAMcouDjMHkIA8rNKVSqg9
	z9ndmqrhxe8npGQgSo84m9F1axOaIvrghOE3bUB0LuUQzo7XQ3rh2SjK37Z4Kt295eJgYdrhApN
	3C6i6HdE59afzvdu2nbqeNqW2PpodZ5M02gw/a69ODinqlgQbK1TMD4O38LnwOOzK+VSCStAUpd
	HvhaRP++0Yx8S21hP91PphwVOPCSuKr33UVVE7TCAxpZm9STHsXFXWcG0
X-Google-Smtp-Source: AGHT+IHj4ovP9cb9cHu76kGnVX/auU9r6AzifUE9RGIWkuGgz73uAkwJ407x6u9IwXI/OOXTO76sEg==
X-Received: by 2002:a17:907:d06:b0:af9:6065:fc84 with SMTP id a640c23a62f3a-afe29437cafmr69499466b.27.1755816201854;
        Thu, 21 Aug 2025 15:43:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded478bfesm471251066b.60.2025.08.21.15.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 01/15] unzip: Fix build with GCC-15
Date: Fri, 22 Aug 2025 00:42:55 +0200
Message-ID: <20250821224314.1690103-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222286

From: Khem Raj <raj.khem@gmail.com>

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 0000000000..42a2f81681
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008e..0a88b4c092 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

