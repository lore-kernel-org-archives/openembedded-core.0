Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0886CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:27:47 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.14340.1712158066535749605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MWfcowmw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-789f00aba19so487391785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712158065; x=1712762865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSfNe+CCGN0/UiyD22tdzpzI2zWqGAV/0E8NSdApxAs=;
        b=MWfcowmwCffMM6l2d1tJFpqjoBUJotcbYRw3ASZLZLUhkxJ/blbsy6yvRRCroYlioS
         ws20ORn9h0WBo7KU6gGWnvbsKunDLkiE2mz8SVdXnZsktewVUlD24brcAaWagH3LAOpE
         AUKvODvkT3/8cRvWwn7h+LxYS3Gdp+yYDcU53JS6FGj0KgjwE6Z/K3tE3j+WZ8JMGVPD
         RScbkqF7kyQrCA3/Ga+rxL4uzKIOwDr1cKbwKrD4FFOKPcLBJ3NSfY57CdwKkKijmGbq
         zyBfxd9kgd2z7nHancndvd/Q10VooCVQMf97DsJIb+yQz5QsxbUY7gfuBK+SxjpW6yIe
         LKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712158065; x=1712762865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSfNe+CCGN0/UiyD22tdzpzI2zWqGAV/0E8NSdApxAs=;
        b=Nj67BTVu+VfArWZGOnBEPh+t2ZtO55T+bUehmpnwxTS6FPj83Pi1Zd2D34H7AzYhJ4
         IY7NG3NeuKwTKTpwuGP9Wb7YClS4mulvDG3plZ8n6l5lgX/o0F8MpEwqIXw/uyzP774y
         peIzH9/xUr7/E8T/8N15I/Uv8HhjNDUB/UzwEClsPkvSZMBztVAYGEFNL9kBP7mPRo4f
         KR/OKLzWthhh07GKV055W9IiuIeXFn1/kgSwKTYdFanhIiOvdkv3dMktwI44BON0aoqp
         kfoBwcJ9LesJYrWkatAhYs+ZxIyxojTBD8YwI3qoDsw7Jf+8LbuZXRO9DAG1zh5BcPAA
         JEug==
X-Gm-Message-State: AOJu0YzvIXInSnQs2qsRM3m9BbFjPKAQvUofxyQcq+iUXAm3uaFhmB4j
	uwt74M0G1qj5j6d+uF5P0lpTfT3fEny07U+pPJ0IMKvPWyaPFEneAJ0bo5WLggUq3RI75SHHZZM
	=
X-Google-Smtp-Source: AGHT+IHjUTI9t/FvgshZJcxvhT1Ze1+j60qAep4W3xhBnW3vbwgUVQpsN1ZSMV4JqU7Wv86qYZRuyg==
X-Received: by 2002:ad4:4f4b:0:b0:696:7343:b1ae with SMTP id eu11-20020ad44f4b000000b006967343b1aemr2734264qvb.55.1712158065294;
        Wed, 03 Apr 2024 08:27:45 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id gf12-20020a056214250c00b00698d06df322sm6011955qvb.122.2024.04.03.08.27.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:27:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] acpica: update to 20240322 release
Date: Wed,  3 Apr 2024 11:27:27 -0400
Message-Id: <20240403152727.2247873-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240403152727.2247873-1-jdmason@kudzu.us>
References: <20240403152727.2247873-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197927

Update acpica to the latest version, comprised of the following commits:

	170fc3076a86 Update changes.txt for new ACPICA release 20240322
	718374cd1bc2 Update acpixf.h for new ACPICA release 20240322
	d0349632b625 Update osunixxf.c license header from 2023 to 2024
	c929bc0d5028 Update osunixmap.c license header from 2023 to 2024
	78c34e3738bd Update osunixdir.c license header from 2023 to 2024
	193a3dda90e2 Update oslinuxtbl.c license header from 2023 to 2024
	edaf61c8a97d Update oszephyr.c license header from 2023 to 2024
	1c5331ede7ec Update osgendbg.c license header from 2015 to 2024
	ab10380db037 Update osbsdtbl.c license header from 2023 to 2024
	815db2de4317 Update osefixf.c license header from 2023 to 2024
	a4dab90c90a4 Update osefitbl.c license header from 2023 to 2024
	4f9205ae4283 Update oseficlib.c license header from 2023 to 2024
	68bc01cec3b9 Update efihello.c license header from 2023 to 2024
	f71b9942deeb Update acdragonfly.h license header from 2003 to 2024
	74fb08369867 Update acgetline.c license header from 2023 to 2024
	c18edfb1abfb Update the copyright year in the license header from 2023 to 2024
	d58f24933d2f Get rid of MSVC warnings that arise actually due to GCC's new dangling pointer warning and also tGCC's blindspot to work with nested named structs/unions resulting in breaking of ACPI event-handling
	ba8a36b5c734 events/evgpeinit: don't forget to increment registered GPE count
	8affc87afd28 events/evxfgpe: correctly clear GPE_AUTO_ENABLED in AcpiSetupGpeForWake
	69f81815f830 Fix Capabilities[1024] mess
	3e89d40e19fc Update actbl2.h to get rid of the MSVC error C2233
	a0ad1ed5105f Fix CXL 3.0 structure (RDPAS) in the CEDT table
	9061cd9aa131 ACPICA: debugger: check status of AcpiEvaluateObject in AcpiDbWalkForFields
	b9423c1d35b0 SRAT: Add dump and compiler support for RINTC affinity structure
	93caddbf2f62 SRAT: Add RISC-V RINTC affinity structure
	9788e0dc955b Modify ACPI_OBJECT_COMMON_HEADER
	a6a236c44c7d Fix spelling and typos: Clean up the fix for Issue #900
	b6b38edb0c18 Clean up the fix for Issue #900
	8f789f356fb5 tests/common: use CopyObject instead of Store for NRMT
	bce7c55e99a0 acgcc: Fix C++ issue with ACPI_FLEX_ARRAY
	e3afd8e17bc8 MADT: Add new MADT GICC/GICR/ITS non-coherent flags handling
	453a5f675677 MADT: Add GICC online capable bit handling
	6cd47047aca6 Fix various spelling mistakes in text files and code comments
	31a16a32e7f3 acpisrc: Add identifiers for the NHLT table
	32260f5ce519 NHLT: Reintroduce types the table consists of
	6ab5a3bb1608 AdDisassemblerHeader: omit timestamp for deterministic output
	471de8b63a98 Fix build indeterminism for asm compiler header.
	50aec3ad9364 os_specific: zephyr: update AcpiOsGetTimer with arch specific timer
	10ae1038e51e osal: zephyr: Fix write access for mapped memory
	3944ce4dd104 osal: zephyr: Fix AcpiOsPrintf implementation
	a97db76b5f1c Fix issue #896
	f5910dd1ab60 Attempt 1 to fix issue #900
	c581606cf49b ACPI 6.5: RAS2: Add support for RAS2 table
	673fc21311ff Add port definitions for CDAT SSLBIS
	9c5649bd2c65 dmtbdump2: remove redundant failure check on Status
	544938c98a7a dmtbdump: remove duplicated code for both paths of an if statement
	0c7379eae2a0 NHLT: Drop preliminary support
	7b10fafca61f Revert "NHLT: Declare device configuration types"
	0333c2af1317 os_specific: zephyr: add generic platform support
	2872257aab53 Fix segfault when error-checking mixed table types
	c7171588a9f6 actbl1.h: Add EINJ CXL error types
	da740d8d27ff Get rid of // style comments
	75635cb363c6 NHLT: Declare device configuration types
	bbd7aee285ca dmtbinfo2.c: RISC-V: Remove redundant Flags print

The md5 checksum change is related to the relevant file having the year
updated in the copyright.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../acpica/{acpica_20230628.bb => acpica_20240322.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20230628.bb => acpica_20240322.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20240322.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20230628.bb
rename to meta/recipes-extended/acpica/acpica_20240322.bb
index e63faebf0901..27de28c5ddcf 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20240322.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=79a69059b499bccc70a484459549758f"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=05eb845b15a27440410f456adc2ed082"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
-SRCREV = "f16a0b4d0f0edd7b78a332fcf507be2187fac21e"
+SRCREV = "170fc3076a86777077637f10b05c32ac21ac13aa"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/G?(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


