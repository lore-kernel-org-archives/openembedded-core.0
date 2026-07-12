Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E756C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:38 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9334.1783835488473173858
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=atIM/Oyd;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-667627ae83aso3213254d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835487; x=1784440287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yellArY0T/Yn0btgLwr9y/0pnVhCUJNNqgp5To7A5M=;
        b=atIM/OydEvR0qes3vcEh2lLBM/JFUAxDx7+4oTLOiQeuO0FIs2Qyy+KrFXTdEq7H15
         OuistUHq0PA98MS3ssLSgIzJ5Sv9l9UQhPGnLPDq1nkg3h2tnUXobCtnkPgACxmpqKGV
         xK43PEG3qb27HshEwi8Vj87RRcajkplWy7sxZRKrvtnr9d7/0nIFXRuoeqv1YjllEzMp
         tpyjxAxQDhBQVaCbUjezUUVei9sR1ZhkdGHQkJuPVq50vM5hgShxmNXmJ9BaQrwTJO+j
         ixapIhPoDUEmXWbkZO/unkzVpdHP1BLR7oJ402qVDIs3cwVTgaA+IVHjwWvHO46LPZds
         HcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835487; x=1784440287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yellArY0T/Yn0btgLwr9y/0pnVhCUJNNqgp5To7A5M=;
        b=ptQ8m7n8DfsoKkgmalLRs4UyFFvfblhmGjF4nG2DlhVuLbzbWEfTfg1sQUYjMRObJe
         T1/AhuZ/sLORGf5hp2axos9RKXchjS15tkVw7BnGb7wWymBQE4HVVKvuxM4Fzi6ajYNG
         bNUQAs54QvHXW9r2J39bSYZh4asFuuEC4/mguXzEh9z75mprOv29Z0yW2vfJIklsMN45
         oBjaGMXfzPZb7deadlHUgpfaPi0uiIEJWg4Peg3Xlj4B5ACl9RoGpbP1QNYsqR7unH9S
         zAzzpfYZPgR8B5O97mlAvZqHaPfX+U9zxkvBThqH/LWtl3lCtZDmuXMK5HVXB9SExuXt
         evCw==
X-Gm-Message-State: AOJu0YyyRJ+O/Ra4Hu5K5qg/q0CsKXzSvQcAyKnuSlgyPXx1PfjMha2y
	WI9kRkPyRamgAD90D1jtsCJR76Ns+xhDyCiX5Yxa6/FMr6hLvwPjfpfLjexeWyrplln+9vEIYjD
	LykSNrpQ=
X-Gm-Gg: AfdE7cmM8eNKwvFG+xaMwQSS7OKl2ETf9Aocb6bta/ubgSxBiqTkXQH2hcxGM2Llxkk
	cskRqBwtHNKS7nY9lb0eEapewh4oK/1w27IPvL0WKyTb1EYPFbwiyjwAKhW+quHJpFwXnJOsBFB
	oxctNx7fIWISzKkom34YAC2dR1Sii1b2OBNrx2+YXw7fwyW6kUE750Vh1sxdTdZ7eEKUlWbALw+
	a6zT2gxggjSJMsAygdNVI6B7dPt8rtxZq3gvwhiDjieVVG6ELIsyC5wxQFta8nwR+47ykLOBJ/j
	2/Jvn+3KOuE+z/hzum0+TJJAWuaxe088BVbWX2rNQlgE9MbfbZ/m/oIjvoSN0sgnfNwcg2SX0E9
	PX+VBTF4UxemaXYph+Y/qvfPXPh5GdPd1M3PshVPnzIhVVUWq5HPuev1wY+W29NEy2E4Zo/nRMl
	ici4wrr0Ux43IoQ/ZyVXCRen0+
X-Received: by 2002:a05:690e:43ce:b0:664:b559:d504 with SMTP id 956f58d0204a3-667d7a945c0mr2630078d50.9.1783835487504;
        Sat, 11 Jul 2026 22:51:27 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:27 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 03/26] machine: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:31 -0400
Message-ID: <20260712054954.4063745-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240728

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/qemuppc64.conf                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index e1bcfabc43..9cd26fb6d0 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4 wic.qcow2"
 
 WKS_FILE ?= "qemuloongarch.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 #EXTRA_IMAGEDEPENDS += "opensbi"
 
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a..37d5787ee2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4.zst wic.qcow2"
 
 WKS_FILE ?= "qemuriscv.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 EXTRA_IMAGEDEPENDS += "opensbi"
 RISCV_SBI_PLAT ?= "generic"
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 2fbd26a6f9..1cfdeea025 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -20,4 +20,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
-- 
2.43.0


