Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B708CCDB483
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=CJAio50B;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A49uNcqtHx3O/LpMx6tr9AJRcyU+/wdKNMQ6IP39UHTqasv+idqw/71Nqjv4MKG+0eN95/inN0cUM17+Na2SyEPLGidOSfR5WBDv1CLYTJS6UOnLxLh0D2IJ+kL8DmohCc4MF7nWe0rFlEXuMpMNIgor6K74Y1gQGfDH4Un4hDv6u+kRVkUO2Z8AvkIP/Y+HUaoh0UASz9GQYSDA8rLJmvQe2Z9/IgEJo5877+4sNp9Or1Zrg5k4TJ3kDiNnIi9iXVj84Ubt7k6z05/0zopSmaXDLiL81f4EJ0QORtBInEuolipqM4dCBzJ5+pE/rVggtEntcYL2c97HI9l5/tVOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=HTmU36VoWQXkOMsrYAIVJObw4o71wqi2mJdPOSr1RTa70qDZSLt5Qer5x9K/Ieo27NH/QNMIuW3miAUmjlWeYVJ2HQ5q0cG1/n07QStdMIN4G+Z4phBBmVOJrR+KyzCEEd0ElX1Gpj8gUloiSnRXXTi87z84vsEXtynqFtEOfP0Dlt5R+k2Vnnd9umNiKR4v9gc6xEAD0PL8zRmfjQWlpRIiTTFE944sKBit3mVSF0svDQB0CZZthsGWxm0C3rlCZvyAHd57wYnsh7CrgSvnpB9FdD7oyCJCn3jvR0GA0NYQPQ/lYZMcRiVzQN+QmrUoQhFcawGzcN2MDXCv0SedyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=CJAio50BJ1g1HrlkihIwNtRq6JOv3ocFccuR4ogVrNuHT9RaQkfeamVBUG11M5OheT1545mwzjAPDtfGJTNEqPxjv8Alo+cOCYGNaH5aBto91FBjigvsRFpVawwnY1ss1grG/QXjnJzHbBwvWA5avWu4MyMuZbz3H8kcyFfZxaJge/N2Kj1PJPRwCzY5lSoFEJa1wYrPbNyHqJur5ww8CV/3KuEuAKSvm/0muX2KTBaXeWBpY2JnuHAgyuzmpKklfvwjJQbYM3L1fVGHHkUeN9aYEQiARo+SG/gOc8E/DWnFVMIRwT3nqzUAtsFudv5VxHzRF00E1K1Wq3gI8ucOPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:32 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:32 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 02/11] image_types.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 16:57:40 +0200
Message-ID: <20231015145749.69995-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a07a4f8-8bfd-41ca-3285-08dbcd8f333f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OrtdWU0YtFx5t7UXi7kHr9uVd8okPyROISH13v7gyN1uKTc8Mlo2g1s3ttsG+kyVl+IfqQscK57W1BNsH+V20hS5LLX/igMZnBA4A62a5Xj+gpx8xVBA94MF4ALOhoS2ZmBGZT0f+QhDJkK5y7ygKCd2sBNDJOchDuLShqeCJXrEUYjPJh+kuvB+JcVWt1ujDT93KtCMAWqjakM+xR9vvO0P8ivv8b/7YRIkc/iLrWkK59NrY+gmTs2aObHjk2EZB2xNOviz9yTbaW5R9NZtG0y5D+Qi4w9pnIu1WG8aDrn3g3Un0gSdbeOlBWG9Z++2NtZwKvY+usyqxmF57xz9k8dSsvaw/MYuKOvNd3h38UozTjj+nqUzp5RbZbO4oFyJ/esBGleGsTpbK85OHnloeHuMq3YBuCz5TsHe3WG3FmFUFqmBN9ox4bnI+6f5dd68Qebkk/2RRryPzF85x4Da8Mp7RfLpjyzbsvDkzBdvuEJ94uVG5kaClfrgkhAA2BQQHgvDWKNfqLmd9QKl4PGfgXPc7uSItjB1lKQtmmcPdFwLLawJPdZE0xFQsUoZHPpKTC2LhyOFgzwcLTqBmUE9GdXhFVYUJIL+wmuVEZzzz10=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R+rJN0FkfGFNI29RI9x7r3Cw5R67BS9MVRBZJrPPCgVsQWyp4AP5oAbs87UO?=
 =?us-ascii?Q?okGQpFPBWQ8tcnLtHjCK8CzBEhEHQZ7GQ4OpeRjSsrvdLj4+v2yYFxuEG19Z?=
 =?us-ascii?Q?mWtEAC0HyJrx6yeKJMijmYh5n5oZYOIZ8c2v9mmZZyxprcQlkbQUKvAYQUyp?=
 =?us-ascii?Q?5v2bZLq4aZHq64vT2B9Yq5q3wYWaZ6WT48JrYVuBlMcrcgAOEUhUi+JMywyT?=
 =?us-ascii?Q?9Y6HrXOG39qpBcHMTN9Kl/2JmVzVTE85/FORFXfTswr2YffOLCi6jm0JZjF5?=
 =?us-ascii?Q?rGXu1iyZiV+b1bmXkNtnOB8o6WCDFIejZ9PA6MKRUiu8M+Vh7aULjECcLkCN?=
 =?us-ascii?Q?tv4+6hDdYBCWupKFtmIopyfyTtbl4IVPYgXT0fk+Dc8z2ohrDqZ2/K1FJmhy?=
 =?us-ascii?Q?C0wnFYgdOpERLX7a+HQeI724rxA0gpFKDdawWSKbnen/hIoxIPNyw8zQpF69?=
 =?us-ascii?Q?MUdAoaSr1Q6v7wv6qOKJHZxFjUGByt8bxhMcXl24eG5LuF85zY5cx+0QM9jM?=
 =?us-ascii?Q?zKAdj18JhrR5/u0y/ksbhwYLT51wWvsagoko9q1m+sdv+5KTk06Ai+5puq9B?=
 =?us-ascii?Q?oNqV+MLmIJQFt0+VGK8B/ud+BC0rItB6idyTwMxnsRkzk7QAXOqsHOlF7ykJ?=
 =?us-ascii?Q?4Ms8PkdK3Kv/wKpSfogab3ZPpN6DYMF8W/iICK3dQaYs2OW7MalUW1T8ffp0?=
 =?us-ascii?Q?+PocmRP5dbN3kKhhn9w9GrYgDHxD3A6pHiUmi8TToWd8Dxalzg+nXQAt3u8s?=
 =?us-ascii?Q?eGtPVkMruzUUQQzETbY6Am+xzVsc5fgWvXYBHpcWi8ENyREDcXyRo4RsL7L9?=
 =?us-ascii?Q?Hm2HBgdtGbhClNvidU5SZlkcbdxLHs0Q2qyCxLqFE3lQKrLmuIqW9Z6CDIdl?=
 =?us-ascii?Q?rKrJh4R8YOaNYtc4QkyQkIUxfnjjW73VExzGJO4PA3z77X/cP8eRZVskPhFY?=
 =?us-ascii?Q?z0C3pXTfTb9a/t6HLjp6JUhB/KlFEVXGhj3bBtP8C9ek29GPpEYE0hIBXiU0?=
 =?us-ascii?Q?HbMKwk4YSHsmt6R8v9wUD/rJVFV1h3jJVVCD/d5THe7PNvnb5dZYSR5kChgT?=
 =?us-ascii?Q?buOIJ9MnRJD2HLoSWmDnoNVaTkAxsKTAAXgsdPcUX2IkJVY96U7BHe6Bd7yb?=
 =?us-ascii?Q?OAVOYG7IV5AQ+A2YWzUXqQw+Z+HDZ+OjTypADVm92e1YwbzKb5+XFelI4kZF?=
 =?us-ascii?Q?80UOcBNUmoFPD+orwCiiVyaMrERlDf+3gGhMPDU34rY0Ft014ntlWlo9XfJA?=
 =?us-ascii?Q?4GYacCtvOW9oF7QZibwTOyQoA0vkk5uCiviHkp8xp3i9W+obzBFGushhFvHy?=
 =?us-ascii?Q?+GuJd2vI0ms/C7AIpo8BpkupmcsAgCcsIuL7bZ5w2Vz+k5eW7kOXzEhqYg/T?=
 =?us-ascii?Q?VOhZNs/iqSetaByDstSQ9xRUXme76sA3IPZ/gRdoIsg2ip/MtmUGWSp2MK0e?=
 =?us-ascii?Q?ZgbGA+cVnT4hCOzCFkErtMpqjvWo6q0XAEpLVKYx2OyntfvTjcnVNy7BimKo?=
 =?us-ascii?Q?xMynCUY6dE7B+nBXz3EB+spz6VKLmDx0R+eGb06bWjNOd77eHUUmAtZCtVcu?=
 =?us-ascii?Q?5RXVEwo19djOosw2CjmbSC6LEz9lE6gsSlzmzrVc?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a07a4f8-8bfd-41ca-3285-08dbcd8f333f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:32.8317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzJL3LvpGr0DrqiYFw8Eul4TVe4kb1wGC63CvkA/ssjHJyFPlACgdsfLkbszs15mGM0oCe6GsPFBl21LAHX0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189147

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

IMAGE_CMD_TAR will use the tar provided by tar recipe, which
is already in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-recipe/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 4aed64e27f..c50bcf673d 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -385,5 +385,9 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
 # images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, q=
cow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?=3D ""
=20
+# Minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and is able to extract files with xattrs that are read-only; this needs =
to work only if acl or xattr are turned on
+DEPENDS:append =3D " ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xatt=
r', 'tar-replacement-native', '', d)}"
 # bmap requires python3 to be in the PATH
-EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''}"
+# IMAGE_CMD_TAR requires tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''} ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xattr'=
, 'tar-native', '', d)}"
--=20
2.42.0


