Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED328CD5BAA
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 17:30:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18083.1779298224597396818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 10:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hsl7EbId;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96001520eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFCIZW2821108
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:30:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Iuf4fxpmY
	M/Nix+5inenavtNwz5Xkv2ElJTOlvhMnQc=; b=hsl7EbIdYaDV+Ai1aWhkUsmDH
	jfXYSOSNPKfPPJu/dX2t++fEcSNOkEe1XLwTPX1PfY1/BV3S4LaNLQV0rHP8/qCr
	kB5nqohM3V9RRQNqQh3CFA3XeajmZBUzC7q8FmZTzjIaOyB6xYx3wI1i594UP4vI
	p6ILBt+UZmj5TI3b8hWa/MZyZTnvedF6dmhhVWDIhuBE82WgBYXFRpb+Kw5XJ46D
	0EF0+7kAdCf/fih1Qfj4pUqW/jZKg+xGCP5QD4oiyAvifvFIk7AKpb0/7hFqakpA
	43yAgjKFunyNaQmH9oKzgMTyK8t0/v2++pMl/b8MfJ16+DVlaQINPlri4cnWQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux5qv5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA1Kz8Z09znNvCW8VqeueNkR+d1zzKNsdQ52asfzONtpxZm0JMO1pmbl89XmOB3+3n461YwLl5d6GxdtHHXLmgf5c+rjXBDrg35/+LpahRtV1nFrhPc4ChjMvVZerCug10kmWIj+Vz9EkkuwIXEltR+bLSdMT7AwGFK/KSSQtzz1Pr76KPCeMJmCgAxEZdbaQEeAYFtmQtcJ65bRGbsFJ+RoYVDC5O8ZexRII7HIvuKXGCcpsJPCNpF0zC88FBVTNZJgTY43vxIViXI1fWbbeg6123E9TbOFR4BmOFLFvfaDvIW4+ol+MX8Z+Repbd170bg25eMdROxFj9gGUj+4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iuf4fxpmYM/Nix+5inenavtNwz5Xkv2ElJTOlvhMnQc=;
 b=eul1NEUNoULM+xLRp5jivVBublpdr9EfOWkXyyyXvRx9IZvWD1SXIJxl5uOHBTL94n5Y3MAZxf2yfx2vJzTQwlec5+D9Yi4Ld4ccYoxDgbrZ2nfFHFQv1NHtkWg40bmo3JnGDwbXFBXZywClRrdr21b2R16IuXlb23WcCy7gHkS9GMQAwzoRuAPOI308Yzbpr3KlF6n023BXF1IazCK7UYYfuPO92nSSgKTMkHgGa5FjMMw+TvZt6fh/gUqlLReW0ELW3Ta3tAiGrmHlGM5y7pllnnLvzjY5CX2WFDH6FD4gAxNtPXqaqn0GwbouQxURJU1LXVdncwOQIgI+a2u+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 17:30:17 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:30:17 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH] gdb: Upgrade 17.1 -> 17.2
Date: Wed, 20 May 2026 10:30:02 -0700
Message-ID: <20260520173002.932063-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd86e86-f0bb-4ee1-1fe7-08deb69575c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|38350700014|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	54fV9psMVo9gZshx3lgCUv066kKd0QTxdVz1pyI3ihYTwzhRXMXGbKZB8gvpZ8VBNpUnD1qTZE8pLA+xMuDTLhOeUSyMHQJU3wEqfW8ilTJofVxAiyRHfBMQ+UylGUevmsNNgPxcR+MIQudGmxqxuCtRYCj1s9Qh3EXxMSmgUZOSkycEnah0OaSyW0aG4zm463ecdMSE5SmOCraxMUKSz9E7b9qHf1qJZhj1iRNtVpBMZEd0Tk/gap7QiwGyS56aWL0ifiyT9GtwMpNH6qRAsIYYLLDnkyxOxbSOxyzeUZW3jLhO45ujFoWFqEDEKlIO9APAHk38cYJY8iGRISBgSmbGKoofJmo5l8BdTX7N7V9NwDPi3XF5S9Gl9ZsoosdTLPh7GEpmU9PYc/xiWIabsY2DK6k8TEgK18KXm9htsaYWjy5hvWzv57jiiMxv5ig64nG1+eBIbCPR1ii1FG9/H3ScYWwCn6fOHXpUIxaIzxvtkN0eXCeikxQYPcG7nLkJi8IZ0Czb/uh5Q2MgOXxCu1xQENPeewZTwiQ+a7OPUdBeslJDr9fmfXnJlfqMgHOjSBwodJZhHUwhfnkLVqzXfpwmigV9eORXMBUkw+JiA6Az8ySjgptVAtKKPZa2WyWMN2YMvqHyZgDhJ84L00C0zGuqpsXylrd+q05YV7qGYyzZXHNnXASbrPctt1N/ksup9vBU8M16hA2EmI5Cs2ZOrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(38350700014)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d4deSPEOYbLm66GE5rHPA5qu1Yq1KI3di+7p7thyGf5W0oeyU3KlfTp5qzLi?=
 =?us-ascii?Q?U/IHeuvAP2dhpwKyGvIIGifotj8sW0zVOnnYUzQeHnM4m3D8/5NQHz6hAyre?=
 =?us-ascii?Q?vvEAVI1Be3dTFxR8Mep63qM7SCMZmKeX7orEQx1LJfE9VFMjG/GFOEsAqbx+?=
 =?us-ascii?Q?5gjaBh2zJHXakijGc89+DmrPRMHwi0RreLiS51/B8xkpaUc2OMRs2rv/mxMK?=
 =?us-ascii?Q?jxUEPc+W7HUrvmVJ9InycUfgKsslYU9KZ7t7K9OCLzhls/L4zPL9In73XLHR?=
 =?us-ascii?Q?E1hTqFb9l534+MiB0h0ivHon2SOon7BPDYswy4FZDZm0erQdNpZOOb9RCBnW?=
 =?us-ascii?Q?AQWFOuRkcHxxnptJsb3rPTe8SfM3PehkebMNqhKdpeYl5d1/dbqHg4cPel1E?=
 =?us-ascii?Q?JkH+m6nDTDrp3qtbyiGtGV4ROoqhflJnYLMj++lqqdPcnNY/CTfP6KYHFoj2?=
 =?us-ascii?Q?T+flN1Z/65Lm9J/qDCTclSCCbqwBya1yJ0NEbgqyoCfisWOGNL8++nN0RsUS?=
 =?us-ascii?Q?ZsaMUeog1JWoCK83J22CkNzcKME49Fa3PZ8knSGDYBP1ymX/17S0QCfiiAsY?=
 =?us-ascii?Q?daclKMhPvNBIFr9sMRh9hhwTbad3mqH7J2ugMKOB/fY4fG6fX3QoX/ZmqSr4?=
 =?us-ascii?Q?MnuwNpTd1ce690GqyhBY3e0mfTYgMh3NBLXsIQJR9U0G+qU6CMIxLZfkHRvu?=
 =?us-ascii?Q?KJihsbtFXtocIQrp/5Qq9AcKIAuAqD+Xo2pMvVmvU89/GwOgUkia1Y8/kXsN?=
 =?us-ascii?Q?9gJ607Pn0aXnNUCuyqZEZ3G3RIPWhBvBmXhnqfaYTN7I3XWO3ooloBPakXlr?=
 =?us-ascii?Q?qHaQsECptVcpCszaSq1bjbJmshRbGfZVRD31927MYufkmFQF69MXP016r35+?=
 =?us-ascii?Q?UMit8Rig8CbR6X4JyHoT/kIR7ShfZifSahzcCwsQ+xPVYm+/SiovIsEf/kno?=
 =?us-ascii?Q?py883tnktqwuKqjUG+P7sC4e0qtK/oFhFGfM9PdhNADsYMfEx2MM6JYFCQ3Y?=
 =?us-ascii?Q?5cym99y3yx7TMeSY+1kR1XN71MbybKJ4oRoSFoMyvpcZbCp0BGRuCdvGcAwj?=
 =?us-ascii?Q?LfECaz88tGVVMUTYEU7UO2XEc8WModtYPywWisCxJBtpE3hket4blM93sIqS?=
 =?us-ascii?Q?6RyOCtiFMFKd6I3jtZ9f0Kqklq59P6e8kMLj7p6yYVHh9PWAbNn2FPP4CtfT?=
 =?us-ascii?Q?wS6BIxn7muVmhIHF9Fpw16kiseTMchkrMeYXdd3TYLa0FhTmKCMMt99sa4fA?=
 =?us-ascii?Q?E/bX0AariwRKYJNuTUX9hC0PWff2cOGFuTx/C1TCw+bUTROSkBS9rwEkIlnb?=
 =?us-ascii?Q?0Fxl61nxFa8yOUEyQaVIm/r4gqJbwtL5WbqjNOgQfbeO8KGveDH1RgX79Jt0?=
 =?us-ascii?Q?jUzwEZwuoyn87M8IMPYWUI5Paf6Fsfj+zfw072NYLHH1g1P+8bTQi6udt65a?=
 =?us-ascii?Q?+n32i00gQiJ0xL1xyB3T+8i8U3yayGMPmuSCZck5sZu6yh2qu3xEwE5Ku90J?=
 =?us-ascii?Q?3cTAI0Ef+w12JuUP0OkSs5gqri2H6KDvr3bjYR7UiVj3oef4lWe2qQavMvKK?=
 =?us-ascii?Q?H+xbXzOktTOJHokYlXtQbWlHZjZPg6bI/w/GD2Ly/Dfcw4H0UocB9gmrr75B?=
 =?us-ascii?Q?mBg1NI43qeUICEimwq2EgmYN2xzxaAoIVK8qlcpob+S7lV2MacbS91eMwHLN?=
 =?us-ascii?Q?2bZ9pse4uKshVi1FN5umejYcLsU/xo0yWy5uPWT8vr7mSfnfKt0ireFiOQME?=
 =?us-ascii?Q?y8Is0VCMc7jP1L/glUR1edoPVi64f6c=3D?=
X-Exchange-RoutingPolicyChecked: 
	XQjZDyQRT8xzCZoGAmNGY3RJbqhAMqitTR7mfG34v2GpvtCHPlUl7YDehg/PUv8LYwB+V3m4DKGxNpGaeGLPi+NViamAd94kgkH9WcxyaTsR5wtUC53shKnT62DR4UMXSGO342AUO7jnXmY/g6leg5r1fapjVTKKEZRMmZ76AWxQd8WK3dn3HcMijfQ80hu1IpriHWXzDVNt6rV1bpuAcQWsYKyXLvj1S/9s4o43UdgZTU8JF335p0BJLaDAKiIW+Ctmbx3fAKP5MOHtJDmwdDKz5KQmjtT+tlpbSzkp2m4ML8/bb/VYoeX0rOmSZvV4xLXQwySGj39BKY8Qp9UOgw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd86e86-f0bb-4ee1-1fe7-08deb69575c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:30:17.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8WxIMNRoh6RO29j2za+GnALlSbcOG477B5g00c8CphhBfldUOFUGDRCRCwN8shuFvXrag9YsXZQaHvASH1LEYZmxNKTfG7MD+7Oh/LHg+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
X-Proofpoint-GUID: j-3SDBRZzk5FZ5EgNM7L2VicpMTeMsUz
X-Proofpoint-ORIG-GUID: j-3SDBRZzk5FZ5EgNM7L2VicpMTeMsUz
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0defaf cx=c_pps
 a=xx7W88v/Jz1hHwbI4fXbew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=m7CUszNA7STTOgLsIdMA:9 a=HCINmKHFQ_U6d0ff:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3MCBTYWx0ZWRfX7lyz4lWBcYye
 skXQWyKdXbz1ol3NK+5oBsA8LzXu8BfoyYHOsJdgb9sntZmXkj01gB7LE6qrC9YctyahpzvHlfp
 TSTOTkbHDn7W3UCtTOCt3/2eso602xv7eQbAy9CdrNGM7XPA5iwrKAE6uzQy6Uu1Q8Jay48i349
 4QIJcY4x0dYBXUmXytFgbF2JBtmJhWd+qnUEQ8bGRJJ6fiK185nCNLfjQDS1VEVo7/de1yJxdrS
 f800gub2OhHSUSE1M0Uij/Nd5OSBMYA/OX4mpErdaDztMRg6PBfU8jF29/LyYekZHEguIQ0/6G0
 2UfGLbI7KXdY1VD7RHgF4kanOJycn051hyIMJwtxo+glLUMS5AOsve6jGxIYjjqIAK7QQ3zMvwH
 Z0hgc4P6RquqvLeutNgBl1QSnWZXlbDH2OmuO+VczGAfZ777bXoN5FWEGzWuKfEASYYnQxyWaK5
 wUaTLHL8XvaRkUMKIiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237461

From: Sunil Dora <sunilkumar.dora@windriver.com>

GDB 17.2 brings the following fixes and enhancements over GDB 17.1:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.2-release

 * PR dap/33228 ([gdb/dap] error while listing register children)

 * PR gdb/33737 (gdb --help says 'For more information, type "stream"
   from within GDB', but "stream" is not a defined command)

 * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
   in 'termios')

 * PR gdb/33748 (gdb17 regression with displaying ANSI colors)

 * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
   and static data don't mix)

 * PR cli/33761 (Setting style colors is broken on MS-Windows)

 * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts fails)

 * PR symtab/33775 ([gdb/symtab] data race in
   dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})

 * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
   for dummy CU)

 * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compressed
   debug info (thousands of partial units))

 * PR testsuite/33845 (gdb: There are 4 unexpected failures in
   breakpoint-in-ro-region.exp)

 * PR gdb/33872 (`skip -gfile` has inverted logic)

 * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

 * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
   outside of `file` [reproducer attached])

Drop patches merged upstream:
  * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
  * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 6 files changed, 1 insertion(+), 447 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d367486d02..cbb5885459 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,7 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
-           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
+SRC_URI[sha256sum] = "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
deleted file mode 100644
index 30d22b21f9..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Tue, 17 Mar 2026 01:58:55 -0700
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
- support
-
-The Linux custom baud rate implementation previously accessed the
-struct termios members c_ispeed and c_ospeed directly. These fields
-exist in glibc but are not exposed by musl, causing builds to fail on
-musl-based systems.
-
-Update set_custom_baudrate_linux to use a capability-based approach,
-with three distinct code paths:
-
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
-   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
-   speeds.
-
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
-   use it to support arbitrary baud rates.
-
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
-   the TCGETS/TCSETS fallback (primarily for glibc on older
-   architectures).
-
-4) Otherwise, emit an error indicating that custom baud rates are
-   unsupported on this platform.
-
-This preserves existing behavior on glibc systems while restoring
-build compatibility with musl and other libc implementations.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
-
-Suggested-by: Kevin Buettner <kevinb@redhat.com>
-Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/config.in    |  6 ++++++
- gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.ac | 22 +++++++++++++++++++
- gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
- 4 files changed, 119 insertions(+), 16 deletions(-)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index efc3100cb9e..b2469c8dabd 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -110,6 +110,9 @@
-    the CoreFoundation framework. */
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE
- 
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
-+#undef HAVE_CFSETSPEED_ARBITRARY
-+
- /* Define if compiling support to gdb compile. */
- #undef HAVE_COMPILE
- 
-@@ -517,6 +520,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
-+
- /* Define to 1 if `td_pcb' is a member of `struct thread'. */
- #undef HAVE_STRUCT_THREAD_TD_PCB
- 
-diff --git a/gdb/configure b/gdb/configure
-index d0bdba6eb36..8a0e2fa2771 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
- fi
- 
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
-+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <termios.h>
-+int
-+main ()
-+{
-+
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_cfsetspeed_arbitrary=yes
-+else
-+  gdb_cv_cfsetspeed_arbitrary=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
-+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+
-+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
-+
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
-+"
-+if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
-+_ACEOF
-+
-+
-+fi
-+
-+
- 
- 
- # Check whether --with-jit-reader-dir was given.
-diff --git a/gdb/configure.ac b/gdb/configure.ac
-index 52924106bca..26e8d1ee276 100644
---- a/gdb/configure.ac
-+++ b/gdb/configure.ac
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
- 
- AC_SEARCH_LIBS(dlopen, dl)
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
-+  [gdb_cv_cfsetspeed_arbitrary], [
-+  AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM([[#include <termios.h>]],
-+      [[
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+      ]])],
-+    [gdb_cv_cfsetspeed_arbitrary=yes],
-+    [gdb_cv_cfsetspeed_arbitrary=no])
-+])
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
-+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
-+
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
-                 [directory to load the JIT readers from],
-                 [${libdir}/gdb])
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
-index 6f2766518be..fbd73970dbb 100644
---- a/gdb/ser-unix.c
-+++ b/gdb/ser-unix.c
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
- 
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
- 
--/* Set a custom baud rate using the termios BOTHER.  */
-+/* Set a custom baud rate.
-+
-+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
-+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
-+   (BOTHER) or legacy termios interfaces.  */
- 
- static void
- set_custom_baudrate_linux (int fd, int rate)
- {
--#ifdef TCGETS2
--  struct termios2 tio;
--  const unsigned long req_get = TCGETS2;
--  const unsigned long req_set = TCSETS2;
--#else
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)
-   struct termios tio;
--  const unsigned long req_get = TCGETS;
--  const unsigned long req_set = TCSETS;
--#endif
-+  if (tcgetattr (fd, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  cfsetispeed (&tio, rate);
-+  cfsetospeed (&tio, rate);
-+
-+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(TCGETS2)
-+  struct termios2 tio2;
-+  if (ioctl (fd, TCGETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  tio2.c_cflag &= ~CBAUD;
-+  tio2.c_cflag |= BOTHER;
-+  tio2.c_ospeed = rate;
-+  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
-+  tio2.c_cflag |= BOTHER << IBSHIFT;
-+  tio2.c_ispeed = rate;
- 
--  if (ioctl (fd, req_get, &tio) < 0)
--    perror_with_name (_("Can not get current baud rate"));
-+  if (ioctl (fd, TCSETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
-+  struct termios tio;
-+  if (ioctl (fd, TCGETS, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
- 
--  /* Clear the current output baud rate and fill a new value.  */
-   tio.c_cflag &= ~CBAUD;
-   tio.c_cflag |= BOTHER;
-   tio.c_ospeed = rate;
--
--  /* Clear the current input baud rate and fill a new value.  */
-   tio.c_cflag &= ~(CBAUD << IBSHIFT);
-   tio.c_cflag |= BOTHER << IBSHIFT;
-   tio.c_ispeed = rate;
- 
--  if (ioctl (fd, req_set, &tio) < 0)
--    perror_with_name (_("Can not set custom baud rate"));
-+  if (ioctl (fd, TCSETS, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#else
-+  error (_("Custom baud rate not supported on this platform"));
-+#endif
- }
- 
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
deleted file mode 100644
index 2d91a351d2..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
-From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
-Date: Tue, 17 Mar 2026 02:24:48 -0700
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
-
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
-
-When building against musl (e.g. on Alpine Linux), the following error
-happens:
-
-    CXX    linux-aarch64-low.o
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
-  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
-     35 | struct user_gcs
-        |        ^~~~~~~~
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
-  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
-    329 | struct user_gcs {
-        |        ^~~~~~~~
-  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
-
-aarch64-linux-tdep.c fails to build in the same way.  This happens because
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
-have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
-<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
-It's fine on glibc systems because in the set of system headers that
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
-ends up being included implicitly as well.  This doesn't happen when using
-musl's headers though.
-
-There isn't a macro in <asm/ptrace.h> whose presence is correlated with
-the presence of the struct user_gcs definition, so a configure check is
-needed to detect it and conditionally define the struct.
-
-Also, this change requires aarch64-linux-tdep.c to stop using
-struct user_gcs because target-dependent code can't include <asm/ptrace.h>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
-struct definition available. To fix this problem, also backport the
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
-
-Note that there's another build issue with musl, described in
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
-able to test this patch, I applied the patch in comment 11 there.
-
-Tested with a native build on an Alpine Linux aarch64 system, and also
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
-
-Co-authored-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/aarch64-linux-tdep.c     |  5 +++--
- gdb/arch/aarch64-gcs-linux.h |  8 +++++---
- gdbsupport/config.in         |  3 +++
- gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
- gdbsupport/configure.ac      | 19 +++++++++++++++++++
- 5 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 76bde85188b..6c402e7ecdd 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
- 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
- 	};
- 
--      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
--	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
-+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
-+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
-+	  "GCS registers", cb_data);
-     }
- }
- 
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
-index 018ca37a522..632823a8120 100644
---- a/gdb/arch/aarch64-gcs-linux.h
-+++ b/gdb/arch/aarch64-gcs-linux.h
-@@ -27,8 +27,7 @@
- #define HWCAP_GCS (1ULL << 32)
- #endif
- 
--/* Make sure we only define these if the kernel header doesn't.  */
--#ifndef GCS_MAGIC
-+#ifndef HAVE_STRUCT_USER_GCS
- 
- /* GCS state (NT_ARM_GCS).  */
- 
-@@ -39,6 +38,9 @@ struct user_gcs
-   uint64_t gcspr_el0;
- };
- 
--#endif /* GCS_MAGIC */
-+#endif /* HAVE_STRUCT_USER_GCS */
-+
-+/* The GCS regset consists of 3 64-bit registers.  */
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
- 
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index 0beacf22c05..2957ee0f030 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -271,6 +271,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if your system has struct user_gcs. */
-+#undef HAVE_STRUCT_USER_GCS
-+
- /* Define to 1 if you have the <sys/param.h> header file. */
- #undef HAVE_SYS_PARAM_H
- 
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index 133ddfa7f6c..66135791aa5 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+# Check for `struct user_gcs`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
-+$as_echo_n "checking for struct user_gcs... " >&6; }
-+if ${gdb_cv_struct_user_gcs+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>
-+int
-+main ()
-+{
-+struct user_gcs u;
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_struct_user_gcs=yes
-+else
-+  gdb_cv_struct_user_gcs=no
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
-+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+
-+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
-+
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
-diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
-index b7ccfabd6c6..d3b4c05daeb 100644
---- a/gdbsupport/configure.ac
-+++ b/gdbsupport/configure.ac
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE
- AM_GDB_COMPILER_TYPE
- AM_GDB_WARNINGS
- 
-+# Check for `struct user_gcs`
-+AC_CACHE_CHECK(
-+  [for struct user_gcs],
-+  [gdb_cv_struct_user_gcs],
-+  [AC_COMPILE_IFELSE(
-+     [AC_LANG_PROGRAM(
-+	[#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>],
-+	[struct user_gcs u;]
-+      )],
-+     [gdb_cv_struct_user_gcs=yes],
-+     [gdb_cv_struct_user_gcs=no]
-+  )]
-+)
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
-+	    [Define to 1 if your system has struct user_gcs.])
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.1.bb
rename to meta/recipes-devtools/gdb/gdb_17.2.bb
-- 
2.49.0


