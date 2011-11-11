Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu4v-0005YU-05
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:45 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MJTiD4j0eXUzPJk/h7KtT4v3+AU/1s49U/zOFno+T4k=;
	b=uebI5mE2/upwQR+/iI4d3C80MawG7XCIMfYs+B98ZDereLavHeNMK1Hbvyim2uD5pJ
	JUJGK4CE2/clpGAwY0O9VnsSFBqXKwEvura2f0xTeXfGdZkULISPuT34hNEV0mkgn7BW
	UidyEj0A4ARw4PiZuqtIe6aY3lxAitLC0Wsq8=
Received: by 10.205.127.134 with SMTP id ha6mr8944280bkc.23.1321028969319;
	Fri, 11 Nov 2011 08:29:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm9606977bkb.8.2011.11.11.08.29.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:40 +0100
Message-Id: <22d131585e51ab5378d5859e172d6e41a76b6853.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 04/22] aspell: force ARM mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:35:45 -0000

* this is just work around for ICE, better fix would be to fix gcc
| ./common/fstream.hpp:23:9: note: the mangling of 'va_list' has changed in GCC 4.4
| modules/speller/default/typo_editdist.cpp: In function 'short int aspeller::typo_edit_distance(acommon::ParmString, acommon::ParmString, const aspeller::TypoEditDistanceInfo&)':
| modules/speller/default/typo_editdist.cpp:77:3: internal compiler error: in gen_thumb_movhi_clobber, at config/arm/arm.md:5937
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[1]: *** [modules/speller/default/typo_editdist.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/aspell-0.60.6.1-r0/aspell-0.60.6.1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/aspell/aspell_0.60.6.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index d773ee3..64611cb 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-PR = "r0"
+PR = "r1"
 PACKAGES += "libaspell libpspell libpspell-dev aspell-utils"
 
 FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
@@ -16,4 +16,5 @@ FILES_${PN} = "${bindir}/aspell"
 FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_libpspell-dev = "${libdir}/libpspell* ${bindir}/pspell-config ${includedir}/pspell"
 
+ARM_INSTRUCTION_SET = "arm"
 inherit autotools gettext
-- 
1.7.8.rc1



