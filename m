Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4886BC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23020.1786337592442990372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MgHYBSuF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A47doW1046466
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:53:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JrCVkaQCThn4ktPZv4nW24GkQZSTvCXO1I05CqSMaK8=; b=
	MgHYBSuFt6hFmEacCNuHirlg4N1jPiupEGNrf6Ia1/1VklGTW0FvVgiK4s0tCAT7
	B2K2wbYvBGDWGL+qYfBr/YtIMmFPHu/QepSuwWLeLRctsgej2U++ZZVX39PqH6fi
	Avwvttbt72KBZHi5z9uRyNyzsHoZfUeXr5Qtv97LXIbWqqOE5UWhdTFVw1YQZv0b
	iYrgslDnOXrHj04arNtfQj3HrXw9KBrIOTBRZXJm6ijiXssNG4fRk9tWmqeLOO6O
	6HrcFQe5D0E0Vn9CPjKJNEQPekXtn2VUItFnNkU80Ou1daxuLRFz2Kk1+0F8tj0q
	C/YLNz3slzleFkzPzQ018w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fx3yehf5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 21:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA4DShOjf5J9IxVQ09qOqrd2V11n0gYrCykD+IMbE7M1zrp4BpxR78VQdYjgFrCEhXbjTIXwrM7k20E+z4E7r4RHZgS5mDQizEpc03KkeB/FyRKk1/Gljft+vHp/gmjVPLwZJCEkkVXVtZLAoR2gfDgvdnOITLZQ4MUVJeL+4+zz4nrdAaSZR1fsS6dpvkVBfrL0h9NjHIv2u8bnDKRZQQu/KPbOln3s4VxhhLA4PEXv4cwPE8jZGddg///GyRk2RbPFzIhak6iIclAM9erbiukP0VtbfuGTsbp+LDleEDpNOJaWIdVpaFTQNGpHddol0vslCst11jld3LoemwnQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrCVkaQCThn4ktPZv4nW24GkQZSTvCXO1I05CqSMaK8=;
 b=Nn7QAa+6PjkfEWvSlr7Ij9mhQWesfP/E5KVeQsthCoLeGPsYQmIjizESvhHWAPmDPHn5RT2RD9YQq14iFWaua/+/iJitQvV0DnJFsFrxPzXWNXAQ1Z2bueMGFcDac02g9hA+kjBOJhr9qGohEGlHeYLw8tA3OEoKTqnYwkUmUwxteEufnGlwjkLa3KvAoNV/BfxncJfhh3Fds+PmS1Zx2OOjLENtx4HahHJPqLRHQEeOa1R9sEJ/37qQpE/DRSnZE765KA+Fia5kzJqzd2G400IfY2v/+ohn2aAtaIIEgII/ZkADx+3vm8Bcvw/UtF5nkpQYdcSlXFESRkd2gtkFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:09 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:09 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 07/10] libarchive: Make it work with rpm 6.0.2
Date: Sun,  9 Aug 2026 21:52:47 -0700
Message-ID: <20260810045250.3903576-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a66f883-575f-4d95-3368-08def69b4622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|13003099007|12006099003|38350700014|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Iqsc+94xqThwoxV6iLsKrhHsVuEjrsZDzUdDgNvEi1czWvvW8c4+lWf1F1zY98midvHKWV8Rgadt5IMKCRC6MECt4pTR9lfpksBTuKwl4r/sJZkkVc9YIY+tTXzMo+xXNPzNsbVJGXZquGlAQkliR2Ecl0DRi57Bbr1kgUkcxv7Mzy/GS8WlQ0Ncx71eCreyq0ktF9TT2YuQK/SxDbdeKKWn2GqY7qgbCgQHWuSyH62PVwlCs7jmV1/2D9roAXzi2gFoDec0er9ikAISB7U9wgz82K4iOCw3rcIUBXAWFkYGS03pXBYGp7Pp+uwO30H9t4GjVApEKhB/1QgqOIdyH56V/bBx5XYqh+1ly1MsC+zjfc+0kXoeescmkbyGPOACSOUJbUWAbMieaxWRtwOUdj2MquSrrghWczTXo7Mb0Vk7Di5nOX73G7syn1bLVXZE67h83GHw8lkGwndxzySgiL0PKGqyF3UyZBbTPvXQK/1A+F08ky6PANagrubcQunWZnaDoM2265I3nPSvVqknIyv7tb2/lyDtU0V8dy9SWHlhLTMzH1DO5vip20iNiIDvTKtdTlC+HlsyvPd1l4qRzR3VxG7dufoHtwPpUN3nggtgZnrkBUnFaVj72NhqactlugTZT4C1jrGVnGZls/3v/ms61L3CkCNBLQhZoJpdu5U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(13003099007)(12006099003)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fMUcLafJO8Q4teDWiQlQUPlHuqVKw7Qy1LIUUSFBOXJdfpeX+EYyPiXgte5H?=
 =?us-ascii?Q?oaytID8GSoXDRshm38vsfiRmIb0BIbAyVTpNpiHrbL2+uVdJ4SlT7pmHWRER?=
 =?us-ascii?Q?+WIQsyQ3PxPS6H0VqvvJNoCL2X1rCV1W5Nzeyq8HhQTOODsoIPrNCZ5qqJHE?=
 =?us-ascii?Q?Vt8d9YfsQywq+MjC59ZmUctpvoab3M1IyDOdyVnOBrjeb38bsTyILcPWW9gG?=
 =?us-ascii?Q?epgSTp4qCmi7MmjQX91UbUO8AgaHAg/5dE/yBT3FJc/7TIBZHc374xN5HwdR?=
 =?us-ascii?Q?7oWbxyRF67P56SMhSWuuQdsRfRrsb2CMSp+16LaXebOsFmpNNiYAvzs2SfvW?=
 =?us-ascii?Q?itHAymNWMSXuuTeKsPSGcfTKMkvKVG4A1vKn+quD0TRqwfVbT59luCbA34tk?=
 =?us-ascii?Q?JZAiGHfysPaxjVgHXPbwPzDpDmqTrViwuRhwZox6FpACh1WTPYeG+cIwUbuh?=
 =?us-ascii?Q?4du5zq+sUbaYGYYRp3gf7mRtgYXiYYlP03bJF2voJU3wClzhhytm4RD0hXU0?=
 =?us-ascii?Q?gN7MR2HgKpbpipf4gk8pYdBXYWM4a46AuvepPrK/72I+EkCQFmcXIM4ID3J/?=
 =?us-ascii?Q?HuIOZM27q9IoLRHJ/toPLXdpSgz7qxhKk3PXG85EdKrLgTEQ88RidP4YcdL4?=
 =?us-ascii?Q?/LP6n98Y4zCbVYMsOCy3gL4CAOFwES5vTfiPiwh53sE0Dp0omMkIwcN7xuxQ?=
 =?us-ascii?Q?+YTNJ/R08fMox6WQKo/jp13xTP3YAQE8qRI770idNs/y27ufmYKUJEFiRaUJ?=
 =?us-ascii?Q?nFpfRoKyPPIf7SvnI0j4QJTgtKxiPdfKvUXTXw3c1ABrz6HIf+2PxYcEyIxJ?=
 =?us-ascii?Q?BBySfq8T1nO6AoPjrUfLWAX4JhMWo69Sjzed7ac1XYT/ptACzGusIztnfdCq?=
 =?us-ascii?Q?tWu0Gh+bznZfhVM4yIqXxRz5kk+fe4NiG/KcUUxEjtckOmdljw9L0WOBRbLl?=
 =?us-ascii?Q?Ct49NS2OilMjVXIVzucM0hyldFnFRxEKYY0VLZLP7lwu9VFKnyKBJHr+Memr?=
 =?us-ascii?Q?775z1pYh7h3I2uab0H/tY8PynRVKP1duHgPaOOjrLCqM531xW9vzVd41Uwih?=
 =?us-ascii?Q?YZtv6UkG5P18ETraT5B7/c0vnT09lQB/L+7cwMAG8sL6l6DpStnfCrEZrYlz?=
 =?us-ascii?Q?pakFTeDjhk0CQCpOj2L3l+8FERzihyrGE/JtDr/ccjmjO0lANR07VZ9lvYTn?=
 =?us-ascii?Q?J+Ff53Kkultvt0ophYCdyAt06WS4lD4eJZ8KmYOruOBggN7whUfo1FI+GTPl?=
 =?us-ascii?Q?YwsywrVNzLnM0B1RCgPKxCAqax6quMXBuCFsf9Ow9g9msRZ3Zy7J44UO5H+Z?=
 =?us-ascii?Q?6B6XRhTzgoxwUPKMZF8pwDhJvDOmVYKeJVWXgntf/ryiz9opHsii4+/GN8kR?=
 =?us-ascii?Q?QzOH4eO7H3lX0d2+//MLQo+iXHuo9lKxNhIL4e6uYe0N0skKTFEDfi2mad/7?=
 =?us-ascii?Q?zyWAKqQu6AJUOONlBzbeTYPH6PNWfnkyr9HPJwbDWeqxbtYvXfpnxC4Zxj2E?=
 =?us-ascii?Q?1eIxco2fyDjQIJQUkzxV3dmFrSWoA9zcqPSkM6gErhjM8wS+ADvYNmTwDznE?=
 =?us-ascii?Q?nhTZNR1MrWmSOISzLxR+f7MxV/cOwI3ndRoLI9yQ/e4zrVVTcqNy+j06aqHt?=
 =?us-ascii?Q?wYQ9WJJzVxmvilq6zupva71eNUlDL07HlqTT8UZDl9iP0+2xgcLjH8OjgkIq?=
 =?us-ascii?Q?f2nFCK8u00neI7RGuLsXmY3Owjip+NQZiiX80osob+MMo/ihY0tk3qqa2X28?=
 =?us-ascii?Q?KxAnhpBdfIoQ1p5eTI4KgK4AF7FPJMs=3D?=
X-Exchange-RoutingPolicyChecked: 
	T8yq412TUkgdVpu68MHx9awxNIY2B/tUGJBd7SIcOQ1a5WMUdzJ1tR5YKcPcLByNimaIld9XZNI/VwJhmcWuKEwZ7QcdfKnu10qASnzvt7MwDAwIfJ077sXqY21Od8lHnaz8OyGNi/4Jcn+PC/rXFStrtWIqgYQA5JS4wcPBCzPv2Liwf1mWYFCJkgEesANKrldFQd591A/w6KfRjRioC2Nqj+OStDsT6aX9Hr5cR47AiWHQcdu7ykYVhpeCtc6PZ/narEng3a7GOMmYdn7+xEsLBXh54Qh4JRTpkcuvyltHxHMPLkk7LaDRx1gxRptS1DlCBtGZHDsCnIHyq0wA7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a66f883-575f-4d95-3368-08def69b4622
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:09.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOYATUfr4D7u+VWKeemH43Q68zQ2D8lxJDYW7QWfx0noxCh2xeCKb/at5oZz2a3av/ZJggmE/zNUeqUe/upSAaVxvRr79dEW4Rq5xsbvMJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX8IH3NDmb3ayE
 bDCibSQmRkAXAS7Eg7PHtc2jW9tYchd2KGHi+WePx1cQyyzY7yY2fk8DTDTM0RI2W5Zn0a765Ci
 NFnYwUcBYs6t9/8TPJGCfON2spalz9efHLmF1oZBwKu3x4jvB8o9pO/RnKASclqdh9o5Msfwfcp
 /uuIpIyua/VqQ2bA2RWdh/35hV/z9O5av5579tLSuwDMiYEdJhUUCpHFz7m+wXC83ioX0byozAj
 VL6WqE1eKwRVs4gQGiBuPeZfTGIBS6MqyZLhGaewNnyu3wwDv4Yi/FN9Ku6SCKvoZ89faQhZwBJ
 zq4EI368hzI3GJp0DfsEOm8RsS8ry6i15dq6reNH5dvjQ66U+c106cxUzgeqfK9jOD8YGycbz5w
 a+3xZzxarYQxK4+1jWGcaW+oeDOxE31+iR1yaBA28GQpR3bmwxqO/KuMMJxqH4yk3nbBi35/tqD
 LqA30Kx9j/z/29GzzQw==
X-Authority-Analysis: v=2.4 cv=NbHWEWD4 c=1 sm=1 tr=0 ts=6a795937 cx=c_pps
 a=T1Jff0mhgTaaoho+8HaPfw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=UuYfaZXYcpLLUbsT0ZkA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-GUID: fO5IX_Ns8w-tpsoDBRGxNLP9Je4O93e2
X-Proofpoint-ORIG-GUID: 712DIkLOxvKK-RlMl6DllrpIaiVfjJZf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfXyoARYwZ8lx9J
 Wyw1+uluo0MQ4c4/9nCtWoolsAWoWJEde6jbmKpyCNkcwZeLe7xDlsdWQi0pGq29nmsNoECAr4x
 NpjTr2oQSZChjiMWlC1iaWM56wRQ2Zb6rWQy4a7t1rjHqSFlNuam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243098

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
 

