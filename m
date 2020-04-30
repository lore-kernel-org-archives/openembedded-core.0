Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.1718.1588223360908292444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZW+R+svH;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id fu13so234870pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 22:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjVp/fhkVkc10lH8pKs6kt79NZSg+5Is1YpGulA7P+4=;
        b=ZW+R+svHuCzl4qPy3wyQEpHbUP9ZGTqZlGs6q82EmuzLV9h/IKQ8nOHajrsIGU7M+l
         QyjonpgwQo/YSe4wfkYVG8gOCWbSas5Cwtn0hIWMMX1o1I72zJtV6JnP1Ioc39LcgB76
         IInLT1Z7kql4AWhnDCEjfKg7QFHX22mGMtvjCrW6VvXzyQQC2DrKOfEHJXzbhgu3RP0f
         3MDz7+kcQ4ZrnXLfE9QqwQPW7349v1gzKHIsR+7drRwZccBlJLtus4LL8kzgjGZ6Kjkl
         knuaFC1pHjKF7jIV+u8y5yPJWKxjgY6SXx22vANdd/fB3oLd28zZI19qTn/6x5PMoINJ
         kbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjVp/fhkVkc10lH8pKs6kt79NZSg+5Is1YpGulA7P+4=;
        b=klH73isHBxX+qOeIcX6g7Cy7F5nqNzD3UaM4IgkbV3cCO93MHkMRPgDRiS7pkmm7+W
         xarz9wXnSHUYPNXEPeRdKS3kYLATAO00LsUCZMT8drKk8gz9Qb1n85qvmyouu3n3QLXD
         m7a8xTjrKYleVxwyNOWkMeTgtqVEJgnm7kL132WILzg1jcSt0AfSyPLoxoIjUTX5LVuM
         siy/uBu6zena5KY2K5itE0G2rsrAqhIlZcCYQflKVVp1pnxlLYiJc+wrT4vVYS99S7f6
         8cvyMAC050Ru8gHwZWdtoZTG0U5234fMGyCgpDKaw3MNxSDZRaT84GceOjTBs3F11bCt
         3mAg==
X-Gm-Message-State: AGi0PuZA/PMdj+KaULcQBOZuxudUsYWl3/U/l37ubmBqtnROHeFJSgbr
	XOjCEkuep6YNYPrn+Oz6eAQGdwiCIA4=
X-Google-Smtp-Source: APiQypJF4imz/1qQNH1RKl+joDCbQOEVkhSO60Osa81ptnwKYVST4kd0owphW+sKONpYnIU2MK3SVw==
X-Received: by 2002:a17:902:9f90:: with SMTP id g16mr30640plq.215.1588223359843;
        Wed, 29 Apr 2020 22:09:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id c4sm705411pjs.0.2020.04.29.22.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:09:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] dpkg: Add riscv32 CPU support
Date: Wed, 29 Apr 2020 22:09:17 -0700
Message-Id: <20200430050917.197813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-support-for-riscv32-CPU.patch    | 39 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.7.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
new file mode 100644
index 0000000000..52e85705fa
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -0,0 +1,39 @@
+From 279e4c274f5f295823cf9fa95d3ba131f6d711db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Apr 2020 22:02:23 -0700
+Subject: [PATCH] Add support for riscv32 CPU
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ data/cputable                 | 1 +
+ scripts/Dpkg/Vendor/Debian.pm | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/data/cputable b/data/cputable
+index 9f2a8e0..1d935b1 100644
+--- a/data/cputable
++++ b/data/cputable
+@@ -41,6 +41,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
+ powerpcel	powerpcle	powerpcle		32	little
+ ppc64		powerpc64	(powerpc|ppc)64		64	big
+ ppc64el		powerpc64le	powerpc64le		64	little
++riscv32		riscv32		riscv32			32	little
+ riscv64		riscv64		riscv64			64	little
+ s390		s390		s390			32	big
+ s390x		s390x		s390x			64	big
+diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.pm
+index a352bbd..fa1d90b 100644
+--- a/scripts/Dpkg/Vendor/Debian.pm
++++ b/scripts/Dpkg/Vendor/Debian.pm
+@@ -306,6 +306,7 @@ sub _add_build_flags {
+         powerpc
+         ppc64
+         ppc64el
++        riscv32
+         riscv64
+         s390x
+         sparc
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
index e9dec337b3..50fe54dee1 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
+           file://0001-Add-support-for-riscv32-CPU.patch \
            "
 SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.26.2

