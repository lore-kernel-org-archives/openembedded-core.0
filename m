Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69063EDF14B
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:13:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68719.1770977614614373238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=eQMpe/uU;
 spf=pass (domain: est.tech, ip: 52.101.66.38, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aj+wgHc1Tx7VpeqAJDrdymcCkwfdExkEFUasY4AXemNGPFzfuImEKPQ+IklzhyBAaiYT5AQe1o/OGcANR15NaQH1CGicQD1EDP8x5SJceB2v8TJ3dnnKJNyGH2wBj25CFHx8fem4txk0oQwVMtb6CuS9TuZUjvCHga8fbCbC8N+uDBA5EAHPgAtV2dsfv54MQv+OkY40qhxUYyQhuj28fmWNCkpZaTHxJJLYasjzrWICtfFHfIfqQnlEhv/q9lRtdfalv+cmqpLFHmUeKYNor/s2Z5jwFYODxowof4w4L0TtayT4JtAK01te9UBhhUsqs+tsiyQuyXoyb7RotSJ7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usjtxJgzAZeNdvo+Robpqic5be/yzaA3U7zKHXa+E0c=;
 b=oWpnCHVmJ2SoJZ/3Touvi+3Ay43y5XLFkwdbft0VOC34Z2rO5QggOuopi2/TIpilGUQx35DSCgFWSFtBTmeg1hmUqFQHELefEZaeHU80L00PlAGkS2YOduiu6p6F2qR01dEI95gndQhubnf6PRi5L9s2Pdm2auzoQJxxZLZyK7i8C3t90t5zKOVVCQgK3DV1mqHD78OnQPkZ6C8t9V6e9sBTBcsOLKmRhnIxkpaFeGLL6bCAFfLvTeNQTQTmzY7zUoa4GexmaseGTzrk/1eUfFWEMyeNED8S57kkhpmKCt46fD/SmySGNPRXlJwqMHfxyu9almN0XNpVvR0C7ArhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usjtxJgzAZeNdvo+Robpqic5be/yzaA3U7zKHXa+E0c=;
 b=eQMpe/uU+J8M6/e3S71P9BrRhTWHEsngnuPTIUX5X6kRp8GktazmNmE+aO7T6nICQssHt6oMuwlg8caPR48Z8NgzRP1/HcyiM/N1Omlz70tofviACDKaJYpTm7Bxr3LqQj22qZPblmyl6Rdd8HVo+nK/A7puuVba66aYca30SspOoucuAoZjJMh6csJkSZDMXJdV7YGu+HBh6pqiezcLzEzE8P/nRy7hsLpYQcdQz8Ijr7YMnqO/JndRzDadalQIAj3UE04a0fhoWO4YRsNNEnzeSCvuqoJ61NFWbR0ptQb6PHQ/PIeTdeJmzAExnfAA4IbkFQi1H47WztOWgT4xGA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2473.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:421::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 10:13:30 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 10:13:30 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Topic: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Index: AQHcm1IA72wt+Of3nUaJwbhg69vhNLV9n1UAgALMmA8=
Date: Fri, 13 Feb 2026 10:13:30 +0000
Message-ID: 
 <GV2P189MB300517E21D5F57B5D1FF3CF5FE61A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260211122852.6057-1-pratik.farkase@est.tech>
 <DGC8LOGBK2YX.WBMATLDG1ZJR@bootlin.com>
In-Reply-To: <DGC8LOGBK2YX.WBMATLDG1ZJR@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DU0P189MB2473:EE_
x-ms-office365-filtering-correlation-id: 98a2cbc1-a0a0-4d44-d19d-08de6ae88943
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?yieFCGZECkinr7+1lCFSJ792zkdt+b3BB2dW9T/eJxraAG30T9rK/t2Px73E?=
 =?us-ascii?Q?45aUXw3w6xfKUbYVXtZ0BMUhv5Xy5dRp97QG/IUKixIuJCiBAefnWsUqFETg?=
 =?us-ascii?Q?/pt8o6a+rxTUkTZHaD7iX9YxrTOO3RzhUXd+MZCSU3SDaZIKAPo1pk7BsyWB?=
 =?us-ascii?Q?GNa7ckOQr/rhW+rzkW6YqSsGpKBizEIPWw2hAOhXgdfd3+JZx9ME1ssbUnOZ?=
 =?us-ascii?Q?ptoaGqLJAEdmQ4xzwVCHnPnnJOLLlrHh70tJ0Ce2AN64jtYpSzm3jTPjsCB5?=
 =?us-ascii?Q?gsL4pMGyTthuxj0qR9uMHAoPJ/sinsDJGutB/aaAH5tpsUoPubr2PBeQyih3?=
 =?us-ascii?Q?vIbs6vgI3bakkEChc/RrOjrgjrZo4Plcj7fi619rBf/chtUtf9TNbIIfYpOX?=
 =?us-ascii?Q?4hyNa+H7HazxZwQcDw0HWufYb9Oh5AGH77RQ3eD7cX9X9sUm7SWzAlwB5tNm?=
 =?us-ascii?Q?Z6mheEscwxrbIVjlxxDndYjMk68iwOLMiTtdxpmeIza0HIVhLpWKOjZdCbgN?=
 =?us-ascii?Q?lAEoeAvfznIfrQeTKl78x9yxpHXwlUfSdNsy9ikcJeCNFrDz7BBEqRFglz+w?=
 =?us-ascii?Q?ERb4y49ZX8KLMrLqIzgo6vmqkeeja9U7C/FLKezYfM3LjbsolGNmGjF/+m5k?=
 =?us-ascii?Q?ghwpjC6X71CM8sTkFeDcmiO4kpDgBZAuXZhSuITa4DRPJ6NB7fv933z32ROi?=
 =?us-ascii?Q?HkTf4Ow5a1KF6qfe4V5h/HPbaDGu5V15hZJa6dRFX7nlDU1TF4rYc1kBwFJf?=
 =?us-ascii?Q?aV7Z4BfvBy99CWuGM3nQYwDDvNbupnseTMQr9gc80hXyCIUm3dGJpECbe+TZ?=
 =?us-ascii?Q?cIQmIsYrmmSGGYO8uPlHWdCm4WcrgHIqlcsDK+hLZmOh5JySUyPPbmmvnBtR?=
 =?us-ascii?Q?3TaSMvpoCBQxMxPcTYqrlav0ATOy7LEHML0kNJCU8lCc+yeoCgD+dpyqsPv4?=
 =?us-ascii?Q?X1T7Brmns7ZaZ46xh04gSU5uncTEwqTuwL6b+ZCOR8PKzMIqyYvbJhelAkPD?=
 =?us-ascii?Q?/KsPnfahA+7/4dHhFuEJOU5yF7G1dezvY0iBt2fwpjFBQrADnI7CjVBig4zn?=
 =?us-ascii?Q?T3N8LeWGu6ZIP5oZYIqvCvPyFrpYJRzl9xSnvB4iQFYfBizY4jOmbbmQeGJv?=
 =?us-ascii?Q?hb+bwKxRtMV957zkgg2MgCwo1yGGt+97XnKy6qMX3ZfMuBQcwcJpsGc1egai?=
 =?us-ascii?Q?ShX6qUxeoBBtS3+bDawsS0arVVCuMFjgzES/PsDKtxB87DRHqLyTUhXWpuKQ?=
 =?us-ascii?Q?li9CXw/i1YOK5m/7fREbJDH+xbReWb95t3Dxo3vOyAessajHR46u5fEnFyL9?=
 =?us-ascii?Q?ZSCAkq+Hm8l5WIvRjskODkQ7YF2KSVaSmyLggtChoV606dQT2nL3tjg4xcUm?=
 =?us-ascii?Q?9C+3Eigf3X68f9NSa8jEMHMlZXwVz4G64pmz/Oc7U1Di7QH1+w6CvpU5u57T?=
 =?us-ascii?Q?YPo9Sfxu0gv1AHB6/EeGw1zb1Kp2QGd6Qt6Kkr2Y3YZ964suKZp12KmSF28A?=
 =?us-ascii?Q?uMQh5hqdAqcWd6C7UIEQF899Fq0DtPm/HG9cjKLdr0dhrc404H7n3iLHbFF1?=
 =?us-ascii?Q?YMI8Qdxek6objNjefE8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lKgDDAABH7e6n527i9wP3WDVMeR4Rseg1ro2qiL4PRy6DdNm67FagXbZPzPP?=
 =?us-ascii?Q?/G7psSvkcocyF6duabGTNBW0lEuqztLxhqSR7Ua2Kp94btAmIi4AGeWCK/sv?=
 =?us-ascii?Q?CMxjYK9iBJxP4HYPuolkv++MBcFSObZxLvOeBnO9535AWME3gxYDSVSyhpEL?=
 =?us-ascii?Q?mMrIvONl/sm2ORrhZSt7VIiPLnFhXs8Xo7WHUAIOZbwbpI8AqpLqJywjdz74?=
 =?us-ascii?Q?v/Mja0oozy5MvW0FIQgQgo21fZCPPV6yF8kWdXZU2J0bi8PaMMBpntlNEN0Z?=
 =?us-ascii?Q?686Ktsjf6FSqWj2ePn6SU/LsQTecW/frEKizVaTwIOU+bqay6MHWaVCoBVZ7?=
 =?us-ascii?Q?mIjpN5Fb61aPVw9/UJhIcN1sgrRqfgchzAxoi7nH1DMUmiDnwjAmT2a4iHCL?=
 =?us-ascii?Q?FS9QenAIioXI0LOXBIt008P2jxOtrKWtJKLUqnHY0y3hlVw4HNrGeN+ZzVgB?=
 =?us-ascii?Q?+vSCjJEHN/3JAMcFWvrsy3n3kDi/iJtEDdqf/vhGrNh+8Ws2qekROvlYfa6z?=
 =?us-ascii?Q?L8Fc6BgiaQSnActUL1GJyUTVOontMa/hE7ScPBORCtwMvZwAErXvTRai9O9q?=
 =?us-ascii?Q?l5rECackxhcSu8OwDn6DP4vlRAx+rXvWr1/fC7u9xV4ILFuE9zcrJP61fiyW?=
 =?us-ascii?Q?ZE37mHJuEB2ZCueCTkS17XWXUIEOVdS/3Isv8/Gk6soyDpG2KHKG5ygtvcm9?=
 =?us-ascii?Q?MTFjMfcWRQn1FcshOfbJso/ybxEBdX4X7tNV5EXxjtUGnDqnGdI6cres+r+Y?=
 =?us-ascii?Q?tG3aD0zeNIARLVYMboxB9oP2hhDOWFxlPrLKkRSLhaJEwC/50DPqVlw+y+oK?=
 =?us-ascii?Q?zDEbOQLNsbgfzMn+k0JTqYLqNQTm2RSUgWL+jQ5MBqrom//XGdfic3Wozf/b?=
 =?us-ascii?Q?56rfxiuygIoLRWCV12qsbli8kNxUqLs6FW2D3S4QmV9Oslzkn+rv2jlzVpLU?=
 =?us-ascii?Q?Jvjz9qqcOiFKgSCBEXYJVC8TspqN3+C83FnWiDgb5eTJydPNycoc3Jn9/0DK?=
 =?us-ascii?Q?+XHoO/olgG+sFax1COGp/Yvz+EONPK2LgQ1v6/MvtvdSneUkn7ogC5CWXHKW?=
 =?us-ascii?Q?0fPrInLYSEDtarWWcDkrw5KC7QmZBXq3XxhVEw2JIfU4PxEZyl0g4mj1KnZA?=
 =?us-ascii?Q?qpOgAoOrlHTO6Z/Aafkv2+veilYJMzJTSTLe2+TOkCOcPPqMmqiNJIdKfMPg?=
 =?us-ascii?Q?xuSBgbwUEZePcCgkoeXpSX1fYUlG0vxlyhmFCwqIYowqfBfcLwe5VDADZQ1Q?=
 =?us-ascii?Q?KkwTGQ73KkpFHQOQIDSiyMT8TYv03VBButicf6bX+43bISER58ONHjp3A3Do?=
 =?us-ascii?Q?MwJea4KMwfaosuaMJf526RXXSXr5ivjwGE6rUeSVgXF0WlKGH4njy8h3X89y?=
 =?us-ascii?Q?3jbSEDiGl6omBPsgq4wUS3JfW721h/35/Wtv/okQ7/F7UWKP+aGiYaEvHXSe?=
 =?us-ascii?Q?6Znbk1sayJmR11VYZvIwQ8NpQ/6pWDofjlshtAtpjCwFsq5Nt/OvUy+DN22p?=
 =?us-ascii?Q?0a8/n4Ijyxn7VzSrfm9LKO2MAyX4QS4giq8oHyyHQvXASmoG1KHCvyrMsj1R?=
 =?us-ascii?Q?H8GXi9FLto5yaT20+XTLM/qj6UVyajeRgp0sKRqpzfC7yHPjx2fknexzM/kw?=
 =?us-ascii?Q?fr4OemYFNz+FPRJk4p9gk1qn1Y+xEezIrRPLvxGJwCmhd0g0hvl4LbW50FyZ?=
 =?us-ascii?Q?AIJ6BEceqCa6DVUPRbOYHJgV9FR1hCOxK+pYYouqWhvhtqZBRCay7YE/iSfK?=
 =?us-ascii?Q?4+yElxRgLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a2cbc1-a0a0-4d44-d19d-08de6ae88943
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 10:13:30.0522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJJGfw8WrJA26z7rPrgDxKlORb7BrppTsxCP81X7dWRGjNj1jLroC1ZnynzVShIjxkA3NYoDyVm7wzFKFGQ9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231109

Hi Mathieu,

Sent a correction patch on top of master here : https://lists.openembedded.=
org/g/openembedded-core/message/230995

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, February 11, 2026 4:27 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support

On Wed Feb 11, 2026 at 1:28 PM CET, Pratik Farkase wrote:
> Add ptest support to enable automated testing of libsolv
> using ptest-runner.
>
> The implementation uses upstream's test infrastructure:
> testsolv binary, runtestcases.sh script, and testcase data.
> The test suite runs 28 test categories covering solver
> functionality, package dependencies, and repository handling.
>

Sorry, maybe my previous message was not clear enough: a previous
version of this patch has been merged:
https://git.openembedded.org/openembedded-core/commit/?id=3Df5432d1c45f9eb4=
7182049c6930cfc6d5b26bc8d

So you have to rebase on top of it or on top of master before sending
your patch.

I can see this patch here is adding
meta/recipes-extended/libsolv/libsolv/run-ptest, which was already added
by the merged patch, so something seems to be wrong here.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


