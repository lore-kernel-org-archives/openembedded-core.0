Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EBEC55164
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.724.1785369118576355311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MbEXwPCi;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TMTl3N2377293
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CrA54UoIt
	pt3o3TxQSVrwuWg9zPUvZ5EEP747Im6tN8=; b=MbEXwPCiIyOfB4b1SIrJlAdBI
	taJDJu/dhrreVMeLz3BEMjBLqR+dsUkZJX11UaHHnwc1Tcdl2MYTUX1JeDMOUvE0
	0Pxuk+gtMR+xBfNaWTWmAhDWowhCG6g0uOrJbCHNKcS5bQqC0qBHQobAl+wUga8t
	TBYPsPruHieUNYIytMpydZ31OCNs+KC1nwXlOumbt324vCdvNtcBLo6+fZ0zu54P
	N5jXOH4sTyeQGTAnTJUtKeyY1hPBifut+Y3ad/7XTZmiO/sg8oBBybNO/z8yedcN
	i11i35leS/YpaMsO9BFocePeS+MqaaDlt3unLUzWmpOFaqh+VucXjJtAQagZw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqtbsr2ae-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 23:51:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZgzNKAhNY8ZQiiZmtFoHf77nAgoQX7nhjMu/Fx0/BwKbY/JQvAeKtgDXjj/QxgXW8IPF6tqwigdpXX2wYwAZLGB3wgx8isnVaG3liWsDWAU/txldJvKL1SLhSLCg6QSrz95vY2rg2OllVP9xlDjYDcDtyvRhrNdYeSCpeJdeQiO8NVTzWvZKBWRyOpoVDrygNnI+kD0WD+68SNs6FFmXue+U+psoQ16AE9MqfDTJUw/MKqkNEFkpPWh82adQrMe+pf7GQelpq/ndVcoCaOYT8gogoYeqOt9K1L1cfNW0rlbQZA0KP2zPQv1+2Ua3toH3/S5c6saZksb0m3LN32h7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrA54UoItpt3o3TxQSVrwuWg9zPUvZ5EEP747Im6tN8=;
 b=dcAfEJoQyNXaEiVaeo4/3fD59Ol/XeI95HqvfyNs0OPkCi6xfpGgAx9Oq4P/iaTqZaf/7GPBgLQ9MMO2JyhxupocFo3Ned5kU4EqPuLjWwwUi01iIWKbM0WuEZTBooAcUbOpv2kJQlqDNpBFe/jr1CkZ0L28ihM6DhWx1XysEBKOgfbNaJdN/HQz7PFThyZhW7lg6N+qSBCCXtFfY7B5IyXePWwXYIuUtzdrefLNhtdckC/4aHljHtrrjVFQgLx600RBrbE/OMXZ/W2/TfPF6CyuXPsSKXCDPqA46H0tcjg80keL97LeWF9DLpdE+bwUj/pjh52gvl5f3Pod08E3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:54 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:53 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 0/9] rpm: 4.20.1 -> 6.0.2
Date: Wed, 29 Jul 2026 16:51:31 -0700
Message-ID: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 3003c1ff-bfd6-4f86-b43e-08deedcc5dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|6133799003|5023799004|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VtGuQFH5cC+4kXSUeL4hB2sULfhmhnQvH+aflwiknFAtpO6WuFNOZSQIwOoFo+xN1bqiUd+uI7QjpmiF3DqsSe6TGnXzbtNQmi9NVa3nNCl+q3aPJy/AKp1q9UcATBrWDPD97wXnTbDsRm5ifQX8d4xIxvk11WBFmBpfQIckGx2oaf7ttgbKKeEhEGfx5B3kWA7ufvLAfBprIvUjGmaj9udizaB9P337Nr2ecG8iQWIuths/CFsq3mWW34/JUDxnaWpfbFVBkQbwIZZ8y5t+8tEcjz0S2yNDtcycMBkWI8EF34pRIEVpX07h2ahznlbH+zCEGlcD8vzPDoqJdOKqOnVfobRat5ZSrw1zRic/I1mRvb7CrCtLq53ZW2QdVu9NSAiEkpMdD/5/huhZzvWm7MX+FNxVQKOE3WQs4km6C4253t3EqRCFQm8WUSIdXnYUBrdTQTp58fceXuRwtA9lI/gh1OafUZOThgmD5HEYdNuowem0ZP2a3bVK+DbllkDK1ABJ1s+KjUy7Y9FImx4UBuujmzJ3bk8IIfRSan1p9UQTkxXo4ohXZfi9mWmd1ACc0ZQ49qVKqqG5ORN6lpE1vQUF5xLRqqAfbKNXN+rtQaVUSXxfHs1Lm3ZHfEwMrkg3BPcNfkbprTqn2KInNMDr5J9eZd964hnj61AXyYrKQn1DqLgdhg0O4z+s4pvoXOHAcdS+rt9hF/of+3eTzkZNd2MBjFLsYpWCfYj8lj0zbvQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oZ2JODXJxyHmAeIL2Zi06dLvmhAMzjYbTZ95vSnoLSqqTmjxBpxvS8EI+yLx?=
 =?us-ascii?Q?7g8WAFGRB+YN/Wuspkc68a2jC3utxIcBjiDAh+S05smierMPJvQlYXjF+hPU?=
 =?us-ascii?Q?DUE6q3Qh6pzZVtpdCEDakqEvR84/Ni8/CrXsEy+IQ0Zn/pBQ7MBOFgo26Xn+?=
 =?us-ascii?Q?A1ksIWMfDpl69ZgAPofZkULH5ggCgiayggRwCF45DptMTKhLieuUs7FMk9yf?=
 =?us-ascii?Q?kUJedvGnOAgtfxu3/5aPq+KDzdJ1grSAq6Tql0Xag37XvO8VaU+J+OUD85ht?=
 =?us-ascii?Q?y/9MrO1DOFY65ByTUY9//Z4LY31F8X7QQ0xDLb/AzY/yBf8g+2+2S09LhO/A?=
 =?us-ascii?Q?yYNwTxftJKvL1kKeNuvVgwknN6ASTgnojwxU8kJeVWrp1OYcu0M19JMLAvTT?=
 =?us-ascii?Q?hR7/i+ireXsQczpqwSiKazJpilMhgduW9452sfvW+EXub1DncanJiytpZHf1?=
 =?us-ascii?Q?+u5Rnu5/6X4j6aLkWvwSNsCTO+ZVyF6p7iy0g6fyjCcbUTcmOIYAVFP5D26V?=
 =?us-ascii?Q?gkbYyFmT3l9f1GwJEJHFYqLeyVjrUwxmFk0KO/XvRYEvr/sv/+NNDoTJOAWb?=
 =?us-ascii?Q?KTa1xz4Navm64ihvHTgHXx5yaAdc3F/VFDAvkxgmAjBvLTMYsC03PlVbXRDK?=
 =?us-ascii?Q?PlW6p7SaZcyz7rP74LLxhgnYSnhkUI94i/AI6myo0T9FY36pBpk1STbQpfzy?=
 =?us-ascii?Q?8ph+IGqHHVhWHrBYd48JKh1kfGoUFKvn40hmjnp0zif/hjWkjl/Fnx+2DrEf?=
 =?us-ascii?Q?O4n2V9ib3DhrYEepnkes0NKnnxzJDGcZ6P1OjDKAuCrVDl3QFcSSIr70icS7?=
 =?us-ascii?Q?qWvJ4l+sQIjudvzkvPPr1ueA037CrFm9bQgxgmVj4f1YVN/wzQKW4mqvrN2h?=
 =?us-ascii?Q?IWlWOmhk5MgUXYUz853a5RGXgSRVBaEmXWSZhRAFXmpgPUjo/bQaqPRX8Apj?=
 =?us-ascii?Q?DcenKuRj8Djry7giVy/HRiH1emlX1OZSHbhPK7z2zmStycr7Dgc/G3D6tcZa?=
 =?us-ascii?Q?lsrE3R2/1eLe9CCflBg/YDKJ8yq3OxD0Xo8qxF5RmRA+rIzFI4MnenCBwwiz?=
 =?us-ascii?Q?1vLcaBoArPveF+GhHcihRXHT+6lOG++GBUURzGiTONe+puHHE+6E+zqktYOZ?=
 =?us-ascii?Q?5oor9rM9+5RAj9l+PSZdejypZ7mkh4R720BEYK6ZkxnsIS0bw6Went7nA2DZ?=
 =?us-ascii?Q?ebDdTnJfR6imyg4bBbgLCwuTakeBTyMvEjkB3k9tnrkacMMesxPjNz5dIGoV?=
 =?us-ascii?Q?hZqUSModtr0kEntbum0dJv+k+Efpta6xx2/SIHiCqyJBsbYQjityxZopw+Gt?=
 =?us-ascii?Q?o5/l7slRi5tOtarXMUcS+BAcv0MMtoJ4HF2WTLlMcJJz+uF67e9tdDpgGSpq?=
 =?us-ascii?Q?82nSSMd3tqlyxS9+xjEyDYp74UnhakKYqHvq+vS54W4FQ3wH1a8u3/0IMXQS?=
 =?us-ascii?Q?cDZDLKg69UlyITjsoq3qtlPUZoCuXXct56bB9uMMObOzK2SF3e7ruj4q6Nha?=
 =?us-ascii?Q?hAsBMWjQ95/WGHCTnqu2mdRNvY7JfDFLNniMAQP1IDC53zx/KSt2ob/9kNrA?=
 =?us-ascii?Q?1ph260Kp8GkoVFOuBpIXzJ16qM4o8AEay1Go7UZxm9Y0RCY4YT4TlwzbqbDD?=
 =?us-ascii?Q?ImtoQfG3j+39LxG12Dxme3Ag1puALeic9KCtfqnHA+mVGbA8CnLRU8/OIljR?=
 =?us-ascii?Q?SirIctSPBERNeZ8IGYKAdE7rNCWNTWQqwBhOlziGmjHt/h0K5OShbOlT8GyU?=
 =?us-ascii?Q?cSbsNe/3fb8kBa6RXKzksDtyFNujYcU=3D?=
X-Exchange-RoutingPolicyChecked: 
	m2/+nMFbjrW1/g+ehjkU7RhhKRsRBs8zX8lYKU1CQ1R30Y9C6qWmNOmfqXxMGytR9k5oj0SmiOhjQzSAUE9hFiljEa96Yin+E25JuScR8TX/Hl58pdo7+q/SAPAYrRiR4n8BmyBiTwjHVj03v5MPVi+8ZIaJXg4vTWvE4H65ob5eJICpxwsSCoIxerBK5Smn4GbvyX0IfY8AJNFcExvVl+uxahukpx5ESys8DhpJrG1IBxsUoXKn1dB3PaLhlMb8pK/cMlf7olD4yh24CClMfYooBrdwIJz4oxDO/VmtqIHNMTpqphQZacRcFhCBHdrQSzETgmSQfBkMlhYvCeQwVQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3003c1ff-bfd6-4f86-b43e-08deedcc5dd5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:53.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXt+q0N4uIIwpKJvjtnWNGSVpV60wXWF6ABwjjbIkRx0p9I1uls2VSJIYBK0r2x/FQxxo2iCwom34UB2/e4DuNideUCdRORN2JsXgo10tLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=JuvBas4C c=1 sm=1 tr=0 ts=6a6a921c cx=c_pps
 a=mPJaQZadrGlgYT55Vo1ogA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=mYJC3cKgYH5x_hm5rQoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX2o24GZr8T4S3
 H0Ssdxs119hhWW5aDsIL9qfFbYPHVC30cedCev2vXWwSzogRWwNNSGfpbCf9upGtFCHaB7IV722
 999f5+QHSQF0TlXG0o72D7CEiXfYCEqq8FMyspl5R/3jYBe/h3Jt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX2rQM+jcX8bOM
 LDYoXvpG1UckEtbDes7C/hIEizrCQ2UzU0oPcN2kXGd6MYhizMvWsp+VpUTH1iU6NQ1NwXHxZNS
 mHWNclEznIA2o7sY0mpk++JtTICqwjAJo1KmN2ToRhqnsOwuA6zfEDwoi8W73P85agHePthKAdM
 OrU+eHkq7TTwFwldSsxNmsKWpuKd6rG3KWSi5spQ9ccTjM5wlGvLSLeKGeS8dZog2XdfLCItDec
 k0BB748epQ3IfWXo/e3yltKeL8d+yV+B7nWE2jhVrJRDEQrFbPsDLCapHt475ATFgxdVfBx21lg
 Dyg9kTjbYinvAWFElIz83oUCfGCzIBF1CYDVE2BTzeykrO2e0SdOyo4e8UPmndVtes/x2W9CpDd
 EyxXx97Zk/XIb9JAuppyRnzuHFXD5p7TcqzOKzj+UHo6vGz/05G/hwHBYe19wqWngIY+eHN2ffg
 kru3X1bsOkHbZEPGjbQ==
X-Proofpoint-ORIG-GUID: a3mA2XRujhK4ynGVDE6O7h7jI8-XMxI9
X-Proofpoint-GUID: CBCbxAsNJH2v3VtZ3BrcmsMA7L117dwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242301

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------


Sumanth Gavini (9):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6
  rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |   19 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/nativesdk-sdk-provides-dummy.bb      |    1 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch |   59 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...end_filter-Keep-iterating-even-if-na.patch |   49 +
 ...egister_bidder-Allow-ARCHIVE_STATE_H.patch |   46 +
 ...er-into-a-proper-format-supporting-b.patch | 1673 +++++++++++++++++
 .../libarchive/libarchive_3.8.8.bb            |    3 +
 27 files changed, 2063 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch


