Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0EBE6ADFD
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87834.1766434128791583293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIZ4u7t+;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7a72874af1so751868366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434127; x=1767038927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9vXkutI9UfqwDDOFj3jsWrItCu8ukKZclwY+6g4B9g=;
        b=bIZ4u7t+BD9V2JzaCmWtiknoItj8GypQG8KjI1kloatD8Aj3XVsXNEGP388dstZbrt
         sfq6prluYWRZqj+alxAqiqnSgffosqQ3PxfupKQTAsEPwfhzqc9hY2soYEpL5wLJVQJ+
         ynnVjFRp9UHD7egmSoCk/35vELII0fvs2Bi8O3onWbqR0ti8cE1Mn8i3IE8FnqDyx6T5
         CZ2zO/M+wUBJ8xjXa1H/3bwpJf4bM3ZGvQ6c7uDnLSfbSOdnohvxHVcQ0/VsaKH87q8r
         ypTTE9pIbwBoJYiCd1C315cl6S0RjCpyS21jzoCdq8TywPIOcfkVZqzc9n4yNnXMrZh8
         KqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434127; x=1767038927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9vXkutI9UfqwDDOFj3jsWrItCu8ukKZclwY+6g4B9g=;
        b=ghADPVgYvqC2F5vadz5ewCl4uUUBGVE5SaCkZI51mb9HxISHWG0vgjDzlvxrO2bPGR
         sVv1g8mZRIenVOu1IVD9yBk3Ycon38TRV853xpOQGaT+fHaSftj0HUk2p5ikBE3nuuKN
         +J9JQc/8yrOvOJJc7wVbNIHFcNqfFf4iXLc+HHp6dYRK0ac+nI160x3JHgraUzWeVNdM
         8Qq5gaoGqhQeaADGSkULkmeOHsTc4lT2PuBKWWs7PUbPmEemNFxGjvOvsN/doi45r/sO
         KXqx1oQ3dE8y/uQaFGtDkUybSE1L9kFSv4Qnqb2lcKPZstN+XmB7VLmxTrwqiv2tcdk+
         mVKg==
X-Gm-Message-State: AOJu0YxeQv4+wUObIrenrrIfJIRNOlqMLiQISINOIll5om2fwdFQzIks
	F3xAGUXsiCeYXHUsOzFg/Z23fUVpXRbL6LxEfT1CBtTjHJtL5T6UUbLyzc2q2A==
X-Gm-Gg: AY/fxX7iaq0ptFW+Q+xCYSN4vT/IACl5rFqcpRVE8zIgrqhG6QSbyZ42gef83x01av1
	hJj7J43oRNhwdOJIebub4eWKsxpI+q3fvW0Nw5zD1m9u/PIR+ck28Ytnz1wcgChy1VpqfLzFJho
	CIBNr0t+oHT6Wzdsd7P5nBtpg7jQ972leEkP01TIp3DPbOgEDnE+gX24LnheRO8/1H9wuApvNC0
	fCCQZ5x2rD+AHLExw/54/u1qccEdGwy7DfKl8MFIwwW58wFnt3jRhGFQ145UicBmCy07pV5D5+u
	n8ABlebj9FGEcQe+zGFcJpCghdLhqo+nY5/F4x2JhmZoRismZZPchB1qeyKR5SwrJVmM+XdyDLl
	RIcKItnBsm3t9sBd5tgs0KqiGMMneA+LTIEfs8d1/2FR4zjY3UNWRpSerq4tsXze33yCYHcWc3U
	pW+VqkpzFKb2Gp2qH3+q8e4oJ2Zw/qZejiNTqGNWsh15H2kYc=
X-Google-Smtp-Source: AGHT+IG4SetDcqYHa12myRnvb3TSPWmhcsXr38kkZOlyk0A6I9gL+b9VeaHxE/n4u3mQeOWuhUApZw==
X-Received: by 2002:a17:907:7ea2:b0:b7a:6c39:8e73 with SMTP id a640c23a62f3a-b8036f12f2cmr1154772666b.23.1766434127037;
        Mon, 22 Dec 2025 12:08:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 090/114] quota: upgrade 4.10 -> 4.11
Date: Mon, 22 Dec 2025 21:07:12 +0100
Message-ID: <20251222200739.2278706-90-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228415

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-setproject-Fix-openWRT-build.patch   | 30 -------------------
 .../quota/{quota_4.10.bb => quota_4.11.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
 rename meta/recipes-extended/quota/{quota_4.10.bb => quota_4.11.bb} (87%)

diff --git a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch b/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
deleted file mode 100644
index 8ca3d9f773..0000000000
--- a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Tue, 1 Jul 2025 15:41:56 +0200
-Subject: [PATCH] setproject: Fix openWRT build
-
-basename() needs libgen.h include in openWRT build environment. Add it.
-
-Reported-by: "W. Michael Petullo" <mike@flyn.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/]
-
-This also fixes the build in Yocto.
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- setproject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setproject.c b/setproject.c
-index e688dcd..4308435 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -13,6 +13,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include <linux/fs.h>
- 
diff --git a/meta/recipes-extended/quota/quota_4.10.bb b/meta/recipes-extended/quota/quota_4.11.bb
similarity index 87%
rename from meta/recipes-extended/quota/quota_4.10.bb
rename to meta/recipes-extended/quota/quota_4.11.bb
index 8f9e4fdf34..b386071961 100644
--- a/meta/recipes-extended/quota/quota_4.10.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -7,10 +7,8 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-setproject-Fix-openWRT-build.patch \
-           "
-SRC_URI[sha256sum] = "a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI[sha256sum] = "0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d5223ef78"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.47.3


