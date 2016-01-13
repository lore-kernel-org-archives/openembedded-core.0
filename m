Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id C62EE6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:47:25 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id vt7so43216445obb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UTY1py74Dy/U9j7NnQKRBdUxGrf746kcvYFCYDe2jiY=;
	b=asn49L1uxDNeZJaENYF15vrFGjNJK3zlqicpRdcxIS0hSVciKsX2IHfTGAc0LVxJ1n
	zRORO5bZ7dY2pD8NC74PU7yiTlbQxUqu35G/IAFLwqAQtktt+SY2f873OL1QgUBgzfhe
	LC6FPfHgzEhJjwI/2Kt8/xxXE2zGn2heHBNTFTM3kS/XvfbcbC+l69fM2oH/yxSUWWuT
	r1j5095pGS1F+K8+j9uT2+YLGuUrR+dH3nSD5uOexs6NBYmfvzIZswFz88wXod/2pKCa
	uET5+5djM4qKKMZ0+RDWdfExY82EtzJ4igPUq35GmGLDR/KicTTBGyYLcvSP9mUG3GLW
	Fniw==
X-Received: by 10.60.92.97 with SMTP id cl1mr86717070oeb.12.1452649645878;
	Tue, 12 Jan 2016 17:47:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	r187sm52422140oif.26.2016.01.12.17.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jan 2016 17:47:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 17:47:18 -0800
Message-Id: <1452649638-16393-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] strace: clear native sysroot references from CFLAGS_FOR_BUILD etc
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
X-List-Received-Date: Wed, 13 Jan 2016 01:47:25 -0000

strace uses CC_FOR_BUILD to compile temporary utility apps to run as
part of the build process. There's no need to build those utils
against the native sysroot though (and things sometimes go wrong if we
do), so clear CFLAGS_FOR_BUILD etc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/strace/strace_4.11.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index d3e4aef..4506d5b 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -15,6 +15,14 @@ SRC_URI[sha256sum] = "e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5
 
 inherit autotools ptest bluetooth
 
+# strace uses CC_FOR_BUILD to compile temporary utility apps to run as part of
+# the build process. There's no need to build those utils against the native
+# sysroot though, so clear CFLAGS_FOR_BUILD etc.
+CPPFLAGS_FOR_BUILD = ""
+CFLAGS_FOR_BUILD = ""
+CXXFLAGS_FOR_BUILD = ""
+LDFLAGS_FOR_BUILD = ""
+
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
 PACKAGECONFIG_class-target ??= "\
-- 
1.9.1


