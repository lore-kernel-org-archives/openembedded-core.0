Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.4234.1591765831654090916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 22:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g6XvQFuC;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id h95so390964pje.4
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 22:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9v1nv67JyO7L8SH2BptxiQ67rwlexyIHVMW8ApRqBjY=;
        b=g6XvQFuCMEkTsUVfyIe2bSU6Id36RXuWb8DAM1sN0fPJAhBeJvCIYYt+h3U4IsYFYG
         N8Z1CKKhqFevBhSZ6hu/oiFyuET2q6X6jhtQkda4Uu5cDh1yXAff2QMrGgqnAXXcRvEb
         qQwgyDY20BQG9I7bgB0sDSbbiug4FEd3pz0MfY3VJwL0brrcJW4WpMvNT6l/7s+6a90s
         yAs4X3eL0VigmxNDqDEmNODI1BBLBc01OCU6XIGQtlPsBf7GKJM8vccjtozvbHzwwCx9
         1WBHymQxDKZVF9NOUiEYvBiE8xT8BngpkRWQRHL9i8boAhDTpUa5q5xo+W0g6t1NuqrK
         uDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9v1nv67JyO7L8SH2BptxiQ67rwlexyIHVMW8ApRqBjY=;
        b=nZ0RE1OhRAePcn2OLhET73hqIJV7tTLD+mfIvsb1tORyEeP7ZY/y10dzMAzIdbcL6I
         ndJVheSWCnXlwUx3UQg2vSp1vMGP/Vs6v8mwRi3Z/1KOybU5h8BETJSD424T+OpofoVz
         YUEMI0cwSiHaU0ZM1bMbRvLgD2nGzi8Vbt2SDd8QL/tv6OaKpiBpU+L76W326KGo9QMP
         C/o8JSf1WKEY5qSh8LbVoEJsLEPGwGrXfj99svWhEFWIE9UdE48S2x4cjDh61+jzK2oJ
         vfAAHKHdmhYwtJpCzM9GnU+Vgg1PmGZWwutOA6OZuCR/gjrQY7o8dpb8h8myDm/74zTy
         oh2w==
X-Gm-Message-State: AOAM532AE54IqiT2RJgALiOjWA40ecZXu5roQ95VeWHIiwh5lU0MSMc8
	/QNlIMC1ZQ4bmyPqE0QcLpRV8vlYNFc=
X-Google-Smtp-Source: ABdhPJyOUEHsKmUU1Px3jn9hnkRAJZuIYIwAuD98bT4vQ9/Mr9omfKPf4YvyrNgaj9FgcLCsEDen2Q==
X-Received: by 2002:a17:90a:3261:: with SMTP id k88mr1340859pjb.0.1591765830667;
        Tue, 09 Jun 2020 22:10:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::34b9])
        by smtp.gmail.com with ESMTPSA id o16sm9742445pgg.57.2020.06.09.22.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 22:10:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Fix build on musl
Date: Tue,  9 Jun 2020 22:10:28 -0700
Message-Id: <20200610051028.765550-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define daddr_t if not provided by system headers
Fixes
./stress-ng.h:3755:2: error: unknown type name 'daddr_t'; did you mean 'caddr_t'?
daddr_t f_tfree;
^~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../stress-ng/stress-ng/no_daddr_t.patch      | 22 +++++++++++++++++++
 .../stress-ng/stress-ng_0.11.12.bb            |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
new file mode 100644
index 0000000000..877f4f0624
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
@@ -0,0 +1,22 @@
+Define daddr_t if __DADDR_T_TYPE is not defined
+
+glibc defined daddr_t but musl does not, ideally it should not be used
+and simple int type is enough. However, its better to leave glibc behavior
+as it is and only define it to int if daddr_t is not provided by libc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/stress-ng.h
++++ b/stress-ng.h
+@@ -3750,6 +3750,10 @@ struct shim_statx {
+ 	uint64_t __spare2[14];
+ };
+ 
++#ifndef __DADDR_T_TYPE
++typedef int daddr_t;
++#endif
++
+ /* old ustat struct */
+ struct shim_ustat {
+ 	daddr_t	f_tfree;
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
index 45f4bb41ad..c00086c095 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://no_daddr_t.patch \
            "
 SRC_URI[sha256sum] = "0ccf437ca1876a3e8a55986c6481697045203a17f5994cb2f5096cd461d18031"
 
@@ -23,4 +24,3 @@ do_install() {
     oe_runmake DESTDIR=${D} install
 }
 
-COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.27.0

