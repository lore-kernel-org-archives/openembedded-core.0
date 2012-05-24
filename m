Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2f-00056b-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034667"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:12 -0700
Message-Id: <21fd7e43557bfe2adb5d1887ca4e5bab2ca6c927.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 09/28] classes/base: add checksum file list at parse time
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
X-List-Received-Date: Thu, 24 May 2012 04:52:53 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
 1 files changed, 1 insertions(+), 0 deletions(-)

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
1.7.7.6



