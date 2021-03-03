Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.86])
 by mx.groups.io with SMTP id smtpd.web08.547.1614797608774354138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=djAP9tw8;
 spf=pass (domain: windriver.com, ip: 40.107.236.86, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU5ndj2ZiMJ7xTW8Q0UgKroXfAX4FQT/tQ4YkCmPAVxtCYlp6HLzPAPkHvi4kbgxpTiZ7NMYM6WiZKfHhSOFykGXfa39wB3vFnD1F94oHJfP8Qutc8zfHZ5NWLn3acAHiu4U0PjCry6EvByZ5pSXbb5bD2dPrB4k96k8Z5UXYSR/Ew6AD7m0xcPwHk9ITIrwDQSlh2ZPW7keh4xUpo/EI2M2Bj59D5/fIGhc9+q29OjdKwdFAccldcuWb1BketVPFS2m6DgSt1pm2aWQINO5+65EdZ77avof99uigOvKHU+tQ4kLnGo9CYENBIcZDI2Jl6vNSvTBTrZr0O/ZPgT0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mFI+OxLxJk9PznGwngeteKcggxienRlBLwurK2T9yg=;
 b=TOaU0MqDldoAKFCEEIRguoEaCPsxnygVplW1q3L14AlKVN7RE6ZtnaV7l4cN01efdbT6XQuWhBv3RX2mqhjl5dfTX+hA4XzKm2M8so4t6ydQEHt2Fk8+o+ajusMbRNRvw/7ZrWVnz+kvg267pwGXsgu5F/qODuheG6qUU4usD5XLxnmTK2zKMEA54WoOwzfF0djBQX2wsWNDhkX1QTX6bWEEYi590FXmEiItkK/8Nr9JWxcIR5YkP82uZA4ItMaZBr5p/OJfgJTRXyGcZKhKOD9rfur4pQr0SmFfMX+PM8on7Vnurp/hiaOjpdi7z6fxZOu3r6tYYPy7UjGtY9gwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mFI+OxLxJk9PznGwngeteKcggxienRlBLwurK2T9yg=;
 b=djAP9tw8rlJZp+n/wPYudUSCJbPzg2c+Ig4dkd8vIhTwUWEiOqifdNGSUG/36sTxT9pAFi4t02JboS//P0jgNE16WxXVmazFtrbK2ymPOp76dQSOGP+opYHRRp58Kyh5Zyowb6tu7X08is3/2aSLGW3B5ryh3SGtjBJs6iNA5r4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 3 Mar
 2021 18:53:23 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 18:53:23 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] wpa-supplicant: fix CVE-2021-27803
Date: Wed,  3 Mar 2021 20:53:08 +0200
Message-Id: <20210303185308.32029-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR0902CA0033.eurprd09.prod.outlook.com
 (2603:10a6:802:1::22) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR0902CA0033.eurprd09.prod.outlook.com (2603:10a6:802:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 18:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95369929-d05b-48e3-3abb-08d8de759edd
X-MS-TrafficTypeDiagnostic: BYAPR11MB2855:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2855E5E22621DDC0BCD5796BF2989@BYAPR11MB2855.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37qDc5cq2y8+OovaGurBS70rnHrKXiTDo94SpxAZKCKCAGhvKthLCcCNJWz5BC8pPJrfaAx9kzAxqndPq8YBX30ULN+ZCYsRbzeOrfEdgQ2WWugDjOeojDb9jtVSoF20rbuAoYwOJVo+yqC3kssPi8a7OBla/RqzuBwM6pcBvbG29uyJTs22ouoJpZLj96nwvvLLgdpIS/VSg9nyLzqcBkQ8xUp0qb9YjxfCICnSJI1YiuFZu/xAVK/RjoB33YIO8haUHDaaMgyXSG0vE2e8gWqZXHGwNAsFcwu1dp1c5+EH2ZlcR4F+t/J4Pxh9orMZD+8JsHO9O8zvHnsaMqVfWjhvCDwA8cCqdfsLTcA9Mv5QpeOAbVfSpE2IcGHNACccmActRdMfoJD3HVXmzh4/iBOjpixESJ7Gp4BUK3i5DSs2DYAjeBRtcBC+lpwbuTQsW/RtLqBMuYtNksM0iRA7l9EDhdoczymyWE+Sb1kEgGPpApTjG7yrpy7KsILQtc9tLAXsiGoldAe+W9v0R7DEaD7j4jVSoZOqx+o/QvWEvQOMw2mUDywK+OIl7zqdUGg1ZmDivtZ++IeJi+7oini/3wUx3TcwWfHMM1lDOiH4zSr1v8Acn/l9oRFlUIQ9bcIjnoM4p3A2QaacRGcR46WNNkMs962MWoS24bqan3W5PV9PZ34nwcS2alTD4sj75u6X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(6486002)(6916009)(2616005)(6666004)(52116002)(6512007)(8676002)(956004)(966005)(69590400012)(16526019)(186003)(6506007)(5660300002)(1076003)(478600001)(26005)(44832011)(8936002)(2906002)(66476007)(66946007)(86362001)(66556008)(83380400001)(316002)(36756003)(10090945008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?usbQd1nejFKqcQOeJjejKBPYXQdCtpxRmXOzAhNAdm7mjvgtakj7yN4YsI+B?=
 =?us-ascii?Q?dTc7bieaH+BgW+rV2AGkvj45LRcWGFsh+V1GJsKB8U2AvvXK2zwr5/kfTOWU?=
 =?us-ascii?Q?MlCCyynY6fXF7QaaYZeT/F9ucIIQlytFIrWCxbMId7dYWB3xrlZg9dWPUD93?=
 =?us-ascii?Q?J201pxF5QmntnMQtufaJA0ePK4XZaePD7XXSzDB9SFz6oeWwDrQTL/Ia2SpS?=
 =?us-ascii?Q?PSbgUg2Un6ylzXH2KRl86LJBmqK0MzT8X916qt35QHsLuFzUFG9lM2STEEoW?=
 =?us-ascii?Q?hURsA8vvsdHhmOTDHvamuWNRSs5pInSGXFrHqwHMKVkb4eJM1OqEBfLVvZ4b?=
 =?us-ascii?Q?IDlYyAsd8gST3+ShUggrHztQuJ3f0ukOh3s4L5vjOVNbCDmsk/zo+U+4egd3?=
 =?us-ascii?Q?wIWQ6ffe28bywe5X8ph03yIg4lDmf54mL/St3sfmiZI0HtQZOmZA29xs+1UI?=
 =?us-ascii?Q?+Bd0QIpTlXhAF7+RtDOd4rie2vy15woVs4cG+bmGs11DxamB5THJll82aOq3?=
 =?us-ascii?Q?SmW/n/jDax/0C0dws5gOZWZOrZprle+4xmj/XC5rs7J2NMcSEhiu1i+qHZBf?=
 =?us-ascii?Q?Sd4M/ckvP+atF5z0SaevXm1rOtK08KSq0JYj1nk5vgif+VK7BMdWJfUpXEqX?=
 =?us-ascii?Q?/i5x0hgYt1tauH+C93pIRgnll6ZXDELG/kfE50/7g1+ppajl85WVrBspJENg?=
 =?us-ascii?Q?sb9aOEWzrwHv9/Gmfa+1v03AfJLqLvkzEjUitDGOZhTegYJUcAmiTmzmwSwX?=
 =?us-ascii?Q?DyUQ5Ajq6rfeJ8UeqveCzKxlwzBxQRVxOBTgEkdq+LCYVQRCSRj1t7Cckl14?=
 =?us-ascii?Q?2I9w8XOA2ZviV5cJ09jr7LTwh5RFOL2LvFPMMD4/pjZscS2vk7n1E85ztiv1?=
 =?us-ascii?Q?BwhZB6BkSQeApWdeR8gurZjpobp8i+C+7bH1l0Jfkl8WiH677pxLFDdPZNLl?=
 =?us-ascii?Q?0dteWwHr7HUD0+ccptaMPJ8mH5wjhkX1l/svFe9itiVmE019DX6uOmqjn6NC?=
 =?us-ascii?Q?3XfMzFW3HWqTZUqUGfu8zhc0SKT7LMi23RBbbwXuPhNjNV2ufbe+5vnzIBI/?=
 =?us-ascii?Q?IPqU/jhgBzTx2WT5yJgiFfItwwb/5pJnyf+Cj5N+Jq8XZn1fsK7H524jv5o3?=
 =?us-ascii?Q?t2PwfHUCqwgQo0nbS8wJXykET3PFft/oPHki/RBpLuXkK/lJbzzkHjNrxQIn?=
 =?us-ascii?Q?/uaExac31CowCWc8rV/xhAYH/XcHqanm+oglzO3DeneY5Fu8KQISyJg+ZWoa?=
 =?us-ascii?Q?W5+xotxoUnA0K1rPE02xcUw/58eDQURML3n/1kU123qnAESEWXyVI2TBQhiZ?=
 =?us-ascii?Q?hjsE4V9G/6/nYY/AablVS59d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95369929-d05b-48e3-3abb-08d8de759edd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 18:53:23.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZNAd/Q54aJCalln9teFmsu9xGbqTE8dcdRjm7deMoQHAlmmxqgXCheUrxVi/mgatOylWvPvqUHVYAmv1xs1jOSpYHDkP4hlhtIxKHCewbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2855
Content-Type: text/plain

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact (potentially
execution of arbitrary code), for an attacker within radio range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-27803

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../wpa-supplicant/CVE-2021-27803.patch       | 58 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
new file mode 100644
index 0000000000..004b1dbd19
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
@@ -0,0 +1,58 @@
+From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Tue, 8 Dec 2020 23:52:50 +0200
+Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
+
+p2p_add_device() may remove the oldest entry if there is no room in the
+peer table for a new peer. This would result in any pointer to that
+removed entry becoming stale. A corner case with an invalid PD Request
+frame could result in such a case ending up using (read+write) freed
+memory. This could only by triggered when the peer table has reached its
+maximum size and the PD Request frame is received from the P2P Device
+Address of the oldest remaining entry and the frame has incorrect P2P
+Device Address in the payload.
+
+Fix this by fetching the dev pointer again after having called
+p2p_add_device() so that the stale pointer cannot be used.
+
+Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-27803
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec0..05fd593 100644
+--- a/src/p2p/p2p_pd.c
++++ b/src/p2p/p2p_pd.c
+@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
+ 			goto out;
+ 		}
+ 
++		dev = p2p_get_device(p2p, sa);
+ 		if (!dev) {
+-			dev = p2p_get_device(p2p, sa);
+-			if (!dev) {
+-				p2p_dbg(p2p,
+-					"Provision Discovery device not found "
+-					MACSTR, MAC2STR(sa));
+-				goto out;
+-			}
++			p2p_dbg(p2p,
++				"Provision Discovery device not found "
++				MACSTR, MAC2STR(sa));
++			goto out;
+ 		}
+ 	} else if (msg.wfd_subelems) {
+ 		wpabuf_free(dev->info.wfd_subelems);
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index caa6018ce8..357c28634a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
+           file://CVE-2021-27803.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.17.1

