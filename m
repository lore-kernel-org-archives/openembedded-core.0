Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF34755C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 07:13:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id EA733207F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:12 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 15 Feb 2017 02:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=ppvc9/IWD4h5LH1taImB0NJFApk=; b=HE1MO
	eHrmpVCn3VQKghLvqbm0QAwgc3z3a2m10K0w6AH/aoDS95RYxTLUojB+vhgR/k/k
	jdHstfsAFgsYGJibhqHNM9s4sxczthjqjLwnu5CB4ur0hkowDeTkUhODUvHh9aH0
	h5zyS0mzYLWtBLf8wBjeR9VGJK41ntyUs11N+0=
X-ME-Sender: <xms:iP-jWJbsMBKihzZX89zzUa2u-osh5QI9nAXGjTlfG7G6et8M2Pwsyw>
X-Sasl-enc: 90eSHyoCUIuUVYfcv2FqFab3cHP4EU+OWH34WXGz/fmb 1487142792
Received: from localhost.localdomain (unknown [192.40.95.8])
	by mail.messagingengine.com (Postfix) with ESMTPA id 715D77E0CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:12 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 09:13:03 +0200
Message-Id: <20170215071303.3244-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215071303.3244-1-tanuk@iki.fi>
References: <20170215071303.3244-1-tanuk@iki.fi>
Subject: [PATCH 3/3] alsa-lib: merge alsa-conf-base into alsa-conf
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
X-List-Received-Date: Wed, 15 Feb 2017 07:13:12 -0000

As far as I can see, there's no benefit in having separate alsa-conf and
alsa-conf-base packages. libasound depended on both, so it was not
really possible to only install alsa-conf-base.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index 34a7d8802e..191a0367de 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -25,18 +25,12 @@ EXTRA_OECONF += "--disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
+PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-conf-base = "\
-${datadir}/alsa/alsa.conf \
-${datadir}/alsa/cards/aliases.conf \
-${datadir}/alsa/pcm/default.conf \
-${datadir}/alsa/pcm/dmix.conf \
-${datadir}/alsa/pcm/dsnoop.conf"
 
-RDEPENDS_libasound = "alsa-conf-base alsa-conf"
+RDEPENDS_libasound = "alsa-conf"
 
 # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
 # alsa-lib package doesn't exist. libasound is the real library package.
@@ -46,3 +40,7 @@ RDEPENDS_${PN}-dev = "libasound"
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
 RCONFLICTS_${PN}-dev = "alsa-dev"
+
+RPROVIDES_alsa-conf = "alsa-conf-base"
+RREPLACES_alsa-conf = "alsa-conf-base"
+RCONFLICTS_alsa-conf = "alsa-conf-base"
-- 
2.11.0


