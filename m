Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FD9C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9706.1785816516820448466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z1RR5o7I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743VgeY2876830
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=; b=
	Z1RR5o7ISQmC0JclScpEhe7wIM0Prgk3QxH27Y7HA3gfHTLS/roWsieaphhB0skl
	7+t/runN1yOusj4zNsMVaf0KfzEhc6D4PRC42f54x2lhiHZrNzEhMy+lwZWxIJOT
	YL9rAWEm94YTy+czHNLZGMbhxGOu0BkPTIHJxV3k0f/MvOUw+FzWjHArtR20pWRQ
	p9qyTaknvA/osaTt423gjMK5zwSHU+jLad3q8jhCtdyBbT1q9UEtWC+7jyWdWsS3
	PWN/cQuhQrMxDMR9BXrRL3cR9HmqkskIBl9BkmsbfqaecIiwunIsBLptznDION7g
	4hAEz3zzcUmLPx6UkNOtBA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3ae4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRl/EXdhDxfAu1EIbSnZrRp+r1deTrTlzwPbw9oqcGSEgKP6iLnm3ZCrOn/uMvOZ0hLxdqdiNxZuDiBYvgEeDdRTha0H+0z1b2IGsN24GJjsyAnJFZOVO23hJRkK4BVvgSK2kqYgmiUezNj+vCsRHeDyzQRMheSpw8SD7P5ihtKonvsnRqHOfFScy1jcThmNGe8DfL+9fq7fQ0p3UFjOyzDv7s3JYd6FlO2OGs2JvTAa67GjztC6qWgs6WvQ+uxl/uI0rsVgO/abZto34EVQetXz15SvHMbtzXY1yVryevBzRQwd/sds4BSnzH3nuc9v1xb23gRVZo4Von72P2UFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=;
 b=BjN0QcXxVvLZu/oBSnKTvRY79FiNIo4qDrseTvecG44ZjL26yvNrLocAJs2xJMV2EjuopYzW4IDl5yd5aZluG1iuKM6mOHr3wah+PrD9sc5POPLl++rJb+1r3O17exta5SoJDpnlwM9+U2YdBkNouAUaZHzjipdVVotKwacaxynY+XOlepLIQX0gXWRu0myvdqT9wRFE580qGoJvejO6RHjEzTsgFHopLe9vpX699TcEzsRXDmDxjGAH3gaLxMtKE4/Xv5MJwTbi+QyDg0qz1zvyA4ynhsXiZubLJtZ1mZ309dIH/S8W62ezm2naHgT+I+CPFjpHgQlIXUiyPAa4WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:33 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:32 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 4/8] lib/oe/package.py: Don't redirect stderr
Date: Mon,  3 Aug 2026 21:08:11 -0700
Message-ID: <20260804040815.1499699-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aeff80b-f2b3-4959-543f-08def1de0c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fFsdbyLIxvVao/JiSYEH+ia84gp1n7mmiYm4sm5Ml0J1zGFG3KM1DLnwshl2NOl/p+94/6KguhVUI4EuffXHiFe5mh8fgVUCPBHNXLyDWONWebbLEIQ4YOVUmzGr1+U5lABKCwpyyhA1bHIYQRa31Waov2tC7o5xmX3kQ6GjOzNpHeNVYCId2lFZtEuu/ahKrhN/RjGXltcQrxhGqQZ/NX54JJUGp0rBClBUEGHjMFRP9lcdriAjebyevgK9iXcIG2+ZSi1YKrDBusE1yeg++m3bH7oQbKtgL/7Roae/dnAWvCxU5J9jgf4dt+OeTndUvqbYcwNIHEPDX+NftGXMm04BpvJGC0RtA32R5TZK1JhyUra4sAwvvvW4sdHqw+gXks7OP5DvPVezwp3CV/YNI0cFLWrMxAaqJQKUQp5Yz/f6ZIl3tQ25zuTclciWgCh/fjQHry9g2D3NJ8jjd/QTJEYZ6SCp8uCBBpDbppxEpMGbfdw7x6pvEE4wIzKnJcrFDKGvswNM+iVBTrVhwrOTUOSosjwkTlhlaAHhfftKsSeVwYcxb0iUbSyyCyC1R7LzslI/Sr06Eeh2zMddBVTTPx4Bd3YchdTRqf6qGM2ToFwJOgQtEYSd1jMz50uPSoEBl7sQakJSl561EZRnB0PulmKUe5yYUVyHbJ4YH7fa/OU/mdoGKCsm97cDgqeESBd7zlNIcMpIQCTlwl6YeklmEqb+w++ptfflSJrsNZs7nW0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VulxvtkNUjGj22l2oGIkAlT68+Plz6GyA7cO5MR7e0diZwO+ilxkko6eS8CN?=
 =?us-ascii?Q?kz2LH+o2/j+qElYs9h85ijQD2IqmrzBg0tZQf+5wEeDbKp6/1qPB/3kdbEfK?=
 =?us-ascii?Q?KoMQAts0Qtbd+mjL3KvdXv6wApkc7pXn6L5opQ1Ohx079XOCw+KEmLlr2FeD?=
 =?us-ascii?Q?AnGlyBDtzDJPuE08SfVBDMYhpljY2qvGZDnZjjnNS7V7f0yNPLWFeVg8tURa?=
 =?us-ascii?Q?FwwStKtCvthcvF5F8frrshnLoQJiVB4phSFhOU9G8gmmG9Io4tx9sPFgKNuL?=
 =?us-ascii?Q?mfhmK2FSzYUz1BDxbn+Kln1mKmsLEY3nhM5mXe9nDnoILainb1Jp973POcAr?=
 =?us-ascii?Q?Fz9rJ8eDMDo+NymA1ZXwwd04Brr4FVcGUmHKaiU7WucP1ASYshmQgOfozEnR?=
 =?us-ascii?Q?84sKWqGFvZZM/J7atDhD1EDMbo2cdj2qvVStHrzBvLzpZ/pv/6FrTq6EPL4Y?=
 =?us-ascii?Q?Vk8ExGlKZJ+caH7iu0Qi10jWqrAN+rHpnGO9NpV7Im2fq12IjFDR53bLzvy+?=
 =?us-ascii?Q?CdHyQeGcbH9UnE1CxalrzYUkviL6qe9x6VP8vA99G0KSawBTryeNgfItsNq3?=
 =?us-ascii?Q?kiUnQ7mP1rnHPyUco4e3hu4z4EgDtIvsPTBpklPlKEfiZyDxAG69RCqy7Sol?=
 =?us-ascii?Q?SGCYjaH4/FqQuRGpawp5Zm5hKqSQNA/GMbTbRYGS1ggGZVbzFgcPA2KGVryc?=
 =?us-ascii?Q?dwfN2rWbqG/2s7JFVvr+wK9TMm+Tcs1FUJhA85ygM1b6Bm0jhwyzWHnNOH8G?=
 =?us-ascii?Q?yosECKC0dTjI6kAn7mtoZ8RcsEi0yUQsykyLOGPPW4G6awrk048HBPFG5Xfx?=
 =?us-ascii?Q?QJ52l5v1SS5Wl7WFIYD7xkev5PqxWA82dFCNix22NQ/7yzu+J0ZEM8ZxoWd8?=
 =?us-ascii?Q?/GRp0CjzD+KkG0zaSGg3Ck/RTCHkfK1HJ0raO/VYQZ7Hf5chhwbY5wU9GPMr?=
 =?us-ascii?Q?k4U4OYc/SWIIs0EemUkGqZF4YsKc+XL2eXIbNzeYiLu2dmRblQ+U62vBqxNO?=
 =?us-ascii?Q?xPU5fZV8XadrEbjLYbqex3+0FvuH87qYlvGmUBxpKQK0L2wWQfK/5Wd2BhNi?=
 =?us-ascii?Q?p9acm4i1sR/jLDEFg6jiE5ob+bx78qNIBY66WA2k5AzMNKmmuX45MILWOCiq?=
 =?us-ascii?Q?7LhtHKwZFdUwcpenEa25i4SfnapIwCrwMWRcAoNWyKfj6Afd3v7gxIU9WKX6?=
 =?us-ascii?Q?FJyx5miYMsMnViPwhkzMKKlzeo/wlQrBXB7DybwgFa5ndedBuyGjHtKG4emQ?=
 =?us-ascii?Q?IZJ22Igqt61AsdlTIWDu1T+/Egu9yALiC9HoLCrfkSt9emYuk89wKL4Akvay?=
 =?us-ascii?Q?WuXjuV25/WpeChwAcI+kx5wpt3HIifPVx8yJImePmSoPxmVnpAVcZJFsw2Sv?=
 =?us-ascii?Q?HbKvXbA6urUrbRdbKx7wYO4b+oHeD3Z0xVyfVYJE+MKmLoNQ7haB8HYHIhC4?=
 =?us-ascii?Q?hC7iT/MMHDJ2Gj6SKMrURl5aVi5mSTQTG17Qz5rnJGYcf5C4WMJSomxD6i3o?=
 =?us-ascii?Q?UL6AlVDwYkBGAZlVz7GHhL7IkgCcQ/onniXu9X+3ijFh8dVc27P8+A4np1u0?=
 =?us-ascii?Q?sGCL56+Z1yZ6YgdPtz5BnLI+aKntVeqNK9szqV07bU0Eah0uatmcX7rQAzG4?=
 =?us-ascii?Q?qVLrJSzuHAhihfCi+K8chE3uGrwW+0RWwGwGqjJTV/EgOYEQ8d827QmUKvj/?=
 =?us-ascii?Q?qZ94ygF6oNhiJZgUjOHhq+aeoMCR6bG0P52UpPm0LKyjtrzS1Nt7doIjEG+3?=
 =?us-ascii?Q?yUDNTdYmb9TlIEjmIvwamNO0WgSkDiI=3D?=
X-Exchange-RoutingPolicyChecked: 
	jcs+qKKIa0U7/SgyS0FAmH9+EEyh+43t7p0MVH14g2HRXd8z6LUsKbRsRVfcNsQGAtufDLHeq0f1VKLWxaP8BPQFq8XxEEQgs5Ao+80IvePleAsfebcaiOwvfak6B0g3f9GxoocQSXgBsw1OqxdlL0M1JcMUxDSJBr1FwafYXOxjof/Jo5cnQO44ik27fT0ldhYwMHDYFwpB1gi4nD+06Hym5ic8EGNFBsGTP6ZPzAxYIMxW3Z8/ph53x+hO4fTyHG6YgV5lXrsopXwcesbG9eVUJH0jHSU9aKMH/doGiZvXo+PmvZXKLZlwAHknxDXegAQsZbUOXn8ONCZN7+/aYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeff80b-f2b3-4959-543f-08def1de0c6b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:32.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3KyREpMGPPyfcY8A0EVsrcdyelrxVZQuM5mSCjPXHL10PNzV7QjNIP+e+hm8TZmu+Vl0VYoAiNRl+Xg39gt91eCJRCbSHBvxS/ibBlYr8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c4 cx=c_pps
 a=pvXDubuVmAGz8fO+OL2vfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX1vypLhH1OA+K
 UWQp7fHqOmWL6M31QJGKNCQU6OQnyze5BxD7ZlRr/wLMVwKy1vA1KxMeDn5kjzxiJAB5NguXtCB
 tXU9/E26ab+oN0feJrmE0CzuYXkJf/+LucL7xyDdvxp1kUEOLj769DW4JbE8waq69pkX89vJmEg
 FPNTK0PtYe5Xaxu2vARvpst//TajftWpEkllvdjPuE/hyWOZPptTdhYjG1GIVNsiqT65zi6IBrI
 HDmjljzZKsjGcHnaIrevjFEnRNvwhYFr+lSKzjmN49aeyzDvKBpgs+UpZUpa3FqJvj50xfBB1+S
 Hf1oPBQXjgG5VQSfNU9L6s2DEIElpD2OmJKZcSELAAgVFa4Ph1EsHcdOJaCjUI2xAL1uB5Sxnjo
 lywyRqt8q4LFCLY7VO1bZ7NL9Xu4ubm/ca9rGpvKR2tPZaWU+qQixVqomU8Q8r0K9tPkcGEu5Dp
 oEVpGYuwjVfUG5VLTrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX1Znqbd3qlNJd
 VTFzwYHlcHGhtpqkuKniiIfP9m8vFG6MvzyBZYwepipND/2zp7sw0pdPTTuICoJnsrykS3Pcq2T
 GBkkTebR6Af05zSuk9VcRn97dw6yCIBxorojrCoEh2AlxZ13KZOX
X-Proofpoint-ORIG-GUID: GlZO7BDTuDvhK3HMCJY5ZDNnagLZ0hvn
X-Proofpoint-GUID: 89icgK-0l9krteeC6HpyCtNuc1rCnZYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242687

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d8862ae92d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

