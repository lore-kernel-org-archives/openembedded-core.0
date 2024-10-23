Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C9ACF5384
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7699.1729686921545385188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xUBS2Dcl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cbca51687so66259055ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686921; x=1730291721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwHANkg+/AKNAbqmNyaZ1upVuNY4lRhpwrCYjr5MFeA=;
        b=xUBS2DclT96HAhBmnY4RegvbYMiZtPj2vXAeS+OV/CCa0O/Q7PwaFnzqca8vpKYSOR
         bk0Yu1xBt7m8kHXS2IyYPHsY6+AwWiBDXzdsziBGNFfk0ZTBpIvXivADad+88q7GWNVv
         End9eY8LuBfmbX5ANBkLPPUNgpT9fAIkiLDExeekfcsEROc28y28AVhTrDZPiOIfdGVb
         nfIZivgj62/OQuxR6+u85WTgm+srEmcB0Ah1B3dKXdCAqoFeHITL6QGw8lo4G5OX5EX1
         MBSv2w9ighyTPWgaR6q2Q2h4AENGauloqKe/ChLbWpmitFvA5wlJ8zeBIKXu740vzsNb
         UrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686921; x=1730291721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwHANkg+/AKNAbqmNyaZ1upVuNY4lRhpwrCYjr5MFeA=;
        b=O5w6kdt76cpbERPG40G6CmzJnpExJU3Y5TiShv+u+k+GX79VKqrX+A/mhePfyUCNAL
         ST3ePdKVuaMGODu69RszTC4nboxI8BEQiQRcaNHas66tSUdGOCO9nmqjIHP8IBImxhEp
         3IgLvE5Raxrq431DY9e67Qskg+hvR8uIRqpLVyrZu/9qo0dJgzI3iBbnV5YG6ZFN7mSE
         nuiXbApOc+MvPnAi54BiSg0tVndd7qn/IgcHwhZiGPsLWo/qr5py9n2LBz3hiDRKcLGu
         IokK+e8MVeb7w2QknQ2XOLxv9JDR9Mr29gXMFmfkW1G9BR6sM0PJbzla6VfFB+JQT/fo
         TiaA==
X-Gm-Message-State: AOJu0YxZZJdYZfJHXxIwXI8ndddl73OwCXeVedwnzbt0drb05uYQxqLc
	fm2RzPLpNLtNRaeSdDS6eNnXEV6GC/sqdc3BTG1Tzqa3KRficth5/KkOD4PAfgYYex0s4WSmZa0
	l
X-Google-Smtp-Source: AGHT+IFabfXJBmrg7RqO01GlmKlKBTkzib6cWvZH8ZsZQrO/U6TWF53bRASwYoFio1Y7Ut0qfzDORg==
X-Received: by 2002:a17:902:c944:b0:20e:5777:1b81 with SMTP id d9443c01a7336-20fa9eb5b58mr22612475ad.50.1729686920871;
        Wed, 23 Oct 2024 05:35:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 23/27] rootfs-postcommands.bbclass: make opkg status reproducible
Date: Wed, 23 Oct 2024 05:34:31 -0700
Message-Id: <80b279f18230208c6cc258ddf6a6e6dd3f8c9d79.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206234

From: Jonas Gorski <jonas.gorski@bisdn.de>

opkg stores the current time as Installed-Time in its status file when
installing packages to the rootfs. Make this reproducible by replacing
Installed-Time with ${REPRODUCIBLE_TIMESTAMP_ROOTFS}, which then also
matches the files' datestamps.

Based on OpenWrt's approach for the issue [1].

[1] https://github.com/openwrt/openwrt/blob/main/include/rootfs.mk#L103

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61a9b1b1cb618ce90ba7886036f41263075c07df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 920da94ba2..5f4d67f93c 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -487,6 +487,10 @@ rootfs_reproducible () {
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
 			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
 		fi
+
+		if [ -f ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status ]; then
+			sed -i 's/^Installed-Time: .*/Installed-Time: ${REPRODUCIBLE_TIMESTAMP_ROOTFS}/' ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status
+		fi
 	fi
 }
 
-- 
2.34.1


