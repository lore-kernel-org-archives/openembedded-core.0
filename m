Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B317679C59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:28:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9QARKtO020833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:28:27 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 26 Oct 2018 03:28:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Oct 2018 17:45:36 +0800
Message-ID: <558a8523fd3a7dad3f04915f148389bf85f0bdeb.1540547104.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1540547104.git.kai.kang@windriver.com>
References: <cover.1540547104.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] groff: not search fonts on build host
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
X-List-Received-Date: Fri, 26 Oct 2018 10:28:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

groff searches fonts on build host which are provided by ghostscript.
The number of font files installed by groff are different according to
whether ghostscript fonts are installed on build host. Fix it by not
search font dirs on the host.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...groff-not-search-fonts-on-build-host.patch | 20 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch

diff --git a/meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch
new file mode 100644
index 0000000000..ff8f320592
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch
@@ -0,0 +1,20 @@
+groff searchs fonts which are provided by ghostscript on build host.
+It causes non-determinism issue. So not search font dirs on host.
+
+Upstream-Status: Inappropriate [cross build specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
+index a6e968f..8094642 100644
+--- a/font/devpdf/Foundry.in
++++ b/font/devpdf/Foundry.in
+@@ -65,7 +65,7 @@ ZD|Y||||Dingbats!d050000l.pfb
+ #======================================================================
+ 
+ #Foundry|Name|Searchpath
+-foundry|U|(gs):/usr/share/fonts/type1/gsfonts :/opt/local/share/fonts/urw-fonts # the URW fonts delivered with ghostscript (may be different)
++foundry|U|(gs) # the URW fonts delivered with ghostscript (may be different)
+ #Define Flags for afmtodit
+ 
+ r=-i 0 -m
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index ce7ce3e791..ba90cadd88 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
 	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 	file://0001-replace-perl-w-with-use-warnings.patch \
+	file://groff-not-search-fonts-on-build-host.patch \
 "
 
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
-- 
2.18.0


