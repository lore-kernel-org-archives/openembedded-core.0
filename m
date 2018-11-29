Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id A9EFC6D578
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gVCmstElRFlHb28iSflZ/ITO8BiU2qwGNw9te4fJZ9U=;
	b=RmEvb2bA0t2ei9dpURCqUvJCxG
	Jvf9SWa7t2eXS3w9aUZzBHRVUHoDLnzbYkofT/AGucLKrKVs6hz9GT2ZiZfSkcZR1jdVGZ0pIZnYV
	Ct6dm8o+OM8yCzSgP0HBIs1vfZRZTRQLv/m9tUIcu6s8+xU1KB5IVyMF0XeWqH2JKi3HqyygrsTLv
	SUfEQvdsxwryrh1IFiuLsi1XCJBhG73qcyTex8D0D5dBPJ/Ce+FqtwoBstfzBaXFXFr/ZegfXl3ny
	k3HVySKpAbixg1ZA5hdAgr3y0cT/lB8oQlrXJm01KQ45go74Pu+9+5y+3bT55zcFIIYgAiIJzPeEb
	vA02E2iQ==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKe-0004TE-7s; Thu, 29 Nov 2018 14:22:12 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKe-00062X-6V; Thu, 29 Nov 2018 14:22:12 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:37 +0200
Message-Id: <1543494097-19534-6-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Michael.Ho@bmw.de
Subject: [PATCH 5/5] insane.bbclass: add package specific skips to sstate hash
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
X-List-Received-Date: Thu, 29 Nov 2018 12:50:38 -0000

From: Michael Ho <Michael.Ho@bmw.de>

The bbclass currently adds INSANE_SKIP to the sstate hash dependencies
however the package specific skips such as INSANE_SKIP_${PN} are
not added automatically because of how the class references them.

This causes the problem that modifying INSANE_SKIP_${PN} does not
invalidate the sstate cache and can mask build breaking warnings.

Add an anonymous python snippet to explicitly include these additional
relevant skips to the sstate hash.

Singed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/insane.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4644221..e015c94 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1017,6 +1017,13 @@ do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
 addtask do_package_qa after do_packagedata do_package before do_build
 
+# Add the package specific INSANE_SKIPs to the sstate dependencies
+python() {
+    pkgs = (d.getVar('PACKAGES') or '').split()
+    for pkg in pkgs:
+        d.appendVarFlag("do_package_qa", "vardeps", " INSANE_SKIP_{}".format(pkg))
+}
+
 SSTATETASKS += "do_package_qa"
 do_package_qa[sstate-inputdirs] = ""
 do_package_qa[sstate-outputdirs] = ""
-- 
1.9.1


