Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5F06F7BFAD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:38 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id g62so1035596pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lBgS2otMX0+ou1WJZ8EAmJ0Dy8TV9NHfB1MJtQEm48k=;
	b=JYMGQVcQG6jqammKJCtKOwnWol4HywUpgpcW/jlpRsax4muvBHi81uiy0Ugm25VCWO
	9D2ayGxdLw9n6FUvAREBKTgpE+DXrElrAfCeoySXiOU1mNOQzxompqGhn84Baoaex59e
	PgRrP047foMSJ92XvD+iQRA3sClZFH3eT0NFke30Mo/LIs+A2CAOBwSa/yvYK1GX2E/M
	p/FkN61BNHi7BiahSeZSeHIC7rPb5Q4fb0JfZ/MyfGNt6m0mo7zG57PAhYSbx1/hMeYE
	gnmjxI579h8Rf6VbwAVqhtxnRtUGWbYJrTTl4nIkpY4bfWlC//a7YKn4X8pIMISQRX4y
	0UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lBgS2otMX0+ou1WJZ8EAmJ0Dy8TV9NHfB1MJtQEm48k=;
	b=cIcaExyA9hyez6/iB4srL1EpHHz7L7RrEfKXOUi+dkO+MZq1TWtcGkleJHWBv7PHpy
	P3KsJCrqXS6IoJfe8+9ctjOBxthHeQY5Hd5GWpNSFYeFdFVyhJq2+ZLUqRNJCbK/Fgmh
	47+atfSGXSLprlHF2YlW2xlFwU0GEE0DIqRehBb4HX4CO0QfY/F+4VtuAtf+aIgzjP5U
	Gq8fpGHwvp7L2L+Dgg54PcaZqGIv45smJOfLFGktjQoQbIid+RlkgArppx9NfjwzLIsc
	1xtDhBd30wCZIUavomP2BnhZQ5ZDcZE9nWRIIz6ZAGRrdtfrNLAw7Z3ItzKjBmMw1efL
	ldVA==
X-Gm-Message-State: AJcUukePGzzIf22HYw7T2LC4FFuULnwjbjjlfCmlQb+nlbzO82yw0CZb
	+JpEH/lX7vDAG0R1rrlMgf08EObI
X-Google-Smtp-Source: ALg8bN5ncQNPz5dOmkc69gge0IzYrgjfIocMsCrO/pAnmSRgRBa1pRQtL880IGBZMEkDTIyk5+xeLg==
X-Received: by 2002:a63:a84a:: with SMTP id i10mr30886327pgp.263.1548917438565;
	Wed, 30 Jan 2019 22:50:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:13 -0800
Message-Id: <20190131065016.21887-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131065016.21887-1-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] libproxy: Fix build with clang/libc++
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2019 06:50:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-pac-test-Fix-build-with-clang-libc.patch | 31 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch

diff --git a/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch b/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch
new file mode 100644
index 0000000000..fedda9dd95
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/0001-get-pac-test-Fix-build-with-clang-libc.patch
@@ -0,0 +1,31 @@
+From 2d73469c7a17ebfe4330ac6643b0c8abdc125d05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Jan 2019 09:29:44 -0800
+Subject: [PATCH] get-pac-test: Fix build with clang/libc++
+
+get-pac-test.cpp:55:10: error: assigning to 'int' from incompatible type '__bind<int &, sockaddr *, unsigned int>'
+                        ret = bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/libproxy/libproxy/pull/97]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libproxy/test/get-pac-test.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libproxy/test/get-pac-test.cpp b/libproxy/test/get-pac-test.cpp
+index 0059dfb..911f296 100644
+--- a/libproxy/test/get-pac-test.cpp
++++ b/libproxy/test/get-pac-test.cpp
+@@ -52,7 +52,7 @@ class TestServer {
+ 
+ 			setsockopt(m_sock, SOL_SOCKET, SO_REUSEADDR, &i, sizeof(i));
+ 
+-			ret = bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));
++			ret = ::bind(m_sock, (sockaddr*)&addr, sizeof (struct sockaddr_in));
+ 			assert(!ret);
+ 
+ 			ret = listen(m_sock, 1);
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index dd7ad922d3..19dddebd44 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
+          "
 SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
 SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
 
-- 
2.20.1


