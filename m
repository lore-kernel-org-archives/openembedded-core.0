Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F9EC43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.22258.1655667083280819903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I8x87Gpg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id p5so2635804pjt.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B7lqG8KrwNpiotBJA3O3maITwfMivGhPBnK/ptalsdA=;
        b=I8x87Gpg/PRzvNYoqRn+wtw+lE0IKT7yy9yhv/6hLey8pP4gryvyRjhClgpGUWQNQI
         JUvvlcujIMAZoFsSnCtIKJvU6hyHMSUvrj3j6JNgjfkHZcyKGf4uUgkijMkpOuTpJkbO
         sG7z1FsWqBMFcoDYC0ENEnPGLwB0ESE7SJJbtv2tB6gJzIGJsYzQE3gzz27cHshvAv/W
         vZWW6rVl4S2dkidiKWO/aEFTLm59HUJeTqKJjuQHWBgQ6xv4yPppLAxvS4hp5UOJg3Mu
         tUaThNglZIY3407UqdQ5E9YzzuBP6q49R9PYWBq+ERr6cwhqhbt8JFIJMjkhcg0ck21q
         OH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7lqG8KrwNpiotBJA3O3maITwfMivGhPBnK/ptalsdA=;
        b=xNKqoDKBbCcxCHILJltVdfZOD3D6/mHdSx32gGeW/X6ON4ZCnETTuIYof/QKTZk1gf
         xtYoBUwP5Fvs46h8Av21gMA0mAir1wUt7WP/KRfMxavVv8PQe4bEHvDBBIY8pNLqPiX3
         23yybN7vpQ+40qumVjL2msqkB8tL7mHG2CpmQ0W7L6LiFGjepYRib8swRhinT7BDGM8i
         yZLO/ucgwqn6SNLQ4CyY5ajfG4y4tn/LD+/yZTFPfkGvjvDReuea1grGphwQubjQ8qS3
         5piclBnyo1/2Jz4V/CgfLFTfx0HtL3Ij51SMkYDMthg5j0kaipQPz9wbJWvsedWHRRkh
         g2Sg==
X-Gm-Message-State: AJIora9KjNbQIPr9VOiIUEODaCXyCDQLp6XT9f9gM30nIgSzTQxzkiGJ
	+ie7An2Uwq+r1EIaZrjBmHHGBS2YlBtwh+Ro
X-Google-Smtp-Source: 
 AGRyM1vaUwI1O2Qx+kgYP2L8/UZe5PdvGuOyvpjL3z0YYqssiwv1Oe5Smo9H4RGqdhSqc7MGSgD4cw==
X-Received: by 2002:a17:90b:354:b0:1ec:a915:c77a with SMTP id
 fh20-20020a17090b035400b001eca915c77amr1393677pjb.78.1655667082259;
        Sun, 19 Jun 2022 12:31:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] e2fsprogs: add alternatives handling of
 lsattr as well
Date: Sun, 19 Jun 2022 09:30:44 -1000
Message-Id: 
 <8876f33f08e07480c93803c19b517b2bed4dfe4c.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167055

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building busybox with CONFIG_LSATTR=y and installing that in the same
filesystem as e2fsprogs breaks:

  ERROR: ... do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
  then please place them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

Fix that by also alternatifying lsattr just as chattr already is.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96703961eeb3460e9da26503d7942cc965d1e573)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index ec48f419c7..5b2d1921f0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -51,6 +51,7 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+	mv ${D}${bindir}/lsattr ${D}${base_bindir}/lsattr.e2fsprogs
 
 	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 
@@ -99,10 +100,12 @@ FILES:libe2p = "${base_libdir}/libe2p.so.*"
 FILES:libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
 FILES:${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so ${bindir}/compile_et ${bindir}/mk_cmds"
 
-ALTERNATIVE:${PN} = "chattr"
+ALTERNATIVE:${PN} = "chattr lsattr"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
+ALTERNATIVE_LINK_NAME[lsattr] = "${base_bindir}/lsattr"
+ALTERNATIVE_TARGET[lsattr] = "${base_bindir}/lsattr.e2fsprogs"
 
 ALTERNATIVE:${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
-- 
2.25.1


