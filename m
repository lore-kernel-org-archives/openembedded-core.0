Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUM-0002Sz-V7
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540447"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:04 -0700
Message-Id: <48e9a48cc84dcb77c5a1ddd173a5aa254caa4ec6.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/28] autotools: fix multi-word arguments for EXTRA_OECONF
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:23 -0000

From: Christopher Larson <kergoth@gmail.com>

This is needed to better support things like the following (with a
multi-word BUILD_CC):

    EXTRA_OECONF += '"ac_cv_prog_CC_FOR_BUILD=${BUILD_CC}"'

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/autotools.bbclass |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a4ce851..937e2ba 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -71,10 +71,8 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		cfgcmd="${S}/configure \
-		${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		bbnote "Running $cfgcmd..."
-		$cfgcmd || bbfatal "oe_runconf failed" 
+		bbnote "Running ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
+		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
 	else
 		bbfatal "no configure script found"
 	fi
-- 
1.7.6.2



