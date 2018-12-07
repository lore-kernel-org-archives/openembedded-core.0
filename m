Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 00C057523B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:06:09 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y1so4121563wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E/AxdhJ9QhROYjGyjfgzNRvrIGSaw87L1DM+T3DKunM=;
	b=a+m7e5h72KeLCAUC4VBfzlbn6UwjaTuluIWpm2UYRAXcMRy6cspQMcEMd6glYJ5uec
	KOthe1SmaKKSnq2rw5eSx6kuB7R2QYa2VaDrhCgwsgqKUbjkSMtLz0Vtojvp8qdl/k8W
	AxDFiKxnOnwosxMkaCkTFEmbWIjVkscl273vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E/AxdhJ9QhROYjGyjfgzNRvrIGSaw87L1DM+T3DKunM=;
	b=hS9E7kad+BTaB6CjpZZDFdRtSKbgR/gp1LfQOSf2xqWRZakp7zMTuHqzLzrAhUkhkV
	Zz2NM/jMg49TVjaCwUVTFOVlwgTyMRsEH9V0fLV3PFlqNk8RVCjf6qy6KxZlb+p+DXnC
	UvXGrdsH85ocGRiR+r3b2w/xz6XZMNZrQ7RbvQI8BovbQrwoLxi4yvhtNJFv1Mkb8rRu
	tEyfeB5qRdm5+Khx6mUvprm2UqrKs+SKYfhPTsgi8XGt4MhbSzdBvmuo81cV/1ErP/xW
	iY2DBsxVR4DaN0KfahpLpSGdl0/mgjqkOiXQGef9NjnkgWh0ohrp6SqZyJoDK46EzWCj
	LmnA==
X-Gm-Message-State: AA+aEWYCGwFNWbcuwLgJUpxknW0QJjfoUg2noJSmmj80y1ge0K9n0F7/
	RCSsu+DWwSjgr2NrGMxHzLriCqPvyYM=
X-Google-Smtp-Source: AFSGD/WSBKz/KDALLXCPhiYuHRGgfSgGPhpXiE0bJI0acrZVi7KJyQR9Y3vp7xSFOMbtbIxkKyB3GA==
X-Received: by 2002:a1c:7619:: with SMTP id r25mr2172551wmc.7.1544184368474;
	Fri, 07 Dec 2018 04:06:08 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y9sm2818574wrq.55.2018.12.07.04.06.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:06:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:06:05 +0000
Message-Id: <20181207120605.11344-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Fri, 07 Dec 2018 12:06:10 -0000
Content-Transfer-Encoding: 8bit

opkg needs the replaces/conflicts/provides in order for this package
to function as intended. When enabled, this code caused failures for
core-image-sato -c populate_sdk.

The reason is that nativesdk-autoconf has several perl dependencies. We
need to list more of the things which this package provides/conflicts
with in order for it to function correctly. Therefore add the missing
entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/dummy-sdk-package.inc  |  4 ++--
 .../meta/nativesdk-sdk-provides-dummy.bb      | 20 +++++++++++++++++++
 .../meta/target-sdk-provides-dummy.bb         |  3 +++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index eafcb823ab2..4d653706b13 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -20,7 +20,7 @@ PR[vardeps] += "DUMMYPROVIDES"
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
 }
 
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 11a727d4867..d33e978666f 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -2,6 +2,26 @@ DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
 # Add /bin/sh?
 DUMMYPROVIDES = "\
+    nativesdk-perl \
+    nativesdk-libxml-parser-perl \
+    nativesdk-perl-module-bytes \
+    nativesdk-perl-module-carp \
+    nativesdk-perl-module-constant \
+    nativesdk-perl-module-data-dumper \
+    nativesdk-perl-module-errno \
+    nativesdk-perl-module-exporter \
+    nativesdk-perl-module-file-basename \
+    nativesdk-perl-module-file-compare \
+    nativesdk-perl-module-file-copy \
+    nativesdk-perl-module-file-find \
+    nativesdk-perl-module-file-glob \
+    nativesdk-perl-module-file-path \
+    nativesdk-perl-module-file-stat \
+    nativesdk-perl-module-getopt-long \
+    nativesdk-perl-module-io-file \
+    nativesdk-perl-module-posix \
+    nativesdk-perl-module-thread-queue \
+    nativesdk-perl-module-threads \
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 714d15d8ba9..57c10044f87 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -1,6 +1,9 @@
 DUMMYARCH = "sdk-provides-dummy-target"
 
 DUMMYPROVIDES = "\
+    busybox \
+    bash \
+    perl \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-- 
2.19.1


