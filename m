Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZPiL-0007wj-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 18:28:26 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGHEOI3018054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 18:14:25 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZPUk-0008Ix-KX; Fri, 16 Nov 2012 18:14:23 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 18:14:20 +0100
Message-Id: <1353086060-31563-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] sstate.bbclass: fixed file-conflict check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 17:28:26 -0000

The value of subprocess.Popen().communicate()[0] is a string.
Checking for '!= None' will always match causing bogus warnings
regarding already staged files.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1730abe..0ee48db 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -173,7 +173,7 @@ def sstate_install(ss, d):
                 sstate_search_cmd = "grep -rl %s %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 cmd_array = sstate_search_cmd.split(' ')
                 search_output = subprocess.Popen(cmd_array, stdout=subprocess.PIPE).communicate()[0]
-                if search_output != None:
+                if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
         bb.warn("The recipe %s is trying to install files into a shared area when those files already exist. Those files and their manifest location are:\n   %s\nPlease verify which package should provide the above files." % (d.getVar('PN', True), "\n   ".join(match)))
-- 
1.7.11.7



