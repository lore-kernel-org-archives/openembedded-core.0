Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210F0E6BF0E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 13:10:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9729.1769778624305221277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 05:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YMjKVDcC;
 spf=pass (domain: est.tech, ip: 40.107.130.11, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSpxlJGoVtq2HoLmkXCO56lpQrWm0j2wZr7GWK4HTfau1FCCbRPZGJRhZoUhiUnfcU7KcBAmYVhgQIIsfQLu0ERtk7aVxr8h3ROVAiCNEKEE4ul/sU85HcEv0EZyC6eUj+BvmvL5gRRyr0MkvYB2uXDB1lxSadH4OZ1Ej9HDQq6FDSeElg/Qnzn2I6wg7xSUt5UWsrkbKojnL+glHNVPfwh6k0dW+QC4JX6ejQnagGrl3YVA5mdK+oVx9/uhW1fedWVbNKA2Al30ETyHzRaWgipLPim0WcPi7B+VLIGqyLcL99RtJCFGd3jULgN9Ekys/cPj2m20gNVuRdn6SEh0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYlGGmTo66jAkVdbM6nZzzmOxaY8L4fM1SNplevaNSQ=;
 b=P95GnNasmKxKDLbDUWNd4dsg3uA/INGZwZ7b/Gv0aOhgNLUFT+44eZqfAq+0G8ul4AcqvYuSY0thj5Y9PccuDiZYRAc71OMt30KDvZfFWdVgyBn0medSa+1YIxHAXn6EjF8hAExjjUIuFMy/rZPd+Zx+ngrlCWGxpNJdIfJtOp4cu5xycCSMfI4SE4q2oR97m+l4TWYelZWtgWw5NlZ602GxmgSQAFKsKvSt74G5TFqhzUsXSvjo/2y06HYMAAHxH5RE+0xepOuA/TZa/J2SnxU6VZ/smnjsqhBFtOfZ9frT5u2Z4jniI6sJvgpzY62fsdY35CcCj48kfL+7az1DPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYlGGmTo66jAkVdbM6nZzzmOxaY8L4fM1SNplevaNSQ=;
 b=YMjKVDcCdZIefQ54o0AZlrt9XluRWTKtjz6ZB9LqoxsMNJLAdCqmD+8ldL3+emDdoQWmNM6r/XrpkJgwKnaDB1O6Q7TGnWkZ0wX9Z/4Fysy4Ntb0Ar/hlTuxW7C3xdwlB30AHwe87EMS0ry9LXpQE+pdrpvwweYuuDU41lZkcB/F5T+UY1Oq/nLP/rew0AYqRveZFkegLrl1Rj9Nsdp0ZmjAmSyjMHjHcRQG9dtmuUW696WwzrDvyYe3ej917VhYI92qXm89o+6/LSblb6lOH89bw0N6asCWv4S4127F7hVLEnpM3DDQObnhi7v+pqHuKUanlTNTPy0v8OehoJS2hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DU7PPF3D346B000.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::acd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 13:10:21 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9542.015; Fri, 30 Jan 2026
 13:10:20 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
CC: yoann.congal@smile.fr
Subject: [scarthgap][PATCH v2] curl: patch CVE-2025-14524
Date: Fri, 30 Jan 2026 14:08:54 +0100
Message-ID: <20260130131005.39248-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|DU7PPF3D346B000:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b92c533-ff63-49d2-487a-08de6000ec07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2a2jTGjAxhM2bC+WCyqRmIw/gYLQ7+UQEc7/EKhCfjKOrHEg3fJBER3MuKqI?=
 =?us-ascii?Q?87HsvV+Qv1NDdyQxdAWdUnF2AC0wpFByNthtFexn5x7fL7qR7hsq5GkrS53A?=
 =?us-ascii?Q?qYXK+vewI/3NkanmobkZrscdo4S9fj3rs5AOWf2NgBpkds25QUOZ/NPPb+9O?=
 =?us-ascii?Q?Ae2TzREPB5ZZcVRtD5dS4k6z3c/6hPaI9b8CgratJAcwUshN44R+rQX171bO?=
 =?us-ascii?Q?jzuX8GEQ2Gsc9hcgb3pRjt/u9dpkrK/iLA5bdlJzdnVrtdEDWWMAP59wCRlx?=
 =?us-ascii?Q?AC8h0ljHqFRgIsXAUTTuuXZapQE4WGFbISXUl01eYu4xzPXfuCwkWGUiQrt2?=
 =?us-ascii?Q?RMP1Acml2Dt/YAr+48tayOQBAWzMTldiRbb+a2XTYmKhi1Jjktip4PiFN0xv?=
 =?us-ascii?Q?cf2soeydGSZi7lB0TGoX4Af2PI4F4dqVfOou82bxJ/ShitUk9CfKLRJ4rgMn?=
 =?us-ascii?Q?6opCav98FkYOkUrGaApvbGCSALoTnNxgY8roUZUbctn64gNgQUW1QnAk93pD?=
 =?us-ascii?Q?AutVZLFz5bjsDosaKfTBv9D4Dg3TMkqpCKKhdEjl4XjpYaLQtmpo7TmUvycT?=
 =?us-ascii?Q?8qh5ZAmWJWgnSzrwTUc+kKkvAB84QWDreaYMFwmXEgWnujQQDCvO1g7SHo5t?=
 =?us-ascii?Q?iOaXLCpn7uY7JY7uRRD6X1lSIg3NNorSXJS51FA/C0GxbJVcO63ha5qptvub?=
 =?us-ascii?Q?PBkyVRPa2GrUG7fFfX1zysjGLk2dRnWlTBeFNusLMD0NALEf52neeusfho+R?=
 =?us-ascii?Q?gh0a+ZrIbEPGzUdWhfsMWcRibx3kfWIQMK/S+D7ZVmRnK3j5dIfXu1Xy61bR?=
 =?us-ascii?Q?+KdjyIWc6rt9Qhu7kjghAjykcdlCr2TnN7yvNpPA+Uu/OZtrOY93r6hCFelA?=
 =?us-ascii?Q?Uzw7lW3MUSKpQXi2kto2uRMuicaw2MyAtNMIx0RO3qs/LPWQE1tlEM4uNhWE?=
 =?us-ascii?Q?OuYCOJBfsVN2wOOcPiR8Z4I0+CNndEwcB1fd8aCbxh12MeWAVBZJMxLf2SrK?=
 =?us-ascii?Q?ZyZq9ux2w4YyYORVSuAUlpMfYdR7HkEPxEVH++QbJj7+6eSFylzk+g475BNP?=
 =?us-ascii?Q?fE2p2VfSwljAIvPVhf7MqTIEG715C1574sGT7wIUlDnSYUkmuN9Me8F+/yWh?=
 =?us-ascii?Q?GHRJmD3RD6jxAQowjt9RipG0V9fUvcUSWIbiQP+o0qO34AoH2Zg8rQGU+qoQ?=
 =?us-ascii?Q?Dy8RxO7VctbP37OsVt6Gg64gA43EQx+euBTiQwUwaZq7yUjMgzNCXgYQZd3f?=
 =?us-ascii?Q?dKiZuG6ZTgntEjOULuFwm8HEJv4+Z41Iadkw2McwGxpA/pKeaHnUB6PSAYCk?=
 =?us-ascii?Q?w592AX0aBtUGPT26EYmC9BV78NUnLQdlukdomRzDiHLUaXjHPwEiJHPT5q2s?=
 =?us-ascii?Q?1BqK82EVzswn4Psb0clCEw1rKkqNvw56gqOUfpiBQgEudOK+ecf/8kiK1hvl?=
 =?us-ascii?Q?sUePi2ctDwS+1ypbGuti4tebQbJRgC14SN2+EmBU8z1NjIiKg/gjT4vV8GwH?=
 =?us-ascii?Q?kQ73DmV9s70zdadwcXjTDY9Wc7ec0w7j06t8iEZ/w9a3OgPgHKMugdir1E2C?=
 =?us-ascii?Q?5HTgfp6Fnw1j4YOZHmI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1x4GmHwETPaHDncbFkqdFj7k6qk+DqpYkNDA+7SunO+BHd8HqXvm54ClUapR?=
 =?us-ascii?Q?b9bPmg/3Yc2OFsT3EB9m+G2FvvXoMvQgMcx5o1w0iEwtq+5ZyCzg0TAZGGRB?=
 =?us-ascii?Q?F5xknv7KWGUcnflvhpWx8veWWwUe6NJQvTZZDuSVo9HHI9luLZ5WLjKWbcxq?=
 =?us-ascii?Q?Tlr5dP3Nng4ILuYFDPzPoYFmNzlq8oQ/KwqwfZxqHRwBR5Dpq2uKYV5Lu0Eh?=
 =?us-ascii?Q?UkC+vxKz1XHCzD7ZrpkmR8jVj+DGtocXBVUATVky+5VQ7xfwvBlMAqXeb0rf?=
 =?us-ascii?Q?28Vgf7eokSMkRZyrgYNOlrLmExqWGlISigKYX7nAlFq5DioE+D4dVw8rbFhw?=
 =?us-ascii?Q?m/kPCaFZmj7huaesf8jQECIkbASEIr/FZ5TfJDtznIM5nscdom2j7xR/+8TG?=
 =?us-ascii?Q?iiqIOGOlWE+38FE9+3mzYN5mmO2BxLDuDjz5+WJRNx5RbnEdk88qSvWlD158?=
 =?us-ascii?Q?I1xioWHB/krLymZPgdeywyAMdC0MYuTER31rJ1V3AIWzrRqSnU4NMl5WCA+D?=
 =?us-ascii?Q?HMwwKmCNuLhUMUqCzg0502ukxALKzfv4YlB4RnQ56R8ShgLrK7acqQuQJ+t6?=
 =?us-ascii?Q?2N4Me7W7Spmr1p7QYavs1DeEpbQyPiqJ71xTvO+FAvm23PYNj7x53zhGDQQp?=
 =?us-ascii?Q?CrpJv6Ejv5+MNTby0vtOX/O5dTX4ewAAuFkeNQGshkUtXgOEnFm+9OAf2cDh?=
 =?us-ascii?Q?ZvekwGzVf5Avs6b4l3NJfsRYiYGq4LAP2GjdVxrP3BRaaJg6o7zmLSwfo0w0?=
 =?us-ascii?Q?gzymOiXQl2m6F/pIuLL7bmMrLuDsctbU7s8mU130718HkkMvXWgOPej5XZjC?=
 =?us-ascii?Q?vB15ycvS9stp4BgpfXrL2kw5dBuXnHJhkhAbm8Am2YQ0ZnRncumBoiTVXl1K?=
 =?us-ascii?Q?jv/FD8Tm+ogZZfgiHTZcZQWwADrvKjbvJygCuC3E7G6rcYSaOJ1wU14lWNKe?=
 =?us-ascii?Q?v4HtOlSE57I4PzILpYmKFl/0fqvkhDvfAjhW1UOrflYRrbmPwePiOG/CUxh2?=
 =?us-ascii?Q?/dxC3b+eJx1YCH1CBOAsB9yZd2cpEhwumas/qT/u/FwGeYbJDi8hyykDU+6a?=
 =?us-ascii?Q?4CeD3ueIVTgE3+4IFsV8GrfZNr65fjfPwP8l0CIu1dfEqFnDdJ3wIoWZccwV?=
 =?us-ascii?Q?BvgPix2zpofnwH12FvEBn2qTqrIsT0telYumy+9t2gu5zX6Px7gUUT2ZVUZj?=
 =?us-ascii?Q?QJ4hnfxkcjuXukQDm/JPwfb78Dx0l6V6TT3mFoj+77K1TuMgvc7aEkJ6tiOF?=
 =?us-ascii?Q?Aw13gYoCEBASIgHaMA/d+Knbk6wpVnV9nlQ10uZiAdEsQHmw6wvJDcYtCnMI?=
 =?us-ascii?Q?IAtKyGPLzSgrp3qL9sh1acJEP08gKs0lhJVE00Zecy7GGenYyxlcEKyfksvo?=
 =?us-ascii?Q?NOeuZzp3NLoYDJvWzztRUmjecZigsGutl/CJzI1nflY9lIwttxrRn3hAZqhT?=
 =?us-ascii?Q?ViTpfIUY67rrU51F90XlTP1FXSu7EGB08JtmLA7IBJTA1yXCLWvyxwnSh25l?=
 =?us-ascii?Q?ur3qMCMj+0qBKCWmjSbBb6OmC7ETJjSgtYPObbDk4wkosh2HVCEjOeEMXsRB?=
 =?us-ascii?Q?EkXD86eOdB8qdXTPhPM8idSSlggyxjJXhulmjH8BVVFeiw1p8b+BV50S2gCl?=
 =?us-ascii?Q?wy6UbIzligTdw1V7BO9cqbjZElen0W9ppmYOsFjlAieVu53EYmObwtoXlleR?=
 =?us-ascii?Q?u3UHKoIrGTez/6k8Y0Loe5xnh5CMeJm4mIjgwV+gXCriFk5OV6l1uQlxhSi3?=
 =?us-ascii?Q?RhClCZKFIQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b92c533-ff63-49d2-487a-08de6000ec07
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 13:10:20.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouLpzOZVChojN3JWU+PCbmyFIsI7wEV1UKnKcM3jvDLWfY9CKUEwzvVYKdVkWFesAHhTIFETILpmT5rq+B2vAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF3D346B000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 13:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230196

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../curl/curl/CVE-2025-14524.patch            | 45 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/rec=
ipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..bd0dd86acb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,44 @@
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use beare=
r
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1a822275d33=
3dc6da6043497160fd04c8fa48640]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 66639cbacc..fe646548a8 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Cur=
l_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+=20
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct =
Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+=20
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 0af6a41399..33bf6b1163 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-14524.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.52.0


