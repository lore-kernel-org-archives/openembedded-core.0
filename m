Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EDCC761A6
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16013.1678375206818307064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gfCBSa3S;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h11so2242199wrm.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zu+NoqicbxYxJmwqUBYqUenxfk0EaL/JvES7gM6DNo=;
        b=gfCBSa3SYSM9xO8iTdWM4TV9JstAdrZ9oVnUybksUXPIqaDTQ16OoQ0HgjDF8qkYjf
         jO6o30j1z8VBe2SffNPfXqurRnnYq4H4FD+v7N/KQuRNRLNHc1k2D+XTvNPPbmnADJH+
         I2VvS45duXWX8JfPH/zB+vmCaX25h40kzxlTRgN3l4gecLTO72AGThdrlwQyUnVrXrd8
         r55PRiVuaXHzxDobWMx4AaeEHkkEJiANRUUv/eZm8Get7YlrH2wS05H5gLF3XgKFWYDg
         AqpsrHeKMva1/fF67DIYOj2dIwC4bFyKjkX3Aqa/Hpa1m+WFNNGeE77ntEDdodLSkx+E
         2kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zu+NoqicbxYxJmwqUBYqUenxfk0EaL/JvES7gM6DNo=;
        b=c2f8BgESxUGaB2S6TSTk3ZmT3CbHfb1ZbX7fB8+Ml+KQ1D587QUc05h7cseaLfWaDl
         zwkD8qyBje7c1gnOdq+yzdzSmx32vAHNrutpBmRs1XT4OMI3HQvPj2YyelzgFpYdftco
         ezQjoGx2PHEYY0GFU5XfCbL56HSlW7CGt491nqVVioBV/78JM+Oiuz5BYFvceAxZOeSe
         QnEfWPBBj04xYJDdOCYq6pZkU4ee2igquv4mpDa1vMk/g6C1i12FS8v4xN8J/XspiFvq
         jWHFryECLb2pq6T8FI94VJopB7ajJxCsK17j0UZIaohvfpUxWPhXhKZX/+4MXyZiu20N
         BvYw==
X-Gm-Message-State: AO0yUKWBgogOH0TU65gAseaCZAfubweGlBWhshfoHuThc0isOL9kv6To
	P7uwguT/5e9somdRBT31YUdPVJjSznw=
X-Google-Smtp-Source: AK7set8anX/Cyoj4aOLOwv/JHkOzD8mM4vP8I1ooipIDsUdkZZg4/UwDUu4v5qEZbNDC3RAO1oIfGA==
X-Received: by 2002:a5d:5492:0:b0:2c5:96a5:5b83 with SMTP id h18-20020a5d5492000000b002c596a55b83mr14943870wrv.26.1678375212308;
        Thu, 09 Mar 2023 07:20:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/26] sqlite3: update 3.40.1 -> 3.41.0
Date: Thu,  9 Mar 2023 16:19:47 +0100
Message-Id: <20230309151958.3619193-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178239

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.40.1.bb => sqlite3_3.41.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.40.1.bb => sqlite3_3.41.0.bb} (77%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.40.1.bb b/meta/recipes-support/sqlite/sqlite3_3.41.0.bb
similarity index 77%
rename from meta/recipes-support/sqlite/sqlite3_3.40.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.41.0.bb
index c9b6ca1c5f..f17c15e258 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.40.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.41.0.bb
@@ -3,8 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9"
+SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "49f77ac53fd9aa5d7395f2499cb816410e5621984a121b858ccca05310b05c70"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


