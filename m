Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4947AC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 09:42:31 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.10643.1715766150424950575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 02:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OGA5oVF7;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ec41d82b8bso62780595ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715766149; x=1716370949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbKrsuYyp8H5K9w6JiW5g9ddSP0tP7aVqLU9dSXLl64=;
        b=OGA5oVF79jPje9lCAIsIaW00YDpLwlzK0VEyhpB1p+5e7Vb3+4JEAnM8cuWShpLDbw
         f6CNWKWydPZYsCYcd2PNxBTdjzd8sYo1ysf/ZylLSNJ+bVZy2fLX/hC++IIC4APAzEW3
         +10DcPXveYJH93YqJUdnIb8d9IuZbKo/jEgd7IYqTGGUfhHVCM4V1tq6+n/4hGTOws7D
         +7aSZ3mt2O0hOmvfQXSN8Yp2xrOvA70DGtGHmD7Se8SZmlOZG1VgdUosukUqS8miPlgR
         IdiEZKVHWI+xOMd2Ixs4TckgIUPIER6ARab7aGW5jLRMoLDLVoqnsSXL4mx/HPvmLS5Y
         txCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766149; x=1716370949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbKrsuYyp8H5K9w6JiW5g9ddSP0tP7aVqLU9dSXLl64=;
        b=vHXRATD51aJMhp826/iAUwqhJyf5glQ0yGvBzRaAA12p+uDsNjFofrggl3oYn/cGHD
         uDKF1TLbq1C4KxwwYdAADBigQf8EbYrHWyJs6IJcymO5wDoCo9I7h1oPKMzknUWq9MNO
         R2wjKYjeQNakvvmyHwKaqIJA4C4Bqp4OrH4AJhHepLGmlG7ekAIxLLKtlD/jblGjRKq2
         KehWx8ePR1uN/DdPMwNpyu35PnasSh81UNLHxQ9HkwhfLzTS5kzTLIXHARoTyBPgX2jP
         Q5YERzkeBmP4gRN1BUb2bO78lnlYj+/366rz/WmY3fYneIg2VHft+6ucdyYY5Up90E3x
         QcBw==
X-Gm-Message-State: AOJu0Yw/twIUCzWYgMsg2iUQpSbKbyqGOlpgZ0fRcDksNhcrMC5MuHv0
	zhAiaEUy6vBQf0+xpXwVbk7+z3h7e1GaK0u0eBhnvOeClGVCoRfApfkQuVd4ScA=
X-Google-Smtp-Source: AGHT+IEKpVjD/EBxmZaEvSCIx26kAhlyY9gmFjdf24YD7KAvGvaeenQGF0lGOlQ6KeyfDKFuPzWI4w==
X-Received: by 2002:a17:902:db04:b0:1e3:ca5a:2d9a with SMTP id d9443c01a7336-1ef43f52059mr193011135ad.53.1715766148804;
        Wed, 15 May 2024 02:42:28 -0700 (PDT)
Received: from LL-2917.kpit.com ([103.85.11.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c035605sm113226735ad.184.2024.05.15.02.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:42:28 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bob Henz <robert_henz@jabil.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][kirkstone][PATCH] systemd-systemctl: Fix WantedBy processing
Date: Wed, 15 May 2024 15:12:18 +0530
Message-Id: <20240515094218.92772-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 09:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199273

From: Bob Henz <robert_henz@jabil.com>

An empty string assignment to WantedBy should clear all prior WantedBy
settings. This matches behavior of the current systemd implementation.

(From OE-Core rev: 8ede0083c28fadf1e83c9256618190b931edd306)

Signed-off-by: Bob Henz <robert_henz@jabil.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c653bfc68b06bfd4fa07ba18322599a130b1c59a)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 0fd7e24085..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -26,6 +26,9 @@ locations = list()
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
+
+    _clearable_keys = ['WantedBy']
+
     def __init__(self, root, path, instance_unit_name):
         self.sections = dict()
         self._parse(root, path)
@@ -80,6 +83,14 @@ class SystemdFile():
                 v = m.group('value')
                 if k not in section:
                     section[k] = list()
+
+                # If we come across a "key=" line for a "clearable key", then
+                # forget all preceding assignments. This works because we are
+                # processing files in correct parse order.
+                if k in self._clearable_keys and not v:
+                    del section[k]
+                    continue
+
                 section[k].extend(v.split())
 
     def get(self, section, prop):
-- 
2.25.1


