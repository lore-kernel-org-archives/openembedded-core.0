Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32FCC00144
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.14406.1658882505898679338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=puqwMreQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p1so6293275plr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HGc2fcDoDp8gWx/b/dmbIUnXQdvZ6TA3HjJU2zbEpG8=;
        b=puqwMreQ0T1+A+HF5eHTcv/e7Wfu56mq7CeyE1p/HhEttljROYrq5Fd6vFZA24uQOw
         d+Az1DS7FyJnehv5ABvkvBWLc6cX7elmkAEB9+p+LhLhI+wt11tVQxajk8f5hBJ//2en
         lZpCSgrK9VxoKz7krD/Vyopm8TWLU1/di66AMGqC5QKvljEBoou1/JI+W7o29tSVSHAu
         1ixqlBVWqXVsKSKE/p7NoNt8sPeth898TkXrHDhoeCW5bPNxGPRGM0nElIcqYTD8nexw
         f+ZFeJNEB2qmGk4zN6MLXxWR3eUAjElWMVKzdMKtfIIp+HBt1iWOrr2ow29Bj7F9Ckj9
         qTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HGc2fcDoDp8gWx/b/dmbIUnXQdvZ6TA3HjJU2zbEpG8=;
        b=iP9aiD+PKwhWyBEpFlCx6KiL3xtsWqNCYEqD4YUkwuOHXOWm/ADscXGFGrgU1Anw+p
         C9a7nQScv+8iutiWSYzBl5oxM6lh/QTX+aIAyjj71+INXqTRi4kWCURDLboH5l5eBCvz
         h37hAWqjSW7BQpsD5l5gLRF/tQruTk6ACeJIGWlf7BTuZThHH8H6PPfy291x34arseBQ
         kkOd02SlcEO9oioU7g9WU6iY/cO1/1zacr24XEaMwtaxylxjlm3QDEGcS9cMBlFzwnTB
         QsSqSnXcq8T0gbIPgI/SJZQhRzvBMno1LaCEDrMgXMOTRo9B04nDera/1/YzS1CRbPyp
         ROqA==
X-Gm-Message-State: AJIora/cfMOdMbubQFcOIq9cmKDavEbBFX6Lnb9ivjmxJ/Dt9mobXQVT
	rJQTe1adKCYo+WlPnTXEOMuy3q82kJbQaY1d
X-Google-Smtp-Source: 
 AGRyM1u1M4gLHy1pPXYgpFsfiJ2ejCY7g9uiTxOWh6UN0fARG03Razfywq49iDsqZOvfDO8fwuB2qA==
X-Received: by 2002:a17:902:8e89:b0:16d:69b7:49b4 with SMTP id
 bg9-20020a1709028e8900b0016d69b749b4mr13826482plb.167.1658882504870;
        Tue, 26 Jul 2022 17:41:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] rootfs-postcommands.bbclass: move
 host-user-contaminated.txt to ${S}
Date: Tue, 26 Jul 2022 14:40:43 -1000
Message-Id: 
 <96215d6d45d2cae59c9e36e6a77bbbada410b259.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168535

From: Ming Liu <liu.ming50@gmail.com>

This is to ensure host-user-contaminated.txt would be removed before
do_rootfs runs, since ${S} is in cleandirs of do_rootfs, otherwise, a
host-user-contaminated.txt file that generated from previous builds
could be used which is wrong.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 54a3fd63e684d070fad962be97e549f3af7ac111)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index fc179613fb..a59d9b5878 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -305,7 +305,7 @@ rootfs_trim_schemas () {
 }
 
 rootfs_check_host_user_contaminated () {
-	contaminated="${WORKDIR}/host-user-contaminated.txt"
+	contaminated="${S}/host-user-contaminated.txt"
 	HOST_USER_UID="$(PSEUDO_UNLOAD=1 id -u)"
 	HOST_USER_GID="$(PSEUDO_UNLOAD=1 id -g)"
 
-- 
2.25.1


