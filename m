Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241A0C54F51
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43800.1785192983341303118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TpB+g+7Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLx3jw1688372
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	TpB+g+7ZnQyI8PNI5DAZolucyUslv1oohXy7blP0n9RBKxIPYN5lCb9zCy9jOTo0
	C/H9NxwbpalahhrdUp7/ZHxj7O3jXFpBfRGTaP6IkcKAzyHcKSXURgxD8+f+ARvI
	Uv2QQ99B1cdxar1xPl52Yt6vSjSdJu/MxyMnlQ3k9L/EYSrWyKPsiowKeskQvulF
	hPvm+Yw7KasLLTtBaU/qO/+z/fEp2xF8zAeNtMPkHL/oC3nApeHz449GqtkeGkTw
	pAMlWOcjHTOYV9zyTZ/4GiBJk+hlxRN4L3GIoun3c/EVF5jbYGb20OcIvgYgp9QL
	v7nzkM6RNHzqlsuRwoBLMw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf2s9c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 15:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwSGbKARL4SmC0Sk5nEIwko/HpbHOr+rrqqqiQ4EedSP/Fe/saZjkWSJxdbS4+Y/H1cARy6Gw3rqT+QMg1di2FTnk61eXJ4dr0TVcJ7dwVQYCNTGeQXLIDaTEDl6BE/l6+HMHT3JI4GnwVEkbEfsDWrJ6incsrDZ8V1QW+zJdWEDjG/yjg9xiYpojrzfaOnXzRU+7qWKR3ydxWKcbHPXnZqaBi4U8NWt0yqHNICnOEoRdczekcCHr4SP3ZtVXHQTag/cmQ4Q0QgEFaYkYjhUmasgkFIh0aafDdsALMdOyZR0ogIn3Y+qYRUE0YUUcfYDXJCxLVpYfhKE1FcQcEQXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=SoruvsmryH6sIDfXUIOzVs3btT4KPbsBomPmDSVIyuEkM7H69+jB108fdbQZ32LNZb5FqOsBt2uEGtybs2p48/MydenlX+EDlivMVVK74Dey/5wskAF3ziUXgTQQgLVz2y4WHcDtu3qv3w3ivGY4VQFuMn2+Jkh1Vs5SUh+2xDhPUNo1S4mZR/LjgxxiWdKRzOBXF5oC44I5BPtA2v/ozG14QxlHsO18tKaHn3SC6arQpKoqTBZYhN2h/nBYMdR20Su70y6LTydG7oc3cIfG71z7AflKpWI70ZwRYkjvpWDLs0BkezRRr1vIojzQ7LAZCTnhSK8eMahoQVKw0EmrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 2/8] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Mon, 27 Jul 2026 15:55:54 -0700
Message-ID: <20260727225602.342005-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 600b2287-20e2-48e2-d6de-08deec3244f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/y7pRnWiVE0fEiYAj4mNpsxtXrA+8m+OzoSI8pmZBtTnv1eRTFC/q4q/EQVMHtL5d9k9hyXqvcvof0iAf7FbjCVZLBYRuq7qqBcMZqQAihvd0bKCO5J7BTvGerZgf1/ZnWFe9hmUEjZ1L/kj7XLVYHNLVzIPd7nlg7tIzRXB4m6Cyl1rSA+qPfkyxQqGxcWu4mylachyOhrUfj6Lp+9aOYtSCDfU3NlvNXGQdbsTUTr5gDAZwkhJ51k82MqtsU2A8GuMPb8GS9ftpMmXjF+wFLnFu7l1CC4YD9JGPDz027hORnZ8vg9VTIGrnukOILQSKfejazAaHRs2yBb0txclnlU/Zik2O9IlhgrTqgJVzMd45a5fXkJdux2S7csay8dh2Nhqtkel4u0/kEalvdrXyGHccPr8bAW3DPD1xDv1WtX1zU7LEuvPM3kYKce9nk5mJ5WgsgFcoXTvPIKobApP5BqaVb31tgyfZgR7ASFGSBSo7U0xcM6GJjLb8HmvE1uaC5n671KhViFdwjaA26+uS0XczNMQPwLfGh9Po/xhFy54HPTqn6fjHmDoI3/8BtAG5Qov//czZ22W59mifmbpmJr+hmCkc1PiQijPXarQ0TpKWnRi9eJgIPY5P0jvureUpF7OazsQHsij77/g5/3dMUxbbYa/ozXgcOQHTiRh5sgbFduiJ0sxXp8jLhOdehPR3Zz4NS9sjW0D594R4VDh5COWlvhPZP2CrgM6g3gzE3o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NoXyhAKMbbpq519vst1e+fuNP5QAPdXJDNJ3PpMjrfuinVfAQswtHpQXUdDA?=
 =?us-ascii?Q?0WZwpDS82XsHWboJK61GG8EDLlC4dy8JH7NXx97N2i7nS26G11Mr43e1So9i?=
 =?us-ascii?Q?KjTa6nIGJ7vuw3Qu1KwVIhOu18fhgghfqBEMd5pWeoMAe/XwNHEwACQxTI9s?=
 =?us-ascii?Q?KHqKLs/puy4zRh+PCl3z4/24uUHXuQBP8oMHHy7DS/K5dSMXXMYbay6cDhpB?=
 =?us-ascii?Q?bfkiZ9aJFsrQXhGYcqfv2A77bpNNZCJJ8ubUsKd9WomAGLlRTeaJTl30+8u2?=
 =?us-ascii?Q?ZURNW+tTLNwdohQuPaEeVoZS1gy7jghOOMXLLvQxt9Q2EONpus03V80i5qo0?=
 =?us-ascii?Q?eDABD8SW8T0kRo2W2kxm1K3eEopb5y1S1luCuZ3c1ecws21mmidDetaMIjt4?=
 =?us-ascii?Q?BDWFMFGB0uM8Dfnk3EXlkZ2Z+JqDccS0f/tWnzdvYN9+lzRyn1zV0nFjno8/?=
 =?us-ascii?Q?8I8J/U8ELc0GJQZC63PKtS3yl4kZ+cjsGNI2mRHNeMjidEnG+5EC2peKIT+G?=
 =?us-ascii?Q?aYVlacyPB2VCdVJfGXXDuLFvH47Lbs3MqImNONZc3/clesLqMZ4yhjMUi5cU?=
 =?us-ascii?Q?QmRopmFNUwdIiUAbcqrbxBMJWBJArCUF4ugobTS2wL+++0xhjOG3/7LD1dfP?=
 =?us-ascii?Q?+716s7DfDFA3TpmLiEawza+7kmv94XwGyxO227jeSHFCZaWJlp0K7C74rQKU?=
 =?us-ascii?Q?IFf2cm6rb9+6ZPTFz67AvOYeyo6xciWnX+2+1/Kkt+OZK7p6xiMDSsHo30cl?=
 =?us-ascii?Q?Oo2zP09T9THL3DND4cWSnjTiORak3j17cFwnpMRjSFzLTE/k0hRhlBExUIWo?=
 =?us-ascii?Q?Ly8Xxz0I+dRtBizq8uukf65UtXFHo4JtbcC7y9eFs2QEOmC7Wh07melCQHy0?=
 =?us-ascii?Q?IKA1Cs4yNXHK98QG1tKKfpv1SBTky/7kKB0j94y2LtwZpFfl0QeOYQ6EpHz0?=
 =?us-ascii?Q?6rYlkgraF/aSkAzg1oqbLaMV+q2XfcOwxunBKccxk7FR1xXT8N99PiXQ85WR?=
 =?us-ascii?Q?TwfSIT38k08nYUMP4Bb23MAOB38nfMnJ1q9VyuhrmJoyggxEqW0kOo7YR+Mv?=
 =?us-ascii?Q?5JlbpV8/y/x4JDOOswVYvN/b9QP2SCcw7Kgfr/zezNZEVOZqw8zzWv4Yu/uu?=
 =?us-ascii?Q?IiVRXGHXVo+69cr4rMeEPCXje6xuRAXycWUUGI5OyDi23ChoJEmxGotbLZrE?=
 =?us-ascii?Q?3LUl/Vy+K3r3q7lqzjr0rZknYobXFOZmjTMemmkZajZ8bGMCETyERifZmMtQ?=
 =?us-ascii?Q?IMaizb/KLn4dO5BCMklNNwubKfe4ofB9nM1GdBBCpr2BclVWwpbnG6e+jnGG?=
 =?us-ascii?Q?d4kv7H5WLdiFufx47/1DEA+w2nmO2HwBrPoc6BzsFr+VFSBY28A9jDlS22+T?=
 =?us-ascii?Q?gF/iO7BwoOsPEvIwdhWR1KBMTTzKGKtZO1WH6zAasWkvfAYi2TjekCcsSO4D?=
 =?us-ascii?Q?EZDlmMenB0ML8MiAatrVhPWd9byaEv9MJ86kBnV8TFmdnA8DhtG5RU37ROeR?=
 =?us-ascii?Q?rmHsO8nMGnUhsCwwEhrcerdrzpIAdW+3EdNdLfHKjLj0s5YgyYJTjvK9LjP/?=
 =?us-ascii?Q?hTxwwdYhm04DmY6sfDZogD66uz9Od1KVsKwlCPAc8heXBSVv9eusYFlwAHEM?=
 =?us-ascii?Q?0MDhi49S2On4lxnS/EPYPgblfyrUqlstAOWnEEosaWvwrxR0NGnavlRUqFGN?=
 =?us-ascii?Q?pXOgXYLTC2t+QSvZHyZkHdPgDZd6aGbW0b7rPhAdKY3j1eAIDLIpcPUKSNVv?=
 =?us-ascii?Q?KZVzF0Q6mo5gRdQFxaucgaLQG7SeXKw=3D?=
X-Exchange-RoutingPolicyChecked: 
	UykJv5GslFfgwvZBkIYIVdHaMpfOwzZzL8yo4kcFoFR5T4Sr3xpovKkT30KdRbL9OHc2jkGTE7yEveJ9cEqMtxPrrJgWpZBj61rv35kphmj5VpcTRzNJmTVUn6E7Gb7Lv7OTPYMaXsL5d6ul/31ZcbS5nRrwhBgc9hbKqzRmv1EInS8N9mnpjFs6efVxEVwi+CMyZlr6fjYQjeXfBqBh+YJEIQqAAZFX9oD0DjOIIVSqOEidCpI+IEe0YvUj1Epj6Cq3SpFkyvX7wVK8X/OpInGOhI4VVHA9Ai9fRDJHsfx4a6D3RVQ/TDEZTtyWBv1WIJ6B3ZMKmOHDt4VB7njn4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b2287-20e2-48e2-d6de-08deec3244f0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:18.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfyAhWvvxNtbfwAco9gfBtUaKPgCSHIXfnlpeyP954prBsc/eBKkG+ybH1mdlPed9CF4jGOvoS2E0SojeM+jKHW3JmQAOpvP+LT67I3p97Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX8k6cQOuI+Rlp
 HVxOav5vs+I1Z5xISoMA0e89wg+rKtgkbWwPhbAbPTVSXFJVFV9dbPlQIeOrX3vfKx/rIm6Djh4
 HuMdoJV57R+L3rZUUcksrMXVrxeEPqxfr8B2Qa4vAwbbWYcKXyj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfXyZq0AyhMF+vN
 DcLz8lHR6dX2qaEyp1dRthsJ7gW68LyVg9Cor6+3mhzVRRHBfx8X8DcrlR2wpFP1ONKVX2+NTMI
 jhZ2+m7uEcR2pebLx8+Ckxc67z5EGlC4R4zHnAp1Fv6exARhDU8Ma/RaEbVyZdJv4RMXcEPhG2r
 TJPvfiiQEmnB7r+MPhzeX3yw/aF8Fit/yD5ctC839yXKUlyIwfn0d9vo7/3H4xkizGpNKJDY3yJ
 0Vs1BOBtjsJ0c+QV3pP1X3lmE3quWi6b8gQ4AGiZ3tuFMCtLoQd0N/txKe3cSb/M0klaN3mFKR5
 qD8/u/N6GUZe8kjGqaK1grGCBIf+/smX1biHx5AGARo+ciqy1Z6+121dy/ExRxvCnn0VdNsqFRP
 qLLKYFbx++IE+nUXKUc1LsWAaWaogSscVOAIwyBUTf3jA8/hhJ/PRDtpBQ1/4lMYBjxU1rh2LHh
 XLGqhag8ZKHBzTNJtyA==
X-Proofpoint-GUID: cMEu8IJRvv6GtU6MlWDZsFqHb0F6Zt72
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67e216 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: doxNcp7wsy7O2RvG7ncA2LtZEUCEg0tG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242128

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

