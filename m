Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BDEC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 17:22:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13378.1676395336332387578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 09:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iLNhl7zy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1409ec1bab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ECMRxQ015928
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:22:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ZfLpEpTkdDmuWdwH1e0f6+gmOEkoU/1lKfOZJF5+z+Y=;
 b=iLNhl7zyqlwiQFbOxBIT89yQQ74G+JE/ctwk6F93U70vW2Qjb6fogQYf5bR3FOaDKv2d
 Xza+1k71k3RtyQkBGHIghVK6JY1FEdNFeWum0ToIlZunQUn+iyDmrDNULGRH03LbFEjK
 jbKi4/3fSs9OSUblSRVst9MpaT01nXPj8i2E4Lkibc2wSC93M7dWbBihwn1qjVvrDhKq
 qXLq1NDqkrDLrgndUP9t28eeXBCI/L/HNwYG2eeIEbZrLhQGoaqyJLxvTo7JLsv4X17I
 neqlWmdAw0kq4Ri++3G4MJPuy1m0tnycF40WeWHwtJOhs0iRB3a2ZEeDf4MG60gH4L92 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrtk46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:22:15 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EHE1Ne001923
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:22:15 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrtk44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 09:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BckcHQ1GkDhLMpV83JFl1ijpOpR+B3Df/PdQn5AnX9JAj9BaOpCedKq+lwL6io/E4ikyH8a/+zwGh56YSvZlqK8V2f9VnwNoQcr4PDS/e9m05/QRJUJ/GPw/r2ekkthCXmdcZnU553vmKcme+2Z+sXcHTIU6Sl5lG3Jr8hDWDEQjwo2bwDH+HMj9TfSIPDfjTGwNhpxbZyh8zR7UKERLHr3VFzMs+NrWSC4T+fU5NVj4oUN+3R+iJKevDNBi1x23GXoNHtOCqUdxf/RrdXv+CY58QmgDyZgiq+ojknwRiLJIJiF6GZ3XbupnDaqTzln197nGiQm2W54UqFRJQdIyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfLpEpTkdDmuWdwH1e0f6+gmOEkoU/1lKfOZJF5+z+Y=;
 b=WwBC27BmicnEo2LgG9H25Z0vtmZc/fJXnhouWFh4qz8RCHRw8w+7yHR0pPm4Nfu/PX6UKdqoIACG22vJ6mQlEctuWcZCpjMrZVRHYVgYuETspZrmqEMsylGWuYuJxUfu5qhCJ/jDV2JQ8B8hJWgMhCCuzC6s9ttiG4NXPwMjKXpxFf+RjJrvjVfyEdaLqjXD5eKtHUsuT2oOuq44lwJUCMW4FQoByL5NmVR7LXVszHIpt9rnm+gb6p2n6uBN1vSNYkw1qBSMLqMuTF7fY0XGXS1lERXbBwN2uKyLxoR6h9US0BWoYfZpvN9mO0F8DjS7luDJfNo2/59fLnQS8DM9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 14 Feb
 2023 17:22:11 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%3]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 17:22:11 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH v2 1/1] create-spdx-2.2: Add support for custom Annotations
Date: Tue, 14 Feb 2023 09:21:56 -0800
Message-Id: <20230214172156.3799436-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214172156.3799436-1-saul.wold@windriver.com>
References: <20230214172156.3799436-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 167eea1a-35c5-4876-dd35-08db0eb001a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aCma6U5F57cJj3//CnQMNdz0yJ5iFv/rhjWIztkzGRn8ahhsgnwrA/ZJdsVp4m4G+WHBa/qKdw1HV5mmiGFjDovVyM/eSODR/brbDZ2FaGnnwfO7vTRzuZZndmHHIbNnlIgytWGrRVCMROr7bVqlV5ecXLqW7Pv0IMHXb08wc501nAijRaSCV6udoHgZRmYIuMFJD/fJTQWEmRK49KpdcQw5vofM0JBPya55Nh2AKKTw4QlXrw69lHgZlIm8RTXNiIBu956PQyCE/9oCV6poJ4sBelYMTR8RrAm1eDDfd607BvwY8+ojnt+gDAclajemT5EB7oaKDNIhk8GDt3Dh1DhqBuI1doE+hpdK4sCtLSUmXyxvSzVlgCSp6698kaXXRp0awuN9KSayZheRW7H1czmGkJKIumt7HCZaeMp557OCuW0w95wHqUaFymP0lCPTXUZrii/4IfhYZA/yGxLfd1cwJzU77sTzfXk4vH2+bByQGCLjPWnZ5Cix8IZwbSDRiHqUGI61bhSndK7fK0h/S1dxN+xhC9b8I1GAJdI5YTh6LBM+AHBCj8QX9XCgDPeAKuiLL2hFeqBgByKBEpDWIKOQ8xiINP4yABZN/MNe70w9J4pEm4DTsdg0FXmKaDieOj1OzuHvUB/KPT34Vh0yFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199018)(86362001)(6506007)(2616005)(478600001)(1076003)(6666004)(6486002)(52116002)(36756003)(83380400001)(186003)(41300700001)(8936002)(316002)(66946007)(66556008)(66476007)(8676002)(5660300002)(2906002)(6512007)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?78gmfe0AliPXdNWA6IVwaA1NV6PNA/Sb33NcSU10MBHcPvI7OGDST1IuCmb0?=
 =?us-ascii?Q?tDM4oEWFeDicN0WNwcS/yFstn1hL2r46KtEVDwQPazTzDsW5XlNVqGTRO6mG?=
 =?us-ascii?Q?V356Zf8Ac46Q9Eq3sxZIywu7/H25doJs/UiplJa4j7VcB9m/ZS00Vs/LkZHc?=
 =?us-ascii?Q?iQvgbBsHJodRN3YfVfIXlP4+pdFYVX3PEFsrrcDEzoviVb1gmgYB5X09dPjj?=
 =?us-ascii?Q?/40p3+0qjft6E2DTySwUt5csuS3kGdohIJLwfeoWh0wXgwxR6loGKL+DX6JX?=
 =?us-ascii?Q?kk+c6ggT9XFnRMZujvZM29ClP4VrXeamF2/0A2kVa9+j6Q44A/1QyhO7yi1g?=
 =?us-ascii?Q?YPscvUoMe2VnFYJsI8zaOL9r4PG431op6Gyk1OT67g7DxgL8QtRfG6wSEO9n?=
 =?us-ascii?Q?tCDZKZ1v4yh7LNBN0ulLU0K6YWZF+64q2Iv6wLTyMSkl4/iVc/dizMLLRWWF?=
 =?us-ascii?Q?Sy9CSdQinuqXwO78SPUijXAn/NC3ctIaqTJWFeJC0BZM1gkrXt4pWhCPcY9p?=
 =?us-ascii?Q?WdmDuLcSeirxkEadBOtxhIVCRbCWLAfpcQTFKks/a/XLiMBM3ngM+r/5OpbQ?=
 =?us-ascii?Q?0zD7MoDqBnVy0Jx6rZYmOtKPoYBGz4DdVZLO9dT4LeiZUT15y9E0ytC3onKj?=
 =?us-ascii?Q?fzKkOOvz9hgHOh6OGMbS5ColovuZY9HkRy6BiMr8LSqbp2KMv0UYWKIgrCRg?=
 =?us-ascii?Q?LkVVzAxeOb8MxlsP8ExqU0mIaE6N7qtYejOzpPDgMjrJLy5m/xKloozPvGl4?=
 =?us-ascii?Q?/OPChj7avrGeUuKOXrQmf8c4HdCTS5kFBxKFKLhUB7jjm+ssneUq+ErtBlQF?=
 =?us-ascii?Q?SQaUs5+c869ZNvVxYHdMVJ3ZKtRGxFuGnr2OG2Iq7N+jWjWk+Af/qJ7LWa7G?=
 =?us-ascii?Q?wKSHx3gXzl0U/NyZiD0lSmvqOE7LEaUlcb0gLoxU/3hVNtvB9NXEUNABtlqF?=
 =?us-ascii?Q?yDzjy0MDIrnlUK554GzEPVAJqFbdva6g0p2mgyfue7m4zOWoPZWGeO40ULEb?=
 =?us-ascii?Q?lGZEB2TnOWFG2xWm+izroAt5yC44wOHnoQAZsPGUyEsUON8TrWCMYA+pqB2q?=
 =?us-ascii?Q?TY3ZmJusxc7OCt3n9PLLHyu+9tdTzhHoLvrrD+ikyUSPEYaYy8oFQ7nc96rF?=
 =?us-ascii?Q?3uuzDKiSZ8J/3Hjgk7lwaoWjil+JqcsDulUUVgCFcCVsUs66aFCXaI7G6SXu?=
 =?us-ascii?Q?8Gc5vdsfAkeqoiDGLxzFsxwo9kZtkt6YFonibX37hTWcaQfHV6bxk0fV5ol5?=
 =?us-ascii?Q?RVxjKXbnB3ahV6e8ABEKtUjoPtipG30ke9jfTHkXSXlhFb434FEge+3SsBBc?=
 =?us-ascii?Q?aMCdvuU1879leV9TbPXXUomvzkTq8FxRgkGYyo59HTqo6czXYPan6eMnz6jv?=
 =?us-ascii?Q?+Y39OMg1Ehf4eLCY7VBIOtVkbLiSiq1fVcEVN5bRzHnlcv+PtETvlINDff7D?=
 =?us-ascii?Q?e7PewwFsdotNCPucSWQ9p6pjL9IPoM6VZaDKB5vpR01cbt8jiM8MPXbJ+qbJ?=
 =?us-ascii?Q?7x9g3pKa6ng2BxEyk81DObEbO/hR5EIvXVoT5LL4Orj9f2ujQz9O5r6p1YoY?=
 =?us-ascii?Q?ILwwV6KOKGfV9xX2bV0bA2TF1WbRK9L5pdWN2PjDk6Rf7VayJHabHaiF53yI?=
 =?us-ascii?Q?tMVt2lZRhqIoBNfCGIbHnAqV/2NRCOrroZx3FwFXq39jrTzjRQUEfc8C774i?=
 =?us-ascii?Q?yVilGQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167eea1a-35c5-4876-dd35-08db0eb001a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 17:22:10.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ja7WqggEzW9MDkf8zmXXd8XBCGjZdMw3pNv04qvEW6lWBN1+ONSKzS5+mmVFVb4VrvNTnZdu+HE+iwHtfDvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-Proofpoint-ORIG-GUID: KYiOcuTcDLGBV7ntr8NlMV3gGtVW1LJ7
X-Proofpoint-GUID: 1bHMbLUX5nNdNta9PVKKka8JG-Rj_iuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_12,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177167

This change adds a new variable to track which recipe variables
are added as SPDX Annotations.

Usage: add SPDX_CUSTOM_ANNOTATION_VARS = <some recipe variable>

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
 meta/classes/create-spdx-2.2.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index f0513af083b..bdc2e2c91e7 100644
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
@@ -479,6 +480,11 @@ python do_create_spdx() {
     if description:
         recipe.description = description
 
+    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
+        for var in d.getVar("SPDX_CUSTOM_ANNOTATION_VARS").split():
+            if d.getVar(var):
+                recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
+
     # Some CVEs may be patched during the build process without incrementing the version number,
     # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
     # save the CVEs fixed by patches to source information field in the SPDX.
-- 
2.25.1


