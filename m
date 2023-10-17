Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6872C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:27:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.214674.1697549217556090878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=xoGmS3RT;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.69, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRK8D4tav8eUrh1OEuoGOmen+OzEkavSSBpiHk8b4UDpDwbi4K1rJjwVcAIhsR21lZ6rV4MzfYqXiEuMOtveufznKHYqhSwbcLeDYcTHRrcELlqZHoz6d2Acz9nTcktuV44tql+Ng5Ai28hzQJyhAzE5DmCX17Pd51o1UNOX5RxzSAIC6gukmtZaYYqX20vCPbiYTd192wExVWAhP10sKh1PufiJJYjg78LpPGkK9jOt2oqSDQ0qEvKQfxDOobCvspXS1/V7P4drjsAHPagXnEHO0mDkepaBcDxXW7a7ax86pb9aK1O/WunKcXwRbbcBssB0ibtXTfZbPLmGopqjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYfCqwYHfQZJlMow8msn/ZVYMuxcO48YhqmN0u902HA=;
 b=IRNO5AqwaGyLifRjiFk67vXZd2uTmp5OJ0GHM+/DJsNKolxpD3+1CxO/HHygsB1JxkzQVhYGvSidsrSvoooiDP0Xt9dUZDOX5ULiNVcXBQ50kfSClGFNymSomQRq7YkMTVxaJmfpBWWYXVx8b66yZj5yGEDNS+oKs6buv0hX2Lisq7JvzXIskf0SU32VPu/sVmgTU3n6dXrb6CYHcpJlbzd9jM4rqIi5sn6dX8DNEJl3ecoHPNNwX3ezw/iRuFG/s+p7WoGaHfWMMm7g12sF58YgGCRPJguWnQ/iT0HOaG5npS8XietbcRzppkWBi5J9XYL2DTmBJdLaZ/AkOXqJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYfCqwYHfQZJlMow8msn/ZVYMuxcO48YhqmN0u902HA=;
 b=xoGmS3RTo77zsUWxOoi8ov4d04xdf0XKvwYPobYVSrkEmjQZ0x3Q3t4Hg+RY9/ohd8966H4QWsU0uvR4+Hr6PFMWhr3NlfR08AW9JmtpdiQZTV78t2rSe4OPzPkFfNMtvE8E9Zu9CFj+XtBM8pw0h3rhdXGnX6Bre1Df7b/f1UI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:26:53 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:26:53 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go recipes
Date: Tue, 17 Oct 2023 15:26:43 +0200
Message-ID: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: c891ecc2-8571-41a1-a029-08dbcf14ba39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fD8fNbvUFFF2RGplEEccgBmvrvrdMniu2CJf8DAKDDmTeXOIrQrLyG1yS0kGOzJxkV0lYvc9pKOZeTFQHNKDAd/e1y4VNEg8weSyxWtMFjxMzPBaw8PNgI5c9yFdi803BiwCr3n2MgnQO8hQzEgokjhCMULz4TR2AjBzOQMEungKyreFWHYVeMri9X//kHJx3p7bMGM+33wRAqFuNyrTFx+Gfuc7qtaobr6cxx4/ezj5pJ2OAmWnuAnODoPkaW0JtJWy8uZ9LALzNXgJyD2GN/ZeOXjjVAteyVptdMWd/H41asztur+GsujIxGigQjQTFtlBHAYWExTS/zwJxObcMAgXGVN8T11mYOcQ//2gEuo3/WLIw9gZIeoEhTri6chzKEMFKS1ZH/g29Yq3FZTenl72apa/7jmSGUj1FhoHlSVlPECfeY5muhDr8GOk4cg1xmJRbsclT02JkaiRgBej645XpdONhmii2VUmvYXsA2Pu6T/cHlJTS+tnaoSkSRqgDzT2BeXxhVtsmdUUkADPGw2yiPxn/QWxXQIr6Oh97Bu3FUCn/K52lz+NQ97Hl2PCR3agcZc4SQ5ugkuSaeLHqBtPy5e9Rt+Ft/1ahFUKn7oVQRvnliEczpIIrDR80XSN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6512007)(107886003)(6666004)(2616005)(6506007)(1076003)(9686003)(83380400001)(52116002)(54906003)(41300700001)(5660300002)(478600001)(8676002)(8936002)(6916009)(66476007)(2906002)(6486002)(4326008)(316002)(66556008)(86362001)(66946007)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?heGkLgpkf4Blq6cTDKbDzSq11M/I16i3ed6XQ/Xo0Ud3aqAl3mNu9YcoDvWU?=
 =?us-ascii?Q?rXo4+dkkMw/pyTgVqm3+anU1zugf/so+VJwMkx3nHKD5ES2X8d6LnfN9Biq+?=
 =?us-ascii?Q?PJj9NLSQbWQXjVjomZftVDxRh9TJGGiRAEMLJByFlodd3ZFEZ0JENp3PSU9a?=
 =?us-ascii?Q?nKT2jbgmn3e+74lrHX5W2LwLyny1b+FXTYUltxeGjQ9WRRVdxcEkFxnKFcBA?=
 =?us-ascii?Q?TeSRUNgn3vaydo7Z3Zb5FG6f784mBOHaR5Ohw5+MUl+EX1DQ5CW5ENBmVLPE?=
 =?us-ascii?Q?yROCMYapRA3z7T2Ji0oEDLo3GMtVFLYcQaUGLKROHYmGUE0WJZOfOPs7BSkr?=
 =?us-ascii?Q?HE9+ENyrbIyDuESD7e8ZIG/p7jAxwD6ESlTVTupdyzibh/x8O12LussU264p?=
 =?us-ascii?Q?akVYFhfNuLbcex9jyfdJ7C/ZmfzeXUbfbiPppJgmKBb9T2BGSSIJ9xivMymP?=
 =?us-ascii?Q?hKApphH94K7rrPQpaQZFuylik1HWCUdQLlY9d7jyiLciBC7p0ltsWhqyQp8T?=
 =?us-ascii?Q?GNc6aQAJSqjd6s3DbPrrUYpTvke7A1Z+xjDgDU9HKznC5fdmSxUdIy/HUn6a?=
 =?us-ascii?Q?3AmjtEOoNr2W8DWUNEqLI1zaFTOrg7X0/fqpI1piiRyEXwV9ITlX5GN7HSyJ?=
 =?us-ascii?Q?agEemeWWs8dpxmjnus7vyLyYlIfDytvCnW0ON543JP5AaVcKgmE0pj/C6hKf?=
 =?us-ascii?Q?F2PDOsrIdll0JEoVN+0GZEmOFwz7trXpiYXvXag8cmWLXbRhN7PeUYKzHx7J?=
 =?us-ascii?Q?9IyJypzqpwr3/n845TJGnp/ReCX9Cb/KFze5Q/6eMovZMJLi+URaMTakKD0k?=
 =?us-ascii?Q?autcQPnL8JjB+FPiaCUkH3THh380IKlXwyo/6MqYQWAaBSz9JSMojKGYp7pR?=
 =?us-ascii?Q?NvOueyPmctz5FvKCur9VMq+E+AJf/FTRrTvyw1L2pmeO4+pYlMjvsgjwBhjZ?=
 =?us-ascii?Q?BrDUo6tb6iemyw9BL5389mNxoP3T6j53K9c5zY3zHkyJZCotWvaueY7VjYPH?=
 =?us-ascii?Q?OnQuNaqs+Z/6ltHXaLjKHQQT9LR3/QFoXh/7Qnu5iC1xfzX82FrCsOcSCIlM?=
 =?us-ascii?Q?hcpmPCcxrGhSMw8V63ZJi7alv780xOuoieniP0vXcVud25Z8oWjEJO7zjDDd?=
 =?us-ascii?Q?+LGN/uNzWqQCPOBUMvck+mOHNgiTwO1/vpOPVWwFwRZJe4XvEo/LwAqk2Pqf?=
 =?us-ascii?Q?26+ZcVwiw0v3aZP49ujnVivBVfqgrMq+0Ow1yUw/FzvTELSdZm+4DX0GMo6C?=
 =?us-ascii?Q?y+u9wba6Pnn2YTBtGBQX+KxmjP+HfWCdiWV6Jm+oVECPbLJilLpKUufo/pXy?=
 =?us-ascii?Q?GM82v6/x3dQ5Tz0UG+okF28rfqJ7JuwUYqRAYPAa4jP9z8DN+46kFD6qL8N2?=
 =?us-ascii?Q?He70T8p/UnLDvIj52EsWiLkdOltyCnobQAc7FzdMdlocGe6fjw/YD9A2Aci7?=
 =?us-ascii?Q?fJaCx1xr0rsaK8sMBTQaDIMYhHiUlgGzEMLlbOwkULeRB6lhLLS+ZtqUN1W/?=
 =?us-ascii?Q?T+k8seAnKqlR1LOGxm+Oy3N8tVLwRJhIrTJrpT5sIVOdMLd1W+LtsARgr2y6?=
 =?us-ascii?Q?6yNm6wRanuPtbBquHrTtnqXGC0RI4shEwNLho/JiefjKLYVVifrAlmXPGl0/?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c891ecc2-8571-41a1-a029-08dbcf14ba39
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:26:53.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq2DYlspzcBmTmW1E7yCoTGrWzNi9zcLFxl3wPP4KMb64nHoL1zwpbzpCX1JerOjuUsIOVBaAWrTDMz9xqcwUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189326

From: Lukas Funke <lukas.funke@weidmueller.com>

This patch series adds a recipetool handler in order to create 'go' recipes=
.
Each recipe contains a list of dependencies in their SRC_URI
variable which are derived from the projects `go.mod` file. For each
dependency the corresponding license file uri/hash is added.

The recipe may not work ad-hoc, but is a good starting point to create
a working recipe and have a working offline-build.

Lukas Funke (4):
  classes: go-vendor: Add go-vendor class
  selftest: recipetool: Add test for go recipe handler
  recipetool: Ignore *.go files while scanning for licenses
  recipetool: Add handler to create go recipes

 meta/classes/go-vendor.bbclass             | 135 ++++
 meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
 scripts/lib/recipetool/create.py           |   2 +-
 scripts/lib/recipetool/create_go.py        | 730 +++++++++++++++++++++
 4 files changed, 1029 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/go-vendor.bbclass
 create mode 100644 scripts/lib/recipetool/create_go.py

--=20
2.30.2


