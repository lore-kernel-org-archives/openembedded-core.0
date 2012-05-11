Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SStE7-0002Ot-Ni for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:01:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4BGq59l028273
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 17:52:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18550-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 17:52:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4BGpuVN028267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 17:51:58 +0100
Message-ID: <1336755114.2494.237.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2012 17:51:54 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation
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
X-List-Received-Date: Fri, 11 May 2012 17:01:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Some image classes such as bootimg save files into ${S} as part of rootfs
generation. For correctness we should therefore clean this at the start of
image generation to ensure reproducibility.

I found this issue when some files I thought should disappear from my rootfs
would not disappear.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 907c59b..9557433 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -131,6 +131,7 @@ PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 do_rootfs[nostamp] = "1"
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_rootfs[cleandirs] += "${S}"
 do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate




