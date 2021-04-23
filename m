Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.71])
 by mx.groups.io with SMTP id smtpd.web12.427.1619190008600142455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SsPypW97;
 spf=pass (domain: windriver.com, ip: 40.107.236.71, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYLy6lcWIv+SgSPnwqIgmu1NL2Z/NEXIqAmCwJ6Mb/JtYBjTEXOQ/uFcXw6MftRM4jvZyqokvKFysqV74zKxxUg+0MPlJFg2KZCenbtZqMr8WAWYOYlEknO2uf7dH8slIn2wI9isafrdLkMsbId0j7D7fIZenf9Ia7VZGOM19CS10NyGmzE3k892+oNFU9gJpHKcHV5XrnAgivQEm2jTJND77pIYgSouJwGyLvn4VT6DCn5qIyiavTj1YBvcgfZDUXKJhoJ5KyKXdpkvuKKkzHURQ7pIytHjh3mzWD5H0H1Du2gmBUtPpqLOPal7fd0QpAqftEzQtmarK5W+/kd2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9hrQ/jb5X0fJsLkdrJ2FTbpLK06FpZX+AR91SVz+rI=;
 b=e8l/RmihOXZv+V2TtBnMrGVdrKQ5mEbMIK3rbADUcaPBM6ZSW3/Ul2W5rBRPLLPSGMg5u0oEbfUxOc/XN1YRJOJPzEaHJVsGi0ad21Cp02p2lS8J+7U9s9Tax3aOWCzG2HjYcEZat6gaJITugMEkHt73cghUyNylCnU6jVnk9P+MF6APgOd+g7cCBHAGkn+4/Z5deve7AOAM7WnAwBUr7rEob0rM0JSDXoMwjZu2rxfMF2cgbnWAheo+3W1bUsBJ22PPkoOYkOyPl6UvkxnNmYLrGnCZflBOaa6rwhjDVTZ28BXmP8XzJta23ZXVkdsGvlbJotvXl5jWIFyDPYniEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9hrQ/jb5X0fJsLkdrJ2FTbpLK06FpZX+AR91SVz+rI=;
 b=SsPypW97+J/iSdKCOg8Kj0BogaxuqnEdBX+rLPdeIudbH/l+IiHwFcGFV2Oa1/0h1Qrwd3nWSLbe8OPzcS8zKLizSJmSFrkU3a71O46SWLdR3+MwjA7iffkxAWT4Go7Z5joOSvn+6d9Rd0bzZz6NjreEqGYUyeNOYR9819wumrY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 15:00:06 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 15:00:06 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: yf3yu@uwaterloo.ca
Subject: [oe-core][PATCH] libevent: Increase ptest timing tolerance 50 ms -> 100 ms
Date: Fri, 23 Apr 2021 10:59:53 -0400
Message-ID: <20210423145953.20495-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR19CA0003.namprd19.prod.outlook.com
 (2603:10b6:208:178::16) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR19CA0003.namprd19.prod.outlook.com (2603:10b6:208:178::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 15:00:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 051cd00b-b29a-4fbb-5a32-08d906687af1
X-MS-TrafficTypeDiagnostic: SA2PR11MB4987:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4987FABB803D21311CB5E3A180459@SA2PR11MB4987.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2x9KdE2Km2lq3FTbTggbOcECL6pGrWciVxtzQ3+9crYxFrWUzAAOXJy6g/p4Gb6yXYUGC0i69Fb2zSf5ziy0xRP76eXr3u9gDCaJtP5xp+0A9RtCre5wLOcRuK7PnZNc68P0re+iSGlYCSPVkpm4RMxAj1mK6PYunAXnHYj+0M9jUQtiTOJNf7HSdiW2FEs3+2qjfubXbOP29uxxo5FIXlHzbt+p/Em0HdiaQzQRHDbCrQpFlOwm2JclWS7OD7+7Ant+KoGJh24dsdl5e1q/+rviETjPFneCK4lRXNSrkGAo7c75TDGqlZiMCD7yt8v+G8cpgB+zHlzCAvUxKWwHCzLYQfVHRLj/gEU+N3qMZAEG9ILey2S7sFnD+GhgkihzGI4r91Hno4sL7WEGlW6RJUHdXWnQubwsQ1tIHS0kEmUzdPn4OPSH1/5+GyuDbEN9+2VNME01uy7p75UdBlX7nKGRp/YK/agO7nsEtzMYmO9BnytdYpmR8Osg8LvUgrD9KklrEcC14pcB63avign3sWnsig5uP1w72G8HV5iunZ/2uqjH5Z4NNMlp+NVVLxGEthDpg56+2HCc5uLViLP2t7iKIpSrc6y+SCBORAr7p+BQtKwBno/KWR482tgDprKj0JvTqK8HsLOTzvwTC3k0kVyQ0FGctQsLMDweKMa295dyqwceh7zoomqWkzrta+QhjmP2ijtDOscqZb9uRSjSY4UVPASrhMm8CbFqHW57qz0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39840400004)(346002)(366004)(376002)(86362001)(38100700002)(2906002)(966005)(83380400001)(4326008)(6512007)(6666004)(66556008)(478600001)(6916009)(8676002)(16526019)(316002)(6486002)(6506007)(66476007)(5660300002)(38350700002)(26005)(1076003)(8936002)(956004)(66946007)(52116002)(186003)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?iePyYF1qBqrL+m2iDL1xwnEeySeJiZyVM01qHoKO6iZkSAOWf/BRhd9WrLG9?=
 =?us-ascii?Q?wEO134k04X0+X6nCcK8zKn01gWX5AEi5sYRw4YNnWfwpi5RdZ94WSAbjIcEq?=
 =?us-ascii?Q?WktGx2hCtTjp/DcrXBUVLQi2BkOsX7Huw8qaEcusd3dE0dk5Pd2GaS2gUMr4?=
 =?us-ascii?Q?JITWEggP7OcCPCHLSOMY8wun+7xwAQPWrhwR2j+srMd43WbfdzTPMhPN3AuI?=
 =?us-ascii?Q?gY8vIa2mnr851qPDgUY7IQVaos0lAnTFSKUZWQc2RvDZRsuYv9uR4dnri81R?=
 =?us-ascii?Q?YA4BTV85r8DK0DlK9qJB2Fyerb7n9sDgzQiWwuU35ZZkZvT4kPlHDCl/3aca?=
 =?us-ascii?Q?7lyx3ihlBByOE4fj0RXiIZXqDGi8nmIfxuWBvvIlAWFleyUdVnZeBFiC4dZv?=
 =?us-ascii?Q?40iHABiK1b8ttBoubrD/hDiFSsUuAby8aSJgbMwQq6pPjUQRbBhZSCJTaVCf?=
 =?us-ascii?Q?esbZv7pNrua56uuUmswNqMMOyeLiSi5Fzl6JWi56EN2hKLdQvCyLN2z7adN6?=
 =?us-ascii?Q?rsudyp7NkBiUisPjsZEpYLqzzVQ4mznuFSd3xN2ssB06m1KAtC1NcKtgJjRK?=
 =?us-ascii?Q?QuZVjoGUuDY2tgTvIXONBe5EyvuZn0yzh0bqM4ko87kOfkeaYq7tmj8yJaZH?=
 =?us-ascii?Q?kYlw5+pedHM9S8gK5Ps4LmdUR78ucKJs0AXvQ+B5f/zQqvD/sT51shaPT0j7?=
 =?us-ascii?Q?b/IBb/9GANVA+vk3+goP2ny3DHajBOsG6Ibv2Cj1G5MVFZ/G4CsjgTfyNd3c?=
 =?us-ascii?Q?e7P33wQHR76P4d39gi/tY+DNHPx/Fpc3difrHSfeLb5RWhRtsOxRNS4pEpHW?=
 =?us-ascii?Q?sat0ypxns7itDtdFCxK9MR66OU/LR2pGcJJyXEhrzEOtPDInQJF8wmbz2e/r?=
 =?us-ascii?Q?ObKPt68uPZhl0NSkAaR/xV41ofS5OvLqjzwPlr6wShbBbp6eMu7leGHSVdV7?=
 =?us-ascii?Q?hA0Oj4O9U6h9rsJQ4+7P6oY/4ah77cUNYInfSiLl6UjznH0Q7EIGBomzDFq+?=
 =?us-ascii?Q?sVootOgcaps5O8Z6bw898RdTsLGmwT9ZkZ4v99yG8KjUIz25+PqUSRZDmV0n?=
 =?us-ascii?Q?yII5lRzVw1yPQGOmP9LTmpO+QlbwB2tM6SSg8RPH8mXb2bIuAG0UzK8GM3x6?=
 =?us-ascii?Q?AcCtzgkrChv7BCjMCZtdDUd/Q5wkgiOD4APdmJKwH/b5zmZIXF5jaLk8em3g?=
 =?us-ascii?Q?Gker8ABDzrl+fl+dC4kuruy3V+r0jmwCoWLp3O/uoEWx3tDMy6K7a6Netm2F?=
 =?us-ascii?Q?Nzpbnfwb4/i6JWPqgtrAbjYny0t/d1H8vs5lFG8sq+EQFl9Swi9NUxUyM5Lr?=
 =?us-ascii?Q?TPhT3K0H0Y3oKP6jG2QECljx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051cd00b-b29a-4fbb-5a32-08d906687af1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:00:06.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFXpjjt58Np6B3OAzWgaRWp50ngdU4fY/3ZqhEsn/KTzpgVW4aSCuPa+yr/dMnaVBF65IvRS8ucHwgK674Ywvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Adjusting the tolerance to a more reasonable time
given the load on the AB and given the high amount(100) of
events some of the tests like `common_timeout` generates.

[YOCTO #14163]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...ncrease-default-timeval-tolerance-50.patch | 33 +++++++++++++++++++
 .../libevent/libevent_2.1.12.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libevent/libevent/0002-test-regres=
s.h-Increase-default-timeval-tolerance-50.patch

diff --git a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Inc=
rease-default-timeval-tolerance-50.patch b/meta/recipes-support/libevent/li=
bevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
new file mode 100644
index 0000000000..0b20eda3c0
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-d=
efault-timeval-tolerance-50.patch
@@ -0,0 +1,33 @@
+From dff8fd27edb23bc1486809186c6a4fe1f75f2179 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 22 Apr 2021 22:35:59 -0400
+Subject: [PATCH] test/regress.h: Increase default timeval tolerance 50 ms =
->
+ 100 ms
+
+The default timeout tolerance is 50 ms,
+which causes intermittent failure in many the
+related tests in arm64 QEMU.
+
+See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14163
+(The root cause seems to be a heavy load)
+
+Upstream-Status: Submitted [https://github.com/libevent/libevent/pull/1157=
]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ test/regress.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/regress.h b/test/regress.h
+index f06a7669..829af4a7 100644
+--- a/test/regress.h
++++ b/test/regress.h
+@@ -127,7 +127,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, cons=
t char *sockaddr_port,
+ 	tt_int_op(labs(timeval_msec_diff((tv1), (tv2)) - diff), <=3D, tolerance)
+=20
+ #define test_timeval_diff_eq(tv1, tv2, diff)				\
+-	test_timeval_diff_leq((tv1), (tv2), (diff), 50)
++	test_timeval_diff_leq((tv1), (tv2), (diff), 100)
+=20
+ long timeval_msec_diff(const struct timeval *start, const struct timeval =
*end);
+
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipe=
s-support/libevent/libevent_2.1.12.bb
index dd4533cce5..6d53fea5a8 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/libevent/libevent/release=
s/download/release-${PV}-
            file://Makefile-missing-test-dir.patch \
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-w=
o.patch \
+           file://0002-test-regress.h-Increase-default-timeval-tolerance-5=
0.patch \
            "
=20
 SRC_URI[sha256sum] =3D "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037=
a27d346b0403bb"
--=20
2.29.2

