Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7F67F877
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z16so17277445pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lJaaA7Gsw9xCvhY+EVmXh7jp+Ku3APhPo3k5znWzGRU=;
	b=lZOkVkj6OmoLglRYL48XC1TjRhd1EU6CX5Oat15I8yhaiWLwA2sUA1FqWNWvkxwtwn
	qDrNjyPaeLVblR3r2AkQPSd7yzyCJXbDXktS0De2EY7MUArtL6vjOHEhacyL7z1NJQ7f
	KqPsSaxhA/frKNNOt7lYGDRWW3OKpuwhSSpRO1rzGLOee4TzjAX88ULtWVZdFv/UCuY6
	bd7lxW/qs3XDsxlPTn5RLTO3Akf2VBM7+ZeDZjWaVILoPs3Froeqkjdk0z226pQjPsfs
	SMRBtIOmlOw/hi1Iyn5BiYSn5b43/Y6RFjCaovUvYOMLk8RhYLaMDMQKXMmJf6nWBQmm
	ztyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lJaaA7Gsw9xCvhY+EVmXh7jp+Ku3APhPo3k5znWzGRU=;
	b=RIm/GOI/4lSMlK5WcWvN1UC3vxzEbUedY5XN2aRgnLHju2sldLKsWxw+lYPRZEuCTJ
	u3yeJeGZRcxErdJ6iqubGLhHYdrZErTCVaq+zTHy3zCJXbW4rkc6Xz+QJERccmyEz4kP
	ZTEdVqCF5vWfSMpp4jCs1EzHoWzHN9I8EXUAJz+yNbq00uDMCw3pK/yaSwTotk6oTOE+
	cWhaG+Z+eQJ8vIAJSI9kTEh5vyozDiJHalGTlLIhlUjNE0eQfRIiUtV23++dpHX7iwvJ
	5oDSLS8gGn5YPREu82Jvaln0Ltc/oXppMqQrVUoeUxydzYA9H5p0ZASuXQtzUVmNZ1z1
	953Q==
X-Gm-Message-State: APjAAAUujpxVfOfmBZImDLAiR5q/AlnWgTR397+8cfrLgCLVnkd0hnJe
	9aofRS3guWeSQfNtcCx7Ul3micTRYDY=
X-Google-Smtp-Source: APXvYqw5jfYt89c+shPGvZBwxZUBG4vASQKJMUVG474jbYcEG9jPhOUNpQoWbFnPTlexOP7udYw/Xg==
X-Received: by 2002:a65:420d:: with SMTP id c13mr69182187pgq.101.1577645079938;
	Sun, 29 Dec 2019 10:44:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:10 -0800
Message-Id: <20191229184415.19514-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/19] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:39 -0000
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


