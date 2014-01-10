Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 72BE66B7AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 12:54:21 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W1bbO-00070l-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jan 2014 13:54:22 +0100
Message-ID: <1389358456.9182.148.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 12:54:16 +0000
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Commit 616354f13732d13c17434d5b60b166f691c25761 is
	insufficient
	because gnu-config-native's gnu-configize script uses perl modules from
	autoconf
	and hence doesn't work unless autoconf-native is staged (which it may
	not be if building from sstate). [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] binutils: Also add autoconf-native to DEPENDS
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
X-List-Received-Date: Fri, 10 Jan 2014 12:54:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit 616354f13732d13c17434d5b60b166f691c25761 is insufficient because
gnu-config-native's gnu-configize script uses perl modules from autoconf
and hence doesn't work unless autoconf-native is staged (which it may
not be if building from sstate).

Ideally g-c-n would itself declare a dependency on autoconf-native but this
is difficult to arrange without creating a dependency loop.  autoconf-native
already depends on gnu-config-native (because autoreconf invokes gnu-configize)
and has a build dependency on m4-native, which in turn build-depends on g-c-n
because it configizes itself by steam in do_configure and needs config.{guess,sub}
to be available.  Adding some sort of gnu-config-initial-native recipe would
fix the latter problem, but this would be ugly because it would need special-casing
in (at least) autotools.bbclass, and in any case this still wouldn't solve
the problem of autoconf itself depending on g-c-n.

So, the easiest solution to the problem at hand is to arrange for those
few recipes that depend on g-c-n but not autoconf-native to gain that
latter dependency as well.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 1259342..b6c9205 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -11,7 +11,7 @@ BUGTRACKER = "http://sourceware.org/bugzilla/"
 SECTION = "devel"
 LICENSE = "GPLv3"
 
-DEPENDS = "flex-native bison-native zlib-native gnu-config-native"
+DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
 
 inherit autotools gettext multilib_header
 
-- 
1.8.5




