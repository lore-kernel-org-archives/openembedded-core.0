Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C7DC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:10:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15289.1750154995502866483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H3uTe7001145
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:55 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3tsut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:54 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA9sGU005946
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:54 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3tsur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 03:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExVmV3SJUm/1mTXt4UENo4Y90y0hKyxxOMqC97voZYhzBhuSTOcjPgIvpZc5KNgP9g/VWecx7WjvDGU2ENm3tziuLr3DthiDaCSocx1gEsfJEys9Zjkfz9a0Y0wW4V5bNgx8JagJyO2KyRTRjFyutJZXZ5g6Uo7eg1vzpGs5EqrOZCnU38/7F7tc61uFzQCaJduYbiRUg3hiVfPFYLs4V721aTCtcenoSQb082RfvQRD3eOVEFiMD4qjyMks1jRlYliPpoWLxXHZF82+yAU2t/mi6HaUcXsG8FLMeGDVxB65SkH+9NhY8V6r1f//vdT6I606lNd3hPBK7mlQ27VSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gvze7Q2bbAD4TIhveUAG7zGSfrgOeFu91U1uQ6WUYo=;
 b=beC4TtCljQUHAEb52oCmdTfrb/E1vJbd1afl7USOjwOOQY3evxQu9h2eDk/lu6DWQu4VJzfsPxDJp4JgG6NYSQrcMl5FijSqYXq7DDA3ud06YJUlopL3Cg5MVlMVWJAHefQiqqETnurdNHxG0x6qiuoZH7yfPHWGjT/KA//hrjhdCfrWW7SYcIyegectqiwCJgxg+zO+75bGVqJvtawh/HueQloWALhWL+coDstL+To6koSvSF0TbI074Gbe1noFt9e5sxVhMZ0UwgQw2syhc36hVAfWYJF9dH9HGF/zTXNUDX2wbLwnbuj68v4bys8JwltPoTv/3n8T3SaX8IO1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ5PPF12B0A4A9B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::811) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 10:09:52 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:52 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 8/8] glibc: nptl Use all of g1_start and g_signals
Date: Tue, 17 Jun 2025 03:08:55 -0700
Message-ID: <20250617100855.2696492-9-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0ecc57-7c1a-479e-9ac1-08ddad8719d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6kNk6jZYGhh+3/oOzlte66PXXstF2rwoNQPq9acRTnvYgf8EPMUtYotn5wq2?=
 =?us-ascii?Q?HgK8/aqpslgEb/HToqazvJUiXbpX8JVdwaP5UQ22QfrG3FOHI71DfQiYfF6A?=
 =?us-ascii?Q?LnT/yZ8gziqoeaU2152HTxusbTTwFjRk97kMWdab5kAEHzvz6Fi8Ag3pdIbe?=
 =?us-ascii?Q?tFMks3dsMA5VISABXsPJRSaZgs1QPEI5U9siPCDvbMGKnnDCzP6fLPGw0HB9?=
 =?us-ascii?Q?4NUCvrUPQhTKS8e48exV/t3q/CafgZTic5e5qs4Pi0ZN+5PIINyzr2FVrBjE?=
 =?us-ascii?Q?B/FBlBp7GO/qUBmM1HQKAuXwQ0ZNmXFvBDfic39N+YrJaXUYAQXJd1G2aoHP?=
 =?us-ascii?Q?y+KOkzd7cneLEsvbxbshlCH40HDNSPNnh/EBynsbuLYSCSkJrtqWLOm/UDH0?=
 =?us-ascii?Q?WA49tQ4vPw0Y4UAPYDGFcnyKKJgjoI/Imuo4S9zm4pdM+Z5+1uGJwxGkyXBF?=
 =?us-ascii?Q?pmZXtgq+yR8pXGFVcYvhhLRtd2wiz2CJyVIv4OFESnnIjfdLqoiql2IcyE4H?=
 =?us-ascii?Q?NdHLcJRRfKHQLldyxf5D2XnjXZxMraSbugBTAjMHpsljrJ8C/PWNEuSpKVfk?=
 =?us-ascii?Q?rmmY7CDmgz5ZyrX7Omunq72soAbo9mHyqGFXLtSp0hqLFxikfr51trRzMIHI?=
 =?us-ascii?Q?0W9f5kIie0xODL7e7BqjQOcRzg4vun2xJDUmE+/3y5g81V83Jntf1QxsXFae?=
 =?us-ascii?Q?No9/05FXD9fyg4dXcF79hkQjWrWLoEvga4RoY0HLVd9qhvW1udS030DRRXjP?=
 =?us-ascii?Q?uxSofmm1mYPHgsIRrFKujoLN0x57C57I7CMmPvWCsnl52YV+5x5omx0jStWU?=
 =?us-ascii?Q?NVA9TsvguqqISx1SeKs71EouOXndQ2fH7G3bG9NzQZjJqn75QTPkm/9aUKha?=
 =?us-ascii?Q?6pDVH3TYebRdt4tSDkGQt69+y/bOC/X7UJKF4yCX5rdCY62XD3ooXeHL0yjQ?=
 =?us-ascii?Q?B+psj8AoJXzK086ev1HeH9m1QdOKQWMjRpA0ihjBcwm8vWpmKBTb7D3J0Nn4?=
 =?us-ascii?Q?yB7o+Y//j9VYiwZP6NGKLGNJckJqNH7CXa+45UUQtuivWq36Gcq3F8n/ypaI?=
 =?us-ascii?Q?rF0VFQJ6HU6C3MUaj9jHMzS+RQRD53k+vYxFPxrFjHL4fuw78YyV/gBH/D6y?=
 =?us-ascii?Q?aFRsfoRq9RMh3iD6D0HOKj1K5Sv+zu/zyS8V+1oJ+b/YV+1WNz77LR9vR8sD?=
 =?us-ascii?Q?23uPLl/w7GEDKmE4YNuXEmprmF+fn1V2i2arxdvN6+B1IssrO0Xt/Yb3mkML?=
 =?us-ascii?Q?FZiGMFn+qdUjFfdgrFPWBMm2bNOFqBmO8dpnYBVcjmenTYyBsxq1ljxtnV5d?=
 =?us-ascii?Q?CR1bKMl+cCPhOeekiRUieFkunO3TK6/AHDe95bJOIXobSvpA/eCz95dTAX4X?=
 =?us-ascii?Q?HhaRm0CYc1f7j1qX/BPDS3wPXmMzVfbPvXGfnL9PDooL3pyv7nPBqwKptGZT?=
 =?us-ascii?Q?djzi71HDAm8nIU0OxWaSNWOzpsPibopk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YfuBpClO/Cr8FpVRIAJMM07bWSI8/HSii4DnRgLURBj5gLr1Be8JO9XSPGGz?=
 =?us-ascii?Q?zI2OJ2i9N2X4mztpMBNZizMtem78AzF4fu+VDejOz8b3sspb4da1ND6fjnFU?=
 =?us-ascii?Q?O0Hx73pBge6bIFEdjXDZqQqum8Bm+l2K/Z73gdKtzNUwaoNsBxcIjumjcSUG?=
 =?us-ascii?Q?eLJRZaOCINza6hUS+NwNFWExaqzsLQYpUB+muwcUQEwwGXdLF4dbys+O9kMz?=
 =?us-ascii?Q?83KuxEKjQjPKKHyZxNGVEbT1N4OERFQl8tbvB6g0SA6UCuDPYq43IGiHIaRf?=
 =?us-ascii?Q?rkcZgY4vgMFP4hKUloOYeYRoL8q5YR8qIWExqrr/GeCxhV3x6lqrLKMHBMsz?=
 =?us-ascii?Q?OYLfdiVpl/3+fg/M1XtHZf1wCkfmnb3r586xQJlTyL063qVbRhIXPazi14Xl?=
 =?us-ascii?Q?oLw23VAR8lqse10RQuR0Fl2sF5/Zqqxc6dhcaNmV7oUjm2DVFQr1PBRvswTo?=
 =?us-ascii?Q?S9kG6TAVz7KQkN02mSRW1prwucJ4ztZcbT3gW3vZHrDivCYqz+ygSnMpHDBy?=
 =?us-ascii?Q?ljQto874yh+2lwg1Sf/awoEc/35aLeqpJktz3LMEAzSfkBKJQolZ/bn6zI62?=
 =?us-ascii?Q?oou51FzxU1rYr2bDKhMn/WSWsOo9WlUtYssD7PMfcU6Ei9Rq5Yd7+rPacdcK?=
 =?us-ascii?Q?kG9D/9Qw5aMZX3wzCOVMwHKtAqKNjd5XF1KqMtZhJrOrXvlzXFNh5dtgtuQL?=
 =?us-ascii?Q?vupAp9+1qCIfyaLqoi4LSefpK/6rNGnrMV0T0yHBHczDCKdbJSIv902mcdum?=
 =?us-ascii?Q?VD9rqPcHpLwz7q3SBFEBsOv24Q81odxk9AaBWFYsQ+1p210mWkOonUT6j5ee?=
 =?us-ascii?Q?Huql59/LJkMqBD9m0J2qHkwSok/Ri6PHwyRJVPNDMXUA3avR/OVBrNjHw4Bs?=
 =?us-ascii?Q?xY0+Bg/8Nm7/7ILWDNoBvgaZCz96eoJs1sKa3DJPGPLw/ECnvBbEnQfUljoW?=
 =?us-ascii?Q?c/ODBk3jOqk5YGbH7ZpRL0oxVTjBq6WfV94++Rpo/xGSRdWDVE/O7WmAS/OB?=
 =?us-ascii?Q?lmIB+0tJMDN1zb4CQGL56A2+EGaW0sIRMkNhDuf+8IcffCJKj93nbPnOiCya?=
 =?us-ascii?Q?Llg8fw3wmfWilSURjbM8nWUTLIrH7F+HvyZe1UC2Fd7T2/QsgSFXGDTQ/cdb?=
 =?us-ascii?Q?xtkoWxqfGIKE8RuoCyTsi98qzaSry29vL5U6J8tG85Rs+lLwhW+dyO3VHgVY?=
 =?us-ascii?Q?gdcWa81yZohC7KvwDq2VDIbRJn8YzEi938l4sgqgj8cNOysnVCdB5Ar4yUDS?=
 =?us-ascii?Q?kZfxzGk5sLqLDOdUe/xFxUSL0NNrg7ctDjYyjevWZB3gIyzaS9XMrF+P/kLZ?=
 =?us-ascii?Q?lkesYlyZT4lsiNLI+ZSSv2maf4YoYPDa2hGqEqSoZ6lXnkU1NJdGk+DvGi1X?=
 =?us-ascii?Q?mOQtsAJDSdgh14AmWGic0UHife4n5Gt3d9k97nsBF4Z7PdpE9RHa5LCAg92H?=
 =?us-ascii?Q?vSw0NErfJf1RGTWlATHbA4K0YE4oMfgM12197CrrXR1a3UJ1CAFjV2GT/JpS?=
 =?us-ascii?Q?VKfZm5cEMGSF2jknCMdHJ9yxrFUGOxLV6qAlDKKX7PpVUoCgVtutnU7QN1Bu?=
 =?us-ascii?Q?6v/FwIxFJIzw6rRYF6IjbVzhzpX1/4J1Irt1MdSBpSHIZSSWSUfdy9QSQGP8?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0ecc57-7c1a-479e-9ac1-08ddad8719d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:52.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Axbr3n+9bgbe2UFDgEXbgtDJGVSR74b1Jwv8cO7zWUkvQx9VoTOupCvjgfxVR0aA//PMDGAinKppkzQTmoOLufw3bXxmqMprvkW25o7rK08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
X-Proofpoint-ORIG-GUID: LLh4AKEhk7m1wC5v_3geCWwcKzh3AFdq
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=68513ef2 cx=c_pps a=YRACufkBk+Nn0Aes1d57Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=X6uU5uM_jJMz_PZaGGwA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: R1EwJX0U_Us07N3ZvWq54RvhtHauox6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX0ffwJ2nySGEb Q3oMFRxfYbSTnMKVUoCZrydI9jfnpykcd+nyjbnmgPFoHlTvdsNY4FCy0lGpy4abvBLzmGIXTFj XOUpW0LYVII/e/NrPjhlw9e6mrBehROVspNmybnsaTt3nP6Doh/iky1jvnoTmMERMP7ijkJKJLy
 /BtV8MLqbE4HddlGygk9+Ci0dNMdaPyuxlNfYXs0l0sbewf0rWpFuHOPFxMlB/wtlOIUjUOlaU9 0+tcQKETWh5DS2ik/Co5SZToAEfI5azGx/ZZJL8ouRdjqtgJptU0Ma+1gm3Lqf4O0UFoJjO0wFc qujTQcbgQYFi4dacoIXFuGblhEwoKUimsgi08VGIzbhcwlxibrn3umwO+LEdpsStkXzQj2fciqf
 PrC4MKShtwFHR08bndCZM4kkuZOndIq9H16J8M2jAU2vwLmNiwYZUX6teL9gLeVXS+vcDCX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218877

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-8.patch          | 192 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
new file mode 100644
index 0000000000..8ea0c784ef
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
@@ -0,0 +1,192 @@
+From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 02:08:36 -0700
+Subject: [PATCH] nptl: Use all of g1_start and g_signals
+
+The LSB of g_signals was unused. The LSB of g1_start was used to indicate
+which group is G2. This was used to always go to sleep in pthread_cond_wait
+if a waiter is in G2. A comment earlier in the file says that this is not
+correct to do:
+
+ "Waiters cannot determine whether they are currently in G2 or G1 -- but they
+  do not have to because all they are interested in is whether there are
+  available signals"
+
+I either would have had to update the comment, or get rid of the check. I
+chose to get rid of the check. In fact I don't quite know why it was there.
+There will never be available signals for group G2, so we didn't need the
+special case. Even if there were, this would just be a spurious wake. This
+might have caught some cases where the count has wrapped around, but it
+wouldn't reliably do that, (and even if it did, why would you want to force a
+sleep in that case?) and we don't support that many concurrent waiters
+anyway. Getting rid of it allows us to use one more bit, making us more
+robust to wraparound.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++----------------
+ nptl/pthread_cond_signal.c    |  2 +-
+ nptl/pthread_cond_wait.c      | 14 +++++---------
+ 4 files changed, 18 insertions(+), 28 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index a07435589a..ef0943cdc5 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Add as many signals as the remaining size of the group.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+ 
+       /* We need to wake G1 waiters before we switch G1 below.  */
+@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 3baac4dabc..e48f914321 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      behavior.
+      Note that this works correctly for a zero-initialized condvar too.  */
+   unsigned int old_orig_size = __condvar_get_orig_size (cond);
+-  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
+-  if (((unsigned) (wseq - old_g1_start - old_orig_size)
+-	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
++  uint64_t new_g1_start = old_g1_start + old_orig_size;
++  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+   /* We have to consider the following kinds of waiters:
+@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which closes this group.  The value we add will never
+-     be negative because old_orig_size can only be zero when we switch groups
+-     the first time after a condvar was initialized, in which case G1 will be
+-     at index 1 and we will add a value of 1. Relaxed MO is fine because the
+-     change comes with no additional constraints that others would have to
+-     observe.  */
+-  __condvar_add_g1_start_relaxed (cond,
+-      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+-
+-  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
++     the change comes with no additional constraints that others would have
++     to observe.  */
++  __condvar_add_g1_start_relaxed (cond, old_orig_size);
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
+-  /* Now advance the new G1 g_signals to the new lowseq, giving it
++  /* Now advance the new G1 g_signals to the new g1_start, giving it
+      an effective signal count of 0 to start.  */
+-  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
+ 
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+-  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  unsigned int orig_size = wseq - new_g1_start;
+   __condvar_set_orig_size (cond, orig_size);
+   /* Use and addition to not loose track of cancellations in what was
+      previously G2.  */
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index a9bc10dcca..07427369aa 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+          release-MO store when initializing a group in __condvar_switch_g1
+          because we use an atomic read-modify-write and thus extend that
+          store's release sequence.  */
+-      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index bb46f3605d..430cbe8a35 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+      not hold a reference on the group.  */
+   __condvar_acquire_lock (cond, private);
+ 
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+   if (g1_start > seq)
+     {
+       /* Our group is closed, so someone provided enough signals for it.
+@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
+      * Waiters fetch-add while having acquire the mutex associated with the
+        condvar.  Signalers load it and fetch-xor it concurrently.
+    __g1_start: Starting position of G1 (inclusive)
+-     * LSB is index of current G2.
+      * Modified by signalers while having acquired the condvar-internal lock
+        and observed concurrently by waiters.
+    __g1_orig_size: Initial size of G1
+@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+    __g_signals: The number of signals that can still be consumed, relative to
+-     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
+-     31 to 1 of g1_start with the signal count added)
++     the current g1_start.  (i.e. g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-      if (seq < (g1_start >> 1))
++      if (seq < g1_start)
+         {
+           /* If the group is closed already,
+              then this waiter originally had enough extra signals to
+@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          by now, perhaps in the process of switching back to an older
+          G2, but in either case we're allowed to consume the available
+          signal and should not block anymore.  */
+-      if ((int)(signals - lowseq) >= 2)
++      if ((int)(signals - (unsigned int)g1_start) > 0)
+         {
+          /* Try to grab a signal.  See above for MO.  (if we do another loop
+             iteration we need to see the correct value of g1_start)  */
+            if (atomic_compare_exchange_weak_acquire (
+                        cond->__data.__g_signals + g,
+-                       &signals, signals - 2))
++                       &signals, signals - 1))
+ 	      break;
+ 	   else
+ 	      continue;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 547d0a3d7d..b5f1535b83 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
            file://0026-PR25847-7.patch \
+           file://0026-PR25847-8.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


