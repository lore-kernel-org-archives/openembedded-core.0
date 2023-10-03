Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C10BE7544F
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 11:30:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.105661.1696332620412181601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 04:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OAhtiF4G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86407c7a81=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 393AatqN031062
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=oiw0mM1QW8fSvhoLSE
	aBM8GVpF1RMXekr0xVZYNx0pk=; b=OAhtiF4Ga8fcQGvcMak8MBPFt+hI+g2yz7
	Jn70FWTe3Oy/FhIodLVnoR9fWj/2hmiDQQ87iKfjMbIkT5PMGog1nrn2jERKxb/p
	SvIkeWdC98n7Fl8feiCFEqAx2X2RQ5oXgFS5Ku9kgdjsfjGxuZnJCBjUu25o06QL
	DHgvmoRzoHZL7Pik9mNdF+tYo8WHHj1JzDn359Izs9IDsJt/rf2EdQYJy0I07RSx
	Cc5lGwWkULEOtUbcFkhBJ0siDYVXCKr/tTgJr/mi23KadYpYX+lLUP4kmKb3qTA8
	fon8p3/iS68OLqSFo3YDEQVIiAUIOyXlCZdnoAgbquTsT1hzHCbg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3te8vxjs5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 11:30:19 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 393BUIQn028736
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 11:30:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3te8vxjs5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 11:30:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/P8P7FW/cp8f9nCXn588ZRvnoTDO92Q0beOH2Lo+WdJG7JD0y5bbtaTjLR/RH67m/9t+MOm/o7FLoW48yHgQTLLhyGMnpLUGlwATxuX5S86nB261SmujdjbrVvVWxpxc3+Vazq9ulovTCGUMS4jPdYdR14yq2hZjG9+4RrZu6SG3qnm77uz6S3g8sZbHGK6iuKscT64oqLXo8Zw5HMBNciT2oEjyIpN2SyfRDjMjwmxSnwC0LVHGM6CLnpXT/BjjpCMArmfeTKahHdvUBEkGsK2fG5Zki+kJe60OgeAsVJfxFYyc3NtP+XLSPweRwMwCVa5/d8FpJ/O9naO/q5uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiw0mM1QW8fSvhoLSEaBM8GVpF1RMXekr0xVZYNx0pk=;
 b=eBV23riLMa/wkc1GE3URuQBT2m+1GoJ+cmbpd1sgWG1W6NzAdka9ku1f4X5HzF6XPTcdUhkDH3ktHphhWHK9oHZ3yd2xK25rcAB9aCgtewdrGdFNHoQNYfMJknvx6K7tfJQ/gcG/J/OlXKZIVPGveNOf1y0IGvjZllMFEwXzS4h8wN44USouev6Uu6400YflcnRatR27DmL6w5y0P9W8A/GHXzlnyijk0aBgHwSBjQdHPoBAh8cO5HuAx6Ec0Usf7PXqOySUB92CmFheKAPTPA4iamQWCkbw7IDPw1LcndUyphlWBblLuq8e8QXnKxMVAPydxfVCxLi+zesFBqNzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 11:30:13 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6838.029; Tue, 3 Oct 2023
 11:30:13 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [mickledore][PATCH] glibc: Fix CVE-2023-5156
Date: Tue,  3 Oct 2023 04:29:55 -0700
Message-Id: <20231003112955.3031051-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ad464d-e74f-4c56-7cc5-08dbc4041bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H8jUXFdDl0LSzX3Jz4rNfbNAjbP3hflM7e2SSA/AT9v96f8+Rw65HJx1iJxnf8NMV9GG4GpzjSsrj9zsw3a4PEk4k+W9s/XWD/aV3JCgb7YdTO6loWukJpSkQjlgf5NM/T4w1fLMkbFjwoBmKx5sxd2KffuzVfBixZMkIcIzlnMXKmojIvyy+3QGqQ1d7XyaXGdK4yNiduDWLXqCQR6L35uquSVv9tt7PhrrBDsO3Cmzj4oHvQyR62RZ7sp9QXrOLnMT9kPdnTLj3l/ILAKtvbG8cWiwSm/fmppRtEoZKrzsCPnBi7PYczrj7Sr8q4B5NJ1wfQJXTX+749iPi65KkQ1Qg8Q0MsvTlRxqenH4wDkrp1WbOltEDpmfWYpbR9PVSAWRiXT3Rh2oun20Mr1vRBXnG5d3b1zVKNldOKRZm1Gx1DpFpi+ylX+CDeNcExugEyWfwqR9U6F4t1ZUDC8vwqGxiiCKGhyJTA/3HHXLN5bI1BH28KUroYz1kRaGD/S2BWDpL3rHtWXr82AjbPBjEIZ1Y4airxdgBT1iJiGn/g5kUrEWuL3QkT6MgS7uGzveikflJO1zbRrx27QrFYRgPGniXTzK4fYuEt7v/7Mlow/wuzcJGkoaWQIbcVIXZyK4+H7tBuMj/Y45WXQDYsZxb/g10DQUjBMjSeTUjlkFo/c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39850400004)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6916009)(66556008)(316002)(966005)(38100700002)(66946007)(2906002)(9686003)(5660300002)(478600001)(6486002)(30864003)(6512007)(6506007)(4326008)(26005)(1076003)(2616005)(83380400001)(8676002)(8936002)(6666004)(52116002)(66476007)(41300700001)(38350700002)(66899024)(86362001)(36756003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A+ogJ20uiExM3QZ/3ByMD7gG3OrvXR4YCp2epaKXBYUXWSkQrMIs37sBw3LK?=
 =?us-ascii?Q?rpeRyBINvA8hyVo+NG5tM9sd4Ig7SKB4aerMOKNc5XX8d+NTL+IU/Qu3i3NX?=
 =?us-ascii?Q?RvYR2sPJMQSjKir5IIvDqCiM6UFv2EopHikWsK8tdBLggUu5TO3f3T2tFXbg?=
 =?us-ascii?Q?y+Rk9tb22kxXLs+vPmza5MTqSlEsPVWohczG1eJP7Z6kuHx8PQK/E3No9HsL?=
 =?us-ascii?Q?vHG/vVLR5CFNDZVqB+DVoF9CwEuLIzo/W9S1iixUEH9eHAo5Rc4liqpCCfVE?=
 =?us-ascii?Q?FpLoD0g5axe7kIUoVLRfJJz7CIYcgHAvB2fkc/DT8oLZx/mFeGEs9ah5JOGD?=
 =?us-ascii?Q?Jc9kaP9J53iNqH6d9zV8L1dzufjzem4ORzI2zVaua4sODZTOfh2ElnEcvYYL?=
 =?us-ascii?Q?nV7HRMZL60W/+ohwvZ1HARIMZ/ZoUUHu2pMOl4w0sOIkITNGOGbgwuEGsXIt?=
 =?us-ascii?Q?Fh5BdiiZ0bhYB2zwJ9IsNtOOQpob7j9cNy38WmDzbsijyEnifa6R5o+SFM8Q?=
 =?us-ascii?Q?LxTMeaf0svjEEPBaDLHPe9xA7ZdvQL9WmQGEewNx939tTqW4/sPm1pEGqDt9?=
 =?us-ascii?Q?v/00n3UOgklyyQai7bFLUrL9cotenV8l80P1Ee8ECKJ2mslPQ8qs4MqKJZFL?=
 =?us-ascii?Q?u9M3J8BioH79FylsiwJZbLLNnvLge+0DJlIXrwkGLG8xVbSHAaN4ASEpIkz9?=
 =?us-ascii?Q?KY0T7ZJB6FLldEl/iVhMYxKE9HUpMTfks6PUR2WTYr+eBl4Aqh+EAzVspcfV?=
 =?us-ascii?Q?AMqjVUjJXT++MI+QssuA1uE2RhX9vH4GWMBuHIUXpYxaZkGRlEkH9gAeofFv?=
 =?us-ascii?Q?BIJxGXv/NAfOFe7ddEGSdqDBzSgILML0MXOcyLWJiLdeC8yVB5Tfbh2BMK3s?=
 =?us-ascii?Q?1qBWVWlK5lzdlxfDW9RSKhhHi9Ih00NXreyZ8SlSfrcR1+Of617s5RRkA+6S?=
 =?us-ascii?Q?pA6O4f79lyRctF9obQgMClRy1XntKLTo4iUO7O47BwLfUIoYdx5hDE6rGthk?=
 =?us-ascii?Q?a9zfY6TJd/6DrtWdbnK2jnWVhIbj8878eeUex/wPAZqoZRlS0OQXV1hHmt0U?=
 =?us-ascii?Q?1XoxE9aYIvcBLKYFbh+2EkuQTwrQHBBj7o/s1aJ5+RExm4Cdy6Ip+3IF+tCE?=
 =?us-ascii?Q?7+zPvsZ2L6hufRpJoSupdYLNGCrwNtax6VFA+HinYtOhi2fjcbAgV3sIibkt?=
 =?us-ascii?Q?zbk0YWkvzridOvd3oc0fAkRNFM9epD1TQJhgbIyZpn7PIHqQsemIaF0ZARtP?=
 =?us-ascii?Q?FUbYvrbGWKiXkBASy7VURt5a1rTNIN2AsJi4/pO1e5wwJb5bjvwCix8gnuhQ?=
 =?us-ascii?Q?dX/7qXj5X/BWptO5asYhQd+LM8VMcCBc3MGkN3/EFggAmT5FR1idCb0784QB?=
 =?us-ascii?Q?+234nNjyxHcVfE8Rjbdsu0ZArv4KEGJ3VHLPBrnbZC4hpe4M00RMxgJvNdXc?=
 =?us-ascii?Q?0hohAs7bPs/RBt/5M2kD6fjoIEaF68L5a1K3HQ5aBcw1zGx5u0POXmMplUzy?=
 =?us-ascii?Q?uSJqeqVxS9Ghsff/+pU5oNMDU11abeE23DqZCdGX/4UQddoUeD1Drzuea32m?=
 =?us-ascii?Q?a3Bx05HnB3CTU33zzfWc1rZh13MnNQpVFydXeVruLI/74l/m7+/GToMq2TRo?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ad464d-e74f-4c56-7cc5-08dbc4041bcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 11:30:12.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6jFOFi9r63l5fpS0leDuFxp1LofiECoMOV6FAcGJW+5oNR00f0WvyJR43iaMMyKJTVJdutw9A+dde4mPx3kfMieYK1C2rpB85hvPw5VuMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
X-Proofpoint-GUID: OidiFp18J7Lj978O9qjNGlogk0O1Thr5
X-Proofpoint-ORIG-GUID: c6_H0Vd8meudn3tmyp9SFve4K-Iexe7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_08,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310030082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 11:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188633

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../glibc/glibc/0024-CVE-2023-5156-1.patch    | 329 ++++++++++++++++++
 .../glibc/glibc/0024-CVE-2023-5156-2.patch    |  93 +++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   2 +
 3 files changed, 424 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
new file mode 100644
index 0000000000..65afaa446a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
@@ -0,0 +1,329 @@
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Fri, 15 Sep 2023 17:51:12 +0000 (-0400)
+Subject: getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
+X-Git-Url: https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=973fe93a5675c42798b2161c6f29c01b0e243994
+
+getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
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
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=973fe93a5675c42798b2161c6f29c01b0e243994]
+
+CVE: CVE-2023-5156
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
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
+ 	$(build-module)
+ $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
+ 	$(build-module)
+ $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-deps)
+ 	$(build-module)
++$(objpfx)/libnss_test_gai_hv2_canonname.so: \
++  $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
++	$(build-module)
+ $(objpfx)nss_test2.os : nss_test1.c
+ # Use the nss_files suffix for these objects as well.
+ $(objpfx)/libnss_test1.so$(libnss_files.so-version): $(objpfx)/libnss_test1.so
+@@ -195,10 +201,14 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version): $(objpfx)/libnss_test2.so
+ $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
+   $(objpfx)/libnss_test_errno.so
+ 	$(make-link)
++$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \
++  $(objpfx)/libnss_test_gai_hv2_canonname.so
++	$(make-link)
+ $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
+ 	$(objpfx)/libnss_test1.so$(libnss_files.so-version) \
+ 	$(objpfx)/libnss_test2.so$(libnss_files.so-version) \
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
+ 				   struct hostent *h, struct gaih_result *res)
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
+ 	}
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
+ 	/* If the canonical name cannot be determined, use the passed
+ 	   string.  */
+ 	s = (char *) name;
+@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct addrinfo *req,
+ 		  if ((req->ai_flags & AI_CANONNAME) != 0
+ 		      && res->canon == NULL)
+ 		    {
+-		      char *canonbuf = getcanonname (nip, res->at, name);
++		      char *canonbuf = getcanonname (nip, res->h_name, name);
+ 		      if (canonbuf == NULL)
+ 			{
+ 			  __resolv_context_put (res_ctx);
diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
new file mode 100644
index 0000000000..507db5e13b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
@@ -0,0 +1,93 @@
+From: Romain Geissler <romain.geissler@amadeus.com>
+Date: Mon, 25 Sep 2023 00:21:51 +0000 (+0100)
+Subject: Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]
+X-Git-Url: https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=ec6b95c3303c700eb89eebeda2d7264cc184a796
+
+Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]
+
+This patch fixes a very recently added leak in getaddrinfo.
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=ec6b95c3303c700eb89eebeda2d7264cc184a796]
+
+CVE: CVE-2023-5156
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/nss/Makefile b/nss/Makefile
+index 8a5126ecf3..668ba34b18 100644
+--- a/nss/Makefile
++++ b/nss/Makefile
+@@ -149,6 +149,15 @@ endif
+ extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os \
+ 			   nss_test_gai_hv2_canonname.os
+
++ifeq ($(run-built-tests),yes)
++ifneq (no,$(PERL))
++tests-special += $(objpfx)mtrace-tst-nss-gai-hv2-canonname.out
++endif
++endif
++
++generated += mtrace-tst-nss-gai-hv2-canonname.out \
++		tst-nss-gai-hv2-canonname.mtrace
++
+ include ../Rules
+
+ ifeq (yes,$(have-selinux))
+@@ -217,6 +226,17 @@ endif
+ $(objpfx)tst-nss-files-alias-leak.out: $(objpfx)/libnss_files.so
+ $(objpfx)tst-nss-files-alias-truncated.out: $(objpfx)/libnss_files.so
+
++tst-nss-gai-hv2-canonname-ENV = \
++		MALLOC_TRACE=$(objpfx)tst-nss-gai-hv2-canonname.mtrace \
++		LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
++$(objpfx)mtrace-tst-nss-gai-hv2-canonname.out: \
++  $(objpfx)tst-nss-gai-hv2-canonname.out
++	{ test -r $(objpfx)tst-nss-gai-hv2-canonname.mtrace \
++	|| ( echo "tst-nss-gai-hv2-canonname.mtrace does not exist"; exit 77; ) \
++	&& $(common-objpfx)malloc/mtrace \
++	$(objpfx)tst-nss-gai-hv2-canonname.mtrace; } > $@; \
++	$(evaluate-test)
++
+ # Disable DT_RUNPATH on NSS tests so that the glibc internal NSS
+ # functions can load testing NSS modules via DT_RPATH.
+ LDFLAGS-tst-nss-test1 = -Wl,--disable-new-dtags
+diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c
+index d5f10c07d6..7db53cf09d 100644
+--- a/nss/tst-nss-gai-hv2-canonname.c
++++ b/nss/tst-nss-gai-hv2-canonname.c
+@@ -21,6 +21,7 @@
+ #include <netdb.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <mcheck.h>
+ #include <support/check.h>
+ #include <support/xstdio.h>
+ #include "nss/tst-nss-gai-hv2-canonname.h"
+@@ -41,6 +42,8 @@ static void do_prepare (int a, char **av)
+ static int
+ do_test (void)
+ {
++  mtrace ();
++
+   __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
+
+   struct addrinfo hints = {};
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index 47f421fddf..531124958d 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -1196,9 +1196,7 @@ free_and_return:
+   if (malloc_name)
+     free ((char *) name);
+   free (addrmem);
+-  if (res.free_at)
+-    free (res.at);
+-  free (res.canon);
++  gaih_result_reset (&res);
+
+   return result;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index caf454f368..b88bc5fc4f 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -50,6 +50,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-CVE-2023-4527.patch \
+           file://0024-CVE-2023-5156-1.patch \
+           file://0024-CVE-2023-5156-2.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


