Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 719EB7872C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 13:57:24 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7BB865C0D88;
	Mon, 11 Dec 2017 14:51:26 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 14:57:20 +0100
Message-Id: <20171211135720.38714-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513000286; bh=NQ0sPZ0Tk8RHvfEAcNKEVqWWJA8z+HWiak/Vlp1Gfto=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=EOfKKWha5vKsEbxWkWkDSeWy93l1xdqIzXKEsfzqzOylp6obd6keRN291+8m9jxe4oR0MIzkvcLevC5t6YL+ANaBmboj8aixIoLuaVyNbl1A8AYjZJLCPSnJbyArpbg5J3055NlDCuj4QPTTBoqkiKHa8m2d+24Tkdnltt5TxZk=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 13:57:24 -0000

From: Stefan Agner <stefan.agner@toradex.com>

On some build hosts distros (e.g. Fedora 26) waf tries to be
smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
This obviously is not what we want for 32-bit targets and usually
fails in the do_package phase:
  WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
    /usr/lib64/libgstimxcommon.so.0

Explicitly pass libdir to waf reliably resolves the issue.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/classes/waf.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c4698e910a..43b3f098ac 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -26,7 +26,7 @@ def get_waf_parallel_make(d):
     return ""
 
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
+	${S}/waf configure --prefix=${prefix} --libdir=${libdir} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-- 
2.13.6


