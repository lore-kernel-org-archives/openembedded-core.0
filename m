Return-Path: <Yulong.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A38C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 19:41:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9357.1655322105087765292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 12:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tA3B8LoQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3165273e6b=yulong.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25FJeUUp011805
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 12:41:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wP9yZp+PwRRUhWW0XFgOe3pto3VOg9EACxJJ+3uWgs4=;
 b=tA3B8LoQVNozwKPIdqqQnHdtZqPYw9dvYceT2lrBRjaI8mRnTkIp2o6dcJCQ+TeZyLdc
 BEhu0v7p7J7EMpFyRPgY18Xt1NlCSrNAkHeddHwD1H5/LIS8/ZmltymBn0rN63+KUGQn
 69i1nEcMQCFs5RR+mxywx/cdl8al8wRelNJkChCdwwegHz93sEWT0YCXWqYuo8u8qdZ2
 6cnlZRynCR9FfU5AZLvvgwcGeusLOiydZdn9ToOPRN3pywrP5FIh8t52rAP9CavGG7M3
 aq63om9nQDD+0vm6RLzH8eK8yOsFDQhBA4YGDv3kBFLUSx+x19YjIFK0qgr0F7AWJ5Vd 9w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkkcex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 12:41:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNwxQB6Zfuxxht0pPFFdtZ8ogFOo0YYCDWW8QNtRaf7mxMJwV7Yrx+cwlu2uDfO//vYUyGP9/oqQ2qgktdBGh2bhrr5CM+1ugNNNuHOx6cSZw6FcrwutJqZDWpUVi96p4LUwaa3zqFfvrmECS2Ic+IL/7HhVsDCs+YLOPE0zV5sNwsx6oncY7P5/ioAlWHU7MsVQ/thMRHCvfMhTdEdSl15YnZc4EoYI+MNcj5xX4HiZ6mTgneGQ8BbZnBjAWf+h6eBrBq2bgF8IHgThREaMVTuEWJ5QnuuvUAr8hf4xVetWDcEXY9xrIMTLXL7W40qCLAL3RpqhpfY/wP7aPc0pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP9yZp+PwRRUhWW0XFgOe3pto3VOg9EACxJJ+3uWgs4=;
 b=Wz+/PmmIFtIrlwYRJTRyb0FMWmPyTvlatclGXx6ObpTmYf5D9fovW3lnAbD4DtQ7Uo6FtDQi+LWc3Y4P51eu9GRFW11dOORXJb3XV5C7OS/IhKj0JqFbMJokBkU+lqwSyr4XtOWFckGWCrrSHBOcVo6zG+lNUbaT7MA51+dbUiMyThIheTw/ehHpx343Z53ivciEITrVAPz70UZ0BSFlHtOQpv6r5HeuOiRDqca1o+/I4EJll4oGnPUJiPqteqGA8hBNgSGdiVyxwcAoTegqK8b5QtmTILC1MpH+JnhKRjMwL6H9WSeIgJ0GD20ACoH4PA39mNWu0bAQ8NnSNtGadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4080.namprd11.prod.outlook.com (2603:10b6:208:137::27)
 by DM6PR11MB3644.namprd11.prod.outlook.com (2603:10b6:5:139::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 19:41:41 +0000
Received: from MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::1df8:fa7d:e6b1:b450]) by MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::1df8:fa7d:e6b1:b450%6]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 19:41:41 +0000
From: "Yulong (Kevin) Liu" <yulong.liu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pyasn1: Eliminated ptest deprecation warnings
Date: Wed, 15 Jun 2022 12:41:27 -0700
Message-Id: <20220615194127.55201-1-yulong.liu@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To MN2PR11MB4080.namprd11.prod.outlook.com
 (2603:10b6:208:137::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 879fbf0b-25a5-40be-5ad5-08da4f071214
X-MS-TrafficTypeDiagnostic: DM6PR11MB3644:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB364450318A59C2667DF8148B83AD9@DM6PR11MB3644.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pUpOwAlCZ2QZEX2Op/t+HsAcJFgHv3R695CxMCMb9LzuBENfqtMep+MbE85xQTMB3rToPV/irwmBAS/xV5IZIfF5DPOW8OB8rajqnWcEB92JqHASXRwdLsOQlZK13ZvZKl87KtmfE0cBlKdHfBhFi8x4RQWAH+G4lZ6iDg+62FsKCsgu37KJ0LzKXVreoEzxY8LH2L49EGmK7Kqoc6JCAG8v+YoB5r76QWoaT46Lk1QJ4OWBDPzrreO23yKZ8gPf1ZWaov2yR0oSZi4GyAbiJQ3BL7L8H0znVBzuLOJFlXw/Px2TCxk6wC7Z90IbSIaDcIpWKm6DBYQLY4UHI420mRIsNmOyGFgBOsvEB4wl2IDqwNFXhcVJ8P5H8tZ+WAIWo6pU6Ek9Zut5tAaK1otZWZDcf78rqiYZNIdn1PVKFT5f4b4eZNDQUJBLkSfOy0FpKfbB46JHu1eB5bYebA4aHO5/EzSgW/pH23/G/bUmc5GLk+BQKURj+uZuedGVMpxCIkotE3wHGEQZWDqz/lw7MAD7Mpqdt/vN2FFd3y02YYyIHj/zOoB+bhDwcK9edarB/A3Jzq3fn9bwzvyLe2c5Cn7KZd+OU2ZpPK1A8qxycxQmRPykF4Ev9LFesF0QVhgWl0jaIRhRwHWCcTiLJeVu7O2Yt2Vmdf6Rl0IsxVWjj+9eGqB+gtf7rbMRwEbThZR/dAyYRT+C5zvJFIw5Eyho3T7yXN9mrpWUDc5zGkUau6JGV0d7Ycq0bLmghT6ELqSzsmve54X45oSjBR7hHMkuEiHMvJjSQ03ZLAc7+539wgr+jJH1/4cr7OXOLdPS87M3GP/rETc0KhJwDY4lAZNXEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(26005)(1076003)(186003)(6512007)(2616005)(66946007)(66476007)(8676002)(52116002)(86362001)(316002)(66556008)(38350700002)(83380400001)(36756003)(2906002)(966005)(6506007)(6916009)(38100700002)(8936002)(6666004)(508600001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?djhmluL8XUCKFRr4j1aJJGOJsTU7sC0uLQuxh3cgYDeoGvsqvazOYNJ2zm8W?=
 =?us-ascii?Q?gmsCUbDOo0LBKWnZTbXq/52Bt3HGolWcbS5zDWUbECYUtbm2FqnWK5bqMkTQ?=
 =?us-ascii?Q?OUlZ3yr/kqje4/GU7M4nksi08cGu1e6wvIt3PBv1afCcjZWZ6oreaaDFoaRs?=
 =?us-ascii?Q?6un8oPqBfuP5nHltxIpPPFf6lR0tBBNm8mBh352NB81gu084wG/mxEEI4ujW?=
 =?us-ascii?Q?Pf0Lh5MgWswYmuvOflq02dmfg/97Iyyg6+vcVSCHweW7xRNVFzlJMH/BkybO?=
 =?us-ascii?Q?Vte6mXXVbzDy3DYvQ2hFmVRFRIOH79HgAg4t07ASFnFgL8AfYQiuPdtSA4Co?=
 =?us-ascii?Q?gU95EEKAIzCiz/59RkXAiNC3yGWSanUeMhFbynjbbQoWbq5Lh0F85h9WpX0F?=
 =?us-ascii?Q?BqIoaXfbHab3JixsjgSauSN/8LCTTD47IIzUn0SYDTwoGmopR7NoUC9xKlgl?=
 =?us-ascii?Q?bG8GtGbbvN7UeJc84YA0sdGwlG8449Ys+YzIMF9gdbMgpF3a/sZAAncuGT7/?=
 =?us-ascii?Q?hyCz0lm0pruKLl1v0bRulIFY7v4KXwZxMdPMxXyBUqTD2I/gR6otoWElRXqM?=
 =?us-ascii?Q?NrQP+cT6UguV8u/X0rWmjuGB1aSSWYB8NtFowJpgSYpjmIGiVfhkVW6PXLj5?=
 =?us-ascii?Q?OcGqKkLTHk2v64LSac779Xr+0OhSMBpZXx3AXImfYYIvv1ZrUT8yJsyy4EHS?=
 =?us-ascii?Q?3SLcNfgzEr4cKqIbO3lFEOUFxAGQogxRP6d5mEZeyy/sKKkF3vwb3Om8Fl+5?=
 =?us-ascii?Q?CYXt+gBGOaqfJnyghjwprFIHqbAA2JxMKsWH8XkdNchgPfQYbcivbr2eo27x?=
 =?us-ascii?Q?yXYzXgcZgsr7MOli4Qvdhy4Nc2wXK0tMMfDU30zd/y4wecK735w4gMC5yNar?=
 =?us-ascii?Q?VR9+6l7QrpDZNhqAp4yhRuu6SQM0dEUIJnEk2W7H+3yLq7mCJikdILMkuxqo?=
 =?us-ascii?Q?gxLnrWywwi25G1lfITwrLWnQVrR0NA/aEolWpcNHTuyVBu2ieqFT6UaijIWI?=
 =?us-ascii?Q?kK8r2tBMw4cUn6Plv4zCFHd8s3ZZT3vio6ofoAoWPk7SCi1/gTsP27UoEtbP?=
 =?us-ascii?Q?OxSHTrzQH6zkAqvA15ml6PsHnrjdgg3C1N5yo0sLbCWHyz19pNIyiKEcAZMv?=
 =?us-ascii?Q?VYa2nMzyuIhzUjyVwtkbAPji5tzsTbTE9JAFrylwb8PngWjcYx2bUH7+2bMx?=
 =?us-ascii?Q?YdbaOXIDWYQdBPOEwUF8GhJsp0Pwk8VhxGDE/uqWXfBDyw0i2n+hIRMGolGO?=
 =?us-ascii?Q?lBugauWbdKK9V1E8Cl5crQOobPFA2Z5SdXPhLafa7EBuDg/jRMItf/QJlnE3?=
 =?us-ascii?Q?I/9wGgtrWkgdoktEQ+XIVGkrY3AMlJJ2e2DzN62QiHAjBAYkEIsN+p+u7OpP?=
 =?us-ascii?Q?+GD8cCqERXc0dGhTetoeo+oU1P6bNz2CYp9ye7DfpSj2i2R+Uiwfge7TjpKC?=
 =?us-ascii?Q?L/BbnX0hpUUYG9CZZGpIFERoPBt5lMWMeA7H4QqvJPQw53cXh9eBfCEC/4T+?=
 =?us-ascii?Q?XlPOpBJ3Aa5J0jfT4Sj4UV/omv8iZBk1aHsWjpn8bbX4VM6GuzfAKPvzQCIG?=
 =?us-ascii?Q?JJhVt1pOeV5uQiQp7MLwSVX8zI4/mhmB8b1iqFJ/TG9VOzKaEy+c1OHGFB4w?=
 =?us-ascii?Q?WF6kcBKNwGDIMtSK9vDyewhsYRraDwEvomiXDxw8mNeinw7zJcA/dRKSUbNW?=
 =?us-ascii?Q?MEOUTFQsiSLaPn5SDxHXm93w7CSC+L/fKAymGSMkT1SgbN94JfL5IOtRW9av?=
 =?us-ascii?Q?IsALDEy3b/2ZEl9+aVfOVbSTrKvNDl0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 879fbf0b-25a5-40be-5ad5-08da4f071214
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 19:41:41.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BeUAcg38AJHShsppbdJRL1Jn4xPTg+42UzrXKTNepLY99dBTBpFOeqh8GIL+N0XgvvSScm8am5QWG3KCgTPhiVWx4hIILtV81VfbperAAmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3644
X-Proofpoint-GUID: gZQvNJgu0TrWiFObiDK8rg271b9TtdIp
X-Proofpoint-ORIG-GUID: gZQvNJgu0TrWiFObiDK8rg271b9TtdIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_15,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=741 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206150072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 19:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166993

Eliminated the ptest deprecation warnings for the error:
    DeprecationWarning: _int_ returned non-int (type SizedInteger).
    The ability to return an instance of a strict subclass of int is deprecated,
    and may be removed in a future version of Python.
       return SizedInteger(value).setBitLength(len(value))

Patch from git upstream repo:
   https://github.com/etingof/pyasn1/commit/db8f1a7930c6b5826357646746337dafc983f953

Signed-off-by: Yulong (Kevin) Liu <yulong.liu@windriver.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |  1 +
 ...arning-__int__-returned-non-int-on-P.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 6cbed0fcd5..1b941630e7 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -19,6 +19,7 @@ inherit ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch b/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
new file mode 100644
index 0000000000..30ac9a6684
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
@@ -0,0 +1,28 @@
+From db8f1a7930c6b5826357646746337dafc983f953 Mon Sep 17 00:00:00 2001
+From: Ilya Etingof <etingof@gmail.com>
+Date: Sat, 21 Mar 2020 19:05:03 +0100
+Subject: [PATCH] Fix `DeprecationWarning: __int__ returned non-int` on Py3
+
+In `BitString.__int__()`
+Upstream-Status: Backport
+Signed-off-by: Yulong Liu <yulong.liu@windriver.com>
+---
+ pyasn1/type/univ.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyasn1/type/univ.py b/pyasn1/type/univ.py
+index 10924c3..488241f 100644
+--- a/pyasn1/type/univ.py
++++ b/pyasn1/type/univ.py
+@@ -551,7 +551,7 @@ class BitString(base.SimpleAsn1Type):
+         return self.clone(SizedInteger(self._value >> count).setBitLength(max(0, len(self._value) - count)))
+ 
+     def __int__(self):
+-        return self._value
++        return int(self._value)
+ 
+     def __float__(self):
+         return float(self._value)
+-- 
+2.25.1
+
-- 
2.35.1


