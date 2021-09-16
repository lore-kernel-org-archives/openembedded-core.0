Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.4489.1631750665702261286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 17:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oqxZ7grB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so5533799pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 17:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFIkmwACKYE7PrQWIhySbyV/Hl9sGogy2ZWNZISU4IE=;
        b=oqxZ7grBkOfbzHKcaiN5OSGe9UaXh0ylmyfgp4vdh9v3lWXi6tQrun62ga1KgC3+XC
         M++Aa1xoIVLboJ4jbhB/wMlTLUie59KpiSXs9766qmrrfQmyAJCcgv7x+rqaLwCU0cxd
         3zv8MIQQJPnVL6xDqFjyTAcVX48UPq5mUFu5U/YPxKPgYKNhGQ7J0tMXqURR28ajDQJK
         dV3iQcu5tbyrciKIFRtekasF/DLvyQTkMaD0dFmIVPChBrpyMGbH2aYKidyFAJOjgncF
         xDFhqia+K4Zyprm9sG1a12BntvwNkD+SJB/tUxFSjjVG7ZarOABccT0PQgBqkc0YQtPE
         AkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFIkmwACKYE7PrQWIhySbyV/Hl9sGogy2ZWNZISU4IE=;
        b=qASMTJp1HQO9nCLKA4KcVNCuMDhHvii3Ggsz1NOyWwKDvc/KDiXhfpTrXeBEvtYdsU
         sdvC1aPpqhvqphgZp4nLbymBq3WZ7CHV7H5hTVwuydb5Y2V7Rreh7D7I6b6MDckTQQV4
         67Fb5ywwtOUSRWRDOVPCSsclNAN0oAI2yjlZaEAB12tuSfPvdlVvHUNUXqyyswKOk0DT
         FXvaDK6Msga8tS/3EdR56Pw4jqneBHEMlpWJKlzIKV21qMfILV3zAP2hXr+RU3BA93yG
         Wk+rNRgWELUQRbNrrWI2mfHrMnNQraJ9q3JIlGg9MWw6Sx8aL9M7a6UbimPOKU2thTrf
         kmUg==
X-Gm-Message-State: AOAM532wjJPAK4lQXTQx4NsJz89TFgcu7yCgBiSbMDXmgqbiBcCAGE9e
	wlJfcgSwBLRWkZUp7IjamqSYYgWRJjo=
X-Google-Smtp-Source: ABdhPJxuJBi4m/WA1UKi12JfUe8GBYO0PCKC31mAenrsd5ajDDZYVnZKKJSrNrxb8MkP0BI6lyxlpg==
X-Received: by 2002:a17:90a:4049:: with SMTP id k9mr2615370pjg.175.1631750665075;
        Wed, 15 Sep 2021 17:04:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:538a:dbbb:2df2:d1e8])
        by smtp.gmail.com with ESMTPSA id 13sm919152pfw.73.2021.09.15.17.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 17:04:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 4/4] qemu: fix CVE-2021-3682
Date: Wed, 15 Sep 2021 17:04:19 -0700
Message-Id: <20210916000419.1812968-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916000419.1812968-1-akuster808@gmail.com>
References: <20210916000419.1812968-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: https://git.yoctoproject.org/git/poky
MR: 112369
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?id=48960ce56265e9ec7ec352c0d0fcde6ed44569be
ChangeID: 799afc7adf3f2c915751744b618e38cccb01d854
Description:

(From OE-Core rev: e16cd155c5ef7cfe8b4d3a94485cb7b13fd95036)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48960ce56265e9ec7ec352c0d0fcde6ed44569be)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3682.patch             | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 211c03e57b..ef9bc3f64a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -91,6 +91,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-12829_5.patch \
            file://CVE-2020-27617.patch \
            file://CVE-2020-28916.patch \
+           file://CVE-2021-3682.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
new file mode 100644
index 0000000000..50a49233d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
@@ -0,0 +1,41 @@
+From 5e796671e6b8d5de4b0b423dce1b3eba144a92c9 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 22 Jul 2021 09:27:56 +0200
+Subject: [PATCH] usbredir: fix free call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+data might point into the middle of a larger buffer, there is a separate
+free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
+only used in the normal workflow though, not when dropping packets due
+to the queue being full.  Fix that.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
+
+CVE: CVE-2021-3682
+Upstream-Status: Backport [5e796671e6b8d5de4b0b423dce1b3eba144a92c9]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/redirect.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 4ec9326e05..1ec909a63a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
+     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
+         if (dev->endpoint[EP2I(ep)].bufpq_size >
+                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
+-            free(data);
++            free(free_on_destroy);
+             return -1;
+         }
+         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
+-- 
+2.25.1
+
-- 
2.25.1

