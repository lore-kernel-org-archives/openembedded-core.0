Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8F360767
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 06:58:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n62so572413qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 23:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=BgclFTewsCXiceCMk1IbLbB4vaVPbQjoJAlrMFcivu8=;
	b=nf11RtmU0GFjPo90vqaPr8xsEiUtmWeaPLS5/d2qWHfY2LzwXDw/nxlvVJCxnYiZ30
	R8OFVvACjOk4AGldco8jzlaE9i7G5A+kERXZX6SYd/sDXYsZbr47va/a7v56aMwEZfBU
	/+F8IaDsutDA8dW+i8u+POLetmVFRgXPA1kblcvgyuWNGpD3XMMOAyQHGv+UG6gMeLiS
	IU/4giIlkxB5LasrSVBAwQoYSdIqS69JQEYmDwe1z445s6O+UYXbgr6SmVEX66La2KL9
	1dkVSVWWdhO1kg0M6vLkHzl/9MW/sEStQwcZZDocjdzE+459MF8SZkv+0J0U7k9efGAg
	fMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BgclFTewsCXiceCMk1IbLbB4vaVPbQjoJAlrMFcivu8=;
	b=OERt5YPMEsLn+2pjJnBUc10TukGg5A40opf9yoZI3Ma5XEspAHY2piWStWdY18CYxm
	NtNXbY3g9tR2VvPbPgcwErhtOYB7httiTLzRP/fL33onLM7le4Ll+qAKk7UQf8O2Gfsy
	CTC+HEhloiPEHuB/zX9PAc2wl3R2oa9rlk4ItbJlspWrTxw5cdPNLjokvMBetjAeYKh4
	OxsIe9e6rMzJJb+WVD1VtZde5ZYKI2vLdMNxM8nZ/yQbJfBgUNsdol8l7Tkk7a88hbAv
	lRXmaMPay+0awZAcMwx/8rooUAsNMpf7TcY7BH+EeY7D+iHUAExbUiuSf404djAijNtM
	LPuQ==
X-Gm-Message-State: AOPr4FVUWYM10yWq+GI3Zi45+DqQWFad2iQPfoS3fdBYxAuGD+izd3E4jd4aOXvGxIlqbQ==
X-Received: by 10.55.24.20 with SMTP id j20mr24629189qkh.121.1463468320648;
	Mon, 16 May 2016 23:58:40 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id s62sm597272qhe.10.2016.05.16.23.58.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 May 2016 23:58:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Mon, 16 May 2016 23:58:37 -0700
Message-Id: <1463468317-12500-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [v2][master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 06:58:40 -0000

From: Armin Kuster <akuster@mvista.com>

V2:
Add mips64 and ppc64 fixes

numpy/core/include/numpy/npy_common.h:149:10: error:
|          #error Unsupported size for type off_t

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h   | 1 +
 meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h    | 1 +
 meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
index 191e5a1..109deb0 100644
--- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
@@ -11,6 +11,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
diff --git a/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
index 8e2b5d0..debb390 100644
--- a/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
@@ -12,6 +12,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
index 8e2b5d0..debb390 100644
--- a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
@@ -12,6 +12,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
-- 
2.3.5


