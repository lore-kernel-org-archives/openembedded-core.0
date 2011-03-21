Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jbR-0007kQ-P2
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:13:17 +0100
Received: by mail-iy0-f175.google.com with SMTP id 26so6818907iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8lwrEikmLGwr1Y3Yrq9aowl1X+HubG5el8CKu86LEMc=;
	b=NidNdZAHKAO4MCl/pyHwTkJcvtJ5SQNKaMfLAE7eJ1t3qLwuSVptezzhFbz5dxQ87D
	FaDPrMhEaF3csuLsEjBC+JZr8REPIbYIeB8u7PEWCaTyQYIzBl1cdWANHhZPuIDNOjiE
	KWaaqjSgeCS/pZOyvHodiLuyAh8tLo7BFRw+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uy7RkNpYbGUSHidMiR5D//K4o1q5k44RjiVgTpGiD6Kk/6SZQwSlu8bXXaseFBedwr
	S8zGHpssSOB/NMJ2/6eNwVBoct2KIeOfAlQhPglZhA8GRVBLhyMciqx8Pi37lhXxAbrd
	gxLlFmjJzJmgcK/dfCu5iea8ulfmt+N4slYKs=
Received: by 10.43.55.78 with SMTP id vx14mr7210144icb.410.1300731090772;
	Mon, 21 Mar 2011 11:11:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wo11sm4098736icb.20.2011.03.21.11.11.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:11:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:11:25 -0700
Message-Id: <00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300730825.git.raj.khem@gmail.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Mon, 21 Mar 2011 18:13:18 -0000

-fexpensive-optimizations is enabled by default at -O2

-fomit-frame-pointer is enabled at -O2 selectively by gcc depending upon
  architecture if debug info is not hurt

-frename-registers - This might have some performance advantage on top
 of O2 on architectures which have more registers and registers are left
 after scheduling but it affects debuggability quite a bit so as a i
 tradeoff we do not use it.

-feliminate-dwarf2-dups - We use this option to reduce the size of debug
 information by removing duplicates this is only valid for dwarf2+ and we
 use dwarf2 by default

-pipe uses buffers instead of temporary files internally it can speed
 up compilation it has has issues with other assemblers but not
 with GNU assembler and we use gas.

Separate out debug information related flags into a separate variable
DEBUG_FLAGS so distros can use/notuse them as they like

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5f1fc5..52e66a5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -495,11 +495,11 @@ EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
 ##################################################################
 # Optimization flags.
 ##################################################################
-
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types"
-DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
+DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types -feliminate-dwarf2-dups"
+FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
+DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) == '1'], d, 1)}"
-BUILD_OPTIMIZATION = "-O2"
+BUILD_OPTIMIZATION = "-O2 -pipe"
 
 ##################################################################
 # Bootstrap stuff.
-- 
1.7.4.1



