Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.509.1606848778747199187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h+EdeMIM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id 131so1698408pfb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DIaKcMF7jD+dMwUO16JQsgIDKHGI9j6nZE/A+NJTUnA=;
        b=h+EdeMIM567deJOJWKNQjqQxwEaeB4d1UZ860dNUis9A2gWg/AemkSWD/38PbjYEih
         aWBvTDLtEZDnT5QKKqF5+3cPPZsXUAVKLZp36AIYHlzm7d+vBKVlA7xfmj78W/rc/7oa
         Kp7t6VC/IZ6VWWjQULHceOF2C0lvBqt2zW57+yK8RR6sZ7B1h1Wvgbc1hvQBcIim9wuy
         cDmMKo2HEH3NiP2lrbcaS/RVnuoStRN1NpvjRbqnBn7z00HJf2Mam/To/IOnRGALDO1V
         4tV60oUQCf5L6SfbMl1hu8i8hDow6/py/aNVoJzahWHRzsIlAXmwlfImC8jgrkLXJmxL
         A9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DIaKcMF7jD+dMwUO16JQsgIDKHGI9j6nZE/A+NJTUnA=;
        b=Cx7ZGQ0ldDzx0DLUSsQAH+juRIYZG+rZJMXNgfcTkvmpnSqwRr07RaLMXmSl/cy+qz
         OMq+HTkdIyY/8ARorYbjXfQjDVMOWsok+8RxKreJsFifcxLocQLMI1mN8hyi+ppKNw8x
         qr9g9wuf3xWTkb5vECHvcVTq88CDeDTgJetCcWmlHtUFV7LICmWsIp3KOC6Nx7LPtvAs
         vz8knO11rpm5G11Y043zVz7yElkoXAO1kXNzMs451drWWmZY6wM1thipSXEeCea00YUB
         5yeAI1PYLRYysSofoCTPEjxRBzbtSlnuaupKxslAF65LhizYDamzpuIozmpoq5/uEHPC
         BJ0w==
X-Gm-Message-State: AOAM532FsRw3xLteOPsobTpt6Wz/vNB/BPqCcZiJMUYYgx6GYZWEyk59
	0TdTQWHGmYarBSmP+AsuuKhPLpfY0PKZa3NP
X-Google-Smtp-Source: ABdhPJyLmnXL2lhHNqaZWcSh4tdKg6lhgEPbF5pchsEnX9lacYVuWuKZiWKkaop+5c1ROlZO2CFmHw==
X-Received: by 2002:a62:4e15:0:b029:197:98e1:15c4 with SMTP id c21-20020a624e150000b029019798e115c4mr3776220pfb.39.1606848777879;
        Tue, 01 Dec 2020 10:52:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/16] fs-perms: Ensure /usr/src/debug/ file modes are correct
Date: Tue,  1 Dec 2020 08:51:58 -1000
Message-Id: <20b8ffcbeadb6eb9e87356ee173ead43016d458b.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If files are copied into /usr/src/debug directly from WORKDIR (e.g. makedevs)
we'd get the permissions from the checkout which would depend on the host umask.

Avoid this and be deterministic by setting the file modes consistently. Core
code copies the files in so we're responsible for the permissions.

Unfortunately to force this change to apply we need to invalidate both
the package tasks and the hash equivalance mappings since file mode
'corruption' already made it into the output hashes (both input options
were mapped to the output hashes).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f958bcd6c9cd12ec76d80586cba15f4d6ed17a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass           | 2 +-
 meta/conf/abi_version.conf             | 2 +-
 meta/files/fs-perms-persistent-log.txt | 2 +-
 meta/files/fs-perms.txt                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc64ddffc3..7c252dd46b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2225,7 +2225,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "2"
+    # PACKAGE_BBCLASS_VERSION = "4"
 
     # Init cachedpath
     global cpath
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 2bdc55695b..0a3fb307c8 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "12"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "1"
+HASHEQUIV_HASH_VERSION  = "4"
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 3a7cf3ab94..518c1be3c9 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index c8c3ac5dbe..daa4aed840 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-- 
2.17.1

