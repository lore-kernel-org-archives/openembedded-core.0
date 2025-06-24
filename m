Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7285DC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:14:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3071.1750750586039975668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 00:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=X7Zgqgqs;
 spf=pass (domain: sifive.com, ip: 209.85.214.169, mailfrom: jimmy.ho@sifive.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234fcadde3eso69218295ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750750585; x=1751355385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/lRrFvPPyOSCHS/QbcKFs+wLx41aWzJCIPvRWhtv4eM=;
        b=X7ZgqgqsDIkzseNMmMZE+TTjwPIERi2rGu5GGLOg/FGzaksKfl0CSjLDrrcfYHfBMl
         ug062W3s/eMN1HwwHeWmeyZfZq27wiC34nH2SnyJ00mAqIBUrbNmwyexBMiDuSBtzKpj
         kTargL5M0lY/A+KIIB/nrzaqQyC9RziFrdiUP8X3woTt42JY7fAVbcbiQpvUCg6PqBIj
         7YuYLOdRvQDq3WyZOWVyfFeIBSaciy5ngSL7C+lowR3WjhnMMeOD9h7msa1cy3xF7ch5
         pBnYURcGo/bRn28Rv3+1/65gYxkBjk+8DvTFyT4pLw6dFfXbik7dJL4YSy+aam4y8neV
         VoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750585; x=1751355385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lRrFvPPyOSCHS/QbcKFs+wLx41aWzJCIPvRWhtv4eM=;
        b=cgs1MV4rvP8eOoTPkmtAYV395q8o3aRMJQHhtf/28/AmJOtGMpaJU2FIWAycO86hbe
         GVtaFH8h8qVpRGnbNOu+M2r/bZ/hjGuTDpCHuPiRp1isCHvSb+RRVl8buJ8kSDI29K0E
         ufgnccxHPMDwAEzOTesCD8yzT52cz4unwbSHn9MJrf/RXUlixB54OIk0IxDtnHdfbQYG
         PWeant1K7KNNQwirhCfYRhCasNMtz+SoCSy9J+zAdcZS56/1WanE0JyW8EjKi1gTEFGC
         +GQxG7sdbKesO5PQ6115xyTj/bAFKmnMmb6eUski0WXDMYy49w5BiPVunPgVeGHvYjuC
         dZNg==
X-Gm-Message-State: AOJu0Yxnm6nYGTF+nYN/xOkfhbwriHP+JsU9EF4qaYbIr3kcZQkm1RNq
	9R8TSIU/ASrUHgpFJygKrWv3bJtzAvdmLPdVoacQBga9b0eqNwUrjhJQXmTptlvhLsPWKbee9Tu
	V7/dH3nuhJZe8nMU6G8UDqGrvD/q8lkHAKHVu+HT65ASsJHzmoQQTEGRs20w/zWb/Q5v3kV92hM
	FgKxB5hJTFCawQ4A+R4b77tSFZLNr4RTQLox8mn7RA4NQhF74V4Dyq+6Kk7VUlKVhl
X-Gm-Gg: ASbGncshEuTiae99EGjvLbjTkKg4FRbbewVQAg/KUf6G83OfBNw7vumLxRru04jd2BS
	X437qLGuDJU/MzQZYURndJVUGusoMUVSnJOm9bXaw/5AwoqdWZCuRlbO5akpQ1ZrxOBRnOnhWSX
	WgjSJb2h++YTS48CJSB5zthMxLuMf6iNS/yPc5hGHcOPhcKNTzVM0jCFHGYUQwkc6XrQMZrapTy
	TyrhysiXeZwUeVyjMFfCq8T4hD13+XyVTYA8oLZqDrhzYBelfItq/P5h4EqsAmAsarOzEk72JE4
	/MYVSr03J4OmMzDY4C6udZRlG5RFamcNNCrXg6vW22JEDuV9HWPO6kTUCCcrlBeveGeUThvFT03
	73fXqfE1TmA==
X-Google-Smtp-Source: AGHT+IH9H7pNPSK1IAC6wDElrrCfc/3FZ7u7cL6FPDFL3dcPivxVMZ1XOUEpWElRDO8bHhO92q2dKw==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr281372015ad.16.1750750584840;
        Tue, 24 Jun 2025 00:36:24 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23809dd42b4sm5041825ad.53.2025.06.24.00.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:36:24 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH v2] nfsrootfs: disable warning message if bootargs root parameter have not been defined
Date: Tue, 24 Jun 2025 15:36:20 +0800
Message-ID: <20250624073620.2689-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219260

we have case that don't define root in bootargs,
if [ ${bootparam_root} != "/dev/nfs" ] will output warning "/init.d/85-nfsrootfs: line 4: [: !=: unary operator expected"
let variable expension result become string to solve this problem

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
index e67ee4c25d..30555aef55 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 nfsrootfs_enabled() {
-	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
+	if [ "${bootparam_root}" != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
 		return 1
 	fi
 	return 0
-- 
2.39.3


