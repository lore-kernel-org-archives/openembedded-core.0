Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ty1Yo-0002ye-8Y for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 15:44:24 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0NEWmud010424 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:32:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CAwVhqrhz13o
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:32:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0NEWeM6010419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:32:43 GMT
Message-ID: <1358951311.6356.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2013 14:28:31 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add optimisation for useradd injected dependencies
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
X-List-Received-Date: Wed, 23 Jan 2013 14:44:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

useradd.bbclass adds sstate dependencies on base-passwd, shadow-native and
shadow-sysroot. Due to the way these are injected, they interact badly with
the other dependency validation logic and end up pulling in dependencies we
don't actually need. This patch adds code to optimise those cases out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index bc9f7ad..edddd2f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -666,6 +666,9 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
 
         # Consider sysroot depending on sysroot tasks
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
+            # base-passwd/shadow-sysroot don't need their dependencies
+            if taskdependees[dep][0].endswith(("base-passwd", "shadow-sysroot")):
+                continue
             # Nothing need depend on libc-initial/gcc-cross-initial
             if taskdependees[task][0].endswith("-initial"):
                 continue
@@ -681,6 +684,11 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             # Target populate_sysroot need their dependencies
             return False
 
+        # This is due to the [depends] in useradd.bbclass complicating matters
+        # The logic *is* reversed here due to the way hard setscene dependencies are injected
+        if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd')) and taskdependees[dep][1] == 'do_populate_sysroot':
+            continue
+
         # Safe fallthrough default
         bb.debug(2, " Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])))
         return False




