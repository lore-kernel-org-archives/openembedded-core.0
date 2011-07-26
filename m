Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdD-0007se-5H
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:39 +0200
Received: by rex (Postfix, from userid 1000)
	id 877C720D6F; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:11 +0100
Message-Id: <756b3e990721f493cbf2cca1e9956883d946a762.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/8] eglibc: fix for multilib RPROVIDES issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:57:39 -0000

From: Yu Ke <ke.yu@intel.com>

in eglibc-package.inc, the "PACKAGES" variable use the ${PN} reference,
while RPROVIDES does not use ${PN}. This will lead multilib.bbclass
not mapping its RPROVIDES, and cause "NO RPROVIDER: lib64-glibc-utils"
error.

This patch unify the recipe to fix this issue

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 9e71150..e5524e8 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -43,7 +43,7 @@ PACKAGES += "${PN}-localedatas"
 RRECOMMENDS_${PN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
 
 RPROVIDES_eglibc = "glibc"
-RPROVIDES_eglibc-utils = "glibc-utils"
+RPROVIDES_${PN}-utils = "glibc-utils"
 RPROVIDES_eglibc-pic = "glibc-pic"
 RPROVIDES_eglibc-dev = "glibc-dev"
 RPROVIDES_eglibc-doc = "glibc-doc"
-- 
1.7.4.1



