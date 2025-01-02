Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41556E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 02:41:55 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.82])
 by mx.groups.io with SMTP id smtpd.web11.1333.1735785713194475052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 18:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=hSdFRPlg;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.82, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klOVl+dMbRf+lia5E19gobjg1zAU/uRZLt9iY2Zqi3+iLxn4gIT/YYUm0L1CMmxwdEY77iBKpuzlywsqbrIOLom4fUiZhwjZRBO51Ed5dXXXoy3NYt3fRK/h3vplgyyappAHxYbL2YlzpI5LDGnnoymuWv5DmlEHPhAA1ewO63DS5akINA41yklJ3ZonQm3sC6753UPMBiRYgEeZgQnnKY0qYoPJz3h/DpkQxYY9Pd1+qns4x3U27O0tvX2KUnW3IUkUkVtFHiPE1wVIg4DSb6nqYcCp8Z6BAa4Ei+WSCMBLdZz6XTAiZjHgzW4n5lXaTPku/4RUtOy4wma+6dyfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlwA494vWX1CqYieu67izltbiGQXdqAfiLW93sbd7Kg=;
 b=Iklv9ljEH+NhZlw8vXv96JsEvK680mT028Sz7BPMOVURhWcel07j87s7k1o6c4yMVCa9qEUEUmLYynEZPk9mlAkmwUyreUkRnPUzYeO1zgtdkhCv3Mb3F6PciPB+EaB5HyfLU5X/LSfQKVM5Pt/mxs9G9TbcKsz0QfyZaXT5BT0va9w5hpQpxSynm3L6U4EcTGckAmkkJFBx3bq211RMC4oipJWKcicRH48aWOqut1RLh2LSUjGopw0Yjb7mMCzFnCw+sHP8Q+zp61aTNoAyDH1K5snpFPe3nI2YIspg13fVMAbU0aPhdgzgMCP1bEbXAnwYR8lHzfVkG4HJb8xrnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlwA494vWX1CqYieu67izltbiGQXdqAfiLW93sbd7Kg=;
 b=hSdFRPlgN3OzPksoXFWXl73Wuc/mKr0Ds6lyKx8FqMEKr/DEE1SQh2V4Nu5NJBeMviXteihxC+XrQueCqzr5CPb/aJJSTpY3/eIBcWvpNyM5Av75ktVqpGO7AWwQvNzFHa0rAwfoiw29OLBuW2V2P7sy9Pb9rKBUB7iAWUcQE58Vcqq40vNlHHecjGCX+9ZJF3+WmKQy1BsBWyCFKo2q9zh8IOCmlI0sV6dBHx2LsRvKEa320eEXlCyk/r/nvgufr3uGQgA3O0akHuHMD8NKAgDXiZSUaNeKLFUD+RqgGiq9m18F9W83JCf3v1ZZu7Neer042zAvTnk+HzAQTegLpA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SI2PR06MB5244.apcprd06.prod.outlook.com (2603:1096:4:1e4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.12; Thu, 2 Jan 2025 02:41:47 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 02:41:47 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [PATCH v5 0/3] uboot-sign: support ATF and TFE ITS generation
Thread-Topic: [PATCH v5 0/3] uboot-sign: support ATF and TFE ITS generation
Thread-Index: AQHbS3VTHF7nW+7rwUuUqZxchvhdlrMC53Vg
Date: Thu, 2 Jan 2025 02:41:47 +0000
Message-ID: 
 <SI2PR06MB50419BCACC7A4CAEB98B322FFC142@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SI2PR06MB5244:EE_
x-ms-office365-filtering-correlation-id: fb1131c8-d512-4e91-09b6-08dd2ad70092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?7H8xEeP1RPh25gFjKGhnynUHHOPXLAoOBGt4/PqmGiu1HfuJ4q12jkC5Nge4?=
 =?us-ascii?Q?IvTSoTdYIKRSkhWe31FQrbnN+UbFSgQITfAN/IcTIjT8A/fpIaRTsLqLvJPJ?=
 =?us-ascii?Q?27xlQBZoqZWkYOU0w14nFXk+hEV1DtzCyftWCnWM/x/9CeyWAyK3DiFC57LB?=
 =?us-ascii?Q?8Ig3SyZZCNplFZz+gdvMqViINNRkmbWDmI/gJvsexcO+/W110WxYzbPc5K1s?=
 =?us-ascii?Q?1cOJuDNYeuedCqm6V9HcOuCWrxuTUlOWjh0ey/8Oz2DOQYTrgf35mU0D7ZsB?=
 =?us-ascii?Q?kjb6QgzKOsFnBfiUnaT3kEYHEiVrUY0nGiSZ8YPzxVEQ9ZPZN8LGJD35IMbQ?=
 =?us-ascii?Q?N1g+UPo4BYzhjrteO0xN3bqkHbrHwMecukd/3ZR9gXFSB7kdWfXdfsX/WnCj?=
 =?us-ascii?Q?vvL0SHyswSuksWGkej7KXa05gKfeOmgM5LkSRUeP/djligjdAISn2l6XyuQ3?=
 =?us-ascii?Q?V+q4Ax26Zfg3oZc8zoiw5v3Wx3IGes5bxE2U+tvTvAiPtd7oOYR66ev07ygQ?=
 =?us-ascii?Q?Olq11u0BX7FQn3MQYj9vM6J5Z20lWTIRvWnZSErTgnbnY/sKFHu8amhrsuet?=
 =?us-ascii?Q?qEThX+2Bg4fdCX0w3sfP0tnNJnsOcEpMrc/Y/WQgTHEdx0YqXpWUuj2BXVt4?=
 =?us-ascii?Q?bHxJxx1i4N1Q6tGupFo3Ak7vaqPX7yP5Y3pt+RXvw44AAVIh7MmiL9MyMukc?=
 =?us-ascii?Q?bE23G04mhO7APnMXL+jTMqG/dm5cykdUJyJMlZXkzG4OV7JNpgJynlERJ/1T?=
 =?us-ascii?Q?VCVmMNlausY7MsMdqaZ44WmLS2TUf5dVu+vzHDow8mbIPMN+VUx2BFDV9+CL?=
 =?us-ascii?Q?jjMxsqq330hoBzI1dUUCUpegYqcNG1Xr7mNENFVf7R/SFfryYH96aqWQ+J9k?=
 =?us-ascii?Q?LhXzwXd2idQv2d+w24vkudzzynvgscKG4Kf+OF0dJ9BvTti1sb2qngYDDKve?=
 =?us-ascii?Q?v3ZoFRQj62GknOiDwHbKn+ImItI7XIUThfp9AjiX72nzgQcXdrFEblFlBMtS?=
 =?us-ascii?Q?xJuq2moHEe87bem/ZYGrBA8h3pHgaL8o4aLfIDO8XJaBSKfx6aYwS32+MANj?=
 =?us-ascii?Q?YBMzvJpk2h6V5HatAxYmyDYVElaNX5RT8p32jIwk7EzIEBxHA8wudJXIj8+c?=
 =?us-ascii?Q?oruBQLGU4hWOFv8XErUcvdLO0D8MYvi+S8TFRGLOiYbdbzlphDQw/wGdqauf?=
 =?us-ascii?Q?263pGbj84GCN/0wllVXL/GoiRQGmUQcl9XSEkFKJYTDWKdSRjctd/O7RNzBz?=
 =?us-ascii?Q?9CO5c7xxROetehKEt0wAjP4+84XqbqAeyg5OTl/z+219rXZO133u75z8Az4e?=
 =?us-ascii?Q?zrbX0OROJuakXN+PuYHDpXXTFGkweC2rHiRRCnMSlI7IxtB8vNPMKRzGhT3h?=
 =?us-ascii?Q?KCv0NOVLwCLzz4Zfud5xGOhoc8Mt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iruyPeobmq3d20laXJafHiaS8fRyiSMKa1lDKG4XFGvvj1xnRKpc13MuFXaY?=
 =?us-ascii?Q?ncxzW94Tpc9wBrzt/8RAzOez9nKtNwe42W9cyyvQkxlQjH1/m7mf71NuwFuB?=
 =?us-ascii?Q?DZiY89I4tAmFC8yE9RJEHFcS8qOTZ3q+ZfgyZmtw8tGmGFvRXKAVavB+1rke?=
 =?us-ascii?Q?AXGtssAxNY89uqzQn+wmspWMvPQMWylqsJv8I+Yfvw5KnDjJToKTnYuFKFVj?=
 =?us-ascii?Q?Qo9Fq5iicF0bofTs+vyKtJqhzfbWiTC+hDkw5XMwxm+aTITMLqWoGKfHikI8?=
 =?us-ascii?Q?PdFKQtYJq7eJCjKRTdCFycjLuPWsZzVYCziA9+AOpl4LfP4by2pL4anF5Wj8?=
 =?us-ascii?Q?08R7K76x7RFEFxgtVFElQRC1bfzPAwduU5Luoy54p362irOzbKend/saj6gS?=
 =?us-ascii?Q?aQFYvJI1Om1RZUmcBI/HYjBl+85CPwQ01kP9Ni7CmK0QfJoWqH3XNiuQFXtZ?=
 =?us-ascii?Q?7G/HWm5XlgdyQ/FTaSZkZiBmzIIdxg/F2JDOBWdRWjtLjoutKsDZEJR6k6Kt?=
 =?us-ascii?Q?E4kNFuMXoo+iBZPMFe9UAmggAVHq4vHjsKtOCrMAC1wPNEXSIcg7hYnxrQhA?=
 =?us-ascii?Q?WaJSGhWf7eMApW6/pSvlik+gVlHdqUviMf+BccS1usbdQfl9OoyVWTChv2tq?=
 =?us-ascii?Q?5cHqrDIyH4Ji1U3uB/veyIOO6ighbTTjcvrSylrDqdCYBtE4uO3WGpCYcozw?=
 =?us-ascii?Q?K41a8O3CKa2jx2Ko4nhJznvhwJDiQpc/kcWy1+Pmc9/mjTO8HczYlrX0nu/+?=
 =?us-ascii?Q?+su2AnVouIJZoCcYL6sLOVyWfJH9o2MgiludbyZAcxYYKCTDy8MYF/B9nLQg?=
 =?us-ascii?Q?nlHgcvlCWWnRxO+0aM9sOxeZT/QQvANsZ1QBkgTlMWd30BaCw8eYHNiUchUk?=
 =?us-ascii?Q?B3S25kUjhxZBju09lGKb8khOvAN8dWiOeadQC9L+9SzBhXjj1Vja+FIYq6/s?=
 =?us-ascii?Q?WkIb++OgvGL3OPqha7Ze0IP1ka64K4FyB7yE+ygavXNnuXTDCh7VBkuzbjV5?=
 =?us-ascii?Q?9Dz4E7t3+VkVADmpfpo0JgFCcGy5/f7Gpy5qvq/PUyVJC/znjD2usbKxjV8y?=
 =?us-ascii?Q?LfN5yCoYyIB5CxNjUVpw6cnbky69Chov+9NHVyJ2r4NUBN/RLtpxjn867KqD?=
 =?us-ascii?Q?bSCD2pj1JPsH5wQxtzV1l8u2ERYUChLWl3q1tqVt2KYutwOlBztRcm1Jpypp?=
 =?us-ascii?Q?PljHb5Lk/FYuTX8tUSKnv8Eeo5EhaCtoqOV+6Zkbe/lZ9wAO7Pp9/aIGY4ID?=
 =?us-ascii?Q?P11J0Vmb4SeYskI0S60Mo3KLhtb7PrdPSHuu722grb8bXNsrXzJD1oH5uOC4?=
 =?us-ascii?Q?yta2E1wnrhi1JdR0PvajLk+YYQfN7Jsh3vh8f/jdTLdswujvcHjc1fOiB3GO?=
 =?us-ascii?Q?5Ju26o/2MK8tiBhGEDGIeUXbHkCtLbxrpu+lPdsMhWHJgR8XcCQEaOyJeiEX?=
 =?us-ascii?Q?MT8j9M0JtpPR1me8khEG0zIvCvjfPays0xCaKpuxq+B/Vj0IC1XRIoGlsKB5?=
 =?us-ascii?Q?UlVnUPk4lFBKjlyKF97o+l9xTIwzAf+3kDiGyhQASXQfe5H9DB/JFrNb3wjB?=
 =?us-ascii?Q?GLUqOWOlVQevJgHAaiTkAFq0bnbVDtn6mUsxuYpU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1131c8-d512-4e91-09b6-08dd2ad70092
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 02:41:47.1919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9O9lfsxPz8JwIVibVtw+Z7RfRjr8GQNdqpxY7iaN/G7by31c6T2Tb9KCLcN+3Q0KsTwpiegDmlMpK+tL25nI9LRr/rAKokBkK6WFifPjEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5244
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 02:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209252

> From: Jamin Lin <jamin_lin@aspeedtech.com>
> Sent: Wednesday, December 11, 2024 10:35 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Troy Lee <troy_lee@aspeedtech.com>; Jamin Lin
> <jamin_lin@aspeedtech.com>
> Subject: [PATCH v5 0/3] uboot-sign: support ATF and TFE ITS generation
>=20
> v0:
>   1. add variable to set load address and entrypoint.
>   2. Fix to install nonexistent dtb file.
>   3. support to verify signed FIT
>   4. support to load optee-os and TFA images
> v1:
>   Fix patch for code review
> v2:
>   created a series patch
> v3:
>   add cover letter
> v4:
>   Add oe-self testcases for reviewer suggestion
>   Add documentation for reviewer suggestion.
>   Link:
> https://patchwork.yoctoproject.org/project/docs/patch/20241118062113.2692
> 53-1-jamin_lin@aspeedtech.com/
>=20
>   The following patches had been applied from v0 changes.
>   a. Fix to install nonexistent dtb file
>   b. support to verify signed FIT
>   c. add variable to set load address and entrypoint.
>=20
> v5:
>   1. create a new variable to add users snippet ITS.
>   2. remove uboot_fitimage_user_image hook function
>=20
> Jamin Lin (3):
>   uboot-sign: support to create TEE and ATF image tree source
>   uboot-sign: support to add users specific image tree source
>   oe-selftest: fitimage: add testcases to test ATF and TEE
>=20
>  meta/classes-recipe/uboot-sign.bbclass   |  96 +++++++-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 288 +++++++++++++++++++++++
>  2 files changed, 383 insertions(+), 1 deletion(-)
>=20

Hi Adrian, Ross, and Community Maintainers,

Happy New Year 2025!

Sorry to bother you.
If you have time, could you please help review this patch series?

Thanks,
Jamin

> --
> 2.25.1


