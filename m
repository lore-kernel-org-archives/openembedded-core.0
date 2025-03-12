Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FF8C2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4768.1741809392842610534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m9YPdiwp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224191d92e4so4665455ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809392; x=1742414192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PViJimqJpiRT2Y2pgSizK7mdFdDRBw0tedw/N4iN1nA=;
        b=m9YPdiwpiArqaFQcnpSkXSRPF/kZXtiSp9GfsZCU7HP2eOAONbvSBoChSrguLAd4qS
         h/AeD15tWejw5qcs0ZglIYLvVbbeifHAmoKkReI5hHyDQmnJRdHTo7ox5wZgpa2SB2Y3
         NeBwzF8vE7n8M4ns0hbQGch+oQjAm7CfZhDgGSXLnYePX6PATIiDQ9zxzFES3wyy0bK4
         YYVUdPZrgh1l5MWckpCCAhjUHPGJ9S/Q3BoUNbc2CsFhUtQjS3vn/NWAHVK9BGfMx9a+
         PY0DNb3HzPLS3GnSuQEO8Dy9t61/lGTsaAlSKbjnWW0jdwUeUQXPPdmhcA87Nl88rirQ
         PbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809392; x=1742414192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PViJimqJpiRT2Y2pgSizK7mdFdDRBw0tedw/N4iN1nA=;
        b=tff+R8tO4z4f5uPcFQKTN119IGXhRS1gcZ0ItYQjtBsin7KjhYokxMaSR5Y9sRceaD
         /PGa5yDfkCXOFHNAawzfclZNh0Za0pR/ueqLPeHtFG+Ck87uYw9fLDi2NA9+fcp4aNh/
         WNOmDokEB71WIi4oH9uJUPvxVRVixB+f/E/aHUEczEsm7ilHAadJ6SM4FYXDIpeIQ22w
         tENWFp7zDSvYog4KPurt825B5/dYnKkRGDq9R1yj26zisKZ5W3hI8Oqx0Yb3TbSjreZO
         nfMjhFFBySx6BqNKYTdLnHG8Fa02EQvPPTVCuTxbUSmpRIamLmQxa0eTfdeqPa6ZCZPH
         U2Wg==
X-Gm-Message-State: AOJu0YwYBFW04Pxr5ja4l7VtG0Mx9We7RErGeB9UsrtsaZVrJZWORwQe
	QONliLVmWHCcnVwKRcfvgw43Wvex/GPaMbIwi47lL0HfJda3J18FxvgdTB0T5bxXrwxuzGHcMYL
	F
X-Gm-Gg: ASbGncv1/8J085UJh0PryqUO0RjBjNxZz8gW6BkY2Egoxdr4zkSUZn2cbE1JohVmmka
	wdOu6zLVP/2m5+Ua1GI47aJ3/hx48Aq1AO4cegKtoCvDxcVUidj9B5kd7rF+DM7j4NVtBNAaMzW
	Xm1S63E6sd1kyK8WjajzEg4k6iTM1G15Rmvw2vXVZVLdj80hcroUbc54t940Dds7KB3Ebs+MNZQ
	qpf69Fz+UJYdFOj4OIlesjlwYWQccjnx+9yl4gXyWPe7tM5OSCWba6rYV9JYlVy2kFaRGeEuDQf
	p1o9zvB55Y2i5qsN+10btj3bxt3S/m+e14s=
X-Google-Smtp-Source: AGHT+IF/J4lIHubV2/JYynhbX1S4M1fNapLsWx8Blsj3DTP2PDfgm675+PkWH0uL4WhtTCNXT224OQ==
X-Received: by 2002:a05:6a20:ac43:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-1f563f9a1a8mr26757399637.13.1741809390665;
        Wed, 12 Mar 2025 12:56:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/28] vim: Upgrade 9.1.1043 -> 9.1.1115
Date: Wed, 12 Mar 2025 12:55:43 -0700
Message-ID: <f390badfe5b3a1a8cc70051075a5e641ff5abf2c.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212717

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-26603 and CVE-2025-1215

Changes between 9.1.1043 -> 9.1.1115
====================================
https://github.com/vim/vim/compare/v9.1.1043...v9.1.1115

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4ac9c58c80..823cfe24c7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1043"
-SRCREV = "9d1bed5eccdbb46a26b8a484f5e9163c40e63919"
+PV .= ".1115"
+SRCREV = "c0f0e2380e5954f4a52a131bf6b8499838ad1dae"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


