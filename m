Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96802CCF9FF
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.22496.1761816180830724829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzaBuT+p;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b403bb7843eso177646066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816179; x=1762420979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoX+KwnhGoKwE7lczmTZPlN5nyRDEuLFySNSAm5Io0U=;
        b=GzaBuT+pFnI3uXzeHnga544OX+14AFe7CRFRE4C4A4WEXI+BBWh52vvjbEkbRHo3ZB
         jRl1w3q2LTuQY0MO7ufxQhaJH0B+xunW1AdZKABh7cRp1UlGa1+bqoINGhevQwQoqRni
         WRsGLfNj/pSQ+xxuQ8JwAC55DMOCwUFOYHzyvdzw3TnRXrMBpfwgIChH3ihIVpYwn4bp
         8DWiJDxtKof+oL8w9oogQoFAT5nHtUzj0btFQQzZKLVXmiW72/USjVKsPJEglp4V/y4Q
         4U5W4IcEnvz92aEqqHGdBVJOsI/eVnxzMdBaGQo2cyNFaUla1WyomTUPT7ejIv2BqwuL
         rahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816179; x=1762420979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoX+KwnhGoKwE7lczmTZPlN5nyRDEuLFySNSAm5Io0U=;
        b=tK9I0hFeaXWJuXSKII7CA7yAgYBiW5C4wVrAiI8JMzJm3lZ/awZuTm/jkJysGUr+XH
         W+6kUpYebs442hwv9uQbQqiaMfiwRhiBdTvaU0yWZeK6xPPaxT7NCmKR34JEDAfSaQ7U
         7csDVzExw2n4RKFeqCtUQYL95QFdjXkjV3J1IH29ZnRSjXfi37GFzcibji50yjuv9ZkH
         fZ2ICNEkvAC54N3Za2zS6Pvslv+NZQpoSPvZeLk6OSK0/fRfqCl+Qc0xc2Sw5ARllkaM
         d6ZezjVRBIWJmI8iLuwrhVpil2oS6TtaaECzNyq8HNRKD9Z7B8CxytYl5mbPAmDXJRNh
         vDBQ==
X-Gm-Message-State: AOJu0YyCR8mfpJvB7WDWgGNmwiCcVFctOXaEJobgduKLb8TM5fGMs/rw
	Serv4vNoZIuwyGvKDn7yZLGCcamatetGymAbRRPQ85a4F70OjZYnoU/dLMwkew==
X-Gm-Gg: ASbGncuGgcGiK7jmLDwobnJwtRImhfhe27ELjSbAcnA9XmAWpqzs4+jidCD8oEuGQQz
	gpvyvEgEgC806FCZTtAsHxCTmDq6wNFVrGBoMxmYUbIBE4e+rxFrRHwCkxgwJRu3MAZQSABe0kY
	+kqjfP70vIVWZU/GU477LZQZQS5WMCZNINniiw9bwRf7i7vJC86s9YkakxElmmPgXASxhzXSNUt
	r5H8vAeLv80tKr1vsIex04eZ10DkpSpg7OIIAqAp9PTqVUkLGnmF5yl4xn32xIQ+tD9I41chQxu
	Q92jv2J5ik6IFBYxJs+kGWS+VmRQK85YDrSBziyPO9mAM60gY+Sc2NmRE/8lzQKyPaf1fcqSWTy
	wp3HNW1uvXduF3JLg5GOLrSnUx+sv9hiPeg1xp69X9k5bciRLgZv4KtPWNyNqY72ODxCVM/VT3T
	49rcY4evIB57+JaXQPCNEB0z/NHrP7FgKOR6MPrxKGkB13E7Btpk7RWnXyQTP/7UZwAHqkGrvAh
	Zn330AcsRZBRIQwDCa5jquEJVFmhQ7Wa1nkuE7nXb+u40Hp+Q==
X-Google-Smtp-Source: AGHT+IHqot9vX2WibS+7e/QpHnIw3cZSaW0f3gkHTfdDck3m2LSefSn56ckk2lvdfM40yYMig1ObCA==
X-Received: by 2002:a17:907:94c3:b0:b3c:82d5:211c with SMTP id a640c23a62f3a-b7053bf500dmr243520866b.27.1761816179138;
        Thu, 30 Oct 2025 02:22:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 6/6] rootfs-postcommands.bbclass: add a note to the login banner when root-with-empty-password logins are enabled
Date: Thu, 30 Oct 2025 10:22:48 +0100
Message-Id: <20251030092248.723968-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251030092248.723968-1-alex.kanavin@gmail.com>
References: <20251030092248.723968-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225484

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


