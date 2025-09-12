Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E056CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 03:33:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7389.1757648021269057954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DWXq8glG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1350ab43ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C2Zg2K247567
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mAJaxV7/FPREcmCf/nU+
	trfGgZaFhbEhZ2udRWs6u54=; b=DWXq8glGdxOSCz1apA4cfPhLDyJ1MYJ32g2B
	K3tgT/8309thwJbQg4g2+1GdzkHD9okxyip2eN1ozxPQlwP5r4jqbao7NOSJLViJ
	6T99cnCbjzAqy+3xdbvcebIx4+Mi64m+n9wX9dBpv27JVSl4koQFQzfdu+pIecQI
	7d3KvojN37FWbeK2fC5CcS8WLeaQKJNtFUloVssAZFB/D4qrTyEorRYxLNjYstkD
	6Dz2bgKqTfh5tkrlb8VjMLW8/ZBIB7upBpWorRogkuQQGDc1B+LOMmx9AtG2hIEC
	sZq1qaSgQddwkQwcqA+MLxYMyP02+3/lgngT9T2R/LuXKO6/sQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve35ckt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEn+lw8PjJxegJbh9tAyjo69GvGadDDw17R2nJEzwzBJfG7g0SZDXDfC0Js1lNCk2YjSR3DkZvkkAirY8g20Y+IOblaZIyxPthaH7rleTva3kQ3A5YlijtOXdNh/FlvaMBM/uXMg9PrM7QomJhWBYAQvl7m9fRWMg3Y/6uLRxvkBdX8VkReWoZWGQBn/6EOFVLeQ5HRvDkdfdU77M9gVAJS9IgG/6B/Cf3w4Xjy54bAYArb3wyoJBCyhJvsHmnFgM4kTqODaxDsHDeWhgT/vp4TrIL1yN1+viEmDULJB6N2rAdIwrAKgNhs4CtQthXSfVVZVfquKRDCI/p0CpXgQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAJaxV7/FPREcmCf/nU+trfGgZaFhbEhZ2udRWs6u54=;
 b=CJbjNOFOzGVAWXEcstzPLZhMsbcSDrGndU/2Ix7S5DahXBRm8nHhXRsYm94DbkK/u/5B6opVasnE28zqJ5/o/zbdDRMKSbo3grZycBNGv/e56TSk8YyfBSelvpaACal7A2Y71dQt0JL9+171Lb8WaGbcoWwBCT+qL7IflJlEWXCZsepqQ9MDyoARxRRn7XfM1cgF+7o6Yvi403RjEiu6rVY8BmvWusyBEHET0W5sbdDuw1WcB5loUV0T1cWArAqd4XLcX9RAEGc1rWJQeW+2jnip/utgU+rJzh42nlGbAncunlwcv/0TaA4srWbhpfFh3pDJlsTBPANyDopMmDoujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 03:33:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 03:33:37 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] package_manager/__init__.py: add function to give user reason about a missing package
Date: Thu, 11 Sep 2025 20:33:22 -0700
Message-ID: <20250912033325.2887890-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9834f2-3cfe-43bb-6400-08ddf1ad28d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?geJmhs8PGbJBAIf0YcbHL2r7YRE7jo3JX0jJP27BD1kBTRQZmU1zK6krchOy?=
 =?us-ascii?Q?iT3WX2j8+CuwMoGhl0EHJpbTaNMEEtjArSZOa9jtEfVOECOn49gvx+eeERXi?=
 =?us-ascii?Q?rth8+y/QeglcltyzPoSho3qWH4pOvYm/kpv1iqzXlBoaO0e8+8id70YK+AsM?=
 =?us-ascii?Q?5qqq8TcqfxnCfmpbFK+a5FvWwbwk3UpJ9IsDpzgLnnpu9Zl7FEFJnafMCbcq?=
 =?us-ascii?Q?72QrlAjV8KCO+DB0DXifXjID4kh4onjDuhYSmat7LEim2vdGUPUCWXJC5oxx?=
 =?us-ascii?Q?XbbsGa9cnUQe6kipoMmodr4rtvlK1rRcilpwbO1Yh+m6Zy4HfGSiLWQGJmqR?=
 =?us-ascii?Q?Ev6gblFTW/sNt9M6dkGfnjwSQk5BHkFtATRf4N+JPWcNHyjyJvwedz07Igs7?=
 =?us-ascii?Q?1EAuJiY0uyJUdiOV+i4c+lgXdHz/o2ErEIQ1HdWJeGqysOoqs4Ue9Y90/JUR?=
 =?us-ascii?Q?FC8Dr0+OB8i1qYueDDQXh9a05/wh/Fzc3stvmGltsp+RLTNtXaxmI3/Aa/86?=
 =?us-ascii?Q?rf6DZgeRGkB6LcILXfrUyRt3mDc5/FkRwmT2DZ6mbje+kryqxBlLcAWC/QyT?=
 =?us-ascii?Q?aPzmuURi0wTeVvnr8TWrLYmH/jqwPmWUyvRGRzAZWyyVQCXMcxddjt0tm2Us?=
 =?us-ascii?Q?fUa34QPFWYl2XQ0u2AGYetjMyTtqWs0olpGdzfxu9Vz3biv52CCnNIYpadmc?=
 =?us-ascii?Q?tM7jwllfhvI68RbCmHCtiipMJ/ID5YjzX9dSnNajFLxfpGcy2ZhpbVScPHik?=
 =?us-ascii?Q?kVd/CI4XH7E1j8v/Xs39FMEVqgXQgn5m1KEVbu4yOpter8hYWN+rGpZ30mPr?=
 =?us-ascii?Q?C5LUfD2zDwgZnEnIGEDiDxycefdL4bEt6DMLI48TrdfZl8YiX0uxjUJMUlC/?=
 =?us-ascii?Q?G/7iIYLNnekzm5l3LiByyoqOaDDGmu0AftMpHJGTNdSATlxt0qASn5cQWIFu?=
 =?us-ascii?Q?dW+PjexPwMYrmwMCObeT2q7jEC6ZtZ5PePTdIcekz5zf8oP0GAqyO22UyWLh?=
 =?us-ascii?Q?sjyVf+82xuRvm0FyehP/oaBqL//JYWSCel5oB0kwV4V1PO3vUm8YKQb4JPcm?=
 =?us-ascii?Q?xq5/FKE/NbayJ8qBjaNYcqujlTNzhhVKlHA+G2R1d5YNGnJIIxj1hjVRxgn+?=
 =?us-ascii?Q?1SuNGa1fH+gEcnlcxC2kWSIDel7zEE1aUwYEcXqts9nSxdMlpR3lb2jkreBv?=
 =?us-ascii?Q?I6QSGW92pzPuqLZmxMCU28CTG1gE8Rv5VCgTDDhBwkB6bMi7EiZAIBSY5arv?=
 =?us-ascii?Q?U7DoXiWiPqjvpNZ00Nyv554JLbDkBXP3m9YNxWlQzrNxC0b8AR6OCgRlAANL?=
 =?us-ascii?Q?uY9vNQwCcnMUBAJ9bKgx94N27JDkrKM2/lm4BfDTtE5oZkXrp6eXiaes9u2r?=
 =?us-ascii?Q?fvP8kGJ+MajFJ2XrpirI+bX4EsdqLjEinvAqZsYYb1qkakeUys0K0tkEVWrs?=
 =?us-ascii?Q?HDfuZ9KRH1C0vaf3SZIx6qzvlbKn0KLAzai/YcN9YkvObsFyRnKiMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i3tLr9EqWFUWnsWPj24eCmw5DWP/xHRfxkwCPyypqUHxC0JT/g3hCADWeF5R?=
 =?us-ascii?Q?pNNHYTv9XNXeSwbrCRfF1PE9YtXrtD73cjFON+Gz32EcxpEqmLCUy70ZPsf3?=
 =?us-ascii?Q?uzSks48I1FPLonjU4287igs1u/UKsrUdbdhymH9fDyl1u6unBIL/38MKQDFo?=
 =?us-ascii?Q?l4bN3mqj9kKzkWlwmO6Zinq3OPrwzGRwZEGLwSs4sKZ1F+N2B8Cs8LEmY6qZ?=
 =?us-ascii?Q?kQCvEpJLX2Klo0VtXHFRL7YZGYm0kz3hSTy2/BhFuE0w5xNTRIc8tsEL0GLc?=
 =?us-ascii?Q?KXlI6RSjMUIXsiQ6cUy8BfEFMWGg1aXG3CyGpEnXbca6MQCzy74AxBePOZWT?=
 =?us-ascii?Q?DH36KCPyY0I+spBWHqtFeEI3n0SJyZngUNPLy8NezwecnEcbBwMWC4xidCHs?=
 =?us-ascii?Q?IC5rcB0O8Yq6rE2ZOpSAKoZcua2ioAj8JR8fSYgtYtZ7wk1Kg6peqlkf1qLw?=
 =?us-ascii?Q?CG8vBQb9VljbpIssQyMkcLuFif1cxPRTCiyY5qpS/EqDV3Mq34R7NFRKMUuo?=
 =?us-ascii?Q?AH5hd3b7m8usri6dB924QgsWDzzGpZxBSWvzvL7eFda3Uxv+9pVdqekPe6bM?=
 =?us-ascii?Q?9Lv4V77NM+Ekr/ZoUXASi4AQt4Ys4VKdjFvFjztRPmOM2Idq1v39qtP6D9zK?=
 =?us-ascii?Q?zZ6mFR37Tlz0XoiK7CRS6SdOt5JNkhA7KzOolYxKIw4v3KD5WHWQNNvzxcmB?=
 =?us-ascii?Q?G9gS7E8/eaIrl4taec1wt7HH0OcSVDUCy80fROJiD5t0wL/3JztNCNnkkdc/?=
 =?us-ascii?Q?2iNYrTfe0d5vL+vIr8CpLhm4WvAo51jd2KE/3tmpDHfNTqZpSIgBucQ9oh/i?=
 =?us-ascii?Q?MyTcwmczJCgjGlDpNrXP8JSvwRV9auleMu7BLD85avn4G6vVdi5K5wM/lbje?=
 =?us-ascii?Q?IASrwvfFDs//p5aTdpJ21jXd8knMFY5mSHjJ0drlVnhIAQ4OHh2WS7zmt1+t?=
 =?us-ascii?Q?7ldQBqV5wJfiMLRw6USexxq4ffv0FFK9QT0ZGhZ/mKpONJj1OOcDaGbFgbsO?=
 =?us-ascii?Q?hxoUEZqKSd1saBIGaCzwxbPpSWw/EGoMj9lR8o4uG5vy4ehAXiTWhCbMIkiQ?=
 =?us-ascii?Q?sJUOOuF/juOGutx5IhTkCgTKhFx7pj+mIgcOhf9e3VmzQvrXWJo8blctGnKT?=
 =?us-ascii?Q?GBhjoZhQs4z96WEMAezbMV0JOSiaY3QhZKEwQPaJmpMpqBYE16iWEHNhqkDZ?=
 =?us-ascii?Q?WR5yWpV19U5+JAs5FnYPQwLqL+i7EitmKoHVo4lOxhrIr1zCLluJAjRK8Tro?=
 =?us-ascii?Q?yuydRq4ouELartsqzLQvjhz4peWA1uknd/KKkXnutSsouYk6rpuG5WZJDmZg?=
 =?us-ascii?Q?9asEEr3IwNQrbo/66We+ha7Ch5fQpk3aksEQlaVhDwnpONgoV4KuF7fUchlZ?=
 =?us-ascii?Q?tHGQ+b1rXN5cmeLhb4IeWHQHzArjrDi01yN5MPCapNyTLJZVNIp3QTzXu0lj?=
 =?us-ascii?Q?kXzNYchSqSpV+JPSkSizK14j2WAfOxXEmnM5II9N9mDu6ZhLzq/JUXrphq3J?=
 =?us-ascii?Q?R5J7vO8ehrEI5V4xBg3M+Ahp0lVqopckTmltCF48UdsjzHElq/PatMhAK6c6?=
 =?us-ascii?Q?SmXuYr/7a6gzuXy+E4oSJtUQqHB8PpsbbZ8MYP3goHIGNE60UsW/2MddpfLS?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9834f2-3cfe-43bb-6400-08ddf1ad28d8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 03:33:37.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNGEVS8MF1/qe8q8VXE7kzqpHJQzTUBzSGgZLgjDNem3T6YiGD2Ufn9rKz+b/3P6sjdOnzUD7ckG7Ng1fq0g4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
X-Proofpoint-GUID: 2N5g_B4KSuSoTw0WUha-lYZ3RVXEjsVG
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c39494 cx=c_pps
 a=QqSBEdqS7BUxypinyQlWrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=2v_pIiH9JfET4dE4qI0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2N5g_B4KSuSoTw0WUha-lYZ3RVXEjsVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAzMyBTYWx0ZWRfX4zAH511FVprN
 VeNVGHXRHcQZx4IxajXws6oRb5zE/MhOQLlTsSQ5Xvie4AuRfIgtB4H4cN5SHEGKch+IrFhd1w4
 +T2U9H3vNAySliwLr7kx5Tb/06dKz2Ak9dHOc2+j0lAMflRlNAfllH8C0A1JvsiNxoZ+BtZTMwO
 Xcax6g155q/gB32ul47PCBEXL30bqUcF94Q5328Vqo6Hl/khjqxtEmNMy5dCiOmUTpsZ7d4ruZR
 hp1INPvCD+O+NvrG2ZtIfPvBfRgsgENcD3K6DeYySjWiIzZ/VhjPK5y9iUED0sZv48mEWbx94fr
 HC8T6QB/S59EKk3J35hVJ2Z/C+jYowA219oDWSn8/quPGZGbzT5ud8hk7dvC8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223300

From: Chen Qi <Qi.Chen@windriver.com>

When users specify some package in IMAGE_INSTALL, but get some error
at rootfs time, the user might be confusing. This usually happens
when the user puts a recipe name in IMAGE_INSTALL.

To helper user understand more about what's going on, add a common
function here which makes use of pkgdata data to give the possible
reason about a missing package. This function is expected to be used
by package backends such as rpm.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/__init__.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 5c98a104be..88bc5ab195 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -17,6 +17,7 @@ import oe.utils
 import oe.path
 import string
 from oe.gpg_sign import get_signer
+import oe.packagedata
 import hashlib
 import fnmatch
 
@@ -447,6 +448,27 @@ class PackageManager(object, metaclass=ABCMeta):
             return res
         return _append(uris, base_paths)
 
+    def get_missing_pkg_reason(self, pkg):
+        """
+        Return a string describing the possible reason of a missing package.
+        """
+        reason = ""
+        if not oe.packagedata.packaged(pkg, self.d):
+            if oe.packagedata.has_pkgdata(pkg, self.d):
+                packaged_pkgs = []
+                recipe_data = oe.packagedata.read_pkgdata(pkg, self.d)
+                for subpkg in recipe_data.get("PACKAGES", "").split():
+                    if oe.packagedata.packaged(subpkg, self.d):
+                        packaged_pkgs.append(subpkg)
+                reason = "%s is a recipe. Its generated packages are: %s\n" % (pkg, packaged_pkgs)
+                reason += "Either specify a generated package or set ALLOW_EMPTY:${PN} = \"1\" in %s recipe\n" % pkg
+            else:
+                reason = "%s is neither a recipe nor a generated package.\n" % pkg
+        else:
+            reason = "%s is a generated package.\n" % pkg
+            reason += "The reason it's not found might be that it's not in %s\n" % oe.path.join(self.d.getVar('WORKDIR'), "oe-rootfs-repo")
+        return reason
+
 def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies, include_self=False):
     """
     Go through our do_package_write_X dependencies and hardlink the packages we depend
-- 
2.49.0


