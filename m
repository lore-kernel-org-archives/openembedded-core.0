Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZPsB-0008CP-8G
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 18:38:35 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGHORrc019170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 18:24:28 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZPeV-0007E0-Ko; Fri, 16 Nov 2012 18:24:27 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 18:24:26 +0100
Message-Id: <1353086666-25122-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH] autotools: do not output config.log to console
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
X-List-Received-Date: Fri, 16 Nov 2012 17:38:35 -0000

Flooding xterm console output with 10000+ lines of config.log is not
very productive and hides the previously printed information.  Because
the interesting lines are usually in the middle of config.log, there
is not easy way to trim down the output.

Patch copies output of config.log into temp-dir and points to this
file.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/autotools.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index efeb67f..7dc39f3 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -91,14 +91,12 @@ oe_runconf () {
 	cfgscript="${S}/configure"
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		set +e
-		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
-		if [ "$?" != "0" ]; then
-			echo "Configure failed. The contents of all config.log files follows to aid debugging"
-			find ${S} -name config.log -print -exec cat {} \;
+		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || (
+			set +x
+			echo "Configure failed. The contents of all config.log files will be put into ${T}/config.log to ease debugging."
+			find ${S} -name config.log -print -exec cat {} \; > ${T}/config.log
 			bbfatal "oe_runconf failed"
-		fi
-		set -e
+		)
 	else
 		bbfatal "no configure script found at $cfgscript"
 	fi
-- 
1.7.11.7



