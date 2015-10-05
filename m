Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48616766A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 22:13:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t95MDpFB012875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Oct 2015 15:13:52 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 5 Oct 2015 15:13:51 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Mon, 5 Oct 2015 15:13:51 -0700
Message-ID: <1444083231-27314-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] pixbufcache: add processing for PIXBUFCACHE_SYSROOT_DEPS
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
X-List-Received-Date: Mon, 05 Oct 2015 22:13:53 -0000
Content-Type: text/plain

We want to depend on x:y instead of x:y_setscene, so strip
off any _setscene's.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/pixbufcache.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index dbe11e1..7692425 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -65,3 +65,7 @@ pixbufcache_sstate_postinst() {
 	fi
 }
 
+PIXBUFCACHE_SYSROOT_DEPS ?= ""
+
+do_populate_sysroot_setscene[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene', '')}"
+
-- 
1.7.9.5


