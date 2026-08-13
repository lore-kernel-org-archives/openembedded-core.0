Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684D9C5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:20:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14363.1786609215291791474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 01:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=zvcbT3D2;
 spf=pass (domain: est.tech, ip: 40.107.130.34, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/fGQXlC6X/WKxNYOcNnewKyA5B2ra2ADNMYuPfg9LcmM+BOGl7qL4dmhnKhDkV1IP1A1BnVngSPzWrP/goHCtczIn/F6sPOpm2h/CbW7AdYGSY8jTm+CrpQ9ixe1H0B5iaBuUQDobLqRShke8akTVQ5dmKeFhfttrSLSTn3D+dKnOv0SGc8XrMDpPL0Te8paUJQd3D6JxhqxE9ulaBk6CQV2sRQtERRHWRhrAw8/GeSSHL27qWJF/TmQYlvJQI2HrVSPLZMh3atw8tYnq7dUtGh1+VFUh1G2C/O0QqZ5heil/AEbUX+6b0kRYn8exyUiq0DaInSqGLatibvQ7ALYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faXdjqJ4gSr9XJgwM5y42LTOantXDID9Ymj6gBp/IQk=;
 b=mBrldMxgsX2OYzDxbqjftXGXywdrkqE7Wmakd4t0Yf5y8/9kY5yKRiJYDhdztH2N6sj8d7P5fK1nb/Yvj4kkW41aQwBf69TN4yUG4AMOio3z12S3lVRQfsbur2k2bzLCSmgpU6m2XWbcx3cjyTwJdDdDwekwEHbp3aW6fmpdctvhzeqUm6Ta2/Y73yzrmdAj+EZFcXI1ZUmNMEFEWIsQqViId3SCsnYxhy3fzNmS61bSvYS0F27VGQ37xgpZyf58zc3nSzyIo6HKYBLSHeWSEGO2ARMAlcrDzemw/C9ifz3Oq1gV3AZlilQgQ53n1Bg8fNWW1oQt7oVce9tp3/FHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faXdjqJ4gSr9XJgwM5y42LTOantXDID9Ymj6gBp/IQk=;
 b=zvcbT3D2Rb6c6cTFfEXstz99vJkt/73yiPsZiSQetR49Qf0uzNgy7H4PSBym93X5ySfGVpjhJ1cffuXmA/z1VddhxjwBYSlv/iCNoW6LCa/97mmW6FQgbNazYtbn610+bP2+Kr+CqfO6JO79Iu8a/M9KvdXUD2Hk7H8gRSPugXyHF5ItYUE55HofTiBDYRoOuu8kNvpgPfIyRa5cdRjHRt2luU3+wE+0VfNiNKC/VN58iyA0AK1L4sLMMGHlcozqNauqrGdJ16I4LI/Utz5PiE18oPxeyUk0AzgruV6niwwlG2EDM73Xbc+4IhfvbQ8DdcBzS5wDrsvfV7o8zlMcWA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM4P189MB3522.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 08:20:09 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 08:20:09 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] glib-2.0: skip a timing sensitive
 monotonic-time ptest
Thread-Topic: [OE-core][PATCH v2] glib-2.0: skip a timing sensitive
 monotonic-time ptest
Thread-Index: AQHdKistviaapM/qIkKeOUts1o5wlraaZXWAgAE+rYo=
Date: Thu, 13 Aug 2026 08:20:09 +0000
Message-ID: 
 <PA3P189MB32396DBA7B7904A6E6803D3AFEDB2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260805131657.35726-1-pratik.farkase@est.tech>
 <20260812072101.10905-1-pratik.farkase@est.tech>
 <DKMZSUFG7KYF.2SS2HP4BGLL5D@bootlin.com>
In-Reply-To: <DKMZSUFG7KYF.2SS2HP4BGLL5D@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AM4P189MB3522:EE_
x-ms-office365-filtering-correlation-id: d439748a-35cd-4779-691b-08def913b0b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 TORadKCwW41RpEnP7T1g4z5qLHyXHp68tePYikZOw0oFd3MHitsdCGTsIkLvS0uZuvAhpHY2Qri/I9nrtDZquzhCWa/wSzdhBKcsbIlW/SC6UNj3sQQzOnEFKHwYQ6Q4m3RxU2rOj27ZFolf+vXhSH+Sy2grPvkDwMWjzFy9jDwArGNSuNjgzcur95lQEmZNRHKwI/ZkIEcJy3HwTBQQMbd5s2OKfUqJka9toM5ozvEEOAPeEgYxCmjhCaPs7VQfdOrTHWsfar8+tgKSNjY+QqFyauNpisGiaEKlVXVdAPHBjka8o+SlkoZRpTpI+gjXj5GDQafinMPlC87CHSUgDqQv9YmNlopUZiI7+ocsJ0KoXE5+0ytC4EJqjvEEYkuCFelrdeEhLoDJdMm+ek0l9KEyJR4+Y8O3QclZrC3WMWmh0rHkiJhHIF36brvvPAMybWZszo6f4ldnA4Sz7Po8/FNH3xSy5jrI9oaQoKLjLsHyKQXUtkdnE/Iy5t6ZoVJYLJkAJzmD1xEXDSEUwp2TuutXQuPJrTGb/3+WX3CIac8E3wib0qC02xKWSgyLEM5GEQqFIuuaBOureiI33H/PFTM0zh3OxcJevFxxzBhI7H8oIuICNQCCVUByBtVl/nKMHeHkut0n2V7DAgfVx3o2kwqG02StLnYVi19qZNgn5Ss=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TBl9MjT8oHNqyKTxlC17WyWoePPetyFQJQjyVpeHf2QwXruvgmP8/eybTiqK?=
 =?us-ascii?Q?IR3OLjiZUiazRkFvvXbdhC2j/7Mag2LJGI35f522JEjTgVLq1IPJu/gO+CNv?=
 =?us-ascii?Q?BqawYaAM1+XrnGBE9lvTRDVPqa25Bf909YybuCbwxeDi0z3XanccvZMRYhgD?=
 =?us-ascii?Q?q9feK8idtO0dMY0DCJN9CLMO+5HCSojch52BMWCP7wfDRF9kZVaSbLZPifLC?=
 =?us-ascii?Q?ScFqybB88RpiJOXA/4wzEcd0dDmHba2Z6K9tcOzORrGaz/FWK5ujnLUKd7Lx?=
 =?us-ascii?Q?I7XTxlNJFiNL4TpvpaPHXsxrlgkzV0WMcdTXRsuB0+eD3QvMJzxi6Vi4i+RD?=
 =?us-ascii?Q?sKVaXMkDlYGQJUL2ecMqq18JNd2sZaNt/qSn3yR1rnNwJjlqrpn2VYd0c0Vn?=
 =?us-ascii?Q?rxIuMbV+H3A7ezffdqdxTNJ300R6W8J9rGlILl0C7LovQRH3Spz6TsgYz8+p?=
 =?us-ascii?Q?6WcKBBu981W1LpTVkl+VoqqexDS7OrnCJoT40uByPrmk7uBS37jw306Ndvok?=
 =?us-ascii?Q?vp6XJmLmTYyH8CMITCRiw4Jl3rVuX3m7ue6hp4lgkJb5A2d3u/tGNTYcd8bs?=
 =?us-ascii?Q?gG+MzAUhLEBeQGnZVxh8jRzbX85oFf0Zhd/wEhvh5Uml8d3a/oaLOVIJAx3D?=
 =?us-ascii?Q?lL0Hv2EMvXoKhrzeB8TLtoXEAYceLTGTtH11m9hcbJ5mORLjqTtOOaIivPce?=
 =?us-ascii?Q?VJoYOt6WFIhZmuvBIOdpC7gxSE8TYZfGOGAzYt9xhjDx8rRd6DQq7GFSnglQ?=
 =?us-ascii?Q?j01Xdbvg9WiKvpcIshnxjuvNTp3gxx7xfnzAQ2IwcTdLc4EuGAXefad/zM6e?=
 =?us-ascii?Q?MSHCo6QyySHdxGhOExUbXpHoWOxIGn5WBqR4b+8HqYSdbuOyWfd4CS9jYP2H?=
 =?us-ascii?Q?L00M2xC2kpZSsxcMMExLhzcm6VmZ3HjgYifLiUqsFrMh/1XKoxs8yohIoTQf?=
 =?us-ascii?Q?4rcgwGd0VM5GPLIsKwh/lzc/BHBqmNIScPA6C2FbQDzzkJCRBYEnlTiS4x00?=
 =?us-ascii?Q?5XcFzF71QlBhmgKOb8sFiqUgK1jXgIYoWevuEPzWS3vkiNe1K/PYXCpfuAJI?=
 =?us-ascii?Q?Q6Box+EyTuLzvdgSvnPS6nj0AEPj5aJ+5iSIwMxcuYQBIAU6a+iF5rMjPbZF?=
 =?us-ascii?Q?viIKyvVs3AJWV3rKBARxpskn7+tSROMeMEoEUu4cBnriYVLdBkApAM4RegDL?=
 =?us-ascii?Q?e71KHcCLKDVVVx7Th29XKiHQSsoA/TMt8n0KodUmhFzfAoukJoayoqnx1t97?=
 =?us-ascii?Q?GKIHwWBzyhm7Sf0tiHU83XD+xaif19h/77WGbsShPEvuruOiCWoqtrC2WlGA?=
 =?us-ascii?Q?fiJcJdxZf9EAwP3752RGwgXnMgsEONsxSvlqv/59aQ8aJySrqSfZAUNSJ7mV?=
 =?us-ascii?Q?IEonG2SV/xJmf2h3xBQHpk1dSDVElXtoiS5jI4b0XzoTBsEnu373aGsfLxml?=
 =?us-ascii?Q?hSg01drq7dayUDTUQDX56tsqwU2b72kx5PXZrYVKBPwP3MuRen0EeLMYexzH?=
 =?us-ascii?Q?+goGhhN3vBOpIhislUM6unDoNIUkjqW9A+bHCkGD+lTnB7h72xkf5N4cNM01?=
 =?us-ascii?Q?fO/Pub7LYQjs5EfFIa6YMC9JqKwM54e01gmxzqhm6/Bb69c2OnYrr4+OWDLy?=
 =?us-ascii?Q?AE5hZyF+X7ey6pxR/oFiBGVYMlTwFJSsDrQeDzrcK374plruUw/yWNkQiDEe?=
 =?us-ascii?Q?8aM385F5U4soegBIbnUu045px/KQV+n+ndA8/AijGBhNMDQc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d439748a-35cd-4779-691b-08def913b0b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 08:20:09.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVwqODHMKZJS4zWivonrNoiPNSzW3mDhafUVFKPeCvqMqVcDz19Icm+lTNqfaM6NCaa23FL3jXs/8jWE1TRjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243338

Hi Mathieu,

Sent it here : https://lists.openembedded.org/g/openembedded-core/message/2=
43337

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, August 12, 2026 3:17 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] glib-2.0: skip a timing sensitive monotoni=
c-time ptest

On Wed Aug 12, 2026 at 9:21 AM CEST, Pratik Farkase wrote:
> The /monotonic-time-ns/similar test compares g_get_monotonic_time() and
> g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
> and asserting the two clocks haven't diverged. This is inherently racy
> under QEMU emulation on loaded hosts, as the process can be preempted
> between the clock reads.
>
> [YOCTO #16230]
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the v2, but it looks like the v1 was merged, despite the
pending comment from Alex.

Do you mind rebasing on master and sending a fix commit for the
Upstream-Status?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


