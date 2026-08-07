Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C97CC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:31:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38973.1786095102159480166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ePiAArUw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26790c084f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776UNRd2224274
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 02:31:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YYm6oEwmUolPdnj1JiCcJhZ7AGBZs+nnscL5MwMlcqs=; b=
	ePiAArUwK8yOxO7JdI6GYmJhQ5rK5XUd81YR7p6VTD6XUk05CbmT0151+hY6BlwU
	MGDaqGHLDGpL+6BMkc0LDyPx11eZx4EFu5mmZnHmDyQ2qzzXzCzSKGtfwKFCry87
	6Q5QxeCeBDfvvtr+J9lM6iEQmyv2jA38AGluhy73Hc1Axj9VHR8hyes8vYYLKShv
	P62RPdm4ZPDWFWd80qlq6TdEPuDJg9JAp3EfIChl+HE9EABIXKQp/sQtP8E3vtGr
	MORJsbIAKE6eb9k+qwlqP3mn6+sXCDUW5q2sRe2bXTfUCw475Zw7wyXigoYWpBBJ
	zwy/Ciw8qhty5zHMvB4z/w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fvpv1tjbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 02:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N307iCADdin+dJzES5ubCeScYz2lf3lg2Csvuj2HPd4CQA/spWn3UBzL3KB+Q+Kz3XBtuHQvkASf3pB9+yXRzF72sUhhxNrmNnAKdLZWV3CNGy1kB52SvlsN9D+jKw4UpvxXYmF1fiy3fmnbyeBODqkyMfdxpIlbT2EFcd93dROx5y2xoACWPLgOQVqvYz1aiDr1pMXA1jAnpcUBdPPAdODjp/e2+5kCQCfHePUzm3TR9Fcsb4FARX9z80XdvLFksfZICIzPOdAVp2kw6yA9w+kiEEldZkrVtvbHe+NOoToaPXC+exKhjODvEHBdqRMMsUpinUAREWUalmQRzMMzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYm6oEwmUolPdnj1JiCcJhZ7AGBZs+nnscL5MwMlcqs=;
 b=YqAxazcvL4zDELruosIUntZCDSENI0vyCYTyfvZTNmReJrF9Rurhz8daQir8qT8QWqprvPWFcHWrYUBF5xS5lL5XEziMeJ/Vbrs5soRJN2Y+nHwtd157eCRf6ASNoequ4DMmUlaKyR8rBERFyNeISKBLEKxZLAYAcnh/L7O8/YVpnkRIf/Cp7pZQSsCS2ni1/1hAovBps9gz6uwRFKUWlC0OTXYBz6qdSQPahp/LdoizrXcWajMxgZsDuck/ZuSBUp44DkmSkKQIXLk6xI2lZ5f9GZ83qJRM9dZ22QVvWjdWyIuA1c7hZYiRY3FjF7INWIGYy/4xO0CFTgJjUk5g1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 09:31:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 09:31:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/3] oeqa/sdk/cases/rust.py: Expand test to verify cargo build builds for target
Date: Fri,  7 Aug 2026 02:31:16 -0700
Message-ID: <20260807093116.3680514-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:408:143::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: d73eb82a-3cf7-42c8-5a1e-08def466af1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	L+q4NHi4kzQS3mr9+qIPQLQfRutB1JYU0tRmJ9Ay5/1vglCQpk9sJluOeYg5NgINbMafo6cHVAUvoEO1K8RQDl5oM7hc2iqLoB+pHQqkFkTkfEBi5OvYfO2ot/sW+PmZfDPvHZdGoZ+tZMYeXsHjpf3lpTIlgUf0gK0lUYxJN+KS5AJ+NQSKjzQU1rT4Kl+CA1309Y/aDO7d1wxAYrsbqKkmA8s7A3NCNFriwFz3dTjW3sDwyCp/TJET/bIYNM6x3eu+1h9E/paacJKDRDzZ4YKprfZtuJx514eau9fhbRrrkg+y1jwBJkEpjPS9NYtDV6L1vzmwtOrQE6aT+4yTA7F1Fq7sCLUVIXJ7n68I4oe0Rztx2uTssYWLrygNjz+qIvGiIAZgt3CwQ6t2ZrC4H/VkdJSIejPCJRAw6rNA+i5+TjbhTe2Zt6mOLxxVGH6YlYFGRESMKm4hZiU+p5teVc3ZIzqeLCv6KKY9pNaYm6AcK0hs0A5J9Bj9kM56tm/agH7N8c2TwU5CrS/NCc4SchU7d9ntVi0EaRZVJfe7NdnLyt+WQEudqXE0jq0n2DvQpJ6p6KAZDyiLTMKzQut9Pr5YSvhECkhb/tIiZyqcb1xUlT4f8STh3UQPLzaWyhniBLzKyvhS/QKtXOYCYhc6X8Y/bI3peaGlonFrx+7Xw+aKrDmp7K2upL/EwkV8zQPMeA/DfMBSG1ExRlpdwWZQVnfxxCSMNZvNttOtJNhUJcg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DptXg36/4jQ96VTP3t3ozjQ9xLf55jg6Q5zQAcA7UXVo2aHknMfGQVjMZEaM?=
 =?us-ascii?Q?sQO2Ovbs4TNd+sXyR6izVhwxCraA6JKHlqGFkzHXYrKs4oqxwaFdPy5XhCgZ?=
 =?us-ascii?Q?3QpqCZY/uziRs2309/Kbkv446OHSTTlel+WpQm6nPVsk9RHs6uE7WMcEGzfK?=
 =?us-ascii?Q?GpGIK9JySjM4DzEJ6YSd83kBoQtMorkLZpwO4eDdHp3coQcPqz0Cvoa/5awk?=
 =?us-ascii?Q?mAHjIvai1uIv0eCDcUs15pr70XX8JZEJHB7CsFEC+2CcpJxN7BtxvzgPOWva?=
 =?us-ascii?Q?vEXzddG58lBdnv/kvdXp+eVpNGBNv2IcTblPaB0kn4CQDDZghr0BUGstLaRO?=
 =?us-ascii?Q?SF0C+FoXWqTQPnhrc2wv39qlGqZfrDaYLENYfY4M4OE//lyT10XxRiS4IjYm?=
 =?us-ascii?Q?PChNOAjUqPMQIoTNOkf4P9JUZIxBJFhR9DlYO7jP84VmuzJnUn7Ym3UfRg3h?=
 =?us-ascii?Q?LVaQTi2Qp33thtv69T+bwlpsI4krK6A+h/Sfu75I5SbIlso5YWHUO7U6C4Xd?=
 =?us-ascii?Q?Eg0FAt4whf0vVnpDTSmk7YKmnnktCzAmiqmkHW4GvtP7VuXtdrx6kedTsh7D?=
 =?us-ascii?Q?v4TN5ILkJqUbtHmHB7ZNraITuuRpeCNtIvlPpAcgUyvlHykUKOTzOugrqTw+?=
 =?us-ascii?Q?OsR1exYbmau0HJgRVlI+vAPTGHrpkvfJZ5+XxsiZX0Iiv8IuL/VXnIuXXBvf?=
 =?us-ascii?Q?bF2de+KEhBvNhaA8kR+1MZ+VEeZ0YlB9J945asDGWgQrW4vsoqPQeGSwodBn?=
 =?us-ascii?Q?iTpRwzvOspQBapGAAEEYjHjCcoGXhvt2MMjk/+pgekDsQraKcTfbrFpt6HIu?=
 =?us-ascii?Q?JBX4FGka8cg8zQJWw1Mh0dng3B3QMuS3U8ksrMk5w8Endf6gk9rL7/J/WEhl?=
 =?us-ascii?Q?c0SZbzksNITz3SXDoZ2N9N9cQrphxSjxxXvheYizBnjwqsNuMQhxvhPZ4eao?=
 =?us-ascii?Q?mCMHN6ba8/gk7TQYFEgQOmF9c0IAb680Ix5NU+I5svckjA8p6sa0/WLdEyDR?=
 =?us-ascii?Q?K+coZJqx/wD4xL36YJ+AQGcE/JP0FSCSCo86XpS3rpD6kraqYAXH+KBdPI28?=
 =?us-ascii?Q?P/51DnF4xVZpBZM8UwxRnY+ljfZbEORMzhAYRYe9O9m2ixPRmDG2CnDf5Grl?=
 =?us-ascii?Q?AQKlvDXTG+CarR7w4FYRN4ixMIPNzS//ifZdtk7qS0VTh7UK/WgzPRzL6i3Y?=
 =?us-ascii?Q?3YnK/SqziGDdY5IeH1PogCvfNEPLrh+/lUa8jv14vaVOBu2vMWNLaA0zCQ2f?=
 =?us-ascii?Q?voVXpxZyLNh0o5E9iwY/BFWURsbTreA12E+pEMJ15LfIxKrRRnRK/Z41Nolb?=
 =?us-ascii?Q?56p5iuYema7ZcWwHs7My98PqShVQk4azdnHx2goRNJmC2YO4PYHCue1MHnn4?=
 =?us-ascii?Q?9S0sn9HMIywfW1xgvAYrV9A60lxWvZIeArBljhuMeFl5K+FMJknDwCXxafdr?=
 =?us-ascii?Q?VkOHYTEeE7LPYRd43px8uuH7xw/vLr3b7YWoJh6jPIWIqZp6BvwRAtQiy+Vd?=
 =?us-ascii?Q?WrTUYNuFeZl/10a/jsHW65fA3mQM/nkhvSbpn/5Awsgqg0D5V5WxwANE+h2N?=
 =?us-ascii?Q?9fj06777EYjLztvXeEiDfrZ7S/sY4Vt7f8ak+0qZyoTqP+aQk2prikMffcad?=
 =?us-ascii?Q?XG6NJfHdfAYJAnf6vajE1IUc+W+9U2xFiQIL8jA4apMsxD4dvIImxmO98IWL?=
 =?us-ascii?Q?Vbvo6eip/s+dGkdpqS5nv1jZI64gn6/WSwZwFGpBT/Cccs+4UBRdNwtyKvWt?=
 =?us-ascii?Q?5OXaqpxg/NKzncV6OsqX2cLO3m4oIG4=3D?=
X-Exchange-RoutingPolicyChecked: 
	jOw/fOe4U79q1kSAdMoKq+uFAwyuyjL8TMAy7z6BxacD7WKzyvcfAjwINinlO38kb+sM416Wbm4hcf+wxgtMDSaGSaulVWNuxFgDoNxtcUwUNg7bBc/x2a227IwvvJJzpM96VzScY2hBqyE88s0bavXH/PfqMapHqFQHfbH3mhArmML6Z7kDaOfr8FTiMnaq6rOqC4MZEP1SHXCKEQIXPVzkQ1hIcRdYDHA63a3zgXWCi96ryGOZ2xwrnutCCONimRyYe0DFXD8tnveWxLN1dpgBsOnBA777xQ3r3BLetzjKJxxVEhbWfXJuIlm2YCHTxyS86BcIEpPUmWOsSHHKhw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73eb82a-3cf7-42c8-5a1e-08def466af1b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:31:39.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFO71JDCaF9l3G3A8WILfkL9F/Dvy7p76311d7BRYe6pIoQmLlqG+BVs5oSnCFkocHfYlALJvmKDW3fR4Z1zLlgwaAhdwP96e3WHtzWS0vM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX6cDulqWbqIol
 0yNuHst9MxZKLJFBY7tGekp42aQ7EWb5mPwT/9HwHvhXUs+ZhppwZP1lbej8SRJ7Eefan/Jya6h
 Syb2I1Vphw7BzwUZ13wuC+qSAhPLRYJ7REVHxyvrYDNw3BpnA0krv8rVah5s+GJhPFNnRsWFg5S
 8xHIRIunaIMzt34i5Sc78PbgcLau+XeceQz4oMNygnwgeC6p7W4s/h3mc5s68sezRZwFd+mSJZJ
 MxWwN0YoGT2qcC1ev+MIwyda7NyUZHE2KhzrpWjtRRwLTl7ukYa/E4sD/cpCoeoO7+huRpEqfqG
 eRAsN317jy/OqbhedtEwwumZoAQknQFxmOiCiNcEkLidZcFNH15Dx8qOjjSsLu1a+bFCYSdVNbl
 /IBtF0kmxkQexfQNlBVvEExU9j/rGikGo2EjOsC7tL7ayOpHYAmRMR5ujuYSG80d2SATahvrJH9
 kPkA+1MzUGhxIx4sJFg==
X-Authority-Analysis: v=2.4 cv=G7ks1dk5 c=1 sm=1 tr=0 ts=6a75a5fd cx=c_pps
 a=dAhe3p+MvHJ8ujFi5nYcpA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=vbqt8YWObaADYMrP3jIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: c0tQqVE2ffgRlV27auodv0ADf-7-6O03
X-Proofpoint-GUID: c0tQqVE2ffgRlV27auodv0ADf-7-6O03
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX59bMI+NsfMOL
 zOMLehWKDS8F8cV4lFMM4rlFwqnNzgBM3TS4eeihR5Ddi1q4EqnSXTNUBaEAZ2oyr+4PdNC5mxe
 92+1sKYZpvF16tRU0R0n3XMPMxd4aOZeXPVt4Opy9TOOFAkgyclm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242994

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/cases/rust.py | 37 ++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..4802a714ab 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -7,6 +7,10 @@
 import os
 import shutil
 import unittest
+import json
+import subprocess
+import re
+
 
 from oeqa.sdk.case import OESDKTestCase
 
@@ -32,8 +36,39 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
-        self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+        result_env = self._run("echo $RUST_TARGET_SYS_VALUE")
+        rust_target_sys = result_env.strip()
+        result = self._run(
+            "cd %s/hello; cargo build --message-format=json-render-diagnostics"
+            % self.tc.sdk_dir
+        )
+
+        executable_path = None
+        for line in result.splitlines():
+            try:
+                msg = json.loads(line)
+            except json.JSONDecodeError:
+                continue
+
+            # Cargo emits multiple JSON messages; we want the executable
+            if isinstance(msg, dict) and msg.get("executable"):
+                executable_path = msg["executable"]
+
+        parts = executable_path.split(os.sep)
+        target_index = parts.index("target")
+        path_component = parts[target_index + 1]
+        if path_component in ("debug", "release"):
+            file_output = subprocess.check_output(["file", executable_path]).decode().strip()
+            match = re.search(r"/sysroots/([^/]+)/lib/", file_output)
+            target_triple = match.group(1) if match else None
+        else:
+            target_triple = path_component
 
+        self.assertTrue(
+            rust_target_sys == target_triple,
+            f"Cargo built natively for the nativesdk host instead of '{rust_target_sys}.\n"
+            f"Cargo build needs to build for target by default not nativesdk_host"
+        )
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
 
-- 
2.51.0


