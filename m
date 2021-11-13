Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2D3C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:02:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.120.1636822955854435129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZN0sIZs1;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=69513d83c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1ADGtuwG031117
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 17:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9Vh2duWT++LKHkDR+q9KOKs9VDoYI5ipBIPucuMKIG4=;
 b=ZN0sIZs1n2T9h8RJcWfLyoV6lnBvizxqW4bCVec+yGw2Rels8LDvyoZNpwiHIBFcL23y
 PzxsV/qh+N9AXgiiakpghh+gsDDIzKyT/uug4LKz8MMNRnTYccCpFhsLbEwelXz5aaaV
 CGTSD38wO/grgv9fGm2Mu7HtvG4Gu3zB4mEdwG5a77YrALQ3X7vyzpJF9kLO4IZphoDp
 BsVOjZIREab5zUQ7SJigmVXcADGWT1Km4AdmIqEUccWstWipWN1Y+JX9Qr4+M8EXvBFh
 m+MKJwdDPW1WsVNymOvCsUg/BaByUNlUDrGxcTCDlGwj6MXqmoQSLmuU9mWkCsqAhe39 2g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca4900dxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:02:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1ADH2YP2014775
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 17:02:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca4900dxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Nov 2021 17:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dk76meXnt++Jyg2lwwAN4gNWsiYTYDfs2xp5B4hTXglNpWV6FZ4nmy1629QDwVLj1oIzsK41bbW6D0lxJrQ6AJ5huaDjhFj9mcmCjLDKFV4VPS6qdZzW8c8sx8i08nfU/BfVxGrTWXSW3Ww/hvaN8q1y52nhyaTELdbJUYk3VzVt3L1RrnINUuKpWQ5PDwhx6T2y9MPnM7LdiyekaKmWoSqgAreLaAOABMFClCeZbVyvKwkaionVgsUlZ9iC5ir+m6qjW/sKVoWnWslWJ/2MZqiENhdlMQ8zsXVSHuE69fW42m45K163KRY6k/zh+j+5cu1GblqC1geY4YrfPrxvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Vh2duWT++LKHkDR+q9KOKs9VDoYI5ipBIPucuMKIG4=;
 b=oL91lRRWg9N+P5cOFHpnTRLdY7Who1I+cYAkz4hZ1XCKVeeYa3hCnCxILf1YBkiIWsJVIOJY2tdahK/n3wvyw3GULxTrPOcm4meBsktQKp0SVqGgfiWDIscWprVN1/KApLPLt9lMLo5vDSIcUzqPwkNlYtsHiY25Ig2mFqMD+9Bnk7WXEPQ0OM3q+lSdJEfyvewEOYvvldWp6m0PopnSA7WleTbOvpA1PRj2230Ssnw86v8QQWLGvKsWaKBgmJKkmziRKJ+dN3Yd7lFiNitZ1QcbqttN+UIrs0AOHcQjybtsZGHiXQAtQBIJtZ5A5Y3kGG9cn4IXKQzc1yQvxVbclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1421.namprd11.prod.outlook.com (2603:10b6:300:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Sat, 13 Nov
 2021 17:02:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Sat, 13 Nov 2021
 17:02:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH V2] python-numpy: move recipe to python directory
Date: Sun, 14 Nov 2021 01:02:19 +0800
Message-Id: <20211113170219.372539-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 17:02:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51116fec-18c4-4481-ca14-08d9a6c760cd
X-MS-TrafficTypeDiagnostic: MWHPR11MB1421:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB14211A189C2D744F08D27B47F9969@MWHPR11MB1421.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cAWVnPcLKLjNywzdBzWOFGM7dRHtikbjTCWIJ//TyTcYoH/uGtgr7jxZSXe4LbjQsoaUmhsS+4r/H+mzM3uQYrpQ7psDEPXSYiSvuZKDCYuzqlbDXak5/XWnY9nxXVMD4w5eyOtReyZ4HWLHlqwtgmJpN1GW9FAbbR4lh1j3p2PjuebgWSpChM/cueCjAVFtXMo/GuloRV7+s3hH0r3Q2bM47ZzvZvK0Aa6KU7lHW7XjWStUvETPu390JiocV9by8hklHp1I07VO02JexMxDh8eOxDZ7SDYGsv45ZJJwiOGfN14IYK/TtdLtjftltYhnfSryHYC8p+BZ5Oy8QGHQqE+Hv3tMlEjGzxDNm1bLVE6eRcGts29kOblGbfdDXavDW7jEb4sttSdsuA9gDw00BystGdKQXQpvNUNb5GsXiTDuXA+cXNT1efTkQgc79mbG3+RKeRvQUqbRzaoOhyA2QKo9DoaOAVnpc0u6cyFpZurm4JG0asmBKRa9/6PF/45NaOAJ0804vZbeOphViQ9mEax5eXnPenKKiM50kUS8zF+dJy0PCPq7SXL1OKa3DBys1TCD+wqlnSasGNK1FdJNlAEbMEwzcjAAlsE2OfmWT6TDnR7CL92wnNlTtceS+WCfULqYQzqgZS1gAI5q9KDG5m+DWogUWxn49d5Hrb5nOfgT2yT21XROdzsxd77qrhgqdhHuaCloHhDNSv7WtRl+yHLGexw6DFPxT65HWEVoIQC0Uue4HWwcxy336qdPddX/5Ovg4g3EeuTtaHRjv/VOmMcVqkWoZk1uBX8wFDDHzoE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(508600001)(6666004)(44832011)(26005)(38350700002)(52116002)(5660300002)(956004)(6916009)(1076003)(66476007)(6512007)(66556008)(4326008)(2616005)(966005)(38100700002)(83380400001)(8936002)(6506007)(2906002)(8676002)(6486002)(36756003)(316002)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OxFI9zgGWlmGpOnp5MDoGcW9pcCMx2l0HJjq62W+SsVYDRpHa0df3VvCYcAT?=
 =?us-ascii?Q?RMsJqFJRU+pQtIr1CU+xf2D6x78N5m+Tw0OVyLZnku5e+LRrSybhmqHUMtNR?=
 =?us-ascii?Q?XTnXcK6fisme4Wi0aLtsH3AnjY+aKbBf8/CvcmEsNj58pSNDDrxz7WkbYrZ1?=
 =?us-ascii?Q?cs5F0a4URdOXOjS6t3SgYlOmgBC79ACQ3O8jnU2Mu0soJaq2tUA/T5yf60Ff?=
 =?us-ascii?Q?74FEg/sJw2kA+RGnm1EHhur4W0LYhuZ+phtFdIbev5ixB3WnkD+p98SkKz/j?=
 =?us-ascii?Q?HQp+Hs2Xb6V7HKTZld5KlBN4IVbCbcHWHpPvUpakoR5kC4P+36V30Spo1AMg?=
 =?us-ascii?Q?15yslif9O6rIcdkvYdq/mCriC93ibBCLaFeiBuHYJAgh1JcFH5cCCpUN+JqT?=
 =?us-ascii?Q?7oCZI4Xn97LXIvxzpZEfv1olQNlb32fOcY1KcdQ1nLAMlguKlcrUvgm/RfXT?=
 =?us-ascii?Q?ZWY11UXYSW0/gCrPBI2KKk0PIZvEX1AxLLSK934Hhh5QlRh4K5tjDVuz+/FW?=
 =?us-ascii?Q?P47p1e5GES/Zl8xdxuZbAWeRVLlBbgu0ZQNR6PcKHECvD/naQV90Gw1xrSGU?=
 =?us-ascii?Q?FQVBBhWkkJuGf8qSWP2rGkijqi99j8IaPjHxxK0KyR58XT7l/Psd2HCDouZe?=
 =?us-ascii?Q?rW3Xcq/6102y1VGTdkElWzDHtd8f6anyAU423srJ6e3jpn4ZJKugN5nWQL98?=
 =?us-ascii?Q?BzQbgXHkk0GLXvu011MrYqZdziVI0Z7Ipwy54hWzV2bnAUy1Uds9OEO3QXgn?=
 =?us-ascii?Q?XjSgem9P1W++FKQ6+jH7DLBIheYVGD6et1Xcx52SbHNiUH1ucxRlH1m7tHMD?=
 =?us-ascii?Q?Mb3KYxNnvpwqAd4EUMlqCtbZxDtAL323U32J0yTXxWvuCkKc3ZKczPAJDLAG?=
 =?us-ascii?Q?6/WH0+HApr0eGB/6bbDdESeTxyXEUnQoqz6GgvKk9qMYcs1J3gm+apUB4B+F?=
 =?us-ascii?Q?9dP/SdqotLx7clnuA+JqUaW+41XV2mTwj6wxmZyAMf7EBk3JC2P2TRHkb5AG?=
 =?us-ascii?Q?VZ42rT0nET4RUTEdJO0Bh46IOOpJJMGNZPx8AG3JegCONGeVggRSkXCDu2+9?=
 =?us-ascii?Q?NLaIgp54rjmNOyCW04dSp+VSmST6OSIBhNWOul/EfQfYYCYQxgl78Y8zqbnt?=
 =?us-ascii?Q?LhJzYk9vWznNOWeBKWLwOELtcWT0GHE/hmbGbgYbI2G8xcvuRsupZSIQJwrZ?=
 =?us-ascii?Q?s+Zhh2uH5wB0TGAf9f2FlVyddnjNpmplmxB3m0ahLGVsUoMsuQh7IPb8Z6/a?=
 =?us-ascii?Q?XMofvQMq8hbm+KJP4J0osClPgkgnKQ4ApjDpOJRE2v+xQVILzg13CC13b7Ce?=
 =?us-ascii?Q?lS+u7UONUMOd23csBOgLxD/TqY9Q7CDH/eTQUqJBLPt+QJaNIp7URN1McpvR?=
 =?us-ascii?Q?nKcOM/YW3ajdj+ajKcDeKFCHVmW8vzOma4C1jwLe93NAsT8flfKmXVI0Iz5I?=
 =?us-ascii?Q?XWN0Ng4QrDrl42FhQ90tqLjT35AjKQVLdYQM3PBj/OFiPTw2tmdyjIi3cuL9?=
 =?us-ascii?Q?RotO5YHvYIH0ptQjCIfcc0I/g6xccheyqG+FOGzFnvB1VwqNRfw3AJ9P4clh?=
 =?us-ascii?Q?W/wA2jmV627k3RRxPC5dUGBBrQG5hdmDPBgbto4w0mEejstZ+c5weRdMRvuq?=
 =?us-ascii?Q?mzm0y5CHqck1oDJkeY5STVM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51116fec-18c4-4481-ca14-08d9a6c760cd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 17:02:30.4090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ws75LQa3iIHwCeVRfCUF5bqZy+oyTja0fLuOn6Mq2Rw2QDnvmfUy5q0v3UQJ6iN08YZ/qvmSbJ+JORlVUCrMLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1421
X-Proofpoint-GUID: FeGHAY1KIrpHIqCBmaoE7Ie-NoMN7DjT
X-Proofpoint-ORIG-GUID: 3okg7wtEjp0BrcvtqWf9c3uvIRklCcLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-13_02,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111130100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 17:02:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158249

This recipe had been moved out from python directory since 2016[1] in
order to share patches between python2 and python3. But now there is no
reason to keep it in its own directory as we only keep python3-nump.
Move it back to python directory.

Also add python3-json to RDEPENDS to fix import error:
$ python3
>>> import numpy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.10/site-packages/numpy/__init__.py", line 138, in <module>
    from ._version import get_versions
  File "/usr/lib/python3.10/site-packages/numpy/_version.py", line 7, in <module>
    import json
ModuleNotFoundError: No module named 'json'
>>>

[1] https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
 .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0
 .../{python-numpy/files => python/python3-numpy}/run-ptest       | 0
 .../{python-numpy => python}/python3-numpy_1.21.4.bb             | 1 +
 4 files changed, 1 insertion(+)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/run-ptest (100%)
 rename meta/recipes-devtools/{python-numpy => python}/python3-numpy_1.21.4.bb (98%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/run-ptest
rename to meta/recipes-devtools/python/python3-numpy/run-ptest
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
similarity index 98%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
index 8988a5bc39..a3ea4ab5aa 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
@@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-ctypes \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
+                  ${PYTHON_PN}-json \
 "
 RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
                          ${PYTHON_PN}-hypothesis \
-- 
2.25.1


