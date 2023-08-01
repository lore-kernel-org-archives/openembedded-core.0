Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE02C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 12:48:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11894.1690894099868180365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 05:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=andBrfVf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757716bf71=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 371B1rLa031292
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 12:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=NL0iIShctJvahuKYtN6WTs7bb57l+W/rihtngHG2blA=; b=
	andBrfVfaIxa58hVcl+7gJecPLDHjm243pT8rPgdsB2Xv0KSAOAo0q2kRKJDDxic
	+QT4nVZBP9TlREohhaFHxRYw/hthVgHGjdShyKsqak1G0V1eYiAAFyb7Svn94xXc
	7+RuY8xqYmPFuqT7S4C69Q7hOFinI6XkXK3vv3YAID961F5MTjCrm61YtavKa4uQ
	AZVK0NGDj9XmgeDLnU7zZZaiZmSzQlTSMDpZs9TgPTl07V0xHmASjuOUbLo391uZ
	uquWhlK7MCBhYns7EeEJYy0Trku4lRsia5n1Xhwo/AtR5cUzxWhNLcCcXdI+Ag88
	khejsKgqczT/h4JgbNIK/Q==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr62qba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 12:48:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myZDcbGJtiHZSHM+/InccWau0t6lhQeab/wib5BGaNQkaDITgQR9s0jg1kO4Bocv7wtK1gPrOwSsAIEyYlnnM1SSy13aZrR6RspOuIQRfP31bxuoSNhqZcn4+ARcgbQy9cbHUbMB8s15vJGvYgk+JdIH9b5D38l07xSdtVIihoiyyK5QkpJkYYvr/p7qvf5ELZLFWTdNMPKJtDGRZJRuwNKr3Teu2sDgkxlLU4KEofGzJCyhs4D22UMpE49GFCC6zc8JOWGedmEyljGJgsTdSEizOsC+Ds+7EYnlziLQHkRduv8HpiPxJ+WhCsKRgFhkIP/grWDEbrLRaYasAaEPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL0iIShctJvahuKYtN6WTs7bb57l+W/rihtngHG2blA=;
 b=UG2V4+h9PnZ0wtg41BkAdKS5lk2INzKePYy0xoGicAeMDqVedbLcSivrYV+kbGTLFGHRiBL2JX0wrMje8QP31KFrewBxCqDe5vbJetPnPIHlx8yK16pelUnfC9et2XgrDynxG7EcovYAudfOBKjSRqg5vpkKg0nIi+RrcpDwaYVy++sqORETyiUrVncPE0GMWkbRXfBJ4DiEYqPmGM9PLhiJqEbnqVtj3vYGScxJdyKiUlb5NZLBhyWf+CMorKEXyaINuyuRt4a/GoiGK7EJ5yQNCojYzMhQVt3JBnyxxLTrlCjpF2W9u4hBa8YnDN8mkqj6pEqEjcANDXpYBIe8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:48:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:48:16 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 3/3] oeqa/selftest/glibc: Add elapsed time for glibc test report.
Date: Tue,  1 Aug 2023 05:47:16 -0700
Message-Id: <20230801124716.3472253-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230801124716.3472253-1-Yash.Shinde@windriver.com>
References: <20230801124716.3472253-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 771a846a-d0fb-483a-31db-08db928d9393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8poQXTA4GW5jktUw7enuslOBsn+Bh9DJ9Xutn9p2G6PCO28X//WuefV8Sforg5OCriwR+TTevIrM+zIEg6xmvmEB7hP+ywdIfJLGQYJH6D73MWtQzZeo+eSj7oGUd9IJ85yrd/rw9/TJnY+1d3M79LmWkVf7I+yhGXiQTu65LXJb/iQLInFuYzuJKmSV12LzsiDqOxbLsUtJDdsQLtp60xVhwb48IBFdqip1xsmh6wjDlpPfEgWzeX1gi+YgR1cPTRaxyruMrO7XRT+Ek9mc9+LLRw/qcrsyvYZTIsRd3/BK0GUEapbNI3SXl+GRYRmMPsR/ml/uvdb5FVOBQ0DGgW6IF2lFnCIIIneGEReRsN2aWMfnLW9+Y8hoaDp+6aYXMnQynTNexEaY1RV+qjtDn1CWdUczELi2qj6+xB+au557Hrkt2ni0sC1nmK26q4Tkcl3j7rCl/AHeJa9qY1MRWytSPQmf/MRGZhsYle1gmq9pM7aOkbgBtrhoCzlRd7eNeaE7czLYWwEcyeZvjrU/MiEkA2vUM4PdtMewSrlRMeOieatFTBT4kD3N9xAJ0hLdeuqPeLoIly8a3Ah734EBX1xw0F0Pqi9Tah6Qvuw7Pn6s0uI7646zbXcxu1thC1+Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(107886003)(6916009)(4326008)(2616005)(83380400001)(186003)(86362001)(316002)(478600001)(41300700001)(38350700002)(38100700002)(6512007)(5660300002)(66556008)(66476007)(66946007)(6506007)(1076003)(26005)(8676002)(8936002)(36756003)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7sseUohQwb8mSHcpI6m1Mcgb7nGfb7nBHIj4QHdQhjl5vwHp5p9+Q7opuRsT?=
 =?us-ascii?Q?ux9yU6L9FYDDwap2Juhvyv+iJIs8Z54DEVZUFpzYH09iat2Vb/j6U/ghzYSC?=
 =?us-ascii?Q?60u328AXqhAUnOmN/ktHaswFFEXude+56PEJM7/mnBPUDUHfPMTNOWFdAN/2?=
 =?us-ascii?Q?8pn5B+tXP5dLDYFyimntoXoBdECf5ymCJ7ucJogOiVKm4UhnwPWnTiA3/R1j?=
 =?us-ascii?Q?J57nG3FsNhU+HzaLA6KsgjHF24bg6fH0qqkFdo+FhDM0aOS/Hxn2/4waDS+G?=
 =?us-ascii?Q?BiSRxuGv2XPP0X4U52B6lUOWWEELN50/Yb3u7JWT32D7g4on4vAp9L/E79JX?=
 =?us-ascii?Q?Fv6zRbtryOOT75ydo2iMtV/eX/29W6P3xyiSz+SP8xasBQ9dLvFvtmf/Mhtn?=
 =?us-ascii?Q?YxGMUiBIRbYKl3j3i2t90BumEwjY9nv75GtQgJ0EynVbUcH1frs6hqh3eceM?=
 =?us-ascii?Q?CXJHZ1YPrSivvcNgtZRwdbDE6Nf+M0MlOgmXLKB0imN6lr+7ZmB5uaehR7Kf?=
 =?us-ascii?Q?rLZJFgodVIj61w+10Y97rnkfs7xlgWXgfGw1aaqiMElzbyCe4clRrold9Bjl?=
 =?us-ascii?Q?m4MfP1zXI7JsgVy/Ou3LJSXEMEyn7JES+6KMauXcuHpqxV7uFx1Er6bYuuz6?=
 =?us-ascii?Q?OXdbI3thh2syILC05ivxD05ot2/oNdwj9wPCvTd/b51ga0UhV6JJnO0m0JTR?=
 =?us-ascii?Q?fTVAOeR8sVthz7BtZYbKgQb/i5AMZWNMMLQ+SmMIQZrsqTuKj+GNyplJI6qH?=
 =?us-ascii?Q?lcAFEBJIzkX1Q45FM4Pq1379gyKnWAjMp9rB6VN3MKnhP838ySzDKc5O1N5V?=
 =?us-ascii?Q?yRCWyQhMFFniVIjlQvIbUVMJu4gVWYGz0X1D/qziZJlgiG0j8h0R8aV4MO+m?=
 =?us-ascii?Q?aCjQ22GkeP+zF/H4IQFYEU2NMYMhid/W7QSZU/sPGX1bJZjGA064s6mvHZhB?=
 =?us-ascii?Q?03rtofQchz0GVYQpPoTyzYYxpYc3y2m1h6cNw6iZHCJFQeCC6l10oUhnRjKB?=
 =?us-ascii?Q?8WVHJhmsMjod1iBFocWAlenHuVGbZmIvTdbAYTVWoVVT7aLbvhNM3dyfDxOz?=
 =?us-ascii?Q?iweccZaf9ICK5Jf/1cX8ZcH3j8e52rlv5KbovrH1uJABtQ0v++nspjWL9tja?=
 =?us-ascii?Q?QguX0bIgXAAmBj2JDQ0azGILd1TA2KKXIRt3IKAA/gQ2DTZ269r2NnY5Zxnf?=
 =?us-ascii?Q?ywKjMpIimEpSObaFyVwS9RRsfqcLoA99jeLlJnlYaEmu8NtqLKhfESW4qrGW?=
 =?us-ascii?Q?XKJmXRgCoJtgX65VbYTBx7NUeXUVi9bakKe4tomTuYViWnLmNwlS/jEU9kAa?=
 =?us-ascii?Q?gEKPhr0KR4Bjo9M28Top0GaRk+laEfFXgAid0zwh6jiq0OIzk77qa59P4sKb?=
 =?us-ascii?Q?tuAKhmNsknkDvXac2j9VMiPH9nzoDvFJeihTQePnBU9LPKNKeJpD5qGFB3qv?=
 =?us-ascii?Q?BZKNgN39aACBN2O/yjTlfSYxKBx6hNC/LogHDbeiYwNiCP+vKQr+/fq1EVRt?=
 =?us-ascii?Q?Z9uUlVwR9LVCuMPzh/7ZCwpLpu/W9KLUI9uygq5nsG18WME22Ds293wYPaNQ?=
 =?us-ascii?Q?Zrn9lQhl2ESiq8hUB+4R54XiIEsKs11bV1edPN3LJhGKS2yz8dw3tOohFhAq?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771a846a-d0fb-483a-31db-08db928d9393
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:48:16.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrVwusxSO6PvI/aKE3pTwpprS9Lzk/tCpaWZiZdJ7ZLodQIY7Q6yMSyp0jwPCwi8RsVGa2PwyrE/9DAUdfkxEYpy4B9vBai8k6OMsYAus7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
X-Proofpoint-GUID: 4KQ4xNGs7XmNLgFnnQ8NV-joeKRjIvl8
X-Proofpoint-ORIG-GUID: 4KQ4xNGs7XmNLgFnnQ8NV-joeKRjIvl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_08,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=268 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308010115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 12:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185242

Capture the time taken for glibc test execution and
pass it for inclusion in the test report.

[YOCTO #15165]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 924df6c5a6..bd56b2f6e7 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 import os
+import time
 import contextlib
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
@@ -31,12 +32,16 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
+        start_time = time.time()
+
         bitbake("glibc-testsuite -c check")
 
+        end_time = time.time()
+
         builddir = get_bb_var("B", "glibc-testsuite")
 
         ptestsuite = "glibc-user" if ssh is None else "glibc"
-        self.ptest_section(ptestsuite)
+        self.ptest_section(ptestsuite, duration = int(end_time - start_time))
         with open(os.path.join(builddir, "tests.sum"), "r",  errors='replace') as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
-- 
2.39.0


