Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D400CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 03:05:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6567.1761879941707387019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 20:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dqMXZDJd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V0Unav1973926
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 20:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mDkI9f4gf3X/5Kl/t/6i
	Tr8oADyAg1KV0i0bX8we1pg=; b=dqMXZDJdhjoZm6yrz4qHlssAfT3kcCfR8eDO
	T/6s4LqORF70sat2KL0mdlKrEjWVYMFzGCmVRAJ3BhznZwcj7ne5fhL+oVyEociL
	L1xX6aph9X/ePAa6iZwKzGmnButUSwBtArxvQtIl+M2bb0iQwGouJ5HlcpChX/AH
	PnHW5gBktTB48ehzJTwQGfO+EymHtdDLJhg2Z/XoT+UwlpUZ8fjiOac4+ZkajCth
	xE1o6CEXKR+ezFH++RhN9AAzypKiNPbjEn8xMDVdo07w503PWZKT+x5IgcoqLpEd
	Btw06XrpNh1Y7Sd4O96bNaiT1dMmBD2YFf92kyNtPbPBVF1DRQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3wa1setu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 20:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIBRFokg5D/w6ezCWsTkNonBAZ9AWBeiGbjtOEKfYEjEB+g7Igk1tAKRwitcdn/vfqyHX1xA9HCejnamWFzYNUw/xOdipZVu2XxjhoeFYzNdPoa5YqO/j3HUrL2Lyi4zLU65NMruQG4W+dQ3TJb3/W1ZzwgkxqDnwO+w3zxPpP1M635hyUOvYf3fBeyRGw+JHnVkhWNBvsRJpp+9+Xof9osXpod/aJ11+1uhMO90G2fukyjMP/l4rBxSwEznhO2b2USTASFod8fUv4xDPruh5o7WrUL6igFL3IYqKMyBE4vDpr0picUfDAsKzMiIovSYcRNEDc7RA5ySLOCho5ctiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDkI9f4gf3X/5Kl/t/6iTr8oADyAg1KV0i0bX8we1pg=;
 b=GBeA2DAwutEZJEu/05+gs2UAxQDfKCAPOygAMa+FUWmaw/wo53KZ/xj+lcAhQlNSnlUUQQw9OTszYezjUTrxHZUIjSzPdUaiPz91mzXEe/npzjfM08k1wuHt847ps3/IJiEA4SeK1dPhGL3zmp7OrT9Tn8g1yshCn/3fO4r1UqfunQ87vFaPKmMwEn4C50iITdHN0hZKrc8RNFH37jB7Z7wRsDJ8jaLVUV5XjjJAtsFNejRZS/gQdzx2IuYFKCYIGeSRIUo036yEPYj1owfqog8rWWK+gWiWwKAh/Rytaceq73Dy7GLt7xjzmxIjwgQIT9t1EEHmxZrK6fv7b0dh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 03:05:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:05:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V5 1/3] base-passwd: add clock group
Date: Fri, 31 Oct 2025 11:05:17 +0800
Message-Id: <20251031030519.2602967-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: d57c75a1-18cd-4fec-951a-08de182a5c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zrA3mj3WW6w5mZ9nVnd/vd3j6xLPNjQAr7RzHQpuVOx4Pr8CA2vU/USqJ2xl?=
 =?us-ascii?Q?Ib3XkpWqcah9pOcx0m++ucsLn9si1F6LUUjjDgkX1iZ99XjLYWALB5kn5dZB?=
 =?us-ascii?Q?IcoHsjAh/KlO3wlntTZVxd+39SArmd8HzqpnckIIAWgr+eT4ZhIOBRvvIzSi?=
 =?us-ascii?Q?IMPc8vAxfaFUcePBkX6n+gSMmuTvVqyfMih6Rp3MzGmxdO248AOWRG0vjzPr?=
 =?us-ascii?Q?9eHuF57WF5JzLj/awnr0rYVZHf2Vbp0r+BDOJNIFYQFD0I+asnZxaSjjma/M?=
 =?us-ascii?Q?LIM9lh2WZpesM56TIWLsDy4+vXFIWa5LIBX7rsISohFS1e6nUd8mQE8gMWru?=
 =?us-ascii?Q?OK6npBVbfHXBvFkgmI7gVKyf2VJfC1mZLGfhadH9hCGwlQjPaCxFyBmZG1yo?=
 =?us-ascii?Q?flZAHnuQF/vAWTYDCVVGT5eeEPh31Gn4DOCo9aRCJFA4sLnBjq9+5Y1Y0wJ3?=
 =?us-ascii?Q?nvlxUXk+yN05EQv/7VUG/S6g3D/LYnLXXLYSngj/odcC/JmNbomyuBn0ir7U?=
 =?us-ascii?Q?wETKH3WPP43fgH2NSQQ2RPseDiFgQYvDK6NGNDkBETI++ZWBpZXo+fE7pXRN?=
 =?us-ascii?Q?tgrGnBxdIYiw/4p0bDNyfTmICjQCRfoCQHdRt52DKWDYBDFjNa1gb84XfitV?=
 =?us-ascii?Q?6kw+f/5McSz+njxWZeq6kpg3yROha3VMDRGBiwe1FLDObaoAsgvNVMYzUNn3?=
 =?us-ascii?Q?wAoy+S1z3yO/4rxcpVxTgN9xpHFGm/l7ngiXrAxmzyOL78YapEKbpd4O9Xag?=
 =?us-ascii?Q?vPG6uHovFuhfdcteNDAAmuUOuHYGSlt+agyGdJN1RxQKdXWAaAcKne9odV/t?=
 =?us-ascii?Q?28mMWnn0uuRCGZg1bC3C/gm3g2kEwcnWFrUz9XKdoevDQo+g7ekqju2qVZEw?=
 =?us-ascii?Q?xf87WVCY+pVi8RfKNyJwxKYEkLqfLC/ha8ylRWXQtpjxTFyuFgNHThgmD18L?=
 =?us-ascii?Q?B8eKeyX5JijorLKhDicDzqt5J0NCIRNinUjLawukbSxUQM/Fi9P2k2IVUDgc?=
 =?us-ascii?Q?FsFPHja2FSJa7GfdsGzyGJQ81/fduOi0B/p0dLhrzu3Unr0MIq8xPZW/ZBUC?=
 =?us-ascii?Q?yOhQG2uEOWvYM/vEPkoN0ODk1v9Wf5FknQmJ3z/VUN8zKS4SX08EOPM4MxEm?=
 =?us-ascii?Q?IsetrxewLs4MAKaLWNKPsfFtg64XncSDpdf46+fDmBhiMj1Q8T4RuuDAJRAB?=
 =?us-ascii?Q?dj9a8xJz+c7xreWmE9zXMuyjmwWE/Ox7pgmyinttpN52AMPFxlLUccjPOgBV?=
 =?us-ascii?Q?jfWqu6bV6uywBZ+GLFnsU9ipRlcz/WKv8u+X/flubMitKZ3UvJPu1QOA7wqN?=
 =?us-ascii?Q?2GFIyajcak6Zzkpox5/PBhYM81pnd7v74JPIlQ5SfI/V9BqV6osUqBsPLans?=
 =?us-ascii?Q?H37k4SzToVuhwUmL5JOyT2vKnQc/g5FwxrLAV8O0aKZsNNRRhQIK35kkJFhG?=
 =?us-ascii?Q?EN8J09LrXzHL1LhtozobmkxES6BUULLv8CYYBzheBcgYSZL8EQKMGg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nwsaiOB46w0Y6HqtxjdKur/wuEwTOPASlkMHlpXTvht/VZFWVFkwxDVO7o1/?=
 =?us-ascii?Q?iWblaDqUC4ck4EbV7lgpSLI7mH4agMI7A7FQYCCn+Q2h+a3Zps55zRMgns72?=
 =?us-ascii?Q?dHwwnBdHQrNZnlS1je4er9RpjtrDtmMhIuzwUpQD+rv9HpRoVEbQ2DojgpZs?=
 =?us-ascii?Q?YxJotj3SFAUmXNhm1sdjm1+kqrObh2u3je+ibOfx0e3lkfrKuXYxbqgGd4iT?=
 =?us-ascii?Q?ot12WmhtrvYzkzf8PAn8S1cNU24mgn6vwRjPq1TRb92HTFN7wP08ORjEG2ac?=
 =?us-ascii?Q?V0NOfYQoCqWz0NkOMJRZcK9vRN1HcHilDlnYNnIlfoJG/7zvOqK+ylEiNuD2?=
 =?us-ascii?Q?aJiUnacMQ9jjxq4xsj1uXJpWOFVVskba6gP7mdZnVPThohQtgjPZOOEOpv8J?=
 =?us-ascii?Q?m5sPVJXc4sVxwHSZh7ygRl/bpS3UOwFh3QO9c2XWZ72a9wZ/gLLyHgdTfcl1?=
 =?us-ascii?Q?Rb/ItPLUaZmcqE05kBEA2ZDW+UqJYdwBILmemUmHmsDlr+ptlbYhDdn71jdZ?=
 =?us-ascii?Q?hVAzXfsltd/31vLrC4gg4bA6GaMUNlSbdRZFgke6P68PjHuwtYj64LM+OtJ1?=
 =?us-ascii?Q?GdAS6HfwDpkT/mLYy4BHa5EnNvd6wKvITBE6EZBZspItcL58GFPI7VnSqr2H?=
 =?us-ascii?Q?mzaIl8RDvJCE5Z0f8c9k2J6TPLnWiWNLlaKZKunFeGtlSegoifImS3blBttE?=
 =?us-ascii?Q?s6mF05fVdurzL/+R2JJx4I0ZEBr2U/ub5Po+RsBuyFWC4WTlRqyDA+bmd9Kx?=
 =?us-ascii?Q?bfM29PKPmLUEMKwPhYpFyinAA8ie18Q8Ucis80CtUK/0zBzVITJ8hb7tGkhB?=
 =?us-ascii?Q?v9xARrvukLAGVxuoNIBH8mjH36t6QXI0VlJxzv3Vk/DOaKreUuSwtMq7swwC?=
 =?us-ascii?Q?tI6dq165fucJY92/B2CNM+pzV5PnTkgwLhxyV20p/Zrget5vxGn58sKB5P6l?=
 =?us-ascii?Q?PlplN2+gAKiSAlc8FiK+oywhKC3npD69nQBQ2xcGQaPqfUo7NBuoCgWJqJe+?=
 =?us-ascii?Q?PHQkWiIRjLGBwFyeI/DuaKW9h6qSiaQUKVj72IlxLeoWoDiu/+iX6mUXEEID?=
 =?us-ascii?Q?Y0cjDh2xQVCh5vMAeSGQQj14RQpWOVt4st/uMDBKPHbT2Ifz/Vu4JUUMXUXU?=
 =?us-ascii?Q?VtfOzM1ZebvzJtk7Islrp9CyBApyzKmYBewswJ1meASnZaPJKp6XnMY4D0hF?=
 =?us-ascii?Q?GPlDXDFk+sw4eMQp0JDyq8GR9M1xwhNdQbJsW16cKf4JJAzMRFd4wvZKmt2q?=
 =?us-ascii?Q?zMF6IXeyQtzjaas1RF4I7/AruhhpcEF4VqPi+Nlo+egkZqO1ovc0nasCFIvA?=
 =?us-ascii?Q?JmyeiMW+rPhMe5424g8LVhXTHaoMQrfethMZgRR+e5SC3KqDvt58A2BKY9cs?=
 =?us-ascii?Q?w4Ln8F1hEyf43GmyvMXJDMyxTGXQ7KJ2ZF+/U9ksXHho3/b1S2f0b34Fyn4O?=
 =?us-ascii?Q?qei0wl5xy2sWKnrETTZvBMw7I1Et7RF5kZRTZoIBoG3Am6Ixf6TXm1HsHyNU?=
 =?us-ascii?Q?5ebBBkgmYPYdrQjo7sUw/UTQd+ysWpPtigZSdVKVnxl/UGFFIZo6iSe9Aw8p?=
 =?us-ascii?Q?I/5PNc83lIG5lK82/B3svUCQ5W51iMLq+w2KMpGR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57c75a1-18cd-4fec-951a-08de182a5c9e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 03:05:35.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pp0xxn4wnsdMA2tLCuyPCdPF/7oyhqel2oGXeNAxgQEX4Vz8QvzTLAZIXuufnZAFStpN4QGz5QCJcmNYb44V/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfXx69ry4H8teYL
 fUqoSi1XbZXWg8QSlEwWuPS1vUCUL8UbPKhPtUTrVF5tUFRa1nZjSyRZb2zwkUcIwBlIpGjbqxM
 eao9v45tr9fsi9AZhxvx3mvo0e2jeCE7C1nmuG4313FwZCbC9bIz+nEKmVwWx50LGPQDHlEFGE6
 gD9tPpF44dnpsFEvegl/EpazbdNzwRT1qZhj7cI6a4+0KBMEBiAMLJTsMp1igAV03ofXsWT5BCu
 FIIZYpyS/EJpQHntCVK4G2DB2wHSOtFFyAcJ99B7SbfdZe2PitnZNb2A8Kgrh6IcZnDeK1dc+T5
 DnBNCVo58aAMHeow6YElxBlHrFeJeUAxD4s5mlXp0dd3SA3jE+z11CrcfoSfROR8vVmWRo9ZPix
 iAQ9pyXtPeePOXUUPwP+K+/rUINgvw==
X-Authority-Analysis: v=2.4 cv=HODO14tv c=1 sm=1 tr=0 ts=69042785 cx=c_pps
 a=6gnvs+K4iRzQbkKjpWE4KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8
 a=FW9jF6JLtlXW1qxicXkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pfwiSSuRxwCsyAYFwe2rEMiWzsF3ov-V
X-Proofpoint-ORIG-GUID: pfwiSSuRxwCsyAYFwe2rEMiWzsF3ov-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 03:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225523

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen.

Note that Debian rejects this patch because they're using sysusers
to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
not relying on sysusers, so we have to add a patch here.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..af871949fa
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,34 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Denied [https://salsa.debian.org/debian/base-passwd/-/merge_requests/17]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:81:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


