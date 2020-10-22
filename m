Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.793.1603381985471108459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XgnFsZtt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id f38so882870pgm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BAvC6QTNXSknHfK0hfMGrzQD4hZvt4/Q9SLMsQsBGHQ=;
        b=XgnFsZttMGvVszo1S6YV6TKnvDO4WfuT61FqADZSi0MYXjWB3nX/J1/NCQs60m879c
         gdXnzUfQ4tDDe3VsuIqgKRwW+2panWVjdDephwoHKcLh0kXeT+Rz7/jMS0sPRMAIRnh6
         4L6pESZPkkqSqQRMB3n6ERuXqdDv10Y234+nab+6iIkWHTZLYkRHg8P8Gr+zP9BSQVT2
         DkG9VCmXcr6ig51zs5ljryvxS9pvwFjMsbdNfe89DJNLqDvc5MpofkSucz/C9rnTdpL+
         mW5vnhW2tQNOhimqyKkjgKaRL/oUF6nEuZ9emKOl9rz9/YMJJ/2sDKIkj10ar7MZgT+i
         CfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BAvC6QTNXSknHfK0hfMGrzQD4hZvt4/Q9SLMsQsBGHQ=;
        b=Jb/YYAxQozT/dTr8Xg4H9AkUVl71i9cA3MGOP7UOBwWf1fdR+kqBRZabKdzOeuySXB
         AUqxNlLet9QE+PQXeReMYB6T3gVNSI6wqO3jeVVOSumV6C4hHxNbQrFDdfhPb5ElRhIE
         DteFzRACWpiJ3bsdAuncOM9NNUfNZS92iyN7EgLZw9nKeZNZEKv96YnmKYBD5qQUGfd4
         HFMobwSUERxyJlUgp+8P+GyMAwhYRmV+FdjA9kM61p2C6lp4y67pflGxEA8Vnk8tNvI8
         B/R5bXL/PBC/wVpmv71kscoLGbl63I4WpoOJTvgnpeuvQ17E2uoxpDYy6Ho/spZ12OOI
         3OWQ==
X-Gm-Message-State: AOAM530e8NSyUiQGfXMDvRZpkPHAGCtb6Smk2asWSWosFIdCRAoVvScX
	j6IlvazOSeQgHCw/biMANH4cymjddUXmq8ue
X-Google-Smtp-Source: ABdhPJyogq42nRDkIEk0prDT5mtHJlrpPnSELn0YMjpeJDTVDXyaQo3gGPD4NUPe1n9nYV5UE7F/GQ==
X-Received: by 2002:a63:574a:: with SMTP id h10mr2718417pgm.209.1603381984453;
        Thu, 22 Oct 2020 08:53:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] libproxy: fix CVE-2020-25219
Date: Thu, 22 Oct 2020 05:51:42 -1000
Message-Id: <f2e07dcf2c8ced2efcb6b67db45b9c5dc5ca5309.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libproxy/libproxy/CVE-2020-25219.patch    | 61 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch

diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
new file mode 100644
index 0000000000..3ef7f85451
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch
@@ -0,0 +1,61 @@
+From a83dae404feac517695c23ff43ce1e116e2bfbe0 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Wed, 9 Sep 2020 11:12:02 -0500
+Subject: [PATCH] Rewrite url::recvline to be nonrecursive
+
+This function processes network input. It's semi-trusted, because the
+PAC ought to be trusted. But we still shouldn't allow it to control how
+far we recurse. A malicious PAC can cause us to overflow the stack by
+sending a sufficiently-long line without any '\n' character.
+
+Also, this function failed to properly handle EINTR, so let's fix that
+too, for good measure.
+
+Fixes #134
+
+Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/836c10b60c65e947ff1e10eb02fbcc676d909ffa]
+CVE: CVE-2020-25219
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libproxy/url.cpp | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/libproxy/url.cpp b/libproxy/url.cpp
+index ee776b2..68d69cd 100644
+--- a/libproxy/url.cpp
++++ b/libproxy/url.cpp
+@@ -388,16 +388,24 @@ string url::to_string() const {
+ 	return m_orig;
+ }
+ 
+-static inline string recvline(int fd) {
+-	// Read a character.
+-	// If we don't get a character, return empty string.
+-	// If we are at the end of the line, return empty string.
+-	char c = '\0';
+-	
+-	if (recv(fd, &c, 1, 0) != 1 || c == '\n')
+-		return "";
+-
+-	return string(1, c) + recvline(fd);
++static string recvline(int fd) {
++	string line;
++	int ret;
++
++	// Reserve arbitrary amount of space to avoid small memory reallocations.
++	line.reserve(128);
++
++	do {
++		char c;
++		ret = recv(fd, &c, 1, 0);
++		if (ret == 1) {
++			if (c == '\n')
++				return line;
++			line += c;
++		}
++	} while (ret == 1 || (ret == -1 && errno == EINTR));
++
++	return line;
+ }
+ 
+ char* url::get_pac() {
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 19dddebd44..a14c358cc2 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -10,6 +10,7 @@ DEPENDS = "glib-2.0"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
+           file://CVE-2020-25219.patch \
           "
 SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
 SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
-- 
2.17.1

