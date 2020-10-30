Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.45])
 by mx.groups.io with SMTP id smtpd.web08.10669.1604048350851108568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 01:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IIFJPB6p;
 spf=pass (domain: windriver.com, ip: 40.107.94.45, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkt8cK7XOMkL6BwuVZ5Hj49qQ0iOlBS9nkjUU0XBT5fMkaU0bP0KUqiaSiDqfCeeq4FZUJCr+aKDlEOHlFsKRWrUOJaUGP7I5UotYLVOahJj1nJY2azGW/Q4F1sVvQOkjeG+d18OO7qy6rWIt985wGf7DarxzHxbM2zVyMiaX9qBIvKP4y9vJLbRgaGhmTo7ce4HObmX6XAUjss/E+w9b9KG87dBWlp8rpve0uYLv0g52WCTfXwrYmkq836vVLRz1S4R6r1EN2YK6eKsX71jeRKOyl4nziBIMxPDVtcq4ST9cH6/UqSOrJcztNBwLlG3NMQQgcrFardCLn2t2N8YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+ufQXBSV8u0+/4/E2xKHNFoRp55KTbDnK1WYZ+mX0M=;
 b=ij2BuWW/AzFcw5Mizdo2fjKCPzHu/9SBIG7tdbV8t0INW1RovNNS64GUPdW4wyH68Mc6pVtivW937bDaq61WZQVGlJUb1q7cyfZPqPHMR7ykwdk3gS2ShPxFXkYDGnOQAWi+JDQp9beSZP3aojM+EjQQmPRmZrC0S6lH/J/4IKcp5TOPbAKqCbF9llzl5m+JSd3ggqkNOJz+V16DOsRZ/SI6htG8pZqttanj9BDx6Qf8w2nnLyIiAqr1fZ7JaHS+DYjK1jE5rcq3IXlNI+V9ZXcv7i0qgRpmiqc9EBLxhjtSN/wJCvf1HdOjU8OdWnE565GQEn1ph7Po+DyKcJ6WGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+ufQXBSV8u0+/4/E2xKHNFoRp55KTbDnK1WYZ+mX0M=;
 b=IIFJPB6pX79tayxzd5ttVelTw92RsAWzWrURwFUzq3T2IHKKto/wChxSjGfvY2VZVP9P9y5AXkBM6m5ti3e/dlPLw8ma/05Nj6FYp5aoQdNBK3MqMsXFSnoWfFbgNFDg+P/Jb7X8SzC/QxzH1vdIQ007B63GcxKMy7mxfHNo/So=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by SN6PR11MB3309.namprd11.prod.outlook.com (2603:10b6:805:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 30 Oct
 2020 08:59:09 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::5113:e350:fc5b:6b19]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::5113:e350:fc5b:6b19%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:59:09 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] resolvconf: do not install dhclient hooks
Date: Fri, 30 Oct 2020 16:58:52 +0800
Message-Id: <20201030085852.18227-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0302CA0023.apcprd03.prod.outlook.com (2603:1096:202::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend Transport; Fri, 30 Oct 2020 08:59:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24fc361a-9190-47e3-08cb-08d87cb21031
X-MS-TrafficTypeDiagnostic: SN6PR11MB3309:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB330986BFA50D2D09000D96AFF9150@SN6PR11MB3309.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lxqGoNocKptk1nT8ppR1YWttfeCP4KclDRR2Zp1eL659YEWdYTjROm2K/hfZRCjvkdExAvoGY+A1qq8s+su34HEXfMAeEEToCa5TZVEsJ8NQp/ehUnBe5BG+Mm5qiD15VLSfQBYAho0ZHxAhOKpP1sbozTNLLg+L5Ti/9D3RozENkb2f0/yZkSFgEcaTmONy1mG9fPELXff/QzTn8NqJTowt4gfAqXfDD4E80n45yWSmRuo6h8aAECk/ldvGLEmqEzZL0U66fyGz/E/vUmIKoiHhS5xXNf5ImQr3UHdtg3NhZAWw/lRAkr3Ai4spZZQycOrAzjpPrDhXtEvWGrl6zw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(956004)(186003)(16526019)(316002)(6666004)(2616005)(36756003)(6486002)(44832011)(6512007)(2906002)(1076003)(478600001)(8936002)(66556008)(66946007)(83380400001)(6506007)(66476007)(86362001)(52116002)(8676002)(6916009)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dvKP1s6iDVs+tbP0j4R4jdxSguvCPKfk9Xxbk7CAmq4dzEZm6blyugKuQlSXAhApzib9nXaeuJSZBGKzSJYQnRvfnB0kyMHDVZiYafQo5eAxIDjrvHHlZL8qTvy3TWv9Lx5XqmdxMqar4PXnQDqQDf1p/r9N5wc015rTIbWB/jDuK7+CzjPKE8Ge320Tl5VhPX9j34ymQ6mvtomtBOqCUds9y4mOH0JjZ1O2GNLOQtVGU5hWYRW+3o4y54ChU/2BrflCRllVCep8BUp0iXd/bpH7FTOGcgK+Xz3I1Lk5BOUkIEkdp0ofnAoxK91TQy4p4GZROZCjc3qY7zLZvJeat+Tuysnld6XlfWsfxHzz1pWzRQBAAG7KQ8T+vimBo2rqtq7EMBQVRmY6WFeB6IPOGoWJbA52yQIjZcu962FO+OiiQ7Grgc8xFsd029d7pcgmZoq1gTpdo3cKGBGDTCYYykXY8ObsTBQ6WeeOLyDeeJ4s5RogxrGaI42cdzyI80TvUio501dGaP16mxvfUNYPwflMP39mQx5pDM2BAaC6Yh73jN2OHyBguQQu1n165TaLbfW9slqKZO8ljtVOMesB0NEwMZMWrjrcLOcWXfYfaA3pt+dJvJctT2Gmd8wsxvTjhI1WnsvwFld2Uk2kmSVZSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fc361a-9190-47e3-08cb-08d87cb21031
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:59:09.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/A2v+BHpoyx+iRRJQk5jUqhHlTIp2S/XXPZJuc2s8gbe1HuaF6PerlVo8hP8A8OHVAlODCSrv1691PkFlbpLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3309
Content-Type: text/plain

Do not install the dhclient hooks
/etc/dhcp/dhclient-enter-hooks.d/resolvconf because the dhclient has
been removed from oe-core.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
index f0ffc82241..33ee553d19 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
@@ -43,7 +43,7 @@ do_install () {
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
-	cp -pPR etc/* ${D}${sysconfdir}/
+	cp -pPR etc/resolvconf ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
-- 
2.17.1

