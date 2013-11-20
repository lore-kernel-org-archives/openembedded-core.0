Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D0F5761957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:41:34 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id fb10so3345751wid.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PctQOWwJxetyaVz1sC9kY1Xp/ZhjdF7G6/hbaP+/2iE=;
	b=a/aav0MH8LNSsFfiIJxjYd8/+pxvujQodpi2jtP3ovN8LBUTdTeyeYSkbW+aXwpXX4
	M5z/isKEAvRrbk88Dyn+BEPkjF/9RNug1sRI2l02Ud8kzy9RbhCQ/8Q8BPP+3TRvM+V5
	cwcXgiSL0/nV48ji4g6hlngz8eSgwcnHBVuf2Vl13rgWVN1lYe2ejJromWU9pYbAfDRJ
	OvBtfdLO4bArRe5ZHY5nGZ5e1AyAmFmjenIpY3lNdP1kdMWr65czCALWlLnpMrhn80Vk
	PdBIHxzzdkMPZkc+gdiMy3ZZwI8MoapzOTcVTR//xjRRe2NQjfVcKz22s2FIQ+F6Ajpu
	BMEQ==
X-Received: by 10.180.89.1 with SMTP id bk1mr2051666wib.17.1384965696281;
	Wed, 20 Nov 2013 08:41:36 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id w20sm9706956wia.5.2013.11.20.08.41.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:41:35 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 16:41:09 +0000
Message-Id: <1384965670-23435-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
References: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH RFC 2/3] opkg: Add PACKAGECONFIG options
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
X-List-Received-Date: Wed, 20 Nov 2013 16:41:35 -0000

Instead of hardcoding EXTRA_OECONF to disable things, we add PACKAGECONFIG
options for gpg, curl, ssl-curl, openssl, sha256 and pathfinder. By default all
these options are disabled.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index fb99fb5..d16b8c2 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -27,15 +27,18 @@ python () {
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
 
-SHARED_EXTRA_OECONF = "\
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
+PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
+
+EXTRA_OECONF = "\
   --with-opkglibdir=${OPKGLIBDIR} \
-  --disable-gpg \
-  --disable-curl \
-  --disable-openssl \
 "
-EXTRA_OECONF_class-target = "${SHARED_EXTRA_OECONF} --disable-ssl-curl --disable-sha256"
-EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF}"
-EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF}"
 
 PROVIDES += "virtual/update-alternatives"
 RPROVIDES_update-alternatives-cworth += "update-alternatives"
-- 
1.8.4.2


