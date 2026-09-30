Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1EFCA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:29:18 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11225.1790767754022215008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qV5wXzJI;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so2246674a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767753; x=1791372553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIMGTNqLiVH9GEqx1ekQmA1Ylf4X3XSprDC2FuRNZsc=;
        b=qV5wXzJIqCBoIONysqKXxLnQwn+LhcnALmEGgwQvyU0KAp0Z5riadCjwzX3tuqr5iS
         UEHxKch/OEJsZVtad55pIPfbzpQTx9iae/E7EAKt43TAXcEaEC/uULDktkefcqOX7J9v
         E0B/J21AexKS8qBXf9gQkwDjeWmzfJ4HevbDhITqsGwj4b4vJXXdJxOl1Oj9xpus6I0a
         1ZGI0DejeXao1gGX36t2aWmavumFYYBl3ND7WDK7D1Tqo7Xn7e8okjMN7grewG5yf8lK
         LYpuXTG1/LhYp5IDAY1OxCmm2ZAmcUTyjAV966YcWDj5D44ZMgJUwYjhecHNBF+uVytY
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767753; x=1791372553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIMGTNqLiVH9GEqx1ekQmA1Ylf4X3XSprDC2FuRNZsc=;
        b=w6/E5adE7PZkd7d03g0chpyJhMhw0S6fBnhfBnDkHwEFZ6+pMRTy87ZyMM+b6f+HAF
         sB4WG6Z61IcG3ctXcSIMBSqIawK5Qda3x8Q6CKAHwzJHNvQVn1kFgWBw0dpQgmzrlase
         BhCq+WzlVn9VlRdoSt0RJ0/xw3QGGbOoOjBJ5OZG4MurCC35O22wIF68mg4cQem6Hndo
         1hU+F2yRUw4J4JvJiOypTRIhX0KsLAFX8vudZtNdOQ/TXMhQLYcFhtHx/ZwP0VkEJIm+
         deZKz+1XkeIPEZJcch4voUSyoM3d5lfqBdA5aJgGMxr6YJnN8ALm2buQLZR5znXhx7N2
         s/gA==
X-Gm-Message-State: AFuF++mJXY1y5041sGoD/qBIrQiUEZ3EWAKfhO/8QCATOnXCulEc9JeH
	sGjyZF8ZfLl33ggzJNSfmggM5v0kxLr/2sSJIW6U/uSZ2VkyXdlsr3PS9zUCsQ==
X-Gm-Gg: AYBFou28Gq8PHq665bhnkGsNt25hIRNPT/s9lb7OqLrmo0zw1hn/3WLOvghvH9xuPjL
	qF6ilTwepiVvHeLvrZaQQ+8Jhm7D+9uGTstsI8A6zFKp6rS28nU3wrkllfbsIBpUwdICOeAA00v
	8UwUbQgnYmxX2YEKKc44z/12GkvEQDqSzrGwaIE2oyc+N/GcM0rNAkvjM7ENCd+Fg74uINS5oT6
	et6UmqjABmABwSjH01cOHIBH1nrU6lISWkcUTJfvjYoTJKxvNWKjsvkb9DGOOqAZdbrlzIy1lFF
	hxoeCgspYcN+oyxoZdceY2dWUs0DNLg7KrHzfHOlEcO1mwhR7CSh4TjtzYrtX7w/rDYCm4NlDXR
	XaD5M5Mv9ZgYATIzrGgLruInVKrOS2Lm/4NrTmO4LDK8VI+lt8pPA1A9XfCvw6yiMiPW3vXkqIy
	q6NotlZeyCueSyy7cywSCRfEXYEfus+7ZE9TD42du0jgDIbuy6db4SWZQnUewG3bryad+00ZtQz
	yk0NbixBuweKPA2fC4n2G+X+38oAqMC9w==
X-Received: by 2002:a05:6a20:9191:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3de9e69ac1emr1014516637.17.1790767753222;
        Wed, 30 Sep 2026 04:29:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da14e8c5sm739797a12.12.2026.09.30.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/3] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Thu,  1 Oct 2026 00:29:04 +1300
Message-ID: <20260930112906.4053964-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246956

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 92cd5fbad2..44872c3637 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"

