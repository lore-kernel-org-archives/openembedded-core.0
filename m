Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECD7D78EAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:04:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D74Rkp004863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 00:04:27 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 00:04:27 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 00:04:25 -0700
Message-ID: <20180813070425.85090-3-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813070425.85090-1-zhixiong.chi@windriver.com>
References: <20180813070425.85090-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][v2] mobile-broadband-provider-info: fix .pc file conflict
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
X-List-Received-Date: Mon, 13 Aug 2018 07:04:27 -0000
Content-Type: text/plain

Issue: LIN10-4485

Error: Transaction check error:
  file /usr/share/pkgconfig/mobile-broadband-provider-info.pc from install of \
  lib32-mobile-broadband-provider-info-dev.core2_32 conflicts with file from package \
  mobile-broadband-provider-info-dev.core2_64

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../multilibfix.patch                           | 17 +++++++++++++++++
 .../mobile-broadband-provider-info_git.bb       |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
new file mode 100644
index 0000000000..9e75b7bdc5
--- /dev/null
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
@@ -0,0 +1,17 @@
+The mobile-broadband-provider-info.pc file is installed into a non-arch directory
+yet contains libdir which can vary depending on which multilib is configured.
+The .pc file does not require libdir so remove this to fix multilib builds.
+
+Upstream-Status: Pending
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: git/mobile-broadband-provider-info.pc.in
+===================================================================
+--- git.orig/mobile-broadband-provider-info.pc.in	2018-08-07 13:09:31.811364063 +0800
++++ git/mobile-broadband-provider-info.pc.in	2018-08-10 17:49:25.645288320 +0800
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ datarootdir = @datarootdir@
+ pkgdatadir=${datarootdir}/@PACKAGE@
+ includedir=@includedir@
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index dbc578e2d8..7b64b25e89 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -7,7 +7,9 @@ SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
 PV = "20170310"
 PE = "1"
 
-SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info"
+SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info \
+           file://multilibfix.patch \
+"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


