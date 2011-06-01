Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRers-00041j-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203833"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:55 -0700
Message-Id: <d8b4c390e951e5de41b6cee46affa54f86717bc0.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [CONSOLIDATED PULL 28/32] binconfig: improve handling of empty prefixes
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
X-List-Received-Date: Wed, 01 Jun 2011 06:26:47 -0000

From: Phil Blundell <pb@pbcl.net>

This is a backport of 952e5e2b7a5c1deefc939594d40b81a71fb16a54 from oe master.

Without this the script mangling goes very wrong if ${prefix}="".  There
isn't really any way to fix this in the completely general case, but
this patch does work with the two cases I tested (freetype and
gpg-error) which were unusable previously.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/binconfig.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 8e22d2d..3deb541 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -6,8 +6,8 @@ def get_binconfig_mangle(d):
 		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
 		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
 		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
-		s += " -e 's:=%s${prefix}:=\\1OEPREFIX:'" % optional_quote
-		s += " -e 's:=%s${exec_prefix}:=\\1OEEXECPREFIX:'" % optional_quote
+		s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
+		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
 		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
 		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
 		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-- 
1.7.3.4



