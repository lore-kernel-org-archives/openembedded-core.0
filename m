Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA6BC7702A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:56:19 +0000 (UTC)
Received: by igdg1 with SMTP id g1so53803229igd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sEsKZrYm5WiA3mcHHm7JpmHar2y5Gl6lSwfy6rQjh+E=;
	b=dKOdLs/UPOqsCr8wppePO9A2hcBzg1QjbO3EOv9ieiAsiECyDrZtkEhxGT0dsmEFhn
	3NNCJji8SQ1nWFbxD1toMcclcmSA/XekE4XWsu1HsIG/t1Gd8e+wtCRgY3ssn4LuU0nx
	Ba3fC2vAg+XbqpgHpOHZMbjNwn0L/kQW3sK/44HBo9GslXMW53tl4xugZh8b29X+tC3G
	20wxpVvKbnA9nindf4zhp53M03ZPf1arEPlR+2CutPL3BmTCNXGsq7hta992kdo7uq8p
	E4/e+QqzAcIMiXG9UoUYLaSKl9UG6aP2UVHgbcNimhxvaEWc6GPjukBcb24JpylVvXcq
	M9nA==
X-Received: by 10.50.28.72 with SMTP id z8mr1260293igg.96.1445309779809;
	Mon, 19 Oct 2015 19:56:19 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id d6sm551224ioe.30.2015.10.19.19.56.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 19:56:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 19:56:12 -0700
Message-Id: <1445309772-4373-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python: don't append -D__SOFTFP__ to TARGET_CC_ARCH for armv6/armv7a
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
X-List-Received-Date: Tue, 20 Oct 2015 02:56:20 -0000

Remove obsolete hack which seems to date back to (at least) 2009. It's
potentially harmful as python TARGET_CC_ARCH flags can leak through to
other packages via the sysroot _sysconfigdata.py.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 5 +----
 meta/recipes-devtools/python/python_2.7.9.bb  | 5 -----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index f61d278..a33f10f 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -56,10 +56,7 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
                 ac_cv_file__dev_ptmx=yes \
                 ac_cv_file__dev_ptc=no \
 "
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index f7e2f27..bc20417 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -34,11 +34,6 @@ inherit autotools multilib_header python-dir pythonnative
 
 CONFIGUREOPTS += " --with-system-ffi "
 
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-
 # The following is a hack until we drop ac_cv_sizeof_off_t from site files
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
-- 
1.9.1


