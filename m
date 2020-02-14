Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 84E186113A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:34:16 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01EIYEK6032293;
	Fri, 14 Feb 2020 12:34:15 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Fri, 14 Feb 2020 12:34:14 -0600
Message-Id: <20200214183414.141058-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214183414.141058-1-mark.hatle@kernel.crashing.org>
References: <20200214183414.141058-1-mark.hatle@kernel.crashing.org>
Subject: [RFC PATCH 1/1] newlib: Move syscalls from newlib to libgloss
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
X-List-Received-Date: Fri, 14 Feb 2020 18:34:16 -0000

By passing --disabled-newlib-supplied-syscalls, newlib will disable the
generation of builtin syscalls and move this to libgloss.  (This also
affects the generation of crt0.o.)

libgloss SHOULD then provide the syscalls, crt0.o and other functions that
are no longer part of newlib itself.  This now means that you must link
with both newlib and libgloss, whereas before newlib would run in many
configurations by itself.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-core/newlib/newlib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index d7ac8bff17..5edea8aba1 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -42,6 +42,7 @@ EXTRA_OECONF = " \
 		--with-gnu-as \
 		--with-gnu-ld \
 		--disable-multilib \
+		--disable-newlib-supplied-syscalls \
 		"
 
 do_configure[cleandirs] = "${B}"
-- 
2.17.1


