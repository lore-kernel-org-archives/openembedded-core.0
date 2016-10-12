Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id EA6EA60762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:55:05 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 4E8B12D6122EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 13:55:03 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 12 Oct 2016 13:55:06 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 12 Oct 2016 13:55:06 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2016 13:55:02 +0100
Message-ID: <1476276902-56841-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH] libgpg-error: Make case generic for MIPS
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
X-List-Received-Date: Wed, 12 Oct 2016 12:55:06 -0000
Content-Type: text/plain

The tuples for MIPS r6 onwards are
- mipsisa32r6el
- mipsisa32r6
- mipsisa64r6el
- mipsisa64r6

The default case passes it forward which isn't handled well and
causes a build error. Rework the case statement to make it generic.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.24.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
index e45a7b8..84a882a 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
@@ -33,8 +33,8 @@ do_compile_prepend() {
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
 	  i586|i686)  TUPLE=i686-pc-linux-gnu ;;
-	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
-	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
+	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
+	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;; 
 	esac
-- 
1.9.1


