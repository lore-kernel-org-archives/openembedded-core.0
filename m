Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJihB-0001I5-TT for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 11:58:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9mfqB030519
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:48:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30079-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:48:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9mWjl030513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:48:33 +0100
Message-ID: <1334569715.16992.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:48:35 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] wget: Fix re-execution issue
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
X-List-Received-Date: Mon, 16 Apr 2012 09:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The patch in this recipe patches both configure and configure.in which leads
to build failures once configure has executed and regenerated configure.

The fix to make patch re-executable is not to patch configure and
only patch configure.in.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch b/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
index 3f34c76..b76a017 100644
--- a/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
+++ b/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
@@ -31,19 +31,6 @@ Index: wget-1.12/configure.ac
  
  AC_PROG_RANLIB
  
-Index: wget-1.12/configure
-===================================================================
---- wget-1.12.orig/configure	2009-09-22 09:40:13.000000000 -0700
-+++ wget-1.12/configure	2011-10-19 20:33:46.578812174 -0700
-@@ -5297,7 +5297,7 @@
- 
- 
- 
--      GETTEXT_MACRO_VERSION=0.17
-+      GETTEXT_MACRO_VERSION=0.18
- 
- 
- 
 Index: wget-1.12/m4/po.m4
 ===================================================================
 --- wget-1.12.orig/m4/po.m4	2009-09-04 09:31:54.000000000 -0700




