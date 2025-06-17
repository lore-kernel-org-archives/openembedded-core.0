Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA8BC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:10:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15148.1750154992854708930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6v8CI009026
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA3hFd028261
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:51 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nteP+tCfyF1b/UXGKkdtlwDeqtevyBTgimcrY6Zrgr7N05HA53FghR3arvoiOBNjxg9LtjNwA4gvpxhhasCVXprkC3xllDBJZR1fI2Cfl6e1XiqKSrFDYFio30sDdhIZdJPP0Y0kRwvZNmCwi9+qJHIC8cZOXdQr4jXVlwaR+mcNolk8zwSprwBJI9lhdE4JKZqW48SbDEdcej0BRe9om9NEaIxBlvNpfcIKd0XPj5Fk3DyIj7Od68oL2Gx/gMgmW8MzWX9kAKll6fpZ0n6DVOMswT9h4sWEhYHJ1b3kXfTvHor05Su8nRLgtT0duRAfVeJIgY23D3Q1KsH1v5cbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbb7Qte1jn92QW5PknwpML7H64n2hYUMGDNfeEkBriE=;
 b=WMAwIyZL5s2Nh+hemUZP70uQdgbKwwJ2vp2v45jIhbZRI6IfqyxZAPPEr0c3h98H6wxHrczsCoCe7WqcKKOw7EXd25QgUBEHOmYXH9OLTVsrj7EoXAW+wVNr0lX/kmVa3U24TDdvSk5sdGArNrnNOpepHRzMh2IDqd+7gt8QtWi/UYa9dFIlcRZPfCa2ifXZu9DArvEIakygQn0BVT52X6SSFe+c3sjKlsr807RHafvC95JohlYw+UmzkzELal0SSnn0VMkl1T/zHfyYgn/pmwc8WQr9mJH5FyudQcExTsSwYBLrN+sOXEm0RXiUJVd0ehkd6/353k0ZwXXGHpBOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ5PPF12B0A4A9B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::811) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 10:09:49 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:49 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 7/8] glibc: nptl rename __condvar_quiesce_and_switch_g1
Date: Tue, 17 Jun 2025 03:08:54 -0700
Message-ID: <20250617100855.2696492-8-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: ce97cb5f-ea07-406a-c18b-08ddad8717d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NPVQ8WP53eCRZRz0vq7fNfYR6dvksIWNtYaKyll484lBCCJctTAC5B2fYdu1?=
 =?us-ascii?Q?mzA4Pbnv4WPCso35EwfSkTB5bWpw97uqt3G+Cvglw1OgPrC97jiJObXOQ9y1?=
 =?us-ascii?Q?NcGChWNkxZxTAILe9g+Bq5WXYTfnWp/EfREVMplOAd2XkxaCvV1B4KIUM6jw?=
 =?us-ascii?Q?Yh/7pb6syaEVcMRkRlDMA/SjTOOEN0dg2Maj3vgGD/jR57YQ2tq/iJrSwA3h?=
 =?us-ascii?Q?dT/Mb5sXXutmCaitCV4lSQ2PUXiLmvoemgtOaP0F5IBFCNOqh26dMb78kQli?=
 =?us-ascii?Q?6cS0qiILy5rNC2sdfWPm1rS+ca6Pu6Yo/hrjzjo2yU/Ig3BL3Qmfb6neMw/6?=
 =?us-ascii?Q?F0WgRBMDF3H5l4sZDlqdEq6hEZySWj7UO8qoX3qClVWupdc9wrc65YPRLG0m?=
 =?us-ascii?Q?w4QPlgHD/tUNidYXkVmAO+ZELKxz2Ghpj3Taw5QKqjo2oWO8wE6mebKKie5o?=
 =?us-ascii?Q?XBR2mTBRrgskT+/4vaoCKlidWOZ9C54MAAzw9fj+NVGRhyvbwT2d07WlILex?=
 =?us-ascii?Q?IkN7Jsnu4cQ5M39NtPbdaEJwhST1qNWSJ7MP5qGG1JiaKAvgXNNPPQrtz57j?=
 =?us-ascii?Q?wlYwrMztuCU0MvwkgqhjXVhgQl4mLM9zdqpx0p7WJsqB5xjEmA2/VmYEMzXu?=
 =?us-ascii?Q?vRjNc07bB8iLeX9l7IAYiILOJWOKRz/gm28v0pZM5LXF5w1vzhC1cOBiBZKW?=
 =?us-ascii?Q?IhfuIjv6Zb6B58h+0B3Jr+2e8JjdyXivPIuSBAHyXmPS2GXXKENE6lKuP7Yr?=
 =?us-ascii?Q?VDrXIUxslhn7syXW0voE0Km9sBuqPNAs1pLqxe+zGb5LtdYLdFN1BjdcgTgp?=
 =?us-ascii?Q?6ZnvYVhwcahSPvBj7xdLSBEMHBO3XzS82/IS+eBIsswpt52WDh/mAkL4kWcO?=
 =?us-ascii?Q?pMO9emvnkhl81fPJRxic/vJOlEkWGa5C9SRf5olDUh8itt6wtYTSr3mrtIec?=
 =?us-ascii?Q?B9qcqR4Hgk4OiqlXM6h9bIjx/ku3b3ivzCdWjJjR0ZLf0g7F00vXTPOiUHEu?=
 =?us-ascii?Q?WqsvSVC9o99kd9SAvCKxgxUOc1syf205J0weQdoCQyrAP5f2SPXFTjksl5+2?=
 =?us-ascii?Q?dmuOmyiDRSXXX1vROhSwVqUh+C0sbAM/IH8LIHSujSXqOK7H5uaTN3fAhRTL?=
 =?us-ascii?Q?l/qF66hGp4KYMhgbe736XUBHjKXxZFOC1CiXw9BAj3TpUqOocSeVVC6KAJ8Q?=
 =?us-ascii?Q?ekTuDcdN4lBRXsCBzdLjV99HSXI01CV8ctRAO3T1vjqJ0Agwv9SM8GS4TxIM?=
 =?us-ascii?Q?CvFjwlwaEOPAjXgF2jav1Rx2PBQ3OQXI4JeMWdw7CQISzF1iCgawI8cKYt/M?=
 =?us-ascii?Q?XPsC0BOaO8jKOkbhLGQ0nkPkSPfUHrqTMIADjRN8DOwrGrTHl1/5y5XDkvec?=
 =?us-ascii?Q?Xy9JK0ApnEoDtivVp2e9sXZYs0xtzlEihmfzaFfHdrK1o3nUHmiZlXEbWAON?=
 =?us-ascii?Q?fP1wMYFfo6n5HohXLkm5DEmd7NZcmSo8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0UNeh+LPzldozsReGqE+Io+Y/9RchyS5gpfPdmc6N7tOUkHP4O93ZrzUMSL?=
 =?us-ascii?Q?dHabZzqNpQtpDTcFyJw3JL4hHP+DcHuTh2d3pB9BGtu3AJUoWSFDK9En5x+X?=
 =?us-ascii?Q?OL31PCsjdp927K/kAIIp6s8pkrPiZqbiBFLZuMI3F9FwimyVlBgz/6XJ80YQ?=
 =?us-ascii?Q?At5XYKyLPa/ri3h9OTY0IqiCv8El6GeaLse8Nury7PnHQWztRHcweS5EY+RF?=
 =?us-ascii?Q?navSaCBfKzps/zPzN7r8fb7qPwdu+Z6EAEK6BvpUPqhekk5RTSPYU9FUmG2+?=
 =?us-ascii?Q?KH3SRDyqt7oa18hTUVgjCwayDBKNPJYJ84zQLRokMMXuxFgCoivGDRtl0V6a?=
 =?us-ascii?Q?pruTE9vr+6qiHhlPkikAQ+FSm/8bLIEycZUa9H0EQ10jpr6wTzpQqWoSBF3p?=
 =?us-ascii?Q?olSG//XzlzLOouHaSK4mJXqAMkT4ZTzScAU35dfmYb+kvrWQpbIeCP3ynXc3?=
 =?us-ascii?Q?lqTrleffTPRHDj00h33BzKPLPQIFN3D/0h6ymC47WiRjJyLkwUcK6UApP2xb?=
 =?us-ascii?Q?U1oFtEpWDTTHQmbAXgf2EIi2kzCqT5bucJhBm14xIxPrzZPVrGj14OhomQJT?=
 =?us-ascii?Q?RsCZW87yKVF9CzoAbbqdB3vtm4ONCjHbwph6MMYCHt/iOMsMamKsYH4cKdZg?=
 =?us-ascii?Q?IsrzLbWfWZcD6AbMjxIG8Pb3onLKVoXxoO+FsNRrE5xbwS8/IIIwXS+5XuDv?=
 =?us-ascii?Q?TCvjb6eoCLr0s6SaDE11bfRWDdAIujaJSjftUZpaKzrRHr8rl6GMalLgFB/O?=
 =?us-ascii?Q?8ChRln+IOrxpG1w13LWiyclIgGiOttQlb/sT6p9tWmwTiG70WU73rPjdBtWk?=
 =?us-ascii?Q?6dbigHMDo+/3opeYMrFiPboBzSWqDhizU87X4omqeZG7jMyQGT8pRn4vvpZc?=
 =?us-ascii?Q?/2FReQvew/o+3AzAmqFHSUMB71eq3vem2q+NpZhBMHgRrWdTWEhQ4TG4tTks?=
 =?us-ascii?Q?SIBN+2MfSIP4tW06JGdJFI+MQZpV29tNt/bYNr4hWrUCpXufR3/8JRwFT8r1?=
 =?us-ascii?Q?f5gez00A3Vxs+lS+w0cDh6kGBBVCNI5ewVPjlTTZfAgX2FX8mpY50C8VkTub?=
 =?us-ascii?Q?UwvT9Hv61FqRnH7rswLumirPgSGDVfFih6Sd2p5GwdVeRN1RAAvYWDgmy8Gs?=
 =?us-ascii?Q?m8kPXJlHYU5bx/CIm6u2x4ehir/c7E0FX3Z6ilIAILbtmqYc2vKmNTMGumDg?=
 =?us-ascii?Q?iCMI78AV3hQtXnCZ1nwykC/2wf+oeKOzhPcKbn3DKvSEfvkO5SyuWsgXiMQz?=
 =?us-ascii?Q?CEP5SzL6Pt1pSrzsbG/UZjNnxse0MTV4wB6brAcuB+i3mJz8OSHHcJlT7AL+?=
 =?us-ascii?Q?5mqL97hoPhjF6HqCIr1EzhAPM6VX29cFdMFmTZrvJa8r1hxbEDCoboh8sNOd?=
 =?us-ascii?Q?uKmatkG0xsvuonED6v0/HmULrt2RC9CHsxLEOfLUkt6bVpCMMXG0wb6DeAjp?=
 =?us-ascii?Q?NJrrgOhx5p+M58RjgKah7JoaJvUcuFWj5M2jaM+Iuk3E0AOZz6HEBWNSXpSv?=
 =?us-ascii?Q?I3KaJIkQY2Ux+tWrwqzffdmO8OgOswi7RHk56tBSQthc4ySaGh0fQDAN9Bpu?=
 =?us-ascii?Q?TbyISCHFk0IYVz3kAzNjYRldTEjs+sXq016qipqJW8WW7pPu5ABFkml6NXc1?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce97cb5f-ea07-406a-c18b-08ddad8717d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:48.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avnDYnL/6N4zQFKAoSkR07cVKhHyPQhar8QR6bzUNRIqpEkHAioEoMgEwPSIiPlHPdqG4TXZ9F3bFfGDdQexh9PxINfPPd2cmapT91awc70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68513eef cx=c_pps a=hgGIz9PNuEDlV8tZGFw49A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=uyKIICsDoPcSdIl6ehEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Al1OEtXoiTmshdCRWqu1URfTxamWQjid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX0JQ7B2Uk5XLM uvEJAJzGoN8GNi/Qt60Gtamc/13XkCYd/2oz90AN8/mENOgl5kM/PBiuPkvpPsCmOrdnChVoVXy b54Czl8+RCam5i7pvCoeRPdN41Ra9xDoXywtzHcx2oJASnlHta2e4yNTyIs95ZsxJUkwPmc1BX1
 yCeSg+O0PBTdo/3cXWTdChLMa0dMuVkRDWNefxebYqKjQ/2U1W1uTK7K5+Vud6QZsjXoRz7T4OQ FolGrGsj586n1c33VGkTqNh6sf4cF91jkiIGbr5I0QFRUHYJ6Ee0Ji9/A8bZ2oB+sH4k98MQzrK 3RVHIVSqzCGGLcI4V7pxIDCMl89v8GaJvBU/hlSCHQ0GOBZosSebU0Fuvv9Uwyty1Y4KExr5lDl
 oYGxfOrRkOca++HAFD9PXesjkDuWx8YSoxZ49oBcbe8iQeZcJN3U9BCs1iDyM8nGDQiEdsvT
X-Proofpoint-GUID: XU_1GFrfI2JFf4zouhSNJwXsJWBVBqgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218876

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-7.patch          | 160 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
new file mode 100644
index 0000000000..a9e9cc7c48
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
@@ -0,0 +1,160 @@
+From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 01:53:25 -0700
+Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
+
+This function no longer waits for threads to leave g1, so rename it to
+__condvar_switch_g1
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
+ nptl/pthread_cond_signal.c    | 17 ++++++++---------
+ nptl/pthread_cond_wait.c      |  9 ++++-----
+ 4 files changed, 26 insertions(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 5ae141ac81..a07435589a 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 				cond->__data.__g_size[g1] << 1);
+       cond->__data.__g_size[g1] = 0;
+ 
+-      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* We need to wake G1 waiters before we switch G1 below.  */
+       /* TODO Only set it if there are indeed futex waiters.  We could
+ 	 also try to move this out of the critical section in cases when
+ 	 G2 is empty (and we don't need to quiesce).  */
+@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 
+   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
+      which case we can stop.  */
+-  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++  if (__condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index f976a533a1..3baac4dabc 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
+     return FUTEX_SHARED;
+ }
+ 
+-/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
+-   leave G1, converts G1 into a fresh G2, and then switches group roles so that
+-   the former G2 becomes the new G1 ending at the current __wseq value when we
+-   eventually make the switch (WSEQ is just an observation of __wseq by the
+-   signaler).
++/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
++   and then switches group roles so that the former G2 becomes the new G1
++   ending at the current __wseq value when we eventually make the switch
++   (WSEQ is just an observation of __wseq by the signaler).
+    If G2 is empty, it will not switch groups because then it would create an
+    empty G1 which would require switching groups again on the next signal.
+    Returns false iff groups were not switched because G2 was empty.  */
+ static bool __attribute__ ((unused))
+-__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+   unsigned int g1 = *g1index;
+@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 	  + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+-  /* Now try to close and quiesce G1.  We have to consider the following kinds
+-     of waiters:
++  /* We have to consider the following kinds of waiters:
+      * Waiters from less recent groups than G1 are not affected because
+        nothing will change for them apart from __g1_start getting larger.
+      * New waiters arriving concurrently with the group switching will all go
+@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which finishes closing this group.  The value we add
+-     will never be negative because old_orig_size can only be zero when we
+-     switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.
+-     Relaxed MO is fine because the change comes with no additional
+-     constraints that others would have to observe.  */
++  /* Update __g1_start, which closes this group.  The value we add will never
++     be negative because old_orig_size can only be zero when we switch groups
++     the first time after a condvar was initialized, in which case G1 will be
++     at index 1 and we will add a value of 1. Relaxed MO is fine because the
++     change comes with no additional constraints that others would have to
++     observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index 14800ba00b..a9bc10dcca 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+   bool do_futex_wake = false;
+ 
+   /* If G1 is still receiving signals, we put the signal there.  If not, we
+-     check if G2 has waiters, and if so, quiesce and switch G1 to the former
+-     G2; if this results in a new G1 with waiters (G2 might have cancellations
+-     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
+-     new G1.  */
++     check if G2 has waiters, and if so, switch G1 to the former G2; if this
++     results in a new G1 with waiters (G2 might have cancellations already,
++     see __condvar_switch_g1), we put the signal in the new G1. */
+   if ((cond->__data.__g_size[g1] != 0)
+-      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++      || __condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Add a signal.  Relaxed MO is fine because signaling does not need to
+-	 establish a happens-before relation (see above).  We do not mask the
+-	 release-MO store when initializing a group in
+-	 __condvar_quiesce_and_switch_g1 because we use an atomic
+-	 read-modify-write and thus extend that store's release sequence.  */
++         establish a happens-before relation (see above).  We do not mask the
++         release-MO store when initializing a group in __condvar_switch_g1
++         because we use an atomic read-modify-write and thus extend that
++         store's release sequence.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 104ebd48ca..bb46f3605d 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       /* Now wait until a signal is available in our group or it is closed.
+          Acquire MO so that if we observe (signals == lowseq) after group
+-         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-         store and will see the prior update of __g1_start done while switching
+-         groups too.  */
++         switching in __condvar_switch_g1, we synchronize with that store and
++         will see the prior update of __g1_start done while switching groups
++         too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+       unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 45e6dedecb..547d0a3d7d 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
+           file://0026-PR25847-7.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


