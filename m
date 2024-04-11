Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DE2CD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 08:06:05 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.95])
 by mx.groups.io with SMTP id smtpd.web11.12303.1712822764252019647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 01:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: entwicklung.eq-3.de, ip: 40.107.127.95, mailfrom: heiko.thole@entwicklung.eq-3.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJrzkOK37B8pRZG/mymG/9OaKCqtyWSZfGQ5wtlRGbP3ix+ASbLJjzumhH52qYhRuQ0WdUj0iKyykfEBSt7XhF743+EMPvZV6AJOhqGkwPXIQOoo8RlS90998cB4JfVqDG792GJdUIZxONHXO+3f9nDs1G+vzpDn2volyNdwYEEfacrqbrUCDW7n3hq8BUxGcnCtZvi+LuQFUEGxxJwmgsoPGQv0QF13gTKp8sMVZc0+POGtcPix+HpIvmXTjYVVTKjEQHlxv6GFXaUv+ZJDJSeoZBWbojeyVIanpT8jANqkBYkZ2mZYqCh21Xo1DLqbjLOb54wIRupHMbAcMsOzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N63VVHLJ9goyi076esGarKjVNRVUs8+pLzOSTNZG3Ho=;
 b=Sy3tg5KU/gf0Kq1WnJzs6nnre0SFMt7twS92kF+xSM2q9Bwie8Bht3sZPSCtJuoxMPTossN0unX57RTM272idOBiZdDWlEtTBnH7iL6MifCspVwteN3o+XYm5QadZb7ebKbe3erfCxdmpcVfZVnTTgTcULcgsjm+/i2XeY9ti41drXDLziVzmSVps/sPeCBW57glhWp77EFZL+gorc7DEZsbY7S10owY1Pfaw5C0XeXB6p7oY7wdZM2EoxvAuyrpAqi9bbNnYXwiUV73TOMpJ0QFdw93u+DKL5MF2mK8ef2KwVpqcfhamXZRAU5q9r3twP1yuSm1jTC/OkoC6AcDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.7.137.154) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=entwicklung.eq-3.de; dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de; dkim=none (message not signed); arc=none (0)
Received: from BE0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::28) by
 BE1P281MB1571.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:1a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Thu, 11 Apr 2024 08:06:00 +0000
Received: from FR2PEPF000004F1.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a:cafe::a3) by BE0P281CA0018.outlook.office365.com
 (2603:10a6:b10:a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.9 via Frontend
 Transport; Thu, 11 Apr 2024 08:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.7.137.154)
 smtp.mailfrom=entwicklung.eq-3.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de;
Received-SPF: Pass (protection.outlook.com: domain of entwicklung.eq-3.de
 designates 217.7.137.154 as permitted sender)
 receiver=protection.outlook.com; client-ip=217.7.137.154;
 helo=smtp03.elv.lan; pr=C
Received: from smtp03.elv.lan (217.7.137.154) by
 FR2PEPF000004F1.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 08:06:00 +0000
Received: from terminals.elv.lan ([172.25.239.241] helo=EQ3-52304.elv.lan)
	by smtp03.elv.lan with esmtp (Exim 4.94.2)
	(envelope-from <heiko.thole@entwicklung.eq-3.de>)
	id 1rupRX-008o2v-LC; Thu, 11 Apr 2024 10:05:59 +0200
From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
To: openembedded-core@lists.openembedded.org
Cc: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Subject: [kirkstone][PATCH] kernel.bbclass: check, if directory exists before removing empty module directory
Date: Thu, 11 Apr 2024 10:05:47 +0200
Message-ID: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR2PEPF000004F1:EE_|BE1P281MB1571:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a4d51fc3-26dc-472d-0ccd-08dc59fe399f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zXi8jZHQ5c3i4wiRKp328VjlzSTeWvU1Jxjv93/Ceq5Q46/4KTSrRDmO7F6LECYTJ/cf2TzwOKpliM/M8XQXKiIe9oS0TSotuI0P0ws+QdloA5gdrJsG21tWSxnfx21jSh/q5N+ZFVEssoJJFNYwAyz8q67KxUAyb/7tip4fHNOgQ0iDPnqXu2sy6XDWbYfbgQamIYvdKvCttw45FV7vvUh7XtsCisof8xyAhxBJVZ+s8SyGE5tCIAp0F/k0gXICICD4Jz3ESMdTqSwXFnefoQdZYjbt1ErNCpIJmD/5mCZlU4uJKBIuVGPfDG7dgYb7vyuMFF5QYz0V+KfI/17B4NFQAIsCcKYAJlp4PALVBkkR0gHnlZuAdRy/hlsj7A9QpZAjInKhbCqoh1OoMdAKvD6T0rzuXNDYgPcpBrlTSoZLDtJzUyTikE27HaEwUWERH8dbS07y8mj+eAE/hXd1a2DlKm1IGCBZKAreuoX3n4ggXZ9zh1wRWwtuotJFN37+szoylY7hTsunq9Wei7/aell14Sjjh4/Lh0izvQR1mFMiNFTjJ3d0LozqEC5WexNA5KxL3AyMxgkNZbqvW61VLPIw0xk7efHOOYTTeKmKPIn6M+fydqLmBp2ccDLXfZNHUxWMvjDbbD5cVxNYnEvVmgTij5WGA/y+qiJ7tghhC9giZ32YIeb2YBuvapxZX8OImNfwswFk4CpIbuLfQ6Ij2ulNiUp9K4FKftvr1Aomr3RX3BBXvjt9H1Z1vRM0hmZ4
X-Forefront-Antispam-Report: 
	CIP:217.7.137.154;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp03.elv.lan;PTR:thor.elv.de;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: entwicklung.eq-3.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:06:00.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d51fc3-26dc-472d-0ccd-08dc59fe399f
X-MS-Exchange-CrossTenant-Id: 6bb70bfd-56fb-4f95-99c8-16d0dd9d5592
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6bb70bfd-56fb-4f95-99c8-16d0dd9d5592;Ip=[217.7.137.154];Helo=[smtp03.elv.lan]
X-MS-Exchange-CrossTenant-AuthSource: FR2PEPF000004F1.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198117

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

