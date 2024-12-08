Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC83E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 14:56:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80066.1733669787816636339
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 06:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207230d9a8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8EuJrv001649
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Dec 2024 06:56:27 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u0hm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 06:56:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCtWSoevrIYfbAw4fOLpSoCddfYbIQ9JEZSom6rCxSu8n1ZdyrUg80+47WtzZjtUobZJTlgEpMMDipir+b/bGCyEilwEyD+SfrZC8X21Tj7TnOETHbcf0wKQnVLdpkb2K3My/TF4rEmQ9xHGlibALeiCivAGNM8Ld/qGbPUz6Q6GKAXV17NbGiMmcabaL20wdVO0fzaPP7DNwTVax0VKju62YPRle7Bdx0ZrnkCPoLk9B2o6rTy6vmLqr2smRm5d9m90N7qZrFmbfshvPaYtS+Vi5Ew/f63+mY2P1vE2b00cFgItsXUZC8H7G3gP/w9HB1PPUNpzoeugyFTZsKc1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnHr1LxjS54a4uhdd9q+WlLEe1Zw0leWkgOiycZeJk8=;
 b=sujqOhTB8/I4ExY9lImTmbJGglGZNY79B2p5mGLD9wzV+U9dDfyh2qmPWjQgJDmItAMOzgCfXIve3MWnT3xrIFtfjWZ8OuWxtxNiPrw8Ec9Gig3cSLKmHg8FTjOd3MF4ajP+ZNs0pt9fgb32xd77GzrZM/UrAneIjGeZUEceb1EwMl9s4NNYK/aLM2Mv+H+fiPfLB2pkkfOd3sOSfBOkRuziRN1sZkv7N5B4MwMq3HI8FRlPBMxiKdTe085bWtGYEI18H4SDS4cNMEs+6jrCSf24h4QRoPa0DPWx/tw9BK0VeS+jxxPgg9IVJVfyH1xjatKMgbySfvX8383+CnYGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Sun, 8 Dec 2024 14:56:23 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8207.017; Sun, 8 Dec 2024
 14:56:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpam: add packageconfig for selinux
Date: Sun,  8 Dec 2024 22:56:02 +0800
Message-Id: <20241208145602.633452-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: ea71fedc-6e41-48c9-24ff-08dd17987b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Eoo38+dNvjgVgrfULmSrtDrobAs0yFovV6ozF7WQ9l6n0ZEKd+tBVtCryvyS?=
 =?us-ascii?Q?njjOU9H6AG18LMgERBcz8p7caLPQfeEORZgwAmDw8LgQBVLhD/myZhL2J8Lx?=
 =?us-ascii?Q?h2AYZZ6352s1MdtZgw2JnaszeCtkjpVavnkYJRJKZt6NCXa7iRTJ7aNf89ul?=
 =?us-ascii?Q?ufstnn7nNpOxr0U8yZJOWmzv1icJCYR5R24KLwLvDpvVqSY2g9IiYJFaCUTn?=
 =?us-ascii?Q?xliste4WoZpqc/aHM+B1izKN0xoDFAjJnK715DkRMgdsor9QNqsL3eNGzVGd?=
 =?us-ascii?Q?cZZ1985KaitpTZU5tAtPRId3hUOEGSCehgIdwfdIWVRuq3zl/NNYSIdlHJYm?=
 =?us-ascii?Q?k5s2VnsShOSMrKHzl2ynucT5ciRu1f5bRbYW0XWwFZsAi3TIy/hqly2GckRT?=
 =?us-ascii?Q?2Co2Sp3MqE+AfaSmssFYjW+Ybpt3d/y5+THSnLSYVGX9PL+u1PhbY5M8uZeN?=
 =?us-ascii?Q?SHqsvLSOMOLBprg8PeBlHVZBSWYCJGpmbMKd0JLZqyIoEx5NhERO+ohnowU5?=
 =?us-ascii?Q?p2s69cRRmKqOyBrzLmjSef0apINQ3X9+RQyZfAM/WbAGtC4Bd6Xvrsi1bRCM?=
 =?us-ascii?Q?CrzWsiJFyQCZAKoYTnQYae4zv/QkQ919lqd5yoeq11r8MP79879/6oeCbZLE?=
 =?us-ascii?Q?FcFu166XEknI2bNghPE61PCtxYmtyXVJuEtnvAVYWqLODDCqwY/BsA/UaCiJ?=
 =?us-ascii?Q?to5MCX7FiA5z5afGWo1dMtS3Z0QxvlksmjsOy0LQsymxXVDAUbWH6PQp8i/d?=
 =?us-ascii?Q?s+x7usXuXnbaw1UqmVY1T0xTRFymbHLa+JrgJElzJZ6Ixth/e7A8XnbE3a4u?=
 =?us-ascii?Q?QgrouujkuwEzL8gl6M81CNvu6+gVOYSq3dZ4wJ27LrWxQaGh5kVyXbth9kVC?=
 =?us-ascii?Q?OjEdS87Lfrlw2gq2hIuAYJkoH3+IHc/RlSkbPOwRzDQ7MDl0pDxEe7dtRiJ9?=
 =?us-ascii?Q?EQDpIYX104HMuQ0CIrbdmtxXeNySYh2JYTUS4LTpIedEX/BIhtP0qk81+kNH?=
 =?us-ascii?Q?hjdCrLV0oIlX0LWLBDXSx3lJm3h9B76IHDT47RZ1bZR+g+YOa3F/XIcndozq?=
 =?us-ascii?Q?7mFCQ/bIXr9rc8k2Z9ppWFj+zqRH2+6LfssRFvvpVIdpXaKu6puKfiXT4l9E?=
 =?us-ascii?Q?WqgeyhXbHdWt81hBbMtim8tiL0aVslHkRfGD0yMcBQasBcMaPo+o4GOt5Lyn?=
 =?us-ascii?Q?ZmL96jkAQTZ8yF3RbJMil+8v/iXmiClU/u0tJ6CYvSQPvRzrYRGLNvuwM/2k?=
 =?us-ascii?Q?4I7HfAvfvh4aqebGMp+Our47XBhBdiFTRDfLqomAXTqMNaNWxriHXXN1ZoUT?=
 =?us-ascii?Q?8L8LuhpXldVPB96DKWvwvHwbRmmnlqSmvV8DsY5AWlOWs0IFJaD6GJbHfOdU?=
 =?us-ascii?Q?q1y1IlZH1y1soFGqzrIkQvgO+tuCufqs54KDOivszMycY/FtVQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wN3fttrD0iwvKwA/2y3kf7cE/Fn4xwupGYLxoBHmOKHeWJEXbpF+x6ZrgZlk?=
 =?us-ascii?Q?kPvahIsTDp0+5wtpWY8s1SSEIMrTITy5kqHi4ZT6ggnHHdB+cyEow7IJrMFL?=
 =?us-ascii?Q?p4Q6hwbUf5nzw5ImaNaLzERBCEenT+LLsX/1quZ29WocPpjojgA9xeImqQuy?=
 =?us-ascii?Q?jZVjQRI9awIaMsSOvVUhkqz5uIAB0GnLL4gLShg76jO2hOpRKNPTFjtcV1MC?=
 =?us-ascii?Q?AxYBsH2+2gDq1xltC6JfyCt9Y+8y6hgQ6H+ILGqRuDldsIxcj9/Y9qTjqHKh?=
 =?us-ascii?Q?wPxSBkVnK3csrB1zE3eCZ9PKaAjD4BRXcxSFdT7zl1rCGSbWhQOkwVRwjiCu?=
 =?us-ascii?Q?8+YSDqXC92LRKG3kd0UpauhtVtC9g/JaD0tt3gFMqB7K2g72Ew3zA7rESVoW?=
 =?us-ascii?Q?m2ZxJ1quX1OvjIes2nE1sxSb4cocMXDLuCkoZx/m325QHXrvhNJ8qJ6NQgSc?=
 =?us-ascii?Q?dGwl6DzG5+xGiWOZZYOtP40eX+DXKq4wsv9LbxJGpcSN1aZVsSZu0li9bEIy?=
 =?us-ascii?Q?uHO7AS7hq6YgWfXDeOJMSqR9LLvPCXRQIZCQFdHxzeaffL7EMZx1HOFpH3HA?=
 =?us-ascii?Q?HUIuGkv/ROlUkH4a9l9ooRad4h8WjfRdTUwZn9FAWCg0FvVSWbvqgjBdsQcr?=
 =?us-ascii?Q?ZiXyEM1gz5sDKpkmdOdFs0yOxwzuhc/CUOC/N3hUjI48KSupGqgG/w6W3dow?=
 =?us-ascii?Q?kXXHVaBhVI1IqqKwrLLYYvKTc8vPCin0I68kiwsLmLusGdvX2nB0w6dCmfh5?=
 =?us-ascii?Q?FuqVfYyovPjwOuwvT67Qwiqj3ErBVSJwh43pnbU8TGhr1TYu4f6RCT5lLG6z?=
 =?us-ascii?Q?3pRGor/zSOMovXI54XGFmY+y8Kv8BIjPNSiRi2Sh7HPkEn80jhdUS0/EIKaF?=
 =?us-ascii?Q?qupQstcdkQ8U96PVLchpCvpAl7oey0oifb6EzMQzzMJZVEcRBR/h7QKjmblx?=
 =?us-ascii?Q?ccsCybdiCK7f0urJ8/euQC+J1/9ziWeXAtjfDzyeXvan7YvAKJWc3zCmRwys?=
 =?us-ascii?Q?BT3BQigHm8Sh+f2Fp46yDeKvUHbdvl5A7Y+FKpGYu49YlB50hM3Pb9CAXEGA?=
 =?us-ascii?Q?koSzxD62jTpr8sZsY/ZysdWlpnqCo/RRayNG5N1xRpgu00J4kqrfCxglfBsb?=
 =?us-ascii?Q?H16ulQIEzkLOJM7mssujWeW1m3fwigsG1PNwySIEKfGG7AEPNne8iV4ErhLR?=
 =?us-ascii?Q?dUSAz0sTarPR5z/kC2B5YvNE/KAW/3m56RU8D7gdoue2G4M/Tu/gLx30J7oc?=
 =?us-ascii?Q?S575qmAdPQ5XM5LOWs4VAHAYuHcHl1GONQhEfhOhp3k+Vsd/7qH0kf5EOiJt?=
 =?us-ascii?Q?93j5K5CqZem8OYIgwyJKnxJ2t/VmUmGaul+Q1T8mbd88haCYwOzAc4FN9Bka?=
 =?us-ascii?Q?m1TzwjtLbVISrfk6LlyD2+rcTgsUjgRTRsrlVC2ZgZRd0dgWcBBcIIP/YBH2?=
 =?us-ascii?Q?DDr4+4GGiP3PpQyYSam0SfcLRUAIPMsacwoN9g+i6l4WB29lw8pynXzSz7Xr?=
 =?us-ascii?Q?b8Nd28aouW7FcSEmag4/X638pkOkVb1vo+qv6g4+/I8LPl68m9Fvj6dkwh6C?=
 =?us-ascii?Q?z8o1IGSz1GPgpd/6WGJLR0idvgt/aBgbwJNMlfe6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea71fedc-6e41-48c9-24ff-08dd17987b8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2024 14:56:23.5043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMJeQM2eDsEXzystH/EcomU6p2oWx41EwotA/mdmjramADct7Xk61IY5pWFpm5G62J87ipf2O01+XGoHFHhp8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=6755b39b cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=vM4DSiC6WeTRikeXuSQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: V0FZShqzc9Yz5dzzrNH2zi-oNOxnzzyo
X-Proofpoint-GUID: V0FZShqzc9Yz5dzzrNH2zi-oNOxnzzyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-08_06,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=666 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412080124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208465

Add PACKAGECONFIG[selinux] to support build with selinux.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index ec1c868d21..53839e8cd3 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -38,6 +38,7 @@ inherit meson gettext pkgconfig systemd ptest github-releases
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
 PACKAGECONFIG[userdb] = "-Dpam_userdb=enabled -Ddb=gdbm,-Dpam_userdb=disabled,gdbm,"
+PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,"
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES:${PN} = " \
@@ -69,6 +70,7 @@ RDEPENDS:${PN}-runtime = "${PN}-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '${MLPREFIX}pam-plugin-selinux-${libpam_suffix}', '', d)} \
     "
 RDEPENDS:${PN}-xtests = "${PN}-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
-- 
2.25.1


