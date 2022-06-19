Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF9CC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:47 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.11833.1655667339625738286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZqYaNW8L;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id l4so8434153pgh.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wcPTENRltBKOctxxp+/M02PgQ18z3NwLJeyz7PaymoE=;
        b=ZqYaNW8LqoGuCtlG6MSSVV2nJKU1PUjetSYhdaiYqYmTeuchXwYsFOFB3Ag3nrdhqD
         S41ss8+hkerDq9R2oRd0jEOATEcgpswu9JSAyR6+L7T4eOdxccQav+JS4s/sCzTJDk5P
         BxxoATLfW/HSdRBTddGLC/ZxCeHKNQSXPPuQJyaGzEdCWSjJkuJsJMO55Wf2o2pwtocF
         TsEB0i9KFQfgCwldDu1/yurMPjW5PjNJ6WtCRMCFm0Is1iYa6L2JAVr6+JyypfF+J77y
         RbDDf5ah17EpAlOGUpzs6hQTGZho50aibZzi6VDW88UnIvv0QBlQdIjn/6vwVCELYJ4W
         aD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcPTENRltBKOctxxp+/M02PgQ18z3NwLJeyz7PaymoE=;
        b=j6qx7fl1zqfInhSgldPZ2s3BZTt4uNVzv7r27RkR2jFYHrgQ+fkhusK93gzGVYa7zJ
         DE4T04b1+OypdC9NM6swUzHYII3nTIavzwgKZH11wptt3PHOKjHwYJfOjUpUsLMd5ubr
         cpln6eE0+3wTfVC0m2H5flS5yFrTDlcrZXdRPhzrlToI8LwcUdUdQdBCNOnuTRAVsBOB
         D21RU1TgjEuul/KpFFuNcISpFF8FdfHfrCX4xvCc7N1d85dKgKRsYs2jziMcTV3F9yWP
         hJUJVV701gx6S/ewzuzrtL9BYXO6OgDQYaykUCKg7skM8UMYglky7/I2vGraTZSZw81n
         Ohdw==
X-Gm-Message-State: AJIora+Z0IenEQcdzfX3veBL/V5FXsqcSAqWdVO6RCnWVKwcdQ+LBax4
	YXAHy/m43zceJ58trZgyosvOoU+a+wbMqXlF
X-Google-Smtp-Source: 
 AGRyM1sn54QjS/dh52NN2rV78XtQLwJbLDF9xd3E462tEuanwzypOrmP9cgdLMnWarJNWgXBQA3msg==
X-Received: by 2002:a63:fc01:0:b0:403:af21:9729 with SMTP id
 j1-20020a63fc01000000b00403af219729mr18426756pgi.54.1655667338682;
        Sun, 19 Jun 2022 12:35:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] e2fsprogs: add alternatives handling of
 lsattr as well
Date: Sun, 19 Jun 2022 09:35:04 -1000
Message-Id: 
 <28090d32c88d99ea36a03f3bb723838746001e4b.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167072

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
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
index 3e6faf4cb8..b1abf6b858 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
@@ -54,6 +54,7 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+	mv ${D}${bindir}/lsattr ${D}${base_bindir}/lsattr.e2fsprogs
 
 	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 
@@ -102,10 +103,12 @@ FILES_libe2p = "${base_libdir}/libe2p.so.*"
 FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
 FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so ${bindir}/compile_et ${bindir}/mk_cmds"
 
-ALTERNATIVE_${PN} = "chattr"
+ALTERNATIVE_${PN} = "chattr lsattr"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
+ALTERNATIVE_LINK_NAME[lsattr] = "${base_bindir}/lsattr"
+ALTERNATIVE_TARGET[lsattr] = "${base_bindir}/lsattr.e2fsprogs"
 
 ALTERNATIVE_${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
-- 
2.25.1


