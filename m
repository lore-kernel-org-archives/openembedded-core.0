Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0457ACCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:47:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3458.1760604438888348807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 01:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mwfN6Mys;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2384cafde6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G8HxMX578462
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mRPyRI8tv0PRic9ERSMI
	VqJ3Uf4PsnzGXmJk+/EAg5s=; b=mwfN6Mysk2516HglUVUQEhXHZvS6pG4wXfnu
	5u2sn5aeFdGU6GUjbNrEpUlqiCb7ABj4x2eHgN2R50d5RBE7lYxnPVVpRdxPZ2tU
	kQ4RhrqeEy4lyGM5yPDANnH6lAce+kRCBFBWE6kW+uhI4Y1KPNn8cdrSxCpyt+Cd
	n50BLZlSxnMQorPKOlKxvOjuepC+QXlWDGnCuHKM0dKHcNUa08g/yCDqDtVtN34m
	UC7oZ3BF/vCtoanqOaMT1d8QItCgq50G11kjhUkGiXuout5WPyUuKCSSQXu0mPoo
	5BaOBiEu0seCXeLFFUvJdOqyRQC9myRGBpAIUSVjuSgv2oUghw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthhafud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:47:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwaJLgXSzffUXs/ir2pVP22ekW1+tKGogc0SGPqeUNQsIHF6BUG/oph/RpRyxHX8xJrboGulYgKRxfw3QFsNJWpQ49stS4LLmG7zaRsv8Xmldh2Jrz30jX6qGwAlv0VlmPJcbW+GN1dfgS8XhUYyhadnc7TAMQErM1RJEgWJ19iw2wgBFZ44NbbY7oLKRJF2lWGE76TkUrAsAbnzqaPwMifWwYHP6hhsNHv8A0bRi6DPtfZwVKAvkwbVM/QFFuxiCBywaxyGXW2f2G8g5KOwtfWeoIW2lppHV18Ymo7O/2jXSTF3Ow3gMU8RQOdjR93G/Eemk69EEOHxK6zsSKhtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRPyRI8tv0PRic9ERSMIVqJ3Uf4PsnzGXmJk+/EAg5s=;
 b=SzAopsgWtHQNk1WNo59I5jxSVAygTgZsgcOKTPyg0l1un6Wi5862zVFqC6FoLWh1lBNsD+onUWvYJbPzbeBm363TIuI4P1SlWtvxkY/5kM3at/FhDs1sCnuIz5dXHsKFR+gAb/LugH5lr1vBXAhRQHGGGSiqt80VRTegv3c1gsyLIWXBs/w6hUYNSeuAuMNAxEAE6FVd5bXratCtMi/j/pQaZI2/nuDUIaU7c2+YyfybUTpEMJNytBXSSs3u9HlyxEdZqhsaBGBvBaAK9hRNLHzm6dSo1AwINosFaeMoiPId0VKXi8hrGO0058sa0wYaHzNW0bspb9zRUEi0Vr8gYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 08:47:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 08:47:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 1/2] base-passwd: add clock group
Date: Thu, 16 Oct 2025 16:46:59 +0800
Message-Id: <20251016084700.1537381-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0011.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 680878d1-ca0d-488f-ad16-08de0c909a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fDBesuW4pm+urTOxX15YP7eGJBd+t4oap3H+rTEYryk08EnW0jjoZ5Vn4tBU?=
 =?us-ascii?Q?jPyJG0SbHyfsFPYJbBt+Emn8QN/7yyEJ7PgsMW16rQOn3skTJigjIqLEr7Hl?=
 =?us-ascii?Q?u4pm9Bra4ejCA/8g6Ebq0685nQcB+ODrSgdeeh50651GbhQoE9366vng/KWr?=
 =?us-ascii?Q?QloGUoocXu15u0+bwGGIux88ab/fKmv0lOllgcUb3J9o3ApBcoPX94yA+fgr?=
 =?us-ascii?Q?x8pwqaB4DfHBdMf1rRsQ89PReqTO4PKQTmNlkn0E1ezfSgqVAVbk+PHE0dNZ?=
 =?us-ascii?Q?7PtuugjXjw6Xq+9ldXLHB18HIgfHKQrRbtvisX5vRGBn5R4LhMpMJ3a00qT6?=
 =?us-ascii?Q?Mgl3JJ/+22bcqxYQZt/8jNenebwNCWbC+1EQwlJjPsfxm4Wm5KKVFR365gVn?=
 =?us-ascii?Q?thM/jMv2WCYMRlWKu60FCWaree2sc0kUlSlJE3Q+glGGjRs6WCXbkxpnID4d?=
 =?us-ascii?Q?d6QpN0aDU4pcaGjo2c8+AG0a9DNwPgvWpcP3/qQn7rQKA7cDIwuC8yqOTQMR?=
 =?us-ascii?Q?DqAq1UnjGnQ+Ov7FDCsTwByfmz+qBZ7xecRKoarHlhM7UxJ0oC7splzCmxFn?=
 =?us-ascii?Q?xxO/eE4KIBGW5l6AwIzoVce/cJA1+PO3BWxFcdQBHeWLCOdyTAmnWV24wTrt?=
 =?us-ascii?Q?ShXKd0+krHRe/OOpnjgk1OxB7LDYqoz4Ken9DaAyLpktmvPE4bt/Doq9B/BS?=
 =?us-ascii?Q?cLJMt0VSUWY7+dOAP+aP1b8QAzs30NbEuF7Tfe3t5mSGv0hHQT2aeHdemIKH?=
 =?us-ascii?Q?NKZ1VV/it+7HqlCqkxE1OlPPiGw5Eu8bFLKpHxpCBbms5qNZdpYSiYSH/JOj?=
 =?us-ascii?Q?OfDlEnIxrQ2Av0Mtqtct8gma15zftGDi90CZFj7eYyLefreRUwRmpQUKDBIb?=
 =?us-ascii?Q?AQa3j4oKfPy5QmMz+GCpb+WZrW8B+j6Xz/by2e91q0/d3KsC8xXhZLm5Tk3k?=
 =?us-ascii?Q?MUlW005z1E2lqt3K5EyqvDHd1OEVNx6HbKGDwqfSSnx/PCqrs9p4B24Dii6s?=
 =?us-ascii?Q?Uu9PkhowOnOpFRTxXCIf1jQQM6wyY4Eaqm7qKGJfc+E7ajWMjPUpS6DnGiFn?=
 =?us-ascii?Q?gsH34GMcuuhY3qtdXHDPUzQjYP5APiiT+R7r0CXWAnl3/8nwlB1meY0gWEF2?=
 =?us-ascii?Q?Cwp1UpJ/K6n7ai/oQaVQZh6e9Bt5i1mihlitnC/ee6ABB8A8GyK1jbnNmAr2?=
 =?us-ascii?Q?ARw/W4Dw08ys+lUyOz2F//WXTTjdRjD+OMXYl5SpEr3TNBDC4aMXex34vVOI?=
 =?us-ascii?Q?459LatGkQ536cRaZ9XYyy0egAbN1LRFv+CR0XHedm0FvmXFl8hEx8He3OSd3?=
 =?us-ascii?Q?aGlozYDVsvXcVJZMHE6ZxellI8LYe1riEYzFPjnM7CBMqTfPJeoIEEANd0CP?=
 =?us-ascii?Q?6K4+M4MEE4yXdmOMgKeITDlRO/sOh69Hr3Spx6k7NAeyrzciZ013Ggas1Jnc?=
 =?us-ascii?Q?8xwCYy+Kr5YhFRDlBNkJX9nrTmar368oVzBBRtwKghhYKk20sHS8PQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+k5WueogLmet9CnKf33CTcPOHCb8VyHRZ8kc7JmP7JMvBdf3jt+vigenwW6P?=
 =?us-ascii?Q?PofPy5BhjEIvxSHrtDR328pt+aKzHgSt4sc5je4QuouaAoUdLEwjkKQgLepR?=
 =?us-ascii?Q?PbKq+jDAgRt46W5PuH74UDGNfkdLqQLdEqaHP2rirOLMurtvDFsLC5853g4n?=
 =?us-ascii?Q?6GywWmrBarzZgpy0Yb+IN+adWYZkMyvPKLzjseTP3HwlmbU33xCQs00Jf8n+?=
 =?us-ascii?Q?h9Ol/puZJwlYt+Ct+tTzDztfz3BzMHHCr0Tq6pijMmHyfpMWBhp5maWSHheQ?=
 =?us-ascii?Q?rjMTMf17k/Z8tp9YuinEwccUvOz6ER9l1OLsP99xfHnY13wHtwH6WWr6XXkJ?=
 =?us-ascii?Q?jexv/s6+RdPIZtjLDblG4bHjNq0r0rf8LD1RFPsQIOJus9GVy5A7kdVwE/Pt?=
 =?us-ascii?Q?XFnutB1n2sqwt5Mt04+djH4v7+pRUT+Bq0h+So/AYQiQErOq08pPLuTcoRJB?=
 =?us-ascii?Q?TVdTnZ1feDH837/464MRyP/x8xfKTeR0jlD8EAgkACjP51xANY33beFvAdVZ?=
 =?us-ascii?Q?VC9o8IroinmKvPUXqpV16StqVQ2Cf7FX1x9CsMH0CW7oLfEWEzJwusU5WENc?=
 =?us-ascii?Q?DmLC1D1vwQZJ7nJ7zQ//eamM3/aFHOyrf5VH2h18+rimhoS+kUVQHsdyqK3g?=
 =?us-ascii?Q?TZBn/G5Ds8q9URitAsOOip0piMPTlYwgtlPvsI4Q5cKb3S3PLVYipxicVJi2?=
 =?us-ascii?Q?c/5//knMw9/LVfKVDdSW+7/tDa2jEVXF5owFKizzuLvg4LZe9lOZM4QiTDKM?=
 =?us-ascii?Q?8MehV/T4HtB9rUBDFyLUSXp2cRsFUKG2kxa1sXXS+qaMScEo3vsg9Qcsytm9?=
 =?us-ascii?Q?ANTXY0Lf3nocYUKwanpH/6/c+RwJCWDx+sY1HyeKEiNjhhRQ+a8FzsgNaueO?=
 =?us-ascii?Q?B/b/v4foCIcn35xSpiwfJ2WSPKFJrWcA6XG78SbOuM/E04F5fBpkAD+0sgup?=
 =?us-ascii?Q?ETbVe79f1o00cY3lPY54ZLkDgEyY7sMfIh+hjTHseDgwDrJGl4WcBky0s1ip?=
 =?us-ascii?Q?mr7mhYN0OPy18YMFbkxtjGP/tVCRZe1B8ouS/5R56WbcHKDDckjvX3z3vNa9?=
 =?us-ascii?Q?rXQ87u/4bjkM7RzsVOHextsWe2Igpnea8KaMygYbxtE/Swit7o8jT9Obqs0g?=
 =?us-ascii?Q?WDtM2NntATFP3oIUaDPt2kM13RxQLukPVot7BiT5NoIc+rBFAW09saT9P/go?=
 =?us-ascii?Q?jDHQ3H8MFQadQmp78xJeXgPBxPfHdreQs+Jcbc/z6MkopsMhLjoGZD3PxwAI?=
 =?us-ascii?Q?vrCgMQSwBF5T/8rihyHCQJRRHPBp31tLOxPqCONAblADyA+xb8ZMLdVNobbY?=
 =?us-ascii?Q?5G/God1B6XtjagkpvrKD3UjfElCritnRZH2hlZvBnxymSCt1TJ1XKoMLsm0W?=
 =?us-ascii?Q?kT/hVYPfVguqnVVjns9Vvjy5070Sc0y8xnn5XeypWYa6ARsdJzHOerIHxAst?=
 =?us-ascii?Q?2F3vSoiZUR5zkd9/Qkfu6RSuMubz60GZVKSMG89ISWXgYq/HN2vMFNeZXjo3?=
 =?us-ascii?Q?XFtWjZ6FvODS3YyV8zhGESXxTGDY2za67O68BmgC9IOU1NcYuoY1Dp1OYM4r?=
 =?us-ascii?Q?C/tJKXAoWs6dKmzIz0quPlJLDlrbH+SDz4cZ8Dxk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680878d1-ca0d-488f-ad16-08de0c909a88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:47:14.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNLlhqoSXwR+eD4B1NXiJBOOXuS1xTLzYULq9XveXhCpKZCj26pzQanOyDC8YyYMTRrz3Z7pwR9B0aWIbX6tGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
X-Proofpoint-GUID: mVe1eh0abzkWplvLLf6LZe3OwRCXfVpL
X-Proofpoint-ORIG-GUID: mVe1eh0abzkWplvLLf6LZe3OwRCXfVpL
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68f0b115 cx=c_pps
 a=4d7Nl6fXTlayLABBLko2Iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=Pmu1SSgIpiWcXD3DtNAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA2NyBTYWx0ZWRfX/P2liSsqLAED
 Jie55sfFpbixuIJoqTt3AQPoA6v0DocwZwZL6S8Pxnhz0bt1MSlyvx0OAX6hykJijy0tAkFgJBc
 LUuplzZxefN09ol1BgbYeo7oud4Q/oxjRo6uK8gK8zI8Vx4NCamGbRCohQbLz2eU3EwFU3FEf7w
 R6pPV17VLyi5oY4dOu8ZFT9GqtuzaHI9lRw0C1/mxopziI+2ubFAZQA6HApNwZNtcThRTgtYTQy
 LnvzR/MnlUkEvH8Tkbz1XMf+NMC6kKn3HPfbgVuDtv2WUazT7Hy+cZsFr1TO97FvSPfWXwHAxsQ
 +i3SaMzriA4XD8lrBisIia8mKt3N0r2mfRmzlAbBtlzvOBnyfJTmMjHkrrlU+t0m1QdzVWRhu4x
 IeMt7yd2p936+fsoWRenDUtdRraCjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224959

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen. And as the patch to add wheel group
was not accepted by upstream, directly mark this one's upstream
status to be 'Inappropriate'.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..1cb22a05f7
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
+Upstream-Status: Inappropriate [enable feature]
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


