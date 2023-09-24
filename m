Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE59CE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 15:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41418.1695569153635415382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fcxi2mFX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76311b4abe=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38OFNhFV006946
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5UgddR1ua/J9I92r6B
	/VBZygTJPq/auluYCKsoNR1rg=; b=Fcxi2mFXc9sM261W20AJyzvrNmL1WgV+DB
	wLuqkiVQ1pkTQHXz2+ItGUXBTwwgsF9uscjKzwAcuXQnfwijDjPoBlrbH2WELip1
	8cHarS2HsJeM01/rAod5VFqwomVefxBFMd7zoUncvW50Ia2cdPornxyObiQhja28
	nzz521NVmNfuULXhwsG5oayQled0796iJmomWvfStHwUCdBY2/W/90rSxuFsI3WL
	Qsu512DuqyN6EFEbXqqM8P9BQHcOTQ0vAATRlN5U/NX5dIkqiwoK6vZDBSJ1R10m
	EfueFE+cj5ZdEoAh1wCRoJ8w/QC1YZCczxV5b/tngUue2G1Z331w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06912a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:25:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsB24HAd59lWGbqZDIUVyZUAlqmOr1WWiP4E8WKTTRrEth+3ErFxTeiAIn7xK1LQlvGGqB5Lsi/tpFLtCs7MbSVEBVtjLhqfq2d6XIAjqr9tAU7rQzDig30I7+OEkjT9fkQz2bb/lYKYHvPc1dbrkTY+Gu2yJ5PuQsV9s/JrKCT3VOI7wpCqX+B6VSGEBxcePprnt8WfI3ZU3tldhS6C8mKnsNxVzoc4NvA7rT1snPkfDbvdHH9LrCVL09VCXCrKwvGvXgGGBYZ/+tk82mUpBGSF/8CK+y0TFTtqeJXyaItpIaRoAFOTVCDp+u1k9MGps4PfZsYdLkakMsctGarG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UgddR1ua/J9I92r6B/VBZygTJPq/auluYCKsoNR1rg=;
 b=HXwInZOkTHEs8hmyTjv82tFhnF1jIzUBguZ2ZLjGTuFNwCUTyIB1pmLAkHYEL0GAwPRIK/uJNPcdiVxyai8+uhCL2PPqrFsRoGMYhYbQm7WL6gqFr+/5xLiALbdEjc9qdjeeYrF35TeCxeuIOHq7v3TOVIXC/FuqMEjvomNHfBnqUGUmMYq7sBeVRnKolHlPtnJXq/Be8Hs13Fruv/MUbuz1vlsmHf36GCYZguSnUldr0zYBUXl4wJ6V/XDHplkTCi+H26bH6wqr74VBYf9BpLLIcDeda2MUrJzn81wWaPcVYDPuBFb4VDggWWvzK8IXeW4vT23ODYazEoRnZZ1DLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 15:25:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6813.017; Sun, 24 Sep 2023
 15:25:50 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [mickledore][PATCH v2] glibc: fix CVE-2023-4527
Date: Sun, 24 Sep 2023 08:25:39 -0700
Message-Id: <20230924152539.2615645-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:a03:80::39) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfd4283-47eb-4497-b6ee-08dbbd1288d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DUhzmXLLrfUQItwH/VgyumKIjx7ggpQajpaM4TM7gQ5vGKjkeDE/raVbYHnc+CxsXevc3EiLl+Ek9u+2jP3zPRSFZ+c+afeDhLmLE77T3jniCnb/DHw8Sn4hwDfwpqrxGD3KrY8L2ALd1ifmegk1V2Tt+eIdmxRiM/1hoxweJ3dFM4ARHzfSAF5e2DIgPz7g6EUwZRSnFa4wLBpZrt7GLkyW6FQo/bt53xfvf0X0ExGKxApH3qRYbjyDSvxSIabbii+ERVlfLBRFNJ2+B3rN4znem06tPgaT1CDpFpXclqrSzWyyo0lmlKsTRt+OPZKg4UzKZ2kE8QcQvSv/brWPjwimJdn4oiaDRSkkhvs/8CbP2rM3tiUhbXzRjWwxiLGhfIEnMk8s3NFQzYHoZbwHcVhWmmxteObyinu9EpUCKQR496sDo/0CZBG7L8t+ElgpNVwLz//lmUgj9CLRwqYhZg3aFAY1570ClALDPJGmPbxbRt02Dx/2dry3nraSTCoBCj6hI4BnkN3C20jIUtfpGHzvjCMyIGuryXzGQF2nZZeVat9lTnSaR+lMqfg4T0ZWj2BZddTbA24YZApo79E/pkRSKfsl0CpkQEO7dI67CVLIdyNV9DGE+MU5jjyycXDd4ECqtpU3rFLa2pb26kC6Mb46CYxUVBmKkPsGZo1YBvU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39840400004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(52116002)(8676002)(8936002)(5660300002)(36756003)(6666004)(4326008)(41300700001)(6506007)(9686003)(6512007)(6486002)(2616005)(26005)(1076003)(316002)(6916009)(66556008)(478600001)(66476007)(86362001)(66946007)(2906002)(83380400001)(107886003)(38100700002)(38350700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gDbrOJQRV7fWXqEYJejZ36xsaPcrfth3xeDq9OxS7kyMehHnX6xZTAt+59WJ?=
 =?us-ascii?Q?JlGhl3+AlNZa/7INCgkKun4xN1miDQho5e89eJ82tmjf/GzreHFn19SPT9wE?=
 =?us-ascii?Q?0lfamh5FBgWk2aXW4d26ghn8yS+lVsq4lIF8wj3AcEfog2h3mb52KCEO0DHq?=
 =?us-ascii?Q?YG1rnPW2dPEboGwnoCUSSyciE/Q4PZZvo7aEQCTLeCaXeh81tJix0HRO/k8L?=
 =?us-ascii?Q?j/vuz28jIdG6SeixH56ytMyC8CTBvkIGYxvDAGpKW6AWBIodE8vE9qun+qn8?=
 =?us-ascii?Q?I+igD1FzAP/WQrgaZdIX41s07i328RmtnqVjM3MTCgmuBx6G/BD1S9VLx7I3?=
 =?us-ascii?Q?nY4X2FhcEdJ6WQGb2gH0vTQxzIzeBLMysKQ776408jj/am78TsiGTZggovv8?=
 =?us-ascii?Q?ihrYgqSoiX5eb/yxVeO4BfG92LrUm2h87f6ZUBlnspHimqPnUt+5BlvL0XRQ?=
 =?us-ascii?Q?LOn20DjYR+Bkag7pLlotDBIUkNmFBh56NqEqmcHO6/7KDvkjXgd9zpyqERxc?=
 =?us-ascii?Q?X4qcCHI76yfBAGuW5ywU/1I9TAj0/NqQLvuxc1nmhKlEzbpH/4/TFk1tUF1z?=
 =?us-ascii?Q?2sUGbkORPINkQJGQB8qXrdA6AwhqmPpM4tWxzyx4NXzWWWXf8+LZn+u0kShB?=
 =?us-ascii?Q?1U5FyfWOv0qYb8CzUdD/Yzf3C7ycgkLO88hFL0VF0qlWrGK/xGQ/rGsDHxeg?=
 =?us-ascii?Q?SqvBeBffrEBJ+DdqGKcb7i4K0tqcPRV0+TaU0F9rShy6un6CS4fTI+3xGRdY?=
 =?us-ascii?Q?+tc9hBGOo0NBMBAuJo3M7JzhBbiqBrmkHdCLLd1dfJmRfj0CBh+MqntCOxZC?=
 =?us-ascii?Q?dkciXkCVg0DUXVEgxoVOBU9FuZcld7UtsSqIKIpHbufHSA7+QlcvCuXzWxh8?=
 =?us-ascii?Q?Li14vyOitLvsUcqnr6hfLNkGgMOXj4/v5sfmFZbM0ApAOq4WSkVO/n6DaaQC?=
 =?us-ascii?Q?nUAofYa5/MobWRhdQRifT9/9ZbTBbeks1uCnPpY+I8feOMFCu9UE795P0vjc?=
 =?us-ascii?Q?JayXZmgHZYFyKS/Y6DYeIG3WMxT99EgI6apJ0pQ1+joEDCfkt/mF1zxvyj8e?=
 =?us-ascii?Q?owbn4b3bh4dN0QGID5arCabHhO/exsQPo7W9awKjKtmR0ImZpigpTMnF1b3y?=
 =?us-ascii?Q?WTjNNrkyJeB1dy+VZ9/QRY58iqXwKXI1eMtObHpqO8IkiGkmpu9i1BI3JmaG?=
 =?us-ascii?Q?CXdJcjw6s6Cbxx6aGo5fwgVUrGCdmwLydoqUiYt0GzOAXaCaSRMj+Km9h6CD?=
 =?us-ascii?Q?yUABd8LX15ZeTROdnM7Q0U3WgaT7RH0MgH5s9r6NWLZNv3YJ2fqdxi5DBHfN?=
 =?us-ascii?Q?ARKbsUfXU7q1owdgYlO0oxHkQw6D49ur4cSzOEjVX94cILupJQc3+jESCfN3?=
 =?us-ascii?Q?nS2cMpxBbU3+lduwadBhz74skD6tV66NcSAIw4/Z7WkDxRX8O2jwn/d6Kybo?=
 =?us-ascii?Q?6Jz7t4fR3O56HeUF+gXMkUhDZGLFhz65eA8dcpIqT5Cj5H9lfCaIWdpO6tr2?=
 =?us-ascii?Q?n8QcTG4doqDbfRhdWrsA8j4YJya1iI2KANqnJFhaJTX9cA7nuje+roDiNsOH?=
 =?us-ascii?Q?4DfpUrvLAl2U9nbTWNJVWBRAhtAsQxJzb7ju1wK7GCVNuzoTGnf2cmcf9NU7?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfd4283-47eb-4497-b6ee-08dbbd1288d8
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:25:50.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK9pDn2IUGopMxcauKf7fU45taP4yDjo9bvGWQWOE1QoWPhR+NLuoJSjHQExvWcOx6tjjsoPzMwVLxjKcd53WhNKA5Y4+9Bem1JH9ybWjEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-Proofpoint-GUID: 8eZpNX33RG69ST2JeDOMbNWdKzti55w_
X-Proofpoint-ORIG-GUID: 8eZpNX33RG69ST2JeDOMbNWdKzti55w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-24_12,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309240136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188164

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0023-CVE-2023-4527.patch      | 219 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
new file mode 100644
index 0000000000..211249211a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
@@ -0,0 +1,219 @@
+From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 13 Sep 2023 14:10:56 +0200
+Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
+ in no-aaaa mode
+
+Without passing alt_dns_packet_buffer, __res_context_search can only
+store 2048 bytes (what fits into dns_packet_buffer).  However,
+the function returns the total packet size, and the subsequent
+DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
+of the stack-allocated buffer.
+
+Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
+stub resolver option") and bug 30842.
+
+(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
+CVE: CVE-2023-4527
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+---
+ NEWS                          |   7 ++
+ resolv/Makefile               |   2 +
+ resolv/nss_dns/dns-host.c     |   2 +-
+ resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
+ 4 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-noaaaa-vc.c
+
+diff --git a/NEWS b/NEWS
+--- a/NEWS
++++ b/NEWS
+@@ -25,6 +25,7 @@
+   [30101] gmon: fix memory corruption issues
+   [30125] dynamic-link: [regression, bisected] glibc-2.37 creates new
+     symlink for libraries without soname
++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
+   [30151] gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling
+   [30163] posix: Fix system blocks SIGCHLD erroneously
+   [30305] x86_64: Fix asm constraints in feraiseexcept
+@@ -54,6 +55,12 @@
+   heap and prints it to the target log file, potentially revealing a
+   portion of the contents of the heap.
+
++  CVE-2023-4527: If the system is configured in no-aaaa mode via
++  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
++  family, and a DNS response is received over TCP that is larger than
++  2048 bytes, getaddrinfo may potentially disclose stack contents via
++  the returned address data, or crash.
++
+ The following bugs are resolved with this release:
+
+   [12154] network: Cannot resolve hosts which have wildcard aliases
+diff --git a/resolv/Makefile b/resolv/Makefile
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -101,6 +101,7 @@
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
++  tst-resolv-noaaaa-vc \
+   tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
+@@ -292,6 +293,7 @@
+ $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -427,7 +427,7 @@
+     {
+       n = __res_context_search (ctx, name, C_IN, T_A,
+				dns_packet_buffer, sizeof (dns_packet_buffer),
+-				NULL, NULL, NULL, NULL, NULL);
++				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
+       if (n >= 0)
+	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
+					&abuf, pat, errnop, herrnop, ttlp);
+diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
+new file mode 100644
+--- /dev/null
++++ b/resolv/tst-resolv-noaaaa-vc.c
+@@ -0,0 +1,129 @@
++/* Test the RES_NOAAAA resolver option with a large response.
++   Copyright (C) 2022-2023 Free Software Foundation, Inc.
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
++#include <errno.h>
++#include <netdb.h>
++#include <resolv.h>
++#include <stdbool.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/check_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++#include <support/xmemstream.h>
++
++/* Used to keep track of the number of queries.  */
++static volatile unsigned int queries;
++
++/* If true, add a large TXT record at the start of the answer section.  */
++static volatile bool stuff_txt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* If not using TCP, just force its use.  */
++  if (!ctx->tcp)
++    {
++      struct resolv_response_flags flags = {.tc = true};
++      resolv_response_init (b, flags);
++      resolv_response_add_question (b, qname, qclass, qtype);
++      return;
++    }
++
++  /* The test needs to send four queries, the first three are used to
++     grow the NSS buffer via the ERANGE handshake.  */
++  ++queries;
++  TEST_VERIFY (queries <= 4);
++
++  /* AAAA queries are supposed to be disabled.  */
++  TEST_COMPARE (qtype, T_A);
++  TEST_COMPARE (qclass, C_IN);
++  TEST_COMPARE_STRING (qname, "example.com");
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++
++  resolv_response_section (b, ns_s_an);
++
++  if (stuff_txt)
++    {
++      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
++      int zero = 0;
++      for (int i = 0; i <= 15000; ++i)
++        resolv_response_add_data (b, &zero, sizeof (zero));
++      resolv_response_close_record (b);
++    }
++
++  for (int i = 0; i < 200; ++i)
++    {
++      resolv_response_open_record (b, qname, qclass, qtype, 60);
++      char ipv4[4] = {192, 0, 2, i + 1};
++      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
++      resolv_response_close_record (b);
++    }
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  _res.options |= RES_NOAAAA;
++
++  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
++    {
++      queries = 0;
++      stuff_txt = do_stuff_txt;
++
++      struct addrinfo *ai = NULL;
++      int ret;
++      ret = getaddrinfo ("example.com", "80",
++                         &(struct addrinfo)
++                         {
++                           .ai_family = AF_UNSPEC,
++                           .ai_socktype = SOCK_STREAM,
++                         }, &ai);
++
++      char *expected_result;
++      {
++        struct xmemstream mem;
++        xopen_memstream (&mem);
++        for (int i = 0; i < 200; ++i)
++          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
++        xfclose_memstream (&mem);
++        expected_result = mem.buffer;
++      }
++
++      check_addrinfo ("example.com", ai, ret, expected_result);
++
++      free (expected_result);
++      freeaddrinfo (ai);
++    }
++
++  resolv_test_end (obj);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 3387441cad..caf454f368 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -49,6 +49,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0023-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


