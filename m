Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCE3E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5197.1735810879061658680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GvQZ/ojr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f664af5so126808215e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810877; x=1736415677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1xPBbt+PXWni1v4v68K71E/kiV/f5T5ark9cIpWcHE=;
        b=GvQZ/ojrD14eTLOD+jdXuX5Pg2Ao5Nif7yqj/fe6g16WxOnmCAmKfuPK8st0x61rfu
         pLwKFZqFOuz0fUigvX8QrHyaiW7n0Icq0l9gjsM+NQeBvwgYnr27cb/t1dTZoiF6/jTw
         yvIx4u+J2n8A2cElm+6NtVdQNV1cTAactR4gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810877; x=1736415677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1xPBbt+PXWni1v4v68K71E/kiV/f5T5ark9cIpWcHE=;
        b=EOVVz4VZptqAdgYfPLsvYWEvXuhwUJkPjlOEM1+WyNIukDnBZG54ej4z0UNpuJYUQj
         JZ3iKedXMp/kH70f7/yUvVJpEpDNnwnmJcJyUkj2Pm0JDWdBu0x7VRp5ky4mUo6aIywT
         jCBleMSlDgAzhP47W5oVd/RYKUpsQPd3uoLbn/N2GRt+3bIfmJ55Rc0kCeBHdBEhY5UR
         KpHscj2/G0Lqdf79G8wYMTPKM9kOep351U6eRbF/n8iDb7NHZavAypAce56NNdhHpJ+S
         kGv6a+wUlOUA+K8rKVC8GuQ7IlUcSPZ2gNIFNtYwHmLndFD77CH7KQ+Ue+bqn5qYN82c
         YmmA==
X-Gm-Message-State: AOJu0YwMRswZzlRIB6J1RGEBtzcA3PYBiY6XmB2Wvx+wk9P3y5QNENKd
	ZCaAfGaPKyy84N5cyqAVpoO09Pr4dGkw2MSs+j6jnjru493H05ySOuNxEvOPyV8YBN6yy/ul7A8
	ITDk=
X-Gm-Gg: ASbGncu2JXwid0xUhGh4mTSKglFvrtDboO3TC+HOZ2DlvFb2lcaplsXCtHQep6nGODk
	QTWGLrkGiZ5/FqimGO5dVViEDczvf03PiMumwAbAHLg+wJxuCX/N7NskQ7MbrWWH1pgCQnvSqST
	Bq6t3rWGdU+41+1JHu2lC5TS6F6EdSDpDKbNea3vQP+U5gTeYlRlQej9oxO2KpXlBP9foepv9uq
	hZIquQCPDv7rhU5pM4EnQRnu0qjt9E9rxOrjg1Y6c+xdaxYqk3MzfY8LaHdyAWAPQyv5oUXIkfx
	0nvk6LxJ6A==
X-Google-Smtp-Source: AGHT+IGRhXg95PjZ4KazQX7bJlTDAvIwJqDvMoApN8BD2RiMUpagCfmUiFqF5hr2OSHAopsJAbmC7A==
X-Received: by 2002:a05:600c:3106:b0:434:a802:43d with SMTP id 5b1f17b1804b1-43668b93817mr362729265e9.27.1735810876805;
        Thu, 02 Jan 2025 01:41:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/21] nettle: upgrade 3.10 -> 3.10.1
Date: Thu,  2 Jan 2025 09:40:42 +0000
Message-ID: <20250102094059.322187-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209271

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../Add-target-to-only-build-tests-not-run-them.patch    | 9 +++------
 .../check-header-files-of-openssl-only-if-enable_.patch  | 7 ++-----
 .../nettle/{nettle_3.10.bb => nettle_3.10.1.bb}          | 2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.10.bb => nettle_3.10.1.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
index 345fc43ebee..ee3e74c43b2 100644
--- a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
@@ -1,4 +1,4 @@
-From e9fcb2177fda228ac065d189240e2d992e86e5bf Mon Sep 17 00:00:00 2001
+From 3ea3eaf5bda21529fc8a8da3d8b07ebc3875ba7e Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 2 Aug 2024 09:48:43 -0400
 Subject: [PATCH] Makefile.in: Add target to only build tests (not run them)
@@ -21,7 +21,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 2bf7f1e8..403a868a 100644
+index 71ad761..0f239f4 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -53,6 +53,9 @@ clean distclean mostlyclean maintainer-clean tags:
@@ -35,7 +35,7 @@ index 2bf7f1e8..403a868a 100644
  	true
  
 diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
-index 0699fa0d..8ac9983c 100644
+index 0699fa0..8ac9983 100644
 --- a/testsuite/Makefile.in
 +++ b/testsuite/Makefile.in
 @@ -137,6 +137,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
@@ -47,6 +47,3 @@ index 0699fa0d..8ac9983c 100644
  check: $(TS_ALL) $(TS_ALL:sc-%=%)
  	TEST_SHLIB_DIR="$(TEST_SHLIB_DIR)" \
  	  srcdir="$(srcdir)" \
--- 
-2.39.2
-
diff --git a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
index 49d633b5f78..89b5c7bec40 100644
--- a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
@@ -1,4 +1,4 @@
-From 5f7cdd2b878298577accade43a38e1a0951d17b4 Mon Sep 17 00:00:00 2001
+From ec2ca7e505e6bfe1fff2a7d6e6bb39b60b93e19a Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Fri, 9 Dec 2016 15:23:17 +0800
 Subject: [PATCH] nettle: check header files of openssl only if
@@ -23,7 +23,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4f27e663..673c1492 100644
+index 7c003bb..779f7ff 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -197,9 +197,11 @@ AC_TYPE_SIZE_T
@@ -41,6 +41,3 @@ index 4f27e663..673c1492 100644
  
  # For use by the testsuite
  AC_CHECK_HEADERS([valgrind/memcheck.h])
--- 
-2.39.2
-
diff --git a/meta/recipes-support/nettle/nettle_3.10.bb b/meta/recipes-support/nettle/nettle_3.10.1.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.10.bb
rename to meta/recipes-support/nettle/nettle_3.10.1.bb
index 92bc78263c9..85c470b10da 100644
--- a/meta/recipes-support/nettle/nettle_3.10.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c"
+SRC_URI[sha256sum] = "b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 

