Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1915.1588730092713450462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 18:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0461sprs024792
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2020 18:54:51 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 5 May 2020 18:54:51 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildtools-extended-tarball: add nativesdk-glibc
Date: Wed, 6 May 2020 09:54:47 +0800
Message-ID: <20200506015447.13003-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
version is too low then it has to build with buildtools-extended-tarball
which provides nativesdk-gcc.

But it fails to build nspr-native:

| gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
| /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
| /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
| /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
| /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:379: abstract] Error 1

Add nativesdk-glibc to buildtools-extended-tarball. And it increases
size of buildtools-extended-tarball about 3K from 48356989 to 48360329.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index c32d0107c3..ab95d62f6f 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -27,6 +27,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
+    nativesdk-glibc \
     nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
     "
-- 
2.17.1

