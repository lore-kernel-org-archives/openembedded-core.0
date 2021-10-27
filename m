Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF92C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5923.1635298275843750150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CZaP2InI;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5934f1ba75=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1MIod019377
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=VTCgvhccDA0HzlXHo0YJ4sj4pJNVVHfxSVc4c+1H5ns=;
 b=CZaP2InIJt6o88V2A8hX4UvCRvml8ewn863mDng5a4x+CKS54TU6emNt3xAQvNg2fSxC
 xoMRsyODcKJSaydt9/qMa6whQvgQO6awtouCiRv3Vf0NQXgyslWk7CXMhx3583Ld6V+E
 Xy+htDupJVgo8OVAnceBVhiCyO8+s76ZGyUnuxSuhIdTO9rop5JlAjzJ1oTEqoM7eE8L
 WCfyS0zXnU8B4ZcP6c8tuxpsYtptvnrAkJD2GqYo07Ca//bvmQaonP1jyad/XxGB0IEp
 bWIEdIlctMU3mRLr0GHgJI0EsXueh1zTsxH95+7M582ubdGPUN8guDC1SbQutZYTP3xJ 7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch370-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:31:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R1VE6j008157
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch36w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 01:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHQLdjMbiqEPEk8NeoTm5kLx1gH3HOMk0o1ZAArJpdTxQzhVw4eeEibWCXThMj/mjHUaTJKOFt0uaJOtl8pRjF5kfcK/s/xj6Bi8T6syiw/AC/xzp8MvQKRpGPrFYTdZG0PjZVZbfaLt9QCkAupBaRtnqvXFozSBxm7DJafPzfSCTZUdPwjweZ5ioF/oE7vC1IEJ5wYHa8OguPBTAUDLphtC/75vdt4mY9tVLYqWcC1mq7NwMsBWkXKsuBVlPhDH6XyNQBuKrr76M1wp8h9EECCSbtCXEhyoRLLog6tlkDxTnl7UFU3Nb/bePZsBSQ2gy6ZoUGBusrhXAHAKYPFLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTCgvhccDA0HzlXHo0YJ4sj4pJNVVHfxSVc4c+1H5ns=;
 b=fc0PbyyWzPLUMwoSXZG92PV5MOSamIpX8jYJYW6CZh+P8KLDGsy3rGPenwV/K1NOp2LRVB2UguN84gXidpX0loQqU5wOoQ4X26HTncYiMmTFpBNcKmqKLzQvEZA8RZC9zfzUpqrzHSoIP8tVRHNL0wBBt+DvJ8R3CjQW6bGXncp+lO24+KCDcArtDLjG6TdVFQuQoz21mnJ4j2ES175oc6myY8z+9bR9+WnPLMD3+CC12Urapi7S6ueVmCiitAm61qxphQRzP2NiAj4d5tuhpgOlbHxJNMUdXMey1BelYzZqc7WJjWlSHZFvf7rMX1udy3QyNU/A4fsTSl5VIi0Cug==
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
 01:31:08 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 2/3] create-spdx: add create_annotation function
Date: Tue, 26 Oct 2021 18:30:49 -0700
Message-Id: <20211027013050.137364-3-saul.wold@windriver.com>
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
 Transport; Wed, 27 Oct 2021 01:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99789c6e-c4a9-4778-acd3-08d998e9737d
X-MS-TrafficTypeDiagnostic: MWHPR11MB2030:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB203038C7F7EDA326B70740FCEE859@MWHPR11MB2030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qBrmp/D7WJZNLIyYQyR9m4SUtX8INMpOVdNrwHM+QpNZ6zSw1JxZfpJn5pxeNZL7jEmfWN8bGan9w5SHEOBJO4JnU8klTXGd3mS6GX5A1WWIXZ/YLIAnDG1YFV2Alqld/QjcnqMyAK8akobnUo/OHJmPq7ztC2JsnouHH9hCQvAz/HOZXJRGxv+6Fdl0vXPP4kH41HUeOABGIXMhaqE1P+QWh7MijpSz8LXx1dWFQn8xZhOri0jvmE4Ov4Sm8g8ZvMfqVoBnvHI54YBEclizMTweUCIC2Annjhy5h21kYu6YYQidLU3M2mWUShat28MlJQN2cHPEwH79yRU/rs3kXk5pF0yvwLlIcD27EUsXw6tnOYmN6rindGHACflVQYCXHubcZmSGV6sLUO/fYUta8qDMXrQVrnmKZviKVhG1eaL2kqJVO+QjGTuAj5E26aVFWil30SpNmbxFqBn7uAKcKgqgB293jTSK4V60rVFfhvOWDElELrsYP+BtqV3fjRFdtfhNkC351YeKqd6SZ/vFHn2nJ61NDCrURpmUrHs184bKaOOqSxNVT6Buga5gJpXjDNPQdMNZ0dGcHFf1qQVMHgNNYBxUhIAlcpArJuZMBfnnYhC1u5ZHF9UzDVVqXnrUS7Hz8rz/mMcNRndnJJFc/xmdjdqKChK3caPxsVa+OhxsY/S7tPaBthmBKOxrhoxgXDNSkCthbL6yomkrrFEkmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(6666004)(6512007)(8936002)(66556008)(2906002)(44832011)(86362001)(2616005)(956004)(66946007)(107886003)(8676002)(38350700002)(38100700002)(508600001)(316002)(6486002)(26005)(1076003)(4326008)(66476007)(83380400001)(6506007)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4lD1qVVzFWjJ6L6nZimkAJ/TwfWLjxZEm1LVZjTy8q1fl5W4meFz+ROzxk2y?=
 =?us-ascii?Q?X6lFUW7Zmtgo+ACnXF+nUV6OcRlYYvHF8/kNI1Gsc69f0J24y9cnVAeMb/0T?=
 =?us-ascii?Q?cKYIHv0cp3CV9+/Udv0uUIQUbRU1IgKl50VLx5T8IdETdy48EosLBg9i+okI?=
 =?us-ascii?Q?YQ2DVakQRpitxFn5LSpO6p2DBH4T5XWzq1dxq5kKnWwYwEfPicaiiAW6NsDu?=
 =?us-ascii?Q?ZZJQ/Wbt9vgK84UMWpOzuIm3Ri003pvqt9BklW2NNodtnNbyusKAXZQATx2Z?=
 =?us-ascii?Q?ktfKK/1Pau/PkyfaiOtxAyMj3JPn2tNS/6oWjODlpcFKdKWMTZdjSp8LBtDK?=
 =?us-ascii?Q?ciV8RBQeY7ZDZ9pLkbqktdNtqp5AVShfxnDeCUTheNLXXE8ZYKy1PlX+0Dw5?=
 =?us-ascii?Q?HLFFlyUDjXWF2iX/GA5OhpS2IT2oeCYkqIU3tdE+s0tr8w+v/mQmNXpDKiu9?=
 =?us-ascii?Q?txP6C7lXCLFI5oK1Z0zeXShsCO/iAE+JB2xHT5aFlEb/i8Qhs6mlDIzfgrg9?=
 =?us-ascii?Q?aYPnNW4Bzp2YjVRuhFA88ltMgID6S1KA88DAPTaPAioaMUhK0vheyLsuXPe2?=
 =?us-ascii?Q?CZENk4+/gn4xGyBagGhJRBhdrNIe2Jve4dfuokHqkhHM8+M/K7zHw6v+Gw0P?=
 =?us-ascii?Q?5dO7zo3W2FQhUUlBNd4xhdhXfUR+HYpTJUt6qKSLtWBJmsIZV3CxBTTChIiw?=
 =?us-ascii?Q?DPkupWf6ZbWvjVYsXe1r1TxA14Z/Q8KYCy9CNGY3mry5jfqA2MPhYr8vkkey?=
 =?us-ascii?Q?gjU9dzcG8o7+WLT3fbrgJudzF/gGdiMC5AzE81j2KkCdqUjuhOyxFon3JNs2?=
 =?us-ascii?Q?htabZvTVD99VuDKz+Ff/LrGdWAohgQ1UNtWdcNu1nneFs8m9I79b+57c+Ylh?=
 =?us-ascii?Q?tgZo2lc46HYw7S0LmCCowsTK0R4afcuU8PYVQ2Y0YwCu6vFhWx8YCVyCzux3?=
 =?us-ascii?Q?za5SUFTe27kmlcjB1XpQs7RYHZ82qZ0GfnbJWD3fK5V0O9alL3UMEY448m2y?=
 =?us-ascii?Q?r1DIRUCLAOcKkxWeKlfboMcRTHLe6jrDZilON1vx/xTF6MFpSxlJElyQNfN1?=
 =?us-ascii?Q?hVUK/+Gt7w7Z5+UJ6P2JOWSZDMirsOwj4Qu6hEyzu2QiS4xJkX3Y1uSvOxNA?=
 =?us-ascii?Q?jZ7OZxTFVqnhvKyWRq7umr/8OXsrcDh6IHzt92e80LtE3v32qE8s2sQBs6H5?=
 =?us-ascii?Q?iCpkzYkQN4hYYw3QgZ17dSU+4oxNWTbNJWZwnJQ0ZWaXx6sUh8Sdex9a1XUW?=
 =?us-ascii?Q?zQrzd3a+fvYzcx50uT/ABwYiPyUtp2kYCFEaRWem3JDk5/abemrtY/zTeu9c?=
 =?us-ascii?Q?CYi7HZPMIfEigo4SvRL+DfH6ty7sE6NTC9srR04f5koevhaJlRSsp61pmvDo?=
 =?us-ascii?Q?CWVKSi082fejYDbNq38C/bJh9cok/v+NEkv/lnzQvoHcwAkmqJctcnSapNWo?=
 =?us-ascii?Q?hBvzxeFm23inEDl/zkxXPuWNtb+6p9mG5Gfh8fKqZcCfubwSr9kFlAFpK0iD?=
 =?us-ascii?Q?1X5lQ25ZfbYWNx85j9SwqVcw9nlBKLaiFwo0RC0MhMisB+OTaAWsKU66l652?=
 =?us-ascii?Q?bRO7LC8nuKrXJSKFMliFhfQ2/vn+mkiY5mlFSSvGNdfhM737kMq1A8ZJgsa0?=
 =?us-ascii?Q?ij9OQH/qcgkN4zPBs46CPxo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99789c6e-c4a9-4778-acd3-08d998e9737d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:31:08.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u7kvm6K1wQFdxL7TvoR/tDUnbPZe/GUJqMszep0LZYN/kRs5Ivzrwg7HzSUgHvnrJSnqTVXgLjZVLyLP5XSxwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2030
X-Proofpoint-GUID: 4bXYNVPkfDefrPcCacSKvi4wXIQlmYp2
X-Proofpoint-ORIG-GUID: Qm5mbAIZ-n71fxaqGq_UCjgb3frusjuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=847 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157468

This allows code reuse and future usage with relationship annotations

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 classes/create-spdx.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
index dd341db..72a9b55 100644
--- a/classes/create-spdx.bbclass
+++ b/classes/create-spdx.bbclass
@@ -35,6 +35,17 @@ def get_doc_namespace(d, doc):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
 
+def create_annotation(d, comment):
+    from datetime import datetime, timezone
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+    annotation = oe.spdx.SPDXAnnotation()
+    annotation.annotationDate = creation_time
+    annotation.annotationType = "OTHER"
+    annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
+    annotation.comment = comment
+    return annotation
+
 def recipe_spdx_is_native(d, recipe):
     return any(a.annotationType == "OTHER" and
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
@@ -408,12 +419,7 @@ python do_create_spdx() {
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
     if bb.data.inherits_class("native", d):
-        annotation = oe.spdx.SPDXAnnotation()
-        annotation.annotationDate = creation_time
-        annotation.annotationType = "OTHER"
-        annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
-        annotation.comment = "isNative"
-        recipe.annotations.append(annotation)
+        recipe.annotations.append(create_annotation(d, "isNative"))
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
-- 
2.31.1


