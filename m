Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DA3AA6CC57
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 13:17:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94DHB1m007747 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 14:17:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yavb07GATpOM
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:17:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94DH7Dg007744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 14:17:09 +0100
Message-ID: <1380892623.18603.605.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2013 14:17:03 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] oe-init-build-env-memres: Unset BBSERVER if already set
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
X-List-Received-Date: Fri, 04 Oct 2013 13:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When starting a new server we don't want bitbake to connect to an existing
server so ensure BBSERVER is unset.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index dca819b..79b91b7 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -42,6 +42,10 @@ else
    else
       OEROOT="`pwd`"
    fi
+   if [ -n "$BBSERVER" ]; then
+      unset BBSERVER
+   fi
+            
    OEROOT=`readlink -f "$OEROOT"`
    export OEROOT
    . $OEROOT/scripts/oe-buildenv-internal && \



