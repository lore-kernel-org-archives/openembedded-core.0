Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2668-00027s-Pb
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056427"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:19 -0800
Message-Id: <3529d3d9466f04b4837388623b85c6b8718f834b.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 01/13] gnupg: Add missing patch for curl_typeof_fix
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:01 -0000

Seems the wrong commit was grabbed and missed this patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnupg-1.4.7/curl_typeof_fix_backport.patch     |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch
new file mode 100644
index 0000000..e5fb24a
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch
@@ -0,0 +1,27 @@
+
+This has been discussed in a couple of different bug reported
+upstream:
+
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=486250
+http://bugs.sourcemage.org/show_bug.cgi?id=14446
+
+Fix:
+http://lists.gnupg.org/pipermail/gnupg-devel/2008-April/024344.html
+
+Upstream-Status: Backport [Debian]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gnupg-1.4.7/keyserver/gpgkeys_curl.c
+===================================================================
+--- gnupg-1.4.7.orig/keyserver/gpgkeys_curl.c
++++ gnupg-1.4.7/keyserver/gpgkeys_curl.c
+@@ -286,7 +286,7 @@ main(int argc,char *argv[])
+       curl_easy_setopt(curl,CURLOPT_VERBOSE,1);
+     }
+ 
+-  curl_easy_setopt(curl,CURLOPT_SSL_VERIFYPEER,opt->flags.check_cert);
++  curl_easy_setopt(curl,CURLOPT_SSL_VERIFYPEER,(long)opt->flags.check_cert);
+   curl_easy_setopt(curl,CURLOPT_CAINFO,opt->ca_cert_file);
+ 
+   if(proxy)
-- 
1.7.7.6



