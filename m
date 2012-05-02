Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPOmT-0004Nu-PV
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 03:55:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q421jHwo024492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 18:45:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 18:45:17 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 May 2012 20:45:12 -0500
Message-ID: <24944576961308660582b4a62b2c609fcef0bcea.1335922726.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335922726.git.peter.seebach@windriver.com>
References: <cover.1335922726.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sanity.bbclass: Check for bogus values in BBCLASSEXTEND
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
X-List-Received-Date: Wed, 02 May 2012 01:55:02 -0000
Content-Type: text/plain

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
1.7.0.4



