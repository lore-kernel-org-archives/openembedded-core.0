Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66944EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 09:27:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4549.1689240462434248495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 02:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n0QUB4NY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=655843bffa=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36D8IGY1032334
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 02:27:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=h3IDm33inWjc3hYSjE
	xjoW2VMydxjIxwhaJdKzAQL4k=; b=n0QUB4NYiiBLeGuKO5vLmyXXzpajiHWk0L
	IlP7GZBPBqg6vujSCJDXxAD7dhKkCWAAfxQxjOdI4+knYNl3hgbBzQq44xofs3wf
	XDftyztILHnU7nAG5n6QByxQqF7KYFOhMkrSRO+XPOlnk6m5PvhgmAuAMpaYa+I8
	RT9VOA94xzZRKMW8r2aNXjFMK1qpeVxUij0DoTcaKf4pZxJMGLj75urvqtstJbtZ
	9OC7c1B5suze0gRwZI3Mhezw+6DZwrUnyD1t0ZyavlWG3lloKqyNw8BGIB3vqEqP
	S4n5G7ZPmI75OQcqGxOJ7KoMxUbH2ZpLoGtwnUrMHOPQYm/H2Yow==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32ymayj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 02:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFmWbNorUB7SGo4tyaON2IqT9e0rVVUupfGLxu8OxVfmYRfWnJ0qfTycroDk0LEueTA4cLB6x6272QcnSEGuMA+t0XSo93xYo+CYyNNf6vLjQ3i3AsgCwAwjfjf6BmblDYkjr4lbPRGhphIKhuOn2BZOKqCqdEpvW5wvsPZYZPHge6qss1cGP4OGZRCWV02hM03XiNdnzBufDMVcKF1fsEMPGgc9qbbaWnSnhqTpoPvb/UZTaMdU1pvOJ9o9vS9eBoWD1Gp7NvfWK+6OQmv3SEJ/6WSoqh0M/PIftCC9s13o7PLerG0lskvYRBFjGF55fARc/srPoXkxEhAJVI3twg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3IDm33inWjc3hYSjExjoW2VMydxjIxwhaJdKzAQL4k=;
 b=Q6iRcZYLTT4pBzoHUQUhk103YJ3Q8jhG4XqG+KC+xMZmvw/AFY2ZnIOkHhCmnuGEVfaW1ix0PW7vR/N0j0yncC0qLy1i5P52A5uvgCtJaC+8lA6mWu3CQmQUYjueFqD68u9LnZ8ScOwjo0XqWOFAcaXWv0u6hOY/xVo6iVdaPUAb73GRXNeB8ew+GYwVrH51pqcjSnKVvXl7Qg+KqPWTVDjrJIB1+pl+DIPCWBReGuNKkWpZCUaxIW2jOKm/vsKEpiM4bV6D4SqKm5rmB1ob2PYC7hN/BstgKpUBQLvLGzE0mQCzX0i85Eep0S6VM6vAIV9bW/djIuXjGRcU8ZqZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 09:27:37 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::f883:84a2:d864:b645]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::f883:84a2:d864:b645%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 09:27:37 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [dunfell][PATCH] glibc: stable 2.31 branch updates.
Date: Thu, 13 Jul 2023 02:27:17 -0700
Message-Id: <20230713092717.3241412-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 56219305-55ce-4cc7-5dd2-08db83836542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p2u9vvToaTzQoFzL7OKX/To0/xrvfzLnVS7xLWNg1N851kV9Roi5kSQrpXP4xyTijfBa6JaAHJYbOrpm6jdus+ViPjSDjtJpH2efH0yLNIo0c7nTSu4tiiaOGEiirCcf0A+c1CTv+ucVKfY8X75UpVbRnpDX8kbRQuuXL+kk7HSDub82F1SNfTlt4IgrJqZVUHUuOH97C1CSfWwJTxg45LWc09LNMLxkXMgMHlnJmA2ZZkYxQbFAYdoFTC4Lj53h4LkIPdMiKe+iqx1nl0xrBUoANe9hbcE+ie+yX5s5h3+AkW7V3Ruglrg4sJtw6bE2R+Wap6ZVcYmvP1iFfcqe8/eKOjJdPO8Awx6m36WpsX6n19mqJJ6QF9LKUA+SeDdsdR6xcruLqXOND8x4QbEEttwa9Iz1TF1oev8EBwfXqIWMSjBLSQM5W2OmoJ01DJZWnhr+p0j5vjUXTiHrWqMasMnq5ZIZK7OFXal1JIzavQh5j9BSTrqro3w7OFuE8N2sWqWEEB06+4ToR7XUz10djEMe+9yAYis0d3DirGWjw//0Ieo119Z22VCUgoqLTJGOxR3q80enuQRp1psRS7yBEa9P27w/5x1o2yzUz1BYSd7dersPIszpNxDpq1RcX+47
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(451199021)(52116002)(6486002)(107886003)(38350700002)(6506007)(1076003)(2906002)(6666004)(38100700002)(186003)(6512007)(26005)(41300700001)(478600001)(36756003)(316002)(4744005)(2616005)(15650500001)(86362001)(66556008)(66946007)(66476007)(5660300002)(4326008)(6916009)(8936002)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QzExh/TQM6NF/jaE+rtE+IR3gS3WZiTljltPE9+omnQ7t6FwMoUn9oDEuqfs?=
 =?us-ascii?Q?3OQqubjFSUjP9GnLc4w8IoLLOs1xVMon6jZxLZbTZfH6+uI9ZPS1iy7A2JeY?=
 =?us-ascii?Q?5k0SNpY9RZsoOlBrvbj4Qm8yrV170HCn4fXMLOYfry3Y1OtJk1Z+Vq+0w/b1?=
 =?us-ascii?Q?dyHbGink1HH3Dp8o3/hAApSvFff+hS6LpJt3mGMBPz59ZJsV/UwMd1DGyz/o?=
 =?us-ascii?Q?sfRq9zykB8G+GzmmWw3iGFEmKt3wVQSfFS9qwzt0y0crSQJft2S0JEHuIH8t?=
 =?us-ascii?Q?fGXPEuQUW9usr+vKk1T3WwVOECzh5ZNvthP1dBrOAk6RbfAj6LS+kAUE/rD1?=
 =?us-ascii?Q?H8hIJeQ8CjL9l1xrlhFAum7wspZ2ymH56ALvyin3JgecXH77waOargDh8zL+?=
 =?us-ascii?Q?RJfw2jHpSlnCk99TtLmEwl8b0+0pf8510/EnzFUupK647jqF5wYlwFaR4xg4?=
 =?us-ascii?Q?L1Ymlmz44WyHTflfYM4nT/rqCNjnrH8nEgbFO7D/A+kEikAuTzv0Xooe5jCt?=
 =?us-ascii?Q?qg2+9lw/vwmXEiL4h4nzFCBvUQfrgylS+23endcqRRa6HyeeD/8QHqXoXG80?=
 =?us-ascii?Q?koBsIK4RnZJ93ls2IG9ZqJAT2DLc/LaIT73d5wiGV3kAiO3DKDn5xA9XmO4T?=
 =?us-ascii?Q?jF9aO/NU1XDLO9StzHCPwPChK4lVIPFWnziy5oxKjRTBQXjEkPfSMBF+x3HL?=
 =?us-ascii?Q?yGf1b3D0sHlIpPoAU2yh4XTWavn3W6UYTarSMVe6Mu5RSdRyGAq5Id5bCjTP?=
 =?us-ascii?Q?sCrSMTV5IYwlJ9bgzYo9eftt888xoSEjfdXDJG98P0InYtgUEfaP2/qSIN30?=
 =?us-ascii?Q?ykEhw7yWxqRfHpfGB4NMzKpEfDXy9tbGcEdwj5bm5QKH5C6CbrfGMG+0HrGP?=
 =?us-ascii?Q?xn83z7savdkPD7ESvGaAyzhL5t3exNidkHaFjbidFaaPTrMoOkwYqhaT3NEn?=
 =?us-ascii?Q?uUSF6gPhDYbevxrFB6ef+k1jzsUkT4jnQzTdUgN7Ql7+rPEZ2I0iH5xab4Bv?=
 =?us-ascii?Q?TSQWJzOiu416Ak/jrUxg/wDtjupXe7OnjS7YcsTFBW8TUXBijv5wGzQUbpT+?=
 =?us-ascii?Q?sBfjLRUUb5zdDndW9pht+EdHA9JFE3tj1qT6ywgkBubJn9hyTgj4BDbiygDj?=
 =?us-ascii?Q?Ne4vHYIHoJsnag2vB1/eQZnIr7U/Y299KjgN7zt4TYWWLFiuDWiw0UjFZiaS?=
 =?us-ascii?Q?79AnetmB6VR4jeAG26Wr98d9iEePnlwXn9tUUblTFePZeiLXopo3NIGmyOJg?=
 =?us-ascii?Q?Ows+VLtHPHH3JC/nPplqb8DH3U/J7i8cq3pbxRzlfPGrGgUmyu7A2Vie/6hw?=
 =?us-ascii?Q?LFdf5dIL5my6D+TqYkrdiYCieTi3AhPoaAjw0eGULR556oyx09NFmSndGQ7S?=
 =?us-ascii?Q?ExG8DuKEOsRFHbaaVLyh0TDzsF/S7qM4gyGC37zafszNS8elfzjXBNjhI4Dh?=
 =?us-ascii?Q?5cOUvdSvzcipHqh8UvbynnHtugqj/8TQBFku70VNbpDvnQC9PvSfBK6STIFQ?=
 =?us-ascii?Q?8DTQnXk1AhLm8F1ml7SeUHmqbf0Vuv8IwPK0gOa2B7kfdVthjDDLMmAWwFrJ?=
 =?us-ascii?Q?JsDK9DNSb2RtFK8vV2EXijh409e6gRlocd5EnY/Jl5Ethg2VfTEwRjmTl+4S?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56219305-55ce-4cc7-5dd2-08db83836542
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 09:27:36.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCOVYHonwRhm9BVEWGQEnOuu54g7fvewU4DF8vA0NihTin3Nl//TKmIH/aWReN6Blw2scXYn3PVkAFY57EE4Lt5p7lBZzI56XaYFZYyk0hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-GUID: PzdGEGjScuflReaNJSfq1tFOosEUYa0R
X-Proofpoint-ORIG-GUID: PzdGEGjScuflReaNJSfq1tFOosEUYa0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_04,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=677 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307130082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 09:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184234

Below commits on glibc-2.31 stable branch are updated.
2d4f26e5cf x86: Fix wcsnlen-avx2 page cross length comparison

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5414297ba1..95e2bba301 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "d4b75594574ab8a9c2c41209cd8c62aac76b5a04"
+SRCREV_glibc ?= "2d4f26e5cfda682f9ce61444b81533b83f6381af"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.39.0


