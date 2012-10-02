Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ2PU-0001nC-CO for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 15:21:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92D8HBT015774
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:08:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14357-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 14:08:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92D8AbN015768
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:08:10 +0100
Message-ID: <1349183293.15753.146.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 14:08:13 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/oe-buildenv-internal: Ensure we detect the SDK/ADT and error out
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
X-List-Received-Date: Tue, 02 Oct 2012 13:21:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The SDK/ADT may ship with a python installed which may not have all the modules
need for a bitbake build. We should therefore detect if its already present in the
environment and error out in this case, asking the user to use a clean environment.

This also removes the potential for any other conflict between the two.

[YOCTO #2979]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 32c0ba0..01fffba 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -24,6 +24,11 @@ if [ -z "$OEROOT" ]; then
     return 1
 fi
 
+if [ ! -z "$OECORE_SDK_VERSION" ]; then
+    echo >&2 "Error: The OE SDK/ADT was detected as already being present in this shell environment. Please use a clean shell when sourcing this environment script."
+    return 1
+fi
+
 if [ "x$BDIR" = "x" ]; then
     if [ "x$1" = "x" ]; then
         BDIR="build"




