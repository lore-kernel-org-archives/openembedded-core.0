Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30EAC531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:28 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=Jm/+Rgqd;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kzx9tNW4Sy1fpQcxrMb3t9to8mef63jpLgalr09eGrbNHAEZR8DbfCwVKBt6XqWu/wzTzJmKAZ69EpflRd+kTmT8aFA/1gDLxY2MXS6AqkmM+wUMMo+NI/Lc2QNYoZdiiv4ljiiNssruR/nmxgF4dJAoYrGmY5C0PnjwF2T5d/EoUUAJkmReLyE2Wo/EhudhJh2hob5lHGk1nTWzoP1KOUA/XMdlxLrPna1UkxhrfEPqko07RuML1p50HfL5cFsMyeI0939ZONbDDF5dQZEXMSRzXWIv2Ke20H9hQRDZ/VPjWIRE8x1uTT5eNuXwPod2HGFPmLk2LG0YbsW5BTAxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRuKzGGoKONajynN56fVFNS9uHo4pVYbYac1d5JKsqo=;
 b=Y4+Rg0WUs5bg8oMnt4GVhY8Uxjt2swV8+SHoGuGANYWG1wE/jJx4lDY/vnUgaZRMuI6ro01iRt8Ek5074W56wsJYBHOya2gLPuvJooKw051io5ih4ZgMFEIIvFG2wyDDp2JvQKduhcX400YRxMekI9V2vbm2AZP/mR60cJn0NIyUh1Wz4IWsPh+iVceAPIr6wLT2jWYRGm7KxoDVTGjCN2Ug7Z37oy/CixGJzNk80wHR0iw/+nwmR3mlLVkLHkl1XUtOM45B/E2C2V7eh9UzWQ9cgsTs+NskZpvo5fuwNmrdqZH8TqPmqSqjnTG5bkfediuTTAcFCujbWr6y9/+gyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRuKzGGoKONajynN56fVFNS9uHo4pVYbYac1d5JKsqo=;
 b=Jm/+RgqdZIsD120Gk14RPSlDX2y8pLoVHjov4whHvuc4o71KWeE7xiTVZLL4glXVp8C4qm1Hf8/clma5N4NcCCQzo8I+ORrFp4xT5THqoMj3RdgLGggQRXkRHVQmaOGW+6MoEod8AL2egVpmirhtDsNwyohmvwiYlpagiD+82iur0DPmNcZW+hucRYKwUW/LutWM4x/DxrW1wnp/7DK+cuoNIC+XEa0WcBqLtbASmaCwlM3go+YdIuAyn17g+jLFu3sy6X6qF+KZvVM0EVbFQF/2Y31rPoFA1yLGHZhgGRjRYbO3uIf4WXOBoY1+8HM4vz71aQ4E7o6E/WhyVBh8zQ==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:19 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:19 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 0/5] devtool: fix standalone clone conversion for nested
 git repos
Thread-Topic: [PATCH v3 0/5] devtool: fix standalone clone conversion for
 nested git repos
Thread-Index: AQHdGnrXVKZ0I3oHOUugCTEs3TuLoA==
Date: Thu, 23 Jul 2026 08:11:19 +0000
Message-ID: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5022:EE_
x-ms-office365-filtering-correlation-id: e649ef21-7399-4682-0342-08dee891f9d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|38070700021|10067099003|56012099006|5023799004;
x-microsoft-antispam-message-info: 
 46Nsf8PBf7nju9ZbQ5EeoJHqHWTe29m53D3noM9JpNIZlGKnG1cronn8ILA8odvHRzFVSn8NgJIshyXLOlEqISzSwtsmw2kQZOyIDGF5BxQPWmFas8lUjgShy8pndJDIC9C2UViG3a5UXzZEeNV7gwiNjUtUCfiVRFe9YNc37PPUobm/yO//I3xHkzyZ8PWnqo4VKHi/VtlmQS3SrMNzKdqwMx65Dkji5rGn3C3QfgMfV4G/bbSgiqgLwy8kI92VYXWstNNHq1m4J6h02wbskZzGcuYWVy4QdcX0h8ckRhdqjwUR44bzIztWJT3Sfk73H8tgBOjFUwwFZ46c1Ql+hSwFj+6AHMI1KrKCB1w6UrEYAI8h1K2bXK22Z6xMNs/3v4CjfouOPQbuLQXJzWueDFMtYm8aoI5m6PJ43vTMvwKd+WwmSSZwmggM3SpV3QpK1MNLKDVuMbxnKv7IP5BW82W+JmCtV++1rtD+aevqoeuDY4viY4o89MrGTcsmk9W8EVAK40to8exOW4U5IviUcQzeXSbmJ0cBY8rQTp2vq5dKBwqGuLgavjOSq3GyO/iIyaiZYIHzTGtjka6rRH+kqF4ARnaxGpaglEm54zf2T+ZVnlSptzj2gUUvCOZ9V9DNLe9n/LqHMr3itEW6SrLhhZ0vQCFX83ZnrsYR/qEnxIdYP6Jp4l9Oo1oUgdE/xva4lNWgYiVn9zXB7avg1dCkNcvpx9dDn2fYOvJdH8ctkmU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(38070700021)(10067099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vRwCsdW+iz2v59XeZt9gRJaPJVzAGyRbmiwSlHQ/yl6zxIN/mIkKUkNNC8ux?=
 =?us-ascii?Q?l1ISa2sVDt096P6ya0txCHpA3EonzN0bRsKEJcQt/EcV4VDTiQRgOTqpvpW2?=
 =?us-ascii?Q?v7iMvaiYQi8mdswr3KjUSUKgeo9SPpn7N3TMjZW3OQKL+PmjDeZjWGxYHhHP?=
 =?us-ascii?Q?TNlXFjcA3be7xpj7TWMEoIS2AgR5OQmrcutjHvTfNtF/jj+E3S0riqL+DEg2?=
 =?us-ascii?Q?jqp0CE1/6acjEOuCY4wbC0j5mwUn5CkQesAPTpyE9J7MK8N5H7Ghupx7XB8Y?=
 =?us-ascii?Q?jL1nDGK1gDGU/oQpVOEydvFbWmtxPFjDECjyr8iS0U/E/7TNWeDyJcpZ9FG8?=
 =?us-ascii?Q?8BtWFw0lGDexXlEhZWVmAHnmHoU1+wToKbHXj++Lr+WoAthplcOmaoWk406k?=
 =?us-ascii?Q?i8FNvrQqNxshShnhMpdcXzLPLxRRTIXlaXaGD1d+g7HcHPtR3vrrapxJKUDy?=
 =?us-ascii?Q?UyOomK7WPEWS39WR9octkdcc6ND3wJCK90hoDkfjLkCcEsNeYk3b9QN3k5Fd?=
 =?us-ascii?Q?fAs2ij+eAaqXVd/3T2GpphfdghThUNMRKFr98LSnxYoy/L8vNEhtqwmzi25y?=
 =?us-ascii?Q?p8tvzFh3xlV4W/0NWLRzNjy08bxZmZWN0Ac0Lr3xvCbvuSxn4QH9ED1LP8O6?=
 =?us-ascii?Q?2hUlU96sPLlljhjm4ZrYbV2Wqtq/oAVgz5qLZxoLTeeJEbn3yEIWsWLVU22F?=
 =?us-ascii?Q?XkIRjSo060q6hA/9QZYXl0WCH30UyLtmnri8FgKx1YovCZogsPHVH6ECO6aQ?=
 =?us-ascii?Q?KkTk06wnfZ0YAOQ9NcTJasAZCp3B8cIzRQgpyiYLXo9u1iAKgfg71COkKg6H?=
 =?us-ascii?Q?MVaDmusyM/AoBQRC93jOWQyPco3Oz1jyJBEv6GyBxb0jspBrgnNF9iZbtoUM?=
 =?us-ascii?Q?ZKZ8fi/1LSZo/vVjQ7cVUOCCHO/w1XxLNnygnktMJXlkz+605U1ovm+7d4lj?=
 =?us-ascii?Q?SxuMgt8ZYNfOWTTe5AJ5rgKNNIISfolTO23mxTkDuyGvJ8NnkczzpZI5p0NI?=
 =?us-ascii?Q?mxu7XjeS5oB0nKz6CT6DTv/EK/mSoLdg/89PTNxdOHxYYLaJowsmtS31ypWX?=
 =?us-ascii?Q?T3QhKtZxe7aNtoa5KH1FtMJnbQ00WIySuePgoRMx18Z/91JuLZWJ/sBrNfhe?=
 =?us-ascii?Q?AV08aAo+8S0nEb7dXas+WL+H/e8oFhw0ATcWrO3OhH2Ufp5OYcYUKbyOnCRD?=
 =?us-ascii?Q?boI5XCOZbtfTvhrgFv5kfQZDERl0pWSSJ9a7K7p8g/qGbGnLSsOknDuFi7yJ?=
 =?us-ascii?Q?mJmDAEreFApghIuDjsh76EQYNnW++xyn0J90XGjWItIt6b0zHdl1KJfGGd3u?=
 =?us-ascii?Q?bNW9SslulXih4SEl9hnj8X5c9abtHDqaR/0kTaWLnCTu2Jy/ya+f1ZyWcfd3?=
 =?us-ascii?Q?ulKMNhVkvkB5nyDHWlKnyh9X3ZMWVg5fEMpEwxFjPGgv+edKtT2dXcWgGRmr?=
 =?us-ascii?Q?vB7haDrA+XsDtF5e3AB9JA/m4o9ZfyEkVP9L1WZQHs1kfuyJCRubPUD+y14y?=
 =?us-ascii?Q?AW4oJmiahA2vvINeEBgawcie40ateCzqZ4beRCPq0R9xBMuiL/aVgi8S5urW?=
 =?us-ascii?Q?r1gCtCxtl+04S9KOq5eF1ywpK/sV8DVkF0qw7+UgZYhe7MOPAoE7i/vvpNbe?=
 =?us-ascii?Q?4OKeJR523wOXgluezrkFOk9N70RiziuOl5icQSQxdE5MYEpEXnAxUDTX9b8e?=
 =?us-ascii?Q?OxO5+EbSwRwyMjExQ0KODySd3C78D3kUsReJyejEtwjvCT7Gx9JP5zeKSO50?=
 =?us-ascii?Q?6wK3fqAohA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fmi49WtLJuamCANoV8YW2ufyouHGaKNWxN6hRgovKBNZiejrbnfafqkVgAxdOSppyJ1NyCilXT1GUpT4FLccRupZKQ0p7PRQB0kS5F+wku4qUnZktDfKKLd4R++7RoG46jOgGWPFkcGQ6ln2w0UKCZOOjamkA8CqO/EjkfStSuDJ2L8kPFsdiJ8CNr2uDzlWFnz8RThsykVGwrSFmM17A6MMusYzrYY7PtPL2nQ5bt/II1ehMkdGJUNDmXAAuFwjtFNpfalS2ADd+f+YIwU1k2r8qEx8FPviWRAL0qBB2d+AB4/M9l73d6m5qRV2ZlHkEA7X+HKlOzXJHtlf70QkHw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e649ef21-7399-4682-0342-08dee891f9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:19.1958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urUNEw6QVBHfhUYUMZDxUPimbBvNwvV27GPhT97dUeKy8fBvCSvAIw7msdO8tWQhGVy9ra7pTfaU50a/NQAQrhhUkZimJjWHFZy2MBHCF9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241783

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
=0A=
Jamin Lin (5):=0A=
  devtool: Detect nested git repos before the initial workspace commit=0A=
  oe/patch: Skip commitIgnored when nothing is actually staged=0A=
  devtool-source: Convert nested git SRC_URI destsuffix repos to=0A=
    standalone clones=0A=
  meta-selftest: Add devtool-test-multi-destsuffix recipe=0A=
  oeqa/selftest/devtool: Add test for multiple nested git destsuffix=0A=
    repos=0A=
=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 27 ++++++++=0A=
 meta/classes/devtool-source.bbclass           | 16 +++++=0A=
 meta/lib/oe/patch.py                          | 12 ++++=0A=
 meta/lib/oeqa/selftest/cases/devtool.py       | 64 +++++++++++++++++++=0A=
 scripts/lib/devtool/__init__.py               | 64 ++++++++++++-------=0A=
 5 files changed, 160 insertions(+), 23 deletions(-)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
-- =0A=
2.43.0=0A=

