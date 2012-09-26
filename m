Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGp5r-0002Z5-Di
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:43:51 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGotK-0006MJ-9d
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:30:54 +0200
From: Phil Blundell <philb@gnu.org>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 11:30:53 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348655454.31293.97.camel@phil-desktop>
Mime-Version: 1.0
Subject: [RFC PATCH] gettext: Remove spurious-looking dependencies on libxml2-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 10:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These were added in aae5021101224344a2b1a3af5becf74291fbbfe5, ostensibly to resolve
some sort of "host contamination" issue.  However, that commit contains no information
about what contamination was being observed or how the dependencies help.

gettext-native is being configured --with-included-libxml so it shouldn't be using
libxml2 from either the host or the sysroot, in which case the dependency would seem
to be useless.  Using the included copy of libxml2 is in any case preferable to adding 
a dependency on libxml2-native because the latter brings quite a large stack of other 
dependencies with it.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index a159405..96859aa 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r17"
-DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
-DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
+PR = "r18"
+DEPENDS = "gettext-native virtual/libiconv ncurses expat"
+DEPENDS_virtclass-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
-- 
1.7.10.4





