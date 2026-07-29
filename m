Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFEAC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 16:08:34 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.129])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15065.1785341310225973079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 09:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mitsi.com header.s=selector1 header.b=RzS1Nzss;
 spf=pass (domain: mitsi.com, ip: 52.101.56.129, mailfrom: wes@mitsi.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coYX8wKrv/vg8x4I7P3/IpWbTHwD1qrxBGtZSwCNkp+6aHoD83h52qcA/NSSHQeZ0gOO9Dj/kvXW7UrCWBcmqs+ASU5dEtcHy5rpAGIDrCk4PifVsyxL1CIk45K+Ngq9lOSZ6Yyg0ji+nNIgkDecOeQOfcsfE1kc3MiD7KGhtBCE/IeJmvcW1yinQ8kyzxYCgOYIPucg4oUnn2HADWOPzlwa8gY2w4d9TXomnZ6+vvhOGtuFswMErikwpk4WH8wN3M1YWUcaW3gfWeJeEuKfzT/pYR6GHC3WqIgGgaPIAD+8X0f3SHksv62k2XDXozJrEApcotQOoCofM86WHQXFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTqb+Hk12+wAWpa0/QuGksQ89mFl55jH5aax9ih+hgY=;
 b=pA2BHhRA7P2k4fTWYNE3nJDrCy3ZoLdxoGefSJPmVCDXw7FLH9D95eMhV9zSl7uosDvxixcvzv83KwPENztj82+mS+ugWKulDLt938pY7yprUFrINPdVqPrzBjJF17jVHHBxYAQcOdXTp5x3uDdnvZAqbCBti5BAR6A85j8tQp8gcBa8QbY0r6duD3MJnc60ljN8w7dfjnUko6IykUMJHATm0UfQIwMuWaX9x33hpN1JL5YyOhKvX/KHMfjwvNOBI95VOf+Ng0r85AEKN89gosR/P4tGgWYGJs0HcMBq+BRYcsQRiRy9hM6vFFaw2UMN5xBpw6RgtAAjtnog6dBKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mitsi.com; dmarc=pass action=none header.from=mitsi.com;
 dkim=pass header.d=mitsi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitsi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTqb+Hk12+wAWpa0/QuGksQ89mFl55jH5aax9ih+hgY=;
 b=RzS1Nzsse01T51CuVJLZqo9Y3/16TM+eW6juc+vRQ23UEwlT/iXTtCa4f5EYv8iJYKCHJrRT0g3gQx8b9Km3r+Onp7QnnnToh6dQ7COMXwTSURZGDZiu4da/r7TAZmCOwbb6dRmgtUfeR3gl27CtloFTmUHoaYIcDMKeZs/hYg9oMI15TeXQAXXQP50/8rW0/q97O6UigEpBXR6k7ZnFnj8JOtnY+Tfk2A7VL0m1+/F7wP4n6sWxIkgCOqmQWKUpWY6on86oOs4GNmfKAyK11nZay6izRlr8wsdVotnGeYJPTwnwmQKEtFZ0boMLu5XwhNV8ukF/Mxw6t1p7xVis6g==
Received: from SA1PR16MB5580.namprd16.prod.outlook.com (2603:10b6:806:3d0::9)
 by LV3PR16MB5788.namprd16.prod.outlook.com (2603:10b6:408:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:08:23 +0000
Received: from SA1PR16MB5580.namprd16.prod.outlook.com
 ([fe80::953f:db17:45a6:14c5]) by SA1PR16MB5580.namprd16.prod.outlook.com
 ([fe80::953f:db17:45a6:14c5%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:08:22 +0000
From: Wes Malone <wes@mitsi.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] cpan_build: disable .packlist and html
 doc
Thread-Topic: [OE-core] [wrynose][PATCH] cpan_build: disable .packlist and
 html doc
Thread-Index: AQHdH2fV1O2k7RS8kU6EyafLmHR7x7aEkgeAgAAV/gs=
Date: Wed, 29 Jul 2026 16:08:22 +0000
Message-ID: 
 <SA1PR16MB5580274A84DE076199EFEE2BBECA2@SA1PR16MB5580.namprd16.prod.outlook.com>
References: <20260729143729.3759497-1-wes@mitsi.com>
 <DKB4U4MQEPKB.3FYR6DZ0JSOE8@smile.fr>
In-Reply-To: <DKB4U4MQEPKB.3FYR6DZ0JSOE8@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mitsi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR16MB5580:EE_|LV3PR16MB5788:EE_
x-ms-office365-filtering-correlation-id: f8608053-4c39-471d-9719-08deed8b9cde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|10067099003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 tHugG7CY7NwJFVy0IB+2ehFd2rf+z+xliIXUAmXK6lNe1CLpfayJwAuaObI8+yiemjO/b2lO8WgRHIm3UQtnadD23sjibb1YIYb2eBo6ECnHRnqYQKEG1JcXoPMAN3cZ6FQA88gaV91Fj9YBmxxzVo+aKK2A+KgN4viYWj8LlfoveJwCHzirrm5H5R2WCaIg2t1XmzfGEZ5klPbCft7XaqXzUahnPe2/kEHLdFH3NIO0CoqsWUzfcHhiAmeXutL1c/HQzns44MyJzv8btXav1MJf1zAg0svtznx5Y220kP1/xWmcsOeRPGdrVVCGZX7WnVrDodpdTXbbGRpnqOrrXqVx8joolzMaHlMhUA1MmICbyniPTC4v85rjvdhEEBtkaFFyqkNPXh1qWwMpVvxaOhdtCE0uPeYbMewZZ9rlQI6mUVu3hEh5SLv8wzXxaserMrR+hppQtuC1XLun98Q1HussJkRPd0T1Z9YS9BXX2ObBrFsxUj7tvwvSGnUAa/SSlMhou0T6y5h+/KyBNxelXC5Bz347IkEiUKorWzNEhZ6UzNCxBKYIz3D5iGUNXm4YXokom3tXLLQa2AYRUZQPlTPj+NvRr0zyFG2re96DeZ+YHLIcxPk8krZaPBlHe5K0ITOfzh/xonDbB7wFu+dw2RwyYrEWa2+hAol2N/9ghJr+5iIHIGA6M6cIe+kityNTuDSQdMtjngid4DZZG/AOzwndvdr1E/KNKPOdtCwHEzY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR16MB5580.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LFkalyJZ3BSOmJ0u1RohlxEezo/KNlbH5jKi28sq732zVt69DJjksW5zou?=
 =?iso-8859-1?Q?+jg/3sSX3vhLu3bWR9mjdgXgxHk3sOclyr9uD6aaonyS8NBkE/Wz92LP3Q?=
 =?iso-8859-1?Q?kSY0mnfzrkCawwt7CchiTO7E2M6QdtUZv3NFHFaePcok3GJZvsdwHw16ZH?=
 =?iso-8859-1?Q?c2ycOxB1kqwK5ugNQN+ZA05Kt00Fl2s8oJg7Z5piCq0ZHXINLdcDrVXBXV?=
 =?iso-8859-1?Q?CkrrqZ7tJPGDnoze4RkFPkSI0sjw9Bl+VYaQg4ceARY0L5LIylREyZ4ba8?=
 =?iso-8859-1?Q?wFG8PPky5yEoLSgIrwFXUY8+ain/alzJqN58YQT6XJgvSW6g1oja2sejRN?=
 =?iso-8859-1?Q?6LZsfcZTaltR7ORRYS7Xq782m5OvOKkKvDx8K29NkONcvT1pX6zmuHh9pS?=
 =?iso-8859-1?Q?qRCZ64ZV85e5XBFE3JBho+JWYB+Tm+tEMAwweaCD5vEWf00v18rLElmNng?=
 =?iso-8859-1?Q?YXw6fIdelW4rdg2b1qOuJgv3PGiDMoFpOBFtW4G74FNShZllaPrlZSEXQW?=
 =?iso-8859-1?Q?3A6t5wf++sdEh31663o5Gb2E+Qobf5Jjan0PRxt+ex5TmNEcR7siHKTQ18?=
 =?iso-8859-1?Q?vfdlcVm0k4kLKFn3n8VpjkJJgMCeXOJq5uWUgk96ig7JwIqjKQ0N/mhoHo?=
 =?iso-8859-1?Q?pGtGhSbiiWgtveTOlGZXs+4paPMzQ5kTJ47qC0pvEvqi9wlxK0RbuJfykz?=
 =?iso-8859-1?Q?K7bm1la2C1M9JDrHSNh3sKPEd9KE2gelWdq2yU0gKEfl95oLbTYy+0PiyW?=
 =?iso-8859-1?Q?Wf28bF7GLOWHTxmjzEt8WYEnHUKErS/1Wxx1Xd8bKWdFwTkrVXAaxISj71?=
 =?iso-8859-1?Q?9nHQOCgF+DY9HRkHCblnN5bDXR3Bof0gAwUIBQwOHwVbZomrmMVV77Huin?=
 =?iso-8859-1?Q?fhNQARnN4QzXIyCpEkIPTNIIaNAz+4XvkDmjRQaJtDTsmjH59FF8i6DPZU?=
 =?iso-8859-1?Q?VjHb0KO6MMp4+o47JS2TvMsksFDFaw/jgXuepdXGFxMKtiyw0RWnk82Pk+?=
 =?iso-8859-1?Q?hh11G/sOYvAdClL9kiUKQ9bYEE+b9oPZIBTeJ+cur+78HbBydlLSPoLEop?=
 =?iso-8859-1?Q?q95yErXmoshud0e5PMbRRgcV5B880MbXY/Uf/71whq9fvcTh1K6p+8AUhD?=
 =?iso-8859-1?Q?rfDvHE3ZpoYMd4yiqktYBnSbX8ZmAwufZ5XdEt21KIGyDUu8yftMLyu40r?=
 =?iso-8859-1?Q?aSyNR/S/4SJkg+o5edi7sTyJKzGO9r05QaBcJ6LQvwKvh4ysSbwqPtMcFn?=
 =?iso-8859-1?Q?6aThsGKZQ9srJ5WfoppT5n7JPVPUSVyzXR6iGG2xaiD3bk7EPod2zJi6fY?=
 =?iso-8859-1?Q?xhU06RjQqmRbaRyoTeStyyHdSvxMPXdy0TRGCrca/fDItx3yIMYb+Emhmd?=
 =?iso-8859-1?Q?KFCrXxutldtCnyBCDlRt33Vefh79GUDXtPST0mGYJ8mQpWugoW9KfQhDnx?=
 =?iso-8859-1?Q?IdJLIyuOcjb5BZmJsWnRsNJZWmUWko0TSKCWgO5IrMhvBqpv9BJhX969Ex?=
 =?iso-8859-1?Q?CZl+s6wHKbdRUus3JxoszzetyW96xZBfpBsbYOxgOFRHQBQ5xj8cySzhFw?=
 =?iso-8859-1?Q?KNGY6jI6rAnTw3tVUPW9PQugJLN6aXSSBZ0/A6gLtv3rdRZQ/UW6OK1yL6?=
 =?iso-8859-1?Q?9224AlppE4AKs4fwNpLFzF9XG1plZ15QcgnpXzo3XZj3wfBCbj44IrG8D+?=
 =?iso-8859-1?Q?YNbicZxSymQ8xhNrAqE7m4thKu6mPD7HBGF04WPP0+guV8CH8Lil2mCIOZ?=
 =?iso-8859-1?Q?w1ZXC1OJ+eJ+9chzon4FcXf4A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mitsi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR16MB5580.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8608053-4c39-471d-9719-08deed8b9cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 16:08:22.0223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 30e8c1d4-ec6d-43b1-b912-0b880517829b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +oHkFoSs8oXJykszEXZ3F0rAIAOliO+LAKvg5gt4J4OfiQmjgtVnXVNVQtk6vJNY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB5788
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242277

On Wednesday, July 29, 2026 09:42, Yoann Congal wrote:=0A=
> This patch should also apply to master. We have a strong master-first=0A=
> policy so any patch need to get an equivalent merged on master before=0A=
> being merged on stable branches.=0A=
> =0A=
> Can you send an equivalent patch on master so I can review this for=0A=
> wrynose?=0A=
> =0A=
=0A=
Hi, thank you for the advice. I've resubmitted the patch on master. Sorry f=
or=0A=
any formatting mistakes. My workplace blocks non-outlook mail clients so I'=
m=0A=
having to jump through some hoops.=0A=
=0A=
Wes Malone=

