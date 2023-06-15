Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D6EB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:59:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.17472.1686833939581560644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=ev1wsO39;
 spf=pass (domain: suse.com, ip: 40.107.7.54, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e84GdmAKd/U+BnHXh4ckEmcy4uk2L1RGjteRF9dCRlnKv4UWBJOHN3mvVLaUq8hET8qUwwrBko2VU5dRo9Dzva9n1tpH1Ng/rSSJYwB5gpcr4a2L/nKHhPY8CPMbGZoVg1Ks/GJoDX23R3/9Z8UkCEBt+KXr1A2UagO+64kInUSTQGCU+3XPrYY8xRf5rZ6lrTdfU2mOSVZOmWsAm3AtEplJdrIRDTW1GsmwggcGf15cohc2n2a3EtDycWD5bwdateZcVcq69sI4leudimMYT3cNSrja3pIANgZgqM4wSuxOHK/A973Qia+0eMqus5O03FcpTc7paiLApAMh/SMAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3WiXsTUPXEg7ojtCNyANSYo0fNRMRIwypQxjf9oQN0=;
 b=f4wJc11eA6jTblWuWfYNUVdpkT57TdQiFTSQRdNKiZgFU9YQVmhDpshaYN89fSwWpO1/GCBVev0EiOBZapGoT2irBOzzyy7ZMtE+uYnJ9Eb+XA6HgHLetg6VEGd87w5dER3GeEA0xMgDGpB8FDTu1LhPa9bhBZi7WQvO9IHHeiLnJtFvpTTsy2AHYONOJgZ98JYDtd6gua/FMfz0SLfjbyBKcspV6y/nkamu14I/6bLwWtRhP5wqCRvZ1NBJ7UYMAS8YAb+XgHJM6cxyoVRzkgn7jltox6h6XgTK6QVjPM8s69kbaTE0WUdfwqGkN8R0StL7FGN8E68xx/gBPVz8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3WiXsTUPXEg7ojtCNyANSYo0fNRMRIwypQxjf9oQN0=;
 b=ev1wsO39AXND48en5xxrPuiTVKj7SHT+R8jc5FOKs0hu1ob5OQa5xtZFqfZpiWuW/zopFRlMQo8wKBvXDpcoJ61Xz81yBF/r4DSBh44kDCPlIF26FDacalPFJojMSujWT/kSpSZts3sG7ItMJXD3g1FlxbwpmOP0q0bce71jsyM8eZX1djG2sAHPRD1ULhT0e7JYr5RwwKBZQS+kpGj16Z3xSKswblPZ6tzWv0YEZMAbtgMuNPMge3U7weDFwU5hNLLc3/ELLetW1VFDTOmY5IaEwJzG8rkhl2HCpxOfIcWs8DHHuany5uonvy5qH6s2Oc/JvLCNql44BooMrDX5Yg==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.37; Thu, 15 Jun 2023 12:58:56 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::3f46:a41f:1a7d:ffb]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::3f46:a41f:1a7d:ffb%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 12:58:56 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/2] bitbake.conf: add unzstd in HOSTTOOLS
Thread-Topic: [OE-core] [PATCH v2 2/2] bitbake.conf: add unzstd in HOSTTOOLS
Thread-Index: AQHZn3fyt5fNWFdhz0KeVOsNZQ4HI6+L0PQAgAABX+0=
Date: Thu, 15 Jun 2023 12:58:56 +0000
Message-ID: 
 <DB7PR04MB466644241F9DEDB9DB022EBEC55BA@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <20230615105447.29690-1-aplanas@suse.com>
	 <20230615105447.29690-2-aplanas@suse.com>
 <3c195fe070c377e91e697d5eb9eda135e2959ff4.camel@linuxfoundation.org>
In-Reply-To: 
 <3c195fe070c377e91e697d5eb9eda135e2959ff4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|DBBPR04MB7819:EE_
x-ms-office365-filtering-correlation-id: 65fcc31c-d964-443e-da52-08db6da0474b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yBxxkqEaxQ2Ifr9QZ1p0/YkA7N4AIfCQnlCgPTCHpBsoQmG6ghTmoB9Oicju9J+QaQJFO+sMy6xu6s5GB9Zxekq/3WgIgkcsdcNiHUdb9I++n4TihYgKW5YCx3g5QQ18eSigWd2P7UYfVdm/TGJ+IbpyiDXyya5XKGYhdKevnT3l1FnW4hdSs4Ihd6I4PxpWy/d1EO303035MZ/h308LwnN2FadVl2AjbSZsLKnCKUYHKKwFCf8GlXDThRx98vKxA3s7ct+cQpHB6qLlCeZHc7wkBWxSLPDdWlrhoV/iDBzvrmqeiTRDO+Op18uiOGF8hRk1GLwD76gLky9zYy+BDwjg0dUH697WuKBNWWjtdnoFWrRmImnMBpj3fUOtve1bfUrxCjRQ+GGmt0uOMT9NAFsWoZwRTPJspZaeHqWgX5S6IGZxalRKRoO3ucj8Mh9mNIdHMpvlqyCAN4Ec1ILDJjO4OgtMt/8tjWqw7WHi7qG1RU3VwUYTNJ59iTOoODhOIsnvOGYHgsi9afcRoBUH4VLF0zhRD2X4KKiOl5CnXtAxZZmiFDMtXbP1AKRticzs4AOLOZCQ0VfAJGbv1SLHPCg45ZzZy8q0X/goqaFRXk2ipEkSLfDZOg7DZ3/rAEi0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(8676002)(4744005)(8936002)(2906002)(38100700002)(5660300002)(76116006)(66446008)(66946007)(33656002)(64756008)(316002)(66476007)(66556008)(122000001)(52536014)(91956017)(41300700001)(110136005)(478600001)(9686003)(6506007)(26005)(186003)(71200400001)(55016003)(7696005)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HsCtwdzHzLj5MK/wGTPm4/EOltVMiVbBFgAEex1hLDCd3cDylGIGyAZ2x+?=
 =?iso-8859-1?Q?KJQJJog4I8si1kXzrFkt2ZVl1dCZP7LaxE9kT5yaN0EOYDqW5oTOnwSEz4?=
 =?iso-8859-1?Q?H85YdygVG7TShA5QIJOPMpD63iICug8tlpCikXau6IVYLEWfA4BbH86Pdu?=
 =?iso-8859-1?Q?pSthGO/dVIORW0Y8FAo4yi/qB9rrc8ApxEf+N2zE3mZ5ec9TTetxtKuqtd?=
 =?iso-8859-1?Q?1gcV1Ju0xl0vXhDj8mUgXexGb14qCvJb1tHR5murfyt9M9mtxF0s64B9QK?=
 =?iso-8859-1?Q?7KwBbnf4ikaAChUI7jm0GONGrT+ri4mNvUyVxeRx7Cfg1zJAyAQ1itNUXG?=
 =?iso-8859-1?Q?UObyOxvY2hBX0ZMzk+Ywhmo1ZLcvdykRs2QfKS/On3flaavFXQ8Goie/AW?=
 =?iso-8859-1?Q?r27InBad3X5nEh/yFXggVgcuDiD019OauA5244+1IEDMr78D+u/pSiWvCl?=
 =?iso-8859-1?Q?PCUxCngXGUp1okWnreHKbaMiMSw1ETJYmC2LaVmVLCBWlooQMUuCrFLFlV?=
 =?iso-8859-1?Q?P2xYX87G+qJT4aB+XsXATkrHRFuiLYjVhSGJHq73oiUdg/arHKdSQfVRrk?=
 =?iso-8859-1?Q?VW0nyCUcgluQThTYHKY8naaz8BB2Feq/7gbsAPnnNDNxup3PfRYVSVjInU?=
 =?iso-8859-1?Q?WW8/i2sFIXpOVL7wSMEEHE3ju8DeBCALbM8L7Ni3SI9Hmf2DkueUP7Bu+8?=
 =?iso-8859-1?Q?HABp2BcKhjU6RQ+TPYwi5oVxd2YvNxejKiENugakItnmee+xhTyq8Ts7vX?=
 =?iso-8859-1?Q?jlWBwDGNlMW2MTcskOGoNx/gWmG3R3eVwiFyxZfE3tYqbKsb68DRYUjkLs?=
 =?iso-8859-1?Q?VlOLQ7pbWhcFGIH4dSNX5rsVBFkewrv8RtWUJf/o/ykADp5V3dgCKw8sxG?=
 =?iso-8859-1?Q?xqRXogayek1oDQ9eYpHBKTCqcILzVK1tbDJpN7rwCDnTMUWWQntvpEjD30?=
 =?iso-8859-1?Q?C5hRbBHzwSv6hAxAazpZeCOb7fxJP+gucdDCm2pO7WNhIzyd73Ti6TNOd8?=
 =?iso-8859-1?Q?FncR2OEoaYDZHYAku2SVv2QhHC4oLNYvX/mFLAN1p6ZnaRUBsD2gbzQyNT?=
 =?iso-8859-1?Q?kH5y5vYsVlAI8KgSbSpVve1bmGj/RUwhzQkEfOqqHdUT538jfwuf/HYEVN?=
 =?iso-8859-1?Q?RCeaQLS0XO249kQxlaFAn0j+pp8dx22hG/q6qWtpd1lYoK7v1G3D8S48Ts?=
 =?iso-8859-1?Q?wHtn+4haGKLJZaMB/lmFzdNYp4Yom3eSNhW6y80H3z7JHtxSAQdnRPFQa9?=
 =?iso-8859-1?Q?2XUxJASHUbyiUbhGq4HWtXTRcaAXPtgHyr+VDjP8PAgkOvvyywRdtTc7ZE?=
 =?iso-8859-1?Q?vKpDKZhILXwPZHAh3EYcPl2GcR+v4FD5c2VVAbJvI4eO+jO2WfxYb1WIUG?=
 =?iso-8859-1?Q?5VXjFLSZ2He8AR1vMhN79IWJhLNZGXWsPVPDFc/0xp1yf3A2r6nOOi0rNP?=
 =?iso-8859-1?Q?DwQUjlIDLBRQMGYpq0Pjk23P3w7b5P7FpRD8yDgsQRnjQmpaABa++i43q4?=
 =?iso-8859-1?Q?T5BquMpfp5YBflj/SvHFJmgUlCq8++qdE5Opr7H0cWapUsSXfeuEBaU+PZ?=
 =?iso-8859-1?Q?oSTYjIIOg+uiHOZDw5v7lEImoRKVu5jx/vdXXg2SiF5QZN9YU+IpFrYYWY?=
 =?iso-8859-1?Q?4nJFM4HylcIQQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fcc31c-d964-443e-da52-08db6da0474b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 12:58:56.1162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHHXe9x7u0wc+Kxfv+9hP0tE5Iv3Qo68FlcExm15l3skUbdKf/LI/GS7x+8IFDuHHm5AevTFcEEecyeyZyEtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182857

> From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
=0A=
> Couldn't we just use zstd -d in the script? They're always the same=0A=
> binary anyway as far as I understand it...=0A=
=0A=
Yes, this should work. I decided to include the second patch to avoid chang=
ing the rpm2cpio.sh code, that is a verbatim copy of the upstream script (m=
inus the added comment from the old version, that reference where to find t=
he script)=0A=
=0A=
If this is the preferred way I can do a v3 that drop this patch and changes=
 rpm2cpio.sh.=

