Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5358210A88CA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:54 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50861.1774538212364709793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UaEeZm9L;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c160308a54so2790858eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538211; x=1775143011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmc/+lL5IB5Ai3Y+k632LD3rgQsDO9ze9+fQ62izFjQ=;
        b=UaEeZm9L5t7UN02LXQK6Gs3zfhI2+OztYvsUenkcQC9ylxgeWnLf3nCLASinI0LSeA
         9LggsoHKZsU+jU76oYnPwG9KcHYFLK8kwzZWFyApd6w8vVxHcu98c2IocVnsY9EJTy5T
         4Y7k9U+nIszx2htI9hiqYhBcghSBA0aQ9L9guubQ8RUy6lKFHVAVyLQRiFxtsf6p9V60
         HtFLrhtDjAG8KDdARBoVLUvKAibjhsQ4fhQuz2aKw6Ct0Njkv5TbCNgxWz9x+gLKWqwP
         VJ5+yMcnH89RsSd5yOiK5v5jjjTCqdnfKaXTcgg/MGsjlOJXOiIJ9f8Yc9YPafbqfMyi
         UdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538211; x=1775143011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmc/+lL5IB5Ai3Y+k632LD3rgQsDO9ze9+fQ62izFjQ=;
        b=Rx063rb976es1ovm3lbjf8ZIc53qCGG+dLeMRj94eKCC14g2PwYxcYMXyZ3Zd/7OH0
         PdhAkcx/KRdIPUwDVp5CosyIEa32WGyKZCwCsJ9ZkV0rsO4bed4oVwZY4HZsECdHs0fs
         FK8yUehMGeKsgpEY5O/BiYqyVayj+GPXA78rnuFt9FyZShwdktphQIF+4Y6kmtzs2Eag
         L702vb6J2S0EifaA2mgeH+IqTxvQw7EY8ghWL8ucfhMTHH3CY9v2GLxRV59QL5NNivTb
         7ftZI2G7GnI+Or/6mOA6h3NcM3OUoofVBpuIEtgSt3eY+E/FRnPYIZa1JvToK2WzkMH9
         smOQ==
X-Gm-Message-State: AOJu0YwUNSKDgaD5Hw9eo6IK5ivnzcbnU/Ikg2QpImUKoOw2/hrC/rNR
	RaLrdyZ+myaI+9FyzQFl5lRr0LfESRejGsjVa5sbT36j64jtuVEwzNkXRhfp9Db8IWg=
X-Gm-Gg: ATEYQzzpn7jOr02rUetA3hykVRxx1TzVclmiDAIYw5olA0ui+AIJMfsgLIo/iUTcgmZ
	p2Xm72MkZplfBYqjY6XYEjjS1k0Jb1eDlclxI+8k6kAVSpJiFok4bJvixYzd1JKTj6Z/W5PELO/
	DbEhC/wMmhPglpmX/W42FAa0YXBD1jbeCpokyY0KvCyJEzscD3jj6fOStL3IC1qIHJBLhCjCIAe
	vp+fjY6KejXeLkXEL/eyBcYKSfdq2EfA6v7aWPMhQyauYbBnXlQ31SgvccN8Z+FKqb58pQGzwoc
	JLQMCP9ZUsNI4ln6ye2eS8N0fVBKp5zCn8rRbOJZleMUcVTfdSoPjI1m2Rp5zkaMd3JtrCfaSjE
	gBeRopuoe6kI0nNs20j/8BHC2acNaqmJs7r2/H5LrojLAC4cZUmgsiv+izvWTYJvxsMhOETlX7t
	7kwknKks7us60beqsmlUsFP1qzNULGvrr96d8RL2ooI1EzHlRgPlT064gmbep+L9bP2SAqJseGo
	NLGefhI7UnGPA2SS3bjQtnQzTXLDedL66rNMfwmirMY6DZH1UVDFTlHKE+g
X-Received: by 2002:a05:7300:50b:b0:2c0:d690:7bc with SMTP id 5a478bee46e88-2c15d381154mr4787816eec.22.1774538211412;
        Thu, 26 Mar 2026 08:16:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH v3 5/7] nativesdk-clang-glue: Delete do_create_recipe_spdx
Date: Thu, 26 Mar 2026 08:16:39 -0700
Message-ID: <20260326151641.3974221-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234025

Delete this task, it is in SPDX 3.0 implementation

Fixes
ERROR: Task /mnt/b/yoe/master/sources/openembedded-core/meta/recipes-devtools/clang/clang-crosssdk_git.bb:do_create_recipe_spdx has circular dependency on /mnt/b/yoe/master/sources/openembedded-core/meta/recipes-devtools/clang/nativesdk-clang-glue.bb:do_create_recipe_spdx
ERROR: Command execution failed: 1

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/nativesdk-clang-glue.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
index 8e5622f6c1..d113b6cd9a 100644
--- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -34,3 +34,4 @@ deltask do_unpack
 deltask do_create_spdx
 deltask do_create_package_spdx
 deltask do_create_runtime_spdx
+deltask do_create_recipe_spdx

