Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A49C44510
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:42 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13729.1783956896468341472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 08:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kc1wV+3w;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: chalianis1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15f6d667bcso402014766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783956895; x=1784561695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCmtREiZftcgYDxqT0mRl3cW6BE1Ua2DYgZ1F0orqXI=;
        b=Kc1wV+3wnQ+4Kh6f9FrT5rTXcV8PE9el0nFqR7jDlbB8ddTPwSJAqTyxwVaQtxCyyJ
         5kbZlTI4+6Yig/rJ0jQARiGJwjb7qqLnMRxXmpcMCz2b7kWCyVibsTCTZ/km0YBqBRLL
         WziHKrsrLBUqKrbg7HQfHpANDGvvzm95wDVM9WKV5nJAoZ/lnGJL80awXnF/SDI74qkc
         0NRNQ38Ed6yD9Nq83F1cQaPQb1mxTyYVlXTRX9H0GG2XMK9MA00RNXn8iWfjIVKpRnqE
         8VZcjHAJQ7B1bHUB/soIUDkuQmiX3P4aCws7B4GpXck8OpIttH9IHpMz2BTrtMiy66+w
         mFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783956895; x=1784561695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCmtREiZftcgYDxqT0mRl3cW6BE1Ua2DYgZ1F0orqXI=;
        b=eQyGhXr8mrRDLmCgyGrz2TeOgE8Jikgj9oaKT162F9OHIzlnwzm1QdjDkRfa9oAn4A
         WhX4sH1AN4WBbv+Te7GxFje8swOVTfvMXBU1NYesCMZxbFq712zUfV8d8cnFKug8KcuI
         h2AgvjbIdXIpypXNmTylrGWZqptgf0wHOkk29/4gIwrc7m0IOMh4Kn7R+wFEi3o1S60w
         N5hGjkbYpKWdYwj3GGLoXs2xSRWN6gWjea94JL+LfEhGwUrCjsY257yn3WwZwrrtFY04
         36iTunaXG0ROzpQL5crAY5bZDs6BxlGxrI3JIRQ36sS6cnwBLmgQaCtnl7uIOvTOe3Po
         SvHw==
X-Gm-Message-State: AOJu0YwQHFENoeYYm4rcKuBe5bBIis3Hgvm48XWDUaKEzwh3PE0biAca
	BYrJRy3Oj//0OvW4sJHWf9XiQx+ML9ooon5cvL4pRUAGyjC+AGxrjT4Rw5Uaot6w
X-Gm-Gg: AfdE7cnJPOldk6DXsRJ0/N4rsQpjulbeUaEuyl2bJ5HWjwaJUFB+4jnJ1D2qJavUry+
	oAxjjR5McWlv4gECxBZ5teDI4J3aen2ESIJp23EhtMcyZEZzDZlzvf5AU+HhAqa5/aB6kHfiDzB
	h7vZF0IIwjdotP08HKgc8A1nGXiXr1nZZtm9/GlK1zk+sN62cATeZHHHUHCBKmN+bKNNhzVg0uW
	P8Bid/hbeA5H5YN+ULrQnofOVejCgNrwgemuzzxgU8OIul7oVsJI5vC6alU5LecYVr1NuZ+7vCN
	H3GauWdIq48qoMgr8elH2pc+chlKs3Z1+d73rYTeEmr+hurE1YQM0e/TP4ZaOdgvpi8gEGpodm2
	ootn/y5zkNXK4S+Dl+O/eIAJNxN2UKh0yibHY+JBtUd3aCkqacDfgZnyhYk1AShz6j3wb1xfHvS
	pRxwDVdtCE0XWohb9eN6x/oIV0QonmTMWnju0z+tFy63JhCAnbZQ3zwHqq/GkYOROjN+zRqGmo3
	+LrTrqjRG2wOo0OAZGeD59KktvY6cQB
X-Received: by 2002:a05:600c:4e93:b0:493:b8cd:2555 with SMTP id 5b1f17b1804b1-493f87dc356mr81996195e9.3.1783956581488;
        Mon, 13 Jul 2026 08:29:41 -0700 (PDT)
Received: from wpslrad12 ([213.195.89.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e029sm202245f8f.3.2026.07.13.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:29:40 -0700 (PDT)
From: chalianis1@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Anis Chali <anis.chali@ro-main.com>,
	Anis Chali <chalianis1@gmail.com>
Subject: [scarthgap][PATCH] extrausers: Terminate set_user_group post-process command
Date: Mon, 13 Jul 2026 17:29:37 +0200
Message-ID: <20260713152937.200292-1-chalianis1@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240880

From: Anis Chali <anis.chali@ro-main.com>

Add the missing command separator to prevent the command from being
concatenated with subsequent ROOTFS_POSTPROCESS_COMMAND entries.

Signed-off-by: Anis Chali <chalianis1@gmail.com>
---
 meta/classes/extrausers.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index c825c06df9..94576b8872 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -23,7 +23,7 @@ inherit useradd_base
 PACKAGE_INSTALL:append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
 
 # Image level user / group settings
-ROOTFS_POSTPROCESS_COMMAND:append = " set_user_group"
+ROOTFS_POSTPROCESS_COMMAND:append = " set_user_group;"
 
 # Image level user / group settings
 set_user_group () {

