Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F25CD4F3C
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:56:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31598.1779350172410064533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 00:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=qFXA2uGK;
 spf=pass (domain: est.tech, ip: 52.101.70.14, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvOh9+nx5IKv0FLdnqZPdFliC6vzNOBQp/D00eyHM9kEH1M9L4fOvDNvy72FW/rgji8SoTEB5Y2j9USPRmkF0ntGuze+1lThWIknqm32jCcsmHBlOV1Niv1oiGNzyGhz9T1A8jUv4aYJhfudlp+3srkUbl7UnRB0aBHqTRQKHKRFVXjl4z5K89O8aH+VTwhsD1YqO9V6ImN/h//FOBigjaLmhmxMCQG5kaIfavz5hwKsSFWvWidzqA3GDwcG7ZwDoXsk7o7DHRuA8kArT50oBN83ZPSICS4chzO6H7hRpQRVb0a7N7E9tSUPMrP7rf79muCcuZrTQoke5q2qIvvDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95GfGVmC0h9BTVM81jTWqsKfwZMdlsVGXoDua5CnfrU=;
 b=COuVuJphIn6CukGSzZZ6ZYpB2qd/Bevu/VJxf1zkxmDxITDnEQ0C1HkSZzk7I6lXAql/oOJ2g2ktDsL7JV/UKyP1nAN1aQLypiPeDU10EUiZSW8suZ0HXhjilKH61JxWjFe/CJDuNUNg1bfHJeEz2wx12YPvbmeMht8YFBNLqbl4rLB1/O+gl/5ZdC0wutABNlsme/FUiNDYDuD/QOV7TZMhBaYOJi2tA/EkQTL0MnziEufVDaNDNci40NHWPRNsX6DcFAXauD9PMzzZ6yC4TybBSdog1zEiJ+aRNAeY++lav9/e6KYI9AGlv5NwgHcIeDf+Z4XCpvkOxeER33jqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95GfGVmC0h9BTVM81jTWqsKfwZMdlsVGXoDua5CnfrU=;
 b=qFXA2uGKA0bZk4RpYYXP8/dqnUoUeFOB02cFVB/V0I/y29NPUlEnemV6W5zqqivGcI5RF4BHmB9shZc+cY4MFa6HIuCl3iGOlJ/NKCRJYccF2mf5vPT5rpYYgpvGi4kOWuPdPnGHxutbEx0c2Dj+n5rfHKBWcOVaGvKR/7i0z7Ihcc1v8+l710f2eaXGmDNWupcXhySiWTZajLGgxlGxGPsEbndz8I4QYxsAg0I6w4iVCNjHGWkmFL+r2bIgbAVly7kcvqv2C1Fdot8GknZimb605MjF3wriX4x6O5xVIY1pmhPD6B+nFlBOInxVY27awUEmqw5bxSSBJYuSpHMmcg==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV1P189MB2289.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 07:56:06 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 07:56:06 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v2] libxslt: add ptest support
Thread-Index: AQHc5sGYvlQXP4INOkinKpr1N0n44bYXFUsAgAEKFi0=
Date: Thu, 21 May 2026 07:56:06 +0000
Message-ID: 
 <PA3P189MB32396FBCBAEAB78AA895034EFE0E2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
 <20260518122642.31494-1-pratik.farkase@est.tech>
 <36EBF09C-B341-442B-8029-1DB9222B0FE3@arm.com>
In-Reply-To: <36EBF09C-B341-442B-8029-1DB9222B0FE3@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|GV1P189MB2289:EE_
x-ms-office365-filtering-correlation-id: 4d7cb462-1bbe-4a01-6fce-08deb70e69a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003|11063799006|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 N3EETyZpVYlN1WkRbH5FHNYqL1dVPl94jDPmnj7CNaSbRQN5rTHj6XdNCepnUJZwtyJ5hebvUiEisWIUDL8zArkFoZFqFNSEpM7mUcFSSQUbXvnp6d7QwBK1POU1RR3BbZX5P1B5PtJrkAkVu2/UcVUGmF+loS7MqSIFBCIqY7y+U9GOn5dHfiwUutgnshM+CL8caTdPta5twN31ru+Hs0erRnthKo0Msmh1+xyqzJaatKF85Jn+Fl+15vo6gxDGS0nZqISIYzsrcr2DPBV7fWj/q/VPRcAUyEAr1Md5DDR2LtJ12yNOk2b+OW2H0znHvkrb/yAkAMYZQZIY3zED+5AqPG3Lc1uabCEd0+ceq0CZKLgzh/SJK8VtIpcXKurFWJGiuFVQRlfoNnzZfnPIm3mKMsLhNCmV0JetQLGaTlpM1v/ALG8J+HSeoOpFXU0YC1wnAuICX1dudBsq7o8SSuR7Cf5rVYP+4Oy/Ti9bPITFKZ/zyN/dkzR2saYmg9q975vU2jOSLrOw5lr4XCDfV1qByo2TYyd0GAw+w/lkhPPuCqEW6ZtZuL9051MyrHHTeuiI6a6puehHcYh0V1/88dEzqiMhD/1+mC0ve6dIwkCr5ZiGlnLM+1Qd1OlXb8suu8pFhgqBlNPoXBGZJnJ2h4Wip+PMkTrHyx2a8QW8qhKYOITcGerOzEPUKIqLS6Gm1JGla+8Qsy6A3g1gH54U/RnU4dlW74ppgEnVi1JEAj8BSJIucp6e+W6aYWTkjveC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?+PPHgx1renzYbefGOSDCPR2bT/NHT0HLuvEM7quW+cjlgxU19MfkA0ev?=
 =?Windows-1252?Q?al7Gf4HcKWxVJomoXim+HwCCQgDMdjQhmOswElmTa+ypHD/XAI/1pK82?=
 =?Windows-1252?Q?xOG6NvlEhE6eWNzEd1JO3UD1dlT1DM+AeyDLNxzZPOS2+tbvOQD8pUKo?=
 =?Windows-1252?Q?QLCzZAKG+vmKejrjmJvUd47jQLAsNe3fN0kH7SLLMVdmo3FVDFZESs/x?=
 =?Windows-1252?Q?ymiyndtPVY48QHtcMG1/ig9YEjFuvop5npEiWnhYBxhV1exGGETuQGKV?=
 =?Windows-1252?Q?uPpoDSoa8aTwDxDRUtSRpWNnSlrLiirtP0XSTOWHX1Bd0ELy4jdV5kQQ?=
 =?Windows-1252?Q?X7DQ3Gczg0E+KkJLRKJInS9SwH67FtREMAIuwQxrI++N61n1qNBhpGOp?=
 =?Windows-1252?Q?HRkWvJwbKDstRwFUiA3UUbwnRDGT8lk6FeZse5Am7V4NIi70ZNvsQMtT?=
 =?Windows-1252?Q?uwsGTimozZ44a3ztEsjBzo+PNq74S+dTV0SFA2GgtEpeiW2oev78XttI?=
 =?Windows-1252?Q?QsPn9DQTK16FmmOfhB5nTE5uFeSNm3OnX+7YaAQ5KpxpVG0L3TCJBUjV?=
 =?Windows-1252?Q?wkuFskPpKi93p0e6EM8blrAHnQlvSrG3o78lxFoPykWI6i2GcHL/V8HM?=
 =?Windows-1252?Q?lbxfOJTJCM2jHSdVI79CStc+59+K8q9ILo/CUjdEnNaHSTI41mUp28dE?=
 =?Windows-1252?Q?gqBlagmeCqTEiH7eDL3hZPB0y5JGWUA/bb/E/plOiUmqLI1gkKevkLiM?=
 =?Windows-1252?Q?u0weaMPPdX6GDhWaworMHF92X5MxOvUFkb4u4V2QiHeOPvNPdrZ8aG92?=
 =?Windows-1252?Q?7OLW6M/Sjf1E2ia6jxkwzlHN6CexOXhnjkUVs2FEx+FRbRWEPPTr/0sE?=
 =?Windows-1252?Q?S8os8IviffC+QRU5w+HjNrRj58lQ8cVc/yAtW1vXHWkxtWuaQjrlgH8M?=
 =?Windows-1252?Q?oxa9dty1W4DlCO77y8kEla2lclMj9s4uzbXY098FGdVLZ2HvsklLO1h5?=
 =?Windows-1252?Q?f6bnE3OKg+UmQhhxo3yYvnkAtqKU6JcoP5pT4rPBT0M6K4bnkg1RYtOY?=
 =?Windows-1252?Q?QRHIpNzCaSIjvwkLjkvS1dAizQGIj5slnwaXIWRivysh2KBlr1BatcJ5?=
 =?Windows-1252?Q?uQY1cO9qtz0YRA1c10jnkxrWuJT+gcewo0PKp70KQsw6udbbOtD6HHPV?=
 =?Windows-1252?Q?0Xd7SmWa7YPhymVoi1sZXZ77oc41xxkUlx/t65UCqZj4DlQRlQwXrGEZ?=
 =?Windows-1252?Q?zBZmji0dqvZyjy3/a2hZzioGGEtM066ybY/RVWJ+IAnL8eqMdaLC/K52?=
 =?Windows-1252?Q?a9i2xUS/ytdRKXdod7EbDJkqW3NZzbSYilJAsT/be35Q8KLlrvcLZmm5?=
 =?Windows-1252?Q?Jow70PxJSdvS/oFxx/tb8vVFFDxf55mxpFx2UC/6mCLRRzHIZAbYtGiK?=
 =?Windows-1252?Q?BgM8+EUhFTirvgw7XHCwcXhwEUWHqDPxaUu9OlW5pa9sGbUubYZlhPvr?=
 =?Windows-1252?Q?+YNxkc/p2sHsnfTUJJJKNiihc5gElom+ENNdWD4FNrZO6zrpUQCY/uq8?=
 =?Windows-1252?Q?UsZ+SA7oarFcHGa5egtG6efhiSlsDB+YlulwSchqSo/n0rwx1Er+oACC?=
 =?Windows-1252?Q?NReFYN/OJjtU4SS8fsNUKtD8/kt/uZe7xRnp0Im11TucfMBcmvzU0W/x?=
 =?Windows-1252?Q?ieHM8p2o2u2c8OtsjyGdes7XKy/W1AY5yKHDZbd9oXoLx4UvyEotphwN?=
 =?Windows-1252?Q?wD6ZpbY3o6TMiXzwHjxztY7CtJeU/S38AYqpZNRLgxAygmPA4urRjjv3?=
 =?Windows-1252?Q?R4juJe1nU8WP0hDpcqKJzIgu1HvJXbuwM/WArhvj2m5y5ZUfETMkitrQ?=
 =?Windows-1252?Q?MDX9z9ZlXCbECA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7cb462-1bbe-4a01-6fce-08deb70e69a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 07:56:06.2869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJCoQALa/RIPZQraYdISGafwXsi2z+h5JD9goCwQ6NeDVy79S74hCB+VQruZ84HFFBONYYFA4+Q4l++ud4TFAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2289
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237476

Hi Ross,

Thanks again for the review and good suggestion. That makes it even more si=
mpler. What we need here is glibc-gconv-cp1251. I tested this RDEPEND chang=
e and all 748 tests pass now including bug-146. Also dropped the existence =
check as you suggested.

v3 is sent separately fixing these.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Wednesday, May 20, 2026 5:57 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] libxslt: add ptest support

On 18 May 2026, at 13:26, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
> +    for d in general REC REC2 documents encoding exslt extensions \
> +             keys namespaces numbers plugins reports; do
> +        if [ -d ${S}/tests/$d ]; then
> +            cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
> +        fi

Don=92t check for existence here, we want to know if this list changes.

> +    done
> +
> +    # Remove encoding test that requires windows-1251 iconv support
> +    rm -f ${D}${PTEST_PATH}/tests/encoding/bug-146.*
> +}

I think you can solve this by just rdepending on glibc-charmap-cp1251 (whic=
h will need to be conditional on glibc).

Ross


