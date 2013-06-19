Return-Path: <joe@deserted.net>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E509E608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 13:56:56 +0000 (UTC)
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5JDuvKr012949;
	Wed, 19 Jun 2013 06:56:57 -0700 (PDT)
From: joe@deserted.net
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2013 09:56:56 -0400
Message-Id: <1371650216-31735-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.8.2
Cc: joe.macdonald@windriver.com
Subject: [PATCH] bdwgc: support configure on autoconf <2.69
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 13:56:57 -0000

From: Joe MacDonald <joe@deserted.net>

Building bdwgc-native on systems with older versions of autoconf (earlier
than 2.69) is known to have issues:

	https://github.com/ivmai/bdwgc/issues/16

An option is to simply mask the errors with m4_pattern_allow(...) for each
of the macros, but rerunning autoreconf produces a functional configure
script that builds a functional native version of bdwgc.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta/recipes-support/bdwgc/bdwgc_7.2d.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

I tripped over this yesterday on one of my older builders.  It happens to still
be Ubuntu 12.04.2.  I don't know if it's unique to my configuration, but after
doing some digging around on the web I can't see any obvious indications that
I'm missing any autotools package and the general consensus seems to be that
autoreconf is the best option when the failures are relatively beign as they
are here.

-J.

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
index 46e5257..d8e2de5 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
@@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit autotools
 BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend() {
+	# Without this, on older installations of autoconf errors crop up during configure:
+	# | configure.ac:70: error: possibly undefined macro: AC_MSG_ERROR
+	# |       If this token and others are legitimate, please use m4_pattern_allow.
+	# |       See the Autoconf documentation.
+	# | configure.ac:358: error: possibly undefined macro: AS_IF
+	( cd ${S}; autoreconf -i )
+}
-- 
1.8.2


