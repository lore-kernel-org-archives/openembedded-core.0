Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CA2C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:59:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3061.1719475165894468716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R5JKUf010039
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 00:59:25 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fvgnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 00:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH/RaOhZ6HisGEQkvdu/FDoi25ZcMNpZWA7Tn6RlXM1WY4sqfyBHyG188I5GgJyDTqda8CkMMV/g+2R25lVFOeBTVrjz9S6GxLS55a4E95GUwIOKIgBZmCx+q3mRgjKcbxlPmoifA8odIyz8DHhz16un6meHaoEXMLaqVzP1oCeypsUTdhUh5n0L4TY3Nbzz/O4f3fG9UqNR+nsgOztukzvNnyQkjJ81utV7BG/dnPLeLEZtwbU5SmGdjLQ7hD0hCcGkaqLjy7+d74yIgiHjyGpdvrOPt42Wis8bFwXuog4SLgUKW+YjETL15FAYINYNTTxYhmW//ZXwFAH14lQhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT7RBzCxelSWL4Fo+gOMx+jqhO7ELbbMyJxPsBO/cec=;
 b=j9fuTWgZnRYzsQUXx4k4hCwMBizZDlXO15Q8yoRSh/eIwb8Z5RMTmRv+KKRcng1Enl/iZJB+xs5lxRAZCF0B8VOo9HQaIpJ9UrUVlbxyfnkTPg8rhB2yFxXgt/Ru/3aTNtS6sxmKcB/Fl3FYcczeA3jQNFGJsHU4sDHyYnCFmofWPuC8BoNDSgT+teWM7J+0MAd1nakoIABzkZ94T1yqQ6YaY6380aY3jCGVRsBDXDolUFrInsNVpMCe42LWF/xXiEck/qNowP8MbAjlywrRfMOzy3OqgYTDaSbr0PLzi5YVaHwJD1/0TMGq2M9EVXd0NknJQCHkeokSlrYIszdbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Thu, 27 Jun
 2024 07:59:22 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:59:21 +0000
From: mingli.yu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] ruby: Fix CVE-2023-36617
Date: Thu, 27 Jun 2024 15:59:04 +0800
Message-Id: <20240627075904.2642233-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 15293c8c-6435-41c1-fad4-08dc967f0dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5ARfnjRNk4Mxu7IT/2YNImsxyEKWkO2Vi40Odwgg/ktiyaubq64c3xgQTmSV?=
 =?us-ascii?Q?mjsZIiot3fDu4a+QhfEzbgyXGNXA3RUFhZo2KvzpP/3NlCNBESADKG/GlCI/?=
 =?us-ascii?Q?WA/WaowpcVxyrWnuEDKIRUFRdpSxYGKx8TJ+NX/zVnP0ahaHiUfEeHvBKUyD?=
 =?us-ascii?Q?Zz5kA+q1EIoqUqRk8Jnlc8rHGT1+qwrBRZAhoPIFDyl1s/b0VFW2sYUSWt6p?=
 =?us-ascii?Q?5DISW1l/DNLBrGIazmyEqaP3Ld2I+YWqiTDi3zcUEbGm0VERXvSREKaf9CuI?=
 =?us-ascii?Q?Bf9sd/tgXx1kpzHkmMQ4uDvhQpZu3FPQ8Ji80fxP0IkbYs5Z/T0w5oM59nPJ?=
 =?us-ascii?Q?yslNryRoa2BcH98o6obss5Grx4zCzdLzn1Td7e749nvFYJMpUXHi65Uge2mI?=
 =?us-ascii?Q?ULrPg8g+uQx/R/JbwSnSKX7X0vJHGcLK1mEyO0od0Pg9TCkjqjsUk1+r0fX+?=
 =?us-ascii?Q?j/Ay7Pr2niqpBiMJf8pGXavYZMVFukh3YymoiCWIIZoo6SbuDPMJ1Zc+79p9?=
 =?us-ascii?Q?owEqOkXS2AWp1UQxKEW/+EPo1Jeb5K9HeA4PYdEhrPSn1c16UHj98ULs1myR?=
 =?us-ascii?Q?mDBS0GFmebSG/M4u3R+Kx+YdOjtiBWEZ+wKHNCEVDcFAXUTHJt4uZDV4pAt+?=
 =?us-ascii?Q?bIuDFZOZPxvLTnsi+VHTixxVUVOX1NKCrHng9mceJ3mP+lNMAY3qA4401Ms9?=
 =?us-ascii?Q?KcCTRHsncXdVPf8CZYTRLEabyODhvilXPZbYNFQaOKcM8OgA8cR0TbmcfWnp?=
 =?us-ascii?Q?GpTAZn2Yj0ygfgS9RfKYKrL6Gzg3Mp/Fo/SYU09FXs2OCfH/PT4UW5Zdm9P5?=
 =?us-ascii?Q?aLR7p8UzASdJ3PYY7NEHqBKZYIju20H1wM0vONFyf1bDOoV+JcBxfIJbSeU3?=
 =?us-ascii?Q?qgPLTAtlfp10sS+EV2V4zmXZH24OXvAUG38erZc+pkewuW4ObM1xeMhIyz6h?=
 =?us-ascii?Q?iGd7rmWScvlEN+sd03YAncjKsJ2JPHHsZutS5pk+ZGs2nCQR+2DjSm4/zqDq?=
 =?us-ascii?Q?A7YIkQ5FBBpTN+6gDT1pCorV2RhNrLwA+2J2OQqK5ZHLyRZoMUXr/LqQzzso?=
 =?us-ascii?Q?uy8y/X2VpSKRgTMlnGC30eqYSz3XLW9FBQNoC9PImPW5fMU6id2d7lB8lE1S?=
 =?us-ascii?Q?ELdIt9NVohxZKkVf9eLZEMguz05qwlAMS0xwqv5pam8/oDlZvTKcvktNHbt6?=
 =?us-ascii?Q?0kBZt5LzFOjWlcxbvAtmjhL8kuceOOzQ824blNyPJK34Nj8EwW7E73C+7Kob?=
 =?us-ascii?Q?GRSlwJd8VCkU8a+00YH1nYT94/ZiA0IwR8Y1ka2fLfq6l2Gu90Nj0Kcbb9jW?=
 =?us-ascii?Q?4WuQzem8+b+EFBPhbQy+d2Nf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/WMQYQHMWJkmmUWfuzWuN9iOmCjFIdPaFzV1Z3FFLIsG2JBb/Qr1rmpmp8LW?=
 =?us-ascii?Q?nJ223e6WKcwA5G9mTmUk3Y0J+d0lDQYLxhLRnrnpCVquy4hlTawvvUfc4mEn?=
 =?us-ascii?Q?FU3P40yH0YE8nywgJOVXMbmxHaTNXmDoi5mT+jnVtdBS/qgeiQe+uUEYusQz?=
 =?us-ascii?Q?/yK1GRruccsLi54xAY5wdGJLFPxO5yYeH1jiE7Kjxyps/rdS8bA6vzGuxwWx?=
 =?us-ascii?Q?iLP+TA/VPJV3nvWhKRS4yzIFvuQKzqiwqFkoQiFjt11O65E85H9Ssfxo06G+?=
 =?us-ascii?Q?SoTpYpaEQTbxzfiaLxwSp2wh3guT4cNtbzbeK5Im9DG1DWl36aG950IfEj7P?=
 =?us-ascii?Q?WHKl6vog5gHC1ysMXiSsvc0cg6jsLvqQZ0ii/03XVF2maNAUVobFnkh2HNB1?=
 =?us-ascii?Q?U3CH/nb2RAOsZhWGavE2xyqZxiIhRCWESRlQ/bV5KXCzMnvvrgV4jOwtpdtF?=
 =?us-ascii?Q?+RJ4RVpLvgp4hC6O9U4ipln7qObojoM6MEkLb1hryoE78UxNlX+TjIhfL/oA?=
 =?us-ascii?Q?AYH+RZwm6N29YFPnFggJYVw9jh8VRPqzkRaOYIUWhfu/VV8aaHa9IzxnEhFj?=
 =?us-ascii?Q?n+FisBsTSZGsXil02HDkqm+LxNTiPnL0FsTeV0HhVk9ABEEuXLMUp5fYUmQt?=
 =?us-ascii?Q?y2z16HoYcEoXmRgOPD7w4rg5r60XBEgdiS/dLCPWuKfSSkvlK68zWWKTb8vQ?=
 =?us-ascii?Q?ErYcRgyPV4p5PDQmAZ5OOb6O5l4/1Rc0sl1q4JrN2mufD9eLyPdbQtRqBWNp?=
 =?us-ascii?Q?qafyOoTi18oy1ofY0AzGO6FhoJq3XpptWgQnK2GnGlejadDxMqJqAfI+kSZE?=
 =?us-ascii?Q?O/FNzcKnN0uWBbbOEECf59rTnX9j1MSrsYfy9CBQmrxe+gbLHPDVMvFsPmuC?=
 =?us-ascii?Q?GTfdKTkq+9KsmI5jpIqhtY73mGQQhLpSSAesgGMNPiD1jYknt/8dpX3bmOOF?=
 =?us-ascii?Q?A6LYUmk465Vc3K0Dt60mS+zzW/K9gVH68Tz/pFjJmuonZarQ7hO+oYW6qHHC?=
 =?us-ascii?Q?hXzFRmINjw8LYxBu56K5mxLj+cx/myd9f0jGy+h/6yDFHRh8tdfvOZH7/cCd?=
 =?us-ascii?Q?tkxpcumJnskiyRZ1JmBfG2fDuxPsmpfHbKF9HXIsEQsGW6bnnvVnL3GGq13K?=
 =?us-ascii?Q?Bl1xZyKQQTSNgRwFeXgT1+sX71j4LMQ9ZIkHxzf98ZhlOChHQj+6t0MzFXWq?=
 =?us-ascii?Q?q3yJ5ThLqGf8uer53PGbn/RnGkUPoiv1rkyRQdLYuNCTgh3wx0hATerspXby?=
 =?us-ascii?Q?zY4REmfUBk/Kh6dlAFV8Mdv23VXW21Uec3RexMqezN7uwBDIUfx58XK7DpHa?=
 =?us-ascii?Q?w80pPGX1lraFGXIxyJyx94zzZPnhoNRSixLZiuhbZtxuZOz5pkWNUE8e0sy3?=
 =?us-ascii?Q?/Sk995SoFg7hcraayUBuES8VqiLqOhZB2v5eDpLgUcriwwbTeDqu4MKp3QHl?=
 =?us-ascii?Q?zTSkCtP58htBIkh5JeQrrLfB96Pza89hIx7fgRRpz/smkAk9NdPtthVYWXjl?=
 =?us-ascii?Q?ISsSKfdMtPOOQHSVTXyktATiLO6buAbmQdsnlLSDWn0RqtTnAz1aRA+qhGWq?=
 =?us-ascii?Q?7Y3Fb6e6/bn58cMo0PA/nmUzcHIzsrcFERXZpAQQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15293c8c-6435-41c1-fad4-08dc967f0dc1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:59:21.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCfierGM1kUWPCi/RjEdRRu1RC1ZXrHlTPREgNqGtX7Ac6OOQUXmEkvVS+vBhZUiK3BD/bRWNfx3vh9RjTAxKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
X-Proofpoint-GUID: V-q7hU_hFIY5cRQpAjMFcsPgIJHMhIjF
X-Proofpoint-ORIG-GUID: V-q7hU_hFIY5cRQpAjMFcsPgIJHMhIjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406270060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201192

From: Mingli Yu <mingli.yu@windriver.com>

Backport two patches [1] [2] to fix CVE-2023-36617 [3].

[1] https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1
[2] https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8
[3] https://www.ruby-lang.org/en/news/2023/06/29/redos-in-uri-CVE-2023-36617/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2023-36617_1.patch          | 56 +++++++++++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 52 +++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..17c7e30176
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,56 @@
+From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc2396_parser.rb |  4 ++--
+ test/uri/test_parser.rb   | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
+index 76a8f99..00c66cf 100644
+--- a/lib/uri/rfc2396_parser.rb
++++ b/lib/uri/rfc2396_parser.rb
+@@ -497,8 +497,8 @@ module URI
+       ret = {}
+ 
+       # for URI::split
+-      ret[:ABS_URI] = Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
+-      ret[:REL_URI] = Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:ABS_URI] = Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:REL_URI] = Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
+ 
+       # for URI::extract
+       ret[:URI_REF]     = Regexp.new(pattern[:URI_REF])
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 72fb590..721e05e 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
+     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, nil], URI.split("//example.com"))
+     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], URI.split("//[0::0]"))
+   end
++
++  def test_rfc2822_parse_relative_uri
++    pre = ->(length) {
++      " " * length + "\0"
++    }
++    parser = URI::RFC2396_Parser.new
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        parser.split(uri)
++      end
++    end
++  end
+ end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..7c51deaa42
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,52 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid port number
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index dd24a40..9b1663d 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -100,7 +100,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+ 
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 721e05e..cee0acb 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
+       end
+     end
+   end
++
++  def test_rfc3986_port_check
++    pre = ->(length) {"\t" * length + "a"}
++    uri = URI.parse("http://my.example.com")
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
++      assert_raise(URI::InvalidComponentError) do
++        uri.port = port
++      end
++    end
++  end
+ end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 481fe7c23d..d1359e388c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


