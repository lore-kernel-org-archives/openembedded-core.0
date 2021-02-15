Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.31516.1613399891634919975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Jbg5iHYC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id c16so6249523otp.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HHd+sDRL/pa1ZkXX+zCr2WzeNPVe51PtmI58C6smm5k=;
        b=Jbg5iHYCUi0ei+z0KwMQlFNQC5JQc2jq3yzCG1Qx/oU1WHoUjA0NGU/Nun35DS41nv
         7EK6Uo6sB/q3laziE5noSbL9ToIXE7ujCtmPxGCWzcIRnJH4s4mwBSV9NagBOqGzCMV3
         s7ibF+Jqxp0uAE+lIJo7y8hNlpVQGuXYxJzkISAapHnBcEjAqq5Zn1TcUCxENbnda40P
         a0LrCaVRpmFr3EgCgg/CnQya8/zlhZMj9nRJjyobxHzAQh1FM/PEag+d0jrWpn2MfVsV
         E0IfmgF6NGfruIz0wubzCPXqXV8V5Pa7G6YPtU6EmLHqW0iKr1ngSxwGkGltg/vE4KZK
         +6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HHd+sDRL/pa1ZkXX+zCr2WzeNPVe51PtmI58C6smm5k=;
        b=uC+kuWcBpczkoZLWmSAY9DGIXzYpeR/kBxIIfN340Fee2LJuSNKs+IzZCs4j1pbxht
         VjSU2oBVIVR3lfQ9M69J8eP4YE6oewjp7uIVP6XWtCLjHsyepIPtvhZD/ChC70bkybMD
         j9masO2MQpnmiwESMEBsOQXkkGk5C3YkVW/EYH1SbnXV/uxzYA50k5sT1cCw1MlCvcDy
         5EVOUM5FX2o16Hvn7CKWok7xkPH6576OQZ/F2ZAbeLiICYy1FV9w2ZbOmILrRNvXS/VS
         SsKtcfS4nSvd2snsOie6jepHxTTbrmMwXbzOpbMQqiwaKNeFizVurm6WEeqCdl7pzezQ
         1k2w==
X-Gm-Message-State: AOAM532KXy2Hnr/AtQLS308lMgkJV0XPiU60i0n1icDEbybtMe1+XSvv
	kXW8FAzQY9/QfcIVBlXlZ57Lzvd/efTzzIp2
X-Google-Smtp-Source: ABdhPJxajJLg27PqkFq9gUzigM9W6/mQF5Ulczw290Pk01nkUSy6D2O+tJYx5DE4m40jYQHZB6bykA==
X-Received: by 2002:a9d:24c9:: with SMTP id z67mr11311557ota.273.1613399890563;
        Mon, 15 Feb 2021 06:38:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/17] opkg: Fix build reproducibility issue
Date: Mon, 15 Feb 2021 04:37:15 -1000
Message-Id: <61c639fcfdaa0a14e2a6a2bcca3215f99af94634.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A build date was leaking into the generated docs and makefile used for
ptests leading to reproducibility issues each time the month changed.

Add a patch to use SOURCE_DATE_EPOCH to derive it if available.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a9ca7aec4991eabd425e32fdf85f51bb1686b8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
new file mode 100644
index 0000000000..285d258c63
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
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
index 66a74dc5ed..516982c6f5 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
@@ -14,6 +14,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://sourcedateepoch.patch \
            file://run-ptest \
 "
 
-- 
2.25.1

