Return-Path: <stefan@agner.ch>
X-Greylist: delayed 373 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Mar 2020 14:02:04 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADAC610E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:02:04 +0000 (UTC)
Received: from trochilidae.toradex.int (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D10115C3FF7;
	Wed,  4 Mar 2020 14:55:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1583330151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=CtzFRCVva3RO0tagVmvO5L6MxJNbYLR6BJ41f3pzi5Q=;
	b=lCQ9ZAhcLfWrky0B6vM0Y0worysqdDzsFC4nQB7+ey2EADQNB7Z3cRckuK6kvslVdb6+gj
	olZoW2F5jqURERmlhWostnCbUPZK4bBVvFhC83gCM0Hy2kmleObSPgChcrVmmlTCl78MX0
	GxKghdWUzse26V322/SbKkZdPtdofC4=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 14:55:43 +0100
Message-Id: <20200304135543.1832937-1-stefan@agner.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ming Liu <liu.ming@toradex.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] kernel-yocto.bbclass: fix a wrong inter-task dependency
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
X-List-Received-Date: Wed, 04 Mar 2020 14:02:05 -0000
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming@toradex.com>

do_kernel_checkout and do_symlink_kernsrc are both modifying ${S}, they
could conflict with eacher other, move do_kernel_checkout after
do_symlink_kernsrc does fix that.

Signed-off-by: Ming Liu <liu.ming@toradex.com>
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 44863adc27..d71ce212a8 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -317,7 +317,7 @@ do_kernel_checkout() {
 }
 do_kernel_checkout[dirs] = "${S}"
 
-addtask kernel_checkout before do_kernel_metadata after do_unpack
+addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
-- 
2.25.0


