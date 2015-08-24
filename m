Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3FC76AC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:52 +0000 (UTC)
Received: by pdob1 with SMTP id b1so58166356pdo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qBge0zeMGrpriwmj+rNsOv7838OZA1xErMkJl771/GQ=;
	b=Jm8KSzc3mjUSMfDEc0fyN15MWIwZufM3tgn+HsU6iRy1mZ5W4YFutyE6q726UfYylZ
	pwKBRbw7FDzndqmq+TXZERAbFhIhqYAJ8EYX16rEa2EzCVCSdO/ZqAhEmF/q2LByy+Il
	28PqETCH14aikqU4VbAiGGLlrO2hBq5MGC2cTXuuKQ+pp4tA6IXECDAwtBOH6SFL5HJ+
	lvhG0SvUXtnLnc42wM807DuKqFEMrs+OUgm1UOukWNoD9PUc0ODW9brMtr1yE0/en+T5
	kskttb+YVRRmRmvzbP2NbfJsDoz2fKCYO9sd0bIKKx0D91E9+qEv4MjJ+0uBpx/48OHb
	JX5w==
X-Received: by 10.70.16.3 with SMTP id b3mr49400903pdd.54.1440454793192;
	Mon, 24 Aug 2015 15:19:53 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u10sm18537623pdp.85.2015.08.24.15.19.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:43 -0700
Message-Id: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1440454579.git.chris_larson@mentor.com>
References: <cover.1440454579.git.chris_larson@mentor.com>
Subject: [PATCH 1/5] libunwind: always depend on libatomics-ops
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:52 -0000

- Depend on libatomics-ops unconditionally for all archs, as it's used by more
  than just arm, and currently the configure script auto-detects and enables
  its use based on the existence of its header, resulting in non-deterministic
  builds.
- Drop the ldflags bits which link against libatomic_ops, because libunwind
  doesn't actually link against it, nor does it need to, as it currently uses
  all inline functions from the header file.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 406bbe4..c8eab58 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "a portable and efficient C programming interface (API) to determi
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+DEPENDS += "libatomics-ops"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
@@ -18,11 +19,6 @@ ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
 ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
 ATOMICOPS ?= ""
 
-LDFLAGS += "${LIBATOMICS}"
-LIBATOMICS_armv5 = "-latomic_ops"
-LIBATOMICS_armv4 = "-latomic_ops"
-LIBATOMICS ?= ""
-
 LDFLAGS_append_x86 = " -fuse-ld=gold"
 LDFLAGS_append_x86-64 = " -fuse-ld=gold"
 
@@ -32,9 +28,4 @@ LDFLAGS_append_aarch64 = " -fuse-ld=gold"
 LDFLAGS_append_powerpc = " -fuse-ld=gold"
 LDFLAGS_append_powerpc64 = " -fuse-ld=gold"
 
-DEPENDS += "${DEPLIBATOMICS}"
-DEPLIBATOMICS_armv5 = "libatomics-ops"
-DEPLIBATOMICS_armv4 = "libatomics-ops"
-DEPLIBATOMICS ?= ""
-
 BBCLASSEXTEND = "native"
-- 
2.2.1


