Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9DE26FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 02:01:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N21IJS004044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:01:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 19:01:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 09:59:52 +0800
Message-ID: <9e30df083af2d4888f3aa500a34e4f9663e21996.1471857211.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1471857211.git.kai.kang@windriver.com>
References: <cover.1471857211.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: fix CVE-2016-6515
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
X-List-Received-Date: Tue, 23 Aug 2016 02:01:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2016-6515 from:

https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openssh/openssh/fix-CVE-2016-6515.patch        | 57 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.2p2.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-6515.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-6515.patch b/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-6515.patch
new file mode 100644
index 0000000..466d572
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-6515.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2016-6515 from:
+
+https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From fcd135c9df440bcd2d5870405ad3311743d78d97 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Thu, 21 Jul 2016 01:39:35 +0000
+Subject: upstream commit
+
+Skip passwords longer than 1k in length so clients can't
+easily DoS sshd by sending very long passwords, causing it to spend CPU
+hashing them. feedback djm@, ok markus@.
+
+Brought to our attention by tomas.kuthan at oracle.com, shilei-c at
+360.cn and coredump at autistici.org
+
+Upstream-ID: d0af7d4a2190b63ba1d38eec502bc4be0be9e333
+---
+ auth-passwd.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/auth-passwd.c b/auth-passwd.c
+index 530b5d4..996c2cf 100644
+--- a/auth-passwd.c
++++ b/auth-passwd.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth-passwd.c,v 1.44 2014/07/15 15:54:14 millert Exp $ */
++/* $OpenBSD: auth-passwd.c,v 1.45 2016/07/21 01:39:35 dtucker Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -66,6 +66,8 @@ extern login_cap_t *lc;
+ #define DAY		(24L * 60 * 60) /* 1 day in seconds */
+ #define TWO_WEEKS	(2L * 7 * DAY)	/* 2 weeks in seconds */
+ 
++#define MAX_PASSWORD_LEN	1024
++
+ void
+ disable_forwarding(void)
+ {
+@@ -87,6 +89,9 @@ auth_password(Authctxt *authctxt, const char *password)
+ 	static int expire_checked = 0;
+ #endif
+ 
++	if (strlen(password) > MAX_PASSWORD_LEN)
++		return 0;
++
+ #ifndef HAVE_CYGWIN
+ 	if (pw->pw_uid == 0 && options.permit_root_login != PERMIT_YES)
+ 		ok = 0;
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
index 3df825b..d48c5fb 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2015-8325.patch \
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
+           file://fix-CVE-2016-6515.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.9.3


