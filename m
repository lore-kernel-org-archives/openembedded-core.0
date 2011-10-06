Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBotz-0006EQ-CG for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:26:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96ERF5n012152 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:27:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ce4sYKFzacoG
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 15:27:14 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96ERClv012132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:27:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:20:35 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317910843.6398.87.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] native.bbclass: Ensure native recipes have a deterministic baselib value
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
X-List-Received-Date: Thu, 06 Oct 2011 14:26:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Changes to baselib by specific machine configuration were resulting
in sstate cache invalidation, particularly in multilib configurations.

This patch ensures this doesn't happen and native sstate cache files
are reusable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5e45aed..ba8b0bf 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -69,6 +69,8 @@ exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
 libdir = "${STAGING_DIR_NATIVE}${libdir_native}"
 
+baselib = "lib"
+
 # Libtool's default paths are correct for the native machine
 lt_cv_sys_lib_dlsearch_path_spec[unexport] = "1"
 




