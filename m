Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6DFEE4984
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:10 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.138])
 by mx.groups.io with SMTP id smtpd.web11.907.1692380885206924851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=MQjE/Knp;
 spf=pass (domain: ni.com, ip: 40.107.94.138, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq2X3qF6ZrWNWRRN7gvUse/ZiMusV7cHzm/+cqg2RRFMWznAf9IwQVNuJ0A8NXj3m6NkFzlA3WGnfZp42ZIDTB56zilEDDK7cHQ9FvlYv6ikJlerdZAis/iJ6aFtwU+FJq7TYd1ByP+oWuTOGBcM+11aaS/xeZbY/CGHKNvb1DkE35Gii5GFuEYhBLgmn2PAjFSRumCNFcOS0DZ3lBxXrP09ycX1gougZQS2J1q6heit2ZZSdf8N+d8KfjP9wj9E3pdTfhH0/yVYGTI2H77RzoYYGpnxP8lYLqe2qOdhib4rdlaUX1YQoG2nuAdgtpz6uEZXWXLUcxHmqLBxbv72UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rDSzt7wq/WfvaR+0WMjrpcwzVT9mzOn320HEwi/6oM=;
 b=RMLVjZ3H6Y3SguwpwiASHqgYVNEfVC+lhkeslfFwHcou65bTBX7QEpDcYkIloYee4SSQIR955WPwm4LNrw9VB2HnrTYrzrGvfFWjzM3yzYGmRuL9K5nOYnvO3vJDlYUGHbRCT66HXQebxZEQTf1BzSyxyr/e57V91uKuGO5QrL+tkq8O/DaIq3axObPI5SbjEM8PZrM5Zx/7aBFPmkgfruG719HTDa2rIZex3ydU0nym8zxdbrJluNJrInpX9B4uqEmqLabkzkgLqlDwGrhDgTY9nKrWkDt+/NNkal5aLOFlse1GcVy64eelW4MH7efmnWlOEdtCxHhby5kqgkIbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rDSzt7wq/WfvaR+0WMjrpcwzVT9mzOn320HEwi/6oM=;
 b=MQjE/KnpB1tZPyOidBViwzOuN0gLhcn+ZvTPcksP/hgrU/zuhnByIPLXdjtbzV2/sSBwcqfX7OcjkcqKyQP1w18+8n6bOwS3tibbD0NBoG1rZiYEr5SnUS4MA3NH4uDN3GM5HgT0TQXQUskwPX4qn/ep3B0kDlF3u+Q20Ujm1jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:02 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:01 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v3 0/8] Add new packagefeed recipe class
Date: Fri, 18 Aug 2023 12:44:49 -0500
Message-ID: <20230818174754.988128-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:806:6f::30) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd56574-707f-46ca-ad08-08dba013442d
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tadYwDXjgwBoewiN3KMBvwIwskLsNFM6YdXJOD+LVfbfeCcrSNxvOaXHhTDcQ8TVMClw6yjF+a1fUMQvuarKH6peuZz1jsFV1lAnRxHw2+AJ1RBPrvMUjvX4P4w8fdgYiwImdWrZrXsyeYlRHUaZzMxBhjz9Ny/94+u5Y7kCz7TAc9tt0ebnuPkfVSGY2IdsKPsyx63f/yhmHzUIiaJmWM/6RJHt31CnUAXOAoWqVfBCb8/yBdGNhFGB0Xs2uQC956pHW/8gXhATTE5Z1T1Yskwl4xegccxRXkahpGzcGs2vjKY089qH/bmHpA2bCywiqcQ1w9is+7PNcNH9AsVlb95nftDD5i5XOKYkaJDg/hOqrXsio8Shue7+ZMFQU1IKZUVobcqv9+MS0+bmJoViwBMyYGktb65Iy/2c85CUBAz5Wl2a1c0D1eyLDslkjyA602ooB3lYrc1ps938fb3nDxVjs8q/HIc+LtjE8y3uv9VT7LcC7zILDftP0t3COZVvL4tRXLhpm16hplyUX+9iCem0GVUIC3LyeORPGI2dgpIv3R22IC5W3xf8QiEd0o7Q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t8IAIWmB65lYBBtMNEqo8qgQlRlhbJOqi04HNop8VWIA67YmhKrnRh2ib7CB?=
 =?us-ascii?Q?YqOsvWJEO/AigHzya07vfyt07eCItJ4HKtPbDOFSL7Z5qu546za3tdILoWEd?=
 =?us-ascii?Q?5SZmv8LIkOzmzSHYiFlA7yraX26JthdFd3QbaLc/G23NWYHGnjvj6wQgdAME?=
 =?us-ascii?Q?DzSNBcKRT3iMBRu4cdBaF4+Q4pv9vhgCUvd2osjZacRW3BXJMGQuWBcjJUO2?=
 =?us-ascii?Q?rpYuy6G57Z7YK66Dxko/xdTAfjGD4coYpELoShzafDnoiXIzojQF2/j/uLR4?=
 =?us-ascii?Q?d3NMHfjAiWjndVnoYBRaSsUpHFFIBG4d7YyJ5vDkY4Rtr8FUhyhvUilhNZ8n?=
 =?us-ascii?Q?V6GFuAxdZWrOTpp4hBkVoqK9psaQSavKFqk9ivHsC2jgEcGI/iQp4XyZnFUE?=
 =?us-ascii?Q?tbiiVFt9Kx7jF/dONhcDG98+pD6h8PJSPXjffirGKKhUx0Ffsy7UhT0lBpli?=
 =?us-ascii?Q?Uw7y8fhQVsXCamEGdWIqiFSvs5VHUx4TL30aw6sLCc6qHeVjFDcVDBQmnQoC?=
 =?us-ascii?Q?ZIcp3FOwtN4ED2PlNvMw7df/SoiOszKkH3x4FccZf/qmyW2QWf8hRt6CIJlH?=
 =?us-ascii?Q?aOR2sE+tfaT/9xuf1AoR1/rHJJPU8MwX9Iehok0UF1zSiez8ZmEtbbw+1CLj?=
 =?us-ascii?Q?mKfEVfEe6JMbDwCs+6iU5bafpxQiBWSYeoaMQOqsBq9I0VPPSTFmqs8Gw9Gn?=
 =?us-ascii?Q?01d+7j01JGVvS3cRJJ7FzGHkBzSXgUFH8In/axYybZSZ+1guo1kHXJ7DkeUx?=
 =?us-ascii?Q?Cc/OEnKk2owy80vV2TBsQgjQdMaroLx6tQZQiFqfmQiWqJGBLM6YUfTioSM9?=
 =?us-ascii?Q?Jr4GgAGMMxLIV6nk1JP3XIOmPyGcYr4WvNIcd+/nUjXwuaXurJ6JIMZ6oKG8?=
 =?us-ascii?Q?tDGkqWgFr4t4cHeuSUPDdHhsNz1VohblWk8DhJUDUGI8x+EEUyO/3Cx6LOnx?=
 =?us-ascii?Q?HGl4pS0xy58tNt6dyg8YNhJSw0RLH++LAJasfruj4q2M1taOKkJF01e9ti/q?=
 =?us-ascii?Q?shTTbeALzsUtRIbouklJZRWEdzycNWZoG1GvbeAzsVCRY0lfROKY7pH4rYfs?=
 =?us-ascii?Q?sydoA4EKYIo9mR9tSjrRz695vgW9EGKTYOvGziPW6HPQ+h7YiyzOirutCogl?=
 =?us-ascii?Q?/mYDgQNx9uCRdLq2cK/ABWSwJrKru3Io8aMH6j5guw6Rqqi2qqqAAlYWkl2Z?=
 =?us-ascii?Q?VDAb45huuFYFPwLXAt91QKBL+Q/921zL91BhBj+nL7kW5yJvmL0Xv5RFoiyD?=
 =?us-ascii?Q?i8+886Egg/S+Np6IDtPGrRM1axI2oGuaOj99QLt69WFnEtJN8UsoKo9gBHkr?=
 =?us-ascii?Q?RAkD3T4VAEHTgWwCzYwGPYYKRzEvuFQxa8taQ1nwSjANfXJXNb4mLutFx9Hu?=
 =?us-ascii?Q?XV6HZa2J7f8R13VKNPj7M7XK6P9htQPIs+TLOJS0KtowEVkcDuG5HawCkDAO?=
 =?us-ascii?Q?YlgAmvVyfqeTCMN2lbR6vCvrjg1VXz0npF07vgnoBvuJK9XyPKRQMQ8PjA9k?=
 =?us-ascii?Q?1XdaLdKhvToPj/5blnL9LtTn47tQdBGeUHBd0AMOCFbDdCpzY+AfAFNF8a94?=
 =?us-ascii?Q?Ins1L/FP/jDrb9UPrAFQ/KuB9dhq6zAUg24iSerpNVJ1QMM7riXOHOmWpCTv?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd56574-707f-46ca-ad08-08dba013442d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:01.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQFbIuifdoRlN25JzUzuqn3+gU5v1vps3LjyYCPWf7nr+fCQQ5N0MnBw/Hb1BAcWhCuhHh2rxrxgdJbLKtb8xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186383

Currently, the only way to build a feed natively in OE is to build all the =
desired packages
and then manually run bitbake package-index. This approach has a few drawba=
cks:
- The index creation methods ONLY work on the package deploy directory. If =
there are
packages that are not meant to be in the feed in the deploy directory, they=
 will be included
in the package index. Also, multiple feeds cannot be built in one command d=
ue to this limitation.
- If a package feed depends on another package feed being side-by-side to i=
t (that is, if
packages in Feed A depend on packages in Feed B and users of Feed B are req=
uired to use Feed A) a
user would have to manually remove duplicate packages from the deploy direc=
tory before making
Feed B's index.

To address this, this patch set creates a new packagefeed.bbclass that enab=
les the creation of
feeds in a new deploy directory location for feeds. The patch set updates e=
xisting logic in the
package_manager class that was previously used to create a temporary feed w=
hen building a rootfs.
That logic is then used to create a feed and exclude any packages which mig=
ht be included in any
provided side-by-side feeds.=20

Note that currently the class does not make use of sstate. Since the indivi=
dual packages are
cached, there did not seem to be anything to be gained from the extra effor=
t required to cache the
feed. Caching the whole feed was not space efficient, and reworking package=
 index creation to be
compatible with caching didn't seem worth the effort given that operation i=
s fairly inexpensive.

I've tested this in oe-core by creating a few sample recipes and running wi=
th each combination of
the PACKAGE_CLASSES variable. The testimage cases for dnf were also updated=
 to use the new packagefeed
creation mechanism and several images were run with testimage to confirm pr=
oper behavior.

Changes since v2:
- Added Summary to packagefeed-core-rpmtest.bb for recipe_qa.
- Updated do_recipe_qa to not require a maintainer on packagefeed-* recipes=
.

Changes since v1:
- Added example of implementation to bbclass comments.
- Updated testimage to use do_packagefeed for dnf tests and ran testimage o=
n several images with and
without dnf tests.

Changes since RFC v2:=20
- maps used to look up configurations for each package class have been upda=
ted to use nested dicts
to clarify what each item is.
- DEPLOY_DIR_FEED_<pkg type> definitions now include the ${PN} in the paths=
 instead of relying on
adding it in the bbclass.

Regards,
Charlie Johnston



