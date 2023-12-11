Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EBEC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:26:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7133.1702297600343112329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 04:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LshqXHJs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709de5e70=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBZ4aM002895
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 04:26:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=at9YA3LYMfCaD7RyYZ
	K+u2smdZ6kh//u0ooT+CLl1Sc=; b=LshqXHJsaVSaQDQG8aZPzexUjDZyr3eSe2
	GTcxlJxPVBzuWZs/FjOKQulyOnZmKGK1JONRhvehqnBIVvXuz8NxJd6rsbq3njco
	YifaRKCkIq0fe1cE+9ldRn6ZW+bBRgY/YHnyAzbowP0lfRj4eGtU9wkmHQJRnkxc
	FEQLMoViaHY+GKJ2PJBfO0hPldmVcAVP46ayB5FrWQx2/a6AGrbnhbqh+mnCZS//
	izyXSfANHrQd8jTqNGWmbs20ZrO9E0ydGHONEXmqZKAoT92+4Bag+owCQ1R9vBY8
	7Ip2MavjU0xXnu4DGwtyEcS+FwGalt4NL0EmDHSElkVqxeReAqRw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd49eyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 04:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4wXI3I0+b1x4/1myIJ2r70+XjvqhJEDgPLruVsQ1AwHxha2aa+zvD1HFklyaNC+4EybB2ScwJQPI8+d9xSh8p2C3dbuJxOdMSQB0HbwCdsxa5+AA8ViP0yXBuZ0rwL7SDHBwyVQWaTykK1LrRhxAT90yRKejW0g/nAJuC2d8Ak8dBdAnLB01d+MjpngFYHznQ3t3OApvrPbcbShXn5iVNyAGE53zdW8sWrxyXsOjh1TImmyF0acMm5Z/rvwST5lfGwSZ8FdzcskqIHXpEJcpJvLfZh+kPuAuimJykj6FXMHjLri1Cv5iQsV/2D8P2u3+MDuAOv0tt9d7Wsq8kCdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at9YA3LYMfCaD7RyYZK+u2smdZ6kh//u0ooT+CLl1Sc=;
 b=PN+cfBZB7ZuoCHoMb0js7+cw+zsWSfuQk7cpTHohbrRQRW+adxIp0koikX4Q3NrBa00jvVye2SPG60+IWSyfiPg00qNuycpPm/EU+KaoLA7/FfyUuP9ZP0kxS/uzzHyaUvzF2oIbLdnfHPHEWrcSqcq3sBJuaZmITWc4UBkZ/Or23ouHmCQOYGZ7jd+lkPXRtmY6DbBktF81E+ecQN/HjQk5x7+ECOTrQICSCfKQ63KXQhrfd0atXjZ1CCE3b3T0a1PyeVjqRnh06VAgpiZke80YWIDbJkfKP3sUXL0pk8aDoBZ+1df31g8hLUYdhtg32K5aeUMeNVwjYo7s2UC+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SA1PR11MB8349.namprd11.prod.outlook.com (2603:10b6:806:383::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 12:26:36 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 12:26:36 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Update host tools for rust-cross-canadian
Date: Mon, 11 Dec 2023 04:26:13 -0800
Message-ID: <20231211122613.2429111-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::19) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SA1PR11MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 49819e79-e94c-4084-c94c-08dbfa446af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aj67O/p4UPQaOik9kOamm3y0HON/IfY7OR1vT4I+jjyD4ZsnMUdgo14qB5HMDvxbflGAZlU2Mcr68J1BRyZ/YH02JwuOhqsFDRgvgD6G5QooswW+w99msjhA0XjqIc+mDtN55pYpjHZcNhA2XyDXGKgsmmBOal3j6sdqeTGzHfRA3yh4OIStyUIRxfdjPztAYoT+f5kzO1PAwyKkNbLQo0+cYGgVSJLVXdXrFhXOqznamOJVd7Cir7S/fWLjF+LYmpqFHr6/GhribDkT1TNfE4DzL8a+ZMP0YEJOgmILXWxJsBRA1e5OSi1KHAGdReMyQOiOpuYKnkDk2UCPCOrFF64zk0L7ylQU6wGYnevYV06KvVj1t9rkt9e4M8JYDBv6r0sLLLeimUzihsusd8SsTR+K78O8hrM5EkRfSCXyUg09hAz4OHnzBbB24aCc1XolD5zbbVrztrqvMEqMwvINKZxGBv2m2XBR4VI0trKo0N4tEtEKY8HUKrDWiNDo8B/dS08R/oTQdA0bOgu6M1ttT+qd0u/SqsmkpVJ4ufOoXqvUX2O/Os98J/cM/XFZ3qmoh6jjelLzZdwZICwn6D76T+8+qSiM0YmvC8ldfCXbXTntJyKbMwUBAfUdnAgSTAbZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(2906002)(478600001)(38350700005)(41300700001)(66556008)(66476007)(6916009)(66946007)(6486002)(4744005)(316002)(38100700002)(6666004)(86362001)(52116002)(4326008)(8936002)(8676002)(6506007)(6512007)(9686003)(36756003)(5660300002)(1076003)(107886003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ILl1Zuza5+pBNvjiOtIrG4tOKUZNAsX9eoziYefPDF/qXIZkwekCacUye07G?=
 =?us-ascii?Q?9BOzBl/QneV22d1M3PCMRVGpZBhBBbhnspVIB/A+CnwmN4aKmEE03bo0oCsi?=
 =?us-ascii?Q?ZZFdvVmy3g8QMo3sP1DrA/pGtYnb0QNlNZxEV4dSio9C7v2RBlUnBpOoZPUg?=
 =?us-ascii?Q?jXfd4xO/7Src/xP3hLHVAovHLiet7Z5qrWs59JrAkfRPF0dcIEAGpnk56+5J?=
 =?us-ascii?Q?2u5tqUbuq6Y77UMRKikTwu6F82hYkmnH7NfHsFVEXroLulB/7e+TUAnuNGB8?=
 =?us-ascii?Q?uie3Dk6nwvUjdIdIg/c+E7UYWyhYx6J6AxjrIoJlXIqSm4kZH5SupwkDY2vp?=
 =?us-ascii?Q?gOV3whgJ85/SfPGweWKXepyVu021XlgyFNOqr6PVaSYyK7xXOKo2GqscGbvm?=
 =?us-ascii?Q?zYWW/Vsj/e8nmjogWXQdu9XnH1EzHQiPA+VR5H7FAtXb4reydX2UaxNLpgvV?=
 =?us-ascii?Q?2AzGqjwvXpjc9hXXDOqP0e7IDQ1i2KC1Pxp0DMQi0ZNlj+fx4B+moR1gcYGO?=
 =?us-ascii?Q?3duiMxieukDg4IUqGaYQ7PfDq47aq8v54aZ5LmlUtvHHZc4rXE6izjrQHzsA?=
 =?us-ascii?Q?IS32UKxKH0CA52ZL7krpDHlOMqnl1TUdPW+zjq5MJciIS2gIzPiFlAzeJ/Qj?=
 =?us-ascii?Q?l/UhoiY6Iv2N/0k3kYhDl6kJHQIcgvzJWshSggksmW2Li/cmwEMm0drj7SpQ?=
 =?us-ascii?Q?wmzIkDod8ydvk0G/8qnWmpjoe7KNvgHYGD01xjAq7V0j62POmXY3CDICzxW5?=
 =?us-ascii?Q?Xc6HIA0K58zcMCS7/WxNgNrMTsW7bmiZKs9Xu880EOHilHpw9a0qRUENKO5O?=
 =?us-ascii?Q?ylnmoBWRLettySPcyLGjaBj9OK7Hd8B1M96wpfOuZnq3MPNraN3mkXv0ISQg?=
 =?us-ascii?Q?Jsgb4OoNgT+7/juXIgpivAWnR3HZ22aYGH5xT/Aha8VdN2uod8eQ9MuXAoHC?=
 =?us-ascii?Q?2YTuzOtbZISMVWFWx9yNhN7jin6iqjCG/iIwwS/fLgDKxuHQqxpDdWlEBgaa?=
 =?us-ascii?Q?EBDzskoauYQJ8AhLASg86VeS/k3S8jTCU+tJ0g6rDBMxbP3njxuboeXdw9v1?=
 =?us-ascii?Q?sgIyg6eqYpA2hqgfGi4f1f7JWNyIR4c2LYxOS88mxjRPJF6orn9Rvg3C8PyE?=
 =?us-ascii?Q?IC9GGv1Y3DejThIkX4IVHoRtZbohHWNwJ+VzpfAncFHVn6IVLRyJPV8gkJbe?=
 =?us-ascii?Q?1N6MIfDnIzyMLDihuzci3qRjZg85o1Cz67zo2oV1H/KGW5mnnhe1v+/SW+CG?=
 =?us-ascii?Q?zyNRHgxESEzBN72t6yS5Yk9n0Y4y5BkSgt5Cxs8DIzPDUIHqjg8W5eppgKYM?=
 =?us-ascii?Q?/WOjqYDlN+U7BOcZ7ECz6hVrOMmhwILgAL13jGG94PeVRYrZbjr9B8K641dO?=
 =?us-ascii?Q?t7bmJayMXcdMSNa0RtxUlIgnEVWxQgpwWWLJ3sZJR4nNSNT+0TagpF1h8ocY?=
 =?us-ascii?Q?tFx0gyL8oqonKpXzejRe162gAjo00oArqAVvQP1i7kSflcbX/h/lyAVLNB5/?=
 =?us-ascii?Q?i0LNji3nqcMKl2Kde7RAA5OHAFQDzjy3Y2qvX6E9X0OsMvoRtC0Zw6/C56N2?=
 =?us-ascii?Q?wiskX77n9sBwyT7ZucmZSEqz+LogadS4LRSSA36GdJE9zRBOEDcUQ3RGZYcl?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49819e79-e94c-4084-c94c-08dbfa446af9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 12:26:36.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHcVU1CZc0Y+76Dhya/lqiyM57GN1NIG9v3V2uRrUeC6bhIOcQRVp4JhjzUZ+lUbsKiPLPiMzeo28+zGsGG5+0eLf+iQbwRJz7KQh1KVtzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8349
X-Proofpoint-GUID: O26WOQOAMSdD02oxH06gJSLPYz3qzMnw
X-Proofpoint-ORIG-GUID: O26WOQOAMSdD02oxH06gJSLPYz3qzMnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=454 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 12:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192164

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15082]
Packagegroup-rust-cross-canadian package requires rust-cross-canadian, but the necessary libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library is missing.
The fix adds the libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library requirement to the  SDK dummy package, resolving the dependency conflict.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..dc3ae1edaf 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -10,7 +10,8 @@ DUMMYPROVIDES = "\
     /usr/bin/env \
     libGL.so()(64bit) \
     libGL.so \
-"
+    libstdc++.so.6(GLIBCXX_3.4.30)(64bit) \
+" 
 
 require dummy-sdk-package.inc
 
-- 
2.42.0


