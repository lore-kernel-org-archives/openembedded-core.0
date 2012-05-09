Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSCaK-00010q-3l
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:30:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49JK9ar001460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 12:20:09 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 12:20:09 -0700
Date: Wed, 9 May 2012 14:20:07 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120509142007.528ca609@wrlaptop>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Protection against ever-more-talented fools...
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
X-List-Received-Date: Wed, 09 May 2012 19:30:04 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Time for some shell trivia!

Trivia point:  PATH=:/usr/bin and PATH=.:/usr/bin are equivalent.
Trivia point:  So are PATH=/bin::/usr/bin and PATH=/bin:.:/usr/bin
Trivia point:  People love to write stuff like:
  PATH=$(THAT_DIRECTORY):$PATH
Trivia point:  The shell expands undefined variables to empty strings.

Which is to say:

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 687ddeb..1384592 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -298,8 +298,9 @@ def check_sanity(e):
         if not check_app_exists("qemu-arm", e.data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-    if "." in data.getVar('PATH', e.data, True).split(":"):
-        messages = messages + "PATH contains '.' which will break the build, please remove this"
+    paths = data.getVar('PATH', e.data, True).split(":")
+    if "." in paths or "" in paths:
+        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
 
     if data.getVar('TARGET_ARCH', e.data, True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux

-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


