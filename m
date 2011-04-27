Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEh-0005Qy-1Y
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945701"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:30:01 -0700
Message-Id: <c3a7119bc56f803830a8e31e80ac4a91fe98534c.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Sun, 24 Apr 2011 18:38:48 -0700
Date: Wed, 27 Apr 2011  0:30:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 39/52] autotools.bbclass: Copy gettext files only if --disable-nls is not set
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:35 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 7ebf833..cbd2e96 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -127,17 +127,18 @@ autotools_do_configure() {
 			else
 			  CONFIGURE_AC=configure.ac
 			fi
-			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
-			    : do nothing -- we still have an old unmodified configure.ac
-			  else
-			    oenote Executing glib-gettextize --force --copy
-			    echo "no" | glib-gettextize --force --copy
+			if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
+			  if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			    if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+			      : do nothing -- we still have an old unmodified configure.ac
+			    else
+			      oenote Executing glib-gettextize --force --copy
+			      echo "no" | glib-gettextize --force --copy
+			    fi
+			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 			  fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 			fi
-
 			fi
 			mkdir -p m4
 			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-- 
1.7.1.1



