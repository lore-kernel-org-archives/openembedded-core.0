Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE53C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 08:10:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3933.1663747799396834479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 01:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oMYsktos;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6263130eee=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28L6xVwt026848
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 08:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JGG1yfroa9IRZtr7Ax5vqaXFqHtt64ClTlNKHBFTlEo=;
 b=oMYsktosssgvmygXr72oE0z/J+DfRK9bj5kyj02ld5QrU2QbrvVdfoWj8glZhUoGdp2y
 EFulfnQgp7E/s+EwT9Bx1a++3pYqfns4RzE48K6IjB8dwdrkQgeDTxObfKsrCzyG3xH+
 u/8nP307jzfz2mekEPkAUtwlnKAp9z8QudQhSCWwHB8SKwHwwUWqNmBXhwZO6GfMM6/y
 s9s5uVUrc0Okm3/54sDIo1fXm/LLmW300qHtTVLE9k8qf/4fVHLCf9/3bh/p9sah4bKp
 iZb0c5sgHAaai7kYDU7J7qRfNNx00mr5rXI8Rac9wKo7A25yg+RLANpN/8/xhb0OOkjA QA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1bbuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 08:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2O5j2jpGHIDuhhBaX4E3cZOWmH3sma+PmO5UoZ6jAzB7Et+YL+LP/FNBctxF23PPoSAGVY6+D5KjKPuDU8EyPyf6G1fAsIogTIOzyl0M8UpTi3hCd2IJe1A8/56nNL9glrZJaT9OP8mTZXNqYOH4nywlX9Pfo9gKdcyAVA7091ZKTXfsNxUZ6Hjy9q9pzHq3OsM7UghjAyUnQ4Ptz56j+XH388QwCz8hW0GkfFIZ21Eb+1mLzTaNrg/4YqU3oQOqK8xfYZkOMbRCjkrJ0ope1MvJFyBG7Y+yJVkFfeevg0x0dFMcL7MlrVOS9ogiqb7hr9XgnjGcSY9Au9RECfaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGG1yfroa9IRZtr7Ax5vqaXFqHtt64ClTlNKHBFTlEo=;
 b=GMfP6p6Pn8a832LNwiHGNFmh7K0noMjZ33OpaFAWmRuej7I40O3oLZFNpNfhdYbHpCj6/9ptp7cKPZORRU9N622iiMzj8TbuCEIss1eOXs+lKwCMVBo5WTotvyicMj9tiOpiv0wcRzRY3s0rLxGpfBUHbucbNyz04zQybZyJ1H/eH4qyuasx1pRd8xdY1NycrbuMYuMX+qODjpyeWZNBlu+k36IlXVOEPnUn4qMC3/kDDU1YZDUjKJoXYzj/YGkwh26O+ZyR71N1uvUGdW3eDaSv80TNBkLpy486AdrewU6IqsZaLBCD6df7TDuem9iYnzwqZb04u6gAw1yQn2xY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 08:09:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 08:09:51 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] shadow-securetty: allow ttyS4 for
 amd-snowyowl-64
Date: Wed, 21 Sep 2022 01:09:41 -0700
Message-Id: <20220921080941.35698-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b47ecc-3351-4e84-093e-08da9ba8a89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p8rpqov1zNxnIcZotGO/osICZrNN/RYXlcf3tfMUva+4Yeer6MFyknbAwAoMgcV/L9LSQLgh75jmWVbfDq6nnHMUD0kP8KD5EQJKJHXDRZOKOfIrKkGYVkfDgKbobEbjUQu5uUn90NVuc50k8mnr1R7hnGIOHirAxguzxnuUdZzFyMoTrPQXh6s2LuFajseD4v+SfIKH/Rz/iZSISWWm1vBzGxFHIbnsJfC61rwP/yFzeL59il8DxTmvCUAkCXt3osHKWalavHRimTit41DBEJ0P9zRfcrENg4PG0XqbhtlXATk+lX8AVjEL7cgscbrep84PqYP7luE1tDQJdG4PPcKhADR/jk12AKYQ00wo0S31A8IN9XlzLm8ntCjxk/0iT+I61e9T0V8xub16rgzTPQQvobv4NTFDX4Vtl2sAo2tEjKX+85RwNIAWJTf/j8WLjcHg9qpBUZtr2LhmQb8t20o3i6UxeB66Kj4C8X9WyXu+e4a9oztlnVvy07SkheT9UthJ1nFJi9Ra/RjSXAhA5+GsJl+uA3aE9qbJIjxrtHHTDTAsflNWaI9lkMl338SYWBtueIdSn+XorO0uyKCgQGqdT7zT0an0fO5ARbZeSmli6I4Ei5kYQdefCZHs/SBA/oIhY4m4R2ElocRrVDM1nqGQyFAb1SiVzuWs2QU5OCLyfAoWPiVR0zC1b1QCzTSJzhPvODqZ3u4EU4aLeuZwzw0np6s6lr8WbPWjxzU5u7qi2Pr1E+02LTtOEKGJyvG6FnbmO5GP4Z5eQ7GwqAen8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39830400003)(366004)(451199015)(6512007)(52116002)(26005)(2616005)(6506007)(38100700002)(478600001)(38350700002)(6486002)(2906002)(4744005)(5660300002)(36756003)(86362001)(1076003)(186003)(6666004)(66476007)(41300700001)(6916009)(8936002)(66556008)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7uqkS6nfWO8KTlZBykCXtPC3gL2n+REzLgfEyh153l0JvpEwf7a+uuw48rGX?=
 =?us-ascii?Q?8CRgUT2jgYZvezkSE5kAni1smq3JxqNSJ3vL/raFUIYcR4ytV2nOfywBaplk?=
 =?us-ascii?Q?SpsjxM2On7FL2TQyhZ56LuoSdKcdkjH+RFqudMibaEJVEAqYOqBTB+XK/Hb4?=
 =?us-ascii?Q?ZyIh/on7mf+CEssuFCnomQiSgDowUR4sTeuUFFzva4ctlBTu9+Bffbv/ryYZ?=
 =?us-ascii?Q?9M+vW8OdKCOKi6logIYDRF+YAPubqTvwYNjFFxpZrU3F8vL8mWYFeWVCThi7?=
 =?us-ascii?Q?bazdAtRV6gxwsWGJ4uLBotTheX/TCyvekp2mkY8HD5nXTWD3aresa6074R+N?=
 =?us-ascii?Q?rcdux9G23GCuQQ2v2BBvLtYA+Kj8H7h2HQoPSoIp5v0WGSoUUs1kNUkusJsD?=
 =?us-ascii?Q?FitihdMwrB36/rbET3vbPXPqm4/RFHL7cLwY0tCyEUFlGT8iJ6ztoDAPO/+P?=
 =?us-ascii?Q?Gf5CiJD282s2D+ZF9tixG2+O3++zbj3cuNq3Iuc8ktkTf9PZwHCr8Ejqq3eS?=
 =?us-ascii?Q?QpN3+psG9qvj+mpt3SXwhUYW0Xt5Kb/Kk7zV4VMlHMd3bFanCs4w2PBMO9lp?=
 =?us-ascii?Q?c1C6fMW2boPKzozjMNNLPduXxi1nch//o6J3Ds7m8DB/LWLp4kR1Ccqcn2WV?=
 =?us-ascii?Q?+Vj/N217Xl6zoV1moYSmEZ8kldW2oRIZkEnBYYRAPhJominc74cSdkTRJy/d?=
 =?us-ascii?Q?KPdrk0tfbzFvGnviBcUOriu6HwCjVEjXGQOCq4Hqv5AWxZT7XE7QNzWgyBKy?=
 =?us-ascii?Q?W9/PbpASx6hjvUFhH7RcVDcJKyywM09wXeruwEbDvSdrlsxB6bGAkJNMUamU?=
 =?us-ascii?Q?/uIzBvX4oKfb3zdbnJkzvaAGQGTUzwJURtCpNYCrzShAmaomC2QqJiwtOYSg?=
 =?us-ascii?Q?5XgRwDXc4HJeC4XRrkHmuyac1dBXFSwpxrIeCCElkuai29335EJJznImdefC?=
 =?us-ascii?Q?FqrqFbd0eP7I/IAv8M+nJ1ihZsPSh6rH3li7o9ykr4Bv97CgybH6jJlPsudY?=
 =?us-ascii?Q?U+mN9gd/E5DLl+ppsPdCgmYN+BCDe+tFb51LQdZazABED4as2xL+O/1KAHoc?=
 =?us-ascii?Q?y6fpXu/jhqDOCCoaLNlg+lONyDiO8qPadlQMQ7qz4pGpsaPumC2nK04yd7ps?=
 =?us-ascii?Q?qhKgU6UdjIHr/zh3t5/4zMdYb5t/9Q9YCXa/zDhBvE65BbYr0y8aiasuTNQ3?=
 =?us-ascii?Q?TuvoM4BRKx3lcbOVez7RJBJjHmfHBWIp/qKY96O8opupM5bLzVhXIZcxBUJM?=
 =?us-ascii?Q?i/T9PnipbwX6YlVKZjh4fw/58+60YcFp7VcTPpu8PpUtXA53LrmuNMxKi8Ze?=
 =?us-ascii?Q?uPkJy2Hu798xSRVVrO22PSZBnXQKZauzeUeG9xIBrCwAsouAF4gswXUuhaqm?=
 =?us-ascii?Q?unDIKrD+drpC55jV4lhKWpSR1nYfawJ7FyM9RdKcl7Yi1q6k3t5KRYCCCuY9?=
 =?us-ascii?Q?Qo0jGODnmhvAqtPmsiQxHjGzfXGrUdij2BfnqtXaUAinMAn2fbjWTSyLXRPU?=
 =?us-ascii?Q?NbD5Q/K7yBok5CXM9tusnv5HLNRHVWtLUaGV2SmG0ZH8nit/E+sP0ke+CpLk?=
 =?us-ascii?Q?OvWUQQKeagE2SA+c9l9d+0izrbjDiMQ5BpSzCKR2Xo2dorSESxE6Tdzoai3L?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f0b47ecc-3351-4e84-093e-08da9ba8a89b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 08:09:51.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qzebtr7uyeMNDTR2PsKxdv/nAZammZK5bUOqDVtHElPqZltt98pn1c42gc7Byn/EZO+t4Y3iFoeJwrivITapgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-Proofpoint-ORIG-GUID: rX_6eVUvW5k4c1o3V1BeEAIQZduFOSNV
X-Proofpoint-GUID: rX_6eVUvW5k4c1o3V1BeEAIQZduFOSNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxlogscore=559 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 08:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170937

ttyS4 is also needed by some BSP such as amd-snowyowl-64.
Let's allow it for convenience.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/shadow/files/securetty | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 2be341a216..820728faa6 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -7,6 +7,7 @@ ttyS0
 ttyS1
 ttyS2
 ttyS3
+ttyS4
 
 # ARM AMBA SoCs
 ttyAM0
-- 
2.37.1


