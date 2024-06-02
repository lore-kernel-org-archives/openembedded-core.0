Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E167C25B7E
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 17:33:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.63511.1717349626378651895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 10:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RiE/MVPy;
 spf=pass (domain: siemens.com, ip: 40.107.20.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAxQDG18YQZKcltXklsqENBE9VN5Fo4kCl/yLHDmKppe+5NLKmNVR/4Q/J5tpRck+lRns1YESGssKTBX4V5eNbcADj6EA0jFP/jsDtRGJdvyfGWgXjIvqMvpR3j9dIjX3TdbD8a/muF/XkP8VCa7LGWuGkMX4nLOU8HcUp47XPzwzEDnOqCq7pxTpMQdJOGDOsJOvRG8Xh4txPUcxZnZnqctwHL+YZG8uu1IvH+Htny81nIfBy/qCjvPCKYnvP0XRrYWU6NwTq47iMjliaD6iUEGqBXnV2WCbSErJjIU/YD93P/+Ky69GeVvgouZ2pPNztQHG1Y/fe+60ZRETt73pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5o3IMNPDDTGRlsfMnMrkAQKaePwY6eduy7GgDLaQ8E=;
 b=AmaVh6L9b7F8WFjnKiLShOE8PvtZwY1S5fJR8pyserExFHBnGuBFl+lqPADidKJyqe/0I0T3a/fkgFhKyf4wW6f6Lv+bJfhLeeWf0FSKQgLeie+4FuaWaBtRduqIFxDgLEfLD6j6FwhDGMNfMMAI9/KFM5bH+uzmlom6RZcv5Y6SzQfZ/DPOHUulvdUC3W/XoBiiFB+nlRP4IGmFZBSFnGeXNUcF84ax2g0z2J6qYZ0+wg5QCdVHN/+4292zvecZio6PbKokR6XHd+d3uQRRlJgQ5IDFGltnQMXPeGTLju0D7CNm71W3ANP+raB6bVVNxtJAK39ZR0ZQ83dIEKSx2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5o3IMNPDDTGRlsfMnMrkAQKaePwY6eduy7GgDLaQ8E=;
 b=RiE/MVPyYoIXQH7iNsrt+Qg+XPiNaijnIyRv7JS/fxHr/uafd9NtGrf1fI0Wysmzeqdm987n4UJd4I3uUmuPzV8T/+nq1PEnway6DJmYq49N2HaF0mo7oD66mkJtnabkpuBId4+sZtLhaf1/s6Eoh7bqKmmpa0aK3RXjVJM4kGOUS64UiHV+X/PTa9dVPkWycXaYBUV0s9RphPmggJFrvJmWMUEs3Ke2QuUiJvMwUvsPYBCHURUPTpld/PnEIhhYK43hxZRoI4VIxW7MbYs59XYbcrax9iGlIoYrzQDCFZq/d79bOifrP4z06JMrXVgAjdRsl/p1GF9yOh3DXqa3eg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB8211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:388::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Sun, 2 Jun
 2024 17:33:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7633.018; Sun, 2 Jun 2024
 17:33:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "sdoshi@mvista.com" <sdoshi@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] openssl: Security fix for
 CVE-2024-4741
Thread-Topic: [OE-core][kirkstone][PATCH] openssl: Security fix for
 CVE-2024-4741
Thread-Index: AQHatQxM16XjXLcDZ0eoD9azOg/RAbG0uUSw
Date: Sun, 2 Jun 2024 17:33:36 +0000
Message-ID: 
 <AS1PR10MB5697AB1D0FEA8F5683503339FDFE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240602164519.126463-1-sdoshi@mvista.com>
In-Reply-To: <20240602164519.126463-1-sdoshi@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9e46f8ce-407c-462a-9e52-b56946bf2eda;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-06-02T17:24:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB8211:EE_
x-ms-office365-filtering-correlation-id: b1cf8229-0f16-42d7-4002-08dc832a2213
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?M5EzhqtOy/RdHRkYmGo0gLZju0wuuRRrmkNlQeyqvPUsmnVppvymTBki3kSz?=
 =?us-ascii?Q?uqDIYaN7OMfXnFzGT/2UcTk5EFwgPXR++1Hd32XfX5/bLLbURt3kkKPip4eB?=
 =?us-ascii?Q?nKZt3NuktTLcyF9Sv8YGY54ykOSK6RnwPobYMp5NlZQmDGySBRR9Cc1G0cl7?=
 =?us-ascii?Q?+qPPS2QjIGqZWire/UVIBxleaJUBScFAtwSrF041tWCKFfsrS/sYvmonVNAJ?=
 =?us-ascii?Q?ysSKbW7dpUdmpo4T115kxoURX2kFYP+kP8jE3Efvi7XvWPX/L0hlS9egq35M?=
 =?us-ascii?Q?EoV9tfGU6nxVNG1TltRSmCRh8oIa96z/iiknFaNhj3MFkkeeCptk3/8BOMDa?=
 =?us-ascii?Q?sPSfyxhRvVc1scjZ2XVjrEa0P3Q4V6xK6OvqbBtqR2JFentHaQXiqgtwXk53?=
 =?us-ascii?Q?XSyaaZ0tGAnvQP9Wt8g7FRRwYVq3SblSwmctx+RrwsXNx2WvTJ91wD9XfYTH?=
 =?us-ascii?Q?w9rRC2kt3nRZn+PLsNygz33rsTMaHAhkszLYB2UL+o5FlXESU6gxySOpPqfW?=
 =?us-ascii?Q?0/dlwLPvINs6BLKUuWjvYmrnRcMUj0TKB155S71vuN9DRLteev81b/oM4TMW?=
 =?us-ascii?Q?/rvmYUY73zLBLw9a1JcdVp7OJIA6aaEB9Wm+b3MIcroN0MVPgiLHrRLf8YvA?=
 =?us-ascii?Q?QyWDjwdtjaRzQSDVPGFYkr/lRCpXAnxMsmCSwRRqsiD+gdEfNZFJ9uh7GpcR?=
 =?us-ascii?Q?ds5m/GstFpuxdmtf+8egnYaeuBNtFIVYrPGE8OHy65jlRmKPgHx0cbyTuex7?=
 =?us-ascii?Q?LbxHqmB0PMPq1O3/SoB+/BwmyGyQXpIAYdYfb987W+lxzjvM/8UuD1677GgU?=
 =?us-ascii?Q?EpFwhk2lFS5Tw2GOHnvH1tDl5M9MAG761V8X6F/COTouIuvWNbBzpUAd84P1?=
 =?us-ascii?Q?/wpmNNNFodvAMgMNEqGVUnUSW7DQYrcNa1PjDiVHP4E1To+CXHjsMD4WXUbP?=
 =?us-ascii?Q?hQZzQDDvMJ0J5M/tVAjpklkray4mcHIyPP46oXd4MVyY7SSs73La3hYZsFql?=
 =?us-ascii?Q?8sLMlp+U5iSPayvHp1kFPpdTk0SeyVLcPQ9ZClQUNWXUN6GYLqF4ejTen6oU?=
 =?us-ascii?Q?0OIA0nCQHGLUyXSPpqmrCv85qUN7sC4IlDpm4ER61GF88oUsOxQaUEU6G7+d?=
 =?us-ascii?Q?vhIrcXbjhCkFHrQI1DA5vzevGCsfFpbWkKswv70Wav38yv2axveULncciDyx?=
 =?us-ascii?Q?Eot9h8wiU6fmc4KMKN8/OgvwRgep0dB3Zlu0DMHjMKNBcYxNdWkVFekHIJo2?=
 =?us-ascii?Q?lZ6rdwmUTH14DgMuckcLGqk5cf51IdUDnwUYqBpeWg4OuGHRufNNoP1RGBpI?=
 =?us-ascii?Q?f3k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?H00My7JILa3yWO7Bk86Wxie4/LSs7Cwe747/f/WlBH9Z78IXCuYOv3NaIxGz?=
 =?us-ascii?Q?kZ1+QKm/fHEa0Il4zuE6ucLTi3RDxQLyM0yRzjYEp+9Lly0ajnHb/APQcSQF?=
 =?us-ascii?Q?KT5rGiQZJoNTcNBVBnyxeetSxJnNEE78HlYGjyJ3HRQBy+1BT5KMGvAl5XRA?=
 =?us-ascii?Q?Wb5WFgvw0rVibIodL1rwIyjxU8Z5fNa7C4wTWhWXWia66UHLA/ccd6ryUS/j?=
 =?us-ascii?Q?ghWqY5AVOEgI3uHQnImgNQYvoFppgwX9oglQcZaSRBpLo3ZveholMCijsgdL?=
 =?us-ascii?Q?5qSi+znDeL8N/UNgo72WS/2ja4dXc4KnkKTXhU9/3BXUqGsrXCN6LYkUI3kp?=
 =?us-ascii?Q?x3OYFj93tnDHHr5c3458DtP9tHRWofUt86tU8Md9vUuWF4/YPC6OcSeqLa7m?=
 =?us-ascii?Q?AFxUrYoWMGWW7uPjQNWXUe9bbhfZluFRwsTR8jTroBH8UMABeWsZovXFKgxO?=
 =?us-ascii?Q?9ntscYuUpNCdiMuGP4ZshzOnoomZFCzlst5oFPjV/F2Kfg0vrf7ToJeS4/0l?=
 =?us-ascii?Q?+kPvxebVDJ1ODtm/q8TQBvWjQFizmZQ5fAjeZRZ8VmKvk9H7wpt4zR219d10?=
 =?us-ascii?Q?egqx4j558yR2t52kqRgc6XOdKEOzEQ8SMOCyy9nFb0FnMwMfbJMWTQBqeZtO?=
 =?us-ascii?Q?Q9ZblBnVVtDcnqQJoHVxpcolPDcvMCBtFssREeOvbsWuZL2wLudA0Vbf878v?=
 =?us-ascii?Q?+nkUGGW1QrkaOJcv5Y5nTyuXWbdSZW+EfpMZUvYQXniZYZLgfkRwc3mUUaV4?=
 =?us-ascii?Q?7qyL+mXS8wMNSU7g6GJrvREw4BBKyRC4rZ9eB2zBbiFqt7JIpAf3fu3RNj/5?=
 =?us-ascii?Q?XJVRedi7P/BHnYyVahBLVN9Ylk5QCNFbNRRYRk+XHhIIEh1KC1gj9580nAKG?=
 =?us-ascii?Q?7Ny0+7NJbZ6LADXubMITwtYHg4UkxclbDdjDAC91Ypq7XsAwnWbacRwIrc7p?=
 =?us-ascii?Q?eLjpkEzujt9DISHm+KXodzgtv4yuvvzqjIoqJ1TuQ4/gIFe3nv/frcs58uPr?=
 =?us-ascii?Q?PD5iSWuIlx5Y4deIdV4Nvj62JLfEShHoxDyBBIV14ZCBRPr/vJ1uT6xIpNJJ?=
 =?us-ascii?Q?osplqQIoYVTa3h0UNGdXRlIkjaYf4wxddIj2xfxBiIeKjF6HjmuH7smdPVR0?=
 =?us-ascii?Q?g+79j4ZWJ4cfyAeyqn570do5FVNV8rKEPQUnxfARlcx7YrUWZ3KA3bIt7jCZ?=
 =?us-ascii?Q?FDE5JBkd/up1jQxELTKPgT9fOnEKfft/gi0AYARPPxGCVhCh/eV6mGnF1wK8?=
 =?us-ascii?Q?ZUY7a+9vu/FkIbG7cwG9VqgM9N0+IG3fV0rLagFfoxdnAwh1vA0WG0iAqx8L?=
 =?us-ascii?Q?Gv2JhBeq+EmA+yI6LqPWz6PMlYHb0bVOhTH3xNSaR9L7IEWP15chhjixN03c?=
 =?us-ascii?Q?DiQ0tAYQRl2i/jqmat8m3pOhlBwhADvNvHNs5gEhtpEgdD9WSGwpLomda4kI?=
 =?us-ascii?Q?uoFi8hHTSuAlmDpdV+/Q8FYk1Wcg3dKP39WNoveNo2XoUUw+p8eUsuh79OQy?=
 =?us-ascii?Q?xVY8poTeTUhQBmDRQR3b6T/7EZNlgbow9ZblT4lcEUba7HI1kh1TWqL9i2vG?=
 =?us-ascii?Q?qxlJVLKDfkKZ4n7XgEm9d6sRHNX844k4jbotQaIs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cf8229-0f16-42d7-4002-08dc832a2213
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2024 17:33:36.3024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7c2JWmsu6bdaCEQzf4XJ01iS2eV5Dt0dfkTXpgK8aM/CdY1aloPBHdJL36jum9KbvaL57wqqxnRE9/INIO+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 17:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200213

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Siddharth via lists.openembedded.org
Sent: Sunday, June 2, 2024 18:45
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Security fix for CVE-2024-474=
1

> From: Siddharth Doshi <sdoshi@mvista.com>
>=20
> Upstream-Status: Backport from [https://github.com/openssl/openssl/commit=
/3559e868e58005d15c6013a0c1fd832e51c73397]

Nitpick : above commit link references commit for CVE-2024-4603 (copy+paste=
 error).

The main problem of this patch (and the same patch for scarthgap) is that i=
t's picking only one out of 5 commits referencing this CVE.
At least https://github.com/openssl/openssl/commit/2d05959073c4bf8803401668=
b9df85931a08e020 needs to be picked.
But ideally also the remaining 3 which extend tests should be picked to ver=
ify these changes in ptest.
https://github.com/openssl/openssl/commit/6fef334f914abfcd988e53a32d19f01d8=
4529f74
https://github.com/openssl/openssl/commit/1359c00e683840154760b7ba9204bad1b=
13dc074
https://github.com/openssl/openssl/commit/d095674320c84b8ed1250715b1dd5ce05=
f9f267b

Peter

>=20
> CVE's Fixed:
> CVE-2024-4741:Use After Free with SSL_free_buffers
>=20
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>

