Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B653CD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 08:06:15 +0000 (UTC)
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (DEU01-FR2-obe.outbound.protection.outlook.com [40.107.135.108])
 by mx.groups.io with SMTP id smtpd.web10.12446.1712822773208994163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 01:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: entwicklung.eq-3.de, ip: 40.107.135.108, mailfrom: heiko.thole@entwicklung.eq-3.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo3YgGZLlHW6xoJSKnMguWqv5tf8eYBZXAETT3vX4cETK6XPXPdBG7YN/GMvUH5XWFG7ntBCMA8L409QR3/HFTrx3/Ew8NkwJ30HdH8LIw9dY1uPuVQhYZks72YAD9yewL3SDmf9PivKfHC5yiZyjacTQVH3SRrWeqDaq8fn94dWfoG3VpfS2InbpEIRe7a5bpQN7Z476k4+Gr8rB3OYqjghHXx/ffJCMGYuDu7iDeC7v5uM3ZSoLh1eFHJqBZEHGCHpff2lJqd0J+DziG6fCvVcSrxSyg0X9Vw/Y+YS8+sNGJwB9KGYUII2RbqgEV8BpIDOdxyHpZafxqopyADoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N63VVHLJ9goyi076esGarKjVNRVUs8+pLzOSTNZG3Ho=;
 b=kHDNNx/b4l1YWIi4xEo5VE4xFhqRXmtaz1FOBsUDG6PM69rek8q8XUNmuWm9cZdoNr6FPhCqVexOyU57o6kFIHdnL+DCkY0yfTXSrBObydHM8NtU7voOUFU1b2OKhV8tUL/cUCdDD6lBAjo6lRk/5BSlmnBI3DQ2VW8wWh/nZ0jkWdLuYtEfQ8IzpqsRlv+WYgamrdRdWvwBGFFBZB2SbhUErmAe33kTRW3awv1BRIvKzTp3sj7hXVuoKyY/lICZnI6bgpMia0KyM/DLQQ10qu2kdlrnQXNS9oee2Ao56wbOWohWU7o//4EID9mEMhLVv+OAgfKp4OiMRQ025gbBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.7.137.154) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=entwicklung.eq-3.de; dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de; dkim=none (message not signed); arc=none (0)
Received: from BE1P281CA0265.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:86::19)
 by FR3P281MB1615.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.49; Thu, 11 Apr
 2024 08:06:10 +0000
Received: from BE1PEPF0000056E.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86:cafe::5e) by BE1P281CA0265.outlook.office365.com
 (2603:10a6:b10:86::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 08:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.7.137.154)
 smtp.mailfrom=entwicklung.eq-3.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de;
Received-SPF: Pass (protection.outlook.com: domain of entwicklung.eq-3.de
 designates 217.7.137.154 as permitted sender)
 receiver=protection.outlook.com; client-ip=217.7.137.154;
 helo=smtp03.elv.lan; pr=C
Received: from smtp03.elv.lan (217.7.137.154) by
 BE1PEPF0000056E.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 08:06:10 +0000
Received: from terminals.elv.lan ([172.25.239.241] helo=EQ3-52304.elv.lan)
	by smtp03.elv.lan with esmtp (Exim 4.94.2)
	(envelope-from <heiko.thole@entwicklung.eq-3.de>)
	id 1rupRh-008o2v-P0; Thu, 11 Apr 2024 10:06:09 +0200
From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
To: openembedded-core@lists.openembedded.org
Cc: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Subject: [PATCH] kernel.bbclass: check, if directory exists before removing empty module directory
Date: Thu, 11 Apr 2024 10:05:48 +0200
Message-ID: <20240411080548.264541-2-heiko.thole@entwicklung.eq-3.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
References: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1PEPF0000056E:EE_|FR3P281MB1615:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 059365fa-6efc-467b-969c-08dc59fe3f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yybnAVhS/CMUwymnsfNKhXnsG1s4sOGYSAP3v8YjgPSNJ1jMjiKHym2ySSV97WgvWlx4lRXhpwXn8y5gnQ3Lwa09UsvAaZaJCn4BpQ76dx+l97Mp/v/FNIfS2MdjJo07b4kyvz79TlQjKysHYcvYUmYyQdRq3eCsgVGIj7Q7s3kSOll7/ZT/XO5y47UNvYnUUKUsqXirFdG/T+38S9ET4dsqr9hXLA/w7baaRCxAmHBo4/4sN9YYInDWD2zS6XHTnrBnkV1zIyQsVCWnXTMDrRdIsMoa0FS03etUNar9aMIBR8KDsNd2XZHrG4vFcOgR54HJ2dE6txU6/VhFF+hcLULraO12MQMLSqfs1FgbfnIhAZjG2N1LVV8FyyaKRbzWep+QqVbt41KpwU1YcpA8ntVBoFwAFvUgHVMikYj5Nvhy3G1zn5/iHJx59pJTjC+qLfLmpsLY3t8JlkDWaFKHdW6GF2+b0OejG4yzX31x7mrmxPmj12adbVArN/fzM4QYWbUqUURyxJSKGUfUrSoqXn33z9Q9LZ8S2WrDHo2okcM0UD8RNpVFsF7QnRsk0Lagi5awR/Jni0u+wlQxrlUTzV/m9JDMeVGr4ALBKv45WNUezMFLziWAvPzCtBvhQ8kb4kRNZnusfofyDI+lGBaoP7rTpXA7WjjBXyweiZoxG7fVFi1cEJ0k4AsTKvIPPoGbeR/ub6SBhlx/3iic7txkqHgPRulL5UVv2khZQ1M9ol0QdjrPmMYoBcUfAvr7gRbz
X-Forefront-Antispam-Report: 
	CIP:217.7.137.154;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp03.elv.lan;PTR:thor.elv.de;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: entwicklung.eq-3.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:06:10.3232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059365fa-6efc-467b-969c-08dc59fe3f97
X-MS-Exchange-CrossTenant-Id: 6bb70bfd-56fb-4f95-99c8-16d0dd9d5592
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6bb70bfd-56fb-4f95-99c8-16d0dd9d5592;Ip=[217.7.137.154];Helo=[smtp03.elv.lan]
X-MS-Exchange-CrossTenant-AuthSource: BE1PEPF0000056E.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198118

If the kernel folder does not exist, find will result in an error.
This can occur if the kernel has no modules but, for example, custom module=
s are created.

Add check before deleting.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dbd89057f3..988a489396 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -452,7 +452,7 @@ kernel_do_install() {
                rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
/build"
                rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
/source"
                # Remove empty module directories to prevent QA issues
-               find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
kernel" -type d -empty -delete
+               [ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/ker=
nel" -type d -empty -delete
        else
                bbnote "no modules to install"
        fi
--
2.41.0

eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
Gesch=E4ftsf=FChrer: Prof. Heinz-G. Redeker
Registergericht: Amtsgericht Aurich, HRB 110388
eQ-3 AG, Maiburger Str. 29, 26789 Leer
Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
Vorsitzende des Aufsichtsrats: Irmgard Keplin
Registergericht: Amtsgericht Aurich, HRB 200335

