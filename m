Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R4bzP-0001ag-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:14:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2011 10:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49215416"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.40])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2011 10:08:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 18:08:54 +0100
Message-Id: <59d019bf5d9aa00d5c803f7417f99151ae827c60.1316192786.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316192786.git.paul.eggleton@linux.intel.com>
References: <cover.1316192786.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316192786.git.paul.eggleton@linux.intel.com>
References: <cover.1316192786.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
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
X-List-Received-Date: Fri, 16 Sep 2011 17:14:11 -0000

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
index 93008cc..faacd70 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -333,6 +333,12 @@ def check_sanity(e):
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
1.7.4.1



