Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135F7F513F7
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 05:03:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63029.1772773411455671611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 21:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o6EgZT9H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7525c7b9e6=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6260jURf2739469
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 21:03:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yq7Z2+DscJEpgodZimur
	omuT7522Z0SaOtAY48VElts=; b=o6EgZT9HcMFP+rNAD+vulQS4pPjLzN9LTmbU
	EByZilMpPScAbb2xifVjYRCVb8P//XfwvQ96FKPEMOvNZAxXcVlZg6THY4DPuzfo
	5l8pBpk4Z51BVoC8fk9P2KQzNsZkzXJi63RIM02KciFYJPtQVsikvRZ38A+xpwQe
	S6NqajXf6ZXEZgZYget5IdJ9pWEv2owZ6XdExnhHxba/mxItqiNPmyhv7wYQpoa5
	zIb3keLTNhwHogMMlq1EKdL9RMjjiZ+pMJVJnlB2CCxwgHKI2X5DeWUcd2V16Oem
	OCsSXCzO/exHRikpdeFmdTjYLx+mavV2v/lXfQ0iVvPYyMjxYA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh475j5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 21:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea8ilpRLBJicPJSWLc/yJAMNFRiakYQ7wA8KeezpEZ97Sjb01PUMsoYslrZLUZYHdjXLzFrJduOH51lhN/jtsI/tCicB1pW7rojBCS1iL+BkuXp9EyhG499lJWREibPw4xejY2SkTmzdA7AAReNvr+iKLY2MtUEF1wJ02yKWk7GUcCFDRRAKKG58vih02MybOueaRDtHduvz5Oi65BNskRq/VzqM770gqO4JYbwsied8iONsojySaw3D8rbDsnnme3iLey4MLHXMUWmm5X/Vqp7Ga2p/mAHwWFxfIeg/Z0da3dNPUe5SIyVyewNbCHMUIeOzKNDHrz4ZgU+eh2JM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq7Z2+DscJEpgodZimuromuT7522Z0SaOtAY48VElts=;
 b=knswXjx5f89tPpCvvl+T4LtvhQ7hZdJRSR9KZRfbS+TzywKUBcN67PVoJSi0vSGV09ebVpL/joshmuzXZ+mJUDDB42emZwJlTabk/MtY/kWKaffEA4UX9orJEuEsLHvUdFzzph1Jq03+pDc2c0FyDkIg6iAHusokqiSG7zLTtj/mbccSnmopiFORYCObOTAvIx1CfO9Aohwz0LREUaD80BBduTJI8r4t+4c5HKQFbuOQhusi1LpeQLHSTycEvcXeEflIBAgTJ90AwK5GRLVavNON3rdt18aqhEjQRBNP6tFKMk1XgczSeLAAUfySi2ls/rZ+hrdpuFbPpt1v1poyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 05:03:26 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 05:03:25 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] texinfo: upgrade texinfo 7.2 -> 7.3
Date: Fri,  6 Mar 2026 13:03:13 +0800
Message-ID: <20260306050313.485228-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: ea009e47-bcc3-43c9-d47f-08de7b3db2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	RLT/p+XVN7gbtGgy4+2sSHWTIa52QTbDA1pwYEM/usjRIFu6003IyzKCjdan5GM4hoTnRbIyvXfoi1n1CtgwA40aY3FknNjlc9mMIm2IhC4XbFPIkvOdFP9DCIEka1nsXusUqkrIPiVllTpSmFTMaXXT/HjU9T/iByJLQ0MPr9+AwgQq/TLSBsQHx3mFjFJSWrEY5V4wXU2hieU4XPvVi+hiqOuDPdqYbzxmkkta0wUKwbdasRuL1jJzW8G5pSSTnBorVR1YBM/3CHP6Izs18swCc6ia2Gh4iWVboJNS0XoNjL8ADEkmBDyAZ6iEtn1aqaQXKmwiDrAOaZQ98nd9wCi1YASVsVyOXJuz8F+cz9HnJ0tSLbEksCuK6UrvFQmtM5576MA5lWPU8oatHnn0oZkfu6IPdqK3B5sxqAj89rzD7S8dh9pnrrW1jM3deYT3O/Ij8LvTeQGWF+k2lp6EDtOrrYCqcF9pHBoeEGXSvWX7W9iMCY9Q0Awm50nIckj6IkUTiNi2JPSc0NeuhemGfHg2noXgeKbg6hRYKIzyda04mta9Udl8JJfPxdd+dWmyP/+3aZ7vPnHkzpvcxy3jEPB3MkdL0MdVq/wzaIZGDgZP6SFe3s2Wvrmea8NYXtSCgJ10XTXqdjRIZvHqlRZiHESI1Ts3J4Hzbe0CKhdRO8wsgj2iRWvHVS/P87XuzKwh10dY00VTFVDuRyIcwe1TIglnLDwki1vsU+QsMU8qksk0dXoIJNDIj0BzrBklq2l2yvgnjf0MnljGyeKGEO1VBqm/aLYkjIpnG0GXM2ol/gQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jM8eFBejiwyrSTvx7WSK5rztXW1JL0dZkUCVevztx1iunr8EGCAgeslQNr38?=
 =?us-ascii?Q?IiFxpX1nYfYIF5gPPu61CJttZQw9xmMbg9qJJ2RrlJPQzIVGxxBqsY611+g1?=
 =?us-ascii?Q?gNaHs6pGfnF1BmTbGQIz0xxf1hstI2hQaHxd/sxKYhom0bElhhe9QMhHp6lq?=
 =?us-ascii?Q?fegrPqIOy5iauHFH3SWgXJBTlV2LXjaf7zxvz09PJceD0WFJmzfnhMKSttXx?=
 =?us-ascii?Q?AJw7wejsCqAxbfRUGZVjwwnddq80vwbY+T17nb7M63NVQVJMe/RMA8TfOmmC?=
 =?us-ascii?Q?EMFNeQvXrCEBEL9J31FtM9xFje5IKxUgSv7LEqxGwO1RhyFSi+CuPUQD5wfP?=
 =?us-ascii?Q?VpuQ+E/n6ZTJ936h3jcDhZMtZSTupbO0/xLT4s8BpUgw90FS8ihnRK6CberI?=
 =?us-ascii?Q?xthgCWZl37LnkOUCR3emwX4iJJfFL/uOHDeDSdG/ycWj+vJGKMB5MomOueoM?=
 =?us-ascii?Q?N/Ad8yCgpVf+L+T5U9wHiPfOSphViJbWMiHvrK+PkomJ6dN1/C0Yy+xLctlL?=
 =?us-ascii?Q?OyDjYMA/PxORoTAvV1K7qBi+Pb90XXUwErwxEmCVE9pV7QCrPLO1ySyET7Ba?=
 =?us-ascii?Q?ax0lJeY4GHTPSf3JjFsHrtLT1Zm6NqHRSucNfpNuBbcxTOKnwbwVa0MSVkc9?=
 =?us-ascii?Q?nkWU2/xHUyBi28SwIs28zoT4atCa5ZgESKwt7A2ZpvHMRT+0x0PcPB10G8N8?=
 =?us-ascii?Q?x0CAiylGFJrvnB1yetlM6e0nSjUxt+mWzmE9cGw0fto5nBCHzxldGPThdEd4?=
 =?us-ascii?Q?Jf5Wt1WuD9UE98EK2wvFVPMzl9mXGnB2m2c2d/32ZBypgAYso3ppxN/A5tYr?=
 =?us-ascii?Q?5TZ3zxo/0ovgIpZy5Mztn0Jd0n00Q2u43ZoQn3q0X8yfqlxNiVY1w82j57+s?=
 =?us-ascii?Q?5oQG718klnSYS26Pw/CsjW8uu7zupJQmITf6jrZoHp8zZzzDpfL6lqSh05iV?=
 =?us-ascii?Q?niLUThHjaki7cfp9CHdfClnxgspLfj5iwQNnyXNGomasdrlaLcU65GbPU03/?=
 =?us-ascii?Q?i79bLysbILW265vhiYq5WdxDBl3tqKKw1iZAbK8r9j+uHvYYiDThgHaJ8mAR?=
 =?us-ascii?Q?AWou6qQc9d4PncyruQVMK2RsMirVIWx3Itw5yHUbQdTkENdHQNICnO6xgVax?=
 =?us-ascii?Q?LTazIctqRkNZ5wgvv4yJf5pnWsrd+0kJegXiHj5Et5s7wawmrSpEOxFNmvTn?=
 =?us-ascii?Q?CEMTJFyzUwyW57oHYnLvQGofmwljlXe6nDs/5HlO270TQt6pGHZg5rSYEeCZ?=
 =?us-ascii?Q?2VNB7fX0Q5H89DQgyvlruNAGdcP89NH+57pNqqkmNtk9nVGyd3vrDxVVCFVr?=
 =?us-ascii?Q?mJWjJ1hF7KVjI4PqpMJeEpmkO96/SUneYLCPrYGRo50cwOWG4lX+hcrH+vX1?=
 =?us-ascii?Q?t+4YcQI1CZYQHp9cB+cPL3LQnD2yTvTBF/ZweiGUa1LzDbCLaHzlVf8k9/PK?=
 =?us-ascii?Q?QU5ms8vXdwpvAj0kEtLFcMg3zEumAhBzR2HKmx+mlHD4DGhS9ktkDXgVBpzy?=
 =?us-ascii?Q?vP1kg2tq12ztHhxBAA8PbZPmc6BlsMUPHXwh+YqrqknVFzYRgnWCXP08ZcRt?=
 =?us-ascii?Q?X1MftzI8vRN+L9GAHJVmDOeDFmuiAmaq/Eg9z+lXuUISVjrYoT99PNjbTLBR?=
 =?us-ascii?Q?mzIow5qexueizLlamiiaCLGBwd7BZfZx9S025hOr2SMauusKDsEiaaOHaIBA?=
 =?us-ascii?Q?y8i9phyVFezh6YvOFaGvNJAVcWJviiC8QvKK8cYukJR9erzM7HlDAe9SVW1x?=
 =?us-ascii?Q?93EdgQOIVhLMXPkYvqOWNs8Lob+4jcU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea009e47-bcc3-43c9-d47f-08de7b3db2bd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:03:25.7777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/eSMhvuW/auzIjDgmmQVf+LvdzF8CJEd0wUI63ov6QpDRlem4h6HE0T8+DEfdVorGsK8A6xTP9SVB7cqDQpTyM6kM5wEwPeGWR92XSxwgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-ORIG-GUID: QGGMQ8FEoZwc2XIqDxKmz6PDr-9hJ-1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA0NSBTYWx0ZWRfXx1wvtfZf6Ywa
 RS0fKjZfMQgfzU9B3TWvSUFjc67y2/SmCEfH7yhXrc4pPfUw+tFUXh1Hi6iuHh1phbLSE3tRw1g
 4gNiP9mrY5i6FULgEZctQagL2/ithmjJEu7G7Ani/APwGQzbUgau3gmbZ2X0MKzltIM/f39vH50
 12oUXbyHLR36j3UHmndSZ7GxKDTdSIrGZLmQO9VjtmA5oJbNmbAAyS/p1CJDLfjZR/fJpz3AHTU
 24huuJYhPrZEnLn2UIk/0RBdP/DuOzyGLYXvPL6iBbf5NRDZIRnH4vRaOukl07HVETbiB1TLhFa
 AcZO9RJ9cRDoX3gvRwnCEZ1r8ybL6rCmsuXhzfHPtTNGR1iutIcqlC6tLEliUmaGHwKEPtEAFPM
 eFlo3nlSrMQFMwrOVxemtxrdCYyiIO+hEdZFSXDQKADTHRK8l0VTSkRCC+dETLHX549/UpluN9C
 TQHNQQelHgTFM1KgyPA==
X-Proofpoint-GUID: QGGMQ8FEoZwc2XIqDxKmz6PDr-9hJ-1Q
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69aa6022 cx=c_pps
 a=X74xAhwpQ9G8Yf2i8TuT2g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pKoQ9qJNzgNunJ7ozaIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 05:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232531

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Upgrade to latest revision of 7.3
- Refresh patch 0001-Makefile.am-do-not-build-manpages.patch
- Remove -I ${S}/gnulib/m4 from EXTRA_AUTORECONF since configure.ac
  already defines AC_CONFIG_MACRO_DIRS
- Fix QA issue for load_txi_modules (new file in 7.3)

Release Note:[https://lists.gnu.org/archive/html/bug-texinfo/2026-03/msg00007.html]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../texinfo/0001-Makefile.am-do-not-build-manpages.patch      | 2 +-
 .../texinfo/{texinfo_7.2.bb => texinfo_7.3.bb}                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.2.bb => texinfo_7.3.bb} (94%)

diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
index cf0529db98..03b635d95d 100644
--- a/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0001-Makefile.am-do-not-build-manpages.patch
@@ -18,7 +18,7 @@ index f733797..1013fcf 100644
 @@ -76,7 +76,7 @@
  endif
  endif
-   SUBDIRS += install-info po po_document tp Pod-Simple-Texinfo \
+   SUBDIRS += install-info po po_document tta Pod-Simple-Texinfo \
 -             texindex util doc man
 +             texindex util doc
    SUBDIRS += js
diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-extended/texinfo/texinfo_7.3.bb
similarity index 94%
rename from meta/recipes-extended/texinfo/texinfo_7.2.bb
rename to meta/recipes-extended/texinfo/texinfo_7.3.bb
index 784f67f65b..dbf47a79ca 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.3.bb
@@ -34,7 +34,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "e86de7dfef6b352aa1bf647de3a6213d1567c70129eccbf8977706d9c91919c8"
+SRC_URI[sha256sum] = "4fc30d71e00416f0b4884994f1db9db2901f03603f8e69d92dd46fa018d998d7"
 
 tex_texinfo = "texmf/tex/texinfo"
 
@@ -42,7 +42,6 @@ inherit gettext autotools multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/texi2any"
 
-EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
 CACHED_CONFIGUREVARS += "texinfo_cv_sys_iconv_converts_euc_cn=yes"
 
 do_configure:prepend () {
@@ -61,6 +60,7 @@ do_install:append() {
 	mkdir -p ${D}${datadir}/${tex_texinfo}
 	install -p -m644 ${S}/doc/texinfo.tex ${S}/doc/txi-??.tex ${D}${datadir}/${tex_texinfo}
 	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/texi2any ${D}${bindir}/pod2texi
+	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${datadir}/texi2any/load_txi_modules
 	sed -i -e 's,${HOSTTOOLS_DIR},,' ${D}${bindir}/texindex
 }
 
-- 
2.50.0


