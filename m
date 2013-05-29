Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF7760304
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 23:21:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TNLSiB000349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:21:28 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 16:21:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 18:27:47 -0500
Message-ID: <1369870067-9388-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369870067-9388-1-git-send-email-mark.hatle@windriver.com>
References: <1369870067-9388-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 18/21 v3] ncurses: Fix problems expanding ncurses-libtinfo when in IMAGE_INSTALL
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
X-List-Received-Date: Wed, 29 May 2013 23:21:27 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

The ncurses package was generating the following error as a result
of not specifing the PACKAGES_DYNAMIC correctly.  This error only
appear when using the IMAGE_INSTALL list that has been expanded by
the hob or from the pkgdata.

ERROR: Nothing RPROVIDES 'ncurses-libtinfo'

The dynamic packages are named using "${PN}-lib%s".  So we check for
${PN}-lib*

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8a81381..6907536 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -29,6 +29,8 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 # natives don't generally look in base_libdir
 base_libdir_class-native = "${libdir}"
 
+PACKAGES_DYNAMIC = "^${PN}-lib.*"
+
 # Fall back to the host termcap / terminfo for -nativesdk and -native
 # The reality is a work around for strange problems with things like
 # "bitbake -c menuconfig busybox" where it cannot find the terminfo
-- 
1.8.1.2.545.g2f19ada


