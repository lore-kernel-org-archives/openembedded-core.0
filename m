Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5C62375C60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:41:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id k186so18387260wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fPrkMKlA568UUFRCIQTLrWHtC8U4osf/UA++ZxYo974=;
	b=a45/A7Vq0wnXQuCfuEnNZmbeZvQvCyb3P/C7l+WpSR2VmAFMz+gDJPCPh5AOWhW0pC
	PJAHF6Rl8iHiDR9xwr0Vq789qdWvbA4oC/AACLN5XLTovaw3z9mjlK8z5Z1M+kvoAHp1
	SqAv6s1Ge5/EdX5fWDVtHIQoga6KOFNp2lJkjlkN9Z03UMtM9+l3WjD3ODg8I9mTBy4K
	wNx4bfhiTFUoSaH8Yak0vl+tFkqhxng0zQkYv2U3qC3IhhqCZ2j153H/EHSLtaWod67z
	acqrx3g7HWqYeI4NE5KTrRGiWCvOPm/dNxLDGQlqAK0U3A4uXH/5u7mjcc8AfiP/idDV
	MElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fPrkMKlA568UUFRCIQTLrWHtC8U4osf/UA++ZxYo974=;
	b=fERNYcPC/Xczu2BNgWDo2bwibrVzgGWhLfsBKfKkP9mWQ2k7oX9IIF/w0bZTKGwdbe
	GklrFZEE/kxgKJ//DqWDDIINfk2zwCytrcPEkzU78bynp7A0n9p7t0LPEVjLFjWV2n+I
	tbFaBcuvTqw6PVelLbK2oiscyRv+5pSV6O8pdmKTc+P7exIKAvAFHxQHiawXg9hCs5pH
	txPdyD+vq3ccuAyVNaV58/t79eT8KwhrrH6YVdWUzpG6rHhbZOJmrHg4DfIAHMcEtjpi
	cGa77bKEpuhT3wx6S7kk7fR8jXTw6s/OUgWUhle2IZQdD/o5cx7gh1oxwnbD8qlClgB2
	aOOA==
X-Gm-Message-State: AE9vXwOMF3kNyOWtFr+kk3LJh02DJPvcBXXkFqEAuJnpJ69h1SGe2yBtyh0J3wIfarifoHDv
X-Received: by 10.28.19.194 with SMTP id 185mr11845721wmt.51.1473871305042;
	Wed, 14 Sep 2016 09:41:45 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p13sm5025189wmd.1.2016.09.14.09.41.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 09:41:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:41:37 +0100
Message-Id: <1473871297-28966-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] cmake-native: rationalise system/internal library dependencies
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
X-List-Received-Date: Wed, 14 Sep 2016 16:41:47 -0000

By default cmake will auto-detect if a library is present on the host and if it
isn't present will use an internal fork.  For some libraries using the internal
fork is preferable as it can be built with less dependencies, but for others
we're either already building it or the impact of building it is comparable to
internal build.

Continue to use the internal fork of libarchive as our libarchive-native has a
large number of build dependencies.  Using the internal libarchive means that
system bzip2 and zlib must be used.

Explicitly use the internal fork of jsoncpp as we don't have this in oe-core.

Explicitly depend on curl-native, expat-native, and xz-native to ensure these
dependencies are not floating.  curl-native is a non-trivial dependency but is
comparable to building the internal fork, so there's no reason to build it
twice.

Change bzip2-native to bzip2-replacement-native as bzip2-native is
ASSUME_PROVIDED.

[ YOCTO #9639 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.6.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
index f3a485f..a301ae6 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
@@ -1,8 +1,7 @@
 require cmake.inc
 inherit native
 
-# Using cmake's internal libarchive, so some dependencies are needed
-DEPENDS += "bzip2-native zlib-native"
+DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
 
 SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
@@ -14,6 +13,9 @@ do_configure[cleandirs] = "${B}"
 # Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
-- 
2.8.1


