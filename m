Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47BFEB2700
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 19:07:01 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1022.1770750414618827068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 11:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=lprCEJPS;
 spf=pass (domain: est.tech, ip: 40.107.162.71, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc7ZZFkyHF1vSTB/8XzAhTj7EAoby/iVUDjGB51N42znLyM2zRM/ug5Rz83kgX7RZ83d5sELM6QGMGRwuo9nAOpK5CyP4ainwzzBacyXEHkvsToX2h8EKtGnBcgw3qZFGufqRQsP9cRpaWpPvmjzt0FXGwyD6ILOaXA65SohfzEiab5fFiHY4M3WGm4OogaP8AxiRqglK2BHQ2+T9Jd89Red4Cq8LqhanaMYprqU5hYCn2AlJgQPzKYkYoc9u63mTL7s0XCL8OPhHNpOEBup+S7YtyZVSK9GbS5ASX6B8duJlJ7JsUb4JaK1s+X0WdrW+LNzb24HCw0V/UACBa9rdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwiwkpM2AzNaNS56eenByioEzgdFpucx1ToMv7PE5Nc=;
 b=phAjbkYp7rLAqclDx1JwJ1B/mxeRdOYDXR6qIXxoD4KyAlkDsl7w+UHRqb4XBwyYPnvhjFkZ5icJzKpZy4yOztkUx6TarJ0+f99vJR2rZ7DGq0ZIlMTjiw7Zwe/IZHDHDJa8/aRV645FFd07kz7z7HJ7IHm2z/RGMLay+zR0M2E/6VCyG70G3HtWiOzWpnQyihjq9YT949GlbvK2zZXd6WyW2x69cwQukVYpNSq/dm4iLjDeRSmEXKCJlvxnKVP2dVqmWujo3d+VGjWukK6JJC1Tv5uP5Znf+SmwaLzmEgnuu7KZn8VRQn0lsSeVHgG9zCj4LdhpuRQmAj1P78e5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwiwkpM2AzNaNS56eenByioEzgdFpucx1ToMv7PE5Nc=;
 b=lprCEJPSCkqobRln33ibp3fqobOlxg0E1vmSouZPhmM34GVj7DTm8R9pKofA7hUS6J9HB57kWtNbqY8xIKGJ+La2T9j6dfuGhoXwexHrBn3ae0BKkEUP82dLuV1GABN5848BSHZOPCqcCGgqsc/C9mYz+d7sKqeNgk1iZFt9SYWnttniN1jWY+DjJJunoBbT8OhWiYYpVSrOfQcvohyg1hESPAGnfobWuX4rbO2+iX66gew2iEs4LkZk53u8pl/tDdOL+dnGtto62C5xNdsVvzkwhMWNPSrQyCiheJNymN5dJANd3i+YvYXi7uPVwKN7+WynJMUTL/HQKtk2jrd3Bw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PR3P189MB0906.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 19:05:31 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 19:05:31 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Topic: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Index: AQHclJRi5mpYd74VekWfOU7uVSsmFrV74T4AgABzLOE=
Date: Tue, 10 Feb 2026 19:05:31 +0000
Message-ID: 
 <GV2P189MB30050976C1406F9DF392820FFE62A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260202223606.19978-1-pratik.farkase@est.tech>
 <8E143994-B189-43BD-BDEA-419F9FDC84AF@arm.com>
In-Reply-To: <8E143994-B189-43BD-BDEA-419F9FDC84AF@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PR3P189MB0906:EE_
x-ms-office365-filtering-correlation-id: 34084ab3-13f2-446e-f29d-08de68d75c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?FrSughRByqbGT9ApaUYYNvjfkjDBL/gM/7mHDES4zv8b1262mSrmlB3RoFOB?=
 =?us-ascii?Q?GZTyKWPoh+P84ww5DBYexKtTqTnSPzybIiijz0FHaz3jfO8TZOBMpaL0dJqZ?=
 =?us-ascii?Q?XJ4ec5HrH+qqx9PBmwXzfP8wSjUphQfvxSyBZAKP3hyTEX8LatNpfSv/Oo/y?=
 =?us-ascii?Q?EFkOxMq5OcZ6SujVtOyi+XreamHy+NbfCmLCBI18MHUtxow7XORr3E55dhQu?=
 =?us-ascii?Q?xa5YBqQ+v0xzwXXuAHAJ8iTgWziENEdTp6OAqscmvOb4mo/XTX/Mj0fLyOFs?=
 =?us-ascii?Q?aHEKDglH88yQhDOW6AfsGkH3aTbUrsmpx9a5hS+VC8wvwfuktDBumTT0R9dc?=
 =?us-ascii?Q?bmzjYTNyCbnXLKoUmvG/8QDSDPH8Rb2P6mgIE/9FBqHcpDP764hUfAJo+LLa?=
 =?us-ascii?Q?ALSOkDNMHbM/LtS7DVJ833hbbLrYZ4r+JIZZbxb+KVsJ1wmF4WjH0Pc1s2e2?=
 =?us-ascii?Q?Fqbkg8mDb7DSl9nKPVe38TMZSR86ClLAgYAE20aWhNcfIGH1ibvgS7UHDDNf?=
 =?us-ascii?Q?OX/kptjN79QcVTPWe/L3llJlY7AJWVr9wCkpF0OFsqMg0CFKkDjQlxQyQyAH?=
 =?us-ascii?Q?9WaQDcQgpF6ALDfVhRmWwcdzG5CFdzgK8iWtO6nQ2T5oUDUVWdw/5IVAqAdQ?=
 =?us-ascii?Q?ONggyQms8RZOHS9U/CfVCzg4Fh8jfvaBu3ElXjiQAQVDuaaPWKHaEsDISEhT?=
 =?us-ascii?Q?4bIPfQDkWaJuS2R2WfDK1Jm4OWBFNFeZ3OHZLk5W3z7v++EVDR7pZmJQ5auZ?=
 =?us-ascii?Q?FfHxtsgD8F02dWOZhkN8qIwiWllZ+3T5db0oSC+4lgsmk/3T8qE9cCByEuxK?=
 =?us-ascii?Q?EpKy484FcV6q6OzFDPIOg8Joxk1dp//h1b0qakPEiSnKEvxv9z9ULHcQdikh?=
 =?us-ascii?Q?ito28xsbyb7BI7jN36cTVYFN1YNJudab3MyB6uSBJwGPQku3mLX7LsfI386z?=
 =?us-ascii?Q?rvHRWVt2Ed+04We3D31fhhW9Qg2v01aoaeO9HRadeMPWWpyTXMKsFqG9rwVj?=
 =?us-ascii?Q?A1JX1pSbpr+WkjevxK0qeHuYWBpLUx9dfX2MQ6eqX/QBZRcH9lDEpo8zj2tK?=
 =?us-ascii?Q?T1XClNJ1j/glmsQjIIzrMxfFL8TD0P8nvkVcmLws9u5e/q7KmvfU1dG8xcyH?=
 =?us-ascii?Q?ntd8SgSDSC8I5JmhZyJKZ/WcVjN/iCA89AzQ2owYGJjgPXwhPyhIdHhFgOy+?=
 =?us-ascii?Q?J0iTQzFRqjLTf0+/Dx3UY3x88AHftN2FoEswq96XLbktRxUk0AlFjniIDYjs?=
 =?us-ascii?Q?hc9WFemTVZS3zskrIEuV5DhheLvlyURt7M38oBj+MH5162xxqa8o9Ewu+Z0G?=
 =?us-ascii?Q?UjGmyN3t7Mfl/I1A8B6CqF7vWUbZdaykQz4kJhQjUTXupiYcSwdkyuK3TMq+?=
 =?us-ascii?Q?ah6dJ0K9O/1UBNPQy+VZNfJ9iqyb8modT4L/vd/duEVPs99f5sibnhhT3C6s?=
 =?us-ascii?Q?PIPuMcA5pHYzenAG1R4jVQrYjy2gfQDGWYndMcIkMzhGkRgyfDKji8VM396g?=
 =?us-ascii?Q?TQnLhfNg8HH7+LnQz8kMYBTeDDzCNNlOd5np3nzECIfFKtCEE4tGkGPIZUE6?=
 =?us-ascii?Q?bByokGrUtVpuZGJwJDpzHTuoySetHiNlj2QQUF4wldSl6uCSdFl1MxMXIC/V?=
 =?us-ascii?Q?p0HohBsvaF1vOkgTmpTerlA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mYtBWztC+nTZHDe9cwFK1WtTmk5mRmaVfZJ1VQI5sjLMwWbMVQxf279O3Bka?=
 =?us-ascii?Q?VEwHjZmbARR9/VxX27q//PjyY9wSSFO+yIeflJc/wyleIliZWQ5sB/puL2eD?=
 =?us-ascii?Q?UWDfFICiA4a0QBdhrHsppv2jdGlrv6hiRsFjZtPjQx0tf2UN8wOpmH/RABQC?=
 =?us-ascii?Q?v7om384wDcG4RgyUMCLIhjZkRmB7CsdHRbQHSrJqNSt1Kjb2RmnYvI/PVUf3?=
 =?us-ascii?Q?8NUEqc2CnOCyIRcOl0jefN0l3DZokItg4fyahLYS0gr+Yj2VzqZPYfAlgYYs?=
 =?us-ascii?Q?wf0PxonogvumB7TmlXgHXrtwZAjIEavS6e+zxqCqW1da7PU9vfcCuJVqDKU3?=
 =?us-ascii?Q?QuTbR7Oc4z5IgBhg0rgBjjjQ9cwLixckCgprZkKjDmpHXj2aTliYXphcWNeZ?=
 =?us-ascii?Q?loEvFzaHPByKNry0TKJAQyurVv/S8DUkjD9XMlEmqoJVe1vPmFZsLA9ieFlA?=
 =?us-ascii?Q?E+EVoZ2TIn/OJVS7A/YhHiZMO6vZHj7LkFnNhNb4MrnmbddRi/eMntE7EnE/?=
 =?us-ascii?Q?ohDp2bn+MgwcT39qbJZXWzn7iJb90K1+koVtnhVzqbt3fPsqiz59SFYHKxUw?=
 =?us-ascii?Q?w7jgQ/r70mROAay7ajPUyn+2NFNL9uG5kzHKzlZVu5h7WYm8WLJmwBQZwq84?=
 =?us-ascii?Q?W4DiVyZfYSQKXyX0vS1WcB81iW/xJrkoPiqtzP2ZfcttAPCCm4ncIfl84aYQ?=
 =?us-ascii?Q?y1mAl3zmJM3ZknkePfeQ5BYQ/8A2bGs5u22mBRa1PxU5DbLAFCmyVBV0UU7r?=
 =?us-ascii?Q?NiGIfSnshrGIq1S29wPdjFiSViAxwwCCm1xSJNHJPqjcW47RKg6xWw69VaeR?=
 =?us-ascii?Q?bwpR2r6g76YusnU2IoMCG2/X0bT+mwuNmW/0NzYiUEeg+AdnzXh/KD3agHLt?=
 =?us-ascii?Q?KsRE1x46As8NYZMhdz1n9sqAa0YBF8yBT1xIt3akFde0rKLHyE8xIv9dpzEG?=
 =?us-ascii?Q?aK1DizgiMyKtwVMw4Q0NpOmZ3Nz1kuTInCHu8uBybir7nvzYesKaJ2VL8czH?=
 =?us-ascii?Q?g8DImWZhfeW+gor2JH0TilUSXbvGkLBCz0guX9yoxB3V0idE71bIDcRzznxn?=
 =?us-ascii?Q?2obkUFpK59mnquHxm+LlZMzJ6AfOVvLASxF04E9/Kb3vDL6Ymjd2GizbNhl1?=
 =?us-ascii?Q?W0p+h7lg6buMl97l/O4J6Kihgd+dBP98SeWNZsNIZgDROnuk6MYk4Iy9VTyT?=
 =?us-ascii?Q?Jre7jHkJgesj2symYLQKAC9pLuOUIVkk55N70L1w+eEiPxG/1+DxOQkyufXr?=
 =?us-ascii?Q?TYwejL1b6nHqIkEXYJOmQVzCxZjYXyUhqHz9zur1Ocab2JppiFybsiPkF+tB?=
 =?us-ascii?Q?EskR8tF6QnhEILEfntu579dp7WysjoDWlCNlej/6Aj5HRWkMSMNGgGgaxFa2?=
 =?us-ascii?Q?VeOW7rTEea6xOV1t8qiWt1+aUWyMhcMPC1MDbq7i8gb0zp6U1rDncpJQDpVn?=
 =?us-ascii?Q?MTsZZmMFd7dZW1SBvRrCpVnnxWTkeklSZ52tr232DKeXlg1rJoBhL3fRCL4T?=
 =?us-ascii?Q?oFWWTkGU7ciwYHLWnkP58vVSacOlyOuXbMyNmleGfMhHqn/sXfyVtFAuuAOy?=
 =?us-ascii?Q?uWXE+ugTfmJzGDv0ZBtNuA4yLOcWTkOOXuuWj8WbtpnrWq+bf3lmga15H241?=
 =?us-ascii?Q?TfwGhCRUbwXbfndcUr7+KPe1x150nXcIPP/E0VCeyW9K2zLWU3VIIGDMcKFE?=
 =?us-ascii?Q?c60SEN/eUned0WG6QrtF2k1dTHWR1MKdieDBTk8efZEi8HhFOCc5SWQgQgOH?=
 =?us-ascii?Q?GOlET5Hwlw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34084ab3-13f2-446e-f29d-08de68d75c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 19:05:31.3309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0dS34zpZLmyORSQWGGMr3pt4ved3SLzQbtRSEPyDuri0UMIYJ3HgQhpEAUsIE2MkpPTU8AB1MuUPxB7/TErgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0906
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230929

Hi Ross,

Sent a v2 patch addressing this here:

https://lists.openembedded.org/g/openembedded-core/message/230927

I noticed that I have two other unreviewed ptest patches i sent earlier for=
 :

libassuan : https://lore.kernel.org/all/20260206121709.7421-1-pratik.farkas=
e@est.tech/
libarchive : https://lore.kernel.org/all/20260208184637.14046-1-pratik.fark=
ase@est.tech/

that contain the same pattern. I will update those as well to remove the co=
nditional checks and send updated versions shortly.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, February 10, 2026 1:03 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support

Hi Patrik,

We merged this, but the scripts seem overly defensive, would you be able to=
 send a follow-on cleanup?  See comments below.

On 2 Feb 2026, at 22:36, Pratik Farkase via lists.openembedded.org <pratik.=
farkase=3Dest.tech@lists.openembedded.org> wrote:
> +for t in allowuninstall alternative blacklist choicerules choose cleande=
ps \
> +         cplxdeps distupgrade evrcmp excludefromweak favor focus forcebe=
st \
> +         lock lockstep multiversion namespace proof recommendations sat =
\
> +         selection strictrepoprio strongrecommends targeted testcase wea=
kdeps \
> +         whatprovideswithdisabled yumobs; do

Can this just be for t in testcases/*?

> +    if [ -x ./runtestcases.sh ] && [ -d testcases/$t ]; then

You know these exist as they were installed, and if they were not then we w=
ant the tests to fail. Remove the checks.

> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tools
> +    install -d ${D}${PTEST_PATH}/test
> +
> +    if [ -f ${B}/tools/testsolv ]; then
> +        install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
> +    fi
> +
> +    if [ -f ${S}/test/runtestcases.sh ]; then
> +        install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test=
/
> +    fi
> +
> +    if [ -d ${S}/test/testcases ]; then
> +        cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
> +    fi

Why all the checks? If the tests rename or move then we _want_ the recipe t=
o fail so the ptest installation can be updated.

Cheers,
Ross


