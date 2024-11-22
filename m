Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D889CD75E36
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 12:38:45 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.72])
 by mx.groups.io with SMTP id smtpd.web10.23003.1732279121406569750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 04:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=P+XbkH/h;
 spf=pass (domain: kpit.com, ip: 52.101.225.72, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlawpqUgXeo1Wxx9jQwHiEE4ycpc7UvU7nhKRuyeAOf++1mTZ3tqReUvJVPLa9ZOyoEmzcJ8xPnNRDRe3KDo3gxw9jNPevN0Pd2eEz9lszACmrNvliK2jeVr13SX0w1yPYaZA5GsbiL1TcCkUIPwoDRzujXwOh2wE5oYGvI6hiOVLtN1JqjC8oegn77E+8dW77GbeRhqf+nhtOUVhiwQ1ymaUgdYCA4j6oOFu7ZI6eApociT9MIa0azTGS1rsT3Q2PqgWqkTR9c1tKdhZIyJ6DS1Y8AqqfWpBXNxYV6IOxffM6oddcWnpfijr+JTAk5DaTqCAV0yYWEmlFEFhFDAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1lKqOsvAlF9oiyeBCOKf5B32HYFjDgv1k9MranhIEE=;
 b=dM0QXxxo7llJnIcIyeoJVTb6rOhojbvCMulm4Ks8lPXQNaqNPxwHGZurGbpTuEM0kSlvidM2Dv8bc2gwJEH24/z5lty+kZQVpXXujN993Jw3LZwNKvEgPB4u+oGFeroDKMJ0IVBk2Dex1Y0sJNk/j2slSFm8kCSWKac2T12s0Na5jd43o0aaCvXcJIPhQlH1erVuhVD7HYEi0pidnmUm5XnPyCq0g0dZgMertC8OfNvp6hPkDUaPe1dw9jBrgIPlo3tU+xDIBeaNYMe5ZXR4QWTFfe4AGrRV+cN58SqJ5qTYkBTX9otyjobiBaTQKyJEcDhuQ4K7k5LLmSZBkFgAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1lKqOsvAlF9oiyeBCOKf5B32HYFjDgv1k9MranhIEE=;
 b=P+XbkH/hdvIAVi4gofLGtzplhJY71vDSP8a51Yc2Qg7F+yVfS9RefOucIUcM6REzRvhTp1xrDWTr5kuilVN+AWknqlykwWx1c5WIDIlM3H4+z/ij3850Xed+pUwMfLDT1wvM6paMNDxm+OC6FurrB+I0WqlRe+7LOyedfNqCHuM=
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c4::9)
 by PN0PR01MB5690.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 12:38:34 +0000
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52]) by MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52%5]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 12:38:34 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Topic: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Index: 
 AQHbJFpbHy++pk2/YUSzB73vGbvKOLKSbr6AgCw8pKKAAAMkAIAAESqvgABBo4CABGqvGw==
Date: Fri, 22 Nov 2024 12:38:34 +0000
Message-ID: 
 <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: alex.kanavin@gmail.com
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9355:EE_|PN0PR01MB5690:EE_
x-ms-office365-filtering-correlation-id: dcd8ef9c-f67f-498a-6865-08dd0af2943b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Xh9N54k0aoory8AIse1D4HlOmrbsWqldyO1H/x3Vv1yJaS9EaTmctM2QXAcj?=
 =?us-ascii?Q?F5s2urJhusVUzwdS/EtqkTxYHe/Ys2TMIIZEEsYovr2Q4CseiuKGtskAydPm?=
 =?us-ascii?Q?XoWuTSStaMlIIcpRyfWRCYHi0kEjVeJXH5eOy4Bc56ODFCUI499MAeQUpSRx?=
 =?us-ascii?Q?h3Ia87IhT8lHH9lpAxtB3st4WD+YV2kaKzvF9Ssnugi9ERXltiMYb07sqHhk?=
 =?us-ascii?Q?QVsOeyUaN85G5h4vl7onVS3nNCSdekJc4beaTV9wxt9f21XCpke+ZeePB0XM?=
 =?us-ascii?Q?Ooj0S5NDqKYUjdl9LnlwNDA1MzJZAMeltc0oslRPKAX2aDDlcb/EGxrxPVLI?=
 =?us-ascii?Q?+47z4hylwBH599smMF1P4Ip9vJAwqdHsIUUeER6ZP4tXzR0rv0p18xMwmN+s?=
 =?us-ascii?Q?H36yipLIY1itSD4Lp0ro4X6LVNwtjema1UXYs1ZHeUjvNT556+JKwYRwHodp?=
 =?us-ascii?Q?SSc/b+Xr9L/LGQgdIQ7xBibhqC3qP9XXSAnlnNGUYYFSAd/9xh0KA+bRTnOp?=
 =?us-ascii?Q?dY3f6f10Vzs4TG93nrN5BNWoIiW0TQZ5kFKLVd4TqTd76nkLqnij2Jjm9QDR?=
 =?us-ascii?Q?QHYhiyuI2USjy0L5FqSQ3Ynowb1LE4QfD5Y+Ji1N5P/8z2vJLo2UUoCt1iZ/?=
 =?us-ascii?Q?nD//usHoPEipxp33QLs0/chkhXG656F8FpdU9yHVdcghZEl18BCIHT0x95YD?=
 =?us-ascii?Q?vb2bue9MemuE9fyg3zs3LlHzLtOuUejQh/CBgwVVjvobStWhzxWgnWmmPHS4?=
 =?us-ascii?Q?yK/WLHANcVREEWbz7wth7yYgGt0Gl65nzq7to1cocLShs8kx1YM9by4o2wIM?=
 =?us-ascii?Q?tKmgFdXQqePt+QpoHVpxnC+XgXjxFGWpd5q0aIzOK6sc1dh9+VbRPMm4yVbb?=
 =?us-ascii?Q?fHuNAVsaoQUdPU9p/qXwiuQQsRuXbFdIRKEGaZpAhAQ0SDqboPvxg/TWViDr?=
 =?us-ascii?Q?0Dxy5sgf14lfDLW8EJ1c3zyIM35mV8uChLjL8sgbNBKfKJMruNalBe9yWIMa?=
 =?us-ascii?Q?gu5I5lFjML7bUBPRz4uy1DYHWHO9H2/MWN3zeqrvhiRJtsEyTXsi84fSdnRK?=
 =?us-ascii?Q?pHObOyttSKu5H8cWHPhjriA4t5Eu8n+a15LlHoPgGB0Z7jKOflWrQsh9Gis4?=
 =?us-ascii?Q?2FIzNvALnyFGZfCjUfP1o45/XAF6ulWogby8ROo72LiD6RYfOy4pDf3eMXzB?=
 =?us-ascii?Q?gFTgP2IA1XGj7oq0M55qJPgk2CiOUrY57JlgYF9LVgFJ3j+oaMz1vwr0Z8bg?=
 =?us-ascii?Q?tByI46CVcWpcengsCFTVfmglnCLhZHhRRrcHjg5qCionQA+CTO9RlvCENcOp?=
 =?us-ascii?Q?GBEiuzRD5loQKsAAd9w6l/b5?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wLZFXBi0MaYgy+0mb/VACi24yG5+PwBkLXcTuYm51ldxZskv5zLWbdlkgiWt?=
 =?us-ascii?Q?OzqvhjlJvAE+UwYdqvgerGpZA2KXJqaQyUNVGssl/CxoPMlp5NtZbfLsGIcN?=
 =?us-ascii?Q?N1ENg09JhOgo9tPr3LFuCftR7j5MxvfbUx5hQSuf3Sa5wSRGH8+bCDu1KmlY?=
 =?us-ascii?Q?9REZLimhctaamv6WdXay4tKYL0o0cW4XJICoJu4+oviL8eA45Ai7JvVQwL2i?=
 =?us-ascii?Q?aFmB/3latEL3GoCpo/+WkZHJSTNSoD66IzLJ6Ul4+Vy14zCfPs9NJRMAmGSp?=
 =?us-ascii?Q?VtpET4ADq95YMChUN/iD2QF+bfLtJRzR+KgSfgtnim3hrNB6WrdVXqP0m4DK?=
 =?us-ascii?Q?TCownNwNaYbiGINvVgOkN+vRxuhy5pOnHChmFuA35uJRc+9vl77vmUTkerlr?=
 =?us-ascii?Q?Z1uKNu9XmT/2V55kYSyqh0oIMgPDaiLgqh20R68cPirn1Uc0JWhY72wCkLF9?=
 =?us-ascii?Q?U6S33lWB3PRfXwt2Nj1Z3zeHX/sHs0QBN5FB4+HzPLtHhYRzineDvy670Zg3?=
 =?us-ascii?Q?DXInx45Y0F4nKxokULIIkGj8xAthcwKfLQXNNXwxZIhrAXXcEhO+saXjuWYN?=
 =?us-ascii?Q?s4v4H7bMGavgD19l802Ukn4PSm4isPTQM/NQvf0/w0i3Y5R+5Cd+UBfKeLRC?=
 =?us-ascii?Q?wGMTuEsLTZV8K+XcLfi2zL3Fdh4X6nIoKy8JMgby2YJLHh9TgcU0GCynvTo8?=
 =?us-ascii?Q?3MtjaOOoqOA0nUU8Nn/2FCxhPpq504VMyyM94Cl4tVVErL4EmHOFf4Fcpz91?=
 =?us-ascii?Q?REBaAC1/S7B/xxmQHeDa9hjsL5PiHS4QYnz+9U86L+/7HPz+lSosh+9lH8Ox?=
 =?us-ascii?Q?4JTz3DnDssq1/ctV9nimdHDE0CqWQbtU79QlIqiAZP9q6/1Y6Lg5JXYhKbHT?=
 =?us-ascii?Q?uIy9EiltANl0ML2qUJyZppTNoFmphh+T5e7VBc5YJzjvDsAtBiMcMUy+4/OW?=
 =?us-ascii?Q?0chP+dlI89KS1Z4mu6NJrbhEL5ofabsKSUl8Wk6sCf5zfxPa4imTgYy5epWK?=
 =?us-ascii?Q?/P2+ICQMY13XsL3X/WmS2ReCx+3SzQ6pgHBeo8CCUUCmFgUvoHPtei6xASOq?=
 =?us-ascii?Q?dGA77smU8UNPdJVIMHKJsDDSS7VHUg3OZGVT7ryq++0K5dGHncSLOJz3fNcn?=
 =?us-ascii?Q?RM8nSbO5VymUEr9pVbcjFMPeu4WP7165HV9VNvvBjUtl2tdrhxOebviBluGa?=
 =?us-ascii?Q?u49CgxYv0DxoAh81o9smL92lo6WWs72v9sNMoxGnYCvJKKueOx2nRR6CzmNX?=
 =?us-ascii?Q?uMMBrTSSkP2K1I4L3VPMsTsHt5FcbRBKYMtsPokQRas+ENhTzbaCy14cXXQf?=
 =?us-ascii?Q?RZ63YgpJ7yvTeyvaKAe521Z370UOg9Tj0SMJ1WSOb5nVn2XtHGfMOLkh45U3?=
 =?us-ascii?Q?g0xItOnZIR8M5L/Fk/gvpAbss9hQQVca3zesQ77tbzwV6foWRQS2QASJ7OpG?=
 =?us-ascii?Q?wriaURFezL54ETf6ssK/Njwu+rDbUfNfqlOESTsSL5XutNy/zFoKe0QJwkEk?=
 =?us-ascii?Q?lIMUR3ey0EROnqoc1wE1DmVHPs883z6ztGYIA0B2ekApiuWxvAqtFn6w7lmh?=
 =?us-ascii?Q?eKcyGkm+L0gqIk8Rpp8=3D?=
Content-Type: multipart/related;
	boundary="_004_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd8ef9c-f67f-498a-6865-08dd0af2943b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 12:38:34.1212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9wTmzNl7FnytZv//JXtUNyH7XFppEQnIRzGQlX9SMN5BmgX+lDrkNAfPg2ieqYrHC3wXxhymDVEMTd4LxZjGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207610

--_004_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_"

--_000_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hello @alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>

I have tried to run test-all but it fails:

make[2]: Entering directory '/home/virendrak/yaml-0.2.5/tests'
PASS: test-version
PASS: test-reader
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for yaml 0.2.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# TOTAL: 2
# PASS:  2
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
make[2]: Leaving directory '/home/virendrak/yaml-0.2.5/tests'
make[1]: Leaving directory '/home/virendrak/yaml-0.2.5/tests'
git branch --track run-test-suite origin/run-test-suite
fatal: not a git repository (or any of the parent directories): .git
make: [Makefile:885: tests/run-test-suite] Error 128 (ignored)
git worktree prune
fatal: not a git repository (or any of the parent directories): .git
make: [Makefile:886: tests/run-test-suite] Error 128 (ignored)
git worktree add tests/run-test-suite run-test-suite
fatal: not a git repository (or any of the parent directories): .git
make: *** [Makefile:887: tests/run-test-suite] Error 128

It fails due to libyaml source is from downloaded from dowload directory me=
ntioned below as a tar , its not git repo.
In yocto libyaml SRC is from : SRC_URI =3D "https://pyyaml.org/download/lib=
yaml/yaml-${PV}.tar.gz"

Due to this it fail to fetch code from git repo.

Best Regards



[cid:8dc09906-5365-4dd5-b686-c6a3e5ee9ead]<https://outlook.office.com/bookw=
ithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmEmai=
lSignature>         Book time to meet with me<https://outlook.office.com/bo=
okwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmE=
mailSignature>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org>
Sent: Tuesday, November 19, 2024 10:33 PM
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: thakur.virendra1810@gmail.com <thakur.virendra1810@gmail.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>=
; wangmy@fujitsu.com <wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.
On Tue, 19 Nov 2024 at 14:24, Virendra Kumar Thakur <Virendra.Thakur@kpit.c=
om<mailto:Virendra.Thakur@kpit.com>> wrote:
in yocto , Libyaml are sourced from https://pyyaml.org/download/libyaml/yam=
l-0.2.5.tar.gz

when I tried to run the test using above source . It only execute two test =
binary.

yaml-0.2.5/tests$ make check-TESTS
make[1]: Entering directory 'yaml-0.2.5/tests'
PASS: test-version
PASS: test-reader

If you take a look at upstream's top level Makefile.am, it has an additiona=
l target:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
test-suite: tests/run-test-suite all
make -C $< test

test-all: test test-suite

tests/run-test-suite:
ifeq ($(LIBYAML_TEST_SUITE_RUN_REPO),$(LIBYAML_TEST_SUITE_RUN_REPO_DEFAULT)=
)
 -git branch --track $(LIBYAML_TEST_SUITE_RUN_BRANCH) origin/$(LIBYAML_TEST=
_SUITE_RUN_BRANCH)
 -git worktree prune
 git worktree add $@ $(LIBYAML_TEST_SUITE_RUN_BRANCH)
    else
 git clone --branch $(LIBYAML_TEST_SUITE_RUN_BRANCH) $(LIBYAML_TEST_SUITE_R=
UN_REPO) $@
    endif
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Presumably, running 'make test-all' will fetch the needed test data from so=
mewhere on the internet, and then use it to run additional tests. Can you p=
lease try that, and see what happens? Then we can probably just use the dat=
a from that repo by putting it into SRC_URI.

Alex
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello <a href=3D"mailto:alex.kanavin@gmail.com" id=3D"OWAAM381214" class=3D=
"tWKOu mention ms-bgc-nlr ms-fcl-b">
@alex.kanavin@gmail.com</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I have tried to run test-all but it fails:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make[2]: Entering directory '/home/virendrak/yaml-0.2.5/tests'</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
PASS: test-version</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
PASS: test-reader</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Testsuite summary for yaml 0.2.5</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# TOTAL: 2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# PASS: &nbsp;2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# SKIP: &nbsp;0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# XFAIL: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# FAIL: &nbsp;0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# XPASS: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# ERROR: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make[2]: Leaving directory '/home/virendrak/yaml-0.2.5/tests'</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make[1]: Leaving directory '/home/virendrak/yaml-0.2.5/tests'</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
git branch --track run-test-suite origin/run-test-suite</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
fatal: not a git repository (or any of the parent directories): .git</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make: [Makefile:885: tests/run-test-suite] Error 128 (ignored)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
git worktree prune</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
fatal: not a git repository (or any of the parent directories): .git</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make: [Makefile:886: tests/run-test-suite] Error 128 (ignored)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
git worktree add tests/run-test-suite run-test-suite</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
fatal: not a git repository (or any of the parent directories): .git</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make: *** [Makefile:887: tests/run-test-suite] Error 128</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
It fails due to libyaml source is from downloaded from dowload directory me=
ntioned below as a tar , its not git repo.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
In yocto libyaml SRC is from : SRC_URI =3D <span style=3D"background-color:=
 rgb(255, 255, 0);">
&quot;https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz&quot;</span><br=
>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Due to this it fail to fetch code from git repo.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td><a href=3D"https://outlook.office.com/bookwithme/user/fcab7d9903984b91a=
5841c51f49bd5ec@kpit.com?anonymous&amp;ep=3DbwmEmailSignature"><img data-ou=
tlook-trace=3D"F:1|T:1" src=3D"cid:8dc09906-5365-4dd5-b686-c6a3e5ee9ead"></=
a></td>
<td></td>
<td><span style=3D"color: rgb(0, 120, 212);"><a href=3D"https://outlook.off=
ice.com/bookwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous=
&amp;ep=3DbwmEmailSignature" style=3D"color: rgb(0, 120, 212); text-decorat=
ion: none;">Book time to meet with me</a></span></td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Alexander Kanavin via lists.openembedded.org
 &lt;alex.kanavin=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, November 19, 2024 10:33 PM<br>
<b>To:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Cc:</b> thakur.virendra1810@gmail.com &lt;thakur.virendra1810@gmail.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;; wangmy@fujitsu.com &lt;wangmy@fujitsu.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest</f=
ont>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"background-color:#F7F4A9"><span style=3D"font-size:12pt; font=
-weight:bold; font-family:'Work Sans','times new roman','garamond',serif; c=
olor:#ff0000">Caution:
<span style=3D"font-size:11 pt; font-weight:normal; font-family:'Work Sans'=
,serif; color:#ff0000">
This email originated from outside of the KPIT. Do not click links or open =
attachments unless you recognize the sender and know the content is safe.
</span></span></div>
<div>
<div dir=3D"ltr">
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue, 19 Nov 2024 at 14:24, Viren=
dra Kumar Thakur &lt;<a href=3D"mailto:Virendra.Thakur@kpit.com">Virendra.T=
hakur@kpit.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"x_msg2739697503895351969">
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
in yocto , Libyaml are sourced from <a href=3D"https://pyyaml.org/download/=
libyaml/yaml-0.2.5.tar.gz" originalsrc=3D"https://pyyaml.org/download/libya=
ml/yaml-0.2.5.tar.gz" shash=3D"sT7/TfpeWpjnSTzW9PZ7yDwiIXsZ64hi/oBOx2WNy/fO=
GOjorf74qOo7xPTDkIxjGFqmHepJ+3q2CAEvfVkA7GcU080KCCv/EY8OKFBk425UcO1tOwhXevU=
P1MSbERpIoQ/91rpAj1AseW5WeYO8fz/WbT4G4R1y/1eahMERQaM=3D" id=3D"x_m_27396975=
03895351969OWAcac45923-aff1-dad8-cbcf-a0a89326bffa" target=3D"_blank">
https://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
when I tried to run the test using above source . It only execute two test =
binary.</div>
<div id=3D"x_m_2739697503895351969Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
yaml-0.2.5/tests$ make check-TESTS</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
make[1]: Entering directory 'yaml-0.2.5/tests'</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
PASS: test-version</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
PASS: test-reader</div>
</div>
</div>
</div>
</blockquote>
</div>
<div class=3D"x_gmail_quote"><br>
</div>
<div class=3D"x_gmail_quote">If you take a look at upstream's top level Mak=
efile.am, it has an additional target:</div>
<div class=3D"x_gmail_quote"><br>
</div>
<div class=3D"x_gmail_quote">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</div>
<div class=3D"x_gmail_quote">test-suite: tests/run-test-suite all<br>
make -C $&lt; test<br>
<br>
test-all: test test-suite<br>
<br>
tests/run-test-suite:<br>
ifeq ($(LIBYAML_TEST_SUITE_RUN_REPO),$(LIBYAML_TEST_SUITE_RUN_REPO_DEFAULT)=
)<br>
&nbsp;-git branch --track $(LIBYAML_TEST_SUITE_RUN_BRANCH) origin/$(LIBYAML=
_TEST_SUITE_RUN_BRANCH)<br>
&nbsp;-git worktree prune<br>
&nbsp;git worktree add $@ $(LIBYAML_TEST_SUITE_RUN_BRANCH)<br>
&nbsp; &nbsp; else<br>
&nbsp;git clone --branch $(LIBYAML_TEST_SUITE_RUN_BRANCH) $(LIBYAML_TEST_SU=
ITE_RUN_REPO) $@<br>
&nbsp; &nbsp; endif</div>
<div class=3D"x_gmail_quote">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</div>
<div class=3D"x_gmail_quote"><br>
</div>
<div class=3D"x_gmail_quote">Presumably, running 'make test-all' will fetch=
 the needed test data from somewhere on the internet, and then use it to ru=
n additional tests. Can you please try that, and see what happens? Then we =
can probably just use the data from
 that repo by putting it into SRC_URI.</div>
<div class=3D"x_gmail_quote"><br>
</div>
<div class=3D"x_gmail_quote">Alex<br>
</div>
</div>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_--

--_004_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_
Content-Type: image/png; name="Outlook-1bsmqorm.png"
Content-Description: Outlook-1bsmqorm.png
Content-Disposition: inline; filename="Outlook-1bsmqorm.png"; size=528;
	creation-date="Fri, 22 Nov 2024 12:38:33 GMT";
	modification-date="Fri, 22 Nov 2024 12:38:33 GMT"
Content-ID: <8dc09906-5365-4dd5-b686-c6a3e5ee9ead>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_MA0PR01MB93553EC00CC06C983FA1BCF19D232MA0PR01MB9355INDP_--

