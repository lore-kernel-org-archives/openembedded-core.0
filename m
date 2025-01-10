Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCB8E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 09:21:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web10.14754.1736500882778309902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 01:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JEVZbygg;
 spf=pass (domain: siemens.com, ip: 40.107.20.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvqlgB700eEil5g+0+Wd5wKq6jaBJ3e/wzQBzbPZyXqmu6U4HAHTNnjE1/NdovJ6sgGgOIjDfqYDkjxwcbZYvhlHBqOSDVURepRA+VXdhMEpYS1FtO2MMkpZFCjpwrypBN6hPeIn3bT2XbbCLfG133m7gRX/rVU4OEVc+sIFQiTj2T2J5w24s8OXUsb0hwSQGaHlIS3NdhpPEMaKeZbpdyx01On12lGWJlpZCQGWCUBMcSrjENmQxFNNxFBs/4vMCd1DgArt9u2fw0VhkE5Z5WbB3HDEAX5ay5qbe8nCCE/Bk6DQlXp/2O20hk2NclnCytHqtdtPw+CTFKt96yBrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqA4ZJv5WyHJvV5lLLiEH+avfVpLwKU92s39izWlgu8=;
 b=Nu8PfKh6mz64tatnYcn1MOJWgfLBF951LjUie1CTs1gFPLVP+So4DxtTxpINEEdJ8BHFUq2m/EnsNUQZWluDr38EuCpIf1guKASwqsEoT3/HLSgwNH1jnxv7jls2809rsNieqNC3guxDZC7ra7Jd3LrXMvh0fIl0uXA7RppRd1jEkD1vqzPVQytgAxpMD1oB77haaIQDtFSva1c3023DDk2eHENe7njPb8QlmuWAJMMIApjY9X/mVa69Me/6pNbCrAR9+8sH/qjDWw3vgtFt5Z8nGjI+pJSQpsQzrMuC7huD+XMVRvoSAolnnB4uTSYiQJ5gXu1qeqnNABjc5UtBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqA4ZJv5WyHJvV5lLLiEH+avfVpLwKU92s39izWlgu8=;
 b=JEVZbyggGwHm+GFqJII/wANstOf+ew3F3rDTLedn8WjEgM7Lv69zLeBGWLQA0os6FyH+O3N0JKb7RAlA2gJZeBAbmhKaETheKy1nJWU/oJdd+ETFxZmUufjVvn83YGU14ZqKy3ZoGajgj7Af1PsCRDSwjF1gbodSAsH/KS0/+q6wVNW8DvFQiOxDicCpkir34eDux9lQ3T7xAQ+AhtySAnNJ0+QteLh7fQRwdE0gVo64SMZst+j0wLvnIkpMO2kZwcHjmhXoXHbyW4p29001z940sm85q5KZ34Sj8TQMee/SqOKe19M3kCCfllpje1NB4E/arMCNRkHsVstGSbTCNA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3231.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 09:21:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 09:21:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "colinmca242@gmail.com" <colinmca242@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Topic: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Index: AQHbWvA4guQ8bzoGTkiOEX1TDduSq7MPvfkwgAANEMA=
Date: Fri, 10 Jan 2025 09:21:19 +0000
Message-ID: 
 <AS1PR10MB56970CBFD26B32D556FB6BB8FD1C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241230192224.113886-1-colinmca242@gmail.com>
 <20241230192224.113886-2-colinmca242@gmail.com>
 <181947C8BF47FE99.17938@lists.openembedded.org>
In-Reply-To: <181947C8BF47FE99.17938@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=917b2880-db5b-47ed-832e-4b3abe5592c4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-10T08:30:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3231:EE_
x-ms-office365-filtering-correlation-id: 10916ee4-42f3-4898-0586-08dd31582481
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dpmgVvSWPwdzyYkHi6u26UJwF9pggDMN2QTzfHnpME59ux8K4UvQK6g+WGfH?=
 =?us-ascii?Q?w24yOSfxIkuaqOrOJWT+7ggQurzPOpFv5jkSNHGaQ1TvmbBzWclPNl6K0CZl?=
 =?us-ascii?Q?7Q2uVbIVAX4gVGXr8xmAtO3Wt5P7mtVOFNt9K6ltrOLd18pfPEsGT3IT8Qul?=
 =?us-ascii?Q?BI7UBmgNgs+UJKd5g82wZHu9aVnIFdUkgLUuOyHABH2F9n4jAIjMxl+f1Q6o?=
 =?us-ascii?Q?ASSeFYWUXlwhcfnTqOOHIIV6kXcWgo1SZvfApSI6ERWfcaCG+RNfuB177CVo?=
 =?us-ascii?Q?ZWMOkzx58aBUTD0w6GkAPkB26jgKp3HILJR99zEJqTbvVU0YC0H1TMYp4wDQ?=
 =?us-ascii?Q?pEu05jJCmzP+7WChgsRd8ZHQL6R34ComKF9d1mz53DwxYMFyUZszFE8VTrgM?=
 =?us-ascii?Q?IaT1/6rRoDAD1fUdpSc/r1tc3G0BwEpME9r/f2uei0ct/Y6Vsh+oPBUmL08h?=
 =?us-ascii?Q?02lxuBhsm4THE7SpuXED1VMz7iFPo2zPVyUI61BkimmmVMel5gp+h9B79oMx?=
 =?us-ascii?Q?c9q1kZtSFKUUdM3Dyaxer+BXrekC2t6MjDbYJ6YiqdhI2VgSMrSbx+fGdy9z?=
 =?us-ascii?Q?SVrFq+Uh+PSuf8qvKmK6sEhRaC7+ngYZp75F7pT8TQXB5GQogMJlPSbLwrNs?=
 =?us-ascii?Q?HyvenmdZB3iwx+38w25QZ1GQP3q4Wrhe4j7lqFdLkcKxhBuyJXcGQKJRtf1W?=
 =?us-ascii?Q?gpCzAOaUItpl38u9WfhHdqXYvDCqEGlekyw26pryEiGAvd9WDtzmtDFrbun8?=
 =?us-ascii?Q?Xb+D445OhUumKrQY8p0Jl93/263ssC2b6qyI6+F2znaZItEoUTqGDEmmTcYv?=
 =?us-ascii?Q?LyzA9g3UfxKS7tWmb4UDW9KTaauIMq0/06B5jbmChtw1MsfpeUtyQetVPvH5?=
 =?us-ascii?Q?hCLm2FzYF/Rj44LmrivTGeKWnE60BsywS9wKysG9KWV9Y6IWbdzB+uj0fTQI?=
 =?us-ascii?Q?VpVPyDIuyo27DusnY7VSQFW0IN5OUXGOoqAcKslZsWziS1S4KdTgC+y+nXYI?=
 =?us-ascii?Q?7fMqWFRVPv/rer1v2z13JuGaK78eRx5ZALJO6g8N24WsyLcwmPOI50csixax?=
 =?us-ascii?Q?6tymwhJhJHGMuMehFzFp+cc6SJYk6ho8w1jnaV/q9Y0yNOItZrmvY5b1bwfm?=
 =?us-ascii?Q?cfdhRxGWE4a27mE8JiNcvg7rr0dnDGfWC8vT9dx2Ah1QGZXOfOn6a0Zk6FlS?=
 =?us-ascii?Q?HcgqZagndCaBiZTPumSes52c+3jQDcW4pRGYm6FpYtP7d/iHaWlNjBw9xdas?=
 =?us-ascii?Q?8AsK8GMYKsHUTSUvVol3BIsCIms1NWKL99yGgElcuImhHohdQAMzD2Q2Lnfp?=
 =?us-ascii?Q?5ux0ss5PSpXJVrcDMfjtQ99QZEx6WsxciSAVElxb4rgJhjYSlkdgS099jOuU?=
 =?us-ascii?Q?vsYU0So9QtfID3pGScZHr5StYVSksDPmteOzCy8CWDMgBXvZzw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nDFaSc45BFzLyxBdcpDLwrC41r5xL7pehGHnrXPzWldaUQsAvUZ+ac0EyxP3?=
 =?us-ascii?Q?lfXhKFdh94Iv/PFi+NqJYIYRE73hRmLgBcWmfRaVgcEmfjY//g+DJc6IJ6Xb?=
 =?us-ascii?Q?m1pzlVJC2D67ILEA6DFsnMjTxIHOg/8DyCnimiXqA29c8M04NiEqq90l7+Mp?=
 =?us-ascii?Q?eMKn2Jg4pMYQ2dfAngfK/a29XBy2cEs6ODLatVGga30uSmxeH7ojvh2dq4rD?=
 =?us-ascii?Q?64GPFYSqRkxCdHQWRkYo21AV3DtJU9DN/cg0xDjwW9wZphdQG/BE4iU7nEy6?=
 =?us-ascii?Q?rwRD5T2b05++kjfcOQYRWpIZbEnjcd4vbMYfLt0jubIpHabeupkq6GCabiyw?=
 =?us-ascii?Q?sUazU2M5JZfxQ5HbkUuQOmnlHkm7V52wR421+GRdQWrR/Z6b7cN66632+3SR?=
 =?us-ascii?Q?1CpEzOhUniwrELd+N7gI4rKeTNOWdcAdcLpt8HKvYCaq4MQM/yOCEropGwgF?=
 =?us-ascii?Q?qdXVYrBQkiKcHdnfDdZErheixqxELBRp4bt0wZgFHtd178s6AyOJH0m36Oic?=
 =?us-ascii?Q?wG1fxVv5sfr3orPnEs5VxptRjFo63tr0R1B6snsDKCGcoA6piRBe0OxDNUWJ?=
 =?us-ascii?Q?q2KGC9FDCti971GoVDXw24r2fMackhzLRsAw2WUcxLt/PK/0VvzvwS0MIIJ0?=
 =?us-ascii?Q?/AVOq3umhVOd1qk7zcClL+4lL/jsYHbmoVX1tIEo1dwcwjR9+DTSUAYenkSK?=
 =?us-ascii?Q?iA4/LhYcNnJ8LA5iNCR7DG+HT5RL5Vg2anFNlrPPuMJRukQQv8wr6xwfYpWl?=
 =?us-ascii?Q?e9jjlL9Xd7GxCXkKuUtkNNfowN+SApubq6+MuiuKYNx1B5WCSkk6ASOqjrwc?=
 =?us-ascii?Q?u6bNcvALwUyxDWjkkDypK395Khh0hq0rZFxWakjs8FfZFsX4lqnWZLRLCK4W?=
 =?us-ascii?Q?LUmNC5U30YKapC1Ge2BJBnjoQ8Oc77Pk95a7P+QgH/Hh0OjHFEvEAFwwj2VJ?=
 =?us-ascii?Q?2cLWfdryEs4eaiXcaGm8H0skebUjKCuu97dPMT4WTe+XfpzjU41uwn+psp6H?=
 =?us-ascii?Q?onR2pBqGOpJAjv526zqYAIuy9ses7Nf3J5OaJHdRy/vhppPfZTXl9f6jcLRy?=
 =?us-ascii?Q?iMUuIHA9vVVdZA1o4/V7m0RrVkRQI3WxclH3G1+wlzY7dIaJsWkaeYdV6/+x?=
 =?us-ascii?Q?0kI39R7KWsXD5PNpFEvwyz/cNVBdOFnAUzi6dor1y308ymGtDLiOpdxC1mOo?=
 =?us-ascii?Q?CJVWEWD/Zelb1tKQVLZqhOTJCZSrCvxQxD+04LHBHwnr6jS5GSBVv0tpkVG+?=
 =?us-ascii?Q?w7qHK8od4Q4hDaVaXXJSUl9lmMyn5geXyNv+ABoG3IW0KxrHS2v6/fqfItze?=
 =?us-ascii?Q?AcvBIlSa7mgw86LHFLb1rc0bzN5mW0SGWSqLhltgG/ysJIJ40Osica61WPjw?=
 =?us-ascii?Q?JoctXL7gzc0JyAhadiWvro2HW6UoBeW1MCIjIlx78anwa30lOuVz1NQ1EJw9?=
 =?us-ascii?Q?6115LrabZ7KiexUQ/kfu48hyhDE+ewqQOUSWqdtck7zLH4fx8i7TYCGKIo9H?=
 =?us-ascii?Q?QdANNj5TBwF3PEROMT9NF5jCXb/9iyT1EcjBRTjxjypefhk5Vijayl62GzQj?=
 =?us-ascii?Q?aWs1oohsCy4+IUSdrqkweNSR2D4Pi2o7s8QUSroF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10916ee4-42f3-4898-0586-08dd31582481
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 09:21:19.5496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/dd+H+JnoIEJ/Oz0wBz5ZfsZyDzYM1EQ769RNf4p+kFmRrBJgcJ7fkOPzfc5zAfgw7w81eN3qBeE+Dqzq4F4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3231
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 09:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209637

Or should we rather rename all those patches which violate current code?
What is then the meaning of CVE: tag within the patch if it's not used but =
it's enforced?
We should probably remove cve_payload_tag handling from test_cve_tag_format=
...

Peter=20

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Friday, January 10, 2025 9:34
> To: colinmca242@gmail.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
>=20
> Hello,
>=20
> This patch has caused a regression in detecting cve patches.
> Master jumped by 32 CVEs after merging this commit.
> These are for sure patched but it's not detected anymore.
> See https://valkyrie.yocto.io/pub/non-release/patchmetrics/
> (master should be identical to scarthgap/styhead except for kernel CVEs)
>=20
> Reports cannot be used anymore for picking CVEs for TODO list.
> So this patch should be reverted or fixed.
>=20
> Peter
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Colin McAllister via
> > lists.openembedded.org
> > Sent: Monday, December 30, 2024 20:22
> > To: openembedded-core@lists.openembedded.org
> > Cc: Colin McAllister <colinmca242@gmail.com>
> > Subject: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
> >
> > The cve_check functionality to parse CVE IDs from the patch filename an=
d
> > patch contents have been reworked to improve parsing and also utilize
> > tests. This ensures that the parsing works as intended.
> >
> > Additionally, the new patched_cves dict has a few issues I tried to fix
> > as well. If multiple patch files exist for a single CVE ID, only the
> > last one will show up with the "resource" key. The value for the
> > "resource" key has been updated to hold a list and return all patch
> > files associated with a given CVE ID. Also, at the end of
> > get_patch_cves, CVE_STATUS can overwrite an existing entry in the dict.
> > This could cause an issue, for example, if a CVE has been addressed via
> > a patch, but a CVE_STATUS line also exists that ignores the given CVE
> > ID. A warning has been added if this ever happens.
> >
> > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> > ---
> >
> > I noticed that there are some patches, especially in older verisons of
> > Yocto, where the "CVE: " tag was used with multiple CVE IDs in differen=
t
> > formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
> > "CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CVE
> > IDs will be parsed, but documentation doesn't indicate that is the only
> > supported format. I figured it'd be nice to update the code to be able
> > to support multiple formats, that way this patch could be backported to
> > fix those patches. I also wanted to add unit tests to ensure the patch
> > parsing behavior is preserved.
> >
> > I'd also like to update the patch filename parsing to parse multiple CV=
E
> > IDs from the filename, but based on the comments, it seems like there
> > was a reason why only the last CVE ID is extracted from the filename.
> > I'd be happy to submit a V2 patch or an additional patch to update the
> > function if that sounds good for the maintainers.
> >
> > V2 Changes:
> > I mistakenly created this patch without fb3f440 applied. I updated
> > get_patched_cves to return a dict instead of a set.
> >
> > I also improved the docstrings for these new functions to be more
> > descriptive and also specify the return types.
> >
> > I also found a few issues with the dictionary object created by
> > get_patched_cves that have now been addressed in this commit.
> >
> >  meta/lib/oe/cve_check.py                  | 166 ++++++++++++------
> >  meta/lib/oeqa/selftest/cases/cve_check.py | 205
> > ++++++++++++++++++++++
> >  2 files changed, 317 insertions(+), 54 deletions(-)
> >
> > diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> > index 280f9f613d..85a899a880 100644
> > --- a/meta/lib/oe/cve_check.py
> > +++ b/meta/lib/oe/cve_check.py
> > @@ -5,9 +5,11 @@
> >  #
> >
> >  import collections
> > -import re
> > -import itertools
> >  import functools
> > +import itertools
> > +import os.path
> > +import re
> > +import oe.patch
> >
> >  _Version =3D collections.namedtuple(
> >      "_Version", ["release", "patch_l", "pre_l", "pre_v"]
> > @@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
> >      return _release, _patch, _pre
> >
> >
> > -def get_patched_cves(d):
> > +def parse_cve_from_filename(patch_filename):
> >      """
> > -    Get patches that solve CVEs using the "CVE: " tag.
> > +    Parses CVE ID from the filename
> > +
> > +    Matches the last "CVE-YYYY-ID" in the file name, also if written
> > +    in lowercase. Possible to have multiple CVE IDs in a single
> > +    file name, but only the last one will be detected from the file na=
me.
> > +
> > +    Returns the last CVE ID foudn in the filename. If no CVE ID is fou=
nd
> > +    an empty string is returned.
> >      """
> > +    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d{4,})",
> > re.IGNORECASE)
> >
> > -    import re
> > -    import oe.patch
> > +    # Check patch file name for CVE ID
> > +    fname_match =3D cve_file_name_match.search(patch_filename)
> > +    return fname_match.group(1).upper() if fname_match else ""
> >
> > -    cve_match =3D re.compile(r"CVE:( CVE-\d{4}-\d+)+")
> >
> > -    # Matches the last "CVE-YYYY-ID" in the file name, also if written
> > -    # in lowercase. Possible to have multiple CVE IDs in a single
> > -    # file name, but only the last one will be detected from the file =
name.
> > -    # However, patch files contents addressing multiple CVE IDs are
> supported
> > -    # (cve_match regular expression)
> > -    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)",
> re.IGNORECASE)
> > +def parse_cves_from_patch_contents(patch_contents):
> > +    """
> > +    Parses CVE IDs from patch contents
> >
> > +    Matches all CVE IDs contained on a line that starts with "CVE: ". =
Any
> > +    delimiter (',', '&', "and", etc.) can be used without any issues. =
Multiple
> > +    "CVE:" lines can also exist.
> > +
> > +    Returns a set of all CVE IDs found in the patch contents.
> > +    """
> > +    cve_ids =3D set()
> > +    cve_match =3D re.compile(r"CVE-\d{4}-\d{4,}")
> > +    # Search for one or more "CVE: " lines
> > +    for line in patch_contents.split("\n"):
> > +        if not line.startswith("CVE:"):
> > +            continue
> > +        cve_ids.update(cve_match.findall(line))
> > +    return cve_ids
> > +
> > +
> > +def parse_cves_from_patch_file(patch_file):
> > +    """
> > +    Parses CVE IDs associated with a particular patch file, using both=
 the
> > filename
> > +    and patch contents.
> > +
> > +    Returns a set of all CVE IDs found in the patch filename and conte=
nts.
> > +    """
> > +    cve_ids =3D set()
> > +    filename_cve =3D parse_cve_from_filename(patch_file)
> > +    if filename_cve:
> > +        bb.debug(2, "Found %s from patch file name %s" % (filename_cve=
,
> > patch_file))
> > +        cve_ids.add(parse_cve_from_filename(patch_file))
> > +
> > +    # Remote patches won't be present and compressed patches won't be
> > +    # unpacked, so say we're not scanning them
> > +    if not os.path.isfile(patch_file):
> > +        bb.note("%s is remote or compressed, not scanning content" %
> > patch_file)
> > +        return cve_ids
> > +
> > +    with open(patch_file, "r", encoding=3D"utf-8") as f:
> > +        try:
> > +            patch_text =3D f.read()
> > +        except UnicodeDecodeError:
> > +            bb.debug(
> > +                1,
> > +                "Failed to read patch %s using UTF-8 encoding"
> > +                " trying with iso8859-1" % patch_file,
> > +            )
> > +            f.close()
> > +            with open(patch_file, "r", encoding=3D"iso8859-1") as f:
> > +                patch_text =3D f.read()
> > +
> > +    cve_ids.update(parse_cves_from_patch_contents(patch_text))
> > +
> > +    if not cve_ids:
> > +        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> > +    else:
> > +        bb.debug(2, "Patch %s solves %s" % (patch_file, ",
> > ".join(sorted(cve_ids))))
> > +
> > +    return cve_ids
> > +
> > +
> > +def get_patched_cves(d):
> > +    """
> > +    Determines the CVE IDs that have been solved by either patches inc=
uded
> > within
> > +    SRC_URI or by setting CVE_STATUS.
> > +
> > +    Returns a dictionary with the CVE IDs as keys and an associated di=
ctonary
> > of
> > +    relevant metadata as the value.
> > +    """
> >      patched_cves =3D {}
> >      patches =3D oe.patch.src_patches(d)
> >      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
> > +
> > +    # Check each patch file
> >      for url in patches:
> >          patch_file =3D bb.fetch.decodeurl(url)[2]
> > -
> > -        # Check patch file name for CVE ID
> > -        fname_match =3D cve_file_name_match.search(patch_file)
> > -        if fname_match:
> > -            cve =3D fname_match.group(1).upper()
> > -            patched_cves[cve] =3D {"abbrev-status": "Patched", "status=
": "fix-file-
> > included", "resource": patch_file}
> > -            bb.debug(2, "Found %s from patch file name %s" % (cve, pat=
ch_file))
> > -
> > -        # Remote patches won't be present and compressed patches won't=
 be
> > -        # unpacked, so say we're not scanning them
> > -        if not os.path.isfile(patch_file):
> > -            bb.note("%s is remote or compressed, not scanning content"=
 %
> > patch_file)
> > -            continue
> > -
> > -        with open(patch_file, "r", encoding=3D"utf-8") as f:
> > -            try:
> > -                patch_text =3D f.read()
> > -            except UnicodeDecodeError:
> > -                bb.debug(1, "Failed to read patch %s using UTF-8 encod=
ing"
> > -                        " trying with iso8859-1" %  patch_file)
> > -                f.close()
> > -                with open(patch_file, "r", encoding=3D"iso8859-1") as =
f:
> > -                    patch_text =3D f.read()
> > -
> > -        # Search for one or more "CVE: " lines
> > -        text_match =3D False
> > -        for match in cve_match.finditer(patch_text):
> > -            # Get only the CVEs without the "CVE: " tag
> > -            cves =3D patch_text[match.start()+5:match.end()]
> > -            for cve in cves.split():
> > -                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
> > -                patched_cves[cve] =3D {"abbrev-status": "Patched", "st=
atus": "fix-file-
> > included", "resource": patch_file}
> > -                text_match =3D True
> > -
> > -        if not fname_match and not text_match:
> > -            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> > +        for cve_id in parse_cves_from_patch_file(patch_file):
> > +            if cve_id not in patched_cves:
> > +                {
> > +                    "abbrev-status": "Patched",
> > +                    "status": "fix-file-included",
> > +                    "resource": [patch_file],
> > +                }
> > +            else:
> > +                patched_cves[cve_id]["resource"].append(patch_file)
> >
> >      # Search for additional patched CVEs
> > -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> > -        decoded_status =3D decode_cve_status(d, cve)
> > +    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
> > +        decoded_status =3D decode_cve_status(d, cve_id)
> >          products =3D d.getVar("CVE_PRODUCT")
> > -        if has_cve_product_match(decoded_status, products) =3D=3D True=
:
> > -            patched_cves[cve] =3D {
> > +        if has_cve_product_match(decoded_status, products):
> > +            if cve_id in patched_cves:
> > +                bb.warn(
> > +                    'CVE_STATUS[%s] =3D "%s" is overwriting previous s=
tatus of "%s:
> %s"'
> > +                    % (
> > +                        cve_id,
> > +                        d.getVarFlag("CVE_STATUS", cve_id),
> > +                        patched_cves[cve_id]["abbrev-status"],
> > +                        patched_cves[cve_id]["status"],
> > +                    )
> > +                )
> > +            patched_cves[cve_id] =3D {
> >                  "abbrev-status": decoded_status["mapping"],
> >                  "status": decoded_status["detail"],
> >                  "justification": decoded_status["description"],
> >                  "affected-vendor": decoded_status["vendor"],
> > -                "affected-product": decoded_status["product"]
> > +                "affected-product": decoded_status["product"],
> >              }
> >
> >      return patched_cves
> > diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py
> > b/meta/lib/oeqa/selftest/cases/cve_check.py
> > index 3dd3e89d3e..511e4b81b4 100644
> > --- a/meta/lib/oeqa/selftest/cases/cve_check.py
> > +++ b/meta/lib/oeqa/selftest/cases/cve_check.py
> > @@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
> >          self.assertEqual(has_cve_product_match(status, "test glibca:gl=
ibc"),
> True)
> >          self.assertEqual(has_cve_product_match(status, "glibca:glibc t=
est"),
> True)
> >
> > +    def test_parse_cve_from_patch_filename(self):
> > +        from oe.cve_check import parse_cve_from_filename
> > +
> > +        # Patch filename without CVE ID
> > +        self.assertEqual(parse_cve_from_filename("0001-test.patch"), "=
")
> > +
> > +        # Patch with single CVE ID
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-2022=
-
> > 12345"
> > +        )
> > +
> > +        # Patch with multiple CVE IDs
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2022-41741-CVE-2022-
> > 41742.patch"),
> > +            "CVE-2022-41742",
> > +        )
> > +
> > +        # Patches with CVE ID and appended text
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2023-3019-0001.patch"), "CVE-
> > 2023-3019"
> > +        )
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2024-21886-1.patch"), "CVE-20=
24-
> > 21886"
> > +        )
> > +
> > +        # Patch with CVE ID and prepended text
> > +        self.assertEqual(
> > +            parse_cve_from_filename("grep-CVE-2012-5667.patch"), "CVE-
> 2012-
> > 5667"
> > +        )
> > +        self.assertEqual(
> > +            parse_cve_from_filename("0001-CVE-2012-5667.patch"), "CVE-
> > 2012-5667"
> > +        )
> > +
> > +        # Patch with CVE ID and both prepended and appended text
> > +        self.assertEqual(
> > +            parse_cve_from_filename(
> > +                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-
> 0001.patch"
> > +            ),
> > +            "CVE-2021-3565",
> > +        )
> > +
> > +        # Only grab the last CVE ID in the filename
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2012-5667-CVE-2012-
> 5668.patch"),
> > +            "CVE-2012-5668",
> > +        )
> > +
> > +        # Test invalid CVE ID with incorrect length (must be at least =
4 digits)
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2024-001.patch"),
> > +            "",
> > +        )
> > +
> > +        # Test valid CVE ID with very long length
> > +        self.assertEqual(
> > +            parse_cve_from_filename("CVE-2024-
> > 0000000000000000000000001.patch"),
> > +            "CVE-2024-0000000000000000000000001",
> > +        )
> > +
> > +    def test_parse_cve_from_patch_contents(self):
> > +        import textwrap
> > +        from oe.cve_check import parse_cves_from_patch_contents
> > +
> > +        # Standard patch file excerpt without any patches
> > +        self.assertEqual(
> > +            parse_cves_from_patch_contents(
> > +                textwrap.dedent("""\
> > +            remove "*" for root since we don't have a /etc/shadow so f=
ar.
> > +
> > +            Upstream-Status: Inappropriate [configuration]
> > +
> > +            Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> > +
> > +            --- base-passwd/passwd.master~nobash
> > +            +++ base-passwd/passwd.master
> > +            @@ -1,4 +1,4 @@
> > +            -root:*:0:0:root:/root:/bin/sh
> > +            +root::0:0:root:/root:/bin/sh
> > +            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> > +            bin:*:2:2:bin:/bin:/bin/sh
> > +            sys:*:3:3:sys:/dev:/bin/sh
> > +            """)
> > +            ),
> > +            set(),
> > +        )
> > +
> > +        # Patch file with multiple CVE IDs (space-separated)
> > +        self.assertEqual(
> > +            parse_cves_from_patch_contents(
> > +                textwrap.dedent("""\
> > +                There is an assertion in function _cairo_arc_in_direct=
ion().
> > +
> > +                CVE: CVE-2019-6461 CVE-2019-6462
> > +                Upstream-Status: Pending
> > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > +                index 390397bae..1bde774a4 100644
> > +                --- a/src/cairo-arc.c
> > +                +++ b/src/cairo-arc.c
> > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t  =
        *cr,
> > +                    if (cairo_status (cr))
> > +                        return;
> > +
> > +                -    assert (angle_max >=3D angle_min);
> > +                +    if (angle_max < angle_min)
> > +                +       return;
> > +
> > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CI=
RCLES) {
> > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_P=
I);
> > +            """),
> > +            ),
> > +            {"CVE-2019-6461", "CVE-2019-6462"},
> > +        )
> > +
> > +        # Patch file with multiple CVE IDs (comma-separated w/ both sp=
ace and
> > no space)
> > +        self.assertEqual(
> > +            parse_cves_from_patch_contents(
> > +                textwrap.dedent("""\
> > +                There is an assertion in function _cairo_arc_in_direct=
ion().
> > +
> > +                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
> > +                Upstream-Status: Pending
> > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > +                index 390397bae..1bde774a4 100644
> > +                --- a/src/cairo-arc.c
> > +                +++ b/src/cairo-arc.c
> > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t  =
        *cr,
> > +                    if (cairo_status (cr))
> > +                        return;
> > +
> > +                -    assert (angle_max >=3D angle_min);
> > +                +    if (angle_max < angle_min)
> > +                +       return;
> > +
> > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CI=
RCLES) {
> > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_P=
I);
> > +
> > +            """),
> > +            ),
> > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
> > +        )
> > +
> > +        # Patch file with multiple CVE IDs (&-separated)
> > +        self.assertEqual(
> > +            parse_cves_from_patch_contents(
> > +                textwrap.dedent("""\
> > +                There is an assertion in function _cairo_arc_in_direct=
ion().
> > +
> > +                CVE: CVE-2019-6461 & CVE-2019-6462
> > +                Upstream-Status: Pending
> > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > +                index 390397bae..1bde774a4 100644
> > +                --- a/src/cairo-arc.c
> > +                +++ b/src/cairo-arc.c
> > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t  =
        *cr,
> > +                    if (cairo_status (cr))
> > +                        return;
> > +
> > +                -    assert (angle_max >=3D angle_min);
> > +                +    if (angle_max < angle_min)
> > +                +       return;
> > +
> > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CI=
RCLES) {
> > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_P=
I);
> > +            """),
> > +            ),
> > +            {"CVE-2019-6461", "CVE-2019-6462"},
> > +        )
> > +
> > +        # Patch file with multiple lines with CVE IDs
> > +        self.assertEqual(
> > +            parse_cves_from_patch_contents(
> > +                textwrap.dedent("""\
> > +                There is an assertion in function _cairo_arc_in_direct=
ion().
> > +
> > +                CVE: CVE-2019-6461 & CVE-2019-6462
> > +
> > +                CVE: CVE-2019-6463 & CVE-2019-6464
> > +                Upstream-Status: Pending
> > +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > +                index 390397bae..1bde774a4 100644
> > +                --- a/src/cairo-arc.c
> > +                +++ b/src/cairo-arc.c
> > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t  =
        *cr,
> > +                    if (cairo_status (cr))
> > +                        return;
> > +
> > +                -    assert (angle_max >=3D angle_min);
> > +                +    if (angle_max < angle_min)
> > +                +       return;
> > +
> > +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CI=
RCLES) {
> > +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_P=
I);
> > +
> > +            """),
> > +            ),
> > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE-
> > 2019-6464"},
> > +        )
> >
> >      def test_recipe_report_json(self):
> >          config =3D """
> > --
> > 2.34.1


