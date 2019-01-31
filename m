Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0372D7C3DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:38 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id s198so977866pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UBjkhw/BQMDfZefHbyB46nQizywFtiMVBLC/TKTzmrE=;
	b=dEw2i0b/YIAxeYRMUc1zfiCsrj7M6Y0p4KKJpv4WcTCeQsJn+i9MJMONFk3Iv1UXJ0
	CVpGPezZI/6/hssdiMC5OfQ+tZHIJnw7vlePAAfK93HRh8WJsAA6GWVbsBjhkDqQc8eH
	l9287Ps66w30xyCaAw8SawPDdfC9QIr0phUiRd1O9g1qjAot4D1hICAVL9qXnkoEA917
	gDFVo2Jh+Lh3JM/NfeVFKBScFcSBOyEnXzQmhCby/qXj7aZAUdD5BS/PPw8Wv14RnYdv
	aasGP3b7GGp+yGgMljAGzw8nbPYEePgjP5mos+F/NCmQEcfma0VH2zHbWF9JhAuN66Nz
	Hb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UBjkhw/BQMDfZefHbyB46nQizywFtiMVBLC/TKTzmrE=;
	b=RFGDpvsARzOo1jV8RWYmhp001GK1RwzuPfE8mfrcsh4jhPY64+elXodeynlSW/fXhR
	fTu30f/Ez7ECdB3AJ8zmOVDD5Cl2czuUjvfcExQj4WAJ8KdMwKLR/ABAJ9+bb+TQKGHP
	tkh7pwtq0xVGkmAGoRtd9KAt7e8hJPDg4T371yuizH059Fh2wfKMZ55WNfeH0W0NFT71
	MBb93uxEUGE4uzek1pJyRW5ZyCUqY/1nudmSQ0hnFZH2kq+I9mRGeReUR3gSVM79BXKw
	pFbvfQ4E5eGSa+GWoU3zp9TSjqmpTDOui1rzrR/clCkSvlLOlpCluyB3YYMc1uXnANqe
	Ra3Q==
X-Gm-Message-State: AJcUukegc7W6vUETrLLC99KYWs15I+1ysUX/2+bHQkk3izyn9tpjItAZ
	ATQhlcJZ54/WB9Q2fErPb9UnwW16
X-Google-Smtp-Source: ALg8bN6HaoZmK7yjsfmWwmyYn4rvGEaXzpcXagfOVRW4oau6iW9EYAW6dLn1dI8QBkZW5wkbYLn5Wg==
X-Received: by 2002:a63:4f20:: with SMTP id d32mr30280736pgb.47.1548917439548; 
	Wed, 30 Jan 2019 22:50:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:14 -0800
Message-Id: <20190131065016.21887-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131065016.21887-1-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] libdnf: Fix build with clang/libc++
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
X-List-Received-Date: Thu, 31 Jan 2019 06:50:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-missing-string-and-errno.h-headers.patch | 65 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.24.1.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch b/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch
new file mode 100644
index 0000000000..62de784820
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-include-missing-string-and-errno.h-headers.patch
@@ -0,0 +1,65 @@
+From ccc89ff0c1f8e55a4a22444d051925408f265df1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Jan 2019 10:32:11 -0800
+Subject: [PATCH] include missing <string> and errno.h headers
+
+This is unearthed when compiling with clang/libc++
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/677]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libdnf/conf/ConfigParser.hpp             | 1 +
+ libdnf/module/modulemd/ModuleProfile.hpp | 1 +
+ libdnf/sack/changelog.hpp                | 1 +
+ libdnf/utils/smartcols/Cell.hpp          | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/libdnf/conf/ConfigParser.hpp b/libdnf/conf/ConfigParser.hpp
+index 97f25500..2a3851fa 100644
+--- a/libdnf/conf/ConfigParser.hpp
++++ b/libdnf/conf/ConfigParser.hpp
+@@ -23,6 +23,7 @@
+ 
+ #include <map>
+ #include <stdexcept>
++#include <string>
+ #include <utility>
+ 
+ namespace libdnf {
+diff --git a/libdnf/module/modulemd/ModuleProfile.hpp b/libdnf/module/modulemd/ModuleProfile.hpp
+index ab018deb..8d996ff4 100644
+--- a/libdnf/module/modulemd/ModuleProfile.hpp
++++ b/libdnf/module/modulemd/ModuleProfile.hpp
+@@ -23,6 +23,7 @@
+ 
+ 
+ #include <memory>
++#include <string>
+ #include <vector>
+ 
+ #include <modulemd/modulemd.h>
+diff --git a/libdnf/sack/changelog.hpp b/libdnf/sack/changelog.hpp
+index a3d3fc44..d830c414 100644
+--- a/libdnf/sack/changelog.hpp
++++ b/libdnf/sack/changelog.hpp
+@@ -23,6 +23,7 @@
+ #define __CHANGELOG_HPP
+ 
+ #include <ctime>
++#include <string>
+ 
+ namespace libdnf {
+ 
+diff --git a/libdnf/utils/smartcols/Cell.hpp b/libdnf/utils/smartcols/Cell.hpp
+index 2e811dee..b90f0050 100644
+--- a/libdnf/utils/smartcols/Cell.hpp
++++ b/libdnf/utils/smartcols/Cell.hpp
+@@ -22,6 +22,7 @@
+ #define LIBDNF_CELL_HPP
+ 
+ #include <libsmartcols/libsmartcols.h>
++#include <cerrno>
+ #include <string>
+ #include <stdexcept>
+ 
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
index e379d8b256..a55acb2ef0 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
+           file://0001-include-missing-string-and-errno.h-headers.patch \
            "
 
 SRCREV = "04b71d78a2170e930a3c248d48a231b19f823064"
-- 
2.20.1


