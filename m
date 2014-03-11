Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE27A617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:23:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2B7N7xG002402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 00:23:07 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 00:23:07 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Mar 2014 15:23:04 +0800
Message-ID: <2bd59983d5e9bedd154aff05f9d0b3c2621e6b07.1394522537.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394522537.git.Chong.Lu@windriver.com>
References: <cover.1394522537.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: Don't link against libfl
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
X-List-Received-Date: Tue, 11 Mar 2014 07:23:07 -0000
Content-Type: text/plain

We have already defined yywrap function in scan.l file. After this, we no
longer need to link against libfl.
Since we are using --as-needed by default in linker, which means we end
up with errors like

	libfl.so: undefined reference to `yylex'

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../ltp/ltp/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140115.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch

diff --git a/meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch b/meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch
new file mode 100644
index 0000000..3e4aa73
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch
@@ -0,0 +1,31 @@
+From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 11 Mar 2014 14:47:22 +0800
+Subject: [PATCH] ltp: Don't link against libfl
+
+We have already defined yywrap function in scan.l file. After this, we no longer need to
+link against libfl and so no longer get errors about undefined references to yylex.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ pan/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pan/Makefile b/pan/Makefile
+index 4cc6466..a4b575b 100644
+--- a/pan/Makefile
++++ b/pan/Makefile
+@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)
+ 
+-LDLIBS			+= -lm $(LEXLIB)
++LDLIBS			+= -lm
+ 
+ LFLAGS			+= -l
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 2a3999b..c2ee9fb 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://regen-makefile.patch \
     file://ffsb-remove-hardcoded-configure.patch \
+    file://ltp-Do-not-link-against-libfl.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.8.1.2


