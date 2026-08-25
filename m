Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9599C61CE2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12513.1787621618429583080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ME8povQo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1ArBv4031005
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=csRGpSn15BLRLyg2wG90rkvxxOal3/d2IS4AIcVjFNQ=; b=
	ME8povQosQ+lkzGwmX+NBlM/jHOmhGYhTashd/ksrX333GHKFmfAp98pS40XICbn
	29H6wQ0XceXuYuJTN2r6ZgZ53a9i7LYb619hc/OdqHA17wcD1ddvvhpgJMACjTE1
	HSd2hepOS4A3ufGaQFn2/FPDdf0+bXRlG68/cmrDCpaazooSk4bI99WeqZ8TGOBE
	DVgGJcm4l4KsVEwiOzRWBp8Wfjq0d7dz+xBdU6hmorcT8WTcFOoeTgB309ARxzV6
	G/q7NrvK82rm+XqRFl2PLtUkqakzzlQOgalbjx3ZQ8ZyaM/lEaycYwKXo78VtnDF
	I3JByBP24yXKSzQ6UluHpg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022093.outbound.protection.outlook.com [52.101.43.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6uqvw-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 01:33:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMvPuk4lF/7vCFHIY6G43Fceso+0EVPFlM+b5P6+Qx1pKoS9f5Eono0TirdC1g6h56z2Fc2GfLBn7ErKv1T0AWVTypxxfe1GyW3gQOsGS+OK/BokjQZ25Y6UuzMza7XdNgHwZDgObFUJU4Hh37jpGskN35Ftq4pvvtKjBMZKX8XEOyooc6hAEjQH4cJackQHzExrJ7OisAg54AkXWoEq7u8XovTdn+d0bfITzSxMA/m+Ea1wAHHKwKjqC69u0mF7tVggF2fWqZDBfC2C/TvMQuXqxvK8a91GmFTLPqNP9tIsuZ0/1zAsJoTlW+MtazcSJmIJVG/NZYc5koB/evZDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csRGpSn15BLRLyg2wG90rkvxxOal3/d2IS4AIcVjFNQ=;
 b=I1AASz6gpbBklkksC46Nf44SqhGlv6atf3yd5Hpm3V3waBxM0NWPfY1LggSYCUOzyNc3oaorZO3iw+8Y3SJETNbPJHr8SO0dTKBQQ8Ee14N+ZfWmEkssUDkV91RQQRAlSFP4VlmKsiwPN99UP4x74/+G3BKhc3OZU0lcDC5dlsmkxjo+FTFe1CHAH6kmC28FMJCRqoAI2/amUgmZiVZuNxdRxzv1js4ve8UWKjw6/WGiKg7NLJ2+1+/0rOmIJYQ8DW8CHsmkyzOwsN3ehm37rad+vzYxbuwL+NUCY2zLx3Dh5UT8b3cZxkzTPtJ5iC+nGK0fIeWWtLrxFBtabigdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:34 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:34 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 10/14] libarchive: Disable RPM filter auto-bidding and update huge_rpm test
Date: Mon, 24 Aug 2026 18:33:08 -0700
Message-ID: <20260825013312.2695028-11-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: f37046c0-cf99-4cfb-d516-08df0248e105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|12006099003|22082099003|18002099003|11063799006|56012099006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	323B/+m4ZisUUU71linaEyDRDM+DzN2RsKPohz1LjXEghT516iXzm2vck1FMZD0pCQ95QNsImnwkP8yfUtM0BaVeZMEHr46rWZPmMzFcsb54SmW1+c/BVsqw8EGyLyAZs+0h0o/Egr6Vk7A4Nmne19GjfERb3voWtsK0OCQD8YVKynn0wQxPEFJRxRymtmPWbVUKQ4VIBrn8bGbAFkV+WrI09rmdUBee5xJnQ5ebJvRgQXBX4PRt2J4uJdOwHd9G4H1+MnLhTYpfMntWg1R2w6kz66qXIARSM2Uu07jdHaSZaCTedKo2MMAGKvNqCSh9Ugor7oX+GWIvBeG9GyUs5i07eTqw3W7VNqE48uly6gA2ijDtUh7PLDFMtGAaI6wOCijQZZyhV+EIgA/pLsCKfXI3W1sodWcv/z0CDYKI+QAI3gDH6uPvcdQgTfCgzDFLBPWucB2cG6EB1YTNsIFw89NjCabjcxjrzQ4WZaKPtv2BBjzTgIz+nKlutgSefO5F2hzXyZBKp5BvsOACcaZqSg4RG6HWPNq1SIK/HaCibF6XL4MXGBvmLleStD5rLdNfbAL+PJdoIkaLhvUrAkHYzXnczMQQFx84+U9UHbMCISG/wmlj2Av7qI9qdO6LCt+DlVCBgSZPe78MrPCS7K7zCXIiKFWyQT7TjVavp+bWV9s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(12006099003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jc7I7W/Kq7XIHLM6NXsaCIzQZjGdGyj7G0OeuPe4sSIeHkYGITrIQORWR58q?=
 =?us-ascii?Q?/P1ZeuRT3ATebRpuY4U0cTyUWYQDqWiOY8SNB8GPG7T4i4QM2wgxduS49Jql?=
 =?us-ascii?Q?a2iz9c2+ZLKuPur+Ux6lVQLJpLdgl4wyr9X9MqlIZSN1VzkRa6QGnIIJhXVq?=
 =?us-ascii?Q?FL6WxIupHATynLbpQwIz/6pxVl8SZm3lDj67U7TsAt3afKj/th3YrAqIql9+?=
 =?us-ascii?Q?CBOApqFruKMpm0LUJWz64gsZbpn2vaZ46YJ6ms1GZS/moTqPbkJJrWbZHESd?=
 =?us-ascii?Q?Mr3obA3TS+buG1jF2fozq9qwufneHA3RfEJvRWC7e+fXi6fwTF0f0/kBrP8E?=
 =?us-ascii?Q?nHaW460Vn0hfSpdYr0cqY2AYaphbYBYJQ4cimxPTx15wC1tKXNf/j8ql5blq?=
 =?us-ascii?Q?tbx1H71ACQTbKsjXzOSN5Wby1Nva9T4OzprWZ5SwegMZqTB2k18rIU2W3cUp?=
 =?us-ascii?Q?UCWb/bqsSWOgwtRBbchXfsRNO+1run16A/ESKhC+GxmKRr5RaafBWLIXOirP?=
 =?us-ascii?Q?/GKl/EpUeLdGZc7cqm208mSSHszWfBn9v/9JzxoM2/rgGkm737w2OMEZNx1y?=
 =?us-ascii?Q?kQrK/iszLlFCtSisYC+kinSCrYI7QcDbYz3mV781efZCGh1G9IyzrHWhNbij?=
 =?us-ascii?Q?zm0D2R79JS0P3JwB2RgNB3CfYhA3f459dbBdoNbdcizg6Zht8A3+MDGEUEIi?=
 =?us-ascii?Q?QhSueNoqu2LlhfjQt3D9heIFEzc65pdqaKKFYjtzhDYsBtkh8FoRr0MSuNKN?=
 =?us-ascii?Q?yGYvYzKQrsQ+nPtm5gcfEGjv3qFoOI+L9t2fDdK4nAp1R0VkpK58/gpIRa/W?=
 =?us-ascii?Q?1eXzeH0oAwdhLagTPDD63h2ls2j3jMZlGV04j2EpSClUAcgxZqPp99Su1CIN?=
 =?us-ascii?Q?43a86ZnNBRjP7OhMho0fBIUiQOG4quxjt+jKRH8qDdZprRAAOjHDKkdlGkfZ?=
 =?us-ascii?Q?4/CWWvRTlyilaU51tyqci88Mh1s75aYd0Qso+BsUzU1nXJCFP9maCw4HClrX?=
 =?us-ascii?Q?oxu72G47RxIC4tOucE5ME/n9YrUTF9MIy/lKY8Xl2Dp7gE3MauZF7+DvUfxc?=
 =?us-ascii?Q?/P6aj9SJWgPci1RlPXC2baImXTrEBkMf00UEbZWCPU46RedzVRHqUaRBYLHb?=
 =?us-ascii?Q?CEvgCUd/H45YKyxL9+/StfpzxNDtBHjeJLmG8j71keWN46SyRq7+3rIi9+5t?=
 =?us-ascii?Q?4i99UQ2kq6/tQvnp2UmN5syZZOaIR2gsvQaHY+TlQv/BQBrkTGy4IpNrD7iV?=
 =?us-ascii?Q?QannfFb5jxI6OICD/1wQ64mLDozFIsFavYjjxWkq39stDBMRE+QbSxiQiUHM?=
 =?us-ascii?Q?GGmnvyxZNOasL66VrqoFGC1QxLVc9YynYEEUGfrjR8enzUeET4z4WUgonNq9?=
 =?us-ascii?Q?4Jo149HgA6XiKMGoWgLoDlzNR/q3eAizfM10OOngzEcUEBUEtQ+9S34fmFon?=
 =?us-ascii?Q?9QEuCswwfy7fw9JBFN1c+IZUHYH67q7ETLNJ+MObB2ZqhXz7To5rVk86tCs8?=
 =?us-ascii?Q?gOmdc6WhXi8kx5CFjJ9O9Hd5ndhy8gErku1JJqwm5W0F+9GstazN5Dn1LWsu?=
 =?us-ascii?Q?NdhWzZN8CbesewHy3LfflB4kLWXEru/OWXLBpvz2fo7Q3r/t+onmE+Dt4Dqu?=
 =?us-ascii?Q?PZ58OGCG/YAKkrJFx7t2AKJn2lSsL7UQL078/+Y+wgMm7w0D0F3p/OcuYOJ3?=
 =?us-ascii?Q?O4EC002t7iSrc2FpFTpbBRMBagCgIwHwip41LyrI9LLvkQuyOW4EUxrYlJR3?=
 =?us-ascii?Q?/3X0Nm+9E1YUCMrF8DpHgJ/hrcVMnPc=3D?=
X-Exchange-RoutingPolicyChecked: 
	sK/gmN6SV/ZoneBUBNV8U1QneMWCEpBwORGwL6ni7eyJN9gz/aKygLN7Vsg0PZ4Kn5A2rmILUYKhgbYYbt0/kg6wKXiUlGvbOYfd5xhobMqgDvQ45mdyk+yVBexG+pUQ0/I2kHmPO5lzIfQUl47zDH4Y3VEF32IaIeQCo/w4At5JE+Ul7jFFM022qJn6qyyKDTelzg5TqS7JmDX3cNdutZGz6cSn/UPLpL1X8gHP/Awm/WA3vOQvp+dSkHCKCDhGDcoHYrwcP33G1eJa2ujpbAHhk5EDi3jQTaxHlQD0AlGBfsGhyI0+r/I+OpJI+5IxJcU45EGMXP5Gr0xlqwMlfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37046c0-cf99-4cfb-d516-08df0248e105
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:34.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5M3xMtZiQY2VoMjndBezFISIZB3hqpBL2hWzt9W1xK3IZgjIbKMajWhLUOg6AJs0WfB8sSlo+MD99hP2zaugQ5FtOSQGybWL76e3/7jSTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX5bYWFAYjRpNA
 yLz7hQxf2qF6Q5Bwyz+NTUOzUO573Q4lFGv2BQSn4cy69CWjkVSOthv25f15wPiHgGj2buOZHy+
 B3E3HmiL5eyiX1gKO1ZWX9yhspbcV1eTA5e5NOsn7fZJ6Dw4rBL1
X-Proofpoint-ORIG-GUID: n3DLUSF_M379BWB1QdaSULO02EuFjbU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX8mVHfPd8bt0r
 yx11UOO+FxWuo9Nhy+TrGWEujxRUW3YN5DUxxVlBy9CUt9ofZgixXLgZPWcYwbNebyzFUu/my4m
 3Vzw0gy0PCZ8ceJP1zxanmDeX6cB645QhB3mr6pHcgIq62XwJqodkZ1zRZcBMUFxrDv8jkwtjWF
 afUWoFqazo7KjT8G/30ylH+vu88mm94AIigOS77RSx5v0tVlVHMc4mEuDp0hfrKzzRX8WkFbEKy
 7/UD+RfNabbISqZtiHtkV6fDIa8SHN0alyfJmalf2sThVj+ACvNMV/2S/o7Kx/7g7KS4zNhRsZY
 ohv1CybGqEdZCYXI2RQAKQV/EEF2y6nlCLIlJ5acn1vNt75/lsRdM4ut0Sn/pKOxOZ752i6lsOs
 HJ6jTYas7Kd62ylxlGg9znlgbqWk7JPU5uaYhdAwef59lCPpAmrNy6/6hCjuJyGBIfS1TWGZ/qC
 F9G85FcTBLgVoalRa7A==
X-Proofpoint-GUID: kJcx1BdmhnA14zQn0nBQHiL8-pfhK39s
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8cf0f1 cx=c_pps
 a=+CKpLqsC5QamL8vULJ+FWg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NzkYBEk6AAAA:8
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=9_fcTNOi7W61J8-o3-UA:9
 a=DC3Xf0KLC0SIM7_k:21 a=zqED95DPWUTvcrp2mxve:22 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244182

 * Add 0005-Disable-RPM-filter-auto-bidding.patch:
   - RPM is now handled by the format reader. Disable the filter's automatic
     bidding (return 0) so it never intercepts RPM files during normal
     archive opening. The filter remains functional when explicitly requested
     via archive_read_append_filter(ARCHIVE_FILTER_RPM).

     This ensures debuginfod and other tools that use
     archive_read_support_format_all() will use the new RPM format reader
     for RPM 6 packages, while maintaining API compatibility.

 * Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
   - Include the test_read_format_huge_rpm.c changes from upstream PR #2846.
     With the filter no longer auto-bidding, the format reader handles the
     truncated test RPM: opens successfully (ARCHIVE_OK), returns ARCHIVE_EOF
     on next_header, and identifies the format as ARCHIVE_FORMAT_RPM.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 -
 .../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |  2 +-
 ...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
 ...0005-Disable-RPM-filter-auto-bidding.patch | 73 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 5 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 6075770bf0..37dad54409 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,7 +11,6 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
index 471433e7b5..0249c87878 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
-RPROVIDES:${PN} += "pkgconfig"
+RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 29d12bb539..03a207f33f 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -11,6 +11,14 @@ Without this patch, debuginfod cannot scan RPM 6 packages:
   libarchive error: cannot open archive from pipe: Unrecognized
   archive format
 
+The test_read_format_huge_rpm test is updated from upstream PR #2846
+to match the format reader behavior: the format reader opens the
+truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
+next_header (no valid entries in the crafted file), and correctly
+identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
+companion 0005 patch (which disables the filter's auto-bidding) so
+that the format reader handles the file instead of the filter.
+
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
 
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
@@ -29,7 +37,8 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
- 14 files changed, 1162 insertions(+), 15 deletions(-)
+ libarchive/test/test_read_format_huge_rpm.c   |   13 +-
+ 15 files changed, 1169 insertions(+), 20 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
@@ -1398,3 +1407,34 @@ index 6062c48..11dbbb4 100644
   
  	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
  	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 51208c7..10c7fb7 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -26,6 +26,7 @@
+ 
+ DEFINE_TEST(test_read_format_huge_rpm)
+ {
++	struct archive_entry *ae;
+ 	struct archive *a;
+ 	const char *name = "test_read_format_huge_rpm.rpm";
+ 
+@@ -33,11 +34,13 @@ DEFINE_TEST(test_read_format_huge_rpm)
+         assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+-	/* This archive is truncated -- if it has data, the bid has screwed up */
+-	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_open_filename(a, name, 2));
+-	assertEqualStringA(a, "Truncated input file "
+-	    "(needed 34359738384 bytes, only 10256 available)",
+-	    archive_error_string(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
++
++	/* This archive should have no entries -- if it has entries, the bid has screwed up */
++	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++	/* Verify that the format detection worked. */
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
new file mode 100644
index 0000000000..26a0159908
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -0,0 +1,73 @@
+From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 11 Aug 2026 12:02:31 -0700
+Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
+
+RPM is now handled by the format reader (archive_read_support_format_rpm).
+Disable the filter's automatic bidding so it never intercepts RPM files
+during normal archive opening. The filter remains functional when
+explicitly requested via archive_read_append_filter(ARCHIVE_FILTER_RPM).
+
+This ensures debuginfod and other tools that use archive_read_support_format_all()
+will use the new RPM format reader for RPM 6 packages, while maintaining
+API compatibility for code that explicitly appends the RPM filter.
+
+Upstream-Status: Inappropriate [OE specific - keep filter for API compat while format reader handles RPM 6]
+
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_support_filter_rpm.c | 37 ++++----------------
+ 1 file changed, 6 insertions(+), 31 deletions(-)
+
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf..8e90da3 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -79,39 +79,14 @@ static int
+ rpm_bidder_bid(struct archive_read_filter_bidder *b,
+     struct archive_read_filter *f)
+ {
+-	const unsigned char *p;
+-	int bits_checked;
+-
+ 	(void)b; /* UNUSED */
++	(void)f; /* UNUSED */
+ 
+-	p = __archive_read_filter_ahead(f, 8, NULL);
+-	if (p == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(p, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (p[4] != 3 && p[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (p[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (p[7] != 0 && p[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
++	/* RPM is now handled by the format reader
++	 * (archive_read_support_format_rpm). Return 0 so the filter never
++	 * wins automatic bidding. The filter still works when explicitly
++	 * appended via archive_read_append_filter(ARCHIVE_FILTER_RPM). */
++	return (0);
+ }
+ 
+ static const struct archive_read_filter_vtable
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 3b3824e778..2eefa28532 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
            file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
+           file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

