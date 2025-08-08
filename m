Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CCAC87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 17:31:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.28224.1754674286679436323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 10:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WX8JrFR7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af66f444488so358895766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754674285; x=1755279085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9RxYa2YWuIQp6hqdqkcR/Bx/p2blOm3hcQ1r8NGx7I=;
        b=WX8JrFR70SOdzwA8/acotTrkVXZqoswwvfM64eUdQIRXwzMnAXBKneZYZeEu8vqdmG
         W6wIjiQg9q+52ifkn6nI3V8UU3QT7foooW6jdHSvyTCXsOzKTJrrbls9ly8T+TQjKIfQ
         8EBl5WQlCI41iNEDCXTclSRvN03xo3OjWwqTAxVNffi+6shopCA0W4y/8QcNZV5EWJ04
         UX02C5nskpT8HU73QPPZFMCnrwl/dszaRdhArGoaMdLjcijp+wLYTuuzljmpx9IIETcW
         C/dEITCgFC26xyrii26QUA7bTxzeaRZKriTirdCwuNazaJtLW6LgXujuB9JOrMILfsnC
         IAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754674285; x=1755279085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9RxYa2YWuIQp6hqdqkcR/Bx/p2blOm3hcQ1r8NGx7I=;
        b=UDX2y9Iwb5iyoSEcneyRWU0z/Yq4ISbfob4EelfAI/8XXCjqJAwxxgsenKiVd+tEol
         aHu1gK3AJMQIi5ohih7nhb1/N1M3pdh7ZucPspeEHGqR5IpFH0TFIoiLgDaL88BwOmNr
         zOlsubm7uLvtOAhACIUw5zQVqah7aaUhKL3aXJgaMw8NBDfiEfcWAbjYvQI4KodCM2Bj
         fF9YVNuJ1N41dJdaKKVt9kd50ywZY1gfU/kNB8KmPv7gmLRz8ZxhKOPFtoqNKdF8vzTO
         bfRyWMTkZ9QAkuSEN71bJg3IWpoWBTDAaGQHTsZ0rrrRJW133DEtldDxamh+sL0TO9oH
         ON8A==
X-Gm-Message-State: AOJu0YzxMKt8cc7aqPZHvQrJb37kr5v57qE3y8vck2Ihj1iHaX8PpH/k
	tyqWAV2L2nvxgqkL0ayPdacrCYaHNbWNapYcPItXESdvJ7KTUKyy2lBEKCrcsA==
X-Gm-Gg: ASbGncvwtzOb/As7VwG6XWs0yRDyeiBvJJaMyCfWa1lhwcHfykRGKMzqjDWqJNjOWRe
	pagVaGFoRJDcL9X2SwtFT5v82xp6pP4j6PPDHLAuHIjvdjB/oIDXQx5UPXVFmutR/fvh6+iqrN9
	YWYbC1LSvqH7jszQFpIWMU/jLVc5mMmZuwlqb/UwQ6teMxRADGpV6a8UC4pjP/V0CzCGTM5jMOB
	+31Pd/vK1SwZqGoNnTsPnbvj7o6UNCsgWpWzTBuGpybmcxi+zvFHk8PTEDv7AarJejnGo6UxlMJ
	7K2Grjlqu16h2+Z9Noson1Mj+UvDh5ErXtcosiJVSumghfyYCCWFvKJ29sGYzL2VMUdaB12CB2j
	G15fCXE5UA+4V1UDXsOA=
X-Google-Smtp-Source: AGHT+IGmh/VWKm+efBWJ01RbnSi7ZImUgHLLHYjC9dZTT1hy5x/HQjC2l4quD/h4BVo18frgUDfYsg==
X-Received: by 2002:a17:907:97d6:b0:ae3:ce75:afd8 with SMTP id a640c23a62f3a-af9c64d47a9mr378890466b.30.1754674284908;
        Fri, 08 Aug 2025 10:31:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df2e4sm1515004966b.62.2025.08.08.10.31.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:31:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rpm-sequoia-crypto-policy: update to latest revision
Date: Fri,  8 Aug 2025 19:31:22 +0200
Message-ID: <20250808173122.584652-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808173122.584652-1-skandigraun@gmail.com>
References: <20250808173122.584652-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 17:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221664

0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
patch was dropped, as it is included in this revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...w-skipping-test_config-for-old-ipsec.patch | 29 -------------------
 .../rpm-sequoia-crypto-policy_git.bb          |  7 ++---
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
deleted file mode 100644
index db3ea4b843..0000000000
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f7a8e2c049c2c3e2bfcb801d7b65214c0a5bad77 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Tue, 15 Apr 2025 17:27:20 +0200
-Subject: [PATCH] libreswan: Allow skipping test_config for old ipsec
-
-In some case, /usr/sbin/ipsec does not handle the readwriteconf command.
-e.g. on Debian 12 with strongswan installed.
-As with the other OLD_* variables, add an OLD_LIBRESWAN environment
-variable to skip configuration testing on those systems.
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Backport [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/237]
----
- python/policygenerators/libreswan.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/python/policygenerators/libreswan.py b/python/policygenerators/libreswan.py
-index a2b02f5..d81ec0c 100644
---- a/python/policygenerators/libreswan.py
-+++ b/python/policygenerators/libreswan.py
-@@ -227,6 +227,8 @@ class LibreswanGenerator(ConfigGenerator):
- 
-     @classmethod
-     def test_config(cls, config):
-+        if os.getenv('OLD_LIBRESWAN') == '1':
-+            return True
-         if not os.access('/usr/sbin/ipsec', os.X_OK):
-             return True
- 
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 658b9ab36a..19b86ae391 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 # Python 3.11+ is needed to build fedora-crypto-policies
 inherit allarch python3native
 
-SRC_URI = " \
-    git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master \
-    file://0001-libreswan-Allow-skipping-test_config-for-old-ipsec.patch \
-"
+SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
+SRCREV = "ae1df75b1155294ebbd3c84fd206ffb55414c3ec"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {

