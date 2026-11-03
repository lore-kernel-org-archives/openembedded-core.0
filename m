Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2704.1793747773077959019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 15:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.127 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"mark.yang" <mark.yang@lge.com>
Subject: [PATCH 6/6] Revert "musl: Show error when used with multilibs"
Date: Wed,  4 Nov 2026 08:16:07 +0900
Message-ID: <20261103231607.4021851-7-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103231607.4021851-1-mark.yang@lge.com>
References: <20261103231607.4021851-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 23:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249304
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

This reverts commit 4da308d37aa51231b617fedb401076c13cafd89a.

musl now works with multilib. The loader search path follows
base_libdir (df98368e23), and the earlier patches in this series
handle the rest:

- gcc points the musl dynamic linker at nonarch_base_libdir.
- The musl bits headers get multilib wrappers.
- ldd picks the loader that matches the ELF class of the file.

With these, lib32 programs built against musl install and run next
to the 64-bit ones in the same image.

[YOCTO #13122]

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-core/musl/musl.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index ce45de2d23..4007e6409d 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -29,9 +29,3 @@ ARM_INSTRUCTION_SET:armv4 = "arm"
 B = "${WORKDIR}/build"
 
 do_configure[cleandirs] = "${B}"
-
-python () {
-    multilibs = d.getVar("MULTILIBS")
-    if multilibs:
-        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
-}
