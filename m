Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E0E106FD9A
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 08:48:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11640.1773391495078788623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 01:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hNytZlaq;
 spf=pass (domain: siemens.com, ip: 40.107.130.22, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPoAbA/AzXTIhAhQSYzqts7bOrPu1Lp1FvsELptD+dcD0srgiSXbJKP0D2n4PZlKAIdAHZlTUpmv37wOurismR7nNW1CoJltQ8TT+KuRhvKDXkpJ4257u8MUS3fu+j7li8El10yryUQ84e9Acm/t41D2EZ0I4iT7OdWp40gnhLjjWcXZFrQP0/ydz4ddHga5vxnvlCZlCzVXf0mx7WDyUlUMOXNfdbfoAaGUcP406/hqne+psG6hdKkml+gAzm3uDh1Xrh2/WjuA7HgQ30CyWvSt3pGvBrwIrhJOmdUNoE98oxv70AR/CUck79GoxVq8c8GXs6JXBIQKuIwV1mLuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEp3ex3vSWPh3hbXccvjOK3W5Uh/lAhkqu+qfYPDWh0=;
 b=kHgyNvVyPfNYkahQmoOFKOq6ZyqUyD9SwW7bDGpzJrMD2r2W6FZohELPdWueE5HjDPOtmUr1giK94Wv3vZjcYi1LD2ia8JD4XgKTf+L48MMEIxZrScW7R56DIb/3iAYb1zqAVW4qLdD0g6uIunCE8NxnHMjUQhZ7gUxMz1vtizCSPaiD6fL+2e34ETRpeg7WCpa43hwUxkWzuCBxUarSI3FW9em2uSvZkGuo8G+Co3arbUNiqzPPKeHsPCfWgcKv4TtVVn0oSldtIcfFa0oFFCN5rAm/3FsPp8g5BLsh+oeAUfaGOFQdSTfm6zATJVSwixhkyR8Yf1oGCHPFJesMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEp3ex3vSWPh3hbXccvjOK3W5Uh/lAhkqu+qfYPDWh0=;
 b=hNytZlaq6ccbJSbFPz82EDZz2eC0laYKQYN1gSm09oDLzHhS4gEpdHutSniDmuemGyngSOCzx/AUKetT/W+o8R0EQopJMHfU/1qn5slDelwKyf14koY+fuovZ6HoBiJPn0S5Fc/HqCcurpbGh8pl3NrhyapPmBebAdLBzwytw2ZcHziwdWIgkUXNYauEVkDr5BCAovTWbqXh5I28s/4qBowz7GcILci8iGFS0D9kjKXOX41OtyoplKTBE0OodW/HswH/ietky/8NPxKoua3745Ejz6EH+17I2qlnH+dXZGDaIiWkaG5ce9/R6S+Tne8hOT4wln74hSnBVwAnKovXvw==
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::20)
 by GVXPR10MB8178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 08:30:39 +0000
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7]) by AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 08:30:39 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"stondo@gmail.com" <stondo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for source download enrichment
Thread-Topic: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for source
 download enrichment
Thread-Index: AQHcsjZX+itfx53JS0aawmuexan5I7Wr/MIAgAAl+E0=
Date: Fri, 13 Mar 2026 08:30:39 +0000
Message-ID: 
 <AS4PR10MB544156BB358839BC46E70E7FAC45A@AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
 <20260312153845.164369-6-stondo@gmail.com>
 <DH1FM09J7MP2.1V0UMBU01I298@bootlin.com>
In-Reply-To: <DH1FM09J7MP2.1V0UMBU01I298@bootlin.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-13T08:30:38.580Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5441:EE_|GVXPR10MB8178:EE_
x-ms-office365-filtering-correlation-id: 418f0763-cf0f-4359-789a-08de80daceb8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|31052699007|39142699007|55112099003|7053199007|22082099003|56012099003|18002099003|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 TdWHl00Xrqp2x99r9o0+Ni3vq5mXAGFNI/X/elL/FYV1H3gzAm79MaCePU4VZyvSL1KSZVjFq7XN7qbdKqJbFYceHsMjufF4Eaa65xtOIMBYQbajRjezpQQ6vNiZRdyNENo0NJ8AxaoQPf0TN8IcWphnUgr5bD78aX0uO2v5hw6ktJJjtoVqL9wJtb07vFfFpZgdyB/45Yy11O6H60kV5KwK6gzfUD+7QvpBcviP+Hpjr4B80QKu1GtAiTdEtrO5Hd3OUGV0uagiFnAE2WahZyMHQrD/ehoqquRFREez24CvMxW60t11IyXtC8INRuy6YIhUrjiwPt6tnRVSpkr6xDZOkYdDwqzJPtOZGo1K9JkCxkBG0CDckM1jHX9TLDdf+C9jhtL9UdzwJzrApU1nGh3cJR6OxbGUt6gBlxnK+DCbPqcFUyxouZpgXA7fNdUfb9Q9hzfJH28fwWhTHvDmlelNn72a33qxX5sne3YA9YDAyH1nNWmOd6woX8VPnoDbJw6CVIjMW5o+H2klCKeknmeZ6Fg2kFKJ6mR/HXQ0B0loUr83RyTLvwOHf4hSCTnbHVT5IJzBrsQrNyYT3HQ0vo6qR6GGIdGoH7XoTYqAlbbSTYD70d9YD3ch1rMc7IswqJEKq4mztjL4wh20rRuhMJgRWAgmoP6+r1PJSonudCEWci7rmG4QEMT+apHt+wwBiVaKJg+04DW49Sb8fNl1mWHBYnWIjTZ+wojemsqcSTA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(31052699007)(39142699007)(55112099003)(7053199007)(22082099003)(56012099003)(18002099003)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kUltaXY3i9mWWqNy9V4S8v/JYvsdTCKNeOZFV2m/atv1s0MkLVj4Rnb2r3Ej?=
 =?us-ascii?Q?q/h1EjDmGulk44kYy/5EI0GGG2xIIcHcTONtz5s85ZZHW8diNgfh/n/JCcjY?=
 =?us-ascii?Q?x1aFaVED0bHmc36R/ja3qIFuDKQqLz1qQHt3S+wFJdAAySqcBKGON9hoScTG?=
 =?us-ascii?Q?cl+Ve4i+RIliqXuXNiciv0UzAeQuT/ygPO7l1b5GAJJ+SNbr1iGErVZ2M/3E?=
 =?us-ascii?Q?vpF9aUWyz1I09e7PdBuzVqn0hVKSU9NnSOyyl+iF7CX3h/XzUTkVE6vWVpx6?=
 =?us-ascii?Q?j3tlxx3MxHwXDZrA8HPDS7RAVU4LW7/GYfgckKlIukKgIUtW1LjtIIinxQsg?=
 =?us-ascii?Q?TjEqoYfZ2jKSN6FA+VHuxUd2YE4S6Gd/3ovqgV7zm40OIUvfI6QMVxF3n8/1?=
 =?us-ascii?Q?xsxJbL88TDzkaOE92Q49maFX0kiCJr244Vny45oWlC60cYI7tbXB404Ut6Zs?=
 =?us-ascii?Q?6SlJczX4/x5LwGefCSh9efDjyrfGguF9ZNGnOhW/vBVhG5cpjYfUMuxxscSN?=
 =?us-ascii?Q?aOB8HGUsmIHd6kxPLjACFfl5x0LU/VqmQO/BmOQnU5A1H4Osaclv9bAtmyXt?=
 =?us-ascii?Q?MSSiqZLNL9KpwrTqth6DxRBSXudBVO6/dsfgcD+m1o0ucWt3pgZBpUtVo0Md?=
 =?us-ascii?Q?SWMVcjdm2zrW+rbYhNmovDk84Ftx6yLzhUevq0/cyZ0YvcHBJ9ieLk6+beRM?=
 =?us-ascii?Q?HTyleZzWoianEbT2UfOy6vZotpxEGAxsC9gqPSgBM1vQCITQKw4IF0MqzHNq?=
 =?us-ascii?Q?14nwiMyWPy+3XXXeiRpk1ON0ToFkfc/xjeQpJ8OBFapw5q6B4UlXsFJBShlC?=
 =?us-ascii?Q?XQ6lm083IAPPTbXfMBVUhSR1Ug14uhOW/XrmzLxwgBh1GSU4rw6FvnK6Nz26?=
 =?us-ascii?Q?BMxCYfpV/GsR0+ybVbltrdWDwGir6rcG+8myUvuNNNFNSsmX4nRaVtVuZJTD?=
 =?us-ascii?Q?AT3ndccReaK2OB64KD2S7G3Z4NpyN8azsbDVoYv05MO6f7O3bjnLTVZPWFMM?=
 =?us-ascii?Q?qS/8/8QkW/3J9r3swmDZ+uF56HFRQDO1+f2aNEKEuony4elfT28cTCgNuoQP?=
 =?us-ascii?Q?eu3ohdr+jZCENsmLWIBgH6iN7MnQ0PifB+AI9WkMo1a1eHcvwFRjRZt5Hr7G?=
 =?us-ascii?Q?YkMOSoMRmQv4YYPTEbOdWkDq4v+Slv33UjZGVW8MwsMWbeAWn7jK0E5vL0Td?=
 =?us-ascii?Q?X/kAAw2OZzPclEXQEw1Y7RtpkdXNplLRGm60Un/bKjsnlcp69VkrISKW1r28?=
 =?us-ascii?Q?fw1JB/25oJqUY0AQAKhzQmVsLQXaHHV9jMJj7d5Eps+z+AJAZSl8bv6uyqEb?=
 =?us-ascii?Q?Ud13/rksVRpP6C5bTjgfyDJhC9KUft4RIpY6FHNMkIulmoPWP4apzte+ro9n?=
 =?us-ascii?Q?HvBG7gpomIpBg2DVgSz+p7YDgb+l4Iq7Pj20hu3Tk42zjlVuEVQrMGe1HVCe?=
 =?us-ascii?Q?fxUvnZzE4dY21hx6RDy9+g/0r/oweFzkXbyiiTN3eABXJJWGLi7wSEls3+bI?=
 =?us-ascii?Q?1/W+Xc6hvXoz2ywAi4vkj2e1UyB0rw3c+upD148T3G4ZPfm1DaHKji58Ynrs?=
 =?us-ascii?Q?Jk21Gu9Av8JxhPdA6vcYMmzsvx7jHfAiiqqXgI4ffARYkl+b/qO4vZiJi524?=
 =?us-ascii?Q?d+4RHRDBb9be6HrPzTIucO54r7izesrr9lsLk2sBFiIiw4AX6nOGMrJNcD6D?=
 =?us-ascii?Q?YfEfYSt5QFnY4b9p44PssM9MzQdydVGP0+doLjzBOWE6kwYX6N9bDD0ajneQ?=
 =?us-ascii?Q?1pT473wteQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 418f0763-cf0f-4359-789a-08de80daceb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:30:39.2427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yedJV047+C63SW6S0nomYVw7l7yg2mVbR+SupU2J4RXXD5XGoN43zY59cR6RTgCsL0O5nqun7b7uSKCkdhK48xPL59i1FAqxBnQIdOmT3Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8178
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB544156BB358839BC46E70E7FAC45AAS4PR10MB5441EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233030

--_000_AS4PR10MB544156BB358839BC46E70E7FAC45AAS4PR10MB5441EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Yes, that's correct, the build-m4/build-tar naming depends on
Joshua's series which renames recipe-* to build-* in the SPDX
output. My series is intended to be applied on top of his.

Once his series lands, these tests should pass.

Thanks,
Stefano
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Friday, March 13, 2026 07:14
To: stondo@gmail.com <stondo@gmail.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Cc: JPEWhacker@gmail.com <JPEWhacker@gmail.com>; Tondo, Stefano (ext) (SI B=
 PRO AUT PD ZUG SW 2) <stefano.tondo.ext@siemens.com>
Subject: Re: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for source do=
wnload enrichment

On Thu Mar 12, 2026 at 4:38 PM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add two new SPDX 3.0 selftest cases:
>
> test_download_location_defensive_handling:
>   Verifies SPDX generation succeeds for recipes with tarball sources
>   and that external references are properly structured (ExternalRef
>   locator is a list of strings per SPDX 3.0 spec).
>
> test_version_extraction_patterns:
>   Verifies that version extraction works correctly and all source
>   packages have proper version strings containing digits.
>
> These tests validate the source download enrichment added in the
> previous commit.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for the new version. Builds look correct so far, except for
these 3 selftest errors:

2026-03-12 22:29:04,908 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)
2026-03-12 22:29:04,909 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 22:29:04,910 - oe-selftest - INFO - 6: 39/53 444/679 (18.85s) (0=
 failed) (spdx.SPDX30Check.test_download_location_defensive_handling)
2026-03-12 22:29:04,911 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 424, in test_downlo=
ad_location_defensive_handling
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-m4.spdx.json' do=
es not exist
...
2026-03-12 23:32:02,849 - oe-selftest - INFO - spdx.SPDX30Check.test_packag=
econfig_spdx (subunit.RemotedTestCase)
2026-03-12 23:32:02,849 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 23:32:02,850 - oe-selftest - INFO - 6: 43/53 634/679 (70.33s) (2=
 failed) (spdx.SPDX30Check.test_packageconfig_spdx)
2026-03-12 23:32:02,850 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 393, in test_packag=
econfig_spdx
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist
...
2026-03-12 23:32:16,627 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)
2026-03-12 23:32:16,628 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 23:32:16,628 - oe-selftest - INFO - 6: 44/53 635/679 (13.78s) (4=
 failed) (spdx.SPDX30Check.test_version_extraction_patterns)
2026-03-12 23:32:16,628 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 452, in test_versio=
n_extraction_patterns
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuilds%2F3513&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fefb2e808de80c7=
bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529240507%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTaMzej5iIeRpGIRln4=
zGg%2B8%2BhwuAgqSiMOFg55%2FL3mQ%3D&reserved=3D0<https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/23/builds/3513>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F35%2Fbuilds%2F3395&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fefb2e808de80c7=
bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529268448%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DvZfebu1gqfsu0wyzPJ=
mYjs10iz5lpA%2BqGW2AI9m4Hmw%3D&reserved=3D0<https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/35/builds/3395>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F48%2Fbuilds%2F3286&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fefb2e808de80c7=
bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529287827%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D3HyHYlXK5ihO27tpsp=
%2BKqKdLZPvITgqvNOB%2FBD5qF4I%3D&reserved=3D0<https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/3286>

Looking at the error, I suspect this is to address changes from the
Joshua series, but I didn't had this series in my branch. Is that right?

I will keep these changes in my branch, so we can go further, but please
confirm everything is correct.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fef=
b2e808de80c7bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6390897925293=
05144%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI=
lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D22YCOQ=
4x43HtfiJAFkL3H%2F2Yi8pZCL%2BXrWsAaEC372M%3D&reserved=3D0<https://bootlin.c=
om/>


--_000_AS4PR10MB544156BB358839BC46E70E7FAC45AAS4PR10MB5441EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);">
Hi Mathieu,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, that's correct, the build-m4/build-tar naming depends on</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Joshua's series which renames recipe-* to build-* in the SPDX</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
output. My series is intended to be applied on top of his.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Once his series lands, these tests should pass.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);">
Stefano</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Friday, March 13, 2026 07:14<br>
<b>To:</b> stondo@gmail.com &lt;stondo@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> JPEWhacker@gmail.com &lt;JPEWhacker@gmail.com&gt;; Tondo, Stefan=
o (ext) (SI B PRO AUT PD ZUG SW 2) &lt;stefano.tondo.ext@siemens.com&gt;<br=
>
<b>Subject:</b> Re: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for so=
urce download enrichment</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Mar 12, 2026 at 4:38 PM CET, Stefano Tondo =
via lists.openembedded.org wrote:<br>
&gt; From: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;<br>
&gt;<br>
&gt; Add two new SPDX 3.0 selftest cases:<br>
&gt;<br>
&gt; test_download_location_defensive_handling:<br>
&gt;&nbsp;&nbsp; Verifies SPDX generation succeeds for recipes with tarball=
 sources<br>
&gt;&nbsp;&nbsp; and that external references are properly structured (Exte=
rnalRef<br>
&gt;&nbsp;&nbsp; locator is a list of strings per SPDX 3.0 spec).<br>
&gt;<br>
&gt; test_version_extraction_patterns:<br>
&gt;&nbsp;&nbsp; Verifies that version extraction works correctly and all s=
ource<br>
&gt;&nbsp;&nbsp; packages have proper version strings containing digits.<br=
>
&gt;<br>
&gt; These tests validate the source download enrichment added in the<br>
&gt; previous commit.<br>
&gt;<br>
&gt; Signed-off-by: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;<br>
&gt; ---<br>
<br>
Hi Stefano,<br>
<br>
Thanks for the new version. Builds look correct so far, except for<br>
these 3 selftest errors:<br>
<br>
2026-03-12 22:29:04,908 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)<br>
2026-03-12 22:29:04,909 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-12 22:29:04,910 - oe-selftest - INFO - 6: 39/53 444/679 (18.85s) (0=
 failed) (spdx.SPDX30Check.test_download_location_defensive_handling)<br>
2026-03-12 22:29:04,911 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 424,=
 in test_download_location_defensive_handling<br>
&nbsp;&nbsp;&nbsp; objset =3D self.check_recipe_spdx(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^=
^^^^^^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 123,=
 in check_recipe_spdx<br>
&nbsp;&nbsp;&nbsp; return self.check_spdx_file(filename)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 81, =
in check_spdx_file<br>
&nbsp;&nbsp;&nbsp; self.assertExists(filename)<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/case.py&quot;, line 249, in as=
sertExists<br>
&nbsp;&nbsp;&nbsp; raise self.failureException(msg)<br>
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-m4.spdx.json' do=
es not exist<br>
...<br>
2026-03-12 23:32:02,849 - oe-selftest - INFO - spdx.SPDX30Check.test_packag=
econfig_spdx (subunit.RemotedTestCase)<br>
2026-03-12 23:32:02,849 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-12 23:32:02,850 - oe-selftest - INFO - 6: 43/53 634/679 (70.33s) (2=
 failed) (spdx.SPDX30Check.test_packageconfig_spdx)<br>
2026-03-12 23:32:02,850 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 393,=
 in test_packageconfig_spdx<br>
&nbsp;&nbsp;&nbsp; objset =3D self.check_recipe_spdx(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^=
^^^^^^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 123,=
 in check_recipe_spdx<br>
&nbsp;&nbsp;&nbsp; return self.check_spdx_file(filename)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 81, =
in check_spdx_file<br>
&nbsp;&nbsp;&nbsp; self.assertExists(filename)<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/case.py&quot;, line 249, in as=
sertExists<br>
&nbsp;&nbsp;&nbsp; raise self.failureException(msg)<br>
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist<br>
...<br>
2026-03-12 23:32:16,627 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)<br>
2026-03-12 23:32:16,628 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-12 23:32:16,628 - oe-selftest - INFO - 6: 44/53 635/679 (13.78s) (4=
 failed) (spdx.SPDX30Check.test_version_extraction_patterns)<br>
2026-03-12 23:32:16,628 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 452,=
 in test_version_extraction_patterns<br>
&nbsp;&nbsp;&nbsp; objset =3D self.check_recipe_spdx(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^=
^^^^^^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 123,=
 in check_recipe_spdx<br>
&nbsp;&nbsp;&nbsp; return self.check_spdx_file(filename)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/cases/spdx.py&quot;, line 81, =
in check_spdx_file<br>
&nbsp;&nbsp;&nbsp; self.assertExists(filename)<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/lay=
ers/openembedded-core/meta/lib/oeqa/selftest/case.py&quot;, line 249, in as=
sertExists<br>
&nbsp;&nbsp;&nbsp; raise self.failureException(msg)<br>
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3513">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuilds%2F=
3513&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fe=
fb2e808de80c7bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529=
240507%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DT=
aMzej5iIeRpGIRln4zGg%2B8%2BhwuAgqSiMOFg55%2FL3mQ%3D&amp;reserved=3D0</a><br=
>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3395">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F35%2Fbuilds%2F=
3395&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fe=
fb2e808de80c7bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529=
268448%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dv=
Zfebu1gqfsu0wyzPJmYjs10iz5lpA%2BqGW2AI9m4Hmw%3D&amp;reserved=3D0</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3286">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F48%2Fbuilds%2F=
3286&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C0baf9486e8844fe=
fb2e808de80c7bc8d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639089792529=
287827%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D3=
HyHYlXK5ihO27tpsp%2BKqKdLZPvITgqvNOB%2FBD5qF4I%3D&amp;reserved=3D0</a><br>
<br>
Looking at the error, I suspect this is to address changes from the<br>
Joshua series, but I didn't had this series in my branch. Is that right?<br=
>
<br>
I will keep these changes in my branch, so we can go further, but please<br=
>
confirm everything is correct.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C02%7Cstefano.tondo=
.ext%40siemens.com%7C0baf9486e8844fefb2e808de80c7bc8d%7C38ae3bcd95794fd4add=
ab42e1495d55a%7C1%7C0%7C639089792529305144%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0=
eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D22YCOQ4x43HtfiJAFkL3H%2F2Yi8pZCL%2BXrWsA=
aEC372M%3D&amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS4PR10MB544156BB358839BC46E70E7FAC45AAS4PR10MB5441EURP_--

