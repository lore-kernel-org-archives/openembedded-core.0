Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTxSQ-0004pp-DT for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 16:13:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF6ID0006197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:06:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05426-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:06:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF6A7e006191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:06:11 GMT
Message-ID: <1322233577.22654.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 15:06:17 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ghostscript-native: Ensure the sys/time/h fix is applied for native builds
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
X-List-Received-Date: Fri, 25 Nov 2011 15:13:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On my system, the sys/time.h header is in a subdir off /usr/include
which causes a build failure. Apply the target CFLAGS fix to native
builds as well to address this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index d444810..86d5ef2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-j
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
 # http://bugs.ghostscript.com/show_bug.cgi?id=692426
 CFLAGS += "-DHAVE_SYS_TIME_H=1"
+BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
 inherit autotools
 




