Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.78])
 by mx.groups.io with SMTP id smtpd.web12.1686.1604356145205829203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 14:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Uf3J98zU;
 spf=pass (domain: windriver.com, ip: 40.107.223.78, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmhqHkqho3HB4wKjraL2Vl9JgQuWhwf5RNJnNKxMVYpNygLz3im0+qbhM9Y498CyVZk/pTL7rJnfMWRhEJUCKHV4ggCoYrocjnaZDcW0Pes+hG+7S4zQF0ABOFN8WbjpLCpfuW0+PnAStQAoPTOtphmXzHx14UNmpuX3SRoFKzxyhMlKLF46nrRFU6iq0RfYeLas5Syvfn69BEFHNnUQYbCVfZC91jbHSzC1/U5Dfd8miawpN1T+OIg+CaaTHmAt9UvRt3RWdGQIhkrHiRBguXUVbk0tT3VHUV1Ckt9q75Q6lRjAUSl88utTxdqHwDQ4HgfVhdaynWDs5VmcOYbfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tAAa1g5SR1ijpyC1TyGMJLhXIZolapY+xHnvgd3cOg=;
 b=NSKJrdtehqr3BWup1YSnObA1xRPrtLXJRQTedIbrfVywPASo3E1IhREy9G8PmMiXa7mQov99JEFC8E0CLXt4BRNab+Xrt+Z6XLsdT2Fbq+CNjvb3fttwHeeCODnLrb8pncZIb+GmBji1at90ifBrpdKdVInIwojQqfo4h9X5XunvkjemNgQ45QHtKYRV3BBHlwP0mimW6eERGVa3WTPr8TO+yb9ZAjljjxGhBLE7XixCVUIbTF9/ws+TEs4ps1VPMMrwTQ1xvlzocdRKQDN29/gWQbxgvLqeZwGOEUkHFZt6IqTQTjyroCzkcMv40/WaoHgcb3HZ86SM0SwMWy9n4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tAAa1g5SR1ijpyC1TyGMJLhXIZolapY+xHnvgd3cOg=;
 b=Uf3J98zUVc+b1vbmU60EJ/s5lPlCp7rqt/YBxAPz/8IatccIQhkl1DTACVvJotKbmV2DQ0eJ/Wso6Sp+BUrRaZBWI5ZvcYVLByNJos6fH0QTKNtNZ9esnjL+8AhjfLkeg8Vo0o4K48xTL1Fyx3q3VGxdv2C76hnIscTH2XSlDpo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM6PR11MB2810.namprd11.prod.outlook.com (2603:10b6:5:ce::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.28; Mon, 2 Nov 2020 22:29:03 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 22:29:03 +0000
From: "Jason Wessel" <jason.wessel@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] systemd-serialgetty: Switch to TERM=linux
Date: Mon,  2 Nov 2020 14:28:52 -0800
Message-Id: <20201102222852.38452-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102222852.38452-1-jason.wessel@windriver.com>
References: <20201102222852.38452-1-jason.wessel@windriver.com>
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by SJ0PR13CA0106.namprd13.prod.outlook.com (2603:10b6:a03:2c5::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Mon, 2 Nov 2020 22:29:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ea92fe-d82f-414a-9579-08d87f7eb3df
X-MS-TrafficTypeDiagnostic: DM6PR11MB2810:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB28105081B89B3DC05771763097100@DM6PR11MB2810.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fkUJde+MQKMmeF2mgU9HU3V155gzMVBEa8LQ4qc8ETVOEgxxRN6YFAaNP5sX3vD33n4255W7Vne7AZhf7aR6l4SGI38HIks8nE/luJvzNfISYLKmhiQDHOE222PTsqnc8VnwoegvLQDvlpalrSr3Lz0W4LJ9ZmnOZr1Vr9Fx5c2gbm5okDRFnnvyXjfa4WofHz0UqfNm5j+KqD2jmHrdpZfZbj1erbc6z9Tp4rYkMxggILZWL3AqpcCx6Cqw42T1JYI1L92jo/tVxDCBZAo/VXsQq6MBt/ZieD5LIFNko1/Bq5mgzCnhOfew41K3pFO8tEB5zeYL5LLiZlXVxRBxLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(6506007)(956004)(66476007)(52116002)(66556008)(66946007)(2616005)(6512007)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(6666004)(36756003)(8676002)(44832011)(6486002)(316002)(86362001)(2906002)(8936002)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	afr6Clex5wL86K6/IVFsLMtbFH40mlRYen03FVNnlT6AOhaMHoXBn7XO9cdbldTCc3+vbuc03T2wdZ5jdi3D+RoV3ugzGTJVEdghQH4AvLPu1hONvxJnuZ8Y9Phk7zXOPSeAAX7eEVNg58skVIDBCZuE91yrhuUIhsYvd7uyd1Fz0wNIFqIWAHW1aJlEnGcmVrr8zT51NYXbiw88FMimqWKcypIJUQcmMfwPdQi7Son45vHrE7B61KKsmT6ODfG63SI4UysAnyA0hXMBNx91axUhAySRFWMxzganxUGfpjQCG5yoCIEi7EhdWCEGIMVBHkiNq+VvQdcmlf1caIfyn/LZmcpBAbXHFK88wEqQholbQ4CEOwKyFMe/IQUqkWdXAN2mE8Neqh8+9kNmNgVUsMVNnsfSaaAj+9wuTIduzEEDYYpRBQQRcMKuoW+iJQy5dKt8FxtEcZcGa+S6l/AfSb87Uzr3cVurBZguyOAEQVwDl2nsSXkGUwLRnwpvB1wPyqvLko47DDzUrW/un/lQ2q9tBiGvfJs0El0/FVKPydlYKNzwFPJfII+mBeboPYJIk4PHyHiwTrcAI26BHP/zKVBDLpe/pci+Z93EHpBj509PyVPkCeyCuV9jCPe+JABzbJoHLt6dFrJD74vBWNvUuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ea92fe-d82f-414a-9579-08d87f7eb3df
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 22:29:03.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pYpgTv+PRG4F/7KRKCsYof0QOVsfCoB4JIukaM6HddFVU6ST/6Zo6KG7IfHfYXbyZOj9L6loPaJxEapdeBvIrdQRBXxnxfopvmWYCcxz6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2810
Content-Type: text/plain

Long ago in commit 473ff65c2f69de4ece3204fadfae7c5cb992149a
(serial-getty service: Add xterm as default TERM), the xterm
became the default for the serial port terminal.

Using the version of vim.tiny in oe-core master with the
serial port connected in xterm version 322 (which is one
of the most widely deployed versions at the current time)
causes artifacts and missed characters.

The example sequence is the following:
  * Start vim
  * Press "i" to enter input mode
  * Type "123"
  * Press Escape to enter command mode
  * Press "a" to enter append mode
  * Type "456"

At this point if you are using xterm less than version 535 you will
see on your screen "12456" instead of "123456".

Changing the TERM variable to "linux" will still allow you to have all
the same functionality with colorization, ansi character escapes
etc..., but will avoid the extra xterm specific escape sequence that
only exists in the most recent versions of xterm.

This patch allows the end user to set the serial terminal type to
something other than the new default of "linux" by changing the
SERIAL_TERM variable in local.conf.  For example:
    SERIAL_TERM = "xterm"

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb                | 2 ++
 .../systemd/systemd-serialgetty/serial-getty@.service           | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 0cc0dc8c79..d142b30f7e 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 PR = "r5"
 
 SERIAL_CONSOLES ?= "115200;ttyS0"
+SERIAL_TERM ?= "linux"
 
 SRC_URI = "file://serial-getty@.service"
 
@@ -22,6 +23,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
 		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_unitdir}/system/serial-getty@.service
+		sed -i -e "s/\@TERM\@/${SERIAL_TERM}/g" ${D}${systemd_unitdir}/system/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 549d566009..b16fe1188e 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -29,7 +29,7 @@ Conflicts=rescue.service
 Before=rescue.service
 
 [Service]
-Environment="TERM=xterm"
+Environment="TERM=@TERM@"
 ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
-- 
2.17.1

