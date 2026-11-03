Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2688.1793747773085016874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 15:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 4 Nov 2026 08:16:10 +0900
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
Subject: [PATCH 4/6] multilib_header: wrap musl headers for multilib builds
Date: Wed,  4 Nov 2026 08:16:05 +0900
Message-ID: <20261103231607.4021851-5-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103231607.4021851-1-mark.yang@lge.com>
References: <20261103231607.4021851-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 23:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249303
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Let oe_multilib_header wrap headers on musl when multilib is enabled.
dad1c27463 skipped musl because it was not multilib, and because the
wrapper needed bits/wordsize.h. The wrapper no longer needs it.

Non-multilib musl builds keep their plain headers. Only multilib puts
two variants of a header into one sysroot.

With the musl.inc multilib guard removed, a qemuarm64 + lib32 SDK with
both variants silently replaced 20 asm/*.h headers from
linux-libc-headers and 17 musl bits headers by the lib32 copies. Both
recipes already pass them to oe_multilib_header.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/multilib_header.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/multilib_header.bbclass b/meta/classes-recipe/multilib_header.bbclass
index dd65fc02fa..002069f48b 100644
--- a/meta/classes-recipe/multilib_header.bbclass
+++ b/meta/classes-recipe/multilib_header.bbclass
@@ -15,7 +15,7 @@ oe_multilib_header() {
 
 	case ${HOST_OS} in
 	*-musl*)
-		return
+		[ -n "${MULTILIB_VARIANTS}" ] || return 0
 		;;
 	*)
 	esac
