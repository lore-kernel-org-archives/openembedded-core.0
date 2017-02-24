Return-Path: <daniel@lublin.se>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Feb 2017 10:29:05 UTC
Received: from eltanin.uberspace.de (eltanin.uberspace.de [185.26.156.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0760872F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 10:29:05 +0000 (UTC)
Received: (qmail 29139 invoked from network); 24 Feb 2017 10:22:25 -0000
Received: from localhost (HELO ot.lan) (127.0.0.1)
	by eltanin.uberspace.de with SMTP; 24 Feb 2017 10:22:25 -0000
From: Daniel Lublin <daniel@lublin.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 11:22:20 +0100
Message-Id: <25f1d1f60267fa5c2b12d2374da46c2b31da2792.1487931507.git.daniel@lublin.se>
X-Mailer: git-send-email 2.11.1
Cc: Pavel Modilaynen <pavelmn@axis.com>
Subject: [PATCH] buildstats.bbclass: Avoid index exception in /proc/PID/io parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 10:29:06 -0000

From: Pavel Modilaynen <pavelmn@axis.com>

There is some probability (depends on system load) to get empty
or line containing "0" as the last line while reading /proc/PID/io.
Avoid build failure by checking if line contains separator
":" before split.

Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
Signed-off-by: Daniel Lublin <daniel@lublin.se>
---
 meta/classes/buildstats.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8d7b5988e3..960653c704 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -31,6 +31,11 @@ def get_process_cputime(pid):
                 i = f.readline().strip()
                 if not i:
                     break
+                if not ":" in i:
+                    # one more extra line is appended (empty or containing "0")
+                    # most probably due to race condition in kernel while
+                    # updating IO stats
+                    break
                 i = i.split(": ")
                 iostats[i[0]] = i[1]
     resources = resource.getrusage(resource.RUSAGE_SELF)
-- 
2.11.1


