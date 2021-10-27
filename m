Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE26C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.5859.1635298276114145461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gBftv2lk;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5934f1ba75=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1VFoT008178
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6GeuuKAohXYPN0w9sl+yguuzd8LkFy+e8wsyOj4dY+w=;
 b=gBftv2lkzG+5h7PNDA69KjsjfAosbtfGQ2nI2JY2Oe/Nbn12vQFeDFS0LPQGNntekTzz
 liAZiyHRLff8y4KGHGl52H/cfxCgau01pIfYHk13xjR39DP0u87a6HZz81BxmUoPzvsE
 NXQnhSDGTS/K2/1OPx9/9ZGgq3cwDYOLaleH89gwfRjRbUl/x+IVzF+W0HFB4UtlRHIQ
 o7Qe3GB/rAsQsGIMwi2hVnWuzCKmi25wqWJvNcYc8k6vVprDGqdUhHRVYEp6wnrUEqF0
 mcoq96A7TUqbfoHAVfBqIW4WQXMSHpQn8Cx6iLxpCBcMQSTr/YqiRgDM7zW3/xxJcG6a 2w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch372-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:31:15 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R1VE6l008157
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch36w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 01:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5LEGeSI8qC97E53ubI+vVDCge/wVsXCVg0PbhMFDOCKzTdPwP16QOlqn2PGRqnozE2hpq/d9cB2DJTvbnidG14mI0vOK61vxBISNQT0/GfqmUUkWPVmE8zXusKwrldDsFzEVH2GHnAia6RrpU4WMeTzlqVtEvfe2Mom0B4TAil7XIRUaJ7/oBV9TfGzj7Nl2zN4si29Lg6de1n4Ep9mRis0HADHbBdoCgm1NLCuC1BTOb8aMQfyrL+cV3GX3hM8cvZCgJ0a20TSrGsw7ufN4MFkmULkTycfLJTDEoAu+S9Fh77OUCmivgPN15Mhd7lNgEK7UptL6g2ho1aWiyQcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GeuuKAohXYPN0w9sl+yguuzd8LkFy+e8wsyOj4dY+w=;
 b=kPj3oZZZ68j19mN4oxokSx6JoqoSfVqub/aWJpUu+XPVvPEwftJdruJylVIrNdO9ChLda4KkHVezl3RuMq+ZwBeRiImFQH99C32cLZrXV26icVPN0wR2ICW5PmoSO9qMhxEvNkaAmQ5CvkHIWcywQq0mzE7pYkSZtNyxTFwHtsdXowofAkVanihKomU9wkjOALwoDJnPNt6d87DejSnpFiSzSL6HM48OES00O36i5pp0JVxupuJcQfYwvxlTbRUO+n75eXkL+axOxZNQ2eYB3Qg5ckZF8rhDto/fhy6VHQFs5Dknx033uW7sawslnBoLyBSYqreniKTzFzXeOQUTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2030.namprd11.prod.outlook.com (2603:10b6:300:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 01:31:07 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 01:31:07 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/3] SPDX: Add annotations to relationship
Date: Tue, 26 Oct 2021 18:30:47 -0700
Message-Id: <20211027013050.137364-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 27 Oct 2021 01:31:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab05fa6e-58ad-46af-babe-08d998e972e7
X-MS-TrafficTypeDiagnostic: MWHPR11MB2030:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2030002DC029F298AE5A3CC4EE859@MWHPR11MB2030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lTXRkwNhY7INix7FDW0tPgCvojC4Y0nXZTyxN7+7yO1gfZ+cp7yLl90KvTpDtGyYbb9K7bZiQrxLa8rJdgHlUgZdGwwUtdo4Hn3KLlFffo8pY/yBV58inEmx46x+McLtyjqHjT+WXrUkhhZRL4f2K4LsdndE+YO82YnCdmiMJjVjyNU/0Gp5AfmZG1OFuytt23DI2NTUrafNtg/Qf1JEcvq+WTlo/a0ylFyjW6chXeZWTpByHCRPyJQ6uajXzkblTDI8yM43q1O1NZBBeYQi3klyURt0FrllOyWvrmYO9+LWxtQ9BuKsdMsckBg6sCzPK1fu8rY2C1cfVwlws5nUvTjsBBlSRfucFWDch4MeRR7of4Xnvf1kBj74FiTxnZT2gSTipcKCUjO9pfcd4Eesr090un4tbpM8SLaQDOWZ6V5yTcvp1dT6fchUm8xejfsNi1lG4p9KyMcB9Mea+kP43xnvkIHbajgNl9RKUVqFrmESNgBj2hhKcoZ8SyvYj+S7ZZRis8Q2qg5k+FJ3LenW7M0b5kXzUSaohxHS8wp7SU7WE7fEEbddQMDSS+Jyr8fw4k1gN4FrjNEGB5GXQMTjfxskFH+HQet3mrGtTqdquTPmc5aV1zFY/Olfg/XPBAqVpn1bSe9CpF2bV/c5S/McOHNyDbK5kBcN7xon73mUE3HS4TFjaPWF7TX4afKZH43roa+68Sz/dnZ0l8n2z5Sn8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(6666004)(6512007)(8936002)(4744005)(66556008)(2906002)(44832011)(86362001)(2616005)(956004)(66946007)(107886003)(8676002)(38350700002)(38100700002)(508600001)(316002)(6486002)(26005)(1076003)(4326008)(66476007)(83380400001)(6506007)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WCFf6iAPuHVQqwIicsvXgePq4NTDL8th4PGbcYg5h+nybUtPOO8dJTnAIWqM?=
 =?us-ascii?Q?ih7Ts1v2GlqL+cxAA9XskEIzJbcrRHg/rHJwLrEbwTVqzsevF7xTSN2a3nTh?=
 =?us-ascii?Q?062SmZ/0BBmRWi8nxuqnDJdc8f17YsaYdqCbB5Rx/EmdTRfnftOkHAV6dPwl?=
 =?us-ascii?Q?AYOn2BC1rZO7qBCiT15q37gXxVNRufeNFnHAHOMbgUD31Ev54hu/1OxjfVry?=
 =?us-ascii?Q?Ym/nWlCyhC94n7DAlb9Xou4NS03vq5pZRhMc0MnK7JRaIc7DMrh1E5mHgTRO?=
 =?us-ascii?Q?oPsbdBzcHV/odYhwm7/DrcJaXRLKemTnVyC+4aMRDow4+RlkZmhlkyHq2hjg?=
 =?us-ascii?Q?WedAfJYUWg8jWzCN3MKb/VqMA+FqmsZylD7C0S2xLX0lYjEVJQ7EhaK7NzQa?=
 =?us-ascii?Q?EVHQXgWmFGeKLKRCjI8/ZDSdlKEkbsv/MDGSSN5IkPSbWnImSzioOkW/mcks?=
 =?us-ascii?Q?Az+PnWgWVR+WFbKpkhV1cPg5/Vc8zM4R+PoYDUHHjCGHxi0/P+tqYvrWvLgI?=
 =?us-ascii?Q?QvB0mEwfwsHWtM8rh1VHjWfOvETVVkEgfXQaYoGzsAGgtjBD9Xw/jixSsCV4?=
 =?us-ascii?Q?jb+ZCiDZhRStbdQn1s3/zcZCR80aGDideRGHmHYyIHqXwnNRKvFr3MvjfTTV?=
 =?us-ascii?Q?iuVo2gmhUSf1TlkiVNe7GXBYidmGrmbJjSfV95lRQ+mu7CzIIkYdRFw5LOTd?=
 =?us-ascii?Q?ZvY5VAzl2BF8512dcugWGRwOMkRjV6+xak3FkwEK7pPBA8ITtWlaBWSwg6xH?=
 =?us-ascii?Q?/ame6hrpIu4XBP9bLL+ODEl1+rvFHQtVJDrW1SkX7X8mtOgHn94rT/z2TRWU?=
 =?us-ascii?Q?RCy27pjBznGMZnmF6JChRmF6m1veO9Qp7TmXlHq+MJiETP80xdkl0Pfr2E1d?=
 =?us-ascii?Q?feTbIAcoONTJxIsle0a/o5jl702OGUDmsXLIMYFgAxJdx1Y5j+pXxz7WTVg2?=
 =?us-ascii?Q?EzFjeqtgQneH3EzQrQe/JRH2npto/n7JmVzzJ9dUtTzS+pT/XCQj1t73znEr?=
 =?us-ascii?Q?IleJcqMygSx5+g8p0U+3hIWKRf6F+Vp+r/NNkqEve50GlCkdGSk7sGKMMxh9?=
 =?us-ascii?Q?CmA/V+hHm0CjT/DJddUW5TVy6V7Vdfn8opXcPwFLwGzcbPiObHremr5Yz8iL?=
 =?us-ascii?Q?pfmFOPpJi9T0QTobNdgWEu5KpmM42HBY6Nf/s9lTpxbqk9k3adeOWc8C9pkz?=
 =?us-ascii?Q?4wrSmcvBTXW+MTMXYAiiF19SZWTklnbYnbjjYJ7IScaf3M4P6j1h0GjB7FOi?=
 =?us-ascii?Q?JWg+mJIGqrLsslQXtpCSoOIMNlwlE6fXQYSWaKM6DWFeNObarOAGuP2gy/U6?=
 =?us-ascii?Q?+OCxfrut4kg5JkBtyE5gUjTbvO+lDWV1UHWgH0kt3jY8tvOv4+EOyGv1iXG8?=
 =?us-ascii?Q?dyPODpBMraKRLAwn28xz1gJDx+tbWrg3z+oFyWWkqctfzWzoK5SBH2j1APcW?=
 =?us-ascii?Q?d8Id8lZdgp58KwTSQAhMCyP7VsNjfqGpPyCgoXNgVjWRll9XWz21xbIyqjSL?=
 =?us-ascii?Q?XsNmQPTkgha4Omj7kSjRx4h97NwBntvISshSNSwKjcR4HAfpN/AA71wQaWki?=
 =?us-ascii?Q?d9IqP5G+Y5wub2TDMNJtQBPkRdqHe9rMq2jUts9nOhD7ID44Ej4Drn9iHCbn?=
 =?us-ascii?Q?zwHgcz+2E5GriWUPOdRxTio=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab05fa6e-58ad-46af-babe-08d998e972e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:31:07.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qS3/ATi/LR9W2YWAdrXZvsHc0alEjDUOW7Gnktxjx/yjUbk/N4+y8V9L/gm10GJ2GsLSTe6oR+lBI/btMeRbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2030
X-Proofpoint-GUID: sPKBtzK00uRoMaYMwpUNye0smfwNIv_o
X-Proofpoint-ORIG-GUID: PrWFzcrYx1cYycSKxGcZrBBaMlHj7MNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=582 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157470

Add annotations to relationships and refactor code to add
create_annotation() function for code reuse.

Ensure that "cross" recipes are factored into isNative also.

v2: removed leftover and unused annotation per Joshua

Sau!

Saul Wold (3):
  spdx.py: Add annotation to relationship
  create-spdx: add create_annotation function
  create-spdx: cross recipes are native also

 classes/create-spdx.bbclass | 22 ++++++++++++++--------
 lib/oe/spdx.py              |  6 +++++-
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.31.1


