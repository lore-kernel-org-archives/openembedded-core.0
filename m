Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCB4C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 07:11:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54128.1751872266407819047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 00:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928339c54a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675n0xL003992
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 00:11:06 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5h8fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 00:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQO6ekbOSgec7d7IR/iY6WFDpGezq8m9vzpyxJHxdRS3i3be1mk0u46FegE3hSe/7hX+k3nzD6W4y1K1F4k9p3qCy3q+id2wMvdsTe0CdIURtp7TXk3TO0YVt6qiAy9jIuLkegPcpoM0ZY2RiwwZmxAzrJpUgvEk4IWbCKtasUVB6gbZRNQpwxVi5ktdMMotNE0U6rop3bobOduDFhJMZLmLyo6USE6BV4BbQQArCKLCfUlNYr98o2jR/U7dh3+JOQW7nEcuxtFxQ1RFbEccoBWFtjmWOzhAnYv+P55I0ZUzxYdsEjkOLLREhnPLKlrOPkLZOuttaTtUB/irSuBz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80qpEq4SboKlwW+3qTr4RZKzSSu6BIxy95LVgAU7uHg=;
 b=Q1i2hVgb+N2UzoPcYfgcDk+qHOuZx6ul+w+DCD5GO3HC7zhr1BkKSIG1uy7FwAboBIAWMdHJF3xHfRLamS1Y7Ds6hjFKSEJAVcjHsLCNyGTC9hN9WIDGHhMVB8FypvYep8QhX/8ccgRlzKsHe3XZEhET0NjKz+Ke0iYJlAnxLeEtRN8yEccWMRgyVH+Ap/mV6gxtoHYXlMFMmMoQ+yLC6GvKT1gNfCTxA6dJBbIOHmb41za1lZ+nMCiBS2Izy08xTTTjY+8Qtg8GGlqAxTybyAsMhKxePFvun+JicW7UjKole8tnQUQFGOOvQFy+Ly0ogPMU4WuuBm+OFO6xr1b6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 07:11:03 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 07:11:02 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][master][PATCH V2] wayland: correct the SRC_URIs
Date: Mon,  7 Jul 2025 15:10:49 +0800
Message-Id: <20250707071049.3286224-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0175.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::16) To PH0PR11MB5593.namprd11.prod.outlook.com
 (2603:10b6:510:e0::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d83636-5cba-4c01-0249-08ddbd256e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X5A/gpBwcUALA6XK+B1xEw4R88/ZBUuop2r/IqjnSfKyEL9w2celfoGS5kjI?=
 =?us-ascii?Q?vOtEAwxt2ihP2Y3O6L86OwHbyvOprSHK2o5aVqrEEjn4pfXUqonJAMwxO88n?=
 =?us-ascii?Q?ZmNJo4ktba6AfnZ6f6htQtqBjGL6BjGdq35md2Z8/kiML7eNfc0IH41bwC/r?=
 =?us-ascii?Q?hxJCbZA78FVdGACuRIlKGHPB8moqpoCzPFa2z9CfW4pDuXV9rE0r2sbuOTPK?=
 =?us-ascii?Q?zmgf/++1hNrnXzv1Vsgrlf3u8XpdObjHQcJD3pU9H//GZ5noHi0yfhPtsbAr?=
 =?us-ascii?Q?5CvbBDyIWOowZirHKl6Q7B0e7wweRm13/BJ0g57z1S4nPP+Hp5RtgiGtNezZ?=
 =?us-ascii?Q?D+m4PK2Bd9i+VwXy/PGoRol8i6RpuFhOJdYr2WkClGoUjhPoXohmcq2xs0GL?=
 =?us-ascii?Q?RhQvs3cMODBpYEZI02mLnqUKw43RMvXkiMkXDBovjKOfo9yMDvf7BBrc+Ozb?=
 =?us-ascii?Q?uchmh1mzpNsVJaA0irzE9Fwr6BQkA9uSa1TnNfcFks0dU4zXS9ohcqPv536F?=
 =?us-ascii?Q?O2zQMVbkLnODossNBLl5Gkr58+gUjm2OcMeOwvNnd9llgPF7Ct6rDblpxA8O?=
 =?us-ascii?Q?F4X3jdwvwmPZW6bcMq2UukwuLfgH2Ak2C+zyGUMiVqbTeeBDnkoblYczVu04?=
 =?us-ascii?Q?+VgRNzxPRkOpXMHcDVgr9rOGpWAEEr2HZZRfzuW25AZjVk1rzGR8WyA8v5Wj?=
 =?us-ascii?Q?W7KKY5WuGtzbRHUXtJbB1LxeUbXXJh78gMCieRyEBgHwUlb828cCoElcKROk?=
 =?us-ascii?Q?U2mAJjUBTQ5I7Zw73vu7cAC+ga+K4tNE8f0Xo5bRzfpFfIyZh7p2R7kLfOzu?=
 =?us-ascii?Q?plIsTy8GgVEzK9sCp8Da//kjNFqDHwvSB66wnfbxAEJuZGgNNoEp2CcSGnsS?=
 =?us-ascii?Q?X97tYllqPYlPTNcWOqeI/rR3Bwyg8ldNdOrCzdA5siJNGQ9q7ev8twMab7Ee?=
 =?us-ascii?Q?YrEpZ12EMhd2OqQVuYT0pbQPQzcZ00A/qsLlXxbk8SDmbTgdTSKWNX4OWwqt?=
 =?us-ascii?Q?EStt2rGlYoD5vzJkn9GwOg0RZq/hYkbMIfKD7TnmdmfAwSS/0tMEmgFQ9JM+?=
 =?us-ascii?Q?MfHbqo3ZrR5hyHCkc2MYaZFRyna3vnTvx5QdqoRe1Z9kEmgLFF8BvkAZNoZY?=
 =?us-ascii?Q?NNtJ/RlNCodaHvNcuAuFcFHnASSlXGICkMXuYocV9zmPYIGJl1NC6zP19+0F?=
 =?us-ascii?Q?IkGcD0yIbOFuQqrATt2RZus01/Bz8vXP6K4GR5ooel/F6Zie5U/0jOWCg7Ds?=
 =?us-ascii?Q?gRnVGmrRyIbaiaeutG6AoiUyNa8gxQKRbaOzFuiEQg1PBKbmJqC3ltafOAQU?=
 =?us-ascii?Q?jSJMeQoUlHhJspAUN+y49c+qyuyomDz7nazksf1FrbYMPRcnjIcuF6C+IntK?=
 =?us-ascii?Q?YVnR/SeBaLbpzTWaCCVAv1I3aMlFvoDOLrrVCkACOOD2dD/vsWLv9FJTZy+V?=
 =?us-ascii?Q?V3V/DcB78+Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OgOHYX6njjcRcws9uZMBLcUHT3kTcKSyyuoJo0iQ7TxvsRFpNgm03hNslkq+?=
 =?us-ascii?Q?ECD/IDzDMFZbk2QTs/QCQlv+AKCGQO0jDtCv6TsVSdGiiadq528JCV9XMgWT?=
 =?us-ascii?Q?oK7WpCdMO4oUj++6IGOitz/Oaqcuwe32hbSAFIhYxEor/A+HzJx8m8XYfrji?=
 =?us-ascii?Q?hsdWRdB6KZdwo7YPgByqJV9KK0w4ERmDfQBxEXBZnD63FV8Al1L0fb/II+41?=
 =?us-ascii?Q?0dpQ26u/5i/l3WnT5tdUFRtQB849DcSI9a2IrH94Q65clGCnA2KciT/BtYqu?=
 =?us-ascii?Q?L70O9+DeyzNKEWy2i2aT0ah2ELftx6rRgPW2BtboAvs0ysPSrTyeJo7hteRy?=
 =?us-ascii?Q?2ibuQVKHyeMP/+zq/iFSW9OuH89ESLEUSutfIJs/KU+g3yi+ASe70Y7ElG/n?=
 =?us-ascii?Q?3czI8MxgIAYYNC1IihcpWW3qRoORcQOo1qqDpKEY1AoyZiiVCxc+sRBjLN/T?=
 =?us-ascii?Q?W3d3IK+l8djiiWgGogDHW/StKZqsEc2H7vs/GXWlPr+RjD0FUN+Zld9PC9q1?=
 =?us-ascii?Q?oaxPB/mo2O2Gw+/BexT5sdXUDM+nz5A0ph1tYIwW1u+b/W75l4Nr23G+uj4G?=
 =?us-ascii?Q?kXsb531x4RiWeNoTnvpqlTuvyq+58QHLSdz9P8wjKkjgj7VwHHY3Dz+KWk0Y?=
 =?us-ascii?Q?OL9nvIRi5spTkB3qI/FSz/blFFJxjfdse5B9d0Tjdgpat3juWUGDTWA49HfB?=
 =?us-ascii?Q?oZaY/kcshP46SodJByY2bqV6LDgpdDEP1aucn7I0r4RgIDondtCO2El/eevP?=
 =?us-ascii?Q?7jW28AQcq1n2YebjcXa8v69GvRhp1V9H9C0x4kxOZkDBjU+B6D1XMvXKlg0Y?=
 =?us-ascii?Q?AEwkBNx0jfDWHuGHtMyuhtJi+A53XJ/TLI2bfJhPpq1ayz+w58UlH6KtS7IK?=
 =?us-ascii?Q?s4Tvgr6eBHGay8yTQH5JUozSlKVgOvOsM2P2NV9O5OEDmzmUcYH1JHBhV+Eg?=
 =?us-ascii?Q?oxid1OtqFmYWTXT8IdSjVrXn4zFVHxFRVmHZItKLf7GkvFhCGCMQUz9JowTI?=
 =?us-ascii?Q?SwdU2qcLI+mfKIsCjqvRvaOJmnha018Wn93C3zUEWQm4+fE5yrh6epbtRozJ?=
 =?us-ascii?Q?MAGYRLetKzg59RbF4pdJ9fepba7zuc5mz0rIETNzWjyNh6VCNrk1aN+OslFR?=
 =?us-ascii?Q?puo6sj/n6PIsraVNidhZ+XqEdZgGQtvFoTHA1nPrJqcp6xfAqluQs75JrR1d?=
 =?us-ascii?Q?U7++HPYCSCJSeu4z9P0QRN739Q/q1qC8wywFzAvYiUuY+v8LfXFHmuz/UpMF?=
 =?us-ascii?Q?Yt1mnIvWm+o9QTW6pEIzc8qYCgN3D2L9p1gGRkd3dFaU3t0qLBstVbeQ65qd?=
 =?us-ascii?Q?/LsuYl5kqLZf2Jnmhnfozv4f1+3780YOvpcotzG7yQldWRAU6//c2PAaDRMD?=
 =?us-ascii?Q?NwB+FpVtAwCi+rjkDjibXl5QVmmMTL9QCvHJe9SdxpUJoC1USQDQUkAcWTeP?=
 =?us-ascii?Q?bOyWJRCixBnLC9Q3yKna/BFhvDcLG4FC8EpzCc78eqHG/AodnOFP9ABGrNAN?=
 =?us-ascii?Q?x6JOdEFmqiI7EOCEY2VhU1G6csbjhl9Ew4hPbcayyc4fKZ6qgA1D51CyB7iA?=
 =?us-ascii?Q?8AvBeWNuBdOKNKSRVzzzxDNnxNvTd1heI7jJEOj0dj0d/VeatFy66ZaIMpIY?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d83636-5cba-4c01-0249-08ddbd256e4d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 07:11:02.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaYw3crGcBpfmaRIOKRuctgh4ynGsXfhNFALybUXA9zV7ZvQgh2f+9g6xLe4PK+fagz2ZmyTG7Tn/WSVllQN62aauWumGHqM74/MEL0lv9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0MCBTYWx0ZWRfX8691tcVUjMTp CW+WY3WNy+pCQXP/fBAFXBaIE3QBKVQZC0gXoCY2V+AYjuBMdepNm36Jadz9egvAwWnqZM/FykY HgCicyJCMCBailVm5dNjS7iMv6LOf0q4jYO7FS77O84UdW5JDFeCannARG9HqdsaHyYdyucc/RC
 E5JQIp9jR+jr+5/ndg1z6U8pKEqFSeLoQ+ZZ6rwkU3w8zWT+nga5HVmxL4pEo2e7+b9AU3hC+Ky eDq8adgyJ7UERarLXl6ChfYOK3RKIj9HO8RWxM3uqs+Uw2CMVHF34FIOil/+EBRCNanPdbQsCQw FHZpPJ4+FR/1Rd09YVQ6R96vaCOPaY1rS4dvxbPQfj4RvPq2A9qxyQMjwxMQh6tv4fDoSF1ENIJ
 UuL5ILB20BzWYe1neG/WENKnZ0LUMpMgtP7NjYpuI6hrznpoywSKAnJ3j9kNviLcoOQtH9BQ
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686b7309 cx=c_pps a=B4n8PtiPn7HqGdmrwtQEyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=EKA4iIvevUf9UMjeEasA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _JekRZ1XQECwNcH_vAOlyqTQmWi4gIkr
X-Proofpoint-GUID: _JekRZ1XQECwNcH_vAOlyqTQmWi4gIkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 07:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219978

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
V2:
Add the info of Signed-off-by
---
 meta/recipes-graphics/wayland/wayland-protocols_1.45.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
index d98ccf964f..31b7de3a1f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "b73315c26d6c3374c19c2dff7e491f019d8597dc4dcd4473d9181f676f15f48f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 59d414a0a6..8e4b92969c 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
index 3a5d91be04..1b29f7762e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
+SRC_URI[sha256sum] = "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49aa68a702ebf698f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


