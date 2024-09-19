Return-Path: <quent_55@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8A9CF396D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:33:24 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.92.49.74])
 by mx.groups.io with SMTP id smtpd.web10.3394.1726777998028084912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=NxM++r7c;
 spf=pass (domain: hotmail.com, ip: 40.92.49.74, mailfrom: quent_55@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIjopvwVraef2LGALdr2IVeWG4Ks4dMqO2NiiMuWaHcM+oh5fDcgRmGCBOrnB36rmCRXVXSQ+Bc5afTlAgf5sAtEhHBaa0stLqP1SjOyqqoiZ13+sfIsW7z6E4b6hARDBu6sd5M3eWxC7TEHil470xsctFewzT3fCbwD+VaLGQ2ikn8vPsf2Af0+NvlRDd3CWwE3SLjMPzx+zH4JTaNfJ5NIl2w+HivAIolnREpUkM3lj5EudERiXSjoKQQRY4T2tUMEkblKiOmaUxeLV4LPPLMKRLDK82osxAiaMxvaIl6SDv/at2mDotqM+ez2fKqzlzQTX4Y3RqE1bQ+br1c2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyKepwoWrfyztpr91jp5maC4igxumlOmBU0X7ihRdfw=;
 b=HQfjnUYuEtMVYY35yGPtcRdg0c6Yfc+8hGNByI4N/8+lFxca9o0NwdA2+cBuGhltuo+W4UlXVKQJGs2HGLW3zLoH+3kuIC2xo5c2lZHQ/svVnVmVHV1gXXG4rVDOCPvdQeQndAayHz+zY1ToFYc55ywF+LicGu5Q/bG25YRKenawYbGC06EtiksYSm4gE4ei4lWaXo2faFhlp+ghAk14ie3FZMIiuXBdVn9+8QlS4OZ5OLSKvCSYgroxN6WCcX9i4UNKIQ60vOJEKZ88VJkQ3oC9pZwl5uzkaFUrn+lpOYr6plqoJzI+nvBLR4aQpmUjKS0vy32N+YBO/wqOksUIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyKepwoWrfyztpr91jp5maC4igxumlOmBU0X7ihRdfw=;
 b=NxM++r7cPTuLL/ZA6UYp+wDCcjtFyPVca/YxTq7e9KUuMx6MYhN2iCVIxyHSvrH7iS+LQUA2mP+MTVcXDcxry52+rg2uGtKGJ9Y1xOSuDT4GzZpsP/ldKhlS8YTXh1KK59zqbj7w6zNR0sNgjulxgHxk2e9F7f6UJ/25nGI/NCBRef1m90xOfzQP4qAigeZQZzS9vByDkHBSwZj6VIy5EWKIYmKlfEdLrksAb2zqVV8Uqd/bznPCfgnrrZBWkdoE69Xtd/+eh2GfH9eipHkBGboN6UOh773Kaudvh2eZRtA3G8oi4Lquijc+GRmEhGC1MtSO5s6Ff9qYm2FAcHQl4Q==
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::17)
 by PR3P195MB0944.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.18; Thu, 19 Sep
 2024 20:33:16 +0000
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0]) by AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0%3]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 20:33:16 +0000
From: Katawann <quent_55@hotmail.com>
To: openembedded-core@lists.openembedded.org
CC: Katawann <quent_55@hotmail.com>
Subject: [PATCH 1/1] cve-check: add field "modified" to JSON report
Date: Thu, 19 Sep 2024 22:33:05 +0200
Message-ID: <AS4P195MB164558AA960821016E367C48EB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919203305.64841-1-quent_55@hotmail.com>
References: <20240919203305.64841-1-quent_55@hotmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:505::17)
X-Microsoft-Original-Message-ID: <20240919203305.64841-2-quent_55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1645:EE_|PR3P195MB0944:EE_
X-MS-Office365-Filtering-Correlation-Id: 060dd5c2-5f03-45b2-3b6a-08dcd8ea4a76
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|5072599009|19110799003|461199028|7092599003|15080799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	ysluuEy3/7MelxQ3PJ/1iB5GrdSSAK/KaNBA2xYdXJkKbt76OhuaBESWMIUR5LPwnEW7TBkIiBjRIPF/NWU9LzaUogmCfyNtumMudGsQl5VdeyEqV/et7fQQ1rNG7516QsuseEOaV6RS5EX617BGvMrwny6+2wn5DdYwiiGsXUzfVkGIgrwfTInRSM4sYGcKl/GnLRNjR/ej3zMGxRyObACaQfj/SkDLQ8gkmO6WxRO8/mqui4l0eXa9b6rPaZTCEF0ta0kOiDGTPrGp7M9vpX4mKs4pxx8gmLXf8YQq+IsAoQXsJTUoIkxuLwrrs1BKTJamnkYZeH7dwftRTy7ncMyZwVkd2ArlEZHSC2SrVSCDLDaKq8YRSrRgotMq6Y99l66rY8QEfBbRFPfKwj+hwKmzAhSn5H3jaFvcdbI6y2e7G8t7jYUABm4X2Gc4/8ybzgKN12WWOSSAe44b5rqr2/1qeFp4Cl0rHnhJiFBko8y//kSSJIg8rAwW7bljPvL4L0OteHKT2cnDQG15UgdS0fRrlzdLnfHIKNHKZUTJEQpC5m2KPCZT0KGU/DZDcwQa1n1FwoAQCWCL7CO1d6usEaySSD7YrnvmTEK9GnqRnjEcjN/jk9MwReqNpYUJxms5ZDCf1gEU1ug+yA9A2iq58N0dCfhLUwPcToqSj+hOuIx8NEoDHjeE87e1+16V4ltmHq4HKhrA8UtfGxQahy2SqjZ/9yN9B7h5Xcb/7/oAKjuZR1KW6aXIii+FkBLCHEMhUU9LYhNYBl6MvWVHeayl2A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aWlwh/M52vj9nmKyYNGCEDvSWECD77LZqKUAaQBns/9sOz0pCR0JcFq7piuh?=
 =?us-ascii?Q?0HH1ENu/pHdrIiKjjRRrkYa4LXwNbCG6pRo/1TxIbQTMgUQCILNY/+ZX+7xo?=
 =?us-ascii?Q?1MogGRwB5RgvA/h/+3PlPrGbbIht89k3N3CCgMdY9WgtjtRDHv5bmbZ9OW15?=
 =?us-ascii?Q?SuiNx1grVpIz1ta7m/4j1fH5GgZtBQfSYO8tdtirsPl7ui2ayFtCLKIPr6TU?=
 =?us-ascii?Q?qfh1gNVkCalpCRr/AE/a8S740VwUdShhOxMpeRkkjQM9ItO08vM2PpcqJ31h?=
 =?us-ascii?Q?SQzAsL6F1+Ubq+h0E0q0V6hTf2mJjpbElZN3ophIev6w3HnnPjAlvlTK3Fdz?=
 =?us-ascii?Q?I1RBKR6sL5O0f3qxx2X+PwfSqzQSWioshw4caQ099ITjTzFwrkX769LyL8U5?=
 =?us-ascii?Q?i/7P5U2AS4zszge4brFA4g3mlqWOPF2iDuvptBjJ8ReUmCAaeW6XhHBc4gse?=
 =?us-ascii?Q?1fsjvYkjBWBoSwPUYGGLIixkdFFn2qU6vvSuL8CD1zleHik1zfafjw/VSkHg?=
 =?us-ascii?Q?gpO17LVd3AQIYRR9TmIO6X59JM0OCMQdy/hNEjbNam4qNysoD6NlnfNmWDA5?=
 =?us-ascii?Q?8c2w7zV0MeNawso8IpLuUXg8C+asNErh4frGCLPsuE8oKzv4Z1ldojutCKBe?=
 =?us-ascii?Q?kiHp860wcjxzASy+cm3HwfwkJyoUpVh7EizoEFspk15xYKQq7utn6uPoIzXr?=
 =?us-ascii?Q?EJq1d3HjnuDJTADRaFHvcM5Wl0rsA/Rp257KMsi1CvRfapud2JLugNOQ0uy8?=
 =?us-ascii?Q?NH/L4HpD1ijpC4qfNW+MxbDyLrGQL1z+yP8v+w3dYcpDIcTCbqcwLZy7R0aO?=
 =?us-ascii?Q?yhQQxtQ9eKvnYnSdYMH9hD1bDEF9py71SfNBR6+IBc/rxOxUDa50cKODrt8D?=
 =?us-ascii?Q?0PIrZk2nhPdgSB2KgshTczeL6GNW0zG1Iu7xEHoOD8nNvJ83rJ+zayEuUhLi?=
 =?us-ascii?Q?Rd3uh5FmZV+y5UCU4yzqeEhP8mOMmhSblpf72bKGFmKObPMrVHIaPmrq4Jbg?=
 =?us-ascii?Q?CGxVVe5QcYFq/2efxHADSvjiUgsYLk9kSEqYRIVFbcjHrEROhXHSaSzLR6Tz?=
 =?us-ascii?Q?qZ5V5gD+Y3XjT0f2sTxPQxOCnGbOwpeRcsDv4bx+JiVyMhpVXneAI19qoKaq?=
 =?us-ascii?Q?/mG92/ZBlaj/lNXBguNzidK9WN1R4q4Z8yFJLioIBhIoswbjSBxbbIicgfEl?=
 =?us-ascii?Q?x6TONLulDLYAxbcDMb+0+nY4z9VWlrdqCU/3je53YfNSCKdOX/c4xPnAGUM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-1ed92.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 060dd5c2-5f03-45b2-3b6a-08dcd8ea4a76
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 20:33:16.8446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204712

Added the "modified" field to the JSON export in the
cve-check.class. This field captures the last modification date of each
CVE, providing more detailed information on changes and updates within
the exported data.

Signed-off-by: Katawann <quent_55@hotmail.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index a5104f210b..6245594dd7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -534,6 +534,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
+            cve_item["modified"] =3D cve_data[cve]["NVD-modified"]
             cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
--=20
2.46.0


