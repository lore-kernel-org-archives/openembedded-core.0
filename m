Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCEAC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 15:34:44 +0000 (UTC)
Received: from FR5P281CU006.outbound.protection.outlook.com (FR5P281CU006.outbound.protection.outlook.com [40.107.149.79])
 by mx.groups.io with SMTP id smtpd.web10.8533.1743867274353001356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Apr 2025 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=xsfMOBiu;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.79, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVhFkJszQkuGaLs64zVXA5XGbuT+F6FQLE+CRU6KxBq8IdNuJ2MrQO6YXNT2SSPOQwlCjZu/9T3HH665VFUG031aCW6OEXt/zX3ceQWTvQCvCFW+52PqHIBUAObrk6VrjrrY6s+7YCnbp+zJwXGuBFjiWTivlOBmz2awwfj2b4eLP9q3KSjjWAEntexsq23Z3Hb77ACniiUUkcLey/chFOnnsx63hz1gU9kyyFDYRh2KC7B8GuSTprBFQ9oz2lXX4UKhgasYzx5SYMWpz1c+K41YIcmU7NzDAH/UZ3/R/KKUz7Ph44vHQN/hxKjERO5e7yn+8vMY8DkLWrJZ234BlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw8IwnrcyBXgDByiF9Af/389OolRlu8PwVkRWYHGYfs=;
 b=oybzmOURkfgotB0NH1ddKlBiyjSqXqLC9q39r1H4eLOeK81lHjEz8I4JgqKLmckLJavPSKCAZ8WBcFqF5EAg0rbwzlNrpFP0gwLy0ZEvVQm2BTlC+ZYrxvLxz7g9s4D8IsUwhpyNhTt4StRAUYz28b60SeT4h1co5ELwpjB6ukkJEgRIPHDjixTJNBve+9KKltv6Nj5te84AihE+DvlcQR1bWfi4DY3Yles/xKNWfRLRVkADkEeo3p2lz4QMYWdEjFXzchbMwCW0NyJeZ5J68FMNm3N0rxT48qjwvIemGP8h979Mrtpe70k1EwKcVZ32nttYsp6Mb65k+iO7HxDxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw8IwnrcyBXgDByiF9Af/389OolRlu8PwVkRWYHGYfs=;
 b=xsfMOBiu8NMXRtQFA+RjyvhnOu8Z8vIgyqg2xnDgXf78NkRM104dDVz1YdCASGai1+G7Gb77eh9ULlbaxQzEZ0zaKn1PTc8MhrCVxf8Y8l47qyaGB2yYua/GzbUUKvnnpdTsWkbBPg+IYc5gXne8MHNrd+yPiumcw+PnyT58puMejG7CrjP+lM4t1I2iD/Hkv7o4FnRfcbjaYevrVn30VKiDPGZIg3kqGcdSR6OUVS+qotfUQPtRfGwYG+dfIX3zEPn6ZT8K5F72u12SVqmLp1/K3xD0jJOTSTGQ8DQBxO4wLzU2czzfndozNvvQDJMk1QkG/uppiUG4MfHnF1s5Yw==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 BEZP281MB2232.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:51::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Sat, 5 Apr 2025 15:34:25 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 15:34:24 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: 
 AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpqAAa4K3IAAaysfgAAEiACADhzR3YAAQ/OAgAFHaMs=
Date: Sat, 5 Apr 2025 15:34:24 +0000
Message-ID: 
 <FR3P281MB1917DF6032653CF52115E214B6A82@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org>
 <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
 <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|BEZP281MB2232:EE_
x-ms-office365-filtering-correlation-id: 643d3308-b8ce-49b5-bb9a-08dd74575844
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|39142699007|31052699007|376014|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?llsAjW4DuJOmnRatXS8il0AiFZ0CBkja4IxPxSbMYPShugRQDoJC4S69hO?=
 =?iso-8859-1?Q?K7xagBn4m+hlSOzs+6686noGnsTStwIAtjx9+KknBLhZjOjLQYzj4Rge+g?=
 =?iso-8859-1?Q?vpyddcVcw9yeyzHuRNMtYCQwNfJdZ+PEmH9EK9ZQ79aoy9UEgicucQwh02?=
 =?iso-8859-1?Q?fPENWTWZaOz+zCLvoVJiWiMXPXhiia6qoj/BEj/CvlOkVivJV6gjvPmPhE?=
 =?iso-8859-1?Q?G7bmQ1PVNWYn/FhNBv9rYHUZvtYXD/f27fcs6MIZXaI8kH/OjEkblcWgm9?=
 =?iso-8859-1?Q?2aengKhJPQsE0lUVjIYk9pxPxjWqIxrLjv8sbPA4/5rXY3dnRhXvUEQqEQ?=
 =?iso-8859-1?Q?yjuE45G3F6fLc7o+QzxqU7yVW6jSpgp3d8eOwGEW+ztlsSEbUMBT3uH6t5?=
 =?iso-8859-1?Q?aj1Gk5bamk80ECblRYDAvlbm54f4asoBYWbEOpYTd0DzuWJZ+uiz0HKVl4?=
 =?iso-8859-1?Q?7MPr98MQywB2rgOsK6B/nfdCkWQNblDuOFXFab69UeKQzuNK194rdjUWnD?=
 =?iso-8859-1?Q?1nNL2OLf56/auL95VX2YOlckNqFVQWU5qJG2rJYewGO/gaS9rosQQg3L4F?=
 =?iso-8859-1?Q?XaZYmKgKpmz+ZD1eGfJ+wOJY1IsOcRCgxlrPPsgSJEcuAID7oe6pPRdBwl?=
 =?iso-8859-1?Q?D2zvlwggZGG3CfuenkU7/9dMz31JuePlHktSmOsWvm2PSYZtWhfk6lG3fj?=
 =?iso-8859-1?Q?dzm9bHjFpNtdOCRQeM8kykc4n1FnyMWOahCagwkKTfF2VXXoP7yXlyM2Xj?=
 =?iso-8859-1?Q?wSqh6oo/zqy5pAkNr8MuNBb1qpfIaHJv9imU3bTPvC+Zmr8Q0d937y+u4x?=
 =?iso-8859-1?Q?WWvFP4RF3mBGqYiXHeyRcIh3WwxEiyjDnjAXfZWdifhBaokWgDwqO5t3nk?=
 =?iso-8859-1?Q?fRxJJxcm63SPtPJJHqVo6qg7kbU9QIO/N0BH6/Rt2pVcOpUkEh1J41mh8P?=
 =?iso-8859-1?Q?xo0pyhHJSmhD73P8HWcrFmWjMyz+WH6qLtqkRdY17mXeiJc0MfYSGz8Ck7?=
 =?iso-8859-1?Q?6ReDOEOU+hkkWYOabEwasOHxlZRBDEBeJm9bvPK865fMpbweY53evMc9B5?=
 =?iso-8859-1?Q?RLV5SHUtUu9TnUVjjZk3J1ru2cYGEby1bGuu3HxNKqoF2qUCltv3XFvpfP?=
 =?iso-8859-1?Q?L18n9pjaJlgVlZU1TzIG1jT88yD1L+vPywqpBuwzgagomeN96LPVMz2P4f?=
 =?iso-8859-1?Q?Y90o1tOqZzS33s2Itt023iobCZzKdwvf+a3aYLBbmU/EK50+1HLd1YslRT?=
 =?iso-8859-1?Q?kFEc53QiFpMagRkHJsCKnqNqLKzLOJKP5WfXq9FsBm/D149+0c5N8znH6b?=
 =?iso-8859-1?Q?wsL0pPxO9oqF1Z1bkpe8yimfmItUkpSzbYFSzrk9w1hEZ0WYs60uvNjDlZ?=
 =?iso-8859-1?Q?0DhRRXQdcwByjR+sMm7D9BJn+CAKouzbgnlA0JCkZtbtraqyD9HQ0KbT4f?=
 =?iso-8859-1?Q?kSWcWgSSjtLg7que0TfFucZmoLU7lhEyoYoAmn3D/Qzxi0GVeZRZuH4HAy?=
 =?iso-8859-1?Q?U/JZhI0VqikuDQEt3JMb3scyzs8xMBHjFRZs640dM7Zg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(39142699007)(31052699007)(376014)(38070700018)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Rlutnezrdfw8wRU9OlUBTtnjPdzmU32erVHFSiU2gmzkGuPqVfmRI2Fmv0?=
 =?iso-8859-1?Q?ckHkHA6MictGhNA5pmjS+yjteYuhyszcwIUmUa3S8YiXxtsZ69whEyB8tq?=
 =?iso-8859-1?Q?EsBpktcE7z/UrxJM2Q23E1VTXoGOJ8tCn36fiY0w4oQGfYEapbuwCjq+i0?=
 =?iso-8859-1?Q?4Bs7Av+iPoR2lgE42MaufG/pr99Wb7Z6z1ORmuYcuVRAkQBQ4Dv6mDTp4u?=
 =?iso-8859-1?Q?NVHaEahWCf2Xon4reYZKOq1w6o8q5omeAJwgAr8joUCpxxJeMpYFcwRY89?=
 =?iso-8859-1?Q?10mHfSut1dzx9WiZTe3dtrGa0HvgGuPV9t4VjbbyhYTZkV3X+7ofOievQi?=
 =?iso-8859-1?Q?S/U7D2pPC61SW7UwOdksG83LqXt4GMw09VB2QlHJFNU2B26jDxlvsuDtV1?=
 =?iso-8859-1?Q?0eiLksgF2Ou0z++rx7ysq5Eg2Q3/mAREit3El6xRPdj6OX3mYp8gj7iOM2?=
 =?iso-8859-1?Q?sZjCDw1ilTxdf2HxIixB3sW9gLDdLQ6FQiTJINwFB7fOAALTrd7qd0ExxT?=
 =?iso-8859-1?Q?ZVk6TS8CZ8AJ2w+URxUyuc3Li6V5Wyb6D1Cq+0N07jJ9mxKRNhwM7MDyKT?=
 =?iso-8859-1?Q?e5pDBgvWKg8zP+ttYnwM8a9GURhzwlHP68g7Rg5Dl4rKuNjMVD70EOXWxR?=
 =?iso-8859-1?Q?YdKkQyED9deJeBc3oCHS1KKnQgttu/BOCc76mATlM9NvVZRBEoF/cfNhhO?=
 =?iso-8859-1?Q?q1mY8/06u4UiEElWvXnpNA9RN05A+R89dOYOpSzfnDOKdL55Tw5YRqgGz9?=
 =?iso-8859-1?Q?4Ah84wVGyWWjMME7XzHjYSzHI1wpBHaongOlTze+NVARb1TloxQrvr+wbn?=
 =?iso-8859-1?Q?fpab9Py4REw+o+UDbj0wGnadY0r2Odp5rc+TNgAL1Re/FIQIRcNJiZQPyu?=
 =?iso-8859-1?Q?c6qNVx7VB0BAKYFCMSGPYJGMY6jRbwspa+VxzlYzKs3PI7d9ObD3PIgL3u?=
 =?iso-8859-1?Q?b5pGVF47lVEyZF60wYz5u4Lboe9nPYLTnSlugsXSstbt7EbwmMuezR5lYr?=
 =?iso-8859-1?Q?DgcP32j2aBfuWJJVKewAkN7qj/57icuhTIazkReecbMU6nye+MXFDpNo1U?=
 =?iso-8859-1?Q?DKN6HO7dOx9WW6/+0Lq1so7E0ByXMLhuk8g1vfPswRgy7mjdFn3IgajFEv?=
 =?iso-8859-1?Q?/QSRWAj9DvwKM0xYIoIrGz+aXHeGxXB/ZYNfOt2mFux7bwDZYJP6HAUnRh?=
 =?iso-8859-1?Q?ItklGSEwKPa5EHuVfSzT+4vuH/XX8o96jbtiGDYYHYcOK0NY3Me80FMHz3?=
 =?iso-8859-1?Q?c0aceoV6k+g2RySdp8gqVZ9F6t10reYbkGNVoJE1QB0+qMKB6F/WuJruMC?=
 =?iso-8859-1?Q?nlWeikjxuP+HcwUjI3eVBjqulKcs+ihj2BXWB6zOsJ22MpwEaMMMd3ack6?=
 =?iso-8859-1?Q?206rDloaM7Q6gItGtwls1V/MulR0v3HSE8CUxKkC9J5/t6m1igmIv7VZI3?=
 =?iso-8859-1?Q?/pi/bLgFjy4wMcYPIFA4XkMwH1o9o1QsnUTfdWk+WOiQl/Ut44CF1OEx4X?=
 =?iso-8859-1?Q?ZXor+aP1M96otZLsuLzu/lIYmKWjWi6GfdnkFDEGAtKQd8/uTjdL1NtmNY?=
 =?iso-8859-1?Q?scaYGr3v99PXL3k3BUyBRSeD5wyROcxhsepZtjVgu5FHm2A/NgdG1HMRzp?=
 =?iso-8859-1?Q?06+sUe3Q0+49sjCS4cjJqWQoT8yRpKMKeue3K2UecIjk4opzreDZVong?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_FR3P281MB1917DF6032653CF52115E214B6A82FR3P281MB1917DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 643d3308-b8ce-49b5-bb9a-08dd74575844
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2025 15:34:24.7775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9pTEfXc8qXV04R3pQ3niUPY4ScYZgX5OAmpmqchJ1pktjlvBpacfJyLD9kiW9kuSgq72Y8aop7BCFTkYwNBuMWrSFagSmrl7sEBy9zTEi4VxIisE7F37/gMyTBasBuQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 15:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214375

--_000_FR3P281MB1917DF6032653CF52115E214B6A82FR3P281MB1917DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I have found out the following:
>
> After applying the libgpg-error patch, the gnupg deb-packages are not reb=
uilt.
>
> My guess is that the gnupg recipe is missing a dependency on libgpg-error=
.
> However, gnupg uses the shared library from libgpg-error, so this depende=
ncy
> is necessary.
>
> That the gnupg built has been successful so far is probably due to the fa=
ct that
> gnupg depends on libgcrypt and libgcrypt depends on libgpg-error. As a
> result, libgpg-error was available in the recipe-sysroot directory of gnu=
gp.
>
> libgpg-error should be added to gnupg's DEPENDS variable. Then the
> libgpg-error patch will work correctly.
>
> If this analysis is confirmed:
> Should I create a separate patch to add the dependency?
> Alternatively, someone else could do this and then the libgpg-error patch
> could be used unchanged.

Unfortunately this is not correct. DEPENDS has no relevance for
package dependencies; those are set either from RDEPENDS, or from
auto-discovery of shared library dependencies (this is done in
do_package by inspecting the binaries). Then there's code that maps
those shared library dependencies to packages that contain them.
That's why I asked you to look into packaging metadata, and I can only
repeat that:

If you have a bit of time, I'd appreciate if you narrrow it down:
inspect the metadata of the .deb packages: gnupg, and then gpg-error,
before and after the change. In other words, is the problem with apt,
or with not repackaging   gnupg properly? How does it compare to when
using rpm?

Alex


Following insights:
gnupg depends on libgcrypt (libgcrypt is in DEPENDS)
gnupg depends on libgpg-error (libgpg-error is not in DEPENDS)
libgcrypt depends on libgpg-error (libgpg-error is in DEPENDS)

After the libgpg-error change:
The libgcrypt .deb packages were rebuilt with the correct dependency libgpg=
-error0.
libgcrypt  log.taskorder:
20250405-152044.315670 do_collect_spdx_deps (47077): log.do_collect_spdx_de=
ps.47077
20250405-152044.557403 do_create_spdx (47085): log.do_create_spdx.47085
20250405-152046.094642 do_package_write_deb (47188): log.do_package_write_d=
eb.47188
20250405-152046.783490 do_create_package_spdx (47258): log.do_create_packag=
e_spdx.47258

The gnupg .deb packages were not rebuilt.
gnupg log.taskorder:
20250405-152046.254829 do_collect_spdx_deps (47191): log.do_collect_spdx_de=
ps.47191
20250405-152046.560586 do_create_spdx (47254): log.do_create_spdx.47254
20250405-152047.590069 do_create_package_spdx (47448): log.do_create_packag=
e_spdx.47448

gnupg does not execute the task 'do_package_write_deb'.


bitbake-dumpsig -t libgcrypt do_package_write_deb
...
Tasks this task depends on: ['dpkg-native:do_populate_sysroot', 'gcc-runtim=
e:do_packagedata', 'glibc:do_packagedata', 'libcap:do_packagedata', 'libgcr=
ypt:do_deploy_source_date_epoch', 'libgcrypt:do_package', 'libgcrypt:do_pac=
kagedata', 'libgpg-error:do_packagedata', 'pseudo-native:do_populate_sysroo=
t', 'ptest-runner:do_packagedata']

bitbake-dumpsig -t gnupg do_package_write_deb
...
Tasks this task depends on: ['bzip2:do_packagedata', 'dpkg-native:do_popula=
te_sysroot', 'gcc-runtime:do_packagedata', 'glibc:do_packagedata', 'gnupg:d=
o_deploy_source_date_epoch', 'gnupg:do_package', 'gnupg:do_packagedata', 'g=
nutls:do_packagedata', 'libassuan:do_packagedata', 'libgcrypt:do_packagedat=
a', 'libksba:do_packagedata', 'npth:do_packagedata', 'pinentry:do_packageda=
ta', 'pseudo-native:do_populate_sysroot', 'readline:do_packagedata', 'zlib:=
do_packagedata']

As I understand it, the problem is not with apt but with not repackaging gn=
upg.
'gnupg:do_package_write_deb' is missing the dependency to 'libgpg-error:do_=
packagedata'.


To stay on the right track, should the code that maps these shared library =
dependencies
to packages that contain them also add this missing task dependency?


Regards,
Mario

--_000_FR3P281MB1917DF6032653CF52115E214B6A82FR3P281MB1917DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt; I have found out the following:<br>
&gt;<br>
&gt; After applying the libgpg-error patch, the gnupg deb-packages are not =
rebuilt.<br>
&gt;<br>
&gt; My guess is that the gnupg recipe is missing a dependency on libgpg-er=
ror.<br>
&gt; However, gnupg uses the shared library from libgpg-error, so this depe=
ndency<br>
&gt; is necessary.<br>
&gt;<br>
&gt; That the gnupg built has been successful so far is probably due to the=
 fact that<br>
&gt; gnupg depends on libgcrypt and libgcrypt depends on libgpg-error. As a=
<br>
&gt; result, libgpg-error was available in the recipe-sysroot directory of =
gnugp.<br>
&gt;<br>
&gt; libgpg-error should be added to gnupg's DEPENDS variable. Then the<br>
&gt; libgpg-error patch will work correctly.<br>
&gt;<br>
&gt; If this analysis is confirmed:<br>
&gt; Should I create a separate patch to add the dependency?<br>
&gt; Alternatively, someone else could do this and then the libgpg-error pa=
tch<br>
&gt; could be used unchanged.<br>
<br>
Unfortunately this is not correct. DEPENDS has no relevance for<br>
package dependencies; those are set either from RDEPENDS, or from<br>
auto-discovery of shared library dependencies (this is done in<br>
do_package by inspecting the binaries). Then there's&nbsp;code that maps<br=
>
those shared library dependencies to packages that contain them.<br>
That's why I asked you to look into packaging metadata, and I can only<br>
repeat that:<br>
<br>
If you have a bit of time, I'd appreciate if you narrrow it down:<br>
inspect the metadata of the .deb packages: gnupg, and then gpg-error,<br>
before and after the change. In other words, is the problem with apt,<br>
or with not repackaging&nbsp;&nbsp; gnupg properly? How does it compare to =
when<br>
using rpm?<br>
<br>
Alex</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Following insights:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
gnupg depends on libgcrypt (libgcrypt is in DEPENDS)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
gnupg depends on libgpg-error (libgpg-error is not in DEPENDS)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
libgcrypt depends on libgpg-error (libgpg-error is in DEPENDS)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
After the libgpg-error change:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The libgcrypt .deb packages were rebuilt with the correct dependency libgpg=
-error0.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
libgcrypt &nbsp;log.taskorder:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152044.315670 do_collect_spdx_deps (47077): log.do_collect_spdx_de=
ps.47077</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152044.557403 do_create_spdx (47085): log.do_create_spdx.47085</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152046.094642 do_package_write_deb (47188): log.do_package_write_d=
eb.47188</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152046.783490 do_create_package_spdx (47258): log.do_create_packag=
e_spdx.47258</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The gnupg .deb packages were not rebuilt.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
gnupg log.taskorder:<br>
20250405-152046.254829 do_collect_spdx_deps (47191): log.do_collect_spdx_de=
ps.47191</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152046.560586 do_create_spdx (47254): log.do_create_spdx.47254</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
20250405-152047.590069 do_create_package_spdx (47448): log.do_create_packag=
e_spdx.47448</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
gnupg does not execute the task 'do_package_write_deb'.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
bitbake-dumpsig -t libgcrypt do_package_write_deb</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Tasks this task depends on: ['dpkg-native:do_populate_sysroot', 'gcc-runtim=
e:do_packagedata', 'glibc:do_packagedata', 'libcap:do_packagedata', 'libgcr=
ypt:do_deploy_source_date_epoch', 'libgcrypt:do_package', 'libgcrypt:do_pac=
kagedata', 'libgpg-error:do_packagedata',
 'pseudo-native:do_populate_sysroot', 'ptest-runner:do_packagedata']</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
bitbake-dumpsig -t gnupg do_package_write_deb</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Tasks this task depends on: ['bzip2:do_packagedata', 'dpkg-native:do_popula=
te_sysroot', 'gcc-runtime:do_packagedata', 'glibc:do_packagedata', 'gnupg:d=
o_deploy_source_date_epoch', 'gnupg:do_package', 'gnupg:do_packagedata', 'g=
nutls:do_packagedata', 'libassuan:do_packagedata',
 'libgcrypt:do_packagedata', 'libksba:do_packagedata', 'npth:do_packagedata=
', 'pinentry:do_packagedata', 'pseudo-native:do_populate_sysroot', 'readlin=
e:do_packagedata', 'zlib:do_packagedata']</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
As I understand it, the problem is not with apt but with not repackaging gn=
upg.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
'gnupg:do_package_write_deb' is missing the dependency to 'libgpg-error:do_=
packagedata'.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
To stay on the right track, should the code that maps these shared library =
dependencies</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
to packages that contain them also add this missing task dependency?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Mario</div>
</body>
</html>

--_000_FR3P281MB1917DF6032653CF52115E214B6A82FR3P281MB1917DEUP_--

