Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FAFC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 15:09:31 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.78])
 by mx.groups.io with SMTP id smtpd.web08.30043.1657552160650133063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 08:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ZdDYN9Ki;
 spf=pass (domain: kpit.com, ip: 40.107.222.78,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVG9pUzQ8V8C2JmYt6SVsBsh8Kzm1HPOJcBqxfXpcw3Nlztv8ubrmLYXsMkWmU4R5MteB4MWKVV+1ntk2mdAvwrIHjn4LOmwiKNCzocEelqd+QQiWEjHpTqPwiJzBdXu3aE34x+k4+FwT8tsPEQrdSk8ZhsdKiWvXr7wkSZu44PlZnvVoQoNDSbU4FsedGTOCh2yG6QcgWr0R4tjqpBd0S76vMATbm3Q4nlq5ZVv7+kyITMrsKpG8bVTOr9c0ZyiefyPGbm29Sx4CDCkfb/Ai19vwFMFb/JNim0vnQ9sz1I3TbixVEXLbqmRY1F9OtfaSvq2p+3yZtIvETqbHEMWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEW7ZirziFDk62boPaPAkzudTcySatcZg/dB6UfY9rU=;
 b=B4UNnp85w2/bJFCMPl4hDGRzYCz0Xx22gH4VDkNrQTw2kBkDu1rUiFbJdcTerMdF/hJkggmr+TW93TGtxdT2iE3Mks98pfQxLt2xRon3e82vdMqNmnZAIyBGU/wJyver6D2eiu2vyNoUodJRctP2IJNWIVKpe5lHqX5Jo3pevj+SM+c6DH3uu8HOJj3jWsv2mb5faA7CeS9P6HDdhgqVdDskTSCqwtaRNUUZaZ/R+4WSfM/VJIuieq9ERiJZywgBgahHfhNUJmtgZ8cK6m8iRwYHUz5DigvToBMa+NLLgZpCsyO9PxFwLqiMTf6kxYP8I1FMx7pwZ3zimdXOjPoSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEW7ZirziFDk62boPaPAkzudTcySatcZg/dB6UfY9rU=;
 b=ZdDYN9KigSMqtgri4mon7KSTP7Ofep33WtAVgFtsiuXsbUqYR6TFoM/4Zx8JjpNmYyio6C6B+fsOLGKsjMaDFxrkKTzY+ZxZ3BOJ7XexeysWXF2Y45Ee+fmP5JQO48nQ0S7+wVr532estXv1w+ghft//efjJbhZBab+LH9u1B/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA0PR01MB5532.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 15:09:12 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 15:09:11 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][master][kirkstone][PATCH] cve-extra-exclusions.inc: Use
 conditional override
Date: Mon, 11 Jul 2022 17:08:32 +0200
Message-Id: <20220711150832.8360-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::44) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 581d3193-1e3c-43e8-104c-08da634f4f37
X-MS-TrafficTypeDiagnostic: MA0PR01MB5532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UvkySQhZM0kH0QyDrD+X8Gz2P4YZ0CP5kLnQQUuI6X7ZprYJnV72eS5zvS5Ht13JjoitJ5gV4HUNmFZ2ph90dl6J+ETZqZfrshDqFMad9r7i9cAivA4xzbvjRnaMXYwQofl3JNWIt2eiux+ZKTBJk76bOF2N/qmD0S/DaouXBiqZS6QWcffShiqqud4sM2fzUZC9lzqz6ubQtp3IXZpullP7UKCBu9IU8FYeXYj7UPzA+LYj0oAScoS1i3d/FufHEtEX1lyqBkuF3LRVPvVK/fYpfhT1f8euzuWz5omWlOevNi0MjFb4VIfPFZ6gtFTgswY6FNBWBkymICg6Kys2CM7a6hKsQo71ERwsXdpWUuTKUISuM/dvB25o+2h+QxilAlk0XYQJuHE4+yVm3nrn3CkPLXOP9+Gmma5HJ5N83350jozFiN5ilvDE4CtFNl6EpUXh4avRFt8mNyzXwwcR+h6tV7X5oJvYfOSpVX1ALcmVumzpDB59Rtihf/z1XCcmFbm1i09dDgxoDT5ZfewjhquR5d7qVPCjqae/O1c2Ipyd0A7oawiSxi6kQgTzuxB/R3+YZePQ5rMDHIQHU9WMYb3UEfuknvPBBfpqq96peqKfmBp0ESTd7sWqupDQPkr530/Raijj89iKMWuM34qQlh8fD9bMhT99Gqg8gmttqk2FEjg8G+jwjNFEi+kqrkhyBYiptA7YTNYmp19f5KVa2qS0bd+ba+AzDk7B7MISyRb5Irv/Sev597kNawiNkYb4cw4IpPCExfevxrLqX1rducSRV/B6hDQBldnw6cLhGLihrXjMaT2fhqUNfOz0todIZp99RsB5u+IOwN8apZY9PQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(41300700001)(6512007)(107886003)(2906002)(6916009)(6666004)(36756003)(86362001)(6486002)(478600001)(52116002)(316002)(26005)(6506007)(966005)(2616005)(38100700002)(38350700002)(8936002)(66946007)(66556008)(4326008)(5660300002)(66476007)(44832011)(83380400001)(186003)(1076003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gek8ngSLwdIEqvclpVzbQBE00B78E8KsxP5evZtWJy2ZIEf3rjZPcR/mFUZG?=
 =?us-ascii?Q?6yoTiYNP6WQwvsASu5LfcHFKAFZ+zRSZX0bn1TJNlJZzJtjnr79KUHBRQonH?=
 =?us-ascii?Q?krXeVfWOJkiZ4MfBuuLosnsn9QdoKUqiyelBicd+uXzSxtvFxzQm3n1OAPK+?=
 =?us-ascii?Q?j6ncw+d+X9TuZSLxedGPbLxT1hNPizh/K6r+Lk++1IcrtxIXfa9dPZ4ToPwt?=
 =?us-ascii?Q?CJy6AyI/r3RmU7Pa0mQ5FLDRrc9/AsjGOfpOvDgmrQN5fkl85/lqBE1/VZfZ?=
 =?us-ascii?Q?NpHZdvuoxY6uPinIcaf54ie6YrZevjYuAH9YrtD0FLIr8HGg2oBtg+FtJThd?=
 =?us-ascii?Q?nryHrANqfsS/WJTvB96jdH0Q1zwc9FGNoSL6h/v7aiuxHTWpQwsC1xHxdQtb?=
 =?us-ascii?Q?uqDPu2ryEw4pU3gZzTPNq/xgcKbuRQgxeI4NT/xBmuTzemLr1L9ymdyG+PsF?=
 =?us-ascii?Q?M5vI6K3akbg2rNGmEs5Kr5G1bIlJVW979bDLuaCL7gCM1iHbvDdmOYRyk4+g?=
 =?us-ascii?Q?fKCbvZMxKPVA1FggPDG3EfN8SaQgMO0qagNlLPgJhj0LVXpxYolhofgyEWcn?=
 =?us-ascii?Q?lyA1vXmfAVxF7qrQ3N2pDgSDkDcbn9+2TCzlmvL3FtC+A6+OCwYYFFODbW49?=
 =?us-ascii?Q?+etq/aw4b0nfePGBPua1oPu88Sv8rOuwTSloikBsT8J8wMHiuWgP0OMn0z8r?=
 =?us-ascii?Q?+g+1ZJTsKIzdIY1B8OvcYj2H2TtTxFj/O43JnHj0nltoL16Vdp+BaOB88Wg4?=
 =?us-ascii?Q?ijUUYguMhRB7OqLHT+e/4fMhiFJ+y1fdYnu4z4WGJy4iKtn6zoY0BU9WCVFm?=
 =?us-ascii?Q?tZvJgbsqn+At7ypAXRW9U4+BG70ZI9FHUTNAD1i2F2ed/pZPxE+2wWZjh8vy?=
 =?us-ascii?Q?Th/yus4MT9kmMShWso1aE/w+o4eSm5rV2XL3MNaXu2rZhWEke0bssMTnH0Dx?=
 =?us-ascii?Q?TPQrVJA6THIChH3LlLim6h1CiEiQbWjUtlRDOfh8OAMWHIPdD0jiWKN3Ljc6?=
 =?us-ascii?Q?iGCUGfF0SqBmXbzGthIPKe9uKCXATDOdDNmDmRvWd7TlkKIwlVcjoqKbvy9Q?=
 =?us-ascii?Q?9x9bxW8QlxCerAtFKPkfBsNUQXqU3ysz/EJ7pVOJsm3jHGsbcRLWWOA6ncQw?=
 =?us-ascii?Q?zsyGlH2ySpl0eKuKucQ5zMAopuM4z0tMp4v9hajBIi9vXyQ81mi6hpZgcBuO?=
 =?us-ascii?Q?Y9yLznjwaa3CZ2OSRLiqRpHmkOMKzlJ8txdKeq/YK3H/5YG1Q16+IWoo0ItN?=
 =?us-ascii?Q?FHsH+18i3nwlOpbQrmkobs+sIWMIT1sJJfdr3X/3GAHanMIBf185UKsI1nVs?=
 =?us-ascii?Q?cJr6IFO7ZuAv9aXddFYz1Pi1Vf+6H6Jgf+QZizuUMbmFNYopi1nZo3JEcOXz?=
 =?us-ascii?Q?9XUgv5sUHmeeizVSVEXDcfzPaSYPeR5B6Q4ynPDof0ud6Dl4iNUGCQr0vQvk?=
 =?us-ascii?Q?Abp4y75MP3QYw8lG80QehQNhieFBTHE2x+mILxMOOmGH8/sqkAyJgJ2j344g?=
 =?us-ascii?Q?j59GCejuVDtyzl0B4kAB+tAjk//Fr13CYHa8p9eKcy7pqfqRhpRQyQ17XYzi?=
 =?us-ascii?Q?LbEF8PbIBrBpvWdFlszE59/5Tr95gxvFZi+kPg7N?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 581d3193-1e3c-43e8-104c-08da634f4f37
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 15:09:11.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DUUV1rdT/YfYSU3QkSp5OHA2BOPAei4PFBX/mr45Lnol521SLc4haepIa1G6qUGWnNrgWJ3MVd+76hH7leqTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 15:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167873

Use conditional override for CVE_CHECK_IGNORE variable
to whitelist CVEs for specific recipe.

After including cve-extra-exclusions.inc all CVEs from
file are getting shown in ignored list for every component even
if that CVE is not related to it.

This change can help to set actual ignored CVEs for
the recipe.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 42 ++++++++++++-------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 8b5f8d49b8..2f9735f700 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -19,7 +19,8 @@
 # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
 # CVE is more than 20 years old with no resolution evident
 # broken links in CVE database references make resolution impractical
-CVE_CHECK_IGNORE += "CVE-2000-0006"
+CVE_CHECK_IGNORE:pn-strace += "CVE-2000-0006"
+CVE_CHECK_IGNORE:pn-strace-native += "CVE-2000-0006"
 
 # epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
 # The issue here is spoofing of domain names using characters from other character sets.
@@ -28,31 +29,35 @@ CVE_CHECK_IGNORE += "CVE-2000-0006"
 # there is unlikely ever to be a single fix to webkit or epiphany which addresses this
 # problem. Ignore this CVE as there isn't any mitigation or fix or way to progress this further
 # we can seem to take.
-CVE_CHECK_IGNORE += "CVE-2005-0238"
+CVE_CHECK_IGNORE:pn-epiphany += "CVE-2005-0238"
 
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
 # Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
 # Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
 # Upstream don't see it as a security issue, ftp servers shouldn't be passing
 # this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
-CVE_CHECK_IGNORE += "CVE-2010-4756"
+CVE_CHECK_IGNORE:pn-glibc += "CVE-2010-4756"
 
 # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
 # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
 # The encoding/xml package in go can potentially be used for security exploits if not used correctly
 # CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
 # exposing this interface in an exploitable way
-CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
+CVE_CHECK_IGNORE:pn-go += "CVE-2020-29509 CVE-2020-29511"
 
 # db
 # Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
 # supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
-CVE_CHECK_IGNORE += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE_CHECK_IGNORE:pn-db += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
+CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
+CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
+CVE_CHECK_IGNORE:pn-db-native += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-
 
 #
 # Kernel CVEs, e.g. linux-yocto*
@@ -66,23 +71,23 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 # welcome than and then entries can likely be removed from here.
 #
 # 1999-2010
-CVE_CHECK_IGNORE += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
                      CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
 # 2011-2017
-CVE_CHECK_IGNORE += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
                      CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2017-6264"
 # 2018
-CVE_CHECK_IGNORE += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
                      CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018-5873 CVE-2018-6559"
 # 2019
-CVE_CHECK_IGNORE += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
 # 2020
-CVE_CHECK_IGNORE += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
 # 2021
-CVE_CHECK_IGNORE += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
                      CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-4202 CVE-2021-44879 CVE-2021-45402"
 # 2022
-CVE_CHECK_IGNORE += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
+CVE_CHECK_IGNORE:pn-linux-yocto += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
                      CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
                      CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
                      CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
@@ -95,19 +100,24 @@ CVE_CHECK_IGNORE += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
 # qemu maintainers say the patch is incorrect and should not be applied
 # Ignore from OE's perspectivee as the issue is of low impact, at worst sitting in an infinite loop rather than exploitable
-CVE_CHECK_IGNORE += "CVE-2021-20255"
+CVE_CHECK_IGNORE:pn-qemu += "CVE-2021-20255"
+CVE_CHECK_IGNORE:pn-qemu-native += "CVE-2021-20255"
+CVE_CHECK_IGNORE:pn-qemu-system-native += "CVE-2021-20255"
 
 # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067
 # There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can
 # still be reproduced or where exactly any bug is.
 # Ignore from OE's perspective as we'll pick up any fix when upstream accepts one.
-CVE_CHECK_IGNORE += "CVE-2019-12067"
+CVE_CHECK_IGNORE:pn-qemu += "CVE-2019-12067"
+CVE_CHECK_IGNORE:pn-qemu-native += "CVE-2019-12067"
+CVE_CHECK_IGNORE:pn-qemu-system-native += "CVE-2019-12067"
 
 # nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974
 # It is a fuzzing related buffer overflow. It is of low impact since most devices
 # wouldn't expose an assembler. The upstream is inactive and there is little to be
 # done about the bug, ignore from an OE perspective.
-CVE_CHECK_IGNORE += "CVE-2020-18974"
+CVE_CHECK_IGNORE:pn-nasm += "CVE-2020-18974"
+CVE_CHECK_IGNORE:pn-nasm-native += "CVE-2020-18974"
 
 
 
-- 
2.17.1


