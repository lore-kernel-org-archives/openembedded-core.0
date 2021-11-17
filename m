Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE02C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.11023.1637172777663700858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Se4X8OOK;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695583d416=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AHDKfZv019425
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aGDCShyGSx3CP7IftaTHWSsmZbkTIqqxQp6Gqwi9OSQ=;
 b=Se4X8OOKd0Qo5cfybjJuKW0WKpZOKyXsm2zqR+3XcFJMfhb8MvfnTg/756RCZUMTv7xp
 qEYt42waa+/x6HfFufq3/Avo2y7j6jlweKAoXL3spE9xMRkRydEen+qc0cVK/4M2aEvP
 XKJlsuN+0dYMbMOv9WHKH/4JVpaaK5gRS+X8B+D53GpCi5vJ5DJkxZxvql5U7RXH5NNd
 eR6eBFhnKPB1yipYvxLSwFVikXtkHQvMkB4VeTEitf3gsScp2Br+lue7voeA1EraUJLn
 BX1iy8idgt2QY/cvtJEuBtpNBKRP5G3JIpkHgN66XMRwx8Bimeori55etML7rtTUy4oi WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AHICtmo023791
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:12:56 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ccww00h0d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Nov 2021 10:12:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUcU7XuYViN43F0pV7EzUlQK0gL3Tw4CIg/TDpum3TS2j1r8riFJtUSPhVpHJs1XTQgUk8lW8sOPu+ItewyjIMyklgCbMtbZyy3pmtBVfz+MbIH1qcMYiHUiiIarvYLdkEYQQReRawKc7OW2mjHzI5EDj71pY5Pw1CRao8hjAU1FeVKrSSasOqSSrSk838HYibo2L9+mWrTvLWP/WrXFAsh7aUvWRecIdfZL5h+19izEah53RBpT7Fk7l+PqAAnsl0ZoZuZP79ojA+PV2QfGVuGDmGmknF/eDQeZ/mgdLL3a1epBFNk20gnca2J6ZOA9IbQE1bBeLsG0zGPzuGbHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGDCShyGSx3CP7IftaTHWSsmZbkTIqqxQp6Gqwi9OSQ=;
 b=dahw4H92t3II+y0spmKUsz8d3yGkRKNO7rvhRjcnbj+uZ74p6TfTa3z/w42jcXQ0YRmwo5IG8Fxpw/pW7goOlIyrgIe6K409iD+P7gU/Mo/fsOXbgQ+/ZruU78Iie4R5LPC//MjOupnNPgkMwXVypcgDN5u96l4cXgyrX4IReTZcOt/ZJ4sRcEuocU+Sd5RMNEqC7PmI1DCrHAZbb3uu2mOzEgTLcgJGOu0jFEgVvYnK+Z+7ok1qDOwrmafPFhd1jG6lHBf3BvgW7DO0aRG/kwf25udM7RxWfSmB+/rxuVIKV6XG44TkB+pidh8LuP0rtFcjrfuezJaVJhTnc9FByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 17 Nov
 2021 18:12:54 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 18:12:54 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/2] create_spdx: ensure is_work_shared() is uniqe
Date: Wed, 17 Nov 2021 10:08:13 -0800
Message-Id: <20211117180814.29395-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117180814.29395-1-saul.wold@windriver.com>
References: <20211117180814.29395-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 18:12:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84a869cd-a51e-4812-0ec0-08d9a9f5df9e
X-MS-TrafficTypeDiagnostic: MW5PR11MB5931:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5931D2C4A9C9E4C4C3045FFDEE9A9@MW5PR11MB5931.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ujh9QfazECJ6Vx38VJlDTnq4pSxHdnEnzYQ9zrvfhmEFSvWunPRxr/J0xpaF0QSzOu8LT6raMBH0/1NlMdAXO2Ippsn3DWnDW8RjDIqhIPH2hz9OuPaJLQgEqtPp+Ho6mR6HKQ2X6f0sc6WkNhb57VimkUzD6pewnOFGQYvHKtLxYywcxMVTFUFuHZdd1r8un7wkqszrDQZxdgrd1CKM2mZm5GPcRjm3fU8ayuV2ia3VdzdTfYQO67G+b74rU208MPjyHniu2rB0BXc1s3lwGFVSS+orfNeM/lO5Kf+9EtQU4qf/RNmOWq1KUST3aByvxGZUr4F4ZqoWpsydVU25EG67oUECLKFQM5SL9za2ZISylvN1ahAwEV0pqA8/x6d56NsZzkWct7B03XGmRdaFT/NK7haNR6bzAlLW6i/NEdcoKu1Hp4w9oWXlLWxmSdefdIb/HLyQYQvqcYKGzqlJ6N/Qfwq0sPsr0Fh3sTFPj5MaZXbcybuAiWJsdZrvFekVDL1qUOqoKlG0B+e75oZd1G2WypeP01mWpWo45ImuyOsPWdbYLeLBWxnB7BkuV0g6NdIMReDC6Gm9EaibBwoionewKqYua5c0w+8eLGyvxA3Q3RSRMauDqFJUeO9+LqZDSWJ7Uv6g3qbQGYtdNcrGR6JaHUWBCGnXNlYzLIKHK/hBDgtf1J6qLObF0y0jFXNmS3QeaZOtR3IceGgULEKq6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66556008)(66476007)(52116002)(508600001)(6666004)(44832011)(316002)(6512007)(1076003)(8936002)(107886003)(36756003)(8676002)(956004)(4326008)(6506007)(6486002)(66946007)(5660300002)(86362001)(38350700002)(38100700002)(83380400001)(2906002)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QpGLpb1/q9EINp9dQaIne0TxWQ67kueciD/ux8Q4Z3DTWpqI5cFT5JyvPDbo?=
 =?us-ascii?Q?PyrJ28iOFt9SS4AcRimgRkcNYj+2SdCHjSrrORtGgc8i9J1sUvm05k71QeUj?=
 =?us-ascii?Q?0eyENg7w9rUujLQQe1LpXc1xXEeA+Gr/juFufLUTMNpeEwXfnjw7mgK0Dran?=
 =?us-ascii?Q?nCdI1GlmZ/grMoTljyrCt82swxDHmnjU5xpQi72VP0S8Sfsdf5l3NONvvllL?=
 =?us-ascii?Q?HycB83W6njz6gAsKWL9+2U1kVRKhqeIhbJAMdb/sIFKge3ejtkXIcBXryjaC?=
 =?us-ascii?Q?IISBvgiUXFNAiQpcFhSJLmwe6vnKzb9relANsyqHncmo6VsCGkJiLGStsxzk?=
 =?us-ascii?Q?A7iGaUav9ZicZsaPpALv6l51MFMITxq04bMF0QtB7zhaDtOmvxHgOvla1Nyl?=
 =?us-ascii?Q?MXaTykX9Sq8479pYZiN7srCkf4q8ld24AFqt0wWtY6dgw0125c+ciQ/7tDPw?=
 =?us-ascii?Q?9aqVnH7TAT4qLkuEcSjUQDagdM/Gyd3Nj6MdlWIrdE/BF4YiWB99L7SXTFKV?=
 =?us-ascii?Q?P2oyRV311j6q1jeWj34U7Cf3B2L2ztuLMdwkEnM7XWmZ2DajDqtWUitWyth+?=
 =?us-ascii?Q?nAZ81VuCoacoNdo/WK4z9f6FkSyG6qztXa6SWNYyhnory+w7wq4Krwsy0dF2?=
 =?us-ascii?Q?ISF+pZaSaDzSaEAlijbSoJvQlkh0BUsj8NKZ1G3wRqB2YRzSAI/6oZfpEJp8?=
 =?us-ascii?Q?RWDc9C6V6RyQTFw3HWuT2ddU/b54JLF2xuVNm+RgSsiPMRbmGSetOkyztpt+?=
 =?us-ascii?Q?/Z2U50IvKsbDlbcyvF0vk4hzdWhAfOzM+1KQ9i9kcTBmvKkXA24pZuMS0SnD?=
 =?us-ascii?Q?4UxCaP+GMAvkYQcCoQ2Srumj9ACl7i7Y+IrU/TXtdySafU4tnlY6eCtXl0Ah?=
 =?us-ascii?Q?gNub9TYBP37jZ6ewn2dI+xGozrmc2fn4S8V27MC/QTD4TQu/oEZ4HFidv14d?=
 =?us-ascii?Q?s792ngASE19DbCLPj61/5MWEsCqTdKZj7jp+KXL6Tf9vt6xzbDNOuNSGO5oo?=
 =?us-ascii?Q?b/yxuoAfvUHWZLd1Z4FX7VTyj6/dWT3MHrZHIY4DFa5IGrD4UIRSgKv0iWjX?=
 =?us-ascii?Q?B0LxbGRpPQ7TscAEaQ8vUJZCvqoTXgP47CxPw03CWkLA2m6W3p37Ag2ETLaA?=
 =?us-ascii?Q?J1TskJSM/fcu/ViAbFy1GLhnTyxMLePboBWmkWXBf5Qts95Es6ZTNynEn0c3?=
 =?us-ascii?Q?ndIWyZTetsKkHT5yljmqwhiJM7s2nXOGMQJ8UEJmWpKMprjDNAZ+vMGuBzk8?=
 =?us-ascii?Q?ceTvNN/1k8AYt0N2Lstv4KCJoGRVJzn0Bh48prGZUojYkNUHty9P/MS1JAB2?=
 =?us-ascii?Q?DQ2MFgtU8avjduQNdAFCTVwLpbVhXXQ0KBZepcT1vN3co/hVDS5Sm6idrInS?=
 =?us-ascii?Q?NyK8NET5PSP49YJaqpkuI4kH1urehbuFWlbovzNg/ggOhW9Kveqg5aMjvO+i?=
 =?us-ascii?Q?2WePVVVqoPBMFzGmv86VujSGbt7vC2J9hGsYVj6xMljyryV8FlShn0IM+Slq?=
 =?us-ascii?Q?K2+13Ctf746Fmit1Xs3c5LOteNLPOK9gCRx88tkqL2B67v6F4C7aNwNxTsQg?=
 =?us-ascii?Q?x0NBb0aoO5Q2XbfRG2p1G9i3ATBAxgDZ/JExXlqFijAzNrxttRL7caIv8/G3?=
 =?us-ascii?Q?0kHN8TvgTKuxdItmKB41qak=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84a869cd-a51e-4812-0ec0-08d9a9f5df9e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:12:53.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 chGD4FZLqFkIO//VWWz8JpgCnCtGuz5oIBRoz1WU8h10O6y2P4ubnT4PRHAOP45jJoGsCtrLuAhMnV2yB6cQjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-ORIG-GUID: kFFzaDnMImdYV53G8ysMhy0GBHfLaoqW
X-Proofpoint-GUID: jiWW2GTa-dhXoe1YmAOb5Rjo38Xneq0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_06,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158450

There is a function with the same name is_work_shared() in the archiver class
this causes a conflict when both classes are included. Use work-shared as the
check in WORKDIR to allow for other packages beyond the kernel and gcc that
use a common shared-work source directory.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index eb1d446f3f..1d5c8b3bc1 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -53,10 +53,8 @@ def recipe_spdx_is_native(d, recipe):
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
       a.comment == "isNative" for a in recipe.annotations)
 
-def is_work_shared(d):
-    pn = d.getVar('PN')
-    return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
-
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
 
 python() {
     import json
@@ -747,7 +745,7 @@ def spdx_get_src(d):
 
     try:
         # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared(d):
+        if not is_work_shared_spdx(d):
             # Change the WORKDIR to make do_unpack do_patch run in another dir.
             d.setVar('WORKDIR', spdx_workdir)
             # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
@@ -760,7 +758,7 @@ def spdx_get_src(d):
 
             bb.build.exec_func('do_unpack', d)
         # Copy source of kernel to spdx_workdir
-        if is_work_shared(d):
+        if is_work_shared_spdx(d):
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
             src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
@@ -776,7 +774,7 @@ def spdx_get_src(d):
                 shutils.rmtree(git_path)
 
         # Make sure gcc and kernel sources are patched only once
-        if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
+        if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
             bb.build.exec_func('do_patch', d)
 
         # Some userland has no source.
-- 
2.31.1


