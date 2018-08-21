Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id F2CBE79010
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 14:59:00 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id f38-v6so3330263edd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M+/mzRTwSAigDSKH8KKEaXm5nlc8eJbV93hz7QKPZGw=;
	b=RFNSJbbs7KSju7jgBX0XsrvIrLf0GGT0WXsJeCI9iIIe2gn2z9GJvYIO/idrZYk3ty
	EaFG3M4IMKIjKTpuH0HWoBTegex/DwFJ2jwTBm9nwOl2Or625M1F/Ccxz+n2Bd6etZjy
	Tg1CEg9+acjjhjdCj6H3ktucynVaZHVKgLLKebroXGaFlaoFPs7bX0DP092tXT+Z6/w9
	wpps30MpNO9pUzrGLQDHJ97/mIJpv1JGT9KO1Sp+H1jdIcx174Lw4D8JaWV0dGAc7pLO
	6NfQ8i4nqHYn31QPLFWamFaZpiefXUMpevVwP9zF9uQOIfK+sGVGi3Lvo/5ftxcAooWk
	Telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+/mzRTwSAigDSKH8KKEaXm5nlc8eJbV93hz7QKPZGw=;
	b=g2hUuQ+hQ1nBChG5B5Umcbaj2I2ffVZDjp4iujH6Wbg2Zgo/jY0Swfz2u1UuAoj+yD
	GqzMaKYM6W58HEpZcpEK5DXDqXV9imBAmns9NxSmfqDywqeWGnV78jXxZtB/n2sy4N3B
	7wbq/r7gV9u3wERooZdyYJUyOgGhZyeX0c5oSADcy1UT1r4jBJVxk49vskZ/cLEYIhUz
	eI65aqzO3IEMGrZ1eeeJY0tbDFJldT5wPoiEGK6275Qm9FdImc+M5rlO7JgPHgrBUJOi
	QlGhK/TZFqJ2GUfNPa5isnnNGEpsVqVorKGpxNPNaMxJk7TZfxAQDFrXpbtAf2A8iAhY
	wYNQ==
X-Gm-Message-State: AOUpUlEywuTGUp3rf+fL/QN8VeyB1VgBPrW5VO3ViZ6xOe6dpwYnY6kH
	G3UE/V7fauIKVQXYT/RJJUj2MHGf
X-Google-Smtp-Source: AA+uWPwv1MtU1SA4720yUc/7uOwHJ/IoRvNocRL2sFIMUj22N0kQkh1mUl6GQXijrF+Qkl4Of1JfJA==
X-Received: by 2002:a50:e68c:: with SMTP id
	z12-v6mr61590666edm.275.1534863541280; 
	Tue, 21 Aug 2018 07:59:01 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	w25-v6sm6937248edr.31.2018.08.21.07.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 07:59:00 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	richard.purdie@linuxfoundation.org
Date: Tue, 21 Aug 2018 16:58:58 +0200
Message-Id: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Tue, 21 Aug 2018 14:59:01 -0000

RTLDLIST table does not include /lib/ld-linux-x86-64.so.2, resulting
on the following error:

root@qt5122:~# ldd ./qtec_webcam
not a dynamic executable

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../glibc/glibc/0031-ldd-rewrite.patch        | 22 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-rewrite.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-ldd-rewrite.patch b/meta/recipes-core/glibc/glibc/0031-ldd-rewrite.patch
new file mode 100644
index 0000000000..5c375997da
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-ldd-rewrite.patch
@@ -0,0 +1,22 @@
+From: Ricardo Ribalda <ricardo.ribalda@gmail.com>
+Subject: Fix not a dynamic executable error on X86_64
+
+RTLDLIST table does not include /lib/ld-linux-x86-64.so.2, resulting
+on the following error:
+
+root@qt5122:~# ldd ./qtec_webcam
+not a dynamic executable
+
+
+Upstream-Status: Inappropriate  [OE-Specific]
+
+Signed-off-by: Ricardo Ribalda <ricardo.ribalda@gmail.com>
+diff --git a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
+index 44d76e8aa1..611efd56b0 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
++++ b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
+@@ -1,3 +1,3 @@
+ /LD_TRACE_LOADED_OBJECTS=1/a\
+ add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
+-s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[ 	]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6"_
++s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[ 	]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 0ebbaf9610..a968c86214 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0031-ldd-rewrite.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.18.0


