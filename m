Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RGEzw-0006pY-EY
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 21:06:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Oct 2011 12:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64444335"
Received: from unknown (HELO envy.home) ([10.255.15.50])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2011 12:00:57 -0700
Message-ID: <4E9DCCE8.8090009@linux.intel.com>
Date: Tue, 18 Oct 2011 12:00:56 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.3.2
Subject: [PATCH] insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM
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
X-List-Received-Date: Tue, 18 Oct 2011 19:06:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Currently only the basename is printed when os.path.isfile() returns a failure
for the license file. If the file is present, but in the wrong directory, this
can be non-obvious to debug. Use the full path instead.

Make a minor grammatical correction in the error message while we're at it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b861e85..017f7be 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -330,7 +330,7 @@ def package_qa_check_license(workdir, d):
         (type, host, path, user, pswd, parm) = bb.decodeurl(url)
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to invalid file: " + path)
+            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
 
         if 'md5' not in parm:
             bb.error(pn + ": md5 checksum is not specified for ", url)
-- 
1.7.1
-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


