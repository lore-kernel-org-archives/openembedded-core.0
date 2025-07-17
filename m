Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACA0C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:35:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44826.1752744893828158412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293b8b63d=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H6fUxI230179
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:34:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxjvvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:34:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCYEC1vQteCIddd8Jf22wFs09HCDJhy+32r2EcBVFn4uzY+44waUKTSaWGArSdcWaMZuPWfBdJpiDSxsbjQEqiiJgyU7CrQ5OdjO4tC6xvZfeGeNPLNmz/7HbUUq4yx4ILRZJYETcwC8p5nILI7/XYrE7xuZhxO51SM6HN2prQrdcoWWfHQ+4n6X0wP+6O2nSar8vOly9+kDGdIeKEgYYt2wqkNuyVBW6C4/rlTdpRONDt1RvaGWlPY1waF2lxmGAj3e4KwuIchwAdgb85YkeprdjgRUuz20Gc8qNgCsRTeSntPjMiP/X60bKI+aTaIJF/EwmhcAA6gVhHlZPC5uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHXj+McsH/85t5fiWCCtEWBne/4R9LwJWT7gXRHyXVM=;
 b=M07MQUyKVtnHlZT7WWUoqkdHt3an+45DwjMnJLigu0jBVmq/HUGEOghfhsKJSBEeH4kCN22LgomRmCFUbRVnwxcqBvwazaDyK4B8vliVl2KfnBbJV1VNLEd1v5HxWpoZ/q5pb1C4FhFBGklZBhzJwlbnkMo3vxb+4BZlx5h+RU0C9wOioBCQCarvq9OuoGy1EPHUGs4pY/0fb3VcNcUt9kvtGRh1vbjJD4Snx9PINJRrlCGMEX9lInRboPtlrSJB0GpCuiHG3NCb3zECFh/CLCEmi9bpeyTr4CAlO9W9PYNMglru6sEi0kmKkP6uJfaentNeAGs/AiXuViVI1CM9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH0PR11MB7561.namprd11.prod.outlook.com (2603:10b6:510:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 17 Jul
 2025 09:34:49 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%3]) with mapi id 15.20.8901.021; Thu, 17 Jul 2025
 09:34:49 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] avahi: fix CVE-2024-52616
Date: Thu, 17 Jul 2025 17:34:38 +0800
Message-ID: <20250717093438.2172474-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0170.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH0PR11MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: c84b531a-5dba-402c-6cf7-08ddc5152c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DtUBR7gRkly4k9atDGLWhvfkWtL2U3/6P96PfdnQcSiCef/fpAzq8K5Yy7DM?=
 =?us-ascii?Q?iDvVeSza0HMgHPDTjRnhPNlol8/oGSXdcq2uGyNnNDwPg35ujDIdxepzOZg9?=
 =?us-ascii?Q?ctk4vuk57nQCk7b1sFkgrI13VSzpSwZ6JuVS91A4Jntyo5+3uW4qgbxMEm8o?=
 =?us-ascii?Q?BM6qiRTgRAN6vO9+Iit+o6rw5QYmstIU/XuGNp0ZxVCqYT8Ff+lcWM639STE?=
 =?us-ascii?Q?jKxFVvAbsMmY3ZAP/j/gnw8ulCc9NLr/NhB3mE3Kej+MhkroRIZ9n1Vk1k38?=
 =?us-ascii?Q?/sBfn0RYXDv2VwD02dsS7M+oJClcbkBY2qgi1zjuZnCQYW+f5GJp2kH/GB73?=
 =?us-ascii?Q?VXbgQbs8HUs9g+g+aFKSqHV3j8hsKj+fHi004xCHM0agnBq6yhTaeR9n6xew?=
 =?us-ascii?Q?uhvxUHLapE/JDKIKeWR0mUIUZ8Mk10JfKiVRZ91a0bDMyfWcltvY42sPW/z3?=
 =?us-ascii?Q?341hJ7q4aSsLCie3903W3uFNggm5NVOK6RqYg1FvM/ZJT3M1In1ySRsMZIqH?=
 =?us-ascii?Q?qxQidY59pkbfFQxsRO9q+9AzTEyimkvbq48OkoYiYnpCAAHGQRMqC3xkBWd1?=
 =?us-ascii?Q?Hsj6wvO3So5ioZUSBmLX+EHGX0+j7A8DmzPQOwFWEilWV6crCT8AnZlyE7Kd?=
 =?us-ascii?Q?mW3/ziSH7FbYulYcQiRJauQDFMKqUk8F2eERZx7bel7dXf2P9WKjFX/wU+45?=
 =?us-ascii?Q?5NiDTkqeW3W08XR91GIexBMuKA9qBCmKaTo97T6qwmIvzWXLjIMwwlpDrPxv?=
 =?us-ascii?Q?2Z6SaFBBndMr/zePZ84cGATfxknUWiTo6iDI6BjM5P9u4KowEZMuzRDaiuY+?=
 =?us-ascii?Q?+ZGIX7UHbi4ex7WGXNuuhNVxuIiQSizWCVIQ/zQ3GceDyZvmoTT2L/oMJLG1?=
 =?us-ascii?Q?1Ezawhw/yfCZBSrB6vXwZNVVvAgxpwApjHSXMR7hAhaNLmmlsQq/shNbxCxB?=
 =?us-ascii?Q?ijiIjheNEn0cweUwoVsLrtMdwRflpwY+FLv5l4Yc3ltM5jWAjTRmQhgDYdXB?=
 =?us-ascii?Q?D4O4mwUejh6db82LZFf5nlGMrhDWTbb1acErOHp+/6goShJ4cZHiVDDI+O1g?=
 =?us-ascii?Q?gDV6t3aB0jf50fxKzARFOaoMzJvpZl/RzJdzEIlKQ5JtBiic35XfSuWKfBOF?=
 =?us-ascii?Q?AhpZ45ZB6x5kQKwlaIJQGTTv3MnwD4UPCGm+UPntAc2I88cBi1GhEIiJkbYH?=
 =?us-ascii?Q?xMvitsnL9WH/1+F8pabaIoTey5aEXTV0xfDfMKsuMU2QfuLYrJ6uQPHneoA3?=
 =?us-ascii?Q?2VBZdV6kwhLzcupocBxw4em+jiSdIoc+k90xjEHJ79yVZakdGD1PJkRmnMmi?=
 =?us-ascii?Q?sLoF9tU+KJbTX6ALPUy0fTyjWLkvnKcRfeJr3zI1S3upibdQuG4iB2+4abc2?=
 =?us-ascii?Q?1DCvBNvQMBOpwnuPG8ttFBauOxtJsxd29W/gE0aEfjhaDCNmNawrCB5yAMou?=
 =?us-ascii?Q?6Zzmts8mRMPc1wOiG/mDfu0AWxseDps0UfliHvPs3qN2sXGaGBCE5HNmqfoO?=
 =?us-ascii?Q?zujZy9/4uRUCbgw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oV5/hjG5pcBZvE6p+15rLmdxOhDHQ2bWihxYFVm7Fo0YIHepoxmjQ5shLL3B?=
 =?us-ascii?Q?V7cGmxLIyqf7lhoNWPBM85rjlEwPI7rAXBGxJd/iR4J6Yqi6KXWd2qj6FeVi?=
 =?us-ascii?Q?LwTx/KLrAOhYrNZXk6xs4nKap7rpGhejebjiIcQ9QKhxoOH4JzcGGxotqTZ8?=
 =?us-ascii?Q?ebuqhExsajwWlRmUVaqDIXxUU5N5bFKVngON+Ll66RHNQCFZUt4I3bN9GVWG?=
 =?us-ascii?Q?5UN+hFt4fYswnXbQ9eFlXIPVIzji8vTLSNWi+REPSEbTNi1GJSMsDt/bobPj?=
 =?us-ascii?Q?rXGL8B+xOEDDTsJQqmKLJheRg0PnKmXOpiOydSGXhLom2FY8f0nTNWE5E+Fa?=
 =?us-ascii?Q?nBESYqAW3zYjSGP1Imcvke0moWqASXrRm//21rV0LDOLWDptPYeejuj5ntIM?=
 =?us-ascii?Q?pLOc1NrlAuFbbSIkcVC2dQeV95/dUfST+IqrCs/wIHKYBI2huDQv5ZXXsjGL?=
 =?us-ascii?Q?Ewrb/257/jiZfr7nrRMLtUhOH94ia3orInT82i5LRelVv8pjp+N5XpTRZHBW?=
 =?us-ascii?Q?KFHKzMka6BhtD/1oT9FEVfBeeEmkCLb0shjnPPSDGrhRCHzmZLlDJARUQl75?=
 =?us-ascii?Q?RlMomfs3lB71BouiLuiyCXBUlG0Cleoh9qaxEURnSqHpy6UA3rFCOMitquyW?=
 =?us-ascii?Q?KH912bro+FSLkKDQTxg5oMj7lWE3r9OHG00W6yIjXT8mGvUz9+eshqt8vcuz?=
 =?us-ascii?Q?KTLtbTgoZqIfTPvYOgsdznop49Kv7rpE0YNK9/ll401tx6eP0qshIi2giIiU?=
 =?us-ascii?Q?1dZXxQxhrUc39EHjfRKs0xq4dWZuFtWseCaBAh2JE7M2WbB4rkRH2xlqWJ9n?=
 =?us-ascii?Q?CMYOhUYcynomuWHdPVmwobRDreZkNgR/sKdrhdRGlWYG083AIN829hOLm7I/?=
 =?us-ascii?Q?1qVXP5KIsl9hMUW4aPuOl40SKlJoZnxKdNNDzjmpWv6khpGiFv9aJV9QGM9V?=
 =?us-ascii?Q?e3PaP2ta34LhU6fgk3NkN7kw3Q2hdy+SLXvY1M96u4upb9ogGZe/KhYwfnoM?=
 =?us-ascii?Q?KhTf18/p9YYMArUhItiBmDRzlmI50PtYZdOVLeRSvbdsYyeXLprGEubfTKq7?=
 =?us-ascii?Q?QdEdSm04/bbFS3l+ByHqW9ZJ0RRjHgIixePGvxLkp6223+JH2zkJeSqzcjkN?=
 =?us-ascii?Q?YukyLX2z8NEpgbyxvnF94JE3a00916pOjju4K32ULfe+l0hL4BZm+sxxe98O?=
 =?us-ascii?Q?Q/M2oJk/8wn3fXW9YoiQp1Ub9ykQ0kZnypg47tVWs/NH+plD/9NarMVwen+2?=
 =?us-ascii?Q?o64jtyjFuZSXYQcfbXeiXc5j+wWgTo/s7c8yqCsJe4ZECS1vbkp+sK/cCLmD?=
 =?us-ascii?Q?sfWYZWmAZlqk2pMMqkSoVWvVUq0IwmL+KmclPxSqlj/ZFhlBXabVLIjmIZ3O?=
 =?us-ascii?Q?5J4hWUaqWOQuyDEph58UyB0PkiXZWu0ougUycpXM1QybYvGAHi01qxdF9rms?=
 =?us-ascii?Q?4M4KJW//OdXEb0f85KRkKWpbMGx9gaHPffW1QD0/Q78rpV/39zcAbw7Jz6Mz?=
 =?us-ascii?Q?Zn7/HNlX78FsEHzYcrNdYk0AkNfuZam2V+j+3s1dZd/By7sQctHGfZxrLIfx?=
 =?us-ascii?Q?+kpL8Q+MQu3ZXAZAv7Ka5AdRUN7iXC7RM2MtXB8W7MpGvd53GAmlzhz3R5nx?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84b531a-5dba-402c-6cf7-08ddc5152c94
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:34:49.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 126xCqbl5XsUWcbfbcJz4ukNnl/+k4Q6roxDA1g0IWRosbjmKaMLhxWQL62zG75rOcZBzstUlMonQFk7xs8BjE+jqbAQDF34SdotKLP+yO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7561
X-Proofpoint-ORIG-GUID: AS-zwUM4Z67lQSjSbZWHchBO8GzTxf1a
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=6878c3bc cx=c_pps
 a=muCzuJRA6IS5PBT2mfi56Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8
 a=20KFwNOVAAAA:8 a=z2BOVTbumQ4ULxXF9BsA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: AS-zwUM4Z67lQSjSbZWHchBO8GzTxf1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX0geCs3CLbTNu
 chvmnzta4nBUDqrQl4BD8Z0JIUDszofj4QJ1qn7bff2+nOpLsMtm06O3sLiM5viJhNqFY4jEwoC
 RWN0DR3csXhizrmbL483AEiM0NBtzK1/NQuSY0QZUgNTy6RIxRpYvwuZrGs6693FtNbR6x8VGkI
 b+GZP8oJyMml/lj9KPOhit192QjqflEcFP4/zm4KJsbGdUXCD5shHGgVJd5D8XcF2CPFdgFF1PS
 ZLUuyWcOvtLBhnHiHOo95UVbBUS8FZcOEr7v6cyDf62VIh3rnQq9LeRBn8O9ZwtKK2e4g6Xy5bk
 JVV2XA+rWfnG4ODFcMrKHA07lLPbFYijkIQg6vk8bELUgF8h+0E/Eh1BaKrM6r8Yp/TDR6adDC+
 XFvoJq86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220523

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52616:
A flaw was found in the Avahi-daemon, where it initializes DNS transaction IDs
randomly only once at startup, incrementing them sequentially after that. This
predictable behavior facilitates DNS spoofing attacks, allowing attackers to
guess transaction IDs.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52616]
[https://github.com/avahi/avahi/security/advisories/GHSA-r9j3-vjjh-p8vm]

Upstream patches:
[https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

(cherry pick from commit: 28de3f131b17dc4165df927060ee51f0de3ada90)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 220160a7e1..734a73541f 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
new file mode 100644
index 0000000000..a156f98728
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
@@ -0,0 +1,104 @@
+From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Mon, 11 Nov 2024 00:56:09 +0100
+Subject: [PATCH] Properly randomize query id of DNS packets
+
+CVE: CVE-2024-52616
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
+ configure.ac           |  3 ++-
+ 2 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 971f5e714..00a15056e 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -40,6 +40,13 @@
+ #include "addr-util.h"
+ #include "rr-util.h"
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++#ifndef HAVE_GETRANDOM
++#  define getrandom(d, len, flags) (-1)
++#endif
++
+ #define CACHE_ENTRIES_MAX 500
+ 
+ typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
+@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
+     int fd_ipv4, fd_ipv6;
+     AvahiWatch *watch_ipv4, *watch_ipv6;
+ 
+-    uint16_t next_id;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e, void *userdata) {
+     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
+ }
+ 
++static uint16_t get_random_uint16(void) {
++    uint16_t next_id;
++
++    if (getrandom(&next_id, sizeof(next_id), 0) == -1)
++        next_id = (uint16_t) rand();
++    return next_id;
++}
++
++static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
++    uint16_t next_id;
++
++    next_id = get_random_uint16();
++    while (find_lookup(e, next_id)) {
++        /* This ID is already used, get new. */
++        next_id = get_random_uint16();
++    }
++    return next_id;
++}
++
++
+ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     AvahiWideAreaLookupEngine *e,
+     AvahiKey *key,
+@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     /* If more than 65K wide area quries are issued simultaneously,
+      * this will break. This should be limited by some higher level */
+ 
+-    for (;; e->next_id++)
+-        if (!find_lookup(e, e->next_id))
+-            break; /* This ID is not yet used. */
+-
+-    l->id = e->next_id++;
++    l->id = avahi_wide_area_next_id(e);
+ 
+     /* We keep the packet around in case we need to repeat our query */
+     l->packet = avahi_dns_packet_new(0);
+@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+-    e->next_id = (uint16_t) rand();
+ 
+     /* Initialize cache */
+     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
+diff --git a/configure.ac b/configure.ac
+index a3211b80e..31bce3d76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
+ # whether libc's malloc does too. (Same for realloc.)
+ #AC_FUNC_MALLOC
+ #AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname])
++AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom])
++AC_CHECK_HEADERS([sys/random.h])
+ 
+ AC_FUNC_CHOWN
+ AC_FUNC_STAT
+
-- 
2.50.0


