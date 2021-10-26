Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC9CC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4654.1635291383510908827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 16:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ofr4cw/8;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59335ce822=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QNVq6J015160
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=VTCgvhccDA0HzlXHo0YJ4sj4pJNVVHfxSVc4c+1H5ns=;
 b=ofr4cw/8+67XSS+KtKu5QZxU3R2c0VG1vZI/b+su/iYItrr0K//MTmSONvkNiw9yKqXf
 4mDMCpw+MQioNAseoWoq+oNGEyyFUmv4rXMzWzD4X5d9VWnUBAskd6E1jozKpZO60jC6
 PifGD5czSel0ITAdRICPkcZALsO2eym+vYZRS5GtCOMeX3DaBMEFUGu+6ByxxpAAM6NR
 QYHXHNACBQ36n2kfrD53NCKNDGqNKbSUvsg5QugLY4oXp0hOaCQWp7VJg396jnRJ//L1
 MpYTKVlsgUbyYvZQ7pBlgXIhDmWDWH9BIkvylsj3ittecJMZ46bbt49jo8crVa93mgHT WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs183-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:36:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QNaLQr023500
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs17w-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 23:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5b2BKhNr5CeNLAlBoSS419XaUnA1T1Zti51ilcRgXGF5SYm6QJUuA05f+lpHTMAJlifDpZn81uOMzN1Vh76AZgDLeQlxy/hdCrw8xo3DxekahF6D0ui5efBDjPIaMf5ZKhL4jweFSjzXheROmilEiGitfQmLoW2jTjZtVmCSg14auzCSRcjp3WuLL8xGl2vdqVzS5QWxuy0+R3bGMC2kb/TUgjyOkgHzfhzarl6Y8efwklDOO+SljhTNnxQRdqJA7CA7E5TzyqCtUJKDEotYpdmWNYVjNEh9UFXvj98w3j8ilAZjqwLnx1utKK1g5uXcs/BvrsGCpOCh0EJo1PyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTCgvhccDA0HzlXHo0YJ4sj4pJNVVHfxSVc4c+1H5ns=;
 b=L6IYJhhdma1zYbhEJCnPXeEZnVh8YIYAwi5sSMDKupZ0dMaXvcZ2pD48JAf5dQ/wNx8bwAXT206NV5LNOYTcJ+C5SqSbc5HPCwEfKgs0nQfCDLvNESfXkZETNfRMBRGiEq7StZgeLSIi/vTXY3hM6NywA49oTc0TJjNxaIU09fS1nChIrhiTFwiXtgUG53gYjymsS6uGb5O/CZqyKDDEmbn2O2IQl8HI3hk6oIP3KsKv8Pkeyqu5yVrRgUb7fhBWqZlcKCtbzGRrO/CzbskOQHDc1bbvKcYdFcWFV+loI4r0Um0Dw3BeKSb94cSR7VZYrRnuHCOnCZy+BGx8gkEBrw==
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
 2021 23:36:20 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 23:36:20 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/3] create-spdx: add create_annotation function
Date: Tue, 26 Oct 2021 16:36:01 -0700
Message-Id: <20211026233602.71762-3-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ca779a4-b1a4-48ec-2330-08d998d969bb
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB58816669A8029135D09A8F39EE849@MW5PR11MB5881.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S1Hj3uj937FfhaQ8WggIb+/B73+0WAVXXm3hqszWkcVNDQ/CkKNluHlAmc0AeTu8XXOrOaWzxFzirbDfHGCzUxIsjmXx3OpXIYbAERKPsSlzXFsPsEXt4y5A8f/tzxJ96nE8NGOIZfBkR//ov6J5XaL1ob0x/r07bS10Kw3f4u2QL0x2Af4DLA3CaplGj0Y06fGOXL2gXdGo8wUrB3wewF5eaj8ijyvse3ulsmciFoMZ9m0t/U+mPa5Yujht452GA0C/nhydVfwdC0WuN5cwT7HdSLBCZDeZnGHRJ9GPHCpsL9+9q5ZOp3FD3gPHrq+uwcRMPf+wtbUzOP9YaOyVHnt9N4GxppxKfGlW0dcms7f4oexciSzeNuTv/fil5lDNYs4Ad950w0EsLs5UmHC0eRIO2pSXdNdCYFPs/kCgTKzSBBPNofU50IFXE7/TNLJRD9sRazRulepJAiB9goTCkuXjYs4kA4GsfpqcnpZEQwhCy/G1S++rAvYGPUvHWRAo55bODh6Bg0yN3GuAMQD18ebmoFGEtHMxa3q9C26fsPkrplJ4W4Dk/ngYlJa4oW3qDlrxY+YxWR9AgYFRIoGsHZ32u3puXJJP/CJiivdNUjhrTsHo7c1yBSEo5fpSCkIcBYhV+lOHUtzlbIbNA1d4/KwtqHine4MMY2X5Z2f76GpEFKKGPj7szqyw8p6u8moqA5oh52zGkyh/byDE3XIR3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(107886003)(26005)(38350700002)(8676002)(66946007)(66556008)(38100700002)(44832011)(6486002)(1076003)(66476007)(6666004)(6506007)(36756003)(2616005)(508600001)(186003)(956004)(4326008)(316002)(5660300002)(52116002)(6512007)(8936002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pQvJxoaITEzPfPY806fWiU6qUpmudFyo9/GNVd2/CGfy94ppVEOnhIekGCh8?=
 =?us-ascii?Q?jHw0fDA8etu6VP46gYicR7CgY3T+vYkdPchvToAZenyo55ecsCEov6IF+uJE?=
 =?us-ascii?Q?lSgbCHRDFiQE6VfyNwRlb/7HWooee1uqZjssAMZhyzb/TtqE1u+l6cxEmkwE?=
 =?us-ascii?Q?i4yArdrxDmwsj/AnjRSAHV17uH5AfnjSljHhhyRM0U1mwotj51itf1Si+4ZJ?=
 =?us-ascii?Q?gIzRGnf4qfhd8E7bKs/qui/MJwt+YclErGy3/kAXUYC102L3mmLT+MM9bZM4?=
 =?us-ascii?Q?+C6IS2pA6UvTAVyEbaCfh3rKrVpsvr9LlOQAeMHGerDQ8HyE52UZpjEr4xlh?=
 =?us-ascii?Q?KM/I0dMT8Z2Jq08V2xCRfdGjTkJILEwdti04UVqftoPx4m5qDJQQJJeWNuS4?=
 =?us-ascii?Q?85/+r+II/xWqHwxocwkAXaFHT87HidNvPRYlaQHJiMajuRlnalJSnF9icJ2l?=
 =?us-ascii?Q?OrfipW1ADPfPmHhjJjF5LS5A7bLgiizEFaoqcJWodsss8JZlB6eqmUF10O/X?=
 =?us-ascii?Q?+bbhkxTAjkUatFSpziMbGD6N7KRe90A78Ezgf9h0Z0e6MfbERI1+gwXfyoG4?=
 =?us-ascii?Q?MV0CAC2ZD6Gpq5tpOE7Wqo2m0qMNvBHBeAzws3sp0Qdy4nxGdGm2UtnQ3v+p?=
 =?us-ascii?Q?3VREnXfblKIy/dyIvdqyDpSr3AOPBGXiy5VbqmkuzcZswfUU6Il7uzI5oJzg?=
 =?us-ascii?Q?Nlc2EBQJItscCQIVh4265/pboftxPWY0O12lmSD4yFYAr7G19SoEkOSDhZEN?=
 =?us-ascii?Q?7lhSybRvv0mY1FN4/KrNFAyfHEfi/CTJKHPeuxk3uw2T39iv8la3dQSI/I0b?=
 =?us-ascii?Q?zW9uTxCD4ikcfXsrZrDB7IN4MT7iiP6n4kxywmXZFjUlmjNpckX6hPLfKErm?=
 =?us-ascii?Q?pjrRbElSvqKNr7rMUE0C2Q9Po1CqxPvRnWabJF1ftBPfxvYgm5Rjh+P7Gq+z?=
 =?us-ascii?Q?jxEbxKLClk6huPYFYFQtd88NwnCTshqbzA9gv/ZJ8RQ1PAAUOdEMBzQq7Yac?=
 =?us-ascii?Q?pbFCjIJbcDm3/ynK6xQfS0XnjnGpITYz3QemOTEbmruTM+AlZNnTlHCl1js4?=
 =?us-ascii?Q?ukdsvOqkEh9srSGxX+8WxJvzetfqzbIC9e+eUnsi8RjpvOYETL0PfNhz+CsJ?=
 =?us-ascii?Q?BbCxdOk46JMKTiKV4k3LKytUfl8JYA69EGIYZagPufbKZvuWrFbvvub+sJvB?=
 =?us-ascii?Q?OYV183f+HMTXz6ZR8G+Vi8Dh47KoPvG3hHF7mM8Yp0z73Hv55vsFhAi0PELb?=
 =?us-ascii?Q?3nfgF/nisyVTWIZl6ilPMgLq/PX0SwREXwI/7q39MZD4k2b7AbnXDggY1Mdr?=
 =?us-ascii?Q?7iHQL5SgLnR4GWr/ctzZXkFYIoBFHlqTFSqMvPHbDWqnc0O182+Zk8QYfRxd?=
 =?us-ascii?Q?JpZYy9yXaOHH7vozY8b3sStnBGCR73QiKvhOz6x4DDZErXnidIFVvgcYy/BT?=
 =?us-ascii?Q?QAEsB+4VtCP2MZI/gwtUopYs9e3A35G1psBipt63CQrh94YMpkTj4WgfTxEo?=
 =?us-ascii?Q?Le+xvjjDi0Xt+PpMz3K3aeor0qVWWDc28Acl1XoQCm7gQtxgt9Dg2Vw150LA?=
 =?us-ascii?Q?yApARJ3rIoLvuKb/va5fz6L7M/Af6qFkqMoAK2fSJ6uRxpHjRaBmWLFpeAOF?=
 =?us-ascii?Q?Bgz+dZVDj2Pw7fRvIGtSsJU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ca779a4-b1a4-48ec-2330-08d998d969bb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 23:36:20.1471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 G2qqBPHfkN97WYmU4vmQuvHAWjagqkJincBTBi9v1ST570XbceiRs0XYEWsFlzL34j36iYI9wpeJyOjGjTbINg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-Proofpoint-GUID: ESqrFMrr5kIW3ZBdtpH8Px6pvvsAiE_J
X-Proofpoint-ORIG-GUID: EiLn1gP1D-8jjzRWZY686BVLsTO_aRLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=847 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110260129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157458

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


