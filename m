Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F565C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.44244.1676990503172685682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fkR2jU7K;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id c32so2530083pgc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M73S2YPKFCP8XO4ifSY8dBTdu+FQ76yeWPOAZzFKyNo=;
        b=fkR2jU7KtLNrh3UMlTysXa9aIc85/Z05ILSEh3PErAn40/bsnv19ql6Ux88hV5zx8Q
         EHv37AALnFmtrjo9zovcRC4KEYzG7TXgEERRMJXxs6PB09BC84d1ullqmkUsTLcaImUz
         dlrvyJ16UEqDhQ13J3kEHoctza2M2T+9arIsf+xzoJruyJRmtOdlLle1FI4C85Ukd+vE
         xO1JUm9qCQ7kl1ByOPbxo2l83K3KYaYprVIeTcLXKe8hUpuCq4JKvyRw7KJkeKvYzS4/
         fWq8TykKO0H8ivxy6uKxC3NljDzYgPA2OObFuZElY2W+G6m8i1P7A7Q98EUwZTJssGYU
         iHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M73S2YPKFCP8XO4ifSY8dBTdu+FQ76yeWPOAZzFKyNo=;
        b=GqzHt+vPHNVW1622tgkQORR/cxJXuLDnIFPnCi0n785ZxPtrcdKTvcH9xnmEUw5Klz
         avlFw6BOl/IVqyq0ncdV3+PmNQCStbbvsGDqvdidtv14c/nzKWY76MrmaFLTcLZRPgBG
         RKB54lcuXlgi/3dPFCGI3h9mkGXxE/l0ugONyHV+rCw+/FnXhI58xC3qtyFDT3hp08pI
         wZMNNQ/SCvpwxmFIcdv8dTDvvvCq9vGyPrmEPWrJXSlON4s5aP+lApsiEiXHnQfaubFZ
         U/mBWH0IuhbztekmOSBDJHANMTFzAg2E2xV4SBxA+/BZpi8HMRb3hEh5aKfhxuMQwKTL
         fBWA==
X-Gm-Message-State: AO0yUKUAdcSWi4TJuWEA3314ePn1McV6x9YZvQYI08eJ8fxRryn1KE2g
	2q1w4fL4FR2U8BloBMWuNWWDJPlSrvX0CNjG+Ys=
X-Google-Smtp-Source: AK7set/STMFVypzSnM2TbxFLvawiznQNxDnO+GdBpqVvyY9GbjLqIgQBLrDqc7wJZGTGQW9z20LaBQ==
X-Received: by 2002:a62:17c1:0:b0:593:c9b6:dc5d with SMTP id 184-20020a6217c1000000b00593c9b6dc5dmr5724163pfx.0.1676990504259;
        Tue, 21 Feb 2023 06:41:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/23] devshell: Do not add scripts/git-intercept to PATH
Date: Tue, 21 Feb 2023 04:40:59 -1000
Message-Id: <70ee5f9d50bec6e708cd2006c11ef3d0bd7cab42.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177516

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The use of scripts/git-intercept was introduced in commit 3266c327df
(install/devshell: Introduce git intercept script due to fakeroot
issues) and later reverted in commit af27c81eaf (scripts: Make git
intercept global).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f6c260c8e2a33e282a35afc99de4ef8cc1791b08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/devshell.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 247d04478c..26c01c080a 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,8 +2,6 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
-PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
-
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
-- 
2.34.1


