Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7EAC19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 10:13:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12669.1740737608629913936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 02:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z87vw64z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43998deed24so18428825e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740737606; x=1741342406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCtCm5WWJWNmilM9AupjtMkj95dsg1id/adxq3QnXUA=;
        b=Z87vw64zXnmMD9Cq3d/BCvjC3GRGXS/jfAoVQY3AO3JdE/I4FIaOLMQ24IFN4iYG+6
         6YmI7xlVgVKU27uKcg1ctc141LB0+LYS4Ku8SyT26Bhelj+rIIF4oukD3AESYykhBzJ7
         iyv5hihW0zXwOujWMkin9wmAIa2G/tzdWMCZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740737606; x=1741342406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCtCm5WWJWNmilM9AupjtMkj95dsg1id/adxq3QnXUA=;
        b=W5vIzFIZLcUlYcG5whto+ELsTeFyqTghMeFkp8YxiHWK3hHBCGFJDtYpoi4xGEA3Sh
         W2BglBO60HdFfqvE9YgEjwPJQ89HvU3P58Lre9TXCNSicDBDWoR0q4hDuih4eJGOnbSy
         Nij/WViz2+UgMjPsjS3LwN2ZxVwlrhJFI3HPpqgc+KXKlxvZ5cdSOFARZdWzAmnTalFF
         eXCBU6NPnhx87srAsvasUqsYjsUlnnF43gjbCU5pEF/hrWfvcpMeVxEZvGh9BKhas8lm
         BgX/UOc0u0NXdzHSJDXJtTj6SWq1lEyj1PIhx0HX+2QNK6DmTWhOo581AWm87TWt44Kc
         QJjA==
X-Gm-Message-State: AOJu0YzdfkX/UEnpKwp4UaqUyL5evC7wTO+EjkP95D6rJAi4ScHYX7sD
	NswF7Eo14xxNJNX4Z9SuAnna7nnOJOXnjFRwwP2TdLRniGbIZHtXdAK/NQSswpJOeKGiyforc5n
	M
X-Gm-Gg: ASbGncuzSae7nYCzuZt2UddZu0NWi6CYuRsrfmEMhhbHPVwrg3Jv8I4WN/hTjfX3CCw
	o/ckP1wMEB3kH6gEF/84u02bfCNuBmytCVul02gQzPXQdh1ZW/+LQQykIy3cwtjEOXxt1YB16aC
	EWTwDvcgPONqMkNxBmo1HEgdAJxLe4FrUW89p16x7fu0PzIFfGg6OWqEvu+Sugn05i41Y7EY1x6
	guTZfjqbYb/IOG5IZQMHZgcHOy1b0WxWnBvgaeNgf/H1Mdf0as+rcrUU6/auJFoZ1qyTKeyT41T
	Iw7n+BFpKmxFlVMmYhPh5i4W7rtxyKYNAE+eW/UsWTRDiQh8C8yDMbc=
X-Google-Smtp-Source: AGHT+IG7A+Q5dA2VSX3Y6sh+U70X0TTB+euJYfQr6eH2Q6Z5oP8PJszr//ge52DliFY3cASJ+4IzXQ==
X-Received: by 2002:a5d:598f:0:b0:390:d76b:fbbf with SMTP id ffacd0b85a97d-390ec7c607dmr1904011f8f.4.1740737604731;
        Fri, 28 Feb 2025 02:13:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6ddc:363e:e14c:9394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db77sm4642746f8f.86.2025.02.28.02.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:13:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] shadow-native: Disable syslog usage
Date: Fri, 28 Feb 2025 10:13:23 +0000
Message-ID: <20250228101323.1008021-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 10:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212054

Spamming the build host's syslog with useradd information during image creation
isn't great. Add a patch to disable that.

It may be possible to convince upstream to make it a configure option but for
now the patch is trivial and reduces host impact to the logs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../shadow/files/disable_syslog.patch         | 22 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.17.2.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
new file mode 100644
index 00000000000..7299a8e61cd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -0,0 +1,22 @@
+When building images using shadow-native, we shouldn't be spamming the host's
+log with lots of syslog messages which aren't relavent. Disable syslog use
+in the native case.
+
+Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: shadow-4.17.2/lib/defines.h
+===================================================================
+--- shadow-4.17.2.orig/lib/defines.h
++++ shadow-4.17.2/lib/defines.h
+@@ -88,7 +88,9 @@
+ 
+ /* cleaner than lots of #ifdefs everywhere - use this as follows:
+    SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
+-#ifdef ENABLE_NLS
++#if 1
++#define SYSLOG(x)
++#elif ENABLE_NLS
+ /* Temporarily set LC_TIME to "C" to avoid strange dates in syslog.
+    This is a workaround for a more general syslog(d) design problem -
+    syslogd should log the current system time for each event, and not
diff --git a/meta/recipes-extended/shadow/shadow_4.17.2.bb b/meta/recipes-extended/shadow/shadow_4.17.2.bb
index 5459d4e57ff..19512f25941 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.2.bb
@@ -23,6 +23,7 @@ SRC_URI:append:class-target = " \
 
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://disable_syslog.patch \
            "
 SRC_URI[sha256sum] = "064a7c048e613ef5b5f3613e137d79d35d062ab434e89020f743e90844ec5c4f"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

