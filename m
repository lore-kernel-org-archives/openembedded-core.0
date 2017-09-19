Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6434D60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:55:59 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id g65so1463329pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j0SKkPA++ikeYFizHSof1zGj5YSmJu/IWDavamiIgBU=;
	b=EN8QdHTSMop4erG5jQiyJKBzjzSWmrny3v+0KKSHuwfwX6cEuDIl/zNy6PWsxoJq5I
	hR12Wu6q8oWodfHqx51c1sDqkkSTtga8Bx01LrGJOJVZmQDSiofrMtu4CmmRUnx78K4d
	QYh9umOT2M9nZSunDrrlinYlEDLAdB3H1gGEfrCWrektgJm8Rnw6QijALuOt/QEbliBm
	QJZ88jenoC6zfDmuYE810piz3WmnkRR12MFacmMebOaUEZC6zL+gasJ10hoGnGH/B5XJ
	m3X+GpB1r3OAVGeRF+iRyFB2INUbxF9hNXWWT2zfmQKgNyOhv7mtgebp3fNvrIIXlv/V
	UojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j0SKkPA++ikeYFizHSof1zGj5YSmJu/IWDavamiIgBU=;
	b=cEKHmyatlyRd2SvooDJIm+ljzzP+6v3DylzuPL5AKCIiaGo+8KLezNdrFkpI01GPRq
	BpfAnpotQpULSUJWkpV46dSgxuKzGWdr74LCA4etahXDL27XQAj0zhIZIj/cS/DkFhyz
	dvsnGdDDpnnxhOJyEDEHsEAxEJkv7w2WSTXKME7cDJPwD6YUmgLRDfHH2S8bsYfAQ00E
	5bvZ8saWgilhXLn38zA3gcrWJMvA/lC1z6IAlbms4tQ6AmSOuFpmiI6hoNL2rzwUDg5r
	x1eOZFkL8bWOAAPz8vAMBVCeapLQmMGtMgnxZTnO4ZscacXRmTID40mU1+SxzegHYZXU
	kO2w==
X-Gm-Message-State: AHPjjUgodbjLYrk00tkMiCHXQoJkUP6ZCTqzEmU/mpSWwAvkIEIYwvIy
	ZpRrU1mkmsO1nnZC51oE40E3/w==
X-Google-Smtp-Source: AOwi7QAlRBQlFB7sq+p2x1S7jXcWeUga5+WXxSqIuXh/8+foZUdC4G2/650sdTrSMHj3rZuM68VNDA==
X-Received: by 10.98.17.156 with SMTP id 28mr272580pfr.83.1505800560473;
	Mon, 18 Sep 2017 22:56:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::a20b])
	by smtp.gmail.com with ESMTPSA id
	c62sm1682139pfl.84.2017.09.18.22.55.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 22:55:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 22:55:51 -0700
Message-Id: <20170919055551.13864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] strace: Fix ptest bulds with musl/mips
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
X-List-Received-Date: Tue, 19 Sep 2017 05:55:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tion-Check-for-mips-and-alpha-before-usin.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.18.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
new file mode 100644
index 0000000000..52096b28cf
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
@@ -0,0 +1,37 @@
+From 9f3fd388ae7c46420bccba405468690ed46d669a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Sep 2017 22:51:32 -0700
+Subject: [PATCH] tests/sigaction: Check for mips and alpha before using
+ sa_restorer
+
+local structure does not define restorer member for mips and alpha
+in definition, we need to match that assumption here where they are
+being set
+
+Fixes
+| ../../strace-4.18/tests/sigaction.c:177:36: error: 'struct_set_sa {aka struct set_sa}' has no member named 'restorer'
+|  # define SA_RESTORER_ARGS , new_act->restorer
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tests/sigaction.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/sigaction.c b/tests/sigaction.c
+index 7b46944..f46cda7 100644
+--- a/tests/sigaction.c
++++ b/tests/sigaction.c
+@@ -170,7 +170,7 @@ main(void)
+ 	sigdelset(mask.libc, SIGHUP);
+ 
+ 	memcpy(new_act->mask, mask.old, sizeof(mask.old));
+-#ifdef SA_RESTORER
++#if defined(SA_RESTORER) && !defined(MIPS) && !defined(ALPHA)
+ 	new_act->flags = SA_RESTORER;
+ 	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
+ # define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.18.bb b/meta/recipes-devtools/strace/strace_4.18.bb
index bbb82a9d84..4251b6ca90 100644
--- a/meta/recipes-devtools/strace/strace_4.18.bb
+++ b/meta/recipes-devtools/strace/strace_4.18.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
+           file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            "
 
 SRC_URI[md5sum] = "3579b3266bb096cebaefbe2cdb1a3a78"
-- 
2.14.1


