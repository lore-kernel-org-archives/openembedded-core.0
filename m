Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA7EC4708E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.32110.1671380014508243184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=46nHmkCO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d7so6849829pll.9
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5OfujpiMYfcfsJu0Fby1C5lx1tAxT0nk6o8jUabjZI=;
        b=46nHmkCO8U1Ohch1b+zloyh7AS4rKaQlB2esuJq2awepXQY2ha28geI39a2Lr3Z3MC
         dYFoXxz/6q33gG2qsQ2bumkXAMVSbcOjAELPVl7g+ybHzLbVN3t7+l5VHTi6gg4obdJA
         lDrv/bz/TbqoFvn0dQ/UubOqIwfONCvFcn3pOsKYZcgbHqXilGL+y7yP6EJdcervKfmH
         Z5/upVccZUV3F5HQ2baiA5qK1sNJ2DDh9xgeBVSylIyzH+5lOO03eA62dPOY2X/foSyM
         rtJatuakyhVeSU9tzxXp+2723cJvDNAY29n+oIQ5qXtCjj2bSphn8KkfD02Bc29XZ7bB
         i9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5OfujpiMYfcfsJu0Fby1C5lx1tAxT0nk6o8jUabjZI=;
        b=Nsp2Bro0QE+xDcVoTpOroi1bYxwHBP9LOypeovSOLxsqaBedZy6eFrOAVfS1kMB++y
         JJNxnsi4+yeonZe9U06DcxShuQeBvaKoWim0UjgA7kBseG2EfMq7RRREP29WzxFQ8dzY
         6LKJiNKusppzKtAgVAjDSF/GwnYQs/TgjsnkaG2i7ZFW9lRlyzi+MwSGcORWQP65tzo9
         7juOVjGtEaM47ewcGf7q2VEssXdHne/cNt8nUCq1MPEkgfNxe1OnELFjIXHBheMPkh4M
         cFM4RLtPjShJmUrvCfM4I8DtvEEh1rTCVLL/MqGYyrNKVhUXhSxAEJ0IbUOFGNTm2pIs
         AwpQ==
X-Gm-Message-State: ANoB5plFaJHhxrgvudM0Y8wXEbreW2W1OlHp0JajEVvF7P5FtmMFDlml
	/z94q4ySIbjkRl4Vw84IC/uv74xsdo39yJY8tO4=
X-Google-Smtp-Source: AA0mqf78UeTbwREiWmNWCCM4OchVLeH82dqNoOztr5RsMmMcGj+GgbKCHu719emuO8Tp+VQ63Lf+0Q==
X-Received: by 2002:a17:903:2655:b0:189:d072:18f0 with SMTP id je21-20020a170903265500b00189d07218f0mr37201695plb.25.1671380013608;
        Sun, 18 Dec 2022 08:13:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/19] lsof: add update-alternatives logic
Date: Sun, 18 Dec 2022 06:12:54 -1000
Message-Id: <750f4e17f63cf957076c13c53139ddaab1617597.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174797

From: Alex Stewart <alex.stewart@ni.com>

Some distributions (NI LinuxRT) provide both busybox-lsof and
full-featured lsof implementations. When users install the full-featured
lsof package, the full-binary fails to replace the bbox-binary in PATH,
because `lsof` contains no update-alternatives logic.

Inherit the update-alternatives bbclass and assert that the
full-featured lsof package has higher priority than the busybox
implementation.

Co-Authored-By: Kyle Roeschley <kyle.roeschley@ni.com>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e2893fa692a6e91eee09fc04c8c03fe27c718a58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsof/lsof_4.94.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.94.0.bb b/meta/recipes-extended/lsof/lsof_4.94.0.bb
index c2b8bc839b..62f42975af 100644
--- a/meta/recipes-extended/lsof/lsof_4.94.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.94.0.bb
@@ -19,6 +19,15 @@ SRCREV = "005e014e1abdadb2493d8b3ce87b37a2c0a2351d"
 
 S = "${WORKDIR}/git"
 
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "lsof"
+ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
+# Make our priority higher than busybox
+ALTERNATIVE_PRIORITY = "100"
+
+
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
-- 
2.25.1


