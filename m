Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6BFC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 19:54:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25375.1676318071788658374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 11:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qjumj3ad;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14089c10c5=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DJMo7X014029
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+JFZQSt6wPRefGANA8m3Tt2WhUC0laaNB900DkB98zQ=;
 b=qjumj3ad38D5KEdrAAOsX5ykhCu0fpTfvnETTH0DeFlIiULqkgHc0iUEyNVu4p+Ch/MM
 whnzCfvU6qJ3BG10ntAWYLwOPXc9d4ucQYk98dY3fzT+/RFCgjpqKCJTyuL9JPLc0z1o
 4YzPdKq3tvvOlKPuaFFkNuTKD3BaUG1RnG8smVRA7BgNTuZvS0itkfgpha0pV5J31qga
 +VVF0paPln5iEaNmEft8aCLQH8MczgR/dtGMk8GrRzU+Y/cREbNJdVMHfz1ACxlvcBmK
 1wPY2z5V27aE06PXf0PlbogjcIhE+q5e9irvfDhZyw+aWiS1bGq+o9eRXqrBCe8Kcz+d ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083a1nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:54:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DJlij1003816
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:54:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083a1ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 19:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+Uk6r1b9A1MGDfFQDWTHltUVw6HaBewEG0u9lQ9DWKlqDsdJIIutRkJljgvrQ+4zMbfSbO3ymL7NrfijKYaUynr/jEny8dlfdJsBSMa4dUkdTiJviVjqUli/VZ8jaxRaABVdNJobS6jbeQwRvTfhoXT7yAoO3YtpLEGtM6XcEOk9CaS+3717yIPXoy2elU+jtBF9Dmi/gsPPzL3CEB7215lUhRBqSZ/FW2a3bY5JuWaBi6OuQDnqtosGIzxODQTMUieX9OIQG6eA/vWapt/w45qsL2xnOk5kO8eCbwepfyPvy1TNsYGA4tQfGBn9AOzxADPJ32QRbQX/KVrEjo9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JFZQSt6wPRefGANA8m3Tt2WhUC0laaNB900DkB98zQ=;
 b=ke4V1NfNnwcpTSCr2msqO7fzXyZ3Ac+rwa18DjLVdySLXopKHK3mvj5KCSvwhfnk0rKXBRm82qwidm7zZ1+KbFyzYogJBbjNfOO5H7upYk2cfLmNl3oTk+O3Kd9niXrM8tsV3JYW0/Bjzh4p0eY2dbscv0o6AI7xjtFT9C4cKoQB6ZEpjKtN9lJhdNbraMPXOhgDqc0PlM4u4RsjyMPyzkpRTftOi/9V9Efbyz6sDgMNvxKptgwfsfH6Inll78JoR1fnkOOcCiTeLJAgA+MI0hwNEeb8jGcIPJlw3dDVc5y14Yxq15Xs4dW26dC/caHrbSoooFbqFtrelgXgZ1WmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 19:54:26 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%4]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 19:54:26 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH] create-spdx-2.2: Add support for custom Annotations
Date: Mon, 13 Feb 2023 11:54:13 -0800
Message-Id: <20230213195413.3535358-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebc991f-2653-41b5-4e9b-08db0dfc1c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vL652UVtf+G9gguCmuL1FCC2Q1RS09alljU7nGxUVAPROPR3lW/yRI52gHak920qkK0JqtJGakduBUx5RLXtlsxYEOL6RZZmX4S/i5aVBuFhMObRss4o3JM6KG6EstkbPPFDD1pbT82DOTv3cYjrcvVaKYBAZLe1OpgZ7VqQ6S8ZF8lnPzm6NaUW91MDXoCX0WZmQaFw+sL0+D+1Lb4sanhyTzpb5k6MRPZxPuPPRrxPZqElgAeS3/SE0oEGvFRO++pb/I3Arf3ALkZJ4AgrabgKnpvPybSoNMWfW5OMkw2ibMtW93wDr5T0wEuHT4UH6MEJzmeBN58phlbvV5+OkpUAvsvT6lj+MNwbHo2+K+gUnfw/I19mqCBGrfoRK8x8302KYzWe2cu/+gbch9FxLJHRBWjB6BivgdARYoZSbVZr5/J6jAc6869TNnLyZ8VvajKKil7W8vcLQk8V/Nt1a9UmMqqYyRrxJAQ69o++oUuKf3CqnxAbdfc0/ti2dTZsvuXVuTX78+7PKtW1HdM5LOIKtlkmwFMdWwMWfOzWJ/Oe05ZXDLIFJoQg4R2YNjsBMIN/kGf8k3vuD+9wlN1PVBetlIgk9ZZ60VJNpUVMzxtrMtSqqSd9o5wKzh+ICFV+04CYD1tUw9VXfvzafSQsVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(451199018)(6666004)(2616005)(8676002)(41300700001)(66476007)(66556008)(66946007)(44832011)(5660300002)(2906002)(38100700002)(8936002)(478600001)(316002)(83380400001)(52116002)(86362001)(36756003)(6486002)(6506007)(186003)(6512007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e/pN2qJu0T/847geZDLJH4VtWRarOycPKe97CCk8IU6tLYCjfrva3oAWrO4f?=
 =?us-ascii?Q?aH0WEcmftrrSwDxKG4h0lRvb+SIoxY1iHV7YJq8VVssB7gOFsJ6IPlhi0P8Y?=
 =?us-ascii?Q?h8D4kcTliKAuCITcLJBVu/Ij4N4nYkSbuvi0zhXzhXYV9m8uhdVDRHe7sOtp?=
 =?us-ascii?Q?dD+mQqOZLNurlG+v8OrFElUWagUzNkR/0Or3WJ9YXIsIBvYtpSUBH/H9Cfzb?=
 =?us-ascii?Q?/1/a2VeJUmUCl26FW1/1qve4CptlIlkAyj35XrFsW/beM+TMXGcZdrYgSeLc?=
 =?us-ascii?Q?87PnLDDco6g/EZ9j6jtrmvbwqw4kO1/qn7eXifUZTx2swtRcSPif+kLf6vGR?=
 =?us-ascii?Q?z4ODNs/wUjMDULZ/HjBpYMJc8HNpdiUUm1WGhwhD7xV1JZgvMmSaIyPH9+IV?=
 =?us-ascii?Q?4k6iSDAL0+SynHexX36tAqb8eV9S9epPBwKsyjsBFOejjJYsP2sGM3n17Odo?=
 =?us-ascii?Q?BMb1Nq265gZ/AKoJ3yPky8clfp62rJ/2V1Qb+zv8UFzO2/ZJgXDL5dqMxCqM?=
 =?us-ascii?Q?Az4BztlqlPEnkuKDHv/mkxrRzGU+nBnS0qfxpCJTaaOhZ36L4BnGIJ4HftkZ?=
 =?us-ascii?Q?Dwe60RUlsde4jeC9Wxo9QdaOW4fcVaanA7+mjgELzdTse0tkBf4c9qghN6ns?=
 =?us-ascii?Q?8eFL1gacX71EuHtlQgp2BRWcasNgxk/bwNIJH7uaBSMQTKRpO+vpsOWld0Mj?=
 =?us-ascii?Q?+xAqfjHGIuPdK4A8lJWCppXKofk88yYbT5KvrXzvSK6UrP5uWTgHvnN874vC?=
 =?us-ascii?Q?Hrux1UB7SZ0cEJTPxS5ThpWzKMnmmN1hQqSbMY71Yv6wuof/bIlYbnvsMfCx?=
 =?us-ascii?Q?5J1LTqPtf+X9psQRY+IB4y/2ktmD8NU1mcO8dFCo2G3dBev/jz86enQ7+YF7?=
 =?us-ascii?Q?iWThgFL7XR1XtsAc0XPD0Aq8YW9rP0hg/TVrHNWWziOmCb8OcFRR25+XwL/b?=
 =?us-ascii?Q?B6w1C592jHd2XWYD7Uld4PQFyeZlYNjkNVM1o+4v69A4XxaZAc1tB/IWdN7g?=
 =?us-ascii?Q?pE5Lfg9ayYzqivBLfvuJ/xBqh5hq0MMe7sPT8jhbLzJR5M14qLUUyGrYVzDW?=
 =?us-ascii?Q?r6t7UZtRqU97IVAPF91YfprMh1qp6qN7NYd3c1DHjiXk4bVDCdVEbEJFMFQa?=
 =?us-ascii?Q?0+Gn9uXjRWNBtq7kHL1j7dCHUpGkU9DOL4o07OYHJ8LulcXf8JUmg+TnWHsr?=
 =?us-ascii?Q?Kvdbf5VAm/Dg9urVIrJLTFjTQyzMnM3bKVRa34zGMN+hLXHEYj2YONDQ8Gsq?=
 =?us-ascii?Q?YjosifL/+Z6NwEkAv0IjSHnwA8+bCYXYVuJ/jPvxeHG64wDiOJZSl1xk6Es/?=
 =?us-ascii?Q?P8gppnVg5QS8TcisWlorDFB/cp5YdpamZntSyDB3HBtQ7Qw6MTxzbHlZ7wKf?=
 =?us-ascii?Q?SQMglp9L+FyJuPqPLbzY1H7BePfNpIYpa0yhrrmZ2Nsp3gNZnouJeEwGR+9Z?=
 =?us-ascii?Q?FMGCE9mqYCFcV/nTddcdaQLK3nfRRHV4w/4WCtu04LkPde5kLIhEtuZZDEic?=
 =?us-ascii?Q?hErQty5IW02+8kjgdNZwKPT1q/jUENBn32L6gNJdhTdBhm8s+sZplbmjaqkw?=
 =?us-ascii?Q?jetOAZ3FRmgGpJOg6dQrvWqFvrDhdyKgVXeZMyYYjU3fn/uE32BjzW/NqxYZ?=
 =?us-ascii?Q?GabaSO5HKmZi97pnJUlYHjsd66xFBDloMvtJLyOApvuVebdiHiZ86lxJEyQR?=
 =?us-ascii?Q?HkThjg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebc991f-2653-41b5-4e9b-08db0dfc1c49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 19:54:26.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrqTjQN/S2qgZbmp2Ga5Map//NOMTHqkBLacgBx4U9PgAuvWBlfmG4Ng6xedH/bHKX0L1KzluX+hXpcD79FA0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-Proofpoint-GUID: 2Iz1bA0yYrkeOglnco1ZPNNx02m5KzWi
X-Proofpoint-ORIG-GUID: 25x0UoztbmBZhGEa4GIJin2pMVFLmKdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177109

This change adds a new variable to track which recipe variables
are added as SPDX Annotations.

Usage: add SPDX_CUSTOME_ANNOTATION_VARS = <some recipe variable>

The recipe spdx json will contain an annotation stanza that looks
something like this:

     "annotations": [
        {
          "annotationDate": "2023-02-13T19:44:20Z",
          "annotationType": "OTHER",
          "annotator": "Tool: oe-spdx-creator - 1.0",
          "comment": "CUSTOM_VARIABLE=some value or string"
        },

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index f0513af083b..e1bbf646ff9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -30,6 +30,8 @@ SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
+SPDX_CUSTOM_ANNOTATION_VARS ??= ""
+
 SPDX_ORG ??= "OpenEmbedded ()"
 SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
 SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
@@ -402,7 +404,6 @@ def collect_dep_sources(d, dep_recipes):
 
     return sources
 
-
 python do_create_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
@@ -479,6 +480,10 @@ python do_create_spdx() {
     if description:
         recipe.description = description
 
+    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
+        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
+            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
+
     # Some CVEs may be patched during the build process without incrementing the version number,
     # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
     # save the CVEs fixed by patches to source information field in the SPDX.
-- 
2.25.1


