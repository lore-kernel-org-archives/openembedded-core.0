Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BE9CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 18:22:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.26215.1759861367285246062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 11:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YO7fsn52;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so62765055e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759861366; x=1760466166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlPIyNUOzowbbN36PmX/YqJJdN+gl3ZkayiwheqFrxg=;
        b=YO7fsn52dxJOfhj6huHdng3ifQ6VP9S+m6FCoO+PEjfBlPoJrAjN4T6Sc3IU/EYjyE
         xG7s7mFKMgfzqWjcl/ENk2NIAkesqx4CRr/S0Y3iS3ed/WwrQpms+knjvbxsnLxyZVfS
         GN8tjCPWWoZ3I5rSSmWRgl2O/0LXfDdIAMU/tW9sPT8bfg9j405BOvsZWiH56eJnqWh7
         y/AftpYdeRTmgMFef6lqPR/tm9eL8AeuNt6xSvV8EBHG/EteL8e00UetbyPHBybPLRn4
         p98O1hXDpOaOy+9YjeAJOLwL6Kyns5HGAE6nGmaRYAvbk1K2ApavlxFLzw/Cnubj5XiU
         FfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861366; x=1760466166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlPIyNUOzowbbN36PmX/YqJJdN+gl3ZkayiwheqFrxg=;
        b=R6Tz3BtePsezWVTWK851raZYDclUlYuMgV3TnUmQAYZJlePyy1RF4zezKArFNIcYt1
         LaPXEZiEL5YT00OWmOwY8yAdyqCS/OSVVQxpvN6b2FjVj/7xGVp69YQ0UzPZs/a4Hgph
         f3XOPF/zz9eortwMmURo+mNmh55ZmQzBQQFE31BwC0OJtojVQ1zTe2jBdrQPPX0g2fL8
         bcBUIov0EZVYNM/IstWcWEDOsC08GuGJcgXl3Gz27x4tWkDIylKB+VlzOP0AiC6yXviZ
         hL+wWrbvcXr9pRm081+4t2T6q0e9N8aB84ErQLG5ZNnXLIeRUxXzQd00a+b1uT/RgBYT
         QQDQ==
X-Gm-Message-State: AOJu0Yz1jTZBmWjS8vsAanVgiGvKNKWf1zv5Ivt2mFvM2E0C6RxTjB/Y
	2mt7XCjhe/sWiawGq0DPq5KX9D2DQMDLnZHaRoZVLsal5fawidHShf8UMkaYag==
X-Gm-Gg: ASbGncvmL+BqXSc9rtWQ+Y4qC/mx1OipEfNhvhqdvSyb5ooqUIOYm+U98RvhTDXyWm5
	Jv22S/F+HmdvMMPMEFcKUGrrIAHDux7iqMiDb8ty7OAa/ihSL2Vv3D9hXIOTRsr8kbA61hjZXrn
	JCgtYzaRBAmjYulfSoGY4oS9TWNEyuqng++WUCyJTrWGuDmn+jBYPewubnflmPYhs7gs3KI0jZ4
	hAjh7ztghMGPbA0xpCkmhsOzrgTNz+tjAL/5kfbqMhUl+sP53IE3KRD8FLD60O/iIMTmOW1jLC7
	jlisWKBWukgawmwnjuPoFcggJRLxmMX9vOMZiQyQ+Td+J4Ctkk3oJ9PHq/wCvqoaqmmIFDCApG9
	ACLxm9olA5AmTtgzfUv1ZsmFCYeH1lQyHYCtqGA4P/+w5U2dg3K6jwujjWV0BqLL+X1T6HwOTVT
	hdDlsj+ZpBC0tP0hj4EPE5nExbcKccMBdAM6I/bvkn0ZKWZxYiyoFy+lFLU50AhU1sWO0MRyRro
	Z5j2p1Xlw==
X-Google-Smtp-Source: AGHT+IHDqu7QZrucX36ywy0ijlW4AcGNNFjZx9uNOix4rZSTFV87B8+tM8otz0qCdmWl2zg8bbt5vQ==
X-Received: by 2002:a05:600c:3b11:b0:46e:4c7c:515c with SMTP id 5b1f17b1804b1-46fa9b182e2mr4103135e9.34.1759861365588;
        Tue, 07 Oct 2025 11:22:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c0e35dsm4410935e9.8.2025.10.07.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:22:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftest/meta_ide: source the environment first, then change to the sources directory
Date: Tue,  7 Oct 2025 20:21:43 +0200
Message-Id: <20251007182143.1235445-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251007182143.1235445-1-alex.kanavin@gmail.com>
References: <20251007182143.1235445-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 18:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224550

From: Alexander Kanavin <alex@linutronix.de>

This too used to work by coincidence: sourcing the environment
quietly failed without changing to the build directory, but
now that it works properly, things should be done in correct order.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index c3a7df4cdf5..1a114737975 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -37,7 +37,7 @@ class MetaIDE(OESelftestTestCase):
 
     def test_meta_ide_can_compile_c_program(self):
         runCmd('cp %s/test.c %s' % (self.tc.files_dir, self.tmpdir_metaideQA))
-        runCmd("cd %s; . %s; $CC test.c -lm" % (self.tmpdir_metaideQA, self.environment_script_path))
+        runCmd(". %s; cd %s; $CC test.c -lm" % (self.environment_script_path, self.tmpdir_metaideQA))
         compiled_file = '%s/a.out' % self.tmpdir_metaideQA
         self.assertExists(compiled_file)
 
-- 
2.39.5


