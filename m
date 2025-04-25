Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A3C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:38:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1876.1745566701023321468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210502670=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7TFpI030448
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:38:20 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3ed6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzI6Qij0i1h8TSYHcqeiu+iw9a2KLeEo1mm5UdMlkf8FfmfAbgcWpxbVA3znzy6W6cgl4ScgSsqmVzDdohDnfI+E0oc3QtJMGAqL0EKInfO+pIDs2K+BUiySybTtPKHphD9618zIjOSeKJzNfnIDY6HvC/ACoZ/fykXeVHXBPtuNqmAoXDx52LcIbppinWwRPp4g1QDS10pq1o/3upObdfevu/3xDYa0m2w5nMaRYsb9GB3lYLq+Lsr71KNqzgHay76eDlWZzgtZXl+12K3pQMC/LYrtHj+y7dKkOfFLSONLGTBJJvqAPNIsn2/1Fa/LmjtaZn7QOjs+sAB5IqOH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQtAXPrw6T5Z/IOmRNNw8F9VajFvICyRXhzIhpDnA9w=;
 b=DkY/FTigGIwiBBwLgH7rfd+mmw+uMnS/wCF9AKJYDbYFfG+fM3gRGhfLOhUgkWVb+vjPjQg1UWnB//BT1ljg8nc7r0YQZH44ptlxRJGBlXHKsZ6AGbekvexH3k2jB3mBidItNJgsGFOZ2Noa72+BQxMqxGwoJxbR2iEpCy8GSM8JfJIHDvHyjQkPwDM4I7usVrFPC00hJU3V8ClVDLpcvFq1CsePP9HP3MjsJmUN5+INVr7TaKVmxu706J6X5i1H3FENLml6Px0gVne14tvE397O4bL0DXMKpg7Xx2urlE1i7pZ5st7EOV3mxFWIwavU8wv8VHURQQTSZTr5aQ7EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Fri, 25 Apr 2025 07:38:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 07:38:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v3] libsass: fix runtime version
Date: Fri, 25 Apr 2025 15:37:56 +0800
Message-Id: <20250425073757.498411-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0014.jpnprd01.prod.outlook.com (2603:1096:405::26)
 To IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1203e2-75ed-4dc8-6652-08dd83cc2346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7DjjXYr8EtD7KDCPAEGvxbe3ZxOJ0pSQifpqVpSkvQNiVeSVjnRJQesOgFVF?=
 =?us-ascii?Q?OXqYCLbY85krUd0pA47hUIJn3YPK40N05w4df2nAnvsufRCGoI9vVTgb0dkP?=
 =?us-ascii?Q?ZHoLy5KY2urAsgsYTM+rChUnJfWRZV2ts9jQXrne71nHt7CHukOcTdooI+H0?=
 =?us-ascii?Q?/uIyqnO+qsTmTyKe4/ainyPgGAJEddOMY5S2pOQwx5nypGZfI8YgzDxmayZs?=
 =?us-ascii?Q?ESXIXzP0XvYbNSwWzCuYaAYGYjN4U/P23ysprJf2k4bslHLcvAGiIbtiJlPu?=
 =?us-ascii?Q?s9g9UjlFk4rUQ7LFwZRUaJ6j7dVVKabcIH/5Sp8IOaoC8CseqyMqtXINyLtl?=
 =?us-ascii?Q?se7+d9MRECy8G4zvwTj5FMWsx6BkUhCsKFFeFQDt8A3lvBFdFpmrt5Ywhogi?=
 =?us-ascii?Q?MdTKlLpshRmY91/Ux1n9HHeVdwg9iUSCuqxiWSQtKHSvIXhIT5IeHDczP3yt?=
 =?us-ascii?Q?Zf8HJV0vl+ItR/cpuWIb6qhB0skOdG3an1Lu5aVZU7fItgcih5uH3HcSSZdV?=
 =?us-ascii?Q?vSlbP2sjh5ugKnAYY12LdkPry7Uts1CZEWD3uObe8yQu7scAmnLo5TisIn+r?=
 =?us-ascii?Q?VsXIxfND0NegbtDPWWTugJYIJEHPlUn4Kv0eOA+buUKSlGUIy8aeQkrvgk/O?=
 =?us-ascii?Q?4xQZQ2+nMiXJki67bXLDTOSzNQ4VCKi9kZ0g5Oi0I4+cGYN7Bia+vVFtC/nd?=
 =?us-ascii?Q?8jerTF9sWehQXBkxtuH23tMMnmGVexDt/H49kZYGBNUexwor+rOaI9hB8VWs?=
 =?us-ascii?Q?bscidNVNoIdA88qXJd7NO646nAAdZa8WsshZG+l+oohF1afBzsaBqJXkxbrJ?=
 =?us-ascii?Q?qzpp1KiPNbnt9aMYXC2Jl+7auUeSz4BBxImmwUaKK//ZXd9tUPufb6D7AXA6?=
 =?us-ascii?Q?LRro4vLdm5W5/thyJH6Blf09IPlfJ4mBGkADLrNWmdBQOkdDtawzA/JGc+22?=
 =?us-ascii?Q?JF09q/AFFFGSVjmj0me0Ie8ITtJGM9iECHaqS5hTkb+VDIM4H8brVd0lsScc?=
 =?us-ascii?Q?JPbEZ9TE9O2cAB7o/vT9JUJb0iT6jACV3t8O6pbuG/IiAZH0njpG6c8qTltA?=
 =?us-ascii?Q?skUhO9K1zD5+fXR5tMIcasPCqjR4fd44Od8KD2rXrNsPLJgRIsC5w7uCWIl8?=
 =?us-ascii?Q?n2HiA+HWfvWvHYycy2+Ie9l1+sur1rdPS4wMMoZTj5IIwIiy2BAt/bRCeuWe?=
 =?us-ascii?Q?hgyE8hhVGAtUUo6pVYGFFpScJ43gL2kdd8gf0ZZSGvvtZMqC9EhJiaigVmRx?=
 =?us-ascii?Q?JH4YIEatowh+C1N97bpoArPQVNqaQ89G99zYcjAZ7fkiVgar5vYc+27n0kk8?=
 =?us-ascii?Q?QFBRewQcOmB3y1nCk/AytP2v3Xm10HCpJ4AknpTP2Wtrp20kPTyJV2ewP7bn?=
 =?us-ascii?Q?4m9Z6WkQxzK7uzFaUjI4izXpeL3ZZGHA1m4ivSwvTh/h4jXU1UjWn6Op5mFY?=
 =?us-ascii?Q?s7xxO3N1akCWcuZrWbSZ0lUXE2Ev0HWyXmr2W6dsSC9KIKXLauTh9/C/4suP?=
 =?us-ascii?Q?kPZ3IzvFx35h7V4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ffydtAs5zEjZ04hhgQ2ZsTCid5velr6aNiky1gfTixXLEN5VJfdWKqLdri5q?=
 =?us-ascii?Q?LvhqhtqtHcMdb1jioK1BanCwVmDadcf7d7s2ITCa8TV5Vv9WWbVRgg08w/km?=
 =?us-ascii?Q?gIMPhfL6mhcyOeFpGsx9HdfYPZeSnZjdlG6kLP1zpGwrl0EApbGe89lG55I2?=
 =?us-ascii?Q?B8hgqtt/JcvRvbC9NBThaGFGji6NM8R98pY2JhMorzT0kFnErkzLfAbQpdgV?=
 =?us-ascii?Q?oprfN5X4bGrQUCUAYELWTr2CaM1mgl8/kEfxTA5oFvCHlLkc2ffQKpbGADGL?=
 =?us-ascii?Q?ioQds3xirudVc9j3aZaiGwIDSMS237lNn51f836lZYZ2TFxJBL26yOmpmTdz?=
 =?us-ascii?Q?JaxL7i0ZGfmOg+fe4mO7DaLxCx2F9gI+DpisZUbvh/AcKK2vHGtMOZoDA72z?=
 =?us-ascii?Q?7o7EKz6KekizVbX4ff8BKi3qpi7/Ii39p1ygN14D13xRj/pfjOkWh+Sev7Od?=
 =?us-ascii?Q?TjPiPqxGhD4cLB8f7v6eZLLaoDp4Gl5PXfx4g4t72fusIr/GkCfVuf6SH95e?=
 =?us-ascii?Q?GJ3EX6s0JjRzm4/HFuUcffx9jCMZU+2WKF1aFhgE9strgDcY/meQOoZanLKn?=
 =?us-ascii?Q?HuenfikcLGwp3TeaUneHsfqPD8N9/Hzqqj9E2HAjn5Hi98A5OIKrFU86+77D?=
 =?us-ascii?Q?87q0RNyRExB+CCs8aG0Ixx3+udbHt0BkDDZLu7ih1T1WVQv03nnPrA8V/N9f?=
 =?us-ascii?Q?v71adeGcCvilwpq77auPiybyYMSDLveZxXw8c4PkcZvKk42B0LLS3WSFyb8Q?=
 =?us-ascii?Q?VhVUV4/xvaB/+0rHXJer7eAiHZDJIqBfL1SmM48KlLs34XTBsc9nXRuSrGni?=
 =?us-ascii?Q?g0Cf/0yQ63ERNPzJbzD+4kKmSlC5+uQPrOEkEjmX1gmSQXqIYoNJp7nLjvxE?=
 =?us-ascii?Q?wMGJHx97BYhEIx3fp7f8R50SS2gT0QQXeFZWt4Ndz+5FBsOY8bVFo0O2rp6H?=
 =?us-ascii?Q?Ug0qM5CLR733uE8ZVsriLFw6yJz1VhMfs5c4SLBPLhOBJjHadTFP3vV0ffZ5?=
 =?us-ascii?Q?50/K1NvEDL132/AJW/ncllrv0EWuUBvST6xui6/WfGGwPXEG3n6Q3g6+BLuI?=
 =?us-ascii?Q?Ij1tS1pCJGFs9RsQof2c6oiIWr9joPqdFnNgk0YJ/8j7qlLpIYOIVb5ich0K?=
 =?us-ascii?Q?6hQaW8P8eJgxCe+PB68Dd23pJENHrfxjgJnXGICkHsyf8bQdIHu+ilvg3toA?=
 =?us-ascii?Q?NVgjZ6lykVQYjHynrZkS67WjO/+8XFbbysH5oKSwx/v4a7RIAhbZhyVnYK9U?=
 =?us-ascii?Q?H5AF9AlwL2lG2QLkFNuN2NA0aEIOK+F6CqTPq3l23xXZvA13SlVDixHgKhsl?=
 =?us-ascii?Q?iAkVpmHtDNOuPl8zn1CHSRDQXbhBnW3UBEcn8sNPoklNahgHAYxcAylNwKYq?=
 =?us-ascii?Q?/W40ORPSzFq97dBSvtA0ahpIs4m1eRlF+YFggoVusAKTXNoA0PRoOptmEeyC?=
 =?us-ascii?Q?r11bji4cuWOEY2JvMs10YWruVpZuwZln9/vx0zWmrGB8loOyAilFxK1cxHGl?=
 =?us-ascii?Q?ML/cyutmSL5raeUJFLltS1z+xsPndVtziWBARkqwA+5PtODpRILEJOYI6eM6?=
 =?us-ascii?Q?XBq6hfU4V4Ss37u42mWC0EGPgxVqwC4pwGpUv32b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1203e2-75ed-4dc8-6652-08dd83cc2346
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 07:38:15.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ds/wiN7EXK7iGn0MwDqnY2qxRQdDaB3puFtC71/z29Ox/Eg5VoQywwcNy5soIZQZIWbgxSka53X6qPMd7vSDag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680b3bec cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Kz1AF1DvYn9FUnnKlGIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x0QT_CC9tfSioBz7PCGf6lQ7yLrNju9_
X-Proofpoint-GUID: x0QT_CC9tfSioBz7PCGf6lQ7yLrNju9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1NSBTYWx0ZWRfX9VP3GXirlYAs 5xz3AkiaLqvaEsozg6NmfL2OtlLa07BT+5RChClDV0TMmM53CWNuM52uu0RAtxqIQOFmZW0d+CX gPznU7QRiz15dCYwZvd1tEUKCnwc/lolVpybpu5B9rQOPlJy5RlrTbI6DpfOXxT8ZiOKInf+PrS
 FgHTGTQsSmxX3bV4KMISemAuCQrfZu2GZ8SB8+X3mDFLnmlNiETQxdG/lYDs8ap+FbWbW2kJOcZ bR4bP/Gh4be0kDKxg04kJL+8VyktFifsbq0EiZnHbngsR5OD8Q6WXd2mRqztbraevTZUiEUDSH3 JT7iW5G+x5qNzQH5AuZ5ZeqaV2aSnygp/98R+J9a76p+1vBZULnbH0wijz6ZPemiFzORswwmpg8
 4WQfcmTkCE3pYxuPuy4n10URt89VE7aJ2OAP5ZGYXHpENQmvdqtNGVcwaL+ePPUG/U86OUbx
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215436

The version.h should be generated from version.h.in. But there is
already a version.h file in source directory. When ${S} != ${B}, the
version.h is generated in build directory, and the original version.h in
source directory is not overwritten. However, the latter is used during
the build, resulting in a missing runtime version. Remove version.h from
source directory to ensure that the one in build directory is used
during the build.

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
 ...move-version.h-from-source-directory.patch | 87 +++++++++++++++++++
 meta/recipes-support/sass/libsass_git.bb      |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch

diff --git a/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch b/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch
new file mode 100644
index 0000000000..d1356dc83a
--- /dev/null
+++ b/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch
@@ -0,0 +1,87 @@
+From e5af3bbc9ea6e56e3d4e5cabcb5ac57b521fa6c0 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 24 Apr 2025 22:47:52 +0800
+Subject: [PATCH] Remove version.h from source directory
+
+The version.h should be generated from version.h.in. If the build
+directory is out of the source directory, the version.h is generated in
+build directory and the original version.h in source directory is not
+overwritten. However, the latter is used during the build, resulting in
+a missing runtime version:
+
+$ sassc --version
+sassc: [NA]
+libsass: [NA]
+sass2scss: 1.1.1
+sass: 3.5
+
+Remove version.h from source directory to ensure that the version.h in
+build directory is used during the build.
+
+Also remove '--dirty' option from 'git describe' command line in
+version.sh to get rid of '-dirty' suffix from version number that
+was introduced with this change.
+
+Upstream-Status: Submitted [https://github.com/sass/libsass/pull/3196]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ include/sass/version.h | 12 ------------
+ src/GNUmakefile.am     |  4 ++--
+ version.sh             |  2 +-
+ 3 files changed, 3 insertions(+), 15 deletions(-)
+ delete mode 100644 include/sass/version.h
+
+diff --git a/include/sass/version.h b/include/sass/version.h
+deleted file mode 100644
+index 56ea016a..00000000
+--- a/include/sass/version.h
++++ /dev/null
+@@ -1,12 +0,0 @@
+-#ifndef SASS_VERSION_H
+-#define SASS_VERSION_H
+-
+-#ifndef LIBSASS_VERSION
+-#define LIBSASS_VERSION "[NA]"
+-#endif
+-
+-#ifndef LIBSASS_LANGUAGE_VERSION
+-#define LIBSASS_LANGUAGE_VERSION "3.5"
+-#endif
+-
+-#endif
+diff --git a/src/GNUmakefile.am b/src/GNUmakefile.am
+index 9b0e6a99..e955f0b4 100644
+--- a/src/GNUmakefile.am
++++ b/src/GNUmakefile.am
+@@ -8,7 +8,7 @@ if ENABLE_COVERAGE
+ 	AM_COVLDFLAGS += -lgcov
+ endif
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/include
++AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/include
+ AM_CFLAGS   = $(AM_COPT)
+ AM_CXXFLAGS = $(AM_COPT)
+ AM_LDFLAGS  = $(AM_COPT) $(AM_COVLDFLAGS)
+@@ -45,6 +45,6 @@ sass_includedir = $(includedir)/sass
+ 
+ sass_include_HEADERS = $(top_srcdir)/include/sass/base.h \
+                        $(top_srcdir)/include/sass/values.h \
+-                       $(top_srcdir)/include/sass/version.h \
++                       $(top_builddir)/include/sass/version.h \
+                        $(top_srcdir)/include/sass/context.h \
+                        $(top_srcdir)/include/sass/functions.h
+diff --git a/version.sh b/version.sh
+index 281de74d..7bc57230 100755
+--- a/version.sh
++++ b/version.sh
+@@ -1,5 +1,5 @@
+ if test "x$LIBSASS_VERSION" = "x"; then
+-  LIBSASS_VERSION=`git describe --abbrev=4 --dirty --always --tags 2>/dev/null`
++  LIBSASS_VERSION=`git describe --abbrev=4 --always --tags 2>/dev/null`
+ fi
+ if test "x$LIBSASS_VERSION" = "x"; then
+   LIBSASS_VERSION=`cat VERSION 2>/dev/null`
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-support/sass/libsass_git.bb
index f0824944b9..890cbf8e63 100644
--- a/meta/recipes-support/sass/libsass_git.bb
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 
 inherit autotools
 
-SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https \
+           file://0001-Remove-version.h-from-source-directory.patch"
+
 SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
 PV = "3.6.6"
 
-- 
2.34.1


