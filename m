Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D941A731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 05:31:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u825UxGP004282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 22:30:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 22:30:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 22:30:57 -0700
Message-ID: <b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1472794137.git.liezhi.yang@windriver.com>
References: <cover.1472794137.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS for libnl-genl
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
X-List-Received-Date: Fri, 02 Sep 2016 05:31:09 -0000
Content-Type: text/plain

The libnl-genl.rpm provides libnl-genl2 and libnl-genl-3-200:

$ rpm -qp --provides tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-r0.2.core2_64.rpm
elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
libnl-genl = 3.2.28
libnl-genl-3.so.200()(64bit)
libnl-genl-3.so.200(libnl_3)(64bit)
libnl-genl2
libnl-genl-3-200 = 1:3.2.28-r0.2

so that we don't need set them in the RREPLACES and RCONFLICTS, the
package manager can handle it, otherwise it would cause do_rootfs errors
when install both libnl-genl.rpm and lib32-libnl-genl.rpm:

Computing transaction...error: Can't install libnl-genl-3-200-1:3.2.28-r0.0@core2_64: conflicted package libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is locked

We didn't meet the error before was because there was no libnl-genl.rpm,
so that it had no effect, but now the following commit fixed the
packaging problem: (master-next branch)

libnl: fix packaging mistakes

Remove RREPLACES and RCONFLICTS for libnl-genl will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libnl/libnl_3.2.28.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 7ddbd40..799962f 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -44,5 +44,3 @@ FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
 FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
-RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
2.9.0


