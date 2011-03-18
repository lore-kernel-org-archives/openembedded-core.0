Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q0dOW-00027q-Eo
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 18:23:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2011 10:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,206,1299484800"; d="scan'208";a="668776695"
Received: from unknown (HELO helios) ([10.255.12.183])
	by fmsmga002.fm.intel.com with SMTP; 18 Mar 2011 10:21:36 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 18 Mar 2011 17:21:39 +0000
Message-Id: <fe1b41eb969dd9b2c3e1f80b29eb3dc9b1632671.1300467808.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1300467808.git.paul.eggleton@linux.intel.com>
References: <cover.1300467808.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 11:52:13 +0000
Date: Fri, 18 Mar 2011 17:21:39 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] nfs-utils: fix "sh: bad number" error on start/stop of nfsserver
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
X-List-Received-Date: Fri, 18 Mar 2011 17:23:25 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Adds a test to avoid the "sh: bad number" error message during service
start or stop of nfsserver when there is no NFS_SERVERS value set in
/etc/default/nfsd.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index fe76c51..69c8718 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -31,7 +31,7 @@ test -x "$NFS_NFSD" || exit 0
 #
 # Default is 8 threads, value is settable between 1 and the truely
 # ridiculous 99
-test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -lt 100 || NFS_SERVERS=8
+test "$NFS_SERVERS" != "" && test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -lt 100 || NFS_SERVERS=8
 #
 # The default state directory is /var/lib/nfs
 test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
-- 
1.7.1



