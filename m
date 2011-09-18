Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5QTX-00028q-B4
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 01:08:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,402,1312182000"; d="scan'208";a="52989594"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:03:18 -0700
Message-Id: <843f9af47ffccb7ffdf3039c560bc3e4c88175a2.1316386910.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
Subject: [RC3 FIXES 4/4] sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
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
X-List-Received-Date: Sun, 18 Sep 2011 23:08:39 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If the user has specified konsole in TERMCMD and it is version 2.x from
KDE 4.x, raise an error as this version will not work for patch
resolution purposes (it forks into the background and returns
immediately).

Addresses [YOCTO #1294]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6ed43b2..4067408 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -337,6 +337,12 @@ def check_sanity(e):
         term = termcmd.split()[0]
         if not check_app_exists(term, e.data):
             messages = messages + "The console for use in patch error resolution is not available, please install %s or set TERMCMD and TERMCMDRUN (as documented in local.conf).\n" % term
+        elif "konsole" in term:
+            import oe.terminal
+            vernum = oe.terminal.check_konsole_version(term)
+            if vernum:
+                if vernum.split('.')[0] == '2':
+                    messages = messages +  'Konsole from KDE 4.x will not work as TERMCMD/TERMCMDRUN, please specify a different terminal or set PATCHRESOLVE = "noop" to disable interactive patch resolution.\n'
 
     if os.path.basename(os.readlink('/bin/sh')) == 'dash':
         messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"
-- 
1.7.6



