Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A7AC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.31264.1750195251135318682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cH8Z4UZG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74865da80c4so3701890b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195250; x=1750800050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpZmVL+bqSiE1yWZsJ4KmqKKwHfCPy3LkItIVnX6bG0=;
        b=cH8Z4UZGWkNjOCfQ0NA7jUM22vWcSMrI3zxGn8GdvjqRJNqPeZQN/7M7XVyiQ3Pt+T
         AXbY/Mtg2jH2JeYgAUDzibHKKsoJ2c7Pstn7nbdP+jGXEn+BAn7RpUzMwIGDAzTkP0hG
         +Vu9TB4oRYI75j6OgzQNvLsHDaGGncvf2T0nxhL5sjX2UL4aD8dvHXMrzJ6X4PnB646l
         5Y1rdIznqPWktK8FCxEfA/eUQ9Mbih/cjVBjqL+k2s0446b1eQ7wNI4VJsaXyO5sEqKg
         Sapuka0UbwtRKdtwRZ7yEDUGYlhCQBXbuSGTQE8yOrDqtHAIz6awlbIjzXNWnGk6nhEC
         Zvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195250; x=1750800050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpZmVL+bqSiE1yWZsJ4KmqKKwHfCPy3LkItIVnX6bG0=;
        b=F4+Arf4j9a0Sz78/9rtFLqOu5JvKzNot6oXqCtc6OHOR/UrvOarh9fZOKoBq766KjW
         nm6nXa0xsgieFRHW2ZvmScP0SyROmC2d9NZnoICL3oVJmdDXfA6B9q+KvKc/n1IMGCvj
         U4pbgUUYCydHtQk1L9cOU8qluBZn4Y1kOJxsTKvXk0fMyfBIFRHgNlZarA475vFY46cC
         5uSiP/eGX/12KllkPHHF8AuEG1dMVWec1XIxUZtnE9jaWA6Q54e4joucbXQUT0zleeSM
         CfAYqGozzhZlWIY48hEqm2zulCFY06oUcKQ9YdOapmPNspSVQmmHLFsVi/Sh8T9+mEti
         BeKA==
X-Gm-Message-State: AOJu0Yw5Itta31Ng8ZjxCaMZGMU+kDLsJ/tBFX6LTaB78bOr/6CnH+7y
	9B14eERzHiDEJ0D5hyAmNPNe/R1mNqdnqSY7GmweVgnw0fMzyzfsG1eud1TgRE6eFJXx7N17PkB
	B82fu
X-Gm-Gg: ASbGncu8/YRnC71UjsuySayBGHc4XwVVsFpwn4DvBsyIuyPRn2wiiivfSKcPgZmjJPJ
	JdHXrXtohWCF62IeNWCx3N1LOACl4OEpAxC8ZD95trJp0NPIIAqNuK9PSZfcSdgHUcvuDjyqMIV
	bXeXYy95b1kGWOeueeFs1xb5kAOBv+vWIW9WWvs5tACWKrSP7GavlypuRezPc9a6eSR91KGsWup
	y3ktjvk515XivTcY9QCvI2SiapehX5DOHZHQyENFYAiwJPB208CebcrN1Pv/IQ0pnrFlV3pNh62
	qLzcivWzli/ms7PfehyXrRwIJAzh0as7PRpO5KC+avw4taWt4D9RCA==
X-Google-Smtp-Source: AGHT+IGDSxsFWXkoNneBRuswfdW4uFepp89JVMb82TNldTtUeu96x3wfzEBtR9SEWKLE/VCQKy4JCQ==
X-Received: by 2002:a05:6a00:92a8:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7489cfeb010mr20617982b3a.16.1750195250309;
        Tue, 17 Jun 2025 14:20:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/27] libsoup: Fix CVE-2025-32053
Date: Tue, 17 Jun 2025 14:20:08 -0700
Message-ID: <de40e2f32af4ec930c80858f8d77a5a1b0967069.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218928

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32053.patch      | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
new file mode 100644
index 0000000000..7860526620
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
@@ -0,0 +1,38 @@
+From eaed42ca8d40cd9ab63764e3d63641180505f40a Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+CVE: CVE-2025-32053
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index b62e4888..5a181ff1 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -641,7 +641,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -704,7 +704,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 26fe52937b..a90f683cb8 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32053.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


