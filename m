Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A21D43FE3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 07:07:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35537.1731913668064519327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 23:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1052fa89a2=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI77Ov8000639
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 23:07:47 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq14w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 23:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGJ78ydZygUtetPJU2IA8EX2VfCMBbz1if2uGa5pO3eis7s76OzpvOdawSeG4W5elMWayA5RdysXQ0vb3gxrVVViFuIs11h5qi0iikyKrjGLFpRSpOnFC2yynz2M8viMamQjKNjp7zOJoJ16ttFE3lMBpBmzajhYyuYKcYpB+73e6bQCKEFNXm8aeRJTwtP5bAYJxH005s7RZvUZ1uAe3hMjrDfCcjy5vBfi91eJ6pq2A44adcvZAxp0DVEVzIuxYjuNeEYnRribTP9BAuxhjP92AS3glPJ5ZJdNIXxZ02+0q6dIj3Du+j9eX+aCmymFvtgBgXf0IN+sWSSebvFntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2+mMP5phe9gbsmG8XH8/uefTaGRFnNLdHxLnHZwVDE=;
 b=cW5QTglXoKOwGImdc1DXJMPxKYBAKRn6+u8VH/hQS3ecYp0IYGuQaIDVLY9elR9xTzs2UQkbCAwIlm6Qxrxs0yTRCGJtxrAxxJsLLDx6qPKXOVJFwuTy5MUfXSLNP89utyNdxkB2mdtjzs9W1U/V5gI076xhXUWA1Ol5PxgHQGKWOqeL48h9bo+k8QavfAc3LdC3v9+RC47Buamcf3mVSE5IQXR8fSOIOdR5OmWq2ao+k4AA8qbvZ913n44WDXqBINlemabEyOiGdiuMzJq4qibhuyLuO6Z7M+H+gMlxZHQ4PrD0JvUu/xkyqWlnHXXryM1gCSbGgQxagDnKSb26/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 07:07:43 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:07:43 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Mon, 18 Nov 2024 15:07:22 +0800
Message-Id: <20241118070722.2982260-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 610ba5fe-356f-4a36-c6a4-08dd079fb201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q5kp9CmKilIgZwXK5Nqv89VkrZ037NHDtbpXUnbTx9nWpdqZuOILHi49RRgn?=
 =?us-ascii?Q?f2nDNwJy95do+O9yDmco8yYEVDKzMohqOMUL9TuS9Py3xFXUrH5ku+25gpss?=
 =?us-ascii?Q?YgVPTbA/4dbhNgKcm1W8DW2jLHvHyMyPj1D9KETM3iLbid4miQZmiVfPtGrx?=
 =?us-ascii?Q?6YHbggZ2xcK87qfV5xeS2vXmPYhhSOe50vmrTpEU0596yX2NznDCDSpjt42k?=
 =?us-ascii?Q?4gHuIxnMiquD6Bk2ogz09ObxaElhxb5QXc6Nmc/Ss9He83piRB8slkKYvb9O?=
 =?us-ascii?Q?MbvfyG/XJDzbBAUhnQt37L9yO12lHP13I5oTAWkNot/OaGNOYTmbazbz4NDP?=
 =?us-ascii?Q?/xYL9Tq38tY1lmSVLvrKKjDhggHi32EE3OrBheDTWUPqDzv5PqFZd31LnVOe?=
 =?us-ascii?Q?XmC9j3Y+9X7e0nnTXRWegsvPYEgTmidgMOjlKBTwgGhyWu/ilzrRn5RaF5BB?=
 =?us-ascii?Q?ucwogdtVibP57SFGU9RMZjTF/uiXXWt4VCv6U1VFK2/NHeD55/jwLo6Il0PQ?=
 =?us-ascii?Q?2WZzrjT0Pzt9PHgc0E1jYsZyjPmNMKSdN6jEi2C7fuF4zseR6BBJgk9xuXKY?=
 =?us-ascii?Q?bJ4dPkh/uOkmAAubc2lG1htX3+YVpXmg0ZPvJYSkhY9XdC6RaakTE66Lv7b6?=
 =?us-ascii?Q?dmCi2UtR3z5CmKoRk59SxQy/tuopVC9GCL1kaAyjnNQZjHlaAgqT4eZvpZMU?=
 =?us-ascii?Q?Zo2k4hkQPfdnsVJF7N16RdPreCqQcm7a2i3xYa2ssvrawtNxNxD3a7jiraZc?=
 =?us-ascii?Q?BSOKT5PcTMqUX1baqTHICpyTAmiOuHsoeDJwxdc7qOtpuYYFWxJvoQDlAQs0?=
 =?us-ascii?Q?ObkMP7+WJA6ArONWwpTtmswxJWjs9GMrZ/WqyXqi0zAv7vN6rFwVVrSRbyUu?=
 =?us-ascii?Q?GTOyjiaCqdXfkdmHJ+bJ1+rOTqsVts9B+uJNc3SJQfyEgNumC4pCTS4+FscF?=
 =?us-ascii?Q?sHRW2EL1QiYRDVxY1HMzFSDpP5pwhRdNRMdGHjN8V8+Ii36zRQsz2iJoNQZC?=
 =?us-ascii?Q?F5Gcy+F/Am4koMF/MDjK2X/9ozD/DDQdoDbHvcfi/wfgvVY1+E7oVi+gE1hc?=
 =?us-ascii?Q?fkHSqWQzk0p2B7PGaO5IA2sghy+w+kJQ7Y8SU+bIA71t2dZfRbChaItHT/vl?=
 =?us-ascii?Q?7OFckomZ0Qj21OzehJvQjS+89Yy4Ij1qPNQUUByV+k/hmaLSOJWovkJrPRIl?=
 =?us-ascii?Q?FXAXci/2tCDPGr9LNZgSx/PuYiz3kJIWfTgwUmWUgs9oA1cyGDwydlalCpyQ?=
 =?us-ascii?Q?jAiGhGucAEP9Sif7B6chnPpPPs6q/fs53WaZ7D1EIdEeD+r2751ycs1OYl55?=
 =?us-ascii?Q?lFyfjsJJlLde3TpiSUawLHGnwcobkIU6N7zQqXyQ4fSfGg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Q9Rp6g81j8VI0ScwgJpXYOG1WgpFLB+L6EHxd58tY9vPMqIyj7MsD9VLpmY?=
 =?us-ascii?Q?TQEprcG/fa8IFkw8QuYTzi7oommJF9wZVYNVuMA5NsCVIBqE5N/nKjwrUhTY?=
 =?us-ascii?Q?XYPv11nMnXi0uESr1x7QxLLzOZniO9XjK8XaVcC2/LIzc57zBN+hYAakNzhg?=
 =?us-ascii?Q?mImwX/dcAgrB0KPjDiGsS+QwZhzPoqEgr5Q/KEWumcn51p2S9cAZUBvq5kWF?=
 =?us-ascii?Q?l4/2GTEwV4FlztfPeQVtOTvnAnJ3PK5/qHtwAVbE9D3nQqE83Hz+ot87W1Ib?=
 =?us-ascii?Q?TroDf0lSUz8XpJ2JMawjCjceL5ig07K/7cx6+AyUgLLnQZVeGcepQTBAnw7V?=
 =?us-ascii?Q?88/Kfs5Sl1v2cSsxYFrrhUs5+/cgXtOgMcL3dmKAEgLLFcdfCamAG06KLj5C?=
 =?us-ascii?Q?/SlowoDwNmmV76WQuNMeqmCv3VYg1J/MMD8rHoya3/tHS63aUJByHyQIq/02?=
 =?us-ascii?Q?cFkhh+UWGOetZzhFQ6pHZ01R8RtxgXCf3iueWstYeuCikNfTTL0bchcdyE8e?=
 =?us-ascii?Q?MyLbJXMWAD2eYz2crrAx3wEBOjKtD11E95mgEZxH+3uA6ulNt/VAkF+CC0J1?=
 =?us-ascii?Q?opVefQVEQfNm+aq9EnnyQZVHI/W3JHoYzk611AQRQ1+SKtS0M7UTEHgKUOC9?=
 =?us-ascii?Q?3VRQAbYzPgwv2hO8TACUpsah4L36m1vimfc3Ip6BIkb9eN43da4mFe7kqszi?=
 =?us-ascii?Q?FzqEehCxB3lNkGmqTUBwOrZBYU8a170HpqHupUZ/wJxetIF3m6VhJYH7Tcnm?=
 =?us-ascii?Q?v67p6gqcg6AMxI32NSSNjX4UQCiQK1r63YFkJzmHOlGDweyXN4ufUP7aAem0?=
 =?us-ascii?Q?2pCWP32HS2y6NFC5Z4xyyEieyhqdgc2EYvVVgkHBaA0wKoJ+jSVESZhwyX4B?=
 =?us-ascii?Q?U8QXodh9geFLZWHM/c3Ejhoh75F6HCGoQ7LMXj3dxmD9elWf7qzKuPG4lpRs?=
 =?us-ascii?Q?RtzavkdcN7b+zQYkvWMkMYBlM3vQWl5eO+18Cmgyw57OgJwdd6tC8FQpdBHM?=
 =?us-ascii?Q?jmVKb4vWLiPULzMdgHTPO3wgkoVjSh/B3wN0nISiaayUezzXBqUJMQ/wMBFO?=
 =?us-ascii?Q?K6QlWU39INTXksjv4whX6P419nDEsHsfEv+m07bFo5vmC1G0nQGj8eLIp2fM?=
 =?us-ascii?Q?pwVNVrDUhKlLc2K9NY+2DJDT2r9o5DhakU9eekzKteb/bo0QDNm4GWi4VLax?=
 =?us-ascii?Q?0wmpQgw4lT1LcDVJ3+QffK+0sgDAFYJmp7u9vuHBgVZvseCiMlMb7wwRYROw?=
 =?us-ascii?Q?kn/PBL7pgc4NuZ/FCEolUkL5iHXTIDgcmwAFBrfOSvY/lAjRRqdrRqDcCoRZ?=
 =?us-ascii?Q?KKj33yU5QwbV6mbaUfEUySAcQPAnJXAUs7uvdyahY3vHwPHcYRnLlFs79bQU?=
 =?us-ascii?Q?vI/yQn4f/ZJ8xYJEmxel7VmJhpbVHyYYOoKSMxE0o55YmiCNZPlYsWDNqO0N?=
 =?us-ascii?Q?ovp0WUryntgsNLitlCi/GxRU7adFzTH0Fs+HImrPTHfb5t0+Ibo12UjhRfLj?=
 =?us-ascii?Q?1bPRDSdOvWvJuWUmL+qVi24n2Lo7MIFOuAz9LU9HnmtsHd6/Hy8VLVyFAbkr?=
 =?us-ascii?Q?Crz07OncStyJ33GjM+SXNcX1emKIw6Juf2946+4KowJ5SXt90i9Aof4btWwz?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610ba5fe-356f-4a36-c6a4-08dd079fb201
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:07:42.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2Vz21TGRBB+F0oVz5OiYzi9GmYkaP2Yk8XCGj6i6UBUUaG1oE4Sj7xYDjKmQYg3PdZOInrjCQI3tn8YQ86x7ZgN0RhmRcsjKSkAG0ANQJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
X-Proofpoint-GUID: jdmBzWtOVdz_38sUwf_n28wZzTskpU1n
X-Proofpoint-ORIG-GUID: jdmBzWtOVdz_38sUwf_n28wZzTskpU1n
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673ae7c3 cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=I0CVDw5ZAAAA:8 a=t7CeM3EgAAAA:8 a=jKjxfLc-AAAA:8 a=phTsP5NMGLrc1fqbUHEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_04,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 07:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207207

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../glib-2.0/gdatetime-test-fail-0001.patch   | 72 +++++++++++++++++++
 .../glib-2.0/gdatetime-test-fail-0002.patch   | 65 +++++++++++++++++
 .../glib-2.0/gdatetime-test-fail-0003.patch   | 63 ++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  3 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 5 files changed, 206 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
new file mode 100644
index 0000000000..1997f88f12
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
@@ -0,0 +1,72 @@
+From 39af934b11ec7bb8f943ba963919816266a3316e Mon Sep 17 00:00:00 2001
+From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
+Date: Fri, 11 Oct 2024 09:38:52 +0100
+Subject: [PATCH 1/3] gdatetime test: Do not assume PST8PDT was always exactly
+ -8/-7
+
+In newer tzdata, it is an alias for America/Los_Angeles, which has a
+slightly different meaning: DST did not exist there before 1883. As a
+result, we can no longer hard-code the knowledge that interval 0 is
+standard time and interval 1 is summer time, and instead we need to look
+up the correct intervals from known timestamps.
+
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/3502
+Bug-Debian: https://bugs.debian.org/1084190
+[smcv: expand commit message, fix whitespace]
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 141263b66..cfe00906d 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2625,6 +2625,7 @@ test_posix_parse (void)
+ {
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
++  gint i1, i2;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2648,16 +2649,25 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
++ *
++ * Intervals i1 and i2 (rather than 0 and 1) are needed because in
++ * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
++ * and hence be aware that DST has not always existed.
++ * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), ==, "PST");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 0), ==, - 8 * 3600);
+-  g_assert (!g_time_zone_is_dst (tz, 0));
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), ==, "PDT");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 1), ==,- 7 * 3600);
+-  g_assert (g_time_zone_is_dst (tz, 1));
++  /* a date in winter = non-DST */
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
++  /* approximately 6 months in seconds, i.e. a date in summer = DST */
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
++  g_assert (!g_time_zone_is_dst (tz, i1));
++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i2), ==, "PDT");
++  g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
++  g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
new file mode 100644
index 0000000000..b3d11b5076
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
@@ -0,0 +1,65 @@
+From 27eb6eb01d5752c201dd2ec02f656463d12ebee0 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:03:19 +0100
+Subject: [PATCH 2/3] gdatetime test: Try to make PST8PDT test more obviously
+ correct
+
+Instead of using timestamp 0 as a magic number (in this case interpreted
+as 1970-01-01T00:00:00-08:00), calculate a timestamp from a recent
+year/month/day in winter, in this case 2024-01-01T00:00:00-08:00.
+
+Similarly, instead of using a timestamp 15 million seconds later
+(1970-06-23T15:40:00-07:00), calculate a timestamp from a recent
+year/month/day in summer, in this case 2024-07-01T00:00:00-07:00.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a191171a]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index cfe00906d..22aa5112a 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2649,19 +2649,16 @@ test_posix_parse (void)
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+  * but passes anyway because PST8PDT is a zone name.
+- *
+- * Intervals i1 and i2 (rather than 0 and 1) are needed because in
+- * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
+- * and hence be aware that DST has not always existed.
+- * https://bugs.debian.org/1084190
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
+   g_assert_nonnull (tz);
+   g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
+   /* a date in winter = non-DST */
+-  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
+-  /* approximately 6 months in seconds, i.e. a date in summer = DST */
+-  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000);
++  gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
++  /* a date in summer = DST */
++  gdt2 = g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_time_to_unix (gdt2));
+   g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
+   g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
+   g_assert (!g_time_zone_is_dst (tz, i1));
+@@ -2669,6 +2666,8 @@ test_posix_parse (void)
+   g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
+   g_assert (g_time_zone_is_dst (tz, i2));
+   g_time_zone_unref (tz);
++  g_date_time_unref (gdt1);
++  g_date_time_unref (gdt2);
+ 
+   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
+ #ifdef G_OS_WIN32
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
new file mode 100644
index 0000000000..b9afad15c5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
@@ -0,0 +1,63 @@
+From 9dd5e9f49620f13a3eaf2b862b7aa3c680953f01 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:23:42 +0100
+Subject: [PATCH 3/3] gdatetime test: Fall back if legacy System V PST8PDT is
+ not available
+
+On recent versions of Debian, PST8PDT is part of the tzdata-legacy
+package, which is not always installed and might disappear in future.
+Successfully tested with and without tzdata-legacy on Debian unstable.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport
+[https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 22aa5112a..4e963b171 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2626,6 +2626,7 @@ test_posix_parse (void)
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
+   gint i1, i2;
++  const char *expect_id;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2648,11 +2649,25 @@ test_posix_parse (void)
+   g_time_zone_unref (tz);
+ 
+ /* This fails rules_from_identifier on Unix (though not on Windows)
+- * but passes anyway because PST8PDT is a zone name.
++ * but can pass anyway because PST8PDT is a legacy System V zone name.
+  */
+   tz = g_time_zone_new_identifier ("PST8PDT");
++  expect_id = "PST8PDT";
++
++#ifndef G_OS_WIN32
++  /* PST8PDT is in tzdata's "backward" set, packaged as tzdata-legacy and
++   * not always present in some OSs; fall back to the equivalent geographical
++   * name if the "backward" time zones are absent. */
++  if (tz == NULL)
++    {
++      g_test_message ("Legacy PST8PDT time zone not available, falling back");
++      tz = g_time_zone_new_identifier ("America/Los_Angeles");
++      expect_id = "America/Los_Angeles";
++    }
++#endif
++
+   g_assert_nonnull (tz);
+-  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
++  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, expect_id);
+   /* a date in winter = non-DST */
+   gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
+   i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 239099d568..cdd21e7702 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -50,6 +50,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
            file://0001-gvariant-serialiser-Convert-endianness-of-offsets.patch \
+           file://gdatetime-test-fail-0001.patch \
+           file://gdatetime-test-fail-0002.patch \
+           file://gdatetime-test-fail-0003.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


