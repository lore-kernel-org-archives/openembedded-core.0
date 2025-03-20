Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3BAC35FFC
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 01:55:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.3371.1742435733720415312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 18:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=klqfn8E7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225fbdfc17dso2656595ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 18:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742435733; x=1743040533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQHI4i2AxajOox5Q8cIIpAaiXlHnL3r3RUD+IqNI18M=;
        b=klqfn8E7jJvCncWjx14xJyhJ+HtxUcFnIMyf7lMD5Ir+oLDKqbJg8FYv9CnmTZxTq/
         TVlQSj80y/2H+KNQehmjdvpqaXdLjgXSRABsJJyJ6ApmO9i0tXyQ3qaShBIuPIARPdL0
         HoAdQqbD3N053keEQjsqoTHolaoEoChOPn1aUx9nDDNLzIj7fV2DnEOYyNjvVS/BnQyS
         m9jB+CynYmBBBBDYDqrJtERC+xQslfZ6kMWducxarguBlQ0KVDEIIsHoZeIcX7G/5q4t
         lHCzo1h1XCRsruNGP6IJQ8mb8/haVkMb1CKQlUukCm39mH4yXwO86z/GgsvH8mGxrtCK
         IpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435733; x=1743040533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQHI4i2AxajOox5Q8cIIpAaiXlHnL3r3RUD+IqNI18M=;
        b=t8rIqGTaGtFSBvw9I/fL9i6yVfZLEGvDurlEALrnn0UkydAbKXI9vhz7ghG99/QQAM
         ZNoY/s2lH8AjLsLoGvQ7JdFursybdYhu2vJBu37oKJhD+khahlmcQh5Zw0xYL4LFxnOC
         +9FSQTGb28hpm0yLNi8eyHmbT9/nu6Ovm0HK2U7PzeMs8Etx9ZkF2KISXSjgx+Zrxp9+
         mM2HrAx+LK1YVUqTgvkgGAIc459qmSM5jpm+ne3UkAXs4K7F3rjUb3T4khDpgwGIzETX
         SNXZfuMDWCA9Il/gPbO7OAAFClDQJ4YhSTwxPb6GWpbU6ElmuG4FjfnnrUDjcH9COSE9
         sCZg==
X-Gm-Message-State: AOJu0Ywd8WIIhj7u+FheClgApuAImYM1XjgKyO7SDbJlz7welnm+kcgq
	3zw1f6fYRgYPKI+6rerzUxZ1xhYTFnmkQRP9wJYz+GpsNrKP3pI+Nu0ahnTC
X-Gm-Gg: ASbGnctKkqzWspbdz+HTyhLjQT2OHI1Ia+5QIsk46SD/b9fGoZ+Owni1j/qkWIyMqSy
	3xvlgp26pj+TVhUzvnaaO3z3kHgFrjk6HiOzl7XZI/Wtmzx1V8Q8YsmcGHh4FlS3v09Nqegd0qm
	y3GFd4jBkYwoqS3eYNgDBPAFB2XeoJVnSH2cbZMMOE3sEQXCkSShFAAJlIvLfRBYP4IGbExz7vL
	NziSEJ01+vcF32/qZYscBc+q1q9Cb8tWD4GdJ1zOrPtHvKcMLLsQEeaX/7+jMd6dSF2pEv1tIiB
	MD2OBz3DMTeDpsBOm5uuMWEpN6LSc9s87crKLCN0JJd53IM=
X-Google-Smtp-Source: AGHT+IG+7yWyr6ezPPTknTbNUb6Mim6StRtG7BxmNmPhvjtajI7v2r+vfzJRh5/C/6PKBYmPGbd93w==
X-Received: by 2002:a17:90a:dfcf:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-301be206993mr6387316a91.32.1742435732529;
        Wed, 19 Mar 2025 18:55:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5d0cfdsm2482667a91.48.2025.03.19.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 18:55:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] opensbi: Do not inherit autotools bbclass
Date: Wed, 19 Mar 2025 18:55:29 -0700
Message-ID: <20250320015529.3212482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 01:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213369

This package is built using simple makefiles, therefore using
autotools bbclass is not right and moreover it is now a hard
error in core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.6.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.6.bb b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
index 3c16656b395..ed1a70d01a1 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=42dd9555eb177f35150cf9aa240b61e5"
 
 require opensbi-payloads.inc
 
-inherit autotools-brokensep deploy
+inherit deploy
 
 SRCREV = "bd613dd92113f683052acfb23d9dc8ba60029e0a"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
@@ -26,7 +26,12 @@ EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
 # Required if specifying a custom payload
 do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
 
-do_install:append() {
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
 	# In the future these might be required as a dependency for other packages.
 	# At the moment just delete them to avoid warnings
 	rm -r ${D}/include

