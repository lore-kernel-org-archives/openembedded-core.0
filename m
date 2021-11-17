Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09B9C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.10888.1637172777662902394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eiwvO8nA;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695583d416=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AHCR1Z2023661
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=n2HLRzj6ZeO5ePSiB0qaA2UUxAQGzW8cSgkxivUVUW4=;
 b=eiwvO8nAf7maMq9lFZRq9a2Liojo16rqjwz/Ld5r9Cah3F1O3N6pgZ72CU8aO/46nqm9
 eC0nclXk+zkayukJEb4N7p3Is7ddax35OC16ADUk5BR5gVCRYbydxBKdriEpCaeFYndA
 7rByFnIchv9cTwnR1LA7yobbyikDnyqvJjrrJm589x+h8IW/6b8KzjvulVJmdSseqUaf
 QrjEwzX8QwpSVBKDZ+yhwW9LO4A6PLyoV8BmaDZg3HJPc4iC04hac0pMwYMC3zb65WWZ
 xMXmqoae7EPLnIloOBuvMGXrBlw+Amd5sZ4T4hbSXI4/5ZxWetJmu/rAUrr0XOqS3L7c bg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AHICtmq023791
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0d-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Nov 2021 10:12:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOThxQVFAGoMwDoIuGOEG7LK8VvNce57UbjDmcHUhNpbC7aqOlnH2fh3KX83EdjjpAwiCDMu/iqVlkbmM/aDoIYjwGru59E0edCI1mHi+M1g3C0WDhy91eh34JRU8fE5UlwotLrOAG+ajE2apG3YjgK5e4L3tjnecVlZqnGq1Q2mmDOXNrsmFgqvmLraW51KjBzyqZyxa+6h7AS0ozLwVal7xUe8G6HdtMDOVedsrKQgeBke92xPnhJ2xD1TWU0v01X6LAUF6t+6jUCd25lxYwKI0OsaxIT/Y+nKYzluewvpezA3wt8E33NHDZRmITQ7zbPMf/rTRSCKDojn5NO4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2HLRzj6ZeO5ePSiB0qaA2UUxAQGzW8cSgkxivUVUW4=;
 b=Xeyztdf8zC/KpYmTLhLg++QC4lR1tfaL5HGeP2TmDy7ZQ/LcFQNV3+6Zioo370tJsoIkcOw1AR3o7su3F3KUOOVioTeTeIlWQEg05JMBLGQb5leHSjb8BMeO0SA3CLq7u2y6ja6+OZA442nI0MjbjJbAk3qEOFCroV2t39OpRBxe/IHxNXG5afnkRr/p9n+zGgEs+/obmhaPOzFa0yOV0jD4h59ObX9qww9eBc3JnVYgcwkSQz/TVgBKnriE2JepbzBPnM7B7EpE2vwuCIaVBm0QpNHFuiJMqHkxzwiuKEcBulds9cvbSHkDc8MpCuBSEPFndcraQJegBBib75hWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 17 Nov
 2021 18:12:54 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 18:12:54 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/2] create-spdx: Protect against None from LICENSE_PATH
Date: Wed, 17 Nov 2021 10:08:14 -0800
Message-Id: <20211117180814.29395-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117180814.29395-1-saul.wold@windriver.com>
References: <20211117180814.29395-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 18:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06b40256-3ba4-4861-b667-08d9a9f5e038
X-MS-TrafficTypeDiagnostic: MW5PR11MB5931:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5931525866FBF9FF8D0EC7E7EE9A9@MW5PR11MB5931.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zL6HNJXbseEq3A/f1Ns21p/6smkz4r/255Eip+xt0l8EKCNBhZW08rJsHlrbfqIz0Kvg5Boa5vPFcRTYbbf3lgmzJJKZdLmPORXOxgV/Kn5z4L02jUvnPoCMZNVRfrF6K2g4RgzLXHZ1PiDmpOGaNiDYrn9vZfCYnut8cn+zteYTn3bznJY+LUHZAko+Gzd1Cv4wTunAubyPoP73Ub0BdxVDLzA0/eFAF/FZ12oB5abIJixK2gXKriZ//tU3bXjPLozXSFu8kQ1bCjjZrBdFcaAVmf980DHYDFL4Fx1KDj5/UGhHhYIEV/6bH8s5n6mSaMPnK7d9dqnQl+mjijP5Y6lQ+l0Q3fQTp9ATLOj/kW8JrzD3J457ohmEPKqJoZicYUiOC5X1c2/cDcemUirIN/ZpGaaBTV9aSgGmq3ZXZ6ZI4GuSf8wh2K1b5nCep5SlaTN0Odn3loSfITBwwLkaLJF/wCqPLwDRSRQ7S2KBm06PT/DLPuCityakyxyFUIQoSSwM9TVc83SU9SPOoKqyUXnHiaJIKDtsqkZYi5h4ul9ZTePo5A/8Beav/1n/rJMLZ6y8o7JJAWBVWqeWwAkH/3TIiKRH2qe1j08+lgBK53TJY1LY/m/XkhcaPLBb+Gh7k2Hh8vaQKF771gtPNdkhDN74NV+h8CSE2I3RvaNF7cpSs7Pq0x9bwKToxOfFdruEWQB073EUmuQKw6rA1w/lAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66556008)(66476007)(52116002)(508600001)(6666004)(44832011)(316002)(6512007)(1076003)(8936002)(107886003)(36756003)(8676002)(956004)(4326008)(6506007)(6486002)(66946007)(5660300002)(86362001)(38350700002)(38100700002)(83380400001)(2906002)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a5H4K78wVwK6lSm3Ayvi8p4J67eNMSpnOks0Pr7a1OLhEl7FsR1UER4cXLiK?=
 =?us-ascii?Q?AGDtx0Ino0pAeTS2Es5O/YZ35UGG6aZLULHAxedvzcUT/l40Zb9W5GvuUj/h?=
 =?us-ascii?Q?WAHYdq8P4CvzTh6PI4mNa4ks0bt3mkwbTJ4b6rkLxm1KYxdJKRPnrmZohJWJ?=
 =?us-ascii?Q?lCiW6opXkrEM9/U4zdzRB0JvCz7pkoJDNspjTEivaFriMqu7jtHW1Z+40yI+?=
 =?us-ascii?Q?qjVrr/EitdJ+fpMhHgGgKG3sU3LS33MMWHaNyWO1Og1ozZlRUgnOLqyr/NW6?=
 =?us-ascii?Q?oKdSsI55bZrr1iroR+6/XtnWOzYMnn6oNU69u18BxzbenmaE3WIQ0LZdXg6g?=
 =?us-ascii?Q?UpsiYAk1vOH1h3dwMVDlwrp/2HjzoIT8U/VlkKnwK7gEJ3NaWcnIc+YQ14BW?=
 =?us-ascii?Q?xUWBoTsGL7QtgtsnslUxyGwU2W1OoFEBaV4/nNG8BPqTy5nA/vPvCeTBNoRj?=
 =?us-ascii?Q?ze+N1J2mlQ1Dhd7Dp4bWLKyt6bISqVb0JGTvbqXsqRi28LGovAZX31OjwZIN?=
 =?us-ascii?Q?rh9Xs2AtKXJbRe1wN+QMAJE3P9c2TVd+l2FWV3+Ddj0oapdp52FnUNvPV82C?=
 =?us-ascii?Q?mWOvM5gQ7ZSfRbK/c2tp7m54KNq4REZNad9V4QZfh+wWrP9Q1BWS4z0ELIPo?=
 =?us-ascii?Q?1dSAHsKQ4qECi7/DzXIh+VDhmo8DnG5fb3BRWTGfyUnIkWyNmj2zvc7AngCI?=
 =?us-ascii?Q?82NWU+FXVdhrKw2WuHPIHCaPJaBuGoPhNvNIZL8qQ3kMtFZIFoQNC4rrhArV?=
 =?us-ascii?Q?bGesq4zNkA8dv7XgpTFGkLu82nNadzUjWTKx1e3xlH9tUaczdQ3fmweCV3vQ?=
 =?us-ascii?Q?vJ/WM+yzSIyJD0Wqf7+IRtvILUY6XO2e6AWr6qWUkxmNhpyCQ90sdqIQIHUI?=
 =?us-ascii?Q?XkWlv/43a+4gcDShPLB6Yal31dil3Cm3qasPr+mTEF7Dfq+q23HOh/656l4f?=
 =?us-ascii?Q?f9xRBg1ZS69f+ohf7O4kBSR7x6XHg69Zfe4fvTxOesEkTv4pOOi+HTcHtr60?=
 =?us-ascii?Q?hpHkVVQPnqQSaJT/oilVnxUYG3VD0k0zBoTmcgsicdrqHKs7cg1me5lDhPNe?=
 =?us-ascii?Q?ulQpWnD3PCx+QzT85uzh4teFul5w7HU3MbzbUlss774GF3HuKAbnk+B7ZGAt?=
 =?us-ascii?Q?etben2k90dPUECSiBIg57nrdqfGoMSHVSOkprzg17vEpTaAKSnlW1XFd2AM0?=
 =?us-ascii?Q?KaksmH8htFv9sJzrLr1V0P6+yLB8f/cuHxFGDw+WvuzjSuOnmgBAMXmdO3Oi?=
 =?us-ascii?Q?fTlrTJaXYizMoIM2dfPZGOGtXNhUj2CImQwHJU3IomxJfkWhQSVHcx8sZHI4?=
 =?us-ascii?Q?W/jDaLX469kSUGFmpzHNdBDFx27+4pRBMCNXqAUBwe4OLoKuO79OSmGUzdG8?=
 =?us-ascii?Q?Quzipi6DV5Mi4W7mCSrS7FWsl0wBO2C+iP0COmFxxJ/1BmIUH6Tl3nMw5cwP?=
 =?us-ascii?Q?DrzIhsiWfiNqs3rBfP7pBbvdoxIyE5zP3HTlImlt2EqNB8C07bRSEdEkpvpg?=
 =?us-ascii?Q?0xqDq+fMF+Ui7tN83AkIzfgTa1PSXSgD3owRmEEhacqIzq3SzG37J2n6oTVv?=
 =?us-ascii?Q?NQPawf6/n7YU65zQuV+a2qxDMOooUoraauWtfL/3NAuvyvY9zo7sn7xANUd0?=
 =?us-ascii?Q?xk7Eput3d0rvWYb9crVYb2s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06b40256-3ba4-4861-b667-08d9a9f5e038
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:12:54.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PiueP4CFYm2yqkGFMP/6kQlDBC3DKCHIsq1IS6uWKJm7oMKQNTZwe+D5GvhyMypl7ha9O2AyyBGr7uGjW75ZvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-ORIG-GUID: yoaNZp4LiW3wYBO7P2srJiUSSxuNlpkh
X-Proofpoint-GUID: OKa9ac8qzPDwwBOcXroQwkeRkJ0wTBUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_06,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=594 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158451

If LICENSE_PATH is not set, then the split() will fail on a NoneType.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 1d5c8b3bc1..d0cc5b1ca2 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -92,7 +92,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
             extracted_info.extractedText = "Software released to the public domain"
         elif name in available_licenses:
             # This license can be found in COMMON_LICENSE_DIR or LICENSE_PATH
-            for directory in [d.getVar('COMMON_LICENSE_DIR')] + d.getVar('LICENSE_PATH').split():
+            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '').split():
                 try:
                     with (Path(directory) / name).open(errors="replace") as f:
                         extracted_info.extractedText = f.read()
@@ -145,7 +145,6 @@ def convert_license_to_spdx(lic, document, d, existing={}):
 
     return ' '.join(convert(l) for l in lic_split)
 
-
 def process_sources(d):
     pn = d.getVar('PN')
     assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
-- 
2.31.1


