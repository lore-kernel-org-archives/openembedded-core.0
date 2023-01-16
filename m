Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5F1C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 14:23:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.167472.1673879017905111120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 06:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0380e81bcd=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30GCc814018141
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 06:23:37 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6st4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 06:23:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz4XQ15DHJrKmuAgRLugWNouV/AhkTK12oqjS8tYIaQiQ7rMQiyzSJMeTgsXPpXdlVT1+Fw61Ozy/L3YVmm9EicRa4PhRdUgcrGwqV3GH8MyuQK8GijayvJlONzJKoYFL6N+vRiu7aZzNtHyFM49hzefpyejxg4sKjuPoBmjEIsPYTux8aIROfLlm/UtEdfU7VozW2LnOK8vHpDe/ZpPCpWaTwfqQciYeKq1N0Vbig0R0xT/Vg9V5sydc85Ns2mk26yOkratMeY+nldzyFvA9BSJWluiMVP+66eaVqdcTDiP9E1CsODpJErCTfYpQnL6WmjfKip5evQouMN+47JOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByMmPOAqGn/yWpRQQrZ7TZfFh/cIJIahyTwv2BFYlIY=;
 b=XE3yzfpGMJA4CsrhYrYYfCebut98nI0VSBi4yLaE/oHOm5scmbOZlboz45Og4bJWohGMdXS0x87OKa40aMYT1AbsjAjd9qHrnX1k/pY9Q3XVKS7gT+5m/C7p0T6A8lry60aVMe9z2Ut8Mc+l/MfDqEd1Qndq96mhKZ0BRmbF9LPOkcZde/TIzYgrD3IEaEDUcSNI9a3r6wU2WQlK1KY4Tcuo5SGLfNIBiteQBkBNtY1Ugg8WRp1hGiN1dw0BHzGlUbfOTObUlHvgZFGS4mCSQM4xUHVF3vGnomA3nc0OrYvh0GnmHWLRTysvmhzV77TY+yVFe/QP7FB4UXGCqMpT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 14:23:34 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1c99:5365:d3e:39ac]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1c99:5365:d3e:39ac%2]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 14:23:34 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] webkitgtk: fix perl-native dependency
Date: Mon, 16 Jan 2023 16:23:18 +0200
Message-Id: <20230116142318.2707153-1-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8ffb52-e684-4597-e9e0-08daf7cd4013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GfIZFhCAAFSYWv4qECyoL51QxmJ71G6cS+r/qrGmGKDqRic+6Mpd0lFYbko87aixmE332DfieCIkS9o7mTqxZlj7WK2tl7KX7+Esnf9UFZuAA8jc+Ej6r+UyBloDFH9zNCFpwUtiO1MFm49t0BU78JfsAN5O4Z6+vGKg6w2ivRop0zdNaicfHbY82tn4tm0pO9hR1xAnOsJE3pR+8+GzJXkBlWsEjnwUDUeI843iO/qZ3XVqKQtAfR1QutIWlCQW4l886LbCaI9NWCQ9vQJfWVntItNGmJ7obfDdIQotEVoAGQIoVJHqI7+pLBG6D5+7s06TMmBZK/G5qIKR/QFwF6DdB3Lc8t4QVrzjSB7oXWPBITWRv7T1Ex5g8v49HBDh0cx/99jpAtbkwWyLgyVS3xTechK4zogfPpKl6YeniXh4qeN0k9mMUBFZxwQ0A71GpkEew78UWVUh4j/s8o9BblzQr5fpmzG6EzHGDTfcj2NsNmgRF2ye0J9/j8iJOb+VMbPH0qDJhGNFGczvBKptBocAObJXDftdzgEzLX91selBdRJRATu4pIKgF4T4nhYNFFp8iZ3JYgF8aZ7ZPZlbJkUmm/Ai789zlJn3FtCUUy9r1w1fR78MDNMmaRhc0og07zNTwQxQNeclMtCaf1NaqHSqn+jD/24R1/W5vvA9ADT0jqjz9E9F5AssTV5A+XCq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199015)(2616005)(8676002)(52116002)(6486002)(1076003)(478600001)(2906002)(66476007)(8936002)(83170400001)(41300700001)(38100700002)(38350700002)(5660300002)(6666004)(6916009)(44832011)(66556008)(66946007)(83380400001)(316002)(6506007)(26005)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PLINA5/NhAgFeezGa+bNMdnM9cWePz4YsPt3A7LW4zdbPehEJe5mAdJAIgnR?=
 =?us-ascii?Q?9vpTgZ2GV0rpsFbUfDcI082CmSO7ud60NHAhhBlmGsoO2KIRuQFicpEyLaGR?=
 =?us-ascii?Q?LGAtwiarwNEnDK2XFPnY/ia5M37bbIDL/qHrJKEpDlcgtFZRNI1YnLuBWV+F?=
 =?us-ascii?Q?xZPZm3qGZrgOBvjX3kGYC209RKIZuCqgzOiftj/PzzOhbbJ0uNULKUdjUy4l?=
 =?us-ascii?Q?TphMq/iMYio5YrQU5mCwb9CZn1TOlOBIgYIqyYSbbSi9CEBNgnZHmJCU7+Vp?=
 =?us-ascii?Q?6FpAeUTx9IwnfDTJP2Fe1+bt2QmBtMouyGVlVgcCkgvz8lHaPWpI4O7arxFW?=
 =?us-ascii?Q?uat5XgSraQsV5cMOp0DfyNSL+skuUuHJaVf6oE6V+zi9tfb4RJFf0zP2JrTU?=
 =?us-ascii?Q?zjYF4Md5+oAnSsuHnxi1AneTBdic6r67uk00AldWLgqlZYmZNZlQDHKWdvDs?=
 =?us-ascii?Q?QwYfTZcN/Wyd07fVIsiRTHTBqAmCwwK0dNnU/R+ftTaFlipsFdonev97g1su?=
 =?us-ascii?Q?M30d1xyY5dGt2hzCAyxUCCpUh+5QOzORp9FIFAEFkIFw6QfnZ5TQ4Eqle2n3?=
 =?us-ascii?Q?Nxb53v66PnKpnJdrWJBAhk93A9eXaQYcHACNtoRQpbDDO4nHdx+NCLHSXXaj?=
 =?us-ascii?Q?vAp95d7SkV9o1QKt0scVSH6mAqkYqb1ZfmFg+2uO31e8fhqdXyNWing+s2xa?=
 =?us-ascii?Q?ZwmKY8YnbmxQD2Wa04gHjbrBBMu1Rr8LU53OAY8Jn+3UnmYkQXoIc13KMcHl?=
 =?us-ascii?Q?B0GaZSLEzCkz+fS48PHrTZa5DasNkII3YU/bsZydvWJMy/DO9BcXj/6upv6G?=
 =?us-ascii?Q?zEZiL/NuV/AAx+U8BZyi1ewMHy41RCzcev6vPShB+qbUWL44gx1N1EG+M0ql?=
 =?us-ascii?Q?L8swuCVvoLEVbGAyBKook/QqC6tl7fIocjqiTaq+RFjGn5hXx1icuprSG3IG?=
 =?us-ascii?Q?AEzxZFvYm1lE8YEiexc+BtAU4YGxy9kkUlach0wUNEEzy4qbeJpsVvek62Mk?=
 =?us-ascii?Q?iuCeYuE7mChYoT6WoJ+vpdDBYloJbKO3vMSGN/zKbTwzJD6xUQB6UvhdqxnE?=
 =?us-ascii?Q?vyQHzluj3WdcC2JNkBvyerIgpUJhRyTRkZldFCh0twgXuC1J4i91XqUxFDND?=
 =?us-ascii?Q?/kxkcaPE5tE8KhHFRLRcwOdZWHezFQ3pND3ohWiTpp+8QzTb8/mcjCqWSxXg?=
 =?us-ascii?Q?hTzeNExLyFheb85GvHkuX6ofHhnuxj8CpbuEI7Qt/xn0/CwggU5J9HdEsfZ0?=
 =?us-ascii?Q?ouO4U3j92jvMDpxvSumWx6Aq2GL21+2vKhUkgRel4tXWPWOFJXYclvGbR4bB?=
 =?us-ascii?Q?LBEOIBuEif2WNNHQIKsv9Ln1DFr8Ugisps8kkTOhOHEdPpzNMgJJL/x0EQIZ?=
 =?us-ascii?Q?uhwktyM+OpVvtkzSCEVajqnjBlQzZxutzNquWrO62+Xc52BpK27Sfn2q13i2?=
 =?us-ascii?Q?ruHN7xyDn40QlZqHw5C3MFNCZljXRFWv/bM/l+WBFZmj5+UKKxPdVJyqjrWB?=
 =?us-ascii?Q?2Ln0yEVHZT2Fx9hYSwzGTNdVNheFMn476uZnavXVQTnT1u91TgiKPhKNMAsD?=
 =?us-ascii?Q?F2+vPO19y/4/12OtqgZWSq/tb/miWAu9UNNie8b/dfY+nEMoqJS04cj/HhUE?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8ffb52-e684-4597-e9e0-08daf7cd4013
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:23:34.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cz4pfZLWrF4Rw+aC9slTxdUeOEpjNTq6R3/xfLQgB7DYoX1DKxvgVn3eY6pvQigmSvEg88ChWHZe8f/TiRDczS2E/ntjk1YPa5wwzcR3M7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-Proofpoint-GUID: fMS96amPkeytkclkRFR8BQ6TIrynjRqL
X-Proofpoint-ORIG-GUID: fMS96amPkeytkclkRFR8BQ6TIrynjRqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_11,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=846 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 14:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175985

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, perl-native is missing from DEPENDS for webkitgtk even though
perlnative bbclass is inherited. This happens because the DEPENDS variable is
reassigned right after perlnative class is inherited:

inherit perlnative (DEPENDS += "perl-native")
...
DEPENDS = " \
            ..."

Adjust the DEPENDS line to use += in order to fix this.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
v2 updates: change DEPENDS line to use +=.

 meta/recipes-sato/webkit/webkitgtk_2.38.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
index e890079dc5..f076fb0498 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = " \
+DEPENDS += " \
           ruby-native \
           gperf-native \
           cairo \
-- 
2.38.1


