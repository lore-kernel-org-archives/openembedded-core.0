Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.51])
 by mx.groups.io with SMTP id smtpd.web08.4747.1618960409226079870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 16:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D5qSrkpx;
 spf=pass (domain: windriver.com, ip: 40.107.94.51, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8SfdnG7EAPWwZ3ZId6kY9lZczn1pGfbADlDcpWQOXfyCkKsZuaJPx3MOkhB4Cs/dFz/MV2dufs/zJAXrZOC715gKfRNsvb69Ranz5OBSv/9DgfDSVSdGjVA2ocJE8Y9swrPY099VLrucKfVPJdQbV6JwuLc3awjdl4qPsldSBzopuTss37XjBBKcyn3Vcd9gSFiLJtEITesl6U+IZ2PnuWSXz5uM0uhDtWrS40/f3mzKVh/12NuZU+xUFBaAJs8JoZy8gRRTPmZ8GFZ0lMP4jWVMij8pUcNg+1TbEXNnEBaM5ZO67q8NwOcW5XsB20n20+93ZURklKH/gwdWQLgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnYVfhSJ3AfC+wGr5m63lQ6YVHzCWKe/rQW1NdPC9Wg=;
 b=WMoFsar+7vwwRWUR16KEbDcfiA5E8+kLs1eFkf9X9wdz/unPKq+cxGX20Ub8y4RhvzI/2rMtjecVU8cAdbXan54KFRdI7tFEzKHt/RLFkmXQZ31scSqdMBpYIu7eaz26eeZeCpkfXYOoS9417vFzFEtn96In/WViQPRhbKQeMVhOBp9v+tvkBvOD1FRfrc2BO0okPQLDg1tzZHQRxiEifazdLehOyRJg/6itdXx6d/IcujV9ZeCFMEwVU/mn6nM0iujegmhfWc1M8dtpp70LMehVszyYU0e1w1LmGpDFIGTijZZy95L+bQpLpO2fhoTEnsVoNSZsoqkVoVazsz+cXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnYVfhSJ3AfC+wGr5m63lQ6YVHzCWKe/rQW1NdPC9Wg=;
 b=D5qSrkpx7bym0z3VdBSzwSbocQWd0GWZ4H+iuw50PHap86xFWI6/GaRFawGRwqC8a/R94CtA4ROZrcfeq671ZzAuZJmmvInGihG7d129WNAH3DiI4j2LqzlnW9MxlBJhYgMBwvrPjmXK+6/NwtB+m9Pmp/U8nABhrVtPGM8wFrM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2992.namprd11.prod.outlook.com (2603:10b6:805:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 20 Apr
 2021 23:13:27 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4065.021; Tue, 20 Apr 2021
 23:13:27 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Subject: [oe-core][PATCH v2] valgrind: Enable drd/tests/bar_bad* ptest
Date: Tue, 20 Apr 2021 16:13:15 -0700
Message-Id: <20210420231315.71365-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1677B3746EF02D76.1355@lists.openembedded.org>
References: <1677B3746EF02D76.1355@lists.openembedded.org>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend Transport; Tue, 20 Apr 2021 23:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58c88da0-4506-48f4-d801-08d90451e74b
X-MS-TrafficTypeDiagnostic: SN6PR11MB2992:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB299284EB3A922FAADE32910780489@SN6PR11MB2992.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ym3i+hZ8JCd39SANzMgDiFcIyxDaURJXz32ch/wLDhp6OBWum+CK890k5jJi+o5ei1sAWQFzvRdxagk621q8i5xU9FHNBhF6mCQf0a9CmW+6hyj60ejdt/6BxItbiVg0PLBnc0b0OBvREj8Zvcm+xWINk7MWzM81KJrv6IQuPOa+sbX8LngM94xC9LLvOG4ZRffsEQWmyAPhkp23h+Hb84unp0U/4vICtSZjlWR/ndW3mIbWJXORJFJg73OCiIOdQGdAZDL1hmTsmA5us2+F+XYgBNifD9i0O4O2JN8VuO1USZMbUUfny5Bb8rpf4+uqpZJsKMjNURXrQHKF19qtKzWkGVFA47gsP+xaTYpG6vk4CL0bT3akJ1mfqUrlNlueqN2GYMBVgtpXece57oe8X5AJm8yP4QUOizeSKybF82uLmX0dgvKRvTYfBKDD9eDJyAMdrSvqPOIkhk17T+GjfPoBI13s1McZhRqF0oy/c/SPeYQRpP2kZphMIBYEQ7HkMUzoOa3u0GpKZZ8sAaGvYnAa0YMeSf1DtRME+DSwFKJhmKb58B2Dz/+MBuyL3quqpgwIx6cqGNLlPrYo64ODqdCHTZcExyVJe8teMPmT2AFAS0GuR3YfKMnnTHxruipIRaffGT2HhEkqWVjPGxSuFmX4NkNbhzBFk4UilKJrRrPCshhD3dUAzb0rY4DCRA48Hyk8hKCzJ/ZEACT9kdJSdehFF7ybUFShJhVp1rOD+s8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(16526019)(5660300002)(2616005)(38100700002)(316002)(52116002)(66476007)(83380400001)(966005)(8936002)(66946007)(38350700002)(26005)(8676002)(36756003)(66556008)(6666004)(956004)(6512007)(6506007)(6486002)(1076003)(478600001)(86362001)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?VlPg3iJ8hgzNMrLIpcuxea+zx/CXYz2BuUzILCakjqqwPltEwfmpbKUH3yj2?=
 =?us-ascii?Q?0MtOoegAUxFVXLfUWG17T+bUnefxDfqJORoqsjdSenxLX7ZIw7iM7Ycp9mFF?=
 =?us-ascii?Q?ewvv24WgBZqNhLiS5sttve6kwZ2ajUmqAMq8vDYbcjuhGb9HjiQGQp4N+cZB?=
 =?us-ascii?Q?FpOWqUGLSkt45rGG6EfktvL/otsMTSYPSsoQNMXH2Qy2ZJhaPyq3s4Bhn7aC?=
 =?us-ascii?Q?Unku2ARLPfnd6SWZdLvzMDkZnoo+if5Mwqc4AMUBXXeBQosjiQEKkOCxP2K7?=
 =?us-ascii?Q?EJKJ6UiMyVtGAcw+HK8lVEAv9+LM2HzJ5ZsyiA5oRP45glhg8de+EBFVSUYu?=
 =?us-ascii?Q?3TprX2mZ82jIbDy0t4GL3VNVCn6cDbE5t6cV26yXEDGKql5HbAZfagTOVI8z?=
 =?us-ascii?Q?CTUFLa0nDhPTx6IU5taaUEpGug5a8GBFkbK7AU5KQeT9Nv+pDrzk9yRUKnQZ?=
 =?us-ascii?Q?1nlum1pezu/zLjLjMmZnNv9632/CS5+z0xLbNwORXpy136o6wbZ6iUulmb0U?=
 =?us-ascii?Q?CPb6mEyvKQHZScv66eoOHfzuBFlKF5fvCsag748EHNtI35eN4M6aa5g5s5yO?=
 =?us-ascii?Q?deduMllnAy/CtKPzV6CgdS2RkW6/9Uw5rgPzkDDdbp2cN5obnfAGet1ZgeVd?=
 =?us-ascii?Q?SVEA+cl0yF2YqHzYBb0ylY0tmuCy9pIqoi+rURLDfGLAYY4f6Hgjo55PDE5/?=
 =?us-ascii?Q?6EcEXKaFH9CJAejNhNVTxwAZq2Ug8ZJVCVoVlT9y6fb1waoVbm7vlYODj3Ab?=
 =?us-ascii?Q?aO8CMh789twqx9ZupO92By5AAsLOGPcQUQX8RPQW+TrVkpg9EPtQv9J7TL+c?=
 =?us-ascii?Q?tJtxxGwrfhpf4ews62smuz0XRTmDdwC4m74X7IoIlOgi6R2whY0r05IWa9xA?=
 =?us-ascii?Q?SFTOHTwYsek2Tu6ZgcDUf0mHnfDVOAekrL9yoDeVnWzMkss+vhEdEvvLrzvL?=
 =?us-ascii?Q?6tZh2G2PIhaZy9Xa8mKKPIadhoU4RHNAr6A+1ZH8X3Y2A6cinBHqLfoSA/Qq?=
 =?us-ascii?Q?A6aqKPHrJygwRAX/s6a380xq1kakK14pzkBHGFJ4TEDD5jK8GwLNedjTYram?=
 =?us-ascii?Q?iUF/Wwo4RG9uhu/2yGmqQMeHhbryH7NG4NTDgiqh2qoJzkMUAwvT1QgJR1zo?=
 =?us-ascii?Q?CZKm6JRBTZO+al2KB2aDL4ZmGq3jCgQemrTYcByB3/Q/ZaZYqBQpARhvIU8r?=
 =?us-ascii?Q?XSBAxFfM47iP0ja8Fqrv50ffUUelw3M4hnj0UekAWXmFJ4P+0UC6wTx8fMDN?=
 =?us-ascii?Q?Zp72AxVe8a1gKbVgLQXVXlwZNdGnvNa6Q9b6ws8AjCIOzX8zkJdxFHdVgzLZ?=
 =?us-ascii?Q?mC8kXZESnMMw7r89z0EuRLAZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c88da0-4506-48f4-d801-08d90451e74b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 23:13:27.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr9nnfb5nkq5AzK7HUWNqfUIV7ExQQIdGxZ8mauo6z1i4zmjkn/obpfNzU8WnBQUkzME9rSLRcgexA8d0gpHFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2992
Content-Type: text/plain

Revert some of 7f7d2fa18267090891754d976cbc3e628324d3dd

Was not able to reproduce the reported non-deterministic failure.
(ran 20 times on qemux86-64 on a relatively isolated machine)
it might be related to the AB-INT issues,
but it seems to only affect ARM builders now.

Also no action taken by upstream valgrind to fix
https://bugs.kde.org/show_bug.cgi?id=430321

Let it run on AB to see if failure was fixed by uprev to 3.17.0.
if not, we can gather more data from the AB failure.

[YOCTO #14051]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 v2: s/deterministic/non-deterministic
     add Alex to thread

 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 ++
 meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 93bfd45a4e..a3a0c6e50f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -31,6 +31,8 @@ drd/tests/annotate_static
 drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index d6a85c4735..e69de29bb2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,2 +0,0 @@
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
-- 
2.17.1

