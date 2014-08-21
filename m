Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E0DFB70EA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKjLco021597 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:45:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NbZN-8bkBp19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:45:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKjGMo021594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:45:18 +0100
Message-ID: <1408653916.1669.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 21:45:16 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] knotty: Improve exception handling
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
X-List-Received-Date: Thu, 21 Aug 2014 20:45:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, IOErrors are just passed over due to the broken Exception
clause. A command like "bitbake X | <invalid command>" would break stdout
triggering a traceback. With these changes we print the exceptions, shut down
the server gracefully and exit which is a much nicer behaviour and is less
confusion to the user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index 746dcf4..bb6d4cb 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -508,6 +508,10 @@ def main(server, eventHandler, params, tf = TerminalFilter):
             # ignore interrupted io
             if ioerror.args[0] == 4:
                 pass
+            sys.stderr.write(str(ioerror))
+            if not params.observe_only:
+                _, error = server.runCommand(["stateForceShutdown"])
+            main.shutdown = 2
         except KeyboardInterrupt:
             termfilter.clearFooter()
             if params.observe_only:
@@ -526,7 +530,11 @@ def main(server, eventHandler, params, tf = TerminalFilter):
                     logger.error("Unable to cleanly shutdown: %s" % error)
             main.shutdown = main.shutdown + 1
             pass
-
+        except Exception as e:
+            sys.stderr.write(str(e))
+            if not params.observe_only:
+                _, error = server.runCommand(["stateForceShutdown"])
+            main.shutdown = 2
     summary = ""
     if taskfailures:
         summary += pluralise("\nSummary: %s task failed:",



