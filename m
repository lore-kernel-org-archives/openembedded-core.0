Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFDEC35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.4683.1741809194822526170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cklesr2L;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so646403a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809194; x=1742413994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZ8sxB5himia8OTUdUiKpC0KDBcFwsZ7U+Ria7stI0A=;
        b=cklesr2LJfL13UET8JUvpWu2Q7RHpKMa0GLy+rpBimwsnLTuKhZmRq4YXiWd6BF+h8
         KsYUWJj4wrE0wFH9bkgoVVkNkGklw8WTJqd8CFaRPYiE+jLKoDkqEoVnU+jVxqs9+vpj
         kh+1TVTZcqJ+kIpoJjzKpyFG39qITXiGxqIi4DUrtd0+sqG6gwUBYt+jKWw+O2uEf2CR
         NX1m0PT3K+p5Vi0QtW8dGpXl0ZRXgGLum/ljcexNs8J108+nNkJgbp6ZXl76u4VxiXQP
         qyLtVqUUwziEUtrt5RL93rOhQTLQcSsv+0ijZBjWpaQ7fl8th0s2IyfSWnjLTfMEcwky
         iqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809194; x=1742413994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZ8sxB5himia8OTUdUiKpC0KDBcFwsZ7U+Ria7stI0A=;
        b=duRV65BYHpuDOMgbyNGH1Dq8b/AWeIE0Yv7V93LGMllc/+6ea/chxInHxuGd0crqTL
         KzzA5kipmuyy2mda7UnEbcnVBGM+rYHEljAqG0t0ALxTANh2TBXbG5XwIbA3Us/0qpGG
         /ugo0izCGvGan/9Ee6YxEoW3/ULkgJmbLdBt2WQ8DsCEq5Q4sqcHcBV59N/J3EEEK+AT
         GsGHVqfIazG9lw7wReisJBZA6WdJ9K2NWdNBLP735y1+sH2eFWcLLPi1MxnavnGV9WRJ
         bwPus692cEq7yD7V51+Ne2K7nomUAYcudTFXkFDNG79EiPILBis+H6tzmv6OkaE+Y7SF
         2yKA==
X-Gm-Message-State: AOJu0YzaurRkIrufBIm6z7ANO/3M0PF+fjkNKs7xoODqEULw9d1yH3Q6
	aF/JCIXW82SXYMPx0uEkQVeRqfILYa6QIqEZkJEc2DOX2BVCyWFapVpzftoUZetrdlMxB0eSUIE
	e
X-Gm-Gg: ASbGncvtUy2ktgYi+HIEgs+iveOKYzZhTgiM9kszPzjRBm5hwfzBQmvBV6JCVAxeDLy
	fwbBzkHzuucOxO86C2fSwHqJMnfGnhKCDgZazr78gjLJYcb0THuQE447VvQLT4hUaiXSdVvGyzD
	1PQSyM+7x+YPzYl+LyDcNzO/dB1nMKrw6voOnVv+jsh+d7lXi3aEn1UJf3d1Lzd9UEUUHTga1tq
	4soJCLOWN4VWNq7mLH20WNG4xBNsyDyywBX1MOKlr1t+X7WxLoydyF4Wye5B0kQ3HaIqHO1HIn9
	T5kimDNCrM+t9Go1WfBThKsBFntHcaTRlbwNinkFNPIClQ==
X-Google-Smtp-Source: AGHT+IFsSp9fWjERNKboS9Y9xXKoGBfDlOSPQSgmCXl69Xo8W9267j4P74ytL+8Wzg3pmathUuzzvw==
X-Received: by 2002:a05:6a21:a42:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-1f563f9a264mr29529124637.35.1741809194030;
        Wed, 12 Mar 2025 12:53:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 23/25] xserver-xf86-config: add a configuration fragment to disable screen blanking
Date: Wed, 12 Mar 2025 12:52:31 -0700
Message-ID: <72855767daa515a451ea7ebe3412479cb7bafdc6.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212690

From: Ross Burton <ross.burton@arm.com>

Add a configuration fragment that disables screen blanking, and add it
to all qemu machines.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 780a5ccaa51d5aed18200883a686387e70847e4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-xserver/xserver-xf86-config/qemuall/noblank.conf  | 7 +++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb                | 6 ++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
new file mode 100644
index 0000000000..9d40a9599a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
@@ -0,0 +1,7 @@
+# Disable screen blanking
+Section "ServerFlags"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 0972a5dd78..d57b3427f8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://xorg.conf"
+SRC_URI:append:qemuall = " file://noblank.conf"
 
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
@@ -19,4 +20,9 @@ do_install () {
 		install -d ${D}/${sysconfdir}/X11
 		install -m 0644 ${S}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
+
+	if test -s ${S}/noblank.conf; then
+		install -d ${D}/${sysconfdir}/X11/xorg.conf.d
+		install -m 0644 ${S}/noblank.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+	fi
 }
-- 
2.43.0


