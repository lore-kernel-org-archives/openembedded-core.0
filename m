Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D70E674DC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:43 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l2-v6so16447429pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s7XgoqtL04aE/6n0tUCrZYQUDdG4q0mBXhXzMzP/ewc=;
	b=QNQtdMWQnL3X6L6H+S1E3+GxHbhIXjxZDPDQ9lBsvgH8sabMwVhyWdjwjVMeTJ35/j
	yI2ZA5uFnkdwRr8hTwjHRxi2eY8IQFrMuNpoJBmqDXT9EmTPiIdi7ePnRlA7kAG44PPh
	oEuo2YYd1Aod/0CGRyYYNwV/ydMeG4G2hIFLJF4bEdVTInDECB4tyyswQhbIX/9ecao2
	4jCcHRWVwLMJqOJPnU9XITq3VMWWPI5uVosNNVTzNWks8UtI8zx+qTmcpsDot8IF7BBv
	HtS0U3KTqlpMzrckuq0dk8TrPl4xQyO8IZei/arrhrqm4GkMgZZuhUFh3Mg+pt4S/Fc7
	NHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s7XgoqtL04aE/6n0tUCrZYQUDdG4q0mBXhXzMzP/ewc=;
	b=Anl7tVOUFKppmI0MI5WqbkP3ZI4xq+jr9LvA8i6VWyHjpWbQzNLQnY2SB+IwmQqace
	WtI3bV7y5Yxu+zRa3wd9NPXnYOV5g63xViG611pm/y3/f8yMQ12jIMt7uV0j4O3d3jbC
	xKDyGx5Y29lMhUp+YobOX6mBzVYKnniYgzrasGrK9mdrsWLoyOmnTlLt71jsYQjrnSp7
	h2yT+YP38hKrOa9TbDt3MjxiJT7G4JsHz+PRzchVirVcQEQPSGaN46OJ7H2lP2xGsh6q
	vs3mH7jEq7maDnhlVvBYDiANRDEE65cZLLbmc+oma1JTyQ5dd44/1giU2VIs/TMsUnm5
	8AnQ==
X-Gm-Message-State: ALQs6tC/Yo2k9Pn6bYft+m1aEn4dEwCJOffb29N9mckMacpaLFpb2MeX
	+i4iFigNl+1Yg9HjXmw9KDfLpw==
X-Google-Smtp-Source: AB8JxZrEU7cyjjHOPWbaCPDE0xHuzzsAPIZkPSkMIFD1liRDGkl2UMefEDbk00txJ1E7ZhHzuDBwtA==
X-Received: by 2002:a63:6fc5:: with SMTP id
	k188-v6mr2497642pgc.135.1525479284834; 
	Fri, 04 May 2018 17:14:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:13 -0700
Message-Id: <d50bfdf63174605bd57fc91230baad606950543d.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 19/27] mdadm: Fix build with gcc8
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
X-List-Received-Date: Sat, 05 May 2018 00:14:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...able-errors-due-to-new-gcc8-warnings.patch | 30 ++++++++++++++++++
 ...tead-of-memcpy-on-overlapping-region.patch | 31 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb      |  2 ++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
new file mode 100644
index 0000000000..003d8d059b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
@@ -0,0 +1,30 @@
+From aeee2c585d3bf2470691f570ace80c4d75fe871a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 09:39:57 -0700
+Subject: [PATCH] Disable errors due to new gcc8 warnings
+
+This is needed until
+https://bugzilla.redhat.com/show_bug.cgi?id=1553958
+
+is fixed
+
+Upstream-Status: Inappropriate [Workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a04d82a..a893120 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@ KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIB
+ 
+ CC ?= $(CROSS_COMPILE)gcc
+ CXFLAGS ?= -ggdb
+-CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
++CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wno-error=format-overflow -Wno-error=format-truncation -Wno-error=stringop-truncation
+ ifdef WARN_UNUSED
+ CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ endif
diff --git a/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
new file mode 100644
index 0000000000..44351b6569
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
@@ -0,0 +1,31 @@
+From ab18f04cf89ef4e8521c81c50477e1363b2d333b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 09:46:12 -0700
+Subject: [PATCH] use memmove instead of memcpy on overlapping region
+
+Fixes
+super0.c:526:3: error: 'memcpy' accessing 3936 bytes at offsets 156 and 160 overlaps 3932 bytes at offset 160 [-Werror=restrict]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ super0.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super0.c b/super0.c
+index f5b4507..264b598 100644
+--- a/super0.c
++++ b/super0.c
+@@ -523,7 +523,7 @@ static int update_super0(struct supertype *st, struct mdinfo *info,
+ 		 * up 4 bytes before continuing
+ 		 */
+ 		__u32 *sb32 = (__u32*)sb;
+-		memcpy(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
++		memmove(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
+ 		       sb32+MD_SB_GENERIC_CONSTANT_WORDS+7+1,
+ 		       (MD_SB_WORDS - (MD_SB_GENERIC_CONSTANT_WORDS+7+1))*4);
+ 		if (verbose >= 0)
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index dc098f19b6..097875110c 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
            file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
+           file://0001-Disable-errors-due-to-new-gcc8-warnings.patch \
+           file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
-- 
2.17.0


