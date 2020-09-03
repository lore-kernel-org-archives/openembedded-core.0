Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.11029.1599130062801209279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 03:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=riNG5RGq;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id c15so2636106wrs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=De0kfH+lYZML6mchNp/r9WSEG8snZtR2qK2cV88LDFc=;
        b=riNG5RGqyDETPBXQmecJpwhQ9mcC9HTMyZGbV9EjGYIWZTAuZaolJ7wnt8kBT4KDYN
         wgMP/PJseI0aOmPxYAdENe8QlyLsGi0/kbKb6oBHiIjDghL9AHTp6FHSbheU+NjB9oKE
         MKyw782KXJM2kCo7qyEcakus0XjyjuTpD8fz51KSKX6BHlwUgsWnMBA/qquMXqE9xRl6
         esrZNlijvqwZJI4kI/cXP1+2AY+2rZ7G0PJZ+hvYPghOchtu3q+k3N2h+BxacJ7LWZES
         EfFCVdHrkyXNhsxrjE/eWwk3Ipn3I0ss9ZO2I7wfAraGduxiyLmt//8kpl7FLj0UI4uc
         Oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=De0kfH+lYZML6mchNp/r9WSEG8snZtR2qK2cV88LDFc=;
        b=pBPUYucsqoB+efyg3ZIXXX5Pi/4BVMDUrpt1sUrw2eR2SQZF60v2pJjbf2GnBK2aDF
         yuI2bYQpVqFgPYodnfQG9zuFhgaVtH7aSj9RFeosNGQeDzCxwaBlBm0uKZqrUSVa5Yrs
         J5iShLUKllAI9lbAxkPH/T8DPZ7qf11uWFSsXqvqjONiA3wLENzo8c2gw8QVIpjKat0k
         R5Txsd1MxzCJBfHXfkOT9pMUytkqJInBjLiPymsBbMFi1XlFqsBwFXIlZXKsMAbUZiGr
         TVzq0tbT/NEc4arBekzFfambUMEpbHBTxDvJRAW4BGC5i58DEqN73A06wiNdXsPZp4a0
         8G7g==
X-Gm-Message-State: AOAM532nw3pnjdDdgp+CwPWvbKxZD5vIHcun1nKlCKkfpqQuQhEljM1H
	uDv2uIT/YFSMiVOwp/OlLj+Ky+a1QBOVavSN
X-Google-Smtp-Source: ABdhPJyXCirHh2LpPPzn7xcZZfJXjqok91DnBqYjyedvbUpyYQl7Y8mdmRmrVotR0uDqRi9IlfknDw==
X-Received: by 2002:adf:8306:: with SMTP id 6mr1780979wrd.256.1599130060936;
        Thu, 03 Sep 2020 03:47:40 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id 5sm3668895wmz.22.2020.09.03.03.47.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 03:47:40 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] kea: don't use PACKAGECONFIG inappropriately
Date: Thu,  3 Sep 2020 11:47:30 +0100
Message-Id: <20200903104731.4165-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903104731.4165-1-ross.burton@arm.com>
References: <20200903104731.4165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kea recipe has PACKAGECONFIG options for boost, openssl, and
log4cplus. However, these are not optional but mandatory dependencies.

Remove the PACKAGECONFIGs and replace with explicit DEPENDS and
EXTRA_OECONF. Also the RDEPENDS in the PACKAGECONFIGs are redundant as
the library dependencies are generated correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_1.7.7.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-connectivity/kea/kea_1.7.7.bb
index c69a180833..c72ebff056 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.7.bb
@@ -5,6 +5,8 @@ SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
 
+DEPENDS = "boost log4cplus openssl"
+
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0001-remove-AC_TRY_RUN.patch \
@@ -30,6 +32,11 @@ DEBUG_OPTIMIZATION_append_mipsel = " -O"
 BUILD_OPTIMIZATION_remove_mipsel = " -Og"
 BUILD_OPTIMIZATION_append_mipsel = " -O"
 
+EXTRA_OECONF = "--with-boost-include=${STAGING_INCDIR} \
+                --with-boost-libs=-lboost_system \
+                --with-log4cplus=${STAGING_DIR_TARGET}${prefix} \
+                --with-openssl=${STAGING_DIR_TARGET}${prefix}"
+
 do_configure_prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
@@ -49,12 +56,6 @@ do_install_append() {
     rm -rf "${D}${localstatedir}"
 }
 
-PACKAGECONFIG ??= "openssl log4cplus boost"
-
-PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
-PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
-PACKAGECONFIG[boost] = "--with-boost-libs=-lboost_system,,boost,boost"
-
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
-- 
2.25.1

