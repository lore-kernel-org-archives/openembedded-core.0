Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8374C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12510.1787621612575148747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qwAiWnYR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1H4iw331080
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=; b=
	qwAiWnYRpRkosACnE8ucIn8nWUQqEfO6v+aCvrlUsbqH854GwCWuAvCu8/uFTQE1
	Ex1gFJfVCo07Cw9Oml3kzY95ZEmV/sJiZCbUsvbVlgQS4hJrJg3zGoMdSNTxg7ZQ
	ULf3sQsfjdzuE0qnN8zBQYscTKpFNWPC5e/VLuIc4xkRGoGm5EssHkL47/eW13qQ
	RSN38x/i/CYcL1jv2xUW7VOEpjewWJPIQxa224hCkYjrn77ykVBQ6oa9l1qUJ90S
	47p23X+FmkraGR2676CnYu9TaxiaXdD6qzObfGDbTJyLRgz+1MS38RqwmMQEheT9
	hDjl4tcE4wZlkM+l8s/jKw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3oW/pKxSuVngT/aPH5Vv9YkX0hZz0dkPiqJocZxYhkTfxd+sHwVapysnSXYjz+MhUYoKKGqCSeURaTnGKLRwqI+OrvU8uRIqPkH2LdAYwNM8LR1zA52qeR/O89jfF7AWOuq79ApKJgYgrFqHn+LnGR3QQ0EArWrY/Z0DbbQi5pXf38FNLT/f3qVqOH8VmbIkn60+NB8ZqLNUwFHWDrbuFnzfaTe2ST/Su8SiHftitSWL9i7k2iBi/MOer1KSeHOY/XDRhVs/1jLprej8j/DyJ+vE5U0rRGpCQ7pBmCW3o9dcRndCu0gmgPVA+0t55XpVgZTXRgsqMdjdyKYb0Xm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=;
 b=VJEXAzQxYiMTpN8ATCuzh45bVOQpqxasdKCBV9xnicuPuO7JPvX87PbvhmCv3aEUF5UOsLPjgwQtp0hiJuptIE0BhFHSG5CQW2pjxJXsJqAindcDy7OC3okxSlq6Dhx+dzVj3VnUbRuDqPXlizVBKgsIGNGDil90bgcs+4d8rLo/pd23zU0GSEASFrhqKF+CofzCg16p74fWqGHcaczl8b2kqI2+nMnsvJwfyPD9IlT0Wv7qsQFFisTBEp/L1dbP/lKOJJE8BOnAo0DjZLo0Q3sggzkD7trV4DeZ91nsFlv0V4ZZ8qywHM+gzApDRsHGj5eU+HoWW8Aoqe2ozJNDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:27 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:27 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 03/14] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Mon, 24 Aug 2026 18:33:01 -0700
Message-ID: <20260825013312.2695028-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 85270164-fb28-4eb9-2cb6-08df0248dc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	URs8sCLo1+rYxjMtXpK9iTfFY82YFMvOBnyCFwk8xnU6VFnwhhMtcE8X4h+TZJEX8qQQA2zSVLoW6RiwaEbxU9PSAbBLqO9o3+k7myKbI4ape5nRMDZO1DK8Pb3w7VVmNhmerkl11MBPniNfVPwTChtfTdY3kc+rDJZoLXpbJtuZH08qDzvhxE6FRPZUbNrcSXyIaY5jtj1Am+jHMsvAE/tp7DUjg4rXNAl4366QlIR7wRXE9N96cLGADQv2Qj1waQUSFHcktqnjQh+uuTFPesD9rSrzHF55c7nFhQadofiQCv03dDDt2b38EnhwC1ipABItTLTYrsMd6b+JFiYRnHoYaXx599jFJm8K01Bi912SX3M6iejIibtgy3EocFitVOTUUVWQDNo59cF8o/xR9QgKhukFJ1sBIfrbIaU1Menx9Jn8aIQnVl3vqIZewDiFRgOczGV39NgkZ33Le8PIjGGhQrBGA+KDA/I5JWR+Mue9NAvFYHMfjgb4kIm+4XXA+35aGF5LlMCwa1FqtGqPO1U5xcXilu9xggmHbTzFcxhZ+KvVbCC1zhYCPQFw8FhvY+3fJXprw955MXrO6SI+ZFe376okJJQZSxdCij/qMMPvRBvIbWyx1Ed1Xchmej7Eedx2KDjIpTfJouQQWFpKE7GuBWaTpw1zqsZmjUE95QuMRxPsgZWIHthzvld2Q/n6cnKYtX2oHjtHZJHcQHoOLPSY/kEOb8hygUqWImFPovU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WuMn7GZGp/LpxCj05fGVEZipDzws/sOgr9TvfcNTEiWTnILB9Opln5inlWiU?=
 =?us-ascii?Q?pI1th5xoYkgTOM/tCFPbjjUvFZ86f0vqOYeoMwEJPT8YzA89jQjK/Nqwfqy1?=
 =?us-ascii?Q?qLEMmo81fGCA/0Gci+yTbDCrqqv9vOi51gnebx70o61xxndJed1Yw06fVYof?=
 =?us-ascii?Q?Gc39oOKrjIcXW51KWelcdAxoCYlNDH6m8K+9EAbkmOsYqavZMeai9xcCNCvK?=
 =?us-ascii?Q?Bow0o2H3EDnFVhha2UtS8T+Hf+Ulw89vuaGhHYNiVnV9mphzqmMd4x4vAVVt?=
 =?us-ascii?Q?M5AxCkPoSKFRTA7kwAuNkOzKMZY7LfC3T3mtcqx5bdElt7/OrXTz6lLtqItC?=
 =?us-ascii?Q?KrpUu+w2qMsOVSheCatnk/cQnhkKDt5QSBa+6Fq2cUPvQSRxWBnQ9vgq8S0L?=
 =?us-ascii?Q?bwgvY2HiP7ZBKfxYeEX6KxcTOihRZZqAqG8A2DyGIeDpPtE4mjK+KjqLq6D/?=
 =?us-ascii?Q?s1P7NnfBGObAeL8Q2P7TE4CXwzOeMQC8QgI3Q7gbxvPypAI3R5fKwqyRezjP?=
 =?us-ascii?Q?00C5uznHsXDJXrwem0glHfOVVEU+02TNwiakCJnVFBjYLjs0wWwmMdFgBHZ4?=
 =?us-ascii?Q?MNEnSsGXRoMoTLznaADFZg4H2gTFaRXI9rHvSjj1zuIV9gwL5wUyuzCbiPFB?=
 =?us-ascii?Q?lidNS7/IzHHdlqzu4P+czhe+Qu2ptWLmqNbbv7qktLglO3gRqVPSJTn/iNg5?=
 =?us-ascii?Q?HEWj6XSPTozQ30fpBHEz+/zTXdJK3jhknAQ8dInGYuH90SzSM91CMnuZtS4a?=
 =?us-ascii?Q?cR0TMuQUXS5rYyMoOy9ZOFrYrVFy+d9wuPsu72Bh6CkBhNmF3YnuRve2Qtgl?=
 =?us-ascii?Q?EqjsGK0WO9TRFwEszjul0REnNSBqssAmK42SLK4UqMtr0+Dnv7vgOGtbjwA3?=
 =?us-ascii?Q?HOMN1nfZ6d4SMR/5Wm3kTEBzSRFGdVbdyhCTc1CaSVdgNK//Uec3whe3V1KV?=
 =?us-ascii?Q?usgrxqj0csztACVseJdr+uu9wpE3sOANMSBTX0nbO0u6I2qE8ZMKJlsG/L+X?=
 =?us-ascii?Q?OVLeNrdI6gTpVguNgxqPq9FhID/rjDao/kM0FwA1QAZ0h0GAJdj8VKSXbmZc?=
 =?us-ascii?Q?wJNeZGXeEbDIKq12p5xZ3m4uCmbmR21YdW0qbELps2T5OFQdqy7zo1rckOCS?=
 =?us-ascii?Q?1Le8lSdy4wsgUr9z0Ap3E9ppSUhW5yr/jW8+w4MI8WWcf1Q3bK5WV1CeJgnY?=
 =?us-ascii?Q?SkIqoufyaXAdubHcCiDJij80B4A94deV9T7Hl9SgIXkIrq6q5LqvWtm6kzbk?=
 =?us-ascii?Q?xZWl5gxSfUSND5mCZBBfxK1JE6uO2YgXpL1Rr4CWwCXJogHzBGCAmRH7WY39?=
 =?us-ascii?Q?hT9eY7QzIQJEKTR1QIITZHnxpWKz6RSFLyPCat7fXrRTOO/uWCyW7gaZ4n6d?=
 =?us-ascii?Q?eL1dP+jY5azN7N4K6kqqWTersrwIjGSAl1vM7+ai8QaRD0MkX/iYSZ7DuA75?=
 =?us-ascii?Q?gZssNknnW+dDhUw00HWQJJIxU0hHR8+Dg8KO2MkgoEIwanbjxkR9i7kbLNVN?=
 =?us-ascii?Q?3W9vtDn8HrqHYTkeJKEqF4NGc6jcpA5Mg5esRHV5uPqIDJL4y0OFdYgR2SIS?=
 =?us-ascii?Q?ZeXRbKi1Anpt3jqAu1OLHB7Txw/w3y9SyzOmVkXIaaqBJvsZlT6l3/onBpSW?=
 =?us-ascii?Q?RSXKGd08K69EozkJre0gOygSggf7dFm5L3hDahTdug0lkXg1fLhtZ6TSN+4T?=
 =?us-ascii?Q?FLhM/3ZzTdBGp1szcaM86hdLfgV2Qes1V4dIg0s6X04HuEVv1Em3ar5/L1ZS?=
 =?us-ascii?Q?F+Ed2UaqgNKwZWdUopvy9JZGPvwg57E=3D?=
X-Exchange-RoutingPolicyChecked: 
	vu2vhlNibj2G96MUo/r4+RB0wx5waeajqSfQrEHEsp3UqtgZxsfpFR6JDA4sY53DbqpvMqdjuTKA9Czhx1ij8QZ1gxiRRoD8A09aOnYav6MArPsHblrBc6yke1OYxmWZI7H6B2wHMCKe6sMa1ipw8io1uKxmfXEQivglRvJQwVlvZ5alCOU47h9vdcXaNR0ZVm3siVRnAa6iJ/Dbg00Cu4fsycXJGst+THd6v06ftodecZEhzHZjV0HwuTu/wbvTCYYaZgI+z/kLkHX1CYlV6GmosQx+t5A93x1nasj0IJzGtIyuCHzFeEP3g3ONqsq1EkQTC6D2d5bLwmd3Xi0/Yg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85270164-fb28-4eb9-2cb6-08df0248dc95
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:27.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i6nmhztVRgZ+pymcvUaGrXXMSCm9Nc92pa5G/8lCWnEaOHRihqpnPhzIY299zlIUKBpnRvgv1WyIGJHaTOWZvqZLJAWQZyVQmU4xfpBccw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: iZrbPD6xy9s5owMBuBLRSRCYga8Wa7zR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX7lsS0lmjMoZD
 v4GuO1xCjIKE68W4PztZ/Xl3vQmzcGlOuuPXCVQJBwGJyGuJfn3C9UQxR9V7Yep6ZH7rBUhva96
 LLSkc9zQJDrHK7rpbqTWShkNmTB1eaEsnp5q9zavcovD02T1ZrdwQ1nGLzK9zvIX4mRz3Gu2XJm
 G+GrnA4tcppPAQuvp4phwnB7eFjM4W6iYnSly/Sq5CpN7ylOuYbnkK0WtWR/yur3Qmzg6cAOf3v
 Tt3Pdgs2tPEx2i7wHkfQ5PW4BI1L/SYkvzmK+xzLNleM0dmV40OFcBtW6kC5bXBUzHWHD496+yx
 6IeyvanerJYFlNBIi3B0slbindJfOLk5wmygDLS9JbWsFiAYcYVhU6Rh7HsqcPeBq3iI/rz9s36
 pyafYcJfxsbLXnsxfa+I2ZRCkboZwn0bw6QMxDS5z4CmTFrRgfbCb6c2pP1OpxvKYpGwMuxbhOK
 WDPYAuiejoqda5/ZbCA==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0eb cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 85d2Ik6UChql_UW7KTuqwZ8I4_yScCfB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXwZfY3EHFrUsC
 apnwglQMDmcB5LTqf70jMUhc9A8tpcYHBOWP5r/40o5ia+zqHIyWHLlyj+B1TNO8y9XlQJ6lfA/
 cMjj0UCXSY4fxk2sinSCg7fhpDhgglxx5OVLjcS8H4tf9BF1b0KS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244176

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec980..2e348e0a10 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1852,7 +1852,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

