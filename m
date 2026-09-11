Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D748BC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35180.1789116684266431753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Pn07P76J;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMIJ5uPC5geTUdsk8G7FxIWv2CeqxTDIj/K78qG/lkhnsPQ4iDiFKJZM/esc4K55kry4Z91dwSDo3weAel0tRoxdYEwo8Y5UlCmOXj2molPuIq9XWkTQPkGM9IYvRi3PoGKKihtYvnOoyanwiMEzObMbjsRrztATKfAVfufu8eZfE6VoWywzgUAPsKRorGNqhtPhRScw3Rt1RFPF4G+NPrpDWbH6ruyQVs53yxqX7VDnt7uWjJUVg7UUNE6uVovADZp5JANXWYhOuMGIXEV3mItWLAUn1XryoZUFuqWPFbvudrumMiVIhwD9R4IYBcRF9w4RjoW82Rx0RL08jU2Dqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9GcyFf0MUTP08zjK+ZI6TinpfGt9ID9NBqXhADIWs=;
 b=xkJ6xD+SGCYewzD0raevdVgW5j7IwdlLdf7ddTqCj+1DfEM0sUBgY9UOdqg6tQbp6fwBClUxpbMLCNtqV9CKOVFhq29aEzQ1Rw5yedmHJOPAoEr8zD8ffo86gfdEx4P181tOAfQqkF4N096/mN+kSH6V0+b2vJCNsdEEPCNE+7z9gRb+QKk4y4zvp0vYMARd17amXX85nHZvsUvXyLSc+SKUo1fOQbNdjatY7sNcq/KV+KcrDlULBppOJEs4iJ3/NCR4Ahd1a2JWgHlrlQXWDRc9+dtgTdUYbOul9YHxEF9j/dWvR5iAdKEGOnotMoLuW+nuBKwQJvoBIl2YuGp4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9GcyFf0MUTP08zjK+ZI6TinpfGt9ID9NBqXhADIWs=;
 b=Pn07P76JFjL3jQDda2aoZYkMMTYwMV6uxy2HBPShVevwn3uThcJAW2wNkPHab/fhKMLBNgLF+Y+H5YIDjGptzWJLiBagW9GKWvuS9tEkcO0RqUhO3UZTEWy1YucS1QFsZg/9CQaSinzJdVsQ4O/gohQ2uLaBK7GLPwd4LsqHIhFrI65TdqxNBAcuqXZjEiIWmqCggLZaJFzHR8WndNKoh3BEKEUPgyYCGvVJLABmNsGRjcXvGTlrcrtlYSkjk8TUyvFb23wganwMeOK1TOVIAeKYoBNUmnLoB2lMoVwIMsEX6Xm1GA+nlAn4qmlrAQeE63ByJmOEbpiZJfn1e/1YKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by MMZP189MB736094.EURP189.PROD.OUTLOOK.COM (2603:10a6:190:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:51:19 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:51:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] epiphany: upgrade to 51.0 and import libpwquality
Date: Fri, 11 Sep 2026 10:51:15 +0200
Message-ID: <cover.1789116540.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|MMZP189MB736094:EE_
X-MS-Office365-Filtering-Correlation-Id: 211cbbca-0bd9-4247-b2f3-08df0fe1d8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q/exP6j4AkbQre/I9ccMRhtfClRemdvbI55jVNm8mwDVbdTn7j3SKbkRrWfe6ETOfsF8auZb+5J992e2AknDgC4RNBZctuy0b273yXnBSrQweKGBAzTSbkBTKxlgg5AdDDtRVXp4H0ey8Je8IpfYnqpS/2H52uGiWcuJigSXkmFvFFUsvOgeSLFvNZ4F0XlAVerxpYkJ1UZ0SlS/RFZiD4M2UG+cdX6LjUeodAx0fib3moxCOpZpnHAYgEUjyFlLkKvobp7G4mbOQea/XQM/Jpsj4U14N0gqMCEfKj+KJUg9NksC2sR+JjcZ7+iXGse3MVxw+TK7bShu0L8Vldo13JkZ/O0GXY/iuTjT9roZ3Y8OjGgFtkY7K9qdZGJQDR5mmaskU0z8u7CTFCeCY+3zooVHR5AAMJGRR6gg+V1jl7+JZJV5P1qmuet4SHNTuJRkR9LPaVf/WTtEEkJyAMoi65wBtMehpxds0yJk0+iPXgpV7cwYEbGFNt1lXNRDKTERtNXFIuJ1qKBvhl/gscJQ85+jdhWZ67N0f8rU+Q8L/1atarVH4R9s8cCb0l8pykK97K26Zop9nJrieiVPIkf0pS2xcn3srGwwzP4csB3stgOkxiVGtjInFNC3yee8cGrfwOKj9Hl6TMV4YUNCnDQlE9poPWUKX5KrUZfJEL8gJzw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x/pfoV8sao29Soc/IR7w17w60t11TPgzRh69v9KhfRsUBzupMFZy3rGkwXZB?=
 =?us-ascii?Q?+48hgp5kpEQZMgGwKQeuivwJj5XKFS0X47pqJj4K/vGgzndxIsCdtyGE/yxH?=
 =?us-ascii?Q?QBKCIl5Mv1CPSOXOhLgp4zXAVU7TCvNaaL1MzegS00lHKQK9vWqVsrkjaxNo?=
 =?us-ascii?Q?YQiGAuVWOnKNS9OFL3a1sPVstDFHjKGgfj2/d34Gf1pZt2XHRg7XGCJjsvB3?=
 =?us-ascii?Q?Vjn5fj2Qs151P5iaNIuHvCGP+FS2XHBDZ5aeqRvIEVJ510nNPNklZoCwlnyz?=
 =?us-ascii?Q?CAsdOf5xndDEWcJ+JhaQ6qGe5YlRNokZjaNKqdkil25ff7iMgm9/8AhelNuD?=
 =?us-ascii?Q?OsZXdDu/bFGdVlgEvz8ZNl8aq/viWRtJYGWHMJOlvJ5oyBO0Ibk0ZBzXgamT?=
 =?us-ascii?Q?AHkdhx6PBfHIMnXeySnxihy6JTpG0k3ChL0qAp7i+un2+Fa3UXufAjrpN4o8?=
 =?us-ascii?Q?sv7OPju0ZrKVA5PukMks9yYJWYgkADBM4c69i3kRljWsAru6EQwZRVD9Vw4N?=
 =?us-ascii?Q?on3jo2ARs6HDOW3COCiVstJ3mqLVoTF8tlW3ukIzbaxB2aWIAi7wN5t8Ohmh?=
 =?us-ascii?Q?Npeee/i4bw1Tq/vARj42/OjBzlvzHogEHkoHVdgCCRHFP3ItqZmK9pUXsQho?=
 =?us-ascii?Q?nVgarpGIWFSmZ0drSjFe2aVIJ1k/P3NcJz+hg8S9NaIhpRVJMZmx7K3S4e2l?=
 =?us-ascii?Q?g41eaqnvbmNgR6g1rRpZ9Hk0M1TPr7s4tIqBZHSq8mHVeyIlSbTW0DPm+mOK?=
 =?us-ascii?Q?UNTyS9IMdSdKJir8NTdxXAWglyCuAgWuyKsBEsd032MR/v/9bXIJcL+Hj510?=
 =?us-ascii?Q?oySRdHQPfWkoY6QqHw3OhUbIo7E2dCfRatpYahYbBt5F/iWISueaDe0IAbDC?=
 =?us-ascii?Q?X7hXvJlJv6BUK2OboxcLJ2zCA0qp0ZINct505Wu1Y4KxEezSgfyOgQx5LaPl?=
 =?us-ascii?Q?NpX8TxD//BVIJ0Bl6lBBD6ZoHtkc2LCA3TVatjnPWWhOdD87sv9jZVcsuGI3?=
 =?us-ascii?Q?QrkUvncSO9NoktEIGsx+1TU9Bkw6oKZ15lhAW0AwuCm+5nBTZHk2WyJL9abY?=
 =?us-ascii?Q?gHyVVQG/p8HNZNJ+yRQ4Ob9tg63OPijtcpvyhli/+KdnBc7CXABhyv083oFH?=
 =?us-ascii?Q?DV9qF9f329GlPuUjqDUfBcMlMSrUWLrW7P6foPpkJV1ASgU4D5OMhc+1df8J?=
 =?us-ascii?Q?kWkVaSy7yC3SfZeaJ+gwVh/EVrP5v5kBGxFt/ZmVRAXavOrzd5BMi8/vZTwZ?=
 =?us-ascii?Q?7bBkce69XaW+Xt/wPhdniaWLmfiGOT6HM899DFZOWcMu1+thofrcMRMIXyXg?=
 =?us-ascii?Q?dbx9Lyjb/xwhPTuxBFfsgdXi2x9fOvQSzKdoQ3ehbQ6Sh6Qr2bdVkbY5sPpe?=
 =?us-ascii?Q?UIiMCxZ/dbRjhPH3H04/rwC+Rbsihr7ja9HpRQ17rFa4g/XWoPs5r7ec8NtQ?=
 =?us-ascii?Q?wEqirHnN5d8mhsivt9kmo3DyjOl9my9I+PegODsH7QdtLIaFNQygAeKYZAxZ?=
 =?us-ascii?Q?n2Cz9ErXURmd1ltIOEdtFq6ksWL0oJVGVhC2AraOElhLzW/iWxw4HkECiifP?=
 =?us-ascii?Q?M4mF3Yd8JMuguJ3PzkL+k1V15Bytr7OhJOXUR/USevowP73dPVSZAmGjRe2A?=
 =?us-ascii?Q?NlE0CMxxtdASIf3flhTk3IFZgm2MzP4HOirwTtzzcVMFp1breDxcig9NjMkj?=
 =?us-ascii?Q?R0uykTe3avLPl8V1HevSf4huRva8AEXW4uc/jXYfKkh5NMgWhawaY/biKsLr?=
 =?us-ascii?Q?PAPt0Rx7ZUpF44XwOoydu/w7DGIg4TxQ7a8iKShjPMXgk7Qt6+IOWRDDoC7T?=
X-MS-Exchange-AntiSpam-MessageData-1: ka/+/3GZitEkuakJfQRs1r57PopqTlT2t+E=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 211cbbca-0bd9-4247-b2f3-08df0fe1d8e1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:51:19.1838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL6txFAGw9alJGa5+55u5wzjdwW5Qs5zwTD1/aStmbbxIqIjO4/mOn+uFqhz3dKSWgsqUrBrmE1oJwkZElMW1bYIgpE8vf6t2wD6J0ngdmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZP189MB736094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245621

epiphany 51.0 adds an unconditional dependency on pwquality, provided
by libpwquality which until now in meta-oe. and libpwquality's only
dependency (cracklib) is already in OE-Core, this series imports
libpwquality into OE-Core first and then does the epiphany upgrade,
adding libpwquality to its DEPENDS.

The libpwquality import must be merged before the epiphany upgrade

Separate commit will send to meta-oe for removal of libpwquality

Jaipaul Cheernam (2):
  libpwquality: import recipe from meta-oe
  epiphany: upgrade 50.6 -> 51.0

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++
 .../libpwquality/libpwquality_1.4.5.bb        | 40 ++++++++++
 .../{epiphany_50.6.bb =3D> epiphany_51.0.bb}    |  3 +-
 ...-meson.build-disable-the-use-of-yelp.patch |  2 +-
 .../epiphany/files/distributor.patch          |  4 +-
 .../epiphany/files/migrator.patch             |  6 +-
 8 files changed, 153 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/libpwquality/files/0001-Use-setup=
tools-instead-of-distutils.patch
 create mode 100644 meta/recipes-extended/libpwquality/files/0002-Makefile.=
am-respect-PYTHONSITEDIR.patch
 create mode 100644 meta/recipes-extended/libpwquality/libpwquality_1.4.5.b=
b
 rename meta/recipes-gnome/epiphany/{epiphany_50.6.bb =3D> epiphany_51.0.bb=
} (92%)


