Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9I6G-0003v9-3C for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 17:00:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TF1VcQ003444 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:01:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4wZbIkXF10EM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:01:30 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TF1R5u003404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:01:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 15:55:02 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317308108.12332.92.camel@ted>
Mime-Version: 1.0
Subject: [RFC PATCH] bitbake.conf: Start using parallel make for do_install
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
X-List-Received-Date: Thu, 29 Sep 2011 15:00:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Most piece of software now support parallel make install. Enable
this by default using the value of PARALLEL_MAKE. In a similar way
to PARALLEL_MAKE we can disable this for broken recipes with:

PARALLEL_MAKEINST = ""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f18e35b..a1420cf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -493,8 +493,11 @@ export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
 ALLOWED_FLAGS = "-O -mcpu -march -pipe"
 
-# Pass parallel make options to the compile task only
+# Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
+PARALLEL_MAKEINST ??= "${PARALLEL_MAKE}"
+# Pass parallel make options to the install task
+EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 
 ##################################################################
 # Optimization flags.




