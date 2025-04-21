Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10464C369D5
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:06:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11557.1745226392551363357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620622d584=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8krtS016382
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8smda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9Piy/tqqAegcyvdlT/Xm39yC5IK7qdEiEyU+32u7II9zdJkq5MDxXRdHpNU9v/mfAnjgES+knLdUxJrF3LzPXqk2aTJScFConKGD+hQZSvX7PzqBgvhnw81Xg/yxsga+ZkCGiNtEx839AGgF/J1mC4jEibw2cy5UV7YYLwEa1F8YyG6vqyzsfTN3c0krVe9lW2AwpMJ7ONoo0uy/Oxp9Fd0oGGiG6EMBIS+h+RjcIo5OvMd4DOl5IIHLMFeTWDVeOLR9UF8Fn+sVK6Qjkhx0YRQvuMDach5v5vj+k8IGhSR5+MbrN1pq9yQ0qKNF0cI9+nyP1YKTPwRLGD0YBIdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PziLRa4Kykc8gunMYsue9IhxY/Ub1J8s8zmLKx+RJD0=;
 b=YR6d8RcBLqCVvM3LEM2iUUaHudx2LdL1dWnHQ2ywBOMmiCibcRn9wcDF9oZ7ClhNVn6725HwNLrbXTKyexjvwQLRAU5ktqI4EB0Zo1W5WTPSr5B1oiwxYBpiBG4WYhB0jVOIA9jl9p5WJR1y3sWnJg4MBwmFsyOBb1DHuwMAWbMErqEJ0/2FAr+uGoMw3IoipnifjqiotxSxu0oXOepIdr1E4DiOki/nT11JkvyRhj1a2/p99gVYxxLLfSjomi3bHe4yDqDn/VgwFA6EIk8YM+3gbUS2ao9Be4VyU2bryZCfabF2LyABz4GVqolIlGMyszISRIlk4LHY/s4E946sYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7881.namprd11.prod.outlook.com (2603:10b6:208:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:06:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:06:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sassc: fix runtime version
Date: Mon, 21 Apr 2025 17:06:11 +0800
Message-Id: <20250421090611.3862686-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421090611.3862686-1-yi.zhao@windriver.com>
References: <20250421090611.3862686-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f175dec-6405-4e13-fc21-08dd80b3cbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tlUj14HVmbG865F/WW97VeYdV/W91JWMpCMeYPzQBtODapjbTMSpk0GcuYsD?=
 =?us-ascii?Q?/5Iq81jkD94Wvh9XYZZFWscky87I4q9qz0yOQs075Lg6S+4alAgG6I+1wJiZ?=
 =?us-ascii?Q?mwwi24Wf3X/bSYFaZo7H6YW+P7yY/4k7LtgfFy3NyvUeWGNouf70kVWxgnvX?=
 =?us-ascii?Q?gSx9Pa6Jg5COZ+auiEAAZLRW1qB0MRe5OY3Lj4tQI4QGnQQ4DB8oM7VQkUMl?=
 =?us-ascii?Q?5PPDwGd4RKn9Ai1Wy1vQEDp4j2WG5vfIPwN7UbwMr4126BWoanQyHmGkF643?=
 =?us-ascii?Q?2fqbMbqfrtoMgU7XLgRbL3/KYBhskUEP92gGHqpiGJ4V5X5aeCHwRLioQzsE?=
 =?us-ascii?Q?lRgxqLvhN5pDAnTalqtJ0kXwXEH9Qoq5EhF2SyUPsA8zl39REsSXLiFpQhJ8?=
 =?us-ascii?Q?NZimoP7Ql2IW84jWHXNzu80fX4xnepDJI6fv5JaEg/gddhxHoQKhWyf4vlLB?=
 =?us-ascii?Q?lJcjbYAakg24Gx+MeG63Wnu+19QVRRPkrkWeAuScuC4yRh4/MkO05sFWUe5n?=
 =?us-ascii?Q?5EE17+BwWLqqQhXqOXmby3//C0p+b5etmMxV8K25tI+JUeOH5heHXI5cJn5T?=
 =?us-ascii?Q?wpbGB+PN81PnCA9LUH+xLsnVoGCyWC1Oe1Mr/BDAxAaWVOw7MUntdi9DAerI?=
 =?us-ascii?Q?/XyzSsgFItSffM7wtIYFWurg0bOmJxEn9PDk676VuMJlnO1DCtuXaJyiz6tu?=
 =?us-ascii?Q?+1X1sbfpMZsaVy+wTjquibMfvbJCEidstDxL+ctvOSvOnIEw56xh4+lsDDOK?=
 =?us-ascii?Q?4ILWjmh9ev5o53y1kdVh0mxtTf+ybDigSnSDPLU4DajPQU3XGIVGunBGjddC?=
 =?us-ascii?Q?bQ9jnHsqkydG7G1RDJ3SCuM3xA+ytxVLm+GqjwAFKeGuCxhY7ZCzO1uYQER6?=
 =?us-ascii?Q?Lvv7+E4OEjPR5THQmEDVaY7AHskT3jXdHTutd3DKKp31bgX2UJGWeFfa8E7I?=
 =?us-ascii?Q?cR4uuIh2AvuH/xuvp6NDNJF9GHeaJqjYAQQUghbVLYbr8qoqRPSrhkpescJN?=
 =?us-ascii?Q?C2Zl6v+pgo1K93QANDBZh6nupbQwpqLOI5FJeQZ6ksPlC5vqiXOtWrUdZQm9?=
 =?us-ascii?Q?uMMxseq848CTDlYY4e1ka77UNaLkTq9SkreDSfVI5waylhBBmlVBadmQdXPC?=
 =?us-ascii?Q?V4w970kEzbN5XegCxe8iK+w1giTekF1fh5HpAQB0aUR8on3rYE7ncKD5mT/e?=
 =?us-ascii?Q?WMrpRpio/Z5ycN48wfagXx4PWu+3/KRck5s7PxT+TUTCAj193W55cIDt2jTv?=
 =?us-ascii?Q?HWUJ9ydIQ2gjr/1Yuxm7cQXBtjXIzlJyyOZz92tRB8ChapzD++K7ot/3+zC1?=
 =?us-ascii?Q?LgOEX/RcLIOQh9szEXCtZhF7uRQLneLBfYFWc1jY9VSqaXYBgmVDpkGyozdh?=
 =?us-ascii?Q?3XJ+MNdjWwTv8QEGnYyVQPBYgm/9hLVlzOQp7KgLZ3dhpeXMVZZskuHOVE6y?=
 =?us-ascii?Q?P0ZQJZcwyce7Gz6GdLCYLD5TgJydDGpJaiO1zZUlbbZgW6f+oq5Owg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XPMVhClG9CxZKGCKLKx7RbnQLUTVgjk065mJsqx3ilLutpwqVh9rtNBPVA6w?=
 =?us-ascii?Q?oMeHAIZlucWYDLv0XrVQpo+yucjnHBaLwfjl9YNpR91kkqOp9p2Eszz4OUIU?=
 =?us-ascii?Q?61W45toJIcZfw3ifnLtsb6o9mQMLX9pR9fXg5fpFlFbhOOMykWBHaNuXEAGx?=
 =?us-ascii?Q?1rJUebntZ0CBajvMihqym/DWtSwTEs9B0btZIJ8j87aef96ETP/YCrPweH4F?=
 =?us-ascii?Q?MtbZQK1ngrfJnUBYRlSF9IFlBgX1XokY4Zp3doZQ+FdS+5qflo35XOGNhnLS?=
 =?us-ascii?Q?vhpFSs98rIOBOkKUDnwzK/NxRNgh5Ijj+/jo/YouHDapkDMui/rQsJv121d4?=
 =?us-ascii?Q?fEBw+2qZpZkz7UGXlg39ds/C5c3Ll0I8CrzNKinMpgnGg9nT4SCHZ4oDiSCy?=
 =?us-ascii?Q?Efjz8tm8SxdML3RIeDvrFakjnSBN6qOS06OSrB7RDN2IkiAxtLkkd9AktLTm?=
 =?us-ascii?Q?nYypBX2pUn270peDFwyV4wO7smWVT/IJotgWUZgPOwenmlr48e982vaXi7XS?=
 =?us-ascii?Q?iKcAlETveayKygTL9s+rg1IhYVx3aZvBhuRGbWdcP/ac8jGm4iBXSCx6PmKa?=
 =?us-ascii?Q?hSyVKyi2cc1RS+9tRKZsFfo8KcPa4OAURlVxeP1VvZgFigzANUgjNjdLJTvZ?=
 =?us-ascii?Q?cge+d7U717NrF8L8dlzFybz9XtV66S/yfM6JEE2NEDLuQibxi4KiX4vxwNrC?=
 =?us-ascii?Q?/cDSuvHOrolUaVrtSFT2W2D6etuatBxO1HuUP+zlbdntoSQ2tJBt36Bmq0wN?=
 =?us-ascii?Q?qHII+B6gjzynoo5518deZKNn//ofl9TYwEU7+Q0hpPbqUG8gjB8E1O6XsDV0?=
 =?us-ascii?Q?BBTCUpBJSF1IpKmkAjHndYvBM0KY4uZB7Yekfmo6bekxIASO5W0SJKW1FkAP?=
 =?us-ascii?Q?4AgSEa7j375XwyVpqSTjnA6BX8FHgqwSCgRAQJim2C8ByCIF/8yl/JxDttOp?=
 =?us-ascii?Q?oNbVYHIX8BeE0TGgfLr8nQqjgQnjCk2W5OpSGaEDgANk4CkqscWp4vHscWEc?=
 =?us-ascii?Q?OHYuVMSw1NwRNDqUrKpEhpn177dulrZ/ZaAtmRJyxHIz9YcYds+dBG/20m9X?=
 =?us-ascii?Q?z/kKqHt6f94Ed6O55D4+Ry0kN0TChXjHY7WrHkCwOS+ApqQxRc1+lak55Wte?=
 =?us-ascii?Q?m5C2xvRLHKN6keqlM0rinUObV0m4SjkcNBY4CeJdz81F3Aq5vTlDkF91A3ug?=
 =?us-ascii?Q?HF9ikBHqrTwRufswdcq3ped2h6VJeVk4rF3N5L3oxzoz2V927lwr6IJvEh0B?=
 =?us-ascii?Q?lt0y200cVKsx04Htf4SssqayNCHPP1ybW7m20TXY/XsKtzUjGOxHzVFk9ukR?=
 =?us-ascii?Q?/VTe05HfZhEtIJLdJyfBu+YpioYiIqd0rOR9ETKMeBxzpgy6a+tAXlUx/uAY?=
 =?us-ascii?Q?nmRnz7ru16KdvZU02fefQwzfEsyUDKZcBxrw/wPNs7N4bo7uzPePhMzGQLrv?=
 =?us-ascii?Q?6BX7Z/XtLc0oL2uoPFZQzUjOm9gFSqDDV3wLd2nBCmhY0Cej7VwkpkmQlskv?=
 =?us-ascii?Q?8IBlZoGKxTGxCEz8N6s/A6GcZ4co/AxEALlgyphTuU1kl6BSdXtFihg01UQr?=
 =?us-ascii?Q?/3VYhtkxQWdQ8OeEIMRzrO50JpMjh1tp1ljyEw03?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f175dec-6405-4e13-fc21-08dd80b3cbdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:06:26.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j02UpnFdEQte51SxHXNtug3Mv70mQIxin0TPCZ1JtZ+MaY3A+ZEgWUfnbRhuPfkSbJoQmvLujYBJF9l2nh4yMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7881
X-Proofpoint-ORIG-GUID: LYypGIQZcZceVucbGEB3BFMLJykzuAu9
X-Proofpoint-GUID: LYypGIQZcZceVucbGEB3BFMLJykzuAu9
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=68060a97 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=18LkB5mfDQdxrZmvM14A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=787
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 09:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215171

Fix sassc runtime version shown in 'sassc --version'.

Before the fix:
$ sassc --version
sassc: [NA]
libsass: [NA]
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc  --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/sass/sassc_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-support/sass/sassc_git.bb
index b7f57ca244..dfc5ee5857 100644
--- a/meta/recipes-support/sass/sassc_git.bb
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -12,6 +12,10 @@ SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
 
+do_configure:append() {
+    sed -i -e 's/\[NA\]/${PV}/g' ${S}/sassc_version.h
+}
+
 CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


