Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.57692.1595862657645369487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ygCpEKm4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id s26so9216178pfm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XCuuzhwaRLvf/Gucn2jyQlJrjIfRRbZ9ZhiXFlWiS4Q=;
        b=ygCpEKm4hJJA+ks/LxaTbndacAmx3gXjoM2cbeDMIlrKhHW52yRYyuZKmOVJCuEf3Q
         4+U+CPIUd/HjWbH1YgzbarbG/PW24MjBCJew/3e4UbC7feORgXHu3SENCpMFX8Nk1Kg0
         rr3h1zQr8cJ3Xefkg8HH2GAtrxA88sV50vZhxuak/WePFaH5KHCRapNvhxz8Kmq6JQnk
         qDUtxnLy+S5s6AgiMpx9C3o62LkSd6s44ujTApxjKcCu/kTn7U057PVFznW8p8nG7nYq
         j+Sx3Hh8Xc5/I2spK5A6p9FVEDflD6Mb0r9kwP76N7YlLLukgQV4Dnp1FRS5d4ymZf3E
         ki4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XCuuzhwaRLvf/Gucn2jyQlJrjIfRRbZ9ZhiXFlWiS4Q=;
        b=a46VOCvwlQkKV6jvUwbzdLNx19msBudO+fq70h+lPnDMOBrc4kT9mh/WAaG+PLMcRM
         fJPVIfUdal8n1RxMHAU2TpmGXLIHW9lA6RuMXqB44Bm9F9xRsbEvQzH5hMSacJbkyngN
         VdgKuHv1I1i2BMKb8mlfpMsH6a10QuCfHPg23cJp7J8MC1N8xutXYsz0EtEBW8PcHOV1
         Pis8D+ZJ+7v5Cs+yhGZ2GaFGVm5+kEODHQXDdJTu4k3WnyCjfigAcy2HdeGSJIspIPaH
         ZQWj7XmKHzbW89r04yQLlpWxXZIyl+XFJDMgXCCwFX3DUhxJsxnF+ZHShVWTeNTLa+kw
         iIog==
X-Gm-Message-State: AOAM5305vayy0aCt736yPxNBaczlj7b7GatT+++MezXa1FYPpBMYvM5U
	19a0vnzv9LZNrYv83DXR+OJYpRl39ks=
X-Google-Smtp-Source: ABdhPJyzVBA4OQuKfaKy90vHKHOPM6WMb74MEKUd4ROL8IKVh5Us31p+U2C7ZMgCKhjXuQ/6Jz6ryA==
X-Received: by 2002:aa7:8c19:: with SMTP id c25mr5203699pfd.17.1595862656766;
        Mon, 27 Jul 2020 08:10:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] buildhistory: use pid for temporary txt file name
Date: Mon, 27 Jul 2020 05:09:56 -1000
Message-Id: <769101d131f50441c9b62c0af340d04663a5d8b0.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

buildhistory create .txt file bh_installed_pkgs.txt and
bh_installed_pkgs_deps.txt while listing down installed package.
These file is later removed in buildhistory_get_installed().

when multiple process runs in parellal there are chances to race for
the file where one process created the file while another task remove
the file right after it.

using different file name for each process should avoid the race. So
add PID to the file name to make it unique.

[yocto #13709]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 214d236d93700abffa2d586cc744a00455818fa4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index eb7295570d..156324d339 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -426,8 +426,8 @@ def buildhistory_list_installed(d, rootfs_type="image"):
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
 
-    process_list = [('file', 'bh_installed_pkgs.txt'),\
-                    ('deps', 'bh_installed_pkgs_deps.txt')]
+    process_list = [('file', 'bh_installed_pkgs_%s.txt' % os.getpid()),\
+                    ('deps', 'bh_installed_pkgs_deps_%s.txt' % os.getpid())]
 
     if rootfs_type == "image":
         pkgs = image_list_installed_packages(d)
@@ -457,9 +457,10 @@ buildhistory_get_installed() {
 
 	# Get list of installed packages
 	pkgcache="$1/installed-packages.tmp"
-	cat ${WORKDIR}/bh_installed_pkgs.txt | sort > $pkgcache && rm ${WORKDIR}/bh_installed_pkgs.txt
+	cat ${WORKDIR}/bh_installed_pkgs_${PID}.txt | sort > $pkgcache && rm ${WORKDIR}/bh_installed_pkgs_${PID}.txt
 
 	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
+
 	if [ -s $pkgcache ] ; then
 		cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > $1/installed-packages.txt
 	else
@@ -468,8 +469,8 @@ buildhistory_get_installed() {
 
 	# Produce dependency graph
 	# First, quote each name to handle characters that cause issues for dot
-	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps.txt > $1/depends.tmp &&
-		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
+	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps_${PID}.txt > $1/depends.tmp &&
+		rm ${WORKDIR}/bh_installed_pkgs_deps_${PID}.txt
 	# Remove lines with rpmlib(...) and config(...) dependencies, change the
 	# delimiter from pipe to "->", set the style for recommend lines and
 	# turn versioned dependencies into edge labels.
-- 
2.17.1

