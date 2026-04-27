Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1C2FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 06:50:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37525.1777272612750172974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 23:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gq4dpcEB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85776b2c12=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3WnhW2673312
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=tKBiVVzZ9
	tlQQ39rmAldlTvKNMFMQeH/10naJfUWJD0=; b=Gq4dpcEB2WNiiS5eZG4CeE7lK
	4Nm11ClfvgWny2xBbJSPOqmGnUftF2JXzM18rniWJ9w6I7u+60xarymPVet6qgY/
	zNUkPXMX9JLN4UBUx8VMwowxPKhl3F6ufvGnsUurUXpvnvm+qxUEgC/ndgaG+NiP
	VC9Qxzm9v+GBRK/qUuYwnwThALXw57a1MqO1AZKwk8XA5/8B29pEZKFkZBHUmBXD
	5RGj4CjQB9VPrNdjBfZtsIHPWfyQ0FtQsEnFBese5nBPISU/w2moMGPTDoitW53W
	p4kqWnQZSk4VCBCmZOvhea5Ekip1DmMJIywZ/5zvmlmGcU4DiaUbkVqfC2d3w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09psm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:50:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU5GUfDfBkL93Tb7uZ1ZvMLw3JAmeDL50VXIIv4+XnvdrFTRbYcaiDr2nhbpWdiS9mzMnJQ8u8yI2P9PHMiAvjv2lwYe7Pd8ffexS3ortRMPGQm6B+RuqJL+nLT7OWHnDgwdWZPRLmDFuzP6RFqJoDmz6CH6a3qgx38fqlXjF/0HaFXokyGneUWRoesNzt7KMp+nRkSI/Z+7Wd9cbqAP+K/wo1cSr6el6JZwq2B2Y9NT96fluq6QqpmDkfOF6JnDUec3dZvXu1uzIakHBVKDxDVM0L81NoCnIgZIlgTMyYiCMv1u2kJIMphojtjWw98XrED2v90LNX+CpAsEwYJjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKBiVVzZ9tlQQ39rmAldlTvKNMFMQeH/10naJfUWJD0=;
 b=B200s3ZpF/ozVFeTgc+DxHQZJiE/4Xz96QqpgHZZM1Ffpf08AqNIZxtRrUhkWvVhZYozmMSshybjUpqMlLcOvoyPLwdz0sI2CZ2/bQUYTxrF2N656/1s57zI6bGdMilyHdXJTENTNxy4P5tNxXG8Kj8NdePwaI1ukZJSYzr8FwkbJkmxLmE3O8K7KMe2wDwj9fk1Zhtx7h9fD2SjP6K2XgoIiJ6IOT6Z/+ezh+mE95psTbU1pnsnZ/c3xotiE1VDehl7imSalUDSKw3yUXd0Fu1UWle3OA6qfMCNHwKOM1aQVUfwAQmUVB2b7DKLaYnZF36/gt4hWYsf3zUDC3iqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 06:50:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 06:50:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: set CVE_STATUS for CVE-2025-69649
Date: Sun, 26 Apr 2026 23:49:51 -0700
Message-ID: <20260427064951.2603944-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 98383815-901d-4576-015b-08dea42937f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	de/e1RBwbDuL3tZmpHX8j1xvnSElCKQn2S0J57pO2VRrUpobyuJRz0dsN2j6/VYJ4KzM725VKGnFYhMjNjB6pt2IYQ2NI4B0XzIAnyN20QBL6+k+aa6SQ/bMpjYzHBp7PUQ2M+PI1M+RucwL13diCo8hJqU4DcEGXsUc4mVm258076BsaMMI5kQ2sgs7RS7t2AKEb/bsTU+Y+D6g6ct2ITmCgMLOI3JGHgRvq+3qd8jI4+SWHdNS0KkQz85/uy6yZtH/oKv4gRMYl3k/OLRpnXMN5rD4PUhv+MdpbJ0EuBOCCsYWATtlv4+pjFiCg9DFjM1Zm6CGs/iHJIp5qQlSIz8u6U6usZ+nt5hCZxDUqXgZJxSYqfJwVdWlUi7m2zroX611MY/8n0EeffxOEdalJVlIQO2C+P9d4Z6CQ4dQ96UKRLQQqydmjfEFodwv6bWjWza1ZLa8/0ibGlUzUPFI5zcotFZMntS04q4NKmAeRW7egpExrOMpQDUBHVVHcaId3am6qLg9kGc/U9cx4tYDPeZNmoy3X761g3RzN1+tMh4EgYFdHjMbsqvqVfTF8x+ZAxqgfBCr+w4UwlKqZyVA7XKC0zrVurN/5OFvYMDqc+vxCRAvqacMmv1w0fxk72h7K30XEzrZ4H99IN7Ff+0F4L/yx8d4BPQBqfEPchKYJalt4L/DlvEJsmgaQLcKZRwDQuYQcQD40/TQnEJVXeSo3aUG+eSdTJ245ms4fB9V438rLz7RHaE//dS9RzBvcERMW9aSzQTJbWt/sG8DOuMfMN7qD41CnyQ46id/arJFKEw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A933RNWMhLDi2jYc0+/ww83bn9RA/xuT1Hlu0RdIYiL5CLBLpZobPX4vERAa?=
 =?us-ascii?Q?FRx5ruFJzo9/PZkwDsVFiU6Tv4E1gesxp+yZOhEbP/PXaGYqy0VG5aRXbMi6?=
 =?us-ascii?Q?J5byoGUJOHOlSrAACt+DA8sX5oHTg1R+WKrtnRRqFgS1sNeBDYY6F0LXto0D?=
 =?us-ascii?Q?0uS2dnLu9+TVn4ddKntmFhyCwFSuf3DznlkuwuRd/+MR5Q9kc9Y4Rmh5m29s?=
 =?us-ascii?Q?i/E/e3eeVouEUe1qD0DOFOZcTgAM/YLChZv28KlWNM05Ou4XyH5Q7rqK4x7A?=
 =?us-ascii?Q?EA5u881tMz43spUoBYmpelv++ZsKrs75aUDWGj/g++YxtEjE5JXjBekyBr7s?=
 =?us-ascii?Q?P2fw58VWhhLcjbIx3NGL3SzOaBiTZrrYVaVcWYfQw8hjmXc/sGGEN0RJ9ji1?=
 =?us-ascii?Q?NriYbeK3dqxPUDGhtfyOp71yAwK2IaJCYSNa1+pqyqnPMj/rfzRyo6Pl7+NR?=
 =?us-ascii?Q?93SagZAg4H1TZscE1F0YpRYSElSrx8buxUZfiHBDxuQCHnCkrvDBEujNwI+R?=
 =?us-ascii?Q?m2AApBeBNjdM5voYBH8B1H9AX5mgiUN1n7su85CX5yO/gk/bK5Uj+6+a8ghP?=
 =?us-ascii?Q?5wv7LUDj/MQg2yrEM7XGlDozUAGODTJYTMrPULpbBAYhowIykri+OntVZoC7?=
 =?us-ascii?Q?hokaV6215bbuW1BFCWvl/HY/lceylDyaH1tuPwjfWvz8GMN1KFMOBcaa8n4g?=
 =?us-ascii?Q?4T/8yTPhBFACOOLtTguJpoweYANQdVtCvYahvz6hzfecvfZHfr5gPJgoFoj8?=
 =?us-ascii?Q?7Fk1RhCjgcdXGAli8fhBvbRO/cgMER7UCG1ezsowQRkSz0nXs6geo0RncTYI?=
 =?us-ascii?Q?EN7XkQR4pkOu7CH9uXrSY57M7cwdr62DjQNaMYx9Q8DLW7eoYNH5sACrVKAF?=
 =?us-ascii?Q?WbdlO6nwo6p4HltXDGWmgHWV90/2IrmBrPkEEiBCf1UnPbICGaFtXayelMvi?=
 =?us-ascii?Q?FRNii8qBecPyqaY8n/Viq7ysWSmwKmwqEBLHoB6YYjl10medStuOlYvckueJ?=
 =?us-ascii?Q?Re2BbZYD21CF2ws1u3cI6Nt564MW843An6wR76gTCGky37lAvsxCD4oh1o63?=
 =?us-ascii?Q?R+LPS2ERTZm9W01mF7S3zt/HJ6oiDkflU1XBoZgFgTe3TVPp323Dd/r4AfN1?=
 =?us-ascii?Q?1tcURqWN5gZJtfzojTi9WcbyBfDMdlVP7GIJ08O/gqZfvc7/VB4ghSpwRHZP?=
 =?us-ascii?Q?FnkatAAHfsjbs3kdjumzwZbAC8kTSUR72tbQWOROb0IyX2/bXTjmzGP41/8E?=
 =?us-ascii?Q?L5JAK5WRLQygNlRndfOUgly9n/lddxlKM5D8dOpdnUSutLeKzvjwIKpJmjNx?=
 =?us-ascii?Q?N9/3Sof0RcbO9sfFewgTsPn3Uj5BSTTcAM7T9rn9DTyF6o/vKymnd+EZFMs/?=
 =?us-ascii?Q?mF4VytQaqVDYabfUOFjJCjqzQKTu3Z9WoGDJij2CdWC1bfelj5XRoZ8L4gxr?=
 =?us-ascii?Q?nzsMPhfR/GxNF7Z9o0dRgJevbfguZHr1GgDyw5/Rh+L6N7OdOatn5Lr0FXS+?=
 =?us-ascii?Q?LnGV0r1GpKQIlrRLqwKrGnVvWdEwbaJaifZPhO3iLmhCXgH96b1M07hiEO6Q?=
 =?us-ascii?Q?jY8PNMmr5RDmSWszm9VR2QbpVF0rM38od+sTTeQS7TibCPXdXzS7+iGsaCob?=
 =?us-ascii?Q?WkJljJ7JZMmcwVqxsXnNY6wzaQIoxvQYMTt50B2NrHzvcovuf9lpnXxr3QkA?=
 =?us-ascii?Q?S+ysHIgrIIcr3IM/tn9lZ+YWs33wZBufBoEycFmnkZ2ijnvQ6TnjY5bedval?=
 =?us-ascii?Q?FYmr7G4nD79zml2mAPVYgftGSVvF1vc=3D?=
X-Exchange-RoutingPolicyChecked: 
	XLMZs5ASj4fHjM9HfUGoCl5rVXlvBZfkuwZnc7L9BkWV1PQrhCk/h6gJ/b7RXtwciEoZKMew8TwVLJfQ9CMRONzEfYMH3svnqEwEl5iKsiN17cBOacohd+UONlbLosAQjVyz/brn7P7eTCpLV24LvOTM5NDsIlzUjMY7b1Ss5t5WRpJ1CLqACr8v1qMxaqsBWx4QipoB2PeGnFgHG3+PRuRb7V0HmkHzlVOqA3EAFyJOAFjB9XSxjsHESkuCPaneK8dwNfcaxhlcbup9Ca7C4WYaEqBxi6LvrOGeMPS9QeIKHmLOAmzoDTe9kG+yrk8Ziy2ZGTUKiTp8IKcpY2B9gA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98383815-901d-4576-015b-08dea42937f9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 06:50:07.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4I4CElbe0GtHXwdz1OlI7xtwNh7F1drUZBm9Z98bTOKMJo+VmIONoycmiEce0gvmZvvKLsePrdmvj16mCwv4fU8/at+mZidJfjxfyn9H2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69ef0723 cx=c_pps
 a=VtjYC05bhoYYzE9JtrBllg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=4-ndGM75-CC2JeZQe7IA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: 6nrsizf1LWeHIeZlAdX6ScyZobIkZyaa
X-Proofpoint-ORIG-GUID: 6nrsizf1LWeHIeZlAdX6ScyZobIkZyaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OSBTYWx0ZWRfXy34MdcMjw1v1
 FN4gMQJx/dXPE34LEfmoKLbehzz2YG3ap3i37cq4Jp8X0jEDtwCEBu988cSg2K4YRqhY+NTWq3S
 TWjPnUbJHeWaMx+X8PSnCMjpuw7Nb+reYjEr3Ndnu4aWz7zoAuaYU4S/GUa8VqhBHp2rm06FnwB
 mrdyjckRN2vy0hZSufsTdTQku7vg4Lrxrvy6IKURHJO6K1mEGD5ZD/ZZI3VQKivyqxfaUB4LyBn
 1FyskZt0XjO4F/yYKA12iChdfCbLRjj7K4PQ9aLb7UnYOneApeCcEe+zit3aAKITU6yoH0Hbj2m
 1Q9W+VbJ7rM0+QpEnFH8fgqgGEO7q0L6vxSgoyrTs8XJCybkyUVpXTXc+RvJBkmDRclzXj6J7v3
 fWU49BE9Ab8UB19IW4vIZqkdoUr7LA4wi98ix0m0h7UD2Z8As1SW5ru7XXKP2NfTE3kTiHz0zcg
 SgKPWIG/TEP0MYNfR2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235986

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Set CVE_STATUS for CVE-2025-69649, as this CVE only affects binutils 2.46.
binutils 2.42 is not vulnerable.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242e..ed079c0349 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
+CVE_STATUS[CVE-2025-69649] = "cpe-incorrect: Applies only for version 2.46"
 
 SRCREV ?= "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.49.0


