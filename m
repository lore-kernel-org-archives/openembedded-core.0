Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AECC2BD05
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:07 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.95900.1719057484513280435
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ewoyGIWq;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c1bf0649a5so1408441eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057483; x=1719662283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD/rlgNwpdpXqrRTS7VbxsipN1zVEEiJDgiupMefOWU=;
        b=ewoyGIWqXGTUp4yO8zafwzsc4jpfzDgr5dfH8vl1ldHKrHrhUBbeiAfG0rgCd5PsUn
         2H9i2mevO1+zgmL064spJBLnxz2QwyVFZQvYUFglryV5YiluCnz4JY8/eio2rW6mEqoZ
         fW3vDasACAdrH+XR8UGPQXDJDUjUEiCTXcq7SaMBVueSWGb5/busuobru0/UYJUWxZkV
         D34qskt3iJrdWff/+TMSXcagjhy7skLr0Jy28rYHcIb9IL9gTrSMF+fTAI/nL7k9mcRm
         USk5gX4yVGzMdY4ga+fBsOu8LXBED056N97gbocFYJZvZ2H54eTn24LoYnR6zEB2GrbD
         op/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057483; x=1719662283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DD/rlgNwpdpXqrRTS7VbxsipN1zVEEiJDgiupMefOWU=;
        b=ZrYpke3FSW/zP1JbWu2ZNaqjAtg+wEyT9YP/n9MB/591GRxKfcPY4+hRRXt1zFG4Nm
         Ea0qkVPis1P6SB58GBqSxYcJrwkwHHblqL0dNNXZTnSnldCnkL76yKq1qg44eEifQL15
         nMQ96CQ0SJgoM4CFixLDvBp/Ih/2dfAGQ4H5HHkQ850j6Y1AGp27a4gdNfrwwHy/YqVE
         X3QKWRi+FPO3HZkiJC58BD+4GLkXrQtKrKAYD5Pn+fhm4RWMxAoS/Lur8JXBonk90Qr9
         zDmVWm08wLxe4DZEKJ72Q1s2t/LnTdbexiqer1zWNEXT8PYkoz7/aKG0nIrPaklVxmvf
         zGaQ==
X-Gm-Message-State: AOJu0YxdxEyLg6Ywcn0q9QLWpD94zOLFbGM9KiPI/OI1zRh03C1hYoZh
	m4tEHrH8Wxy1C/Gnk5lteng/LrNBY4HNdvee8xgaD8TD94hg9NnZ+0s4Mc0U7h98r6YdZNZjEbx
	r
X-Google-Smtp-Source: AGHT+IHrBjB9ng8JX7DgugEnIZS7h11ttOBunuG83ikaFFLTz07HPtFX/l3yeSz0Nd0KrlCCJWWQBQ==
X-Received: by 2002:a05:6358:2921:b0:19f:7265:fa36 with SMTP id e5c5f4694b2df-1a1fd65661bmr1046932855d.27.1719057483433;
        Sat, 22 Jun 2024 04:58:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] acpica: fix CVE-2024-24856
Date: Sat, 22 Jun 2024 04:57:30 -0700
Message-Id: <0920aacb2a042e10e54db949428471ef9b20c96d.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201041

From: Yogita Urade <yogita.urade@windriver.com>

The memory allocation function ACPI_ALLOCATE_ZEROED does not
guarantee a successful allocation, but the subsequent code
directly dereferences the pointer that receives it, which may
lead to null pointer dereference. To fix this issue, a null
pointer check should be added. If it is null, return exception
code AE_NO_MEMORY.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-24856

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../acpica/acpica/CVE-2024-24856.patch        | 33 +++++++++++++++++++
 .../acpica/acpica_20211217.bb                 |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch

diff --git a/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
new file mode 100644
index 0000000000..beb6a79c8e
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
@@ -0,0 +1,33 @@
+From 4d4547cf13cca820ff7e0f859ba83e1a610b9fd0 Mon Sep 17 00:00:00 2001
+From: Huai-Yuan Liu <qq810974084@gmail.com>
+Date: Tue, 4 Jun 2024 11:52:15 +0000
+Subject: [PATCH] check null return of ACPI_ALLOCATE_ZEROED in
+
+AcpiDbConvertToPackage ACPI_ALLOCATE_ZEROED may fails, Elements
+might be null and will cause null pointer dereference later.
+
+Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
+
+CVE: CVE-2024-24856
+Upstream-Status: Backport [https://github.com/acpica/acpica/commit/4d4547cf13cca820ff7e0f859ba83e1a610b9fd0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ source/components/debugger/dbconvert.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/source/components/debugger/dbconvert.c b/source/components/debugger/dbconvert.c
+index 55307d0..c17a5ab 100644
+--- a/source/components/debugger/dbconvert.c
++++ b/source/components/debugger/dbconvert.c
+@@ -354,6 +354,8 @@ AcpiDbConvertToPackage (
+
+     Elements = ACPI_ALLOCATE_ZEROED (
+         DB_DEFAULT_PKG_ELEMENTS * sizeof (ACPI_OBJECT));
++    if (!Elements)
++        return (AE_NO_MEMORY);
+
+     This = String;
+     for (i = 0; i < (DB_DEFAULT_PKG_ELEMENTS - 1); i++)
+--
+2.40.0
diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20211217.bb
index d1727c1dab..ec253b998f 100644
--- a/meta/recipes-extended/acpica/acpica_20211217.bb
+++ b/meta/recipes-extended/acpica/acpica_20211217.bb
@@ -16,7 +16,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
+           file://CVE-2024-24856.patch \
+          "
 SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
-- 
2.34.1


