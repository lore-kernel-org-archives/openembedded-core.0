Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0981960797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:48:24 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so16698253pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EuJCPRmLfVj1lUS5Ui5gMLmZXWh/qFtXElFl867qo9k=;
	b=KkTi2+BXE1C7eXmUjz+hRtIEECuBIngkRmPUq1sGDM0hE2ARWvVXGfVS97UBLmRaDx
	E2h4ANzKMlt6J2RzxKX3TUDyqkNniw3nBkVeZhsQZD0riSI3SfaD/Zm5nZwHCsbnxapf
	pRaac1O0HxhandKclVHtqvxxy+WVxQJZZc3OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EuJCPRmLfVj1lUS5Ui5gMLmZXWh/qFtXElFl867qo9k=;
	b=Hhkz/wBotDB46rGATZ6A+uqUZPvFtkNbe1zd2ndRq8SuroIZfFxODi91K57cCxOhH5
	1cdS79W9UKrX6iX2/eb5LljdkNLX67DkHGDikqlli4zd4bZlarOL1ffBy8zxaO8JsYHD
	GBVVe50v/QIOzbw72K4tOOIsOyOVDfgslay3oAEtu3ZbRjekZYWEcIAfebMnK3hrmHke
	9tHOxfqyGE+DNnaKPHauEfPidJvQT78If1kyfxzqWddss4OpiPE/cjVhUP6DPxkAs56L
	j7PnDq0nHbOjzkLP3nKL+9eqG0omja8Rqy5crwD2XtzL2ptG85+8GpcnAZPN81Gs5yaY
	KZxQ==
X-Gm-Message-State: AOPr4FWgc06r043X/SN/BFBtDUgb4X22tbgKKMJXA63ZAZhyKiAUJf4zVVpNKkf87BfJww==
X-Received: by 10.66.177.16 with SMTP id cm16mr54499471pac.23.1462841305048;
	Mon, 09 May 2016 17:48:25 -0700 (PDT)
Received: from localhost (50-205-91-113-static.hfc.comcastbusiness.net.
	[50.205.91.113]) by smtp.gmail.com with ESMTPSA id
	28sm43143546pfr.89.2016.05.09.17.48.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 17:48:24 -0700 (PDT)
From: Ruslan Babayev <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 17:48:04 -0700
Message-Id: <1462841284-7345-3-git-send-email-ruslan@babayev.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
References: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
Subject: [PATCH 2/2] edgerouter: libffi: fix build with soft-float tune
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
X-List-Received-Date: Tue, 10 May 2016 00:48:24 -0000

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
---
 .../recipes-support/libffi/libffi/mips-n32-soft-float.patch | 13 +++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb                 |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch

diff --git a/meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch b/meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch
new file mode 100644
index 0000000..c901614
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch
@@ -0,0 +1,13 @@
+Index: libffi-3.2.1/src/mips/n32.S
+===================================================================
+--- libffi-3.2.1.orig/src/mips/n32.S
++++ libffi-3.2.1/src/mips/n32.S
+@@ -30,7 +30,7 @@
+ 
+ /* Only build this code if we are compiling for n32 */	
+ 
+-#if defined(FFI_MIPS_N32)
++#if defined(FFI_MIPS_N32) && !defined(__mips_soft_float)
+ 
+ #define callback a0
+ #define bytes	 a2
diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 72e25fb..5b57e79 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://not-win32.patch \
 	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
+           file://mips-n32-soft-float.patch \
 	   "
 
 SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
-- 
2.7.4


