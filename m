Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QodEz-0008Fb-Fu for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:20:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FFmGB026228
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:15:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25105-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 16:15:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FFbXR026214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:15:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 16:15:20 +0100
Message-ID: <1312384520.2344.680.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf/qemux86-64: Automate TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Wed, 03 Aug 2011 15:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ac5d1f3..6f0b42c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -728,7 +728,7 @@ TARGET_ARCH[unexport] = "1"
 DISTRO[unexport] = "1"
 
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
-TRANSLATED_TARGET_ARCH ??= ${TARGET_ARCH}
+TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "basic"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 46d7d12..18a7513 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,9 +2,6 @@
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
 
-TARGET_ARCH = "x86_64"
-TRANSLATED_TARGET_ARCH = "x86-64"
-
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"




