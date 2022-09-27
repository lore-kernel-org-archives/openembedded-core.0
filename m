Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486B0C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 03:28:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6825.1664249326687292674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jWuwFz6y;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626978c8fd=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28R37Q3h019186
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:28:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=OSE4WPKbT4hf+GqjVf6Jj4iZWrpF9OxopKHoBuPv4BQ=;
 b=jWuwFz6yfzeJN2OKAMzxG2bcMS0UmxD6iSbJbgbulDSsdrqIlUT+jMzd3tz/VMPoQA+V
 OvrRd8Wpscsz2QIXBNdqOM5Ski62vyzhSDJaB32LdFQ1YElgV52PqdWjofKjbDL7fiJp
 NxQ5E/u9GzhyHmZk/FyVbssnh5K2P7h8VbNRX+2u3kOyX/xWCYi1AayU5QADVjuBTIdT
 mGu+XCKkzAzGrKwceLy9gn+aS4D3XMCts34/eHLSoLpNY/hMvEOenCfPu0AYh87vA97P
 Ed7l3xxf5WmRqtPNSNtyB1hmlTuDig32kQxb2Z0uqJ+hAwK6H/XSWrHrSuTKSoVe7RoI UA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk9vsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:28:46 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R3Sjnf030864
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 20:28:45 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk9vsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 20:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMsa6zZJTvhUq/MP0FmThlIhTTa8BwyTpYh05qZ8pGSJV88c7oGB2AyoAGs1aJziHpIDsEZFoV7aOerza7z8pQaHEeJisc0SkG+4IMRFWoipzhaGpliVCrohQz0vixW3Qv1gZFFu+FZ9OMfCARnnFyGIhkTAL5zgsXJXRjy8/Sk2O4HzsAw/7xOX1T2HiF6sURKa8KMZYXEVQlB9kohfe0YpRR5ILnBTtOnjajQa/AbL6HnyhUfFhQHNhFvn00W7V3cv0fLM/4TXxf2TrOvo5HnbVq8bBm7x4LFitp4PVftOpJ4nv8W+4Ljzn3hc7QjGdpmZkbLiNp8muWY448MSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSE4WPKbT4hf+GqjVf6Jj4iZWrpF9OxopKHoBuPv4BQ=;
 b=XSbPLNwdWp4gG4+vHwJ9lmIpJ47hT63+/vcoYtVKMc/cT8jly0w90stRGoSn3b0bt27rDmKvxMNjgm/0PKP2Y6puQhkNgQJ2dGWI7a/pDkiUP2PCsPARAk4WBFvZP2WucaKmp7r16eJ5UwKM3AOU7O/ze9iNXcl8Yc83Hbfm0TxyOnym7ZV17l//X8amPtV7HVkQy/zsS0/Ijz8UYWqByN2Un2PDGR+fwaxJ1A/R49tEg27XKrFNmJ7vluiW78taFfYYM7HOqB0EBfymVx/sAGvKvw3w+0SPoVurzNrTWsn4s/OcjGBnzxvnPcZ3AgBgEo2pzsUZWaUob2MKEPZjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 03:28:43 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%10]) with mapi id 15.20.5654.025; Tue, 27 Sep
 2022 03:28:43 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, raj.khem@gmail.com
Subject: [OE-core][PATCH] lttng-tools: Disable on riscv32
Date: Tue, 27 Sep 2022 11:28:28 +0800
Message-Id: <20220927032828.2429345-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 81144c49-3818-43bf-ea7b-08daa03860cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6ohC7VW3O7wtF2bUCciKzK2gBAGxrKWIFY9i+jAf4oQGeSEHah2SM/pJ2ZFDKdJMGPUZJ1kKjy3eN5f6fBn7hZuPzWP5Int9NkhQeg+bjYXRWF90SLWW002cT8HNrF3UW4xkDA5+1XOhR3c0vrje8E/sWJw6V+seAucZ5WBJvy1zgQBh5Z4rojPqVPDKO2q7YAOrH7EWwE01RrrHvFOTDAjlAvf3i/UhWpI7Zglyz6KnzN4CCplgimZHnggRG1XkISFxpF4EXMgdQC33c/H2XXoepnA+MSB15n4TasEddj6qjiXequd17UBbOpeykzTVBmFDU5Ijg3j9iCJ4+PTdZzz7KpO3KqHBtCIewHh1jUa1wsZB+OR9KDCWroEKQuzLBZS/ow5oyI/0lPm0Ks4kQqPcuU/Lp1KqjUtMRlGq2JuSQG3/OcaGoIO9m7P1tLdDk3nYf8r0w+NIkBRLrBmJrsuNrM0GER9oTT7PPbG3fU/1IYapZM2bXOm8f/kmuZb5PHiB4HL2/ZQO5YKjZSvHhJrVZdgTnmzIlGmTS8ZuB3uCipsDP54/0tra9uI+Eh3cVPujalYF91791F7a+g6NlInH/Gdv1SEOPfGrYAW4Zgu0raFmLMsUToPhDw7T6lUHuBLhOe4L+oF9OslV0l3D4N+S5WKHHgqtJ2joO3RwiHoOLyT9D/CEcQUvgIDlMLFKpBLokJ76BQDx/80615b3BsZCvWoDXq73Zzwlj59s/cKVgwscMwPNHlpXu5LlXBiZz/TFi0lXqFd8NSmUd/cmVOPEg+lWDAfFvSERJbBxbE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199015)(86362001)(66476007)(66556008)(8936002)(36756003)(5660300002)(4744005)(2906002)(41300700001)(66946007)(4326008)(8676002)(6916009)(316002)(966005)(6486002)(83380400001)(38100700002)(1076003)(186003)(38350700002)(2616005)(6512007)(26005)(52116002)(6506007)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?he1sggZLh84A2V1MZpiXMPzf3poPs3ORaZs4IXTkYppbJRJINWLOrj1Nxf4P?=
 =?us-ascii?Q?jITuGBaWHXFgNbbuZF4egCZN1A+1H8sGlbhQJ1pqL5P/0ASgM0Ad6VGLXe0I?=
 =?us-ascii?Q?QS7XKLLI5HxCzoZjCQuXF/NhbwgPGARuhZusZoMzBEXoaRsLZ9t1R+iq8ste?=
 =?us-ascii?Q?DRwklQrepxIycaXUPugDvuGycqiUv+s9YlDeEYWuvgRzP8eTH0ljqMyTtE1A?=
 =?us-ascii?Q?WZCcFY+W1Aj/JAnsWWkutXOZ5YCY6+m+xg/7iPGMNNhh5HyZVl4o8YEXMZZk?=
 =?us-ascii?Q?ztrza3FS14a0XnoJtsjpJa2lZXQqDJrS+b7cLQYlbgaqmGfS0KOnOdz772kK?=
 =?us-ascii?Q?stStXpKIHvVz/LVfvFAHDI6jM4b3fu1su46dJ9abVFq5tqaChAaSC4Jt17DP?=
 =?us-ascii?Q?Rv7g1XW7F+kyPxoORdNJYY+D1oQv6L/khCf3hlPEDvCNSBsisIj3s6Jb+7KI?=
 =?us-ascii?Q?RHYeDo6v8eBpGuiIZ3r6XmtNH+XDQJ/J2lJ3jN36ogDdbgvVBFEHgM0YlDto?=
 =?us-ascii?Q?ymBXXUJ2FCXHTSWPzymzirnySqsRm+k0KMYFavMEIDR2xFPnF0yxSdxHzRqP?=
 =?us-ascii?Q?eWPjHcCIbU4IZVHn/7I9Y7jA/ctXP5X0dNDOetXP5cV2wH+0IQDQbyDQdSVs?=
 =?us-ascii?Q?d+tWJ7tOGbwshV5JRRH3Ue5jEfMmTniE2JuEkZDWRY5v3gv9OKY6NlyZct9j?=
 =?us-ascii?Q?11lJz4DbTwVOpbSZRQFQMfG0ZNH7muOIXptdrlTaSv7NZkGKLjhFEAGfKmPe?=
 =?us-ascii?Q?AJB24Wh/YxebUUci72sfZDwKttf/3e1Bx9bsinc7sjkUyzaE9ytL8etA2yW7?=
 =?us-ascii?Q?elGTMQnv7ayBb4ZS0GMC0D4khLvEAEFcilmqlNP5HNMRyGyGTOTiO75kSsY3?=
 =?us-ascii?Q?0C+wiSgZRLA4RLse/MIWUaxnZJpgE8h8eaU01WDNZbpBvt8lGQ244Zz9DNvB?=
 =?us-ascii?Q?dIAcTdlGUOWmXRb9OXqO+/XbfJpiw/hii8g9uY1MDCQOmHWfksyQp7Eme8oG?=
 =?us-ascii?Q?UHb/4g2AJzmU3T1pXXo9fvqaaSksDtJaTsIhrJGs64kdx+Gbk9Eap6Xrs/FS?=
 =?us-ascii?Q?wZK4PBv50PhJyj08HIGSYvv3dp6a7sOr1rx7I2lY1r0z1pn/49uO1boQpDSA?=
 =?us-ascii?Q?DjoMEy4/3Wtp/OFA2sxw3X4umO6RswJqfJBuFsNRJPPkXcx4p3vLHfgfENUs?=
 =?us-ascii?Q?EAATuZVJ1KA+spFaBWdBA9ZDppiNEdEYG15EiNnzVGM6DmgZLjJytGe2TC5v?=
 =?us-ascii?Q?YOvEeXcYTjPR66kjCPm4Fh2+1M4oJIIKzB2K1udi6qjFp3xm0Brs1iNXMdLN?=
 =?us-ascii?Q?ScZLl23YZPIcuhi0OS+yU8/xJ5LtuyUBllab6gH5DveeqqGOdwLgN64HzJD+?=
 =?us-ascii?Q?5SoE13z3larmmfTYIKAmHgsEl0Tu7CwSNZfeCIS3sMTFb0dgaQ6kijdZ1Jq1?=
 =?us-ascii?Q?VrLXviHz1YMnvb5gv+iDXxMDICTL2/1pFQ+Oyo2/WuL58iu/MSC8CKRxyfS4?=
 =?us-ascii?Q?PGAB2j3oNwPJ4zPj467LWQynFZtme3+Smz4RCEJgFTuc8Duk3cFjig3VYket?=
 =?us-ascii?Q?pkAvqAMxbsSlTDSHTG+F/DgmmsSEYheHUnY4mE6S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81144c49-3818-43bf-ea7b-08daa03860cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 03:28:43.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IExuOIT1Z8nqIAw3AqdsE7TllsymREpDzPpWvWIDX+VP82rabDKPyrNke1bvK493xoy/pgIwnyAH6W6qtD3KOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
X-Proofpoint-GUID: 6hScYgqd1CBAoeBVBihmcrcFD9kccFtl
X-Proofpoint-ORIG-GUID: KcP5ADv5z9DVY1x3CX6p06sprRxL8oib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=303 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 03:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171084

As a bunch of other assignments did, let this cover all riscv32 architectures,
not just qemuriscv32.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 98b13b194c..900e36df82 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -18,4 +18,4 @@ COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
 # Whether the platform supports lttng-tools
 # lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on riscv32.
 # It's also turned off for riscv32 in meta-riscv. See https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
-COMPATIBLE_HOST:qemuriscv32:pn-lttng-tools = "null"
+COMPATIBLE_HOST:riscv32:pn-lttng-tools = "null"
-- 
2.25.1


