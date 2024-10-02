Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8899BCF6D38
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 15:20:15 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.92.44.38])
 by mx.groups.io with SMTP id smtpd.web10.9998.1727882407756488695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 08:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=DSnhZDdI;
 spf=pass (domain: outlook.com, ip: 40.92.44.38, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFPmT8hKRREfN0FtmCBg6Sjol2RewmJhFH1yKZpgIe155NhW28fRGOI+t7xJVgJLQn/Y8UnbQ1rLwA70YRg946XlbU1feysQJ5qVhzGfPb+9LeTvl8nzndTrwwbZAuE0ur4LHEhAX6EtyI2epGhCyOMMPxoyGMwEw2onTsYG1uCDvw855HtbZ+m2QOr1wF86ltgVucJBUeLQmo8jd9xSZgSgBnJx+bhTwjBGrBbxJ+61N/Q9SZaRxHilW66P0bU4Vo2uY5fIuqtwDYAl5TMjyVu8pyyAyknzEiNb2iyQUlTlwsDI8sqrli2IygOAT6/uN/KrNDCaX6fMdyUrt4CoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS2MVkhKNi5vs7A7cpaXr5pK+9tqAjyD1EzNAbvQO0k=;
 b=NBJm8lizhB760nCwAVW2zFtHTJS/SvLqCPWdF7um42ZJ753KVS05ongrx+eG+YbBbQa6Wkk9DWq4+bxhAcAf/Q1tWq1swiljjDol5FjX1n7mlw6jvZ6wdxqhbQ6fYagecEXoTHjDbDILSZE3q5xJPzsiqZQg8ZE6+eQtN7tsIPx9gx/i/RcDsl76EF/nHbUMw40ezkPUzG4xjqg0iuoNIkWbkxBoVBAZXLSWm/0gOsOyzy6jZ1fYxDkjTAOAHn35v9pI8LU5HkSJEcLzBupbtsG6fW3lGcduVFBr20gNyFexmmlDYGpv/gSC57p0a/N2WUokGg+8b8GPe1zLlLa06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS2MVkhKNi5vs7A7cpaXr5pK+9tqAjyD1EzNAbvQO0k=;
 b=DSnhZDdIAQr4jHdiVqeJlEU6S3sMgmYTBajyPPUd1ZhqRAlq2lOYqDAzWtOujB+H9Zku0JFQTDs+OwGj+bk+mIfSEmrudvGUmWiWbGRK9zGx7rL+jSzdtUZMGrGC0wOScO0LT4NxLec/SdVx+J0wshuWBhR4eDOKd5OzaGBaVg2O6cVQC5Qq3xX8KbT2FIhSFlmCO7++4s8t+qdFvWSrqmbDcTD5uNDg63SRCK3or3tbRRkhf73hUwXwLswnWSMxYrb5i5ROO5qiejFrPivAtp8Xc2TAued/vl4cWTPTvRemorSs5IWdhlsiKcrFmzaZqqqETCMjCyz6LIeMImlHIQ==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by DS7P223MB1268.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:253::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:20:05 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 15:20:04 +0000
Message-ID: 
 <SA1P223MB118721766D57F49FEF9EE9A9CB702@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Wed, 2 Oct 2024 10:20:02 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
Subject: [master][RFC PATCH 1/1] buildhistory: print extra information during
 list pkg files error
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:610:59::24) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: 
 <6f3cdb1b-0915-4e54-8bfe-d8a8aa4a1eac@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|DS7P223MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 353d4fc9-6980-4ec5-612b-08dce2f5b0c1
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5072599009|19110799003|7092599003|15080799006|461199028|6090799003|8060799006|5062599005|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	PQ5Pu4XbV65r9zBUfGkEKTQ2PuEagg3RDf5CcBMlws2OCleOrVMY+vO8OE2qo4Q/AL9fu+o9r4EiNZza1zlQoIWyk+74sAMWEH8hbYjDouBnCJIrQMgQNC/M2aIB7ckfboqQde4OP3pvNBfBlKmYxbOA690ZiueaKDORg5z4GQpKocStFGpe5k4dlclyHPh9qWZoQvLkBYVZ9Qfl2mAQAwDbXPRpsRkzmiY9bqGmdP/T3+EQTJ5DKD3qRiMjdlYOdkHYF/WZDLKQNvOKOiQ9tfbdnlez6yK2NXdQXipTtSKaYWe5qoOOBoiG9vr9KBqDD9hznYB+SnMAA0ju0MKyOLC15GskFiQMiXO4tedVkng1pMzYuf1i/jANUTm+0cwrT9o/KIjWeXwvS94Xb0PaBai8T1dv+7XCToCLARsdrMxQnCb90Vmfzz68JQO6wTDAZk3Qk71ptb6y3lppyBEz/jMFoAk2Qhu+dp72vxpUtWxJF+PbAq4s80wXcOEW5u2gLjlmWE6hjEG/vsQ9J0GVZJPSCulTS2IOf48w5y9uLbPhcxPM3b64BwOZAyj78IoHKsXB0FgjOd6imUwZ04D1V2+CBnRYftAwaHto0rpf/k5Z5r2O98TJrzYDSBlL75/aVfsm99FlypipvKOVeWx6oQbIq+caCU88b47Dhn3hh+LnKLEGHuivOV38itvxa+KbcoFjHJjXpPkWrPh/Ljh4kwx1J9Z5xCw3JVhg7ZVDH5dBsOce46UQVcpjJqOwBhpW14eDIVQK2zt5oEYmKm/+XkZqeXtRtaPWdB17pCqXZA8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWoreXVYeS9mYjQ3ZGhoKzdTSjZzRitaT1pmdFNibmVWdDZseHh5WTBzS01n?=
 =?utf-8?B?NmJhK25xQjFiUDU5ZUlyK2VycGYrQmdmdE4vLzhEQnJmUkhmQmtGVUxDbzli?=
 =?utf-8?B?SWphRTNtQVc4TjJiN20ya0NPNjhGS2Z6REduQnVMbFVuYVQwd1l0Mm8wazNy?=
 =?utf-8?B?cGtVRWVDWCtZMFFJR3pvM1JIcTgwdHRWLzkxaDk2c3hDMHdlM1VjUGVEMWJO?=
 =?utf-8?B?Zk02SXM2RFlOSjUyUitGSThIeEVva2FrQUdSREM0aDlXSWZNcExGb2UzNHFj?=
 =?utf-8?B?eGRqVFVha0M1L3RoZEZSQUl0UXBIOHhuTDZnaUZwalJHMS90dG1mNDloMU5R?=
 =?utf-8?B?UER3K0paNm95WW1kNnkwZXlvTHo3K0Z5ZzhrWlUxb3ZGWm1yS3dBUHlXZFhk?=
 =?utf-8?B?dnFkZG9XUmNNRnpNUGZFOFVhRk45dHhuQ2VvQzZPVDJuQTVhN1g0eHhPSm5H?=
 =?utf-8?B?T3lyRkhzbVpzQTcrZkZLNXRGeGNGeEl5bTd1VUdQTjdyNEJMWnprVDJEWGVo?=
 =?utf-8?B?eURmYWhINUxkMkZuenJUdGRYVnhHVU05RStEcVRVcGV4Q0xoWG9rd2p3cjY4?=
 =?utf-8?B?eHBpWjN3WmxXdlZNcmFVK1NMbGJnQkRuZEJtbnB4eXVtemhDSitwVDVOcnJP?=
 =?utf-8?B?djNvUGkzblNhRDlxbjUyNVQydmlkMDdlc0JaalM5bUVac0xmU3lvdm0rUHRy?=
 =?utf-8?B?VDFCdWNWK3hJeW85YnovVVZPQUllQlM3VFE2elY1RDZIaHdKQUh3NUMyUWtr?=
 =?utf-8?B?Wk8rKzB1aGhEZzNoZmk2MzdZQW1MNGxrS0UvQ3FoN21kWW96SkpvK3BNZXV5?=
 =?utf-8?B?NTkxeVVyVE5wdG4rOEZCRmI2c2lHM0tHRnUvWjkyTW9leDA5Um9obCtVaFZ4?=
 =?utf-8?B?cUlIM29yVllLOWhwZUpvQ1JPSVd5YTNseDR2Y2dHVWk1S3FhRjJ1K214TzFQ?=
 =?utf-8?B?UjU2VlVlc2NCQmdQTlFVUDBKTkRLYW9sV3RrVXhQM3hKTE1yZnF3Z0thU3hh?=
 =?utf-8?B?VnpJZ1ovZlJmVDdncHU1di8remlGeExudjM1WHhJSU4rOHdidkNsTXJVc0FG?=
 =?utf-8?B?eC9EMGZrTjhEL1d4QXhQVDFSRFZ1S3R3T05KQjhsOU9tcnEvSXo5UkhCakhz?=
 =?utf-8?B?b2J1L3IyZkgrZWFHK0NtanJmcVJDb2ZRUjRSN2FFZ3lPQ3l1cG5HaFA5a0FL?=
 =?utf-8?B?NHdmcXlQdGZkM29ua0Z6VTF1WGZFMXU5Rjhpcnk4cGg5NVVoTC9lb3BSTXFo?=
 =?utf-8?B?c3FBcXhGYUJFaTlRdWxxMzhSYkNPazBGQkswV0lxYStncHFNVHFvZFFSTzJm?=
 =?utf-8?B?N2x3OERBZGNFRkpLQjFuRGYzRnQyNk9JL2hRUzFmTzB3VXRraTNMZ0piY29S?=
 =?utf-8?B?bVBZNGtpMVNBRDQrUFNiNkM3MG1QcitTSzd0S0ZCT3BjQUxqbTVCbXZzZkJU?=
 =?utf-8?B?Qkxkcmc1VGhvbUxhcHczWGx6a0VxcStQSVI3Ui9uQmVVTGp1KzBDemtDb051?=
 =?utf-8?B?Q1F1TCtaQVJrQ2lkaitrc3FJZnFMTXBudU9GWlh1MHVoS1pBUUFEQ1U4UUJq?=
 =?utf-8?B?cERjNmQ3K0FlOGZyU254ZC82S1RZOUJvamVyd04xbGNEUUJWSWQrMnRCb2pT?=
 =?utf-8?B?bUFqVG8vcUN1K1NNTkRiWk5EZHdCVEZGbm1hMFVlUzJSMWFoRjdhaHYrMzFV?=
 =?utf-8?Q?MYcBWnS5LK8Dc8E4rDpx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353d4fc9-6980-4ec5-612b-08dce2f5b0c1
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:20:04.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7P223MB1268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205202

Printing a useful error message while failing should help users understand why
we fail with this error. As the current error message doesn't directly link to
needing to inherit nopackages.

Previous error message:
| DEBUG: Executing shell function buildhistory_list_pkg_files
| find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function buildhistory_emit_pkghistory finished

New error message:
| ERROR: meta-toolchain-1.0-r0 do_package: meta-toolchain: ../meta-toolchain/1.0/packages-split is empty.
| ERROR: meta-toolchain-1.0-r0 do_package: Possible reasons:
| ERROR: meta-toolchain-1.0-r0 do_package: 1. Recipe doesn't install any files. Inherit nopackages to fix.
| ERROR: meta-toolchain-1.0-r0 do_package: 2. do_packagedata task wasn't executed.
| ERROR: meta-toolchain-1.0-r0 do_package: Execution of '../meta-toolchain/1.0/temp/run.buildhistory_list_pkg_files.1003324' failed with exit code 1

Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
---
 meta/classes/buildhistory.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ce3abaa69d..0e9d5464af 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -621,7 +621,13 @@ buildhistory_list_pkg_files() {
 	fi
 
 	# Create individual files-in-package for each recipe's package
-	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
+	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d || true)
+	if [ -z "${pkgdirlist}" ]; then
+		bberror "${PN}: ${PKGDEST} is empty."
+		bberror "Possible reasons:"
+		bberror "1. Recipe doesn't install any files. Inherit nopackages to fix."
+		bbfatal "2. do_packagedata task wasn't executed."
+	fi
 	for pkgdir in $pkgdirlist; do
 		pkgname=$(basename $pkgdir)
 		outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
-- 
2.34.1


