Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C26C43217
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:58:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.6179.1640012296044955012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=doIieEnI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id s1so20735049wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dENzQ9jil4mX6RoDKfvs6fQx4KXGQa12o5Mc4hmvyFE=;
        b=doIieEnICmIvH9VgFFPCKvDfxdlqVygfrMqm4EgV2q0InUcrKD9xJvCW1/w2UwC0kh
         wH2vB4iYK7Jk7yXmUBOMXpmIGpCjUTv78ESrqQ2Dhs27LSvBxcUeDs4ZgXuKfkMgTeBP
         b1eXX4t6yTiAi61qHXFkoM7aYPxCTmb0OnZ1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dENzQ9jil4mX6RoDKfvs6fQx4KXGQa12o5Mc4hmvyFE=;
        b=IxM5a6G2uxeSSAZbNTjfkhNLptj18n9G4WcXRqAMzMfEUloJ3Fti/LbMvS2JWOh6YS
         Tv/ko9s+Pdgcmsc4vuTjdATFH2Ogite176c4/c6wrOdrsgQmPW4XjSrFQs589p8XYgb4
         3cFm6+DFrK75cBMxz7UlK+mFJIakkjyTieftVkEsIb8vPb700+2ouFEYciPDATM1K40U
         LfBkuJIPF+RwoukFbciJrYi9Ah0ZnlmeunU3YdXJNMHKNwyZI1v2XYWt4h+wMX+tt6bF
         4peXyKTGlWplP/sD3k9yLEG+Ufl2sb2gfoF2aeruimI1NDFcJAJ8nIWkR9Lfdsu8w6mM
         FRuA==
X-Gm-Message-State: AOAM530YgtV1QsHeb96bJjgs/hMzwpE2N/gPWJB/1ZQWM1jb/5fWaS5Y
	B3TvoRLM7sSbh+Zho3M7xlg3jbl+zLNQ0w==
X-Google-Smtp-Source: 
 ABdhPJyti+KSUFNrMYWwmNF6+Xo0naNhvFWV9/vIv1iInh/+55iX4vVP62+OFsWySlHin02TWpbRww==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr2495352wry.71.1640012294281;
        Mon, 20 Dec 2021 06:58:14 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b])
        by smtp.gmail.com with ESMTPSA id
 i4sm2950893wmd.34.2021.12.20.06.58.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 06:58:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] manpages: Fix override/append ordering and hence task
 signatures
Date: Mon, 20 Dec 2021 14:58:13 +0000
Message-Id: <20211220145813.958648-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 14:58:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159869

The append/override ordering was meaning that whilst the data was being picked
up later in the package processing, it wasn't being picked up by do_package.
This means changes to qemu options were not causing task signatures to change.
Fix the variable ordering with the append to correct this.

The whitespace fix is deliberate to cause output to change and hopefully avoid
hash invalidation issues from unchanged output.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/manpages.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index 64b7d8c4222..5e09c77fe6f 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -12,13 +12,14 @@ MAN_PKG ?= "${PN}-doc"
 # only add man-db to RDEPENDS when manual files are built and installed
 RDEPENDS:${MAN_PKG} += "${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'man-db', '', d)}"
 
-pkg_postinst:append:${MAN_PKG} () {
+pkg_postinst:${MAN_PKG}:append () {
 	# only update manual page index caches when manual files are built and installed
 	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
 		if test -n "$D"; then
-			if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+			if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
 				sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf | ${@qemu_run_binary(d, '$D', '${bindir}/mandb')} -C - -u -q $D${mandir}
 				chown -R root:root $D${mandir}
+
 				mkdir -p $D${localstatedir}/cache/man
 				cd $D${mandir}
 				find . -name index.db | while read index; do
@@ -36,7 +37,7 @@ pkg_postinst:append:${MAN_PKG} () {
 	fi
 }
 
-pkg_postrm:append:${MAN_PKG} () {
+pkg_postrm:${MAN_PKG}:append () {
 	# only update manual page index caches when manual files are built and installed
 	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
 		mandb -q
-- 
2.32.0


