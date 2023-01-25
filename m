Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BDBC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:17 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.46637.1674657728352168468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EF4KzdEu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 78so13521195pgb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJLhPxiwMRQKbV+ODKRAHwAw5tlFWpuqnImEEV7T8QI=;
        b=EF4KzdEuMvndnM3F2J72+lWPh2WPjRr9MI5rgvw/Gl97lWLMTgchIp9tXnhxvywfra
         +CWK9L99we2CfSliobAAK85P93bUURj5YBZH5qeINNYLXS7TQ9uPDub/OwsjxTAMBsTq
         KRC9fXrmUr4DUq3WE/ttK9PbPlqT163mgR6l8BzMA+kgamWNvEG/HEHLdRu+EL8QksJk
         2OYzrDl4ssMz+KqH67AXLZqdKEK7f7tyF2DUKEm/2hVrHpN96olLaZWnLsGapPcF+fvY
         2YUJxavW2jlM6YYPFJRJAaxt2zxCUFn3+J1c2qloTDkTGIQDrZxBzXk5DtOcEfMxrd2s
         dOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJLhPxiwMRQKbV+ODKRAHwAw5tlFWpuqnImEEV7T8QI=;
        b=k+pcbsfIPcF6mlkKZw2TUkvBCSpj+dt2XWZzHKBZEvTMI8q9FeP6t3C+sU8AHTgWUq
         clmy/nh6XwVHkL1XcopBoNFpvH2K//Ni+ZmZDIDzUonW3nkLqs/ZoKu9Z60EP+1ZnkhD
         zB0+LGuhMgb/Qo5IjrBLz+Y0a6TeXlHGK7BDwQ4Ro9wcUPVgiDzmBarYR3RlFxuqOmHe
         Dz1pfUB6cQO6rYIGdV+9FvAko6lo1tiyKX7MaREkZAx4EFq35/XZuYqxy05V0qjJfyOS
         WVj0UwaiKwaYdsvTiWiQUgCYI5quIJlY0Ok/ZaZbXxT8EOop1QUh+F0gfbyXbTYl1kGa
         OltA==
X-Gm-Message-State: AO0yUKXo55GpHEGKRQe3foAo5m33Sq1YSOOzY3MGq0EcVzZ/ayLobLZd
	+JfRG9jbCXAw/nnwrVQr8HuRD6d1K317EjuSdyE=
X-Google-Smtp-Source: AK7set+6qo4/C55Wu9V7z1gNeERbRDoYklCrlqAbuXfwse2k90W1e5bXkBDkN//qWxDIA/uLle1cFg==
X-Received: by 2002:a62:db01:0:b0:590:630d:a8e1 with SMTP id f1-20020a62db01000000b00590630da8e1mr1424177pfg.11.1674657727397;
        Wed, 25 Jan 2023 06:42:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] cve-update-db-native: Allow to overrule the URL in a bbappend.
Date: Wed, 25 Jan 2023 04:41:44 -1000
Message-Id: <7290b3217c31cec7dd9985cbf5a003a9c368fa54.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176352

From: jan <jan.vermaete@gmail.com>

With this small patch, it's possible to overrule the public
URL with a local mirror for those without Internet access.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d903126e8bbece3a5171c3488c3deae1f0aa3ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 59e7d7dc2c..355ee2a2a3 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -19,6 +19,7 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
+NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -36,7 +37,6 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
     YEAR_START = 2002
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
@@ -76,7 +76,7 @@ python do_fetch() {
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             ph.update((float(i + 1) / total_years) * 100)
-            year_url = BASE_URL + str(year)
+            year_url = (d.getVar('NVDCVE_URL')) + str(year)
             meta_url = year_url + ".meta"
             json_url = year_url + ".json.gz"
 
-- 
2.25.1


