Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMyl1-0005VD-Nj for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 10:38:59 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMyiE-0007Fr-BY
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 10:36:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2011 09:36:00 +0100
Message-ID: <1305794160.18415.169.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] update-rc.d.bbclass: don't add runtime dependency if O_P_M is disabled
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
X-List-Received-Date: Thu, 19 May 2011 08:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a backport from oe master.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/update-rc.d.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 7e4dda7..c4ecc04 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,7 +1,7 @@
 UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
-UPDATERCD = "update-rc.d"
+UPDATERCD = "${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 UPDATERCD_virtclass-native = ""
 RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
-- 
1.7.2.3





