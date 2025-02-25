Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DE3C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:01:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.8481.1740492091292195968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RzmkyqB7;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-221050f3f00so126992525ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740492090; x=1741096890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdc4zn9k2xnWyvdkMuEoMz1zo8eweErtZfdYqyKY5m0=;
        b=RzmkyqB7VaCMhbvQyiTzIipPXLSO3AUExVPvBdmayppjQ3fqeGnlai0oSx+YVZZrYD
         wMJsnD89/j1rI6P4clDahBWH2WjnbgA4vjZgWRuvLABthztZ02YU3R60dDcPD+xgFJRZ
         4C5mT2NCwHfKpXYVLXTHCe5zS4z72vHGZ2omM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492090; x=1741096890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdc4zn9k2xnWyvdkMuEoMz1zo8eweErtZfdYqyKY5m0=;
        b=phmNwSQLhJ4sPaCbBS7raVzzFvAhCjpRnRDKgUYvBKbxBSBGairQybzr+jJN2zTqKv
         DwUKs9fQnNvh7Th5JxRo+K08MiR/odyqGTZyzgk6YfZVAU/SuY+mG9jhMcErx6VDsX+e
         mmtHaTjKNvUntDuqcIxoQtzNy6VUJzhlOOXjc6DopqfA5nssGBMWrh8VlTrexsxHcqk9
         Ekp14GXfh32+AgkBaW/B2mfDaGVnDf5TlDtNZ5eZKDR9cYlmGGWWSp1Ab5YrM9a88fQv
         khWyNU2hJpMmk5UdEJoP9qUHSjcKVWbPRs114DMLgiIffTtf7cVYouEXxNRNuNkgHlN/
         2bmQ==
X-Gm-Message-State: AOJu0YxJc1K2PaIscbxDESqoqvz7Ou0cRKgYDTgDY8YZt2AjAQUaVNU+
	1uYWNIFgzK5Y4V+a2Wb8c0D16M0Cokn0nQJOhiGLn+G36Ih4XJ6sxjXZ38Ol1bMf3f1BAeygdwe
	p46w=
X-Gm-Gg: ASbGncvILm1+G5NT+zubTda5JZHMGkBXT6LPOEbbUoekBfCP62JtB3Dz8OVNNE4G0Jv
	ATghgLnR9z40pmZ87F/pRdWx5tC82SaTrF9VJX955UVDQco2PVjMXigTIoxsv1vlFDyqRU6F2io
	6N/DnWV2bs2kN56hH8KGkp05nHFdyKYQl8p4Rn04PXOJxnf5jcSBpD1OkAOcDX5T42zsLd1U1hL
	C3egV+qm1r9nDzs9mLyjgZPiW0PQ1u2ZfiHvZqrUAyD05+Fy8qIENHVJ8bh1ucpxTdteA1WGqxR
	5wcUljJiUUsYsSeWJRTbiytAIf2uHARcwSQfXw==
X-Google-Smtp-Source: AGHT+IFjWgOJKdVfREEws2zqQVEOozOgi3Xgdx1P5T5tuiTrQDE+DUwVtbjkjm0lDjhwmahpZ9YgAg==
X-Received: by 2002:a05:6a21:32a8:b0:1ee:c598:7a90 with SMTP id adf61e73a8af0-1f0fc99bf90mr5316171637.39.1740492090089;
        Tue, 25 Feb 2025 06:01:30 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.200.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7fa1d3sm1504873b3a.111.2025.02.25.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:01:29 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] bind: Upgrade 9.18.28 -> 9.18.33
Date: Tue, 25 Feb 2025 19:31:19 +0530
Message-Id: <20250225140119.1084199-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211880

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fixes for CVE-2024-12705 CVE-2024-11187 and other bug
fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-32
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-31
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-30
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-29

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.33.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.28.bb
rename to meta/recipes-connectivity/bind/bind_9.18.33.bb
index 4b0948298e..2554a7bb5f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.33.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
+SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


