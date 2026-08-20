Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE53C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:58:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7731.1787234290353270027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Qfg6UVQC;
 spf=pass (domain: est.tech, ip: 40.107.130.39, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUX028+ATc2vo9XdI5aRJ+9pXssfzIR1nCjefwGkxUyytSQpa8mnx7NlMuq8L/OdMFOJhSJZEwoiEtMYCVqkHsD5mEKRuJs5QuAWpomNZgXsr48KB0wHCe+yWOM/jqDfW5htjEmj7zwYOXvsyUdfwHmHAVNxVl3zgV7V7DkCqMlaYNOCRQAE7kfx+XDx01lDkoW8HSbIzwlMxhsLiSxkjpjjrGWeh0lQiREuuvtZEfNi2kJvkeNgdiUNl+vfGhXX7LSVfpQhv0vcQOlWl+DoKliaUr9/QJZtqiO3SP6kz/G5TBXUgTVIjHjQNDouAPKtrRq7RnzPf0IuAWg5mknsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FthFK6zRTcIovK2b0VSlgs//SY1c/uyDxvVOvebtAyU=;
 b=PGx6BwkD9NCbUOuM62HLccBu7gRQsY+18iKHV+raZLX1VhkEcT02+QleKEZhIRFTXPltbXQYgteFeCPpHhYqGe0jM7ubv7rQFUWmg0qpsDJqNnSfdxabqMjSsQ/QwD7t08ETiELGDPOEMu3+bEja1JPi+idTiG+Yp7W8mJiTPbvizhy++UzHpn5quwEfV1WoZ4P93IcCc3UjqEr5tyn9g9SPKoLuOo9YX5t2CQv8KY/nBHrMx23lAgxcNPac7w52p360f0p8ffAClqPMFktjjM69p2r732AH6IQ5vBXb8n20bXSf2BA+AFEINfu4iS7NULYbqc97U1kvd8nvvSi8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FthFK6zRTcIovK2b0VSlgs//SY1c/uyDxvVOvebtAyU=;
 b=Qfg6UVQCwftEy2c+rp0lxuWmlxcQphvR07aN9fAnaJQlgBnROzQWtiLdTEj/ImQQ7k/ty4I+BeWgBZ+RMSHGRDdFQg4YfViW+ULmrzSZ1aAf/1vuMiQNPSQzOVWlN8zDAGOz7LeUVk4E5T/gpu+nzD2HgXqZZ6DP52qpxylbrFcf/nTfM+0Vubf4xQXzDKdoCAXT/Z+NDxuhrhzVHaExSr3HrAydwNqUvtbY4kdmV6LUkEpp50E6HSv5LrmfPh8djoxfEtxew8YjBr29kTvKqf1bxQWYJWm1ZfRAKi1agolzyRKGHXSD070FvH8fSlv9vrQ4SnWhmncVJnfME3bmwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0602.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 13:58:04 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 13:58:04 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] bind: upgrade 9.20.26 -> 9.20.27
Date: Thu, 20 Aug 2026 15:58:00 +0200
Message-ID: <20260820135801.33728-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::11) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0602:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ea70a4-810c-4897-1c5e-08defec30e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BNnwALe62azYpfstJno6bab3HC4bYtjXa5ahL/4n33c4Wv56U+/LupVhj8ZB9eo1/691FKBLWZMFQWeng24mHArgJqB3Q5ER+L7shTdoaVSedsaTdVHPe3lVBcX34KJLtO+fPGCog6u+xT8ZQKTyfWi53Dq+L9WOGNtplDFsY5L/KwHTIbavUmayjKUYKWnugip1wg8dmKIiCyWDSzenT3I+O+MhBX2YIvl0nKV9lFDeKO4o2nApxEU+q+PG57wJdWVfEMt59VViQOm/Gt47UC2yv8IB4ozHarHAGeVcRhXj1fhZDixvNNf8qH5ggQZ2tcZ4noIfJgbfFfcVIjPe68ss7MfMUSxAM40rMVZ5rmlU5uKNzhXTLB2rhVPle6UC4neUXtlBPweQNI6bUejY/1rb6doIZ8bSMjMb7U2jbCPPEQsD9sgL+VjM8JgCJLp0XcEBkWzockAEvo/XVcPjptbeUAFz4fhnV20PvSgRdQO+kCIk/S1/54ZyUQVrS9TRB3EuXU49ZOl1sWL8379Y47of5Q5YOCRWjS07brXwpty5uBsJCI3qJTeORiDlrNvlJ/P1bzRLDo9JEEVNki83JyCpwGAFUyId2Wwn5GvEx/D89Husgv88LPAuFgIupZF9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DHITlJ3qt28dw98dfzH0y0+8nDKIi/rXHbbbUdBwoVF1OdWDWFjTAPkygAAY?=
 =?us-ascii?Q?YzvSlxs3tWJHyUwKDEmeBo4ljxdm81DjJKCOzb8PbFsOTbzuhSlpW954Etka?=
 =?us-ascii?Q?SQYBTTMX8JzItc+zKT+bn4CtjZZgSqTapgLGL/VSLkk1Q1XbEp1omVpkYxe2?=
 =?us-ascii?Q?jAWMsr4QpTuVYiJctJYNnq6DP7JnHU/oac9gJKt99MX/Qu3SM4JmDBmEXPBP?=
 =?us-ascii?Q?RgYduNb8WUeaKnSMw8yi0ccKLAalbO1vt2GK/pP942tAZgZKOTgPy+5C9vuz?=
 =?us-ascii?Q?xHeXg/ZEHJfk4JL7f9jLVK2/c3TsBgnPQli3p9U3GuCip/x3vknOrQUmDGi+?=
 =?us-ascii?Q?wtcdnpA4alA/U7ZxdFp0jgVkWtQZafcSVGmXB6OjWzBvCfkWsefkIw7cWCus?=
 =?us-ascii?Q?0yGspj3y4jYg01WrvTVsaOlL0dbq/0QOMbCF4XWSexgVncreUOS5LQ0AVaOO?=
 =?us-ascii?Q?J8XBb/ChXdIlxzzm/tShHudb+4a+cqQJ/S53WBDbfEaTFovkjf/Op3HVNHj9?=
 =?us-ascii?Q?+/c7xc3xPWaCdkePjzgcYut+okNpo/nGvclrIRY65q2gDsFEouNV1m9qNo6R?=
 =?us-ascii?Q?bJqDfMgJvFiQqKz0Squ+wqrtfUaygKtJiMJyIRuwcb//xHARdKBhwJs0Yz0X?=
 =?us-ascii?Q?999HsQMvz3LKqpXY0qAZZtymbnFrFSQYy8mDNl8fm+zRvSNutsmwYhKSOw5Y?=
 =?us-ascii?Q?yo2WwFJ9FDlcsh6WsFu/7GoUjq7Em82T00t1VbQ+6ecNWWa4EGsucdxCtXi3?=
 =?us-ascii?Q?HrxwPeejV6hUQTQCkBouyrPyJwf2oULKZAqQNyKVvehWUl0/pqL8HY/g2LmV?=
 =?us-ascii?Q?jqS/e1O94YefwYKgk/hAtQvhLitlQ25MgW+Qw0vsroqZeG+nE/bPcnWbpI/N?=
 =?us-ascii?Q?hJnC6xcl+ts25jZPpq5Pp6cHRksY2yKo/I6YAKd7Tc5Jxs4VzV3B/584joEy?=
 =?us-ascii?Q?tsrcmeAeuYRnvjKoUjca/9x7tjSEka4DFwzmVTCzv4gk/2hCpK5kmzZUi3xw?=
 =?us-ascii?Q?K5GxopXpYnhQLOihTXKD976fY2WJpjjRqDU3KEx208bJRavFOVAleI1oLD4A?=
 =?us-ascii?Q?TtvmV/uEBU8muBtoS69b7/3jUATT4wGiHq2g9oc+JIzh3TbhEr2R3UP36Q7j?=
 =?us-ascii?Q?AKf2kCY48LncpMGC0iMUfWh79LPV+EW1GopSyZe1uaD2is6GdktseM9ufxwG?=
 =?us-ascii?Q?Oy1RLdy0U76MHKsqcdr0pcgK+8OQpWXgFaVhKS5t7Tc8H1GSTCluoqG/pYJH?=
 =?us-ascii?Q?Ut0VuA1m9qMpQSxjrx5iECIsvOPUYuFQHa4izhv9HMJwIteXCGFpZzrnfJGg?=
 =?us-ascii?Q?AapEkpP3TWcZETNmS4Pqs7DgoYb2z0jMfeaDgNwzp93hb0VJo6Q3IB3STaS9?=
 =?us-ascii?Q?HmOtHAH+akJCpMfhqJnTXq1j1HMmnSod9iC3VqNQ4j00yYI1K7rNAVD3iooR?=
 =?us-ascii?Q?2g98I2vBrV69ic3Hybh/e3+BhL/aqVunSzNv6xUR8XyLFTuAZdMj559AyO9W?=
 =?us-ascii?Q?mELC9yBiwXPBrDu1kYLIHjf9eV6JPuZ6Mgi+ubSyf2Chy2BgCAoA8PPmiZyx?=
 =?us-ascii?Q?IH0ZzTHziswJ0zgCg0K+2mtRUHJgu/vJa3jZ+iKFwaKR/OnVA2E51OFz0paU?=
 =?us-ascii?Q?4jH7zE2leK+Ft/bD2UgHh4GVn/kdpzU3OWc6OIGf6eeShQ3fJVsjw7QkPXOO?=
 =?us-ascii?Q?MAF4ChKIi/JT541Y7HyRHQDaiMoWr5WTpjw/y5eFE/Mi5TMEjGyDHAfRCbWY?=
 =?us-ascii?Q?Yaiclox0kA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ea70a4-810c-4897-1c5e-08defec30e19
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:58:04.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC/RozbVkGwzkFJ5OWGMPCFR1U7LaBHtYXziLa7/c+0Untpfz578e6ppCcByngSZiffyNYZ4uifiGhg59ChUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0602
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243861

Release: https://ftp.isc.org/isc/bind9/9.20.27/
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../bind/{bind_9.20.26.bb =3D> bind_9.20.27.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb =3D> bind_9.20.27.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-=
connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index 21ffad7bad..e915161d8c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "55248def0f870c4c46b3de72978ea972615131516663188a45=
64dca1d20bf350"
+SRC_URI[sha256sum] =3D "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5d=
c7e238b080e4a0"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
--=20
2.43.0


