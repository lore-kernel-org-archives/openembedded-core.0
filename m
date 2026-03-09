Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58365FCA160
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20797.1773078259433577750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=knqKbFQL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294Ursf3973763
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WI9UTs2v7VO8J9ewnMcuHlCd3Ax6HB673Dn5gF3elXM=; b=
	knqKbFQL+ozWbDtKqpZQW52LJJOP/p+9B4mdtApX13YbOlO2UUYF34qMhIJG7z07
	sEnorROYqc1M1FJv20j5rWc6D4LCC4zK3ffq6j/0zpdgn8vMLXDWA/Q7Y+qnNrg7
	rQkP9ARS42Nbw1BYdfRYfY0cFE/Du14qK6o4b1D1i/50HAU57rHrdNd9Yfty/NEJ
	qPgOj/r1mEbaKjdW5och4ZCDKrptJxlFAOo5pv94KeeD3MlFniAkujQzOzXgHZex
	SYPaXyLiDTeyUJzGo8ERZtjcC978X339XEDAxyV/xd1weThFq3VCjDUdx6fMt8r0
	vtZSlOs2s4YqtAaHecWFYw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08277s-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLZIe5FuFoAOsCLZTUycSJqEiS5MQ0lN+fhCGCGwwsx3tgoMoboeNvOAnhdMD1ywqs/BwL7dX7ubtio9NyzdE76uDEk/9xzmKC/AoBz7UNIm3KrKGYH8fJ6xYkiGw/JUPh6nQjy21UObDm2DWtViDJdhQAbh98Bb5PujaHGgXgQs7aUtaGyFbWxKrhN/7vaqBxwaCQpsc7a3T6tEz6rk91eXN2plCqiSXsEt7QlFV/kvNMHoZxkPd15zBs8aKaiKrBSefGWVT27h9wxrajHVYYi6jSwTd+MAsYA/7tRim9VLBQ0DLXTb3BiEdgsqglimihjZ735DWb+VzHDFCiQUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI9UTs2v7VO8J9ewnMcuHlCd3Ax6HB673Dn5gF3elXM=;
 b=ioMt5GIPEOB0mYxoDDyDbi7r9gZv7sQTWqjrJUq91/3C/HXl9uf9MV3TP6qzfCrEh9UPgre/NYLVw4WBR4Wb9qLWf2MgKwvubHW5YMHvIpGfPUzo+IFSTdUElHNe8wJpdTjPfYewVOVBsmYyqqcv8MzUCZsVEkfTB4A32njY2m4njluWGK4um57otGkgg65bEPISFLqgucacuF6bGC3OAs/uwXnh0V5IM6D1ikb5fPEFgnu/DJunyRqydzBE8hZAafHgNo4iqt8KWgamWfY/LVwT/myzbcp+3v3EDy8YbDneJpABXpiJiMWz/5ni0/D4vAaly2T/rN30O8yZ6FaPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:13 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 02/14] rust: install Rust library sources for 'make rustavailable' support
Date: Mon,  9 Mar 2026 10:43:34 -0700
Message-ID: <20260309174346.3384212-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 239e82d9-b274-45e5-1b87-08de7e037a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	QfAB75RIbMGnTFTZ/7CfeHcAWz/xNKbI09fNsr8sEfK5f81otR9C6WEAsKTpRixxngKudwQxu78OYO+BK9h622SNV+XqPLJHw7xrWePAHf8NMdzKt6UtLkaZ+Ti1FQqYdXGR+tlYnWEYexc+o7osAlYfKwTCaUf2YU6r7qXyCGGH3wAQSTBBzjncRlSAFwh1pnPR5hnjhzdlz4eFsO7cwkS1bJUIoLLgS7GeSw3Of4bkQtOLiRDCdrA3tWfHXPNcX+7FgDBzs2n9A2C7i4w4rPO3Z8xjHeLFy0oRgKjp2wvMhCvIyzgyEAwzjh+YxNELIQWMRnVazfvcxy8nyyEtSS5H+UGLo6ASe59CEux+w7AcQVX50QaR9kM0a8zcvTIx0dU7SpyfZVrn/6ZOac4N36Lnu4ET4G/QZWDxybPAw2trARWiwmlahs9TUzHRkBb0pOlpNGFiCGFTwJgrlO7liHT9l4gMhn7TK7gMtXbrsMk1N2hyJ0yQ0U4k3gNlUj8G54aIsi/LypxC5h1M29u4w4ewNK0bqJiQSbqy66KauJ5WlOJkgtN0sSJk2MC/X4//WJh3eiEixT0dzVGAdbTp7jJdHJ/6mik7GPDMp398Q4D49heC718A/LLPJ6E+qAZfhtdLJv3HEu2VpiMm0lu2w5poDSLwJmezlO7FweRqWsrc6JAU6wyekBR3rvq/kdHiljyX+/x8BD/X+F8V4dRZWlvusRs79NoUvYx59fhgtrijtnMeBVDG+kaO/87/Hlnq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pMLgUSAllDzPMgkUpTZPQxQ05wIWgxGIE17x1kj4ChegtYozp0CW22SIVwi3?=
 =?us-ascii?Q?Yj6uy1aqoPuRnSFthBl+FzI6kMaesH39A8Usb0mtVuRRZK4h75Wo3NAC48/W?=
 =?us-ascii?Q?VE9lKnSOzirnxALvq3XOiP28mwFtcOkkf+rFqGW6x/AvcYnUalqDHmRsjwx5?=
 =?us-ascii?Q?csEu3DRbFmR4GXnzF84JASjbS8SlyH68pcJV0tZBswWpCh9hcZPZyKOnRTKQ?=
 =?us-ascii?Q?YdkjuepcZw9+0bPsUX5hyN51e0ReUBosOKO2m/T9uDe9x3gwFe/XrVbQlUhm?=
 =?us-ascii?Q?AIUirFS7zyEa6CFWJP5iZSJ/SV3YORO/S9JO5kPi1K6k/NdpFU3IMB5YA+gi?=
 =?us-ascii?Q?5p4j8O3ERfygtZM7A7ZkjmwxoAxmva4g2YLych++NLPux8JjihatH1cHOj1A?=
 =?us-ascii?Q?7tN2FQ7UIWuXjPFuYmHCPUslyKY4fcR4J9ivwJY7DNyk3eea3ThlGAvIK8at?=
 =?us-ascii?Q?pbb20gTfPTR6rviJS7eEDAu5TjEm1huvhE74b0Fnn1FblIuPXfrglsJSBXts?=
 =?us-ascii?Q?uupOvOWZAa774ewE7o5ITlkOEkTYhCP4RWaIdeikGo7wuagDNZ4rSdF5UMFp?=
 =?us-ascii?Q?MbKrXMutbMlK1FaTtFs4G5BF9IebIKP6Jh/LZp8wX+D8IYAvgj+xeKJOaiZM?=
 =?us-ascii?Q?fi8USQfqeLGskrwAeYObNBdrBZ+nlbcpkJSC/AD/w+RUMM/BYP85dm0dFnRz?=
 =?us-ascii?Q?KTG3AmIuWQbi0Mo89kg4cBVFemdFtLkCtYPb1AEwhsAA4XmggBnj6mQI7uSd?=
 =?us-ascii?Q?8+H0idV6ml4dg/9XZ+a9oL5N6idOQukU3VOxkM8g6OhU8S/ZKs6p/vK6ZtNz?=
 =?us-ascii?Q?bVOw/lhqo6qJsc5I0SmYhEgc1i2ludFT9vGf3Kb05VW4QmVGVIwhmWUFYSRu?=
 =?us-ascii?Q?ANpMqWSi3R207GHPNy3gLPWtbiBSa3qf4L+WvtPUJnnUoB6Oc3aWEEMQuLVo?=
 =?us-ascii?Q?XG5lMPbF7F+vXQ12q2b6wzrKYrDsNtPBSmbzlaBQk78q8y7PqTqsF7iEAbbF?=
 =?us-ascii?Q?yDwWFIUfqj7mX4zdycOfq50spFrPNwuDXGFmjLYxMqOlX1Kdg7m1p3mrYbYi?=
 =?us-ascii?Q?fOs0gtg59Ym7iGobYfskgeJiz1kyDWYthUEPwHkUW2HbDaTj2DHsgbJSg4LI?=
 =?us-ascii?Q?TGxq6+N7pAIZyCYlO7fovBM/NoYE+t8d9fK1Z5U25WiHzhWuq7KpF7Jw4rC2?=
 =?us-ascii?Q?TN7hfQE1fYen6jNccvOb0QVa3GNEdGfK5qMnNtkkhPGkeJPPuH5AkPXPJxbM?=
 =?us-ascii?Q?f3rkJoEZCCxGtLLyPG6wLpOADBjXoNfsAstOzr/6cjkWzbqY3HT1VTfuatG6?=
 =?us-ascii?Q?Xc9pH7lkV3z2iaa7wDOyhllQ9KSsnb08JNenPlzSZyLpcLUnIV7AhEz070ob?=
 =?us-ascii?Q?QatOxmqgGklNrgKx5H3MUcoCnoaq3PnZqaqaq+hZL80o/lYA6zTmx9mouTLs?=
 =?us-ascii?Q?sTBU9URDa6kVxGKyB8bZCh4lT+0gYwgAuyyIiCWNkW0CpbGOQtT2zri8Caxk?=
 =?us-ascii?Q?u3WbH6jnYWlqND9rLc2Gsadc2C23qWyp4vMy/+L3PxL/1nBktZ2uQizyHjW7?=
 =?us-ascii?Q?C1bvPMsop55XIgLqKWTHXXvhtIDMmJ023D05i25vjlRicSVM/tyCqE/6QsTe?=
 =?us-ascii?Q?B6sZUM1pyDGar4MyTdfwNDR/6Rn0ced38E3Phm5mEq0Bvr9tT0cNb2QGyaNJ?=
 =?us-ascii?Q?71hX7R7gXZulYlEfipCwXujJsFnJVaXEuiSsTbZjpiJfr/jWFNDGu0S+4nJQ?=
 =?us-ascii?Q?qQnEDW1d65qIezrJ2VygD7Kxu50X7s4=3D?=
X-Exchange-RoutingPolicyChecked: 
	I1aJrRmSe0lTaTVaSIaB8ovF9IzTi92vhqEtiuqBkNekNUR5m0nKsQMrINdGlTkwC8CFl3/ZYd1Cm58wKETmaszAFHckGRtWWuoES8P6mohSRga9iiVZr8Zg33cYn48e9g39v0xB2fFehpwhH+G83kEuMKRB7pyE66NYccOnLuXT0VJI+yInBA5arQpU6HjOoKQZRoLdXay1y9kfd4D0CkQzKOOTgR5sd7uIWNZ5NNvAC62mn8NNHOfudhVsoYaIdrKMgS52qIYUQZj3fqNFLd4UYzUtFzPi4W1FC/Ybi+SPb7Q6t1ShfKcUi3oR+9IRsIpZWuBHc9XFqF1gjUETjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239e82d9-b274-45e5-1b87-08de7e037a5c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:13.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxzSSWgQkDiCV1pA7cFTxYFQyyU/NWF16WrQDfOo+71RZau6tFarQ5/wQYAIGpV8wCtM3meYGbAOs+zEP+lsmgc5pXFB8D6tsiiFMKGLCAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: LwpJdQKv0GZnDJa9uv0oMjH0WTnZ6PZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX9L43Y0xbOgj4
 ZFKIKppjpS4DEUptsEx0KDuwOfwwF1IgzbBvvpUHwdlrwgnq+ekzeE3ykYa8kgqrEUDlBQa6Yfr
 ULebds+mIE5JftrEhZLisO6sOGd9jZqG7u1RMVfVSQ72g3gVtIsGelCYPOaO0eO2hiBv23FQOV3
 7By2htwq59xRMfJt3SPv0mduiBUASxzS4M0ZNT88Oj9ugL0atN5+2bc6pK2erypjvZRwrzZbSld
 0RvpznuCaGiiUqtH5e5aj3TSUxwDDfPXsYZsXHtHNihWNRKFxmi3RS+L0Rb7tAF4pCtJdSKFvG0
 7LxDyydZMO7SpMEneZ4V538dVDE+z720yKPI3YLQni7r3APC7giTlGWzSiZHIhOCUF97hVHl1xz
 7yLoXpxlcByg63AJ/T5pyXOv3jKwDtZUPk7RPIrd0gaHVGhg+8AtYJRwNO/ERTbwp7dn3Dl9m8f
 SmBDXE0IabC4GnsPOIQ==
X-Proofpoint-ORIG-GUID: cy7VVDzyNbti_4MeU8pjveBynR38ts7l
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af06f2 cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=nzq_CVlEzhOWP2AoRwgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232736

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for
  making them available during `make rustavailable` for native, target & sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..faafc63c96 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -266,10 +266,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -286,6 +287,12 @@ rust_do_install() {
     rust_runx install
 }
 
+rust_do_install:append:class-native() {
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
@@ -316,6 +323,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -336,6 +348,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


