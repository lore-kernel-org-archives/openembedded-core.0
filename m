Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE5ACCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18465.1760453086323264902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YlUDCtf+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5j2j83734593
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LZ3zH80OPA0Q/JJg2Bur+ic+9pqU3CqC7otxFXjfsOU=; b=
	YlUDCtf+k46WU6f9Jyi6ffscTQTRpQEFaRfq/leS57bCT8EoRLwzO1GIfuzB5NEg
	Du+XhPK8gjmhuW2lmRcsj4idj3IRTKS8veZJBwvXzOb6iVDQlz2hCweOAPlZBnCt
	7MzElpEEA9Io/mv/g6PAPkhHlmpJw5vqPghiNg9iXwyZdXjLgRWw6lHsPa+sX7re
	d6v40V6UlodGTDTl+OakUPSzRCn449G+IaZiQ6kEozHMeA0RWKpYhs+LCDNFalyY
	DD1+IK4Gr+troXndwXZkX8BRwTwuXooR55kFBlQzBCaHzpbR8HweTOVgGcSB11hU
	d49paKurb1ziWkKi9cp8fw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewkb3y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0txyakQmPRxSwMsC1yhTIwyWM74r3D/uwfOL/f9kHoIxn0SDBTrFFbjlxK5trLXusgFnCaX4/Ett5Rmd5S6uRj3xNzmC03XFrwZoE7OCvTM7dBwKfSg9NChTwgOUPx4kORndR2igks3as9lPR6l0U6Vk4drNhqCzRrJX7LunKQzHvE8wuTwsoAEdU7ruWHIxpgrdzTlnwA0akS4WzNF+lg0M34xN/wzCSX+CsNKZwEF8Y8xiGGSNhLcF4S8ovl67m/N3DZ50+W/65VgMvN4qAgYC4CPXF18Wn0C2FGMBzm9p4Q+5Fbe5IIfh2AoB274hG0Kv64ScgswDp0PmTGUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZ3zH80OPA0Q/JJg2Bur+ic+9pqU3CqC7otxFXjfsOU=;
 b=Es/9cD9r3OHjZir1akDTjZgu8gP3gztJzLvRJUtseHjy5fFx8zhk8ujCynS6+ma0SeTms5tIUz6MDPuoob3PmWNvbbtx0JWlEH/fPufaXxUjImWgTd3LTvPo2evWTIYf+qW7Csg8hdWzEMy2eaWCVTqgcuxjINFuyUq2dDSb7dzI5UmjTIVDY+NLUXJYk2xlq4i+HJZjeBYJEoBrdEPQKLuXJo9QE0HmLb/JOYAuRReMJVyn4j60BZjydb94lPiInwWrbAQqHTyAByRTFCgzTT9P7PBltqHjkMLpLE953NSCA8VBJeTZ/NvS0LafnetLXMw9UI2LNsm/DFvqPwlLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 14:44:42 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:42 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 08/11] glibc: nptl Fix indentation
Date: Tue, 14 Oct 2025 07:43:44 -0700
Message-ID: <20251014144347.536537-9-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bc6653-ee89-48a1-e058-08de0b3035af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6XWiuiUQDaemRKFWx/7KU0Ou9+FSk2yc0ExqtaQsCu71mSDRdu1zIIjPSQcx?=
 =?us-ascii?Q?aq8RjYSPVjjq4e86VFPq+MD5ukQKomHnF4mC1mNR6vm/FkFBYJc/po3ivo1n?=
 =?us-ascii?Q?Geu6fV3HA90ggSmbb0ZLfcrAthfPuVaJrT8DNBIytUhfed9GdILy1VArRiMN?=
 =?us-ascii?Q?5yXbSZSF0YkKW4b+JCCgALiiod6sNZzq9ar/wTiOW37F9thfdFcXv769m0V8?=
 =?us-ascii?Q?6zvjAHCjzbmZqcy3cWieT6MDHweXg6dMVoaTyxa3wYAtSyyNGU5etYPiO375?=
 =?us-ascii?Q?R5pJOReXsFvZjdpo2yUPW8hcX3aZsF2YPH5Elr/yVp0VvwZ5gTW39R4zVeBU?=
 =?us-ascii?Q?YFggZgNx21AZSIq5pGV+UTtZJWc9kO6TwidrYmyx8mKj2e0/9AlUBlO5vwek?=
 =?us-ascii?Q?7kSR29lOxPiIb2hC9Ik8t/uPS7hM6L/+79Ao9UotMudzyH2XhJoA1Q1uzdrQ?=
 =?us-ascii?Q?k+WvAchn54IPNquKM+SNo5pp/GDdJsaFhCT6w99Ks6AfMx7/9ZSrd4vF0Gek?=
 =?us-ascii?Q?V/eDbXRzqZj+hKaUp9jM/sz6PemeXMJSJ5TF+pY0txPogK2UCWm8PGv4PHVm?=
 =?us-ascii?Q?wrmGeHl571peTlkpQ5S/D7Anu4abowK/fq8yUVLDsHVUAtNBS/xNHCBJM7gb?=
 =?us-ascii?Q?3Fz4D7BIDLBZ3oIUhQHsIrwUBnqwOUy1Y1JHf08St6KJvRAb0rwm+PESbUyC?=
 =?us-ascii?Q?3kOCuRs7ik0wcKWgG7y+vQJiSVuISVUOxNSn80xD1MfNRZmrbEqau36hCFQ1?=
 =?us-ascii?Q?ZEpl0ypwjsjFYJbxSwae5ynpKWwPM30mKNu9UcoPoWVCG8+Wy7GKw2d92Q19?=
 =?us-ascii?Q?/KK9ZH2bEVy1XVEN/hp6dXSBlEtgR7Zv67K6g9npzcBi0csMXFKo+q7CCJrA?=
 =?us-ascii?Q?W761soLpEefGQ77dPLnv6AZ+rgpX0z5cP6610c2PCIhPYYzSr3JzvwFlc7+v?=
 =?us-ascii?Q?1RQ6W5eOoh7ddc6P7gHAXz7ko6jZTRnWv4MTSfI2ASjqdgULKCNZVuEfqhiD?=
 =?us-ascii?Q?WW8IOb4ULVw/8oyu82rycQ+rzRuGB5xxZWL2BcbppNU7a5A8FnfAhcly7OYI?=
 =?us-ascii?Q?ln6JEIk72aqY6FX7/18d/YCVe0ReIDPg9jDc+8VytqKwDDXn/OJIWDf09S0J?=
 =?us-ascii?Q?bruh4rgvl9UHPJ+OCtsLIIHKoX34vpBoERwqdVbt1edVuSdPiB7v1xcxz0yW?=
 =?us-ascii?Q?l8hnS4sE9uNfuH5ai8stO5eTkXMG7xyLUcgMciY2sgPd2Qp/dkWf3XmedUgq?=
 =?us-ascii?Q?e/8XVsxL3Wbh5ONEr1acp7oJi5K6CkrrUZPjBH/dSFIWwetAfUoWGycp2A3i?=
 =?us-ascii?Q?DLs44n0EEvtgy60YfvyvaYYDAguMo5nKmb6yZdTf+FM5CnP6SgtEeqLqNXdU?=
 =?us-ascii?Q?lsprqesq/83mFPbDI8P6vDvuy8AALFzPj1hviwpoTFulSw2h013q/MawyZdm?=
 =?us-ascii?Q?jmy+KDG1mH7+juX//ICkVsDABD6A2PUyqOE98tvDtBNhNvsKOCWhWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o22BhOZfJY17e7hGFu4lQb7J8r0kVsmzc8ALhn9un4sCYcW3kTIrIkOu366G?=
 =?us-ascii?Q?kY8JP41jXXbmN2/9r1V7USjI8uCzvPvmiLAHL1uYP7vFDhn5DY4G6E+Bj/Gj?=
 =?us-ascii?Q?9wixHkLQv7xwJKI6cR9HqFbbx46hs0yDGIERbhz/6QBbCUR5YQRzi7yGx6RH?=
 =?us-ascii?Q?AzT/XC3AHxFuEmt1qYVX3BZ9CuLM1YYWGiocl+HzE7jAH1Cnw5g48FGzEzsD?=
 =?us-ascii?Q?bK1O77IxNNxC7jJB37QNaDliAg/85RXbzV35uG3XLMZWhUb5bSxTYq9ZPnqY?=
 =?us-ascii?Q?9iOB1MODXXjivE4wL6lh1dcdOuadaDtvb0EA9DnhMRunWTziznHiovyrwbk5?=
 =?us-ascii?Q?SQFQoDXXts4Ou8asjG6i5cMNJXCMqkH0hEc9/KeuVnUv9EgtozkXjGalobIH?=
 =?us-ascii?Q?BzXwkWEgRwQ+1gtLGqsaDGaoFqLKPrEqNWxKSqyKtBwHmZlxiXZZ1iJy4pAM?=
 =?us-ascii?Q?vKxORNJkIwje601n2KU0Ryco1Abw+DwSZ2Ev+TO89TUOcbrh7zLQrINJAY9f?=
 =?us-ascii?Q?Md4zy8n/1ZusW6EBrBaGcg24eUlAG+Aj7U/LKUJNUdbEOZPEpDoniV5KpF45?=
 =?us-ascii?Q?BJ5VmkYnIufBx9U0ot8eHH0/xxXjrNSNI5K00EbblEnZypOakaAzUjTIQID4?=
 =?us-ascii?Q?JRRiv6AvhNTdgAutHbHmESwDC4Z9qr6B2Pp+rABQlm34gIJTMe7YBLDkfI7B?=
 =?us-ascii?Q?b0g3Bi4IU9g7UFNK0QHcxcOjUEVFx23F7xYPCsFGKJukt/BQlzTbrVwDRHjw?=
 =?us-ascii?Q?q2ohVyy5KN/8ljbUrxD0sYgxN3hZe+s4DOFKjOb9iM5Gl8JZuAkTWuhGhgTd?=
 =?us-ascii?Q?VI+mRQo8nm9pbOz17e/VZ6sHNLdeUxbkVqRwFC9q9iPA4NZXITFk5fJTRBu8?=
 =?us-ascii?Q?ADuw023H76rUuKaek+gTe3eIenScWzGGIscSAeUaSV0GNITzNo/Jdxl26ys5?=
 =?us-ascii?Q?4rYY1vnRum6jUo2IOJGwDakkBEUvUhYks99s//PXi7fgHoHkNowlEbzGuok7?=
 =?us-ascii?Q?9wB823su1qiyP3Ja9SOGm9QaHPhPCT+zIWZ5vbTJInhEgH5Q3CcH9myTiVWG?=
 =?us-ascii?Q?ky/cXF3BBBVFJAgBxgFDRymekOEUXna0pL1wAVZA2JI3EcKbzbJ488urjEiQ?=
 =?us-ascii?Q?O9RfZ9m61B06zBs1mch6BfNeSd5pKGjCWoxIGrCxrEdhXafY8fJtlcGqPfXS?=
 =?us-ascii?Q?zMGLoTt2s47tJOwU2DSiHvmlJpDACTuhmO5H13c+mD5SvOX/3KG9ZVVwTVwg?=
 =?us-ascii?Q?fGM0AWWquwyUV1qnqmzIOnDNSgBEDlbLDfTSKRtzv1I054W/uoV6jRCA8Kc3?=
 =?us-ascii?Q?h2bLNpb84K/SUyDIVDgJNajrb7vMl8biW+fLy57N0PUR9nd52jjtfuC4zM7G?=
 =?us-ascii?Q?G+bcGZ2RZeknGWUd3lya8uC373xeMnPCJTtIjFMm0yj05+yE9h/F7OAxRqoy?=
 =?us-ascii?Q?GXVI8aUK3Rj27UDPuyYFOPqc7U7fGMQP/lLuj9MwwgYUjH0a/3Vo/zQK4uso?=
 =?us-ascii?Q?FMpPeP5/aRp2uMthgIxwAlSYeMKbjnT0Es5eyd9rVLbuYeXjgKrXP9jstQvb?=
 =?us-ascii?Q?eWi4gpOWw2udLS4O/d/X9XTsXyccVd/AFaAMmH7aKGWb1AqDEeBRKSS/vaRI?=
 =?us-ascii?Q?MVl6rWTjLJgojCLJSqlkT5Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bc6653-ee89-48a1-e058-08de0b3035af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:42.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET5w24tgpiL1OAtNGGTFz5T0odeNTclrbeeIwdAVXDjBxKBcSruF+liUpv6Lslc0cOPORl4kGug4lP/fOKpyyk4P1UwHvMlmSObyPu1NpLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Proofpoint-GUID: cnVGEVUd1rm5xA3DfXUnHKZdqCKdTKrH
X-Proofpoint-ORIG-GUID: cnVGEVUd1rm5xA3DfXUnHKZdqCKdTKrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX1gVa0daxBRdw
 X8YaNEqb34W4ath5Rwf5+af7DNRm4/pap4bu+XJzqQW4WDBUBXCDnQxn9DalJ6QA3H04P1mRDu+
 gOlt+krUsJjRkiJxxGfBEjmg4sMYQCHI6tJjy7rHTN50Rkx7xr1T89W1I9JG7at5l9uKCK26dni
 D63P41Ygh9fYnsQFpQweYggC39aZjjahVGgaSfQ1xfBgxi1HAbStiA/oO64wbmTrFMqER70GVfR
 3i5sxqgsYDcKtWA00FkOf5XOBmtelZ1HTnSGFbUkLVXQRlk1xHg8CX6tB/5gEuczFLk64wJSNCw
 ISohrk87Vz0Q6U/Zzggnc8ibrN05xX9gMnpDt9q9Z+DJpaxjHGzQWjVVMyow3pLk50BCjQXHl1n
 EuD1IUBjH+wia5FBPtnqrE/bxRW4Hg==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ee61dd cx=c_pps
 a=f2s2IY/meXrRFjAxVkB89g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=JHpLaZKHCrPJbBCoxHsA:9 a=ttpAJU0XWFsA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224828

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002280.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-7.patch          | 149 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
new file mode 100644
index 0000000000..74cb49670b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
@@ -0,0 +1,149 @@
+From 1077953950d1e8864c63222967141c67f51297f8 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:27:04 -0700
+Subject: [PATCH] nptl: Fix indentation
+
+In my previous change I turned a nested loop into a simple loop. I'm doing
+the resulting indentation changes in a separate commit to make the diff on
+the previous commit easier to review.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: ee6c14ed59d480720721aaacc5fb03213dc153da
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002280.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 110 +++++++++++++++++++--------------------
+ 1 file changed, 55 insertions(+), 55 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index c8c99bbf..adf26a80 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -383,65 +383,65 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+ 
+-      while (1)
+-	{
+-	  /* Now wait until a signal is available in our group or it is closed.
+-	     Acquire MO so that if we observe (signals == lowseq) after group
+-	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-	     store and will see the prior update of __g1_start done while switching
+-	     groups too.  */
+-	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* If the group is closed already,
+-	         then this waiter originally had enough extra signals to
+-	         consume, up until the time its group was closed.  */
+-	       break;
+-	    }
+-
+-	  /* If there is an available signal, don't block.
+-	     If __g1_start has advanced at all, then we must be in G1
+-	     by now, perhaps in the process of switching back to an older
+-	     G2, but in either case we're allowed to consume the available
+-	     signal and should not block anymore.  */
+-	  if ((int)(signals - lowseq) >= 2)
+-           {
+-             /* Try to grab a signal.  See above for MO.  (if we do another loop
+-                iteration we need to see the correct value of g1_start)  */
+-                     if (atomic_compare_exchange_weak_acquire (
+-                               cond->__data.__g_signals + g,
++  while (1)
++    {
++      /* Now wait until a signal is available in our group or it is closed.
++         Acquire MO so that if we observe (signals == lowseq) after group
++         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++         store and will see the prior update of __g1_start done while switching
++         groups too.  */
++      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
++      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++      if (seq < (g1_start >> 1))
++        {
++          /* If the group is closed already,
++             then this waiter originally had enough extra signals to
++             consume, up until the time its group was closed.  */
++           break;
++        }
++
++      /* If there is an available signal, don't block.
++         If __g1_start has advanced at all, then we must be in G1
++         by now, perhaps in the process of switching back to an older
++         G2, but in either case we're allowed to consume the available
++         signal and should not block anymore.  */
++      if ((int)(signals - lowseq) >= 2)
++        {
++         /* Try to grab a signal.  See above for MO.  (if we do another loop
++            iteration we need to see the correct value of g1_start)  */
++           if (atomic_compare_exchange_weak_acquire (
++                       cond->__data.__g_signals + g,
+                        &signals, signals - 2))
+-                       break;
+-                     else
+-                       continue;
+-           }
+-
+-	  // Now block.
+-	  struct _pthread_cleanup_buffer buffer;
+-	  struct _condvar_cleanup_buffer cbuffer;
+-	  cbuffer.wseq = wseq;
+-	  cbuffer.cond = cond;
+-	  cbuffer.mutex = mutex;
+-	  cbuffer.private = private;
+-	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+-
+-	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+-
+-	  __pthread_cleanup_pop (&buffer, 0);
+-
+-	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+-	    {
+-	      /* If we timed out, we effectively cancel waiting.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+ 	      break;
+-	    }
++           else
++             continue;
+ 	}
+ 
++      // Now block.
++      struct _pthread_cleanup_buffer buffer;
++      struct _condvar_cleanup_buffer cbuffer;
++      cbuffer.wseq = wseq;
++      cbuffer.cond = cond;
++      cbuffer.mutex = mutex;
++      cbuffer.private = private;
++      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++      err = __futex_abstimed_wait_cancelable64 (
++        cond->__data.__g_signals + g, signals, clockid, abstime, private);
++
++      __pthread_cleanup_pop (&buffer, 0);
++
++      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
++        {
++          /* If we timed out, we effectively cancel waiting.  */
++          __condvar_cancel_waiting (cond, seq, g, private);
++          result = err;
++          break;
++        }
++    }
++
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+      mutex.  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3034461e9e..7ef2c8cb4c 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
+           file://0026-PR25847-7.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


