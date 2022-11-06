Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA34BC43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.16778.1667744269577637068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lA0MOuPk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id c2so8900834plz.11
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X21UP0GuI8KLVDM6hgRPWcVNg23BXdTgxMldZy+7kZo=;
        b=lA0MOuPkpGZcMClv0nwJVI1+5YOw210m5Pa/lx3aV5eCa3izx9OfuvRmqdD3qCiaDX
         hZNjLWB0dsML/P0Hemn3/b8/qjsIMXCljlFg6zuoo017mpdOzoPV0/mZ/9kS5yZ3pt2H
         T6a0Q+9D/d5ljgEdpVD9MSdIK4LkpA0jTSH9dgQwW8hAosEmd1mYrylRtGIA9OJ99ymm
         qoKFpZZq7oys8xanN4SIXKD7VXtxjTZf9FsHgJ0cqPwYNLTjZ8FksL6oKJGuVZN1YLL/
         PieP3id+kBpJInNxqD26YqYKmPH3WooD2TnHV35p6S9GFsrKc01mK0/ijX2u40p3XyMu
         eN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X21UP0GuI8KLVDM6hgRPWcVNg23BXdTgxMldZy+7kZo=;
        b=YfjBr8pgZtfZxZ/xRaBupfF13E+BkbLvAd0eWv54JOV56hs5D4ftz6UDtxpctX27+0
         icLXQYwYy67Exsj6g2aKTvsrJiRGY813g71yarx2DJ/ttocFaQWR3f/uwmVZnyhio7yw
         cq6ls6Ckv8uWWXgNpbxJrekM73yYGavIq2lKZZQPdvsqklvRqf4WON+p5phfC7Ufqh5g
         CiP+4XjmBW6KWL45NLvIsjaLdryi7NjaJJHKEwiPq7ITCndb8BpruSM5WtjgRqvwBlQR
         Ax88sZydJmgYrDmxjQE/TPhOdHgU+dgnK/GxwV0NL2G/PyUw9awZuYFJ6zsqdNyL5D+R
         bEYQ==
X-Gm-Message-State: ACrzQf1aQhpAKs6YDj4RR8a9RzZ3NnvQfSu6/ouCQ45gFbtBtgQGLwYO
	uGxNlHE+T1afhPLOzhV7gT+dE1j7mZkUCtC+
X-Google-Smtp-Source: AMsMyM5ynqoQSwyrZUDJjv7iGDRwdV2wbqnMlrhxgkb/uBh2B1JPr1HnzjefJO2akCSmDaxsYKiyYQ==
X-Received: by 2002:a17:902:9689:b0:186:fb90:5758 with SMTP id n9-20020a170902968900b00186fb905758mr654066plp.115.1667744268716;
        Sun, 06 Nov 2022 06:17:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/34] zlib: do out-of-tree builds
Date: Sun,  6 Nov 2022 04:16:52 -1000
Message-Id: <2cd077f6396efd940d873c5f7f0f7614d1626ac3.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172777

From: Ross Burton <ross.burton@arm.com>

zlib supports out-of-tree builds, so do them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e8bf682e9ccf2ddce5149f01ba788ca813329221)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/zlib/zlib_1.2.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
index 2491cb941f..9ec78b95be 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -30,9 +30,12 @@ RDEPENDS:${PN}-ptest += "make"
 
 inherit ptest
 
+B = "${WORKDIR}/build"
+
 do_configure() {
-	LDCONFIG=true ./configure --prefix=${prefix} --shared --libdir=${libdir} --uname=GNU
+	LDCONFIG=true ${S}/configure --prefix=${prefix} --shared --libdir=${libdir} --uname=GNU
 }
+do_configure[cleandirs] += "${B}"
 
 do_compile() {
 	oe_runmake shared
-- 
2.25.1


