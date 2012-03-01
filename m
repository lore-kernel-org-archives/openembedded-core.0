Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Fyf-0007Lv-Ih for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 01:04:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NtU3S024512;
	Thu, 1 Mar 2012 23:55:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24111-05; Thu,  1 Mar 2012 23:55:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NtMOC024506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Mar 2012 23:55:23 GMT
Message-ID: <1330646126.15224.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 23:55:26 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Perez-Gonzalez,	Inaky" <inaky.perez-gonzalez@intel.com>
Subject: [PATCH] scripts/oe-git-proxy-socks-command: Add fallback to use nc
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
X-List-Received-Date: Fri, 02 Mar 2012 00:04:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If our own proxy command isn't available for some reason and nc is available,
fall back to use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/oe-git-proxy-socks-command b/scripts/oe-git-proxy-socks-command
index 39e0acb..8acffb5 100755
--- a/scripts/oe-git-proxy-socks-command
+++ b/scripts/oe-git-proxy-socks-command
@@ -8,10 +8,16 @@ if [ -z "$PROXYSOCKS" -a -e "$SCRIPTDIR/oe-git-proxy-socks.c" ]; then
 fi
 PROXYSOCKS=`which oe-git-proxy-socks 2> /dev/null`
 if [ ! -x "$PROXYSOCKS" ]; then
-	# If that fails, explain to the user
-	echo "Unable to find oe-git-proxy-socks. This is usually created with the command"
-	echo "'gcc scripts/oe-git-proxy-socks.c -o scripts/oe-git-proxy-socks' which we tried"
-	echo "but it doesn't seem to have worked. Please compile the binary manually."
-	exit 1
+	# If that fails, we can see if netcat (nc) is available
+	NETCAT=`which nc 2> /dev/null`
+	if [ ! -x "$NETCAT" ]; then
+		# If that fails, explain to the user
+		echo "Unable to find oe-git-proxy-socks. This is usually created with the command"
+		echo "'gcc scripts/oe-git-proxy-socks.c -o scripts/oe-git-proxy-socks' which we tried"
+		echo "but it doesn't seem to have worked. Please compile the binary manually."
+		echo "Alternativly, install nc (netcat) on this machine."
+		exit 1
+	fi
+	exec $NETCAT -x $GIT_PROXY_HOST:$GIT_PROXY_PORT "$@"
 fi
 oe-git-proxy-socks -S $GIT_PROXY_HOST:$GIT_PROXY_PORT $@




