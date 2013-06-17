Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 95D296098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 14:57:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HF3IiN032761 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:03:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vCpwklV78oUx
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:03:18 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HF3CRK032757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:03:13 +0100
Message-ID: <1371481023.20823.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 15:57:03 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] utils.bbclass: Tweak create_wrapper
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
X-List-Received-Date: Mon, 17 Jun 2013 14:57:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the full path is specified to exec however this may incorporate a
build path which in the nativesdk case, is not transformed to a target system
path. This leads to failures due to incorrect paths.

This patch ensures the full build path is not encoded into the wrapper script.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index cf8893f..e873c53 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -282,12 +282,12 @@ create_wrapper () {
 	echo "Generating wrapper script for $cmd"
 
 	mv $cmd $cmd.real
-	cmdname=`basename $cmd`.real
+	cmdname=`basename $cmd`
 	cat <<END >$cmd
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
 export $@
-exec -a $cmd \`dirname \$realpath\`/$cmdname "\$@"
+exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real "\$@"
 END
 	chmod +x $cmd
 }



