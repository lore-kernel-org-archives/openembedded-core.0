Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SWyeV-0005SE-8C
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 01:38:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2012 16:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146495026"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.180])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 16:27:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 00:27:54 +0100
Message-Id: <9195cbc60488f42f3a92a61e58d9912b038e59c1.1337729156.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337729156.git.paul.eggleton@linux.intel.com>
References: <cover.1337729156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1337729156.git.paul.eggleton@linux.intel.com>
References: <cover.1337729156.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/base: add checksum file list at parse time
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
X-List-Received-Date: Tue, 22 May 2012 23:38:07 -0000

Connect the new fetcher file checksum code so that we get a list of the
files to be checksummed at parse time.

The file-checksums flag will not be read unless we are using a version
of BitBake that supports the function we call within it, so it is safe
to include this change even when the metadata will still be used with
older versions of BitBake.

Implements [YOCTO #2044].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bb39b7b..79685f7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -77,6 +77,7 @@ THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
 
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
+do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 python base_do_fetch() {
 
 	src_uri = (d.getVar('SRC_URI', True) or "").split()
-- 
1.7.9.5



