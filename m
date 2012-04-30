Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqS-0002aW-MI
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:08 +0200
Received: by mail-pz0-f50.google.com with SMTP id h32so4082870dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wW7+E7HzSCPNlP4umpgQVZWGnI/ewY/W0z/x3urVYlo=;
	b=BlxiXI6PwmhAAItOv2ICGvITiNWjOhwSscAU6RTYS7nplDWLVBzWrNaiaw9HImDzp/
	Unpy6hClRZInO0FZpHyHMJsXdaBCNFOQEbAK+/ti7q57DQvlHCYFh7JUyO09Cns45xE6
	ollGoYzhJdE1wJmV+vjDaM2Lu8NQAKEZa8Dw4JqC8Cs0ijBMemE/DmBPyXzJqF8Q6GFZ
	GpU/gRoYFQ7ae2KsL4QEE5UJSIvFsSo8CD1PshiD+HTfRVoWGe9llDkU6NMDqXDXqCSm
	GKlDBmdg+eSBruKv5FB4pdNdFWgAwauP9eOLvsztZpvq+pgPMoUF9rdheCDtpje45Ngz
	NMjA==
Received: by 10.68.234.193 with SMTP id ug1mr2227881pbc.57.1335808048518;
	Mon, 30 Apr 2012 10:47:28 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:22 -0700
Message-Id: <b844d82b14bec3a4f8cc6784a0ec368b0da1f196.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] gcc-cross.inc: Fix cross testing script
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:08 -0000

shift the cmdline argument after determining
there is atleast 1 argument to shift otherwise
it ends up in error when no argument is specified

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index e7a5e41..6d160d6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -45,7 +45,6 @@ do_compile () {
 	# append execution part of the script
 cat >> ${B}/${TARGET_PREFIX}testgcc << STOP
 target="\$1"
-shift
 usage () {
 	echo "Usage:"
 	echo "\$0 user@target 'extra options to dejagnu'"
@@ -60,11 +59,13 @@ usage () {
     }
 if [ "x\$target" = "x" ]
 then
-	echo "Please specify the target machine and remote user in form of user@target"
+	echo "Please specify the target machine and remote user in form of user@target\n"
 	usage
 	exit 1;
 fi
 
+shift
+
 echo "\$target" | grep "@" 2>&1 > /dev/null
 if [ "x\$?" = "x0" ]
 then
-- 
1.7.5.4



