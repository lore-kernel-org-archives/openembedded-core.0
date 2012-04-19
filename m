Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKzZW-0004UR-Ps for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:11:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM1vcD019057
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17050-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM1lSb019050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:48 +0100
Message-ID: <1334872910.3028.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2012 23:01:50 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: utils.bbclass: Testing via env in create_wrapper is a nice idea but breaks things
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
X-List-Received-Date: Thu, 19 Apr 2012 22:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For example, pseudo-native wants to set LD_LIBRBARY_PATH but setting this
into the environment here causes the existing pseudo (running during do_install)
to poke into paths in /opt and this breaks builds.

The simplest fix is simply not to do this. Comments tweaks to match the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 3b59463..fde8f44 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -282,7 +282,6 @@ create_cmdline_wrapper () {
    cmd=$1
    shift
 
-   # run echo via env to test syntactic validity of the variable arguments
    echo "Generating wrapper script for $cmd"
 
    mv $cmd $cmd.real
@@ -306,8 +305,7 @@ create_wrapper () {
    cmd=$1
    shift
 
-   # run echo via env to test syntactic validity of the variable arguments
-   env $@ echo "Generating wrapper script for $cmd"
+   echo "Generating wrapper script for $cmd"
 
    mv $cmd $cmd.real
    cmdname=`basename $cmd`.real




