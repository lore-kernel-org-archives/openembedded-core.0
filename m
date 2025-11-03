Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6361DCCFA04
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 09:41:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16965.1762162877191613717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 01:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=TCjBKinU;
 spf=pass (domain: est.tech, ip: 52.101.65.26, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kB1e7oIcbN/DHfcZjikbvTHhLEC+IXj2ohPsXMvYEApWIjmUULt+haEWP0LpqxdL92Uprn2qCiQioHd65OJM+9NLY90HH1+KjbqhsIsHZ5Ov42YFm50/HcGOhY9LnseQupXJ0V05DncZ4RyJ9CfsHYQ2Ogxc8+tx/3wDzc8qBEAmmGKR+oL++S9SJjz71RUfU/5O0Az/ZSj648OeVGNqsa85WV/CjCD6WflmfGKgYjj77FZEXZvryxbq9GBXDq3HXp+vi00HD2g1gi1PqawO3hvw3AVtfrDnyv0S0S06cYumHawZER7s1vUBamlTkamCEGZCpaMdXPO52Shojf0q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5g8ZMUabiYixnIgO/Wr+O8w0aeVswnCboJHD6A6OYI=;
 b=d62JqF1bUWra6log23CrbCWVeNZrqG5KJsKzvyA9UQeDum8y8xKvgd/kbUHfdWZOWIK0UBzNAY2NfUcFN6KniVKW3mjg2PRtG50iALwoTi8ejvTk/ToTs08c7kWE1f8dhCYTmL6qCVLRms8xo+ix9A5pxfNbnmJl73UL+rk4Kh/KMYh3ezwneMfLyhgwueiBpn8lb8o0lmX3QMtxWOccPDxsbZPo4uhXLyt+p7lTu/ofeMI8pzp5H87bR1+IFtwWzHKQNE1mtPg0X9iJV71nYleWt7wswClyF7EUhg+KnDd1cJKzxCZKGb0nXmbNkB75vjIvrWpN3cLYveGexDL6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5g8ZMUabiYixnIgO/Wr+O8w0aeVswnCboJHD6A6OYI=;
 b=TCjBKinUO6ju8UdHPI1+e9OqUdDgn4B6JNgEnjLUb2dJzcEWf6dNldYyjWMborQGKLyoW03uf6jknmyLocafG7Tort6/K1O3UPZ3Poo1X7P9PCwyBypjZAo8NtYuvWp51AIJLCAy3ttnJCb8faGS+bn8+E4xHOw/13DCqr2hz1aixD9t1Fmb4RF7xatOlSZv967M0WFTnHHQGEH9idjEh2VX+LPzJl17lbh4WIhQAfnTKwFvLrfaJ8XOCoyd66oCLkSdM68mkTxbNlaRUMuCA7l9wUQ7keAHsOMsFCElxHy8RTB4ufhmB7rELrqRFCSmmcWNsOk2Igm6yYnUwZFiEw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU2PPFDF26E3908.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aa9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 09:41:11 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 09:41:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Gyorgy Sarvari
	<skandigraun@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Index: AQHcRbJAiV7TRXSsyEygedKG5NMpXLTVgW2AgAJ/R3OAAQf3gIAHtYm7
Date: Mon, 3 Nov 2025 09:41:10 +0000
Message-ID: 
 <GV2P189MB3005B2A3572E768BB61E4E8DFEC7A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DDUS6ZLHP1TA.1RO2V3WLOWZXW@bootlin.com>
In-Reply-To: <DDUS6ZLHP1TA.1RO2V3WLOWZXW@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DU2PPFDF26E3908:EE_
x-ms-office365-filtering-correlation-id: 4c360a3c-1ca6-4231-0c54-08de1abd1f49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?tcZXV7Mf58BkTNWENaLjPRug/kEfOVJQIZwqLAaHGngBDMycfnl1yy74?=
 =?Windows-1252?Q?2coa5/4yEJT5PY+/nHXiXq2l61dEgttDBkmcEEZLtYBUXbZ5FnHFtg6U?=
 =?Windows-1252?Q?Ors8XHpk2yzda+ODFCRwgdWy1Gz+gMR9tD8t5M3Q4jOjLbDVlFBYyC7l?=
 =?Windows-1252?Q?oiOzSkNYuA4cDbLOlfcaFpsteuvJGd3Rr9HJbm8icfLDjK9zxuLkS46s?=
 =?Windows-1252?Q?0DymAdH2dHf4to0hTGpvu8HcEbaO+QhcsjNBLH/qsG6XqGWAMe7OIxt0?=
 =?Windows-1252?Q?PzbrGmgtQYbQAqQhUBDjCLogQu6RiUv7r0cJIamH8qMnZA86sMwxpPC0?=
 =?Windows-1252?Q?GEwmr3BvOu6Y1ULIJhhImldTf1E3zi2MVoaMRSU+HHpJOuvgrOOdbrVd?=
 =?Windows-1252?Q?1JvHGN+BIeEUnjgnyQdTbyydIgJdXwrN3bUebKXtRRaDv3oLfO06tRAR?=
 =?Windows-1252?Q?JwMrpql7N5tpKmpDkUFVYQQtr7q15tzpPUEaKDe17Fmf8rvEj9GBqWsA?=
 =?Windows-1252?Q?Rnru8ACqFAmSq/Oo/rJTkqDdvjp8OWeA547WAKU+tUaLNEzpQh2bajo/?=
 =?Windows-1252?Q?YJiTKjSCRm1cBbbBX4ivR1t6/GeyZ9ReRy2d3Yx0bQ3iCzIzC5ilO7dP?=
 =?Windows-1252?Q?i7ThRrPUSIDVv5SnFNdEm0fOKFIt7fnHzhri6j8Vi46uCzZY/Qr0Z7UG?=
 =?Windows-1252?Q?4q9bOvCC357UhCu78+FWNGFhwYqRBM/KGW5rtoVGNz6gEh+VNohwgF2N?=
 =?Windows-1252?Q?nG21EMSJyZRDcCIDSka/iW6mphcsH3jfy4Nd1gmHjy+l0Iu9G9nVny0j?=
 =?Windows-1252?Q?4wrAK4bSbtG+c99yL8LeAV5Uct9gQUWfcgCh673uzXEHCc62WHlq6/0W?=
 =?Windows-1252?Q?8ov49Fu4o9Qa3BWRhMAtyRSArFJUywycqJJqJoUrzrUqvRKYNJowgyoZ?=
 =?Windows-1252?Q?leBlGBsZ0oe6Pu5tvEbc0fkboEspQazNcqsMGFIsylxzezYZ4sytHAfl?=
 =?Windows-1252?Q?30/+8UEo/lLAfIfsggdgXGOdMDitwF82o1QFBDdivd3xvWXzxKqviSsR?=
 =?Windows-1252?Q?gsnsRK/yjyQMfXmJEnuMn54uJ5TwzE0gj+P1GeXXhmzHgsKrd7MX1aJk?=
 =?Windows-1252?Q?CPOcQhvD3aONDYj8qp2fIxWSyjFX6m+ueNpHRGMmxwuRsSHRWkVRsdTS?=
 =?Windows-1252?Q?DgirXpk2mJc40ivp9QaoOWuWEC15VIvIDY3uTsM0CnKr/wdQbMTeeIwb?=
 =?Windows-1252?Q?arnA/UvfNdFjic7fzb3/ZKMxErJPxCJVkzfqj+KmYYqLb9SXGRgeqj2j?=
 =?Windows-1252?Q?rMit5g3rBi8fJphwGl4fofFFY+Rb+0PpX2/Axqg3E+X4k3Y+u3TxAlED?=
 =?Windows-1252?Q?HLrSino8Vz8NKj9nyicpFV1bCmZ8x9AO1X2hwwVC9DxFGQr6507+XgVn?=
 =?Windows-1252?Q?fGktiFCM3xE2FHf6NGlekevaovdTmjdXsYZKJ5JxNxK096r249mIGlsX?=
 =?Windows-1252?Q?qCMXHximqUdvzpuE6te15HTSe0N8R8ykoivkETsePO3qy08qC8LkNfts?=
 =?Windows-1252?Q?ysGBYvBe6XboIT5i?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?z9zZ95a5HUX5qOdmO08dcm0SM8v0KS+LQ9BZy9397XI9OdhgrcL/sshh?=
 =?Windows-1252?Q?tkmVNv56J8tDUIUWwlQF9zEE2s2mEsL5UJvv3gWS3slEgh4mgJXfe+zb?=
 =?Windows-1252?Q?WQzdR4fyrNLgJlOyABfQgX5QnP0MKNwumlxUGZ0GlK0R5jDKsX5QXCGf?=
 =?Windows-1252?Q?/roqGbYsxJ8562GDTPDTvwzqL4jQCwPTB89szaN0qKvbdBbzSKRN380F?=
 =?Windows-1252?Q?bKraky6NjZLDFyIwvlzl0zMIBmZpxGW1lfwTvaJXp5Oh90FY+sTrTy9U?=
 =?Windows-1252?Q?gdr1TtHdgtvO9w047/kVwEeMMalvZyg9BJWrDcO+OjNKEADG9oxNrp5u?=
 =?Windows-1252?Q?i6OOPEaGdygmlap96QupWc+2ZfkW4z+bMykfchGvfwoErEpoadgLXK8A?=
 =?Windows-1252?Q?a0zIvJubXprWSWlLDm5B/3sEj5rCQ4iEJUkiEplF8nldmOxTymjZL/nL?=
 =?Windows-1252?Q?31G64TFq2hJHhQUm9qdguRZFn3taMfKOCXUm2CbK6FAnHoOJUOHSCpqk?=
 =?Windows-1252?Q?8eMWhl+RzizS9cyteR0I6ZEgA370vhRm3bOWhIs/nPMyUfJCFIuCjSJ7?=
 =?Windows-1252?Q?n3ecbXAxc8I1Ueyb9YRMVGE+BP1j0bYZxd5lYj9UQRYxfhdh92qF0mi8?=
 =?Windows-1252?Q?1XRXnWj5pM6/eCItgHR2ZJDHE7kVSFDWQ8lItWt9lHEK6W1zC7RcHA8C?=
 =?Windows-1252?Q?35PTJiKUMQ5+X627ECEiR0bXKY9aXcEomGjnJWNBXplMNIV3WqAtujn8?=
 =?Windows-1252?Q?5aOlf3GeMQva0TBPeFzwwxEQLasikOkSZjDEgY17O3aCG3JUHo28P4zF?=
 =?Windows-1252?Q?Pt2WIyoE2gGiSktYRnE9/yWW0RerokzXI3Aeww1LuLpxhthlNqASnvMa?=
 =?Windows-1252?Q?IrBeWm8ZMqUPVAuniQp4lNXxoqfJ5OwpDBgfQpt3zuFV5iSYj6mbDANJ?=
 =?Windows-1252?Q?LehSKjS4Gk4aVwiuTZbLpsg7voqOR5TsnNBNsqR9+TllAxCDBpT6GJMA?=
 =?Windows-1252?Q?yRbbkaB1g44MPDhVKs6D4BiXR3MJ1r64uEq27cAfsuJHqQ4RkT7E+ROz?=
 =?Windows-1252?Q?ifLpUJRTWYw2LMN+aUwdSw+7GLpgWLc9cbtMpbrSdcWNeIy83Z1oaHQS?=
 =?Windows-1252?Q?FrAtbDLQrSOp3bereBLRjSfKHmXb2b0Nt7/h05Mdv36weyReKgokgQbd?=
 =?Windows-1252?Q?koyCmeX7GRsDxJ4Znn10u9e1Im+Smba316+FCDkOFNuEyXSiztl7Z0Tq?=
 =?Windows-1252?Q?ggsGxRhNnAyZVa5GcITY+O9qcac3LLUUgi3Ln7XIft/5ramNivo+Q/Ke?=
 =?Windows-1252?Q?QWiiG1hvY8c+7ZPnZs1hp21JpXOAkpkcOmEMQEcb4EmpC/sgfmFrLmUo?=
 =?Windows-1252?Q?RLIkwLDcfRdVljIKjJfWvbVprHBiAAHQ32tkdyy3Xud8qVJus4C7G/sj?=
 =?Windows-1252?Q?sHEVxxwFC+Y21apz4CfOZcveYT+ASIrOjp++LXpaytG5wc6pVC3o2Bvj?=
 =?Windows-1252?Q?1APdk/gdqtd30fpDMgwMCgtpAjR7UNrKFCq9tQjQMz+dYZvOrr7VVKYT?=
 =?Windows-1252?Q?rJ+We65qRucthocYP/qayYxeHaap88ywcWdpET6cCE4olMne8arnSRj0?=
 =?Windows-1252?Q?fQ8mrhRxKOHcuo8epbICVjFeB/5PJWZmtZDLhnkxctN+i6M4fTjw0eax?=
 =?Windows-1252?Q?N8fuT6nkOw7aWHOxf83zcCcl2+QC0z1B?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c360a3c-1ca6-4231-0c54-08de1abd1f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 09:41:10.9170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPu+LBpOD+hTF0JC2Vi4lRQ7dLDtfxV12fSNshq3maJBju0eIevOOF/ucv2G2ClAK1caIP0g9YFrdfw8CvoAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFDF26E3908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 09:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225638

Hi Mathieu,

bug-146 test failure as seen on my local ptest-runner output seems to be fi=
xed and will be incorporated in libxslt master :

https://gitlab.gnome.org/GNOME/libxslt/-/issues/159

I am not sure why we get different outputs of ptest-runner on Autobuilder a=
nd local QEMU test setup. It needs to be investigated further.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: 29 October 2025 12:49 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support

On Tue Oct 28, 2025 at 10:05 PM CET, Pratik Farkase wrote:
> Hi Mathieu,
>
> I looked at both the Ptest logs you sent and seems like more tests are fa=
iling in the autobuilder than in my local QEMU test setup. The failures app=
ear to be byte-level differences (e.g., =93230 bytes vs 275 bytes=94 for bu=
g-147) rather than functional errors.
>
> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux8=
6-64-ptest/core-image-ptest-libxslt/
>
> For both qemuarm64 and qemux86-64 machines my local ptest-runner has the =
following output :
>

Yes, it looks like a bit intermittent. I launched another run both locally
and on the autobuilder, and the result is different: it is closer to
yours.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2550
https://valkyrie.yocto.io/pub/non-release/20251029-63/testresults/qemux86-6=
4-ptest/core-image-ptest-libxslt/

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


