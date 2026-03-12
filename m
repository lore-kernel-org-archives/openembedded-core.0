Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7639103E2FA
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 00:51:43 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11485.1773276700990380830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 17:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 12 Mar 2026 09:51:38 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo5.lge.com) (165.244.147.16)
	by 156.147.1.151 with ESMTP; 12 Mar 2026 09:51:38 +0900
X-Original-SENDERIP: 165.244.147.16
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SLXP216CU001.outbound.protection.outlook.com) (40.93.138.29)
	by 165.244.147.16 with ESMTP; 12 Mar 2026 09:51:38 +0900
X-Original-SENDERIP: 40.93.138.29
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: richard.purdie@linuxfoundation.org,
	Qi.Chen@windriver.com,
	openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROo80r9uU/SesTTaKlZo3HfJMrkHOVPMAYtIeLzlHhZ6j2zu1TkOpmhhBrCNLCQGwFAaJQUT2o9WkvUdtv7XS1g2n+CcLora42ZiGcOh6x1qTWPNNv7gxar21XVNev7oAKvajeIw3hOgRBp6N6OVF+NA0rgES6JhPANdiHpawhpA/YmI2SKR6Zw/wM4DZBZn65FaozQUjgPGe1qP9TRTkwzK0sAemsI4XkXV7GL5hjqsc44N+t8Ud7Uo+KrPDn2pInBr8jLoyhRPoBO+4WJi5GFDW8g1dc1sOODdPV+aIRM1R1mybLvcS6ttKyg03WwjtjMgORAmbra7CZY/frLMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZkPCfd0pp6Fs7jOS+V5UlpgJDxSCbqRxSymGlczn0Q=;
 b=O+sG2j2Nt0KKKpaLGRnaAguG3nlTrRKsfVpd4cBIpci0PNS/Y3QF8Y1zB/ydd7beC8y/9VrdRdlBIbaoPK963f3HvyQNI1BnPK4Y6JB6UxXaTXNSd07mnjXpG6jUKIAFQy6svJ4PjuI3+CitvrzNkHA4jfDcKXWgdRjKYjiW8KXIKyr1JLuLMDsFXrgXXO4Eo1M4TPnn2i0qzlbulUkpqqJIgGrZus+qmtBcq6HEl9IoWwA34vuH/WMilPVe83NY02bndTszbh05gdrEUYa56T1ZNXBWYnY+5vncj0cv5+A3apUCYYaHMnyk5NyVrdpz9xVKxh7cCNXwaN6SzG1EOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by PUVP216MB3290.KORP216.PROD.OUTLOOK.COM (2603:1096:301:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:51:37 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 00:51:37 +0000
From: =?ks_c_5601-1987?B?waTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+sKbyxx+BQ?=
 =?ks_c_5601-1987?B?bGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	=?ks_c_5601-1987?B?waTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+sKbyxx+BQ?=
 =?ks_c_5601-1987?B?bGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
Subject: Re: [OE-core] [PATCH] package/classextend: Extend package variables
 for a multilib variant
Thread-Topic: [OE-core] [PATCH] package/classextend: Extend package variables
 for a multilib variant
Thread-Index: AQHcnBMY+FvQd8I+0UaBQcsyb20JprWqO0C1
Date: Thu, 12 Mar 2026 00:51:37 +0000
Message-ID: 
 <PU4P216MB113351272682AF1DFF5F8EFA9A44A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <18937C686E7FBEA2.4089548@lists.openembedded.org>
In-Reply-To: <18937C686E7FBEA2.4089548@lists.openembedded.org>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|PUVP216MB3290:EE_
x-ms-office365-filtering-correlation-id: 64cc4ade-b99f-48a2-16ce-08de7fd18400
x-ld-processed: 5069cde4-642a-45c0-8094-d0c2dec10be3,ExtFwd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|31052699007|39142699007|8096899003|56012099003|18002099003|55112099003|22082099003|7053199007|38070700021|95630200002;
x-microsoft-antispam-message-info: 
 2H051SK11D7pp5OR1Mnk0afqUOFpTwDRgkp75uLzkp5XmDg0qfqT+tfreljrmGBmZ3UtnBkbTf4UYkcxC/sypnK6Os9I/JrMJiW+mfWVzCTx1brh6da5VwP2RKZOgnwE6Z4fmTbLUxW4Xs9fY6qCaHEzcAtIJvP3H9ng2TAn/OKUGHJNAv6TCre4UesgMz5wtYCQmkBnMOgf0lwd4qWtcsv1zUg/Ah/3shcd/ANBcyneZqvsKZp2/CXPcrZp7i2fX5aiFy1ZJDDaAYSY1/9nCFz2kWTiLqyIAG+vnyIABb+d19M1ktGEJwaajfAIFEwIpYniOaI3rW6K/KgxPXuoIQYPLx+s8s0zMEopQG71qOI8/HWSiANui4ssrASJ8FtDuyGhQuYwF14DgJZzWUTUiOpcgAA79iw4tMrr03ttprlUdXyKYK8xZLpIrdckS+vlXfsKUgbXSawZ5rsl4fW42RIMF9DwS7umEF8LSRnXENYv1ewsp2U+V6MsbTvA6GIQ6lxXzDk7yXOikx2NCqIoNGxA0ulAq84q2S3y0LVuQEQ760Vc3ttkbLuYLFobtd2rrSJf36N/VPBkS6rFIBBpxwPaR1OVmiaOqW7EP6ri7WRpe7gcOeAs21cDUp33UU//wAu8nfQlxNVapKWIN0sBsd61XPPL3erczRd+SN/6gw0ziZ9+MZnEMew7/pdJgQwGRtcR9TSiY1XPQU4qaoIdUYRdFbkyNR+cXFovaDaNOvjjVtQLUStr3Vwnghp5IatsaS1QEYVhQWWwy67WtLSngVXZoFb3ZrTXZq+vUdD+kdLzICFf1e4F5fikTlOrnerI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(31052699007)(39142699007)(8096899003)(56012099003)(18002099003)(55112099003)(22082099003)(7053199007)(38070700021)(95630200002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?dWdaemRqRGQrUWFMMk85S2NnbHJGU1N1WGRRaTVWY0tOOG5PNGVD?=
 =?ks_c_5601-1987?B?U0daaTZsWWU0RHlLQWJZQWM4Y0xVVGxwYmZ5cFNrcUxabW5tU3Ay?=
 =?ks_c_5601-1987?B?ZmVqeFNVNHREdTk1MDJMUG11dXA3N0xGZDZSanRLeEhiQXhnMnk1?=
 =?ks_c_5601-1987?B?QTl2MmJiRDVodzF3Q1V0K2YrWWlqdjZnV1hXTU84QmtvU1BBd1Ft?=
 =?ks_c_5601-1987?B?YzcwcndGdnhIclVmRGtIeVJoMy9INFFQbGpnQlYwc3puRGtRZG9i?=
 =?ks_c_5601-1987?B?WFJBeHV4VHhmanl6Y1l5TWxuQ3RqYitWN3NUSmIyUnFSb21ENW9Y?=
 =?ks_c_5601-1987?B?Vm1HWkR1Tk9WaUtlZ1V5TGlReDJiWHE1MWhMYnJIdHdoT3loeFho?=
 =?ks_c_5601-1987?B?anZDUklHSkNSNGc2OHZOQ3JNZWNWcUJJaEs3a2dHUVpFYTVJVjZl?=
 =?ks_c_5601-1987?B?V3RDWTQ3Mk5hTk9maEROUEZsZUZVTUNQYlFYQ2tLS0hqWGFTS3lE?=
 =?ks_c_5601-1987?B?SU1JZCs2Mmk1Q2JhU013MmdlYnlXQ2tOOTlYT0x2U2U4ZU8wL0Jk?=
 =?ks_c_5601-1987?B?T3pMc21SemNtUUsyTEJPZFJ1blhDMlNSd1c0VkhTSHNscVhXOEpR?=
 =?ks_c_5601-1987?B?a1pxajhJbmYyVHpoYytWVXJmekFsSjdUUnFES2pTV3JIb3hVbGZh?=
 =?ks_c_5601-1987?B?N0kyYmRDaXo0N3M0SW1EL0NvWUpnRndHTUlxMU9RNnI5S0VCTm9M?=
 =?ks_c_5601-1987?B?ZTZNdFB2aTQxbUFOQzRlT1lyTk9saDM1L1dtRzBRRXhJVnpkK0Js?=
 =?ks_c_5601-1987?B?cXQ2eTlhWjhUQjlnTGEwS21ZdS9LcWhRbm9BdFNHcDZicGNwWS94?=
 =?ks_c_5601-1987?B?SUVuS1RQcVoxZ3BEcFFNL0dybTdSS01xaG9lSVpQdzJ4VytoRmkw?=
 =?ks_c_5601-1987?B?V3lFTXY2ZnY2SUhzejA4azhjL1FrSFdoWnRQd2FMeVVkd1dHNVg0?=
 =?ks_c_5601-1987?B?dlVEK3ZvYTBsWkpOWE1vS2VHRjBxRkRDQ1BJZ04vUzF3Szc5QjhV?=
 =?ks_c_5601-1987?B?ck1zbDE3b09rdEdsUTBFa0E4SWI1Zk4wdDJXUVhBUWxFYkVrSmU2?=
 =?ks_c_5601-1987?B?V0RXR0pSd3JwaFZNNjE1TXZFbWw2U2JEYXJTY0hJOXhQdXhXZ2ht?=
 =?ks_c_5601-1987?B?MjVaUXZFUHRMVEZqbW5hOXJuZE1pVWRwYnBmTFdpenNMME1EYlhF?=
 =?ks_c_5601-1987?B?WnlXMzlBRHlET1ZLOWVMVjJUN0dCUGVnVTB1MnpxUlZJeXBRVVRx?=
 =?ks_c_5601-1987?B?Lzk2Y1kvTjJGR3NmRExxWjJhREx0bFU4bUpuRU5GV1dmQ0pxNFFN?=
 =?ks_c_5601-1987?B?bVpBRDZVNkVQVmNDK1JteHFnbEIxbjBPS3A2SGh4c1cxOWwwZGVP?=
 =?ks_c_5601-1987?B?NnpZYUxybmpETTdWbWN1cVpNcDNsZTJpWitkblFmWjA5WHdhWkww?=
 =?ks_c_5601-1987?B?b2l6MW5SWCtldXMrRlNwemlCODFhV0xIZm1McHJFcUhyMHJMNjJm?=
 =?ks_c_5601-1987?B?cGpWL0s4Y3V2NGxEVEFpclFSR2xGcjkxbXRjY1FFRUE5aTVGRDR5?=
 =?ks_c_5601-1987?B?QVhVL2I3Y3VjbTdSWnh4ajhRaWtGbnd2dmw2cm9EUFl2bWlaUFk5?=
 =?ks_c_5601-1987?B?eTJJZ3pCZUNEQk42MDRaOTdzZXZ6bTJCdSs2SmtuZytYMHlnSUtL?=
 =?ks_c_5601-1987?B?Rm1aVk5QUmxJK1I5NVNHSmQ4NkM3Wk1NSDBwUm5oTHZ3L1dXSStx?=
 =?ks_c_5601-1987?B?eHVubGFtbHFKOE1XK2N2VDFHWVp6K0NSZXJ1VE1icmdRN3VFMldU?=
 =?ks_c_5601-1987?B?ZWZJazB5ZEw1V1d3cS9GMWkzRnZXOXgxL0tHaUdYVkw3aWFIQ1hW?=
 =?ks_c_5601-1987?B?NitUa3FOejJpazBJRUhTeWxtbVdyWXg5NmtHQnNRUnliUTc0aExo?=
 =?ks_c_5601-1987?B?ZDB0elgxYWxaeDZKSXVSUXRJd0RTTFM3bTVUamxxTHgwVzZuMVlV?=
 =?ks_c_5601-1987?B?RnBwKzA1N0xuWDFKVHY0azRwQnhZNlhsN1dHQWpHeWdXN0trWFRs?=
 =?ks_c_5601-1987?B?bTdqUzVRdHVqSWJ0Uk1GZ3l6c3V1MVc4RlVHOGlwUm1aQmowU1lF?=
 =?ks_c_5601-1987?B?dzluNkZhMlcvUC8xaHpndlBNdWo5RGdkOHQvMXg5SGlWcTh1V0Iw?=
 =?ks_c_5601-1987?B?RTBpQ3JBNVBUMlRVa0JXK1c4cllSOE1OaThvT1hKK1orN3NJLy9X?=
 =?ks_c_5601-1987?B?SWVSZTZ0L09iWW55czFadWlHT0RnYlE0Q05Kb3BDeW1wNS9LWEl2?=
 =?ks_c_5601-1987?B?amVrSEQwSndLUGJTNTI4WkpXcXg0a2czWlk1M3g3SmpxQnRJZHJx?=
 =?ks_c_5601-1987?B?M1ZWTmxSK0VHOG1mV1I3dWRlOVg3WHZKSDIvZHpxRzQ2cE5qQ0Fu?=
 =?ks_c_5601-1987?B?MUtyMzIyTUZ5cWw2ekRYaE1ZaG91Z0M4NmdVcS8vQVZpaE5aWXZM?=
 =?ks_c_5601-1987?B?bWZUQkdjaldCN1BnSnNucjVRdUxYclU1eFU3cVJRa3laR1ZYL0Ry?=
 =?ks_c_5601-1987?B?WDM3MzNiMUlOdVFIbHBsakJOMExLQngxcVpkajB6VlFoZUFIcExa?=
 =?ks_c_5601-1987?B?Y3Y2QUN0ZkNieTZLaUZCR1drQ2FuazJoVUpGU01uNlF4dz09?=
Content-Type: multipart/alternative;
	boundary="_000_PU4P216MB113351272682AF1DFF5F8EFA9A44APU4P216MB1133KORP_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	lFaTxNUDIZminx59w1mNnsIr5/rQ9UbsQAn6mp0sQDhHtLsppqZkDrc7Iyz/iDiPf5Yb+kGn8iWeTV7JjvLwyblJSMtyIgXf6Si0nVAmO5Iq5gOAcKpBBovQjZcFfLJ/+cRh5QFCbeYZOKN9VqwYhOE3WFbsRHpZfvDhebPQWTPpx2wL+oeFlTJQku3L2HvoO5YHxEHVhmg2qHqo9gR1jQmG/IzlQh7+1Ki0fVNR+7hcnxCmDXIlxM4S/YTL7Z6XqdL2e7LanQZwU3fgAwelw0sUdlualu2Dy+5X8J0tCukYq5V/I7E8XXWzAZQnjuza42AXka+GfjrnCQ1ZJ/d8dA==
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cc4ade-b99f-48a2-16ce-08de7fd18400
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 00:51:37.1842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsinsH5bHAKll1f+WmG6Gf5I3XlrrlrqqkgvESq8k9LVjrMIYYd+VDmzMZRmGneWH+azJuCWtjgfOIF/XR3nOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB3290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 00:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232919

--_000_PU4P216MB113351272682AF1DFF5F8EFA9A44APU4P216MB1133KORP_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGksDQoNCkkgbm90aWNlZCB0aGF0IHRoaXMgaGFzbid0IGJlZW4gYWNjZXB0ZWQgeWV0LCBub3Ig
bWFya2VkIGFzIG5lZWRpbmcgaW1wcm92ZW1lbnQuDQpTaG91bGQgSSByZXNlbmQgaXQgcmViYXNl
ZCB0byB0aGUgbGF0ZXN0IEhFQUQ/DQoNCg0KQmVzdCByZWdhcmRzLA0KLS0tDQpKYWV5b29uIEp1
bmcNClNvZnR3YXJlIFBsYXRmb3JtIExhYi4gLyBDb3Jwb3JhdGUgUiZEIC8gTEcgRWxlY3Ryb25p
Y3MgSW5jLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gb24gYmVoYWxmIG9mIEphZXlvb24gSnVuZyAoTEdFKSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8amFleW9vbi5qdW5nPWxnZS5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMiwgMjAyNiAyMDozMA0KVG86
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpDYzogcmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZyA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47IFFpLkNoZW5A
d2luZHJpdmVyLmNvbSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgwaTA58CxL1Rhc2sgTGVhZGVy
L1NXIFBsYXRmb3JtKL+sKbyxx+BQbGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFz
ayA8amFleW9vbi5qdW5nQGxnZS5jb20+DQpTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIXSBwYWNr
YWdlL2NsYXNzZXh0ZW5kOiBFeHRlbmQgcGFja2FnZSB2YXJpYWJsZXMgZm9yIGEgbXVsdGlsaWIg
dmFyaWFudA0KDQpGcm9tOiBKYWV5b29uIEp1bmcgPGphZXlvb24uanVuZ0BsZ2UuY29tPg0KDQpJ
dCBleHRlbmRzIHBhY2thZ2UgdmFyaWFibGVzIGluIGNhc2UgbWlzc2luZyBmb3IgYSBkeW5hbWlj
IHBhY2thZ2UgYWRkZWQNCmR1cmluZyBkb19zcGxpdF9wYWNrYWdlcy4gSXQncyBuZWVkZWQgZm9y
IGEgbXVsdGlsaWIgYnVpbGQgd2hlcmUgc29tZQ0KcGVyLXBhY2thZ2UgdmFyaWFibGVzIHNob3Vs
ZCBiZSB0cmVhdGVkIGFzIG11bHRpbGliIHZhcmlhbnRzLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYWV5
b29uIEp1bmcgPGphZXlvb24uanVuZ0BsZ2UuY29tPg0KLS0tDQogbWV0YS9jbGFzc2VzLWdsb2Jh
bC9wYWNrYWdlLmJiY2xhc3MgfCAxMSArKysrKysrKysrKw0KIG1ldGEvbGliL29lL2NsYXNzZXh0
ZW5kLnB5ICAgICAgICAgIHwgIDUgKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtZ2xvYmFs
L3BhY2thZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNzDQpp
bmRleCBiZDMyYTZlZGU1Li4xZDc3OWY3MTRiIDEwMDY0NA0KLS0tIGEvbWV0YS9jbGFzc2VzLWds
b2JhbC9wYWNrYWdlLmJiY2xhc3MNCisrKyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5i
YmNsYXNzDQpAQCAtMTY5LDYgKzE2OSw3IEBAIGRlZiBkb19zcGxpdF9wYWNrYWdlcyhkLCByb290
LCBmaWxlX3JlZ2V4LCBvdXRwdXRfcGF0dGVybiwgZGVzY3JpcHRpb24sIHBvc3RpbnN0DQoNCiAg
ICAgZm9yIG8gaW4gc29ydGVkKG9ianMpOg0KICAgICAgICAgaW1wb3J0IHJlLCBzdGF0DQorICAg
ICAgICBpbXBvcnQgb2UucGFja2FnZQ0KICAgICAgICAgaWYgbWF0Y2hfcGF0aDoNCiAgICAgICAg
ICAgICBtID0gcmUubWF0Y2goZmlsZV9yZWdleCwgbykNCiAgICAgICAgIGVsc2U6DQpAQCAtMjI1
LDYgKzIyNiwxNiBAQCBkZWYgZG9fc3BsaXRfcGFja2FnZXMoZCwgcm9vdCwgZmlsZV9yZWdleCwg
b3V0cHV0X3BhdHRlcm4sIGRlc2NyaXB0aW9uLCBwb3N0aW5zdA0KICAgICAgICAgICAgIGhvb2so
ZiwgcGtnLCBmaWxlX3JlZ2V4LCBvdXRwdXRfcGF0dGVybiwgbS5ncm91cCgxKSkNCg0KICAgICBk
LnNldFZhcignUEFDS0FHRVMnLCAnICcuam9pbihwYWNrYWdlcykpDQorDQorICAgIHZhcmlhbnQg
PSBkLmdldFZhcigiQkJFWFRFTkRWQVJJQU5UIikNCisgICAgcHJlZml4ZXMgPSAoZC5nZXRWYXIo
Ik1VTFRJTElCX1ZBUklBTlRTIikgb3IgIiIpLnNwbGl0KCkNCisgICAgaWYgdmFyaWFudCBhbmQg
cHJlZml4ZXM6DQorICAgICAgICBpbXBvcnQgb2UuY2xhc3NleHRlbmQNCisNCisgICAgICAgICMg
RXh0ZW5kIHBhY2thZ2UgdmFyaWFibGVzIGZvciB0aGUgZ2l2ZW4gdmFyaWFudCBpZiB1bnNldA0K
KyAgICAgICAgY2xzZXh0ZW5kID0gb2UuY2xhc3NleHRlbmQuQ2xhc3NFeHRlbmRlcih2YXJpYW50
LCBwcmVmaXhlcywgZCkNCisgICAgICAgIGNsc2V4dGVuZC5yZW5hbWVfcGFja2FnZV92YXJpYWJs
ZXMoKGQuZ2V0VmFyKCJQQUNLQUdFVkFSUyIpIG9yICIiKS5zcGxpdCgpLCBvdmVyd3JpdGU9RmFs
c2UpDQorDQogICAgIHJldHVybiBsaXN0KHNwbGl0X3BhY2thZ2VzKQ0KDQogUEFDS0FHRV9ERVBF
TkRTICs9ICJmaWxlLW5hdGl2ZSINCmRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS9jbGFzc2V4dGVu
ZC5weSBiL21ldGEvbGliL29lL2NsYXNzZXh0ZW5kLnB5DQppbmRleCBkZGNhMTBkZWU1Li44Yjk2
MDJlMzE2IDEwMDY0NA0KLS0tIGEvbWV0YS9saWIvb2UvY2xhc3NleHRlbmQucHkNCisrKyBiL21l
dGEvbGliL29lL2NsYXNzZXh0ZW5kLnB5DQpAQCAtMTI4LDcgKzEyOCw3IEBAIGNsYXNzIENsYXNz
RXh0ZW5kZXIob2JqZWN0KToNCiAgICAgICAgIHNlbGYuc2V0X2ZpbHRlcigiUkNPTkZMSUNUUyIs
IGRlcHM9VHJ1ZSkNCiAgICAgICAgIHNlbGYuc2V0X2ZpbHRlcigiUEtHIiwgZGVwcz1UcnVlKQ0K
DQotICAgIGRlZiByZW5hbWVfcGFja2FnZV92YXJpYWJsZXMoc2VsZiwgdmFyaWFibGVzKToNCisg
ICAgZGVmIHJlbmFtZV9wYWNrYWdlX3ZhcmlhYmxlcyhzZWxmLCB2YXJpYWJsZXMsIG92ZXJ3cml0
ZT1UcnVlKToNCiAgICAgICAgIHBrZ3NfbWFwcGluZyA9IGdldF9wYWNrYWdlX21hcHBpbmdzKHNl
bGYuZC5nZXRWYXIoJ1BBQ0tBR0VTJyksIHNlbGYuZXh0bmFtZSkNCiAgICAgICAgIHNlbGYuZC5z
ZXRWYXJGaWx0ZXIoJ1BBQ0tBR0VTJywgInBhY2thZ2Vfc3VmZml4X2ZpbHRlcih2YWwsICciICsg
c2VsZi5leHRuYW1lICsgIicpIikNCiAgICAgICAgIHNlbGYuZC5zZXRWYXJGaWx0ZXIoJ1BBQ0tB
R0VTX0RZTkFNSUMnLCAic3VmZml4X2ZpbHRlcl9yZWdleCh2YWwsICciICsgc2VsZi5leHRuYW1l
ICsgIicsICIgKyBzdHIoc2VsZi5wcmVmaXhlcykgKyAiKSIpDQpAQCAtMTM3LDQgKzEzNyw1IEBA
IGNsYXNzIENsYXNzRXh0ZW5kZXIob2JqZWN0KToNCiAgICAgICAgICAgICBpZiBwa2dfbWFwcGlu
Z1swXS5zdGFydHN3aXRoKCIkeyIpIGFuZCBwa2dfbWFwcGluZ1swXS5lbmRzd2l0aCgifSIpOg0K
ICAgICAgICAgICAgICAgICBjb250aW51ZQ0KICAgICAgICAgICAgIGZvciBzdWJzIGluIHZhcmlh
YmxlczoNCi0gICAgICAgICAgICAgICAgc2VsZi5kLnJlbmFtZVZhcigiJXM6JXMiICUgKHN1YnMs
IHBrZ19tYXBwaW5nWzBdKSwgIiVzOiVzIiAlIChzdWJzLCBwa2dfbWFwcGluZ1sxXSkpDQorICAg
ICAgICAgICAgICAgIGlmIG92ZXJ3cml0ZSBvciBub3Qgc2VsZi5kLmdldFZhcigiJXM6JXMiICUg
KHN1YnMsIHBrZ19tYXBwaW5nWzFdKSk6DQorICAgICAgICAgICAgICAgICAgICBzZWxmLmQucmVu
YW1lVmFyKCIlczolcyIgJSAoc3VicywgcGtnX21hcHBpbmdbMF0pLCAiJXM6JXMiICUgKHN1YnMs
IHBrZ19tYXBwaW5nWzFdKSkNCi0tDQoyLjQ3LjINCg0K

--_000_PU4P216MB113351272682AF1DFF5F8EFA9A44APU4P216MB1133KORP_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I noticed that this hasn't been accepted yet, nor marked as needing improve=
ment.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Should I resend it rebased to the latest HEAD?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Best regards,</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: &quot;Malgun Gothic&quot;, &quot;=B8=BC=C0=BA =
=B0=ED=B5=F1&quot;, AppleGothic, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri; font-size: 13.3333px; background-color=
: rgb(255, 255, 255);">---</span><span style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Jaeyoon Jung</span><span style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Software Platform Lab. / Corporate R&amp;D / =
LG Electronics Inc.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Jaeyoon Jung (LGE) via lists.openembedded.org
 &lt;jaeyoon.jung=3Dlge.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, February 12, 2026 20:30<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;; Qi.Chen@windriver.com &lt;Qi.Chen@windriver.com&gt;; =C1=A4=
=C0=E7=C0=B1/Task Leader/SW Platform(=BF=AC)=BC=B1=C7=E0Platform=B0=B3=B9=
=DF=BD=C7 Lightweight System Task &lt;jaeyoon.jung@lge.com&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] package/classextend: Extend package varia=
bles for a multilib variant</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br=
>
<br>
It extends package variables in case missing for a dynamic package added<br=
>
during do_split_packages. It's needed for a multilib build where some<br>
per-package variables should be treated as multilib variants.<br>
<br>
Signed-off-by: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
---<br>
&nbsp;meta/classes-global/package.bbclass | 11 +++++++++++<br>
&nbsp;meta/lib/oe/classextend.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 5 +++--<br>
&nbsp;2 files changed, 14 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index bd32a6ede5..1d779f714b 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_patte=
rn, description, postinst<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; for o in sorted(objs):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import re, stat<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import oe.package<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if match_path:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m =
=3D re.match(file_regex, o)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
@@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_patt=
ern, description, postinst<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ho=
ok(f, pkg, file_regex, output_pattern, m.group(1))<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('PACKAGES', ' '.join(packages))<br>
+<br>
+&nbsp;&nbsp;&nbsp; variant =3D d.getVar(&quot;BBEXTENDVARIANT&quot;)<br>
+&nbsp;&nbsp;&nbsp; prefixes =3D (d.getVar(&quot;MULTILIB_VARIANTS&quot;) o=
r &quot;&quot;).split()<br>
+&nbsp;&nbsp;&nbsp; if variant and prefixes:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import oe.classextend<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Extend package variables for =
the given variant if unset<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clsextend =3D oe.classextend.Cl=
assExtender(variant, prefixes, d)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clsextend.rename_package_variab=
les((d.getVar(&quot;PACKAGEVARS&quot;) or &quot;&quot;).split(), overwrite=
=3DFalse)<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; return list(split_packages)<br>
&nbsp;<br>
&nbsp;PACKAGE_DEPENDS +=3D &quot;file-native&quot;<br>
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py<br>
index ddca10dee5..8b9602e316 100644<br>
--- a/meta/lib/oe/classextend.py<br>
+++ b/meta/lib/oe/classextend.py<br>
@@ -128,7 +128,7 @@ class ClassExtender(object):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.set_filter(&quot;RCON=
FLICTS&quot;, deps=3DTrue)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.set_filter(&quot;PKG&=
quot;, deps=3DTrue)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; def rename_package_variables(self, variables):<br>
+&nbsp;&nbsp;&nbsp; def rename_package_variables(self, variables, overwrite=
=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgs_mapping =3D get_packa=
ge_mappings(self.d.getVar('PACKAGES'), self.extname)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.setVarFilter('PACKA=
GES', &quot;package_suffix_filter(val, '&quot; + self.extname + &quot;')&qu=
ot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.setVarFilter('PACKA=
GES_DYNAMIC', &quot;suffix_filter_regex(val, '&quot; + self.extname + &quot=
;', &quot; + str(self.prefixes) + &quot;)&quot;)<br>
@@ -137,4 +137,5 @@ class ClassExtender(object):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 pkg_mapping[0].startswith(&quot;${&quot;) and pkg_mapping[0].endswith(&quo=
t;}&quot;):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; continue<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r subs in variables:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; self.d.renameVar(&quot;%s:%s&quot; % (subs, pkg_mapping[0]=
), &quot;%s:%s&quot; % (subs, pkg_mapping[1]))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if overwrite or not self.d.getVar(&quot;%s:%s&quot; % (sub=
s, pkg_mapping[1])):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.renameVar(&quot;%s:%s&quot;=
 % (subs, pkg_mapping[0]), &quot;%s:%s&quot; % (subs, pkg_mapping[1]))<br>
-- <br>
2.47.2<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PU4P216MB113351272682AF1DFF5F8EFA9A44APU4P216MB1133KORP_--

