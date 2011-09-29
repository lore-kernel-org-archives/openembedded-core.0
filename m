Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9I54-0003Qg-NT for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 16:59:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TF0HrI003325 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:00:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l+99sMM7BZCa
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:00:17 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TF0C0g003315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:00:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 15:53:47 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317308034.12332.91.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Drop unneeded dependency
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
X-List-Received-Date: Thu, 29 Sep 2011 14:59:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

patch depends on unpack
configure depends on patch

We simply don't need a configure dependency on unpack. This simplifies
the dependencies of every recipe slightly and should make bitbake
slightly faster at resovling dependency graphs.

It also makes the .dot dependency graphs slightly more readable by
removing noise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9144f9c..57f1c3f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -253,7 +253,7 @@ python base_eventhandler() {
 		return
 }
 
-addtask configure after do_unpack do_patch
+addtask configure after do_patch
 do_configure[dirs] = "${CCACHE_DIR} ${S} ${B}"
 do_configure[deptask] = "do_populate_sysroot"
 base_do_configure() {



