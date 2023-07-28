Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046B3EB64DD
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 22:59:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.44993.1690585137889376359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 15:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=VLceLaFn;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScXXN0nIGbCGenYmqVHN0JwvQqpz4Hli4EVvAOfFQgIdIfwpXMgAXozCY2nAlSvQACMN3fpYg/22CeND7LQSqHdGpGuttuCIO7Iwh6PPmNr5eQHE+UvNcIUhYBq6NFQgtH0JacWLQcHwrOUdgXz2m0Uc13z8ZPzA/vXgcx4cq4jsFLsCPYIE9Y3YK8xSij0ZbSUO79J9Wu4EFMbT1RTdOcTCk2oy8iE2hfsBoLZ3PawO98pMvKK7gkiuNtVusHWApa83sp04hOIeZxcIdnRIzvynvubfMMsp7lZ4AVj9yxrWKbxceQiNXGwmh3UQEwBInkRcZLtgUsuRlW1TFStBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMW4/0noDcTSxTgcT8Gbj7d7Lzo78q78tNcZHJiXc40=;
 b=AvqbTuMkUGaUVtGP0eiamSCEx6seAWiPkiXW9h5YvsS6Xm3PXmY/XtYWk5GTl0uZlQjyrLJ8CB8XKPhOkk/W1rFbxNhfSLIDMnxMJxPc62vdZNIRpRGjtuvE6MPtWtZPSjA3ymU31TIGUyR+wRhE0CKka//0+M+Mnra12Ts26+dgNXQzJ6NYagfTwEqKS3DnP75KEdWTyjJ1NfIjoVhF5sOcNMrxl8qtzwONYsTA7ZrXwpaaR8tIyxGKm/cl5bmhzLX/59+C+d3R0O7QVE+lau6DwtS216noh+5NRBtbnRsysWvRyhxJyz7TALhGEiozNHEUBL792jbNg6167Xk5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMW4/0noDcTSxTgcT8Gbj7d7Lzo78q78tNcZHJiXc40=;
 b=VLceLaFnDs+S2KvYycaREGOgdLMgIw6KlCh9ox/fzSaG2Ub0a3Lfnzg/p8cmjOQlwNuaZ2rFfVnzqwf7/VGT0cPW9fsqFsrbUdseVky73JMU4x5g2x4vlLcn4F2zvPtueM5ESDVgM0m8VfuHYJOPojhJXzbyu7llsOAD8w2iJ3I=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VI1PR04MB6893.eurprd04.prod.outlook.com (2603:10a6:803:133::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Fri, 28 Jul
 2023 22:58:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 22:58:51 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZv6K3lu9AQllKHU6ArcdlQLIROa/Lxl5FgAHkvwCAAh+C4g==
Date: Fri, 28 Jul 2023 22:58:51 +0000
Message-ID: 
 <VI1PR04MB5373A06DBD2B36D46AC61AD59106A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local>
In-Reply-To: <20230727141809d2150cbd@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VI1PR04MB6893:EE_
x-ms-office365-filtering-correlation-id: 46ce454c-13a0-4475-cfe2-08db8fbe35db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 epGNPY7DtZ+8Xd8pSPwR5A38p2Tx2HCxrgURpJ3TrNngYsv47EHKKninR+RaBbwKfHvSeEdQkcMqaKB/87DgzBUaFCQRx3uz4dTRMq46HQHkq2quUsIqW+b6dM3lM9nBH1zLbZCV3DJOaJRDCEGdI9zUJNRSGi3MuG2kP4iUH/Zu02zlTjokBWKwlCK0RnmrrapamwvqjNvAoqFLa3ssArxVRH8vRn061wnsJCLXD9mDwYlcvxBJGEJcCTehwI47FZWht5soTEmKfXQo4zH8YFj9HORbu6EiPd+xIibl5wmUJJpvO9clEQ5Nm0LhlRaUgo8433ohkppweJ7KF1NUQzBk0IWsZWsyl+w1WIa+rZ/CS+6C/NoCAg2f34B3XDMTqoI+YxXDVLjoR5mpEBl1Wqgm8zxSzMgzOWlrdw1YYj/I0V0MYHf4WrsKtHdLMiu8NXkVGVzcn+to5c8d8j2bSFCcGL010uTMuRBsTp5Ax3/wqoT/CExO0dyLxpcZLnH+OcocfddcnuFRzi7GoKt4FO79JkbrBKD0Z6gZsCxQ4JExiJ+ClRpXkq34TXfIyohhPHN+0RHjr13hzxHPNx8KUmyF0qN+B2VJdIhdWJuQ4nw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(451199021)(55016003)(478600001)(54906003)(122000001)(7696005)(9686003)(966005)(38100700002)(71200400001)(45080400002)(41300700001)(316002)(52536014)(5660300002)(64756008)(8676002)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(91956017)(4326008)(166002)(8936002)(66574015)(83380400001)(6506007)(26005)(186003)(86362001)(33656002)(38070700005)(2906002)(66899021)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?lqWoXQb+zrIlKBQCMLGeIxIUR6Q4+0CTWbBHE4l/iHU5dDF0Q0GgQ+Mq8B?=
 =?iso-8859-2?Q?fsjS33WagfghkieByS3//AJR3qj68ZmMaqYsjOYOoVSxOKUGWVYokegj8j?=
 =?iso-8859-2?Q?MbHs2duSURS5HOA2SVpbNG5ix7RLG6+9UUhG6pUBJrwpeRcH0TJDxeVW7D?=
 =?iso-8859-2?Q?p2ES0DHkrswHQE8D2W4ruli7P6OwIcwyMBrOba6e3EqI/QWIXYCSC5jK2v?=
 =?iso-8859-2?Q?PrjkgkuLaCrs5GHyuaj5cqSSgP1o2J+F1BZtU+QQlqfycCMB7ceW7LMf0q?=
 =?iso-8859-2?Q?dpUFV2abPBVf14Z5xOLTp+VWLKc2ABVGkwRpOz1B4ugR02S/cj5ByTGMgc?=
 =?iso-8859-2?Q?DRhvObSPVXvQJQmm4+i1oHCFwV0iXxb6fLzmPN2RFlZzOHBLz2suP/gyL1?=
 =?iso-8859-2?Q?QE3p6+mBF35LMX/4fomDGF31Yd0tJazraGMN+r29yltUNIa374sEVB9q6M?=
 =?iso-8859-2?Q?NjZ06n4kTWCvKiNoeFU5lrSldOed3h2zOq9BmDnobD+yvHX/qETU6/TSQW?=
 =?iso-8859-2?Q?fwFJmcHOupfkRAsK2YOA2dXGLg7THMEsNlj3/aVGnlhPbD99rStU/VNdao?=
 =?iso-8859-2?Q?bvPaXgosO7f0lsmGZqihAf0oxN9C96pr2gEMxsv7sJRGxfz6rFWIpQ/ZOg?=
 =?iso-8859-2?Q?lFM7ew1cgKIijwfgAjLZot6b69Sxo3Vl9yJx8Alj5fB7lmwYw8dKgg8chh?=
 =?iso-8859-2?Q?Z7YnfbuwNTz1K6oXuZwP8fotCzJZe2e1Zvb0AQx5r/9gs5B0Ck2x/LmOu+?=
 =?iso-8859-2?Q?7DCMzUXTEUSlEMnunK/B/sDRY1acWVZ+7v0u9A2MNhUb5/u1uS3oUh6Akf?=
 =?iso-8859-2?Q?GAZYHfgB4rNJbk6mMmraNqpdViNHUE6i1IFmku/75hFAGDJng6vKg+HtJN?=
 =?iso-8859-2?Q?EHD5qVghSlNiuKoFbK11uS9nwfJWo5iO4uLbABdGR79vcddlvKjWEHqfi6?=
 =?iso-8859-2?Q?KvCyjeE0r7SRjpgfSDPW1uAg9pievpOzevTu48DDude/qRks0ELehztAWc?=
 =?iso-8859-2?Q?ioPdV8uTWtoLaQNW4B+qSub8aT7aB3BkACFFkdSc4Ii15OCu+j0+BYN1yg?=
 =?iso-8859-2?Q?9XD3uP8RvGRlF2Eju8QpVDDbTUbRc3a1tMOsLfvMPs2ePXehr0RTrjcIcl?=
 =?iso-8859-2?Q?Eti6FeMAQITHJonU6LCTZ7x1SZaTbN9SNHC04PxBCBVKHT8PpOkCR5dz8I?=
 =?iso-8859-2?Q?vRZl4uLY3C2N7BSwrPL4NSF29MPw240LW1AhOydRrEa7gPwSouBAfzHTry?=
 =?iso-8859-2?Q?Aqylt2naKkfhpr1hlGKhdFOuKerol9lNTvXl9WsvEY4sBipcfgt8+YZn2Z?=
 =?iso-8859-2?Q?Z3fypRLHg/gm+HucHWOMlcWC2IzUfntzYS75tEVFL6z70YabMHio0XPiBs?=
 =?iso-8859-2?Q?Wv3vIWsrQPEpNsQjICA9jNYf4WadbwogX1W0oYqwP8cZ14QkdFQa+M10Bv?=
 =?iso-8859-2?Q?3COB5Z9PBjHUDgcMwmNjHohtWckU2FJX1tVvLMt5wlXg1/OMMp5WxAYjkV?=
 =?iso-8859-2?Q?TShNz6ryd5Tb9Qs9OR0DyBszcKx90COTCjFHtK9I8IoHyR8VC3MRZaDzMs?=
 =?iso-8859-2?Q?1cb9BXpp9P0+P2Z+ZMKkJBvyWTcgsCo6UL8BQXb5Uino1omMtwIYPgZJUt?=
 =?iso-8859-2?Q?7PawpoP9Welx8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373A06DBD2B36D46AC61AD59106AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ce454c-13a0-4475-cfe2-08db8fbe35db
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 22:58:51.2919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPKM9a0ijCCzYhS+DqJRx5wYSHW8/9V4FyomznTKpJlr8KEjNLB6bmFrtT2beDHpWcTQTGx3/bLxC905v3z+cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 22:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185042

--_000_VI1PR04MB5373A06DBD2B36D46AC61AD59106AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello again,
Funny thing, I have run the same revision as you in here https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/117/builds/3263
and I have different failures, but I have them:


File "/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/meta=
/lib/oeqa/selftest/cases/reproducible.py", line 327, in test_reproducible_b=
uilds
    self.fail('\n'.join(fails))
AssertionError: The following ipk packages are different and not in exclusi=
on list:
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core2-=
64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core2-=
64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64.i=
pk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-64=
.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_core=
2-64.ipk
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-64=
.ipk

2023-07-29 00:18:31,843 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-07-29 00:18:31,843 - oe-selftest - INFO - Ran 2 tests in 51978.070s
2023-07-29 00:18:31,843 - oe-selftest - INFO - FAILED
2023-07-29 00:18:31,843 - oe-selftest - INFO -  (failures=3D1)
2023-07-29 00:18:35,545 - oe-selftest - INFO - RESULTS:
2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Diffo=
scopeTests.test_diffoscope: PASSED (35.32s)
2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Repro=
ducibleTests.test_reproducible_builds: FAILED (51940.60s)
2023-07-29 00:18:35,948 - oe-selftest - INFO - SUMMARY:
2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest () - Ran 2 tests=
 in 51978.070s
2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest - FAIL - Require=
d tests failed (successes=3D1, skipped=3D0, failures=3D1, errors=3D0)

due to this tests result difference, my suspicion at the moment is only the=
 possibility of changing the format between gnu and posix depending on DIST=
RO_FEATURES having acl and/or xattr.

I will force now tar format to have only posix format and run another test.=
 We will be in touch.

BR
Piotr

________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: czwartek, 27 lipca 2023 16:18
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

Hello,

I sent this to the autobuilders and I got the same reproducibility
failure as earlier:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3263%2Fst=
eps%2F13%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e=
1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260=
643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DC6mYlLwOmYosyl1ZIS8vKQ=
f2ailFqMqBXeamF%2FnSE7E%3D&reserved=3D0<https://autobuilder.yoctoproject.or=
g/typhoon/#/builders/117/builds/3263/steps/13/logs/stdio>

I'm not sure why you wouldn't see those.

On 26/07/2023 09:27:53+0000, Piotr =A3obacz wrote:
>
> Hi Alexandre, Alex,
> Thx for supporting me, I have finally discovered the issue regarding this=
 packages differences.
> It occurred that I was badly comparing two strings for tarformat comparis=
on. Now it is fixed and should finally work.
>
> This has been additionally tested with oe-selftest -r reproducible.
>
> BR
> Piotr
>
> Od: Piotr =A3obacz <p.lobacz@welotec.com>
> Wys=B3ane: =B6roda, 26 lipca 2023 11:22
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add sup=
port for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DaZziODWaDuhvajNYsPmX47BT2z2CLK8NpgFeF80X1Jg%3D&reserved=3D0<https://grou=
ps.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184875): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184875&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c6=
9408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719=
160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DKQ4jb1%2B0nyhGquOBb6Ca1JnSh1stD=
Ig%2FEltszh9Z8Rk%3D&reserved=3D0<https://lists.openembedded.org/g/openembed=
ded-core/message/184875>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100367408%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DAghjaI2zcxq0sYRMiBCDuHqx4dro5gh6MigROTfilxc%3D&reserved=3D0=
<https://lists.openembedded.org/mt/100367408/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DRBq5q4%2BLxdxmoglWkVKE%2BKAYWRaJ1Jrt1qu6EugIWU0%3D&reserve=
d=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.=
belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8=
eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DQdR%2FSw2mI6zSaDoLdARAe4Q9CTcPPR5Jazo1=
mllODi4%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373A06DBD2B36D46AC61AD59106AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hello again,<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Funny thing, I have run the same revision as you in here <a href=3D"https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263" id=3D"LPl=
nk747516">
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263</a>=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
and I have different failures, but I have them:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
File &quot;/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib=
/meta/lib/oeqa/selftest/cases/reproducible.py&quot;, line 327, in test_repr=
oducible_builds
<div class=3D"ContentPasted1">&nbsp; &nbsp; self.fail('\n'.join(fails))</di=
v>
<div class=3D"ContentPasted1">AssertionError: The following ipk packages ar=
e different and not in exclusion list:</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/acpid-=
src_2.0.34-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/avahi-=
src_0.8-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/bind-s=
rc_9.18.16-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/debuge=
dit-src_5.0-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/flac-s=
rc_1.4.3-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libjso=
n-glib-1.0-dev_1.6.6-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libjso=
n-glib-1.0-ptest_1.6.6-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libjso=
n-glib-1.0-src_1.6.6-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libmnl=
-src_1.0.5-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/libuui=
d-src_2.38.1-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/log4cp=
lus-src_2.1.0-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/lttng-=
tools-src_2.13.9-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python=
3-numpy-src_1.25.1-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python=
3-pygobject-dev_3.44.1-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python=
3-pygobject-src_3.44.1-r0_core2-64.ipk</div>
<div class=3D"ContentPasted1">/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1=
c87c13/poky-contrib/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python=
3-pygobject_3.44.1-r0_core2-64.ipk</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INFO =
- ----------------------------------------------------------------------</d=
iv>
<div class=3D"ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INFO =
- Ran 2 tests in 51978.070s</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INFO =
- FAILED</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:31,843 - oe-selftest - INFO =
- &nbsp;(failures=3D1)</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,545 - oe-selftest - INFO =
- RESULTS:</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,546 - oe-selftest - INFO =
- RESULTS - reproducible.DiffoscopeTests.test_diffoscope: PASSED (35.32s)</=
div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,546 - oe-selftest - INFO =
- RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED=
 (51940.60s)</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,948 - oe-selftest - INFO =
- SUMMARY:</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,949 - oe-selftest - INFO =
- oe-selftest () - Ran 2 tests in 51978.070s</div>
<div class=3D"ContentPasted1">2023-07-29 00:18:35,949 - oe-selftest - INFO =
- oe-selftest - FAIL - Required tests failed (successes=3D1, skipped=3D0, f=
ailures=3D1, errors=3D0)</div>
<div class=3D"ContentPasted1"><br>
</div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2">due to this tests r=
esult difference, my suspicion at the moment is only the possibility of cha=
nging the format between gnu and posix depending
 on DISTRO_FEATURES having acl and/or xattr.</span></span></span></div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2"><br>
</span></span></span></div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2">I will force now ta=
r format to have only posix format and run another test. We will be in touc=
h.</span></span></span></div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2"><br>
</span></span></span></div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2">BR</span></span></s=
pan></div>
<div class=3D"ContentPasted1"><span class=3D"HwtZe" lang=3D"en"><span class=
=3D"jCAhz ChMk0b"><span class=3D"ryNqvb ContentPasted2">Piotr<br>
</span></span></span></div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> czwartek, 27 lipca 2023 16:18<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bb=
class: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
I sent this to the autobuilders and I got the same reproducibility<br>
failure as earlier:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3263/steps/13/logs/stdio">https://eur04.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilde=
rs%2F117%2Fbuilds%2F3263%2Fsteps%2F13%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp=
.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51=
a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DC6mYlLwOmYosyl1ZIS8vKQf2ailFqMqBXeamF%2FnSE7E%3D&amp;reserve=
d=3D0</a><br>
<br>
I'm not sure why you wouldn't see those.<br>
<br>
On 26/07/2023 09:27:53+0000, Piotr =A3obacz wrote:<br>
&gt; <br>
&gt; Hi Alexandre, Alex,<br>
&gt; Thx for supporting me, I have finally discovered the issue regarding t=
his packages differences.<br>
&gt; It occurred that I was badly comparing two strings for tarformat compa=
rison. Now it is fixed and should finally work.<br>
&gt; <br>
&gt; This has been additionally tested with oe-selftest -r reproducible.<br=
>
&gt; <br>
&gt; BR<br>
&gt; Piotr<br>
&gt; <br>
&gt; Od: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Wys=B3ane: =B6roda, 26 lipca 2023 11:22<br>
&gt; Do: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; DW: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add =
support for ACLs and xattr
<br>
&gt; &nbsp;<br>
&gt; Extend OPKGBUILDCMD variable, with additional parameters, depending<br=
>
&gt; on target distro features, in order to support ACLs and xattr.<br>
&gt; <br>
&gt; With fix pushed to the opkg-devel:<br>
&gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">https=
://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.googl=
e.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DaZziODWaDuhvajNYsPmX47BT2z2CLK8NpgFeF80X1Jg%3D&amp;reserved=3D0</a><br>
&gt; opkg-build is able to create tar archives with ACLs and xattr.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt; &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-gl=
obal/package_ipk.bbclass<br>
&gt; index b4b7bc9ac2..a0f106e4ad 100644<br>
&gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-ta=
rget.conf&quot;<br>
&gt; &nbsp;PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt; &nbsp;<br>
&gt; &nbsp;# Program to be used to build opkg packages<br>
&gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<b=
r>
&gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; ${=
@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.cont=
ains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'<br>
&gt; &nbsp;<br>
&gt; &nbsp;OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-versio=
n&quot;<br>
&gt; &nbsp;OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar=
(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184875): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184875">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184875&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DKQ4jb1%2B0nyhGquOBb6Ca1JnSh1stDIg%2FEltszh9Z8Rk%3D&amp=
;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10036740=
8/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100367408%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DAghjaI2zcxq0sYRMiBCDuHqx4dro5gh6MigROTfilxc%3D&amp;reserved=3D0</a><br=
>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DRBq5q4%2BLxdxmoglWkVKE%2BKAYWRaJ1Jrt1qu6EugIWU0%3D&amp;reserved=
=3D0</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DQdR%2FSw2mI6zSaDoLdARAe4Q9CTcPPR5Jazo1mllODi4%3D&amp;reserved=3D0</a><br=
>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373A06DBD2B36D46AC61AD59106AVI1PR04MB5373eurp_--

