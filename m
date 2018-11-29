Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 35E796C0E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j3kKs/Anz76ajUeh1K2owUERYstOR53YvdMG6U1l36U=;
	b=zHavR/C0KrwDbjr6q+w+wFhsRJ
	emmyU6PtWC3vbGr/EL2z6Pdx3ThGs/pJk0EQsRvemE+LOElJjFkMrJTpcRguNG9XK6oNHMJYbtCwu
	cTRcJDSFPUku6TeOPszZ5Pjz1r1FhO5P1WJDj9CCIhmRRe3ZzNhyMei/7tRoIRLQWa+FX1YSQhH23
	P01xnJyNnQBhm+oBxWeAKFIQTdmWUkriNXUBY7egNdpfhFOGYlPrUy0u11vJLiJkkQAPcJBcD9ahI
	021ddiNoqk86ZMuOKlLf0fZsdcpZTakZLpOKsI1llHdFVZnhBC8XaRQ1M+FeTNQyl/rYvH+88OVsj
	Qzd97SZw==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKc-0004SO-55; Thu, 29 Nov 2018 14:22:10 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKc-0005zL-2C; Thu, 29 Nov 2018 14:22:10 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:36 +0200
Message-Id: <1543494097-19534-5-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Michael.Ho@bmw.de
Subject: [PATCH 4/5] sstate: add support for caching shared workdir tasks
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
X-List-Received-Date: Thu, 29 Nov 2018 13:00:17 -0000

From: Michael Ho <Michael.Ho@bmw.de>

The sstate bbclass uses workdir as a hardcoded string in path
manipulations. This means that the sstate caching mechanism does
not work for the work-shared directory which the kernel uses to
share its build configuration and source files for out of tree
kernel modules.

This commit modifies the path manipulation mechanism to use the
work-shared directory if detected in the paths when handling the
sstate cache packages.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/sstate.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8b48ab4..c856007 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -362,7 +362,10 @@ def sstate_installpkgdir(ss, d):
 
     for plain in ss['plaindirs']:
         workdir = d.getVar('WORKDIR')
+        sharedworkdir = os.path.join(d.getVar('TMPDIR', True), "work-shared")
         src = sstateinst + "/" + plain.replace(workdir, '')
+        if sharedworkdir in plain:
+            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
         dest = plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
@@ -620,8 +623,11 @@ def sstate_package(ss, d):
         os.rename(state[1], sstatebuild + state[0])
 
     workdir = d.getVar('WORKDIR')
+    sharedworkdir = os.path.join(d.getVar('TMPDIR', True), "work-shared")
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
+        if sharedworkdir in plain:
+            pdir = plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
         os.rename(plain, pdir)
-- 
1.9.1


