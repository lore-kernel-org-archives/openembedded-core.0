Return-Path: <Lincoln.Ramsay@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128A5EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 23:22:36 +0000 (UTC)
Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web10.1092.1688685750509466171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 16:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=pe9hl9/M;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: lincoln.ramsay@digi.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174]) by mx-outbound22-151.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 06 Jul 2023 23:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJXEXapB8MDs6p1IzUFubagpr0b+1hB6d63Qqd4zce0bCpkxtkJ55Ivc563Ly+brnNeZtDCWYqCM89JofDgPPInx2EsEqF8s+xpT8lATTxU7YToledQe363OdOMZbFynpGFp2lkHHwDHOFkqYU0bs1u0XC4P/LRJdyBcGC9OAX4fm7VLaUMpP/3wHbeIDl8SAjwcIER1YElAz0hK9dpgUBnHCb9ubn/cN6Hggrsky3ef3Khf5Tc54sgHQ0AF6FVHYW95lKPOyrXOOeNtCm3hHxg/Ibpg0v5hhLh9VRFMX+fg6OuWFQQadZK15LoSGvXEcBVJEYO043brA6mCeKq/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcF41l1StWPLIEcN6+P9cNHmMptungXzhC+MSJZYxPM=;
 b=JKHEdPtC1qORhU7kA/cP2kl4OzmNqhkt1h25SiNvojYUi5D9tt97wKYUJgeLGG0d1fRyclGzVH/e0vPV38gLJnc7ZRm8hRfIoTF/8PhpdvBd6vxWekC8J0uLdUEgQQI8/or8x9+PYkMLMRwmDwOZT6aSTuqIZ7YucTNEvxfHSvSQ6aDgqiwbAKxbPeJR3EpL4fr59W65CMHSNs9nARg3DZx2g8jZedTPMMnUGqFha3DRzB3g7LzPxy5Bb06mQrdxF6n7aqlqw9ogWxpTNcYRlSTFGyBarMNgMXkAXK0FZI6pjFUS/UQyxTM3QpoZA0uWa1du/mCign/UZp5nmEx7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcF41l1StWPLIEcN6+P9cNHmMptungXzhC+MSJZYxPM=;
 b=pe9hl9/M1Q9Y1ZMw6Of3J1iBkmh+LkfApfWq7t8kMJ8eueC+59laPi5sGgkcPir7srusU3jBO3npS3QxQNTXYWI2zfh9Nzag29tp4gUoawHfLZFjltGfwczM5U10YBGD43u84D5/IFmOg4aLR44uBfD2I6c228jHXpGlKGnBV9oSWbdbZr1YjSCHPu8sFuP6ywGc/LkgTOJ1rZl1ZX4wIVjS7zfq9hm7Ua05Q9hPQl0Mj3ewwm3IyerPEqd+JpII94WufUhhNKwo7Fd/b//5U7+n9TQzZ2Iqu9a8gyo847zXxFS3I67jko3x/qHp+lC2CXuGUGraU1dkH+92Qt/7xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from PH0PR10MB5793.namprd10.prod.outlook.com (2603:10b6:510:fa::21)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 23:22:25 +0000
Received: from PH0PR10MB5793.namprd10.prod.outlook.com
 ([fe80::84ae:7f77:2d0b:bf1d]) by PH0PR10MB5793.namprd10.prod.outlook.com
 ([fe80::84ae:7f77:2d0b:bf1d%7]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 23:22:24 +0000
From: lincoln.ramsay@digi.com
To: openembedded-core@lists.openembedded.org
Cc: Lincoln Ramsay <lincoln.ramsay@digi.com>
Subject: [meta][PATCH] systemctl: allow instance names starting with numbers
Date: Fri,  7 Jul 2023 09:21:57 +1000
Message-Id: <20230706232157.3602573-1-lincoln.ramsay@digi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:1:14::14) To PH0PR10MB5793.namprd10.prod.outlook.com
 (2603:10b6:510:fa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5793:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdc258c-1d6e-41da-fcbe-08db7e77db21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eEUpJtRW9q9JOrJX+OTNvwJlwPkbWh1SfsQA07h5T2mM22feK/zuzLV53/fmiF47oUdyY0EPFDzHWJJTENYhZjzFV6dfMq2W1fSNzFM3BzHjWxiHXMGs1MLbKwICjrM5vgD7AwTr3P7f3vHYBXhnsXxeO9NPCPd1Tte2qljjz8DaamGIXp68vJbWCriojl+IA15qXR2vQd03YSAGxGBPx5mQvWV5BmYxqIsLDZIlCgm/PEOMLI3d/oOvyBM3DNh9moQ0q9kd/8j1kqZlOVzOugnH+eG6PrYKk5i8jOzC1y4U5yJ0eo6+QIL8A65VSoCDgjA+uWTkTP9Ffrs6gnmmSmkWUjSjOiFTjMiPGS4h4Mg1yWVcRjfjIaR4x7wCq20qHgJJC2Zm4CmhlV6zLe+VZ1bp1WBxTtvqFyOIGIdMYkYPARdFwL4KcXJ2iAYQOYxowmmSMpNrNqABCKXM99zR8TNnjUPj8lRCjazPG0kiC1NNSdrVV2do+DL8AdrwcP6ZxV2op7KdU0ZROqzAQIMQRyzHE9JYAQqOA0D9QRXLcnbS9IoVWH/K6AMtKGX8v+zbibmFAbB5GQX3kAEC0eRZU4nG1Uj57ooPbos9o1C4RXmwumIc8zW+Mo1KnD8VS9Oh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(5660300002)(8936002)(8676002)(41300700001)(66946007)(66476007)(66556008)(316002)(2906002)(6916009)(4326008)(6486002)(52116002)(6666004)(6512007)(2616005)(107886003)(26005)(1076003)(9686003)(6506007)(55236004)(186003)(83380400001)(478600001)(86362001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jzb9Vu7fwT1uRo09v6gsYTxzdeHLfCk+DACVfd94+Mv6SEAZn1h9cnjHL2PM?=
 =?us-ascii?Q?YtPdAfLns+2WmA+XvwvaT+b/IA0CdqO6EMJmwXnZUbaSqkENcQ/80zbMB/m0?=
 =?us-ascii?Q?7WEGs2Zbu+5VtpEwCOOxIWpx5Fur8OpUwLq1zoGKC4pyQftAziJwHKFgFcDE?=
 =?us-ascii?Q?DcPyDVMCNyT6ZDtWhBIecl8IhV15y2E0tBz1Fsu6fy6ov+z8MaY0RI2Aw/BC?=
 =?us-ascii?Q?LlzwrjRnOeKOCcbSQ7CeykYBRroZycOEmB3BJau6VdDO9BIer2mTX8U87/mR?=
 =?us-ascii?Q?akG5v+ZDV5nVJgHqeDPNx/N5vgsR4UM0L93YGqsa3ClFotxkT22b/WzLovn5?=
 =?us-ascii?Q?RKZ2TMKpLGUAx3Th/i9VgI/5ACaNyT4zdxmvxNY+Xju9IEwtR+LO9ikuxrkC?=
 =?us-ascii?Q?0C544BsizR0t+JfgZ7+fclEyGNBcXM9mhpCrlQ5uFCQRCLtzuxmz7D6NLpSG?=
 =?us-ascii?Q?QUQVc4eCHDySACUD6PqAF7khfs4sKifQorscZ6hr6eX/2bBVMAPYfM7429Dw?=
 =?us-ascii?Q?MTU8gaONYCPJSV54ipMyRV1QjwalJsHXHlRpeQkKCA22vxHprIMxLHMQw9Ub?=
 =?us-ascii?Q?BGAmIUMQAAkd7YOg+kyIaiuWO1N1xDL8m5Gxwm/avwoxpOMMW8vySggDBNSB?=
 =?us-ascii?Q?QEIvHrp7T+GL2BySJRyQbaAeBBWWQNpaMETH/iK9O11Xypbr+g9gouLRJmbk?=
 =?us-ascii?Q?W9JixkCBVnhtcBuXyebBk2vFSADhO2dhESLuojB72BuwLy9W75+TM9wxucUK?=
 =?us-ascii?Q?7neQPeVLOT1P/vhx370kpDIu0twCj/X63sbDyyDjpWeeq4DrqV4cssLK81Il?=
 =?us-ascii?Q?EHPVcYFU9SStc3s+9WR5WrRzjCdjxWKytESUnCZj7vghR5XgH6t2qWm1D6s7?=
 =?us-ascii?Q?R4Vq6voC6Z2+LkzaiVJMmxp+5Z8+GsMpadGeP7AUkUwEUblRQI6i5NDsz2Mn?=
 =?us-ascii?Q?SpiNwQ5zpVB5YQPsiUiRc2e8StfOYWte2JBoWcIITZJ/oVeggZcsLWKVYE5K?=
 =?us-ascii?Q?1RKerS5w6Aap6VCt8t//2tJeUvAGlbOq81+9Z9BqoGAb/O44l0BMsJ8W7pwR?=
 =?us-ascii?Q?cbQPRpyewXRcDszvl5aOx+fQ9bAGIEpmZTatdVyA549hNX2psI3eNayJAK4d?=
 =?us-ascii?Q?JFbYr59dF2+CxlpFWlc8b3iRk5lVKwM8RXrTxGbveJe/CIP4wfzsgDy5ejr6?=
 =?us-ascii?Q?/FPMAJz4wKtulM213CqR8TUH11U+c1E3vO5xWHPUqIcAQ9Av3HKgQiNehQE+?=
 =?us-ascii?Q?80GEhPOYWRVaRtFSklSBtESlL0asIZGKh1j6n1tP7P3LHOdCB60VpSHAfyQ1?=
 =?us-ascii?Q?/8nuW+BVcVkpEZTm4yLgDt8Obhy15/RCh0LZZzxgu6mIeVFDoYi1CoAjmQ5r?=
 =?us-ascii?Q?pVImpnws2PYSuvTz2wR8/M1MvlYpc+LkycERjW1NoYtz3xVcEhW0FUYlB9kH?=
 =?us-ascii?Q?i60KgzSIOyrishgoOrqcucVsmYgwRUT4zxZaKXMsLSc7cXfztDG9qXlf4tAu?=
 =?us-ascii?Q?D0k/bLAwz/3nahZMNvW97B2mfX8IpwOvrkfACzVm2JxQFjKD+kZsZYsy4zFl?=
 =?us-ascii?Q?+lsEpEB1JB4yxfMjEZAZySywn/0E+jdaIYWLCFKG?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdc258c-1d6e-41da-fcbe-08db7e77db21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 23:22:24.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8f5Ri6chF3eHZp5QcbPRgkH+rL+h2zb+0xc0EHYHQLAY8gDjaUZyah2IhfYG0TooUIFtHtd19di91uMXFjCvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966
X-BESS-ID: 1688685749-105783-5482-19530-1
X-BESS-VER: 2019.1_20230706.1616
X-BESS-Apparent-Source-IP: 104.47.57.174
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoamlpZAVgZQMM3c3MLQwDQxKS
	k5JS0pKcXc3Cgl1TItLdnMyCjJ1MBQqTYWAHbY+FVBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.249316 [from 
	cloudscan20-70.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 23:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183986

From: Lincoln Ramsay <lincoln.ramsay@digi.com>

Templated systemd service files can have an instance starting with
a number, but the poky systemctl replacement for building a rootfs
crafts a regex replacement pattern that uses \1, which is not
terminated, and when combined with the instance name leads to an
invalid expression.

For example, installing myservice@1a.service will cause a call to
re.sub with replacement \11a, which tries to use the 11th match,
while the pattern only has 1 match.

There is a terminated alternative syntax that avoids this issue.
\g<1> achieves the same result but doesn't break when the result
is \g<1>1a.

Signed-off-by: Lincoln Ramsay <lincoln.ramsay@digi.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 514f747fe6..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -202,7 +202,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.25.1


