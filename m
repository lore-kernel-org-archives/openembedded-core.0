Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9450CE64A9B
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.19378.1733233052005049087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YJz8QBL4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215909152c5so21652825ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233051; x=1733837851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SixfBqQngLO8BoBuEhWvg3hpbkuzOypAXTvolQxSzqQ=;
        b=YJz8QBL4Qg3l7eaTrkWsebL9CaSXUrBvao/xCcymyR7tCWsMOF3QCSjmKStUgubSwH
         sktPvBS75ISb9kHCF7EOjWqv7BmCRAPXARYk8H1OHyan2kF79d2gkP/YlxZhVPJ3XbBR
         uxpqubDMATK6CfvOYSWc6q7crOOG+0gCHexEFXISn3JIQIYd/rFqMMpfxKezOIfMDK3N
         XkX0OuhBe49DhWesRof9/87IUY2xGaYYXRL/5G8rnShcvk4vOifrR1czoXp2sR4ICiWt
         KjvLs7lQnnGRFECcjrAuQz3PQr1Ju+FJj7VdYb/gpXgDQHwG8BcWTEkQIWcpBLaWzfzm
         ed1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233051; x=1733837851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SixfBqQngLO8BoBuEhWvg3hpbkuzOypAXTvolQxSzqQ=;
        b=Pe42dqpvNnG1uA1tlCHo5h1W7sMVzmajL1/udmLTWckSLUh1SF4zS3HR9uMlnFZP9e
         VZWraVR7yQSQ/mnTdpwZhUZcQ9wttR1cFPe3w3Ey0iT7ErxawcPWiqtemORWfIpSPIWv
         8qlw5tBtOgMWtGSsHbuDzCjJQKE3u9MTICAalZGQx6efDs9NYPOrnwlVUfx8QJKBdaul
         nbqbGAAaX5TqoHmCGeeNvLOVWQtYgz2ZSdCasZF6ULdoytG7AaHZmfxwpflfuQUrHx4T
         80UiV9KXTPaLdZfLH9H3fb/phDxL+Iwq2EojPnnwERQCbuj5USfkzVJmDlthi/PYrPle
         BAlw==
X-Gm-Message-State: AOJu0Yx+N0s6XmEOzRaE7VPQIJGinfCbprW/rk7y+EI9fcUt1Ze9I45i
	mHLfSLtkZEl80Ckntjr5JQMyEoPiTiPcidetj/cOqBhqIzR3eygt7oJ+MBDIcK1kY6/o36zntXh
	W
X-Gm-Gg: ASbGnctSFonlq7OnpHQWbUubpTbdWZxkMSVGclo1i4iTOP3FSQlg3EdT4Ixht3+6n7w
	bFOyMNP5ao99ZOvh7UAyUxwUs2xrvyASdTE8y3ETr3iZ57AKezCGO6IVtXPpEGDmrvt3LtWbJA7
	r9/JIFkrWk1CUIA9KV4aeYqxeE1GCgwKPhzj71rNC9fEJuD5vjnmCPVQRuE/LQ5U2PcEnM/toXd
	7TC6Pl/kE7wX6BJPZy4PSzqjjVBRMgaKZkxiSA=
X-Google-Smtp-Source: AGHT+IEtVnwE7N1EmZ7T03iu+Kd+0EFV3D/WYvS66IL4GhB7dFkon0gqY0GrxhBCWKH1idDri6sAMQ==
X-Received: by 2002:a17:902:ea05:b0:215:b058:28a5 with SMTP id d9443c01a7336-215bd1ce4eamr34145805ad.18.1733233051164;
        Tue, 03 Dec 2024 05:37:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/16] acpica: fix CVE-2024-24856
Date: Tue,  3 Dec 2024 05:37:06 -0800
Message-Id: <5c590ccd1973d343f47e7b7171691400490dfc1a.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208191

From: Changqing Li <changqing.li@windriver.com>

The memory allocation function ACPI_ALLOCATE_ZEROED does not guarantee a
successful allocation, but the subsequent code directly dereferences the
pointer that receives it, which may lead to null pointer dereference. To
fix this issue, a null pointer check should be added. If it is null,
return exception code AE_NO_MEMORY.

Refer: https://nvd.nist.gov/vuln/detail/CVE-2024-24856

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../acpica/acpica_20240322.bb                 |  3 +-
 .../acpica/files/CVE-2024-24856.patch         | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/acpica/files/CVE-2024-24856.patch

diff --git a/meta/recipes-extended/acpica/acpica_20240322.bb b/meta/recipes-extended/acpica/acpica_20240322.bb
index 90e3599d32..1f93c0d435 100644
--- a/meta/recipes-extended/acpica/acpica_20240322.bb
+++ b/meta/recipes-extended/acpica/acpica_20240322.bb
@@ -16,7 +16,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master \
+           file://CVE-2024-24856.patch"
 SRCREV = "170fc3076a86777077637f10b05c32ac21ac13aa"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/acpica/files/CVE-2024-24856.patch b/meta/recipes-extended/acpica/files/CVE-2024-24856.patch
new file mode 100644
index 0000000000..c0c9c00d12
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/CVE-2024-24856.patch
@@ -0,0 +1,31 @@
+From 4d4547cf13cca820ff7e0f859ba83e1a610b9fd0 Mon Sep 17 00:00:00 2001
+From: Huai-Yuan Liu <qq810974084@gmail.com>
+Date: Tue, 9 Apr 2024 23:23:39 +0800
+Subject: [PATCH] check null return of ACPI_ALLOCATE_ZEROED in
+ AcpiDbConvertToPackage
+
+ACPI_ALLOCATE_ZEROED may fails, Elements might be null and will cause null pointer dereference later.
+
+Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
+
+CVE: CVE-2024-24856
+Upstream-Status: Backport [https://github.com/acpica/acpica/pull/946/commits/4d4547cf13cca820ff7e0f859ba83e1a610b9fd0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ source/components/debugger/dbconvert.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/source/components/debugger/dbconvert.c b/source/components/debugger/dbconvert.c
+index 6a41000036..32ad5be179 100644
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
-- 
2.34.1


