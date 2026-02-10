Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3931CEB2714
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:41:52 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3222.1770756104237769475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 12:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=SLeXnuyn;
 spf=pass (domain: est.tech, ip: 52.101.83.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSc9JNYdZOprfDQzJljybVa4rqvgh3YPN9zvOOFqjulpk9Ff2rT+pzY3gDuGj9BzTyImdvg+WHlllzC5bgOSitBO8OaDDFgbUwcbO56Rru5wWOycZm7xMPGJRxOASjcGlrrJtZ1jzuMFhowxRkF3CNOgZIP3gkyusYPADpvInj1Ht6RJPyNDXU17ddvxRyBTcquBhmae/8L2npCIX6kba7QW1emUqwqweqVPwm6WJt45sgfrtHTnLA1zBKw4EU+C2xCseR17le/auLrcq3K7zfQZmrtvQ6HcXRbyvOi36RlfH7U6/pOm+VyZPfS1p7djSQLWWocL//lCDra0zUNMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq+Le+ZICZ1FBQlPWyISwGTFnLwYc4ndY0UfExfCqXQ=;
 b=s5kFtUxLu/YjQ5bthMa4JlosD16hlVITyu9e6+fUuOo3FHvzuLLg14EuLI+7ZbTTw97aj2DfzGQ8skLkPm7uRUwW5Hi7q/KzbvBYr0TPBWn60Og8kW8JDUVmCWhtyN3YzsLJVrcIG25HXgnr8qRa2ml4FAkcZiTshQWm6xr5W3bfmiAn68cmh0LmFNe6t/2MTO3X387mLZ8kbZMSi8bz3t74TYRYqBAi86jl96JIRZnpbeaB/Ui9g+slj7XOartq3wKCq5TcTMpZhPZO4Na1Wmk4rh9bZ3HP35UCJzUlDpc4Gqh3KqWTRU+gnQSP1FlzBkLLcrDvYUD7zwdeqx7H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq+Le+ZICZ1FBQlPWyISwGTFnLwYc4ndY0UfExfCqXQ=;
 b=SLeXnuynADz+fqKRqhnb4zA0c3aho3lb95YUQyhlZUc7BZ/f+5Zgb3zd33t5OgWIvNvKPRNtQzJ307h8kEmF74KEjqiaaWuT+Rf8983ScPN68gJQ/gPfT5OsTHJ3BLs+5ecqF4jA1ye1Qims7XoGdxz//+pS7FvcImnahUgirXZ7SuMqXFB/CMSlC4QPcdXBQDEe7bGx2McfLTakmCGUfk7ZHAmbZ5nc5xUUnVZXEIF5D+V2K058eTuS8Jx5d41W8ojDz84Fey+T7gKmRW9hF07BivpnV4hHscX6ehZ2/xHnITs2dWXZTHy8mLgpKKUkO17Y9ZsybChaczLDur+mpw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS4P189MB1965.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 20:41:39 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:41:39 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Index: AQHcleaxPbMZ1IPe0kmxOtOn4835IbV74ZIAgABusxyAAB7Wlw==
Date: Tue, 10 Feb 2026 20:41:39 +0000
Message-ID: 
 <GV2P189MB30058E92B9E580CAC686009BFE62A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <20260204145811.19113-1-pratik.farkase@est.tech>
 <56068E4F-CD6A-4E3D-A685-52994C77FFDF@arm.com>
 <GV2P189MB3005FAFCA7404323AFA97B89FE62A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <GV2P189MB3005FAFCA7404323AFA97B89FE62A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AS4P189MB1965:EE_
x-ms-office365-filtering-correlation-id: 9fabdaaa-0ae0-40a2-acce-08de68e4ca82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?Rk8od+/00AmaQtl4WxSwj3s/mQKEsrMBMDErqZMAgbr7+MaceW4tkcvO?=
 =?Windows-1252?Q?NSrVZT0wbJgdJJAFs6goB68C1xnP2HzMjezX0tBmj4oR/XcSfBCbUQyl?=
 =?Windows-1252?Q?lXSujrBUh2/ynmlw7ukuq8IbFL7wfupfPbpFuPElj5kwLI+PDlPfhRsT?=
 =?Windows-1252?Q?/YggGQTuQudM1QAol2Rz1zzb17LbEpfSgWU7boCstOu66wRswCJk3xtS?=
 =?Windows-1252?Q?yIZWJTDlCnvmgsqI7Q6l4oFEPagJ3AfOPYDDKtABvYxA14URUoT1LN3U?=
 =?Windows-1252?Q?kIWeG1XifAMzdVQ/qKF5fddffpHYTsXxQ5QraqGbz0PXlxNqbY43wEs+?=
 =?Windows-1252?Q?DtXIuVYJwb1L3/eWl0IZlGeWAPAT/LQ3JVgbk27AYHzbgTF2rTwWRW/g?=
 =?Windows-1252?Q?p4k5WyDSYST3YbMkgBfwczoyZd7BJarV1rV+AW5BguJTPeX+viI6aDzW?=
 =?Windows-1252?Q?d0vigizd40/e0UT3OkRm+6MTI6aAfkyttxO7PkmN+HxHpSthzSQJ3gu7?=
 =?Windows-1252?Q?URhQWYBQUY4tc69LcySv6YrgYKxcxQLGXqMwsmGR3BNsaSNoUnE9cFbJ?=
 =?Windows-1252?Q?y7Ac47BwNCFKukNDQ2LSFxS7E26Eb4P36yo6peWBJJ/ougfd/pEHGRzY?=
 =?Windows-1252?Q?4npk5SPprM31RO7fBb5eVoNH3aIJ/SXtBudUF2AOzKy4PK3JkrMOUqq3?=
 =?Windows-1252?Q?SWmIjxiU4myvG+uAQCjN335JexZ2tIMEYIQ+Bs/r3euXCc+SWW/IQtr0?=
 =?Windows-1252?Q?8Pk0G4S8DZRV8yZA9CREACJQYkHXbRh/e2yMCpVVcFEt1AAiEvYsTYnp?=
 =?Windows-1252?Q?qYDVTLWCimrmEbFMU+WO9LcfxFtdPs2D667Olko98qDrQV6FMI8bTX7j?=
 =?Windows-1252?Q?GtAoy/TzqeRQpIxZyuks1t+mWxmWvjwLljrTbU2bczxw0SSsouKP1ykM?=
 =?Windows-1252?Q?Bwt0YEVyaqn5Ww9lT3qPBOq2u6LQTUeGvXnd8k0hPxcUVIza05ASNtxD?=
 =?Windows-1252?Q?HTPp5Do6bu2iVD2zLzHAJ0MLMf2Dkch0mNwZrPuM4oXsb4hTTvDBT+yX?=
 =?Windows-1252?Q?k6whtWcY76u+AawNZ7ZXxBxopFmRm9OTaaY4abd3tqYHtYD8+q7uWSl+?=
 =?Windows-1252?Q?qrbQiE72U42QFmpK3/qrNZtSks/07aMW12RuYFoQ+iCvnw7uAM+U1f3A?=
 =?Windows-1252?Q?qSWt5AiLysgm52rGHcO5u4WFCAB1UqTpa2OxoJBREivPRr5U9aACnPOZ?=
 =?Windows-1252?Q?KIAUKn9Kn8rClY1MsxGWiYNXGmAJVRqTWP3UrbzCRjCVqxfpp/pjoTRz?=
 =?Windows-1252?Q?+wQ/G2fiwQAavEim3khwVPOHnY8cUJorprWrLCdqVAgBFRfQE7JHNL7f?=
 =?Windows-1252?Q?2kHxt9lkNDSFKXeGxyR9/x3NNYw+5B9XU+qfcd0CXh2F6MKC4H572ZaV?=
 =?Windows-1252?Q?ppiTvh1Bh4JYZ/U+Ccy2pQnu8AefS4DlLVqrSsnXUwg1X6nMxymsEi0O?=
 =?Windows-1252?Q?2JA+deW5i5R0EulBr/PxGd2ohC8PE54GGXp4E4HPx/2Txfdy6qY4PCOE?=
 =?Windows-1252?Q?9sX25iVKqTvJaJOyqHM4syXZjh8eTzyDCv9v3VqRNee7r7yv/NP2qDep?=
 =?Windows-1252?Q?TIPVzdrxrhfpuRqXy+7DA9wNBAogEx/qPt8wBbze+wGkyf9CkilNL8oV?=
 =?Windows-1252?Q?pD4H0vwK9po7qJBAXQ3DEXQmWDQJjTDNiOZ8BN+XqL7z68G5RuDf8eHU?=
 =?Windows-1252?Q?S8mnCDgNpVzxlAIeC68=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?NuPbb9vCK8qGgLbixA1CmyuLdzDMOLbrk3bbiE+Y5ACpGKNVSzNbjd3o?=
 =?Windows-1252?Q?MpQphviQSkmNa9Semp9EbWPq9PYtZyjNU3jwA0CIKTiXOtN7AaD6LEpj?=
 =?Windows-1252?Q?kPUb6WNwBjMxs1A5x/vmDBtI9iNY/NfJf/xfezwAcxQnt7A6iXGDH0ry?=
 =?Windows-1252?Q?Lfy7NNhnC7dVO7yVpmubLiy3TGUU0fypJ4E7O+m4Ivp/7zY8wjfRVcNB?=
 =?Windows-1252?Q?+8xY/ETHKs6hGfjn6lQjgqdavEq+63IKk2J5dL3PfFl8X6Nid6otF260?=
 =?Windows-1252?Q?BByX2feptMi30Tds6xd6vYA6G8hP6S2dl/jEuyqugnkA62JDSYFBHpVV?=
 =?Windows-1252?Q?jOfGTUE64XHbjUTqMDD+flgF0cMUi5KGXi+UuS3AneT1zB32PR50fJmB?=
 =?Windows-1252?Q?e+P1V7h2BQDAp1sTtXXiHFJZR8uEb6YVlDJvs14dP7ez2wkzWzTjaWkg?=
 =?Windows-1252?Q?BuFKs0gsYlzfYn+Yr2uHVImBMi63krsuxBV7qJGd1peJveJCpQu/oLXI?=
 =?Windows-1252?Q?6UU+TJ7/3K1mtVCoMserIqZD1BHuByt5dmwvG1KZacFK67Lu1FrmG0l2?=
 =?Windows-1252?Q?GiYA9kCLfh9Z/uutcp9hojLoZgTBeVzjlYjT5VVeTRk2i7GCGhMyqIPd?=
 =?Windows-1252?Q?INMo7scUAvxniaxB+kC3xx891cK/fe1qsRnzi/ZyC6LAQEBlSvfcVN8/?=
 =?Windows-1252?Q?+ZWtfoXKNG5YY0vi572qDVVoOCpWLOXuRzm9asc1wYeNqkDFSElWIPah?=
 =?Windows-1252?Q?XYxpnH+zCXLP2IFese4zBLqhCpxDFIp+nZEM4iHgFwAkOmJqalxUi90V?=
 =?Windows-1252?Q?5WZ6icIzw0VPanGt3g1vFKzf/ddWMAufsbhRajhEf1kClNPn4Z8zLayC?=
 =?Windows-1252?Q?XcoOItLLEd7LSv+VOi929btN1ZMhm+9agZYajg1v6rsBvoaj1l8B1Qju?=
 =?Windows-1252?Q?VbkCbc+0l+gv0OH5XTjQ2tSf/wL7G5jiIImCsJ6rOKqsxaH4IN3Qtywi?=
 =?Windows-1252?Q?7/dZa0X28ZnZi3PCrKMAIfgW9E34KU7LuPj8Z1Ze++iuNT1y8YVLcnXU?=
 =?Windows-1252?Q?ED4oYC2BbyHkJjt40bm+e04IfBrOJPBNTgJAPX4ppRq+xYhj3P1h426S?=
 =?Windows-1252?Q?lxuQA9Rrys+v/SRQviiFpQD4gDsXAyt+ndEVTpKwqnzeFtDXPUdAozaa?=
 =?Windows-1252?Q?K22VTzVlIpAog6JY9jnZR8M5j1KA7s4fYt75CFlUQwjzBhaAYo6nVswB?=
 =?Windows-1252?Q?lJ7togJI85Zh3rJDK6wUfjazl1mqFA0Nic1NpBSYM0Dgz8u/GXa0mzUO?=
 =?Windows-1252?Q?WHjjnOzJbE0X5QBb8XaKAMfDmAdI1/wxDDKpankKeHGW7X+KdpseQudg?=
 =?Windows-1252?Q?GeFp1yisY+PE56Fr3WD681EPDxyemD92WYdq2SLmKWfmm2N33JFhxEJp?=
 =?Windows-1252?Q?2I5NeSWHfjFMPuORkh+QUcMI3JVpNqgZFYM5XroHvdjGE+TjYJNRMIMY?=
 =?Windows-1252?Q?0zfts4pN87//W0d2CwAyOHFRoV4iYog0O/4DYynoThETzkI3rjmVA9AZ?=
 =?Windows-1252?Q?UCNnzO6XbrFt/9ZJ+DgKqi1gWtozkHG66Z8t8pc3E2yNIfcbhDHKhrej?=
 =?Windows-1252?Q?JHmCyCKXuw0z4nCRb/J5Pf66NGx0OEBDkIbfnWV1kBaq2Mg9xFKQr3Ve?=
 =?Windows-1252?Q?P5cqhGv+fMb3lLVnlBjVVC6hOFZm9nBqaoz+aalveqHCLYFqXLZ2fxoM?=
 =?Windows-1252?Q?qecJUqnPd49ljJ8tPFy3i4ktfSh6QgSlKQvlBfpUTOQuRPdqcnoSkYNi?=
 =?Windows-1252?Q?C1dNg2Z/vEdLbVZNEgC4yTZMub4MSdnSFd9M9JheG2ugiKClsNrTg+YO?=
 =?Windows-1252?Q?BzNhHreMUUHpKw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fabdaaa-0ae0-40a2-acce-08de68e4ca82
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 20:41:39.1659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBtaD5vVrVQi+H4k3VEDkmS9Xx8L2YZwokvr5/EO88u5gu/PWgybdmk7F+ZbRV8BP3vOa1LCams1kF1QqK/rxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1965
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230937

Patch v5 sent here:

https://lists.openembedded.org/g/openembedded-core/message/230936

removes conditional checks for both run-ptest and do_install_ptest().

Best Regards,
Pratik

________________________________________
From: Pratik Farkase <pratik.farkase@est.tech>
Sent: Tuesday, February 10, 2026 7:54 PM
To: Ross Burton
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support

Hi Ross,

Thanks for the review.

I have removed the conditional checks in do_install_ptest() so the build wi=
ll fail if the test artifacts are missing, as suggested. Patch v4 is sent h=
ere:

https://lore.kernel.org/all/20260210184719.7219-1-pratik.farkase@est.tech/

Thanks for your feedback. I will keep this in mind for future implementatio=
ns.

Best Regards,
Pratik


________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, February 10, 2026 1:13 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support

Hi Patrik,

> On 4 Feb 2026, at 14:58, Pratik Farkase via lists.openembedded.org <prati=
k.farkase=3Dest.tech@lists.openembedded.org> wrote:
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    if [ -f ${B}/tests/libconfig_tests ]; then
> +        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconf=
ig_tests ${D}${PTEST_PATH}/tests/libconfig_tests
> +    fi
> +
> +    if [ -d ${S}/tests/testdata ]; then
> +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
> +    fi
> +}

Same comments are before: don=92t use conditions when installing or running=
 the tests unless there=92s a very good reason: we _want_ the build or test=
s to fail if things change.

(this one hasn=92t merged, so please send a v4)

Thanks,
Ross


