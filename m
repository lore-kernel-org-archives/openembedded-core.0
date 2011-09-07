Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Kp1-0000DK-4b
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:17:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 09:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="14851854"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 09:12:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 09:12:48 -0700
Message-Id: <68679302c46936d2e2f7b0980ec325c398dd5e73.1315411864.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315411864.git.sgw@linux.intel.com>
References: <cover.1315411864.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315411864.git.sgw@linux.intel.com>
References: <cover.1315411864.git.sgw@linux.intel.com>
Subject: [PULL v2 1/1] cpan.bbclass: fix native perl issue
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
X-List-Received-Date: Wed, 07 Sep 2011 16:17:55 -0000

When configuring cpan packages, the directories passed to MakeMaker
are the target directories. There was a patch that was applied to the
native perl to find perl.real and convert that to perl.  This does not
apply for the target perl modules and therefore MakeMaker finds perl.real.

This patch to cpan configure modifies the Makefile after configure and
changes the perl.real to just straight perl so we have the correct paths
and shared state info in usable.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/cpan.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index cb1c2f4..587e688 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -24,7 +24,8 @@ cpan_do_configure () {
 		for f in `find -name Makefile.PL`; do
 			f2=`echo $f | sed -e 's/.PL//'`
 			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
-			$f2
+				-e 's/perl.real/perl/' \
+				$f2
 		done
 	fi
 }
-- 
1.7.6



