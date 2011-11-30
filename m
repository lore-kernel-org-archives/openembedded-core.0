Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVs8d-0007gD-6T
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:56:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Nov 2011 13:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81486486"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 13:49:43 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 13:49:44 -0800
Message-Id: <6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
References: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
In-Reply-To: <cover.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/4] autotools.bbclass: Report the missing configure path
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
X-List-Received-Date: Wed, 30 Nov 2011 21:56:23 -0000

From: Darren Hart <dvhart@linux.intel.com>

If the configure script isn't found, report the explicit path tried.
This can help debug subtle errors where the ${S} sourcedir may not
be exactly what is expected.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/autotools.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 37e7d4b..7536bac 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -70,11 +70,12 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
 
 
 oe_runconf () {
-	if [ -x ${S}/configure ] ; then
-		bbnote "Running ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
+	cfgscript="${S}/configure"
+	if [ -x "$cfgscript" ] ; then
+		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
+		$cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
 	else
-		bbfatal "no configure script found"
+		bbfatal "no configure script found at $cfgscript"
 	fi
 }
 
-- 
1.7.6.4



