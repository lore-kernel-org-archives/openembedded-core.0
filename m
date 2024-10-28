Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28260D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:04:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46409.1730102687664823814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=003180f0fd=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S5A2rt009481
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8hydd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/XH8wS9aT5fLj9FbMPe3KqAOprDsiV73hdrvUt/VYuJgYxGLUSNaVrRnvg15kkxujCSEhP2fruY1TH9He16Uy8CHR2+oXpTOUV8KpMjkoe8+M5jDYyzN+OWCIdlA0OOfL/zl/zsPenmRlP8VAG8hLmbg6rppobJhIOVW9EwBxorQados9cg42GnNHk+1+5qIY6jscumfi9FDFAelPJP3Rfkc015e1PBdT+e4w/KNq39GMmNB29bsgQwDZj2w2iUtwafJVWyHUelubxkoKul8vvzkuVwhrjLwa/UR78/3kghCizNbDyVB1Smau0oglogDylpZkPVQpK3/79oNkirmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1NW1s/h5UHWA5VHwbVE7MnYEAfoV2u8sPnbX6E5xIc=;
 b=M8ooXNs/N6owumRCPHupsd+++buNvr0+j+cyT2oYhln/LAkHJHRys8T00ebZRzfY9UENzt5IXiTnfN2F7/zWcOoUz9erIucnFDFR37da/Kfxtt3LtyBgxd/48KAWcU6o0+15P0hbnjkwLk2hd++jdRRacMVjImpONGPQaRZ7Jjvaala8Pt1bqZmfruMALZqB0bnLXo8UEOhZLovXoJ8UI+tz9OUBp8xpcR7AaxR4jNMDw3q2Jt/60yBon61wvEVq0EFth83ZpJZrwszFz4qA7PMLOjs+1mbxzx6vRfBxIPrmJ1fFmbpnDCYaD4TglUE0gDST2miHDVu6pohmMgxdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Mon, 28 Oct 2024 08:04:43 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 08:04:42 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when upgrading tzdata2024b
Date: Mon, 28 Oct 2024 16:04:25 +0800
Message-Id: <20241028080425.2232475-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
References: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7c32bf-ce70-4230-3e02-08dcf7272dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m9O60wHSmKQ71VN8qUK4wlE5hBQgwjr4XUkIPHf7+1DPiqy6MuOZy5Y/ldmr?=
 =?us-ascii?Q?/z/FIk4dzckVstNY6SeWx90TxxcEo7zF/OB2K93oW7sowy338EG1xgDuZTkY?=
 =?us-ascii?Q?K6K4pK6vIU5o63j82w2TaK/YCAJXZQ3Ys4DbdN1EvNu/J0PeWtHJDAMh01PC?=
 =?us-ascii?Q?smDesFZOUhpJmxwrP71hwGN3E9jKdKlQcv8r4tRAq4yRMhn5Kuv6sS9PtIng?=
 =?us-ascii?Q?m1uL63dEDqAYSm7//ZXjCLTzvci1kytZDVN3zEfLM7r8PSa2SuDli+jodjeZ?=
 =?us-ascii?Q?yLHqfnBdFtS5SqkboxUKjF6zeWLHUBs7nIv1t34bcaBG+d1BR3GLkCWwXahV?=
 =?us-ascii?Q?gB0+/jWTpsEz4RVuHfPJ6emAAwfMv0XH14zaUP5FL290HDkP8sppvWOsyU2K?=
 =?us-ascii?Q?+yCUbyeVpLawXaAN1ahzrXOU1ErRvQO/DIlJC2qJvl8loWTFjbx1J0xCN6zh?=
 =?us-ascii?Q?VQ19PPylu509HKTyfKQJH3ml1IZNT9Ts6TMeD6+cV3XrZsLyrJVSzUjZTKlc?=
 =?us-ascii?Q?pA4+TKmYa+iIPvCHnp0gIRXinjc04g8/yd3kDgaT7yPeZuoNlHm/UjL6DnTR?=
 =?us-ascii?Q?B39msWFg5CSyJvewsK0Fb0VNEKhlLZsd2cnTccbHN1i8KzIOYzGDuwZ0yvqK?=
 =?us-ascii?Q?efcQNY2NMebLRfUSpX064o5Nkw/Z8nGB5Yp/Yzb++Wp2ilqLPwWFHtMmn7C5?=
 =?us-ascii?Q?q938z54lDtVPRSW0h8lGfjMANOZd1TLAhudIcrfoqfKFQlE1xcaedBO3/BXN?=
 =?us-ascii?Q?6hX1hBa7Zkls5z+4LcYPGlhH1jkCtKoMnvpNb1jw65e8ATFhsSbwO1p498vK?=
 =?us-ascii?Q?Fp0zCxHExwbnGC3TC/gYtE5mjg/ikShjEveX9snAV6Rfl7eCQipIfQ7zBMFA?=
 =?us-ascii?Q?PnoExsR15fnNAjvenMZ/Derdo4/+vXTKlcNuNNVn+HT1ExYc+ZfUW2osx9YX?=
 =?us-ascii?Q?65XpqsguFSkxvNGN5g8Zr8WmatxH78317S6iI1DHvzpZd1zJKMt8h8eHdNBV?=
 =?us-ascii?Q?ezbVibKnTxICecdx9CRIhbWbLau3YJ2h0cwTV7K3gTOBgfkFN0xGd5zkNvDD?=
 =?us-ascii?Q?93gOOnLpT9fLry0Nx0xzm5Z0qXtrI0D9lNvssQXNz7yAr0oXHIhhMWVPZMbQ?=
 =?us-ascii?Q?ZKPbwaVI5MJ/X3HlL300QFUM+bH/3r24QCW8axX6ROgicKe+RWuF3bckyqid?=
 =?us-ascii?Q?LBy+UldKJ1zigr76ttOYH8NraQeppSdPd1uxq1XiUMA+Pm/uLL5Oc/QaPNYf?=
 =?us-ascii?Q?q0r007nDgvWogsiYkg8uBtWb21Bgi8XIgDksEAZ1KceY3RTePP1tQNxuTKjJ?=
 =?us-ascii?Q?Gtm1Zg40PKfbKRD+/mjr0xm4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R3Mb3OCEI1BTY2lOZUeI4tJ+nJwCozout1eEZGOdva+c8R1NT1amKeiqnOpV?=
 =?us-ascii?Q?XucfiYB/LjEiRq3EinYY0JNahMYb2U8seoxREQk+dY2lxA2W/rhJws6G+48W?=
 =?us-ascii?Q?8jl3fIHQZiNizUbtmB3fhps+7GfjtiMU4nTZWMsMWhKtvyhiKwK3GihVWh+0?=
 =?us-ascii?Q?3EqyqVpHXVQHLrIuzINWtCzp3QylLAa+mGQ+i6F8teBIlkF32vfzhkw+59Nx?=
 =?us-ascii?Q?+cC20jSf164Bn6Ob6EkkbYqR6UcAPSJo0ttII1j+SdqAzjP3K0Z2HxgifiEM?=
 =?us-ascii?Q?H6nt/eXc4d93dIwPuIu+aIobp4cnobek5xEAMn0+4p9uUJ8sSey5cDFhZwJp?=
 =?us-ascii?Q?MBgsd5MBzrYRcN0WsyV/C3fCWLuXAsnoQtIy6Pe2Idk6jaPsWHfqNpsmexoQ?=
 =?us-ascii?Q?WHw0iK+cXEmKvd8lAyZx3noO1YXcY8+huqxqynHBDPRS+qKuLEylt+FBotWQ?=
 =?us-ascii?Q?1wmp+Dtkru0gsd98Foil2IQgKUpbtnhsMMzwWw9446T9+tK2oyEVr3fJDPjb?=
 =?us-ascii?Q?i6A5DSeJe8RJBGDPSnk0p+68+qPgjlHTdyRnPEZWVt8BxoHdvL4ToA9vpl1q?=
 =?us-ascii?Q?W1QloThdDsHb5I0pXPUneBj33/fmi/jhrBm5S8VlOqyyNJAKwEt1rLVVR65V?=
 =?us-ascii?Q?+0oygg+uUiXqceyr7Pridtwr9qggh0l20DJE9U/0GK1syoaBAZdYWMD9ndQw?=
 =?us-ascii?Q?/Y/ai/INrRPWRcXlFi+HupaG1aBPCnCG38SHxL61QwVaI46waDimQcHyoQwh?=
 =?us-ascii?Q?PwryYZ2cQymIXboJL74SCVEUzJCwvDLIn45Nzgd/NZv0W8DTo5JfMQ+UmC9h?=
 =?us-ascii?Q?DFLAtiar4UF2rUTgGsfwS7e767svdwMWODaFG5xSq8sUJzeZO/Kbd8lhkezn?=
 =?us-ascii?Q?1k8mbQUAAzKHIOHNnxha5V/qXzx4TXfV93n9P+PXKhIBaTrML+Z2NI/VqRe7?=
 =?us-ascii?Q?4SQz3NI9TaflNVd5/4MfTwjz+lB2rRXuHh0bSTnCA+WrSfrmk3AiVUz+c8jt?=
 =?us-ascii?Q?U0oG7TFFhOhkas8EnivOycgClvll2530UDrhd05Rj8X7cnF99vVUiBRNnCNC?=
 =?us-ascii?Q?p6XnQbUOlVYWupF4RMHglKxeI9F02ZqskjmpDZdVam3ie+R59dP+gmv7QCQJ?=
 =?us-ascii?Q?kyH8gK94IM1WC3FO8FAKVkfXYLThHeBSWK5b4sAvFIwph0etBKUGWAe+b+6P?=
 =?us-ascii?Q?7iKfmLipvWGr7FeHCdg4cEN712fzdLBWAACCXh52ryhmUoRCyg4CBydAaw6h?=
 =?us-ascii?Q?zsYProadwznG+UrqWh9xgibm/Da6hcCv7u5JW0V5Bu4jAlQVfUROjaOWt02k?=
 =?us-ascii?Q?R207B1bpsfx0Rv3UZAVwofRI0U5s+MFt7hm7Q4RUwrKC09vV6XNHZKidW/XA?=
 =?us-ascii?Q?DpPbFKDGR3BSOP0ZevNFP/MciIy5JTMUTXI9Bc1519BcmbcKBTpL34eRX5ie?=
 =?us-ascii?Q?G086WvWLYwLCfusA0ShyJLvBWKRXScf8mTDjwrH7ltPrzw9EtxfjrRzVsg3O?=
 =?us-ascii?Q?bn7aTVrB8EBlo4FKSGejWbyJ+wi0HxrKZ7itjaHnmyvicG6iZ8PcjcuwFYxB?=
 =?us-ascii?Q?rPk46VmrOlWykhq9lxLIFTvQrUuyQGpqGVtXBb9oB6rMQQU6lNwBr2gPNB1i?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7c32bf-ce70-4230-3e02-08dcf7272dee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 08:04:42.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEcsj2stm3ma6RzBHr06872hVrvSwS6ELe7kIbT4PWjyQ2Dvgx6LIZXQ4d0huvJ9F8S4bZIgGSM/npxGEHbnEWc8y4jckqq3dYUoADodSJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
X-Proofpoint-ORIG-GUID: kd2vawYeC-UpUCINe2_-OpnhZY0S5YEX
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=671f459e cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=G2-C-KEYQYWNINrzt1cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kd2vawYeC-UpUCINe2_-OpnhZY0S5YEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410280065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206423

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...all-back-if-legacy-System-V-PST8PDT-.patch | 79 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch b/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch
new file mode 100644
index 0000000000..1909abb557
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch
@@ -0,0 +1,79 @@
+From 2edbf994f9625a564ecf4a6e7f39de077d6b3b77 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 18 Oct 2024 11:23:42 +0100
+Subject: [PATCH] gdatetime test: Fall back if legacy System V PST8PDT is not
+ available
+
+On recent versions of Debian, PST8PDT is part of the tzdata-legacy
+package, which is not always installed and might disappear in future.
+Successfully tested with and without tzdata-legacy on Debian unstable.
+
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1] 
+Signed-off-by: Simon McVittie <smcv@debian.org>
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ glib/tests/gdatetime.c | 38 ++++++++++++++++++++++++++++++--------
+ 1 file changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index d46f653ac..01498cb54 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -2930,6 +2930,8 @@ test_posix_parse (void)
+ {
+   GTimeZone *tz;
+   GDateTime *gdt1, *gdt2;
++  gint i1, i2;
++  const char *expect_id;
+ 
+   /* Check that an unknown zone name falls back to UTC. */
+   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
+@@ -2952,17 +2954,37 @@ test_posix_parse (void)
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
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), ==, "PST");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 0), ==, - 8 * 3600);
+-  g_assert (!g_time_zone_is_dst (tz, 0));
+-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), ==, "PDT");
+-  g_assert_cmpint (g_time_zone_get_offset (tz, 1), ==,- 7 * 3600);
+-  g_assert (g_time_zone_is_dst (tz, 1));
++  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, expect_id);
++  /* a date in winter = non-DST */
++  gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
++  /* a date in summer = DST */
++  gdt2 = g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_time_to_unix (gdt2));
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0855e6eb00..6dcb0eb866 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -225,6 +225,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch \
            file://skip-timeout.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
-- 
2.34.1


