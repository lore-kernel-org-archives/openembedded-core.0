Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.85])
 by mx.groups.io with SMTP id smtpd.web08.24233.1604990673830894161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 22:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rJeCAoma;
 spf=pass (domain: kpit.com, ip: 40.107.139.85, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc8lPVnvkHfylHYB7m4J0FuRhq4JruwwMo1nJYzgsyDdVx6mZovXOcTucjHu7OMdiCptC6ekiM0Rr88HC2U6cVvtB1zqclW9TtI5UCTH1/gQqHVydlVWlvZe3USSW3LT2nmZGH85cUrWdP29aHxhuwOYbs453mjThhUOBhD7iRxtETseZIBVxY/oes+MqA5BFeqV9Z5zrsoA3TOxSwADjHYO+RGMTN0yYsmWP3ehguOQwcCx57tw2HV6X3GWkOzsW3SzHs4/vCzf4oHlJiHZNUjPtpg0YhtOcnpaZsb567L7Wulwbv8rP7Q8LGhSSorAbYh7M2GlMlCMIXEHsAWfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB+vmhZLVkOu1sUoPyzBdex2eU9xOOC1y8VfvG35SHA=;
 b=oIClMSqpXMFUCJmHBI15BYbCAVyQW48dsulLQglB4gVBG+psxkl81gRi8Ka8HNNZu9Mr57yvX/5XUIJ2yjnC5Az0clV6z0aM4Qd5CUeXdMsPq5lWnBNvgYFuPhmyNYfD8GzyODU/35r/ztvyfr+ME0XC7kV4ofL2T3gqo5HWe7jTfBUINpyR47xpHWDYD/r/89Fp3V/GrRAEvC90wZe8Mjky+rVltBepMi7Lb4IiS9sqrSPl70GZV6oulWzifOEwUqSopP5Anc1td9inwsonjdbgfoeKY3Xa6L/G322zFfT0RT/QiMN4L2NYGKvrBXoFdkg/hFuBtSWv8it7Tqyrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB+vmhZLVkOu1sUoPyzBdex2eU9xOOC1y8VfvG35SHA=;
 b=rJeCAomacvm/LqcCoyMrqECerQVHTvgh4taiErhNWVbuMX0KCzHLCSosXNioxOTcmmtYE2tF9bclcRxdYuM7dAJluf8+adZ1DDmfPXgvB4cOIJid8VWHIKzpRNWKViyWeHndgFgKpX6iO1ycaucWEFxKGXsw1E4Or4netJJ1Q/8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:45::20)
 by BM1PR01MB0659.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 06:44:23 +0000
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4a1:7a45:f267:6e56]) by BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4a1:7a45:f267:6e56%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 06:44:23 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	aditya.tayade@kpit.com
Subject: [poky][dunfell][PATCH] systemd: udev SECLABEL{selinux} crash fix
Date: Tue, 10 Nov 2020 12:13:55 +0530
Message-Id: <1604990635-15289-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.207.8.108]
X-ClientProxiedBy: BM1PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::11) To BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:45::20)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.207.8.108) by BM1PR01CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 06:44:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 600e5861-b685-4005-544e-08d885440ed5
X-MS-TrafficTypeDiagnostic: BM1PR01MB0659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB065942145E7216236EC689878EE90@BM1PR01MB0659.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DWrbs744+zSpUJ1i2Vix6vXwZi6EpszeYLdHCh3wMsga/rj+0v2qHARVY3/IN/IM0G6UiQ+8zEuVGFgsw8TalhS6AEy9miRCnlyNAlLbtji4qLLgLoF1BvGmcVoP5ko76gz7uoJcTYyPsEmOmLxcfpicS3TsO3mWk5Q90MUejd1U8vwCQLFtOOTaFmFpTaLC3FdEcnFVAktpiCbNQYOIEzU7SaDEgjSaz0XdFdaWmyYdA+c6mnWJmnFR78t81VaOCbAXNc9xxiIkd3JEgHxbgBgL4l7KmrNOpNtnxqmArgUt6LMOfGzm2cmKciRa3J5qofObK5i6YVUS0UnfhHZ+BRHvtLX3Mlic39o/5r362gpiv+eZ7r/wq4rWes5cYrVSFYs+GwCaVSEDEP7sAHectCIR/Fhi25pnsgeQzAQgYi1HMpKvglMHLrmw4WhTX3fUVRCmjthWqZWeoNSS6k4Zgw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(4326008)(26005)(6486002)(956004)(5660300002)(8936002)(69590400008)(6666004)(2616005)(478600001)(36756003)(2906002)(86362001)(83380400001)(186003)(966005)(8676002)(52116002)(16526019)(66476007)(107886003)(6506007)(66946007)(66556008)(6512007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZWb8p0WDDV3ymrFqf9px01ZGOSXk22wubRv6CUQjpNGFtY6Ofp9YFtxkLh5K+/R9zmOdfWxuPxi5Xu9kyqkqD94SQwhiFxAVtuPN7aWwfCP7Jzuc/9afpTWH9ueud7NSliDyGVNdewhARukwMhtERkvsGLGU3ahM9wD1wAe4BQW10VHDgsWOauGYvfY7HNDaRUq2xY6R4Hg7wdyl6Ww0bXJfCX6Kbt6ffPTMni7U2DGmiVlzbA6kQzS4aPf1x6+GzYZiEXlwfdJbkiIe1XGIAOUIDmhxae02LhHPQdLttwRrDX5IhfTbIssXAppOFq+8sGzyLsf/qSxJkWHaNqXrIpcq2DmyBOOQ3hXM7pnB1v5BwgVuAC/0NdhgvfDdUaXxjbWMbA+QWPAtxLcRmiYao12ninsAiVpp8UpOIuBYLA0fc+I2cXpt+B1s98MD95qQQlEH13fDzUJcw0G7/N8S/s/Gk6Sx9A8A3asb6HjTYhT5UVon/8eArSX/8qnTyqOK0h9nzJT6rR86nM+4C5NYwCR4ZFugLg95RmPajNilYgEHiIbiXAwNJQGYH50ctWk6DPVZYmxU1Ybk4tVSY6Uc0SuD4Oe0bmGOS972AuAs/T+I2WaaBIm/drQlZ//RUgNjBi6SzN4yluCwCuNBGMRYpaqA3sby+D6DFCNVpsTn12smXKpFmTpy0yD1BuoruFPtRhTVzie85Lb4WRsCudeDnZk1CtowURElu3ry/m2F53OpjnLPmfdULd/0SWfnmrM1D5Ey0TFtf2c1pIwwEkFSnuZ0wJ1JUJ8tYw8JvbWrgZ3bnk25xilVKZWHPyt8CgSD34jHa9r/oFMelN0UE6ALv6rM9f6UHqBg7B7I/wqxyE8RZotv+NsaVUHSiVGtsKHZZO0gtYU7fygiX7rVNbA6gQ==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600e5861-b685-4005-544e-08d885440ed5
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:44:22.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOdp2LOLUR4JeyUTuAuosRCDNcMqYlNuiwEY+T2VNoxV3iLtmJljhbkzztQeot58AzVYPsTnSsFCH/54IcVbzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0659
Content-Type: text/plain

Adding SECLABEL{selinux}="some value" causes systemd-udev
to crash.
So applied below available patch to fix the issue.

systemd-udev-seclabel-options-crash-fix.patch

Link: https://github.com/systemd/systemd/commit/0335d110afc08baf47d76b7011ce02510dfdd524.patch
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 .../systemd-udev-seclabel-options-crash-fix.patch  | 30 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.3.bb         |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch b/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
new file mode 100644
index 0000000..27b2b60
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
@@ -0,0 +1,30 @@
+From 0335d110afc08baf47d76b7011ce02510dfdd524 Mon Sep 17 00:00:00 2001
+From: Valery0xff <valery.chernous@gmail.com>
+Date: Wed, 11 Mar 2020 02:20:36 +0200
+Subject: [PATCH] udev: fix SECLABEL{selinux} issue (#15064)
+
+Add SECLABEL{selinux}="some value" cause udevadm crash
+systemd-udevd[x]: Worker [x] terminated by signal 11 (SEGV)
+ 
+It happens since 25de7aa7b90 (Yu Watanabe 2019-04-25 01:21:11 +0200)
+when udev rules processing changed to token model. Yu forgot store
+attr to SECLABEL token so fix it.
+---
+ src/udev/udev-rules.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/0335d110afc08baf47d76b7011ce02510dfdd524.patch]
+---
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index b9b350d1ef..b990f68e93 100644
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -921,7 +921,7 @@ static int parse_token(UdevRules *rules, const char *key, char *attr, UdevRuleOp
+                         op = OP_ASSIGN;
+                 }
+ 
+-                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, NULL);
++                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, attr);
+         } else if (streq(key, "RUN")) {
+                 if (is_match || op == OP_REMOVE)
+                         return log_token_invalid_op(rules, key);
diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 850d64e..64e3b18 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2020-13776.patch \
+           file://systemd-udev-seclabel-options-crash-fix.patch \
            "
 
 # patches needed by musl
-- 
2.7.4

