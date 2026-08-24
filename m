Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3A8C61DB7
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16158.1787576449281883487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kQY4LjWW;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b02fc590so21399135e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576447; x=1788181247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5GLnUudYtIqEEOcy0Mx3uDgAylfdwRcaTUONVQLEKhI=;
        b=kQY4LjWWOvpp2ePJM1x5ThltgatHdGiIZo57lDia6G3HBvJeRE4q2GP6n3sl28fyZZ
         /HMfCLdiSRKCivaZ36PCdSvODV+o8UqWkqthdbOWavFtzoGzgulNjXntDMxq+VacHj0z
         QKtrEqQZ6v85M4R3y6g42PlaxYWVoVOIG/muY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576447; x=1788181247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5GLnUudYtIqEEOcy0Mx3uDgAylfdwRcaTUONVQLEKhI=;
        b=HvVascuaZoTkBkA3/+JOSSm/2ySlz+Rg0g7l10AHuMq1ffGbwbMeqtXrrU55SFtBGh
         65iU0zavBqG9dG3lFyNjbBSQoJLfqzzWSe4j6JJ/ZVqk63SQ6iRYGUlV4Apx2aE3KycO
         xClfmKPCTqbTNiYdzoDdg5YRIYblkbYYeOWh8E7Dtg3WTnmwjJYEi3TvoTqjl/PJCiSB
         4RHF4lxK1Wdt1pQj9dFFaoR5irSW2mkp7b7yF4CXuCM2hxgE9qesqmlfZo5fNQjwNhII
         2bfORpA/NB2Tgj/eiHJgXIGXso1tz1sNfHQwmHbxqk82gPeBeRwd6viEBEeRhxI2Zo45
         FV2Q==
X-Gm-Message-State: AFuF++lKUpprgnhSSJQyxBIqOWw3OKftRtO1pHoXR7Lj1wnbVmBREoET
	QQ+i/O6ENU1AFOj0X6nE+KZIm3/5HGy5Fl+sz2FCkscbbTEgaQU7iCW+JhQLZSxuE2dV5tgy1o6
	Zh4l3jTA=
X-Gm-Gg: AR+sD13K7805nFkULs19MqHRs4tNR/eqRp1oJySGh91a+t5rg5FNnWc34R7Azz8IlGL
	AbFPvqPC0A2HGGwE+APGc8lq/OcL2A5TWFIKQhgAGe+z6YGRgf9Gng+a4OZhgkhJHJpl4c4OR71
	0k0917HrDDHuGU7YApu+buRPRkV1+LTNMgCN4/cITaD2SJeRknMfUs2y/vtEiVSzoxHIzAD6d0s
	e/gqTWiwY14Y4WCo3oR1lpqEplBxEk4EhZsJFrO44X1NezOtWvm2FydhoJPe5sajbAWEqmgW0Oz
	hF5h1UBu8e6XigWmDo+XMKLbGoo/pZLfaz0EW1YE5ydMTuG637hMz8U6yzQZbjWuFdG3t2ESIOa
	418929V+bB1fsxy01ILnMizrL6dRg4nU7Q4dB79fPyxaHhIlzHeIUKHoAbYLGpsQIJ0rWEdJgbU
	nonPYBAS8ITggfRLY2rKtyqXus4YiB9k4LZxehaU46ngvb7x4qRDdwWwbo4R9fTlxlLXA2Dp9nd
	aaytHEs/0HfIxEPu6DUMG5YC5maW5vju30Kx6vWML0wibBLwE/CAr7T5E2k2pZOzQv4A/vJts56
	TQVrGw==
X-Received: by 2002:a05:600c:5251:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-499b8270deamr323521965e9.0.1787576447365;
        Mon, 24 Aug 2026 06:00:47 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/19] libssh2: fix CVE-2026-58050
Date: Mon, 24 Aug 2026 14:59:53 +0200
Message-ID: <c4744c1d5a224f6d63c2702793612b73b1a7a193.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244105

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58050.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
  https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac896202b7e12

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 00000000000..0163b379f35
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,45 @@
+From 05b2fb4ec89d75235dbd97c5965dc0e46b405a7c Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sun, 28 Jun 2026 02:12:52 +0200
+Subject: [PATCH] publickey: fix potential multiplication overflow in 32-bit
+ `libssh2_publickey_list_fetch()`
+
+Cap list size at 1024 elements.
+
+Reported-and-initial-patch-by: Mateusz Gierblinski
+Reported-and-initial-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+Closes #2128
+
+src/publickey.c: replaced ssh2_err() with _libssh2_error() to match
+the stable branch's error-reporting convention.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac896202b7e12]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..196d2f9f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -1114,6 +1114,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                 }
+ 
+                 if(list[keys].num_attrs) {
++                    if(list[keys].num_attrs > 1024) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                                       "Too many publickey attributes");
++                        goto err_exit;
++                    }
+                     list[keys].attrs =
+                         LIBSSH2_ALLOC(session,
+                                       list[keys].num_attrs *
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index faa34ba3eb6..52684ae74ef 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
+           file://CVE-2026-58050.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

