Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BEEC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 00:02:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.57522.1643760128116470915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 16:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lga4/3SM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9032c75327=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 211NvXqU012653
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Feb 2022 00:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=azNN4nQX+0+ygVNuDs9wqfL5jX/e/Vud0XT0nO2/fKw=;
 b=lga4/3SMIfIWLn92ipQcGlbRDiTdPhWCx5Q0xvSu1CdrSITD65LVnwk0rYHn695f4Lv3
 mkedAz/NcqfzRa9yVVqfW3P4iUC/y9iop/hRx5Cp8NP/3/d7FPL0I+5fUG0tSmtOWbJo
 cgnFwQPnL2InGtqKpwYM0jEn6szQ/dEPFo5K1Cpdk9AU22wmxXfzqVjFiPk9tmn8X4GF
 u4qUPPN+BEksoUQsvmWzzkUNsHJICawa9aiehXgJIQEGvCqFU9dSJ5o0ns07FBvjCsAe
 getb1QjJwBB9d9bPWfBiaQ9Okrj+thT/K/VD32FD8piPEGmjf6pMKSMnXm4FVwC+528t YQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxfmsh6rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:02:06 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 211Nx8xF015008
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Feb 2022 00:02:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxfmsh6rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Feb 2022 00:02:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiBJObwOPaaTf6gLi5eq+fYLTeUup3rdCb8qbaQnf/cLrDtEgdcF97MMe19M0a0gUYzAKF8GhxQ10EEeelRMOpLeiLCvKd4BJ0NN/A94Ro9o292Zw2poc5awr72foY1gaSbGMfbvRNhYp2+Pjkeo03h0TWspOmBTQtQfJ2vupYSG8csMqZwL5VhIHFhanp766tCg8WMc9wntUedaYrqMF8CnbypYEB6Lygo9rp7vJUEXiRvcsk77mNynbucDORiUFDqal8gWlvE6i+5MvNfkjfjJ75PyQs97vUeo4cnHhLOMWkXjy869DyQR19VIB4KNKljZT2HKC36S+gao7oUShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azNN4nQX+0+ygVNuDs9wqfL5jX/e/Vud0XT0nO2/fKw=;
 b=e9DGCTKe9SitM60P0aEgbg/AUq2gvKvR/67FoDK+/xPPL7/7BhKE9cCdxmiY9nvz0kyFuoYhL4W0wm+gq0IY3d5eYsBtckX+KP4LHjzjCajcOginvInLNiMs4Fu6SBujDwuIbyLt2Z3jupVPIqW1qOG8mQEeqlvQ2YEsArzRu/LNONP/OTZUb7uE3DaTWwwxKwNSBDwyyATGRe2mDYQ/Bc6/OXsHj8py4unShWoinCF3O8xtaMb3v16/7xU6Gm7RNHo4iruaYSHWo/mCX8PUQSu4vMy5IIkgkK528m2nNqXTY6vZagDN6lsvsi0sLNEub+lEd5Vz7861UFJ+Skl3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR1101MB2095.namprd11.prod.outlook.com (2603:10b6:301:5b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 00:02:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 00:02:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] create-spdx: Get SPDX-License-Identifier from source
Date: Tue,  1 Feb 2022 16:01:48 -0800
Message-Id: <20220202000148.1462-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::13) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7a5a3cf-b139-429a-4680-08d9e5df3d45
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2095:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2095BB9A57A93DCB253958CCEE279@MWHPR1101MB2095.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QxrToqZO08IOAusIZZ02cPZevm4+BnMIrjfM1GrItqh+Etm1FqAjyNetqzPCADEvb4tvP2zFnxOupLTM1/DbEiF42JdsUDpNBnYhCqYPi7DxZBLJLam6oKfsDsyqlqj6sJ+xgTbgODH5i1Hw/lnW6q0NVOtm6eg5htqO7UW097J3z/fRBWRiQXQXUhU7GJlVTMOtOaW03fFNFWDt6F3WhmDnecGaUEPmPJbC9m/bBfmmovadWd62aT+FB6Sb1IncQ8zLXy+xXQ3it8nT6c4bwDIR2/2Xse+hmoZNwwdwW4uBxvsWVoWc2YMph6KnSqxgCdOoVprLizEEmzU3as4l4Xe9pCPNE64BuI4dNHC49HkG3lwyj+1m0xTuzAH0F5d8GOXN+nVuUeYhUix1FYuX+WgHH+DOFSNU117UVFJ6yjMGvNBhHuDUpsnooOhYuP8jigWsr+ps47S1XLQr7hZbWug+XbFhtEudyszPeemyZBnTLsClliDEbsYBWmCcSw17QYn51Onm9HByMO4GTwPAzt5NYFoFnr5Ba/8kCCOhXPoi/efaOC38WQaH1SANWZxomPyBoYpH6jrZDBnOFpSpxwx8X6bDIJi34DPjO/vSuMRn/qAZQlhfrPsHJuAg00Te+XC0w5vR3IWQBDcC9cZWZGW37+84vHhsCSQLOsE44NXXXwI1xhLIz3AS1qh/IA2UIfRm90gdqJPiS6EYAAG2ZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(66946007)(8676002)(66476007)(316002)(66556008)(36756003)(8936002)(86362001)(4326008)(6486002)(6666004)(508600001)(6506007)(26005)(186003)(5660300002)(6512007)(44832011)(1076003)(2616005)(2906002)(107886003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q8Z9t+IlLFck4yxGsZvKdbkhVn/6OBg8hvGbKHCxxBZ5QjJBhy02kGMp0zvk?=
 =?us-ascii?Q?aUAg2QzjjUw/BQG0bnWp/kyo2VSTgV12G/8LzrvXhaC+PqH0IhgAlo1/hz7x?=
 =?us-ascii?Q?ZkqLIL1NnJzbEL83/kA8Xy3vMUKYBMX7Ylcw+J8uKn7fI/kLvPZe4vhb5mPb?=
 =?us-ascii?Q?Ba8yncJmKHjrkUfIPAarq1UvwjCkVJk4gbh/EJQTOPyokx8/e+Ssky/f1ST2?=
 =?us-ascii?Q?gzNVtKwyVJjU5MEz+BIr5eFR30rnrCApidhw8tRcZ8JB9rgwaXWD1P1mZ00Z?=
 =?us-ascii?Q?o9OF5J5o19pbO8I5b6AEdwH2SB5VMK3IaQdY9/Dz5BuxgvbVQB012maG2mTd?=
 =?us-ascii?Q?Hl2eXk8amXGwNj3BkIdFSENnsaV0P8A082SWXl7Y6QmC3FLLP+pDT+aljFqM?=
 =?us-ascii?Q?IC0c6TnGfktOpZxPbvyCcIPTC0nwnB5+vaL5TNmnTo1576dJNRQ8Ne2hFfxU?=
 =?us-ascii?Q?AfE1BNMERx2BP5zITLAsQviUVknzuSvoFg0kQbUQ0dhKDVY8XNoV8MiDByT6?=
 =?us-ascii?Q?v0gq44LKOaSgLpL462ZF3f7QcubdgitqCtZW/WzlbDR8gA7+i+Kyd2pPpqXP?=
 =?us-ascii?Q?oEoHsuvw6scRBqBKe0KU/AIklx9K3840H3e19nKUqGEKgZ3tLGxbnam8044e?=
 =?us-ascii?Q?abXkGigQtg3SFoglww0tKlF9yFjswE6NWPKIRXmFAW1/BwA7glwzvFoHs5s7?=
 =?us-ascii?Q?rgaxk0UZZ4mhUjGApGXObphtVzOHmes6pqBCaq/uw6y7HZF2KXg5zYLsgYl7?=
 =?us-ascii?Q?nWdTQL5fYunCWyrvBlfzTu8sQffWBpF4DgO57GZ+mjquyXVDnzrMvAtR1cq4?=
 =?us-ascii?Q?lBu9e1D2zIndn6cCwS2n+y2hkJrFmnTQlhqSdjb3yreRFIhvkbeNAArv9vwi?=
 =?us-ascii?Q?DdrjJv9BeapIYNaX3uihAxM30kOdpqtBrqockadMFMWns1GCSFEjFVbN7tMd?=
 =?us-ascii?Q?WmQVhww91FTcP7CJnPNPR0yf3wu1vyctsxs9oGfA5FmW2vUSji0AtpGIgcFe?=
 =?us-ascii?Q?yawUq66bulrDZx7HVdHi1w4ezvfCwe8GFNiI1sJ+ypm/GABShf5hEXbNjXZC?=
 =?us-ascii?Q?N3MlYJC9dgQR3dpIwZ3UCtQXMC/TY3ADVVq2AQgaNORK2XSVj3HfwGDZWdAe?=
 =?us-ascii?Q?7HCgGH59saZveJcdM0XhLjXQqhrAXqlDYgBiCJ1gN+uJ27GYzIwjqkS6teOy?=
 =?us-ascii?Q?kkN0YJeG4ynNkJjpgmskZ79oEYu5LgMtWBRRRhR0IG56wA08b12A97tPsGsD?=
 =?us-ascii?Q?sP8TvoYSxAIHMYRjOejdKaQtCVAX+jUDw5uIMRQfCzz2aJQbzJui3XlzTcB2?=
 =?us-ascii?Q?H20f8+axDgQGeZmxqvFnThZNeSdHDtkltJ35roE5zZEqRmnq2hzryz4cHMIP?=
 =?us-ascii?Q?a1oNk9kTiiLAF1Q7XZOi7qEsHqHn4WxEumNlcSdAgw1nVD40/JL/p0TFDoqA?=
 =?us-ascii?Q?pgGay5qOG3aDwtFu77rPAb3G6EuHhiDRsoW3hF1fG138Byxe4jd0Svox86sX?=
 =?us-ascii?Q?F7xFlxCRbgS2pBLoB4UNZ7/wQ507bpy49H5yZXQg0S/vyHTCfm2Hzr3Drdn4?=
 =?us-ascii?Q?bHPvBen4rUoZv82JH6+/lpziqzcFUoqF4NWMTgofS8ccDXhc607pYuFG20Ja?=
 =?us-ascii?Q?MpRub6chLNwGfzg5k2odzfw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7a5a3cf-b139-429a-4680-08d9e5df3d45
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 00:02:01.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R17i5AvrFkkgrC2J0NASi8imFEkrELbUSMKku0unxFr6goFg1N3iGnokspCKfnkNKtnG0h2gWookezzX2//I0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2095
X-Proofpoint-GUID: gzbIP7LSKguHOWIp_NHsMwGbBALzboGQ
X-Proofpoint-ORIG-GUID: RFK7spIVyS5W9HcVpGNuXr-_hB3-tyQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_10,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxlogscore=671
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 00:02:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161170

This patch will read the begining of source files and try to find
the SPDX-License-Identifier to populate the licenseInfoInFiles
field for each source file. This does not populate licenseConculed
at this time, nor rolls it up to package level.

We read as binary to since some source code seem to have some
binary characters, the license is then converted to ascii strings.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
Merge after Joshua's patch (spdx: Add set helper for list properties) merges

 meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 8b4203fdb5d..588489cc2b0 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
 
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
+def extract_licenses(filename):
+    import re
+    import oe.spdx
+
+    lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
+
+    try:
+        with open(filename, 'rb') as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses = [lic.decode('ascii') for lic in licenses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return None
+
 def get_doc_namespace(d, doc):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
@@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                         checksumValue=bb.utils.sha256_file(filepath),
                     ))
 
+                if "SOURCE" in spdx_file.fileTypes:
+                    extracted_lics = extract_licenses(filepath)
+                    if extracted_lics:
+                        spdx_file.licenseInfoInFiles = extracted_lics
+
                 doc.files.append(spdx_file)
                 doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
                 spdx_pkg.hasFiles.append(spdx_file.SPDXID)
-- 
2.31.1


