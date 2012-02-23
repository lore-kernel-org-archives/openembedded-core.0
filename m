Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC2-0004t7-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652347"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:08 -0800
Message-Id: <0178fb54fe32c55679a023dcef9f24abaa9900ea.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/25] autotools.bbclass: Don't copy into non-existant directory
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:55 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* If configure.ac contains AM_GNU_GETTEXT and po/Makefile.in.in
  doesn't exist, autotools_do_configure() copies a local
  version of Makefile.in.in to this location. If the directory
  'po' doesn't exist, the function aborts.

* This patch verifies that the directory exists before copying
  a file to it. This fixes libcddb, which uses AM_GNU_GETTEXT,
  but has no 'po' directory.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 5d74333..e22ea68 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -149,7 +149,7 @@ autotools_do_configure() {
 			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
                             # We'd call gettextize here if it wasn't so broken...
 			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
-			    if [ ! -e ${S}/po/Makefile.in.in ]; then
+			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
 			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
                             fi
 			  fi
-- 
1.7.6.5



