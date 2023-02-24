Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEF9C7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 19:25:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27828.1677266737991330189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 11:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SdAzCRrC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141928d97d=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OIZhEA005585
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZzN686vz8aP1lhOH7zhpcpisJVSmaaySSAjlPyyZHX0=;
 b=SdAzCRrC1rDwKkK/f4vgoSFHd4igscBAX4lSfgqO5BOhIQreGDcSXH6Z7H6iPCQnQp8N
 5hUmMogvSUAyH5Jsuh7WwUV3HYRcXfv02V53Prp0jRVM/7uDkHN1Mjp4vlAx+7BZsjvI
 oA8g3CnE9dBPxT2oO+pBKjoI1BMU54z78LkKCqREi9Fgsdt4f25XGfiQe95Vw4VUe5fo
 5yTF7cFQkZX0kTBmd9XuILiVrWQrUwCdfD1OzUlj5NyK1pEYWkcvYqavYNIaJJaIsZsD
 BqSQstAhi9S2ll0Gv8we0HqsyGifdFASkNHiTgBsyaTd+a611ugZu9KtidD0sGj8VX2Q 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3x43k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:25:36 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31OJPasR017812
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:25:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3x43g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 19:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3h72nLBqbHFAgBwjfzX1n4RfHE5hozst4Vpqw6pcVCzkxJagemHxG45cudSXp6zeZvwFGWABzPL9/NsEc322UCOY4WhEihvnFS/vuaYmjVLSh5vNddBZaQYaHhfy8wKtblqCcX+BzqRDfLrK+W+/rnIRVq+4nxEa0MHpOf4Za25zPFGqIZKkwx7BPpyQbNTMIpM2sDIuoTiZV6A8sx2jgXMFVmJCmGwN/3BqCMYnCkGdlb3YtuLHFgsltwItK6b+QlabVJM6SrTl4Qd7p/lNJBQAByT1g3R9aM9isW4iJuJjNzPpYsiZFFyD9GBWFhkSJ9SNiXKziNCmwdocgpjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzN686vz8aP1lhOH7zhpcpisJVSmaaySSAjlPyyZHX0=;
 b=lgh7X1gJI2VD5dA268gzA1/CwZ4DUaZLfnqvGsg/AkCG8CosetJPg/Cks+ZLRIqTxAL2srprhFkrwM3fO/ppSl/QdqgAG8+zxqP3YC0B/3prdHbi42QbNwzKB/u0dlIumZgh02lq8IvOa2MCBmFY00eKwkGwK5JdUwUf7JUiCTXqI5HJRDSPnmkJciBjISU88I6+0k29XZ7PmQJvySE/on/xXZ/+fFWyi6lkpu1UZtFZ5etczBQ4nX14lYe3WD9AM5rZywcZktJG48dYcdFiMglfu5bX17jBTcmZQq+IeeCOY8HPzr4IGgvfklo05yhK/lpO36Vzkdjp3F7FuhWFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 19:25:31 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e%9]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 19:25:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH v2] create-spdx: Add check for variable contents along with quotes
Date: Fri, 24 Feb 2023 11:24:49 -0800
Message-Id: <20230224192449.1649437-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|CO1PR11MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb1f170-cd79-4cb7-fa4b-08db169ce40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gpFLFZhaSi9SC8gVCQ4XVFE39zKrL2FgZroVsMV/X//UG26j2FNG4IGcVlc6GD2JealzHFojdc3J7OH6g7WIqlb9L2DeDxdpDAqwF7rIl0O6Amkw0UO1QvEaAdfuHjuM7V3ot4p32gsDzGugNw5iFtQFwCEGtMsdYU9ee/8A3ttniiHP3Ols6vZkmI8fG1nm77anCjWfAWqovodKtru0Bg5iNCZJoL1jqQ0ivnkA/9hcLAkRIk7LI+Yk/zsp6x6rOnKjmXEYrq/JPh/T9IZQmWb/B/jCUj/NtA0r6g+kTzathkabWHTsTW1A90P/3yl4uY9r9WBxdPnNiXNT+og2/okW1M2MDEM/gAJ7Ce6IfyB/6BMJaxCAfyS0RvvUFtdf+N4/+TT+2hrZ6XOvr5PQ8aWKKi/JgOppDFIP/I5EprFZZtovB4GmSds9rwzCfMgJIToB8k7hrqpzzdnvElm0ERAWsVKiIZ09LYXkWVWjdf3Pn5dsBf3GErqCbBaQeurkj32+VWC6IMo43sNxKOdv2EWst4OGJhgB8IKRmmxQRsXTjiM5LR11X92Tan91XOqraYScF3PR+Vgkoftsfp+3MdHJQO8UTDZUgso+gzda/nJiwJ76ULXqdoguysBDI5YU0kr9+acYBH/1oawctxdHzCzC5A/r+++mpIlBNpGQEKgeBn/pxmc1PzNpR8ItGB1SiUeuRqQQvUHyYZTyn4I2/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39850400004)(366004)(376002)(451199018)(6512007)(186003)(26005)(6506007)(52116002)(1076003)(6666004)(2616005)(6486002)(36756003)(478600001)(66556008)(66476007)(86362001)(66946007)(316002)(83380400001)(8676002)(41300700001)(5660300002)(8936002)(44832011)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBaRpB/tKa4xoKMTeAgmrVaPxF5mvaj7Qly2XWwpX7wGcK/1j/RTFhTLOyFc?=
 =?us-ascii?Q?/BeMey8Dk8yJQfdzBdp1aDc4WVnKZxOcjWXarzmPw6lpbZcAcrMCSL84nr5x?=
 =?us-ascii?Q?hTjg2cKa1YsEO6+LWbVXxnsqmyZvfZD6/Gj6k6Df6UeRoz2g2u7VL2POIojD?=
 =?us-ascii?Q?DrwwSl7M8MAsyP5n9et03DgJlkuWSiXqFrK68kuQHmeGl+MGkI7TycDdo6Ko?=
 =?us-ascii?Q?NykevIAao7H5eA9JMMaNeWQre6sreoBoK6GkzmXySXVdW2CRJ1FiT/CdQWU3?=
 =?us-ascii?Q?wkUbNDXHNXciQXsdNdXO6mv4Hk7VDZSh25to3VQch010XBprwbiE0nbrDCMu?=
 =?us-ascii?Q?U8dODNaK/2rb/702mmX68EqFb9J+Jix8tIrjUWJai8mt+33SpAfGJvHquKil?=
 =?us-ascii?Q?h5Fofk1dDBOEMCHAlCLrW3pWLfbO4aGPK0KfB7z8nzRM92r1pc8mDuz4u4tg?=
 =?us-ascii?Q?0w/gaeuYeDV22k//CmPrt4g+4a6kkr/zbYQiS01U4+Alu9TX5IrmRFL/hhzZ?=
 =?us-ascii?Q?DlazXK13gjS2NLlVG72/IO5QknOfY98j44bYzRPTZkXwWEU1XA6uHJ8ZUFtU?=
 =?us-ascii?Q?nL8ByRk6kia8A7cdExT9MwHcshVivqcYy9ywRBjMNYU+C/80aA62kcaqLKjU?=
 =?us-ascii?Q?zroEFzbNkOyS5MXfqjO+mSqVv8LSLGJzSC0uULknYzmkhrJvBiCYvFplarhX?=
 =?us-ascii?Q?6h9MbeQlXemPPJUJk6dBZsMOsfFhdxyHfh9LceXPhIiRPCQlvEcUxor4Q6ch?=
 =?us-ascii?Q?a7lVBMQa+oOSOW/MrvTJ9BrrKN7La0LxhdZahQVMwjvPF6N+67K08L1wYBtf?=
 =?us-ascii?Q?GJ/VkPQ0veIQ2OY9BEHes2Mz/vCOde2iJGSg3rEAA4WBEb/WRL8tpUKE424W?=
 =?us-ascii?Q?STvxPuD3JPnx+WH/J8A4++4Mtnqt6DT8ny8uso1RCZWlmZw3kSjyR7RA5gkx?=
 =?us-ascii?Q?vIWllaBCRVyCIJOFxu/WN574z+TYULsJUx+9ilf66L4lEWklocwjX8x97iJw?=
 =?us-ascii?Q?N07Jp6qCWdzFlQmHoLeNDrk+0WmNympJRjwhgxdklvapcGXaYsB9zVxrz7uD?=
 =?us-ascii?Q?Zf4V/Co53W238T0clr6mN73d/puMs1CCqG/AI8YjkTtDCzmO7TvoylAVgWwP?=
 =?us-ascii?Q?fhfPKCvvazSyx6zgOFeCB8m3r0QO+s8F2O6dK8FwSLNevcIlvrSlckgoZGdH?=
 =?us-ascii?Q?OGt4i3RpZkeDAKkqt4Zz+hzEMlsO2WrDN5/HdnuOV8n/w1Hvr923iFSFudkC?=
 =?us-ascii?Q?q/Rfi3AltlgjYxYtDlK8pvZBFh7pyKBNTtYu2T4HHIAnMDmDC1NatF5uLrCS?=
 =?us-ascii?Q?BWSG1+O1Jhop8jnbHTgtzF3f4m7qwWf/illG2wR4wcGDQGQ60hMG4KOa4VO2?=
 =?us-ascii?Q?ee0RAyOnua7r9xzUCjwmFb+mbvd09AeRkuZjxdfw9cBbnVRAZXrSC+DZrBGz?=
 =?us-ascii?Q?rqzBPww3meMx9pfwSbmSzIrneD0cZoDno9m9mv/B9wa7XvlMfQHro4m8nznI?=
 =?us-ascii?Q?vp3PF4kx6NVyypd2w02h3C0CueBjneYhHnxSN5gvk4PniYLdVpLPoMhMy2rq?=
 =?us-ascii?Q?o3IAAFfvBFVl/q6rZX4StFXMn9z/Fa9ff44LYIoo4awchchRNwU/cnDh+eHz?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb1f170-cd79-4cb7-fa4b-08db169ce40d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:25:30.1606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKITzQyKYoPvV4k64nkByvi2zx7sslXcTSo3j6E68T2TzwN8ukkRpshmrvVmqk78eVzHBovki08DnPkEhpVnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
X-Proofpoint-GUID: XLKQVlRoxhKBgbJryaq1lrG0TAyl3IbB
X-Proofpoint-ORIG-GUID: b7Xoi1SVH7RWfgf2Pv_meMNy5bV4EMK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177709

This adds a check to ensure we that if a variable is
empty it gets an empty string, this also adds quotes
to indicate the variable contents.

          "comment": "CUSTOM_SPECIAL="
or
          "comment": "CUSTOM_SPECIAL=variable contents"

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass          |  5 ++-
 .../selftest/cases/spdx_custom_annotations.py | 42 +++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 454dd7a7a07..da90bf8033a 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -524,7 +524,10 @@ python do_create_spdx() {
 
     if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
         for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
-            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
+            if d.getVar(var):
+                recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var).replace('"', '\\"')))
+            else:
+                recipe.annotations.append(create_annotation(d, var + "="))
 
     # Some CVEs may be patched during the build process without incrementing the version number,
     # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
diff --git a/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py b/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py
new file mode 100644
index 00000000000..a2bef998988
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/spdx_custom_annotations.py
@@ -0,0 +1,42 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+import json
+
+class SPDXCustomAnnotations(OESelftestTestCase):
+
+    # Build test recipes with custom-annotation
+    def test_spdx_custom_annotations(self):
+        self.write_config("INHERIT:append = ' create_spdx'")
+
+        result = bitbake('%s custom-annotation')
+        print(f"Bitbake Result: {result}")
+        try:
+            mdir = self.get_dir_from_bb_var('DEPLOY_DIR_SPDX', self.buildtarget)
+            with open(f"{mdir}/recpes/recipe-{pn}.spdx.json") as json_file:
+                spdx_json = json.load(json_file)
+                print(f'{spdx_json["packages"]["annotations"][0]["comment"]}')
+                self.assertEqual(spdx_json["packages"]["annotations"][0]["comment"], "ANNOTE1=This is the first custom annotation")
+                self.assertEqual(spdx_json["packages"]["annotations"][1]["comment"], "ANNOTE2=This is another custom annotation") 
+        except:
+            print("json load failed")
+
+#class SPDXCustomeAnnotationTests(OESelftestTestCase):
+#    def default_config(self):
+#        return """
+#INHERIT:append = " create-spdx"
+#SPDX_CUSTOM_ANNOTATION_VARS:pn-core-image-minimal = "TEST_VAR"
+#TEST_VAR:pn-core-image-minimal = "This is a test annotation"
+#"""
+#
+#    def test_image_annotation(self):
+#        self.write_config(self.default_config())
+#
+#        result = bitbake('core-image-minimal', ignore_status=True)
+
+
+
-- 
2.25.1


