Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AF9FD5F9A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:17:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102308.1775639835995176046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Uxhk3Fpi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8558433a42=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385loCH3549081
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 09:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=oytNppXFm
	Z4poq09+AFoFjtDeFzcG9lZzNLy3L7AIsk=; b=Uxhk3Fpi+R8SiZw1ZTrojko/J
	slFjeS5nZAkP+8oojcr8YfkZkJA/vFzWhqePGEfmF35Ql/8mDit+DthCYq/EdY5U
	0LH/uVnfIb0uouYW3Gq22itfqQR4u6mVAx6o1nT07wWB6FkK+r8ul4mpkJRyrfYA
	PayDvStOzGFfwxzHoUj+v7t1EcD8H7nVpy+k2F2NsDMFcyO3zNuWjCicE0Aq3mz+
	OO0+qsgLSM14z9x4FOa5ULt0e6JKmnbEmcv6HC1+QAtlZu5L88FPudJn/iAlVLvM
	aNOQDOOV9h3okxfLrl4R6OVsEIdvnpRqmloPGIR9OUzXhcCJIeizqpY7tysBQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrya9ay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:17:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ4y+yFmOLm70hqnRqhEfL+3yS7bHNaPm+2dRdcw9wmgCZja85I83WpezfvSNIxLMlzcjFuqcxy/6g0NomQNEf8FDGmY7w3XLOj++SKy9RS1MFL6qBA73zkEN+EtCKmzlyN/4FmU3zJwco9IV8OgMOdWoInMH9CqZKj5G1XSnbLYJqUybxl+yloNpB+gsXgRkwS9T4bwnqElouSJlJ85z+0hS8Oo1cpJM3q7NCserAxsuf9TFtilQEytBHDzrRLqaWUbQ+MhoIi3a8yhB77+Ir1JKIeIfhZlGjN5rt12AVNNxOQ7hk5B59VC3Pz7z4qD/GTeFlmjin4P7h5gmORfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oytNppXFmZ4poq09+AFoFjtDeFzcG9lZzNLy3L7AIsk=;
 b=Ob4H6GnhtzJaR0BjSNxukDNXQPJlOChs7bEP/Sf/YQIDbgYtsUN+wDwQ1RZDynZCsTMrOPlbGeel0XbLUnXz7Z9RGAAsjqgmzBv5GGoZE4yPiWFILn7sIIsXt+EeO3N8AnRVzfn5JAcZ5lJLwXjkjbS96bA0SEQYL0mdGaqdj/mM5BJjmZo2WjCV2mOpn1txJ6LHoUaR0RzPfiXMWpZgwaXweb5ffTJMwSz1KhkmGjsuJSU/CZ7wM/xZXLrvDo4Svk7Fp+TqIKnj0EiXviXhmvrQzviRbTGnrkW/voKveL2BcqaJKMYUvMKhqoymdwbZHo4rBzGuTOd4q0jNkiY5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 8 Apr 2026 09:17:12 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 09:17:12 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] glibc: stable 2.43 branch updates
Date: Wed,  8 Apr 2026 02:16:26 -0700
Message-ID: <20260408091626.3423299-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: e5973c18-674f-4715-0a77-08de954f9e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0zb/sXuPSFx/15UBJII/9l0U8l11hs6fV0ePvx/p/kdG3LkJwaajBHsloRYIGgKdCGgsc2TE2+EcuA+ewthL6rIt9QKckntjMFI1QKbcSRJcm80a5lsB7gqDfw4mrWW0h2Is0h+yAGt3Pf/WSB8iayQb3HMP4OS2djciljviJAV8ZOULPRz9PNHWab6QgidZAFflW6jIHLQoySWjcPALSc/OSxumAqJoRG4lUL9KqQMGf7qlFlQOV1bqC3sWzpguflSAZpvW1L2r2z0X9gQPw8R26rO4LarC76nz+mq62YEFIzXLfp8NHQufR4TKA5LLEYFyUwCEZy1mGbNQrIQWMnGRARWz7iP1lXZdeARo+fG9aApKF2UxElqnoHnNcl9og9gNeOCL3xABG1foxFUAQkLnlnPd+T197afmaH4U5yfiWExBZti6PkGdfM2I4McS3mN2pgSQQo82klpNEW0m70vD94nZEP5ey5LzcjSWURi5Pflds5r0hapTCP02eVmGLmpQgVoxncGnKCFt2rfJvMbazghrOvxrVsjoqbOEM6iFiJg0/IaMLV8sJqEXALMhC8F0wdOyoYuYmLCbPDKLZRGWX1uJOGWgFPFlvRJw5viXt/2sbto2nULJvxESkqlFoFLQVTDmEzOvZrbNar0jkbZO2bOt0jvosgGKabZIZXg21HkjoA4rSZQyMulzfy/rXnfVXCEPhdVdai+tFxMDa3j0J1wWUKk2vIjIF/iHONt7xQuCaZgh6psX4SK5wcl2w05z86Q38EKSSrdbAOU7yaTyS9ENXYHXe1THRKF37GQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4DfXImFUCDjnRqbVRNKgA7WpEct+tSW3rvV1SFZcIy682G8cNM51SWluhIEJ?=
 =?us-ascii?Q?5mnZzGC9afViE1WR7fht9QHLb9/Zj1TVqQm01U1Im518UyiieLfVpgF+XUok?=
 =?us-ascii?Q?keQyrFT+/fDrrhvk6Q/XH6G42s+5SJ9Pe4JVODbkiZYcUt0NaFxVDHMD3VxW?=
 =?us-ascii?Q?TLTiHeVMOT2YVAlOmJYck99ZPO2nY2UYGcjG6xytF4Ym9hQ16hDmCjwm4gyI?=
 =?us-ascii?Q?GxABdFHJO7I8gjDV1+UTQkBXMGYyVtBPIQG6ZctM3ZYIMC7RlSHXE4ubwJjE?=
 =?us-ascii?Q?7ssJOUY+Nef69waeXBKo5kfTiU2//xZHAPWgYuaxffb2THiT7c2frHikngj/?=
 =?us-ascii?Q?1hFLpoFOiXfkrZef5wualyYGjhS7p7u24VQXMQAoU8zjK9PGw85v3hUu7hAl?=
 =?us-ascii?Q?4/LXoEeVArqJmzXYASDf+4auTnpIDP91VwPWuJ1GNTjJ8aOh1BQTlD84+BDy?=
 =?us-ascii?Q?Et7niGd75znSYubNboRQDO+YYRgZPZIOrnfnty/gqYCr4pwKNnaUK1w1QjJb?=
 =?us-ascii?Q?XIE2ECssHecLVw44WjP4VOblpKDE/7D34/dF3Zwo8xk1XN3ZcD4ZuDjAFsAM?=
 =?us-ascii?Q?wqQ+xfVZl5h6h+1BkLDDK/BwJ9c6pEFYT+erF7ECnQWPZJUaY/aYaX5JVB+w?=
 =?us-ascii?Q?kYeCG71AfaeQqj2A76OrQ+HrXApParIGl6oMv1y37emonmTLSyn4a10ZoBU+?=
 =?us-ascii?Q?pzCC3YfIS4bamC76NCg5aEDcOCMhVMy+llI41DZmnvTHxRkwZIV0uUv+C+2m?=
 =?us-ascii?Q?/a9q6/8X5L+yFINPBJn8N0jjiC5UKfQOHwxqu2D5WxHQUBm2bOG4CMuRDmq2?=
 =?us-ascii?Q?QjTDHvzvABwjdniLy9ToogoUfJQYFfZPvifLP+5j3wn5tAUeeZZlmpLa+/ok?=
 =?us-ascii?Q?Raq2tg6Cv5/xdGBfGEUGjamIzJbt/CNvMV8AhwiFq1O20nloqQlR2n73Kf+e?=
 =?us-ascii?Q?NXjs0nHPWjsiGgt7Tf9C0l6Cj4T4owhoNxOLgQECtwNpK/u4gMFhPWVoPpjr?=
 =?us-ascii?Q?7fCQjJ/esFCiPj0b1FGQ8JLBmShXl0sRzdN9eApId+7uE9y5+yZPcCEUZ2MS?=
 =?us-ascii?Q?oUhxzWqiUvSxkQOlrQ6ScWXg5x1brFS78ayWLzI995XkmnTXwUXKLIjRyi3j?=
 =?us-ascii?Q?ehb1pFSzVjpStlW/XAQqZUUZl/cBUrkjKZq4kTChVEqkL3VbovLIxSXgI6ua?=
 =?us-ascii?Q?kX8OeqRqgGywuyDEv0JLv3G/to+FjEK6axLSj6xoxReM7KzmVFdAJZTNiFzZ?=
 =?us-ascii?Q?/eeRpPWaRsyetNFL78Cxer+R68pl1m/0WAOX+ZFFKz2QWhfvsEcxmw9q85Z1?=
 =?us-ascii?Q?RBNMpLEisMX6AFHeHwSF8ZVAw2iy3NrFVW8o5koMZQhNdS/5hWfhIAS3N6FE?=
 =?us-ascii?Q?lJ6cXmEm7G17NN4XSkLYf7x8ccYOkPbp2dmRZQMIRsk9flymVHXVGy08D1rm?=
 =?us-ascii?Q?N4wvNwdd9qLrlOK1JTXDIa9nccljFZvK+TrUOgSQTYfjn1DAC4EC3nZz85em?=
 =?us-ascii?Q?j1bCY9vVRghO7ZdVXBB7p4AGOX5CAsExqxbdGrKgtgLNoyaDYk7trOeN32f0?=
 =?us-ascii?Q?mErOpUHJYfHlNQf/bvXkJaPqmDSNVQa+B56OjburJpNAMcvAkTpybg66Vs2b?=
 =?us-ascii?Q?JndtdISbqB+tz1EvD5wlcUrdSwcEIZlP5ryBYbtMZTa1Fh+AUt2cHK4QqoTq?=
 =?us-ascii?Q?myq7HcKIOM/mZ/d3PGkj3BqAsYCXhrQrtIYCuLPeZnGcd78DWWPONmc6dq2D?=
 =?us-ascii?Q?qgMzXvTpIvljg7VCdsfPkB7NYPAX4qI=3D?=
X-Exchange-RoutingPolicyChecked: 
	LMLyBEYTKAbueRbkpikvycqN0HunZCHIHcCmrNBnz1qbpks0woRzRh7CjT9mGTH87EUSfz6VN8lTqqe+ivFbBh8rayTzR08ANmDSAGhUeK+5qoAgDk1qN7oxcf1n7tAiTgPKt1eip8eRVPe/RfT1W1gnI59D4ActSbT0EoiXa6eiDzxFfdIhIsAdXi06NxuA95hQlKgEvSeic5gaq6G6cDcczgMZeHB+p5uLq/j+1P8s1W/Br/H2sGhdS+z38UEInyhCufHuKn3QUb6+eOB4sMAAmTBYuuJRySByCOD75KaUOEY3/4tm+wtHxc2PYTGaaJB6QYUvFwGQXgPAXxIFZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5973c18-674f-4715-0a77-08de954f9e43
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:17:12.4364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv27UZj3pqc5hKJcPHtm/8xeozHc+8/km+ekvGTDr9UJN/O4Pm/X17KHE3J1DI3C+kUFU03hWbsmCGaeUaa6/cNgPOEB7iDwHyjVnQVf+lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d61d1a cx=c_pps
 a=CgODY3tvNtn0KPtxrBvszw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=VcIyrTtR81g1xV8FCIkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: saqbqSZ2d-NeJOww-mA3Xx6NHBjHhW40
X-Proofpoint-ORIG-GUID: saqbqSZ2d-NeJOww-mA3Xx6NHBjHhW40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX165t096dy1sa
 giR0lgKN1Gbh+QC0CNijbCgYfKUXXutXWyVfP0Q1eOT9iy9DSQZFKsYN1oQaUcLLRkM1Lt3967t
 Go7Hac2cg7Cf94B266o+HMctDr3CHAI00MSL2QgdDKUP3wjqKlJazlWewWmP2gQQSbitM5ymopM
 2dals2nqVN7FNkn/RRleeAfpgJsJywr26QQsAx/NH2ueNFOq/MalJ6bC6NUoHBxzs/Azpo8SwtP
 WNftqf9eK6R+HGuSy3nv2S5+s2WuVMn4K8SvT4fuNADumpnQq0p6lAiUz/W2xRMdjFb3smU0gVN
 IQdFC3Row1TWId43WRptnOSzLid/WQ43EYkNmWDZWr93tcMp8OCaDoFyGaB6hj+okM8pNaTHTB+
 +VVQs8lsTFchraM3U21iVk09LbhTUxNWyGrBw0XumFuR80oIlhYGAwSk5vSfSJqr5gTQ/wrtyuA
 9apv/UMnnYP1DHYE/5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234818

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 856c426a753450b8c6861a5b994a564f4fc16d4b..ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c

ce1013a197 tests: fix tst-rseq with Linux 7.0
60cabd0464 riscv: Resolve calls to memcpy using memcpy-generic in early startup
02ffd413cf elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
2695314378 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
305ce0b588 aarch64: Tests for locking GCS
2ee41ba6ec aarch64: Lock GCS status at startup
fa4a40c7d4 tests: aarch64: fix makefile dependencies for dlopen tests for BTI
9898ea58b5 malloc: Avoid accessing /sys/kernel/mm files
c3ceb93dc4 Add BZ 33904 entry to NEWS
911bd469f8 debug: Fix build with --enable-fortify-source=1 (BZ 33904)
48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
d6cb7ce0e9 Linux: In getlogin_r, use utmp fallback only for specific errors
140c760d71 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6770   | 6774   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 29     | 28     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 489    | 490    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-tls20                                        | FAIL   | PASS        |
| posix/tst-wordexp-reuse-mem                          | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                        | N/A    | PASS        |
| resolv/tst-resolv-dns-section                        | N/A    | PASS        |
| nss/tst-nss-malloc-failure-getlogin_r                | N/A    | UNSUPPORTED |
+------------------------------------------------------+--------+-------------+

Justification:

commit - 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
Fixes Makefile dependency to ensure the testcase is executed.
Passing new testcase:
+PASS: posix/tst-wordexp-reuse-mem

commit - dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
Adds validation for hostname parsing and introduces a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-invalid-ptr

commit - 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
Fixes DNS answer section parsing and adds a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-dns-section

commit - 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
Fixes null pointer dereference and improves NSS handling.
Added testcase:
UNSUPPORTED: nss/tst-nss-malloc-failure-getlogin_r

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89be8fcb88..015e7943c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "856c426a753450b8c6861a5b994a564f4fc16d4b"
+SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


