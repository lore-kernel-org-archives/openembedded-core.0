Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3EMJ-0005Oz-IG for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 23:20:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21MBqSU023256;
	Thu, 1 Mar 2012 22:11:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22200-10; Thu,  1 Mar 2012 22:11:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21MBi11023250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Mar 2012 22:11:45 GMT
Message-ID: <1330639907.12133.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 22:11:47 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Perez-Gonzalez,	Inaky" <inaky.perez-gonzalez@intel.com>
Subject: [PATCH] scripts/oe-git-proxy-socks-command: Improve error fallback/handling
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
X-List-Received-Date: Thu, 01 Mar 2012 22:20:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If oe-git-proxy-socks isn't available, try and create it.

If that fails, tell the user there is a problem, don't just fail
to find the command.

[YOCTO #2007]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/oe-git-proxy-socks-command b/scripts/oe-git-proxy-socks-command
index 90fa14e..39e0acb 100755
--- a/scripts/oe-git-proxy-socks-command
+++ b/scripts/oe-git-proxy-socks-command
@@ -1,2 +1,17 @@
 #! /bin/bash
+SCRIPTDIR=`dirname $0`
+# Check oe-git-proxy-socks exists
+PROXYSOCKS=`which oe-git-proxy-socks 2> /dev/null`
+if [ -z "$PROXYSOCKS" -a -e "$SCRIPTDIR/oe-git-proxy-socks.c" ]; then
+	# If not try and build it
+	gcc $SCRIPTDIR/oe-git-proxy-socks.c -o $SCRIPTDIR/oe-git-proxy-socks
+fi
+PROXYSOCKS=`which oe-git-proxy-socks 2> /dev/null`
+if [ ! -x "$PROXYSOCKS" ]; then
+	# If that fails, explain to the user
+	echo "Unable to find oe-git-proxy-socks. This is usually created with the command"
+	echo "'gcc scripts/oe-git-proxy-socks.c -o scripts/oe-git-proxy-socks' which we tried"
+	echo "but it doesn't seem to have worked. Please compile the binary manually."
+	exit 1
+fi
 oe-git-proxy-socks -S $GIT_PROXY_HOST:$GIT_PROXY_PORT $@




