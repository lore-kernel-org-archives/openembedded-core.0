Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUma-00042N-RF
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535259"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:07 -0800
Message-Id: <e48fd42e047f46399828a074c5125a0ce9c3f56f.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/22] autotools.bbclass: Introduce CACHED_CONFIGUREVARS
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
X-List-Received-Date: Tue, 10 Jan 2012 06:04:36 -0000

From: Khem Raj <raj.khem@gmail.com>

This variable is for holding the cached configure variables
to be specified in recipes. e.g.

CACHED_CONFIGUREVARS += "ac_cv_foo=yes ac_cv_bar=no"

This will make sure that the variables are not detected
by configure. This is useful in cross builds where
some features can not be detected correctly by configure
and having it as a variables gives us capability to
override it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2f462ff..5d74333 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -73,7 +73,7 @@ oe_runconf () {
 	cfgscript="${S}/configure"
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		$cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
+		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
 	else
 		bbfatal "no configure script found at $cfgscript"
 	fi
-- 
1.7.6.5



