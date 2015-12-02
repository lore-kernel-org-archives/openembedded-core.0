Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF109605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2DX066026446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 05:33:00 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 05:32:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Dec 2015 05:32:57 -0800
Message-ID: <44ecda6e7706c61a5b0ac9c2566ac234276bbda0.1449063064.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449063064.git.liezhi.yang@windriver.com>
References: <cover.1449063064.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rpm_5.4.14: Enable MIPS64 N32 transactions
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
X-List-Received-Date: Wed, 02 Dec 2015 13:33:00 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

In a multilib install RPM will break a conflict using the transaction color.
However, by default MIPS64 N32 transactions are not enabled.

This change always enables them.  This is effectively a no-op on non-MIPS
systems, and required if we need to support N32 on MIPS.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 8e1d3cb..b0e67c5 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -409,6 +409,9 @@ do_install_append() {
 	sed -i -e 's,%_repackage_all_erasures[^_].*,%_repackage_all_erasures 0,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,^#%_openall_before_chroot.*,%_openall_before_chroot\t1,' ${D}/${libdir}/rpm/macros
 
+	# Enable MIPS64 N32 transactions.  (This is a no-op on non-MIPS targets.)
+	sed -i -e 's,%_transaction_color[^_].*,%_transaction_color 7,' ${D}/${libdir}/rpm/macros
+
 	# Enable Debian style arbitrary tags...
 	sed -i -e 's,%_arbitrary_tags[^_].*,%_arbitrary_tags %{_arbitrary_tags_debian},' ${D}/${libdir}/rpm/macros
 
-- 
1.7.9.5


