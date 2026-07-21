Return-Path: <Priyadarshini.Babu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85412C44524
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 03:05:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14667.1784603133049240118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 20:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r//TvJey;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1662244a07=priyadarshini.babu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2kt6N1754013
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 03:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vz7YyIgqN
	Yn5CMr6ONXhx6ibbN/byN/H9hDVhPL7Cwo=; b=r//TvJeycTWWnWZsSWDa6/fsf
	qS4oLe8RWBiTYZmxegPhGOHWpcPddFTFf1n1STV+2AcCq+gvLw3Kni/SxHYz+IGW
	xb0ailLJnWm5g26mNC3g/FCxLfEirWWj04JRUlDGAJo31MJ2N+D2sEyJlp/DnrP6
	oJfLqjQskIYLrHnkNIAnj4CopJrmPqM/STitQ2snyx/ZHYHzf1hdf5UT++2OGxBR
	AsUu628DxM+vOmMHZlC+QRJl23CrR2/Gse+nnMY3j4ih9HobIwubALdq1qQQw5aM
	caja2MwEjUgqube9e72/c1SSkZOS4GVQKCOkorLc7PrOgUVcGygLerrqJ0o9w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fga8x3s1g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 03:05:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJJ1gZZPD7kRkNafkA7hDTK0EVaf2yhEoMXblB5vtBu92ZZgNTLP3Op6BzO8ve4/3WozYCOjVT1Yd2Tq60F2p30+KVCjRH+qdoH4J32PFwe49p92F2EjFMzq+hGY/425r8eCRc3LSmTdmjoKZzVDn4f+DmYajo3OufGMvUGyZZoLTAVO7rVtYcszd70PaElKJgKHniJVccqJ9EK5YxiRVOhRc1WHn3UxHSubbogfF052Pkox91xnwvUe5Wczeabp09ipJotA0zlvp/aLGnCLX1pqs8BxT1DqE/Wvx/sIrn2ZCtWIoKs3UwXBG1j/XgB+7lzHor9DloW/tFfuJcdMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz7YyIgqNYn5CMr6ONXhx6ibbN/byN/H9hDVhPL7Cwo=;
 b=SdMoZ4dczjxF2iBys6chq48VF+CkW0MvLsMOczEKljiDculxRj4JO5MN9MB9R3iYLG0lDxKSQfFduHpCqnu4eaAHtPr74Q99wOzxokQBeynFBccy/619FV6iqPaqXF/QTeP16Wd0ewD9Au+1O3pQTuxSopUQsQsA1pZwwuTs13Z4O7q1EnfgeCqIvX8gW3NL/tVYzmDkRH2fYAyWW7iDP8aNM1CFLHRn9bsNOSj0JSqzb18yMMpG5BOrcFpzaGGYfqfjwK+qc4Nhk8V99/EpnWVez7BAO0i33jK6qjNIUR0H8DiUJCLdOzdDNnCUTsTjddGy2Y7Yt85Y8d5MKuuEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:05:29 +0000
Received: from CH3PR11MB8520.namprd11.prod.outlook.com
 ([fe80::65f6:1d93:a783:d398]) by CH3PR11MB8520.namprd11.prod.outlook.com
 ([fe80::65f6:1d93:a783:d398%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:05:28 +0000
From: Priyadarshini Babu <priyadarshini.babu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [OE-core][PATCH] vulkan-samples: disable VKB_ray_tracing_position_fetch and add install
Date: Mon, 20 Jul 2026 23:05:10 -0400
Message-ID: <20260721030510.2071878-1-priyadarshini.babu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0200.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::26) To CH3PR11MB8520.namprd11.prod.outlook.com
 (2603:10b6:610:1af::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8520:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: ec495857-d0b7-4cd9-309a-08dee6d4eaf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|10067099003|56012099006|11063799006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yE539STgd1g+Svgf7Fr+y8zMPUXLAJKgY10WnNHedA2gJbu+flo+U3utrllra9BxAqviVj7H5Re8QxxaAC1g+z04y422x56gA+SZwIet75auMm0CjjdRwhL+lSMh0BWN6Pz4MsENr6GYWl7DPjIuVoqnHXYyPfPrAwGKJSbcY0rZn62uPL2RK2XORNX3pBkplqGcB8QWSp0+Di3govjtYTSqYy2pozzu3Hr2HSQXJ0gkzPqpNIVmW7RL6UEF/u2bufq3KNI7WEOUl0s67gU7HT9QQf1kAUj5N1DV24nJU5ojtvZhBe4zi5TO37x+yqAJXaKlaL1G4j4syVnSigo+IiEE40VOk8GFFhoqId6EisJ3qKbjhUsp6o5t0HuNBAU7BLdBPUnRttUbKYCSz5CnqHq9qLHk2OSpf3A0/b/biiDuWgpB84qpkRDaL6CCUhovLTbqHmAK+8GPX/pSqC3dlVyHAuQITLIxnJGB01ks+Y1vHJbaEbFaQroxawtV/dzf0ZWwCbr7LVqSVlIrNya7VWVeyximNTOWqG31V+sXq3e7ijc/WLwWj5yX4OSDoEOLj9A7f+Li/kcURGSO0FGfM0vTXn7a4KxIRif1EgPR5sjCRL+GxugiYywHYGFgRbDvkytuPp6nc2Ps7+DTdDj50COgZzP2wOfVHoJ5HuOnyHHESmnqQ06wd0whoiNtbqk5AOAlZ1Q6McLerLwu8erqhFmcMaK2RkNciy7lq9nKlro=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8520.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3kD6mfuX9DFbxcGQ3RFBNj4Z8Bxcti7laR5vPCL7O7TE4XUIOiDdUpDqWByv?=
 =?us-ascii?Q?JmDdV1W2c9v1o50sYPXU169oWM904KDJP8P8eeRe1tVMr6mYGV3HCnXlweoN?=
 =?us-ascii?Q?p2pFOiF/cQjruPYVbTaLJ4MKMDHbDk/kfUx+BHu5tmJeEuKrde6yyCJkYulH?=
 =?us-ascii?Q?k6lFjTov1Hp4druAIP3KOmNETUFZ9Ic9DmhI8fvnoroAn2wq3WYEmGWpaypL?=
 =?us-ascii?Q?of1RrxUOWQxxC+ylIiqRbmBOc5uVSzi373g8Df+TqYhTZW9FYJLE5Ma1itIP?=
 =?us-ascii?Q?ZIJksOgrUj8jUBJGIySQWKpB3DYnknJIXdOtJs97NMbOTrJtut7IHrI1Z1JK?=
 =?us-ascii?Q?irsd7Qt7C2yb7Gd9QJMWuwJatsmCdPMr7aUN9Lf++9hdgtmVtXTLopPGPndD?=
 =?us-ascii?Q?zWPUwAo6fg4Rhl/2Z3aVO8UY6qdlkOTEGnoJ+d5jX4VaUmUKaJKeOBc8GfN8?=
 =?us-ascii?Q?+HzVbnHLESWrXbbiQgYOIfdrhP6Jc2HeIKdnMZff11v8AdktohMi8wbK1sUU?=
 =?us-ascii?Q?pYvkaKucJtyO7WqGXElFkBohkUpzf/ZXQInVL38AOlU4MJRncGpTz0/E01UP?=
 =?us-ascii?Q?o5FzS8PkpjeAWYyJ7sW0pu2kDPiFTfIp5x/DD2qjlrszzVjCvvQoE4hb6iCA?=
 =?us-ascii?Q?7VkG4rTBZVsaNrjXmXOO0rnUn8lC563PauxMZBBxA9YJTDL32Is5DBeaofbm?=
 =?us-ascii?Q?WIWm3IZutkNzHaQekwvQSvrmBY3VEgvMPpDLOr2zZ6YvKES5Ovnr23/R9PtE?=
 =?us-ascii?Q?1mB9TG6PhjYkyNbighHmPtivXUWBDhL702UtRocZ6gTNLVN8VPIRJAoGpYhH?=
 =?us-ascii?Q?wrJ3OJThK6kFAisfs+B0m9wBV5aJ2rc3x89i+x3eY8IZu0+LvCGN9rvpcyI3?=
 =?us-ascii?Q?jhXeYrUTXQBAyfgmuFMQRkXOJaNjSpQl8Qf1omeOFjb44IxVnxpVCWwhqZ7n?=
 =?us-ascii?Q?oW64baV63oUmWg02zWok63dJToH8n/i4dopUoQ7UX/OWYVQWxgtxfPAZ1EBp?=
 =?us-ascii?Q?ranwwgscFvHBcm4CqU0G0QPepPOtsugZZ5LrWntTE8wEH0+vD8PXJl8+0NWm?=
 =?us-ascii?Q?+Sl6RqktT2vOiJ+mGxWn6rry+JhWLqV13NgeAOnuNgXvUEnrWgKLoNlA7Iu/?=
 =?us-ascii?Q?X+IPkxQwec68gThRLvBNKTJFDZhbl+kCrFPw9yeyCpWZeAhzdSJ17c0QOGWY?=
 =?us-ascii?Q?+g1hYN+QdI59FQJQts6BkVzgQ5loSYtLx0mkTF7X9YO14qZjdmHRxqQjQz0c?=
 =?us-ascii?Q?hiyq5bD/n6i3EHF9j4Aybe/KIYx510eYTn/EMzU0/0XRbm0VSK+F5DEgcgi2?=
 =?us-ascii?Q?JIiw847jeWBjnb5eO2qyu8E1JaLn43QQDK2ItdkEIZkUujt52uLOVUQnDj0s?=
 =?us-ascii?Q?uVNjgLvDkBYrtbvxMADlDGqMJ1ZPE0VCfeJiXU77A0NGAqc5jdS/4DLhS1Tv?=
 =?us-ascii?Q?CpvpINABGCe2tjJ39wtIVcuBNBtSqg/tOupUkcO1aybh4zJwdmQL38X/d+Bo?=
 =?us-ascii?Q?Di0ooBAw08/Yf5kLw2anplDlQCTGFvDauQi7m4Z6rNugvZ8pttCz4TXVuE2a?=
 =?us-ascii?Q?nnzZsoKV81Ev2qrcyqw8nY3kORuS5oBx/JDOP6qS1XdtAnXtJnQ2U7zY7L/V?=
 =?us-ascii?Q?qkuBSD0t7TLW52/S71a1/lAm2cfc+02AQcl4sbWK5PXkyNrKkNc1RVNNa5Ls?=
 =?us-ascii?Q?EqfZiwf6cM9BrDgDMJ/Y13Xxh9uq3gbGqLfAARUqYOTNk9deH+XVU7YM4R4y?=
 =?us-ascii?Q?cYNrf3hxQaZK9ZkioTsUHQIN1g+3R77Nsve4bcINTy9DPIx/9H+m?=
X-Exchange-RoutingPolicyChecked: 
	SSZX78nMM1dyRaayCSIiTJTQLOFokNk+BJn9AqViEvVLReIow2qKtr22Ujo+LPfm4jQHzHcy09dd/1hcrLe9c+pE/IgM9nnQC9bho69CHYvGg9I4qutlRtXEqPvg/138uPo4gOqcil+hwkCxKc9Q6FAsjckPpZFsvKdQK5mmYM4aflnkWJLYsfnfOR1VLhJBQrxP8ZCAB3TbpCiFo1ewqJLzCFBqVjVzq1eBWBdJiNqBMvcU3NrbbOTM1se37KDILIAGw7HGSu0NkLDyXtcwI1uM5ZiIQxNhG8xEk0Wri4L69+GoxElsheiwxfPak4K4MxRJLdX2U6Rl5wEIdSqiEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec495857-d0b7-4cd9-309a-08dee6d4eaf6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:05:28.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+q0oxMQd55K54KozY7fw7Hbmj26eDhLLbd536vbkzQBGuSLwH6EcJppVrziaO8k9GuWmmWj223+p296D4j6qoqUfi5uFRMHXikSWPxPKOgfk9coqJM96GBnueHrqG8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyOSBTYWx0ZWRfXxHhdCtgcaWHc
 fQuLCB6uVvW/q2jSL6DNj1+z0cTgUVJxLJ0SMFLVWt9ckDD9vPw7LtEsvw8tDdL3VXMkwcDWPI7
 wiT73jvZHQI8obEhO3SFg8Ek/TnzrtuNensiwD5wmtMjJfDW6zpg
X-Proofpoint-GUID: faRTCFGr85tujVdWx3uI3Wf-tL-SIdbk
X-Proofpoint-ORIG-GUID: faRTCFGr85tujVdWx3uI3Wf-tL-SIdbk
X-Authority-Analysis: v=2.4 cv=XdO5Co55 c=1 sm=1 tr=0 ts=6a5ee1fb cx=c_pps
 a=ijphbjn0GKEIB6My7LrvAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=CBlqGzEK4ygCB9T4gdIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyOSBTYWx0ZWRfX0LFxASn7vKCg
 AUq7rAGuWgviuAecsaT5zKA7OOFIv5ALlrlbNfxuMw/z6RacNtW2GMQcz30cyKwKnu1+ODeZyIP
 HYR19IazdLYwIOaFaAWBY1K24slPn4XyYSxEruaAAZYKLs6sNlGm++9jLHkEbGkrc6deKv0bCpF
 6gqihlbTpnsy5MhGga5KexBj+RaqQEssWIusWAydblPX/NE79OxeX0aTqenXWiwGSjZEdMoq4xb
 SC54ls3ghrIceSE+p2teqxas7PxNVKnccTw9qw0J1JXGIVF5AaqSoK2qtXSe2E518jZHwVO4hfH
 LfO5oMRpXn6fDuCI4ib9nKeukM7IUV8l3+Pf4Cw5ccDlwxkTwwetbAo43qYUamyBeTM4dRFmYdi
 3/ckq0OZ06/YbQanWZ0dD3NPgZDwbp5YezBorl7lzWGfw2ggktiFR5dSehT20EdYCL23w6h4jYE
 k4ZpqFKQWab6UaXuJPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 03:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241494

Disable ray_tracing_position_fetch sample by default as it depends on
pica_pica_robot which is licensed under CC-BY-NC-4.0. This can be
re-enabled via the pica_pica_robot PACKAGECONFIG option.

Add do_install to properly install the vulkan_samples binary along with
its required assets and shaders directories.

Signed-off-by: Priyadarshini Babu <priyadarshini.babu@windriver.com>
---
 .../recipes-graphics/vulkan/vulkan-samples_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 75d7a39eb6..0ac63f2068 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -29,8 +29,23 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
+# Disable ray_tracing_position_fetch sample compilation by default,
+# as it uses pica_pica_robot which is under CC-BY-NC-4.0 license
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pica_pica_robot] = "-DVKB_ray_tracing_position_fetch=ON,-DVKB_ray_tracing_position_fetch=OFF"
+
 # Clang is fussy about incompatible options on aarch64/x86_64
 # x86_64-poky-linux-clang++: error: overriding '-ffp-model=precise' option with '-ffp-contract=fast' [-Werror,-Woverriding-option]
 CXXFLAGS:append:toolchain-clang = " -Wno-error=overriding-option"
 
 COMPATIBLE_HOST = "(aarch64|x86_64).*-linux"
+
+do_install:append() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/app/bin/${TARGET_ARCH}/vulkan_samples ${D}${bindir}/
+    cp --no-preserve=ownership -r ${S}/assets ${D}${bindir}/
+    cp --no-preserve=ownership -r ${S}/shaders ${D}${bindir}/
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'pica_pica_robot', 'true', 'false', d)}; then
+        rm -rf ${D}${bindir}/assets/scenes/pica_pica_robot
+    fi
+}
-- 
2.43.0


