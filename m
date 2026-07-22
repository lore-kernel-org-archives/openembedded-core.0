Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45475C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:08:53 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9027.1784750925340255008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=cSUgW02y;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=owdMEXn9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIwB1h148581
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=; b=cSUgW02yXIYXaxKI
	KSI7LlpxvKjSakUZA7WV3L8TKRQIg66bzgJlgkEwgS8YID+8wksqVhQQqoioxko+
	QjvOMnA0E6SNNebOVsi3RJHG0XIiaCPLXKHZmtbpihMD6X3ZZz4Io4Iz6ZPZgHPz
	U7CHuosox6+bHC0SM+aDauQUwWOiGfgjzsDm8yYlRkL6ROjTRClvbELAJv4Re95W
	yhz4lxj74wV6JalUSK/sFwl7i7IsmV185mW2aoGK78aqw36uGD1Uucw0xjXby9vO
	c471+5K4TEihJgDMiD/CrLqBaeNmKWfELXC51CcT8yHrJGG8CFanlnuCJkfrSoAV
	NOqHbw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fjme53bm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKHZJFkYyFoBvYpxH8PYcbksqDQomHZjgaYowfJIJ85u7He2LiLIZmOnanT9GGgKZxPzzet+a1lsUCqozj8zWOqRSEhL/2PHY3Zpvz7633KA8nyJSUfmk19nNPperpKn7L8AB7ondiKJCXjShy5r93uvNcA6pRUe1AkeoGd8rtufcn22080KOf6N+nz++BBLALjCr6IDnU0wCBwMr0qvq/DI2OcoHBZxn1zdXGFNVCtS9rOHx2rElhI5GDe0t8QTo2UXXmADkmOdH1gpMKGuKgBRcXEkZjnTShZreVXs+dOqAGWoY19gleqs3Kjm8DygBEG+eWWTfqHrG5+PqLXTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=d1ZOl2cgTivTruabVP6O9vhPd3bjGVnqItSLzl7xtk7xbt9QXk1H03HnbYeAFywJNaazdr3khfVJm+BVF1y2tISerq81LSGl+B6YanI3Ig2cZRfrmQIsM/9Levs+C7G/IzZjiFKrK6Ux5UhNp0qYlY0Tg708Z0K+E60PkfzgqN5VsAi3FsxqihVeA3zJobjzUOTuBHzeYRbhJugFYXs6uq7iwWgjcIUjZRbVs9g/Y25sC88QZRooaoiChhAj8VzYJCOYnhk033nZ2V+YUMk9/MMPxH8lGxFteit5c9UPo6XsVSm51rBcsAtgT6kTscw0LKj3bmohO1T+mzb9EoUyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=owdMEXn9y7YTd6bm8Coy7spZzVE98/3x6k/rHz69fyDDsbtpj0ZgVTQSAB+kS5OObIg3uLVyDLikRVMOhnM1R3yjqFH/Xv2mA0USJXjrI+BqdUg4oOGN1/ZQgDb79m8hrIUOBw6lxPD30qwJVv0e+mq//p6vrsBPgrDiKuwQqqA=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DS0PR17MB6981.namprd17.prod.outlook.com (2603:10b6:8:162::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 20:08:39 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 20:08:39 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v4 1/3] go-vendor.bbclass: Fix test file exclusion and license propagation
Date: Wed, 22 Jul 2026 14:08:27 -0600
Message-ID: <20260722200830.2917254-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722200830.2917254-1-john.ripple@keysight.com>
References: <20260722200830.2917254-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0224.namprd15.prod.outlook.com
 (2603:10b6:930:88::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DS0PR17MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 961b90cf-0d6c-4502-d5a1-08dee82d0522
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|55112099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	mOFCMOn2Lx4gv8Qhkuhm8AN1/tqAuoRDuClWZdnbch7+rTwM/4Fao8IaclIFVTfedfGhiTAkhgTloQLF+6eDAsIlSMh9Sfko9mVK/etWa6TUUJFzgKeeQ5rn6Dsne/R+kDXqlrlAoVbNyy0HBcvhGLyjij6xtaEpkqXgQZi/6eOwdM/aAPY6Y4mX0eTz776Rcw6gPuuNRw0n4cj2kUKPVcLEX6Cy1RI9Eme3j8vh2qF9ubFruN74fCtcy30DQ/h8j8lQibaIWgJYl7g0lmyH90HNDvhjI9ZgLvQLX+McCXD+hWvJ4iehVkvNMUsLRqpjEMR7r54V65f+7JF+0PPTCapeNB1FmYqsIrLg7hQmiPtJZG/mTMTjzad1tfZ0x3rquAmyrABTlhcM08A7R+xJUDrr6Dzl0skMmaymFTSBwrymTO6k78ulGqJZBrm3w0MoA9i5I/3GDtafYg9ZJCerEFPUmoqTXkDQmyys6z4L32MdbzKX0HlK+mgPQtnCQnY5Z3RFP7dBxCnSrqT8RhImo2csUj3hfPponly9o4CCnQy7gTdQSjnikM8SmgLv5U6/gpBXhPHm3vDdkXtBJ0rBKZskS00bAw9CPhw2Xld9a3QJo3Y2jrhGSfInNvJ0CJ+o
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(55112099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zqSkHLNEsNtWwF/yzGBMDijoBGNUNsvleoKTwCyAT45EUprylmYTihgWyJ8t?=
 =?us-ascii?Q?hV66vrKgcM8eeR+eO07gSOI4k+DZtFXeXTak7xHDrzRJbWk4eOe81xIkXcXi?=
 =?us-ascii?Q?f/mNQqEGvAf/o6e1/MjEQzWSAaSKsgQoqKQzmKVVLJB2h/dkTgCiRCjGgNoQ?=
 =?us-ascii?Q?bH+ARqWbMz567+FeTqnhEmFlIM0SYAQmPxx2/8AV7+1LZvm+Oz15PS+oLL9E?=
 =?us-ascii?Q?gJlKpJ8FTJqiTeQrIJxbSTZOmySX1XW3FJvZd5bzzi1+5N98kTYHdPrid4Zb?=
 =?us-ascii?Q?ckp+CnjDH4Doyt+u/ULly5qSYSdxHRcKMOm3+AdbTbUbqd8Rjq4zORScrJzt?=
 =?us-ascii?Q?NjDt0Hy+IkVQyIGQL0pS7dg5ZhI7mnlTal5iSYUhOy7fJWx3V3rrq3FRBu20?=
 =?us-ascii?Q?hrBlND1kf15z5lb+7z3JAY94tCyWDnFW/zaiCi2WjGM2v1sCV9xeGw0VGZIf?=
 =?us-ascii?Q?lsRgyUJnoi1/IJBB/UNLIW0IZOyM4CozRUnF8VrGcIkFO/zSjb35GpGClUy2?=
 =?us-ascii?Q?LGemESNfi0ybmUpbd1K4Dfkc7cPUP9TypJsd2ezXWlKyvXlalR/wJQf7QmXu?=
 =?us-ascii?Q?coXAkqQXkxOzXO6bczl7X8Ndw0odkzAPsP0uBDodnAcXsW05dgEORi8ilRrs?=
 =?us-ascii?Q?5LdAzy12xdGlyCcj9Yf6kZaB5yWO9UbdlsOhLrIWCIX/vSJSzIP3xDTzputo?=
 =?us-ascii?Q?s2rzJ1CKgsUrQwlnQzjqy/ndamviUzN6GbBrgoHjHIjrQyFwA76ZNJnozNFN?=
 =?us-ascii?Q?ZsIScJDwb7fLZxm6BhQ2BiKC5aziPjIeT4XhDXohyEvybkRPXoEIR1egdzQU?=
 =?us-ascii?Q?6u071qqj2QCNp/fu0O0UF/p3ixT6Vid0wvcLzJWobtnDAj56ZecCVLLFb6mY?=
 =?us-ascii?Q?/HUmYyP5aBQ7GzY734vdF4M4JL9AGnEt9Hub5QYSNRy+0LvIypR0YyOyPL/r?=
 =?us-ascii?Q?9VkrbPesxFJzJrNn1QVJYCuxFDC5swYtYTi5mPTXTuG+9ffXPTPk0bvjRwzB?=
 =?us-ascii?Q?36Mv7bE9bKxchw2mEuwbHmbP5eZ7dI90KFSyZAtOtpulNVlsrAPRsxG8ymJW?=
 =?us-ascii?Q?QPphANG74fca978hP+/PYemISOpb+QotYYWzAl1hmadDXe+Fse6j0rmwAA3d?=
 =?us-ascii?Q?0EPkA9fRU59qosn3ATUVNBT4LRuxLKL4VOzomHIqBfEHn6L2smk/6sW6KnE2?=
 =?us-ascii?Q?+DO9Q6Zz4XjMyS/oniLry1h/Ak/feST9Blr75z9If01OEK3PjeITat7BYTve?=
 =?us-ascii?Q?Kz1USj/mkP+hozMof42AZw1nSflhSNU0Fe5vR3d74OCGVGsB9TxDDUQVaByx?=
 =?us-ascii?Q?SoL62DFBU64qUsb1pAXszVqt7zheB1ZQnBAGOit9/5uWJ/Flt5DHNYeoD4yC?=
 =?us-ascii?Q?qomFA00FAbSD3xwNJfH2B3J5JT23A6cIdMdzTecw3kY49sbclm+8p3dH54RC?=
 =?us-ascii?Q?iBWx04LDVUGSV9KC6+UtK7WkSU6EwS4e98tVyXOcXvUfCoiVwC8alyyTk6vb?=
 =?us-ascii?Q?Xzd/SFPdq41altk70CQZDq6lhp9mt5PyE4WjyRZEw51pYhRUrMwL8EXqSFr7?=
 =?us-ascii?Q?c+viRfNOiBMsLx45zR4+cxCrZ4r6c0WWSV6tBG7nfzm0LbCltWkdSKH2NUE6?=
 =?us-ascii?Q?0YIUv/z6CZ3sHWcbg+w2PWtEaie5n/TeaOZZ0oJStMx5vyowtoF9wsMO8wR4?=
 =?us-ascii?Q?aNBH5oDc7gfUQdhSOONxhaRFa6sv9XIDfJDVMNShCvebQtuKmqdQbq6UGyKA?=
 =?us-ascii?Q?npgdZWdeyw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	NYcqcGbV1PdvleQaiMvsI3dyA5iRw6uvEpGWTFPc1BcDnPL6WhYBnBtVCYNjxA/ZxgyCbkR/LIEyis2R0Rh4I9umCizVvOQntWZotABztj4mJQhuoy1r465RGK9tXWI9FceT7nH2Bwglq+LzmpuMELICDLfey982hvhX6Y8V4w9MySXTP9iWZKCvvrhFAdjp83kck6XQk9bfhCJbGoqnlgKRPf3KA7A1c6yEABtN6y4Zi5x1P9C8R8D1d4ZCSCZW0mHYL6FDxH7vh9yiU5Z8VjveTIpR2K8cTIVLQbsLTbdOhLn0XgDrlsG8c80HD25CRVfhok1E2mWM1nroTMSYrw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M/sJtvN7eGVSXBMFYNDKj6RhsiyPmQpN+0RXr/ocmDBTSRJzwi9Kd8fK6iWt5iq1Px7Ij20CUH0UmgTtvH8OghjsokQImFkjcaf8gj0mLaQKDwJFfvhMwTi+j3JbBobvTPHIuONrhN90Oql71mRkDY2aDdhWRR0mBwThsLlXBlnhVQvzuDIyPdvcvEphBx9pPKdqLTNSyhtsUq1P6QxfZFm4dPpSDYZXw+HBNfIKgKFYGXYVxlR8F7TJtnaARVZero4XXmalGxY7rioCFbza8X5ltpoRl3PyePC2jFCtPJKqs4pvWBB3JOEkLyLzidUgE1IJEYn22aUK72vUgak6Zicf4z+0hxls6/5vWt0kQPAabDP5AFul1HEDT6Y0R+y2D+sOv+gJiOzs3wpMerAHEcWPFVDx/YyKvDDOHzOsJTTabKl9dQG9n36apYdTxXoLZ4DNYXZv9Kk8hzEO4VgQxmaxNyCtKKrswSn+Km3yAZE394ywuRbNnKtAuPZEYvT/5Qf8SHe+hU/sFRA2f3czpE1coN3sIQwv+HX6jUK8NlwNGWUESrjQsA1tNgntaNN6QP4scZx8/DnZp33BJGiZrlsquIKf/bHZZ5nAxOakVpQk3n+l2FsUM5p/GeefjVaU
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961b90cf-0d6c-4502-d5a1-08dee82d0522
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:08:39.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/xe/dmOi8AgmOYJjtnzmQx2mehwRIuUndH5w0abPv6CeWkIhmcJnaw1qtBBmqIQc12rD5yEiGZxSmip9yd+B6vTA7n0cDWlzTAcOjkfpqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR17MB6981
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfXwz6x1VS6JdTD
 s5WhvKrYxlqruMpHXzkqQsTEhKYyApytVxd4TzTzhhEiOCaJzIgY0EYo1FpuRX1lIlGQse6vICi
 L0xtml9zPDKvCtrBvwWBJyvNsLdn9MW0Ah6v5PAleLUFdlnVTaKv
X-Proofpoint-GUID: 3QE7fAhLoAGkYAbmio2XWQhXUcHhM6PT
X-Authority-Analysis: v=2.4 cv=PdPPQChd c=1 sm=1 tr=0 ts=6a61234c cx=c_pps
 a=7AIX19wKKSH4vG2a64CeWA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=BswK4llZXKt4Tvt69P-b:22
 a=plf8rDjJAAAA:8 a=F6MVbVVLAAAA:8 a=CKkP6PFZCmJgk5SHP5AA:9
 a=JWTSs7K9Rhv-lrTctFka:22 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfXwoWNqU/FoC1y
 g1CBZhmq6MsrgMbZjsqpknR91EYheKffPTKw6j6CsKr+xvtFUOL0945ObWCM3h3gfPf9riyR/5l
 DJSnkN6PnXDnntayn9B7Rp6G/0w4w39oXxzlOKP97Uc65ZINykRa8vngzYhnGFjJ+OCQEhu0TvH
 r4WMzHziQ3jt+xAR0VNtxEjBmj3azhieSUj4NefP3PD9tCXg/H0Zk5sQ8s5uSzvlu6pDfCO0Mxj
 P+nsjvL3VXv29CMuPcw5/vPssTvRQPRDJWI3eLQ0IzZkLBSN4GJR3QhmWAxtp45Vtonlx83rJpQ
 O5zY9HuboPy+k3Whje9aeSml9Hr9n3K+HRRl91vVKdgYllQo7m6CcNlaM9vzs2u3jeM9Ze3TQzF
 KvJ3I9ZDvOZGzls4rt882wB7haQ0GXdXdzdzdg1WCn8oN1pdYQ5YGKyqcGuSYGEtTmaQQvztDnu
 bubyNnl8dBtOhCeqyzA==
X-Proofpoint-ORIG-GUID: 3QE7fAhLoAGkYAbmio2XWQhXUcHhM6PT
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11854
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241742

Two bugs in do_go_vendor:

1. The shutil.ignore_patterns glob was "*._test.go" (with an extra dot),
   which never matches standard Go test files (*_test.go). Remove the
   extra dot.

2. The license-propagation block used os.path.join(src, "LICENSE") as the
   copy destination, writing into the already-processed vendor.fetch source
   tree rather than into the vendor destination directory.  Switch to
   os.path.join(dst, "LICENSE") so the LICENSE lands in vendor/ where go
   tools and licence scanners expect it.  Also fix the guard condition from
   not os.path.exists(subdir) (checking an unrelated relative name) to
   not os.path.exists(subdirLicense) (checking the actual target).

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index e879d629a8..85a3c1b586 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -141,7 +141,7 @@ python do_go_vendor() {
         shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
             ignore=shutil.ignore_patterns(".git", \
                                             "vendor", \
-                                            "*._test.go"))
+                                            "*_test.go"))
 
         # If the root directory has a LICENSE file but not the subdir
         # we copy the root license to the sub module since the license
@@ -149,9 +149,9 @@ python do_go_vendor() {
         # see https://go.dev/ref/mod#vcs-license
         if subdir:
             rootdirLicese = os.path.join(rootdir, "LICENSE")
-            subdirLicense = os.path.join(src, "LICENSE")
+            subdirLicense = os.path.join(dst, "LICENSE")
 
-            if not os.path.exists(subdir) and \
+            if not os.path.exists(subdirLicense) and \
                 os.path.exists(rootdirLicese):
                 shutil.copy2(rootdirLicese, subdirLicense)
 

