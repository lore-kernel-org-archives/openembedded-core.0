Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A20EC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4551.1635291383289047982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 16:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mtYJmAk7;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59335ce822=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QNHlsW027212
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=MVd+Ko2mwJhvOfWMDmV9XRIdB6h7Rdd0tX+aDJzwIXs=;
 b=mtYJmAk7lin2ZLNdwqyWpWGImFjGrUOHJ8wZvaithPZUwRUTKnRiwFtNwzo2Dytj9cZ7
 y3ipGFIyy1TH18vnFZxfBVlg/JuBPvmDaOnBW1La4jAV4IxWd1pe2mK16uVIZR5q+HZy
 or8KOlrrksb28Y5gf+lLmQhLM7eGHjPlDaZxCSzMvrJk7rV2Kx1RreJyecFpQEw9POe8
 4skptnfK4t3OlNrx8daKa5VWRTPeXNM6uI7MnacxgiHAMFTXkkJZmN4817RRoS46zZJq
 /Iz+yzKbuzmkrB9FZUXsTLdGQUgieNDhpyboRRzgKs5u867FFD4G0GUiwl8vq//m4bMH 4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs17y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:36:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QNaLQn023500
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs17w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 23:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Juv49rVs2JASN2ncI7tLyoP5E4BCB5k8jF9Pjok48GlnzBXgKcJOt9a0o4+ki9vRDnJo84bJJsHtQYTWvrYyYpYmVJC4Ms8fPPn2lokuEBCFJTIP0qq3+GuCjf2nCBpjGJ7mHUbXKsXVcNEq4WkuNPoalklAmiMYXg6BaK/agqVVBf0zty1DVKv4bDX6OuXEOVNvHUf5hAUyqXpDcAIa4QbwUIIRXYNu9Qaojy++Wr+D5tkgVx2H4AG5AkCj4SgcVnJqJYZvvQek2t2MKJ8Cz9lTEx+mqvWK9UK93PlnOXVbQNuByyv6Z98YWBJDH6Ex8q0J/UZ+2aj/zA11NqlZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVd+Ko2mwJhvOfWMDmV9XRIdB6h7Rdd0tX+aDJzwIXs=;
 b=Ey/JwktNr0lZEgxO5hOvsI7EHvmuk+5Ocuo/GAUFzKTpZGGutX87WRuVZGiAIfhFozMOQNk8r9sGj8/MPDN8Pb9FysFqov/dVoxv6N9PuxgyxrDxin6ifNzU0NUoCgTX/kvwnl5zxJqH+44vpPyauNoeNQXvOrRsCmqZd1n5iX2WyRKhz1DlRpNmfnWByKXTDrDAKACVCH+pmTgeDj1+NXXuXe0oQtipYTuMWW4lZcPm83GU8o2/ATYtu6vGAY3PdTRVL3kjoQrLS1Isfs3eOr3exJ9U7LMaRBOkRo2aWS8NJWoMuGrwgY1YZm2Rzu6UuRhzmrSjxinzE0Ea8I35WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 23:36:19 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 23:36:18 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/3] SPDX: Add annotations to relationship
Date: Tue, 26 Oct 2021 16:35:59 -0700
Message-Id: <20211026233602.71762-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:c0::49) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.12 via Frontend
 Transport; Tue, 26 Oct 2021 23:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed3b89d-193f-4af5-ae17-08d998d96904
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB58818A02A96200241BDC08C7EE849@MW5PR11MB5881.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	db1OiG6ii50qbylkF5Vfrl2bPFjtldtjXiApsHDtofPUXutuetfLV1aRejlG1SkdouX7E7VMfcp1vT4U1O8BdxN1Ggqq2L6jd3iOsF2Dl//sjXIao5EL/B2jNhbFZ5SQLdWYR/U7hOhAuka2Y4xw1AzjsZv6ekkSjimrsz1DtWFqUIsAVBODTHzO+1ry7TH5LhzJWpPtk4sRhlbXqUrma6/r6IZ/VBWxKIUXxFoQjAgWpCyxcnm7ix1kTVhZcCWZIZv+ie8VUQqlFbzDYWGLsLXStf6vsrQhYntgsLJdhdLE/ASULnCzB+b24dra+cbkOFhsYlmtD7gidM+h/5vePB+xbbY2Vhl4FBOnO6fmR1KtCudYKeWRvX2xUuaaFV5qmTa0w0Ojz4VcSxQlr0ykIhhZVpIU4THEdecpU7z9xcoaCXUSeiRbxo+g4aPxxLlE0TLGjFRpudcG6lsrgHsNVYjuM79lOaTS/3Yo6mnKaCH9uT+DXubI3fNDw3LMBL7bNpPrv9kEjbMhM/xJOHkzCY6SrULWK/e6CngPAEJDFXX6rxy/S1h9IKFHiOU2oypUGnZkpkqw1VjXJ8oSAt2AgTfC4W7lFmU7VR+LF5KjZJNJVjhEtzqGi1vddujw48aeS3HC9j0SD98bOFWvWaPMh95DDntSBrIkyjRh5oQCrV9ijfUEqsgz6Y3iOJH81Zw/Rl2EF83DAwWupEP8h+TFHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(107886003)(26005)(38350700002)(8676002)(4744005)(66946007)(66556008)(38100700002)(44832011)(6486002)(1076003)(66476007)(6666004)(6506007)(36756003)(2616005)(508600001)(186003)(956004)(4326008)(316002)(5660300002)(52116002)(6512007)(8936002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m3qvFmcBnCJMZjyieZDkIXG1+v0pUKgP9EP776DiaFpCrqFzzCrMkaUWDlBI?=
 =?us-ascii?Q?M0dx14lB/6z38AQczkfXcw1f03zKpDxNIVEdJqcTWjWBZOaJt2ESPH2ctwu8?=
 =?us-ascii?Q?eueqNjYfnwu65w632dsOFgCQDr/tYm34QMBUn/oVPnw2I3tlRMyAl3iNojUu?=
 =?us-ascii?Q?Bf8HCnz2QKfbS/o3UUypxy0o2KBlDXS5ih+IrsiOil+dTYIuLKjOphmieKWB?=
 =?us-ascii?Q?HInd1rglisGWszkUa/qcLX//KhrW+kxtu+sN4F+wYxf9lC88bJCZP79cA4IJ?=
 =?us-ascii?Q?RWPbgpS+w+37A3bB4mAnxDRcLAdfDwH9EVpjecVCs4x/WbZ0+SAJI/0m9jhg?=
 =?us-ascii?Q?HB++ZAHaV8kbQg2KD5aSjtd27dyphP6hMfq2CKxGeQLJtaa5FP5QmxNsvVPT?=
 =?us-ascii?Q?jm0lyUOj7ZchmIrrfxUmzk2lVg/L8MkyI0JgyLU05ZZ2p/uYnl3JmKg0Qxcw?=
 =?us-ascii?Q?fCP5Ti39QJSLfJqLHcwRZDiNbWKWmnWKm/r1Ycxd6M+BEuhgn7J1hjJLNSk7?=
 =?us-ascii?Q?lq3jmXQR3ewnNVJPDe9xIE9Se5I4NDWgpfHX7M1NnwR7zibtPP62LMPd/mJC?=
 =?us-ascii?Q?DAFB4P7CBTCdAePML0mQYfn4wVNezJ+Jx+YIitMsfVa3WzYRre2NDIXtxKdX?=
 =?us-ascii?Q?8h6MVzb3iJJ0gDLlmDnU8+txB+FryybOG1PJFJ8vZ+QK+QRycb5NgMTVl6G1?=
 =?us-ascii?Q?ubTBnQ50PoNeOP9SXKkx5uSvhYEVGiQm69EUQ2Ql7hVW/ax496Jgum1GjCCz?=
 =?us-ascii?Q?s0p/LZOzNDvhcuwagW5vDa7870B4DPUacoSC03IoeFxJFkK5U93ILMSLe9XG?=
 =?us-ascii?Q?tzrpbRxnoP/a2fMNQ8ujfe8mmFIxIzrvD2VHhsG6HhJ4hsE7L+ULtcN7m9cs?=
 =?us-ascii?Q?NU+7tPKr+AL3OrVbtJvylSs2eUIFWbzS7Dtw9eDeCYMS0soUAq2cOnrJuAp3?=
 =?us-ascii?Q?Ed22AYWCaJp9QEsqNsdbDlRYsaZsGOXiqMvXhErUCHvRHFlfENvPv94FxUOv?=
 =?us-ascii?Q?C/PPaeX5W7MuDW8jFgjpKdjH3fwyfjUEYJq52L6Ida/O+ZDEClGH9jEoukNL?=
 =?us-ascii?Q?4r6kksy9ERowqVPrC+kUoJIkbl+8fWAam6k9dp7fO7YIFEZ4mvoE58cYq+QT?=
 =?us-ascii?Q?GPDeAjutOIEgJT1zQZY+Mt5mzIt3gmCwF6azCr7py3zmdVldkJQ1+Co3Kxdz?=
 =?us-ascii?Q?mR2PFFvqKWMBt5R4o5JI6QfDLGOo/KtrYtC2oThqXmHLsvYg44YBIb3F1Mch?=
 =?us-ascii?Q?zPrpmEyCNBqMAjwj7jvtFe6B5Iphkjh5yPtjURc7xhYRldsGcvfG7UEAUNU5?=
 =?us-ascii?Q?iFkcR9oEFdMpmNSIDBPQnkWzxNL8uRRlZdtbVE6ffZPdw8ikydc6BTAAIcab?=
 =?us-ascii?Q?JFNrklY62SWuny3YRu+nY0/sjyVHD3+4ht7JvAey3g+dQHlaCGRMN5l914nA?=
 =?us-ascii?Q?SsHIjACCwQJ8mi2SJJeuOsSuXUEY2QNbJA9y4HDL4aGAdm9X2AulojeD2Ntg?=
 =?us-ascii?Q?O5OACtWM3bbW+zMRR/UqPZjVqOJJsaX86AzIGYe+UuLX+zbABUkClZsnZ+C7?=
 =?us-ascii?Q?JUOMM+d6pLFlIWyYqF2dyk00Y1fVxYbHURICz49e4NByopmhSjZuUy12xFi9?=
 =?us-ascii?Q?4Zg/pLKCMSIE23rQu9PixfM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bed3b89d-193f-4af5-ae17-08d998d96904
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 23:36:18.8408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 emG8p00wd3R9skznDMccN2gHM1aQqJ7NW19dYeKLPteadNJ98HihiRuV58hegI3NW+rE5Zn1Cmp48yQ6uGVYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-Proofpoint-GUID: xpbgY-EkWkzkTb7L-mMrqAOGxAeqCITJ
X-Proofpoint-ORIG-GUID: 4I6EmWH5dxYjol0a6ZkAql82aVEbNyZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=544 suspectscore=0 clxscore=1011 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110260129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157459

Add annotations to relationships and refactor code to add
create_annotation() function for code reuse.

Ensure that "cross" recipes are factored into isNative also.

Sau!

Saul Wold (3):
  spdx.py: Add annotation to relationship
  create-spdx: add create_annotation function
  create-spdx: cross recipes are native also

 classes/create-spdx.bbclass | 23 +++++++++++++++--------
 lib/oe/spdx.py              |  6 +++++-
 2 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.31.1


