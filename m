Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98638CD1299
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 15:01:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.109017.1712588477696534272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 08:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IYabL6aD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4828e4a765=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 438AJpTC000341
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Apr 2024 08:01:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=wvVw/uw7besp5NpOti
	PReYdRbmzelhpSvPCycKdYISI=; b=IYabL6aDIusQzPPQOZawobk8n3PTDBdbRn
	+W2XnAR/lmOiG/us2LE082X81TrPFcSQ7I71GBFPBMlSoIjemoah/doCPQS1M7wx
	AnGUglDANpR7HxwxlYRPr4IPDlx/wOsppvg8yDJqiMwglm2vVP3P0aJ5xN0qbRYj
	HFPzKJLwJ0HTWHPusFwcv16ds69AKA4ZrnPYFW9PozDySsWRSiaxUrI9esXIp8c5
	OoWof4PhdZw0/sVWwjUz5Xb071eP6w7roVVesIcRrtx49aUgLQYK9VCgjYL1LnS+
	HFyVmjFjSuwc6hv/uG9+LN41yHDCz7LsqbZhi+ut+5UTalIA6mgg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p09p6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 08:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHyUY2u+x/atYETEp3VSA63HAfR35dgil6XAP+IdfuLt2lOT73dTero79DhhXdXLaMoeJdiwEhfP8fek/N/WM4WfmWs/HPC/ko4kBviaAYma9W/9kfo1BZtM1ibkqgyCMdtQ8Ov98M/TIdsk615sAlyeP1qtAErxTlrNtYb/x6eWiA76wgnI/65JzqTDiGhsWIoQtFk/DQGUEHfhxuIR8c4HUWs/zUAVFdBLKJLo9xiW2geYjNGG5xKkQMzlTamwLkSjZwAsr2a+QrMLIAKaGzUPu5YVLveebPqayDfl+aPAvzkJNnvYyZNIOujCyaqlbfGpzpBcib8/cTaWhkGcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvVw/uw7besp5NpOtiPReYdRbmzelhpSvPCycKdYISI=;
 b=d0q/CqHzGzsPwJOrIeRibY72+6LQDSXCY9N7JViRg4nP6q+/r2HR3NXzuXFCAOlh7c/KuhgxAxhCHECeSKEJ5A+Ns4ccZij1I5j9m9OmerbjUB6/0hG1DUsuGfbVFlE6TDFeFtAvvTAK2fxVMEbRjiKjE0lkljMoFy5POg35MKeKMkwDEyhkNAknEK6l6Uj8oPwNZOwMV6fYgtXTUNw4B0RF1GqrYh3yW2V0ZrlP0KRKh5cFEg9zVdSNembvAikWZGzK2gQpwmpmgM7Cn76kMME2XMH/7BZkNJp/7/Q5QhmYzwC2RmTulQBhCILusCuLA87JrYPzf8w/2FsS3m/L9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.27; Mon, 8 Apr
 2024 15:00:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 15:00:41 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ovmf: set CVE_STATUS for a few CVEs
Date: Mon,  8 Apr 2024 23:00:15 +0800
Message-Id: <20240408150015.2196924-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6681:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	973UF5QUH+HJcfILyQeg1cvu29i5ewEBIbViZLnoLdnwn160U1fucmvixRdaMaNOR8FWhBZamAABCjjg26DHlUN+B2Q8kzoBhPm9M/35i7ufAqh2EaxQ0nCWYP6eSdlg9p+sah4XBSklx0NI3qmRsd/3mwaOTFmZ9EU+FcsnG2aGrEqRXKWSDL+WHmSlYjIkOS0FJrvfzUChR1bc86xV6cJy67PkagB0RTdHMjQdj6Xd0S2NMgn5nIqOUA9FMbeo82mkjN/Z9fHOuJJuQUNpKzPYV3o3s1csum2c9zSYl2ABe0JoPj0rBXn/Is2JndTe8PPFcbPKwTLR6LpfNNOv5FGtdSZL6PkWqgfN7Rj2kcO+WrRg86yUi5OGL1stX+nrbqqpLbYjj3RMxitmOsyij4zZybXAFvaiKfCJNYt/1j+1Mqk64wXRB3SpA5w5lZvixoIL5sXmAmuedryaWbyQ5iLIieqerHvvG2jzoM6a/v4SJQhTB7kAOT2nZeRzSzep/qgqBlO2LS/8kMpkWL9poRZJ5Q52G0dkVaoSC/tvLzdzZsp0a7uez3s98qEYQ8c2ALXGwt8/JJHtpKtqe7yLMXQ3014BeFCTDIv6vK/y+lx+YZ/bjIgDg1qpIiXTj+5+yjDvDnQQFwyc5Pgle4LKNS/HwvOAUu3TVMWcdlxIo28=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?csGE9o41Uni14OyKp5SmfIQOfNCmSKv02w8tSmWVtJXD+j3vXu+sthe5VoWm?=
 =?us-ascii?Q?Z3ga/l8djUj0I+qMF9nxHuaPuVxWP+p5wvsrx7fT8YyIE1Q6xwTZa2lPWGzA?=
 =?us-ascii?Q?l3+fsyUOf0Myyeiy819I+Wf9Jn5n1v7hm2ZXJHWwocAvpfH6ScoNDQsS/vcg?=
 =?us-ascii?Q?BZmrdBqzYepCWMIV+97VQGvRGFJuXt52DVbLDyBcvO46mfTdhGiVfgQC9kHC?=
 =?us-ascii?Q?VY+m+cqX1WfjXEZQ2tJ5KoKTmrqX818n2aJVVo3JFnUdwRk7sCRGq327KJ3Q?=
 =?us-ascii?Q?UqcuRTBU4onzxBY3eygwyXvqnXgNkD1OTxE+ySisFIZMPunVIm8hoSORu0rN?=
 =?us-ascii?Q?3OiYoDE9QlR9t9PLutwTp/wpOgA94rrQSOb00QsU15fSmxlZRtRUEVyPM40N?=
 =?us-ascii?Q?fscxzcB1zhuReGlsswDs2sZ0EOlln6nWWpStJlvcL8nJCe1O9R4vEsZ8+u8w?=
 =?us-ascii?Q?ltjPihZRDG/7qIWWuuVr1QAvSdapQU0cYwD0G6cVMNubx4y1eCSl1mNJByag?=
 =?us-ascii?Q?niQkMJIqtBalxqE7brqCqZEpxO1oxGufZH+2GzXYCG3SRMl+HWMAydqARxii?=
 =?us-ascii?Q?30thLVbIBy/xHr377Hy70d74pK9vHO1GbkUPhQjpQCFUnRdZBM6TEwpze1Aj?=
 =?us-ascii?Q?NQL/h0Z/dCRg38hmnO5mYKPdS73TGb2Ury+QbbXkIk7SOanx5dlIVFEZPoiN?=
 =?us-ascii?Q?UD9EUcjvnlrbXStQRTWPXixuqQ5EXuu8YaE/Yt2uJ8A+wd2IziBXNnkEBSX/?=
 =?us-ascii?Q?7G8BYqeINswsyzYEsXVpkdpla5jM0vNj99q06NWmscxurJx9YDEF4GLzB38y?=
 =?us-ascii?Q?xcc/zKVBm7QXy9tOnQrVdGgzMJ5quPw2z8yc5yaXLh8eMDyy4R60MW57UZz7?=
 =?us-ascii?Q?749KHog94IOJCp2nelyBE1xwcKKm4K0vcEvSABiCb5zWLDgnm4mKH/0TNSyf?=
 =?us-ascii?Q?Y3jBN6cQG+hADNF35wMGn45EyEHp38GDxwnDNJr98i+BgYXJB3/93MLjGsfG?=
 =?us-ascii?Q?dtcEuPlk+zqmpYlHT5XbmDKRi04APOUtWhITpwWq316Bvmg+ym/MvT4Q2qER?=
 =?us-ascii?Q?AsHqxHv8A6w4PMjSyY6+zzxw8Xvejpy63WccXIekc1HAYP6k1lC3xkG4P2Wk?=
 =?us-ascii?Q?Tb3Y59yF5ulSnJbqVqf4bsQUPM+cWyHbFS6xYmF1rB/L46dAPx3c6QCAMtxY?=
 =?us-ascii?Q?d/tTrPVTTzmgbVUBlQE8ps63ybu+Qh2auKCKxANOvRXviCsE4OOK2EgkE3km?=
 =?us-ascii?Q?Jnku6r3KYOvDy5qIJsh4uApI08bKr5FOaEKYH+Fhce+l5YtG3bpHQv3TiHhR?=
 =?us-ascii?Q?bOIebZs4S/veZdyYXd5vEihqRV8XNDaXoIntcRg8potndM4YfPfM36FM7fGe?=
 =?us-ascii?Q?ksYPds/dxmvwOS/i6SdB4tq2B77gqiuxBj8vjZ+8+a7VK9Gk44AJNnZDdUe+?=
 =?us-ascii?Q?WAwt6AfOb4G+vmYtxJgTshZlUN2gro+acjM43kmtCxxymlWg76Y6Wu1rGJyS?=
 =?us-ascii?Q?pJJ42k2eFlhkRVy/xT3VJYKdgQHtzUMfv+abCws5XAWuKBiVFDaRnMF3M/de?=
 =?us-ascii?Q?FNXX8tSybMey9f5HddHOyxYfCLupkwmzA+VU6jmF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b703587-8bab-403f-9e7f-08dc57dca880
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 15:00:41.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDKqMPHVRe44xB1xJwtNZ/A7cXpeBC9vrf5HhI0AkL232+nx+mGfO3wmIh5KmJIehtwx7Uff0ybOO5Q0p3aRkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
X-Proofpoint-ORIG-GUID: 8Nnw9emJd7Bne2Da7SkSe8gEBahJ5m4q
X-Proofpoint-GUID: 8Nnw9emJd7Bne2Da7SkSe8gEBahJ5m4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_13,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=910 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 15:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198015

From: Chen Qi <Qi.Chen@windriver.com>

For all those CVE-2019-xxxxx CVEs, following the links in NVD, we
can see they have all been fixed.

For CVE-2014-4859 and CVE-2014-4860, there's no useful links in NVD,
but according to the following two links, they have also been fixed.

  https://security-tracker.debian.org/tracker/CVE-2014-4859
  https://security-tracker.debian.org/tracker/CVE-2014-4860

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 97651faf62..35ca8d1834 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -34,6 +34,15 @@ CVE_PRODUCT = "edk2"
 CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
 
 CVE_STATUS[CVE-2014-8271] = "fixed-version: Fixed in svn_16280, which is an unusual versioning breaking version comparison."
+CVE_STATUS[CVE-2014-4859] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2014-4860] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14553] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14559] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14562] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14563] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
 inherit deploy
 
-- 
2.34.1


