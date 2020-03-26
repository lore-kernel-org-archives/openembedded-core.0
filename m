Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.32989.1585212872613055655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HKlPtq8L;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id s1so6698332wrv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4ie2GzCnDNpopflos9ePOd5oaeelp0hvFuR2ES8eAwA=;
        b=HKlPtq8LPvXS2zhzIkFdnAScyEWAcz1Y2UxWL0y3N7uw24wHvzC4j/SBhT3qCF15gT
         zaeJhsg+X87y++ceFRaAPsFuWKUWyiaK9xZzUXwyTcQIjP2sGFpQTQNOAzoggsf0jAIJ
         PbxD6AZtEwrF5Yw1WQqh8dwPrMuWYjc/Xz0UKMjcWoOIt+yyG16mxgKIze/T7exdf3pa
         iOuis4n9WwESWxzHoF9W4x3W1CxfMNahDewMJBES46y5RLA4U/Yw2WOFxguaqPy29UNc
         U61E2qE6NBDrZfdV00ZswQ40chgyZAgxfCcpTNno+/ennvuKDojWOZelsT7yDxH27TDz
         b4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4ie2GzCnDNpopflos9ePOd5oaeelp0hvFuR2ES8eAwA=;
        b=tjAR3RagK5wAqitt5NDRi6uPqW68lHwyP40RDT96ojq+E9AE/pFE11b8+ZW1vKkcly
         9RY6ybLImzZZavr/EZXwsM9D/fz/t+c4MRvwCy3SuSY6pLJlsTV9HNDhDJmAXaAgOECM
         xMvJL9JH9AzrMxyTl647djJ+zB/Eo5+84kvB3/SU0TQkwYkSfrzP7zx/H8/9HVdml39q
         hZAF8g7zYgkTr6+TaVDMQ+0xGPpyZHRbv9cS+/v1ukWuC/BBiDykH9iuigEv3Qpd4Ihu
         3IIHQu6OE4GThMYTl7p5KZDlCcoCpMQw0Q52ETx9GWWosiZNNhSlyLQHFoJ4d0RmDxEN
         DbXg==
X-Gm-Message-State: ANhLgQ3NRcWLLCaIXoc1JtZ5feTuLoZhjNIx20sOhaaCiqjEULewvaEY
	PmQuLNQoaBvh8GNPuoGqHeWB4vp/
X-Google-Smtp-Source: ADFU+vv5byh5giQ9sn63PH7RN5okDppqUlU7C+cRvpqV2HBCn+Mzoxoe1BWVoVJmofdmtGi6DznT4Q==
X-Received: by 2002:a5d:4bc1:: with SMTP id l1mr8581476wrt.103.1585212871040;
        Thu, 26 Mar 2020 01:54:31 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:30 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 01/13] systemd: Use PACKAGE_BEFORE_PN, not =+
Date: Thu, 26 Mar 2020 08:54:14 +0000
Message-Id: <20200326085426.117209-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

By using PACKAGE_BEFORE_PN rather than =+ it's clearer how we expect the
package ordering to work. It also avoids the possibilty that dev/dbg/etc.
artefacts attempt to package as part of these packages.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- new (use PACKAGE_BEFORE_PN)

 meta/recipes-core/systemd/systemd_244.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index c5c0ce4bad05..f0cf102dc250 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -305,7 +305,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
-PACKAGES =+ "\
+PACKAGE_BEFORE_PN = "\
     ${PN}-gui \
     ${PN}-vconsole-setup \
     ${PN}-initramfs \
@@ -319,6 +319,8 @@ PACKAGES =+ "\
     ${PN}-journal-upload \
     ${PN}-journal-remote \
     ${PN}-extra-utils \
+    udev \
+    udev-hwdb \
 "
 
 SUMMARY_${PN}-container = "Tools for containers and VMs"
@@ -578,8 +580,6 @@ INSANE_SKIP_${PN} += "dev-so libdir"
 INSANE_SKIP_${PN}-dbg += "libdir"
 INSANE_SKIP_${PN}-doc += " libdir"
 
-PACKAGES =+ "udev udev-hwdb"
-
 RPROVIDES_udev = "hotplug"
 
 RDEPENDS_udev-hwdb += "udev"
-- 
2.17.1

