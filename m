Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857D8E77185
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.12661.1733928469660156940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N4wftRYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725f4025e25so2761573b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928469; x=1734533269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPbysC1W8g6qiD3W7l5Qkg6SohC9W1O8ukvJXbBbfcY=;
        b=N4wftRYFNnAoGVHpVcUCD6fzRPlbCUsd0DV7FJE458X/wuo0zNyQczhQ7k1yHVZdnS
         wNtkDQSfBqOfvcqMYcodMP/mOXHp8biJ+N/JlttjMYNqX/sRXBSt1mZY3LiJ3OjyHONT
         dImUAmHqRKLHaYvEBXqsyQA+MOegKhDEjMCjL6Yb+ZgUMBjuCpLSb7U34m+V3FYZ2OLz
         1zS6N3GwniQ+b2xPLhi+UAR64P2INsicNp8qvD2QwA8+cO35EsdouEhx43Rfig0+W/Qd
         TQK3ES5bwFTjlb0AHA2M5L4Qg9fzlUXgpoh7vQ2r1LQJjQvilhyC85JSuo/mELcW09hT
         wxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928469; x=1734533269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPbysC1W8g6qiD3W7l5Qkg6SohC9W1O8ukvJXbBbfcY=;
        b=HF9VsMsWOPHMQefi4lsjzyc+qQuYeS4TE2gTlZJJU6V4DnzG2j1ztLlYbaWcttitCH
         E2exHcHT8eZfKB63xAVn2OzJUrwzK4Ufp5M1cbbG1rWP2fYkjDHHY0ApElLH/vSuDWLQ
         bO0NrqE9I0hmVeFfriRi7zrRMAo4e6NOBqc+YRAPwFuUXLBVO+wsYtXOuGEvFSUxfUBF
         JQeTeYHjc+ZeR3cg5GZ0vu0pm0divww4kQ7qefEK91xyWtDM9QlH1B5FYPNjIUlhx3Mu
         aaPR/RrYysHKxiPR2RTqmsiSlcGvePFr7X19RESB7AxBXgg0bP86jjSArOlMpy5SW7Zw
         DYXg==
X-Gm-Message-State: AOJu0Yw3bLV25FYFMZOpcS6kZWeMfDkvVs0qV2bqBfnt5ZgUG1pY0osK
	2MMpPqij3KyEU9LPLxuDZBg+cEA8QmMIvpWJSRyuPeR7mJ9l490e48LuGKF5tuofIvPH0q+uzGV
	k
X-Gm-Gg: ASbGncsLAKEoOwCUmvF40Jw5n3ScwynpUh/Eym651HtPkqZGFX6LD0W/NWItwK82diJ
	cZ7UhFGU3iCwIcr/iTfevbTZGSMzg08C2GQoOPVlJnaGndocx4ciTWDGhj5NKbvMdyV+VGBzQwL
	kW2mqGeRljANRzZTCVubxSIbXtr7oqqNmBZINXl0KtnOC8sRDf6YOi8SDbq2+U4jJaGd9VEDn+h
	jhM16rGIWbKxQfwI+LLM6XEEbn0Iz3Mtlz/wxw5BBY=
X-Google-Smtp-Source: AGHT+IHGxXT0JzipYlktB1uaOxhDZNkhExu0v51QUCyIp1QjUn6pchkiRuhvrlkmqacFs1Ii1VhCUg==
X-Received: by 2002:a05:6a20:1581:b0:1e0:d1c3:97d1 with SMTP id adf61e73a8af0-1e1c139aa67mr5795255637.29.1733928468844;
        Wed, 11 Dec 2024 06:47:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] rootfs-postcommands.bbclass: make opkg status reproducible
Date: Wed, 11 Dec 2024 06:47:34 -0800
Message-Id: <bfa9c2f15ac275fceccf22084bed9a064304eb6e.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208589

From: Peter Marko <peter.marko@siemens.com>

opkg stores the current time as Installed-Time in its status file when
installing packages to the rootfs. Make this reproducible by replacing
Installed-Time with ${REPRODUCIBLE_TIMESTAMP_ROOTFS}, which then also
matches the files' datestamps.

Based on OpenWrt's approach for the issue [1].

[1] https://github.com/openwrt/openwrt/blob/main/include/rootfs.mk#L103

(From OE-Core rev: 61a9b1b1cb618ce90ba7886036f41263075c07df)

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index f7517c66dc..83bf265a68 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -377,6 +377,10 @@ rootfs_reproducible () {
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


