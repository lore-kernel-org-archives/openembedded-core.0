Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0B8C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.18099.1660669146455225699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=htx0ONkG;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 20so1148497plo.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IpwTNl/tzAl5oLknqMbJzURT9GkouYd3IL2SC3uKDcM=;
        b=htx0ONkG6b4EaYqvGXu5716k6heeA5ElzC/+2XRETSEqGgTYv/FZi/kQvPrFDgkqCN
         wszrCA7UzzQ8UDg0CuniipxEHmXC7jCileSlE07kL5MmZwoh+ONXB/RJXnk0/DNWuczT
         x2+esH/7HE+HvsHM7ZTn3YgegLCF4XMIeG+4Fc+SchjgXBsv5rBj1t5xqhf6gBQBS9UI
         SVXrD2GcifckuOfLMn2u2woV38zI4IgvNkFCDg7zODo/SDGpQskkIZx+bQ62eo1Wh8MP
         n288ijxEvOI8GGTAANgNtdu9Oq9gmxxwPJp8IPLb+UaoYMbP/+p1x60X8DSYOq6MsZBs
         Heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IpwTNl/tzAl5oLknqMbJzURT9GkouYd3IL2SC3uKDcM=;
        b=i594mln9SAnwGnaA6oVIJCOnaiIin+7kR4s1G4VUjZ9tIgVbe3PK2mgRZtJnxwRADm
         +VT6vidL8x6gejo+IrcMtgoXacGaBatl4uHBUSVz3jL5/ZCFiHk1cPHM26vRqxLItCJy
         IyWSDlAEb/n5Ba71v6ej30hxp0Ohtvxc0Lu9LGvIB3P6Y+edocY+vKeBW9wcvLcTLSRJ
         XYcj/JQq7Rvbgj7ZCVHGFQwcJ14nFgQkMosnuyHSnLMUMeiWwkSugr5pr0z8fYam7KzB
         go7SLq+A+aCtAeGqUIJBCWIiarotaGPhKpsqIliso1EM495NoVwRqaGQkvwbR6B7y+2e
         u1aA==
X-Gm-Message-State: ACgBeo3YWoYpYFArI6UTgW1rCPpjTcPxVtKu7iC3pgv5Y+bbK4P19TqE
	+HYAXsnAvbWyE/niDUlERJXLDdnPL9lSYw==
X-Google-Smtp-Source: 
 AA6agR7t3v6DLV8W5VewtTWTpoHy30HL6Zj0HO6Hui6Brcgve9n29ZqpwryCyy+BXGwZPyStfRVXvg==
X-Received: by 2002:a17:902:d4d2:b0:16e:fe70:ca7e with SMTP id
 o18-20020a170902d4d200b0016efe70ca7emr22850600plg.11.1660669145381;
        Tue, 16 Aug 2022 09:59:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:59:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/7] apt: Do not use std::binary_function
Date: Tue, 16 Aug 2022 09:58:55 -0700
Message-Id: <20220816165857.2342796-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169446

This feature is removed from c++17

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-init-tables-from-dpkg-configuration.patch |  4 +-
 ...001-Remove-using-std-binary_function.patch | 87 +++++++++++++++++++
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  4 +-
 meta/recipes-devtools/apt/apt_2.4.5.bb        |  1 +
 4 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 59b9cd190f5..37a31330102 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From 11ba49594ae9d11f0070198c146b5e437fa83022 Mon Sep 17 00:00:00 2001
+From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
-index b9d9b15..1725c59 100644
+index b9d9b15d2..1725c5966 100644
 --- a/apt-pkg/init.cc
 +++ b/apt-pkg/init.cc
 @@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
new file mode 100644
index 00000000000..3065210a04b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -0,0 +1,87 @@
+From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Aug 2022 08:44:18 -0700
+Subject: [PATCH] Remove using std::binary_function
+
+std::binary_function and std::unary_function are deprecated since c++11
+and removed in c++17, therefore remove it and use lambda functions to get same
+functionality implemented.
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/253]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ftparchive/apt-ftparchive.cc | 33 ++++++++++-----------------------
+ 1 file changed, 10 insertions(+), 23 deletions(-)
+
+diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
+index 87ce9153c..56fdc2246 100644
+--- a/ftparchive/apt-ftparchive.cc
++++ b/ftparchive/apt-ftparchive.cc
+@@ -48,6 +48,11 @@
+ using namespace std;
+ unsigned Quiet = 0;
+ 
++auto ContentsCompare = [](const auto &a, const auto &b) { return a.ContentsMTime < b.ContentsMTime; };
++auto DBCompare = [](const auto &a, const auto &b) { return a.BinCacheDB < b.BinCacheDB; };
++auto SrcDBCompare = [](const auto &a, const auto &b) { return a.SrcCacheDB < b.SrcCacheDB; };
++
++
+ static struct timeval GetTimevalFromSteadyClock()			/*{{{*/
+ {
+    auto const Time = std::chrono::steady_clock::now().time_since_epoch();
+@@ -116,24 +121,6 @@ struct PackageMap
+    bool SrcDone;
+    time_t ContentsMTime;
+    
+-   struct ContentsCompare : public binary_function<PackageMap,PackageMap,bool>
+-   {
+-      inline bool operator() (const PackageMap &x,const PackageMap &y)
+-      {return x.ContentsMTime < y.ContentsMTime;};
+-   };
+-    
+-   struct DBCompare : public binary_function<PackageMap,PackageMap,bool>
+-   {
+-      inline bool operator() (const PackageMap &x,const PackageMap &y)
+-      {return x.BinCacheDB < y.BinCacheDB;};
+-   };  
+-
+-   struct SrcDBCompare : public binary_function<PackageMap,PackageMap,bool>
+-   {
+-      inline bool operator() (const PackageMap &x,const PackageMap &y)
+-      {return x.SrcCacheDB < y.SrcCacheDB;};
+-   };
+-   
+    void GetGeneral(Configuration &Setup,Configuration &Block);
+    bool GenPackages(Configuration &Setup,struct CacheDB::Stats &Stats);
+    bool GenSources(Configuration &Setup,struct CacheDB::Stats &Stats);
+@@ -869,7 +856,7 @@ static bool DoGenerateContents(Configuration &Setup,
+       else
+ 	 I->ContentsMTime = A.st_mtime;
+    }
+-   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::ContentsCompare());
++   stable_sort(PkgList.begin(),PkgList.end(),ContentsCompare);
+    
+    /* Now for Contents.. The process here is to do a make-like dependency
+       check. Each contents file is verified to be newer than the package files
+@@ -941,8 +928,8 @@ static bool Generate(CommandLine &CmdL)
+    LoadBinDir(PkgList,Setup);
+ 
+    // Sort by cache DB to improve IO locality.
+-   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare());
+-   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompare());
++   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
++   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
+ 
+    // Generate packages
+    if (_config->FindB("APT::FTPArchive::ContentsOnly", false) == false)
+@@ -993,8 +980,8 @@ static bool Clean(CommandLine &CmdL)
+    LoadBinDir(PkgList,Setup);
+ 
+    // Sort by cache DB to improve IO locality.
+-   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare());
+-   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompare());
++   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
++   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
+ 
+    string CacheDir = Setup.FindDir("Dir::CacheDir");
+ 
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 593ed7d0968..6f4d5b6e729 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 47c2b42af60ceefd8ed52b32a3a365facf0e05b8 Mon Sep 17 00:00:00 2001
+From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 93effa9..4375781 100644
+index 93effa959..4375781d1 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
 @@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 53849f80a30..564bdeec410 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
+           file://0001-Remove-using-std-binary_function.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.37.2


