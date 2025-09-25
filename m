Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87217CAC5B7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.12039.1758807678298733160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2zdmU3TU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so1820186a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807677; x=1759412477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7pkxzusthR6yqrv4bfxBodfzgClvmsQyFGohvciky8=;
        b=2zdmU3TU82oz0SKNC06FrLhqUN4raRpZGdbpG9AFqe3rETgenBe1eaaV6b6Bik1X9C
         IXvm3G8QftsPwRf5J1ze7ZPu9y2hsAZImr1N/2DqM7+2/LmQ4QfaFXxr6o/vKmkpoPDo
         u/ThC62blKmMXzp6UwXsZcGbg4Kcq6s4c4/g2rmB2GYKFCELTKPR1Y3a7jumgst3zUr2
         /sB4Va9cSi5OjK1t/vIKMULowInyjxU0z2+2tZvvR1R1Q3IJ2TSXL+uZBhZ86KEEpMjA
         YaO0C/WvE11fWqVDMfjBzv+WGaldOdk87be94nBN7KIoGKffsK5pl6Tq8Waik5zw2c2y
         Rfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807677; x=1759412477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7pkxzusthR6yqrv4bfxBodfzgClvmsQyFGohvciky8=;
        b=kAgtjWqSugdu7y9LBuhT6gskptamqcJyGaurnrQulcXr8FsQJGgwMozeYPDjKmWzjM
         CKi/kiYMrZT8aIT0lCaXT43wlRN6x6TxBmhGhVy40DUQ3GPO2PJqwwJSGqUBQP4yikxm
         0kKxPv5LRJOipHIeCPdH+piwwq/P62miwvOqBInLbMG77EPaEumF49RZl7FOmK0Scdqe
         FCN6KOuHhp5YWT5HbUmqTiaON3MMXlMlVsNN4ZQDN63yWZS4tbSv6oO0fyFNrxDlX3Qm
         C8qrxAi5A8huFT/T7X+zaUvfHx7Bimdz0O5jHfJK9B1l0uaZcITY7cSMr8RwC0/g+TI3
         mzDA==
X-Gm-Message-State: AOJu0YzKQUK/LQb9Svv4EnI36Q4cRgGYxlWYIYLQapLvOjhmx7Lr4uw6
	KEx5ysTXERUmn1gnPDVr9OIv+OR6dHb5o3uzdsnJ9J5QHRvyiLVjbG17JceiqOxl8Nz0AqZnJVd
	HMAqY
X-Gm-Gg: ASbGncvWMDZcMRHLljIU1jRjHDgxLXhZPQ9m6cVH7lWUqcPC5rIwFiYTq1qPstjbHJv
	S6G15LFZXM1QsvRX1kQdEDLMs/xTUyWG3Phz/pjtU+A1WmX1yNOOoV+qS9ijtOrjhobqsmR8eRP
	WI9gDJXilFZAG91qXFUHtSciAS5i6htYtlDPcSXesaZT1fdeknZ49NE+NYbjnNfbmA8As0pj6jD
	/cPRqxwLRhHlOMjzUE3ZzFoEJmCRFPORdl8mofMONMOaCmq+6ScRiv6lM9KejQTsIykh5yR+xX2
	QOCurjXRrhHKBUtzziz2U70a5ZvGDlAjNWF2/qWjhY3KNM2bYqFBuwfxexY/OuAb4AJ3KimEq+8
	98jUWYEwd1WxCSQ==
X-Google-Smtp-Source: AGHT+IGsmjeWCI0GY71dQJiFIpMgZjvUzrcWkxE9Vr7h/iSF8H3HVMVtWnVyGrSUnUMwvfwfaPB5Vw==
X-Received: by 2002:a17:90b:3911:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33456c715d0mr2854375a91.18.1758807677079;
        Thu, 25 Sep 2025 06:41:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] p11-kit: backport fix for handle USE_NLS from master
Date: Thu, 25 Sep 2025 06:40:53 -0700
Message-ID: <96602ea67463170c4cadf748525f5615ce9bbd91.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224027

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Disable NLS in the build when USE_NLS is off.

(From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)

This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
from master .
Since the p11-kit version are different between master & scarthgap
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 2ede38deba..5921a46c88 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \
-- 
2.43.0


