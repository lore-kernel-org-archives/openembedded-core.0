Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63E1C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.31413.1750195243317482742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gcTB8dwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so90694b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195242; x=1750800042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xHJgeJBLcA7rxzFlMUMR0h2zZzR9XwSFDVDWq4eQX4=;
        b=gcTB8dwCHFpF5IjQUhWqkpHunEbc7/1Uyg+GbIoJhqV6DMGID3CsAYHsWnt0E9b8wh
         fQqC6gYsLCFe6qaQXfDfWDKHIzS8GSlBpee8zCbDTii4RCnWpsXykoiQ8FAWl/+UFFOh
         EfxhCCCm7cgrGZCl9+RmB+HVuYSd3HeGUDcXzIludPrJVZHF+WRfCcwDbPs6ZkVXOTka
         eIxpW4z+aMqRIGU4Y+DGemEDHxtULHSLFalkEQor9Ma9dWM4V9omRdEvW8XO4TjmUMPw
         g2xDjR3CNW+IWfWXfphI9sz0OTsc4Mkc6EbCX1LlJX97iBplUCdR6j4mRz4SrRAeJGdF
         JVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195242; x=1750800042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xHJgeJBLcA7rxzFlMUMR0h2zZzR9XwSFDVDWq4eQX4=;
        b=bVMTGCk8VyJaBlQYzoC7t0Gx5luml8s2tiNY22bVrgaC2Ag39l1WZcPwhXaweHiKVx
         HMq8zsLSsHVWLroq25peOHm/l+INyAA23RknQboRJu8E7pPTQeCeaAbSRuLRJxPRNH8g
         H5RlshDvHF3/sYdvOIkuRsSY0kXkqXThhJdsyOS3h731peHXt/s7f01/uqt553FolG0k
         Jc9hfydQxpFgTMOEI2stTL5q6PKsSNcShdlkhI05dlhlQWmbbhQOD9DS4i8+hSVYBrLj
         R/DpvNGez2nn830C1qYM4b5KWCmrtCHLGw44yttv/gr+icFjXAAAMJWSQttIoWapqBO7
         BMDQ==
X-Gm-Message-State: AOJu0YzVOX/AGeA9RMsnN4LmHha5o2r927dOwWgcymFNr3NO8zBXSneZ
	Wup+EzKwdPSGdUrq+rAuG0d0TbvaIhs8t19TAjgex+jCeTjaqEPVbaEarY0iZVpYj9aOuD7uQg5
	1XUbO
X-Gm-Gg: ASbGncvcBm3k5tcQAtc+8zJmkie6R6E7cJSBkHCXlKbnV4zyxb7NoKGJN6mS+6qjTMD
	N4IidegxLd//bEW8nrLdhmxk5qjUJUmFm9sZkuwF3F03hYc5SHHsyy+GTQRL8w3BFwZQgWEOXuO
	aX4ikT3csK3m6mCUX+c9WWRnHGU1qYa9L4yXSA4UQPW7+iNAe9K1pkh/8Ct34CIMrqM0J1DtTTY
	ycQdqh86uDOwIQqk9yZqGmC3yP8jcBV5Wq9eHFWlxlXinXifJdMFTr4kShgtjSdyeYlconlo7h4
	IfGaNX/j0Hv6Wwv3fEonithWfrnH1rKEUGZ04vMqiDSRhaDLQTV3oA==
X-Google-Smtp-Source: AGHT+IE9LcEuOfD7gPr+lYZJqGDUgw3JdRNkPCaOowuZEFQKrpXtt+Kyj3r4Qn/VENy+R1eEDAVyJQ==
X-Received: by 2002:a05:6a00:4646:b0:742:b9d2:dc8f with SMTP id d2e1a72fcca58-748e6ec3c9emr125073b3a.1.1750195242446;
        Tue, 17 Jun 2025 14:20:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/27] libsoup-2.4: Fix CVE-2025-32050
Date: Tue, 17 Jun 2025 14:20:03 -0700
Message-ID: <c5afbcf487cb7331f641c4dd2c7a972b4cd3c787.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218923

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  | 28 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
new file mode 100644
index 0000000000..474eb465a6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
@@ -0,0 +1,28 @@
+From 9bb0a55de55c6940ced811a64fbca82fe93a9323 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+CVE: CVE-2025-32050
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 613e1905..a5f7a7f6 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -907,7 +907,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 5e8a141dc5..6b227b0503 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
+           file://CVE-2025-32050.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


