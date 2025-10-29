Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF56CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web01.4696.1761739726186723058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGEDkKl8;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47109187c32so39471875e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739724; x=1762344524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoX+KwnhGoKwE7lczmTZPlN5nyRDEuLFySNSAm5Io0U=;
        b=VGEDkKl87tkZTHHD8Lv5bGFFyuMqBdgX9fRBERgTIGg6Ehey3g9NErDP/dpElmlWmA
         YdZ17fGn/qyIK2MIgsCVFpFftCxTlLXpXUQ3cAlur0Q1QvVqnuBdvm25580om8J3A9SR
         BNNvZu/79q7QJZm1CP5WSHwCc8r3JTlTch7uH8ekH6Mxn1nlPj1gFn9U7zwKtezRvt7m
         /296n8BsHeKAkUNU4QLZqTB5C8lRAJ/s4QunEudi+D88IDnyT/MLiq22nVNSL5Y5rYZ6
         tyYFGfjiCWm7pFmR8l9Cso+D6kIELYF1Mq01IdwtrElFZlwX3vDfwdp6bJxxCzAVuRSy
         nrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739724; x=1762344524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoX+KwnhGoKwE7lczmTZPlN5nyRDEuLFySNSAm5Io0U=;
        b=Nd0A+6lnK4ruA83zcpy9EsTXOesFoCGnT0X9t1DoFp/HRNwR/SYDoHSz2MKO8KKHCC
         rpp6eLLjCzdlbroIrdr7mKooZnX6+TxkP14zmXkplAYORuPwXUv7zedwRoyMUeNg0TE+
         3BxMTb4WHeEvQf84EKyd3fao+NXcr2HFrPJeN3/krgn+qeiFoi1QntIzCD7h/tb+FAX2
         IzPH56QVRU1StF8jGjLLLRMigMiA9yI8NFgmSzaiIZZRHEuuVVOEXznhnlhWbiml+4D7
         R0ASRlb922GPN/3HLroA+UFvKdqVKcpq0ZheW8FkVgr0pckUPT2/iAnh8P5uqiTLwCho
         /VbQ==
X-Gm-Message-State: AOJu0YxypbHU93EGwaowti8KbfR0dBAr15sx0fooSM4h16lsLra7mNy2
	K/9rIrmOEW1Tq8NCH2WRJZW5xgmHRlyWL6MXiVxkSlEIwzdfCnMJmzUbwxeOMg==
X-Gm-Gg: ASbGncttFfWZUwU3ibsX4KHmfHREdpGBaOtTdfTF7QIpA01F6ztzUfYrCB/hE19uYCQ
	rEm7IHAdrrzfltysFV+b5HnDqjTiiQ1bMeVsau6tLQ6idhgWjhaXiu2axjw2U2oHHpu0hbQ6YGd
	3HaotxzPYeIE0RPK58kCtV1EvAeenUHdzWUqdDitFAbf7wJ+os3VcQQX4TKe7yOfNI7W0WADC5h
	rr2mlSczPD1LTdwR6A6Xo1/u6BmEUOskb4j4mIZ0ruBGmd2/7Ijku50Pm6l/MdrHK5B8mEUG1L9
	LwhBe5WZphb56EQJpSkJL3bn7nX8Pp1wzVKvUDYxk7bzCkBhK84llg2AIuNQw6yx1Cjd1rQRjit
	lVsXkLrBMe1EluKHbDrXvjOYrQTwR5aBys0OmzHcehtwMAg+ByARSG5XbaCB3+usTksh665SCSf
	xAqdvdFX2/0IfcD+4iRGwS+YZ78rvaIk2yENSnBzTlhMiBayx7D+5wu6/+SWq2tZkzMKnLNwrB7
	zNAx5Z6dA5mwWiM/16Gm3ISYyySuZzYJioGVhoE7comW/cpig==
X-Google-Smtp-Source: AGHT+IFI1Jz5+4HiFX287SNO94LfYt69O5JYB47C+TpK4zkXyaRAW9YEj1Cqw6RmpxiiCuBiy7+RBg==
X-Received: by 2002:a05:6000:2209:b0:3ed:a43d:8eba with SMTP id ffacd0b85a97d-429aefca8b5mr2476699f8f.52.1761739724414;
        Wed, 29 Oct 2025 05:08:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] rootfs-postcommands.bbclass: add a note to the login banner when root-without-password logins are enabled
Date: Wed, 29 Oct 2025 13:08:35 +0100
Message-Id: <20251029120835.4075555-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029120835.4075555-1-alex.kanavin@gmail.com>
References: <20251029120835.4075555-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225454

From: Alexander Kanavin <alex@linutronix.de>

When enabled, users will see:

===
Poky (Yocto Project Reference Distro) 5.2.99+snapshot-1dac0d15f2d979128cb449b59bf5fd69b4ba5084 qemux86-64 ttyS0

Type 'root' to login with superuser privileges (no password will be asked).

qemux86-64 login:
===

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 8b5822a0b5c..d3a569ba3ed 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -5,7 +5,7 @@
 #
 
 # Zap the root password if empty-root-password feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "", "zap_empty_root_password ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "allow-empty-password", "ssh_allow_empty_password ", "",d)}'
@@ -255,6 +255,13 @@ zap_empty_root_password () {
 	fi
 }
 
+#
+# This function adds a note to the login banner that the system is configured for root logins without password
+#
+add_empty_root_password_note () {
+	echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+}
+
 #
 # allow dropbear/openssh to accept logins from accounts with an empty password string
 #
-- 
2.39.5


