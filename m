Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqj-0002bu-7x
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:25 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3372519pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iGwnziaxcKq/+dqhB5BWjjveyY/nLrxSyDt2vZVnaeQ=;
	b=kTnsZYAbZvNOo9+esuO8qlXJuo3mzN7JPiVzWJ6lW+PvMpjMQuhXIRChBaL0/4LEnt
	mbP9EP/EPkDnWG5OlE+WhgVHfQID9CRtlBqG6K/XDJ1iYpV2ovCPhoeKckphK4pDIK/h
	/Ts8COG2sCEuPqWYX0SR8mta25jtYAbJ4FCIXFEo/lExlcy7Ba1Od2rgwgI8WBSq1GA2
	zUSar2TzMJJhy5O//Z1jL4nbRe16KUspcmFyedyLuSc+vimTM/HpxOPNIZKr2tOBVXnn
	nCEETAib/Qu/xIzirfQhnbH/OvKej7yoBcrGjsReKt4+9i9zDS+k/fjedbgSB6tYJfnR
	w3+w==
Received: by 10.68.125.138 with SMTP id mq10mr18135586pbb.51.1335808065069;
	Mon, 30 Apr 2012 10:47:45 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:25 -0700
Message-Id: <86ef256ecffffebd5a71bc2359614dd74278577d.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] busybox: Pass HOST_CC_ARCH through CONFIG_EXTRA_CFLAGS
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:25 -0000

The -mabi option is part of HOST_CC_ARCH which does not
appear in CFLAGS. This is for completeness since compiler
already defaults to n64 it wont matter that much

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       |    2 +-
 meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index ec76ad2..1613878 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -86,7 +86,7 @@ python () {
   d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
-			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\""
+			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\" \"${HOST_CC_ARCH}\""
                         ])
                   ))
 }
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index ad8297e..2d4e961 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.5.4



