Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.77])
 by mx.groups.io with SMTP id smtpd.web12.28794.1604308834285126426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NyXwTLOT;
 spf=pass (domain: windriver.com, ip: 40.107.244.77, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgnnfGus4R0Ijbc+7Wd/GaYva2SXKacy19u8/l5wDiOZXDhEN860cc2qLfEV8yK7pNIxuUBY+BsYJuGByD/7kIjQEC5LMDOxh55nSL4MKdtO+JUi24ckN2DUqhZjNtnoqHqHnQqNylwjQ+54Za1xXwS0+Aia93lsxkOPu6UNRzJWY0LyaYlHYv05USHnWsITVaqV23B1Yl73+q8zt2kNYzq9BweL5lG2ZBTl26DK0Vg+49j9l4Lq4yAL9CE6HPqK+XHCjnrT6IoqDILSLxodjVCFgBm9CaSB+4KzT5mbw2PsmK2+Ig67PKTs1SrdVEA5AOmdOJFitYn4fUJURrGuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE3UOaljUkg21sVjNc2nuis6BMTqqW2RbLYhoh00hLU=;
 b=nvrHuHyFlg7puECbFtxFr75zc/trE2WS6c9+x6kglad4FMlWZE5RBQtmb1TNw+GAdWnljg4GQfSPVHSJ2a0SXjWT5xCuSbgTez1EknhRQOT4eZiepCmOiz0kjNhsup3eCWkzAbWvay86BNYzVxAAx5AQQx2TRxbkDVg/69GBBXDehkdOgW0l+hm5ndyHXiCWXMnWThlWlulJyuIz0mjWUsJgQnvP6+AXfgsj4W4nh9aIUR00pUAgqTpwsMHn0lyFtvUvIRW3ysUEf2jkOmu7QIz24nNhEFN9PJWzR0SFLm96yo+0Tl85UqqrGESYwoRq/K56HxsEwq2g8dIz8a0X2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE3UOaljUkg21sVjNc2nuis6BMTqqW2RbLYhoh00hLU=;
 b=NyXwTLOTU0pTyWi08s1n8w/7S2DuoarupNORSNOISxSeM1yny/74FQ4FSRPrsiUHvpBJUZnDf9xZB88OSAjFg5uBboEKvOT8GoQuNP1xS2hmnnipg29hzimTm5D2v5+fgaVD9nB4fPy+SEHtq57Lv1xlsHSMGaze0mzUsApeY+c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 09:20:33 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:20:33 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] connman: set service to conflict with systemd-networkd
Date: Mon,  2 Nov 2020 17:20:12 +0800
Message-Id: <20201102092012.15968-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102092012.15968-1-yi.zhao@windriver.com>
References: <20201102092012.15968-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0199.apcprd02.prod.outlook.com (2603:1096:201:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 09:20:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff380a0-a714-45dd-f7ad-08d87f108cd1
X-MS-TrafficTypeDiagnostic: MW3PR11MB4554:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4554BD80A350E3BFB7AE47DFF9100@MW3PR11MB4554.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H2CJMPeTs4jknZUTULxinQj43hsDsLOWT34AAZ/MAJNuzKzW+amT4bkUrPuiS/Fgs+KY8T7tMxx78ZcZIJMgAv2VDxCnLV1vi4XE5hvX3wbjQqKfYcuR3xlrrtOlIb3++17vyAqPqATuLnLqPGjqlrl/Aj39n4a8Ud0LWZ2CPMUFxDVAVrm0pN0ioWZ9I/296WLjFBtM0rR84LNNpsTU0iWhc76nSlVmCygPEStFTeWjXgRW4azHM+kIXu5pOuxVjpbIc+SVz4vUNsfjETPLh5ZCq/0JXvyPZ1A45+YHCYsyLNFOoi26Qaz8DdKZFMLbL92mEQ/bBRHinoOwusVzfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39840400004)(136003)(1076003)(6486002)(5660300002)(66556008)(66946007)(86362001)(66476007)(6512007)(6916009)(44832011)(8936002)(36756003)(52116002)(8676002)(478600001)(316002)(6506007)(2906002)(186003)(16526019)(6666004)(26005)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/umJzg6x4ZSAD3RWNRyWMYIw13mq6QVBjGGim7m6zJ/aeW7hWjZHP1MXzxsJ6VahfvgQhkI6ojNNv6X5Rn5rT7RlvxiD0jCVKJoLI0fG77lr1pnP9gI5wrsCeh9gdPGBrZuDtvf0JJy+pYXBPIWPtQvHSDAMMf1N70RGVsSJ+ZYO5DoA5Vmo/nGwXLr0MUc7yn/VEF8bAgoyoyBgUX2bn3rk5k72Qr/t6JPe1/AsRAZr0pEWqQDHocrnYcvgyLko4dhZeRPnm4A+ddo+9isRpsQjgIHcitzV7rb7rll7I6tzcfC/iuRlotE6flTZhzuNaJvmpi0Q2QLFjvFkrUVaQcVKU8iWrFNA4741hZaAlo8wgKBR+k5OqNINZBdnT+f3OfPyVJZp5Il14l81YFIE858nFMxHprfEIYKonmDZBl5J6kie/EFrSIlzJh4A8g7lnVRhsByXcvXmrWeZRm/0WM9K9eeAazsly7zSHlR29OVyThSgTMeUCr2UpO8R32vyeXckUqEoMRrCtZxCzRLbPHYLS/SJmWFNzSpZ3rk7Dags9HvkmJDxNy2oH48IkrpFEKYH+HCaVNdqZz7TpwrdLYZ3x3Dk93bAF0Z5BdGv6+H6KZJNyf+v5945sasMINio8vYGWs2cUoinFoV1dQGO0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff380a0-a714-45dd-f7ad-08d87f108cd1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 09:20:33.3024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vnMEqdUc7C8cVHDNDnK9UFOIb6N21s3W9b/WEawDPRF7gqibEUXSScYS1d3z4WL5NOIPd9BeNjVoockYcrSfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
Content-Type: text/plain

Do not run systemd-networkd and connman simultaneously. These two
network managers may conflict with each other.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...stop-systemd-networkd-when-using-con.patch | 29 +++++++++++++++++++
 .../connman/connman_1.38.bb                   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
new file mode 100644
index 0000000000..dd012750a4
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-con.patch
@@ -0,0 +1,29 @@
+From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 30 Oct 2020 13:48:45 +0800
+Subject: [PATCH] connman.service: stop systemd-networkd when using connman
+
+Stop systemd-networkd service when we use connman as network manager.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/connman.service.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/connman.service.in b/src/connman.service.in
+index 79e75d6..014eafe 100644
+--- a/src/connman.service.in
++++ b/src/connman.service.in
+@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
+ After=dbus.service network-pre.target systemd-sysusers.service
+ Before=network.target multi-user.target shutdown.target
+ Wants=network.target
++Conflicts=systemd-networkd.service systemd-networkd.socket
+ Conflicts=systemd-resolved.service
+ 
+ [Service]
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.38.bb
index 027c41e9af..45c2934dec 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.38.bb
@@ -3,6 +3,7 @@ require connman.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
+           file://0001-connman.service-stop-systemd-networkd-when-using-con.patch \
            file://connman \
            file://no-version-scripts.patch \
            "
-- 
2.17.1

