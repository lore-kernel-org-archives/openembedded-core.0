Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F246576DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:27:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O9RYxu000105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 02:27:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 02:27:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Sep 2015 17:27:31 +0800
Message-ID: <6c611ebcc544759cb12398de714314ced1a83c34.1443086798.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443086798.git.Qi.Chen@windriver.com>
References: <cover.1443086798.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] iproute2: fix the configure process
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
X-List-Received-Date: Thu, 24 Sep 2015 09:27:37 -0000
Content-Type: text/plain

Previously, the iproute2's configure script is actually run in the
do_compile stage. There's a Makefile rule 'all: Config' which makes
the configure process run to generate the Config file.

However, this makes it hard to fix the dependency problems. We need
to generate the Config file in the do_configure stage.

Add do_configure_append to separate the configure process from the
compile process.

Besides, explicitly disable ATM support for iproute2, otherwise we'll
sometimes meet errors like below when building.

  ld: cannot find -latm
  collect2: error: ld returned 1 exit status
  Makefile:154: recipe for target 'q_atm.so' failed
  make[1]: *** [q_atm.so] Error 1

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index a53a4e6..29f9062 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,6 +15,12 @@ inherit update-alternatives
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
+do_configure_append () {
+    sh configure ${STAGING_INCDIR}
+    # Explicitly disable ATM support
+    sed -i -e '/TC_CONFIG_ATM/d' Config
+}
+
 do_install () {
     oe_runmake DESTDIR=${D} install
     mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
-- 
1.9.1


