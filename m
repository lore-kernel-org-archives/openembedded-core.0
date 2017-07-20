Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id B1CBD782E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=g8Rfm9FYULuONOo65cywg7/2o56uyGrdr2ef7jSxAzg=; 
	b=i3tnldZ0ZqXtlNcAvL0zrqLkZTSw40ki9I1bqjkt/odTM/WcadFU2HRhjmgqsx4lhqq0L8H9V3t2iUlIutzGXZepdUnM3u4/EIzgJLfBAuiycR3zl6yT1BPgwOD1MKGn6j2mdRaIH8RxwT7N5eR6IGXTqxhVbhDCT4uhG57W1csFsn1W2qEG4lGFed8W02o8Xhw8C7JibYIG4UyzjECanxCyE5O8iZ/VG2EwEJdCMyVwOOhQZKo/5kJzE3QYoeMOZrz6/V6+ThZAHI8LuCFfj1ekOj2//cYXsc7N9c7FsIQQFPqTJZ7J64rgBjXIi+Cnjbwv1AamUT0BBK1+DkwpDw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005Lq-PC; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003QH-O1; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:50 +0300
Message-Id: <1500556991-11471-3-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 02/23] buildhistory.bbclass: add BUILDHISTORY_FORCE_UPDATE option
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:26 -0000

Setting BUILDHISTORY_FORCE_UPDATE = "1" in local.conf forces buildhistory
updates and recipe rebuilds also when only buildhistory.bbclass changed.

This is handy when using sstate cache and modifying buildhistory to include
new data like recipe and package LICENSE fields.

By default new buildhistory data is updated when recipes are rebuild and
new fields like LICENSE are not deployed immediately.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/buildhistory.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index cc3b144..bc3145e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -42,10 +42,11 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
-# We want to avoid influencing the signatures of sstate tasks - first the function itself:
-sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
+# If BUILDHISTORY_FORCE_UPDATE is not set, we want to avoid influencing the
+# signatures of sstate tasks - first the function itself:
+sstate_install[vardepsexclude] += "${@'' if d.getVar('BUILDHISTORY_FORCE_UPDATE', True) == '1' else 'buildhistory_emit_pkghistory'}"
 # then the value added to SSTATEPOSTINSTFUNCS:
-SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
+SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "${@'' if d.getVar('BUILDHISTORY_FORCE_UPDATE', True) == '1' else '| buildhistory_emit_pkghistory'"
 
 # Similarly for our function that gets the output signatures
 SSTATEPOSTUNPACKFUNCS_append = " buildhistory_emit_outputsigs"
-- 
1.9.1


