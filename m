Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42010CA5FFF
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 18:59:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2733.1791313159905283109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 11:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IrCBK5AV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4739be83c4=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Hg6fK1727193
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Oct 2026 11:59:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Y/xeXiZci
	/SDmJ6smchMzTMkeo7JYfv345k4YHmkzsk=; b=IrCBK5AVmHeI18KM9zwGNQdqc
	S+ymC8OhHn1CSrp+xUUWwNdvATMdvAXOscIZyoX191w4fLZ0kUNDZ0R7PTUz1/x+
	6iB4FfHv3ttgalcjPBaRyFFfAMRJZB4iaOWoMmGiUR3BPPrTIEbdb7B2GLLUs+Sb
	VqmM8p5X/ePCKAkiRnx3suPg+EgEMTZVgzfcBMgdG667G8Aj7vuVMI0F5/rUWhmX
	dZNuYV93rYfaDV8Mmfi8mroNCVGdC1CNt4EDlIKpz+uwAO2qleHHU6PqzBYOxzJe
	OETUJmjVHQWBuMSeM5b+z3EXK/z+RPOhWSuvx2TGCb9UL5xWBID7ov5C+BglQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022131.outbound.protection.outlook.com [40.107.200.131])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h317ec4r6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCsgGoxcIEtaVWE4i3Kx9SyG2/IMYtIEaJZnPeXG4uJuuzfWtd8V80Dxs6V2eugNMdXASEL9vtiBil7agBFNf7Wuect1ZdygFpA8POSbwta7YIuqZel0SvISUVv/K7S3AXqAGpm6gXA9NCviHsrsG8s1LgTenyjx799n4QbQ7PYbgKSRhqdIo4oBnwPJfEUlMqQf+Pz4Cwc1vWMIwKhyIytkEvQC+5y/ZyN1U3gXRo32Pa29aYuOjlJwHg1pKKcB/8Ukw1CjNqdyeO6zkDTyhJ8fGS1WEp8yaRozHqyz2zAH76VGU7o9zp/tgcinVH0vX8dDTVMJryygqBbO7LhHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/xeXiZci/SDmJ6smchMzTMkeo7JYfv345k4YHmkzsk=;
 b=abeuGaY/00jWIHvi1hQnUDgv9BJpa2bHgRysNdY/Bh2Re0k1iNHkKhxJIzYALE/t/6gtVUKspF4CAK0dT3/sE6pg+FvKcNPp8ZnElJPKSeGQONWynjrMjHlBxcAb45VxA+mOfw95sekIZBUtjKWIxZSFKO0dkmnD3pd2aZ60RK+N6bZd0RnbVIwebFvcNirmwMudqbTE1lgOwvIrdEAtdG8oBlCT8mWd2r+vRPtFV3MQpdJFJCVdxQYDSGk3CmPbCeAtt+g2wfs0j078H4ta3YMJ2nPwR1FDty8bbPQQP/dvYjbRFzGORKiTr/uGMMVl/aRMbEIGcAazqQLlcHZiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Tue, 6 Oct 2026 18:59:03 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 18:59:03 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][PATCH] nasm: fix CVE-2026-6067
Date: Tue,  6 Oct 2026 13:57:58 -0500
Message-ID: <20261006185758.1683530-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::23) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|IA3PR11MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: f6766dd9-3d42-4f9b-1e9b-08df23dbe35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|6133799003|12006099003|13003099007|18002099003|3023799007|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info: 
	uHuuMuGZg6Myq9u9b1bQOa9+OCrkUNVHTmDqfXCivDavvCSJuDQvrRzRALuVHZPilhUR+Z+blhcFRgkHPNaHbudKGRDS1iw2ehdRUWcd+Lj4Q4e6ne2N7wjn+fIgzV98ir2RA4OeQJfbiQxkatQPYinbg1Y7Rq1/r3V6rUN0pqX3Ea4OKd1/xnZJtL6RCRFucokgjOHjuOhP1/VQNVIWLRFT1OjQYW9mKT7rYJWMvsf3mU+JxXYCszP1rJwXfeLHR/B7JOfxuzfCxZFjfK+06ruemww4cWn1bE2smiJ+agVm/Zfs4jYjL49F+u5zrkT1pk4r/Pb6GkMx6Q2h35DFpi6PsOiwHoCrGTlF71QVxTSdhexMXD1HcDwobJfg0yQNH4dCtHrmDq5VS95S1lkutkcZItq1z+vpBwe5kFT8/cD8zwUpETr3NbL4/dX3tnX/N8EM8F23EVbn6dkd1lIM13gmjbSN/oPib+EvvchzKZ4ZArYiyMZF8CsJyyKect3nyH/RKjMrDEZki4pl4mH+SEpkkrrp2G1BxuapxI81phLAei+09CiGQk6WPWbXVuRtSQQnis7r5qxrzka8AtxEA5pUct21EbRWf+DMdGsBd3XEGqtlCWuvj2n+TMy4H4hBTHPYzmNw4fAP07a7YVU2rZ53MjKayZ2mzTQg2aOmp78=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(6133799003)(12006099003)(13003099007)(18002099003)(3023799007)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(38350700014)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ebg1FXJWW+IVHYYqCoEQ5o0zKZl7v+0omzPDn2zaZ09s3zVA7gKxpuO+cETA?=
 =?us-ascii?Q?j2JRJ2xVx6Ux1QZtq3YOOQwLalP8ckexj8iXpag1Joi8heO1kcJ6PNzebKeR?=
 =?us-ascii?Q?EydQF0jyl8QAo+zpUj6l16RBcDsUKiGGDZ1wIUmO+8mYC9FgjlLwHoNrtemM?=
 =?us-ascii?Q?L5AQslPYUcDRU1XdWA1LNeES16UTsQ5f0FxujVtAdY+O67Nb5F4QwHDhBivM?=
 =?us-ascii?Q?1zcgSiglR8i2LD6nixZwCXss6b0M9QqyR08vVZp3zILHlIjNXURbAFCzKJqi?=
 =?us-ascii?Q?CHxmzz+9CoCcPKuOGoIcw8m5l1bAEsvvcR1eo1AcLJCkW0sIKQjTlVTPctOs?=
 =?us-ascii?Q?om3PaJ1NsHUHriVDJAoJakkRdQKtWpWP63M8S+bskuAg+H5eYj/HHaUJBwbQ?=
 =?us-ascii?Q?wwlmBhZlrJWL7jyoOaE3DG+j59pBOoZzZR3Zm7L8XF4XKCLJBKYOIZDGaIEy?=
 =?us-ascii?Q?kdC7edGlXGQbefM6Lpb2wBH/WagdvDRsW09+CEgJldGp77QskWTogm2KVR+Q?=
 =?us-ascii?Q?GDKXDEb5FiWtY2u/ZyZw67NBsZqatUKRIoSn7XZvutmwGc847PRJWN9Cs7J4?=
 =?us-ascii?Q?ZLQ9uysq6pUC8+x6KxaoB1zqwn2PAZ72ahKFvw5Uw5d45T5fMnpEsiJceFK6?=
 =?us-ascii?Q?LnHHv7yQUyIS0zfITSDRKzb0Ihb0FuOLyU9aPuaemIWKAkXsLtSR4WpxSl+J?=
 =?us-ascii?Q?ZsNnthJBttfVaNYx2gjg4+AoudUkVHsz8s4v1XUQxGZGjPjsPSXKLoLEUCSf?=
 =?us-ascii?Q?P3qzO8XiLL5rMeXQmNfsFE5onXaUwsspITikrvlL+6+ls2/FZZLFK2mah2Dg?=
 =?us-ascii?Q?szAll43SMKvacYc4oFzsVRux5AFUgeReKAEoOLlqY/pvuPojzam25nkT0XcI?=
 =?us-ascii?Q?tK4OQxg0lHpIgoNxd75hb4YvJmdYUMwYxBySP4n0RNJ0FzxG+h+D2EapAIOX?=
 =?us-ascii?Q?COM4N8H5yktV/72EHZ4/vdwSvTpd/yOrsoAksHZ7vvnV5kwKXBsG1GJjB5si?=
 =?us-ascii?Q?7gor0rqZ+6jNkpbuPg4bKCD/7l8t3X6wW+7VRP+6P2J0HONLN7QpNvRp6aK5?=
 =?us-ascii?Q?yyd5wWAhChYWh2mL+H+h6cpzJJUsqVQIBpbLlJE+0CaNKrQve8F78cM+SH4J?=
 =?us-ascii?Q?lpbN8guOhjHGLF4Z8nxvMpxOV8CLEdpCwm9EMzpRIfeC8XAVTj94JHCJeen5?=
 =?us-ascii?Q?OB6Ye3QMB5Ebhuujsl/I4AY4Uz3zGHKR56d7ow1sxzGUYAoYcmmm4zVoqQ02?=
 =?us-ascii?Q?ixnDwKNgK3+OYff2uUr2K2rt3N94r+X+vKJvn3ybHOkJ8cDtZCLG1Odb4+KF?=
 =?us-ascii?Q?Ko7jz87bCKIPv8l2wG60oHJKZa7IB6lzQFnPwzL4WeTTZkPy3LdYZ5ru5AiM?=
 =?us-ascii?Q?JxxgwmMuDfYUG/RfC+ew+Vwb2A5mo9v+PaCBtbqYWOTYeQvHbTzJuPLBb2tJ?=
 =?us-ascii?Q?0wz0w9FLLx7mEMDYbHZKl+J8jTF5G8BGTKo0IRhR8FpHFi9LJf6fu2nbKSEH?=
 =?us-ascii?Q?k0XOOi0AREC5acET0N2n4O9s/UwXlCbnCxI7jLvejK1pLf00/FWn0U5Bd6EC?=
 =?us-ascii?Q?eHm1ofWc1RKiX8HiXBx2BSxGXmP3cUttJ1gepXf0UsY2opGZcBqunMcPMhT8?=
 =?us-ascii?Q?FRQgQeD8NIsZbC290nfV4UgB3lbUB1A30iP/uAqDmDcxeuicBJMmjgpNRopX?=
 =?us-ascii?Q?l7LYF2SLH7ROuo5w0pAkULY6BMHvJFdfdTwRFDk7NidTCrR6MJYB7Ei/pcz+?=
 =?us-ascii?Q?T3anxhZ52H/L1El5e9QC+G1NcyFwcPM=3D?=
X-Exchange-RoutingPolicyChecked: 
	vuJ1lhDp5n0DrBOWh7eExbbAMjSwg6NChjR+GE50u3ulGRR5xfRl4Y8TlaXWKun9i02AlMBpZPS95S018FK7WiQWLiJBLBfE/WaqxHeYysPhHBEqFQASv1AUPq2cq7XJ4dm3ujFdQhqMFr58GR1hO2VL5vltr/HterApA+XWlRRBciBVM4K7wcLGI3pUviyoPgl7fmrsOEd2fGY0InPfI8l4WuN3a0Q3OnXKoTraYg/qg3wlxHx+orfNn55s4Q1Pkdm7q8EJ0Kg+4lGRCsVGKc73wW+/aYehubFSqEUCFgsYz2eyGCp5xP+aiotEg8hYKLbVY1AB8K7y4bAMpFQmfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6766dd9-3d42-4f9b-1e9b-08df23dbe35d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 18:59:03.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0UwOylWvzUnGPiURCugKws0Fb+aa0cBBP0RPmmaI5ZfvbxRF6ICuBsKfhD+1d2y/xJc74fFGccxFXfTrjyT7psRZ6UkorV7xFJQ6ktIhzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
X-Authority-Analysis: v=2.4 cv=EfVd0/mC c=1 sm=1 tr=0 ts=6ac54507 cx=c_pps
 a=YuZhOgY8ddb7gdPWH8k3TA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8 a=oGMlB6cnAAAA:8
 a=8AHrjNCNbS9hPEObG5kA:9 a=MyEMWE6lpU7D9y2mAhno:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-GUID: GS4skvKVkilr3Yh1whunV9NbbYgUMMdg
X-Proofpoint-ORIG-GUID: GS4skvKVkilr3Yh1whunV9NbbYgUMMdg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA3NSBTYWx0ZWRfX6kw5nK6s0PMv
 BvfklCdecmZ0TM9+B0uRgJu4OrTvyGFg3u3Z7jOi006jLYpJFvHlYD/VnLnFaZwZuV/X5/0t7IG
 Eq3B3Dx656/KOjvLazTSfVkp0zwpNjikaPY6qJAeuhHET+bD0z9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA3NSBTYWx0ZWRfX39VCGNV7wsAm
 nIDrLnzI+Eylfo/8AeQKgFBi8fN2K51VZb/HDdF/aUVcuJ/H23oC6z7k8N0oRZFLUO6fzJs7rbz
 WqNsPIHxZdB/hNvZIM8OEOQKhyvTBOzK/ZjSlL5ytrI341r/1V/QnSUtBxNvRGyJLa2VvTSj9lw
 BFs6dLrZwcSfuITRP1P0ReWCEf8rsFapish2Iix6wben+3waUojsEnbNrq0AEb9+473ruu84JPj
 6Ede3PUURI6V6IHW2Ou7AX0DJoKer6qt/SbbgW6yay5hifRTIWR9fQpMc5HSFIgExKzeiq/MRFp
 jX6HpB/3bNjjDWjmUm0ImbBNsPHTTZdUWoufh2u9+vKDmfGJ3H5XYoCn0e8RInTIBitz4xeQ9VT
 r8yXz4oeog/6cwa51ll4duDy43DltX3xE/U4bt/RBeavOE/qm5XYRLf5WtD/Y8yN5csFhurebug
 vUbfruMQ7dUWOu/om8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 18:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247319

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.02.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 0000000000..e43aafc7ee
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From cc006a1d57bebb6ea49db488539a1613014c062f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index 685c5933e..9d8bf83c5 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1736,6 +1736,10 @@ obj_directive(enum directive directive, char *value)
+                      */
+                     continue;
+                 }
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.02.bb b/meta/recipes-devtools/nasm/nasm_3.02.bb
index e99ccf1941..a9816998e8 100644
--- a/meta/recipes-devtools/nasm/nasm_3.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.02.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "ce7ed93281615379e4a9d4e76503c64a79c1d5ca696dbe148f16cf0b93e239af"
-- 
2.43.0


