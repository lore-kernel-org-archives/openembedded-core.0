Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E29C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.23])
 by mx.groups.io with SMTP id smtpd.web11.101990.1740432134846823954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 13:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=dO0BS2ee;
 spf=pass (domain: prevas.dk, ip: 52.101.67.23, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4u/Xfgt8aJf4sP4wIErCc9g9iz0YEGdjWqmzHdI6vkjvpL6/Ipp1YGqJ/Oy15I85SUBOmHu2hwrauQwdylJbk3vSjY12ByYv9fe72eUOZcS3IajvuTuTLW3jJLgSHS6xdkrCY5Jl/vVqn93Xy2Lh6XXbIqxYc7WCFpwso+/KAurJQSv6FU0xTZgo4HhX07ykJrsB4KyWPCpA6SYEw0Be3ZbtXTRIS62HFRI2wcaVEEDUTQCopMcYRJoaijM5J6xmNWuYgOlvZNwRoOjE91XwxMNLv6Ae+Dud18wtrBnQpJH18ELDL4BEM0XBeL5lLVbP54eMiyVfFZqbN5x94ZUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3GB0raSX3Go9xZZi7HLBKSuhWbJdwfbrQusyBOp6vw=;
 b=sqVFXataP5jWqoBqYqzyykv44MIXdWxzhMuhcMRFPW5cuJr9yvvOg9iBCXrw4njQrMZYLDIiMK4WiEWREP0bOOJz7e3Fg4/WmF+zQ8CzTjx91vqhpwUTrYpSKg8GojGiHvmJgQLY8g3BiKmnYvp/4Viout9JLv+w103ZPUbb63Nemfa8WQ8MGrPMONWGtvYGpEPGqW//+dA+amypYQ/bi8GikeZ/gB5JO6y26zpQh5Xt8swonr0IqrfzZUTy4ZhWpDyds0vQhoyJ22QbicWng+4BtAmoY4VBQL95woql3EYfZbnD3URSVj1fvitB/Iw+KWSXiCzHXMSuWVEeZLSeAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3GB0raSX3Go9xZZi7HLBKSuhWbJdwfbrQusyBOp6vw=;
 b=dO0BS2eeOVsCq2p9tNYiSyUBlEZ5TYrImStDKZ9Ad6UiYrmPstl1QZwaUV18UPciBDTFFLLzczbWMOesavpXbL/c0juaublTX4Euscu33YAa+UsQHjsY8VOSqdpndTTGnCACQOLULR3MzFttSWMcacWBKDr8eOb9WKaRoNIpKFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by AM7PR10MB3973.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 21:22:12 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 21:22:12 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] openssl: honour calling environment's values in wrapper script
Date: Mon, 24 Feb 2025 22:22:08 +0100
Message-ID: <20250224212208.4082442-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0099.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::12) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|AM7PR10MB3973:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5fccd1-0739-4d20-4063-08dd55194d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EdnLCXFLIiaAHS4kKAqcd2advZmbZSB7mQmPEtZSBiLM+Vwz4n/XUHuSFtyV?=
 =?us-ascii?Q?v4MJcWerpAATdYVWQdWP9Hc6JVZf9cni0xFQkANFZC8eZJMDQMiqDew85x6t?=
 =?us-ascii?Q?tnruRSDIwmMgZSG8buabMlhfSlWNTPPu2ozZsRw/y70036o9wnbVmkuEDlFL?=
 =?us-ascii?Q?zJH5E8NO6dDnCnAw4VMkdQ61xKA8g05Si/5qrwprZ7l+4jjTPa+mxBbE+gwM?=
 =?us-ascii?Q?vL66jTxctoDhClypbNf0A/FdeZc3TgDBnh8oFps1nIL2GhTMH/QHNoR+OUPJ?=
 =?us-ascii?Q?uruO2Dax0766snZIyg5dreHAr9AYDVYHcT0tsxHtNfWapAnX/Tp8jEF3u7c7?=
 =?us-ascii?Q?JkaoDdPdIb/bntjMO8e66jLvaGM2GSBkUp7wxDAuguoo3o6AKZynADrgRKk3?=
 =?us-ascii?Q?P1zdh4pLArZxDkD4fghprMkRxHVCQi2Qs+EF+ylDwPkylSwTOUqRs8uqvqhQ?=
 =?us-ascii?Q?WWUkWZBalv/O9gRFXz3hTk5mSf5lZVNpTS7oK9Y6m0gvgUvMo9iPyVRtmBzt?=
 =?us-ascii?Q?uVrpa1uxx92bfH1c2RBFqhuaebPorTy4RUPUHP0e6h8YZ6vezHRqR7ZNuizu?=
 =?us-ascii?Q?pkyx9ZnlADPha/INBFAw402GqACewHtImZLBs2wlvMv35+Go5RaDpfTY6T8O?=
 =?us-ascii?Q?f9I9zWWFb5SuFyg/80TjcoV+zql+CIqc4LSd0a9cIOTsLuyYAE+rUaITZAZs?=
 =?us-ascii?Q?esxZZ4rS7ghayCY6oaWKmpam4MSa5MRWqMnSmnIN6NSaQEonROyVBwgLDtdX?=
 =?us-ascii?Q?Ij7JtniF8qER8CMAEWf5ibcmdSo4HQhw7eg/sigezxzhgaxnZgUhvPE6Jq0I?=
 =?us-ascii?Q?kribse+l7fEX5DKy5QEd/vLoCW4VySyFoIcWUN68/kiO8cv5ReiC2XswoChC?=
 =?us-ascii?Q?+PQcABcfG/Sru/AY0ly1sT2W82z2Yznfzxi2s8FsV0UL1Kfq0JX3Y4bTub7y?=
 =?us-ascii?Q?8Ve6njWTCYdBww4xhwXriEINYlDrTBl8LvTG/+mR+aVPoYRNOeXXDG985Aas?=
 =?us-ascii?Q?yl8Rs46j4sbXywBYJ2LrWbVCw9+xTjG7WVcGuudMcNHN3uJ9wFUoF0MOR2sC?=
 =?us-ascii?Q?GCUDurqmLuvgGMyLh3O/wUGIAdSgQFb0QGwlqeJJLLo/IeYf+Ev/EWTzDz5J?=
 =?us-ascii?Q?EkLOzgM5S3BI8vz5GGwal1/M2mbqejve1g4jAeXixioNEXt8LZ0abb7GQKdd?=
 =?us-ascii?Q?qnnkWZVC7I5mZJ+OnJlvAeuZrcUtsS4hkjCPCa4t8cFFaJRKLsgTxcIP13Vh?=
 =?us-ascii?Q?l+PYacM5onk5Tut9HU9USgyZHGApVgjnpY+mFawM+CUdDuvN4EVkty+nTnOU?=
 =?us-ascii?Q?CcCsG1P+AqOkmD+Ups5NRWuMhpVvEUKI9kNnQUzb8X5UZoaz09m2kYrBhwWY?=
 =?us-ascii?Q?3kwSiLETUT+jw9+nghnF+mE7F5pEo3Vz+IM02+rRGapF+1t4DDwu2g7pQ2YU?=
 =?us-ascii?Q?Z11pxk34MRCsIXCG85Vo60zXE9tfJtqx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LHSC7kq+z/2BNi2aX8INW79OEIUbAOJZroSO5u8+R7ujCWcfbkqDOMsypRHL?=
 =?us-ascii?Q?wFWwaHaUp2oGVP8TxYlNK7IhQJlhBKMLuA8zQyN1KuRMAsfGgxSQTxTQ14dc?=
 =?us-ascii?Q?20ItZBKr6IdzrCuZv65R4EYMpWe10kA8lVD7+RGBn9gLRP8Ywn3wfsFSNYyt?=
 =?us-ascii?Q?pIJm8mOQ9gdAW3SZ2WQg7bwvYbMDLSfJCmOsCXiqxI8KaP+azwy6BTBLxr9D?=
 =?us-ascii?Q?hzH3AMiQD1e+C8nFmA03/gTtQ/Mv6D5osMnEga4mBIfTW0tqHoNTz/KKnYqb?=
 =?us-ascii?Q?utI0UuCqvwv81cRPJb6J81CgGTOiGaDimVbjn0KOUwHB6o8BaRy96/deVzAW?=
 =?us-ascii?Q?fvsLubKpZVJAymO46nZPXx5Vouh8C2QWMtYpRcJNWIHJgsIqUtLHZIIiEz5d?=
 =?us-ascii?Q?+lRfpgU54qwX+TztFVXBCjfILPorPtCkhPEFcUuNT3Rg6ztVDQoA9KMFuHCg?=
 =?us-ascii?Q?hSUQh9+u+SSHUF4MVN3OX8czD4BFSmZV/+huPhIZ65qw6gl/FQZo0HwG6LGk?=
 =?us-ascii?Q?po6RP4jDmMpZ2VluT3q5nmht8r7LYaziPCQk5mSQo0VgamkRfFwjU4ESxqGQ?=
 =?us-ascii?Q?kXV89zxqhMTnAWXBRdCBIfWuEl+l7MuVyOsF9bQdqRFJG6Gljpf6B0riKtfb?=
 =?us-ascii?Q?gdGEIAbx2eCsdCPYpbxSiVtcxp9ofjLTA+njDC27t8rlE32lqNhtQ49ntICG?=
 =?us-ascii?Q?W+K3yqS2BPx/lvmM/56d3v02Uz9EXx1kkZTUPTk69eGQkM/Kdz75mL8nupGQ?=
 =?us-ascii?Q?KLKMR+QbqIJmetF4GWjF7S7gDU/w6lqm9dy42QAHV54AGIrgAfQIXdoIpQu4?=
 =?us-ascii?Q?g1dirsQMjnMlERUL8xWEYbCS8x1xZfYyGGAY6Y78Hvbgy2peS0ai0tmZNOUR?=
 =?us-ascii?Q?XBmIS9KIJ3gtCXAZf2TrGjAWd01c3825xSaUzsrP5+5If7OGg6rILLVLuaDY?=
 =?us-ascii?Q?NQaeZqwfGTHcuGvoWHArcOipdJ97wJLeHA1VvR2IN/VQY+7JkBYtVZZhgvRL?=
 =?us-ascii?Q?L8Zc9ugMNBwQ2xKlOyqr2e8icXV/L6Q0PkWoE77ni5gb8CDAEOUnRLnwbTTr?=
 =?us-ascii?Q?OeNsdoG6guJ6+qiOOnqyGLcPX65NKyJOfXD4+tmuFUz/qYluyrEL++LOeWRo?=
 =?us-ascii?Q?vonPPs8hxke0zml8aeN+Im/lnmPqRUBcLh/ionFXl2gGUVFi2gplaaqXnAoB?=
 =?us-ascii?Q?+hufmt4ORCvoGqzAXRJAMMRSH1mIAgopaZhjJK/Q/s7zNAXHnjMwVfKTygM8?=
 =?us-ascii?Q?267huP9xJl+953++4C2sO5QNAM6eIEKxAu6+cYy0eITvRCnFK6cFGOymu6Tq?=
 =?us-ascii?Q?1eTkhLNpyaEgI0wc2fdYV8Bu3QMlp0CVIkDJvUL5CxlKq6OZC8aDgDtV3Qt9?=
 =?us-ascii?Q?NK8AFS7ZgYrKsoEN2roDX9JADIHEfWCpUic2qmaz6CkPV42v6W6hCMFfFJwN?=
 =?us-ascii?Q?Rv91eck9xRQChIvd5qQOOYZwNrgQvrMlGiAasToJ9HRH8wCGjDKS/Dacurdd?=
 =?us-ascii?Q?atpCKKEK5Clm8Wh7xxjjqOoN21ewmh3JouhllCV1a/urLYbFLSpTQ5H0Bcw6?=
 =?us-ascii?Q?NOXUHgH5IkeWzJ7ol1puOsSmsGHvXVU6mr71j+FgewCbarS+EyjcYbGJV0r/?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5fccd1-0739-4d20-4063-08dd55194d74
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 21:22:11.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xG1wMYq5c11WJbZXdZIw6xHT9ggr4OyZV1I+jDviNxfL206LQCbuujzxcMIdmamqZbkTuD0RgG9G+ShZWD6QrfQgmNyqW2unAkLMN66Cn/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 21:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211851

From: Rasmus Villemoes <ravi@prevas.dk>

When using openssl with some pkcs#11 plugin module, one (usually)
needs to set the OPENSSL_CONF environment variable
appropriately, and e.g. invoke openssl as

  openssl dgst -engine pkcs11 -keyform engine ...

However, when putting that logic in a bitbake recipe and depending on
openssl-native (and the recipe providing the pkcs#11 engine and the
associated configuration file), the value of OPENSSL_CONF is
unconditionally overridden by the wrapper script.

If openssl was invoked directly in the task function, I could probably
call "openssl.real" instead, but then I miss the proper settings of
the other four variables, which I'd then also have to repeat in my
recipe. Moreover, sometimes openssl is only called via some helper
script (for example rpi-eeprom-digest for signing bootloader images
for RPi), and it's not reasonable to patch every such script to call
openssl.real.

So rewrite the wrapper such that if a variable is already set in the
environment before openssl is invoked, preserve its value.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-connectivity/openssl/openssl_3.4.1.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.4.1.bb
index e18ec4b1ad..1a054a3675 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
@@ -176,11 +176,11 @@ do_install () {
=20
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=3D${libdir}/ssl-3/openssl.cnf \
-	    SSL_CERT_DIR=3D${libdir}/ssl-3/certs \
-	    SSL_CERT_FILE=3D${libdir}/ssl-3/cert.pem \
-	    OPENSSL_ENGINES=3D${libdir}/engines-3 \
-	    OPENSSL_MODULES=3D${libdir}/ossl-modules
+	    OPENSSL_CONF=3D\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
+	    SSL_CERT_DIR=3D\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
+	    SSL_CERT_FILE=3D\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
+	    OPENSSL_ENGINES=3D\${OPENSSL_ENGINES:-${libdir}/engines-3} \
+	    OPENSSL_MODULES=3D\${OPENSSL_MODULES:-${libdir}/ossl-modules}
 }
=20
 do_install:append:class-nativesdk () {
--=20
2.48.1


