Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rasnx-0006GU-ID
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 18:39:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Dec 2011 09:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102185619"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2011 09:32:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:31:39 +0000
Message-Id: <f34343a95d4cd6cb69bb4bedb8b60b4ce56d7b15.1323883800.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323883800.git.paul.eggleton@linux.intel.com>
References: <cover.1323883800.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323883800.git.paul.eggleton@linux.intel.com>
References: <cover.1323883800.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] scripts/bitbake: add a version >= 2.6 check
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
X-List-Received-Date: Wed, 14 Dec 2011 17:39:45 -0000

Unfortunately we now have code in BitBake which is parsed before the
current version check and is incompatible with Python < 2.6. Rather than
fixing this and being eternally vigilant for >= 2.6 feature usage, just
add a version check to the wrapper script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 587428c..1c8d4eb 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -27,6 +27,15 @@ if [ "$py_v3_check" != "" ]; then
 	exit 1
 fi
 
+# Similarly, we now have code that doesn't parse correctly with older
+# versions of Python, and rather than fixing that and be eternally
+# vigilant for any other new feature use, just check the version here.
+py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
+if [ "$py_v26_check" != "True" ]; then
+	echo "BitBake requires Python 2.6 or later"
+	exit 1
+fi
+
 needtar="1"
 TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
 float_test() {
-- 
1.7.5.4



