Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0237C7553C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 03:51:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u16-v6so1985079pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z1HuRPz/O0stlpfEv4abXfMTVxmo5moug1UcY8zqaME=;
	b=AGwUvGJJZYbS5yAJKiA2Fd3GWJWLAxHAggfci+xtBW+uidFIQy8l97c9RD5ylZenSI
	jIk1C9/ue9Jcp55OECrI6EtHp8jJGL5FGaBpApAUjUvNd+j1B5amT/pfv1ZImC9yvQQR
	Bcmozgm2+GFJHkLz4k3IdNDb25IyD/P00GfEemKzfZL4v8+yokAG/7UL1DfuCAdMdi71
	7WXwthhtzl5apYBBZZ0d1mn1Uuydt8DjoMlMgBTjT/f9NJ0Mtu0ZU7eJnlPuAkzBRYqh
	ww5TP5Ceee89p8jXqXll8LIQmsDf9WrDOdVEo2wewPP2wRNdfYBPgbNuJMgLh+re8u0z
	CUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z1HuRPz/O0stlpfEv4abXfMTVxmo5moug1UcY8zqaME=;
	b=cYLwBdgWgJl0i3bg/1H+BLoggG+ineksZcQ93v9/B9qDs8KumhySeDuvVcf+NDLyTP
	mM70GFMHu7anEDw72k9SSYoeAQF4TBxWgmJpvahBr2pSoniKcJ0Wvt2EHGt0vLupjkiO
	yqKyf4WOo1PrcyrnwQXoodrJczNvFpMP3vxxyMQ1y6GBk8xZVDT+IbKKbVIRwzWK+bWg
	yj/Bkwc+p8mPGp0gq3xnlNrIZ13+++G+AlbSOytIueRrwehLVLS4MHBkwgbS1gbJzmK/
	JmKaOM/CrZ2/jWycJMgYGZjExQrSmbRMYrvo2izjFMrgOq7Wao+r7t4gOyH/NfJRsKaq
	E9hw==
X-Gm-Message-State: APt69E2IFt06Svu8DN+eYDWAbGQ4opKB/HVzEvYHo+OtYOwzB9Mtu9ho
	IKDmh0ZxLOI8kKdCq9L4KdBlXw==
X-Google-Smtp-Source: AAOMgpco7VP4keQyBIcspEJSwPHHthQH4O9gPfrCFhPBXpJtCzqTqmc41ELvsx20uq0lvyzqen9Wyg==
X-Received: by 2002:a63:b543:: with SMTP id u3-v6mr356466pgo.365.1530676305636;
	Tue, 03 Jul 2018 20:51:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	l15-v6sm5112684pgr.45.2018.07.03.20.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 20:51:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 20:51:45 -0700
Message-Id: <20180704035145.11316-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] libnss-nis: Limit parse skip only for target recipe on musl
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
X-List-Received-Date: Wed, 04 Jul 2018 03:51:45 -0000

on the host side we are glibc based therefore some native and nativesdk
recipes might need this package even when we target musl based systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index e0f69b02ef..47447acd6c 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -28,9 +28,4 @@ BBCLASSEXTEND += "native nativesdk"
 #
 # We will skip parsing this packagegeoup for non-glibc systems
 #
-python __anonymous () {
-    if d.getVar('TCLIBC') != "glibc":
-        raise bb.parse.SkipRecipe("incompatible with %s C library" %
-                                   d.getVar('TCLIBC'))
-}
-
+COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.18.0


