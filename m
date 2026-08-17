Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8618FC5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 06:43:39 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.121])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24679.1786949015038686275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 23:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=jUdK++cA;
 spf=pass (domain: aspeedtech.com, ip: 52.101.127.121, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1V2AoUZZdccW+d0xQEtrT+VA0+pEYhhaptzUcFSonQvOLLluUagPB1C8JWW7JC3ojqpzEYmsOZijPSJKJ/pdVcM2MOLzV8TnHIUCP5g8qUPpvAJx6xJqhBZpr+BVNqjWjXFglVEwUfl039DDiH7BrVk4JH2ujei7KBMZy7sfoPqunIw1fQFjbtw1Fd4UL9FTVdB0g1jtNniCsg+iFc2TXkTruxWDKmWrb9FrAT9TKzJpuMBilqbBFPWScIyRkPO8UcX6rcd7ua0eriNHffnNJoFciLIwCBXGcblC8HWnY5GILZfMSruLQ3tjv8l5nmw+mjzVOmp4JNazF/cIfHxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhb17QGHGj2Teoyixrm+DS4EW5HodSmIfW4trzVeo7M=;
 b=GAvT8ybo6TkQEL378d8YjGrJDbFiZyd7CGGYhWLzV+hF56A5KgxeJ3O7r/cEUYgRIYObrmD5l2PcNlIf6bjFhfIK47Ak+mMRCuRwXBq+Lh0k18RwGfvA4/Lmd/SuILcifRg82ITT/9GHVPsuE9AiOlKBM3xaNMPksM5a2QYJLc6nnBTfaj0PVzRTIAFJKr+gsTSItc1O1yg5SxQIQ95hUHS/VHxHhN1sgTO7ispFJZh1zYgdWroNG4JYIGWDJcacgJTfaq9Mmk2vahXVggsJlvelEU1ev6dI3FE+2Rdr/HrcBcOJeOPIWd7dev83OHeVjS+gBGZBK/Lcd+r7LbF93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhb17QGHGj2Teoyixrm+DS4EW5HodSmIfW4trzVeo7M=;
 b=jUdK++cAG0hFY5lYys+3Aa2Cmc8OeTKVLICKgNVTcfWEWJZp7UbV/DFNx6BhHfh95YtlNbmRowY3sNJbeLwIzxcO5QwHJsoxYfPVz09bIx2SzAeYglmJtZdlyj/C1HoXoO+PZ2CTpO8eiyifbN45/ZapLJJ/NmnnH/H/R5LKcXuFQCGCofJdRyN3O6ZM2lEuUqFmcdQzr0IExUqSEiBIdCXuYsAh/0LLdo22YOSEdpdO0OfMHFi7fRo7vBk4wcJkPsah4/RZ/31chSvR0gYaXcim4gB+lx2+q2+bTv5wiHF95TB+2nFNTnjzn9eaYZnQ2MOLIvkxzNY/rYRnYskGtA==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB6781.apcprd06.prod.outlook.com (2603:1096:101:17a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 06:43:29 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 06:43:28 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [PATCH v4 0/5] devtool: fix standalone clone conversion for
 nested git repos
Thread-Topic: [PATCH v4 0/5] devtool: fix standalone clone conversion for
 nested git repos
Thread-Index: AQHdIM6uAQWEu7O8G0OxcM2jd3A8oLah5S2A
Date: Mon, 17 Aug 2026 06:43:28 +0000
Message-ID: 
 <TYZPR06MB4980EA2BEFAD03E6815F3DA8FCA72@TYZPR06MB4980.apcprd06.prod.outlook.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB6781:EE_
x-ms-office365-filtering-correlation-id: c03d1763-29c4-48c7-cc89-08defc2ad8b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|10067099003|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 RXQy2gBDwrvq3nkORO7/5FeF/Hftu2Pmww9thSa9c3v9V6vpg1wa07r/5b46MtTSvFrhXmws0LHx3cdLvUShEwY5QO0SRpvX1WD2sc4oPwHyAr3zDl7cgvtrluWaAbi3gfyhvn2/WyJillvBRdLI0VQDh2/8gBEq4vAgxD3XOlzRAbXzXeJwJUs8vQH2CMXTuHBknH0ejxMcFoUwa7qoB3yn3PTwLEf5B4w+jcHOQ+OXv7ufb0pCZ8sBUIJziyKPg8RqUH65LE6AicYHcbvAduEJKcCT80xlXLa7WDFA8XhtbqtXT3QC2pB6KUHUOqHblyvzkkrsdPoG17fMyIb2WBYvB56Bj2SJgtAxxYiykvIBouJZ8sWSl8d+z+xN4ruVYgDK2oAQIU5Kal5uaS23mCxQkdbwct39Ss/x1L2TFRljCUF1GhX+ZBSyCUTOR42y4ldDhrtXMPQWk8CL8ViY7MZJA4i0PtCiOrdP+FXUbfByTvT7O7UvGw+0QXzHCC/lnjMstSfIo4sLitpTxyOrghSueuCVwjeBtNsDPXOa8dbDqXC8ozzBm8U7vHO9PvbkCSNLQtem754BdTrhipZlJz+aqfnufgiYe7+OdPVG+7DkW+r6Z4lmAzHyF3Jp4kxevXnXMtAxvb2QQ2sz2r/eDubvxarWwdDLKiGUXFTT3gtoAI6mzYH4gtSLGrWMBT6MRevm6OjyO4sA4f2wggkciktukEwr8oAdY0n9+reCBZw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(10067099003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TpaWZ/TlrK6pV3C38yEXGl0XlZtljud/C58d/eWCvIXaLFNjyQoZGemxj+1u?=
 =?us-ascii?Q?XdCXSF6ahCTDM9LSFpg3P6dV67hLjhqV79Qb7npLsu4YgLeF3wWg3ZdBurnS?=
 =?us-ascii?Q?uX34TqsfFvWuJKA5CcFXAUH7AIdSS+gQjTE9ryv+vVp4+tuwKUIpZS0I3aQS?=
 =?us-ascii?Q?1un5ksccMywjnDVE6SmvtFd44qoc2UECnPZh1d+Fw35xzQI0CRn6+YtJDuzu?=
 =?us-ascii?Q?bGevzPN10lPdAFy3HM38fmp7l5JGA6R9iVwTIyvuUxildjsRvNGY75OS73Zv?=
 =?us-ascii?Q?oZuAvukVRbrOFBYnWls8D33QKmy2rN9S4GQOB707W5cB5OG8kG/OuAq+LmMO?=
 =?us-ascii?Q?wox9PjKxb246Xz6TqIKD0Q4okIpZZqemrHzwZkRXNQGeYtZXaceOvZgZTarI?=
 =?us-ascii?Q?4I/L0q9Syn0xKAOHqzSW1U5cGs+VMZg/F6j8MkfR7kt2KY0F3Fk9EeT36oBl?=
 =?us-ascii?Q?QFnJvZ2v5YtTGjOfcp8yWO3asUog4RFXIsOOGYmI5jGeI+dVRxACZEZPsBwV?=
 =?us-ascii?Q?9kj/ELfOZx1XHmo5metHkbaCaCpZdps3CEeLgejq3X0Gt89sCEHCK0Cx+UK7?=
 =?us-ascii?Q?RHDKouFOL3rSc6MmJgX/z7nUJgirRFanD1MNwgPEip75P7vqgJHmBO4/hG0Y?=
 =?us-ascii?Q?D6EVjxACWs48YD0775C53R5iakFqJoTXRy/igEvAby8j+RcbSHSVMp1sgas0?=
 =?us-ascii?Q?vAQARKZP1YAhUGUNwS3JF1CplMjfnRaxL7Wrs/N4et+4AublyMmn9Ob0XAWr?=
 =?us-ascii?Q?K0aqXbimQArbwKhdph1EUAVV8pW4tldtzc9rdB/AR33VJHKM8o+V1CjkAk/q?=
 =?us-ascii?Q?71lL/IZTurk+rShkFCOxKilzyP/fHB++N1ea213AZ48XjKGQa+xGgttWyfNK?=
 =?us-ascii?Q?WVtarHF1/ezWLNpQiVmQlDJp7mdlXIoekh/MtU/uIW4fBUP1M5M9OIILbpmi?=
 =?us-ascii?Q?4kpgb5SbmEBwP+IK+/62C1rbVCT7tVkGfi3KSPSCHiMEgkDHAzS4QVa8DCka?=
 =?us-ascii?Q?4tmohd5gq2RB4vTufuzVXGdByQC9YdL5nnfHn9KQmrlrSqM3qE1OA4ZkysIe?=
 =?us-ascii?Q?Hm8pX4g+WzcM31dLxalazZwslh9oY9Kgmv1cRkXUlHhTtjEzqh70gg7ty6x2?=
 =?us-ascii?Q?mkH2mougsT9YskmPtnnpczEfrm3sX6gF2CGxT2zSALfZrkGEVXppW6IGW3Ni?=
 =?us-ascii?Q?duZVafivAe3KTzd1kZBPjZPKzWQMwbX/HBQl8X8lichK1SvBMPRe2rZkdq7v?=
 =?us-ascii?Q?PujSNmB++zbgdKvF4c5V93xFEHNXy9gtvDune0sgNhj9cjK1aYCflI5SPpEE?=
 =?us-ascii?Q?TozBT18K6+lXy8AZ6w+56RXUR0G5Usx2ttDAhhiUfAOF5FxQ3rHrD0RcRtKg?=
 =?us-ascii?Q?B6vdqopJ+hK2rNxbQQXgxkSIXBqjskcAyPguHFvMBXILCv/CfDO8IXWzfZ7D?=
 =?us-ascii?Q?cQXh8FTU4/15uwth6g8Z+1d4Vw3yhRgMaVOr5MeD3/RhxmDDzChamxHRNDT8?=
 =?us-ascii?Q?vu9+LRjpTdHh7Ix5KLT881l+IJ6jHRb6W4mqJ7gC4Zxe0Ay5k+tKYcpj9Lw4?=
 =?us-ascii?Q?EV73pZzGfZB8694RBbyM9mZoUnxBp4L9yea6bx4RqM3C2psrIMzvQ2HtBZZZ?=
 =?us-ascii?Q?/vLGnGMyq26jBfgbD4gp3gvYc0gyB44gVhW5HRkUA6V1OamnpnO0RQnAemEV?=
 =?us-ascii?Q?oEmRYuxIMA4YM0DdGyODPXlNZcCaEJJvLbCXRbrvPu3GHHsvS57iXapHe4Pa?=
 =?us-ascii?Q?+hsKOFViUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	gZQobzCCrZIJuBe4XbxIwvdc0NujCw7vH7eI3/pMYytm5JnfUsvGw/r8JKClkJ528uH4MgDsck2WF/UqTSMjwmBcTq364L3PLVCCwpFtZSDk6PypuUlG9bLM+3fUowJVw+MpGddlymbqk+X7TGR9KLU6blkVKkVcVkyFEmErf0EAAr5Ch4hvcX7Jlm14gfMUD9VT9pxPSf0S6eUoXX4O9ivH5fg5q/ezkZ6UPovVbLywjEEYjoyPirT1dL+MM/av8NuYvd1O+/pVqUPrTcQ/uNIZeoGHiJVV/jObgxskLWDGW0lFrE1I+xrO49IXu92HDxyWRw34Wjaxf5WZ9jyMLg==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03d1763-29c4-48c7-cc89-08defc2ad8b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 06:43:28.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jSQQsjc4n/L7kFAIiuRsiClxb54wI8Zr84NLKQzePcRndwKB52RDgQMnFDX6w6qBH847bG/igiTN0s7hcRKyH8aMj9MBmiTDjFdlmVwpdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 06:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243596

All,

Thanks all for the review and the time you spent on this.

I originally ran into this problem myself and used AI to help put
together the fix. However, the design questions raised here have gone
beyond my own understanding of this code and its original intent, and I
don't feel I can properly stand behind the patches or address the review
comments with confidence.=20

So I'm going to drop this series rather than submit something I can't fully=
 explain.

For anyone who hits the same issue: as a workaround, use
'bitbake -c cleansstate <recipe>' instead of 'bitbake -c cleanall'.
cleansstate does not delete the bare repositories under DL_DIR/git2/,
so the nested repos' alternates stay valid and the devtool workspace
keeps working.

Thanks again for the review.

Jamin

> -----Original Message-----
> From: Jamin Lin
> Sent: Friday, July 31, 2026 5:27 PM
> To: openembedded-core@lists.openembedded.org; alex.kanavin@gmail.com;
> paul@pbarker.dev; mathieu.dubois-briand@bootlin.com
> Cc: Troy Lee <troy_lee@aspeedtech.com>; Jamin Lin
> <jamin_lin@aspeedtech.com>
> Subject: [PATCH v4 0/5] devtool: fix standalone clone conversion for nest=
ed git
> repos
>=20
> When a recipe has multiple git SRC_URI entries with destsuffix values nes=
ted
> inside S, devtool modify left all but the top-level repo with
> a .git/objects/info/alternates file pointing into the downloads cache.
>=20
> Running 'bitbake -c cleanall' then removed those shared objects, breaking=
 all
> subsequent git operations in the workspace.
> Fix git_convert_standalone_clone() to walk all git repos nested inside S =
and
> repack each one to a fully standalone clone.
>=20
> v1:
>   - Fix git_convert_standalone_clone() to walk all git repos nested
>     inside S and repack each one to a standalone clone
> v2:
>   - Add selftest recipe devtool-test-multi-destsuffix with six nested
>     git SRC_URI entries to reproduce the scenario
>   - Add test_devtool_modify_multi_git_destsuffix_standalone to verify
>     all nested repos have their alternates removed after devtool modify
>     and remain usable after 'bitbake -c cleanall'
> v3:
>   - Read SRC_URI directly instead of walking the tree for '.git' dirs -
>     also fixes repos nested inside another repo's own working tree
>   - Fix setup_git_repo() to register nested repos as submodules before
>     the initial commit (was dead code), processing bottom-up to avoid
>     stale submodule references
>   - Fix commitIgnored() to skip committing when nothing is staged, so
>     do_patch no longer fails on a submodule that's dirty only because
>     of its own nested content
>   - Simplify test recipe to three genuinely-nested destsuffix entries
>     (level1/level1/level2/level1/level2/level3), update selftest to match
> v4:
>    - Fix regression from v3:
>     setup_git_repo() now detects nested repos both for fresh workspace
>     repos and for recipes whose source is already a git repo (fixes
>     test_devtool_modify_nested_gitsm).
>=20
> Jamin Lin (5):
>   oe/patch: Skip commitIgnored when nothing is actually staged
>   devtool: Register nested git repos before the initial commit
>   devtool-source: Make nested destsuffix git repos standalone
>   meta-selftest: Add devtool-test-multi-destsuffix recipe
>   oeqa/selftest/devtool: Add test for multiple nested git destsuffix
>     repos
>=20
>  .../devtool-test-multi-destsuffix_git.bb      | 27 +++++++
>  meta/classes/devtool-source.bbclass           | 16 ++++
>  meta/lib/oe/patch.py                          | 12 +++
>  meta/lib/oeqa/selftest/cases/devtool.py       | 64 +++++++++++++++
>  scripts/lib/devtool/__init__.py               | 79 +++++++++++++------
>  5 files changed, 175 insertions(+), 23 deletions(-)  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffix_git.bb
>=20
> --
> 2.43.0

