Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFCEC369D8
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 02:09:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38928.1745806153428615283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 19:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139ee05c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S1QDdF013072
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:09:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf928a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:09:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz7wvtKdkZBby+GvJJ5yOUlFDohINFuJ7sguNfoSfAgIqIVVyHTsRQB8AUj3pEW8HmzzIIaBlg8kOdomFOvGE1xc+eMGq6WoyCv15cRP4mH6SBtQ0WfqQaZFQPMIwyxw+jpPHjpyOGrIN/KZrI25A2EQIyXVZLA4c3pS4MNlp/Zy3/r/i3s2dWRdg6DYzWriIdzFaphQyeRVycgwhwTtWF4733k21xPYlezHngWsNfnHy1QrR/Qks9Ph0c0i6vZzb+ihgqPr3S12HmbTGV1EtUltKfEc0N/j+dxmRHL7Upp2KHFn/Xb6zsC3FLxpmrkRXvJ0BYw5tCQkIqSxwLkFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2bazny2d9OD+keZOqFOHSVsdniYeLRSaGe8+u5qUxA=;
 b=Iodh24eyHZFdI3mWnW/WCMjweBvTr2xc8myg229Y7LQe+aGm/yxRTFmHjM9InvkAvstaaUsDfOUpLynotc4ghRFqEcUtfmpvc25OaWHXBdvNgjamk/EgCXeJAOZQLtSXBqy8b+tUyc6PXF04XRMpPnTo1m6KipcUEzVSDNSCKPyYZjeP2Y/Uy5nWEvrKxJ78H8EDgPO4Poj9UxZPT8+IuijChistngbU29tFn53qELHlxl1AvbWAUd7BpOlUNga0Bs57JtEGmahzCFJwo4L4g7KEwIv1Sxv2Y4QW7A9r8b4n1qWiiF0nkGRRvagZgLX1qnUsZKiluB2D6Eghwzq59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 02:09:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:09:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V5] lib/classes/conf: refactor qemu.bbclass functions into library functions
Date: Mon, 28 Apr 2025 10:08:52 +0800
Message-Id: <20250428020852.3949557-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b751d9-8faf-4e8a-1140-08dd85f9a81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3kVdC5iCdAeWKiGpsUvD4WDL3mTIxJFJ/untdr8PMO+HbsWHRvumHVKdq6CK?=
 =?us-ascii?Q?gu6bpThfrhWHjvSOdE/dATH71WMEVpasKWWAJxIAulH1xe/M7pfBvDsVsgiA?=
 =?us-ascii?Q?s4yD7XLNzgfqHDgwsBXcwW7C0+t/4jCkB6s7Xwh0glf1VJLW78HFircZ6qoq?=
 =?us-ascii?Q?dVCkUCR47UfTZFdM84+Sx4NKhSZmtovQSesZkfAQvvWEnsmaiFkR/WjKmHEg?=
 =?us-ascii?Q?gUkp7W3ilCystO/nJiCxEIJxSel/MkGoCIjkkXE1IO8M/v1i2XM5t3ICIwcm?=
 =?us-ascii?Q?hMcD2R44XmGCiVDC9UH5fbA0aszH9mp/QWSrFKuaMxgDE0EYffjudgsk7UMg?=
 =?us-ascii?Q?s8HDbwB9h3hy2YkavFu2yj06jsLL6XxOlj9r7LVHg6v2GF6Kea9FQBQdJIUs?=
 =?us-ascii?Q?DFh22AyJV0XgcB9yIM6h6RMfW0RRWS3jlj80MqkQRXtv1a0YmsviBe73nC4V?=
 =?us-ascii?Q?2+W5gMm8mm+6DLV5mekDaTbFDVUG7FNuVQioE8BprZWcsECbvzqRiItSZgK4?=
 =?us-ascii?Q?DPIWudIz72qL1Sut+nalVnD9d/ZlHiM/bQERAHFhSWy0MqDlzMvBb97vnBZ4?=
 =?us-ascii?Q?gc51t21jl+7esgKTMZvJO1dcZWF4G7rTXgMsD9demDWwvMhal3lUJA1JH044?=
 =?us-ascii?Q?KN8kCqOb4Qqk/kFVDRDFjwbv6b0Ui6gTDiy79J/nfAOk1klxWU0xAUVzjag3?=
 =?us-ascii?Q?ryyqida3gR1vDrd6lJS5sN1+D8Vr4s4XEwzrp8ExTpMrMNhufcTXD5m7JCdn?=
 =?us-ascii?Q?b62yYUJWj+VlhCP+IphTQ4JK9h/QAhje7hB8wOqTm34gynf9KKAchiE9yyQX?=
 =?us-ascii?Q?xv1Qp8EPdgh70kRbqT8G12geZ5hSDmNyRsgxKFE6bOE+aUKMalpuRWomSReR?=
 =?us-ascii?Q?oa30CatWOIAN6enJ8pBQrN+Ec0eEADc+zYqdA9wGgY21cta+uNqmTROtJ/15?=
 =?us-ascii?Q?1n4B7PirFeLy5Fz9ITu2qwNsA9Z0rN7COzZbqYlBvTiFAWq88OX8J1Io74vf?=
 =?us-ascii?Q?1ot1fCD1OxCPOwH68WHC1+ugsXSmHhAiugnoqybYw/xKLN2And/sdPFA4feg?=
 =?us-ascii?Q?ZXZy6s3fFn8AdhrZRmzfvLAxxoLOJNcmGECh3PHt61yhumPD/zLfUWkYvO5V?=
 =?us-ascii?Q?oeGKGgatkHaEH+tBibPRATCUqfaOpfRXce0AyzWnD7hIlxy4XIVMFE6+vuPE?=
 =?us-ascii?Q?plalgqzWVT+jMIyWcJ2px5RxG4OU+4GwBYIZ6sklwRTGz8BpjiOVrivO3ipF?=
 =?us-ascii?Q?uev73FPPETgXMdGxOQtMFTAgFC01yKZChj2VIM/PNq2FpYrnC8orjj7vJzsy?=
 =?us-ascii?Q?aDPf/lN79b8MN8otuFYAs7cUljpUaZRoNGniIu/kOh4nmIAssCdMsDikl7qh?=
 =?us-ascii?Q?sZe4TCfb2ERPXy+tVvA6kFKMFDNoyBkw12+3f3lyctDaHd+pjXXxcHzxMCT/?=
 =?us-ascii?Q?2BwMD5B+fVTSlmFRdfjLI2P56cx2JZ3lrPCNinGpLQbGhayLEa1Bbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QXhqT20ggKp90vBCZoIf33nfCEH+C1Mr31FbQRkW0ot3gvZozVmkWhMcFzWC?=
 =?us-ascii?Q?JZCtkCJvHRBAMliL3clSjenSMA/l6RNa2XcHdbpcEZBwa5v8CCyDmBjkMb3b?=
 =?us-ascii?Q?oVZwvg1YDIWOaibFVkrJTILGP6EdA5r5wB1juAH+1pTzZUd6+xyWJ0IE3epF?=
 =?us-ascii?Q?W0WM4MBxKHIZ/wjuArlqzS6i3mQX3gmfYAxAb00PiBb4NEUgRqvCrrOc3wLT?=
 =?us-ascii?Q?2kW77qIoDyqbl/DNY46FzNZ0B1SrCxQTvCpbo8gjtVsEaowbY5eTp3f3Zcx4?=
 =?us-ascii?Q?UfSeb7205maGgxdQ01u2it0YoiLTf2jEWQMMT97GXcOB+s5MkLivtPMRT/zZ?=
 =?us-ascii?Q?U/HpfSF5+uEIGYuGBqI3T9i2tgcuqj2FV7KiHkNOUNrfBff+Je5mM1skN+2E?=
 =?us-ascii?Q?JwgfGKSawhwxTU7XX5pGx64h7Y4PwPJxIhRs0CUoga0nkSv41B77+SQhcRDq?=
 =?us-ascii?Q?f4YVRal92vOD7cXxU4KUfPg8KT/eywrqE7avCIgjrse4oEu9SvPuQ6Lz5mcA?=
 =?us-ascii?Q?f4kIXes9XRKEP0DLm+VRO+fshhFpNynpJNC5zakvYxULAo1SjMre6qEzKqYE?=
 =?us-ascii?Q?FafEswEjw7WAbMtrYUkogAh/R2HRmCwULa4l8qVolRdr7mnjnmdCIPQteDfH?=
 =?us-ascii?Q?cW3FIjWN7H0ltT6n0ZIcp8DxOC5q80umFAUAHHSpjFaqQn0K1FMWx5gXB1VU?=
 =?us-ascii?Q?nAqnosicjxgueft9++KUWcAc4Mfkk2/HtFYRzhyeFkwchm7N6b+AJa1QzlGD?=
 =?us-ascii?Q?F5gNnW0aD1R6l/2/th9dxYnji+W3udIwr340CRphVgRzpH/wHvB819JKX10k?=
 =?us-ascii?Q?KW/e5Gz0g9kqTay3h/5qR5l2v/b8z8dbmiOXbsJdmLKAD9XXkNO5TtLQE6RL?=
 =?us-ascii?Q?qNdfcb9sDFM8iM3pC1BVBk5vhMt63PNoHeOAeXuG/k78ItbBNno3ZdJNXjFB?=
 =?us-ascii?Q?8zRYW7zEq0skSw4pBGHlUhjn59KXUfdDeDnpCIVPTV0KEKWS20T+ZugdqJ9s?=
 =?us-ascii?Q?N/SnBoQnzjm5iRh6Eo6OxuQ8s8IgI4REg7P9qBa/CRNc4nE2NtzIQEecKqJG?=
 =?us-ascii?Q?2xeOe3pqsUJjDQneSoP5juKXJ/OOy8LT38Tes5IwRJYA22QwzC1CQr58SuyK?=
 =?us-ascii?Q?dRuZcFBZksG1CSrN96r70/VYB2LAn2loglDgsDVjKJbUIoupwkWpL9RYk9e6?=
 =?us-ascii?Q?9iueoKw7GxEvvtnckESeHfkHf0xHhTpI8DYxeFsTEtODSz7AhzRiyvdoRsH9?=
 =?us-ascii?Q?jzeyo3BVvZoeaDaAA1xVE+gN9tsjkluBfXDlkYXTJHszYNJRxgOZv1C/EAr/?=
 =?us-ascii?Q?1sAZJlvIbG1oNzGB/sNpKqEoG0KI6qppEtSWKhiQ8WgRuCY821EELGVtYPnW?=
 =?us-ascii?Q?2zTHF+7Ihs0zn/mBErSplQLaIXC75b+Jo+6rVd9Dgq1kUk3NFnbBVapcj/PN?=
 =?us-ascii?Q?53oeFU/MJEkjDYIoMAvwkAhMpRd+InHURcCdo/I5zfJ6izHyEMGyIdShFNYw?=
 =?us-ascii?Q?60OILhvW/ADo8LO81F8cMAsZBTuO3yWvR3kHUqzBJ5/rPhZUA1AfFrlSKw0I?=
 =?us-ascii?Q?S14rYzQy1SMRimtX5+MVU7hf4dt86S4yREqhxLNL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b751d9-8faf-4e8a-1140-08dd85f9a81b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:09:07.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aoazb1aSMphVAWFj9y3JFOOmBO/tGmgDZDFwKX126PvGDwfGwkxsH3gyIRzNT8L1dlZDn1dSWL60YkE2SxsfXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
X-Proofpoint-GUID: QCe3qNTrdvHe6YkS6LxtE7VZObwYklRS
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680ee348 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=QvrKAYv6Bnv6kL0mVG0A:9 a=rswkYra8WqA2jR0d:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAxNiBTYWx0ZWRfXy5lIIWGTCSsz MmdVAW6Ohp2JQ+0xFR8re76pGBLUrUn/cPu5CFvRWUnJbGE1fLL/MzJsIG5lqTmZHmohgufZZs+ Ir2SWHJwNjPhdewhXa2/W7TW2pyvDfEDs74N3SnXxrA12/cpBCqI9HJ4pwdLn4nTKuooi1EKw1w
 nSStKbEkJNcCvaR4M8qhJ9zCS85l5Gb8axzfYvEyE/vbdnNpCCeGRT+WSDKP0OoIDm5hNeV2d9V dcVorywEdEowQNEI7idgi/36WCZW1Fobugu0bgZAdWONRUlw9pvWNp9aHAwKuI1IZnunr5+4nDl r+wcsaPqhda2m3yYJ+/a16xQvizStz/KkjnMAIytAGQ967EdWS7EZppt2P1uW0o5zLNcPA6Z5O4
 BJPXZhu0jc796nxemX5n+8QnP+hVIrsulHrmkEjZFGUSbiGLDUoNo9igpsAsU/W5HKy8H0Od
X-Proofpoint-ORIG-GUID: QCe3qNTrdvHe6YkS6LxtE7VZObwYklRS
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215570

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are
generally useful.

Now the QEMU_OPTIONS settings are moved to bitbake.conf as they are needed
for qemu.py functions to work well.

The qemu.bbclass is still kept, and recipes can continue to use functions
from it, though they have become wrapper functions on qemu.py functions.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/qemu.bbclass | 51 ++----------------------------
 meta/conf/bitbake.conf           |  9 ++++++
 meta/lib/oe/__init__.py          |  2 +-
 meta/lib/oe/qemu.py              | 54 ++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 49 deletions(-)
 create mode 100644 meta/lib/oe/qemu.py

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index e9fe757c7f..97497c392a 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -10,55 +10,10 @@
 #
 
 def qemu_target_binary(data):
-    package_arch = data.getVar("PACKAGE_ARCH")
-    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
-    if qemu_target_binary:
-        return qemu_target_binary
-
-    target_arch = data.getVar("TARGET_ARCH")
-    if target_arch in ("i486", "i586", "i686"):
-        target_arch = "i386"
-    elif target_arch == "powerpc":
-        target_arch = "ppc"
-    elif target_arch == "powerpc64":
-        target_arch = "ppc64"
-    elif target_arch == "powerpc64le":
-        target_arch = "ppc64le"
-
-    return "qemu-" + target_arch
+    return oe.qemu.qemu_target_binary(data)
 
 def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    import string
-
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
-    qemu_options = data.getVar("QEMU_OPTIONS") or ""
-
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
-            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+    return oe.qemu.qemu_wrapper_cmdline(data, rootfs_path, library_paths)
 
-# Next function will return a string containing the command that is needed to
-# to run a certain binary through qemu. For example, in order to make a certain
-# postinstall scriptlet run at do_rootfs time and running the postinstall is
-# architecture dependent, we can run it through qemu. For example, in the
-# postinstall scriptlet, we could use the following:
-#
-# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
-#
 def qemu_run_binary(data, rootfs_path, binary):
-    libdir = rootfs_path + data.getVar("libdir", False)
-    base_libdir = rootfs_path + data.getVar("base_libdir", False)
-
-    return qemu_wrapper_cmdline(data, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
-
-# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
-# PACKAGE_ARCH, *NOT* overrides.
-# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
-# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
-# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
-# qemu-arm default CPU supports all required architecture levels.
-
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+    return oe.qemu.qemu_run_binary(data, rootfs_path, binary)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1dae17267..1d15324f12 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -892,6 +892,15 @@ ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
 
+# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
+# PACKAGE_ARCH, *NOT* overrides.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
+# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index a55694669d..dd094a874a 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -10,6 +10,6 @@ __path__ = extend_path(__path__, __name__)
 # Modules with vistorcode need to go first else anything depending on them won't be
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
-             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
+             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
              "cve_check"]
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
new file mode 100644
index 0000000000..769865036c
--- /dev/null
+++ b/meta/lib/oe/qemu.py
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+def qemu_target_binary(d):
+    package_arch = d.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (d.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = d.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(d, rootfs_path, library_paths, qemu_options=None):
+    import string
+
+    package_arch = d.getVar("PACKAGE_ARCH")
+    if package_arch == "all":
+        return "false"
+
+    qemu_binary = qemu_target_binary(d)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    if qemu_options == None:
+        qemu_options = d.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+# Next function will return a string containing the command that is needed to
+# to run a certain binary through qemu. For example, in order to make a certain
+# postinstall scriptlet run at do_rootfs time and running the postinstall is
+# architecture dependent, we can run it through qemu. For example, in the
+# postinstall scriptlet, we could use the following:
+#
+# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
+#
+def qemu_run_binary(d, rootfs_path, binary):
+    libdir = rootfs_path + d.getVar("libdir", False)
+    base_libdir = rootfs_path + d.getVar("base_libdir", False)
+
+    return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
-- 
2.34.1


