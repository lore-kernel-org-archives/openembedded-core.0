Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C071C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4593.1635291383288944984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 16:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EzYS61H7;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59335ce822=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QNVq6I015160
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=8JfLXqpw/Ft710lFW6eZluInpbipf7vWVolwgirtie4=;
 b=EzYS61H7GveGatbweRd3Sl9oOE813MzluS+EBa3Y6rqTgMQbbeTgzI5ohjo/3OUAZeM2
 GAWZ3NLa0AsNUFYlzUTvVof/dbI1IgzX7JTJbjaUCy2e/t/G94Rr21SL1O1AJ7Bfsidc
 CwOutvX72Zv7S9KUAXHE0yTTglGzYVTHyYUUPRnT1B8iBgPsOa97VodFROov/ik45BVm
 AdVWxfjIFWfVprybARzcKpwrWf77DafR9Y1k73faAUFqSfH1qNCURVj5bd8UE9ErPtRs
 KJiSHzPIkBO5s3/fqYtm6UkUcjnQgOm4+HIJhX/CJ6J6Y5sUVU6JuZRjLvaNdsphBEkK +w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs181-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:36:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QNaLQp023500
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs17w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 23:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fduZ6kxYCTQKq7aNwY8LN5O+5GD9V8G52Jz213AOGeykPeE9BQ45F/CGOr9ATBDigumrY6uGoq0PyH78jgmKAVtA+4YARP2HMZISZNw/rz8VyjSDoxrwHZyjrnCpiuRRc8LkeCe4LpHtO/Uf3b+n36ZMHqKQcq6W0Roh2BgXUatrsNKWTg5KNZRy8nv6ReVmxESigXEG0QnolV8Zq5W8++vf0mdtReBjBU849Gsxe99bqMFyp5SOAQHg3BSvmfDimBDGW7X4WMoO/lHK8DqIEGpWBOK8PNg/XbyF/aSB3Q7dpzCLhdqPH64hJQjakYY+q3i7J6FEHQTHC6ENxCrz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JfLXqpw/Ft710lFW6eZluInpbipf7vWVolwgirtie4=;
 b=B4T3qB1vyHy7YieKCoyPpA6B/+OS2MxP8+QiHSFhlyFoqMgvocBVeurwJAr7ajHpPaiOXZItfm+BCcqs7VwzS7/avRTo0bmYkcBl+3KIWhymlL8NOV2d8VDyGXvDpsMwDUUGS/su/upO0Ved5QLYX6twQ+uLKAhuqeer5GfU4U8E3FQIfQab55olR7RSdBXM47sJ10P6hhJO/ETiOFFqb3PWwPCB2dbkb4UPi28eCy3lryGBskRYKCqF7/PhltKiY/HlMz5fgC6YYbz73aVXxzrXugWS9Hm3kXgN74he9T1Ki2W7i4iGTqGq1w8ZSy9rsqMDWXV8jcpANEHznAVBjg==
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
 23:36:19 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/3] spdx.py: Add annotation to relationship
Date: Tue, 26 Oct 2021 16:36:00 -0700
Message-Id: <20211026233602.71762-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026233602.71762-1-saul.wold@windriver.com>
References: <20211026233602.71762-1-saul.wold@windriver.com>
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
 Transport; Tue, 26 Oct 2021 23:36:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af7ddd7-efb8-4954-c0fe-08d998d9694d
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5881AA9786A9E409F7F1DD10EE849@MW5PR11MB5881.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jHeiOO5m7MHfc8HhSu4TNe4+GJLeh1GrElxpoxBPKyzBlIIsFbOk4/cFZ0b1Ph2/izTQFhaiGLVn4P+4NuXB38H3QedYdWebWTUF6QJvBYVHDrS19YMe+83CM750pcbSwZiVytbZ6LBTQBK2LGz4oKC7uWdDVICt/j3htvv5zwwih1VlElD+ePr5eJ3Y44uVJF529zj1z5EJ/2E37YVRvT09bI0MGhaqG6R/o6CwEo8fiy1yMI3AuAzI6/luzuRzs7a55Dk4AO4nQ3bev0xbqWQUjXsGJreiV6zP8VbfiJGtPQPx2PyS3xPSwliovaOJgjqf4DHGZDKS54FR56htEEgbPD7Ts0BmPldCsXTp/pRqEF3NHbPzVBTFFJJS4mU9+k98MKSU5Sv8tMV5q/LVfJ15bhWlJ3lJsc+2mbS6xiYYRYYNaePOBhTDCQQhSUHu/Zn9xrzirY9BYk3kklF+BZPLKoFTOaE4Xp356jMGQIDJA163tscJTCn19pMgMUN746/xipEdp1JUI9HZ+F21g+iJHYTYSm+ax1pBRegxm6Wp8Y0+NlmI3J074Dpho9uWSA2sWQwOUQQKZjY9WOOcJrO/DzDbRwJateJz75BvbXdN3zrTbwyDuOsA1FsMf0iAY2N/SD0LKd1Og+DNgBJqqcGCnxBpomNTA7fmG0UFcqR46DApobr4Gqtb5bYzhkXZKzNwdVQCmqbRqmVBDWa0mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(107886003)(26005)(38350700002)(8676002)(66946007)(66556008)(38100700002)(44832011)(6486002)(1076003)(66476007)(6666004)(6506007)(36756003)(2616005)(508600001)(186003)(956004)(4326008)(316002)(5660300002)(52116002)(6512007)(8936002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SIJczuTW8SfOxWVguZLOqL6xPVYGLeCBrXPUlG5j2hHwmuzE0af5Gf1PqT6d?=
 =?us-ascii?Q?OjmvOTIHilmT7SCQhgFbWzbSpBt849NWKAW05bmXbWcOobxtCalPqq3PC9Po?=
 =?us-ascii?Q?/lUOe3yS1X/xNHxgBGyJ4aOxZED5NftCBCf1XPND8pepnC9l45iQLeFyYBDV?=
 =?us-ascii?Q?4FsIc1KxTzvFc8EwGHt5vZ1FV4u8bUVkmTirjfyhD5uxwcbQyDjMvtvAwiTI?=
 =?us-ascii?Q?G+V4yGJGct9VX4+EBnLfBp23/XmpFYIw2tZtJcNhUR3ghNBaw+VNyB72D7wV?=
 =?us-ascii?Q?QMTxkv6aEgLbhNCDtJ1pT204no8jskTSNo8f8uPiPzFOKWyqEBnL5Zo1/xrH?=
 =?us-ascii?Q?Wo/KHbzrDnZnJ0ILt28MtsTI1SRXT9V+g8X48BNM4km8GobT1+H8eiKuYjZx?=
 =?us-ascii?Q?QdyNDlfXoyDx6JymYysmqentniTj8P52q6YJWjeOeoHTbkprUNBWqhY5rTwo?=
 =?us-ascii?Q?+Z6oFYq2tvRpwI+svB9sYi0PqcVpwoFcqCKB0EBwedTRcjNEjC9070GUAvry?=
 =?us-ascii?Q?JWuKqzzqzBd/Kjbwn52dwshgYfn4N59PFBOtCTg7KXOLAeT0hv5Nj8IJoZK3?=
 =?us-ascii?Q?6LckbTHln8lw5ME2lxLqICAbZoUdX0bIeTS7F5zAlr2MkxbiEQvtj5W6sUKs?=
 =?us-ascii?Q?Z5fAtLvFacJpmgXP2UQer1XUZ2JcfzpBOJyXmhX+g4ZbQaMrTsF/gIOHMaHc?=
 =?us-ascii?Q?VvzyijI7jRok/PT47fKZ0f9dsKw5Jp3xGQf6FLXfvAlV4E7QMHRONSK8Se4N?=
 =?us-ascii?Q?PlFxxneAO8tZV2cj9GTt2ofoqCGazVZF0FgniGkAjxd4Vb17cgzER5JUhFa+?=
 =?us-ascii?Q?xFOzyoe4tuK4pxVaqX2KcFi3n0g+nPxXUMJvkNP2lEN8YjSP043Q6oEJlWAi?=
 =?us-ascii?Q?vNC19HD709nbamsKhDxHeX1s9kCI0J/FDrhMb0WkmdhnslP7w8lmnyNTyOOI?=
 =?us-ascii?Q?H3yhC3YOAPAwWN+Sidcj7evQ3qDf9kezGtFYnqU3WmlXj05nMcVGcfu8iVes?=
 =?us-ascii?Q?qBO3aHj/jRRbyXvcNb/2pPDUD3wXBjDw/d1vG29qs0EaKzwu1fsLHBAvX1A6?=
 =?us-ascii?Q?K7IUEkajWzGPsIpc5x7R8ap5ZwzZDWJGKVI6l14Vve3Da3LyQmWJ83ITUTjZ?=
 =?us-ascii?Q?iq1ctQ3H8dLsXEFMkrDwxAh9dTNAn1sqnLES6WMGmoxM+++Uq7sA+r2ttyQz?=
 =?us-ascii?Q?guXJ0SuV+v2PpimlQPr3W/RMpNOfDRGVoxlKcinzoRFOGSy7O2M11XvahS5t?=
 =?us-ascii?Q?jWuTUe0RCFjDagCKdq/TO0cvftmP1w3ZH10xoH2wpq3Jz2eyUbdn3mCWYBmw?=
 =?us-ascii?Q?EIAaUxJLm9Z+55vo93LAqLxuNGSpJhsb2KyxIr1pbSBfzLdx9Y9HzGsZOZte?=
 =?us-ascii?Q?KkmqZtcHEcLtpf6tiGpNla9meex4kLwGxHbBf/ORt/d7u4hqoTI5FgOgnyxz?=
 =?us-ascii?Q?O60dtY+RsuUtt+XQxWFrBwM66nT42Fiy7EtNKFvVN+JeWu1s+rRPg2MyRCe/?=
 =?us-ascii?Q?3P+G2765eeV/8PQzLWWDDXpVjaii0QgVRTleI9pCU2xZQT9QOaZ2cSuTk2eE?=
 =?us-ascii?Q?KPqF05IG9bLapQALGriNpO3Fw2XwCQv04gT9RiP/4hWNeiTYhOFzrtOXOo6d?=
 =?us-ascii?Q?ssz4MFOyP0vWnkiKbPVcEmE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2af7ddd7-efb8-4954-c0fe-08d998d9694d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 23:36:19.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NTa/7yhP6UtS9z8jBbs6zuQXuyIwmTqS5ai3HKmCXwAfYotly9OOkD4topOefg85wl5+/lLDm588qMgSLze2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-Proofpoint-GUID: CBCDYvR-tcOhHwRnrO9QaeLmcyV38XnD
X-Proofpoint-ORIG-GUID: vZ3nVM8J_LFyRQLEvQMxIlRB5uoEjlex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=656 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110260129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157457

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


