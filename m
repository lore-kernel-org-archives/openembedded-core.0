Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.1479.1612309717932046236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 15:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N4HZI4xp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q7so22220908wre.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 15:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLoGGKNbAWm5NT48Dk8OqkVRdT8Hzho983dQjzCo/FU=;
        b=N4HZI4xpLq4KyQeugYCOoOc5vlHI6TmFClFpwvaRZpoInZYDr22vX9/Csl3BNu3LE6
         QI4ANCLZvTEUJbd7r8q88E1wys2/h3fv4m0b4v8mHZJJZyzqh80g/nnIJ6BLH+Elaqta
         7uBBkZmqVA/awAm6hASjTJGEwsliv4LclCNzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLoGGKNbAWm5NT48Dk8OqkVRdT8Hzho983dQjzCo/FU=;
        b=P6Si8gNHJeFJBETjEXA/7fKE65gNxTbP77/eBDaa/4y1G5t1H+GUt9qp3svGb7CuZm
         UiIdD0HylKPxdls0pws0Qz2CUGRFG9yPAwkmRrEJmqYuOWM81USDYkNF89dYVKmRrqy/
         neATE+L7++NVwmf0LygRo9EleZTwmcIzEdJMcnHBvYndw9498n75L8Y5ShZdOQaC4a0J
         VHtpkbCAiOUBXMHaO3ZGIeeg73m6qG6Jyiw7xnzG3Cfb3T21PebT3uoZFU0t67PuVqBI
         lIEh/6hH0nVKUbou+aznaBRJt3lQxVFaTSXetTlMpx29wAm2Tp8UWzqpkOiaoR5EO6EO
         Qq5g==
X-Gm-Message-State: AOAM531S4JTpWw3plD3yWD3I4covz+9uv0WDAPD2VveodZuouyTaS8WS
	+rH5EqXTGq5+WfgvkAgIMa1/pSPT+Y9ZVw==
X-Google-Smtp-Source: ABdhPJyhkRjldT3o1tpfPrR/KhNPJa+ATPqKnbeD7RMmnHrc2H2Y3kEdixH3c79zw/gkZFjbfjb73A==
X-Received: by 2002:adf:e7c1:: with SMTP id e1mr458540wrn.23.1612309716296;
        Tue, 02 Feb 2021 15:48:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id f14sm152811wmc.32.2021.02.02.15.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 15:48:35 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [PATCH] opkg: Fix build reproducibility issue
Date: Tue,  2 Feb 2021 23:48:35 +0000
Message-Id: <20210202234835.1532984-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A build date was leaking into the generated docs and makefile used for
ptests leading to reproducibility issues each time the month changed.

Add a patch to use SOURCE_DATE_EPOCH to derive it if available.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.4.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
new file mode 100644
index 00000000000..285d258c635
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -0,0 +1,25 @@
+Having CLEAN_DATE come from the current date doesn't allow for build
+reproducibility. Add the option of using SOURCE_DATE_EPOCH if set
+which for OE, it will be.
+
+Upstream-Status: Pending
+RP 2021/2/2
+
+Index: opkg-0.4.4/configure.ac
+===================================================================
+--- opkg-0.4.4.orig/configure.ac
++++ opkg-0.4.4/configure.ac
+@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
+ 
+-CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++1607446883
++if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
++else
++    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++fi
+ 
+ AC_SUBST([CLEAN_DATE])
+ 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.4.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
index f8034ca5fa5..548e81962d7 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0001-tests-let-the-OS-negotiate-relative-package-dirs.patch \
+           file://sourcedateepoch.patch \
            file://run-ptest \
 "
 
-- 
2.27.0

