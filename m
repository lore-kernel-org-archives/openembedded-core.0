Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UVJUP-0004xv-28 for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:33:24 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3PAGkcl009345 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 11:16:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hfxwZs4spvHR
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 11:16:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3PAGhsf009341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 11:16:44 +0100
Message-ID: <1366884926.29677.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 11:15:26 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] qemuimage-testlib-pythonhelper: Make the process detection more strict
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
X-List-Received-Date: Thu, 25 Apr 2013 10:33:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Old versions of ldd (2.11) as run on some of the autobuilders end up running
commands like "LD_xxxx qemu-system-xxx" which this process detection code
would pick up and result in the wrong PID for qemu.

This changes the code to check for "192.168" in the command so we know
we're getting the correct one. This is less than ideal however we're
running out of options and resolves false negatives we see on the
autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/qemuimage-testlib-pythonhelper b/scripts/qemuimage-testlib-pythonhelper
index 4e6432b..6435dd8 100755
--- a/scripts/qemuimage-testlib-pythonhelper
+++ b/scripts/qemuimage-testlib-pythonhelper
@@ -54,9 +54,10 @@ if options.findqemu:
     #print "Children matching %s:" % str(parents)
     for p in parents:
         # Need to be careful here since runqemu-internal runs "ldd qemu-system-xxxx"
+        # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
         basecmd = commands[p].split()[0]
         basecmd = os.path.basename(basecmd)
-        if "qemu-system" in basecmd:
+        if "qemu-system" in basecmd and "192.168" in commands[p]:
             print p
             sys.exit(0)
     sys.exit(1)




