Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T4zfF-0004RB-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 21:35:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7OJNKQe009041
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 12:23:20 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 24 Aug 2012 12:23:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 14:23:42 -0500
Message-ID: <38c075c68dde693fab241a3ae279ff4ad236352e.1345836133.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1345836133.git.mark.hatle@windriver.com>
References: <cover.1345836133.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] terminal.py: use unique ids for screen sessions
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
X-List-Received-Date: Fri, 24 Aug 2012 19:35:30 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

When running multiple sets of builds on the same
system, it is hard to distinguish which build belongs
to which screen session and you can end up resuming
the wrong session.

The simple solution is to just append the process
id to the screen session invocation to make each
unique.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/terminal.py |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3131798..30e8f92 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -94,9 +94,11 @@ class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
     def __init__(self, sh_cmd, title=None, env=None):
+        s_id = "devshell_%i" % os.getpid()
+        self.command = "screen -D -m -t \"{title}\" -S %s {command}" % s_id
         Terminal.__init__(self, sh_cmd, title, env)
         logger.warn('Screen started. Please connect in another terminal with '
-                    '"screen -r devshell"')
+                    '"screen -r devshell %s"' % s_id)
 
 
 def prioritized():
-- 
1.7.3.4



