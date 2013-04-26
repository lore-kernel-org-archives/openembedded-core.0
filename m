Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UVlwr-0001b3-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 18:56:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3QGckRM011375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Apr 2013 18:38:47 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UVlfa-0000tr-Gr; Fri, 26 Apr 2013 18:38:46 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 18:38:45 +0200
Message-Id: <1366994325-3427-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9325
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dropbear: hack around different sftp-server path definitions
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
X-List-Received-Date: Fri, 26 Apr 2013 16:56:52 -0000
X-List-Received-Date: Fri, 26 Apr 2013 16:56:52 -0000

oe defines libexecdir to be different for each package which breaks
the expectations of dropbear which searches 'sftp-server' within
${libexecdir}.

Patch tries to guess the correct location of the sftp-server helper
program by testing for oe's idea of libexecdir.  People on irc told
they are using the traditional '/usr/libexec' in their distribution so
that this case is handled as well.

Patch is not perfect, but solves the problem for now.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-core/dropbear/dropbear.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 945e3d7..2a44a0c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -32,6 +32,14 @@ inherit autotools update-rc.d
 INITSCRIPT_NAME = "dropbear"
 INITSCRIPT_PARAMS = "defaults 10"
 
+# workaround different libexecdir definition in oe; it does not fix
+# the multilib issues but mades sftp work again when dropbear and
+# openssh-sftp-server are for the same architecture.
+_sftp_server_path = "${@\
+    ['${libexecdir}/sftp-server','${libdir}/openssh/sftp-server']\
+    [d.getVar('libexecdir', True).endswith(d.expand('/${BPN}'))]}"
+CFLAGS += "-DSFTPSERVER_PATH=\\"${_sftp_server_path}\\""
+
 CFLAGS_prepend = " -I. "
 LD = "${CC}"
 
-- 
1.8.1.4



