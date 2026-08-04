Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27A9C55ABC
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9712.1785816522113945777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ozpZkRRM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67414nPF2625620
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JrCVkaQCThn4ktPZv4nW24GkQZSTvCXO1I05CqSMaK8=; b=
	ozpZkRRMItLNNf65lmrvK9uURmV+7hFWmaw7FZGbx/3FF4rmx029d79YOHkiouys
	jyR07nPJODPT76vJbU2WwcVm2iZuGyGbSmIglL9ebOrBDW/y4tOsYBh/UoDmkQps
	cShBLtVCXc4kNdBIwu2B+mVgEdAtMLqZnS7QItgi8zm2JEKI6utu9VkUuDXrRZJV
	yQW7ZPqRJsry0mJOSKIp7clYQUA1jYM3WM09eRRusC5lxoaCwyUfT0G5YydH1Uqz
	V833KLWnQQjWvw7aQUPob2ATPM7MImZ+I09UnT1oaOWIs6y512jVmdzI2q2+EWE3
	ipeWD8dKA5FneS77K8VmvQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3aem-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUEM6bc1BCCmPKJcBiJfY+CMCCecJ4Hpb4oxvcvocfFapIaRZ/QfbEztgx8csaRV0sHlixvVyFMERbuYU/rlHM3a8z7/LLZHdi0GmdmeCIgfwgSYfZ5NOpng1WvDfle4X0tymE6wFbmBVUzXDgYrGkNK0kSx3MklIbI5ZHIJvDpiRQt9YQfwrJU4m30cRwSpdGcJj1mSSXrXkskOFXX6va96ZZn6ijCkXD9/tdQ9nS7Mszgmjw9eOqVNZQa0G1LuP+VtYgngekSYoeXq2m3SIk64JAC6tEPN8i7+nYH/eWENKg99fwKlUDCg5nVFXWcnonbBJWk9HCRe6TzgMQyFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrCVkaQCThn4ktPZv4nW24GkQZSTvCXO1I05CqSMaK8=;
 b=wl+veCQiUW7t++PSrWOSilDFvl/xaLTElY7ETVmtzcxL3mhO73AaFZGjEOxyEIMtNOmk4cQ1AONLbqarxgdtD+2ifnWnJP6F+yjjRlnoSi4a7WFiBkT1mE2gM0zUya54ZaHOmlswWyf2CqZMvr4V79kWt2104usPele8ALCw6MzEEFnU32o43xQxEf3QgdpaEDclW2fyn69vcuITL/p16wARALFcth2Gu2BvJiCi3tTEYMgzKZ6bo6ofK8vek2WiSzI72ywu7p1Skr0tt1et5q9Nxp9vYx5/sHT8HNiI4Nbg/+x1h11QWcEigQ79RETC0ANmEpvyjTP/H5I1avw+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:36 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:36 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 7/8] libarchive: Make it work with rpm 6.0.2
Date: Mon,  3 Aug 2026 21:08:14 -0700
Message-ID: <20260804040815.1499699-8-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc04f214-34b5-4b9e-f33b-08def1de0e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|13003099007|6133799003|12006099003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yJNt0VUBE4/OHAjb6lgaUIgKeACcfFi121GPkbGv98ZOND9JRBgYzp4lcI3F/KOrb3T7suJolktGQYILSaxgqBsoLjhIa+im3qkXKl+VL5qBEDC13B3OzbnEr9zzj/5hb40OZ4/uwJWoiI+293mHGYMmyEIofyg0t27c+8jDJHA3lN7EveqMIoFs3RkN1Ie+NknXiPJbkwWYAP7cSCNKFnLysaGiqnspVTyT7dP8bW/t/c2TlMAGS35Cg4408Emh5+CofWQaOrlT/cRbS3M8qeTPvV4tDMW9mxhRiSnNyVMboBYEC/yYypELEQNyXPjwuzcYrRF2jXTGgLiwNz/u8/1RyOwIBrRVnTYXHoxO9+b0R0JOZ2omIG8P4lvT5I+YoDkjQ+hMdZn5DO3a24/3K3Fl2xL4RxW1zc4VyRP0lLPEaBbtymZcVDO1jm02FoOe9WUqIQ2ol7n66xDuqmpVATVll6MdKPuDYBhlHKezeVrcjdytaA+5YxIFp1DGtlde1wjodfp1K25BC3S6r19wS/fBuG7iSwb4aw3yGVw4gReXrB6PCWn31X8UBkTQrfsWST1LhLljuwacInXN22tcKAfC3L9Qj1NjWH9yUoNnA3fbk+QQY4+QXxVmiRSeEqmJwk2NcvVfD9pcHuSzpF6rwru4RO9/NfZF/TM7OsH8i6Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(13003099007)(6133799003)(12006099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?387Jl5/ZSa4fHVsfrd3c3dw/iwHrZ5uCM+WLXepGRPQyzg2ZtsnU5N7SL/s9?=
 =?us-ascii?Q?s4NrzTgl4t3mjGneJMp14bzukKgeMCmwhTT9QJYoBe+bVR7tGMHpsizcBYwY?=
 =?us-ascii?Q?YAJ1rAvPwVj4wd94y1x+IIZPlih+BRZULIBjVyjsWnlROI6ozXwNg7fwDQMQ?=
 =?us-ascii?Q?B2dzI7Yiq/iLfrum+/pBM43Xcp0m5Mm8SsMZs0D22mfr1eroSBWDk6T2YglQ?=
 =?us-ascii?Q?DDrfAvtbyQJZFoobeTvlKuOcMosRZm5xYT8RYFTOsM3qdYxci8TW9axU0qQi?=
 =?us-ascii?Q?TQoXJBK9+mvWWFRulbRRUea3dhFQosJ6AQIp0Px0P5hsRrFzDciyeyi6P1yd?=
 =?us-ascii?Q?8Nw8SAqNTFE/nA3SD1sYg1rnclDx3SuhS4yT6/okaVdfLx/UeqgZO6xek1Pz?=
 =?us-ascii?Q?DNKp60JF4sCDFc8ZbTEv3/YNdRBTAY7BMv5cs8Nv6cU4JRY7IwM/d5U/nVFt?=
 =?us-ascii?Q?CVjaIQ0mPOEq3qVU3NHYa31FWqJ3k2EPW5snq4ySzxJJoL/dqihkMClIj3ub?=
 =?us-ascii?Q?ydS5WHcIVdQeuTv91r5BBsVIEz3gOFT3tRjtZuCTnXKOVy+ieFXvpnYPkAIn?=
 =?us-ascii?Q?RVIQVYKiCOoByubBvOYF41MoQDoEu3MIByUR22uomBIZJd37w6TFrYv1IccN?=
 =?us-ascii?Q?CypS9v3a9AHcQ6FPVEXVqjeoDtyhCtFxWl5ewIvq7AhU5J0F0IsTM3zrlHJK?=
 =?us-ascii?Q?NvjYQOJHL9s4SH+mc3Xkxrh8jvyiLAdgi65DqjKZ5HJFWq5WEoRSQxywJe1n?=
 =?us-ascii?Q?KW0ONmFN4Wi9xZ3M6vrMjfr1BvveoMWVS7Sij4siV+iMNW7PSXq4qBb1cdEm?=
 =?us-ascii?Q?t0N6z9AgE7ELbCGGhvymM1PlYiTD9wrTzAabPkICbH2SH3UsHRCcRYC+t+3G?=
 =?us-ascii?Q?bap1J27gFgsQrkgk7Q//93kDoOcPLFgDB6cJasg7GbjiJRymJdsw9edJzOn/?=
 =?us-ascii?Q?XhtPF+9avyKa3XDcXNDb2DcgBvtxOLHPxn9lc/kqYDGD++PaomZZEoaLuTj9?=
 =?us-ascii?Q?SO39gfiRJjt9in6fgMhPsiwghQc47lB+lIK1iuhVDHemZt5UkA0B2/4e1cf4?=
 =?us-ascii?Q?ZyzdmavX6Aviw7M1ha22vy1kIN9sPLHxfhAh3vAdlsoipOFtMXta9KKbLfUW?=
 =?us-ascii?Q?bCpVkDKzDr8kG8JJmgCrZyXuSU3jmpbY2kLJMFOe0hXeAKBO7OeAnxmQjzNA?=
 =?us-ascii?Q?8PihYFAuhfsGDTtVQflEs/bhJ04bCua7DVfrcmhoAI3byEHE5szsBLDZ3Okc?=
 =?us-ascii?Q?iH+VKCoG6/shRc56inbPwtQ51/tk0jRzITU8X6YBkVcoTYjI6OLbj9wzyIQW?=
 =?us-ascii?Q?u2ZmXy5lgqmprOSRHrFB4v4AtlZSQJj5OOhJWN8EGGrZbmK6XutRpMIBtwvS?=
 =?us-ascii?Q?BfANIBjLltLuRL8ErYOVDiTRNBIMheZBBCy9sxw1oc3HOqJ8I4+QwCqNwxAf?=
 =?us-ascii?Q?8nmf50YMqe34TrELUrZ26RB7JwuTnS4yUAlgLLexNrkd5TF3kVf+nWAHiZcY?=
 =?us-ascii?Q?8TUM1u4db9tqDNt8Ps4wW+Ys1LL02z3kqKEBKGUKp/lKxbN1Npoxm2P8NnL0?=
 =?us-ascii?Q?z3foD/cui2dlCgY1VTzwpHTOxwyvjQw9nBuQ2yzlS56o/xefi0Nb6UXsyGgR?=
 =?us-ascii?Q?1sIHAuMYQWUborVrunJPNxwyWk0SwcnMFIvO40YUqoedG2tho/tnh8yJgd2J?=
 =?us-ascii?Q?eTw1vOS/mKiRTzIeiIVAkRU20Op3zVE+0q4uRwr+GUmEQz4hh3CccK1HPYEK?=
 =?us-ascii?Q?niSy7LeqFFJE8GL09Rl454ERGkc+js0=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZaSuHI3wjW6q4YTqfHZctftGSNSFagv4DDQmSvAaYywfCRLZf3YJ5mljRvzGz8k1f83ed3kYD88UPjmeU8krJRkPVTdIZ0GfLmuSegdeB8KW6jjL9Y/lYmZ3G9KIlqZXyU8yG/oxRTSFRWaMShAJ63RgvuThSiEU8vo3Eo5Vha+YVBULTSCdJhJBRiBVNFrRSx9jlwi+IHl6Q3OqsOSjrJzQ9YXPExOOnQerXoz5g9PXyljRyWfM4gAQZpVx6lk0jLijFmMnVLEbV/ikATgJqZcoK6WaWjgwrenqdDGy+aORe67/KE1/T9ZtrIhlAWSO02129rCLh45lxoQZAkJIyw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc04f214-34b5-4b9e-f33b-08def1de0e7c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:36.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bQpTBxGLWzXyMDA9JIleLn5pIe66oQGxnWP3tZpVa4vAtx15E6llLIOXeMujkJ/Jx0aBflroDNACNOwhqe5iNSwcF9FFsTgVht7sf7rgAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c9 cx=c_pps
 a=MlxngMRGYcnGG1Y86Hm5lQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=UuYfaZXYcpLLUbsT0ZkA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX0kghXh3HJc5o
 ulSTNZVC4jGSTv9E34TjpZH7rxNgJqJ32mny1ak0zSoi+KuzMPqfGlwVpsDShTuALnOvw2QsVd4
 7xvR8iGEJYaKxkqe24DNJmCEkdTsnzWVaCaSgNjE7FLtp0n+oRnqtTZtt+UVhQ+s4fIu5/6AFcO
 H0+AD4LlW7mKsFspKuHdoBiU93JxA3qr39SzFsiKqZw5BT8ej45UNfwSSlTuzA8m+eH7gRnp1st
 Uxk86ownVF24v5bINgjGeuBhKSXP5h+d3gcx1oGYJPXE+vqH78gqzI7VYJ3qIlBgyiFwK2+v92L
 h1/zHYqYIoq5MzMa4Mxzms+TeXvvwOQV6/+xzLyQG/sleDFfhyHBOHPYLWUYIhUpsFFQmcqXP59
 5YVEKPOz9vdGcvHtMLrl+1rhYGDISm+QxrWvuWePcQQDuV3KgEgOg19lcQOJWuGb0PhqakclNsq
 7f43Zc/20TQnqDDG0+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfXwUKR3trn/Ll4
 F5NbX2Hji+cr0FP7MVthv+k2hg/p4b4xnjHm6S3GB+TdLhnnJ2e0bdX9zetaUrEXq40Kz5RhPbu
 YnzpM14fz8hvesEsFbVr3TG/PX02/nUVYr5NwzP1j2lAiQFPnLuM
X-Proofpoint-ORIG-GUID: 6wOTMmWgiPvOrCByqSVvkS7QX8W0izeL
X-Proofpoint-GUID: ba727YievW3zDolAn_I9BtSFKnSgExNL
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242693

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive
format
exceptions encountered during archive scan

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 101 +++++++
 ...nd_filter-Use-last-bidder-for-filter.patch | 185 +++++++++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   3 +
 4 files changed, 547 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..2413f70785
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,101 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
diff --git a/meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch
new file mode 100644
index 0000000000..f412b548d7
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch
@@ -0,0 +1,185 @@
+From 6a3b6d4d2924e623c32c398b74d61bd49b88fc36 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:27:17 +0200
+Subject: [PATCH 2/3] append_filter: Use last bidder for filter
+
+Appending a filter implies appending a bidder. Always use the last added
+bidder, since it was just added. This avoids desync situations where
+previously added bidders could erroneously match.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
+ 1 file changed, 22 insertions(+), 50 deletions(-)
+
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 8de1b2ea..9dd9f536 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -33,14 +33,25 @@
+ #include "archive_private.h"
+ #include "archive_read_private.h"
+ 
++static struct archive_read_filter_bidder *
++get_last_bidder(struct archive_read *a)
++{
++  size_t i;
++
++  for (i = 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
++  {
++    if (a->bidders[i].vtable == NULL)
++      break;
++  }
++
++  return a->bidders + (i - 1);
++}
++
+ int
+ archive_read_append_filter(struct archive *_a, int code)
+ {
+-  int r1, r2, number_bidders, i;
+-  const char *str;
+-  struct archive_read_filter_bidder *b;
+-  struct archive_read_filter *f;
+   struct archive_read *a = (struct archive_read *)_a;
++  int r1, r2;
+ 
+   r2 = (ARCHIVE_OK);
+   switch (code)
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int code)
+       r1 = (ARCHIVE_OK);
+       break;
+     case ARCHIVE_FILTER_GZIP:
+-      str = "gzip";
+       r1 = archive_read_support_filter_gzip(_a);
+       break;
+     case ARCHIVE_FILTER_BZIP2:
+-      str = "bzip2";
+       r1 = archive_read_support_filter_bzip2(_a);
+       break;
+     case ARCHIVE_FILTER_COMPRESS:
+-      str = "compress (.Z)";
+       r1 = archive_read_support_filter_compress(_a);
+       break;
+     case ARCHIVE_FILTER_PROGRAM:
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int code)
+           "Cannot append program filter using archive_read_append_filter");
+       return (ARCHIVE_FATAL);
+     case ARCHIVE_FILTER_LZMA:
+-      str = "lzma";
+       r1 = archive_read_support_filter_lzma(_a);
+       break;
+     case ARCHIVE_FILTER_XZ:
+-      str = "xz";
+       r1 = archive_read_support_filter_xz(_a);
+       break;
+     case ARCHIVE_FILTER_UU:
+-      str = "uu";
+       r1 = archive_read_support_filter_uu(_a);
+       break;
+     case ARCHIVE_FILTER_RPM:
+-      str = "rpm";
+       r1 = archive_read_support_filter_rpm(_a);
+       break;
+     case ARCHIVE_FILTER_LZ4:
+-      str = "lz4";
+       r1 = archive_read_support_filter_lz4(_a);
+       break;
+     case ARCHIVE_FILTER_ZSTD:
+-      str = "zstd";
+       r1 = archive_read_support_filter_zstd(_a);
+       break;
+     case ARCHIVE_FILTER_LZIP:
+-      str = "lzip";
+       r1 = archive_read_support_filter_lzip(_a);
+       break;
+     case ARCHIVE_FILTER_LZOP:
+-      str = "lzop";
+       r1 = archive_read_support_filter_lzop(_a);
+       break;
+     case ARCHIVE_FILTER_LRZIP:
+-      str = "lrzip";
+       r1 = archive_read_support_filter_lrzip(_a);
+       break;
+     case ARCHIVE_FILTER_GRZIP:
+-      str = "grzip";
+       r1 = archive_read_support_filter_grzip(_a);
+       break;
+     default:
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int code)
+       return (ARCHIVE_FATAL);
+   }
+ 
+-  if (code != ARCHIVE_FILTER_NONE)
++  if (r1 > ARCHIVE_FATAL && code != ARCHIVE_FILTER_NONE)
+   {
+-    number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-    b = a->bidders;
+-    for (i = 1; i < number_bidders; i++, b++)
+-    {
+-      if (!b->name || !strcmp(b->name, str))
+-        break;
+-    }
+-    if (!b->name || strcmp(b->name, str))
+-    {
+-      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-          "Internal error: Unable to append filter");
+-      return (ARCHIVE_FATAL);
+-    }
++    struct archive_read_filter_bidder *b;
++    struct archive_read_filter *f;
+ 
+     f = calloc(1, sizeof(*f));
+     if (f == NULL)
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int code)
+       archive_set_error(&a->archive, ENOMEM, "Out of memory");
+       return (ARCHIVE_FATAL);
+     }
++    b = get_last_bidder(a);
+     f->bidder = b;
+     f->archive = a;
+     f->upstream = a->filter;
+@@ -162,37 +149,22 @@ int
+ archive_read_append_filter_program_signature(struct archive *_a,
+   const char *cmd, const void *signature, size_t signature_len)
+ {
+-  int r, number_bidders, i;
++  struct archive_read *a = (struct archive_read *)_a;
+   struct archive_read_filter_bidder *b;
+   struct archive_read_filter *f;
+-  struct archive_read *a = (struct archive_read *)_a;
++  int r;
+ 
+   if (archive_read_support_filter_program_signature(_a, cmd, signature,
+     signature_len) != (ARCHIVE_OK))
+     return (ARCHIVE_FATAL);
+ 
+-  number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-  b = a->bidders;
+-  for (i = 0; i < number_bidders; i++, b++)
+-  {
+-    /* Program bidder name set to filter name after initialization */
+-    if (b->data && !b->name)
+-      break;
+-  }
+-  if (!b->data)
+-  {
+-    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-        "Internal error: Unable to append program filter");
+-    return (ARCHIVE_FATAL);
+-  }
+-
+   f = calloc(1, sizeof(*f));
+   if (f == NULL)
+   {
+     archive_set_error(&a->archive, ENOMEM, "Out of memory");
+     return (ARCHIVE_FATAL);
+   }
++  b = get_last_bidder(a);
+   f->bidder = b;
+   f->archive = a;
+   f->upstream = a->filter;
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 63c66eea81..9d7bfef231 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -32,6 +32,9 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0002-append_filter-Use-last-bidder-for-filter.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

