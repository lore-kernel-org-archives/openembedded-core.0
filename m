Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C46CCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17688.1761218836116833297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hb62JAUX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5enYk3244895
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:27:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NkygJswz+wAWHDc2Y+Wph7efIL+iYJcf32jHyUPpfG4=; b=
	Hb62JAUXNtIxsONZ80b2sYmDTDW0iEUA/9eDogqzorAFEw5U8QfEzfHksJGSqDsJ
	ZgODU7zuW1mwyA3Le/Fot5CYwUNkuDzBV/PWSUD1syI2qa2YDyuvcUb26L5aZm53
	U8VEzui45Su/iA8utrLiBrQNpNE/ig00fcPRoNnYH7TPh6JxEtj97RpvwEg0u0zP
	qTsRgwiVB2DyS8CymVJpenU1rzi7o4DcSvoPsepFZP5wpvUd+F3ugFE+SlW1nYaG
	PulcxzmkOZ8XKboNLziSq31cVx2q1OPXlZs7D8Jz/SRIcvw9sth70FJfCmqUTTgM
	dSRmmhaO/Z2P8t6Su62R0A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj5may-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWan0m8r/dL8PEg5m8PW5x9MuUOsHaX+yMsU3gAWpgCtlrs14hzngxY+Y0Onjr/i+xoZ9OjenbhAETcXzX6XpCM/7iBOuGoM+06G7nrwXa5bW/s+tdxuILL/lDa2aedt5bjX4AKc3voHvnH5TyiOCA7PiKhCvCEuIpSHoJmRqHVBnMEbPmPV/mRdWyWIFBRLElJ3jHTxfs3AEmBbgs8Ce5+gpNK0wRC7YD4lv0zII97yIZM7kDzh5P+L4mJDdYvIhAYZ9MfuuXbg5EqjPbXNHDSG/vdxSkNZq1fnf0e91UACqa/28JX+zLtf3X32l4QHWuppp5bE4RiCDDf4XeYL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkygJswz+wAWHDc2Y+Wph7efIL+iYJcf32jHyUPpfG4=;
 b=PCLKWZ5pYJrxr/XP5K7H8MmoBMwU1n8Z1kJwBBdN/n3/4KlwucPQsJfVrlmTRBkdlVrbE6/SPjOnZaUMRKrY2Py6hNs5U6rJ63BaIuf8G1BViHzTdi90NfyFos5L49wxnQcdMSAgRp1OTb0pP6jae3q4BCT5yJ8/eJrQQVYumRULuAbAovzJPG9C/Bw/1qnrLLFZWorynIODKmRDekbn/FCJgZ1gn4g4NCRYngyOH7jY+aYEtWMT40sw9bcgKFEAmQ9YL8dWp7JYezsL5Ftt+f+IJAPAz+FI5nY37bZ3O3PEAssnGHGNYx2bmU0URyuoiwMpTpnmo1oMglXL91UsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:14 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 7/7] kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build
Date: Thu, 23 Oct 2025 04:25:47 -0700
Message-ID: <20251023112547.4044904-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d31101c-9f9d-466a-f5ca-08de12271d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nGm/tqBaK+3fqXMmd9Dnxp1qHW7XgAokqjwozNc0ilU5+gxqgHGbsjO2VtmE?=
 =?us-ascii?Q?4vWF6decM+3jkYd4A1A+QNABslSwCNvpkHuxYN/0RjVmVknxTjHm8Z85HcsN?=
 =?us-ascii?Q?Av8Iaa56OopdObtrjRgqVnyBIUW3OKxzyYFMSMEBdnD1RCZFFpVl7B8sUcmP?=
 =?us-ascii?Q?q2DMPtqQKwYF8uzT4J9UqY2t7mzpD3kadaR0srnsHxpqDYyUJax/1kK9h5DI?=
 =?us-ascii?Q?TAfO/0k2nkOaTUJu3wxt+kGXpyi/OfmoVFhlKzl81Oq4loz4ovSofB9Bu2bk?=
 =?us-ascii?Q?SQf2BYKwtA9+iUxFEveC1WVJFdefvvY5Sdw+WXZ8pUDX+YJURtvM9kC8/azO?=
 =?us-ascii?Q?cBokGIqf4HPamlfWyTeOR3WEk0pjUgolIlSRMHLeoToLtc8SzmFDy+7H85C3?=
 =?us-ascii?Q?w4XkLX14OVQipvYBGnag8hzrCZuWDyj9VjjF1dUkND/O1C++Ouvrmvps99/X?=
 =?us-ascii?Q?sdXNwXJ8q9mApxecc1YrK+1QfyXpVmc4FQJkzj+zCZNpVPoPbPIN08fD3nwi?=
 =?us-ascii?Q?L834ucY5E8l82ri+wti2tnpwzi2iimd4E2jK1nt7jcfH20acj6rRXLORMiSg?=
 =?us-ascii?Q?bkoU2+nw6CqpsLCeEXQsZRCZvvdjA1EacBFaNhz0i+r410mrv4rUjc1/NQQM?=
 =?us-ascii?Q?GPLB/a3g1pjkZMS5T4qM3fMEFUCQuSDcZBrFrHvoV2Zh6BRruVV5kJgpUgZV?=
 =?us-ascii?Q?/1tSec3mAcC5olpp78IIJuCXt2CWbS36yNWCXkBVnNsgFAzKFjPZXiC8sNnN?=
 =?us-ascii?Q?hxEnPxXK4EnTOUfFzyISYWSn4twbBfqS8/VEGRbieuu6wiHok+IoaEqhOino?=
 =?us-ascii?Q?Xd4vfZKqScCgeaxma7UJ+iWIyyh77FWAsprQGS32IC3599Hwv0sFrN64xT4a?=
 =?us-ascii?Q?fYTKKWzg77lzHeW+EbdJf8+UgS59oeYvIkgFrqDOGbCP1iSYcdzo+iffFmPe?=
 =?us-ascii?Q?dFZeR3xnVqXxMfRuiLgKUpahNNa6rXfxG9cafDE46Fj11U2yStKrQINH2lSQ?=
 =?us-ascii?Q?oPb/f4iSQcVkaJXDv4nDtDP9D/ERB/sJ9edPAcsqvwNPLosboxfdwI/m57BH?=
 =?us-ascii?Q?AWbHCPC9Bq0ezLkHCxGsoKuQW9TVxegiGcoN4xFg8EjgOrjog6g0wW+xKUKW?=
 =?us-ascii?Q?+R+jOeajMXaQFHsqh3jaUkFbR0MON1h2mmty6gPYu5LDL2SNBv+S2n/8Il7m?=
 =?us-ascii?Q?g8ogAF//T623sjNhajKFlwDA3ctNNm0NbMzxT85WES2vtVFfcq4O1Mp3fnbW?=
 =?us-ascii?Q?oOniVxcAR8WGi1N0KeIU3F87oUgtxVbmyN/kAXo+gDUR6a57pWZlK6P0JYNF?=
 =?us-ascii?Q?FlsMreN2vr2Ju7uE/dy+n2o+lx6pK3+9yiC5U/kxCAdPg3MMlG39cuQ9964J?=
 =?us-ascii?Q?QdJUE83U4SYKUjOnU9R7xjSPZyscFTqTAA7uX7ce/NZTdxeM9AN9xzorRFzQ?=
 =?us-ascii?Q?NksiZWzJD+R1y+tnj78p4BwyJHvHWTlUnln5l7XuhClnonphF3RXd/1lNEiA?=
 =?us-ascii?Q?bZ2OOT6melT8Ef1ZT6uoBa0W/bN2BhFJGulR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2vhal2TidMbkPwunUGhDEy9vYkl+AA3ryEztkE2l5dDJgE8AFaR491AUwMuI?=
 =?us-ascii?Q?MdACVhbWacfv5cP6F1lQ0qMVgsR3V9sQXeFYX1rvP16kCLbAK3wnM+GOrqwb?=
 =?us-ascii?Q?Df74O+QvBMFWQATwnsiLq/hLan3GLSwtpTkN0P6ZO/OW/+I9i/f1oSjTVOyR?=
 =?us-ascii?Q?IsZvoKUPFc7W5AtxfWnvnrfUDglnyUxeXh6J5oMTukE5Z2PXrm+hqcOqRxun?=
 =?us-ascii?Q?LqWSd08OEdgOBwOVK/8Nf1HWMlN+uMLVcS4WveK95facujh2WQgWk63CGeIQ?=
 =?us-ascii?Q?DwF5CQxGUHF4EtnQRAnT44aq0gVK8FovXp6Id5NmB/9weq9VkKiVebgVk5jD?=
 =?us-ascii?Q?j5DaIS1uP3w7jdw+StcgFxEktTbd0iQOzwTN9k86ElQ6EvPQP6D9rDHikrxk?=
 =?us-ascii?Q?lIU20hRBY5PCrD/t9t/TNvlqSQHOwCGM9InvB8q52cyddG8R1LHN92G8BFzJ?=
 =?us-ascii?Q?tbCFdANFLThaz6Elldc8Mj7Qe4QxbjrIP8yfmU5bsoIxqxoq2349MHNtzgYA?=
 =?us-ascii?Q?18xr0RI6WyJzKT+3KEs3vru/VItuKZOWizNN0/EfxDm1TPb4PwawFoFRGpAY?=
 =?us-ascii?Q?aAZNNbVevyiTfFZtoT9IydWlBzG84Ne/pfBkwyQ2BapZljwmXR1nJTWkFw63?=
 =?us-ascii?Q?uLN11MgFPENsRYktgMYKT0Z2dktRpMfN8nYE/MxUW5LMyCnrc4xGmBDHV3dN?=
 =?us-ascii?Q?7b9eqcsoLHVeCwldxOqqieS85Q9M/OdLjce2WTPo6D75G6b9sG7tmFV1X2Ou?=
 =?us-ascii?Q?h7jXoHUWfyt1U+wc9Wwyro8Y8kqNLXVXKqCcVsu7EwX6JEqcclefJkSyTbdA?=
 =?us-ascii?Q?Vs0qq/V/Kq+fxTdnYT9+IevybPg4Vl1BwuRioJLEZovvyO870n54lMBgr4VA?=
 =?us-ascii?Q?mGBnVWidTaCzaRV5G5xvc31uaIYHH5GqsValjqXNyaJ1Amt0dQb+nXSPS/bU?=
 =?us-ascii?Q?iL01MVa3N6vmjkRGVQw6XeSFyHVtI2bjkX5bWU9RQvFfGabLTFbEzUZPfngN?=
 =?us-ascii?Q?jCDIsMY/X5IfEOFIOJgOus7Hea5EUjrknyje5ARkjG90wrMd1VSjRorJvYB1?=
 =?us-ascii?Q?sqDxHGrxq6+xeeyoUDKgfti6y51CGaJYpKxmXgy2bulcvpPKx0GWdMkCLI6O?=
 =?us-ascii?Q?FtIAm/eReyspeY2gr6WaldebdPBlkpr0Oo0m/fttYeH9pbKV/sjeQ6wotbBC?=
 =?us-ascii?Q?VAiWiB81Hrj0jD1P0qgjUyMgN0fsRJgRI18v190x5lh0Am6SLFhYprYjweXv?=
 =?us-ascii?Q?XoDMAg6QD4+U8o2h0UHulxv15tnX3VfrnxAwI7qqnFx73QpQuUcrmRSxUtel?=
 =?us-ascii?Q?G05xYfIJuAl6g63WtrLajJS4qxUDsYYnK8grb/tgY0/7GogxtoyF8J935JDU?=
 =?us-ascii?Q?fifcmDGKGV7A4lFymWvoX4YK+EcfHq3k2G7UOerhBDdRGIz9sHdo6kTe8CbT?=
 =?us-ascii?Q?Krtvv5FrI+kMDhb7Et0ASDVWPmuWzst2Bi5MmQbUwB4jFAxvJYnZpLxhW28s?=
 =?us-ascii?Q?idv84fTcuWBEnaOtd/TRG9a4UU0zKPxSjkG2XhRqWRCbIH7SsSvBPQA2RadQ?=
 =?us-ascii?Q?9amjEEPvq+aS7ohNRSNr6Ndl/HqrUApw7ujIphdavlYvoVbWKLedhHzdGiwN?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d31101c-9f9d-466a-f5ca-08de12271d67
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:14.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NS29drwRYDJ5Wjfy3LuLN80ivQAfWxCstAphQUVu/CsHHpQiuGheYiABWUyC4ES8eymeTjXqX+HrA6MP4F+7HI+hUIBl3opMk8ai+zLvOvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Proofpoint-ORIG-GUID: E9HtEnXKL6qjHfeYlC1GCtKVkteYwTj9
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68fa1113 cx=c_pps
 a=jDwMdcx0fGNsu9pFyB9b3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=wpxh2XU6wxp2A0zjZm4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX9I1KVWVdShFO
 vFA6t/8Ix7dJcl7/DFx479nPKDFRone+VF9n6knGpI+XnV1E6Apmilv0T0mA8+JvHuWwv3b9meu
 t/9+FRd2a5Y/UlCuYmYH4uLxhLBGo4/2zEVY9l8U4FWcYQx0uKLYxNn03hjcB2wKjrK88+OV/1b
 vwyAi8SiW+64qiifTZEcgJzKB1bo7dGEyPE/V/AzKFGAH+4z17ed28E8QnV5jzbjgtt7Emudl+d
 qwCzcbH1JmIK/6Q4EN7WQbY6PPnqBxAt99WQ5scOFQEWEPSrcKLqoVTrqLaSNeJq9F0o9mLoqOp
 iNuuCMbAikPAUVHb+RamJ6v2UnSgZ/BzfV+uvrCRgd0B/bP4WraDyOrn1enSQ2+cmj9q37DAyIX
 4qJ3Q+xQds9Y7zNf3mCawYCqvv6zLQ==
X-Proofpoint-GUID: E9HtEnXKL6qjHfeYlC1GCtKVkteYwTj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225243

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running make prepare in kernel-source directory after rust
enabling rust config. it will throw erros since only makefile is present
in rust kernel souces.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 04dd683dde..d0465c3f91 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,7 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        cp -a rust    $kerneldir/build
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


