Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65CEC48286
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.8365.1706323076375080225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xs9Odgkw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so728034a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323075; x=1706927875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GJ9qHbbtMu3wNLOJaUcQQDeWpkFDvOpqqNXRpgTx20=;
        b=xs9Odgkw/rXXe0+8j7Bk4WCCdWaL8L9TrTzYB6rkNgqdNn85Inl0xs3xeNE1tJts+K
         jCM8RkOauUoh4Ig8L3AQ33TuqCB8lAs8xO8xWZMo7zVVe+iDygJbl5hsYoDSGrnM/2Rx
         q1J+13noXnPT3VIxaPZd33PSKwSRz3EvhRyMhY20fZg9xAn2YG4F1B7Wz2e0tO8D7wU9
         Od90Ippotj8e/XSXGuptE0kzekKhF6XMuRnmvMy4AC9tl+jlKYAXbJHJ70cYBczOHbyD
         iSqab30UZYgKtGtpH+klkeKcpWaQfsn2wXAvwQfQukSb/GRG7vOEMy+BHXh/bNBq9/6a
         j+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323075; x=1706927875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GJ9qHbbtMu3wNLOJaUcQQDeWpkFDvOpqqNXRpgTx20=;
        b=SotRrCb5Bv1IQoNLXY9p5rmO3fZyVj88Nwt2I9ZQHOgS3lGMeGDhLMqUPVHizR3C2s
         fMjnaUKyIYzyOc9/rdFzs3f27xIDdPDoANH7W6bd4blIBTqbHJM8XgFfM/rXUlyqZcDa
         1FNlhLZhNenByyp62kHITokx8+0cZl/MXywDXsYihzvfVbg/BNyqn6+VaXzhm5ePYODF
         fyfb1+EJZiesNFRP0KO/14Kb3W9F042Z/VJrvrj97lECbTM9sCIOdqyh3WOfQ5xjSnuW
         mf1XVOFTPld8lSQZyDkIsgge6+gcaqQQ9mWyPYSzNjNEBTzAtimQozmiLWbDnd//WuKR
         tGAg==
X-Gm-Message-State: AOJu0Yz70IfABNfGnXdVhqHfLvKZPNY3LYxyw4G9ae0b0pDxzf2d/H+q
	ReDha1ATzl+CzC3IiLyJdNMkQXCJ+hC1GX7soURBL25Shmzjhq1NzaO2T7aQ1sUcFfUMUcxGsTf
	edIVw4w==
X-Google-Smtp-Source: AGHT+IFRLwaZqIJwsl4pGkZwxErmuKtLrqw9UJCYPX0iCjeoHbKFw+5TYXIkCQgAeWS41nIUBTHvEw==
X-Received: by 2002:a05:6a21:32a0:b0:19c:74b9:9388 with SMTP id yt32-20020a056a2132a000b0019c74b99388mr574146pzb.13.1706323075463;
        Fri, 26 Jan 2024 18:37:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/23] linux-yocto/6.1: update CVE exclusions
Date: Fri, 26 Jan 2024 16:37:17 -1000
Message-Id: <8960ae115972015de0176ceb202c4996f5a03c75.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194418

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 27Dec23
        Date: Wed, 27 Dec 2023 19:47:13 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c16ed90dae1f1954b582c4fb6783fca7e3171af3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 0bf7edbce8..4183ceab04 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-03 21:24:21.156991+00:00 for version 6.1.70
+# Generated at 2024-01-11 18:31:26.124059+00:00 for version 6.1.72
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.70"
+    this_version = "6.1.72"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


