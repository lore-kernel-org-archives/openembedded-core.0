Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7BDCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 11:44:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.163601.1712749494481590706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 04:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fJBIWpsJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48306d77e1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43ABAsxd021597
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=qYPymG48wXdlMS41UT
	7+Tzet+AHOMBBPA07W6DdptXM=; b=fJBIWpsJkJbjk4FRXlJPVOJaQHcvGlAA3Y
	6JFizmeVwFBkdGEVsZYzvhv6ARoGw6j4dQqk0CJWJVzFIEjDCeVCu8cra1KUicxH
	BJp0AWONO0D6iHLOXvbGxcg6ns1jEvNL5eEwJZDCnM1f0dY+iJVgqt5fBJrsZPLr
	9JLKITmN2ehdbcgfTnQ1oD0TBFYxJuAtRfZArwELZBD2a5yM+/boRd+fZlUvLJIs
	/lPUZ1RAt1MtBfdCIjJoY3cBg910F4tOUWx9fnO1vS5GqrE3YTjvRd6uci8LCvt6
	RYG9iBRH52q5hhR8//o/F/wRgfblP7bm2SUjHVyk66iNmx3HL+Dg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6mfv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:44:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuQO3+HGIETxNdeD2MTtCHqoBcuIep05ayay0mnKvRFojZij1KxTlx4AYC2O5mg3A2IwxprweGg4p8Bb1jK12ilwHO9Yr/ACKQdfgG5j0EPzz9N1dVw6wZzjJTK+0AsmAvwLboIfFn9O7COC1jqa5xo0qLJgN3HeSlhxq4mnp11oiZV76G+y/wl3hQeAtTvyeGlAas+CWcrt6exaoAqeGtpMZ3RH9Pv3P4AZLVBvH8mu2NFoatd4PCyMlKj6Ki/X3+EcPQMAzGjtNWcGCb4mBATtYkIjmcH2nTlNGAj6enGxhn8sPIRiWG6sLEoaHjQ+olTzF7nkeo4PRk6KoHKdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYPymG48wXdlMS41UT7+Tzet+AHOMBBPA07W6DdptXM=;
 b=Lim++Cv91ruTukD2mY5Yrf8duKbceEpnsfHWKaHrNIPjW9z67v+lNqugmHHnUFtVJHc8PP51zNi3fbjwUfUKCCvPeIu9wcgCBJviZZ9fnDs8d/OaWHf7oo58Q3h2DJOHlGsBlv3ViGA9QS7wPeLqtjpItTPFC89VsLdDWsE+9x1zJ2tAbxUy5f/+fYVFDwdkOLkmOpFBAkEsBlveixezNpWu9ewgjt3c1NPEyJZCrM4wW5lXalRlpZOyEK/3tLHUxoWydGxyYY67/vQsvblfmYaCTW3W3OsHRKPrJsnb/fSJixUKnrUIsHa/Wauznyf/Apn/qVyYVmzXREMcD6nEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 11:44:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 11:44:47 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH] rust: set CVE_STATUS for CVE-2024-24576
Date: Wed, 10 Apr 2024 04:43:31 -0700
Message-ID: <20240410114331.3876662-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB8573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6UBP0nBAxDJlXtHEcWvkYi9KVemQZCsXjM6Xgj0JBD7+Ghj5YkvY4FxZyUkKaldD+wUNR9l9UP9px+9ORhTKJT0ScJ523A3EBELw/Kg5WqjI91GhqZyiaMLr6+6nzUa7THZFLLOLFC9EwFRzEPClcMryijQOFkPYsrCMsQa7jjgAoCvDsvktaW6RL3aJ4jO34LwyQG38egXix0On+pZA3brbOKKPqYVUrbbu3HBHQnDNXBc8MZARpEtoB/sB42IiUa0yXg5PCDgO/jj0R2sXnn3ZkMsuJfdHrERH2/R9149rsMXe7FKPQRYxFdwkpvU9rP7/mRDdfrFQq+VxcocI2lC1vpuCHhD8bHzsqfvNPh12kf0bnhvoUjIPb5QWHepcSW83DTOrMkitoktkFEpM3yJaSbnH7Mg1izo5Jpbfa0uEH0EFB+/Z1y5PGrKoCP2dRgWTAj9xKT1fssZljlef/OZOiQbt4+wm0LQqL00FPO2C80eawCJCS0ko4cbJCw9jQz2MmqexDkXIxwZybEWH4rSApZHRIfq925Mn59bhU1a7FPPhytql0NZZ0j5D39M5ZHhYkfXso3+LcUsNmeyjCXf9FicVo8S5sb1vcC1lcPtRJktracj4x2dDjG+4Q0E4buqN3b+Y7Z3kzUUSuCvqGNhlT7FSsik6msdNppYZegc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JLoeH3eAptGEGb/Dvtz7186Ewb3u7z/DF3943u+vYdwN4akg26V6ppP+Dbnc?=
 =?us-ascii?Q?y88C5Ri1komx1XsEOkiHVSlYmFCYLx7LhYk8OJVcuQRxB+mWW9TMIY7zQisK?=
 =?us-ascii?Q?ENEcc9ZIi4wrg5iBCesUOdGWSx70xR0F7zLOriv6cCNH2oGVCsQNe1hgT+Ae?=
 =?us-ascii?Q?7UjYTp6UbjIbppulY86q1iwcbWDLR6+WBDMruQErCOQ4QWBUf4UReWavnJh8?=
 =?us-ascii?Q?LUL1mRvDynJ0FhK5ZlEFSvCCu8www1T0NP3a/v5pFEMy5xAviiiisFTYyOd0?=
 =?us-ascii?Q?P1lWg18U+4fm0TW7fs0I0fr18ToOfGuuerBB9QDYJ9BmL6SgbZ9o+6EAg6Ln?=
 =?us-ascii?Q?bL7k9RFbkhJq3edfCOeW2wk2er/mf34r4iwcnXuSR7W2OpPtQyw6L1jfWCiK?=
 =?us-ascii?Q?lTy8br+mhDYtsXCPjZuM1dZSBuc8FMh1dNK9XmOUcraXhXhCORn2CvzaEh12?=
 =?us-ascii?Q?mGcVJLphciaMaJtn22I6Gaw+SXe+6Y761CYIMZofkeRKAcX24ijGs3R72J+7?=
 =?us-ascii?Q?1jkE8RZ8bgjQsyoT6aydAM65uE0o5u89bNy/sOqYS8h9iJWP9QsrL++yKCKf?=
 =?us-ascii?Q?TnRFCGyPSix8dS55J0O0skCJKj8e/Ga293GpXgIfgc5/taRWdBlsZKvK86Gs?=
 =?us-ascii?Q?CyDJ4PKDSMT4reRpXpKDvSFeeVxhQySYBDIEqQd1ktK6JGhH2QDxFi3IYx2Y?=
 =?us-ascii?Q?S8YhwSZKw94L/bmmGOStmAjAVNtBb8cu/xRkXD1NiE1nwjFkqClbuas72V7Y?=
 =?us-ascii?Q?miP9ViekBeBmd16lGNIDVI2HJe074IAZYlKxQ2tYpPC5n23MVPBIZ+kWeP3u?=
 =?us-ascii?Q?0lOyKuUaidVJY26xoXMGBhXArXCE8VTD/GnTXIADJcvbC7Xxll92kAp1z3s0?=
 =?us-ascii?Q?CYM8pOulDrhEYnx/nW+Lv4kzj35BDL3Rmu3unbBKksiu2+ahl8E8iGhJi4bz?=
 =?us-ascii?Q?h7hF+QnZ0F34rTKV0vnZ98PNnyhOdiSww6WJod2IWPomRKPZ7aCNQvd0tesN?=
 =?us-ascii?Q?uAjc7XDCbyggzpH12uFykZMD35yyJYB2Qvn+LeFMGpw8PXZkW0vTy+8YnLqs?=
 =?us-ascii?Q?IIK+afk3HG8kkl12eHGVFMlIoj7kxuRAmyMwmRWl5+Zkiti6Q0TRgfZwgt5F?=
 =?us-ascii?Q?wbKl2RmHfC83hL7KfJfNFgDEcIquQ7AlhS4SNtR4BQiSQRKKfGpBsN1VhEQP?=
 =?us-ascii?Q?tPw9m4RZl1JxhYgbfLMXO3SaQLzgxj5EeXXfj7ijFbRRwl3pGDelKbo8qW+X?=
 =?us-ascii?Q?ofBa8JzJJkiN+wUY8QJYWj5QZE/qInA9HZnQ3Y4izBHFSIoMZBMmsOVYSO7p?=
 =?us-ascii?Q?J3YdPuMjukJ4GjSRr7hogOgdQVZHHGHVza4YMrCWItLfRMwyYWLNGlDvDdSl?=
 =?us-ascii?Q?BZVu1ng8vh3eb1gAVurzXGKHOk7j4EMoLvLoRaSNZ1OE9kj2hWazT4fM7fQC?=
 =?us-ascii?Q?HAjjp5a8MEkchetVR9qEYooYwdhZRkj/nQdMaXEw1wJJHRXNwwfK5ciqa8Fu?=
 =?us-ascii?Q?jfGgPJbvITZr2BriSc/Tm9jselQjp3EwE/FYQjdY+6Wn+BAnQgePHuqwBr6Z?=
 =?us-ascii?Q?CFWxt/8sUH3t8m6PlyhA7gl6eWANiPFm+YgejsNzTkt+S4EVKhxztxzktPUF?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad22ae3-3297-42a6-d782-08dc59539fa7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 11:44:47.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiil1LEmW28zPorErMXPb24HbqtwyzRamsq5UcPagRdYYiZNBe48sYN2Hfp3QKfBd2bDFONiA7DEwdxbiMwHxbPAGFiAG6Hr08GdRkJTxjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-Proofpoint-GUID: yw5By0AQIcoSWfiXHj4cJEBoW7YHVAEy
X-Proofpoint-ORIG-GUID: yw5By0AQIcoSWfiXHj4cJEBoW7YHVAEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=689 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198090

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2024-24576 only applies when invoking batch files (with the `bat` and `cmd` extensions) on Windows & No other platform or use is affected.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2024-24576

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 6bef99039d..b14221b6cb 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -20,3 +20,5 @@ RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.43.0


