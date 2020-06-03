Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.8321.1591167336786957926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 23:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0536tXcj000099
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 23:55:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 23:55:33 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] rpm: fix rpm -Kv xxx.rpm failed if signature header is larger than 64KB
Date: Wed, 3 Jun 2020 14:55:31 +0800
Message-ID: <20200603065531.38457-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Since commits [Place file signatures into the signature header where they
belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
is larger than 64KB. Here are steps:

1) A unsigned rpm package, the size is 227560 bytes
$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
-rw-------. 1 mockbuild 1000 227560 Jun  3 09:59

2) Sign the rpm package
$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm

3) The size of signed rpm is 312208 bytes
$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
-rw-------. 1 mockbuild 1000 312208 Jun  3 09:48

4) Run `rpm -Kv' failed with signature hdr data out of range
$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
xz-src-5.2.5-r0.corei7_64.rpm:
error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
bytes(88864) out of range

From 1) and 3), the size of signed rpm package increased
312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
is not enough.

As [1] said:

    This also means the signature header can be MUCH bigger than ever
    before,so bump up the limit (to 64MB, arbitrary something for now)

So [1] missed to multiply by 1024.

[1] https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...he-limit-of-signature-header-to-64MB.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
new file mode 100644
index 0000000000..88a7bc7c41
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
@@ -0,0 +1,62 @@
+From e8bf0eba7143abb6e69db82ee747a0c6790dd00a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 3 Jun 2020 10:25:24 +0800
+Subject: [PATCH] Bump up the limit of signature header to 64MB
+
+Since commits [Place file signatures into the signature header where they
+belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
+is larger than 64KB. Here are steps:
+
+1) A unsigned rpm package, the size is 227560 bytes
+$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
+-rw-------. 1 mockbuild 1000 227560 Jun  3 09:59
+
+2) Sign the rpm package
+$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm
+
+3) The size of signed rpm is 312208 bytes
+$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
+-rw-------. 1 mockbuild 1000 312208 Jun  3 09:48
+
+4) Run `rpm -Kv' failed with signature hdr data out of range
+$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
+xz-src-5.2.5-r0.corei7_64.rpm:
+error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
+bytes(88864) out of range
+
+From 1) and 3), the size of signed rpm package increased
+312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
+is not enough.
+
+As [1] said:
+
+    This also means the signature header can be MUCH bigger than ever
+    before,so bump up the limit (to 64MB, arbitrary something for now)
+
+So [1] missed to multiply by 1024.
+
+[1] https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/1252]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/header.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/header.c b/lib/header.c
+index 9ec7ed0..cbf6890 100644
+--- a/lib/header.c
++++ b/lib/header.c
+@@ -1906,7 +1906,7 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
+ 
+     if (regionTag == RPMTAG_HEADERSIGNATURES) {
+ 	il_max = 32;
+-	dl_max = 64 * 1024;
++	dl_max = 64 * 1024 * 1024;
+     }
+ 
+     memset(block, 0, sizeof(block));
+-- 
+2.25.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 8add142461..cbe1acffe2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
+           file://0001-Bump-up-the-limit-of-signature-header-to-64MB.patch \
            "
 
 PE = "1"
-- 
2.17.1

