Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA96C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 19:29:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.810.1644262173683452919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 11:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hd/3MzIU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=903783abb4=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 217ISSmg022564
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Feb 2022 19:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4PvIebu7OFqfw5NaajBGEL4RyesaLBkB84cPsiNhkf8=;
 b=Hd/3MzIUF9ekwTdtT2s99qKraZjPjnX4x8Eo735ZrAoSuxkroO/L/fjkgCcL1CGVYo0V
 S1Y2DithFb+zO4E6tt8Ehh+kqzopBSQ7TAxZ2pF+4xfcAbOTtB7VzTXJ4BSE6Ul/bZ8c
 PwE4eVjrM8sadh42ORP/Acb1xmqakMncinzxGyuBlBBzWbce3lae4ePADrY2l3LFr4I2
 /5dKzwebTXXLqIP0AzzQDebU/rYNiKf7DNLhL45E/6TOQOSmF3hK810F4OShkP43JRO5
 z/MoVozxjbGl4b2Jl8/yd+Oag+9ZPeVbHWSKu4HiqPHrp0P2QXGopvYwyv0Vomxp6BHp Og==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e34s187yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 19:29:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF1YB1jc7fF0/jCROvaaA5nZIdiSJxPnONlavxq3QGuSUJOKs9JfRUuP89KXVK51BF+kdfVPLo4uYLXdnJNM/gQFj2/yO9YwoWI31B7F1iFqjFzLZWKRq3/hjUN2NPnSocJb9eR7RZ5EKBJYkkIRtInVi6zAneONsp5GAlo2Eu26zj1KulL1AXcRMBEH21eR4Vyb/bkO4882yPOOYVNunZHpVjzgE38adnTufEFHp4Degxa5EL8GRy8DeVrjL2QxTXdUD+BIvLUsxdS2dzQHKWRcp8gtGd3MqsrxQBDTZksNMGKlAdWVlUa8CSaALR+x+U3YpZeryM3GHLV9qRCgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PvIebu7OFqfw5NaajBGEL4RyesaLBkB84cPsiNhkf8=;
 b=CSgOmeZSkzRYFBPQmR2jzsaJJI02JtyqgG86+WnyrxqQH52u5ay95eqcVcW2wFjicdiMtSt0h6lNoPiT7uBavh5yY+zSBAYhnFiWZYnRxdHoyW9C6Cc2PffYgloOfEH2HsSwpyhyBdHXYj8QULIQOifVyDsB0V5yd3U10Roq499GJdh6A94QzG2TTGbX78drWCiKQMnZdXGMniVf7LWBkZrPvtdhaz0lkzRLPtI/t4KjQEx5VgR//bjmZtXY9hKh4Wp1N0Xe74Gs0zEEewdfeZK0ADt9LjWorpbHuibTWRJ73dWXNs4Ym3yKYgC2aApVtXBNR5MSuOwBfaO/Ly+X5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 19:29:30 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 19:29:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2] create-spdx: Get SPDX-License-Identifier from source
Date: Mon,  7 Feb 2022 11:29:15 -0800
Message-Id: <20220207192915.70095-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1bb96a-f950-40c2-2e8e-08d9ea70295c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5071:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50712E269E2ADCC8A9BEF6B4EE2C9@SJ0PR11MB5071.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	97kZoRjlU6tTweoyWIUX/injskuBB9Nicci3kQOakJgiM2txMphsB8iSDV/8mKuPWTdhrzw0Xn8bDrhOxH92oacK6zebkUbT3XQV0RGSHV16m9TG3lWSmeqkY+O1QEn/BjriykEEXCzj9u8GSch4kJxJgLhzgUjeFMFFEPX3CIzw52/EQgzbAAGJNBQeedsfr5mb19jhAPudS3iGNUMWsl52JW9SpJqNTjuWKjQvNqEtKvzcQWEXSsSdsXv7blApzH7LHCO/kzqFFFpzMWbsviotgxw7Ru7IWgnHdhRPPwibMKDv+ddD0Y75+5CwRGsiLwJ1b81j9EfMITLrtmo9ZEmRh6kKhxEv50qvMu1HMkvkFY+sB2cdAWwNx1Shf/U388bxBYn7CRtcEb3ONDaJoA0ibYX0qO3tNzjJvyfHewdKbueLCGowTUCbdGKc5G/Gu9Xr7fqSYFIB4tb2Wc1h/6mj+PWqPS1CCO4dMHHYRMAF7AWwtqZQ/edWYsfd9wS0vFE8pI2C9/qGopl3GmfVskZThgRPlOh/h6hdRgrlYF3IQ6bIoYgtDBF2pYrOm4t5/uOFkxqG49qn5mXxxWuwZNFBSM9LYkGf+7V0A8zITyJ3Ofg1vNatt4R5b45Zb68ExU08DJX0QXEcyYTURO1TQZgaoOG4I4/GpCjsUecuX8E/WPd10xpyZco5atA5pEkc4MjpZBkxv+UV1qLg8yMCzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(86362001)(44832011)(316002)(8936002)(26005)(8676002)(6486002)(5660300002)(66556008)(66946007)(6512007)(508600001)(2906002)(107886003)(1076003)(186003)(6666004)(66476007)(2616005)(83380400001)(52116002)(6916009)(36756003)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LF6xAfHV/8QkKD5zNCisW+hXSax9G5uWMX27CCDjyCzNU9Qg+rXzL/v+9V5O?=
 =?us-ascii?Q?O1PHCc+h8vWkMhM2jeYCR3nKmxx57/0lgYSf2N030nl0kYDea+zpgzUQFdS2?=
 =?us-ascii?Q?eThMQes9PMQGDwnFtasfARzCvVZ7yXqRTZZZDBwNBzNEoZwgrpQnlg+yEW6/?=
 =?us-ascii?Q?YVXbyysFDZCdrcr9TB7mSG6QAZ4lbDxOkYwxTuaKyb0VIAa9TZzvGsI3dUyE?=
 =?us-ascii?Q?cVCP6Ti6LEFss2GYsuECJrj/j9MXaI2XwANeXtkhEv3IBqTPh6e4f99HqBxc?=
 =?us-ascii?Q?ghQ2+v9okDpqnLTAOjlEH99FRyYO1HFYHBXGgw7ePacFZiyPFS+ft1EbMiyV?=
 =?us-ascii?Q?0aoNlgw5BoH613PZVv1mSzij6LnPt7lAg590Chpn1olDe9jasC99GWAF+hbN?=
 =?us-ascii?Q?zVNLZdCgqBOXNvkbYfNW9vWZWBoy6LvSoa+iM9WO/Sl+TKgznsu0qYmr5pTw?=
 =?us-ascii?Q?Nwa3wTpNT36ATlKGXmX6hJXQdIBRl/MGY5uvRu7ojwg3ZzttSQllpmk29yw8?=
 =?us-ascii?Q?ZSecEAOToE20jyECXpmLz/vX05ZX6pkwFfGv6Tg4DjvcP+DI1ZIVVpqUSmNL?=
 =?us-ascii?Q?ptsAiNEsheEC9V4wu0KTKmNiSmkEzw6wLTktutFinWavDU5TZkKVvzuM4WSa?=
 =?us-ascii?Q?apcLeqW+eWayAyDR6trApOgjU8+NEXl/3LQ7TnIVXLlaTOCDEdYUExxo4r7E?=
 =?us-ascii?Q?60OrRuItG311n0x7iI+hxgCQF4Hln3ci8rbEkBRqIi3yrrFxFHokqhF1QXu0?=
 =?us-ascii?Q?vhLZG9el/kDV7lGbib5U6W2TY50uMPOU0VlCjryJiCxx1Diagmuxdot04DqB?=
 =?us-ascii?Q?MFx3agfwXfkIq5dW6g/lRvfGv1qJQuGL6NxTAH4Bw8qq+gKFjNPcdCS3CsSG?=
 =?us-ascii?Q?7mpBb8uk8sWWsAiOIPvas+ZnXgGp4ZaqzeKXlT2vruBQ5+62uyKXCq3mA5xw?=
 =?us-ascii?Q?IcRrE0ppOBQM6Gtnx+ArjHlhThcHTHWnX7C/lmp5A3K7f2lskZ/e7umo2S80?=
 =?us-ascii?Q?gzRHbg74DfR1EgR9F79ZWPYRpq/vkkfoxUBnhJsIjwYTW3S4n/jxFwIooK4B?=
 =?us-ascii?Q?GGcoIyQWdivtPvDr05ThVV4+VbzqeL4bgcA/HYJRc+deEbiJwRN3q5wL12Ca?=
 =?us-ascii?Q?Q9Ke1KggsOpzpqCm9802GO+behoUeI9oXpmu0BUiCbQBCiL5U5fymPisi91m?=
 =?us-ascii?Q?DMNjFa89hvZlkd+zZU7H4TQd7JxyU9+WEsLrdh4ooKSoncpf+p/pHX1qVjbj?=
 =?us-ascii?Q?3xR1Yiq/1OaZ5Z/k9i7awZN7Ctfp2PZZ+XGintAAyPpg6/HKbur5dLufrNDT?=
 =?us-ascii?Q?ebLfljK2xv1Q4zb2NPsWIEKsuvyzMZPv2Kp/lVGLtAxq4gJO/FVLiEv5OlDs?=
 =?us-ascii?Q?j3gHq9TZWyrpChxBhhXJD0qEIoT7wcWBwLiU2ocygPB6CwiYzC8cZweq6iVg?=
 =?us-ascii?Q?qbP7qQea2zZqBTJg8YFbaxks10pm9r5vYIDNUq9E4xuEy6I4NQg023jVrrCo?=
 =?us-ascii?Q?jKa2PSqSX/4oxJ6oiNQAS6zGpfDFqVX/FCiP5fKMo+WI96kRkj2H3GGtOmxr?=
 =?us-ascii?Q?dNqrM0UJoYauJFoZ0GidtSeVxxIoPCW/0FBbFd1q2PiVaB+XjrT6dXfr1Zfp?=
 =?us-ascii?Q?srXGKJFILmjLSH0J4+sRS/k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a1bb96a-f950-40c2-2e8e-08d9ea70295c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 19:29:30.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 efEC6KadN07Bl20YxRipuB7IW4M8EebbiSaTjfoJlt6nGeRIH8wY3jKCl5urJaMc/zkyExuFbcymFie8EQVs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
X-Proofpoint-GUID: FmWG6sLoYJQojFZ_sWC0IPd90r3ddl-M
X-Proofpoint-ORIG-GUID: FmWG6sLoYJQojFZ_sWC0IPd90r3ddl-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 mlxlogscore=655 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 19:29:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161465

This patch will read the begining of source files and try to find
the SPDX-License-Identifier to populate the licenseInfoInFiles
field for each source file. This does not populate licenseConcluded
at this time, nor rolls it up to package level.

We read as binary file since some source code seem to have some
binary characters, the license is then converted to ascii strings.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: Updated commit message, and fixed REGEX based on Peter's suggetion

 meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 8b4203fdb5..588489cc2b 100644
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


