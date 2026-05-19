Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D1ECD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16418.1779175561040039017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s0GJzhkF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wT3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:26:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/oIeJXGn3omnUjK3JUxl271M2lTKlApi1Dh3BI6brNk=; b=
	s0GJzhkFvuKkqBw8LK2qh+SR5HkDXkC8iOgU39ArSOkWWLjncfBp0+Q/0uczqYmv
	WOKbviCQu0j8iSSASh2wZOwQ6FYOhVi0tdoIyWNfk+O3gqEaFNELG6uSwRtwYI2C
	HeOZLDBHzkmp0M2mDe/io2HQ0iZS2LaTsdb8NIXK9k1CiICnY5ONwN+vskOICEG4
	WRRs28/1aFZ7SAcXu36Fm7bCmkMUfjELlTUimmV8zGA27wS6swJU/DOMJr0y10fq
	fVNGyTTynSRGHixm//Qb/hy0YeIm2mVb+nnTFtfBmMltQwmGHlU09pnm8KQS4Fgn
	6lpmgt2WDAuh20Lsp48MGQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvBhfPO+bBOvMVj2mzO5I99EFM3PNlOQ6DZv9GA9qTf9rpzYC5A2Qiayvllh6JaNcFO0b6dZ185R+mWA6lyp7Pftap6/8imTtSo5hAbDhwSWTbJMRY0lUcv25gycA4ykGAUJF79jX90dGG3q3JJ5txGbsaK60MIcbkjKrKkwOaeKUSYXIDdhwLXRANJvbp8gZ9sGV4tFQJgCncyTxvg1D579frSmV+fGF76Qefc8aVwjqFDJdzCbQlj3sxa1x5PtE+MVlcPCLjPS71g8L5bF+2+V+Dw8WeFTEpSKCjI9gPSsHfHD7i3qB+HNJvYkmLs1goB3BEez54RgG3wMvjMgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oIeJXGn3omnUjK3JUxl271M2lTKlApi1Dh3BI6brNk=;
 b=TbcoosPvxM1wsQepxinfu1mHEjn10dYrKo5ResfkL3Onh96kDsqJTbp7bzzUYYvSmwA7J6BoLlBDSDiHdCmv8iNm501xbeA2e091shhInpZyFFUh6b2xPWjCcy5WXYAlf+JQxLMRiDq871qHIqhm6UjWh1PTWs5YVUy6NnSV7u18rvrksJ8/+iupzeMbSlfUOZZd/Ry1EaPF96rORMXxuJ3QlyKi5a22a3DzJydYETGQ0Q3zhQetLQF7fzFKCKI23RIE76wm+GohMHkDoB1TsOerM+JoCu2p+J6cdQ/6EnQuo9qr8BZRezCkU48IFc1p933yBua4jih8Lee3yuKFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:55 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:55 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 12/12] gcc: i386: fix ICE with -ffloat-store and SSE [PR125308]
Date: Tue, 19 May 2026 00:25:34 -0700
Message-ID: <20260519072534.24588-13-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e0c973-10ae-4028-1b05-08deb577dd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	9FQVg2FoD2CiYJl3pMnMoRg7ECKtJswb0yOaOtQKjYBXcrb9GXQDMTQ+2GOigTF92P+mcwoDTK5Xbamu0wCaNt4vNotvcPstJQOS3yxaycLhJZPU+rgRrpiP9RIWEXAj61SiMk1llqSBO3pnXV0tQ7JV+lgQyW59MezqV84YFbMGiXHgtmzWmeq8mTBxypioJyD5iWSlxBXj+/H0yMcvDm5jWG/ammcYE7PWF0xP52d9YfLEXdit4hAYkm20Uqms9mN6d3m7qUheiRlf9TmXOVnDyKPEfExAtxFwhl0y4f42r0BK5Idb+G5Ipgig1nSaz3dZJSaloEyQAprungd2+xm3dP4GWDUs4U6RxmkYldeVA+GGEuKHlR8WXEyEUVykprajv5BEAY/9FFW3VgHGFeH16lrU1TonDi5G4y45boJhhudw4a0Masrb6cikx+NFzpsIxliMGPPPZcKDdrGa2OUDZVFLUlub0eG0EA0KcO361V46F6Cr6oAWDvJTih4fiqFP8EoRIlr9ueXsXqenKvXHtjjrkhf8ITEUxVSTx3LNoqwR6EprHcv0P/Jg/CHIwfv3FXGhoCzWaXug4jHvC62znh0dJq0N436/rQ38BP1ILCAQse+ZYp2ZX1dtatsOym9lzbydqJePdTtJHf1Y6ELUPegBHqGndS3hcq6W0Oha+4klYucubkiHKuQLDnFmvp9vVuxXgBG+HHjAdOqhlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rfmi7KqXkFXYptKdk6WYIA/Y7pvU7jf8VsvlE7Ogrfg+DZRF196N1JcaOfjH?=
 =?us-ascii?Q?cBC5b9ECmgQb3JbJwUERUeJg90us3+WnZ/68uD0qE9mFcKEtYWiVgLGiQYqO?=
 =?us-ascii?Q?QGTbValQF+B/ww00XBJDPU9rhRjX2mOOdlkjq9i0eDh3CjhfKXALRdGjfn4h?=
 =?us-ascii?Q?EYTmxc/AZaQUAN/heZF0NWbTd4WJz4aWSlwjp7TwJTjU9WuW8hSp8hCl9K6p?=
 =?us-ascii?Q?pxlSv5NbQRhk8sQBpn/QTTgR6Dv33Ktv5U2G49kxWnStqxaJpJEtuAg8BhmC?=
 =?us-ascii?Q?8y2FUumWY8guf+if0DmrQrxSCsVeFDvE2LK+L4ecxacxmdM/0HUE0uSjKqh7?=
 =?us-ascii?Q?Nu05O6QD3ioK7jnChwCBi0BktdY9b8W4iTdEbBUGQk4XnOH5+QXGVXwDcjiN?=
 =?us-ascii?Q?TxKTIzmJJDn8yUf2ZjaoIDglnQsJ9x/K766HyyCoT7uDEibTKcZCJnl4SX8Q?=
 =?us-ascii?Q?BtOZWaHAfqZZcY63hyktoGLWnPIVRX12V7JFNDAQmySQPzuTB73StPrtZHwO?=
 =?us-ascii?Q?Fu67VGxYqEqPwF5yvvpFDCDtfM/hJZDOaeu1I11pPGns+CTA4sg1S8aCCcX4?=
 =?us-ascii?Q?SJbfz0wcT+B1FscgA2rcn8WTRh7PVY3plMEsZgYVsBjUw/4mhEcH4jhd7Bej?=
 =?us-ascii?Q?8zQU2sV3epI5WJ5NU1F/EEWhkwQy0ACisZVB2eZhwaqZagvKMOIneSr82X5I?=
 =?us-ascii?Q?LfL7B7FyY/ISRDZh7LCx/QyNA0ZHjdpfLktaIli8q8DquqPLHcCL1SV6JCJa?=
 =?us-ascii?Q?11IXvG88jLdh6VR/ht7qnkviyEbN4VHH6rgny3ozln/U43tzrlf1zbszvLLA?=
 =?us-ascii?Q?Qo3/PNQSOhiLy2zt/LgMmr7s9nyt6KId/BiubkKDP2olBPg8fqLb2u2OdVcM?=
 =?us-ascii?Q?Iem4e1rELYwJL1T/T49K8HxD6r66qKsZruj3KFKxMoKWgpD+tzRwfciFtCLk?=
 =?us-ascii?Q?GBYU25ACTRpbPnalledMUToIvZecgimpj/lFZym7si29XTIwEWdXG3ZCLf5P?=
 =?us-ascii?Q?Y/bfaaJlhvZrHDLVvXor9zActpp2yrvYYopxIBxnPDN4G03FS7Js0AhpoWgK?=
 =?us-ascii?Q?87hP4CVFp7bMtBgIcZIRDaEHNPTsJjk/+nD1E6OIqVpXwrx3+HV2hHmXcyfD?=
 =?us-ascii?Q?c92Kanpcp4RBDTlVcv3MkATwuFqZdfl1ganhijPsCfAO09JsVwM3lm5acPWG?=
 =?us-ascii?Q?wErH0lK8F7VM+yCPZZLQDkIcd9sYwEcQ1OGX2bfq7OEPU7UmHx9ynM8JOxzI?=
 =?us-ascii?Q?E3x1gAefGWjlrk4EJC80jdRodLNVJHAOTpwxaO4iIWh520FEdht1j4vlKfcV?=
 =?us-ascii?Q?Q/ja3ZuJUeMUkq8B7lkqRebDK0bD+FWCuFNofeXK13xyWgXThKEyNAzI1oDv?=
 =?us-ascii?Q?BBgmbWIq2HG6g1vLzk7EfDZfZeiteV37OATmYW4fhcpjXa68+G+nxZb/gVyz?=
 =?us-ascii?Q?pLQFsvj+0jhwef7XjijRNrXoBaNG42Q/wIxOpfC9/aftKMrojdHJkITqsU0F?=
 =?us-ascii?Q?ZsblextiTpv9Vr+A/YGSqOLU0LRCJjKGsSagNLsQing18YVIHmjRS29GaFII?=
 =?us-ascii?Q?hmhpX0wsv30hl/gfmPN3lQbtOyA7VJ7NO9RoXv4yDGBJe2AdbuiTq97a+iS6?=
 =?us-ascii?Q?JcMNDjL/DADvuSIyk8EV0TfN01smSc/Y+6MY8x6+/jAyDXMVWAGYYvBM0M+O?=
 =?us-ascii?Q?9HeQzPcNo8lWUiXuasVVStQ4BfPOGgxq33pxYaqJhfzNK8wXY7clQBImgVir?=
 =?us-ascii?Q?BqL7mSN+oxQsVzSUBGvpr5iWOI4bTck=3D?=
X-Exchange-RoutingPolicyChecked: 
	xcPWVWmDzh/h+ci6BOuZEh/tK5HNKFy8LKWA5mIMxQ5RfrZoWDjSHCwgQ+tb0wmGFdQPq3Zbs0KaTxnZeslQhKErKhxOzDbeEgPXoQtfhvitabJ+d5a5Ec6RV14w5DrmVU+BGfxNs46GGpDXbo+A4u9a6mRqHsw31QbjTQPE6+iLHMOBe4T3ULR9BAhteBw+9x7pL2SrGDOAq0NXF6QBcpuYjj0g+GLyhvhJN4yNdGdqFg43jQQkOKOHwCKVNTZ9BLHZKBA/NsjVuAm7hNILtZrfXVRXXJTyvdCh/gWiIHVHgINqFEyRY3Xu3SDc5zsX0eMjo2xjupqRgKa7T7tqfg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e0c973-10ae-4028-1b05-08deb577dd6b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:55.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+GcYivoHzFUGf6/yXqN4GGtJtzH+fQV1gDa1UzUZO0N6N9A8FGRV0bz0QAHjE63bFQKowvyb57dX93Ig72r4PyQtw3XqE7z4f8SqUXj8aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: -kv7Qqv9HUQ-rByjqyguGi2G0xrpsT-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX/4okILRfAzQI
 th5/0ENnTAWlrm91JTUgBAfcGwlicccNuIcLYrv9tf51ioeclPW5GLczdLW/uJqOF5duEeKtA2U
 6tB3fu3CsBBEskOmx0Fk8LWs+bdknnFtUQyNweFuJ828hDYAVF6EmCpFv5iE1oZjcVqx/5s/zVW
 WpEEkVX0QvnM/E8exJnHacWZXdOOI89+v/qrmD+rkvz91abaU/fH1rg5s/boP/0w4FOM3ELwtWm
 kzXcipb3VYwsRN50agbo5eDx8N+vOpiNAjGwWxdqYKx5p40s26IQekTSKKX9MThDKuHr4Ge1M9Q
 9sNl94AsWpsoLS3Ma0LIntHXk+fr5Zjjp1MgoxNzW9CP3EW6OdSjGYlMKYmGpyH5qmsmkp7Yjsl
 JoFVnuU85EuBjJBk2XoN3Zh2TjVUbDD3tekMSg+AON+S9eNCF9sCfdtKpFKCUSu8mNgYl6p6wkn
 lyh81oTBqlNH9FCt4qw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1088 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=jlh4oiZtptqtEtrTLrMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -kv7Qqv9HUQ-rByjqyguGi2G0xrpsT-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237287

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Backport upstream commit c96589414eeb0e46d9fe9cc1d562e048230b5f67
to fix an ICE on i386 seen while building piglit with GCC 16.
The failure happens during the IRA pass in extract_insn() when
handling UNSPEC_IEEE_MAX patterns generated with -ffloat-store
and SSE enabled.

Link: https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc        |  1 +
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 3a96228631..4598aff045 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+           file://0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
new file mode 100644
index 0000000000..0ec8a91ffd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
@@ -0,0 +1,89 @@
+From c96589414eeb0e46d9fe9cc1d562e048230b5f67 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 May 2026 09:55:40 +0200
+Subject: [PATCH] i386: Fix up *minmax<mode>3_4 [PR125308]
+
+IEEE min/max are not commutative and in the pattern
+(define_insn "ieee_<ieee_maxmin><mode>3<mask_name><round_saeonly_name>"
+  [(set (match_operand:VFH 0 "register_operand" "=x,v")
+        (unspec:VFH
+          [(match_operand:VFH 1 "register_operand" "0,v")
+           (match_operand:VFH 2 "<round_saeonly_nimm_predicate>" "xBm,<round_saeonly_constraint>")]
+          IEEE_MAXMIN))]
+the first operand is a register and only the second one is register/memory.
+Now, the *minmax<mode>3_3 define_insn_and_split does
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, tmp, operands[2]);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+where operands[3] is the const0_operand, so operands[2] can there be
+a memory, but in the *minmax<mode>3_4 case
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, operands[2], tmp);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+operands[2] goes into the operand which must be a REG, so it
+is incorrect to split it into something that won't work.
+Now, I've tried both disabling the define_insn_and_split and
+the following patch, the former to the latter results in
+        movaps  a, %xmm0
+        pxor    %xmm1, %xmm1
+-       cmpltps %xmm0, %xmm1
+-       andps   %xmm1, %xmm0
++       maxps   %xmm1, %xmm0
+        movaps  %xmm0, a
+        ret
+on the testcase, so I think it is better to match it and force_reg
+(it is a pre-reload splitter) than change "nonimmediate_operand"
+to "register_operand" because it won't match in that case.
+
+2026-05-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/125308
+	* config/i386/sse.md (*minmax<mode>3_4): Force also
+	operands[2] into a REG.
+
+	* gcc.target/i386/pr125308.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+---
+ gcc/config/i386/sse.md                   |  2 +-
+ gcc/testsuite/gcc.target/i386/pr125308.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr125308.c
+
+diff --git a/gcc/config/i386/sse.md b/gcc/config/i386/sse.md
+index 51d1e9b455a0..de092f4b9ae1 100644
+--- a/gcc/config/i386/sse.md
++++ b/gcc/config/i386/sse.md
+@@ -3468,7 +3468,7 @@
+      u = UNSPEC_IEEE_MAX;
+ 
+    rtx tmp = force_reg (<MODE>mode, operands[3]);
+-   rtvec v = gen_rtvec (2, operands[2], tmp);
++   rtvec v = gen_rtvec (2, force_reg (<MODE>mode, operands[2]), tmp);
+    operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+  })
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr125308.c b/gcc/testsuite/gcc.target/i386/pr125308.c
+new file mode 100644
+index 000000000000..0a4dd7c8ea6f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr125308.c
+@@ -0,0 +1,12 @@
++/* PR target/125308 */
++/* { dg-do compile } */
++/* { dg-options "-msse2 -O2 -ffloat-store" } */
++
++float a[4];
++
++void
++foo ()
++{
++  for (int i = 0; i < 4; i++)
++    a[i] = a[i] > 0 ? a[i] : 0;
++}
+-- 
+2.43.7
+
-- 
2.49.0


