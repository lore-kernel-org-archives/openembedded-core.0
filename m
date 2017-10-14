Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B741277FEC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:15 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a8so12172736pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1G0v79lZlDU7SleSOuEk4e5HH13yYrrftQTogdo/Huk=;
	b=UHTpCuMg744H9EKOV3TN7qGvylaLpUsWGmFRTNqIoyeYNMjN0y61rLhbVdHaEFIcaw
	1O2inUlSpVZtew5dfdv+qIc84VJZns+wDwNR6kAwF0rdPsVy90XS7kGHI3Ip0V+w9ouk
	MVCVnHNVSMq93dxLqh5r1xb5J9jC4Zj+uVf6WMZrB+q+TkN1vFfGWIIgaXetXgrDSXsk
	iB/4TbLERUQGusWabtZsUDPcUWSecwneiVHrDcaoAtoXVNJ+tHf+54pRa6Am+/nMoti0
	u9Jta8Hj9RQmfAFKhxEybckEICH6J+J88wZsqQsreGYkUk9LDKn/Eq3AcBNPnaQHql9k
	YxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1G0v79lZlDU7SleSOuEk4e5HH13yYrrftQTogdo/Huk=;
	b=fQ6JiJPRqloBZ/bP30HwZwMveKXfCHbmz0M/5dmKfjf3M06QXpsa9YOFAWQAkt4iAh
	k+OZA+QK7drWkPJQ6Y/FFQ2M/mT+jkTfhSbDzsuVIzHdQcgEeUramifCJjz8rbLelO7I
	mv94p3F13zPP8/yJBZL/mOHagwjsVssiWp3cZY/NIj1rIGLuDcEPs+CJqlgDjl3xxvVB
	WiAn8LEHu0vNiSKP5tSwL8maP7NHewRva+Jf8HPtiRBP62Ycy6Xt1pyiPZbVEZoLIKTJ
	+PTzV7Yg7r9YyVrU0coS/oZEGjH5dcAp7bcd+1ib2ipkCWCG4XBEIVVDjL38Un0UDQ4p
	yHdg==
X-Gm-Message-State: AMCzsaVgyVEQu916lq/Gtw6czGnd+CfhO1W+LwDmjGXO9vAyy1KpgiGo
	NKone8RiiYSXtUmw3NQ7Ygi44g==
X-Google-Smtp-Source: AOwi7QC1trFJHAVM9aN4TFvCGzjvCDOlvT6pNV7DO+ypxEPnja2q43DhfIyOHtE+cS3vugt9kvuYpA==
X-Received: by 10.99.127.26 with SMTP id a26mr4018882pgd.385.1507996157094;
	Sat, 14 Oct 2017 08:49:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:58 -0700
Message-Id: <20171014154858.35123-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
Subject: [PATCH 7/7] mdadm: Fix build with gcc < 7
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:16 -0000

Do not rely on build host gcc for "implicit-fallthrough" support
we need to check the CC for it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heck-for-implicit-fallthrough-warning-sup.patch | 31 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
new file mode 100644
index 0000000000..a4b7b8acd3
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
@@ -0,0 +1,31 @@
+From a129ee6d80f3b2cda0d827c35fa81a517cf6d505 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Oct 2017 10:27:34 -0700
+Subject: [PATCH] Use CC to check for implicit-fallthrough warning support
+
+This warning it new in gcc7 and in cross compile case
+its possible that build host gcc is version 7+ but the
+cross compile used for compiling mdadm is < version 7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d207ee4..971f255 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ ifdef WARN_UNUSED
+ CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ endif
+ 
+-FALLTHROUGH := $(shell gcc -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
++FALLTHROUGH := $(shell ${CC} -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
+ ifneq "$(FALLTHROUGH)"  "0"
+ CWFLAGS += -Wimplicit-fallthrough=0
+ endif
+-- 
+2.14.2
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 506b0bc315..dc098f19b6 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch \
            file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
            file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
+           file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
-- 
2.14.2


