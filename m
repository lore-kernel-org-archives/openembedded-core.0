Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QruBV-0007Zr-QZ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:02:09 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qru79-0000fg-BJ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:57:39 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 16:57:38 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313164659.6733.163.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Aug 2011 16:02:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This stops (most) x11 packages leaking into a non-x11 distro by mistake.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/xorg-lib/libx11.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index c156ce6..455753f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -42,3 +42,8 @@ do_compile() {
 # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
 # A world build should only build the correct version, not all of them.
 EXCLUDE_FROM_WORLD = "1"
+
+python () {
+       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
+       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
+}
-- 
1.7.4.1





