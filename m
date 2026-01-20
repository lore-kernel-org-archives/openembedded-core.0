Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F518D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:21:35 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5206.1768911685319371978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Cr16dLdK;
 spf=pass (domain: siemens.com, ip: 52.101.66.17, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdRbMjXYE4Nx4cyVipfAOZPunmVFcvKOlNhxEE67WI17gGdVMjrF0uSd0+9S1fSLgr0dowqQ0qmDMI4rAVX9KND7xoLau27+karbcYS6gxNu/OGRDEgX2efoOP4Q1twjjmQuMODodqz5dlF7F34trnWMEmbuxrhUPx4Hefw56o0D8AvGkaTrxp0iEp+LyIrp9qabuylGUz9NNwiPzmftDak6jnwXaHW4psAm7Za73UML5zpjvQ+2il9cyUafWPII/5PAWMKZ9+xv7mz3JOPhodS1d/PT0fhQKA2sEdCpTTbfkvBia45x9Am5Rkrg5sEBcOjoeBBjElEgbhES5oNJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hC1YgkekVutCZ4PAlPsba9oIBjB+cpet8KMef2UpOLo=;
 b=bNVFZrZZAHybDl2fASGgTzGX7qtzkYiubByVp+ROViOm/NaLwIGhLN/nbr1oLMLYD0pOXqiACnqloAjZJZIOKArJInYuJYEO4Xs92L/SLb5fRCHIPLIku0wWGleKsSfx0ujXqE/Q1T/zzGEnAYWCjqCJvqlsDWlzY3eUkUOw+u5MYwaUT4c8y2od2rkfZwhwOACbxlKsXEocT6t03JbBEVGsEa3uffgk0EUH9xkzgeadkmWwbT8XTvNKD5hGrp19Slat9/3JWPaVJJAXtcXW97pIbYWaY3bcT7XcR+OCg2vX1x1juoCBvRAPMjqNRyXIv4gzy0oneHNJdiL7mUWaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC1YgkekVutCZ4PAlPsba9oIBjB+cpet8KMef2UpOLo=;
 b=Cr16dLdKIFci8n7w8i+R5g25iBUvry4UAevbh3kSCRxQ/fA4yvAe4zwPRtIUYzR6i3GZVW1dacjZs91CmDNUoN7wlMiY2Fx3YHaHtvcWov/lJJBM5Jw5Lpgpc7XzRaHZzJ7u0Ax2gqO3u7ZMiY7W07+7m8pVMdsNl5nP5WTqP+vGowR9+CgpQaReV1D8YUDfDuIHVClUpicJF/SxiN65PJN18uMdAbaC8UgXzViA475nuJmRIcGeD3VF+hI7ro16VqqkcJbMl5DO03fApjt5ZZV1mtXo0dVxrQFDKy+ka5D6rfscIA4QCgLR/sq4Ci9a0Ct+bERo/wonaSSYLjGJQQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:21:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 12:21:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>, Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][scarthgap 11/22] cups: allow
 unknown directives in conf files
Thread-Topic: Patchtest results for [OE-core][scarthgap 11/22] cups: allow
 unknown directives in conf files
Thread-Index: AQHcigXiTuHpiI45xUCkHFdAjftHLrVa+UmAgAABL8A=
Date: Tue, 20 Jan 2026 12:21:21 +0000
Message-ID: 
 <AS1PR10MB56978D4AFCBC674510C81B86FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <534f207c2869c6fbbef5d061607a28b6114c7a22.1768910519.git.yoann.congal@smile.fr>
 <0101019bdb562a2b-484d0628-8997-4935-86c3-0033faa83721-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019bdb562a2b-484d0628-8997-4935-86c3-0033faa83721-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=44d7455b-b17c-4058-8b59-ec18c448aeff;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-20T12:21:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6746:EE_
x-ms-office365-filtering-correlation-id: 446e899d-3796-4726-14e2-08de581e6c06
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?DwqC8l/2wo+/EFHOC/O1Pmo2scSAa9fAgmH3m4U4pKs7E/1arvpJfKaxgcJa?=
 =?us-ascii?Q?vmf5yt3ixFJH4QfohreQO3vguGBtV0gASinhFn1McqspJALzkgxD2UyOtHPV?=
 =?us-ascii?Q?Z1kOQBpKqh3hKs9SXnfegxSn6OXuzb2F+GgiZ1JFfj8GnNrWDgNlim1qIolp?=
 =?us-ascii?Q?idEwqPjwMEBouV1rruGuYSwNBnEIdcWUxajWgbaLVkXDDOeUNQEWg/S5K5Jc?=
 =?us-ascii?Q?C4JwWkPcUTt7ymPlQRi38VChv6/D8uILNwAVxsIfQGQrumJFk2N8J5ID8LvV?=
 =?us-ascii?Q?PZqLzTnOtyAkmQraPVpJVcuvhjZf0Yp7jGgOwbmZB6EmPHUd8J4hasJojhoE?=
 =?us-ascii?Q?OArST/s5v0buxlQUyupKEdaYOglpYdpqW75i9VIu8Q0A044hsWLtLg32rfbR?=
 =?us-ascii?Q?E/E/znExXZ0re7hFnC/BX0JTQ66l1k0wYX/vd/UuEznKGWbfZsLN7PI7kZp7?=
 =?us-ascii?Q?8rVFC3IZ1jV11GgumER1KdOdeZ9AAYnbrnqhKfNxI8LME8Kw7N4FAPTjkgGK?=
 =?us-ascii?Q?R58tQUkxe9UyzsiSt/sMqm6GUgrpFWQPHHrms3IkhK5cZ6QMLQXOS9TV93Hd?=
 =?us-ascii?Q?exnlTMmkFBZo0nBgpAjhuZ83qPabLawZKalU1J/djWokkBk/zDIW5cNPYYCK?=
 =?us-ascii?Q?ubciFHBjbafEn5Lp/8plCheyb0z/5RmcvyoIzAy3Xarl8+YFofhPBP8qRo8z?=
 =?us-ascii?Q?2bivY1wqJ2s52HU9BU3Qym5vIZIF42l7IVmdoyfdLFHiHoOwf2NvhH8KsD0Q?=
 =?us-ascii?Q?fCyPTfshAgdPa+R+or1aRNgE5ymny7cAAoEuBKq/7RjSejHkKFMr96V/ve7o?=
 =?us-ascii?Q?uwGPVeAQzTLr8ckySINcIhnitu/2+Y98tPwumdjLo3UdNaz/rb2+wOHHpi1d?=
 =?us-ascii?Q?bw6aFskr3xb6nGo0/SOM3v+2wubmk7g+XDV2b8MidpcTIlKZjyiN386TBpJs?=
 =?us-ascii?Q?AbZCoSb3h4T8CE76As5+E6249bfC5w5a3bhrThs/AjR4tVK+59u+s6ym6/eO?=
 =?us-ascii?Q?8WAearO9AfgNCnzdT4yJeAs3jj5Ao65mw0U+IzhBgvPA9VQ22hWh42fzG7kf?=
 =?us-ascii?Q?GkoTcrmOQ+yfrUd8MH4+X/KZeg+8yO2+Y39fS0ca6KUUEnk5d/KvjSwr3x7U?=
 =?us-ascii?Q?1q3bOs/39UltCJRbSGHjK2mHrHrPJCaCPSgWgR7yYnxp/68Atp/2BCU5K6C9?=
 =?us-ascii?Q?ELQftzqelHST0KNcHQRR7PJWyywWgQ6Mjghsye/ggbs5VxzYpHL7LIcwRjTA?=
 =?us-ascii?Q?LQqrnAufSoVw3jEUida0uctrevRGvhqFmFP+aqdZHsZXmD/XJQlTyEcikOsL?=
 =?us-ascii?Q?rKMOSsnH9cEocCZoH7KrmVfYO0L5cWrp4W5QCdrYoiNFvt1pxg04BSDbzXgT?=
 =?us-ascii?Q?+GOgPd59CwSIKoG5J2oTXnk8Pu9SBluZCFpUtbt3eyu2sdozwPFb1CiJnJBJ?=
 =?us-ascii?Q?5+Aa9cqOHyQXxaVaSmO4I+iRG1iiqAhW/GdartWqyCs0g6VeSUHT9mF0d37m?=
 =?us-ascii?Q?7yBIgFYr0TsWNcNYSBRWLFcD0FZVdXUD8zXP406iuyfGuvM1if7413uFHLt+?=
 =?us-ascii?Q?iwXyqOBKzN8VGGWiov4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VGvAEVebBT+qv3U7uKH56djuf1ltGXlgrJJ/GWw431RZWnq+MktpMD75c67f?=
 =?us-ascii?Q?wMBAUBidrR0RagHora1gtEkW4SJ+TuR1nhbghzvZVtFNAnU05f2xwSypFxQA?=
 =?us-ascii?Q?yj8PblmJo0sVDleGexR0aDHkcZsJu5xgQqD4TG7wFhEqOJPT7lYHJ1SpQ2dh?=
 =?us-ascii?Q?gJlRBFImYEP2W99gYwvoQ3d8aAx6M0drW2SmBTi8kOMLMSCueKyHouzrydla?=
 =?us-ascii?Q?AuwvCPvhqq4uXPt+FKjSGLiEaFIeCkG/r1T0zv9+KLbpRO7J6Deu1TulT/28?=
 =?us-ascii?Q?sM8sDLY+ROw7EDOfRAC/Hfysh+qpSh1+EwLnBgAX/YS2GXHHAIePfDo3DcOf?=
 =?us-ascii?Q?rPoWgIXr7w4rUzvz6SsHcabPoUhoB4UymPxLJd5xAFaw+9dh7vJ7wErkXVCF?=
 =?us-ascii?Q?YgBWNCsulxQm1v9dcpK3SaITIHHGezMm7kMQ55EujKBYHWRXfGsBgnQeX1F7?=
 =?us-ascii?Q?+rU2hXkdIvEvN6QsE32jhaikXGD0gLKK9rCsFHlyizbvqdj+AB2hClpUa0ZO?=
 =?us-ascii?Q?rugpRX9HsqMSQeh8rImFgeQdA8FmMWZtQnJOB8ZW9FWxXxxD/CiNtZ3+0K2E?=
 =?us-ascii?Q?Y/T9Bgk1L5g1n+uZ/6YhA2Y774yEwx4QakHJhu3F7UwlBaudxS/L6L6CstIY?=
 =?us-ascii?Q?5hsrP9mgJNYXycBWcIDu9oyu7kabBsV+VEJ0+8M+eAJKozUOVBFaVj1C02ub?=
 =?us-ascii?Q?6DCFWmLb6LEegrW2gU4lv7icg/xy1iuI4Sp+BDsfazdb/qM6AkHKH//vaqD6?=
 =?us-ascii?Q?X12WvVqtcGjHOyHzEEgTT+atOJo9zSROaBKoQNlC7W2b5iu2M25bEif0ajR4?=
 =?us-ascii?Q?Pg7Xvw7Xgo/T3afM63ijDjNyRoPL2wz7KaOq6Bs5jHl/hca5NI5QwQ8dmS0Z?=
 =?us-ascii?Q?DiSrwtimGdGLDsF7rqRJ+k15bpQvU+9yW8tGqOqz0pjhj6ml74c2WdpPD5j7?=
 =?us-ascii?Q?LH3/BZwNax1K7/hMDVfvx4u0AjhH37T8qxeeui3J7VRyq4LFw2BwG2VS9OTK?=
 =?us-ascii?Q?LFiZ6VkzQzOrXDLNq9MK5IIpzpanTXORkuGy7l6I4hXJO39ucs+1sEHW0n0E?=
 =?us-ascii?Q?JAntswlIfln9AbYF2voTeQmLSuyCPkEtT8LysW39E8RSXWnc0GZbp1t8lanQ?=
 =?us-ascii?Q?hf7i3hdNz3+UDCHXk7qLmAeoo+PDQWOQ5CWViIqJQ/L6oJ4HfOrdyBC6B1aI?=
 =?us-ascii?Q?V9ZQgMHz1yo9GiPvgVR1nqtNGp/BdJGr8BEPg0UHE/QUSLpDh07DYumAbhJQ?=
 =?us-ascii?Q?BtJ6u2hlt35BlZTfWUV6U9jDqzDePd1ouHNa7a9LDv8TC8HjPFcrdi29isNA?=
 =?us-ascii?Q?kB8+kVPlM2ICTyAnGeznjKIbKZk1h/YC7oNzkaIHxkueBqcEYJnTPSy0z/AE?=
 =?us-ascii?Q?5SYlzLaTvfxIWFLGieoNWCnJhCbzUHDZj3ZVA+SXGn4rrN7z8T/pxXdRjxHB?=
 =?us-ascii?Q?YITuN1kT3GPVcj0yw00qsu2S6pMsd+n2CARG0iE+mkeQVh2wci5Ta2wWZxLo?=
 =?us-ascii?Q?CtRxISupCwhI13gcVcGZW4/VE85p4MFMbz/kErJuqhFUDZKrrkxgUWDz0CNE?=
 =?us-ascii?Q?lJbj/luqXlU30ugavxkaju0gcYXjM+n7aiu3WqJi0MXSpb4n2p+9ue0sP457?=
 =?us-ascii?Q?Q2Cq/GYixwoS9oZQmBmgURseH/MQcfVcFhNicSvEz2XVGOw8DPzxeAMZuUTA?=
 =?us-ascii?Q?U2oBZXlMgePa6fntda2NfCXiGcdyvkIuBcEU/VX+iVtpdTetg9dfPSp92rDm?=
 =?us-ascii?Q?9f5Up7evWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 446e899d-3796-4726-14e2-08de581e6c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 12:21:21.7404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67EIvWyGi7a793FfGHZIasaBKnF/m4KT2Ny91haeHCnI+EwjNkgW2/7Fstk75WsSuKm96SOhL0r5ZLGnExbcuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229702

False positive as this does not fix CVE, only mentions CVE in commit messag=
e.

I'm wondering why this was sent now and not when I submitted the patch.
In recent months there is almost 0 emails from patchtest.
I guess it's broken and revives only from time to time?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Patchtest via
> lists.openembedded.org
> Sent: Tuesday, January 20, 2026 13:17
> To: Yoann Congal <yoann.congal@smile.fr>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][scarthgap 11/22] cups: allow unk=
nown
> directives in conf files
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/scarthgap-11-22-cups-allow-
> unknown-directives-in-conf-files.patch
>=20
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file.
> Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-X=
XXX"
> (test_patch.TestPatch.test_cve_tag_format)
>=20
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence
> (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence
> (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags
> (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
>=20
> ---
>=20
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

