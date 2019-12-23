Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE1666C0F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:53:46 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so9500857pga.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lJaaA7Gsw9xCvhY+EVmXh7jp+Ku3APhPo3k5znWzGRU=;
	b=bPJGAq6a4hJ0U8hkV2nmuUmjY0J0Cl9jsUvT8dwWkzm7bthFFcLL5YwC6MvprFfZgO
	sW31SqCaDUPwafSjxNSt1WeM5MEH90/eRs1OnbT1VFppIINMAqFGbsIrQ5m3eiuTJs4f
	z88vyaibKgrRGeEa6/8sJdFD6MI0ubvuWPo0xzRCzztey/LqdlcJOd+oOnCQ2DOaBcPx
	Dl7QxM5CfkGdNPoXmY+9j5KsHS19Mqg5ePla7hF1OQmM517cDSTZrXVKTMXtU04Ug3i6
	n7vFpn/sOirlKPJGdJZ1hIU98zG+X9hB1gRdBdVB+6kn6AnBz9ELcEjD1Uldtqw3VRMq
	W1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lJaaA7Gsw9xCvhY+EVmXh7jp+Ku3APhPo3k5znWzGRU=;
	b=Aebzougq+Hs1buMCDqKyjhPywtI4pIdP0gFQk/hUaVhlQgoYYpO9wwp8gm3zqhUHWJ
	8TF6KreCnIovTupdwux5XRJBVxG35E0ruTO7Mgeewo2jODFHoB/3K/f+QZci8seZAtFh
	lJPaNB5oUYbi7xGhchEWqjPZChC2QN6Tneu93qlZPZLF8TDmQzRrzZ1k9CnUQSllReZF
	6lNxDQbK3rYxXRyIASB8nlVjJZ2aTDQ87h7VnLMAsQT/W0+KKq3rmcvXTnPySFtZNgXQ
	v7mkbYUNtLdijjunE+U0ze5mWswf8U/wtheuY/+ogcxXYHfEBrsjb7HmqWfhrJAnABkS
	1fjw==
X-Gm-Message-State: APjAAAUfsIBHr+RXj30x9+N63WN41TzTQct56FT5ftAox8yMycihvUP8
	pH48IsrUTyO8fzum98zupGGq8LEkTTc=
X-Google-Smtp-Source: APXvYqzHiNhclgqZzJfrKFXcNFJW+xoAtmnOKxLvfYfTvXNkOj97c88zT4dB9qB+hkwLghHylWxnkQ==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr33773565pgb.306.1577141627373; 
	Mon, 23 Dec 2019 14:53:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	c78sm26346630pfb.122.2019.12.23.14.53.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:53:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:53:38 -0800
Message-Id: <20191223225338.2277162-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Mon, 23 Dec 2019 22:53:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind/valgrind/s390x_vec_op_t.patch    | 19 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
new file mode 100644
index 0000000000..eea671da0a
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -0,0 +1,19 @@
+s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
+removing it ensures that valgrind can be built with -fno-common option
+
+Fixes
+ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-guest_s390_helpers.o):/usr/src/debug/valgrind/3.15.0-r0/build/VEX/../../valgrind-3.15.0/VEX/priv/guest_s390_defs.h:289: multiple definition of `s390x_vec_op_t'; ../../VEX/libvexmultiarch-amd64-linux.a(libvexmultiarch_amd64_linux_a-multiarch_main_main.o):/usr/src/debug/valgrind/3.15.0-r0/build/VEX/../../valgrind-3.15.0/VEX/priv/guest_s390_defs.h:289: first defined here
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/VEX/priv/guest_s390_defs.h
++++ b/VEX/priv/guest_s390_defs.h
+@@ -286,7 +286,7 @@ enum {
+    S390_VEC_OP_VFCHE = 18,
+    S390_VEC_OP_VFTCI = 19,
+    S390_VEC_OP_LAST = 20 // supposed to be the last element in enum
+-} s390x_vec_op_t;
++};
+ 
+ /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
+    ULong variable.
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 63f972945d..aedaab27b3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0002-valgrind-adjust-std_list-expected-output.patch \
            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
+           file://s390x_vec_op_t.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.24.1


