Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA75C55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:49 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=EaUsyJxg;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM5WjC0jjk3NhwLTUzu6DBLfxYS5qRPTEkIA3er2eRAcLzZVMRVSmn0Neu8uYMAuUMGZqK6KCQluEGwBAEd+b4vqpgPbK4psrNcCYNaLzW5b5hKhoRnZdyjRml4R7vET6QpV8Rx0GNHpMYxkVpfaFd+lV1BupmvMFf7Cfo0vwBT//MLL0DRSXaCLJ3AHZ0t8vcXe+W5JESyg/uECWqP1ZPinskzBO6iPEH67UK0vjYLy11k1pdoGuzIvtKLMlv2S4PyTgVVApwjxI0RFbEfPOJNd/d3DeCtSQrYenQ3p1nxiHdCmJiXpxPLyW5BevNpe2OiNOYZy5/vb92FeJWX7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyEfFPWP6/U4WCD2YvX4j/FHLfiwPPovinHuWQqoRfY=;
 b=O4NnVhYjNTXRORbTNGTVeMXrxijW1LjVNnDG7nkQmXQyxvRgyKHGDeY0nVfy26XgWygKV7VVidgdTWY/hNAM4Mk8tgIk7JC8SyMT/t79Qj25fQmqNU04p8uHWbcPZvB+iGBFQheKXLXQA4P+AyFywA0KfkcPzMl4AKOUPK5+nnxjRDHrYYiQOJ6x6TUYkd8XJBGr46L9R6wE/ae6Y31cgqaHAKpaluE3plkm6LPO7b0suSLOZslrcjE5bQtpZzIiodlQcPP1QtS62NYbDb+hQpnyuVClYK0gn89z63T59K346btCeerqfzp89gp4T2ZSQmJXTonU8b78GwuDhylmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyEfFPWP6/U4WCD2YvX4j/FHLfiwPPovinHuWQqoRfY=;
 b=EaUsyJxg+v6q5GAjW9cEYFZkZdw6jcgHUDSMLVgNE+6bXvRPyPKCKbOi0l2SrASOBSkWQKG1q1vjCoptIMI04zjrHQHPGYwbYg3dHH9XU7+SByt88Af5VrMIMoEFpp76xXw55NtuWrdkzreFe/0h14pXliHyTghpcZ+0+j1HqM4oA0tmXEg1CjuzJ7L3zYrqKAup3Bw88C8z7k9JgVcK+VMRfNENYu0eyJqu3JQ6djlPJzSx7SXIoUmJ6kn5pUlbT+hgzpgbIdAtlm6N9tkxHNLyZiHysz0o9G/hN5+s7HbJnSSPotTbq7zTfry+BNJwKm3V1fhfnbyzeAsrRMMlsw==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:35 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:35 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 0/5] devtool: fix standalone clone conversion for nested
 git repos
Thread-Topic: [PATCH v4 0/5] devtool: fix standalone clone conversion for
 nested git repos
Thread-Index: AQHdIM6uAQWEu7O8G0OxcM2jd3A8oA==
Date: Fri, 31 Jul 2026 09:26:35 +0000
Message-ID: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5295:EE_
x-ms-office365-filtering-correlation-id: 21d8cb6d-f442-4d80-60e4-08deeee5d0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|5023799004|10067099003|18002099003;
x-microsoft-antispam-message-info: 
 aQ5gH5I8cLGyQugQmsYQl9Vm2cESzE9/N817+EN3bfzidS6JKPW9FjnzByb8AWDGbza4rO9dTYfFC10WCHQ93uJG1Jtz+vO6hlEUP0dFuXX3RwFJD+7n3+uMUjl3VXK/rhhNzzC433S8mOfXx0ECfI0gDTj6XHaVxWib1dfmJ4cm1dcw+S+gcyXhf8Ozvuy61FsHeLdFUBNx9XfGFLr9iKhJBj5306ZlivXa0bjmWF3NEmTm3JzQLihONt5fllwfAg0XTH/j3hf+oilEwdH5j5X3N31GnFqNsKir+Elw0gym48WlW1T9tcnthFwPzbVZL/ZwSLUgMpMZGJXBLds11O0Mdf3Wx2GtEhFrsU6dgepwOxuEq9+9Tgm3UKAaiVaO+qce78R/Qi95++TdqzsThJVrF3CgavoLq5vFFW6agZc4wEU6CAAEhCGclPrCics2mKJAueLwieMIxOzckDeJV1KoJ9PK9vBemaqI+KUDQB3D0ab7rYGYxdrMTl5TXrveAkQRF4gNw6ZpfgNZQqpKRYFL9AAtw3P87xnnIuA+mOJVj1FO/IxCS6xSpGckPymS/2+otjYMqeDmUSzn5d2bbAMHGxjvUMcZSGdKiHcoH8ulUpfCeJWrSRGmSLpoyJ9kF8hAYUUaRMZVSiiQSrzDEyup8o5xHrMBbdWz7sAvhxahtFwxQsNen4G4MrlMh3hn+4QIkkjBdsbnB3A8OaqzrrpOPyJHGnXApPJQ9d31Jec=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(5023799004)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GBVEbkNo7Xua3WZfDvCEuHY6UDfXqEsslL9rMWgZz9AkNYSheuC0wy570t7N?=
 =?us-ascii?Q?ywBqij8XiU61p1whZuym7+2veT3m3BH8SEyCVtEJDmUCVL3nmII2yPRJu8uL?=
 =?us-ascii?Q?2bSgenzZg2SXwl8Ktq/c/c1jSyVhFzOtrj1dtYzET0xK0FTrE1TUvHzOVb+Q?=
 =?us-ascii?Q?oeI+Dkmf4xByKMB0/0igip/LdhQsYnZh9XxshewEvFi81Q+/pAW0gvch568q?=
 =?us-ascii?Q?wvAsTqde7DS3sJeci30+fiaYuI+uecuDDFLjqDJ5HWSFedEypQQdCc/5+nnP?=
 =?us-ascii?Q?WIaE/Adh+3FhvTXnLM0gm6d4blcN3CBoDUeiy43fKCU3nDzZOetJbG4pJR7+?=
 =?us-ascii?Q?t/2C/J5QeqF2gsB2mWdmjG8lg1vpTz3rQQ503Y+bqHg77oyTte54D2jT4pbH?=
 =?us-ascii?Q?8/SxzEgmE2UT432igg8ZEDOst1aPKtpU1ehCYZazBzB0Q4BcEJiFsS28TK+F?=
 =?us-ascii?Q?RC2NLh4u/gT5jYnJIWIsucue2w40uqle4E++UHOmd7UOTnUzvYf/kK0iCW+L?=
 =?us-ascii?Q?dz0oeUhr8s00MujhQ8INmSslC2xstHCx9a6VouBnRvpuGU259d92vn+yDPwm?=
 =?us-ascii?Q?XzmYTkDmCeIDD3P0rCutZwPQOt1rM6RvpWWFhHuUYIl+/rLOuUMiVaElqIvz?=
 =?us-ascii?Q?cde5ZcgIGdPfQMrJcMZnvn7IJJI9AqDDUgSTXQm5CsDq+yAh/fnUz8rPQuvd?=
 =?us-ascii?Q?G0pBjgz7CYpzOVkLNpGBWCVqqNX1ZOztoML2oCttXbmwlW6mz0g1QigDi5oy?=
 =?us-ascii?Q?GVwR2HtcTk4yar/5vT7xf2G5Opke5GtdZxUl6biBgqZLHrStbYH+CLnAWK9Z?=
 =?us-ascii?Q?CX2NJsFDwUcwToX4yYxJcGickXMsYtGI7P475kFJzG9zF5lm3HbDfsU13dqq?=
 =?us-ascii?Q?v1W4Xl1JbNirbkGOn8EbuJHfdczfFujkTUCv0XUA7ovZy+YYn3sL4RGcU/+2?=
 =?us-ascii?Q?7fU+hUm9So4A5F2PpHLifRX5MHWFJz1mWyznSwa75lpGy3kTXuYUHoZI2944?=
 =?us-ascii?Q?1++vwZMeLpjnaRAt15GtHObvu0t8NfnqLucYqBXTf8MjztpEDuw7Ced6q/VM?=
 =?us-ascii?Q?mNRS6nX/5N8PAUjPgE4rIR+Q4L9+QCwrJ1LHstzRAvQnk5CmdpmJQX+A9JBQ?=
 =?us-ascii?Q?Kqc60yZpvK/wIQA42ipy0xo3bdhaVZlJ+TvEzo1mDJUa9FjG5L6xB9ykISBC?=
 =?us-ascii?Q?opVAIYtLEwv1NALj99Bg+lHnjzDzfczwcBPJ6Sqr4tjuc62FT0mEJdOR1S5c?=
 =?us-ascii?Q?VKp4M+YkryT+8ozP3jtaLVilmu0OyJ+SQP6HueSZy5v68BWAqTR4XDqkbmyM?=
 =?us-ascii?Q?PBvwT86b44i+9z7lNjwhULzxCy/IMFVt4YaPT+tOzgkitVBUIQovUwR8znjN?=
 =?us-ascii?Q?nCKIFv39ILRoGgBs063P9zHlGFFvD/1hcUbNIGfWpREi0+NGzhIekqdE0XlX?=
 =?us-ascii?Q?tkcAcGC03+XuOGDpnA2CeMBTO/OSyHBGR6pE0x1YG+m6GcRheLieGl97O49i?=
 =?us-ascii?Q?FqlPwaotdvDAv+WYMzmxA+RjiTfczosb5cr+clwgt6qFtT4LB3tqJtl4iEZG?=
 =?us-ascii?Q?arAb1qA5lXpBnC/zZuT0dPPuaDv8z+MN7ZVlC0MJERyOj2I1T/I4gEPtYsGv?=
 =?us-ascii?Q?MrwqnPY3ruXOz2qEhRaJac5fnf+HP37A11pDaFn0Y5btVEqXDuo5+qVg6BWg?=
 =?us-ascii?Q?BiizAlLuN8ZCS0fD+k/gUSpQEvGl7xGM7DDW/Mlj6AJUlq2EkDooJSrd2y0f?=
 =?us-ascii?Q?ZzMSBfBXPQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	k+JyaHQBU/dcmmmXTWfWAppQ7hYCQMcmRBpiGk98VWgVMyfi3Hm/Xs78xcMuxHbagE1kKb6MPcnjf3GcZ2Zj9LpMoc/pBn3H3gK3XxA2KAin3yJVvPhxqbx5t4zBKU0tNjsdjqWcpAndLdDxS8bhpSUSKM/Vi2MyrulQmDfqzFaS8uqeGrAnWlDrwlvsaKH2HGnA+kvzooZ3xjUTp89vtVpBbRHbwRU437KD7Sr++YVObw6XvRSm975vUziE4wEquXqegYIUkvKlfQbnOt8Zw4V+wqSUotmpGSb5ppMNIUJ+TvyNlw2FrCem+ao0ryvbS24X1/HDclVTmKvpewUEPw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d8cb6d-f442-4d80-60e4-08deeee5d0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:35.3651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJE8XTng9EsrC7t4yyhKoph9U80X+Hw+b62K5JmqzEiM1ca4WUksSA7ChaSBRx7TQrGaCk379yOkZcnHopysvm6bRPd8Io/zrJfEmo5q7b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242412

When a recipe has multiple git SRC_URI entries with destsuffix values=0A=
nested inside S, devtool modify left all but the top-level repo with a=0A=
.git/objects/info/alternates file pointing into the downloads cache.=0A=
=0A=
Running 'bitbake -c cleanall' then removed those shared objects, breaking=
=0A=
all subsequent git operations in the workspace.=0A=
Fix git_convert_standalone_clone() to walk all git repos nested inside S=0A=
and repack each one to a fully standalone clone.=0A=
=0A=
v1:=0A=
  - Fix git_convert_standalone_clone() to walk all git repos nested=0A=
    inside S and repack each one to a standalone clone=0A=
v2:=0A=
  - Add selftest recipe devtool-test-multi-destsuffix with six nested=0A=
    git SRC_URI entries to reproduce the scenario=0A=
  - Add test_devtool_modify_multi_git_destsuffix_standalone to verify=0A=
    all nested repos have their alternates removed after devtool modify=0A=
    and remain usable after 'bitbake -c cleanall'=0A=
v3:=0A=
  - Read SRC_URI directly instead of walking the tree for '.git' dirs -=0A=
    also fixes repos nested inside another repo's own working tree=0A=
  - Fix setup_git_repo() to register nested repos as submodules before=0A=
    the initial commit (was dead code), processing bottom-up to avoid=0A=
    stale submodule references=0A=
  - Fix commitIgnored() to skip committing when nothing is staged, so=0A=
    do_patch no longer fails on a submodule that's dirty only because=0A=
    of its own nested content=0A=
  - Simplify test recipe to three genuinely-nested destsuffix entries=0A=
    (level1/level1/level2/level1/level2/level3), update selftest to match=
=0A=
v4:=0A=
   - Fix regression from v3:=0A=
    setup_git_repo() now detects nested repos both for fresh workspace=0A=
    repos and for recipes whose source is already a git repo (fixes=0A=
    test_devtool_modify_nested_gitsm).=0A=
=0A=
Jamin Lin (5):=0A=
  oe/patch: Skip commitIgnored when nothing is actually staged=0A=
  devtool: Register nested git repos before the initial commit=0A=
  devtool-source: Make nested destsuffix git repos standalone=0A=
  meta-selftest: Add devtool-test-multi-destsuffix recipe=0A=
  oeqa/selftest/devtool: Add test for multiple nested git destsuffix=0A=
    repos=0A=
=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 27 +++++++=0A=
 meta/classes/devtool-source.bbclass           | 16 ++++=0A=
 meta/lib/oe/patch.py                          | 12 +++=0A=
 meta/lib/oeqa/selftest/cases/devtool.py       | 64 +++++++++++++++=0A=
 scripts/lib/devtool/__init__.py               | 79 +++++++++++++------=0A=
 5 files changed, 175 insertions(+), 23 deletions(-)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
-- =0A=
2.43.0=0A=

