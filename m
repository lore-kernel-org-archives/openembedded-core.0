Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F730106B522
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:28:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21345.1774441719695923262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q4/fn94a;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-487012ce896so12495175e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441718; x=1775046518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaqjEQ2mayhEMDszu6saUBlVdLTuQRSWVpzVfFMl67E=;
        b=Q4/fn94adDzrLrodw6aJ69Seb1bdltL5Agf1ZXCUoBOek7Vo4Gy4SjQcVsjqQyktr1
         gOpx8bV2FdeOS1A5a8n1Jcqv+T2s0vvifDRc5gQr9ZATWqdo1LDkkUsKnXbxvoJ05jcy
         EE9Nbv8gMuP+BBZwh2R1riqpLN8C3QzrMh3YdICDJW/exRzDqytzzyiM1/z8DrCMQSZv
         Geo1mZ2lxqjORBayxDAgsyFaB+XMHr7ac5li//pv2AF2ejn2qrpWTkOWGGVjwkTzHxL7
         8elt6zYfppg5v6Lw+TcEblEOPmsXntv2pJwSilCPB+c74Rhqs0e5jSh4xL0zotU7Ro+U
         kX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441718; x=1775046518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaqjEQ2mayhEMDszu6saUBlVdLTuQRSWVpzVfFMl67E=;
        b=nTuJX7Qq8kFRrR5rXQixGQ9YMoTOVWWuH2ULI221AITJvqopuETof+lvHeW8lj9AuP
         8dIsz2rZ0pUZmhWp1DzEY/BWw/uKvi7zFNHgVtbzR+MiqOxLs1TJc6DWEmgciBrkTEa9
         JnV5wUeczii0moTYNBAL3ofgXTmAvRvfvcA/et+Xy13IiL9ZfbI8vBrnZ1zZ3gMUcYZz
         qrt6EyLTg5aIuJygdkdIeMpiVaAlaAE6AZ0AX0jZ0r9obxcDfwvQGwL6k5iN2CK2FK4b
         mbP5Au1inA38Xqk41JD2ZmtWZq//UR/YfPojgEBNtAb5gDEg437t0jizGLP7A19yNE1s
         7SMw==
X-Gm-Message-State: AOJu0YyvkfG8ctGsYKmvhOL9Fh4QmCb1PLodk7dh87BKKJNH6UssMIDA
	5IHcW+5jGMQtt5NWYLlLRNqKP4ESvhExMEgdmqxaqIcug3sckCtvwmr76UdPHw==
X-Gm-Gg: ATEYQzyu1jt/9nVcsjPYoCM7kiMQVkLXT8wd7tRkpN9oF8tGoybZrt/E4Lz3ehj5XKF
	kYdap7scaiQuIrIQzOrVUU5n6MoADf8ycCVGy0kOysQe8vBbsRT5w3GYrCyBEqllJET0Z5VEtiK
	2M2QPMYDhP7QQYa2ul36M0yrmb6E/ZLsCEam5Ji6vCCsDVfovzvhDmCkoPiBLdtr8vVDX+zUlKV
	LdWG/Sqd1eihgifOv1qFsL6w5Cu7n36oAbeew34bZoHejnYc5GC+z2PEAuHj4gXBpntLD1ONHLA
	jVE5eDpkdkTAOsfGn7Zu/DisfcMJxYcNYvkNb9cZhUq9wojCxX6NqFYvo8o30kmlyfPW5pZkh2A
	D9PKdXQdY8yycCGV9vTzmMRRbGQVLXxriRITKfZTSjKnFQyP+MZuF/QX2OQ4D6tEtQgNocykwCf
	aNGUnb9nuIQk0n8tJFEjHuFGTh7+6AyHsbNpMsL2h0DY6iaXafgrFo8NiiKCBYlBko+Oas4w==
X-Received: by 2002:a05:600c:4e0e:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-487160a63eamr48615425e9.29.1774441717743;
        Wed, 25 Mar 2026 05:28:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40594735e9.2.2026.03.25.05.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:28:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
Date: Wed, 25 Mar 2026 13:28:31 +0100
Message-ID: <20260325122831.1469278-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233895

From: Alexander Kanavin <alex@linutronix.de>

This is a followup to
https://lists.openembedded.org/g/openembedded-core/message/233609
as the same issue happened in a different selftest.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 1c71333190..fe1fa6dac1 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -7,6 +7,7 @@ import os
 import time
 import tempfile
 import shutil
+import tarfile
 import concurrent.futures
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -41,7 +42,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
-            shutil.unpack_archive(filename, debugfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/kmod", path=debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
                 status, output = qemu.run_serial("kmod --help")
-- 
2.47.3


