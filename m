Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 055B060FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 13:14:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94DEKJH007589 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 14:14:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tT5x0Sxn6Eco
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:14:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94DEF4w007564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 14:14:16 +0100
Message-ID: <1380892450.18603.600.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2013 14:14:10 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] oe-init-build-env: unset BBSERVER
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
X-List-Received-Date: Fri, 04 Oct 2013 13:14:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If BBSERVER is set, we should unset it before proceeding. Its assumed the
user will have unloaded the server from memory should they have wished
to do so.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/oe-init-build-env b/oe-init-build-env
index 68af7b5..de9692f 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -35,7 +35,10 @@ else
    else
       OEROOT="`pwd`"
    fi
-   OEROOT=`readlink -f "$OEROOT"`
+   if [ -n "$BBSERVER" ]; then
+      unset BBSERVER
+   fi
+    OEROOT=`readlink -f "$OEROOT"`
    export OEROOT
    . $OEROOT/scripts/oe-buildenv-internal && \
         $OEROOT/scripts/oe-setup-builddir && \



