Return-Path: <kergoth@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id A588C610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:50:23 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so792116eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9S0uxs/KayBTCC9sAT6WD9Y6I1jgTdgjI7LL9h4E58Q=;
	b=Aqdy+rTr2HGi9M7Cp3mLAoVkKSR0HiZFmycPGPVZvBEjtuFZ7lNS0T/Acblmuabqa2
	0l2ZTrsQODsttkRcIAEKYXkfbpmY58m2sB00RhH5MDGDZFDVmtIqpXO3tV262cELfO8k
	Ma40x2QVN3KRs5O6N7uZmyY6gHlypj2q1+4RAb98TTGSRbOMhfI/gVOTDltL2/RqbBV9
	bsCmLaMjSl9FmWf9zWWOtncusVeWG5/E0Btrdi2xy62ytQNBPJNPKnkqEj+x2i6haCBJ
	Rt2iJsFCWZLrLfs9gGCl8mo3wtNatr/NvscChKRsMzGv4ek7hA57QQrZQl/vYeusim0J
	RM1Q==
X-Received: by 10.14.179.130 with SMTP id h2mr3447379eem.34.1386946223074;
	Fri, 13 Dec 2013 06:50:23 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id o47sm7527284eem.21.2013.12.13.06.50.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:50:22 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:50:10 -0700
Message-Id: <10eb206333bee0d33122a2a3a0875c6a32ce4883.1386946076.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] libdrm: use RRECOMMENDS for libdrm-drivers
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
X-List-Received-Date: Fri, 13 Dec 2013 14:50:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

As libdrm enables modules automatically, based on what it needs / can build,
it's unlikely we'll *ever* get a situation where all the modules are emitted,
so libdrm-drivers, which depends on all of them, ends up being useless and
non-installable. Make it use rrecommends, so it only pulls in what we have.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-graphics/drm/libdrm.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 497220f..1b2ffeb 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -27,8 +27,8 @@ ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
              ${PN}-intel ${PN}-exynos ${PN}-kms"
 
-RDEPENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                          ${PN}-exynos"
+RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                             ${PN}-exynos"
 
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
 FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
-- 
1.8.3.4


