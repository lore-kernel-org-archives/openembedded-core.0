Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE74C78302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 18:32:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5DIWV40028880
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:32:31 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 11:32:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 11:32:25 -0700
Message-ID: <1497378747-30702-3-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1497378747-30702-1-git-send-email-jslater@windriver.com>
References: <1497378747-30702-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: specify CUPSCONFIG
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
X-List-Received-Date: Tue, 13 Jun 2017 18:32:31 -0000
Content-Type: text/plain

configure for version 9.21 finds, but rejects, pkg-config
and cups-config.  We need cups-config, so we short circuit
the test for it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.21.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index 74e7a3f..94d4cc6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -64,10 +64,14 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
                       --without-x, virtual/libx11 libxext libxt gtk+3\
                       "
 
+# For 9.21, configure rejects the pkg-config and cups-config it finds.
+# We can live without pkg-config, but we need cups-config.
+#
 EXTRA_OECONF = "--with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
+                CUPSCONFIG="${STAGING_BINDIR_CROSS}/cups-config" \
                 "
 
 EXTRA_OECONF_append_mipsarcho32 = " --with-large_color_index=0"
-- 
2.7.4


