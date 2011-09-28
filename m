Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R90OX-00056e-PN for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:06:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SK7Cek022310 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:07:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lEwAKbTx2wKC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:07:12 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SK760D022304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:07:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 21:00:41 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317240048.12332.57.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Fix reversed linker hash style logic
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
X-List-Received-Date: Wed, 28 Sep 2011 20:06:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The logic in the linker hash patch was reversed, only setting the 
linker style in the non-gnu cases.

Signed-off-by: Richard Purdie <richard.purdie@linux-foundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 618a57b..f18e35b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -482,7 +482,7 @@ LINKER_HASH_STYLE_mips = "sysv"
 LINKER_HASH_STYLE_mipsel = "sysv"
 LINKER_HASH_STYLE_mips64 = "sysv"
 LINKER_HASH_STYLE_mips64el = "sysv"
-TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('LINKER_HASH_STYLE', d, True) == 'gnu']}"
+TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"




