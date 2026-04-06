Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E407EF4EB0
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49601.1775456853883199097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zb26hW+1;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so28347215e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456852; x=1776061652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=zb26hW+1Twrnibdxlai8wKU99tbSrhSFsHBOQO2WYwwhaiEfMbly8mT79WoQ2PUvHD
         khrzJVjMYXPTJjaa+iy8dZUFCs2/XXOUytC2HRrxwvpUTE0Kt76Uq8MrbV2IvJSBlngl
         GvjKJJ5l06CFsvIbB8Dn9b8rMyNWJc7z1V7ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456852; x=1776061652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=rdDHcDJ0Ex8rV0DSVy02A5MkEetd5naGiu/O1BdWKW54EauLDqJU7e5cy+4MEoeEXc
         VDEL7HAXi/OtuFvAFx6BhkYkvTnmPm70fUBSXdKcYR7l+f4ulHLESiXmZ/n4tzyMfGYc
         q/9A/pxiElVByZ1G7IBS9UUTFsrvRd3ExxRk3zTIt+D8ujvxg1SzCD15SlOpHsAykynr
         0nqIOwYOF2ue3baccrAh4b/GTE4TjV+ZB6D2PIUS2PDrImh9Iy2Tw/grwmYQs0LEkAvk
         QsB3oLFT+tMzb0YcBK907w4br/xlZixIR0HdxGTgVXUssZTw44thVWsbt0r8H0q7zykV
         YxJA==
X-Gm-Message-State: AOJu0Yw99BeiibDsVBHj8f8VnZ2/oMNM+tp7eai//bT2xCLyJ3GySul4
	gdIZBr10MGx74yJ5EfR6qfHsVoS92Wf2L3xQOyjtTQut2+wngNRfJgAvML2SoHnlWhJbzkRwbGo
	k47o5JmA=
X-Gm-Gg: AeBDies0LSdemwhTYWw1n54J2G4aTRrNue+2DLXqsI33TEr5fkwZT0UA4qorCkEzpxt
	d1P2ZJ5nrUcR0E2Z5m+FUaJHfoi/h5Bg/4KMW/003kwPJU7LpWytWqVYOGvgN2dlGJY2cXg3Cs5
	WmhgvwHVIoQmtmuCxvX2QLYykFhpE2iDCAqD886GfiYzWnvlgMfLqB8RhWbkyAYTD1LTq5Ok7s8
	PdYDXTEF1kugJnBrz96OuxW83LeOHfu25+WorGPpTJ61OxSwPE6tWjtguP/YlxUJJsxGgpvz/3L
	9CPhcqY9ltyvdt0qWWffMHzS799tCyDNQYR/G216XM68pacA1yz2GpXNzk20JMYEtlNU1vkdOml
	prZv9+724rwJVaIL1C8YRVHVNgzkyDvfBiuQqjkc5GLG9yQ0kFmaLAUfxmsKp43lp5oI+Sz1Vte
	lt1tJm0t4Z03qVAKbmdKbxmi5N15dGhO6yYE7ofWXwerd2RpFZvuTe//PMS7ECXT0mWSQTxZmMd
	NxE3XikZXH2LAH0ZqK9bcQeNiE=
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr166747245e9.4.1775456851861;
        Sun, 05 Apr 2026 23:27:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/18] README.OE-Core: update contributor links and add kirkstone prefix
Date: Mon,  6 Apr 2026 08:26:33 +0200
Message-ID: <2e04debcb02caa9121a8f933c59fd69666a44fd8.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234650

From: Fabien Thomas <fabien.thomas@smile.fr>

The current README points to an old Wiki page. Update this to the
Yocto documentation.

Additionally, add a helper command for git-send-email that includes
the 'kirkstone' subject prefix to ensure patches are correctly
identified by the maintainers and CI.

Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03a..8a724dd6d0a 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='kirkstone][PATCH'
 
 Mailing list:
 

