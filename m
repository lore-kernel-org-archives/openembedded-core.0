Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF04C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5830.1635298276448258363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=edeqg0e3;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5934f1ba75=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1JfZh014346
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=8JfLXqpw/Ft710lFW6eZluInpbipf7vWVolwgirtie4=;
 b=edeqg0e3bEvIZFyjQT0bzB/90DtD+9cYrUJwMYfN6iZKi7qX/Bmrw5yJsEa048LnbAqg
 RbhGYspum4nhtk3HtQ/L91bG9ADS95h0Aw0QvVeBCFn9LVURQLSc+/sTyQNdZNISuMR+
 ZrRWUaIZ18I4e/xEh4JotIiDwA32qaSUOkNVNUrXtloLRbZiWRzmmAB/HIxeKVFh/X9p
 q6fXH5EYl8Pm5/mpIhXAyC9PcnarGsp57T1VZflg/N7LUty7evM1pgjUuuYSaP5DiIAs
 bNbFe3EXzsqsICGfTfahcf6T5B64ZZQSasIFOQOGj0iBpYjLb8n0TBnjo9hIEWhsSJso 8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch374-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:31:15 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R1VE6n008157
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch36w-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 01:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce6T7i9ns3KC/aAdz/aIW/LosZHADhr87LDbTf+2/e5PXmCQOaYoB4uynNxf7AlwiCdRc7vSe1x5we2IePrV4WglSaqnukHD9XY4RA1UjVlZDBPeyzqObMeV50YU3GL645SdI2A7r2KA3mRjo82a+ohK01+ohCV+s28yJb4sIoiTWZrajvZOwWQ1novOqTADYDOtpGR4TGhaoXnbkoZ9f/Dcu4uxkyhtV++3VpV0MWjnEYp+OA/Se2ShcCOXPQ+RiZSLQSSIeTiJ758XsJ4QDCAOjfYb1GXQjPk4FE5z/WTSjcp43KGEnOWVBSah/K48xUl86wtTvmTDnO4OsYAPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JfLXqpw/Ft710lFW6eZluInpbipf7vWVolwgirtie4=;
 b=fhOwSpxias21oFe2coYgfGHJ/q+hiMCrzPHZOXsmOB9evWVrJ4YkNwDHjFvc3njAfR5RVL7qDkLqt52hb0WV+zscwcoTDhRrd0f+j+A20BfG5Ur73pBz92jwIctRYA/9ed61n6LaAYO8/CH1ofinOoDG5wBJF3E6jE3fEZVjSFl5TJ4g68u+d2X2MCM4qjRGOHPhghRn4sPcJcTJWssCeL+GqNxYKS7BhLgJOjEXFsS62BK8BPjI4gU9DPaoYhtGBPjfEJyvvSbYxNL/AOtwWJwTsiuCAMivPpx2CA8LNGscnEDwb6TRhhc+Y9QEKm5qvl914AsMiUZoWJ6KEAYnxg==
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
 2021 01:31:08 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 01:31:07 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 1/3] spdx.py: Add annotation to relationship
Date: Tue, 26 Oct 2021 18:30:48 -0700
Message-Id: <20211027013050.137364-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027013050.137364-1-saul.wold@windriver.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8aa15a9-0053-428b-faf3-08d998e9732e
X-MS-TrafficTypeDiagnostic: MWHPR11MB2030:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2030E8C0DA984A7E51A12F9BEE859@MWHPR11MB2030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uek1qxcaL6S2Gl+EkBrbF29huJCHjSHZIgVAkF9KwqDG5tgLdvEKkqMKZoAjbW0flCdXMhBw5IIcMPezXqk8Twm+8L0HQWt9EwVCVOwk7RPe8ElTl2woG/MNq3FBCRkG9s7vqu1x/JANcW47tuTEy8zED+XXdYZZK/0NlqVm3ubrjWiyNxgOcuAkE5ooz+bdAf4jOawGU5n4cMiQP/TrRUbaMK/ojAVJ+Ec44earWLJHbmLX1VWc1hq7hEn/Khhn4xFwzkZ1c99h2568ptZZ8/qg1Fg9O/Bs1VQg9kwy/BT3gziORy7cSKd+PUUMjY2D/V1ueh9vDCRCOfwKHHE4tlIrtuB4+pP10Xt2su4zsZZREJN7rOoMVfXFxZJyBB7ewPWj+AeJ/jW1iUjqHtzoH1RpYX7XdmwuDwP6jgsfn5JCS7EMHcz6UzQnGYHexX5rxcTl0i+JuPn7/0/MXv2DzUhV+6w6CUsaC+/MPbFF0CK3j2Wbx/A9j1eWS2RmyHZBV6dOWsFLi9OxSduSY7YHcn2erNVF5yXuaV+7SuU7jSj8qjbH1wY7/4pzRO0ovjV/EKmRmAGpXMmYpdkkadqZlFu1C+kaJKU+/vENixWuXJNE+zYD9PRvnNfAoNaSa3elcB3LieWY6jaTFAhf5TGtPGGunMTuq5do/RPxx5xkeWneS591GOd7qu4w6xqMo6wcsSAvTZR/qaHGwM8K01buKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(6666004)(6512007)(8936002)(66556008)(2906002)(44832011)(86362001)(2616005)(956004)(66946007)(107886003)(8676002)(38350700002)(38100700002)(508600001)(316002)(6486002)(26005)(1076003)(4326008)(66476007)(83380400001)(6506007)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3rtP+5UyANuvPhrXywjW2y77JHuNIKDwgmzhtHvqWngGQ1ElhTdemCTsmJGx?=
 =?us-ascii?Q?bhjJRfnON3W0IqcChUFuQVkiooCbwBfKxu8Qugm9jGBUSQXs7voknfOX3tT8?=
 =?us-ascii?Q?U5WiuUNQBBAk2T6vPgUbabG7idBGBMoSzZOoTnNo63IHpdQfUmv9idPmAEfF?=
 =?us-ascii?Q?HVxuLDKQ3oesQjto9ZeVTQfSJ66aaJoTbrdnVlVejd7mQtDioifFy3iwIFGd?=
 =?us-ascii?Q?GCQLWBZhADfIgUiPJqffBEVj4czxXe6GZx2qkwDAwgmdNSr3woRpgu7DsIfU?=
 =?us-ascii?Q?Fzms/5fdgUlJwk8f+UqeCUS88+ap0BTyHOKDcGzVlQ+eEt9J8Y5BzvSux0t0?=
 =?us-ascii?Q?yNhwPEgr0Z7rmBOz3EB/idEkLKPEBieuRP46kMQoHofcq7uRzKJN+l1J16on?=
 =?us-ascii?Q?GL+tcHVnUqQSRQ6j5j8IRxfZUSsBB04ZjpnKc8nvsQz3aKauVCgGp2vq08+O?=
 =?us-ascii?Q?gH+WOcyeO+97kLYPnJiBB0Tu6aCH8Y46xBwnKMndWWH/mubnBba5uHdRyFMv?=
 =?us-ascii?Q?j6y3hflABWPrLEYR01mSlSi4uoUoalxkWnBrctjyFyn+mhJFOSZ6CehMgocp?=
 =?us-ascii?Q?LHaNFrLamcAsoLXhIIQF0ew0u69waoWqrF073oB6IeCUuPUTP4SEDyrv4525?=
 =?us-ascii?Q?HfHqnUeX/gEz4awakmFaMMIDZtXlMswljdNICAdR/pBVNFyuKL1Qs6FIr0rm?=
 =?us-ascii?Q?7STnYKvsiZXNhfhXG0mWqaru3y4pAcD1bZTngib4JieFiom+WRZ8cRBxjJai?=
 =?us-ascii?Q?jksgXIu20F0OvW3e1DYl5fssXLR45g8PKCUgc7QxARuFTvfTPKS76Lk95uNX?=
 =?us-ascii?Q?h963FHYl9dniqpQqeEJ7hxmSMKZoMFrHkalM0qORI0msrJCamGSdRkqUbDiR?=
 =?us-ascii?Q?lkEupP4hBvp20oRYQnJa8hiOFYKoiHsmqEjlb6AlCTHArYj6vHUZ5x/p9Yx0?=
 =?us-ascii?Q?LfCdiKNGqTy+FVFHSO4Elu9F0s+aTiZPIhTwhZSIMGpySZL8jj1rrdzJrEoE?=
 =?us-ascii?Q?L2gTOyeCQ2DPb+Z6bIo0GfMRf9orJgkijof8bjsoNEQJ/q1O51AvPvsLEtHk?=
 =?us-ascii?Q?nx7FIjtRXTkJ1CGKlinYTtXgc6qS60k2KBWKVhGhuFGUKstUtICHEImlAEjr?=
 =?us-ascii?Q?ZP/H9Z/rkcglkG95y0Oap9Ylgg4AoxpIxOSRQfxMOpdj+dbqfsinMP/QX+zU?=
 =?us-ascii?Q?7FsOBBnYMQCIBWleI4yrChcGlv3MWCxHErgZNnAHay6zpUtLDShV0RTBpQVB?=
 =?us-ascii?Q?EgkwtdQaz0YZJrNC4JhSENTwWauCN4fxp0vQubXvRff6CJg4MSB3hx07s2ST?=
 =?us-ascii?Q?QZH/VJxKkRwjNIodBG6ClLX73i3fgSBWVsnQs0Bp4vUXARkhD3RYl+Q3qDNC?=
 =?us-ascii?Q?RLssyoyBvKFE/3wDy35W26TL6NHeOBEq8svZCsglmI44YpPnl8WOB+d2bJL/?=
 =?us-ascii?Q?HxD0ab/Z1gewWRrNVpoh1DdJHrSHo7/aDjBr8XGOAA08QuozVebpiA0MOu1+?=
 =?us-ascii?Q?0ktCICqL5NChWZmJsD2Mw0xzfhjRHj2BnN3iaphbuK+qRkqRmnX9fj/gU4Yq?=
 =?us-ascii?Q?NyFNXkafSObgtBnyffNwAnqtWPsT437k7h6ommkN6wvaeXKQNkOLlmtTSJMl?=
 =?us-ascii?Q?aoCIR/0WdIc8fycP0dTKNc4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8aa15a9-0053-428b-faf3-08d998e9732e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:31:07.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yWIvKJwK0HmmEjhgnLO8B9V+0ZtE1ProCGmtS3RIEzgLUTbQevWATDVxfv/zYkjtrWTFXeRP/V6iprb3tRW5FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2030
X-Proofpoint-GUID: 2tYIDXz5uZzqyB4FvnRW7OWr5oLsi5d1
X-Proofpoint-ORIG-GUID: BMvGX6HqQKJAPdcHfAkX-W34yZflfPj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=656 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157469

Having annotations on relationship can provide additional information
about the relationship such as how it was derived.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 lib/oe/spdx.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/oe/spdx.py b/lib/oe/spdx.py
index 4416194..9e7ced5 100644
--- a/lib/oe/spdx.py
+++ b/lib/oe/spdx.py
@@ -196,6 +196,7 @@ class SPDXRelationship(SPDXObject):
     relatedSpdxElement = _String()
     relationshipType = _String()
     comment = _String()
+    annotations = _ObjectList(SPDXAnnotation)
 
 
 class SPDXExternalReference(SPDXObject):
@@ -300,7 +301,7 @@ class SPDXDocument(SPDXObject):
     def from_json(cls, f):
         return cls(**json.load(f))
 
-    def add_relationship(self, _from, relationship, _to, *, comment=None):
+    def add_relationship(self, _from, relationship, _to, *, comment=None, annotation=None):
         if isinstance(_from, SPDXObject):
             from_spdxid = _from.SPDXID
         else:
@@ -320,6 +321,9 @@ class SPDXDocument(SPDXObject):
         if comment is not None:
             r.comment = comment
 
+        if annotation is not None:
+            r.annotations.append(annotation)
+
         self.relationships.append(r)
 
     def find_by_spdxid(self, spdxid):
-- 
2.31.1


