Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CCDCD11DC
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.49403.1710951035354755053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gPm5WzxX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e00896dfdcso25668795ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951034; x=1711555834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr+O2YIgOlFtrXaw/ZAn1Psu8p113nEC3v0V67LqiIo=;
        b=gPm5WzxXLzODTvyb8MwViUSA+XFRz5d/LoN49HYoXt1Xufp5UJyT/lOFK9X4koAM3x
         sB+ilffyTtgwh3LSFT52t7RDxXKn1ZEvgRKuHgse33MeJwJ9VIgOpvlTA23VVaoaxwHP
         AuMAc9BfsbGf41ShlFSTQzNv3yC80W2U1cJh5Pb1/vvahEnKN2dxvFo1Sz3MIaRWYSQJ
         kxVsP28T/yVZlYPnMlPpRW3y5h2T6lvxNxoWa9kGlbTYr7eLqE0auARxGDcssYMU0Buj
         shx/do6Y4pzvdXc1ZgPK9m3CQLlz09BAhAL0g7CTIgcYN5WqnPzUhw4kJi405YFeHOvB
         4dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951034; x=1711555834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr+O2YIgOlFtrXaw/ZAn1Psu8p113nEC3v0V67LqiIo=;
        b=wa7dctbhr2ILmR1q4jWMABc+i3jMFan2lkfvoRXzRJsyOd8sSKVJVgoHn2M0utgqVy
         +yzfYU01FjRVPUB+a4e8mnFB80crhUA7u5cyxg5jBluuOjRGVb/zihqNcBcZHHjwswc/
         r81+iGe0aKsnCYNvxUBbHAUxhbcpZfkoj6oat9XYjSgAXlYLSGDYJyuZ3ZP2wKaOuZx8
         /hfbBmkf/BNnpLjPv9LeGFBx03VaXSF6W9Tcm43AudQkrsVhJBWp5cnheKRkl321nR8i
         iUpmfXktlt14B9FqMRI2phQ3/M5iE6LCPLhzOmQG8JnwAUTrTX40NZoCYha5Kcqq+Miq
         m1rg==
X-Gm-Message-State: AOJu0YwMXo6V/Aaqv6spBfTy+/whElCRXHnk7pchpsfpkVWdcvRMr7JK
	01edYGvEytnve1VPDdi0YMKxW2KLSHLGpHtGgPot4zeXlrNBrSx4Waw3upko5dKgHb4+LZQmrYN
	0Gfo=
X-Google-Smtp-Source: AGHT+IFiqUNQKmbBdJZUdu7kk0lqZ7zXQgGCyk2+WOii/MXeE13tExaJkm9AleVb3YIhpLXlg1x9mg==
X-Received: by 2002:a17:902:b70e:b0:1dd:de1a:bd02 with SMTP id d14-20020a170902b70e00b001ddde1abd02mr5300975pls.41.1710951034566;
        Wed, 20 Mar 2024 09:10:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] cve-update-nvd2-native: Remove rejected CVE from database
Date: Wed, 20 Mar 2024 06:09:47 -1000
Message-Id: <717f0df5f35272f7706e4f92cc8b57cdda8066b6.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197380

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is updated to be rejected, matching database entries must be
removed. Otherwise:
* an incremental update is not equivalent the to an initial download.
* rejected CVEs might still appear as Unpatched in cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f276a980b8930b98e6c8f0e1a865d77dfcfe5085)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 0044529b7d..1a3eeba6d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -323,6 +323,10 @@ def update_db(conn, elt):
     accessVector = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
+        c = conn.cursor()
+        c.execute("delete from PRODUCTS where ID = ?;", [cveId])
+        c.execute("delete from NVD where ID = ?;", [cveId])
+        c.close()
         return
     cveDesc = ""
     for desc in elt['cve']['descriptions']:
-- 
2.34.1


