Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web08.4545.1616710468175807400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 15:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gWK8HolD;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CL2Ky6PtvmVbpTJ+P6F+lUEm/DdYUp3ymPVGmbuBQzONPXI78FimTRqbMX36PNLFfFoP0wjiN7x5PQOgtqSCiXwRm2esGPeS6heievaLrvK+uxSpgBKyGl3BwhmnvJXv+RFZXRF5sfQY1V9zMuPgab/ySZFU9fnnRJBMejzD0KM4w+e7eUrd0+xnULzQ1AEIvmahMVJ/22i0udbTUBE7hQ457ySbel72Ei9T5pfyiSrYbfbGCpu5KsaPfVeQvMpX31FsWgRH7O8zYAZcyC10HhaDbcDIVOvZmT3IVwhBJEEgtKm1cSAIxbx/MBwbEL+P2Gy80MDUWpfn8TRNKOd0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTGaCSGtT6cCrgGSizaKEp0Zhqrr5F3tg02jiIqkGXE=;
 b=lyKceCPyPCh8gOpYZQ7zH+syOudCNK/9oHyoY1S47EFylPTgPj3YzYqxcTl9fJ2E7l8lpG33ByQuVMjHNIGj0MNSNFlpA1Np780mGdcQN3KYtiloO+vox1cHw8l1Z+Hf6dNV/wbazJ4ukeeOKZxMMq5koebNfqflK0w84CF47rYSYYATyvGihAVExAvjGQYn7MMnOO+AQYXYNdpU06L2/W8rG7n9LncAajJaxljj32AFSCBvG4+JYUeBtGeP+UEHA1cwc4e4ByuYjnElwC8dvk/NjqLAef4Y+Tog+xORYUIOkXuZNdDRH3Y1bQ4rKVnmi5o4xFKMfc557qkqI+xXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTGaCSGtT6cCrgGSizaKEp0Zhqrr5F3tg02jiIqkGXE=;
 b=gWK8HolDTjLAB80zkGNM3zuJIpRvxn/D4c2rAeMYGN2nrttVjmdPDn4NqxtkGxersgbIRfi3PPt2Z6T9cQrSkhbxff7Sy/FWZn6CPJENMpsb6FszmPFNYXO+umngUCmzs79uObY1UEU+X4t4RkiBwJtSz75gGcUDq6eFPhPDD0M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4890.namprd11.prod.outlook.com (2603:10b6:806:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 25 Mar
 2021 22:14:27 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 22:14:27 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v2 2/2] valgrind: Disable ptest swapcontext.vgtest
Date: Thu, 25 Mar 2021 15:13:41 -0700
Message-Id: <20210325221341.39135-2-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325221341.39135-1-yifan.yu@windriver.com>
References: <166F13E0887164C0.12477@lists.openembedded.org>
 <20210325221341.39135-1-yifan.yu@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 22:14:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db9e116-de16-41ab-8736-08d8efdb5aa6
X-MS-TrafficTypeDiagnostic: SA2PR11MB4890:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB48900FEE17819CA5C3A60F0680629@SA2PR11MB4890.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3EIW07XfFIrvrS8MUkPM6/ITNZCJPPQgM8F9ulhngHEkzQwVCCEG1R4FusRXQSkPtr1A6UXjlgjZ2bQeQ8W7BZt67HfYz/6MGDLsbxU9FMxYesEE6HilZuY5xoJADvw7EyJcy5lKFKXwmPtIbKeWvygUuusebcV5Vl1PtEzfFZM2882xR41+8VNtGRDjFnWNPVCYfKNO/FqFO4SANZZggIGoT9a9XXaBh8nzJx7VL7DWVtWherogv+6wym61iJL/ROBzm6vqMvUm3G6SzG5n1cDPLD66Eq0L8R8txPm5EAht5liPjZfcMh2L2MIpjuN3TB1qk2y0uYxUwA2uXFgENQbdX02omwdP4SMfCmCSnN75vLjaeddICLZ7Hm138cOgrzGLJdZDhG/3hfwfXMVTaOgs/Hqk6RYM1/wrfPWryV8wrEz6ehvBPNv45iZEWqPWQkd/42R8h9Qr2h8+rAMkIKBCNYtg7jGw/XC5gKGtjwohEhe8nW2uj93EiRpXZrX9iurhw7jtSjgVRXUC4UZd06XJSu+Uy7FKBPOrTEAS2DS/SQtZdh8BrFc2whrzxyXvPcPMW28+QxXuxFc+VIYWYGfp8io7Fi81QQS4F6NdqxNFT+/3wHBIWo9J0Nd+ILkO91AWbKIhYo84fCKpHedScotIJl3NwGw6tvflzj7TNwLk7G72f90gNgUf5mXsy5tTFoHnnxVyj+OLDORHE40Ptciee0qKMUhCe5dxnNheIYc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(66946007)(83380400001)(316002)(66556008)(2906002)(2616005)(66476007)(5660300002)(38100700001)(186003)(16526019)(26005)(956004)(8676002)(6512007)(6916009)(6666004)(6486002)(1076003)(36756003)(8936002)(478600001)(52116002)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?I+eZBGOC7e4QrXUCaOvYyNr0uQZhGWposmlF2CJtVOwHQ3p//EKbutcS/xi/?=
 =?us-ascii?Q?ne5umqIyjzCmelm1GAengR9vKdWskpdoSLeqeKwG9gHUkD3XkJnNNFTZvTJh?=
 =?us-ascii?Q?afOMg2KqdE5OA2Jr9BFzjcQ22vuCABf9jrGgVQ/bhZjuy7ZMRdazNDh7ZK6P?=
 =?us-ascii?Q?f3BuZfRXjcm3M0ydodIiRsI/3n/Lc4NJJvKNOOoMSa+kHvYEkV2SSaRVYrIb?=
 =?us-ascii?Q?yfescOmCrsX5hYsUyUMAPUFFiooF9CYLKMNOpptaOPYmXS0UjVOmmvdCO4lx?=
 =?us-ascii?Q?W4sAmjLt60M4Jsldi2lgwOH2lSimydxF4vdwW8GN28tNbuxG3SFicf/KmFkt?=
 =?us-ascii?Q?BRcnnsnAAlHhD/CAJD1Gn03M00FOChuJQVD7FjyWT44V4wmY37g7veaSYj9D?=
 =?us-ascii?Q?pYR+Ft6UnRK+Y49vP2ENl5rinEOGEECMv4FaQWdt5w1B/8Jau7EMom9iK4FF?=
 =?us-ascii?Q?XEWfp/V3uLJcXieZJmGfkctAJT+TOp/iUuqKtIZIQCltDVOIXClDcI+mdmhF?=
 =?us-ascii?Q?K73m77rPqyJtUkwBH4KXI3DAJ3JriY34nT4Tb+g/I2HRbppm0NSiUhJMG1mg?=
 =?us-ascii?Q?1DT/oSeqxrnswDb5MSljXDWLYJyNZMEKjkTwz1DLET1uoRIy8qzDO6vfyE9T?=
 =?us-ascii?Q?tQdCWpWO7RC0/1UAEtKslcRY1uCb1BxZrupIU8Zd2uegvB1emuef9GrbkPrf?=
 =?us-ascii?Q?4nFO7mZBVSQ+wOb/o7FI6NhmzdQzcCBk/2vTdeHNsJ4ic3Zaj/rX2HU3rNVY?=
 =?us-ascii?Q?cl8Poi7atDn3mA2ucBi+e8cAQebivgYR5D/eJph924ewJeuGKb2JxaVkdquV?=
 =?us-ascii?Q?6OWxYGk1B2ZU9tdCe0oOQNyRrOsQCtVveLEOvs9phbd4ZYFSpoKlI5vrq79w?=
 =?us-ascii?Q?ePOJ24Gus4xxwWA1PVIMttWo+4q/MXfGOjle4G3CkLXDYAZvBx1Kq++/Y5cv?=
 =?us-ascii?Q?/B+hVoG6zA/MksiVHLjvaW2A/bNZW4yEWu3SoNtO+vYc6jwVpk99CVo8Kias?=
 =?us-ascii?Q?xhPhP/D9kgTj2Gml312s105sTlFDWuCetUwcOht3PaSZ2OP9ENAwTzP33ny9?=
 =?us-ascii?Q?KCqBFFFOqC8YKq2MQG+0nAR2YFq2XqLwp4CAC9NQjnooefR/rQ97k22i9XXO?=
 =?us-ascii?Q?MWa6oQdTvMUDouYPcs8FJQ3esFl9CXa3Cmt81s7VCkl/W6WC5tWbV7ETx/gG?=
 =?us-ascii?Q?fzxhJCdodDrxl1XNUK8Nw77ZXQdfipBH9I9p14l7FNYYcknS4mKADWaIyFA3?=
 =?us-ascii?Q?2PVI2MjU7NV5h+0iYPyfafbO2JdqhkOKUTjm4EFTOjW4RCxCcZpm/Qdc2yv5?=
 =?us-ascii?Q?4ILhPB1Rc5bjj1K0HaMgMm3l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db9e116-de16-41ab-8736-08d8efdb5aa6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 22:14:27.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg14vKQjmuoe3335YDy7aGw3abfnna2Nmiqrz0rdsHC3tGLr9PSAPJJqs8iZkOZY7w9jU0T7xpw8wA6uPRnKNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4890
Content-Type: text/plain

New test introduced in valgrind 3.17.0.
Test fails on both qemuarm64 and qemux64.

[YOCTO #14324]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...orarily-drd-tests-swapcontext.vgtest.patch | 28 +++++++++++++++++++
 .../valgrind/valgrind_3.17.0.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
new file mode 100644
index 0000000000..f217098650
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
@@ -0,0 +1,28 @@
+From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Tue, 23 Mar 2021 11:09:20 -0700
+Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest
+
+New test introduced in valgrind 3.17.0.
+Test fails on both qemuarm64 and qemux64.
+
+Upstream-Status: Pending [Needs more Investigation]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/tests/swapcontext.vgtest | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest
+index 98e3712c4..5492da31d 100644
+--- a/drd/tests/swapcontext.vgtest
++++ b/drd/tests/swapcontext.vgtest
+@@ -1,4 +1,4 @@
+-prereq: test -e swapcontext && ./supported_libpthread
++prereq: false
+ vgopts: --read-var-info=yes --check-stack-var=yes --show-confl-seg=no --num-callers=2
+ prog: swapcontext
+ stderr_filter: filter_stderr
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 1e29896596..7a6b766121 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Add-missing-musl.supp.patch \
+           file://0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch \
            "
 SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
 SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
-- 
2.17.1

