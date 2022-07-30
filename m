Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C13C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 08:24:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web10.1181.1659169450980626836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 01:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hmD13BEX;
 spf=pass (domain: siemens.com, ip: 40.107.20.60,
 mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFWWHU7p20yx9WwdVJApuwDIHIuELsKgAu0P5YVcEHsUvp0PB1iTFZzQHcEe6MOVBJpWC+kLuj7/03bLCy107CmpRa+2E+z754inzNRXubR961bxS6chEIuVr9zwxpiY0/DXN8J2XUiCg73tJAd5cZ40siLORUqEQ3U2AZ7sHE12a1RQFsd57tAQsoBFA86pvTdTUVyjIDMLmqp5kfwERRFWbZTgM3asJVWZ1GMVwO8/H3WW93xYW9uqNhbW49f3uOVg0rPT+vsJVMZbpdr0Gc48sZl2O1ZEIW7t1HIldxL5NPmFAfMNvUTxkyOePIBIq+3BinTkYNlMbaO4RrkhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKURbd+DGmkyOmNakokfJTHIWOr3LBb2LfRsREqutv8=;
 b=Z3LdJshQ1Y344kEZ9QMrcBHWT9IST86XCI1GGw2Dx70pDvqt/bUmuJnx6t8+95BS39HUsnt2RTjqc1qau5GnLvb58DRJY3GASi7LvCLezj/LxqACHoUaiDpGi65JMb1CgO4uNwzKd2H8/pFSGHZgYLcXl1nfPCH0BeBX8/ovXJbfck17k7ppGmLFJ2o5Wwgi4C4+B9RXoYLJK5xEiSMlmKYL35QU5hm3YmyIkR2NU27d5PoCBbvEp/t22Y79Yqj0XmVxjDZWruoFkJwuoBZ3iC1HXEbFHga8ohWcw1BQQLwwF9w9uN74iMq1RCPZyVQevCGUO/fJHum1StmykcW9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKURbd+DGmkyOmNakokfJTHIWOr3LBb2LfRsREqutv8=;
 b=hmD13BEXjz+bHz9+WBcXrPfM0lm/NNl3RCySeh+J7H62CoFc4XGi3Hc5qNwJfR2Ifoo+tO/VZhKtVAHhSXMpBTUjmrPlRnhjN6U9gzEvxIqT7LKaQWvG08EdeJ46cqyv+ikwUgVv3cFwSBhWuZ2IRbmRzxsUCT4/h0SccDMS9DpXK3fRojcVzwubnyjOOyN1SWgYSiv276NBkDAcueW+BVNTtgPJDxevbaoeo6gnOGNDLEprvAzjdM5dHj8DH6lPEbztfeMldwebGXx+fzcYfElQ19pe6y4XantnrNR6Efpso1UoUrZUth9A5B8qH1YjB7A/ZpPIyc4qwAqRIvWPjQ==
Received: from OL1P279CA0050.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::19)
 by VI1PR10MB1997.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:36::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 08:24:06 +0000
Received: from HE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:14:cafe::96) by OL1P279CA0050.outlook.office365.com
 (2603:10a6:e10:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Sat, 30 Jul 2022 08:24:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT056.mail.protection.outlook.com (10.152.0.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Sat, 30 Jul 2022 08:24:05 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Sat, 30 Jul 2022 10:24:05 +0200
Received: from [139.22.137.65] (139.22.137.65) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Sat, 30 Jul 2022 10:24:04 +0200
Message-ID: <bc3dd2ac-3ae7-4818-e212-6f49147c306c@siemens.com>
Date: Sat, 30 Jul 2022 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] wic/bootimg-efi: Factor out some common bits
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [139.22.137.65]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.760700-8.000000
X-TMASE-MatchedRID: Qby9J4e4UdQFRSh7ofHHkzjubzVDiCOCElH6l1EPRNgdZEkR8Y/meXFa
	/hQHt1A1ICYUD50wjJ2ZQOCKQe4DTjjpJvmw8FeHVgpV92Olifc6CPnLyJiNe+jl+xhc/R9QNS+
	gT3kuE/tZcgOA+kvkm96urnXKpk/cSAOm/6gPPQePQi9XuOWoOCfdCFu+J/OIbXa/XdBvrTrvSp
	2iuuHtok6yr+fYrPb07pvUx0MoYl8SREDsWlFRcDSrVwBdZTcBgb1XSSpDa5CeAiCmPx4NwLTrd
	aH1ZWqC1kTfEkyaZdz6C0ePs7A07YVH0dq7wY7up8Odl1VwpCTEgix0QggQ+4BklcJSAc8kDiiu
	kw3f/a5HFgN28fLTFQSrb2FC3pnm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.760700-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 19F021486A1522DEAAA2E9DD1C92B3DFD951C593318407F2F966267C264F4B842000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18cf0cfe-cb2f-4cc8-8b96-08da7204de1c
X-MS-TrafficTypeDiagnostic: VI1PR10MB1997:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OEM86G99t6+PQs/BOZ4BAp7OmDC/vjivvbqx6g6E58zksHyWbv67RSRVCmWkBU7277tdkOOpzeWNpyR4bp0t5mw6pH6nPFzshACxctJ08NS8BbS0Mk8ZU/ISMm5ZYu4HZaavO1ImF97eIYVLdN40K721PFxep727NCFJZQ5IbSMqzZQsDAo6ajv0zem0VNLbTFK0zXm23M3LSbYK2GFg7eGJwZaRAKpJwun/7Z7pak2V7NR/xodXykZAvB0Y0TQdW5/SLaaoAsfY1H/mP2DevY4LiLuy5bFNAwcqJ88XsZErWi4UTlp5o7IJDRW32fnBbNlb5oiIoypyfHzG2p+0Ogf83d3f5VHo3eJTkIy0BvI/6zliZLo+AuhiFJW2j+6HD5vok0pRugCxHP1vUj+z1FtMsa9/rJU8YUtXCYdQZ7zaltrifPPVU2d8kL2twUceSPvYua/VImTDBuBd2LfEs6wJuLroQP8RgavqQuCwYKaU424iTjCc2T9PXWtQGOk8iUUT8ciTSDhXJcpmKzM9IBDB5/GcbRVv55iB3O/T03wxeUlDt9F9+gyp9tJsFkEHHoA/wIBN7gq19ig2R1lBsVgeCNlZN14+OYLB282BDuPjhD4IG5FHM6OOpkDOyyEHjuDDZE7qAP0/b20dwmVaf8CLa9/iIN7Abo4q51iXis1SvlLLJFiqsc+UXG7F8VL1oOXs6kMBRWHCAqk/eMdgWBDhH86kSD6DFlx8XwYTT9wfA6YJORmLtjyN7JM6OcBsEYADMo60F7eK6lIdyl9/VLF0K07hD3RcTTqTfxKlB+Pm7EAYX2z9g+/YrqHjX/kBSV2pao+LK+IG6qhMXpvYqyw4yiPb/38JdKyDGyAg9qoLTPiFJ6JQfOBfaK+NY1KGtV1ymYujAr2VuwmYfmfq9A==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(6916009)(82960400001)(16576012)(6706004)(5660300002)(356005)(82740400003)(83380400001)(82310400005)(36756003)(81166007)(31686004)(36860700001)(316002)(40480700001)(70206006)(26005)(8676002)(186003)(47076005)(336012)(40460700003)(16526019)(70586007)(8936002)(86362001)(956004)(44832011)(478600001)(2616005)(41300700001)(31696002)(2906002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 08:24:05.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18cf0cfe-cb2f-4cc8-8b96-08da7204de1c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1997
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 08:24:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168678

From: Jan Kiszka <jan.kiszka@siemens.com>

The paths for configuring grub and systemd-boot have some common bits
around copying the initrd files. This will even grow when adding dtb
support. Factor this out into a class function.

Along this, avoid evaluating 'create-unified-kernel-image' multiple
times in do_configure_systemdboot and suppress a bogus warning about
"Ignoring missing initrd" when it is turned on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 46 +++++++++----------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 0391aebdc8..aa76888c9b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -34,6 +34,20 @@ class BootimgEFIPlugin(SourcePlugin):
 
     name = 'bootimg-efi'
 
+    @classmethod
+    def _copy_additional_files(cls, hdddir, initrd):
+        if initrd:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+            initrds = initrd.split(';')
+            for rd in initrds:
+                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
+                exec_cmd(cp_cmd, True)
+        else:
+            logger.debug("Ignoring missing initrd")
+
     @classmethod
     def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
         """
@@ -54,17 +68,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         initrd = source_params.get('initrd')
 
-        if initrd:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-            initrds = initrd.split(';')
-            for rd in initrds:
-                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
-                exec_cmd(cp_cmd, True)
-        else:
-            logger.debug("Ignoring missing initrd")
+        cls._copy_additional_files(hdddir, initrd)
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
@@ -119,25 +123,17 @@ class BootimgEFIPlugin(SourcePlugin):
 
         bootloader = creator.ks.bootloader
 
+        unified_image = source_params.get('create-unified-kernel-image') == "true"
+
         loader_conf = ""
-        if source_params.get('create-unified-kernel-image') != "true":
+        if not unified_image:
             loader_conf += "default boot\n"
         loader_conf += "timeout %d\n" % bootloader.timeout
 
         initrd = source_params.get('initrd')
 
-        if initrd and source_params.get('create-unified-kernel-image') != "true":
-            # obviously we need to have a common common deploy var
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-            initrds = initrd.split(';')
-            for rd in initrds:
-                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
-                exec_cmd(cp_cmd, True)
-        else:
-            logger.debug("Ignoring missing initrd")
+        if not unified_image:
+            cls._copy_additional_files(hdddir, initrd)
 
         logger.debug("Writing systemd-boot config "
                      "%s/hdd/boot/loader/loader.conf", cr_workdir)
@@ -185,7 +181,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 for rd in initrds:
                     boot_conf += "initrd /%s\n" % rd
 
-        if source_params.get('create-unified-kernel-image') != "true":
+        if not unified_image:
             logger.debug("Writing systemd-boot config "
                          "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
             cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
-- 
2.35.3

