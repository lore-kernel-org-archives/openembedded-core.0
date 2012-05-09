Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd0-00065a-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:39:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721025"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:50 -0700
Message-Id: <e0a2e7b8debfecf2e178cec796cae7b3c74897d4.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/12] sanity.bbclass: Check for bogus values in BBCLASSEXTEND
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
X-List-Received-Date: Wed, 09 May 2012 05:39:59 -0000

From: Peter Seebach <peter.seebach@windriver.com>

Suggestion that came out of my sanity-checks of multilibs; verify
that stuff in BBCLASSEXTEND is valid.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 635049e..9f3f1d5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -81,6 +81,15 @@ def check_toolchain(data):
 
     return ""
 
+def check_bbclassextend(data):
+    allowed = ('native', 'nativesdk', 'multilib', 'cross')
+    extends = (data.getVar("BBCLASSEXTEND", True) or "").split()
+    errors = []
+    for pair in [x.split(':') for x in extends]:
+        if pair[0] not in allowed:
+            errors.append('BBCLASSEXTEND has invalid value: %s' % pair[0])
+    return '\n'.join(errors)
+
 def check_conf_exists(fn, data):
     bbpath = []
     fn = data.expand(fn)
@@ -401,6 +410,10 @@ def check_sanity(e):
     if toolchain_msg != "":
         messages = messages + toolchain_msg + '\n'
 
+    bbclassextend_msg = check_bbclassextend(e.data)
+    if bbclassextend_msg != "":
+        messages = messages + bbclassextend_msg + '\n'
+
     # Check if DISPLAY is set if IMAGETEST is set
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
-- 
1.7.7.6



