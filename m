Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD16C87FD2
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 10:23:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.58712.1753957394866445259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 03:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sp88wA1L;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso3714385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753957393; x=1754562193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldfEWDMpmygerolvgYSpyiaBGKpbXlx7Jcs1SFsC5Ho=;
        b=sp88wA1Lf58Np+bp+xWP3ITp0w/0YHdY/bIoCrglY+ytKEM30w1TPNdd7l/a2D+l6d
         dLqITV7rWxfhmOx5EehsksBzu9nWx0tAquY1q8g5Fa/hjvsNDEfDsujV4aw8QNCLFpG3
         YPPSUXEP0ndIvnltiDbezEzV8HvOwCJi0eGfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957393; x=1754562193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldfEWDMpmygerolvgYSpyiaBGKpbXlx7Jcs1SFsC5Ho=;
        b=K5jW2jmOBGJ6FNPUD3b2PazCo/TQ7MLmN2M2vcGxj5bMSo9ytdl0OVSCVW3A+BACL/
         MJaQ2DLfy48BJRVpbpwbOqKAYtpIZOwQP3RBbOy0mSaeNhAC1s8VgrOua0/81Opw8BBs
         AxqnEqlT1/Zek7++cAt99w5OHvYIRakxRvJoGk0tktZr5fs/sMiAXrbYEnMedSvmU2p+
         PmQTfhC1sxik6ZDTcVbVcpaMGZSt+OzYNHTRwpIHxzaxMifIKj5C7Jvgc5yG0Gkaa8lC
         i9E/cmZ20aC92d+bY428IJAB05QPbXmRsNcZoSn8LSDqDysB8DKQfvqUdo4S6bMRwHqs
         e1Jw==
X-Gm-Message-State: AOJu0Yyd2sH09s++limirqBxeh8io2gW+IqAvttyqKsC2d+mEvb/tfx8
	RM4vmwkKa1aDGcIUJdQigazA9Vvu4i4nbTFpEVw9iE4XKCkCfERWqpFWorwPHixLPlh9DpiYJIL
	9iywxtiozzQ==
X-Gm-Gg: ASbGncvu6DIe1e6gX4iHFNz1QJy3+h9DKI4m44BsRkRf6wf9pl8/EovA60qL3bSpZOu
	Svc6CBVZNhdEpTo5YEaYx7GJlf2rKA5gx/LVpynFEbxdrPwDAxZWEDbk6WAf4/uTy+QMENBG9Yj
	BFYJJwi5CwVYprkpzi6r8XR/GxgLpkLhqMHj2lplZrF7yDM0h8zQda40Jo6T0+rGngtQoyF1DTn
	qxINcvOa8XQ1i94u68LC5EWa4NPnZKhRlNzw+ODs8UJwjFT11p6aMJOny/1oqVPzYLy8EpzEQXC
	Tu0fpEjRI6vjnFSkmWMmKqXqMQZybo0Do0bPQ3b2gmmHbhzIWvNDKsOaNTCESgIS6aoatVeTzcO
	8LBVSzJOqGTDFv/XZEA0g9Qo2/TKBn4dqxAlkLCs09mlK/4rtOjA2rm17ENtPQyN+kF8YUIDInO
	Ggiw4M/c33T/PZZdVI3f07MSIFceluGCWoA+8=
X-Google-Smtp-Source: AGHT+IF0x0VVgS+Z3OiEOxa5RkMgCKFcam4qLYqutmiMOnUsIC0gK3olVWclJm/GOnodsyaBhOr4Jg==
X-Received: by 2002:a05:600c:4fd1:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45892bc6824mr54958625e9.19.1753957393011;
        Thu, 31 Jul 2025 03:23:13 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm65169445e9.4.2025.07.31.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:23:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4 4/4] runqemu: print snapshot mode state in console
Date: Thu, 31 Jul 2025 12:23:03 +0200
Message-Id: <20250731102303.3513121-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731102303.3513121-1-yoann.congal@smile.fr>
References: <20250731102303.3513121-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221188

From: Yoann Congal <yoann.congal@smile.fr>

With snapshot enabled, no change on rootfs will be saved after qemu
shutdown. Since this is not what a user might expect, print the snapshot
mode state and its consequence in console at runqemu start.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v4: reformat message handling
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index da53265219..a57fe794dc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1053,6 +1053,9 @@ to your build configuration.
             logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
             logoutput.append('ROOTFS: [%s]' % self.rootfs)
+        logoutput.append('SNAPSHOT: [%s]' %
+                         "Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot
+                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown.")
         if self.ovmf_bios:
             logoutput.append('OVMF: %s' % self.ovmf_bios)
         if (self.ovmf_secboot_pkkek1):

