Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BB9C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:05:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2979.1745121950242878618
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45cBb012818
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rqsk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYP0WzhuDr4UWOMKf07ZlGPqyDa4pFjEple9IMPZfcPL6nhUOyUhsbqS9eW0/rmuP4TqZA5Tln3PGL/24LGns72b4gO+lrJ+c9UEl6IJEMkuPzbYskBsPlRqE67gk60Ej0+Bo1C1ZxhEA4oYfYRqhmm7YsfBgwwnlRkAJycZtAMcaq2WpUvz7BJtIxvR9mo/0I7X77RgfA8yWICMk+QECvxM3war6Iwv9BsjJfyBoJhAF7dAxzZOyItI/ovmNJzZwppVu/po4Hrxk4Wb1mfIEnK+w1TKnUfTlBs0tQm31eChR9SwdWK++Fej8thtsYbvIz/CC+1ePKbeyjk4pff9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oITGZO9cScOnEbi4kTPvfVQGQ0fOVmlXHdEeqbQ0CdI=;
 b=Se/8ZAepIXnZYmCohmcwYM6y6IlE4BC4yhAUooy+cYr1uQqIgXAt7y6hz5AH3BLoZZcn4UhJ5utM25N2Nx4le5QlVTd0JaSPsQt9ytJKfKSx+eAvLLbGKbsRpA59GIn9o5WupOlRJU4OV3h6qXdNbAIrg+YhGUzeutIMVZMKxzxCzQwMYp6DiLsXtkXrn+MpX6gE7JQDY3Ja+22dGIEnlQ86A/BNmny1LkPIqnuoYG82P/MjbbyuVz8CIlVQLUHQrwx5qGO1sR8H8WE39OGO5pEjkxJK7Nto704p89CB0Aw84nBFUjbyORTbChyVU963iQvHH1xZvzPTUG4mjrwChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:05:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:05:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 2/5] cpio: fix ptest-runner dependency
Date: Sun, 20 Apr 2025 12:05:25 +0800
Message-Id: <20250420040528.4012613-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250420040528.4012613-1-Qi.Chen@windriver.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 184935be-2d9d-4e7b-8deb-08dd7fc0a007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NkCo+Bbk8tjVDspXDl5o/B7cvjVLMToXpRiSc8OrpR29MdesmFS+LiPJU978?=
 =?us-ascii?Q?nG78lhRqj3ezkFr3ORskN6rXrPrl0UhchDhKEnpCz9F2HogUgwnEQzwR/Qp4?=
 =?us-ascii?Q?z0+SiggDwB+72HhPB9HIIq9dxfH1fuSAdLFrN+3He/IWv+w7aFmyxwirB+YC?=
 =?us-ascii?Q?6XlgFx/HWMCd4wSRExpIGY8upQ+YzB3gsdsjQdJjO0F2wEW4j04pubq+f2Jn?=
 =?us-ascii?Q?a6MSLhgerHa6evuSanwwNNCk1lJyqFR7Loj6oLoN2QeOESTgIwcRwUQHC819?=
 =?us-ascii?Q?2T74Ksu1/yqdmkf1QO2ylMgFYB3jrUWnjxH4VPkgxwIqQeIHOcuX5cqIHYKa?=
 =?us-ascii?Q?r4cLvCWcKkIkfjMzuy+umNbGamZIfo6e36YG01P7D5U9855zGaVGYC05irT+?=
 =?us-ascii?Q?+m9JXkBTu+MtGspYyrfZo0M8OH9SlnmcnpfOt2C/EQ0lq/8zk6AwOoHS6EVD?=
 =?us-ascii?Q?KL1hsSVCohxoy8sEvjOW6js42zuDiN6H3I5acx2s5RF54iiKT/uaU7I2QiLt?=
 =?us-ascii?Q?MoIPu3IgW9ntroJvUH6UFmfdzkHJXvv0xyDNMOdGeUBzWoLtceSz01WAyYCe?=
 =?us-ascii?Q?jfxRNsKHnJPsmo8Z31laf+WfM0CKkixtloFg636+I6wj4kb8DIudsh/fSfzg?=
 =?us-ascii?Q?iwfwFsyCcALZkXIPBo6XnfTLog5xkVwMLzk8PRF2qC3bV/roqUZAkzl7vDxs?=
 =?us-ascii?Q?kZunIsclIjRpkg6yKTAKhnsHIaIcWlAMjUodYzgQHfTorjXo9dv/Q+4A9gWm?=
 =?us-ascii?Q?vBHLfb5uDF9YJD6RE4lFftLd7+cXVC+Oc7sQbWf7ilJa9j4Al7cgpcEbe7Ft?=
 =?us-ascii?Q?ppkbDnzKLHvgF/WxK2Bd33PQiuo9yf9ok5K52UzL/PcA/upUUZquDWeOFtXk?=
 =?us-ascii?Q?Xw6jcbQLmnHz2nrEDuPfDsmFS1N7ZjlKBQt2KOTvKylAa0WSZ8xBhNgXU0Mb?=
 =?us-ascii?Q?0BX6VofEryjs5qBQXoIfcFu+AHrI2v0BJqfcefcS1t6yIhNCu4SDkP41MGnD?=
 =?us-ascii?Q?N8zRvsDrWsqQ/lmQhcFNXpqxdNroMck0OVHsd2H6mB+T8OP/i7P97a5trrho?=
 =?us-ascii?Q?6AsfYr7nfSh/GnXUxpuoc4X8AbBqBIQR1x8+KybeUUqXAcfKmOdsyuFhMQqN?=
 =?us-ascii?Q?V3JVp+p93PkZssfeWzmvLfPBr8eGTqlIF3HX3Gq6MZDZ8XRfqNWNTYTJ1Ktr?=
 =?us-ascii?Q?juyo4sd/jdG4w/w0Y6NzgsEA3r6JHYItSJGssB/UPmni0DQAZg4h9dW2crX8?=
 =?us-ascii?Q?nfnsu7B4/F0V9OODUwSOohldRGLwPQ7vRM1JDvkg8fzMfrHxLJUk0O3lUdt2?=
 =?us-ascii?Q?DPHhCdAUUmgGAksDi5QZL72aRjprBJ/MCtNPpvYaFGPP38jw3GVS6nIvBrW+?=
 =?us-ascii?Q?HkCAvLKlTpLXNvJ0b4oNpTbwtXLnKDsDI7zrH5d5IUGImQ5Rofm1X7cJSI3S?=
 =?us-ascii?Q?tNqhtFwQO2momTXzDHFJKrf76HObqD944ZvQtskofzpLaAOyB6olpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vXQo59qhucaKzE5WbrYUSdcz1enuzSJdDXA3D/thXrtOS6bOJ0+zTCQ1KEN4?=
 =?us-ascii?Q?1dEPXkdyRbcOoquaal/gGgaUWMnskA6K0KWHbtWlwbSfHfkU5TY/eVpn8BCC?=
 =?us-ascii?Q?Kind9kf4/JmFuteikmJtQ1JNwiq+Vut7YUJamR3xwg4TOt9c4mihviSWhqCk?=
 =?us-ascii?Q?hMh2uF8HxvamCY66vLEV5vIsSC+QGBVg7W+M0yw/y5cxM3xDlsuFG3rE/BQj?=
 =?us-ascii?Q?z5V+EAYVq64fgbnwmhrEcUsf9IvU1Y0qunHePLrWHXeij2vsO/HQEiS41hy4?=
 =?us-ascii?Q?12bCmI+gtY1T/yLR44dWjBrgxjXCOAkq449FhbvoONU7wBwnS+jdbz5T1VRB?=
 =?us-ascii?Q?VEweAXdyMSik8lr492ZvH2qVIvKKbYmupbT6rI+zk5gbjTi/x7VLzqHTSOIx?=
 =?us-ascii?Q?oeqrrEktU9+EDxPP2yMzHzOz+9yVRXoNALg8TozQrKHaw9Tcbcy5kR74bK43?=
 =?us-ascii?Q?GoWwRGoccXG4pzrF6s88HZ5+hIL98c4Uxm0BUPPSlJUM9t3APshZesIxOJba?=
 =?us-ascii?Q?ItiQvKKk4eg7S86RoPMC+nXirdqEFVDEWUx/kYE1rXvppn30maE8cA9pufe8?=
 =?us-ascii?Q?aMGNkJlYKGLR9QJQaQRD3weDz8Lk31XmwCLVyU7j746C3Oc7W3T5+Ku3/Bl+?=
 =?us-ascii?Q?lMDBU84ihemK4t2CikPOMSGNEM2NXgzeeoAml4IkQrEzJrkpxdZGFb2ELjqe?=
 =?us-ascii?Q?4tbIqcNaEt51kpCxDbTAAL2TjutoduE+qHentvsxHEqI9ibQMYN4oixMnreL?=
 =?us-ascii?Q?tH1bDEhlRJfpS9hLE+fUiLXwMaVKQE/h4uiq9WxbmMFP1bq/4KdGTe4RaDnI?=
 =?us-ascii?Q?jNThwq5D7Kkm2oGshNyZeuCo/Js5yi9Qp9a8jUGkgc7eJAwOQsK87m3dU1/c?=
 =?us-ascii?Q?FpHwLYBJhG26PYU5yF8J1hZ6LvO4KhBmKZRTz0LJoNiPAB0sbyFoXl+rkS+5?=
 =?us-ascii?Q?Ea0QuI5+SB9Xa4mHe1xs4VPEY3PZbdVHpaQe/S4D3FmmZGBsQejVyaiFDC4R?=
 =?us-ascii?Q?aXCQPtCmWK8lmP9miwhN3FalyndUXsSS2kN9u+L88nigErfOR0qH8gX6aGtT?=
 =?us-ascii?Q?l5cO8oP6W2231aP713VzXzeHSuFwg83tjUffF0qCpRHWUj8xP1FoyHXh+FX+?=
 =?us-ascii?Q?kgT5uM7JjR1sWjqJjGbs1GKFCNfa7dS8pvMmsUVJZJALZrs6c4T6sJ3WIYwf?=
 =?us-ascii?Q?aPlTEe0ga7j+rx8EIQlrTAkb20KXBaj4s9RckNhkInR4gO+Ja7xX5jANZQdk?=
 =?us-ascii?Q?rlAMIWroXyrGjWFqVL9Pk7T2U7TghBawxTkLWoJzLHfBsTXTPE2xTaTUmomu?=
 =?us-ascii?Q?pkQ0sKzK4wVZG6CB8lXpqrAA68eqTSbc52Ll9aKEvgjjHWZOM8Uuhkwa5yP2?=
 =?us-ascii?Q?zWG4neNInEyBZgM8KMifO6mRBgKQCBiang7HIoT/VeeFWO1nlhVgAyCZWJft?=
 =?us-ascii?Q?xL/MfveSvKBHZHx25ULHLe3WXiTs0BhsrwnymOB7/dhRP1PyvnjAI/mN8jEI?=
 =?us-ascii?Q?Cm/m12Bze3gtwFVPzor6Z60CORjcXMTJLga2sguZssgJjkcMiEFuilUAuKPU?=
 =?us-ascii?Q?Nz7iYAO2hKCgmDzskvWdfx8Br0rIioz5Pq4uaksX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184935be-2d9d-4e7b-8deb-08dd7fc0a007
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 04:05:45.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOUtivjCz6wqPrDYw0xroT8vbSD5yXhM26II1JCAc3+kqkh+PskXsPtRO3AN1Bs3SmI6TF7F5GFzSfGqGA984w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: QKxSXG2KU4CvZauE54I_igxtcdwFU0WL
X-Proofpoint-GUID: QKxSXG2KU4CvZauE54I_igxtcdwFU0WL
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804729d cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=KwLHvCn-_DKJmQUzVCEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=718
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215146

From: Chen Qi <Qi.Chen@windriver.com>

ptest is only meaningful for target. So we need to specify class-target
override to ensure correct dependency.

Also, the above DEPENDS:append:class-targets lacks a leading whitespace,
add it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index b081bd53db..0b13ba103f 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -66,8 +66,8 @@ do_install_ptest_base:append() {
 }
 
 # The tests need to run as a non-root user, so pull in the ptest user
-DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+DEPENDS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
+PACKAGE_WRITE_DEPS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
 
 RDEPENDS:${PN}-ptest += "ptest-runner"
 
-- 
2.34.1


