Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDp-0002oW-1b
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3Tmn016352 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:29 +0100
X-Quarantine-ID: <JzUQOQtP6WsQ>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JzUQOQtP6WsQ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:29 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3QFr016314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:27 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R7r4h-0005X9-2F
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:57:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:57:00 +0100
Message-Id: <e2b77c4a39d336701364693fc917fae7b0564e3b.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
References: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/9] base.bbclass: Drop legacy code that is no longer useful/used
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
X-List-Received-Date: Sun, 25 Sep 2011 16:06:29 -0000

The code displaying console events has been handled by the bitbake
UI since 1.8 so the legacy code path can be removed. If a log event
is wanted, there are much better (and more complete) ways to do this
so remove the EVENTLOG code too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass |   30 ------------------------------
 1 files changed, 0 insertions(+), 30 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 918d859..9144f9c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -205,31 +205,7 @@ python base_eventhandler() {
 	from bb import note, error, data
 	from bb.event import getName
 
-	messages = {}
-	messages["Completed"] = "completed"
-	messages["Succeeded"] = "completed"
-	messages["Started"] = "started"
-	messages["Failed"] = "failed"
-
 	name = getName(e)
-	msg = ""
-	if name.startswith("Pkg"):
-		msg += "package %s: " % data.getVar("P", e.data, 1)
-		msg += messages.get(name[3:]) or name[3:]
-	elif name.startswith("Task"):
-		msg += "package %s: task %s: " % (data.getVar("PF", e.data, 1), e.task)
-		msg += messages.get(name[4:]) or name[4:]
-	elif name.startswith("Build"):
-		msg += "build %s: " % e.name
-		msg += messages.get(name[5:]) or name[5:]
-	elif name == "UnsatisfiedDep":
-		msg += "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower())
-
-	# Only need to output when using 1.8 or lower, the UI code handles it
-	# otherwise
-	if (int(bb.__version__.split(".")[0]) <= 1 and int(bb.__version__.split(".")[1]) <= 8):
-		if msg:
-			note(msg)
 
 	if name.startswith("BuildStarted"):
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
@@ -275,12 +251,6 @@ python base_eventhandler() {
 
 	if not data in e.__dict__:
 		return
-
-	log = data.getVar("EVENTLOG", e.data, 1)
-	if log:
-		logfile = file(log, "a")
-		logfile.write("%s\n" % msg)
-		logfile.close()
 }
 
 addtask configure after do_unpack do_patch
-- 
1.7.5.4



