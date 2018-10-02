Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 414C7745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:07:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w92H7ubN019192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 10:07:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 2 Oct 2018 10:07:55 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 3 Oct 2018 00:27:11 +0800
Message-ID: <5dca8bf2d798a6bac38fb7b285b51c85c3d50df5.1538492159.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538492159.git.kai.kang@windriver.com>
References: <cover.1538492159.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] cups: fix multilib install file conflicts
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
X-List-Received-Date: Tue, 02 Oct 2018 17:07:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

A comment line of conf file cups-files.conf refers to var @CUPS_SERVERBIN@
is ${libdir} related and then it causes multilib install file conflict.

Remove @CUPS_SERVERBIN@ from the comment line to avoid the conflict.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  3 ++-
 .../cups-avoid-install-file-conflicts.patch   | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 717eef03a7..c142a4d990 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,7 +8,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
-	  "
+           file://cups-avoid-install-file-conflicts.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
diff --git a/meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch
new file mode 100644
index 0000000000..68885fa4db
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch
@@ -0,0 +1,21 @@
+@CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
+conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
+avoid the conflict.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
+index 4a78ba6..03c6582 100644
+--- a/conf/cups-files.conf.in
++++ b/conf/cups-files.conf.in
+@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
+ #RequestRoot @CUPS_REQUESTS@
+ 
+ # Location of helper programs...
+-#ServerBin @CUPS_SERVERBIN@
++#ServerBin
+ 
+ # SSL/TLS keychain for the scheduler...
+ #ServerKeychain @CUPS_SERVERKEYCHAIN@
-- 
2.18.0


