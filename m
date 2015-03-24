Return-Path: <tylerwhall@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0DA60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 22:18:05 +0000 (UTC)
Received: by ykfs63 with SMTP id s63so4096427ykf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6GgeUzN0PuaIBA+ROMQlSuXEsmCC3CLrZP8NKXe/3EU=;
	b=vfERmkoGOMpldzImaaPQHWXEq7I6oslQ4T2+4y9KJkF52cGy1VzqWGww7dXY5UVAYk
	yhuN8vl8vLt9sc0Fn8rXPApT68Gj+qVFACJ0cva728vc2v/Gzdr1zL6iznEle44t0mTe
	9Mnz08ppFiZb+LpmrxKKEXDuatMKRDA1Z1irkhPZ1R6Ut6vlQdaZeAs7jq1k6xv9LdKJ
	XlM0ZlED0YmhCoO4ScnEUAGXo6zIdUf4x9JoCuLNxCfnX/Sp/yJGgZhFrnu9nTsesdZ7
	qTjzl9NJFyN/h3P8SJsw0DYabgL//mp5n0jIWGvFnuRj1Rq1pQqjL/+kq8HnWCret6Dv
	PG1g==
X-Received: by 10.52.113.10 with SMTP id iu10mr5022350vdb.88.1427235486616;
	Tue, 24 Mar 2015 15:18:06 -0700 (PDT)
Received: from metric.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id zf3sm319826vdb.6.2015.03.24.15.18.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 15:18:06 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2015 18:17:10 -0400
Message-Id: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] uninative-tarball: fix dependency on patchelf
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
X-List-Received-Date: Tue, 24 Mar 2015 22:18:08 -0000

DEPENDS doesn't actually add the dependency on patchelf-native to the
populate_sdk task. SDK_DEPENDS does this, but move the append to after
inheriting the base class so it does not get overwritten.

Without this, uninative-tarball fails to build in a clean workspace on a
system without patchelf.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 53435f2..62bdde8 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -11,7 +11,6 @@ TOOLCHAIN_HOST_TASK = "\
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "patchelf-native"
 
 TOOLCHAIN_OUTPUTNAME ?= "${BUILD_ARCH}-nativesdk-libc"
 
@@ -25,6 +24,8 @@ inherit populate_sdk
 deltask install
 deltask package
 
+SDK_DEPENDS += "patchelf-native"
+
 SDK_PACKAGING_FUNC = ""
 
 fakeroot create_sdk_files() {
-- 
2.3.1


