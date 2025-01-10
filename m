Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E515E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 09:26:58 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.66])
 by mx.groups.io with SMTP id smtpd.web11.14740.1736501212612600811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 01:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dF1eH6a+;
 spf=pass (domain: siemens.com, ip: 40.107.105.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrFHXejMY/WcAP+5ur+U5q9J21FB5oqqLVIuGzQ3WJ7qUylqXYV4rwL1rK9mYT2OaLwE9ziuh/YL/QgQEggN10UFxWLvj8Q5biWT0PfX5kUT5V97vYUKgHnL0Uh0vl1xkL16o4Twp1p6YS0yLuqg/abUQedsvQTl9kqiRUC/bj6Vv4hypliPBJxZ/vXlyJTqsyMyQbtExoa6DuHZRj0Wdbpcqx6mzvSFUbakGuZ7f6RxkkH2YFMZpbcRQ+5GOkp/wR6tBV1Y92sQolOkGAKwN90Gy00z1t9bWWYbJ2eGuwTKKRT0V2WCxp21+J4e5jdKmiJAG2l97LYCFsic02/WTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89EavkBxjgJpzv9liGipnsWGv5HwyF8fcGC0OvCWvAA=;
 b=jkNoGM5h9M0NoSX/3g8yNrDYanfLUsaiJgP5SFHnQmY9xiUYChC5A20wUyydONwAziJluvsOvR7UC1Y0QZCHwoh+HEfkVX5naasrN/94fqeRIkzHnsXd2oLPXzFpS4OQTY371IotuvlWJXxpciChWgGywysxTiOMLs6b1x29k+2wE4FG9hmtD2Vfy8pss08MKAcYmK3ezxoRLaGx9JsfNRzpQ2ydmF4i4HNSMeaPWXDBunB/3aP0lPKEWuVAgkcGulpRKaZ5ZGooZtHaqaAT0lY+3GujjepbojLwQBJEF76awWVixuppfTprR/3EK8DLdgwvszaGGsgz8VdblJ/6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89EavkBxjgJpzv9liGipnsWGv5HwyF8fcGC0OvCWvAA=;
 b=dF1eH6a+hHBmy2G7w2NcOO263gxeyUTdLDH8GSv3q1dg0+SaqFz+oRP4w0EtcV/nhdttgrdbEzVybIYdqev+unuo5LeubDCvuwEfTr5TddRRCstoAdh/rYOd6Kp3mQAypPYnLdwFHdQNRfxDw+coD6B+Yvu9DZvhJRttkvh1fUvmRq4t+tNqu61lbT4WApsN4B4D5Xl3jG2ZETpkSZBo4QxQtZI6drM+Lwf/s5GwJZsfFMp45jw14oQqd+F88cpN9F43h0o0tBnTJM0yrcPAFfKCatTMTwOKR8hHukTIABG/at8cZ+IPzTPDJWQ4p65Mj5ENAxitSeRtqj+Bx3skJQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3517.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.6; Fri, 10 Jan
 2025 09:26:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 09:26:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "colinmca242@gmail.com" <colinmca242@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Topic: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Index: AQHbWvA4guQ8bzoGTkiOEX1TDduSq7MPvfkwgAANEMCAAAG68A==
Date: Fri, 10 Jan 2025 09:26:46 +0000
Message-ID: 
 <AS1PR10MB569731535FEEA9F688D90067FD1C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241230192224.113886-1-colinmca242@gmail.com>
 <20241230192224.113886-2-colinmca242@gmail.com>
 <181947C8BF47FE99.17938@lists.openembedded.org>
 <18194A5A622A45B9.23974@lists.openembedded.org>
In-Reply-To: <18194A5A622A45B9.23974@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=917b2880-db5b-47ed-832e-4b3abe5592c4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-10T08:30:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3517:EE_
x-ms-office365-filtering-correlation-id: 1c88406f-cead-498c-e391-08dd3158e78d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qUZM2jqVlACEZwxbdKTrj6H3vFLc5/guHMHa7fRrYatgHIaGVYz/ouIEh3U2?=
 =?us-ascii?Q?mXPKIfW56JR8Ttf71Uqbphr8sXYsbpGKfqFkEau+bm9TostWF2GAZrj+DMWg?=
 =?us-ascii?Q?GRf28YICiRHSxovCY7YMPve0vHDxi8WwkPbwd/FOzPJo3sSYErLOqoLPXueg?=
 =?us-ascii?Q?E9HgqCxEr2Rbv6/0VT7G6X2TV8da52/C/84lQQMnXtluA25QpWsWwq3OPVcW?=
 =?us-ascii?Q?VQKDB1ME3ECIEsZRR8LjKPwzLJ/7pDdQqivDhtd8pdKSCYIzmaewpxEDal5U?=
 =?us-ascii?Q?XY5WPux6cRHPSr91L+o54JXwZLv2TODWGgOLV3omAJT/xT8PlmjuN4rKFQWR?=
 =?us-ascii?Q?DMnwjACCizJauL5se8p1wpbxiXsnw6g1nrnQJlu2++bf/lQKKKLOiz6d4mms?=
 =?us-ascii?Q?oTSq3qPvsBaPZkgKQkmYq9K1W8N+u3PGyvw8js778tJM50bwgyow2NmEsrvK?=
 =?us-ascii?Q?+bWt33r1nRpYAgNMFXORbxRoGdihfnlF1FO9fmEZ+3YcSWbXegIOqXrk4LER?=
 =?us-ascii?Q?I4Zl8dgV779n4LhLbVarIwfnyA/IOXOccSeZ14vQojoqtMg12amYLMUGKnvf?=
 =?us-ascii?Q?XqXIlNDY+1l9mCl3K37scVZk998CkWVdLrTBykTXHuVGKbVurURrXjvaaern?=
 =?us-ascii?Q?VBaYpi8VSkFd/L5TpKszoFCXV9vq+/LXc+gDPHU32gdCBMW0kdGM8A/0Kizf?=
 =?us-ascii?Q?s/OsPGWrWoL/x19WL9T4KrgyrNJKby3oi9f5ESOu0HKx5x+A0dps8waqxENQ?=
 =?us-ascii?Q?QmH6vzKEqQeLZ1Qp02r+VOvH2ZuVX9OApYpZc4uhojA4jaZ12bvXeabrpYib?=
 =?us-ascii?Q?Y+1BfpySpF5AwVryrSaQacuyVVEwuBhbMU+N0GX1HtTDQm1PooS737VczZ4L?=
 =?us-ascii?Q?mRgMfWln2KrR0W76hT2xcO4kxAVTcOR61FdPT8bqCfTvkV6N7DkR7vIRHPsD?=
 =?us-ascii?Q?FiMUeW0v8n0FRV8FdPxgcFvuP8OPv9ojpCkybyG7XVaNKx001JPOgHiVqSz2?=
 =?us-ascii?Q?QUiVly1zXPTuzUJ7OI0VTiKQMow8G/osMXsK+SO3i76CBi7kYpfwQEkx0qjU?=
 =?us-ascii?Q?xaX7p1FouKj5akX7t5AmaVwYkA0FBd00hitgi6UXdBZxA4UDXP8GUuM0r0JA?=
 =?us-ascii?Q?bJdgIbNq1YkSpcbgyLZO9KaK1n0T3EWLGDpJGbRza7HnbMg8DfxyFKd+s8wD?=
 =?us-ascii?Q?mZNA1SetLEtUI61iA5kGzdEllk1lNCEYqygfow/QjLD1XDyzzddrCRphQJMz?=
 =?us-ascii?Q?AppvL4eLvsuOrd350SQH+F1c75tpqboGQ4ujby9FerHoPnbax/cBaMAY1GGX?=
 =?us-ascii?Q?EB8HnrfbUmSH5VOK+wegDr39af1xnf4vRKe/DhLCoaeGyCzN0dz8ivPgmGeZ?=
 =?us-ascii?Q?kvHfS7kUX3Ad5z6MtaDuSiG7nukn/j5pgpAYGga7oGKNht0gJw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KpiqxYEmPOAqSML3wsZHw69Ad7flEBbxlXHKQgCkZiYcT7TeAs6ySCoNKCib?=
 =?us-ascii?Q?8HWOi2GNYSjbkIK8copxTc9ZFcJRbPZARLkmkwlrWzockh4aewHIHDYTZC0n?=
 =?us-ascii?Q?GxbTfwkjnwYKLaiIg9NJW9/c5dM3VQFMIeJZPtqROxd4GxlN98fYDi8AxsK4?=
 =?us-ascii?Q?jUYai8FlfsOkNoNwu968d9KWwoDbvN853Rbowyq7u5c8pHiUSy9eRHVTeEtS?=
 =?us-ascii?Q?lTA5smfYhvXKm56+odGaNy1+5VmP82dvR/5lm8P+5ax/EZCJm+iQ1NgFp0D2?=
 =?us-ascii?Q?1EXi2FtQqqv8rtZaLzw6Mft0y/iUbAEM7X9FMDkVnRaZxPpUOPlf8IVLCeaz?=
 =?us-ascii?Q?utZmfghE8aH4d7hoFhERQEL5NRbJr+qICvKhu7tgqZ49X1AB9QBZWBi9fK6c?=
 =?us-ascii?Q?+4z48IxP+g4RdNKhvkQIpRITTqUppcOuMnw2UFJoOV4bc/fcrMssnA3UEUxf?=
 =?us-ascii?Q?+zV8f5Elyk242BLfziWfDuKTEewP61D4fxiwQVJ7N6l8xNkt8L/Cd3oyXo5+?=
 =?us-ascii?Q?cv7aWnzQ76TFDWWbNm0GvByIyC8Zh4ulc4mXZWOzJG8NQJYnKHwJTrCqmeqa?=
 =?us-ascii?Q?JLNmD2ZO2SaAfmuvN3TGWa42G8RoNOPsVhp5m6q+OsV9r3czgf8eaXqO99AI?=
 =?us-ascii?Q?gR7g3sonRWnZ2ou+xC9vhhTj+gY8rHbtJp3ciPmULjY35R9ysA2Wd92/MIvP?=
 =?us-ascii?Q?Mokv9HlNT7tuALUeWvuNK8eph7yFTxz4oH9OPsg49iH0hGGt0xWMDelE8K/D?=
 =?us-ascii?Q?2OYiNnQR29n1BWyV2QTQJDYEAgtdjlB/ZAl0QCsjikEH7iSZCfxWeii8oFxL?=
 =?us-ascii?Q?qdlktndHG1OI7unEGk89tG8bySjYj0P+2cqMmeFgaxF6HBgQWwF9FC6yCIyf?=
 =?us-ascii?Q?jQF+QE3MYhymrFPaO6rdgNxd3Nn0VyOh26m0A3whoYhBhUXpHA/6p07519Il?=
 =?us-ascii?Q?PDmY1iSBTMNgHH4Y1u0qCZ8xjYxolBE+7826RYx8sn7gMPQKfQVzcKxr/9kC?=
 =?us-ascii?Q?N8Yf/m5M0diPldqIpwY25v6slIpFxCHDa7d5x3Je5bgASTZhOhBHvDbUZXUO?=
 =?us-ascii?Q?1yWAzYHKNuyME1nX0w/p7xOxan3f3/ROw4EiAK+pbXNQTrZcmhSCufR0Q5xE?=
 =?us-ascii?Q?/7E8DUfKkLyJnWRnftm5493fT3VphkEI+lG3cRTmHNJ46PYhlrXwKvz/vd+e?=
 =?us-ascii?Q?U9S60LabvWIzByWaESgfL8rEST+rKc+NxQfRHAjQmr+dU3SnpgVN4sENRqh6?=
 =?us-ascii?Q?e9e7ihW6drnba1XsI1QSpNcWOsdQ27rcft6d/epji8FnDTJJ/fhSbPXCSEsn?=
 =?us-ascii?Q?7TLS46iZH8bQePuQ6Ooj49lKOQMyVC3PfbuUo5SYT5a7Hi6slzhutAZ0Z18b?=
 =?us-ascii?Q?uQbY9XGANxOMpXce6eJTZwbcDYhfLQU4Zi5g5siXWqdKpDwAjx8NKolDjWL9?=
 =?us-ascii?Q?lkxHPxd5qtYuRJg1WJl0o4ohm8ElibHC6sedaGW2y5kox5fbT7FuHaBbmxWA?=
 =?us-ascii?Q?1TXnPL6C4GHqm2+FWz6h0KupVDO4VqVAoSBKtdg5DXgph1zvJXpd55EqRQVm?=
 =?us-ascii?Q?xQu1gNNModcqKL6aQPtyhcDWwZrGUzKUt66ZPTTa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c88406f-cead-498c-e391-08dd3158e78d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 09:26:46.7736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjSrK46ALhw8V7E+IWhnVFjDQFEr+MDOo/SoApMFaPcdpHytjY73qtcrBYk6KsCOVMR3jMCaBt6gcUSthqyjzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 09:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209638

Looking at the reopened CVEs in meta-oe, I can't understand why are some re=
ported.

$ grep -rI CVE-2023-33460 ./
./meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch:CVE: CVE-2023-334=
60
./meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb:           file://CVE-2023-33=
460.patch \
$ grep -rI CVE-2020-29074 ./
./meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch:CVE: CVE-2020-=
29074
./meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb:           file://CVE-20=
20-29074.patch \

These look good to me, but they are not matched anymore and show as open.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Friday, January 10, 2025 10:21
> To: colinmca242@gmail.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
>=20
> Or should we rather rename all those patches which violate current code?
> What is then the meaning of CVE: tag within the patch if it's not used bu=
t it's
> enforced?
> We should probably remove cve_payload_tag handling from
> test_cve_tag_format...
>=20
> Peter
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Marko via
> > lists.openembedded.org
> > Sent: Friday, January 10, 2025 9:34
> > To: colinmca242@gmail.com; openembedded-
> core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
> >
> > Hello,
> >
> > This patch has caused a regression in detecting cve patches.
> > Master jumped by 32 CVEs after merging this commit.
> > These are for sure patched but it's not detected anymore.
> > See https://valkyrie.yocto.io/pub/non-release/patchmetrics/
> > (master should be identical to scarthgap/styhead except for kernel CVEs=
)
> >
> > Reports cannot be used anymore for picking CVEs for TODO list.
> > So this patch should be reverted or fixed.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Colin McAllister via
> > > lists.openembedded.org
> > > Sent: Monday, December 30, 2024 20:22
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Colin McAllister <colinmca242@gmail.com>
> > > Subject: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
> > >
> > > The cve_check functionality to parse CVE IDs from the patch filename =
and
> > > patch contents have been reworked to improve parsing and also utilize
> > > tests. This ensures that the parsing works as intended.
> > >
> > > Additionally, the new patched_cves dict has a few issues I tried to f=
ix
> > > as well. If multiple patch files exist for a single CVE ID, only the
> > > last one will show up with the "resource" key. The value for the
> > > "resource" key has been updated to hold a list and return all patch
> > > files associated with a given CVE ID. Also, at the end of
> > > get_patch_cves, CVE_STATUS can overwrite an existing entry in the dic=
t.
> > > This could cause an issue, for example, if a CVE has been addressed v=
ia
> > > a patch, but a CVE_STATUS line also exists that ignores the given CVE
> > > ID. A warning has been added if this ever happens.
> > >
> > > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> > > ---
> > >
> > > I noticed that there are some patches, especially in older verisons o=
f
> > > Yocto, where the "CVE: " tag was used with multiple CVE IDs in differ=
ent
> > > formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
> > > "CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CVE
> > > IDs will be parsed, but documentation doesn't indicate that is the on=
ly
> > > supported format. I figured it'd be nice to update the code to be abl=
e
> > > to support multiple formats, that way this patch could be backported =
to
> > > fix those patches. I also wanted to add unit tests to ensure the patc=
h
> > > parsing behavior is preserved.
> > >
> > > I'd also like to update the patch filename parsing to parse multiple =
CVE
> > > IDs from the filename, but based on the comments, it seems like there
> > > was a reason why only the last CVE ID is extracted from the filename.
> > > I'd be happy to submit a V2 patch or an additional patch to update th=
e
> > > function if that sounds good for the maintainers.
> > >
> > > V2 Changes:
> > > I mistakenly created this patch without fb3f440 applied. I updated
> > > get_patched_cves to return a dict instead of a set.
> > >
> > > I also improved the docstrings for these new functions to be more
> > > descriptive and also specify the return types.
> > >
> > > I also found a few issues with the dictionary object created by
> > > get_patched_cves that have now been addressed in this commit.
> > >
> > >  meta/lib/oe/cve_check.py                  | 166 ++++++++++++------
> > >  meta/lib/oeqa/selftest/cases/cve_check.py | 205
> > > ++++++++++++++++++++++
> > >  2 files changed, 317 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> > > index 280f9f613d..85a899a880 100644
> > > --- a/meta/lib/oe/cve_check.py
> > > +++ b/meta/lib/oe/cve_check.py
> > > @@ -5,9 +5,11 @@
> > >  #
> > >
> > >  import collections
> > > -import re
> > > -import itertools
> > >  import functools
> > > +import itertools
> > > +import os.path
> > > +import re
> > > +import oe.patch
> > >
> > >  _Version =3D collections.namedtuple(
> > >      "_Version", ["release", "patch_l", "pre_l", "pre_v"]
> > > @@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
> > >      return _release, _patch, _pre
> > >
> > >
> > > -def get_patched_cves(d):
> > > +def parse_cve_from_filename(patch_filename):
> > >      """
> > > -    Get patches that solve CVEs using the "CVE: " tag.
> > > +    Parses CVE ID from the filename
> > > +
> > > +    Matches the last "CVE-YYYY-ID" in the file name, also if written
> > > +    in lowercase. Possible to have multiple CVE IDs in a single
> > > +    file name, but only the last one will be detected from the file =
name.
> > > +
> > > +    Returns the last CVE ID foudn in the filename. If no CVE ID is f=
ound
> > > +    an empty string is returned.
> > >      """
> > > +    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d{4,})",
> > > re.IGNORECASE)
> > >
> > > -    import re
> > > -    import oe.patch
> > > +    # Check patch file name for CVE ID
> > > +    fname_match =3D cve_file_name_match.search(patch_filename)
> > > +    return fname_match.group(1).upper() if fname_match else ""
> > >
> > > -    cve_match =3D re.compile(r"CVE:( CVE-\d{4}-\d+)+")
> > >
> > > -    # Matches the last "CVE-YYYY-ID" in the file name, also if writt=
en
> > > -    # in lowercase. Possible to have multiple CVE IDs in a single
> > > -    # file name, but only the last one will be detected from the fil=
e name.
> > > -    # However, patch files contents addressing multiple CVE IDs are
> > supported
> > > -    # (cve_match regular expression)
> > > -    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)",
> > re.IGNORECASE)
> > > +def parse_cves_from_patch_contents(patch_contents):
> > > +    """
> > > +    Parses CVE IDs from patch contents
> > >
> > > +    Matches all CVE IDs contained on a line that starts with "CVE: "=
. Any
> > > +    delimiter (',', '&', "and", etc.) can be used without any issues=
. Multiple
> > > +    "CVE:" lines can also exist.
> > > +
> > > +    Returns a set of all CVE IDs found in the patch contents.
> > > +    """
> > > +    cve_ids =3D set()
> > > +    cve_match =3D re.compile(r"CVE-\d{4}-\d{4,}")
> > > +    # Search for one or more "CVE: " lines
> > > +    for line in patch_contents.split("\n"):
> > > +        if not line.startswith("CVE:"):
> > > +            continue
> > > +        cve_ids.update(cve_match.findall(line))
> > > +    return cve_ids
> > > +
> > > +
> > > +def parse_cves_from_patch_file(patch_file):
> > > +    """
> > > +    Parses CVE IDs associated with a particular patch file, using bo=
th the
> > > filename
> > > +    and patch contents.
> > > +
> > > +    Returns a set of all CVE IDs found in the patch filename and con=
tents.
> > > +    """
> > > +    cve_ids =3D set()
> > > +    filename_cve =3D parse_cve_from_filename(patch_file)
> > > +    if filename_cve:
> > > +        bb.debug(2, "Found %s from patch file name %s" % (filename_c=
ve,
> > > patch_file))
> > > +        cve_ids.add(parse_cve_from_filename(patch_file))
> > > +
> > > +    # Remote patches won't be present and compressed patches won't b=
e
> > > +    # unpacked, so say we're not scanning them
> > > +    if not os.path.isfile(patch_file):
> > > +        bb.note("%s is remote or compressed, not scanning content" %
> > > patch_file)
> > > +        return cve_ids
> > > +
> > > +    with open(patch_file, "r", encoding=3D"utf-8") as f:
> > > +        try:
> > > +            patch_text =3D f.read()
> > > +        except UnicodeDecodeError:
> > > +            bb.debug(
> > > +                1,
> > > +                "Failed to read patch %s using UTF-8 encoding"
> > > +                " trying with iso8859-1" % patch_file,
> > > +            )
> > > +            f.close()
> > > +            with open(patch_file, "r", encoding=3D"iso8859-1") as f:
> > > +                patch_text =3D f.read()
> > > +
> > > +    cve_ids.update(parse_cves_from_patch_contents(patch_text))
> > > +
> > > +    if not cve_ids:
> > > +        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> > > +    else:
> > > +        bb.debug(2, "Patch %s solves %s" % (patch_file, ",
> > > ".join(sorted(cve_ids))))
> > > +
> > > +    return cve_ids
> > > +
> > > +
> > > +def get_patched_cves(d):
> > > +    """
> > > +    Determines the CVE IDs that have been solved by either patches
> incuded
> > > within
> > > +    SRC_URI or by setting CVE_STATUS.
> > > +
> > > +    Returns a dictionary with the CVE IDs as keys and an associated
> dictonary
> > > of
> > > +    relevant metadata as the value.
> > > +    """
> > >      patched_cves =3D {}
> > >      patches =3D oe.patch.src_patches(d)
> > >      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
> > > +
> > > +    # Check each patch file
> > >      for url in patches:
> > >          patch_file =3D bb.fetch.decodeurl(url)[2]
> > > -
> > > -        # Check patch file name for CVE ID
> > > -        fname_match =3D cve_file_name_match.search(patch_file)
> > > -        if fname_match:
> > > -            cve =3D fname_match.group(1).upper()
> > > -            patched_cves[cve] =3D {"abbrev-status": "Patched", "stat=
us": "fix-file-
> > > included", "resource": patch_file}
> > > -            bb.debug(2, "Found %s from patch file name %s" % (cve,
> patch_file))
> > > -
> > > -        # Remote patches won't be present and compressed patches won=
't be
> > > -        # unpacked, so say we're not scanning them
> > > -        if not os.path.isfile(patch_file):
> > > -            bb.note("%s is remote or compressed, not scanning conten=
t" %
> > > patch_file)
> > > -            continue
> > > -
> > > -        with open(patch_file, "r", encoding=3D"utf-8") as f:
> > > -            try:
> > > -                patch_text =3D f.read()
> > > -            except UnicodeDecodeError:
> > > -                bb.debug(1, "Failed to read patch %s using UTF-8 enc=
oding"
> > > -                        " trying with iso8859-1" %  patch_file)
> > > -                f.close()
> > > -                with open(patch_file, "r", encoding=3D"iso8859-1") a=
s f:
> > > -                    patch_text =3D f.read()
> > > -
> > > -        # Search for one or more "CVE: " lines
> > > -        text_match =3D False
> > > -        for match in cve_match.finditer(patch_text):
> > > -            # Get only the CVEs without the "CVE: " tag
> > > -            cves =3D patch_text[match.start()+5:match.end()]
> > > -            for cve in cves.split():
> > > -                bb.debug(2, "Patch %s solves %s" % (patch_file, cve)=
)
> > > -                patched_cves[cve] =3D {"abbrev-status": "Patched", "=
status": "fix-
> file-
> > > included", "resource": patch_file}
> > > -                text_match =3D True
> > > -
> > > -        if not fname_match and not text_match:
> > > -            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> > > +        for cve_id in parse_cves_from_patch_file(patch_file):
> > > +            if cve_id not in patched_cves:
> > > +                {
> > > +                    "abbrev-status": "Patched",
> > > +                    "status": "fix-file-included",
> > > +                    "resource": [patch_file],
> > > +                }
> > > +            else:
> > > +                patched_cves[cve_id]["resource"].append(patch_file)
> > >
> > >      # Search for additional patched CVEs
> > > -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> > > -        decoded_status =3D decode_cve_status(d, cve)
> > > +    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
> > > +        decoded_status =3D decode_cve_status(d, cve_id)
> > >          products =3D d.getVar("CVE_PRODUCT")
> > > -        if has_cve_product_match(decoded_status, products) =3D=3D Tr=
ue:
> > > -            patched_cves[cve] =3D {
> > > +        if has_cve_product_match(decoded_status, products):
> > > +            if cve_id in patched_cves:
> > > +                bb.warn(
> > > +                    'CVE_STATUS[%s] =3D "%s" is overwriting previous=
 status of "%s:
> > %s"'
> > > +                    % (
> > > +                        cve_id,
> > > +                        d.getVarFlag("CVE_STATUS", cve_id),
> > > +                        patched_cves[cve_id]["abbrev-status"],
> > > +                        patched_cves[cve_id]["status"],
> > > +                    )
> > > +                )
> > > +            patched_cves[cve_id] =3D {
> > >                  "abbrev-status": decoded_status["mapping"],
> > >                  "status": decoded_status["detail"],
> > >                  "justification": decoded_status["description"],
> > >                  "affected-vendor": decoded_status["vendor"],
> > > -                "affected-product": decoded_status["product"]
> > > +                "affected-product": decoded_status["product"],
> > >              }
> > >
> > >      return patched_cves
> > > diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py
> > > b/meta/lib/oeqa/selftest/cases/cve_check.py
> > > index 3dd3e89d3e..511e4b81b4 100644
> > > --- a/meta/lib/oeqa/selftest/cases/cve_check.py
> > > +++ b/meta/lib/oeqa/selftest/cases/cve_check.py
> > > @@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
> > >          self.assertEqual(has_cve_product_match(status, "test glibca:=
glibc"),
> > True)
> > >          self.assertEqual(has_cve_product_match(status, "glibca:glibc=
 test"),
> > True)
> > >
> > > +    def test_parse_cve_from_patch_filename(self):
> > > +        from oe.cve_check import parse_cve_from_filename
> > > +
> > > +        # Patch filename without CVE ID
> > > +        self.assertEqual(parse_cve_from_filename("0001-test.patch"),=
 "")
> > > +
> > > +        # Patch with single CVE ID
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-20=
22-
> > > 12345"
> > > +        )
> > > +
> > > +        # Patch with multiple CVE IDs
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2022-41741-CVE-2022-
> > > 41742.patch"),
> > > +            "CVE-2022-41742",
> > > +        )
> > > +
> > > +        # Patches with CVE ID and appended text
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2023-3019-0001.patch"), "CV=
E-
> > > 2023-3019"
> > > +        )
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2024-21886-1.patch"), "CVE-
> 2024-
> > > 21886"
> > > +        )
> > > +
> > > +        # Patch with CVE ID and prepended text
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("grep-CVE-2012-5667.patch"), "CV=
E-
> > 2012-
> > > 5667"
> > > +        )
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("0001-CVE-2012-5667.patch"), "CV=
E-
> > > 2012-5667"
> > > +        )
> > > +
> > > +        # Patch with CVE ID and both prepended and appended text
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename(
> > > +                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-
> > 0001.patch"
> > > +            ),
> > > +            "CVE-2021-3565",
> > > +        )
> > > +
> > > +        # Only grab the last CVE ID in the filename
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2012-5667-CVE-2012-
> > 5668.patch"),
> > > +            "CVE-2012-5668",
> > > +        )
> > > +
> > > +        # Test invalid CVE ID with incorrect length (must be at leas=
t 4 digits)
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2024-001.patch"),
> > > +            "",
> > > +        )
> > > +
> > > +        # Test valid CVE ID with very long length
> > > +        self.assertEqual(
> > > +            parse_cve_from_filename("CVE-2024-
> > > 0000000000000000000000001.patch"),
> > > +            "CVE-2024-0000000000000000000000001",
> > > +        )
> > > +
> > > +    def test_parse_cve_from_patch_contents(self):
> > > +        import textwrap
> > > +        from oe.cve_check import parse_cves_from_patch_contents
> > > +
> > > +        # Standard patch file excerpt without any patches
> > > +        self.assertEqual(
> > > +            parse_cves_from_patch_contents(
> > > +                textwrap.dedent("""\
> > > +            remove "*" for root since we don't have a /etc/shadow so=
 far.
> > > +
> > > +            Upstream-Status: Inappropriate [configuration]
> > > +
> > > +            Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> > > +
> > > +            --- base-passwd/passwd.master~nobash
> > > +            +++ base-passwd/passwd.master
> > > +            @@ -1,4 +1,4 @@
> > > +            -root:*:0:0:root:/root:/bin/sh
> > > +            +root::0:0:root:/root:/bin/sh
> > > +            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> > > +            bin:*:2:2:bin:/bin:/bin/sh
> > > +            sys:*:3:3:sys:/dev:/bin/sh
> > > +            """)
> > > +            ),
> > > +            set(),
> > > +        )
> > > +
> > > +        # Patch file with multiple CVE IDs (space-separated)
> > > +        self.assertEqual(
> > > +            parse_cves_from_patch_contents(
> > > +                textwrap.dedent("""\
> > > +                There is an assertion in function _cairo_arc_in_dire=
ction().
> > > +
> > > +                CVE: CVE-2019-6461 CVE-2019-6462
> > > +                Upstream-Status: Pending
> > > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +
> > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > > +                index 390397bae..1bde774a4 100644
> > > +                --- a/src/cairo-arc.c
> > > +                +++ b/src/cairo-arc.c
> > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=
          *cr,
> > > +                    if (cairo_status (cr))
> > > +                        return;
> > > +
> > > +                -    assert (angle_max >=3D angle_min);
> > > +                +    if (angle_max < angle_min)
> > > +                +       return;
> > > +
> > > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_=
CIRCLES) {
> > > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M=
_PI);
> > > +            """),
> > > +            ),
> > > +            {"CVE-2019-6461", "CVE-2019-6462"},
> > > +        )
> > > +
> > > +        # Patch file with multiple CVE IDs (comma-separated w/ both =
space
> and
> > > no space)
> > > +        self.assertEqual(
> > > +            parse_cves_from_patch_contents(
> > > +                textwrap.dedent("""\
> > > +                There is an assertion in function _cairo_arc_in_dire=
ction().
> > > +
> > > +                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
> > > +                Upstream-Status: Pending
> > > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +
> > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > > +                index 390397bae..1bde774a4 100644
> > > +                --- a/src/cairo-arc.c
> > > +                +++ b/src/cairo-arc.c
> > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=
          *cr,
> > > +                    if (cairo_status (cr))
> > > +                        return;
> > > +
> > > +                -    assert (angle_max >=3D angle_min);
> > > +                +    if (angle_max < angle_min)
> > > +                +       return;
> > > +
> > > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_=
CIRCLES) {
> > > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M=
_PI);
> > > +
> > > +            """),
> > > +            ),
> > > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
> > > +        )
> > > +
> > > +        # Patch file with multiple CVE IDs (&-separated)
> > > +        self.assertEqual(
> > > +            parse_cves_from_patch_contents(
> > > +                textwrap.dedent("""\
> > > +                There is an assertion in function _cairo_arc_in_dire=
ction().
> > > +
> > > +                CVE: CVE-2019-6461 & CVE-2019-6462
> > > +                Upstream-Status: Pending
> > > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +
> > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > > +                index 390397bae..1bde774a4 100644
> > > +                --- a/src/cairo-arc.c
> > > +                +++ b/src/cairo-arc.c
> > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=
          *cr,
> > > +                    if (cairo_status (cr))
> > > +                        return;
> > > +
> > > +                -    assert (angle_max >=3D angle_min);
> > > +                +    if (angle_max < angle_min)
> > > +                +       return;
> > > +
> > > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_=
CIRCLES) {
> > > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M=
_PI);
> > > +            """),
> > > +            ),
> > > +            {"CVE-2019-6461", "CVE-2019-6462"},
> > > +        )
> > > +
> > > +        # Patch file with multiple lines with CVE IDs
> > > +        self.assertEqual(
> > > +            parse_cves_from_patch_contents(
> > > +                textwrap.dedent("""\
> > > +                There is an assertion in function _cairo_arc_in_dire=
ction().
> > > +
> > > +                CVE: CVE-2019-6461 & CVE-2019-6462
> > > +
> > > +                CVE: CVE-2019-6463 & CVE-2019-6464
> > > +                Upstream-Status: Pending
> > > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > +
> > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > > +                index 390397bae..1bde774a4 100644
> > > +                --- a/src/cairo-arc.c
> > > +                +++ b/src/cairo-arc.c
> > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=
          *cr,
> > > +                    if (cairo_status (cr))
> > > +                        return;
> > > +
> > > +                -    assert (angle_max >=3D angle_min);
> > > +                +    if (angle_max < angle_min)
> > > +                +       return;
> > > +
> > > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_=
CIRCLES) {
> > > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M=
_PI);
> > > +
> > > +            """),
> > > +            ),
> > > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE=
-
> > > 2019-6464"},
> > > +        )
> > >
> > >      def test_recipe_report_json(self):
> > >          config =3D """
> > > --
> > > 2.34.1


