Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6646DC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:08:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web11.20040.1700662102286360158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=lWnkmQ4l;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.80, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsrimYufpmThxz6CQB+QHicKkAN0W6K3yvC2A8cG6fLzlv41AcFtH0EddXcNoQn5jV1Z6mSd1HpGSbhmXpG0Abn1uz//bheTzU0T6NxzcBTMUTxZ9tUJW0Pe9YHopwcaI6940PGq3yzC5qqNBdgy9Spj6S1A6F088kz0ZMVlY7ZafQNaEAtqVs/j9dOSzjYUu1QrMVX25aDmyai9CNmCgI0IkH2z02XiypF//82HkAb/HHyrEZz1BxLb8vJvyX2KECTB5QUXU1bHUUPq/Uz8ItGWQNnT/IdVwAXGD8T3dJNd94pdai0ZxnGV4lmtaTffVa9TDQ7Bz04C7USmD37WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTDX7NBw+cPsLkC6VnGcFnm7V5GFi4Ze3ABy2k5uEMg=;
 b=RelJmnQJTyvBxMF2cY3Be1jejU30Bw1uzHl6F4TlH0r2D4C+kFtyBOMT5keSUHoVJwDUHyfGYlMZkSoTFVzYo0htSsX6KuZy/nueCu4myynrC5AvP6+NhjtPVnjlIS3tOKpA7zB2PeidCJS0cfrzlnFW93W+ZTflmwp/NzjXobjAWDZtDNKGAMrrnnvLreWwvy/q7HsJD5auO9MlFO4E0xPfTLb5/a2RSqFmGsyFxeVxoVvl/44mWHEkCRSyYTwr+WnZZNwWMuJOYdEy3Gv0NevBUwINxrMZeOrbfDpkYkCUKUzGRx3UAthnDgK0z33j5koo6xewT87PTtxVPL/yzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTDX7NBw+cPsLkC6VnGcFnm7V5GFi4Ze3ABy2k5uEMg=;
 b=lWnkmQ4lCqp+gVyxp0vTfawW9tyO4Sv58jY5cZ5Kp5e+rFnVzcw4pQtdDxR77H27Zc4i+YXVljPZLJxDFMpxN9cU+O20Nw4YhAQampdTAHAFc+H76Xa/dostzXiIKtIVcYfOcjWxHQ/Bz5mJNHYf/oK2wAFM8RKeVlNMMWek6tE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 14:08:18 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 14:08:17 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v2 0/2] patch: reduce changes during patch refresh
Date: Wed, 22 Nov 2023 15:08:09 +0100
Message-ID: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS2PR08MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 528bd9b3-3646-4e9b-f1b3-08dbeb6479d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xFxrWXTSFsVdv25Bw2NeUk0fniNQmdwhoaiGUJBhjlj60y2HeM7X/8e3H4x/TBRnAMYUVSG7y4pVw5JmkRLTotqdmBjjcsGMdQkVq9sUkF3k67au4gY0GYZRAh1w2jlSqdbV9Elr9Rj9LIa2cp0sklk89wTR8GXZFQppjwjH+LZ8npTNgjoVFjTed6BPX1KnZ0r5k2vY36cHAXJdQeV1xz5lOtXPhuHcAuP6cXsiKd4KeTayQdSTbEZrVNQgapYzwoaB8wDlvbNvzk4VLGSGssSFsJgi0H26vQmCyn5E2BHKY7/uInPHNY84EEqKsKISY5xmwSmnWwQDqke4iHVF0c7yi+K3S//P5hHjNN9fDYkWsntYg1z49EpV3QgkKMGPkDWdef7pVogN27ucESaAIYgF3y2s9gxjdMo2NnYTGx6YrZxO5k5FQvd+f/xHjnbx3lmplgULA71FV6J9h0uJlGRdvsGDZoDDJDe1rqOgQu7VQmPJvSFeiDWhD1y7WEs1yfsYDrLGLMAPi1MWhb1pLR+t3oB0j8ANVC9GVIVHI6E2UahXnJJTTD/86ZvY4l1aECdCiA0cR6GuA8S4C3WiTi9oFQ9JnwN2rpeECb5XH6/tQmgEy3CBsCuRXlUNmVeg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(478600001)(6512007)(6506007)(83380400001)(66476007)(54906003)(66556008)(6916009)(316002)(38100700002)(8676002)(8936002)(4326008)(66946007)(52116002)(2616005)(6486002)(26005)(107886003)(86362001)(5660300002)(4744005)(1076003)(41300700001)(36756003)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IuQSB2j4O21YT+ss3e5xylLjSowBPWGc0oF92QulVbH0yHljeJUXnxUt63JY?=
 =?us-ascii?Q?KGKn3Qvce5tUC+N7BgBgTtDmAVahQtw9Mj4R95phKXH+mOkT0d+V9QnxKorV?=
 =?us-ascii?Q?ByfIZmFQ7Fbv8SaV0nQL/AqNb9PnT19ro7e1QSmI+oBuXHWze0uQU3ryRGEs?=
 =?us-ascii?Q?tPacmvfTVcCLF1rwdr117I93oJEZn3bfmLPEZkDPiL+VC++Hzvt5MU0lximz?=
 =?us-ascii?Q?YyHZy20+SuTt3vbD9E/zZ0kjzMeo06yIfZf92pWh1mjqUEQkniaHJeRpWJ0W?=
 =?us-ascii?Q?xR6UWWkwqs7TvewZeVHZFHS+4Z3xDsQwVmAmZ/5jqE94jfnsHw5sWb2cY2JQ?=
 =?us-ascii?Q?db7Mc5Rf1R3jMhjMy+wMsyqOJkfsAmHhphELhtAJLLM9g4dFhXJ+NauS0YkP?=
 =?us-ascii?Q?thRZiSqvbQNH5J5VPQ8qiOgzJfhiEMDAdeG3wTvs1BJZTIFvu9CURfX1dOe3?=
 =?us-ascii?Q?5/YWcbKSPGNG2yZ6qkxg5Tw6hFw+3APyJmI4cg9YTlfsv4myEQtzdmn1Pm78?=
 =?us-ascii?Q?oV77ZSeh+7i1S5hkr1kxICU0AO9S4mOdjrglegNFGm+K/Q4iPS9cHcXaSfNE?=
 =?us-ascii?Q?Rgcwd4szhbft3TRRw5yDxvL0I18SEUzdF5AvOeIHx9SO3QQwOfp0mV142Ao8?=
 =?us-ascii?Q?vQ3CSrkfp8jHCghgPELY12vc/Kn68Crl1rfifREgqCpvp0dUthJMuog72b77?=
 =?us-ascii?Q?8Oaws3iGOuyDPcJANf0TZCoVlXacdc5OWG1vHdwcg8ZqfJ/f6m8d7LuXaGqP?=
 =?us-ascii?Q?EO7MqLiYO/tkf6ocMWzxvEIK+C7PiXIQrGKH/v+Tg1eNIcOGBjs2ae+uWACJ?=
 =?us-ascii?Q?JgiFnmXLtrETQIZz0f0ki1CbaeqJgQit8IsBcBhoHaSsPjMD4lUyMEJZ2mYN?=
 =?us-ascii?Q?A0WS/zM9rzo2TR2i3LbdnAjUp2es+9cl9Q+ivMl7V4kvrIR4jP6ZLiBH3kOZ?=
 =?us-ascii?Q?IYf4qRikpzjPqR4FQXTexRAjH3VBMDXF7cjx9onotCq8dKEWdMByrY2dkI1q?=
 =?us-ascii?Q?FzSUEUiE+yYFCCaXg7D3wyDpo2W5I9WexUZUL2E/n4xqRT9YxURwwVwqsbn7?=
 =?us-ascii?Q?jxDnBHbylfTH6D79AZVOlOdDyuKueJ4fmvfxoxnXBZcxn9aArXK9u+dF1te5?=
 =?us-ascii?Q?Y4zFValz7ZGxgUDBE7SVv1drvWUf7ASHQtJ9TNrqHsJJeu2OB8LMVahsOEDG?=
 =?us-ascii?Q?WncqermlMWrZUiS6VnlmZC4gKYFKl1JR8BJPn3lpWppN39KdJenO1ProeJcH?=
 =?us-ascii?Q?p2d0+9RBuFLflV1j5MA+0flgjgK89CnmeD0KSaDgCYc/EnyopQJJE5VzG2/x?=
 =?us-ascii?Q?K+7oK/o0R5yvkdEXMBCKgb7yZFDb7eYyxcvwcaeYeGh7ensl9QxLcxpn3XXf?=
 =?us-ascii?Q?/ZwSgi1TwR/GChKAEVt5/kDtQUiUXMqd2c7Ff7hAuMEXGQsrJg/arC7KZHVH?=
 =?us-ascii?Q?FR5xuYF3+y4etU+wje+4qXGoDB5R20PuhcX/5rGCNQT6pKDv+82a6yL2imfk?=
 =?us-ascii?Q?i7pdRZjmwx9msrvtgO2nR0zVvGi9Ij5HOlYHmye6454rc26bzWD2wL29WelZ?=
 =?us-ascii?Q?+v7egH3JwNnOUe+F1ZxGyTKY2N1W7pgEO1P91Vgdw4lc3CHYovQ68PrXLuvY?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528bd9b3-3646-4e9b-f1b3-08dbeb6479d5
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 14:08:17.8014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJa2tGgPGXGXQaFPw6fMiP8t4NPhVJNX1/c8WJ8B8FZ14n9oxMBnL7/r1+QLybMLdMsyoLYARwSfjM5/rD+ayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191105

From: Lukas Funke <lukas.funke@weidmueller.com>

The patch series aims to reduce the noise in patches created by devtools. S=
ome
diffs are just introduced due to an update in the hash or in the diffstats.
These changes are not important to a reviewer.

Stefan Herbrechtsmeier (2):
  patch: extract patches without diffstats
  patch: extract patches with all-zero hash

 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
2.30.2


