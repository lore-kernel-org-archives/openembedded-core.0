Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED75CA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 06:14:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14918.1757052887439793591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 23:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kYbakwrz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134374454b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5854TLcI210278
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 06:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BsW/61z4xuKpNl+VY9aD
	ZkgizEE6A2f9vmlOb2ugE8o=; b=kYbakwrzgNbfclWrzGkb8OYL2WB3wP4FZbxY
	OuJ92w2cX4HqJQv1lNwGQzXCWhY+YevxSwGBXFEuFL7t/R+NHMSDasthdPiwJImK
	Q9r5/AwiwI+XoyiljLPR7ZKGA/awKCvmvrGZVnLFSlXpGq3BHh+CYxHEkl7+Wit1
	vrm6ZWwVgKHafu+H9tKilvlmyOyFgqxZwJPlTihENOTfDHfJ1pYcV7Zn2UwN9YDb
	sUGPKJKpmiIwh4zgWPMZ6y/jwD41tkvXwDDyu3GWMUnYDGFsO961H2rOs6DSHltW
	pRnZPgJu3C79if+SignxahDDnr8fR9/Ylsblt6Oo7tGMJmuxkQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7hddm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:14:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i31d52LDAZV86soCKgqr0dtdqwsOcqYc90mNCByoR/afeCCnkYZBiqeTm2h7Wmjq+/20NLdWljVvLl34X2mka4wbRIMurTlU6dmPJHSFTZddr47k0cCtlX2M6DXO/f0m5030PSgj70HswjGG/z0Ut5clxgXURY8FWvBMAID9q1Vmxzn+oAm1zKSI4NbiAPP5IMOByrOX2yYFoaEi/Qfq5DIUe2YysKK8FhPU/vNjqN2STz0VD2LJXUpAWusYphRaHwMCn+oB4STxqXmi8dO4e2vrZrimeCos7Lmcy0GAGDF/XcJddXIwZNFLcJY+UxBnxziGnej5nyVR3p6SBK4bKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsW/61z4xuKpNl+VY9aDZkgizEE6A2f9vmlOb2ugE8o=;
 b=V2+WflOe0mQ/eLb/6JPuCd6ZJZ6n2jrb4mu78zRACzUY5sBbu/kxiH4bjql2uaZKx69TZPT726ptQonxB1fiq0rSpqCQr+74+GMbNek0T0VlGfFgRf7udJ8waqZVzTA2OLUv/Pu+dEv9bicEZraVLVN/DPiNQ5nD5zr6wMFHvGBkeSa0HsrJZ95TdPS1+wYRdOw8I64Y5TRNn8qTUku/T8WREd6/F0XkJVKiW8KRCjM5xcXZsQ0/Uz3McneBZUZkvRJZEBUBpFKpbqLwkOmbL3bXmxkNMtT70Z2kuToN5ZeJAZAOgkAXEjFY+i5IHNBZEDGezXpRLeGPt2rpzhBYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:14:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:14:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl8: upgrade 8.6.16 -> 8.6.17
Date: Fri,  5 Sep 2025 14:14:21 +0800
Message-Id: <20250905061422.495303-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 33036640-efc2-46fc-0803-08ddec4380f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DbSr40hzafjB30kGrdVPY55aiHJ2XvzPLm61fkb5jEE/0qUBkzwiyrgCXtxJ?=
 =?us-ascii?Q?YlRFHFiM9rpsYDZKGjJm65yCLNedNTTTdscPGE1FAf3y2ZSfIUXY9rjYnDkd?=
 =?us-ascii?Q?2Cl1janobjf+hg6kMKnSjqE2W2RqoSYK/QiKiHclJSIAdl/MR7IUff9tILj/?=
 =?us-ascii?Q?r1ksjC84xNP7qzGQ+0YxU0OW003D/KzZlxH0/5xjpxMOMOXuEdKWEXIzuqvK?=
 =?us-ascii?Q?MbQTHb4k+NsixrTwU6ycMrvnMlNmwCZ9ydw9LKm9tz+/d85jklusK/2O4K/9?=
 =?us-ascii?Q?GTXyQ10eqtwRB+RoXOmM2VRu5vzbMSFJ7hJohOjrTphyhWpnKJe44nIZxVNA?=
 =?us-ascii?Q?Ou86AGuaDEudywm+U2p3fUMjsuiQw1xUDH97p7Mux5TI+UKkVD3jEXZWH+0e?=
 =?us-ascii?Q?jCnOD/Xv8kGAe59ENm/zvxNXzz6KTrlh7dGud+FxdviKCEg0qUcSXA8npbHm?=
 =?us-ascii?Q?mN0GbAzRY0uczrZNYbhHURoDkyH3I6yiLFHcr1ka1IMVTcN7Od/+mWvbeQY4?=
 =?us-ascii?Q?y55T1YnjwcXYE3xWPl07p/b/cO7eRIfH/K2psKtmUkR+YceQphy5PFzqYTBa?=
 =?us-ascii?Q?xvF0Rvf1em0JjntAfhDMDHJHaXPhyW3DOQDCAPGR9+5QC569FBg81su3Z44O?=
 =?us-ascii?Q?ptOANCWSzpL6RGykdUov/itW0n5BXggWCFJe2SFKHWyGobIQS19kU/aEfV4s?=
 =?us-ascii?Q?RWOA1RLT5Xmw72JBDv6msFLzIRwLDOcKRl39WbdRP/I0AuoOX9ie51glFlxu?=
 =?us-ascii?Q?gb7lEix2fb8lRqhVyVDTpyC50gKuv+JebdPfYvm0kJm9h2jA39XRzmP4DhYu?=
 =?us-ascii?Q?pFT0qIPIFBiOnUjeuhEZHKrXcKzp6WtUyJCI9d5m6IKiruYYJKLdPfL6mn1y?=
 =?us-ascii?Q?pwf141e+uevOF5HNstbl5I7udQowJTELQd/tMOMPDSakJfBqFMC7PFr/9F2b?=
 =?us-ascii?Q?vSrGJvffPuLviWS656RnKX9QrPvtghQUJN7VTCUCzD1Qn7Q5aCMajflsMefp?=
 =?us-ascii?Q?0jHtaw2APHS4P8p46g4J16Rp2/nGkqgYKLuJA7LBxjwp+LuECO/i8Ka4aeey?=
 =?us-ascii?Q?VOELl3KAIChoGjdHFw+/paY0HduAKBqZ1fJmCTpugixbjXGD2sWUR1j3tQfV?=
 =?us-ascii?Q?cG2cO3ZyLY5EVktrjis5GZzm+DUo7al7BY9/siUmDgtWGCuwbqYKKvAJORBs?=
 =?us-ascii?Q?LaJMA15sUvEQGyynksWw99RoYbzr8zOfgJuTkdoLfxd02wHnzTMYHq4+zgxT?=
 =?us-ascii?Q?pqVAoe/B385HoFBkY+rAb1XK3mYCaY3DkGrVKnAL2dkE8CaW4Im+tr56pMsW?=
 =?us-ascii?Q?38izWmECdoXkIJH2QptVpyYsNRQhZDyGPwK1IcMowaYx/qbrKnVgbJ54faKF?=
 =?us-ascii?Q?LFwhZPtsNQGuvvxdmbl4zvgbBQgjXvQo8YzIqqmGf8L8JO0yu0FyMvVXsaxV?=
 =?us-ascii?Q?eRH6DzVkj/TMgQV5/6srQAElgx4dnqYbwrJR/BuT+gepeOFtNy5hLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MuOuR4v0A23wy1cCXdE1XwvQ+3NffMOapg9bWSDr1LHfyHQg8WREQQHeNEUU?=
 =?us-ascii?Q?4idmAiiQ82NEhn++1wabEknkpHVraTMb7zIh+4LG+rG65J5ITBAZA8xFG9JV?=
 =?us-ascii?Q?y0Zlk7vRjdzDelEAbb5VfwY2YDpydHlCjUNQMymvIfUNvGtSbGvS5FO+Kr4F?=
 =?us-ascii?Q?vLQ3tvHFqde7TBEF8mQJW0Fnh6YSeR9q04VQtzqQ06GfshZWjP/vwbvEUne+?=
 =?us-ascii?Q?rfCt/O2rgJE11mkf7IJeYH2ze2R5kVKOHk0j9GJZPhQ4ShMhtrJwhFF94o/n?=
 =?us-ascii?Q?cg1oBmy6l117oBc02vqsE5WJzDb4XXo5Jj++b7nwYMPxYCrkd/Id8/+4xNYp?=
 =?us-ascii?Q?GDFjkd10edtj9zo+i6PGlsRwMfM5kKnCRZHgHbkBLEtCu3ACwG6zsBU4V1u5?=
 =?us-ascii?Q?b9IurujWYJqnO4keDJoabsYOgb5CI/WXHMjn2EazxewtvQSgsJeJRYP3WIXD?=
 =?us-ascii?Q?g+Iiqmky7jWNY05W6gvkLc8oPUqafnS9Oj/VHaUCV7jpzHC4IMAtbRu3Om0h?=
 =?us-ascii?Q?OktQ8zzt95IAyIB8P51QbIyQUQL7pwT+XNNkGyjVRiJ/2Qa4apHC0HRdlSs7?=
 =?us-ascii?Q?9WyyfvhasoJqsV7aqKfNF1Pvujv2oAtU7BLFBtPGsN6fXab2enm/sy30EpIl?=
 =?us-ascii?Q?W6HjW59OeWOxCC/sdEn4YwU9MHuEfFipsEvPtgmjNOQEGJTb9SFa3IDjPYvE?=
 =?us-ascii?Q?c4z0vQ5ehMuACTn6aAy9J1c2QRfigz07WlvSEKzrreyH+QewhlbTOhLxbFS0?=
 =?us-ascii?Q?zwBX4jkXmJ3eYJiOOXgCBaha4rZSrAPQyiKeUJCdZ7L5In70q8a1gres9yDx?=
 =?us-ascii?Q?gJBLKdlAXHafNHRov0BhYs69pSc20ZvJbPsjEjNEhPvaKP8UT3DZiAruho7j?=
 =?us-ascii?Q?Xmzi/0tHOIkN7fYTMGxaT7apEOs3A4skE5ygKJSG0TbmxmK6U6AQR/2l6cgK?=
 =?us-ascii?Q?lUfpKMiYRNgnSP06z4uz7Rq+WwEPijbj2zH9X6betnTkepwWtPpnhgj1y/ro?=
 =?us-ascii?Q?13uzQDv1w6eO9Hrqx4EP+d4YZj4lAN0ZRF5hlbYl9lV6a531ie2QRLdkxDkv?=
 =?us-ascii?Q?RvPAvqyiIdTVw9rFj04n2pC1wF1Ja+CQYpbDFGXpn3zKP2fcKqdpijW/do7L?=
 =?us-ascii?Q?JRmWGQ+HPlvHvaeiGnMJ9R+v2C2Q+kciVGgEdKF929gXH1MvGtTNUVjgWveU?=
 =?us-ascii?Q?PIxJFztWH6XWtea9jC6Hi9ej90x7OjQ7JSKVEdZChyA+/+t08pfeyiaLsRaA?=
 =?us-ascii?Q?2GzHVcZcnBVqoJna7yOYmWlKwY0P8kPrxU2G+HNjlXmwuKfAxZWaveS6BvOA?=
 =?us-ascii?Q?Lzphuq3BIiPq1OaQwVPMQw7hIGNoRBdZYDYqizt3l1rUNkLJ0iKZFYJiAuw4?=
 =?us-ascii?Q?n6+TFROtDlSCV6ZzCntdiFMcU9j37byZpXiBLHwWvnQB11x3wz18KHn5Hd2H?=
 =?us-ascii?Q?cTOY3YmuCBgrs5xrxU7Gt7Xr2urPIhq8IdvynLjQnt3m1JHJd4jp6ZiTsz1o?=
 =?us-ascii?Q?bLvm7Oj5/8oCqSzEPK0NuwtOYr+WzUBhS4D1m3MGOPeejXiBemHrFujgbzEy?=
 =?us-ascii?Q?VBYASxrGONNxwbhDZuu9e27XrPyMensvUANPSDil?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33036640-efc2-46fc-0803-08ddec4380f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:14:42.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDrbW/Y+krHdwPtsYbtMe+0dhCGTsFqojATJ3wvrkNxPLPcdFcJXx34SOLJFO7EBtUcFORY3QPLa3w361HRsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA1OCBTYWx0ZWRfX1ItTG/IEDpTD
 FD+bS9EDOtLhrm1sK2yxfHjXQjRDyx+Qhi4A7dX0Xc9bVX38sV3KNOcaqzN84iKv42OxH4eynvW
 WBRWa1kFlWER72XPbzNXmj0UODVg4BH97zs5ukqTZak9zfyUrFFpa6zTr+1TWmem6hk75GuICuU
 EzPt0oIu7XEXXukmpvP7UjQ2cGl5xWzqPecsQu/ypl3WcRYT5jjvcH70BNS9kvexvZdZbXyuEeW
 +VnwKKnaVGpoXpkS+az2ngrfRP5X8ZiYIVOSr4UYWdY7yBns0+Z+ywIcXIH6JY7NXDuxAD7WoKA
 mxiEP+aXxMnOfVKc8JFIeWTKnbTbjbAtLbAuCwwypjMbILXAst/qFqOf3BZ4aM=
X-Proofpoint-GUID: SZl4BNVdmDpRSae-IHat0vO4sA5jkR_3
X-Proofpoint-ORIG-GUID: SZl4BNVdmDpRSae-IHat0vO4sA5jkR_3
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68ba7fd6 cx=c_pps
 a=WhUEUVamR7lPV9LkVsdNog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=HXexGse_R0uDa20uJLIA:9 a=AHliOvWsYTlw_l6e:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222974

ChangeLog:
  2024-12-16 (bug) [63449c] [namespace children] doesn't match non-glob
             patterns below the global namespace
  2025-01-06 (bug) [fc3509] Better error-message than "interpreter uses
             an incompatible stubs mechanism"
  2025-01-19 tzdata updated to Olson's tzdata2025a
  2025-01-28 (bug) [4f0b57] Win: [exec] now works on App Execution
             Aliases.
  2025-01-28 (bug) [4e2c8b] Win: [auto_execok] handles larger set of
             shell commands.
  2025-03-06 (bug) [ba68d1] errorline from [interp eval], interp-26.9
  2025-03-23 tzdata updated to Olson's tzdata2025b
  2025-04-11 (bug) [fd8341] Tcl_InitStubs compatibility for 9.1, better
             error-handling
  2025-05-05 (bug) [42d14c] Fix scan with long mantissa. Ex.: scan
             "1.[string repeat 1 191]e-321" %g
  2025-06-18 (bug) [4f338b] add missing Tcl_CloseEx docs
  2025-06-24 (bug) [ecf35c] Correct nested handling of return option
             -options
  2025-06-25 (bug) [ecafd8] Euro/Tail-sign missing from cp864 encoding
  2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
             leading to broken floating point
  2025-07-16 (bug) [c9f052] prevent overflow crash in Tcl_SplitList().
  2025-07-21 (bug) [61c01e] Flawed ref counts in filesystem
             implementation for Windows led to use-after-free
  2025-08-12 (new) dde => 1.4.5
  2025-08-12 (bug) [992f94] avoid misaligned pointers in macOS file
             attribute functions

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch  | 8 ++++----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch          | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch            | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch    | 4 ++--
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch   | 4 ++--
 .../tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb}             | 2 +-
 7 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 1859992838..6ba7ff4340 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index 3a4622e..6204c57 100644
+index d8fd70a..ffff4b1 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
-@@ -1418,7 +1418,7 @@ typedef enum {
+@@ -1425,7 +1425,7 @@ typedef enum {
   */
  
  typedef struct Tcl_Time {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index 6ceb297cea..ad91b9ffb3 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
+From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index c3b75e3..60ed93e 100644
+index 45e7b76..5a46e6a 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index c3b75e3..60ed93e 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 8e6726b..2345689 100644
+index 50b3e03..8a33d0c 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
@@ -51,7 +51,7 @@ index 8e6726b..2345689 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -896,7 +896,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 61153878fe..07a1f4d040 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
+From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a2f9e21..c3b75e3 100644
+index ab2e7b5..45e7b76 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index aeebb038e3..c6412e7775 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
+From 2d959d1fdfbd7e020f5177b1a7ff6a08809536ca Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 24ffb1b..c6460ad 100644
+index d64fdd4..9931dd1 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 898e8241fc..0f8bd062ac 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
+From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index bc743b3..a2f9e21 100644
+index 3efdfec..ab2e7b5 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index f2a37add7d..12e1937aa1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
+From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index e88ec3c..8e6726b 100644
+index ed07ca5..50b3e03 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index 225f04be48..d4bdd71c05 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
+SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.34.1


