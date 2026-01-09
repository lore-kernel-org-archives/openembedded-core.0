Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E1FD26D7A
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 17:45:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15887.1767980742164720679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 09:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HJsYHqnY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5469a3f714=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099Cjmw2153270
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jan 2026 09:45:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=LyUn/lgjUB0DwOi7AUISv1M6PxHpgipXpKbxrqRpVdU=; b=HJsYHqnYTA8b
	VTOPLAbPrcuBeAz2SfavtmbroZCDCrxgjVY9BBy3iDV54DxZvJhDd8NKCWFRBGCc
	tZTpTANXtoHEuoIathlR8KCgvfiRl0W6F8+EdB8TGpG0aSo9Yha+BHmCyWNJAEZQ
	F/VLdhlbfi/nks1wDfrKhMTOXZYHLUupLeZ11veCv954COz0/p79w8qI9U1ogVgb
	NHDnEYdeEeZ3svhrsZZNkeweBgwZiCUjcdhATkpyYRt1zt6GTJTLvqP6KSpy+tir
	Uk+Y+yUAuB5yERxT36L2BwLHLuHfHJHOb8L4wp0WQp1dZez9CHzMImkmBbwnUavy
	GISI6sEFtg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bf3gkf6ca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 09:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjSLoiwezYmonH5RbzyexnvNnDAhyNjZ31EYITLC/9iLDTbnKldAlIt1lte6U195adKQZLfp8o8Ck76/T2sG4v/rxCrfKP9+dZhCSTHNDV+biOQwrFdm64EbX0ueZ2838s71S80PNzcpw7vWPLlehBflzNebpc0sM22poRKAdAd6TBB8av0O3ZQxUPLkVtZv13B8ll5wb2CfKw4e1mAEK5vtq8+LwiSF9aRwqvYZGWL6bVoqJ/RICMuqe6Q7vw//8Bn7GAVw/VWw/1UZGkuu07+GOF91vqDv6RY9D4e4NZEzMJPjxv4yvgXiwaR+ATXK3/hHQiqw3rSxENL6PTd+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyUn/lgjUB0DwOi7AUISv1M6PxHpgipXpKbxrqRpVdU=;
 b=JU6R+sri1qx3WQT1rIGDLnEPr+bGdZ049kZrSeCusqNGhKxrtnY28960zLz0LMoCHALQ1J0PsauXAJOl14X0PTy7fXCMk6SvNwIQ0pIfq1nBjNcNx/6X/U+IiZjK8YN23OVJTT0juUlyD7dwrkDj+dU/tTIKwBnSF1AtWFYWjR8dCLz9T4N/PpuYfaAihkV7lFOKtwFwEyM/paWd/T3l3idvKuXQuwUeuMayEEI3ooZl1oJEFPGCOMRLVQ88FI3M6hZLiMeUt/RiBpEJh1F58gH3TzsDGvlNuO5zRpb1sfK6IOUVM2qv2NwDfXX/Kg/qerF6fbrK6aHiMSm4qJGGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 17:45:38 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 17:45:38 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] wic/engine: warn about old host debugfs for standalone directory copy
Date: Fri,  9 Jan 2026 19:45:19 +0200
Message-Id: <20260109174519.1375258-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218101524.703244-1-daniel.dragomir@windriver.com>
References: <20251218101524.703244-1-daniel.dragomir@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::23) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 652520d5-324d-42d7-10a5-08de4fa6e60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4kH4OrS+mUygjyFLBm+/2jPphAczLc0EfjeNoW3sJtwZ1lb4v93rQV3mmltv?=
 =?us-ascii?Q?Bcuih9LpQNzYMloZGFSP7O99JX07Rqlh9a1XkZSACVRMAEkjl0+s6nWGZ/YP?=
 =?us-ascii?Q?CX1Xyq3TviS+J/ux8soOWthvOcPmWgSwcLGigW1mxoXKgG51KM1cl9ICJoP6?=
 =?us-ascii?Q?uSiPG2odz/tTYKjHh3hFYDLp7JyZURMzO70OHd15E86bzMetQ/e1tTpRDPQi?=
 =?us-ascii?Q?ZfbegV0XQmebty8u9lS9npx4VpqOlZzaCZ/rzDFiXSITsD0cPPGT5nBVeFk4?=
 =?us-ascii?Q?a7t5S8hSc8fsI6uXdI/cVuFgK+L0XJJCPt1CYJNbSGJ6ocjbSToDuN2t2cgK?=
 =?us-ascii?Q?NNJ7ZU107uGDRT1tnhiSUMQRqC+WZoUY7Qg4pxRw5wghcC6z9u18EW+1Kl+t?=
 =?us-ascii?Q?1PcVKtT89vUUmk9aBsDiSfftoeRL/eN3Zs7H13xaOTRG0ErqZT+3N2KmOZDs?=
 =?us-ascii?Q?Wc7STOp5k9LE2gSQ9+0SkKKG+eWiVfbx/6CrOSP1fKsiCZCtr6jHySFJD9pN?=
 =?us-ascii?Q?47yjPSdyW8Ph12r9hMW3/SmA/kkiuG/yA5tGDEvoT4REa8lznogtqj0fUt9z?=
 =?us-ascii?Q?LKeCg0VG4kTybSpVdAG+VsyfRRHLzxsUS7IOSH8wnL/hhlxIgwq7gGHyA2Xk?=
 =?us-ascii?Q?/XIj/pHgER0U8SyA3wahESwmNqzmBrJwb/vOaT3ZQAhbDfexPnkWUF+YQKYO?=
 =?us-ascii?Q?98Mwa1ZHsSORHffhmglYJV4WFebzRQLEVzWeepODNL7cdLDYCTKXqF2Xmnv+?=
 =?us-ascii?Q?rLFTX3UCnLYa+34D0wkiWs5F1c+kKhXeVf2JIoBu+6Hn3FpN6xIpO779EO5b?=
 =?us-ascii?Q?zCMyWGH0spBXsuxJMl+4te2hKoB9MODepbqED/u2uZQr7j9TxavHxgT2+Rjl?=
 =?us-ascii?Q?Dl/sjK2RTZAykCQBGgyzQeQCqR9r+gTdKMbI9ZBn0uS3yvA8iCYDYg+1hIgK?=
 =?us-ascii?Q?r4LoNb0hKlwoarqi4bMTU55dxBh7g8+qjsqIHHSgT9j886vqAmshrQ6QqtiZ?=
 =?us-ascii?Q?aG/xCaX7N5xx7/UCooCof5TLO+0sBcSU+xtz3mXHWj8aQC53Q/I4SWoyZoVW?=
 =?us-ascii?Q?VYhMm4dVrSveIsgrYWamnzvOzUimQiAUQh3w0sEsFEn1GapfgavbFXMwXELw?=
 =?us-ascii?Q?wJQPuOxB0tmvY+9cqtZnLfjoTJdUBvC0QDarHVZJ9YWj4NkJFagBSoSV/z8y?=
 =?us-ascii?Q?zcP1hK8V2mR9fPYjWfL9NdNmjjkXAQfF6uPU4+yXfUA0WsFEgsdecPVR1JFe?=
 =?us-ascii?Q?TH8pz/NW/Y4aA6MXyTrQGZpmWsOPElcdp/6uXkb4qaydz3Zo00EPHp2V9sf+?=
 =?us-ascii?Q?gZqtLBJrnBYl+cQrIAImueX2NuTFt0VWvrXq77iqO5EJoS8Vyovsz0UMCzhR?=
 =?us-ascii?Q?uso+a7kRYNMTUJWEqaJWxYef8FvducVFPkPlKgn937cfF+gpR+tJB/USeGeb?=
 =?us-ascii?Q?Sj6rjg9TMezNY7RBEqR4rzyU7RMUnQq9HGaFOyXq1+dmvGPccSL8FMAyzWN0?=
 =?us-ascii?Q?kjXMCKxUghx2QkKTB3MBY03JWRWZuCyUET1h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3i1bYJKScYngOVOc3kUDXVkizYkNz3fZlX5rI6ZkMAeMusNlUjRFq3R5JFp9?=
 =?us-ascii?Q?S7qvWuate4U/c6f6IKqOMVrzTypDt35xCcPFclaqcm03Ajd8XD3t4C/rm0kG?=
 =?us-ascii?Q?M8//6squv1bQFrlrD+0K9jhwNLgplx5luXVYFfDYceqmf+6I5rDzWxwZIfbl?=
 =?us-ascii?Q?UcLpmmgBbZJbWKRGvqObBvPg/tGjfvFINC0Dg+QNTSXwtZi7k2pxrOlUvu2v?=
 =?us-ascii?Q?Eunp/6u9nlOAzm5ho9h6JA7eo+moCu45LBrOG0LfceOME0LMIByuXCuv9wat?=
 =?us-ascii?Q?ZiLW/OBkAEJ6IJpVCyv6W1fx+AJPVtQGHDM2qzpAf+Roftg9qOQCqU5i1mcf?=
 =?us-ascii?Q?gJUUYPaB5/zv4VKYrddIIufkXrTkE1UlQV0Rnwy+LSzL0lNQ5oLnMo/4Slbc?=
 =?us-ascii?Q?Eax8rfJ0wpP+Mn18IkLxDc5LekvQxvcCtLcGM9MyfnWphV/jPYAK31PuyECi?=
 =?us-ascii?Q?5UhkEUExGklfM0VzHN+Ra8DgCd6m9MXmg0lXlzdEecNrBKOQ6PmsMyAlhXC4?=
 =?us-ascii?Q?Rs5A3rlotx45ex4SBtiUbSFyQ78Q46J2vudDfCqguJmDlHRpohVKqfpvNTH5?=
 =?us-ascii?Q?LPRpHMZ9xDeb142mT4igdXnsIKCfcYfhlbnRjmB6XoWT31DBQOdKbROwuOsU?=
 =?us-ascii?Q?xPtdFHobEk/BkntL8lA+IfKPZmVQR0HVScnzSPnelptr9won1uzQMio6JOuo?=
 =?us-ascii?Q?bEVCCPH4VZ2er8EGnYcm6T3i48Lq8k2kXJ4+eBbpBrMUdByB2+2zyaqC/RGf?=
 =?us-ascii?Q?3HvBtyVQ/Y3QiRvcDhTOzY3MJ9miwaVvHRn9cGa9Ye8eUjV2fUuwlc2Hfk3a?=
 =?us-ascii?Q?M9PX+OlxYCXC2dwR/V34xiVghW8uthNhmVzDlZWcPWrnPpODb6eRpxz9Sa7o?=
 =?us-ascii?Q?FhBnkjwfsbfsnM3VLklMEa77k8l4wrqTsCDTaJ5VfulZFm+FNJR32blWt4LO?=
 =?us-ascii?Q?3KJjp5zREemFhQSi0NcnCmzlfu7kyAzsXlZOsEXEZE/RldS76ZszvA6k3vJv?=
 =?us-ascii?Q?dpWjVD9ypqualcQA9RiG7gV6KemWvu3thiqeB02+NUIeDtj5ruz1ryYL+1eh?=
 =?us-ascii?Q?hq5kuF0i7f4R+sp0kVJDrM9HCPs8akw3R3N42QibArj793ZjKkSoomtDXtAw?=
 =?us-ascii?Q?nGqvY/x1HZfysIiDpVFW4KiDBrrK1Gj9OkAcYsRlvB72FKBhGkd9N7LFBoIv?=
 =?us-ascii?Q?nIq4kwqFC+GAbSlcYumNECSmQI0KmpWfktGsewbyenz+J7c8WZxL0x4bsI0p?=
 =?us-ascii?Q?cKAUDzwQBJte4+QSC3qr9kJ2EM311ckplEUpjJz3njcwIULcrunwbfbR5QDY?=
 =?us-ascii?Q?rUopaKm0KfjM7jTg565Rh9WT/WIS/Hr4YGuNXx1rWWya8/wy/sZoMqdqjQYk?=
 =?us-ascii?Q?W3mnNki4RUO6bRIy0yVOfhb7QOQTO2ou3u8/foNa+dgEoZK4twMLM169M7+r?=
 =?us-ascii?Q?HWT/kD/9yQmHSSq1MwV0HxNf5sXXawQ9Kb/RGuH+ldx1gBF9sWPmP5bfuOzh?=
 =?us-ascii?Q?SCrmdfng+a1JKSeXUntZv1S5zgy63xOTPGUXqSeIlBY/YRY/k+r+DMWd3WRL?=
 =?us-ascii?Q?F3frSXcfbt/xyh4nbyzOpbWEvLvMxM5KZcZ1BCnbbrv2Hb6xQeeQVTYsXBF2?=
 =?us-ascii?Q?aSc7EtUuEq/XdAt/3r448c9Omkk+4o7GPrcixU3rjycyP6RWbXTflB5Q+Ply?=
 =?us-ascii?Q?YScL5c8oIn+1tIsiRBgyELPjT0xCfHeYadST6gSELLBNQpzNT3OszFkNMN8j?=
 =?us-ascii?Q?+dOLp6FfiQb4oDvLL8Ze2HP0Ihh5lhA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652520d5-324d-42d7-10a5-08de4fa6e60e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:45:37.9288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8Yjq2em3tKmdkq6h4NT01N/1m7zwxE/RhW7S6+AYdebiffD/3NnNq0jihrpKhX1W2rTZCTWojZjKn/Z/hgyb6XzcHTorHN0q0Peu/GIQfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEzNSBTYWx0ZWRfXw8eLICiVT7lF
 3rGyV3bZBJjuQnRcfn1HNvGlVDh24sgVLyq5B2jbUupQW1c/kgtw1pvNwkZd0/V4RU/AHktM8Rd
 EhGuRC9EDQxpvm7fx8uXzrvLgRrw4lde399ly/f6FvOZmY26oULn06SxoIg1LJD8DbgERI17Qxv
 864jh94eLBTDmA2AuvZa7t2HjTUTSkta/Z6PW+8nXoq9xJOWugjM7RGj0YDf0zuJDhIEkoa/EwD
 K9jSgozE4cedUzvlYXJSo3kEEGNq/co+QfdrP6cuwASR9OjxE8/70IZ5dt4hl045gKOm3AZpOdQ
 XCOD09Niepo8+sNxzNbGwYRN89Ln5KaETARJls1DpjrNvRqLMzMx7jKyxxxXYqKsUIHQ+o90eBV
 mNFWRREm1AKlufjtPAROSL6kFsJw7kXfL1rInSq9fhA737E/2vgHNU5kuo2iBIHPF3dajbVc/cf
 2mURSZNXAgHVncx1R/Q==
X-Proofpoint-ORIG-GUID: pIn7xOBR6qW05Uv8xsl3NOwkVPcOcypd
X-Authority-Analysis: v=2.4 cv=TYubdBQh c=1 sm=1 tr=0 ts=69613ec5 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=eUBKwln-REtu_DbdvHUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pIn7xOBR6qW05Uv8xsl3NOwkVPcOcypd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 17:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229143

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.46.5) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit a warning when an older host
debugfs is detected. The warning is shown once per run and does not
alter execution.

Changes in v2:
- adjust the last working debugfs version to 1.46.5

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 scripts/lib/wic/engine.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9d596be3a7..40be6f908a 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -222,6 +222,42 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+_DEBUGFS_WARNED = False
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
+    global _DEBUGFS_VERSION, _DEBUGFS_WARNED
+
+    if _DEBUGFS_WARNED:
+        return
+
+    # Detect version once
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    # Compare and warn once
+    if ver is not None and ver < min_ver:
+        logger.warning(
+            "debugfs %s detected (< 1.46.5): Directory copies into ext* partitions "
+            "via scripted debugfs (-f) may be unreliable. Consider using a newer "
+            "debugfs, for example via a native sysroot from a newer SDK.",
+            ".".join(map(str, ver)) if ver else "unknown"
+        )
+
+    _DEBUGFS_WARNED = True
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -352,6 +388,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []
-- 
2.25.1


