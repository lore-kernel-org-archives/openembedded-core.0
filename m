Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.60])
 by mx.groups.io with SMTP id smtpd.web12.397.1617900237673622409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NDtO2pTD;
 spf=pass (domain: windriver.com, ip: 40.107.220.60, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Szzd8FvCfWa1x5CdVlV6icsyktUEQF8YrDM3nzgqq+IbIKUA4V2ckbJgrFr8eSCD52SavcD9r1NPiRc0gKbwVqTcKuCHWzLiX/DM4vTIb8ljAxIgZrgILVEf/msibgKxTz16P4EmH/nxMOn058NjR02JL7Yjk5UEB/Ib8tWI9Q1Pvy5hPy/S4HPkWdykKDcH7cQahFU3a+H4gUfKu+C5qrbKy27qK+QPwUuhi/HDZuEOm8l2QGz5/KwJueIlfJkxpIOsnEJjo0fDzYuZF77rQv+45wUVilsjhJiyDfFeq62JxD/kldDPKThUFap7OhkRPVpEuXdeoskiddii4J4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWdIgPWF44RjCGVDjVcHKqTtYG0OnmJA0NCVzJc8oaM=;
 b=ThwWh50SR3uzC/QuGrAW24EXeGtNTemQ7AilUf8OkBYyOKGVk42mgrg8GpOe6YrR+WK7A2y80vlaT/uLQo3igqLDqIB88+U5qsvH1TWRJfdtjWGkHTTs72POgLX6kjtePaB8FzEVsUVhW4c50jMpbuPhcDfwTBTzMlaCXOoSunWGWscbLjZ9/ClNkis8WxQExfgGZqPJKFueQAFzg6VpqwxAm1LkNCH8tQSwYtLHJrYwN9SCr0/nHbZBiw8AlVhzVVfSQMVjVsSraJ2/Thgyyyil9lPWRSlAFwyMqWmVIqSzNGxpoQke8051w1ZSJPnGjDnRgKiaJUiMTYMoPRQ3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWdIgPWF44RjCGVDjVcHKqTtYG0OnmJA0NCVzJc8oaM=;
 b=NDtO2pTDT/kwaTyU3IEzCfbqPo2kTdmrOM4VaKiMu5LOq4z0e096CwnKJiWJ29US216ymhZ9qyQJLhrgnc538ZH4E39mXmchJAMnu3dhq3lssa6BN+g1ncpEGW+64Ew8MbDq1eP73UZiK960t85bzDw5+ovY/AMKk5Mse9DagGo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 16:43:54 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 16:43:54 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] wpa-supplicant: fix CVE-2021-30004
Date: Thu,  8 Apr 2021 19:43:30 +0300
Message-Id: <20210408164330.21879-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VE1PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:803:118::24) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VE1PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:803:118::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 16:43:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da7bb816-f7bf-4b24-0ab5-08d8faad7f5d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3750:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB375098C5DD5828D7E7636F16F2749@BYAPR11MB3750.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b0NBsstzZXO/7zdpUMnwB2sOxdYOSBzNU4bMvP7kn7OWOa834oVvhqvRieZM3VK8YjhhqzxPNCnJu9tki3EWZLR8woZSBiE5cnnRKDy2EDR3KuDFW2oFVF8reGrmvN9HyJ4pa9Z9xpiUxo9KpM/Q2ueVXYKKsfl0Z60mKDsJgeTlPn2kh4oAaLEpSCefdlUSeQsse1y0OlIuruMQVlFjswXUZVQbQuY43XU7pw7wVsrSq2AfTL4VRhkHGmZq6HCQa4MPzXQjLqUyEYkzPVzLZQAaPxRobG6LPNK7l03FkEs8CImZLggl6XO754gW8G3P+YNel626qgnaF9dO0Hvjkzn7Ob8DtwUUrcZaEOKGD3jsGsnOKyMPh1pRj2eH7dRaeDfdSdYW64ufWg26qkqJVxWqgUBU24tOaBkhvivNQ9di4JHY8c2AKvCvH2L8YK4HRKUCI1/lNHZ/uZRe7Ixy58XcNsjxjQ0jHNO69L1+RMEtcYd3mgM/6M5hi0dZDvmfMEbJ3xmTBENiqSZRGAfYMrjpBSWZI32MLHxXYCyEUhzbJDwJIWmDFz3vgm8x4g/UqxGQdLqVdCx5hQjuZ/dvh27TJVp9lC87qUh6R5B7Gi4MOmcLu7Delykp1Ae9LHUmdc+v6ODojSNndmXo6JVS3yHRUbZaxi+svyx5003N9wOYQSkuiREgX6uHp+8x41oxPBFgfDczmHk1QF2cmaNrGgkgHwOE+ldBJXivlLQeqQluBz0ErwiGAR1jYiko8i/2bfBfhmGdXAT15dAxBOIqowUzoEZZ/vm6xrQX3IMyFBdIKR9DW0y1OedE+pUT6MnR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(8676002)(86362001)(478600001)(6506007)(6666004)(5660300002)(36756003)(6916009)(38350700001)(8936002)(2906002)(26005)(66556008)(69590400012)(66946007)(66476007)(38100700001)(16526019)(6512007)(186003)(52116002)(956004)(44832011)(19627235002)(966005)(316002)(6486002)(1076003)(2616005)(83380400001)(10090945008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?oCtvdLU9mWSJ1+EK3il51p9Wo8cvy/2pZGPvIr6XidNllj614BYUYyMM3AnD?=
 =?us-ascii?Q?lusUZnsap00L1nyqeS9ZTq16sY3zNVG34RzQK11mjoNV5p/qgg1jzl2dxHam?=
 =?us-ascii?Q?BnbzpuTHROi8iCPvIDqZqwDaOuVzSEOetTUYf+MC/kCQRY1c0EhyLuYGEg1J?=
 =?us-ascii?Q?GDY3w+JiyV5ctpnxcdh9oNyGr3wOXTvKOFsy3qJZ17j9IXuY1Nc4+wkWPY6Q?=
 =?us-ascii?Q?wdQJPsXeij931rAUw3HY3ZZ//V93XeBrwzNJ/NrE4vPlpz2+HYq2P14Oc+mG?=
 =?us-ascii?Q?Nme4XdW6Ycj6b2DRzJkvY7MfdKr+x4wJaCJHLmmlFWO9KE42Ta6fZmXGYPaa?=
 =?us-ascii?Q?edNWY5uogmgkd7sXSmj7U6PkwXJYCw6SdwPhWMnHkFnh4V9WVPoBd9Ut+iu2?=
 =?us-ascii?Q?aYVDJeUI775XDVSjy+mf13x0XYeW1gH8hdR/sNxkea5kZ24aM9rOF8vdtbpU?=
 =?us-ascii?Q?xkIN6GJaAkFU4Ajvjn3ZfaIz7s76zfpAtM8Q+LDRv/hG6sOCcQHmxMo+49tu?=
 =?us-ascii?Q?nQ9onAzc+cEV/uYuBFvUNoTqPGu6ETb26lN6AiUA8O146zSd973YPV+C6/vg?=
 =?us-ascii?Q?z97CV7ZVrEg8xNbolYxVXR/OGTl+9TiIBlonPBoar9S5FfRAN9L019pe9fKz?=
 =?us-ascii?Q?7McTTTxSs3V+adZApNiFrzXuHDh9a3pW2lkFTFcICGWkIWbQ+7Tu+qN02H3k?=
 =?us-ascii?Q?pkjQwiMTiMtV8vwqrBz3Slth1MuUF4Ug3EP6/Qnc09fzbUY7BqoKbmaDDV1z?=
 =?us-ascii?Q?HHbYzc7da7dnss41Cm6GaMLKCzTORjxxs3bjodjxptIcznwVGkzPx6Fualwt?=
 =?us-ascii?Q?MMZzXUkh13v/CKsZ7PYH6LbwjjS/hC9JERp89QJUQKaWbpqSGljsgl0BOvhN?=
 =?us-ascii?Q?obirGLL79U4CGXYpYm+TaKkH0RQn7dY5YfhjiC3UC67AU6TTVq+/S46PXP50?=
 =?us-ascii?Q?Hm6bvU3+W0f7cKHtNAESutAym1/kUG4x5E1RXKRc82JVGX1IlPU91TqK6T7b?=
 =?us-ascii?Q?t/vjwPwCXr9XszMxgStmVCpdIJATzKsbTu3GS24uI0L+Dh/TafSifUinD/51?=
 =?us-ascii?Q?WQV2660m1SdyA+1b32cuxMNMuXkA2QnaAhrXxSmyksfYMUp3w99oI864jewH?=
 =?us-ascii?Q?lhh5YGHqj0jPa+Hm3OqcC6RBr8aVLcYJMVIXSjGRxZA0tvjFXgOP6A4+1y86?=
 =?us-ascii?Q?TpgUVgOe6IcSDMzJrdR/idesw5fKhodfmgZAXEl75ef2RCLUt8OoqjbTJQ9y?=
 =?us-ascii?Q?SYtnUJAKLDyfFuMM5zG91ycWB2HPXPQKAGSPQSNQkr34CYXDq4yvjF6ujhUk?=
 =?us-ascii?Q?J5QC+CqkhTUo/bp7O1aMZW9O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7bb816-f7bf-4b24-0ab5-08d8faad7f5d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 16:43:54.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylBS7ptrTw8XB5jwpAb+wMe4Rah6W9mGdEyJGk2QKQZ8Qt39NRL2IEKnM+3NN6+ZDScSN1GvlQTiUoMWjoYAwD4KdV4mJBHTSP00X7rWEEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
Content-Type: text/plain

In wpa_supplicant and hostapd 2.9, forging attacks may occur because
AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c and
tls/x509v3.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-30004

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
new file mode 100644
index 0000000000..e2540fc26b
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
@@ -0,0 +1,123 @@
+From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 18:19:31 +0200
+Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
+
+The supported hash algorithms do not use AlgorithmIdentifier parameters.
+However, there are implementations that include NULL parameters in
+addition to ones that omit the parameters. Previous implementation did
+not check the parameters value at all which supported both these cases,
+but did not reject any other unexpected information.
+
+Use strict validation of digest algorithm parameters and reject any
+unexpected value when validating a signature. This is needed to prevent
+potential forging attacks.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport
+CVE: CVE-2021-30004
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/tls/pkcs1.c  | 21 +++++++++++++++++++++
+ src/tls/x509v3.c | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index 141ac50..e09db07 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
++		    hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "PKCS #1: Unexpected digest algorithm parameters");
++		os_free(decrypted);
++		return -1;
++	}
+ 
+ 	if (!asn1_oid_equal(&oid, hash_alg)) {
+ 		char txt[100], txt2[100];
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index 1bd5aa0..bf2289f 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "X509: Unexpected digest algorithm parameters");
++		os_free(data);
++		return -1;
++	}
+ 
+ 	if (x509_sha1_oid(&oid)) {
+ 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 357c28634a..cddcfb6811 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
            file://CVE-2021-27803.patch \
+           file://CVE-2021-30004.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.17.1

