Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F85C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 06:35:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17698.1747895713813187515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 23:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7237ab60a6=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6TYas009782
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 23:35:13 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfsa7j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 23:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN8X7Kg2HRY/MdqR+xO3rmnb8Poi7IOkxmHaq9R3ZSsa6Jnwm2AtCUAe6aV/tqfleD+gZUgvTtgq+g7UijcjgMCUJEHaXdQdJxKQQUxjoa5mK2pZklysLaUddfvGdnkCUrYu4LovrAwCqoAgER6GFsi6mLZyP3RGAsWg/nRTgu6/PN8M42vdxwna7RemP0f1BKQEP57mMkpxOrpXflMEIyhStJMFUACBx0P5nWfQQ6gGIPhiKtVYQ0a1AFYMc0Fw1RM/DmQjZLxkQKZVZo1llDm5E/Bm+eOwep0dXmpjMY0GZZxpPzJW9HA2saRum57zRKig8XG+VH2TzHJ9gqHRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBxVhVqpfQacHwCuH4KJH6SviGFvHGqHxjmQcRbwCxo=;
 b=yRwF4YA6KQqpFIOCi/AZmPFUSCpwOt0owi8/FFwV79ibcAYWhZsxA0E9zhetUDIYbSKeuPy2wOORyBzcenf5C4fi5asclBMGQPUUeniBtABxbpdP39bPrMc7PPCsz9MJ7oKtKyWWzJQdlMPClnGWLtSWzZ2HcV3ynYIAlgTQh2Dkdmzj3WWu5Dos/22gfSEgKteoMPOyr8NQ23jNB0145E9zRMPd93LKNLdPlJ7Eg3N3R6UPgM9kGm6eL4p8cs2Ze0BPcgU2LP+UR2aQEvH9XsEFFqF0EJiwhaCiD3cpKMBdZr9hwnhauAD0dh5H6b+ClykaGMC+VspwW0ynogwxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 06:35:09 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 06:35:09 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] epiphany: upgrade 48.0 -> 48.3
Date: Thu, 22 May 2025 14:34:57 +0800
Message-Id: <20250522063457.2185844-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcb67a7-8d36-4b07-efcd-08dd98facc2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KcAqEhWe0eKYolxujSjy2ZgEXIGjVMqNToVkS9C+s5XO1J9PxwnB9uX/TJo8?=
 =?us-ascii?Q?KjTpErEAfuvkVJXBiCnSbnUVq1A0lRUHZDWYMsrA+QsCHDhL1RkexjkAI134?=
 =?us-ascii?Q?kgsNfjORklztRsZ8EK3iPxMPLG6uAy0y7OkAWOonp8iJ5RdL5ZNDQD82nQFK?=
 =?us-ascii?Q?s7/VVaJHcv/YyYbrs7No+woHy1c6GWhr8mg5IKGjLRIQsD8jpntNIhC/Yomc?=
 =?us-ascii?Q?AuRD9JSn48AGcJpkTkXMxsifmnpB5QC48h6I+KqWST+o5ww3gx10OvZQTGny?=
 =?us-ascii?Q?iJQkP59pLTbIg8tw82CmkIMt7s0QXqU1+9Knz6ysWS85czArIAxZtzJSz2fj?=
 =?us-ascii?Q?0Dh0DPsA4IyagaSNofS3CE8Y6xYR2fVzmKPjkA9PCt0Fo2x6uEnXNRANg6lC?=
 =?us-ascii?Q?Hxws35G7WTf8yNICABDLefadDx9L5FDHTLDA6YX3KLXJbtLaBVypqChInIrK?=
 =?us-ascii?Q?7tJu88eeom32v4DpkY6OXbgAmstTX4gUYeyMLQW6WhvIHvqHEC7jdhgzEHAN?=
 =?us-ascii?Q?dScg2gkknkqT0vC6xZLv/3IcVfEDBS8vwjnKqe7SgFa74WhcpWe1PBAC6u6V?=
 =?us-ascii?Q?dk3jo9clIkKbjZ/rse4wH/BJZ26s1bTbSgynPXW5SAq/EAIMTKR4Qx8Rf/xb?=
 =?us-ascii?Q?d27ion9AHr8YK/JNxi/1BqpKaCPE1/SOzxEkLx7Mpt5nL4minvhdw4NLv+IM?=
 =?us-ascii?Q?vN9lz72fjCqVeheWaOj5cPwKUQA/e9EAKu7rE1mQVzJRMPyR6kuQ92XKlXLn?=
 =?us-ascii?Q?DzK1wwkMHmR64GAMoEsfdFLu8+GKGXULgQ2yySbRo4O/MExJ4oFojq+zwd5s?=
 =?us-ascii?Q?Gd0lkSGydxqyTJpXc4x9ud87ZNgPSaMVGK/1GuVhH2E/fSnd9sgzN7itIZZT?=
 =?us-ascii?Q?+XizfRNG+HVI5p9++SVtLqlZsB95HH11CZGJAy7eUsZCJh3jc+ZXt/LDNaDl?=
 =?us-ascii?Q?B6EUCkOMIr4meoRF1uqKAID+7vMKo6oi09/b+eXXDTikrrNURyM1v0V0N+lG?=
 =?us-ascii?Q?Z8YtlYjrMy81DSXPeIr1RVTAIj8RwMRbJ9afg67hrS9IDR2k6hoXd2j/6liK?=
 =?us-ascii?Q?3svdCmIKUtE6ootZdq7zQPxgOM6qwQ1QnBpjuVj/BZQnHIEmYqo6a3r1gxPy?=
 =?us-ascii?Q?i45AVN4u8qYc1yAuNZlDDap4bKqcfLsKnHp3rrUYDx2VQyFaDuf6YXK+d9UO?=
 =?us-ascii?Q?T1LC6szs7VksWvJ7nHHuRGxsgqdp6EplYRcfc5i8vcf5eAsaTkarJwQtASLe?=
 =?us-ascii?Q?iasvt0XBZRh4dLl1RJ7+/1RjthmjC0Pxx21pHCdq1ohj7gHRyOXjyN74Lsql?=
 =?us-ascii?Q?vaPXKDumKbHuzpc/QoX38uSFvGMtxrVhiUEbzjalaIKcRA0dpKV9uW7KWSLv?=
 =?us-ascii?Q?vx524Ut7bWKPsaBT7syEUtf350igAW3CGJY2VBVd5d7n2xr6cvKWc5l7VAd8?=
 =?us-ascii?Q?VnE9vjageAEZeIYH71Yn8b9rlVMRwDmDG2HpoUkVuhvJl5wTvKPIvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kiVzayZWQt+w/Pna6hPeMyXu/A0mAeoWV9CKWIr1p8Fg1JnLEqMGUXWFMJfg?=
 =?us-ascii?Q?zI8Og21iCsSfvNmWZE92jL4gZaqhEBFNxRDGr7GhyzEfOIFJvG3PK4QJCTFv?=
 =?us-ascii?Q?5cX568GEgz38E05zDBP7ZWYnU2Tz4IYUhI3LQRBXqL898Qxj2bJ7zi9MFS6I?=
 =?us-ascii?Q?JuMKxozpPPAsrM/UtsxlWIemQxpaMxwG1itsxoBNIRgxtaPqFx2a62SndL/7?=
 =?us-ascii?Q?Ryg8EU5a/mZOqZEz8YeSO7pQHiRRm6HKKSs+/5h83vlqaUR/etCSimHwDFCH?=
 =?us-ascii?Q?pedm3j1evFq3ZYW7ImHgTT+4CBKIM9Zu7hPC7+ge3auzlQf5MkhzxkUk7jCc?=
 =?us-ascii?Q?NnPkXovDd/G25oJf3eJDkIZcnaqEpyI0kzi0jdk3tfWSX2NJaRf8466V58mq?=
 =?us-ascii?Q?z6dT7MEF+KqYjcj51Q3/4aGt+MOKtWHU3lq7p/j+IrcJFqygXPA4jmfCjFdx?=
 =?us-ascii?Q?IZ1/s2hY2AkpZwDFmLTRCuPjagiYF90uig7MSVJhnvL6MentbP0EIhS7pVkL?=
 =?us-ascii?Q?iTMaU5rBEZ0hfj41MxkiQG1WnKsk0Id++xNzWeywCnwHe4LUYpB0RSb7PAOL?=
 =?us-ascii?Q?j2kEKKXJ0hIFqdEacFvgR2TNKMigXUsrwRmNBzZ9Mfu1exCICyjpd3YRZR6z?=
 =?us-ascii?Q?QUFnitbAmwAMZkMCd48uKNufzpSoUsqlJcuW0PXsACFJSgqbXtZ9CuiIFURI?=
 =?us-ascii?Q?db4/r7n6st7F3bgKlCanWiP2deoR+mJipCRduymNzvWSVpnCCZ1AEOn6dLKX?=
 =?us-ascii?Q?0DfBz329Z3lki+wWvCfJ6OHXUn7CujIBrZFPz1xdQmGdxaYHEFYIUQtOPlNy?=
 =?us-ascii?Q?1kSmpu7f/uOSgTxhnilsCC216dgxLIHWSyiTDTAAyPjfuCZxK4zXESB5O0Z2?=
 =?us-ascii?Q?Rs3sd+VaejLIXIPafcD8K8an/nzhOLCchbaC8xlhS/YCKq7aRF92cHSAqNEE?=
 =?us-ascii?Q?wHjn++DhS5fRP3TnTs65V36hq/mE1E4PvYObS1lAg12M5xXuIE0Gw4I1jXCS?=
 =?us-ascii?Q?iRvSZeR5Gg0ndAi/C7GFhYXBTqJxJm85hP5pOGoO6QXmpZgCHtRd3e7LC08E?=
 =?us-ascii?Q?m9bZ8OwSWkU4MOw+zlP1wOsio4z82VsguWvEVyE1HQpwwOIpUnq3RI8q5Ogh?=
 =?us-ascii?Q?NDwK9hEh0saYoBgVN1dPZv8vwUD3wao8fxZTKyQxOwcgnmElwE7q0CbEPi1D?=
 =?us-ascii?Q?L4wD4DOB0PbqTftzlOqNFDL5ArIYt3GGWrsGFilVgFCMp/lsyZ9hy3MOSas5?=
 =?us-ascii?Q?ONbZ5zKGJ7rmERWZnzNXdYCbTrwez6Vry0Xnuf52jZYUuVdrjfNye1kVhGZY?=
 =?us-ascii?Q?tvTXYXVLlAXcgEQBt4aUhJtqDLsGuMKGE7S9CaE+OuErSPPUSxfYeOh66Thl?=
 =?us-ascii?Q?JBb5ljL4yB0Hg0CH62atPbCfMW95+DkBDJXGtz2/gxTyV+8syVfGGNodQggo?=
 =?us-ascii?Q?0aeVj2rjNR7dnH0K5CqGKp/rqDLi98pl1HbGZt0+AY3H49kJSIUBr0rEX8ok?=
 =?us-ascii?Q?mSfde2DIp6nH1nEDIDwTMKjh3lgsyEPuQT1E9sOR1hi1FChpScWiDFbKaVDy?=
 =?us-ascii?Q?tFlPgUQhovObmTz5FMhDbk0fVoE4IYmfcQ/rlXot4E+KaXT7AWkZkfpvdAKp?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcb67a7-8d36-4b07-efcd-08dd98facc2d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:35:09.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PKIBVFFQro1nNNc1+2D21j8PPnmSPdDLhj4Tlc85ocRqSG6q+o9Ulmd0geKrCcknSuNIl3kfVS7TZRhKk9WqPYw1mcdxs1PNcrmPP+fwps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-Proofpoint-GUID: YIGLMw58UKwanb-0lIYeTCAN6va3HmfF
X-Proofpoint-ORIG-GUID: YIGLMw58UKwanb-0lIYeTCAN6va3HmfF
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682ec5a1 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=1Mha7WXuEJiAHFvaFaUA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA2NCBTYWx0ZWRfX7gM1R5mKNGWl Ol5aB+3Dii3OnXY+qcwXDcDGm5JYY6pIZe+xKr6fCukN4lhGCtU9ENXjzlCVN8nAW8/VC73MmfK yw59iCDvZseQb5dp499uW+FscAiUtbzKc4h9YuwW5x4uGoK5aC+dipm//nCRA1BH0wSJI5JXfY9
 iNV1jwEWVgIU+9hVelorkHi8hpkF2kvNmOEm0e9byHtUsl77KaIWF/lfextFyyihpcNcVmz5jGI yB7YkkWaS3LP417R41TIPP3PbYABzRURKdRnria8MGy/ZXphrP2R1ptxVEgqo0btbsim/5Qditp +qZRvqz5ttEFvLo/0qFiX5qBwNdUpGLWAEXnKA6g8Rve4YFyUJPn6+ShYYyMwHl2Tg70DDhIBrZ
 WTJ7rvy3xyAN8IFI52GFN7st6NwPcex1PnKlI2jdZF0wD3H0SiWhdINTrjkkUYQ76Qy2Ta9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=504 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217064

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix crash when opening downloaded file
- Fix crash when opening incognito window
- Fix Crash when trying to select download location
- Fix Crash in escape_csv_field() when exporting passwords
- Fix Adding WhatsApp as a web app crashes
- Fix Pressing Escape key in addressbar resets the cursor to beginning of
  the widget
- Fix Epiphay shouldn't show the privacy dialog in incognito mode
- Fix (CVE-2025-3839) Require user interaction before opening URL in
  external application
- Fix Code cleanup
- Fix window: fix crash when force closing window without session
- Fix Several fixes for password export
- Fix Remove Granite support from Tech Preview and Canary
- Fix find-toolbar: fix crash on load-changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: 2c60159fffd76b5dbe75bf7d6758e5f78b166714)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../epiphany/{epiphany_48.0.bb => epiphany_48.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.0.bb => epiphany_48.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.0.bb b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.3.bb
index 9eff56df3a..74a17be5a5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
+SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


