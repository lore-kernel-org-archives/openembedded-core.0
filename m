Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16F6179B89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:43:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9HGhxpw009389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:43:59 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 09:43:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 12:43:24 -0400
Message-ID: <20181017164326.67111-3-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181017164326.67111-1-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] mesa: Remove machine specific append
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
X-List-Received-Date: Wed, 17 Oct 2018 16:43:59 -0000
Content-Type: text/plain

If you try to build a system with multiple BSPs, one of which is qemux86
or qemux86-64, the overall system configuration will change and all of the
graphics packages will end up being rebuilt each time.

For a package based system, the PR values will also be incremented each
time.  The end result will be an ever growing set of PR values as well as
being unable to tell which configured version of the graphics components
are really being deployed.

The solution was to always include the virgl gallium driver when an x86
based target is used.  This may end up wasting some space, but solves the
hash issue.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0dfdfbd5b4..0cc0a82de4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -91,8 +91,8 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
 GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS_append_qemux86 = ",virgl"
-GALLIUMDRIVERS_append_qemux86-64 = ",virgl"
+GALLIUMDRIVERS_append_x86 = ",virgl"
+GALLIUMDRIVERS_append_x86-64 = ",virgl"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "6.0"
-- 
2.18.0


