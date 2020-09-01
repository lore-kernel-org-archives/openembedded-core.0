Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.6245.1598936194382988426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 21:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNj6mxfV;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id l191so39059pgd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 21:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZRgyMWu/ZsJMdlVOMysbyuke5U12CPZRK+IwS6TpSw=;
        b=bNj6mxfVfskY/FamAxRRH65mrE7m1XHYhkISV2FImtkQibDvUAouVWIunrPcQ/3snl
         Ou6wFmZWo2Cpa0dI5fJzpUPmbyS5VA1f2m5KF0gC1weul1EjdEi08SryKoM+jRDtIS8L
         B/Z6PBosuiGb/TBUX5isWu0/LgI369JcuX7f7qwnSxqGYwbaMFoCfDJ3cypzRrKDzVOj
         ORL2k1opNjw/2TlbBsUcHJZ5oi2HIHiWTBf1+Ctwa3m5GEDaRMIq4KmXdmfvvYy/ZM8E
         V8KwMkU3H+FuaZY2f1X4lyvS3AjDR9NWJWQ0EJh1BLEwAEL9Y8xw8YYH7gKP3df9IVzk
         X8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZRgyMWu/ZsJMdlVOMysbyuke5U12CPZRK+IwS6TpSw=;
        b=lsMQun6sp5QYnfF9eYb1Crrq/SjKdg+UJvV8IP5Mhsc9xzIp0MnrnTBqLSmOLphFHi
         zQEqX/cGjfjqqbOEzl9UarJurDuv9JmsouKehcbTbZYHLa8DtGRodNYGRfB1Qd1pLsGk
         bxcIkAMhD59GTqkgBEWIphEPkdmOtuXH/KJkaro/o4PZXrR0yPLDHfVY2rRWO695f9P1
         MmtcT13zb9QL/8O1lml3CY30umZJGuqkpSM+GEejgRCf9jELYsbCoFIHnrOrLhBQdozy
         16nO2/hMEihURGoxA+KRAOnTD16mW7LlqxW/f05MIfAYSxl7NUK/wmD12RRqCIoYFDEm
         aDvA==
X-Gm-Message-State: AOAM533keY5X9WxouCjMsbawdRUrPz1rkH2nNoXPNJQoyQm9LiKS17mH
	hdhhuiNIAdyepadm3uiJS77ixHqaNze0lQ==
X-Google-Smtp-Source: ABdhPJxgNOWX/tg/5pmM4vAQmXL8YwOgjDYyX6pJT28r360A8sK+9rhHojpHi7a+pdZCWlLaGUqbmg==
X-Received: by 2002:a63:e20:: with SMTP id d32mr3865418pgl.53.1598936193561;
        Mon, 31 Aug 2020 21:56:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id w10sm206987pjq.46.2020.08.31.21.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 21:56:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc-utils: Use update-alternatives for iconv and getconf
Date: Mon, 31 Aug 2020 21:56:30 -0700
Message-Id: <20200901045630.1753967-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901045630.1753967-1-raj.khem@gmail.com>
References: <20200901045630.1753967-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iconv/getconf utilities can be provided by other packages e.g. toybox,
therefore this adjusts the policy to accomodate images containing
glibc-utils + toybox

ignoring build-deps in build QA helps to avoid build time QA where it
complains about missing dep for rdep which is added by
update-alternatives bbclass, This will not fail a build since we use
update-alternatives-native during build, and at runtime if we are using
u-a then it will be built and added by image and also other packages
using u-a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 5f1ab60dc6..04fa3dc602 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -65,7 +65,7 @@ DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, loc
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-inherit multilib_header
+inherit multilib_header update-alternatives
 
 do_install() {
 	oe_runmake install_root=${D} install
@@ -284,3 +284,10 @@ CONFFILES_nscd="${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
 SYSTEMD_SERVICE_nscd = "nscd.service"
+
+ALTERNATIVE_${PN}-utils = "getconf iconv"
+ALTERNATIVE_LINK_NAME[getconf] = "${bindir}/getconf"
+ALTERNATIVE_LINK_NAME[iconv] = "${bindir}/iconv"
+
+INSANE_SKIP_${PN}-utils += "build-deps"
+
-- 
2.28.0

