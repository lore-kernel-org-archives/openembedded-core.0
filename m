Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D709DD1F9B5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.4744.1729018283106697808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=upfRUg/x;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so115026a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018282; x=1729623082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHhFc45gkTDwnVX7xEfn1lHsJujv42R3yYz/bSTiI3o=;
        b=upfRUg/x/vS8caRbVsZW/sqzITWTqlKSoAgiJCBIoMIVL4xPiEj08uCgZnWR7wggks
         ogEOQz1HgRPkbykkFZHlXZfbYYMRgLKAI0TFKX5EhweAKIt+ecb4fDIzinXAwzI1+FHJ
         AKYDbMkshmhQTnh/B1uRP3AkovaUvxVnUMxFA3Zu7LgLeRirZG7g+92udwvE1bCqKEmU
         H2XxP6nenlfwnnriPefDSNQTkgDkwjRSi0MoP7QcpMWxwp0eXbnlu7KRHTkO8dR7/ZrI
         vn2YjTI2JvJR/lW8ryTG4oYss5aH5f+XubGf2KaGmvv+lO2k3rZdmsSvcVhH14XETlh0
         dLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018282; x=1729623082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHhFc45gkTDwnVX7xEfn1lHsJujv42R3yYz/bSTiI3o=;
        b=b7ymdHGZsarck2hap3JRpLk0K+vXZU+O4XWAEHOyCapukntsC5xIv1O/J/Ff7llx4T
         iL9XbttJ47x/K9TodES0O6qWCDOo7s5+YnY67To4eCgmj9oTD2juqq6xX943NrSTBJfb
         u4nq7vClBVO6jWE1/9cuWnpkdlYCA56Vm7Sgv5tXoI0tXAn5eaGEKG/PYd1oyxs6SJrf
         FWLPQ9kVJo9qeoiH6k49f0I+Aql8zoZr3xb7lrnxi4K5+30UIHe0UdqdWrMlmhiiglyU
         ABrByi7RDMqR9X1zLqk2IFm55NPSL7sfdwroLG7qCy/uuRryERwsznulikRKqMajYldT
         JXdQ==
X-Gm-Message-State: AOJu0YyAl7q4PvhylCmp8IZh1ymL203inrf7JHqFO/2JEL00bWD5pMkr
	4f5XXDNXrdQfrleqVii+7U1r5KhsDD1UXuYZnQj1AiTXwepkSB7W4lmbU+/dIvhnGjHrrA5rYW4
	a
X-Google-Smtp-Source: AGHT+IH6NKh6V8VLWvkzzjuLC7y49ZyKaU0dXQr5vnR3N6ZiVo5cbjPGJDuT8OrPgKf6OGRnugNUVA==
X-Received: by 2002:a05:6a21:168e:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1d8bc81269amr23003019637.10.1729018282373;
        Tue, 15 Oct 2024 11:51:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/18] runqemu: Fix detection of -serial parameter
Date: Tue, 15 Oct 2024 11:50:49 -0700
Message-Id: <44c1f003d617ac20527926b4b321ffd1fe4462bb.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205936

From: Jörg Sommer <joerg.sommer@navimatix.de>

The pattern `-serial` matches also `-device usb-serial` and `virtio-serial`
which are not the desired parameter. This causes the serial console ttyS1 is
missing and Systemd's getty@ttyS1 fails constantly.

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6d035894120b45b42f146ab5b3110522c58d178)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index fe395d1bc6..2ab36fd03d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1487,7 +1487,7 @@ to your build configuration.
         # If no serial or serialtcp options were specified, only ttyS0 is created
         # and sysvinit shows an error trying to enable ttyS1:
         #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
-        serial_num = len(re.findall("-serial", self.qemu_opt))
+        serial_num = len(re.findall("(^| )-serial ", self.qemu_opt))
 
         # Assume if the user passed serial options, they know what they want
         # and pad to two devices
@@ -1507,7 +1507,7 @@ to your build configuration.
 
                 self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
 
-        serial_num = len(re.findall("-serial", self.qemu_opt))
+        serial_num = len(re.findall("(^| )-serial ", self.qemu_opt))
         if serial_num < 2:
             self.qemu_opt += " -serial null"
 
-- 
2.34.1


