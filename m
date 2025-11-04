Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889B8CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:23 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19553.1762267694683313299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=urLuAWqB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29524c38f4fso52275495ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267694; x=1762872494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Y0tKkUY9/c/dWdPieobUZBxT/th563oyLXSK7zKJw8=;
        b=urLuAWqBzfWkq8ay13ABrSw4RxGx0y+z0gKJGhAXWXZtunAj0qa7TnsOV7TxFZlybO
         HDBUhjKV3+6sGfK2v+FyBWmQWT/1Kl9RL8zpaTkegytg1EtzSvbtZT2M+QapUXjw0iuo
         V+EOGlrSv3cRIIHb8PgrYS4WcU088THXr1XXxKbgHXAz93Ab6BhRNK5az1U7r2SZ0uti
         vTvxg4bGnFniTMp0gyauPgZGikZveIdrbETXnMqoB4ggSKrTo0cNU3oTvr64UttT/GO5
         aagwXMN4OKNB/PO00oA4GO7lOe3q/08BFH1HfmKOq4NpekA5iVNgi+jpCHwXhekXZiXX
         eXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267694; x=1762872494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y0tKkUY9/c/dWdPieobUZBxT/th563oyLXSK7zKJw8=;
        b=BmYdRRFTZzO+RHLMov/pB+whZF/QYPqgRvIhKXkaXoVpE+6568HMXqPA97Mpl1BXXk
         FiWQRQVtPTAdCNQpVZeyrakJOji0weUyWq47T+/fKBl0DmZGk4OWZfIYslihDYaY8bpJ
         1dfGz6AGwfP/Z5yLwjl9iOExK0EwZV732QqUmpCcAkI9StWqErKuhjEgSJjJ8euwDvDt
         w6Ubg8La5VeMEocr/xOet5PmI7t3grvR9vwRsj9duyq4GelrXkKkllcOkfY6ZiwbiiSM
         2Bi77DT/oIZYFDVl8RLpi1Ib1Ye+vG+uIvpbIF75h9XSFnmjeXbhZvIDodUevTFbUi6h
         NB7Q==
X-Gm-Message-State: AOJu0YwKOwSzCqVam4h3CsXiz/+21nOye98NeSY0hFQ0KIxH7dpkA2Hu
	y6kTmeTT46DxIovZIluqaHIxQ5U9Z9uK6Fcb+L5iAfqUfP/1fGzdELqGD7RYC51YHtIqtOLUS+q
	iFLpvxTA=
X-Gm-Gg: ASbGncvm3iysjFOXgT24ANBBWV/iCLJ1H9uJJj99OTRSR/Fq+78eTnU2XoXLKAthVB4
	py+K1sEctTw+REJrxmjZh3oB7uTneZko1TKhFOqEHphIJxTML0VNK41waDlT5w9ea3/B8nnBJvv
	2jQp6PimDaUS2256xUSv/HVgky59iJPC5a5ptfnocr42l0Sd4zHlk+Hnwy1i9QdEtANtQbF3Fib
	XNiNlMUMONGA/0SD0kIfGjYwM8JOaAmqQpcYsJTJqwdKuqLh7K4XOODQfUmMQFzUHu5bQeUutWz
	yC3u6JhTT7hQSoy+i2VJhANUD4rxLMa7leIrRZcToNOaybzl2fMrS1f2N3GnYGNjjj5q2kooSLc
	k0rwzFpvXSWv80GQ/c5zjQDNuupx9RpIQT0vsajPfGPDzwanb+kAP6c8ek3r3fLKc7wk=
X-Google-Smtp-Source: AGHT+IErEmQIPDAQAV2UTvepvuhsuPAPThDwwZsFcdDPiQkdhaKE58GPQQBxaRqkdmqUrA3kVk2fkw==
X-Received: by 2002:a17:902:f54d:b0:295:82d0:9ba2 with SMTP id d9443c01a7336-29582d0a0ebmr130533335ad.1.1762267693804;
        Tue, 04 Nov 2025 06:48:13 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] util-linux: fix pointer usage in hwclock param handling
Date: Tue,  4 Nov 2025 06:47:57 -0800
Message-ID: <3d8f88906f5560286462eaf55226b872e2805df7.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225732

From: Bastian Krause <bst@pengutronix.de>

Passing params as numbers to hwclock is broken in util-linux 2.39.3 due
to wrong pointer handling. So backport the fix from upstream included
since util-linux 2.41.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...-utils-hwclock-rtc-fix-pointer-usage.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1ecf5c7b39..ccab4b17f4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,6 +43,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2024-28085-0001.patch \
            file://CVE-2024-28085-0002.patch \
 	   file://fstab-isolation.patch \
+           file://sys-utils-hwclock-rtc-fix-pointer-usage.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch b/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch
new file mode 100644
index 0000000000..d98509d6ac
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch
@@ -0,0 +1,27 @@
+From 7064cd275607a43223b2dbaef75c610f33f432ff Mon Sep 17 00:00:00 2001
+From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
+Date: Sat, 23 Mar 2024 13:39:55 +0530
+Subject: [PATCH] sys-utils: hwclock-rtc: fix pointer usage
+
+passing double pointer doesn't fill param value
+
+Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/1064a53e4ff357dc649a8c4a0a41dfb5a1191bba]
+Signed-off-by: Bastian Krause <bst@pengutronix.de>
+---
+ sys-utils/hwclock-rtc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/hwclock-rtc.c b/sys-utils/hwclock-rtc.c
+index 7094cd0..c797397 100644
+--- a/sys-utils/hwclock-rtc.c
++++ b/sys-utils/hwclock-rtc.c
+@@ -424,7 +424,7 @@ static int resolve_rtc_param_alias(const char *alias, __u64 *value)
+ /* kernel uapi __u64 can be defined differently than uint64_t */
+ static int strtoku64(const char *str, __u64 *num, int base)
+ {
+-	return ul_strtou64(str, (uint64_t *) &num, base);
++	return ul_strtou64(str, (uint64_t *) num, base);
+ }
+ 
+ /*
-- 
2.43.0


