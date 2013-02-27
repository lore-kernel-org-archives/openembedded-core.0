Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1UAhZn-0002eF-MV
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:01:45 +0100
Received: from cinmlip11.e2k.ad.ge.com ([12.71.149.1]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUS4N9Dk3IZLVJKh0zY5a/xDSTcMOmkuT@postini.com;
	Wed, 27 Feb 2013 05:45:25 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by cinmlip11.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	27 Feb 2013 07:58:59 -0500
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 27 Feb 2013 07:58:58 -0500
Received: from edna.edi.geip.ge.com (edna.edi.geip.ge.com [3.26.68.71])
	by selma.edi.geip.ge.com (Postfix) with ESMTP id CEDD6E1AF2;
	Wed, 27 Feb 2013 12:58:57 +0000 (GMT)
From: Martin Donnelly <martin.donnelly@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 12:58:55 +0000
Message-Id: <63c4fc136f2bd29337c20a277af9f8996d237bfe.1361890071.git.martin.donnelly@ge.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
References: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
In-Reply-To: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
References: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
Subject: [PATCH 2/2] shadow: remove grpconv argc check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 14:01:46 -0000

The patched version of grpconv takes arguments but the check on
argc was not removed. This patch removes this check which
otherwise results in a spurious warning during rootfs creation.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
---
 .../shadow/files/add_root_cmd_options.patch        |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
index 5edd3b8..ab87e35 100644
--- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
+++ b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
@@ -528,7 +528,17 @@ diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
  int main (int argc, char **argv)
  {
  	const struct group *gr;
-@@ -100,6 +183,8 @@
+@@ -89,9 +172,6 @@
+ 	const struct sgrp *sg;
+ 	struct sgrp sgent;
+ 
+-	if (1 != argc) {
+-		(void) fputs (_("Usage: grpconv\n"), stderr);
+-	}
+ 	Prog = Basename (argv[0]);
+ 
+ 	(void) setlocale (LC_ALL, "");
+@@ -100,6 +180,8 @@
  
  	OPENLOG ("grpconv");
  
-- 
1.7.1



