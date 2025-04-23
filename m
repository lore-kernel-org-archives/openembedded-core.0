Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049F9C369D8
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:37 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8564.1745414436295750366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zd8yXFV0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5821732b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414435; x=1746019235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxR0b1r3uP70I0friMfoXlUPHjauo6TZM7eoJVqDa0E=;
        b=zd8yXFV0suK7yycqukUg6RF2Pwz2JWF+jg0u1py9r7kxyjk1q9Lgahu59XufmBB7bC
         yoPg33TD1ePU4l0M+W10h0MkrnXZFnNzoMckIR7tVxhbePTOoaSUWrujAXx4qoRXFdrT
         JKbd96udQIUl6adJPccZD0jivO0iR6qGb6X5A8nZZdPMEGSJrY+4u+GsZmKgznckBGbf
         koHWa3ODnUxLlkin2a3sKMYpuTkJMY9crHjBloFCg9eKb7IUF1T++4ZQ8h5wJs/0MA9a
         F9sywEiP9howJ4H57E5W0uaM7JxZbcl9ym6dhTpkzdvfy+L0g98YkofO1Rmr45IfTAiw
         InTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414435; x=1746019235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxR0b1r3uP70I0friMfoXlUPHjauo6TZM7eoJVqDa0E=;
        b=qY+LRqCQgQR3l+g68UYp8Pz3gazzOn2vB/HumE4xfkINojZzyALDcmbBV6PzHmYIlE
         wVWAOBPp9PDok4e8Ap0doi+KCW8h88wjPkyHEUq/x4VwxWZgYKTARB4+tPtmkZCwlfri
         +2HacwvhMvXq13bfhkl5d0U4JeSFxITf2Fe7kacg1i1eTP03VEIwoFxYZx1cljyBSw0r
         eq1rmmpXGX6Mv/HOetdFGoNiQggUU408OLHSdC0vJ3TFlLzdcmEQAmic5BSKpdhIrRiZ
         i7dQ1S1JuxL9ikj3t1dnm6gpjM8P4qZU3AhUyvBo02gsZ7vNkgnEEULE+9eA9Y9HXCE0
         8VKA==
X-Gm-Message-State: AOJu0YxjZnOOa37j2jlRBRQbqyx0J7QBZKEvBn5c40GjXEEiH9z2QDiD
	v2HV9QIv1RfZ1p1/yhA5CE92KkVHxmek4L72NvOkAVuTE5tzosICsVkQ6wJaiPJ8wU1onymyyrY
	G
X-Gm-Gg: ASbGnctTkeRyw/Xxn2b1tSJeEGqDPEEdnmHPktNh93vGBqS1BXCCSkcg8zWSnuf4SpH
	m0QNiQrhnNpfbOoqdWT2x3dIEN8q6nUzMRwhTnSoQeploo8JBOlkOAXWviMmVkmJAwsRacwaS/u
	vxgjsytjyhAAu1Uhrmc8vPdTC0+jx9qHIHPvSXFrONx8ZFaQU1ZC3EHixQPEOINGzkyHcyBqK+T
	wuNsHx7/KXSkmUnUmszBe+YeXy3JhRFUXI8/vyTnstT/lUHZqDskc0Lgy+03TRUtFtreViFI3LL
	zk19mJi4gsrZyE6ZnzV0zoQOgf55pQ4=
X-Google-Smtp-Source: AGHT+IEdGfGa0ZYnrrXDdTH+zZHloOVaqQUuZTQyqFYGQZf1uTtTWKrJJVcVhThCBzQospX/ryLUGg==
X-Received: by 2002:a05:6a20:6f96:b0:1f5:7f45:7f95 with SMTP id adf61e73a8af0-203cbd0bd44mr28906878637.27.1745414435510;
        Wed, 23 Apr 2025 06:20:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/14] libsoup: Fix CVE-2025-32909
Date: Wed, 23 Apr 2025 06:20:13 -0700
Message-ID: <9eba43f18664a20d7f5dc8942eb39cfbd83c066e.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215295

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32909.patch        | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
@@ -0,0 +1,36 @@
+From ba4c3a6f988beff59e45801ab36067293d24ce92 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 8 Jan 2025 16:30:17 -0600
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than 4
+ bytes
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+CVE: CVE-2025-32909
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 5a181ff1..aeee2e25 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -243,9 +243,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++        if (resource_length < sizeof (guint32))
++                return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 80cbbdf8ea..afba5ac12d 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


