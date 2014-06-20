Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE71B7024F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 10:28:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5KAS60E008345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 03:28:06 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 20 Jun 2014 03:28:06 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jun 2014 18:28:01 +0800
Message-ID: <1403260081-669-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1403260081-669-1-git-send-email-ming.liu@windriver.com>
References: <1403260081-669-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mesa.inc: remove '-' suffix in substitution of package names
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
X-List-Received-Date: Fri, 20 Jun 2014 10:28:11 -0000
Content-Type: text/plain

The current substitution to package names is not correct, its original
purpose is: replace "mesa-" with "mesa-dri-", in which process the
"mesa" package is left out, this leads mesa package to announce to
conflict with itself, and therefore cause build failures when multilib
mesa are being added to rootfs.

Changing the replacement pattern to without a '-' suffix will fix it.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ad3b741..0cf7985 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -134,9 +134,9 @@ python mesa_populate_packages() {
     ml = d.getVar('MLPREFIX', True)
     pkgs = [ml + 'mesa', ml + 'mesa-dev', ml + 'mesa-dbg']
     for pkg in pkgs:
-        d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
-        d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
-        d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
 
     import re
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.8.4.1


