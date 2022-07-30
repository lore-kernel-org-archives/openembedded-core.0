Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC41C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 08:24:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.53])
 by mx.groups.io with SMTP id smtpd.web09.1252.1659169488221716355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 01:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dipT3sZm;
 spf=pass (domain: siemens.com, ip: 40.107.15.53,
 mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKXgjYOXaZHFGP+xp0+zJyQJQIJuLI6NGdMsuhYIISj9B9QKrzH14ecZsf/MD+p3Nvmw8NbBkwc7YOmSJaMWsLl4zomoyquy+vr4n578x21gnk7QaqRIQ4tWMif+bCl5zHlCvpzVY0SrOZtQYyT+tnMFw3PcQTDYxgeBDi53y1x7h68+u4dyx1aIjlTrgkKVOYvi7zD3QCTEW12w0TsKiW0500bimGdJPSJXqxbwmyAsrkC/zxqp9jQrwh6kyciDs5JsNQIh7DLlDDj7fYRukAkfbbF/8UUVz7u0/y2Jt6SAx5gDObLaDyT/NJPvs/KiCR2x8BprYdTeBFnKj0J7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1id3lcTHsgXjewqaS+aOqTI0VvfjnfMySOIdu0Hkc4=;
 b=QMmUjCpdFKJh7XU2rFYWKwzJezK51XDN4X2ZDNdGBrwteZZiKQhxvPfHZVkq7dTLoxEaJ8q6ApvI1SLSOsPT9Gru8I0km9kPgT3krhozNx+jtbPTbV8X4PmJIh9Cn7urt6UsPNdkJ7um5uJvQZ8PuSaQAuoOqd+lHLRw4dOQJj9s0Fy1OY25SzjA9L6HLRExgKvv3phzLm2/tuar1B6WmJ5Ojq9I4SNF9hDBMtvcR/wQE1VoUsuwZW4PehxnHXOJAn877DA6hObU6xCPJrwxYHxaq6MM7hlSc79VvDYOKEa5Mj8v4WCYWeEblxBQzDoRlmSVRfg9I2/IGdJbXCZ7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1id3lcTHsgXjewqaS+aOqTI0VvfjnfMySOIdu0Hkc4=;
 b=dipT3sZmJZHWfM+8L5RZHODjWhKd52TjhbdRCLrhCbyImMzix2Y7Uypz3FE4iBGubAjz0LXcMpG27InembtESNlnDjUjQ6IwPPz4XjF5P+njlz4UBpq+8EGn2AmtJZL3JDCyqZMu36WTVFIy/KmfFko3S9fkzo/nBjKInTJUlZUaRZ6F78IEZPjhgJGBeUPEIxGo9IsMoNJufA5W6EZ3mgBw4RAAioreDYry0kqh25ULnJFv2a6iVIWvVLjoQpYQ8zAXV6o8rxsQMw/Auweogkw9sv6+8Tg7baaIGnReETm3Ydf+0bP0honVBOJdlzRfhaI0z5Y7NbLjFebb5AnQQg==
Received: from AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::23)
 by AM6PR10MB2117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 08:24:45 +0000
Received: from VE1EUR01FT044.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::c5) by AM6PR10CA0046.outlook.office365.com
 (2603:10a6:209:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Sat, 30 Jul 2022 08:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT044.mail.protection.outlook.com (10.152.3.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Sat, 30 Jul 2022 08:24:44 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Sat, 30 Jul 2022 10:24:44 +0200
Received: from [139.22.137.65] (139.22.137.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Sat, 30 Jul 2022 10:24:43 +0200
Message-ID: <5e8d6c83-8795-3040-3131-3b181e6f01ff@siemens.com>
Date: Sat, 30 Jul 2022 10:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 2/2] wic/bootimg-efi: Add support for loading devicetree files
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
To: OE-core <openembedded-core@lists.openembedded.org>
References: <bc3dd2ac-3ae7-4818-e212-6f49147c306c@siemens.com>
In-Reply-To: <bc3dd2ac-3ae7-4818-e212-6f49147c306c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [139.22.137.65]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--14.912800-8.000000
X-TMASE-MatchedRID: jZdANo9G9P0ZN8TODtwDNcwZf6suBkTqUriXxFmUkHxrIu4+N99FEX/0
	yDqj7AyLRDL/jWAFbKX2fEQwNHKn0DG06h+EdezRbi9xEiKwEZciX7JWomr1HIKvnFrZK2Uhnl2
	UEte7FZHURn+XOe/hRcu3fu7mGETZSAOm/6gPPQePQi9XuOWoOAnbQnr9fWNSbXa/XdBvrTpCie
	YsjWBj6VrCirnOr0+s2LaIHXkWZZyGTu0uwsuraSZ+2lpoG/SIRshoiWh4wVpTsa+xs64EUJRy1
	HDTPOXaxHpdDBVQejDZznXqu/Oqu5VY4b3no4E1V7dIi1ZiKvop9ZKLuLV+0/bta0OAYFzyd4qY
	NJSBriibKItl61J/ycnjLTA/UDoASXhbxZVQ5H+OhzOa6g8KrTki2GlxtBsNOH0JsfXcwnanwyo
	wgtkasEadlHLIHqVM7HvmSy3yD94=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.912800-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 CC7AC5AD9C3E273B186004C6D7A6B73E4C500FFD75CD3F7AC0756D430EB98C052000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8805ce31-3c94-4e67-10e0-08da7204f528
X-MS-TrafficTypeDiagnostic: AM6PR10MB2117:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XwFZc79mCnxa1E3d9HCACXbeTMHBLyq++fbBkX4nV3aBtOuNtqw5bWP/u5FBLndEhG3yrg9oxOtQt8sAXPtwRwod1PUFSHuWKp8vaXvQxHSmq/mQ7Ijbg5BP9Coz8RQoRKcfmYODPxBfxUb0bCjwuydxM7gTIBqHOhxD813YZO32ORWNMTxpoxfLvq8/p6hp4ulZ0gYQlxRtGlHRiHiR4ZzueyYXX5joC4nnb32AQYtwuBYAVrBqzF34RbIJVgU78ELN8n8sAeTmLGzOU/V0zYS1yP/tWNvsHZ/5GvBKFKqZAEwbpssPGbtJ01xv3Vn0Lq+N7eQDwU1QbZmbryxW7X0ztkCNQgE6IZq+GIdd1Cc7YyIDaMcfpHeIfe79oLtJ6MO+ZKs0WQOI/mzKpleD84IalOHC1AnBup5i4hQltj38xi7Ge/aTS5cu1C/x+bGAb9kYs4olGeFNw9zlk/dD/1ssLJs9ptOz+8aW2aZkAa/TR2/q5DjNUpycZ0oeFO8o3x8OyV4uta3b9KDvMZkBUQC+2z31EUFe6B+PuVqNNB9A8SxBWccgkBPZ6EP5/WfKPsSJtG57uOj3umI0JuUzc7JUny2wyHiXndMxpVM/+A6dGDpJnweAzL+AoPzRyeprgMr1J6DsnSngAAY0SejPyoxpjABkraBWlmRHX2vS5PRZWXDGaLNRXj6LHqagyCR8bx3ylhPSsD+/90/TDd1GZs4VlyClJxsBBugEIxCIVv2lZhIqHNsP+NZlNWlexNzt34kGi8LDoJrxdGGWzmwGlgGWv9ApGmpnniC0arX+d6JsPv7HRtf896GzxRcM8ongM4fXv7AnDtWzpN7bMqynnTVmmvnQTMfVB0Lx0TBQvuktM+HPEmyCdAf/OCtY3Ge60VzFg8B++gPKMq5zlOm9Cw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(40470700004)(36860700001)(82310400005)(40480700001)(82740400003)(82960400001)(31696002)(40460700003)(86362001)(7596003)(7636003)(478600001)(8676002)(356005)(5660300002)(8936002)(316002)(16576012)(70586007)(966005)(6916009)(336012)(70206006)(956004)(2906002)(16526019)(186003)(83380400001)(2616005)(47076005)(41300700001)(44832011)(31686004)(36756003)(26005)(6706004)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 08:24:44.4296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8805ce31-3c94-4e67-10e0-08da7204f528
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT044.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 08:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168679

From: Jan Kiszka <jan.kiszka@siemens.com>

For device tree using systems, add support to set a custom devices tree
during UEFI boot. This requires to copy the DTB file to the boot
partition and to add the respective loader entries to the configuration
files.

Both grub and systemd-boot support only loading a specific device tree.
Therefore refuse to work if the 'dtb' parameter contains more than one
entry.

Out of scope for now are overlays (only supported by systemd-boot).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 39 +++++++++++++++----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index aa76888c9b..eb48554e59 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -35,12 +35,12 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def _copy_additional_files(cls, hdddir, initrd):
-        if initrd:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+    def _copy_additional_files(cls, hdddir, initrd, dtb):
+        bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+        if not bootimg_dir:
+            raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
+        if initrd:
             initrds = initrd.split(';')
             for rd in initrds:
                 cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
@@ -48,6 +48,12 @@ class BootimgEFIPlugin(SourcePlugin):
         else:
             logger.debug("Ignoring missing initrd")
 
+        if dtb:
+            if ';' in dtb:
+                raise WicError("Only one DTB supported, exiting")
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, dtb, hdddir)
+            exec_cmd(cp_cmd, True)
+
     @classmethod
     def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
         """
@@ -67,8 +73,9 @@ class BootimgEFIPlugin(SourcePlugin):
                                "get it from %s." % configfile)
 
         initrd = source_params.get('initrd')
+        dtb = source_params.get('dtb')
 
-        cls._copy_additional_files(hdddir, initrd)
+        cls._copy_additional_files(hdddir, initrd, dtb)
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
@@ -102,6 +109,9 @@ class BootimgEFIPlugin(SourcePlugin):
                     grubefi_conf += " /%s" % rd
                 grubefi_conf += "\n"
 
+            if dtb:
+                grubefi_conf += "devicetree /%s\n" % dtb
+
             grubefi_conf += "}\n"
 
         logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
@@ -131,9 +141,10 @@ class BootimgEFIPlugin(SourcePlugin):
         loader_conf += "timeout %d\n" % bootloader.timeout
 
         initrd = source_params.get('initrd')
+        dtb = source_params.get('dtb')
 
         if not unified_image:
-            cls._copy_additional_files(hdddir, initrd)
+            cls._copy_additional_files(hdddir, initrd, dtb)
 
         logger.debug("Writing systemd-boot config "
                      "%s/hdd/boot/loader/loader.conf", cr_workdir)
@@ -181,6 +192,9 @@ class BootimgEFIPlugin(SourcePlugin):
                 for rd in initrds:
                     boot_conf += "initrd /%s\n" % rd
 
+            if dtb:
+                boot_conf += "devicetree /%s\n" % dtb
+
         if not unified_image:
             logger.debug("Writing systemd-boot config "
                          "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
@@ -316,6 +330,15 @@ class BootimgEFIPlugin(SourcePlugin):
                         shutil.copyfileobj(in_file, initrd)
                 initrd.close()
 
+                dtb = source_params.get('dtb')
+                if dtb:
+                    if ';' in dtb:
+                        raise WicError("Only one DTB supported, exiting")
+                    dtb_params = '--add-section .dtb=%s/%s --change-section-vma .dtb=0x40000' % \
+                        (deploy_dir, dtb)
+                else:
+                    dtb_params = ''
+
                 # Searched by systemd-boot:
                 # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
                 install_cmd = "install -d %s/EFI/Linux" % hdddir
@@ -327,11 +350,13 @@ class BootimgEFIPlugin(SourcePlugin):
                 objcopy_cmd = "objcopy \
                     --add-section .osrel=%s --change-section-vma .osrel=0x20000 \
                     --add-section .cmdline=%s --change-section-vma .cmdline=0x30000 \
+                    %s \
                     --add-section .linux=%s --change-section-vma .linux=0x2000000 \
                     --add-section .initrd=%s --change-section-vma .initrd=0x3000000 \
                     %s %s" % \
                     ("%s/usr/lib/os-release" % staging_dir_host,
                     cmdline.name,
+                    dtb_params,
                     "%s/%s" % (staging_kernel_dir, kernel),
                     initrd.name,
                     efi_stub,
-- 
2.35.3


