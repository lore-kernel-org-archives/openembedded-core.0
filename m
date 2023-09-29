Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E4FE71D2E
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:10:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16745.1695993012202932138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UPzD0vsg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8636305630=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38TAhmJH003692
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ua5HZvqudTZOzUc8c+
	yv4YW42EIrOxBLG08JII4hUlA=; b=UPzD0vsg2jvn6jCk/iQa6m/U05WNLyrmhE
	bNi1PYzNLO8U5NGkqDIlKJ9KcBoL2Iwr7t/04sUMdDrZ0BLj+NRCUPcRFMXQzz8T
	RuzmrdKuzShqUrLBCS8j1X9GNuCNhxLkSzT8QGxfLN45HBnFH0dQmw0ioTwllhbl
	z7e3C8+d0ubR4/mgpyuaNjPuMx7mOrXMniGgGgVmntvWK5fhaxIt5BUh6Xg1fagw
	Ty6XZICzCN6Uc9xZq77ilrNw0iaNZji5CG5XVdBpxyX/Hn4tNOqLv51CQWV6Lqct
	G0ea8Zq78Ns517p5ypcOvfeDXDBItkE0zWqqG7ePpKiTqBccLgzQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x677n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:10:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZNqk0UMpJLs9PiOlKaGbuNOS9hPybj02w9LSIwrftdOi8vNmVUoA/SaiT1crXUMYRNmoRLd1VN5A5eHL7ht4FZfnCHWtBMJH/y/ADQXrNTJwFvDIIEtmjbMLHrC627jtI/IungSCtVaUo9XfnmVPVGplHj+2luGiMGvgbyw5j/G+pIgVUw2f9BEj8q8roXliBWNtTMWpfyHJAzXLlMeThJ+RnYwRsGRkE39H8SNs2P9PPWp7Xix+MWzqnH1g6RWXJP7HbK6JT6vFlWiAdNWKkcF47dUbw4J8JVqFu1OsljZBzDe3MD9Xn+c10JRuTKwmWAZVKOl1pztV9rTdxb7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua5HZvqudTZOzUc8c+yv4YW42EIrOxBLG08JII4hUlA=;
 b=NSZpekuIkXROgyu7RwNahWGQsFlBQ2cJ8dF9UDND586glomjOpM+cNj7Wn1qoK0yRlcUGLYZQzMsnl4e2EplLLV90TODu/lLqmUs2rBV42fxiCuVd/p0qC2Te+ukItxn7Os7m29tyE6hIBhAkWEPVm5tp446eb7uNkAG+u8AbYnpDgZbkcnZ6ReAm26ASPiAjLKMYUP2Niraj11lhx7r2LQ/QA5nX+UJF4vWR2EX1eJgYJkj6NISPR1afXwhvCz+GM/B8cIEuQSQIdn1EHgdYc9twBaqN0X6xTjnjg8G2oOAiQ22Y3jAjaI8gHsVSr9Zaa12b2E3QlcNhcSeWpuf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 13:10:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6813.038; Fri, 29 Sep 2023
 13:10:06 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [mickledore][PATCH] glibc: fix CVE-2023-4806
Date: Fri, 29 Sep 2023 06:08:38 -0700
Message-Id: <20230929130838.4085039-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: f0da0f5f-84ba-4a0b-b0cf-08dbc0ed665e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BSGO7q7Q8rgIPgPMFl0oQI2D+GA9aY8R0F9Wyi6XArbOZ8U3p34y7cDb9H0ddTFB/wa/mqPe5SLYpvGj03R2RmGAn9dAk28Z8GhUSif7v0e+F5OtNrpuI31XxIltFA3xfsmjQMUtgHxMgkQhKPh02WnRNJHNZjPFsiabz0nQ8pyAE0boSrftRJcddoR9XVbFQHZfcoTdzWo8O1wKihKX6P9q8kT0YfK4vfAmN9hD1B+7crYDcq91fcfGynku12OhUSdse+oDM10Nj9dCzlEOVB3dokph33sUtBNakQeEVgKmtOx8mB60USrucsXDZbJ7ZbWWzzD47VABpBEZL3Atl4L0JrmUwLuIMCXlrL99X+PWz6YErxAgz8LJ1lHNn6x2vjKemQ36Wy0R9Jw32j4zN/aovRbN15eE0BwEEb9cOWEZM2ED0SCBrB2C6JypJcg21eOB5xSScr7cOclwFI7UfwPpaGy4JlOIxxypFBEbs6jBwDl2ty3xeym81KzRHgrmaWV8iVjXNFMlsnANC/kDyKe8lugws/QXOgARL+e1q56lGTz+qxcshMAw0idp89ar7lplSTKzs4KdC9B0CUWQeDrOaURwbXvQYao4gIn3LjuRgMh5Cv9YxUPqsMXvvDy+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(39850400004)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6666004)(478600001)(2616005)(107886003)(66899024)(86362001)(36756003)(38100700002)(52116002)(6486002)(5660300002)(38350700002)(1076003)(83380400001)(6506007)(4326008)(6512007)(2906002)(8936002)(8676002)(41300700001)(66946007)(316002)(66556008)(66476007)(6916009)(30864003)(9686003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S9hgguqgm5FZDW+YK/eg0yzx4+xdzCefmJDO7UNfBeIUtXrel4/9YLc4HAov?=
 =?us-ascii?Q?pdH7pdCTXDPmeOoXg/Hv51d3BDtqsk2KKUdygoNJPAG6qA2jcfefv5YVUfda?=
 =?us-ascii?Q?B1IHbNYvNRLjzM+JverjhoeU1gUBum6pOihjiAMXsDMHtCXaZQeVYeHdcY8u?=
 =?us-ascii?Q?V7yRScV/kU463GghKJ6TOavXd48c90D3CfQ5Hv/PAye66D5yua0yeKxOTYIQ?=
 =?us-ascii?Q?bytyTWORCA1m178yf2EOjEHtzpJ5GuQ8Q4uR2/2FfE+FNX92yR84MOOrb81T?=
 =?us-ascii?Q?HljXKpNLnNdJnW/q1ddNfbEbtnUTpGBd2szh/z+NxZ5IqRYC5Ab/3Dejdlov?=
 =?us-ascii?Q?pgY5e3RtyZC3faakScH1QGTj3z+kRQo2bWLmZ7KjPgU1glDQVDm0YlxvQuVo?=
 =?us-ascii?Q?6Db97xTpkmgexc8HjINmj61mB5SiopjTVs0BrKkWyoctgqL1i+m397MFwqX2?=
 =?us-ascii?Q?ChtR4D4tdDjQppSb2xZVy7zBgoSfT1ehd281sfPVZZYeZz/lkEic0vL2OtSl?=
 =?us-ascii?Q?fRl8qOl20cWNjiN22gkK6cYLRkNk7aCu4x/WpFgWRN3tI15fp9azf1LqR7qd?=
 =?us-ascii?Q?v+Km0qQWQbhnBRb7hfdoEpzu8cNn3dbOFx04ISzxe61j/LcAzp5pJpW2NzlR?=
 =?us-ascii?Q?pFsZCvSzWw37Tvs7c6sBLjrn9jI895qNARG4r4rnsLIkMdDtnn0X0PNvgd94?=
 =?us-ascii?Q?AoNoNSkUrOOwajP5HRtZ7O8/FfQ1QE/u6vdQcnwNJEYQPGKgHqOTIKCkAUd5?=
 =?us-ascii?Q?Sr/YDDScSVbRaLSpqVoyACI3rOzgGuVPsiZcUJXBcr3xGkJ/o378oaViCh9/?=
 =?us-ascii?Q?h+LZpqq7p6Uc5wFCDrmqYk0FODtKB7UNNmb0wzxOsaP5vFeL8h8aDz0kIi29?=
 =?us-ascii?Q?/YMnE1lvgtW6Hc1q9qZ/LHE9+uiWgU56xwl+62X7a/2JkE3Em4X7y2absQnx?=
 =?us-ascii?Q?anfLq8IWRRVM24WIfxXiHh6Cw8qB72H+oxb5rcOs9tWFcDMT+T+ElsADvDmj?=
 =?us-ascii?Q?O0V3HdiihCEWMc6p12jky1aVt0N+4O0xXqtSGWyZPpwKsJptfYUDL8S9PM83?=
 =?us-ascii?Q?0npVWP1YO8rw67Mu6hhYz4ogopU6NJ3a07g5B/ZQF0rtGhmyy5HCVCsZEczI?=
 =?us-ascii?Q?xkU9GATfzatHEM8jo0WFovPq9JeaJToPzxpLGUdJ15XoCc3Gj/yY2bBAt5qY?=
 =?us-ascii?Q?+stReUb+qu/wkJQQT6zb8/7tbOrTBqFLw2LpJS0kPGsX5/HZHwahXqT8nR9/?=
 =?us-ascii?Q?gzM9rUc9WF3aB1XVXm6Rshz+YWKgWUTZP2jBf6CrXRqS9FTGJztwvvxbrCAF?=
 =?us-ascii?Q?8vQrNrn6KeTP7dU1LN9nL+YcDgXo+XeQqd8iuNvneHj3txnfaq4EsHhuaiKg?=
 =?us-ascii?Q?Ose59PHqwkECvDYg5dnC0OmeJvcE9BAVbTwYwJH2XHYo86sAOcnKhrzaz5Ka?=
 =?us-ascii?Q?SW+fYdC5Gic+/e7TjOrGZB+3cAB8+25HjOBkEpIId9Ji6jZuJLad7VaSt2dO?=
 =?us-ascii?Q?V256NOf6TOncxellt1Mp/IbX8wgXW+nFicSDXj9CbxSmTD4xJkUMF2jbX6LD?=
 =?us-ascii?Q?8FANuJcvpWM6kbt6+HGmhX2kvV8K3keQMS9FTfYwNwsVXDVSpZPEIF2SpCCb?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0da0f5f-84ba-4a0b-b0cf-08dbc0ed665e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 13:10:06.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZTmSYBUADxmhYHx8nAtNfsoPANGA+FLcmC/ZZzYljgHBReEUjNCjyhD7/3y2EKh+rcTrO8NlUe5DCS+wkzM4jC2qy4sicl6Y8lSO7/T3PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-Proofpoint-ORIG-GUID: DXfXCz_O9lQbwvfBzNTAopm1umVbY1qt
X-Proofpoint-GUID: DXfXCz_O9lQbwvfBzNTAopm1umVbY1qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_11,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309290112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188405

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=973fe93a5675c42798b2161c6f29c01b0e243994]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0024-CVE-2023-4806.patch      | 342 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
new file mode 100644
index 0000000000..42d91fd340
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
@@ -0,0 +1,342 @@
+From 973fe93a5675c42798b2161c6f29c01b0e243994 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Fri, 15 Sep 2023 13:51:12 -0400
+Subject: [PATCH] getaddrinfo: Fix use after free in getcanonname
+ (CVE-2023-4806)
+
+When an NSS plugin only implements the _gethostbyname2_r and
+_getcanonname_r callbacks, getaddrinfo could use memory that was freed
+during tmpbuf resizing, through h_name in a previous query response.
+
+The backing store for res->at->name when doing a query with
+gethostbyname3_r or gethostbyname2_r is tmpbuf, which is reallocated in
+gethosts during the query.  For AF_INET6 lookup with AI_ALL |
+AI_V4MAPPED, gethosts gets called twice, once for a v6 lookup and second
+for a v4 lookup.  In this case, if the first call reallocates tmpbuf
+enough number of times, resulting in a malloc, th->h_name (that
+res->at->name refers to) ends up on a heap allocated storage in tmpbuf.
+Now if the second call to gethosts also causes the plugin callback to
+return NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF
+reference in res->at->name.  This then gets dereferenced in the
+getcanonname_r plugin call, resulting in the use after free.
+
+Fix this by copying h_name over and freeing it at the end.  This
+resolves BZ #30843, which is assigned CVE-2023-4806.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=973fe93a5675c42798b2161c6f29c01b0e243994]
+CVE: CVE-2023-4806
+
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ nss/Makefile                                  | 15 ++++-
+ nss/nss_test_gai_hv2_canonname.c              | 56 +++++++++++++++++
+ nss/tst-nss-gai-hv2-canonname.c               | 63 +++++++++++++++++++
+ nss/tst-nss-gai-hv2-canonname.h               |  1 +
+ .../postclean.req                             |  0
+ .../tst-nss-gai-hv2-canonname.script          |  2 +
+ sysdeps/posix/getaddrinfo.c                   | 25 +++++---
+ 7 files changed, 152 insertions(+), 10 deletions(-)
+ create mode 100644 nss/nss_test_gai_hv2_canonname.c
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.c
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.h
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.root/postclean.req
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+
+diff --git a/nss/Makefile b/nss/Makefile
+index 06fcdc450f..8a5126ecf3 100644
+--- a/nss/Makefile
++++ b/nss/Makefile
+@@ -82,6 +82,7 @@ tests-container := \
+   tst-nss-test3 \
+   tst-reload1 \
+   tst-reload2 \
++  tst-nss-gai-hv2-canonname \
+ # tests-container
+
+ # Tests which need libdl
+@@ -145,7 +146,8 @@ libnss_compat-inhibit-o	= $(filter-out .os,$(object-suffixes))
+ ifeq ($(build-static-nss),yes)
+ tests-static		+= tst-nss-static
+ endif
+-extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os
++extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os \
++			   nss_test_gai_hv2_canonname.os
+
+ include ../Rules
+
+@@ -180,12 +182,16 @@ rtld-tests-LDFLAGS += -Wl,--dynamic-list=nss_test.ver
+ libof-nss_test1 = extramodules
+ libof-nss_test2 = extramodules
+ libof-nss_test_errno = extramodules
++libof-nss_test_gai_hv2_canonname = extramodules
+ $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os $(link-libc-deps)
+	$(build-module)
+ $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
+	$(build-module)
+ $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-deps)
+	$(build-module)
++$(objpfx)/libnss_test_gai_hv2_canonname.so: \
++  $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
++	$(build-module)
+ $(objpfx)nss_test2.os : nss_test1.c
+ # Use the nss_files suffix for these objects as well.
+ $(objpfx)/libnss_test1.so$(libnss_files.so-version): $(objpfx)/libnss_test1.so
+@@ -195,10 +201,14 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version): $(objpfx)/libnss_test2.so
+ $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
+   $(objpfx)/libnss_test_errno.so
+	$(make-link)
++$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \
++  $(objpfx)/libnss_test_gai_hv2_canonname.so
++	$(make-link)
+ $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
+	$(objpfx)/libnss_test1.so$(libnss_files.so-version) \
+	$(objpfx)/libnss_test2.so$(libnss_files.so-version) \
+-	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version)
++	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version) \
++	$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version)
+
+ ifeq (yes,$(have-thread-library))
+ $(objpfx)tst-cancel-getpwuid_r: $(shared-thread-library)
+@@ -215,3 +225,4 @@ LDFLAGS-tst-nss-test3 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test4 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test5 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test_errno = -Wl,--disable-new-dtags
++LDFLAGS-tst-nss-test_gai_hv2_canonname = -Wl,--disable-new-dtags
+diff --git a/nss/nss_test_gai_hv2_canonname.c b/nss/nss_test_gai_hv2_canonname.c
+new file mode 100644
+index 0000000000..4439c83c9f
+--- /dev/null
++++ b/nss/nss_test_gai_hv2_canonname.c
+@@ -0,0 +1,56 @@
++/* NSS service provider that only provides gethostbyname2_r.
++   Copyright The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <nss.h>
++#include <stdlib.h>
++#include <string.h>
++#include "nss/tst-nss-gai-hv2-canonname.h"
++
++/* Catch misnamed and functions.  */
++#pragma GCC diagnostic error "-Wmissing-prototypes"
++NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)
++
++extern enum nss_status _nss_files_gethostbyname2_r (const char *, int,
++						    struct hostent *, char *,
++						    size_t, int *, int *);
++
++enum nss_status
++_nss_test_gai_hv2_canonname_gethostbyname2_r (const char *name, int af,
++					      struct hostent *result,
++					      char *buffer, size_t buflen,
++					      int *errnop, int *herrnop)
++{
++  return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen, errnop,
++				      herrnop);
++}
++
++enum nss_status
++_nss_test_gai_hv2_canonname_getcanonname_r (const char *name, char *buffer,
++					    size_t buflen, char **result,
++					    int *errnop, int *h_errnop)
++{
++  /* We expect QUERYNAME, which is a small enough string that it shouldn't fail
++     the test.  */
++  if (memcmp (QUERYNAME, name, sizeof (QUERYNAME))
++      || buflen < sizeof (QUERYNAME))
++    abort ();
++
++  strncpy (buffer, name, buflen);
++  *result = buffer;
++  return NSS_STATUS_SUCCESS;
++}
+diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c
+new file mode 100644
+index 0000000000..d5f10c07d6
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.c
+@@ -0,0 +1,63 @@
++/* Test NSS query path for plugins that only implement gethostbyname2
++   (#30843).
++   Copyright The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <nss.h>
++#include <netdb.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/xstdio.h>
++#include "nss/tst-nss-gai-hv2-canonname.h"
++
++#define PREPARE do_prepare
++
++static void do_prepare (int a, char **av)
++{
++  FILE *hosts = xfopen ("/etc/hosts", "w");
++  for (unsigned i = 2; i < 255; i++)
++    {
++      fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);
++      fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);
++    }
++  xfclose (hosts);
++}
++
++static int
++do_test (void)
++{
++  __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
++
++  struct addrinfo hints = {};
++  struct addrinfo *result = NULL;
++
++  hints.ai_family = AF_INET6;
++  hints.ai_flags = AI_ALL | AI_V4MAPPED | AI_CANONNAME;
++
++  int ret = getaddrinfo (QUERYNAME, NULL, &hints, &result);
++
++  if (ret != 0)
++    FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_strerror (ret));
++
++  TEST_COMPARE_STRING (result->ai_canonname, QUERYNAME);
++
++  freeaddrinfo(result);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/nss/tst-nss-gai-hv2-canonname.h b/nss/tst-nss-gai-hv2-canonname.h
+new file mode 100644
+index 0000000000..14f2a9cb08
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.h
+@@ -0,0 +1 @@
++#define QUERYNAME "test.example.com"
+diff --git a/nss/tst-nss-gai-hv2-canonname.root/postclean.req b/nss/tst-nss-gai-hv2-canonname.root/postclean.req
+new file mode 100644
+index 0000000000..e69de29bb2
+diff --git a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+new file mode 100644
+index 0000000000..31848b4a28
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+@@ -0,0 +1,2 @@
++cp $B/nss/libnss_test_gai_hv2_canonname.so $L/libnss_test_gai_hv2_canonname.so.2
++su
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index 6ae6744fe4..47f421fddf 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -120,6 +120,7 @@ struct gaih_result
+ {
+   struct gaih_addrtuple *at;
+   char *canon;
++  char *h_name;
+   bool free_at;
+   bool got_ipv6;
+ };
+@@ -165,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)
+   if (res->free_at)
+     free (res->at);
+   free (res->canon);
++  free (res->h_name);
+   memset (res, 0, sizeof (*res));
+ }
+
+@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const struct gaih_typeproto *tp,
+   return 0;
+ }
+
+-/* Convert struct hostent to a list of struct gaih_addrtuple objects.  h_name
+-   is not copied, and the struct hostent object must not be deallocated
+-   prematurely.  The new addresses are appended to the tuple array in RES.  */
++/* Convert struct hostent to a list of struct gaih_addrtuple objects.  The new
++   addresses are appended to the tuple array in RES.  */
+ static bool
+ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+				   struct hostent *h, struct gaih_result *res)
+@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+   res->at = array;
+   res->free_at = true;
+
++  /* Duplicate h_name because it may get reclaimed when the underlying storage
++     is freed.  */
++  if (res->h_name == NULL)
++    {
++      res->h_name = __strdup (h->h_name);
++      if (res->h_name == NULL)
++	return false;
++    }
++
+   /* Update the next pointers on reallocation.  */
+   for (size_t i = 0; i < old; i++)
+     array[i].next = array + i + 1;
+@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+	}
+       array[i].next = array + i + 1;
+     }
+-  array[0].name = h->h_name;
+   array[count - 1].next = NULL;
+
+   return true;
+@@ -324,15 +333,15 @@ gethosts (nss_gethostbyname3_r fct, int family, const char *name,
+    memory allocation failure.  The returned string is allocated on the
+    heap; the caller has to free it.  */
+ static char *
+-getcanonname (nss_action_list nip, struct gaih_addrtuple *at, const char *name)
++getcanonname (nss_action_list nip, const char *hname, const char *name)
+ {
+   nss_getcanonname_r *cfct = __nss_lookup_function (nip, "getcanonname_r");
+   char *s = (char *) name;
+   if (cfct != NULL)
+     {
+       char buf[256];
+-      if (DL_CALL_FCT (cfct, (at->name ?: name, buf, sizeof (buf),
+-			      &s, &errno, &h_errno)) != NSS_STATUS_SUCCESS)
++      if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf), &s, &errno,
++			      &h_errno)) != NSS_STATUS_SUCCESS)
+	/* If the canonical name cannot be determined, use the passed
+	   string.  */
+	s = (char *) name;
+@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct addrinfo *req,
+		  if ((req->ai_flags & AI_CANONNAME) != 0
+		      && res->canon == NULL)
+		    {
+-		      char *canonbuf = getcanonname (nip, res->at, name);
++		      char *canonbuf = getcanonname (nip, res->h_name, name);
+		      if (canonbuf == NULL)
+			{
+			  __resolv_context_put (res_ctx);
+--
+2.39.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index caf454f368..bce566acd4 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-CVE-2023-4527.patch \
+           file://0024-CVE-2023-4806.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


