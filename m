Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1870CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:30:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6875.1778304658358730418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f+WUg5us;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649508mN224342
	for <openembedded-core@lists.openembedded.org>; Sat, 9 May 2026 05:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=; b=
	f+WUg5uswo0InLJ0suNbD7PE2tcDRM5O5jqCEcZnkac+2loPGY95K3IVRgNAvxyi
	/pzd9NLmMoS8y+c8f3O6clA8H+3IUaO7u1Qgh1QP72D5rfwHeccKlJLeiAdLAF9x
	Ppt4vS26krPEUbbTLR1yqagHO3/TMAwH7a8Vk7otYtdhdsIG3/3gHhU2nSw8tAJD
	+jvKWPhCs6lJ+QPhBBpVtMw9gJ8JG71Q0ibqoHuPE8uoifrKjSPLc4OKaKArez07
	2FQOp+UjydvmB19G2MTBzo5ZoqIH3Wf+tl2f0+eNXYkJEDGxT7PxKiGRdaIiYyYw
	16I8ciu1biKvKcUf9F//rQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1t5006fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 05:30:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xuzz3rjfFhV00PHv0ad+xCU+XztTDhmdAzSGEfqmqNKsMrZN73jnrhYiYa9290BwZ1Wq7BXBjC8hZi9z6iHR/3JzmZ/hdgaJp9Tpii9h5eqS4iUl+SMK0F1K52+uUOXvChGLSBL6bpnMJhLIqnDzSZVungSKEic90za/iFev74suz+wa+LATaz6Dib4ugLQn14yOxqnumtvowkdkHIjde3KrTd0BCu+SCwcuxhIFn5nPhpDppLzt6Ondon4+9+bGJT3sqzc1xztBtmZ1bwedm3wBamaszuyrKt177yIy9t3XF02h4361+UCutTEvMx/Hz3KYCX3Um2IlzOntkzChCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=;
 b=QYzIKECx/GVeO1wj3QhXYs5Iu7PfgpjJTZoxBtdsDekJRKUkwYWFP/IVMyllhk38DLle+8HPoJqTr+odjAItLGKTWYdF3W3Yx0RCpHJ3d9l+j9sdHEiEd1/7q72/HdHc1r7y/0cDzZQ7QR2+na3EMWU2caRyzLRsjDGsjdbmcrtjcIHyYWJLbMBJoaODdoVp06RClFF/XSNpJ20racf3wCtIxJ3yer5ITRgAfQsi9r8UfJWuzODFyIUpc0hQgAE8WHfocPgKKDe+XskjR49t2GhaMV08Ui3mT/i8eQcE3apsjpC/s9tktAKHUgUMQBKLVA4WS2U7kiZOcm8gijDPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:30:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 3/6] vte: inherit upstream-stable-release-point
Date: Sat,  9 May 2026 13:30:30 +0800
Message-Id: <20260509053033.1565462-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509053033.1565462-1-Qi.Chen@windriver.com>
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: a16252cb-c33c-4d43-5cd3-08dead8c23e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YtKaP3tH4y6bQfoA7hf7Tc/oO1fk65LSqXmAxVGmJ1vX+q2ARssx1UwO8cmiK3hgCLV1VTv3PHo15HTfJ8h9Fy7aLc/gnl/nb8OSxpRlsWoXzxfmfjS2vDarh88vciugcLR7mZ5QmdBGWYwBhtWVRQ2zuNw4ZCw+jYxJXp6mVINZx7bCbsErGxqvfAiJ6e1/AvC2Go5aYYirxden7/nDEUTy9V2QArJFpkECOqlJb3blYQWGwJhWB8M9F/oljjNoo5xjAMW63FjdSyt4ElX3/Qmxdz4pcSwhJKJ654xtu4k7yCPW/N5o8MIUCTqr7jpNRsFv7jhjyx738Rswyl54gx7Smd0DpE4TepySxb4wCmqRPk5nu8TA77dNBFG6eFRcmfZ/gP4RI3aACKXVxRyG46Wye+yB1eaU7Z+aoMArC2if5pf1nwwNIFKOZaJxDD8eYNXqAS9WyrO+G/06ZrvBQtbzbSyw6lp0FPXjUiadWv//waQou+eG5yZHi95MagL7lQiE1k5RiBO6nBhGMSheIWFBKzpE9wjVuMQJnbbG088ybp7gdKANPNChxogdO7z8E6FppgGOYtvGOKZzx/pjnLyXVmmATgvnrSChMX7h+sGypzFFKblWRA/mJGMTGRBvogQ7mZbgRI22CttSfneC7lX+G9F+t9rhoKU0ApHLyOU/DDc9/uZXTR1zPILvRlZ6tzfiNT5xCDDFGXpzdLPJnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gb1TLGNr6udOrON8CD3XJOEgaaRCyYcASOQXTIMNz6yks15OHTLMksORqF6u?=
 =?us-ascii?Q?KF2Y2+xbqvwBavA9SW4emtMKyf58lK6bWG6KiZ5BhBlMtvHA688Jcx1P+46F?=
 =?us-ascii?Q?4dTTJRIKYEqm/ec8PvrupGkxFo3fblGqZ2CwPnWoKk+y26sj0F8O8RiFGq2R?=
 =?us-ascii?Q?eA58fyUWZSUSFlqSEzrIE4ezB0dJGKIUzF3mUlsp3ZQB0dLfVPRUE8NX4gYt?=
 =?us-ascii?Q?s/s/gIGGGwngPpHZoQNW9nSpcp/uTl9AXtJ5gVij0DgBmU8gcR49f/qw5+yD?=
 =?us-ascii?Q?/+xhWP1sT6BnDA80L4C8DZ2IDHVRh42M831HnqaZ+7qoJGAsUYSWxGrEM+L2?=
 =?us-ascii?Q?/Stp68tb1Ze3d4PwuEuAls9v8FL2kM9FrJax3BXUXyO776xjXpKAOsTQn50g?=
 =?us-ascii?Q?NWefGXt67VC/7S2CPMrGNpGd27B9/Lzib/WahQyW6hedYwoWqCeNu2HZtDFW?=
 =?us-ascii?Q?rABMdaS/ZWCgNX2se//iOiRWIx8LbxbY1DwZCxeTuNj5otoVK7xR1kapG67U?=
 =?us-ascii?Q?UKszLQM8mafBxc5zlkKrL+waGXIjB7tBr57VonRupUxANgls2TWEWkdfKn+D?=
 =?us-ascii?Q?Xrvhp5T9qISDkKrTCidaEkP7r2W8v04UZw1rmeS2JUGzDphu7vf2CngIIssU?=
 =?us-ascii?Q?ZEdAXIRb3Wh+XgE1aroIoenECkO4eabjjppyJizn9bZ+I0kfuy9mmc3XBMlN?=
 =?us-ascii?Q?JgdNUMu7cqxM14HOsW73Pm6FRwJ1404BapokA9UxeDgieLqIcCt1uneGrNHc?=
 =?us-ascii?Q?CXcJB55jj7UbJrMBgiSAvRfURDI22hijnWRiJNdF67IJGLODbrneou7bPlTv?=
 =?us-ascii?Q?uLPf22DQbSN0Wy4IMg6Etf3qGFQIcOFRYdPYgsRNVX+A8vBb+t/PVRl+ruHW?=
 =?us-ascii?Q?b1dAilf5PFBjeruwit0orA0DIbdr82rpYgZ53EfcauEE8hSpPcVZ6OS9sr5/?=
 =?us-ascii?Q?4QDEK3RKMeLVpfiZ29PNGOnBP/etSvHZee6vC42ztAMmcmmXSivSdpZjemt0?=
 =?us-ascii?Q?Cagv6Hc1X53ZpONtTBgVq6Fi8yOlOU7eNWAlVsh3WhVSGJqPozTbUQEOJzNS?=
 =?us-ascii?Q?fb2g7JG1ePimOJcyrVKJMQqaf78nCcJH/BtR9pckLQKmWzVq2B0JQEeVkS+Q?=
 =?us-ascii?Q?OnvFbL9xhspzjuqOeI2XEYIIx9B3h6dhxp2a0MES252kkdj6b7hOqXHaFVmE?=
 =?us-ascii?Q?t6h8NiuVA13y0uAQUKL8NGX9OHPtGGxgBgmUVVv4LLDnm+9KbxWLpXcuolff?=
 =?us-ascii?Q?SnwAwbL2akbHwsZ4aCIm8CJ2Nmo7EvFhJBlMvMDUFjqgcE/FpPqR0w/eJhDh?=
 =?us-ascii?Q?32j2ITafGByRaRoiGVSJv9YEKIPOWG/6dgzkWDBjyYnpYbhJRvWkA5tRQ0KV?=
 =?us-ascii?Q?1aa1dhAmNNGwlJBpbbsa2dudLceoIuECu7GyxdylOM5yXlL7mu1TQZeiwr+5?=
 =?us-ascii?Q?twnavm54i4FVw264rPw65Jutudd1jqsdnAravYo+IAUZ4JgSyFgZc6FS4ber?=
 =?us-ascii?Q?A126rAcY8YkMM+815yIkhPN1k2NiV1nkC7JGTnV75HXbaBUPEU+BIwBP7hwX?=
 =?us-ascii?Q?5YbEYrJX7ixtsFAf5+Ynt4yK4tEyANV9etWJRCUJNrizIsUPnUvcT+6sDItR?=
 =?us-ascii?Q?Bw7zGxzinYq8vUG3ekB8oDrxScLC2EinkMHNsjjdRXIIzf6ooLhC7apsXexR?=
 =?us-ascii?Q?HC812ERQZwJ3UkzhYxD5io6kzov6I8bs4ii2/J4VffqaMqcxbR29jg6n4iLk?=
 =?us-ascii?Q?qeRI7WwgXA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	UDkEzxI90EFiNmITKUCQN2FooPp3BWzG0TxA72MzubT1A+8idzNIKdqIlUzn+IQEv3FtIfokS+AW1VdWYa7n43hmHkVoRe1hqn/3M2V00DyzI3kTU9s+Pv8Un9Uz6t/M9cTBHXwXnlS4YnKhVjUiaT7dlKawb/4Ffz9TIjcp35nCaSdbRpyUPgjBlDIeb3yPLUzfPyegwzP+B9aowZB8UFCw09cy1FXvuJOgcnSE7pUuhDyoxjagAnnKZX4eewab1jXp6NKWnhTc0/KYSMpiUHfKZFp20u3mus93eD7wq9KDD+Onsep071J7izxO55y+19c4Gox+WgH7yL0k/Il/Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16252cb-c33c-4d43-5cd3-08dead8c23e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:54.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzdJ5plpFUvVwALi/QCDnJCZ9xIZhiqaVJWl1h9KHPa6wSwaaI5HdBtMZfyFZ5IOI+InJjZy4ScdqUjeYhoaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: SeAvqjLdpiF3MNFOPLLVcJRMuml1B3jy
X-Authority-Analysis: v=2.4 cv=C9fZDwP+ c=1 sm=1 tr=0 ts=69fec691 cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=_0aN1pf_025NAIwbKcUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VQaOWpvY4YTSfwtSXAB6zlbP5t0bbS79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfXwm+PSEYuIZ09
 VxTFgD5LaPPmD1qAEOKDQUyvU/lqfIEQpwIuFsoEZHl8SqAo36VEYfIxMADiBYNTMNU0jirtIRa
 RQesdlyuSXuPJLrmuZXFSNa8D/oIuQHlIl1hnkYLtXI9lQvw3HWewLLe28z+QxRHZQCVX+K+jjO
 VFPm3RNRLv5lLN/3Rdrt6bvH0mM4WlbqLUEzewOkomPcRyL3dSjq9LND4ISrnH2wqdkwrq16GAn
 wl7c9jJcIhUo78Fkdu95IDPQ4hzc9UW6CS/lcivayHApRXtO6pWEXOy070Yi4bK17LdHbImGqdk
 9qXm2WDlrNNujFPDD0Gvi0wWvzDX+qkpjNh/OqKd+bL6w2IB0v6AxS6RvzcKq59yAXtZlyfiyMr
 sgMW8H8ubff4JPoknLxUSIgZNJ7mXzJ44fGjL+S+Kq6kA6Pb3Qoe0PCOGThLmt1cmEFObka1Q4G
 r0JzDyQ5dk0AdggYTPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236756

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] has remote branches like:
    origin/vte-0-76
    origin/vte-0-78
    origin/vte-0-80
    origin/vte-0-82
    origin/vte-0-84

So for example, 0.82.2 -> 0.82.3 is a stable upgrade.

[1] https://gitlab.gnome.org/GNOME/vte.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/vte/vte_0.82.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.82.2.bb
index d5dced4ce6..839475f32c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.82.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "fastfloat fmt glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala upstream-stable-release-point
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
-- 
2.34.1


