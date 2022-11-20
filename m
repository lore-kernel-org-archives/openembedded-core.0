Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77F4C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 04:44:17 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.85])
 by mx.groups.io with SMTP id smtpd.web11.6515.1668919452588152312
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 20:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=VfwVHZ0U;
 spf=pass (domain: kpit.com, ip: 40.107.239.85, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5zUqOz7FvGElFUUJrDF4uS5YNAd7wSuqfp/dc3uSF8oN77/X9EAYOtQYy3wjlKMbDTrRLa5x9t3IlSkE+ImZ+Bl/SIkLzZyNp5EGXs80ebj3ghfXEuwBmXvKQf38+cmEs1f3HVd7DXieqkq98rDN3onKgvVXSzJ2eNa3VWYq3SFY8+lN+ErK8kg8m745rh+jfXHfW5zuWiUsF5+jVXEtq4K8awdq3267cWe+mG66Zorz4DJvc9Z4oIczX7gr5M97Wu3VVqRUA+nGdDW0a+7bYuFsRt9XScCIiIU/B6OZbCbg5g/GMGzLhPwf2sU7hmdMo0tkZM7rokmPSoEnDbFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypn9MYwWK67DmV6Qtdk+pxhLB1C8IZ+0fd1G82jw9J0=;
 b=hRlSD8wVR/uHs8UG2jz5Ltc5OZOdxsG5y+CKDpaipvc11MUEsFJnog9pm9At2m0QxLSOgf+2EqFzpM4di/A5D7xafqgINZSto3bIacuddFQUIfT25sFxcxN4APp81r2qdw4tKx4gkOs1aMZvCSHwkeI9v5cwcrqwte1tjjEBrSK8k78yD9JOl+NUtYG7tBlZ1RnvEFBkTsSqWFHmldZ+scen//L1Vti+gEg//KYKd1SqP/n9Rxj0QH+EsIWe5O4tTttZA98d9bB9EevlZcq7g8BDP1hTbnhOv6I5QPtgJAws5f8ToEZtPnsA03RYiwRHL5ZWx4NX4mDLnTRzm64BqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypn9MYwWK67DmV6Qtdk+pxhLB1C8IZ+0fd1G82jw9J0=;
 b=VfwVHZ0UKaTBmxtO4lQoYzTvyV0uqOL5de7M0ABsl7H2VHEli8CbziQl9AE0mXhYe21oowmiizEvoYh868+43k6T1+3bb+vOL7ibm2Rvn3t0FLP2nPSyU3DZHRHcN7Z1VRrvUUJarg63dQW5KpAItXmOjg4NaNzqVEpU9Dp+Yic=
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MAZPR01MB7649.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sun, 20 Nov
 2022 04:44:02 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a014:20d0:1677:9d04]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a014:20d0:1677:9d04%8]) with mapi id 15.20.5834.009; Sun, 20 Nov 2022
 04:44:02 +0000
From: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
To: Steve Sakoman via lists.openembedded.org
	<steve=sakoman.com@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][dunfell 18/21] gcc : upgrade to v9.5
Thread-Topic: [OE-core][dunfell 18/21] gcc : upgrade to v9.5
Thread-Index: AQHY/D/vWLm10ETpP0aDy1RUAZnHmq5HO1i+
Date: Sun, 20 Nov 2022 04:44:01 +0000
Message-ID: 
 <PN3PR01MB738243B84D54DF57CF62C0118F0B9@PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM>
References: <cover.1668879817.git.steve@sakoman.com>
 <60984f7119a4b54cbefda48f93762b4f2b179c70.1668879817.git.steve@sakoman.com>
In-Reply-To: 
 <60984f7119a4b54cbefda48f93762b4f2b179c70.1668879817.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB7382:EE_|MAZPR01MB7649:EE_
x-ms-office365-filtering-correlation-id: 1f747fe3-827c-4030-dd43-08dacab1d8a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E+1UhhzA0xnFkVHi38w6PQSBw2O54CxLCFoAL4LEDAaxhEZ/Y6RItqn3tClaCWV5cQGjSWffjMsnBsj0DkfggRQFVx0rrmfTKvyhxYGBkBHDQSNlBoTZg1AvYcny1GhpmFtfze6s+mCbmNJ/ytsH1GCudzSrSUU2/IsxBvl5UHAB+xeAhOFe/eFyTE4eU85KYN0l82++r94upZ4IczuBkQVNSNvq78obIfGS3MEENW8WGYMdfV6zpz0INB8tjH41RO5UFYILTmjYigs5pii/EsaRq50JY+kEMn3abWSdP2EgqDRAP3yP/8Ud4rVqwN3m7/BTaeOVFQncEMbGbnZ21wRpYeLRw66Glxz5PWf23369+jdL7lehr4hXbyDfJJiK5jwQUeHEXaYIoin7AgMZ2z7S1BQP+tBYVfHhdqw35Ufd+V8L9yaGGBvF4wUTsXC5M3b/+O61sUiJsZObL9Va3tP/ql9te7Dim5tIQa1f+fsqoKA6wZ57tl8xF2vufxIDjMcAsBrsYvjlTXQ0lkNu4+LKdrYu4mLYC5U2CGqg3JkZMFwhfkyty9zqtzGsjjgrAITblHYmEMk4rIKZUP/oYoHQw5yPXr/CmTzXR9TkrvGE5zPZMqnYdRazp1rCs4QRndBrLo9i2gkA0Q+kdF0lbiM4DnAoP4TKyIppfwwkRn+zl2kvIvHy8Cu8JIUGmxdXm+LFJvystI/nh2VJt6ARBgEKrXoE/SzSs2TLCAMq0aUVqX0vH/bb2Xeo4zY0igRk+d5a2jW5o5A7uhjxpAgXxNTZ0N/VC3zDmEAk8ZUyjeNJHwN8ZpqQ191cynzXZtVi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(451199015)(84970400001)(66899015)(83380400001)(55016003)(86362001)(45080400002)(7696005)(6506007)(966005)(9686003)(33656002)(38100700002)(478600001)(166002)(30864003)(38070700005)(110136005)(26005)(71200400001)(186003)(76116006)(66574015)(99936003)(122000001)(8936002)(52536014)(66946007)(66556008)(41300700001)(66476007)(7066003)(8676002)(2906002)(5660300002)(64756008)(66446008)(316002)(2004002)(559001)(579004)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3VrNYuztbtQxquYwSC/UVLI+6IC5P7CF1uMqoHED4bJ8nxuJinzM4CGUAw?=
 =?iso-8859-1?Q?L9Wh80CzKkfaFSbkZzcnjGQVBjuaOSZSL1WfT+eLahi5fRB9sIYyAKjkjW?=
 =?iso-8859-1?Q?v3axYGWH5ZfMUHsOe6hPtiao8eJi613rnHjjN1tmvRm+JJ0Fpdx4KcE1gv?=
 =?iso-8859-1?Q?tK9HVfu/KR/dIOxPpNjD+S0K2/KjNlCiRRCBczK5hJlrpL0li/sOCi9y4B?=
 =?iso-8859-1?Q?4Z4O+kNoVOuysxSI5BNPccs9TVIzFxxT9MGBYrbKwd3f3SWLwNtT2eqpAO?=
 =?iso-8859-1?Q?1gnYayZxzEifgM+DecjRgGIZwNCy6Xs9urOhlMQVvYlAzsWzhu+RlSOPKW?=
 =?iso-8859-1?Q?HllkJLqr/JDKpB/F2TXag+PJWWt6hgAg9ojdCn/txYuHTSDzb+RhO7DTv1?=
 =?iso-8859-1?Q?dVigGF6/0fm4cmsrPq3SnZ7JWpgF+fv2W5lsCHmD/qxv2+xk7nBtMXaNG8?=
 =?iso-8859-1?Q?9mGR7XcrGMCybxpk1xGlSfW1t1M/e94GV3pyOYp+6qELANV7GQ42i+MIMY?=
 =?iso-8859-1?Q?h5qk7N/dierAcNS1woWMqH3fRibe/drb1d7/s6mokfS0zQ1HTywBV3NOZG?=
 =?iso-8859-1?Q?nfR5s42zeNcuaMXwahgXcuK9zCM7w38iOusonZicb59ii4q27ic0ZhPtln?=
 =?iso-8859-1?Q?ruSlZF2AUE/VFnOAFYm1fA4IqcheM/TWKl1kvmcnKfObl4LGcdhWdx8dbk?=
 =?iso-8859-1?Q?CE8gws1jL602jceUU2mFwYWuNuex5KjgRJcGF85vfH5yjUYeyW75mogycC?=
 =?iso-8859-1?Q?M/XdC5tGJ3fQ0kW2kyvdhyNfbWZT6dPV7Te5l6F9JcqfcFARGF8wH7bnOK?=
 =?iso-8859-1?Q?9qN0U8Ix49qWvJuJeb6vPjop22n3DO5GQ887JXAxZFdr7LsNqHRfqVA8f4?=
 =?iso-8859-1?Q?aTQk8HOSxqzOpjCG5AgdIH331ibPgwDQzh/Y0gJTbXkNtBr8EKc/VfRK0i?=
 =?iso-8859-1?Q?xDy/9AH9aP4dm4PJFbjpKSFJBSKOnDNYgUqTKuvTVRLfxriXyfyAcBMezk?=
 =?iso-8859-1?Q?NJOjOJheT5KQ85WENSpEniJi4jnGCdtZa7+m9uqJ015M8WHlyZnbdOiFOp?=
 =?iso-8859-1?Q?Vg6NjTjjCHJnbpFx0iMqU/VpEiqDmkqb+QpK09tweneed0hhCBhVlpeWRb?=
 =?iso-8859-1?Q?AhgScQ3JEX9jdpq4+m5BdXPmwvhRpWYJGFsmTwEp+w7hoff6qe6R55WubG?=
 =?iso-8859-1?Q?1/wtkB2XakidbN+1Pg1wj6oamhHvkk1pUhJprxYLyv2l0rT3m3s6lyeRBS?=
 =?iso-8859-1?Q?+W2ZIpEUcQMRZJHobPjVT78m58y6SeZo/ZR0JL/5kTFpOn36bwxzn/UxNL?=
 =?iso-8859-1?Q?jNQsx9DBlCOlJ5c557WZchKNKyu0TTXBomnNV3TYxbhQVoA9VoPP8pxLtt?=
 =?iso-8859-1?Q?WnwRPJfBHwtazZC3/U0jxcf52NOgJRuMWd2NLH0fK6hhB/VJYdovsd4DuH?=
 =?iso-8859-1?Q?xArs7h1pgIB1mGtgP7TZD6/ThiklMCK7lrP3h8cYueyBOQ2hvc6Dxfz9wM?=
 =?iso-8859-1?Q?QAeGur+6y9Bf9DFFLxXiWUUsxngZ5JkG/YkMkg4kMmb5uhNykFGPfwdFKP?=
 =?iso-8859-1?Q?QZohM5rcysQxRJHMMgYpVkUDb92BCyzDLgY2DYtemUbHrkvQvKy3rUfhQr?=
 =?iso-8859-1?Q?HUJgW6/75xglYu59kZa5jha4yahKL1ZDAZ?=
Content-Type: multipart/related;
	boundary="_004_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f747fe3-827c-4030-dd43-08dacab1d8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2022 04:44:01.8961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruAkIiOlkIC1qYc3K38Oiv+Umol8KGZajhqqAd0o2SvlqOyR2oMFwpuyMdfTSELb93vdWkdtzvVdT/7rN08YvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 04:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173576

--_004_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_
Content-Type: multipart/alternative;
	boundary="_000_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_"

--_000_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I assume we should remove extra space from subject line of commit message "=
gcc :". It would be helpful during search if we do for gcc changes. Right?


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:7a6bfbd6-16ab-41ef-b0c7-278ceb6873a4]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Steve Sakoman via lists.openembedded.org <steve=
=3Dsakoman.com@lists.openembedded.org>
Sent: Saturday, November 19, 2022 11:17 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core][dunfell 18/21] gcc : upgrade to v9.5

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

gcc stable version upgraded from v9.3 to v9.5

Below is the bug fix list for v9.5
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu=
.org%2Fbugzilla%2Fbuglist.cgi%3Fbug_status%3DRESOLVED%26resolution%3DFIXED%=
26target_milestone%3D9.5&amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%=
7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DEDAjoIj=
%2B2ZUg8BCd%2FdvrldxTjUyMPaohTL7c5vOh7CI%3D&amp;reserved=3D0

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ----
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ------------------
 ...x-missing-dependencies-for-selftests.patch |  45 --
 .../gcc/{gcc-9.3.inc =3D> gcc-9.5.inc}          |  13 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   0
 .../0002-gcc-poison-system-directories.patch  |   0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0004-64-bit-multilib-hack.patch           |   0
 .../0005-optional-libstdc.patch               |   0
 .../0006-COLLECT_GCC_OPTIONS.patch            |   0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0008-fortran-cross-compile-hack.patch     |   0
 .../0009-cpp-honor-sysroot.patch              |   0
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...gcc-Fix-argument-list-too-long-error.patch |   0
 .../0013-Disable-sdt.patch                    |   0
 .../{gcc-9.3 =3D> gcc-9.5}/0014-libtool.patch   |   0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...-config-files-from-B-instead-of-usin.patch |   0
 ...ir-from-.la-which-usually-points-to-.patch |   0
 .../0018-export-CPP.patch                     |   0
 ...e-target-gcc-headers-can-be-included.patch |   0
 ...ild-with-disable-dependency-tracking.patch |   0
 ...t-directory-during-relink-if-inst_pr.patch |   0
 ...IR-replacement-instead-of-hardcoding.patch |   0
 ...23-aarch64-Add-support-for-musl-ldso.patch |   0
 ...-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...le-sysroot-support-for-nativesdk-gcc.patch |   0
 ...sroot-gcc-version-specific-dirs-with.patch |   0
 ...ous-_FOR_BUILD-and-related-variables.patch |   0
 ...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   0
 ...d-to-link-commandline-for-musl-targe.patch |   0
 .../0030-ldbl128-config.patch                 |   0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...as-for-__cpu_indicator_init-instead-.patch |   0
 .../0033-sync-gcc-stddef.h-with-musl.patch    |   0
 ...-fault-in-precompiled-header-generat.patch |   0
 .../0035-Fix-for-testsuite-failure.patch      |   0
 ...Re-introduce-spe-commandline-options.patch |   0
 ...heck-zero-value-in-simple_object_elf.patch |   0
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   0
 ...ands-Don-t-match-user-defined-regs-o.patch |   0
 ...adian_9.3.bb =3D> gcc-cross-canadian_9.5.bb} |   0
 .../{gcc-cross_9.3.bb =3D> gcc-cross_9.5.bb}    |   0
 ...cc-crosssdk_9.3.bb =3D> gcc-crosssdk_9.5.bb} |   0
 ...{gcc-runtime_9.3.bb =3D> gcc-runtime_9.5.bb} |   0
 ...anitizers_9.3.bb =3D> gcc-sanitizers_9.5.bb} |   0
 .../{gcc-source_9.3.bb =3D> gcc-source_9.5.bb}  |   0
 .../gcc/{gcc_9.3.bb =3D> gcc_9.5.bb}            |   0
 ...c-initial_9.3.bb =3D> libgcc-initial_9.5.bb} |   0
 .../gcc/{libgcc_9.3.bb =3D> libgcc_9.5.bb}      |   0
 ...{libgfortran_9.3.bb =3D> libgfortran_9.5.bb} |   0
 55 files changed, 4 insertions(+), 1636 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for=
-PR-tree-optimization-97236-fix-bad-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Stra=
ight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduc=
e-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate=
-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-depe=
ndencies-for-selftests.patch
 rename meta/recipes-devtools/gcc/{gcc-9.3.inc =3D> gcc-9.5.inc} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0001-gcc-4.3.1-ARC=
H_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0002-gcc-poison-sy=
stem-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0003-gcc-4.3.3-SYS=
ROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0004-64-bit-multil=
ib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0005-optional-libs=
tdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0006-COLLECT_GCC_O=
PTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0007-Use-the-defau=
lts.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0008-fortran-cross=
-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0009-cpp-honor-sys=
root.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0010-MIPS64-Defaul=
t-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0011-Define-GLIBC_=
DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0012-gcc-Fix-argum=
ent-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0013-Disable-sdt.p=
atch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0014-libtool.patch=
 (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0015-gcc-armv4-pas=
s-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0016-Use-the-multi=
lib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0017-Avoid-using-l=
ibdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0018-export-CPP.pa=
tch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0019-Ensure-target=
-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0020-gcc-4.8-won-t=
-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0021-Don-t-search-=
host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0022-Use-SYSTEMLIB=
S_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0023-aarch64-Add-s=
upport-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0024-libcc1-fix-li=
bcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0025-handle-sysroo=
t-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0026-Search-target=
-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0027-Fix-various-_=
FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0028-nios2-Define-=
MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0029-Add-ssp_nonsh=
ared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0030-ldbl128-confi=
g.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0031-Link-libgcc-u=
sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0032-libgcc_s-Use-=
alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0033-sync-gcc-stdd=
ef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0034-fix-segmentat=
ion-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0035-Fix-for-tests=
uite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0036-Re-introduce-=
spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0037-CVE-2019-1425=
0-Check-zero-value-in-simple_object_elf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0038-gentypes-genm=
odes-Do-not-use-__LINE__-for-maintainin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 =3D> gcc-9.5}/0039-process_alt_o=
perands-Don-t-match-user-defined-regs-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb =3D> gcc-cross=
-canadian_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb =3D> gcc-cross_9.5.bb} =
(100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb =3D> gcc-crosssdk_9.=
5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb =3D> gcc-runtime_9.5.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb =3D> gcc-sanitizer=
s_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb =3D> gcc-source_9.5.bb=
} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.3.bb =3D> gcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb =3D> libgcc-initia=
l_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.3.bb =3D> libgcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb =3D> libgfortran_9.5.=
bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tre=
e-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
1-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
deleted file mode 100644
index dc1039dcc8..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optim=
ization-97236-fix-bad-.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp%3Dgcc.git%3Ba%3Dcommit%3Bh%3D=
97b668f9a8c6ec565c278a60e7d1492a6932e409&amp;data=3D05%7C01%7Cranjitsinh.ra=
thod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp=
;sdata=3DYJsDCL2gI3C2VpIVr4Re%2BSh9JKPzmWMHs%2BHKdhqLAO0%3D&amp;reserved=3D=
0]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
-From: Matthias Klose <doko@ubuntu.com>
-Date: Tue, 6 Oct 2020 13:41:37 +0200
-Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use=
 of
- VMAT_CONTIGUOUS
-
-This avoids using VMAT_CONTIGUOUS with single-element interleaving
-when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
-continue to avoid load-lanes and gathers.
-
-2020-10-01  Richard Biener  <rguenther@suse.de>
-
-       PR tree-optimization/97236
-       * tree-vect-stmts.c (get_group_load_store_type): Keep
-       VMAT_ELEMENTWISE for single-element vectors.
-
-       * gcc.dg/vect/pr97236.c: New testcase.
-
-(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
----
- gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
- gcc/tree-vect-stmts.c               | 20 ++++++--------
- 2 files changed, 52 insertions(+), 11 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
-
-diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/ve=
ct/pr97236.c
-new file mode 100644
-index 000000000000..9d3dc20d953d
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
-@@ -0,0 +1,43 @@
-+typedef unsigned char __uint8_t;
-+typedef __uint8_t uint8_t;
-+typedef struct plane_t {
-+  uint8_t *p_pixels;
-+  int i_lines;
-+  int i_pitch;
-+} plane_t;
-+
-+typedef struct {
-+  plane_t p[5];
-+} picture_t;
-+
-+#define N 4
-+
-+void __attribute__((noipa))
-+picture_Clone(picture_t *picture, picture_t *res)
-+{
-+  for (int i =3D 0; i < N; i++) {
-+    res->p[i].p_pixels =3D picture->p[i].p_pixels;
-+    res->p[i].i_lines =3D picture->p[i].i_lines;
-+    res->p[i].i_pitch =3D picture->p[i].i_pitch;
-+  }
-+}
-+
-+int
-+main()
-+{
-+  picture_t aaa, bbb;
-+  uint8_t pixels[10] =3D {1, 1, 1, 1, 1, 1, 1, 1};
-+
-+  for (unsigned i =3D 0; i < N; i++)
-+    aaa.p[i].p_pixels =3D pixels;
-+
-+  picture_Clone (&aaa, &bbb);
-+
-+  uint8_t c =3D 0;
-+  for (unsigned i =3D 0; i < N; i++)
-+    c +=3D bbb.p[i].p_pixels[0];
-+
-+  if (c !=3D N)
-+    __builtin_abort ();
-+  return 0;
-+}
-diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
-index 507f81b0a0e8..ffbba3441de2 100644
---- a/gcc/tree-vect-stmts.c
-+++ b/gcc/tree-vect-stmts.c
-@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info=
, tree vectype, bool slp,
-         /* First cope with the degenerate case of a single-element
-            vector.  */
-         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
--          *memory_access_type =3D VMAT_CONTIGUOUS;
-+          ;
-
-         /* Otherwise try using LOAD/STORE_LANES.  */
--        if (*memory_access_type =3D=3D VMAT_ELEMENTWISE
--            && (vls_type =3D=3D VLS_LOAD
--                ? vect_load_lanes_supported (vectype, group_size, masked_=
p)
--                : vect_store_lanes_supported (vectype, group_size,
--                                              masked_p)))
-+        else if (vls_type =3D=3D VLS_LOAD
-+                 ? vect_load_lanes_supported (vectype, group_size, masked=
_p)
-+                 : vect_store_lanes_supported (vectype, group_size,
-+                                               masked_p))
-           {
-             *memory_access_type =3D VMAT_LOAD_STORE_LANES;
-             overrun_p =3D would_overrun_p;
-           }
-
-         /* If that fails, try using permuting loads.  */
--        if (*memory_access_type =3D=3D VMAT_ELEMENTWISE
--            && (vls_type =3D=3D VLS_LOAD
--                ? vect_grouped_load_supported (vectype, single_element_p,
--                                               group_size)
--                : vect_grouped_store_supported (vectype, group_size)))
-+        else if (vls_type =3D=3D VLS_LOAD
-+                 ? vect_grouped_load_supported (vectype, single_element_p=
,
-+                                                group_size)
-+                 : vect_grouped_store_supported (vectype, group_size))
-           {
-             *memory_access_type =3D VMAT_CONTIGUOUS_PERMUTE;
-             overrun_p =3D would_overrun_p;
---
-2.20.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Li=
ne-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
1-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
deleted file mode 100644
index a7e29f4bd7..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Spec=
ulation-SLS-mitigation.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 20da13e395bde597d8337167c712039c8f923c3b Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:58 +0100
-Subject: [PATCH 1/3] aarch64: New Straight Line Speculation (SLS) mitigati=
on
- flags
-
-Here we introduce the flags that will be used for straight line speculatio=
n.
-
-The new flag introduced is `-mharden-sls=3D`.
-This flag can take arguments of `none`, `all`, or a comma seperated list
-of one or more of `retbr` or `blr`.
-`none` indicates no special mitigation of the straight line speculation
-vulnerability.
-`all` requests all mitigations currently implemented.
-`retbr` requests that the RET and BR instructions have a speculation
-barrier inserted after them.
-`blr` requests that BLR instructions are replaced by a BL to a function
-stub using a BR with a speculation barrier after it.
-
-Setting this on a per-function basis using attributes or the like is not
-enabled, but may be in the future.
-
-(cherry picked from commit a9ba2a9b77bec7eacaf066801f22d1c366a2bc86)
-
-gcc/ChangeLog:
-
-2020-06-02  Matthew Malcomson  <matthew.malcomson@arm.com>
-
-       * config/aarch64/aarch64-protos.h (aarch64_harden_sls_retbr_p):
-       New.
-       (aarch64_harden_sls_blr_p): New.
-       * config/aarch64/aarch64.c (enum aarch64_sls_hardening_type):
-       New.
-       (aarch64_harden_sls_retbr_p): New.
-       (aarch64_harden_sls_blr_p): New.
-       (aarch64_validate_sls_mitigation): New.
-       (aarch64_override_options): Parse options for SLS mitigation.
-       * config/aarch64/aarch64.opt (-mharden-sls): New option.
-       * doc/invoke.texi: Document new option.
----
- gcc/config/aarch64/aarch64-protos.h |  3 ++
- gcc/config/aarch64/aarch64.c        | 76 +++++++++++++++++++++++++++++
- gcc/config/aarch64/aarch64.opt      |  4 ++
- gcc/doc/invoke.texi                 | 12 +++++
- 4 files changed, 95 insertions(+)
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h
-index c083cad53..31493f412 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -644,4 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);
-
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
-
-+extern bool aarch64_harden_sls_retbr_p (void);
-+extern bool aarch64_harden_sls_blr_p (void);
-+
- #endif /* GCC_AARCH64_PROTOS_H */
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index b452a53af..269ff6c92 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -11734,6 +11734,79 @@ aarch64_validate_mcpu (const char *str, const str=
uct processor **res,
-   return false;
- }
-
-+/* Straight line speculation indicators.  */
-+enum aarch64_sls_hardening_type
-+{
-+  SLS_NONE =3D 0,
-+  SLS_RETBR =3D 1,
-+  SLS_BLR =3D 2,
-+  SLS_ALL =3D 3,
-+};
-+static enum aarch64_sls_hardening_type aarch64_sls_hardening;
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the =
RET
-+   and BR instructions.  */
-+bool
-+aarch64_harden_sls_retbr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_RETBR;
-+}
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the =
BLR
-+   instruction.  */
-+bool
-+aarch64_harden_sls_blr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_BLR;
-+}
-+
-+/* As of yet we only allow setting these options globally, in the future =
we may
-+   allow setting them per function.  */
-+static void
-+aarch64_validate_sls_mitigation (const char *const_str)
-+{
-+  char *token_save =3D NULL;
-+  char *str =3D NULL;
-+
-+  if (strcmp (const_str, "none") =3D=3D 0)
-+    {
-+      aarch64_sls_hardening =3D SLS_NONE;
-+      return;
-+    }
-+  if (strcmp (const_str, "all") =3D=3D 0)
-+    {
-+      aarch64_sls_hardening =3D SLS_ALL;
-+      return;
-+    }
-+
-+  char *str_root =3D xstrdup (const_str);
-+  str =3D strtok_r (str_root, ",", &token_save);
-+  if (!str)
-+    error ("invalid argument given to %<-mharden-sls=3D%>");
-+
-+  int temp =3D SLS_NONE;
-+  while (str)
-+    {
-+      if (strcmp (str, "blr") =3D=3D 0)
-+      temp |=3D SLS_BLR;
-+      else if (strcmp (str, "retbr") =3D=3D 0)
-+      temp |=3D SLS_RETBR;
-+      else if (strcmp (str, "none") =3D=3D 0 || strcmp (str, "all") =3D=
=3D 0)
-+      {
-+        error ("%<%s%> must be by itself for %<-mharden-sls=3D%>", str);
-+        break;
-+      }
-+      else
-+      {
-+        error ("invalid argument %<%s%> for %<-mharden-sls=3D%>", str);
-+        break;
-+      }
-+      str =3D strtok_r (NULL, ",", &token_save);
-+    }
-+  aarch64_sls_hardening =3D (aarch64_sls_hardening_type) temp;
-+  free (str_root);
-+}
-+
- /* Parses CONST_STR for branch protection features specified in
-    aarch64_branch_protect_types, and set any global variables required.  =
Returns
-    the parsing result and assigns LAST_STR to the last processed token fr=
om
-@@ -11972,6 +12045,9 @@ aarch64_override_options (void)
-   selected_arch =3D NULL;
-   selected_tune =3D NULL;
-
-+  if (aarch64_harden_sls_string)
-+    aarch64_validate_sls_mitigation (aarch64_harden_sls_string);
-+
-   if (aarch64_branch_protection_string)
-     aarch64_validate_mbranch_protection (aarch64_branch_protection_string=
);
-
-diff --git a/gcc/config/aarch64/aarch64.opt b/gcc/config/aarch64/aarch64.o=
pt
-index 3c6d1cc90..d27ab6df8 100644
---- a/gcc/config/aarch64/aarch64.opt
-+++ b/gcc/config/aarch64/aarch64.opt
-@@ -71,6 +71,10 @@ mgeneral-regs-only
- Target Report RejectNegative Mask(GENERAL_REGS_ONLY) Save
- Generate code which uses only the general registers.
-
-+mharden-sls=3D
-+Target RejectNegative Joined Var(aarch64_harden_sls_string)
-+Generate code to mitigate against straight line speculation.
-+
- mfix-cortex-a53-835769
- Target Report Var(aarch64_fix_a53_err835769) Init(2) Save
- Workaround for ARM Cortex-A53 Erratum number 835769.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 2f7ffe456..5f04a7d2b 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -638,6 +638,7 @@ Objective-C and Objective-C++ Dialects}.
- -mpc-relative-literal-loads @gol
- -msign-return-address=3D@var{scope} @gol
- -mbranch-protection=3D@var{none}|@var{standard}|@var{pac-ret}[+@var{leaf}=
]|@var{bti} @gol
-+-mharden-sls=3D@var{opts} @gol
- -march=3D@var{name}  -mcpu=3D@var{name}  -mtune=3D@var{name}  @gol
- -moverride=3D@var{string}  -mverbose-cost-dump @gol
- -mstack-protector-guard=3D@var{guard} -mstack-protector-guard-reg=3D@var{=
sysreg} @gol
-@@ -15955,6 +15956,17 @@ argument @samp{leaf} can be used to extend the si=
gning to include leaf
- functions.
- @samp{bti} turns on branch target identification mechanism.
-
-+@item -mharden-sls=3D@var{opts}
-+@opindex mharden-sls
-+Enable compiler hardening against straight line speculation (SLS).
-+@var{opts} is a comma-separated list of the following options:
-+@table @samp
-+@item retbr
-+@item blr
-+@end table
-+In addition, @samp{-mharden-sls=3Dall} enables all SLS hardening while
-+@samp{-mharden-sls=3Dnone} disables all SLS hardening.
-+
- @item -msve-vector-bits=3D@var{bits}
- @opindex msve-vector-bits
- Specify the number of bits in an SVE vector register.  This option only h=
as
---
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-m=
itigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
2-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
deleted file mode 100644
index c972088d2b..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigati=
on-for-RET-and-BR-inst.patch
+++ /dev/null
@@ -1,600 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dc586a749228ecfb71f72ec2ca10e6f7b6874af3 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 2/3] aarch64: Introduce SLS mitigation for RET and BR
- instructions
-
-Instructions following RET or BR are not necessarily executed.  In order
-to avoid speculation past RET and BR we can simply append a speculation
-barrier.
-
-Since these speculation barriers will not be architecturally executed,
-they are not expected to add a high performance penalty.
-
-The speculation barrier is to be SB when targeting architectures which
-have this enabled, and DSB SY + ISB otherwise.
-
-We add tests for each of the cases where such an instruction was seen.
-
-This is implemented by modifying each machine description pattern that
-emits either a RET or a BR instruction.  We choose not to use something
-like `TARGET_ASM_FUNCTION_EPILOGUE` since it does not affect the
-`indirect_jump`, `jump`, `sibcall_insn` and `sibcall_value_insn`
-patterns and we find it preferable to implement the functionality in the
-same way for every pattern.
-
-There is one particular case which is slightly tricky.  The
-implementation of TARGET_ASM_TRAMPOLINE_TEMPLATE uses a BR which needs
-to be mitigated against.  The trampoline template is used *once* per
-compilation unit, and the TRAMPOLINE_SIZE is exposed to the user via the
-builtin macro __LIBGCC_TRAMPOLINE_SIZE__.
-In the future we may implement function specific attributes to turn on
-and off hardening on a per-function basis.
-The fixed nature of the trampoline described above implies it will be
-safer to ensure this speculation barrier is always used.
-
-Testing:
-  Bootstrap and regtest done on aarch64-none-linux
-  Used a temporary hack(1) to use these options on every test in the
-  testsuite and a script to check that the output never emitted an
-  unmitigated RET or BR.
-
-1) Temporary hack was a change to the testsuite to always use
-`-save-temps` and run a script on the assembly output of those
-compilations which produced one to ensure every RET or BR is immediately
-followed by a speculation barrier.
-
-(cherry picked from be178ecd5ac1fe1510d960ff95c66d0ff831afe1)
-
-gcc/ChangeLog:
-
-       * config/aarch64/aarch64-protos.h (aarch64_sls_barrier): New.
-       * config/aarch64/aarch64.c (aarch64_output_casesi): Emit
-       speculation barrier after BR instruction if needs be.
-       (aarch64_trampoline_init): Handle ptr_mode value & adjust size
-       of code copied.
-       (aarch64_sls_barrier): New.
-       (aarch64_asm_trampoline_template): Add needed barriers.
-       * config/aarch64/aarch64.h (AARCH64_ISA_SB): New.
-       (TARGET_SB): New.
-       (TRAMPOLINE_SIZE): Account for barrier.
-       * config/aarch64/aarch64.md (indirect_jump, *casesi_dispatch,
-       simple_return, *do_return, *sibcall_insn, *sibcall_value_insn):
-       Emit barrier if needs be, also account for possible barrier using
-       "sls_length" attribute.
-       (sls_length): New attribute.
-       (length): Determine default using any non-default sls_length
-       value.
-
-gcc/testsuite/ChangeLog:
-
-       * gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c: New test.
-       * gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c:
-       New test.
-       * gcc.target/aarch64/sls-mitigation/sls-mitigation.exp: New file.
-       * lib/target-supports.exp (check_effective_target_aarch64_asm_sb_ok=
):
-       New proc.
----
- gcc/config/aarch64/aarch64-protos.h           |   1 +
- gcc/config/aarch64/aarch64.c                  |  41 +++++-
- gcc/config/aarch64/aarch64.h                  |  10 +-
- gcc/config/aarch64/aarch64.md                 |  75 ++++++++---
- .../sls-mitigation/sls-miti-retbr-pacret.c    |  15 +++
- .../aarch64/sls-mitigation/sls-miti-retbr.c   | 119 ++++++++++++++++++
- .../aarch64/sls-mitigation/sls-mitigation.exp |  73 +++++++++++
- gcc/testsuite/lib/target-supports.exp         |   3 +-
- 8 files changed, 312 insertions(+), 25 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-retbr-pacret.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-retbr.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
tigation.exp
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h
-index 31493f412..885eae893 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -644,6 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);
-
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
-
-+const char *aarch64_sls_barrier (int);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 269ff6c92..dff61105c 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8412,8 +8412,8 @@ aarch64_return_addr (int count, rtx frame ATTRIBUTE_=
UNUSED)
- static void
- aarch64_asm_trampoline_template (FILE *f)
- {
--  int offset1 =3D 16;
--  int offset2 =3D 20;
-+  int offset1 =3D 24;
-+  int offset2 =3D 28;
-
-   if (aarch64_bti_enabled ())
-     {
-@@ -8436,6 +8436,17 @@ aarch64_asm_trampoline_template (FILE *f)
-     }
-   asm_fprintf (f, "\tbr\t%s\n", reg_names [IP1_REGNUM]);
-
-+  /* We always emit a speculation barrier.
-+     This is because the same trampoline template is used for every neste=
d
-+     function.  Since nested functions are not particularly common or
-+     performant we don't worry too much about the extra instructions to c=
opy
-+     around.
-+     This is not yet a problem, since we have not yet implemented functio=
n
-+     specific attributes to choose between hardening against straight lin=
e
-+     speculation or not, but such function specific attributes are likely=
 to
-+     happen in the future.  */
-+  asm_fprintf (f, "\tdsb\tsy\n\tisb\n");
-+
-   /* The trampoline needs an extra padding instruction.  In case if BTI i=
s
-      enabled the padding instruction is replaced by the BTI instruction a=
t
-      the beginning.  */
-@@ -8450,10 +8461,14 @@ static void
- aarch64_trampoline_init (rtx m_tramp, tree fndecl, rtx chain_value)
- {
-   rtx fnaddr, mem, a_tramp;
--  const int tramp_code_sz =3D 16;
-+  const int tramp_code_sz =3D 24;
-
-   /* Don't need to copy the trailing D-words, we fill those in below.  */
--  emit_block_move (m_tramp, assemble_trampoline_template (),
-+  /* We create our own memory address in Pmode so that `emit_block_move` =
can
-+     use parts of the backend which expect Pmode addresses.  */
-+  rtx temp =3D convert_memory_address (Pmode, XEXP (m_tramp, 0));
-+  emit_block_move (gen_rtx_MEM (BLKmode, temp),
-+                 assemble_trampoline_template (),
-                  GEN_INT (tramp_code_sz), BLOCK_OP_NORMAL);
-   mem =3D adjust_address (m_tramp, ptr_mode, tramp_code_sz);
-   fnaddr =3D XEXP (DECL_RTL (fndecl), 0);
-@@ -8640,6 +8655,8 @@ aarch64_output_casesi (rtx *operands)
-   output_asm_insn (buf, operands);
-   output_asm_insn (patterns[index][1], operands);
-   output_asm_insn ("br\t%3", operands);
-+  output_asm_insn (aarch64_sls_barrier (aarch64_harden_sls_retbr_p ()),
-+                 operands);
-   assemble_label (asm_out_file, label);
-   return "";
- }
-@@ -18976,6 +18993,22 @@ aarch64_file_end_indicate_exec_stack ()
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_BTI
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_AND
-
-+/* Helper function for straight line speculation.
-+   Return what barrier should be emitted for straight line speculation
-+   mitigation.
-+   When not mitigating against straight line speculation this function re=
turns
-+   an empty string.
-+   When mitigating against straight line speculation, use:
-+   * SB when the v8.5-A SB extension is enabled.
-+   * DSB+ISB otherwise.  */
-+const char *
-+aarch64_sls_barrier (int mitigation_required)
-+{
-+  return mitigation_required
-+    ? (TARGET_SB ? "sb" : "dsb\tsy\n\tisb")
-+    : "";
-+}
-+
- /* Target-specific selftests.  */
-
- #if CHECKING_P
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 772a97296..72ddc6fd9 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -235,6 +235,7 @@ extern unsigned aarch64_architecture_version;
- #define AARCH64_ISA_F16FML       (aarch64_isa_flags & AARCH64_FL_F16FML)
- #define AARCH64_ISA_RCPC8_4      (aarch64_isa_flags & AARCH64_FL_RCPC8_4)
- #define AARCH64_ISA_V8_5         (aarch64_isa_flags & AARCH64_FL_V8_5)
-+#define AARCH64_ISA_SB                   (aarch64_isa_flags & AARCH64_FL_=
SB)
-
- /* Crypto is an optional extension to AdvSIMD.  */
- #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
-@@ -285,6 +286,9 @@ extern unsigned aarch64_architecture_version;
- #define TARGET_FIX_ERR_A53_835769_DEFAULT 1
- #endif
-
-+/* SB instruction is enabled through +sb.  */
-+#define TARGET_SB (AARCH64_ISA_SB)
-+
- /* Apply the workaround for Cortex-A53 erratum 835769.  */
- #define TARGET_FIX_ERR_A53_835769     \
-   ((aarch64_fix_a53_err835769 =3D=3D 2)   \
-@@ -931,8 +935,10 @@ typedef struct
-
- #define RETURN_ADDR_RTX aarch64_return_addr
-
--/* BTI c + 3 insns + 2 pointer-sized entries.  */
--#define TRAMPOLINE_SIZE       (TARGET_ILP32 ? 24 : 32)
-+/* BTI c + 3 insns
-+   + sls barrier of DSB + ISB.
-+   + 2 pointer-sized entries.  */
-+#define TRAMPOLINE_SIZE       (24 + (TARGET_ILP32 ? 8 : 16))
-
- /* Trampolines contain dwords, so must be dword aligned.  */
- #define TRAMPOLINE_ALIGNMENT 64
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index cc5a887d4..494aee964 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -331,10 +331,25 @@
- ;; Attribute that specifies whether the alternative uses MOVPRFX.
- (define_attr "movprfx" "no,yes" (const_string "no"))
-
-+;; Attribute to specify that an alternative has the length of a single
-+;; instruction plus a speculation barrier.
-+(define_attr "sls_length" "none,retbr,casesi" (const_string "none"))
-+
- (define_attr "length" ""
-   (cond [(eq_attr "movprfx" "yes")
-            (const_int 8)
--        ] (const_int 4)))
-+
-+       (eq_attr "sls_length" "retbr")
-+         (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int =
4)
-+                (match_test "TARGET_SB") (const_int 8)]
-+               (const_int 12))
-+
-+       (eq_attr "sls_length" "casesi")
-+         (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int =
16)
-+                (match_test "TARGET_SB") (const_int 20)]
-+               (const_int 24))
-+      ]
-+        (const_int 4)))
-
- ;; Strictly for compatibility with AArch32 in pipeline models, since AArc=
h64 has
- ;; no predicated insns.
-@@ -370,8 +385,12 @@
- (define_insn "indirect_jump"
-   [(set (pc) (match_operand:DI 0 "register_operand" "r"))]
-   ""
--  "br\\t%0"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("br\\t%0", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
-
- (define_insn "jump"
-@@ -657,7 +676,7 @@
-   "*
-   return aarch64_output_casesi (operands);
-   "
--  [(set_attr "length" "16")
-+  [(set_attr "sls_length" "casesi")
-    (set_attr "type" "branch")]
- )
-
-@@ -736,14 +755,18 @@
-   [(return)]
-   ""
-   {
-+    const char *ret =3D NULL;
-     if (aarch64_return_address_signing_enabled ()
-       && TARGET_ARMV8_3
-       && !crtl->calls_eh_return)
--      return "retaa";
--
--    return "ret";
-+      ret =3D "retaa";
-+    else
-+      ret =3D "ret";
-+    output_asm_insn (ret, operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-   }
--  [(set_attr "type" "branch")]
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
-
- (define_expand "return"
-@@ -755,8 +778,12 @@
- (define_insn "simple_return"
-   [(simple_return)]
-   "aarch64_use_simple_return_insn_p ()"
--  "ret"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("ret", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
-
- (define_insn "*cb<optab><mode>1"
-@@ -947,10 +974,16 @@
-        (match_operand 1 "" ""))
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%0
--   b\\t%c0"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative =3D=3D 0)
-+      {
-+      output_asm_insn ("br\\t%0", operands);
-+      return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c0";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
-
- (define_insn "*sibcall_value_insn"
-@@ -960,10 +993,16 @@
-             (match_operand 2 "" "")))
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%1
--   b\\t%c1"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative =3D=3D 0)
-+      {
-+      output_asm_insn ("br\\t%1", operands);
-+      return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c1";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
-
- ;; Call subroutine returning any type.
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retb=
r-pacret.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr=
-pacret.c
-new file mode 100644
-index 000000000..7656123ee
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacre=
t.c
-@@ -0,0 +1,15 @@
-+/* Avoid ILP32 since pacret is only available for LP64 */
-+/* { dg-do compile { target { ! ilp32 } } } */
-+/* { dg-additional-options "-mharden-sls=3Dretbr -mbranch-protection=3Dpa=
c-ret -march=3Darmv8.3-a" } */
-+
-+/* Testing the do_return pattern for retaa.  */
-+long retbr_subcall(void);
-+long retbr_do_return_retaa(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly foll=
owed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!=
dsb\tsy\n\tisb)} } } */
-+/* { dg-final { scan-assembler-not {ret\t} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retb=
r.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-new file mode 100644
-index 000000000..573b30cdc
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-@@ -0,0 +1,119 @@
-+/* We ensure that -Wpedantic is off since it complains about the trampoli=
nes
-+   we explicitly want to test.  */
-+/* { dg-additional-options "-mharden-sls=3Dretbr -Wno-pedantic " } */
-+/*
-+   Ensure that the SLS hardening of RET and BR leaves no unprotected RET/=
BR
-+   instructions.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+int
-+retbr_sibcall_value_insn (struct sls_testclass x)
-+{
-+  return x.x(x.left, x.right);
-+}
-+
-+void
-+retbr_sibcall_insn (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+}
-+
-+/* Aim to test two different returns.
-+   One that introduces a tail call in the middle of the function, and one=
 that
-+   has a normal return.  */
-+int
-+retbr_multiple_returns (struct sls_testclass x)
-+{
-+  int temp;
-+  if (x.left % 10)
-+    return x.x(x.left, 100);
-+  else if (x.right % 20)
-+    {
-+      return x.x(x.left * x.right, 100);
-+    }
-+  temp =3D x.left % x.right;
-+  temp *=3D 100;
-+  temp /=3D 2;
-+  return temp % 3;
-+}
-+
-+void
-+retbr_multiple_returns_void (struct sls_testclass x)
-+{
-+  if (x.left % 10)
-+    {
-+      x.y(x.left, 100);
-+    }
-+  else if (x.right % 20)
-+    {
-+      x.y(x.left * x.right, 100);
-+    }
-+  return;
-+}
-+
-+/* Testing the casesi jump via register.  */
-+__attribute__ ((optimize ("Os")))
-+int
-+retbr_casesi_dispatch (struct sls_testclass x)
-+{
-+  switch (x.left)
-+    {
-+    case -5:
-+      return -2;
-+    case -3:
-+      return -1;
-+    case 0:
-+      return 0;
-+    case 3:
-+      return 1;
-+    case 5:
-+      break;
-+    default:
-+      __builtin_unreachable ();
-+    }
-+  return x.right;
-+}
-+
-+/* Testing the BR in trampolines is mitigated against.  */
-+void f1 (void *);
-+void f3 (void *, void (*)(void *));
-+void f2 (void *);
-+
-+int
-+retbr_trampolines (void *a, int b)
-+{
-+  if (!b)
-+    {
-+      f1 (a);
-+      return 1;
-+    }
-+  if (b)
-+    {
-+      void retbr_tramp_internal (void *c)
-+      {
-+      if (c =3D=3D a)
-+        f2 (c);
-+      }
-+      f3 (a, retbr_tramp_internal);
-+    }
-+  return 0;
-+}
-+
-+/* Testing the indirect_jump pattern.  */
-+void
-+retbr_indirect_jump (int *buf)
-+{
-+  __builtin_longjmp(buf, 1);
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly foll=
owed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!=
dsb\tsy\n\tisb|sb)} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigatio=
n.exp b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-new file mode 100644
-index 000000000..812250379
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-@@ -0,0 +1,73 @@
-+#  Regression driver for SLS mitigation on AArch64.
-+#  Copyright (C) 2020 Free Software Foundation, Inc.
-+#  Contributed by ARM Ltd.
-+#
-+#  This file is part of GCC.
-+#
-+#  GCC is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU General Public License as published by
-+#  the Free Software Foundation; either version 3, or (at your option)
-+#  any later version.
-+#
-+#  GCC is distributed in the hope that it will be useful, but
-+#  WITHOUT ANY WARRANTY; without even the implied warranty of
-+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+#  General Public License for more details.
-+#
-+#  You should have received a copy of the GNU General Public License
-+#  along with GCC; see the file COPYING3.  If not see
-+#  <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww=
w.gnu.org%2Flicenses%2F&amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7=
C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DNQF1eeIa=
9Xgit9e4b%2FIj%2BJYHzj60pQ0fPPYHh9%2Fhz0I%3D&amp;reserved=3D0>.  */
-+
-+# Exit immediately if this isn't an AArch64 target.
-+if {![istarget aarch64*-*-*] } then {
-+  return
-+}
-+
-+# Load support procs.
-+load_lib gcc-dg.exp
-+load_lib torture-options.exp
-+
-+# If a testcase doesn't have special options, use these.
-+global DEFAULT_CFLAGS
-+if ![info exists DEFAULT_CFLAGS] then {
-+    set DEFAULT_CFLAGS " "
-+}
-+
-+# Initialize `dg'.
-+dg-init
-+torture-init
-+
-+# Use different architectures as well as the normal optimisation options.
-+# (i.e. use both SB and DSB+ISB barriers).
-+
-+set save-dg-do-what-default ${dg-do-what-default}
-+# Main loop.
-+# Run with torture tests (i.e. a bunch of different optimisation levels) =
just
-+# to increase test coverage.
-+set dg-do-what-default assemble
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+      "-save-temps" $DEFAULT_CFLAGS
-+
-+# Run the same tests but this time with SB extension.
-+# Since not all supported assemblers will support that extension we decid=
e
-+# whether to assemble or just compile based on whether the extension is
-+# supported for the available assembler.
-+
-+set templist {}
-+foreach x $DG_TORTURE_OPTIONS {
-+  lappend templist "$x -march=3Darmv8.3-a+sb "
-+  lappend templist "$x -march=3Darmv8-a+sb "
-+}
-+set-torture-options $templist
-+if { [check_effective_target_aarch64_asm_sb_ok] } {
-+    set dg-do-what-default assemble
-+} else {
-+    set dg-do-what-default compile
-+}
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+      "-save-temps" $DEFAULT_CFLAGS
-+set dg-do-what-default ${save-dg-do-what-default}
-+
-+# All done.
-+torture-finish
-+dg-finish
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/tar=
get-supports.exp
-index ea9a50ccb..79482f9b6 100644
---- a/gcc/testsuite/lib/target-supports.exp
-+++ b/gcc/testsuite/lib/target-supports.exp
-@@ -8579,7 +8579,8 @@ proc check_effective_target_aarch64_tiny { } {
- # Create functions to check that the AArch64 assembler supports the
- # various architecture extensions via the .arch_extension pseudo-op.
-
--foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve=
"} {
-+foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve=
"
-+                        "sb"} {
-     eval [string map [list FUNC $aarch64_ext] {
-       proc check_effective_target_aarch64_asm_FUNC_ok { } {
-         if { [istarget aarch64*-*-*] } {
---
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-fo=
r-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mi=
tigate-SLS-for-BLR-instruction.patch
deleted file mode 100644
index 6dffef0a34..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-i=
nstruction.patch
+++ /dev/null
@@ -1,659 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 2155170525f93093b90a1a065e7ed71a925566e9 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 3/3] aarch64: Mitigate SLS for BLR instruction
-
-This patch introduces the mitigation for Straight Line Speculation past
-the BLR instruction.
-
-This mitigation replaces BLR instructions with a BL to a stub which uses
-a BR to jump to the original value.  These function stubs are then
-appended with a speculation barrier to ensure no straight line
-speculation happens after these jumps.
-
-When optimising for speed we use a set of stubs for each function since
-this should help the branch predictor make more accurate predictions
-about where a stub should branch.
-
-When optimising for size we use one set of stubs for all functions.
-This set of stubs can have human readable names, and we are using
-`__call_indirect_x<N>` for register x<N>.
-
-When BTI branch protection is enabled the BLR instruction can jump to a
-`BTI c` instruction using any register, while the BR instruction can
-only jump to a `BTI c` instruction using the x16 or x17 registers.
-Hence, in order to ensure this transformation is safe we mov the value
-of the original register into x16 and use x16 for the BR.
-
-As an example when optimising for size:
-a
-    BLR x0
-instruction would get transformed to something like
-    BL __call_indirect_x0
-where __call_indirect_x0 labels a thunk that contains
-__call_indirect_x0:
-    MOV X16, X0
-    BR X16
-    <speculation barrier>
-
-The first version of this patch used local symbols specific to a
-compilation unit to try and avoid relocations.
-This was mistaken since functions coming from the same compilation unit
-can still be in different sections, and the assembler will insert
-relocations at jumps between sections.
-
-On any relocation the linker is permitted to emit a veneer to handle
-jumps between symbols that are very far apart.  The registers x16 and
-x17 may be clobbered by these veneers.
-Hence the function stubs cannot rely on the values of x16 and x17 being
-the same as just before the function stub is called.
-
-Similar can be said for the hot/cold partitioning of single functions,
-so function-local stubs have the same restriction.
-
-This updated version of the patch never emits function stubs for x16 and
-x17, and instead forces other registers to be used.
-
-Given the above, there is now no benefit to local symbols (since they
-are not enough to avoid dealing with linker intricacies).  This patch
-now uses global symbols with hidden visibility each stored in their own
-COMDAT section.  This means stubs can be shared between compilation
-units while still avoiding the PLT indirection.
-
-This patch also removes the `__call_indirect_x30` stub (and
-function-local equivalent) which would simply jump back to the original
-location.
-
-The function-local stubs are emitted to the assembly output file in one
-chunk, which means we need not add the speculation barrier directly
-after each one.
-This is because we know for certain that the instructions directly after
-the BR in all but the last function stub will be from another one of
-these stubs and hence will not contain a speculation gadget.
-Instead we add a speculation barrier at the end of the sequence of
-stubs.
-
-The global stubs are emitted in COMDAT/.linkonce sections by
-themselves so that the linker can remove duplicates from multiple object
-files.  This means they are not emitted in one chunk, and each one must
-include the speculation barrier.
-
-Another difference is that since the global stubs are shared across
-compilation units we do not know that all functions will be targeting an
-architecture supporting the SB instruction.
-Rather than provide multiple stubs for each architecture, we provide a
-stub that will work for all architectures -- using the DSB+ISB barrier.
-
-This mitigation does not apply for BLR instructions in the following
-places:
-- Some accesses to thread-local variables use a code sequence with a BLR
-  instruction.  This code sequence is part of the binary interface between
-  compiler and linker. If this BLR instruction needs to be mitigated, it'd
-  probably be best to do so in the linker. It seems that the code sequence
-  for thread-local variable access is unlikely to lead to a Spectre Revala=
tion
-  Gadget.
-- PLT stubs are produced by the linker and each contain a BLR instruction.
-  It seems that at most only after the last PLT stub a Spectre Revalation
-  Gadget might appear.
-
-Testing:
-  Bootstrap and regtest on AArch64
-    (with BOOT_CFLAGS=3D"-mharden-sls=3Dretbr,blr")
-  Used a temporary hack(1) in gcc-dg.exp to use these options on every
-  test in the testsuite, a slight modification to emit the speculation
-  barrier after every function stub, and a script to check that the
-  output never emitted a BLR, or unmitigated BR or RET instruction.
-  Similar on an aarch64-none-elf cross-compiler.
-
-1) Temporary hack emitted a speculation barrier at the end of every stub
-function, and used a script to ensure that:
-  a) Every RET or BR is immediately followed by a speculation barrier.
-  b) No BLR instruction is emitted by compiler.
-
-(cherry picked from 96b7f495f9269d5448822e4fc28882edb35a58d7)
-
-gcc/ChangeLog:
-
-       * config/aarch64/aarch64-protos.h (aarch64_indirect_call_asm):
-       New declaration.
-       * config/aarch64/aarch64.c (aarch64_regno_regclass): Handle new
-       stub registers class.
-       (aarch64_class_max_nregs): Likewise.
-       (aarch64_register_move_cost): Likewise.
-       (aarch64_sls_shared_thunks): Global array to store stub labels.
-       (aarch64_sls_emit_function_stub): New.
-       (aarch64_create_blr_label): New.
-       (aarch64_sls_emit_blr_function_thunks): New.
-       (aarch64_sls_emit_shared_blr_thunks): New.
-       (aarch64_asm_file_end): New.
-       (aarch64_indirect_call_asm): New.
-       (TARGET_ASM_FILE_END): Use aarch64_asm_file_end.
-       (TARGET_ASM_FUNCTION_EPILOGUE): Use
-       aarch64_sls_emit_blr_function_thunks.
-       * config/aarch64/aarch64.h (STB_REGNUM_P): New.
-       (enum reg_class): Add STUB_REGS class.
-       (machine_function): Introduce `call_via` array for
-       function-local stub labels.
-       * config/aarch64/aarch64.md (*call_insn, *call_value_insn): Use
-       aarch64_indirect_call_asm to emit code when hardening BLR
-       instructions.
-       * config/aarch64/constraints.md (Ucr): New constraint
-       representing registers for indirect calls.  Is GENERAL_REGS
-       usually, and STUB_REGS when hardening BLR instruction against
-       SLS.
-       * config/aarch64/predicates.md (aarch64_general_reg): STUB_REGS cla=
ss
-       is also a general register.
-
-gcc/testsuite/ChangeLog:
-
-       * gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c: New test.
-       * gcc.target/aarch64/sls-mitigation/sls-miti-blr.c: New test.
----
- gcc/config/aarch64/aarch64-protos.h           |   1 +
- gcc/config/aarch64/aarch64.c                  | 225 +++++++++++++++++-
- gcc/config/aarch64/aarch64.h                  |  15 ++
- gcc/config/aarch64/aarch64.md                 |  11 +-
- gcc/config/aarch64/constraints.md             |   9 +
- gcc/config/aarch64/predicates.md              |   3 +-
- .../aarch64/sls-mitigation/sls-miti-blr-bti.c |  40 ++++
- .../aarch64/sls-mitigation/sls-miti-blr.c     |  33 +++
- 8 files changed, 328 insertions(+), 9 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-blr-bti.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-blr.c
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h
-index 885eae893..2676e43ae 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -645,6 +645,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
-
- const char *aarch64_sls_barrier (int);
-+const char *aarch64_indirect_call_asm (rtx);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index dff61105c..bc6c02c3a 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8190,6 +8190,9 @@ aarch64_label_mentioned_p (rtx x)
- enum reg_class
- aarch64_regno_regclass (unsigned regno)
- {
-+  if (STUB_REGNUM_P (regno))
-+    return STUB_REGS;
-+
-   if (GP_REGNUM_P (regno))
-     return GENERAL_REGS;
-
-@@ -8499,6 +8502,7 @@ aarch64_class_max_nregs (reg_class_t regclass, machi=
ne_mode mode)
-   unsigned int nregs;
-   switch (regclass)
-     {
-+    case STUB_REGS:
-     case TAILCALL_ADDR_REGS:
-     case POINTER_REGS:
-     case GENERAL_REGS:
-@@ -10693,10 +10697,12 @@ aarch64_register_move_cost (machine_mode mode,
-     =3D aarch64_tune_params.regmove_cost;
-
-   /* Caller save and pointer regs are equivalent to GENERAL_REGS.  */
--  if (to =3D=3D TAILCALL_ADDR_REGS || to =3D=3D POINTER_REGS)
-+  if (to =3D=3D TAILCALL_ADDR_REGS || to =3D=3D POINTER_REGS
-+      || to =3D=3D STUB_REGS)
-     to =3D GENERAL_REGS;
-
--  if (from =3D=3D TAILCALL_ADDR_REGS || from =3D=3D POINTER_REGS)
-+  if (from =3D=3D TAILCALL_ADDR_REGS || from =3D=3D POINTER_REGS
-+      || from =3D=3D STUB_REGS)
-     from =3D GENERAL_REGS;
-
-   /* Moving between GPR and stack cost is the same as GP2GP.  */
-@@ -19009,6 +19015,215 @@ aarch64_sls_barrier (int mitigation_required)
-     : "";
- }
-
-+static GTY (()) tree aarch64_sls_shared_thunks[30];
-+static GTY (()) bool aarch64_sls_shared_thunks_needed =3D false;
-+const char *indirect_symbol_names[30] =3D {
-+    "__call_indirect_x0",
-+    "__call_indirect_x1",
-+    "__call_indirect_x2",
-+    "__call_indirect_x3",
-+    "__call_indirect_x4",
-+    "__call_indirect_x5",
-+    "__call_indirect_x6",
-+    "__call_indirect_x7",
-+    "__call_indirect_x8",
-+    "__call_indirect_x9",
-+    "__call_indirect_x10",
-+    "__call_indirect_x11",
-+    "__call_indirect_x12",
-+    "__call_indirect_x13",
-+    "__call_indirect_x14",
-+    "__call_indirect_x15",
-+    "", /* "__call_indirect_x16",  */
-+    "", /* "__call_indirect_x17",  */
-+    "__call_indirect_x18",
-+    "__call_indirect_x19",
-+    "__call_indirect_x20",
-+    "__call_indirect_x21",
-+    "__call_indirect_x22",
-+    "__call_indirect_x23",
-+    "__call_indirect_x24",
-+    "__call_indirect_x25",
-+    "__call_indirect_x26",
-+    "__call_indirect_x27",
-+    "__call_indirect_x28",
-+    "__call_indirect_x29",
-+};
-+
-+/* Function to create a BLR thunk.  This thunk is used to mitigate straig=
ht
-+   line speculation.  Instead of a simple BLR that can be speculated past=
,
-+   we emit a BL to this thunk, and this thunk contains a BR to the releva=
nt
-+   register.  These thunks have the relevant speculation barries put afte=
r
-+   their indirect branch so that speculation is blocked.
-+
-+   We use such a thunk so the speculation barriers are kept off the
-+   architecturally executed path in order to reduce the performance overh=
ead.
-+
-+   When optimizing for size we use stubs shared by the linked object.
-+   When optimizing for performance we emit stubs for each function in the=
 hope
-+   that the branch predictor can better train on jumps specific for a giv=
en
-+   function.  */
-+rtx
-+aarch64_sls_create_blr_label (int regnum)
-+{
-+  gcc_assert (STUB_REGNUM_P (regnum));
-+  if (optimize_function_for_size_p (cfun))
-+    {
-+      /* For the thunks shared between different functions in this compil=
ation
-+       unit we use a named symbol -- this is just for users to more easil=
y
-+       understand the generated assembly.  */
-+      aarch64_sls_shared_thunks_needed =3D true;
-+      const char *thunk_name =3D indirect_symbol_names[regnum];
-+      if (aarch64_sls_shared_thunks[regnum] =3D=3D NULL)
-+      {
-+        /* Build a decl representing this function stub and record it for
-+           later.  We build a decl here so we can use the GCC machinery f=
or
-+           handling sections automatically (through `get_named_section` a=
nd
-+           `make_decl_one_only`).  That saves us a lot of trouble handlin=
g
-+           the specifics of different output file formats.  */
-+        tree decl =3D build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
-+                                get_identifier (thunk_name),
-+                                build_function_type_list (void_type_node,
-+                                                          NULL_TREE));
-+        DECL_RESULT (decl) =3D build_decl (BUILTINS_LOCATION, RESULT_DECL=
,
-+                                         NULL_TREE, void_type_node);
-+        TREE_PUBLIC (decl) =3D 1;
-+        TREE_STATIC (decl) =3D 1;
-+        DECL_IGNORED_P (decl) =3D 1;
-+        DECL_ARTIFICIAL (decl) =3D 1;
-+        make_decl_one_only (decl, DECL_ASSEMBLER_NAME (decl));
-+        resolve_unique_section (decl, 0, false);
-+        aarch64_sls_shared_thunks[regnum] =3D decl;
-+      }
-+
-+      return gen_rtx_SYMBOL_REF (Pmode, thunk_name);
-+    }
-+
-+  if (cfun->machine->call_via[regnum] =3D=3D NULL)
-+    cfun->machine->call_via[regnum]
-+      =3D gen_rtx_LABEL_REF (Pmode, gen_label_rtx ());
-+  return cfun->machine->call_via[regnum];
-+}
-+
-+/* Helper function for aarch64_sls_emit_blr_function_thunks and
-+   aarch64_sls_emit_shared_blr_thunks below.  */
-+static void
-+aarch64_sls_emit_function_stub (FILE *out_file, int regnum)
-+{
-+  /* Save in x16 and branch to that function so this transformation does
-+     not prevent jumping to `BTI c` instructions.  */
-+  asm_fprintf (out_file, "\tmov\tx16, x%d\n", regnum);
-+  asm_fprintf (out_file, "\tbr\tx16\n");
-+}
-+
-+/* Emit all BLR stubs for this particular function.
-+   Here we emit all the BLR stubs needed for the current function.  Since=
 we
-+   emit these stubs in a consecutive block we know there will be no specu=
lation
-+   gadgets between each stub, and hence we only emit a speculation barrie=
r at
-+   the end of the stub sequences.
-+
-+   This is called in the TARGET_ASM_FUNCTION_EPILOGUE hook.  */
-+void
-+aarch64_sls_emit_blr_function_thunks (FILE *out_file)
-+{
-+  if (! aarch64_harden_sls_blr_p ())
-+    return;
-+
-+  bool any_functions_emitted =3D false;
-+  /* We must save and restore the current function section since this ass=
embly
-+     is emitted at the end of the function.  This means it can be emitted=
 *just
-+     after* the cold section of a function.  That cold part would be emit=
ted in
-+     a different section.  That switch would trigger a `.cfi_endproc` dir=
ective
-+     to be emitted in the original section and a `.cfi_startproc` directi=
ve to
-+     be emitted in the new section.  Switching to the original section wi=
thout
-+     restoring would mean that the `.cfi_endproc` emitted as a function e=
nds
-+     would happen in a different section -- leaving an unmatched
-+     `.cfi_startproc` in the cold text section and an unmatched `.cfi_end=
proc`
-+     in the standard text section.  */
-+  section *save_text_section =3D in_section;
-+  switch_to_section (function_section (current_function_decl));
-+  for (int regnum =3D 0; regnum < 30; ++regnum)
-+    {
-+      rtx specu_label =3D cfun->machine->call_via[regnum];
-+      if (specu_label =3D=3D NULL)
-+      continue;
-+
-+      targetm.asm_out.print_operand (out_file, specu_label, 0);
-+      asm_fprintf (out_file, ":\n");
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      any_functions_emitted =3D true;
-+    }
-+  if (any_functions_emitted)
-+    /* Can use the SB if needs be here, since this stub will only be used
-+      by the current function, and hence for the current target.  */
-+    asm_fprintf (out_file, "\t%s\n", aarch64_sls_barrier (true));
-+  switch_to_section (save_text_section);
-+}
-+
-+/* Emit shared BLR stubs for the current compilation unit.
-+   Over the course of compiling this unit we may have converted some BLR
-+   instructions to a BL to a shared stub function.  This is where we emit=
 those
-+   stub functions.
-+   This function is for the stubs shared between different functions in t=
his
-+   compilation unit.  We share when optimizing for size instead of speed.
-+
-+   This function is called through the TARGET_ASM_FILE_END hook.  */
-+void
-+aarch64_sls_emit_shared_blr_thunks (FILE *out_file)
-+{
-+  if (! aarch64_sls_shared_thunks_needed)
-+    return;
-+
-+  for (int regnum =3D 0; regnum < 30; ++regnum)
-+    {
-+      tree decl =3D aarch64_sls_shared_thunks[regnum];
-+      if (!decl)
-+      continue;
-+
-+      const char *name =3D indirect_symbol_names[regnum];
-+      switch_to_section (get_named_section (decl, NULL, 0));
-+      ASM_OUTPUT_ALIGN (out_file, 2);
-+      targetm.asm_out.globalize_label (out_file, name);
-+      /* Only emits if the compiler is configured for an assembler that c=
an
-+       handle visibility directives.  */
-+      targetm.asm_out.assemble_visibility (decl, VISIBILITY_HIDDEN);
-+      ASM_OUTPUT_TYPE_DIRECTIVE (out_file, name, "function");
-+      ASM_OUTPUT_LABEL (out_file, name);
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      /* Use the most conservative target to ensure it can always be used=
 by any
-+       function in the translation unit.  */
-+      asm_fprintf (out_file, "\tdsb\tsy\n\tisb\n");
-+      ASM_DECLARE_FUNCTION_SIZE (out_file, name, decl);
-+    }
-+}
-+
-+/* Implement TARGET_ASM_FILE_END.  */
-+void
-+aarch64_asm_file_end ()
-+{
-+  aarch64_sls_emit_shared_blr_thunks (asm_out_file);
-+  /* Since this function will be called for the ASM_FILE_END hook, we ens=
ure
-+     that what would be called otherwise (e.g. `file_end_indicate_exec_st=
ack`
-+     for FreeBSD) still gets called.  */
-+#ifdef TARGET_ASM_FILE_END
-+  TARGET_ASM_FILE_END ();
-+#endif
-+}
-+
-+const char *
-+aarch64_indirect_call_asm (rtx addr)
-+{
-+  gcc_assert (REG_P (addr));
-+  if (aarch64_harden_sls_blr_p ())
-+    {
-+      rtx stub_label =3D aarch64_sls_create_blr_label (REGNO (addr));
-+      output_asm_insn ("bl\t%0", &stub_label);
-+    }
-+  else
-+   output_asm_insn ("blr\t%0", &addr);
-+  return "";
-+}
-+
- /* Target-specific selftests.  */
-
- #if CHECKING_P
-@@ -19529,6 +19744,12 @@ aarch64_libgcc_floating_mode_supported_p
- #define TARGET_RUN_TARGET_SELFTESTS selftest::aarch64_run_selftests
- #endif /* #if CHECKING_P */
-
-+#undef TARGET_ASM_FILE_END
-+#define TARGET_ASM_FILE_END aarch64_asm_file_end
-+
-+#undef TARGET_ASM_FUNCTION_EPILOGUE
-+#define TARGET_ASM_FUNCTION_EPILOGUE aarch64_sls_emit_blr_function_thunks
-+
- struct gcc_target targetm =3D TARGET_INITIALIZER;
-
- #include "gt-aarch64.h"
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 72ddc6fd9..60682a100 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -540,6 +540,16 @@ extern unsigned aarch64_architecture_version;
- #define GP_REGNUM_P(REGNO)                                            \
-   (((unsigned) (REGNO - R0_REGNUM)) <=3D (R30_REGNUM - R0_REGNUM))
-
-+/* Registers known to be preserved over a BL instruction.  This consists =
of the
-+   GENERAL_REGS without x16, x17, and x30.  The x30 register is changed b=
y the
-+   BL instruction itself, while the x16 and x17 registers may be used by
-+   veneers which can be inserted by the linker.  */
-+#define STUB_REGNUM_P(REGNO) \
-+  (GP_REGNUM_P (REGNO) \
-+   && (REGNO) !=3D R16_REGNUM \
-+   && (REGNO) !=3D R17_REGNUM \
-+   && (REGNO) !=3D R30_REGNUM) \
-+
- #define FP_REGNUM_P(REGNO)                    \
-   (((unsigned) (REGNO - V0_REGNUM)) <=3D (V31_REGNUM - V0_REGNUM))
-
-@@ -561,6 +571,7 @@ enum reg_class
- {
-   NO_REGS,
-   TAILCALL_ADDR_REGS,
-+  STUB_REGS,
-   GENERAL_REGS,
-   STACK_REG,
-   POINTER_REGS,
-@@ -580,6 +591,7 @@ enum reg_class
- {                                             \
-   "NO_REGS",                                  \
-   "TAILCALL_ADDR_REGS",                               \
-+  "STUB_REGS",                                        \
-   "GENERAL_REGS",                             \
-   "STACK_REG",                                        \
-   "POINTER_REGS",                             \
-@@ -596,6 +608,7 @@ enum reg_class
- {                                                                     \
-   { 0x00000000, 0x00000000, 0x00000000 },     /* NO_REGS */           \
-   { 0x00030000, 0x00000000, 0x00000000 },     /* TAILCALL_ADDR_REGS */\
-+  { 0x3ffcffff, 0x00000000, 0x00000000 },     /* STUB_REGS */         \
-   { 0x7fffffff, 0x00000000, 0x00000003 },     /* GENERAL_REGS */      \
-   { 0x80000000, 0x00000000, 0x00000000 },     /* STACK_REG */         \
-   { 0xffffffff, 0x00000000, 0x00000003 },     /* POINTER_REGS */      \
-@@ -735,6 +748,8 @@ typedef struct GTY (()) machine_function
-   struct aarch64_frame frame;
-   /* One entry for each hard register.  */
-   bool reg_is_wrapped_separately[LAST_SAVED_REGNUM];
-+  /* One entry for each general purpose register.  */
-+  rtx call_via[SP_REGNUM];
-   bool label_is_assembled;
- } machine_function;
- #endif
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index 494aee964..ed8cf8ece 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -908,15 +908,14 @@
- )
-
- (define_insn "*call_insn"
--  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "r, Usf"=
))
-+  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "Ucr, Us=
f"))
-        (match_operand 1 "" ""))
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%0
-+  * return aarch64_indirect_call_asm (operands[0]);
-   bl\\t%c0"
--  [(set_attr "type" "call, call")]
--)
-+  [(set_attr "type" "call, call")])
-
- (define_expand "call_value"
-   [(parallel [(set (match_operand 0 "" "")
-@@ -934,12 +933,12 @@
-
- (define_insn "*call_value_insn"
-   [(set (match_operand 0 "" "")
--      (call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "r, U=
sf"))
-+      (call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "Ucr,=
 Usf"))
-                     (match_operand 2 "" "")))
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%1
-+  * return aarch64_indirect_call_asm (operands[1]);
-   bl\\t%c1"
-   [(set_attr "type" "call, call")]
- )
-diff --git a/gcc/config/aarch64/constraints.md b/gcc/config/aarch64/constr=
aints.md
-index 21f9549e6..7756dbe83 100644
---- a/gcc/config/aarch64/constraints.md
-+++ b/gcc/config/aarch64/constraints.md
-@@ -24,6 +24,15 @@
- (define_register_constraint "Ucs" "TAILCALL_ADDR_REGS"
-   "@internal Registers suitable for an indirect tail call")
-
-+(define_register_constraint "Ucr"
-+    "aarch64_harden_sls_blr_p () ? STUB_REGS : GENERAL_REGS"
-+  "@internal Registers to be used for an indirect call.
-+   This is usually the general registers, but when we are hardening again=
st
-+   Straight Line Speculation we disallow x16, x17, and x30 so we can use
-+   indirection stubs.  These indirection stubs cannot use the above regis=
ters
-+   since they will be reached by a BL that may have to go through a linke=
r
-+   veneer.")
-+
- (define_register_constraint "w" "FP_REGS"
-   "Floating point and SIMD vector registers.")
-
-diff --git a/gcc/config/aarch64/predicates.md b/gcc/config/aarch64/predica=
tes.md
-index 8e1b78421..4250aecb3 100644
---- a/gcc/config/aarch64/predicates.md
-+++ b/gcc/config/aarch64/predicates.md
-@@ -32,7 +32,8 @@
-
- (define_predicate "aarch64_general_reg"
-   (and (match_operand 0 "register_operand")
--       (match_test "REGNO_REG_CLASS (REGNO (op)) =3D=3D GENERAL_REGS")))
-+       (match_test "REGNO_REG_CLASS (REGNO (op)) =3D=3D STUB_REGS
-+                  || REGNO_REG_CLASS (REGNO (op)) =3D=3D GENERAL_REGS")))
-
- ;; Return true if OP a (const_int 0) operand.
- (define_predicate "const0_operand"
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-=
bti.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-new file mode 100644
-index 000000000..b1fb754c7
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-@@ -0,0 +1,40 @@
-+/* { dg-do compile } */
-+/* { dg-additional-options "-mharden-sls=3Dblr -mbranch-protection=3Dbti"=
 } */
-+/*
-+   Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   Here we also check that there are no BR instructions with anything exc=
ept an
-+   x16 or x17 register.  This is because a `BTI c` instruction can be bra=
nched
-+   to using a BLR instruction using any register, but can only be branche=
d to
-+   with a BR using an x16 or x17 register.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call =
which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval =3D x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler-not {\tbr\tx(?!16|17)} } } */
-+/* { dg-final { scan-assembler {\tbr\tx(16|17)} } } */
-+
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.=
c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-new file mode 100644
-index 000000000..88baffffe
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-@@ -0,0 +1,33 @@
-+/* { dg-additional-options "-mharden-sls=3Dblr -save-temps" } */
-+/* Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   We only test that all BLR instructions have been removed, not that the
-+   resulting code makes sense.  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call =
which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval =3D x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler {\tbr\tx[0-9][0-9]?} } } */
---
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencie=
s-for-selftests.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-=
dependencies-for-selftests.patch
deleted file mode 100644
index c8960c6098..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-s=
elftests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b19d8aac15649f31a7588b2634411a1922906ea8 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 3 Jun 2020 12:30:57 -0600
-Subject: [PATCH] Fix missing dependencies for selftests which occasionally
- causes failed builds.
-
-gcc/
-
-       * Makefile.in (SELFTEST_DEPS): Move before including language makef=
ile
-       fragments.
-
-Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp%3Dgcc.git%3Ba%3Dcommitdiff%3B=
h%3Db19d8aac15649f31a7588b2634411a1922906ea8&amp;data=3D05%7C01%7Cranjitsin=
h.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DJdbuns%2FaI89VTFlRbTtWq70O08RL1CXoP6%2B4zCstpzQ%3D&amp;reserve=
d=3D0]
-Signed-off-by:Steve Sakoman <steve@sakoman.com>
-
----
- gcc/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index aab1dbba57b..be11311b60d 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1735,6 +1735,10 @@ $(FULL_DRIVER_NAME): ./xgcc$(exeext)
-       $(LN_S) $< $@
-
- #
-+# SELFTEST_DEPS need to be set before including language makefile fragmen=
ts.
-+# Otherwise $(SELFTEST_DEPS) is empty when used from <LANG>/Make-lang.in.
-+SELFTEST_DEPS =3D $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftes=
ts
-+
- # Language makefile fragments.
-
- # The following targets define the interface between us and the languages=
.
-@@ -2010,8 +2014,6 @@ DEVNULL=3D$(if $(findstring mingw,$(build)),nul,/dev=
/null)
- SELFTEST_FLAGS =3D -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
-       -fself-test=3D$(srcdir)/testsuite/selftests
-
--SELFTEST_DEPS =3D $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftes=
ts
--
- # Run the selftests during the build once we have a driver and the fronte=
nd,
- # so that self-test failures are caught as early as possible.
- # Use "s-selftest-FE" to ensure that we only run the selftests if the
---
-2.27.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/=
gcc/gcc-9.5.inc
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.3.inc
rename to meta/recipes-devtools/gcc/gcc-9.5.inc
index c171f673e9..6a0a892b10 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
@@ -2,13 +2,13 @@ require gcc-common.inc

 # Third digit in PV should be incremented after a minor release

-PV =3D "9.3.0"
+PV =3D "9.5.0"

 # BINV should be incremented to a revision after a minor gcc release

-BINV =3D "9.3.0"
+BINV =3D "9.5.0"

-FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3/back=
port:"
+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-9.5:${FILE_DIRNAME}/gcc-9.5/back=
port:"

 DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-nati=
ve"
@@ -69,14 +69,9 @@ SRC_URI =3D "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_el=
f.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintaini=
n.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-=
o.patch \
-           file://0040-fix-missing-dependencies-for-selftests.patch \
-           file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigatio=
n.patch \
-           file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-ins=
t.patch \
-           file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad=
-.patch \
 "
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-SRC_URI[sha256sum] =3D "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f3=
5ac57f84f742d1"
+SRC_URI[sha256sum] =3D "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5=
a0a2915a95cf8f"
 # For dev release snapshotting
 #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
 #B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-direc=
tories.patch b/meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-dir=
ectories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-direct=
ories.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-director=
ies.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAG=
S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSRO=
OT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.pa=
tch b/meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.pat=
ch
rename to meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.pat=
ch b/meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patc=
h
rename to meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-9.5/0007-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0007-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-ha=
ck.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-ha=
ck.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-hack=
.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-A=
BI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI=
.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-AB=
I.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI.=
patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
1-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0011-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-t=
oo-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argume=
nt-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-to=
o-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argument-list-too-=
long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch b/met=
a/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch b/meta/re=
cipes-devtools/gcc/gcc-9.5/0014-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0014-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0015-g=
cc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0015-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
6-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0016-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
7-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0017-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch b/meta=
/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-heade=
rs-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-ta=
rget-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-header=
s-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-target-gcc-headers-=
can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-wit=
h-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
0-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0020-gcc-4.8-won-t-build-with-d=
isable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
1-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0021-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
2-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0022-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for=
-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-suppo=
rt-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-=
musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-support-for-mu=
sl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-f=
ix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-=
for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sys=
root-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-f=
or-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sysroot-support-for=
-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
6-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0026-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-=
and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-va=
rious-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-various-_FOR_BUILD-and=
-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
9-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0029-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch b/=
meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-9.5/0031-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0031-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
2-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0032-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-=
musl.patch b/meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-=
musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-m=
usl.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-mus=
l.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-=
in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
4-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-i=
n-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0034-fix-segmentation-fault-in-=
precompiled-header-generat.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failu=
re.patch b/meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure=
.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failur=
e.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure.=
patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-comman=
dline-options.patch b/meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-s=
pe-commandline-options.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-command=
line-options.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-spe-commandli=
ne-options.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-ze=
ro-value-in-simple_object_elf.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
7-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zer=
o-value-in-simple_object_elf.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0037-CVE-2019-14250-Check-zero-=
value-in-simple_object_elf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-no=
t-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
8-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not=
-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0038-gentypes-genmodes-Do-not-u=
se-__LINE__-for-maintainin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Do=
n-t-match-user-defined-regs-o.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
9-process_alt_operands-Don-t-match-user-defined-regs-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don=
-t-match-user-defined-regs-o.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0039-process_alt_operands-Don-t=
-match-user-defined-regs-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb b/meta/rec=
ipes-devtools/gcc/gcc-cross-canadian_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.3.bb b/meta/recipes-devt=
ools/gcc/gcc-cross_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb b/meta/recipes-d=
evtools/gcc/gcc-crosssdk_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb b/meta/recipes-de=
vtools/gcc/gcc-runtime_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb b/meta/recipes=
-devtools/gcc/gcc-sanitizers_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.3.bb b/meta/recipes-dev=
tools/gcc/gcc-source_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc_9.3.bb b/meta/recipes-devtools/g=
cc/gcc_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_9.3.bb
rename to meta/recipes-devtools/gcc/gcc_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb b/meta/recipes=
-devtools/gcc/libgcc-initial_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_9.3.bb b/meta/recipes-devtool=
s/gcc/libgcc_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.3.bb b/meta/recipes-de=
vtools/gcc/libgfortran_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_9.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_9.5.bb
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div>Hi Steve,<br>
</div>
<div><br>
</div>
<div>I assume we should remove extra space from subject line of commit mess=
age &quot;gcc :&quot;. It would be helpful during search if we do for gcc c=
hanges. Right?</div>
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt; font-size:11pt; font-family:Calibri,sans-s=
erif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,255,2=
55)">
<span lang=3D"EN-IN" style=3D"margin:0px; font-family:&quot;Work Sans Mediu=
m&quot;; color:rgb(89,89,89)"><b>Ranjitsinh Rathod</b></span><span lang=3D"=
EN-IN" style=3D"margin:0px; font-size:14pt; font-family:&quot;Work Sans&quo=
t;; color:rgb(0,137,207)"><br>
</span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family=
:&quot;Work Sans&quot;; color:rgb(127,127,127)">Technical Leader |&nbsp;&nb=
sp;| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span lang=3D"EN-IN" style=3D"margin:0px; font-size:14pt; fo=
nt-family:&quot;Work Sans&quot;; color:rgb(176,255,69)">___________________=
_______________________<br>
</span></sup></b><span style=3D"margin:0px; color:rgb(31,73,125)"><a href=
=3D"http://www.kpit.com/" data-auth=3D"NotApplicable" style=3D"margin:0px">=
<span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt; font-family:&quot=
;Work Sans Medium&quot;; color:gray">KPIT</span></a></span><span style=3D"m=
argin:0px; font-family:&quot;Work Sans&quot;; color:gray"><span>&nbsp;</spa=
n></span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt; font-fam=
ily:&quot;Work Sans&quot;; color:gray">|</span><span lang=3D"EN-IN" style=
=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&quot;; color:gra=
y"><span>&nbsp;</span></span><span style=3D"margin:0px; color:rgb(31,73,125=
)"><a href=3D"http://www.kpit.com/linkedin" data-auth=3D"NotApplicable" sty=
le=3D"margin:0px"><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:gray">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:rgb(89,89,89)"></span><span style=
=3D"margin:0px; font-size:12pt; font-family:&quot;Times New Roman&quot;,ser=
if"></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" data-auth=3D"NotApplicable" st=
yle=3D"margin:0px"><span style=3D"margin:0px; color:rgb(31,73,125)"><img cl=
ass=3D"EmojiInsert" width=3D"621" height=3D"120" style=3D"margin: 0px; widt=
h: 6.4687in; height: auto;" alt=3D"" aria-label=3D"One" data-outlook-trace=
=3D"F:1|T:1" src=3D"cid:7a6bfbd6-16ab-41ef-b0c7-278ceb6873a4"></span></a></=
p>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Steve Sakoman via lists.openembedded.org
 &lt;steve=3Dsakoman.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Saturday, November 19, 2022 11:17 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core][dunfell 18/21] gcc : upgrade to v9.5</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
From: Sundeep KOKKONDA &lt;sundeep.kokkonda@gmail.com&gt;<br>
<br>
gcc stable version upgraded from v9.3 to v9.5<br>
<br>
Below is the bug fix list for v9.5<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgcc.gnu.org%2Fbugzilla%2Fbuglist.cgi%3Fbug_status%3DRESOLVED%26resoluti=
on%3DFIXED%26target_milestone%3D9.5&amp;amp;data=3D05%7C01%7Cranjitsinh.rat=
hod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
amp;sdata=3DEDAjoIj%2B2ZUg8BCd%2FdvrldxTjUyMPaohTL7c5vOh7CI%3D&amp;amp;rese=
rved=3D0" data-auth=3D"NotApplicable">https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fbugzilla%2Fbuglist.cgi%3Fbug_s=
tatus%3DRESOLVED%26resolution%3DFIXED%26target_milestone%3D9.5&amp;amp;data=
=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570eb=
e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DEDAjoIj%2B2ZUg8BCd%2FdvrldxTjUyMPaoh=
TL7c5vOh7CI%3D&amp;amp;reserved=3D0</a><br>
<br>
Signed-off-by: Sundeep KOKKONDA &lt;sundeep.kokkonda@gmail.com&gt;<br>
Signed-off-by: Steve Sakoman &lt;steve@sakoman.com&gt;<br>
---<br>
&nbsp;...-PR-tree-optimization-97236-fix-bad-.patch | 119 ----<br>
&nbsp;...ight-Line-Speculation-SLS-mitigation.patch | 204 ------<br>
&nbsp;...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ----------------<=
br>
&nbsp;...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 -----------------=
-<br>
&nbsp;...x-missing-dependencies-for-selftests.patch |&nbsp; 45 --<br>
&nbsp;.../gcc/{gcc-9.3.inc =3D&gt; gcc-9.5.inc}&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 13 +-<br>
&nbsp;...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0002-gcc-poison-system-directories.patch&nbsp; |&nbsp;&nbsp; 0<br=
>
&nbsp;...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0004-64-bit-multilib-hack.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;.../0005-optional-libstdc.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;.../0006-COLLECT_GCC_OPTIONS.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0008-fortran-cross-compile-hack.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 0<br>
&nbsp;.../0009-cpp-honor-sysroot.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;.../0010-MIPS64-Default-to-N64-ABI.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 0<br>
&nbsp;...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |&nbsp;&nbsp; 0<br>
&nbsp;...gcc-Fix-argument-list-too-long-error.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0013-Disable-sdt.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 0<br>
&nbsp;.../{gcc-9.3 =3D&gt; gcc-9.5}/0014-libtool.patch&nbsp;&nbsp; |&nbsp;&=
nbsp; 0<br>
&nbsp;...s-fix-v4bx-to-linker-to-support-EABI.patch |&nbsp;&nbsp; 0<br>
&nbsp;...-config-files-from-B-instead-of-usin.patch |&nbsp;&nbsp; 0<br>
&nbsp;...ir-from-.la-which-usually-points-to-.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0018-export-CPP.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 0<br>
&nbsp;...e-target-gcc-headers-can-be-included.patch |&nbsp;&nbsp; 0<br>
&nbsp;...ild-with-disable-dependency-tracking.patch |&nbsp;&nbsp; 0<br>
&nbsp;...t-directory-during-relink-if-inst_pr.patch |&nbsp;&nbsp; 0<br>
&nbsp;...IR-replacement-instead-of-hardcoding.patch |&nbsp;&nbsp; 0<br>
&nbsp;...23-aarch64-Add-support-for-musl-ldso.patch |&nbsp;&nbsp; 0<br>
&nbsp;...-fix-libcc1-s-install-path-and-rpath.patch |&nbsp;&nbsp; 0<br>
&nbsp;...le-sysroot-support-for-nativesdk-gcc.patch |&nbsp;&nbsp; 0<br>
&nbsp;...sroot-gcc-version-specific-dirs-with.patch |&nbsp;&nbsp; 0<br>
&nbsp;...ous-_FOR_BUILD-and-related-variables.patch |&nbsp;&nbsp; 0<br>
&nbsp;...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |&nbsp;&nbsp; 0<br>
&nbsp;...d-to-link-commandline-for-musl-targe.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0030-ldbl128-config.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br=
>
&nbsp;...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |&nbsp;&nbsp; 0<br>
&nbsp;...as-for-__cpu_indicator_init-instead-.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0033-sync-gcc-stddef.h-with-musl.patch&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 0<br>
&nbsp;...-fault-in-precompiled-header-generat.patch |&nbsp;&nbsp; 0<br>
&nbsp;.../0035-Fix-for-testsuite-failure.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 0<br>
&nbsp;...Re-introduce-spe-commandline-options.patch |&nbsp;&nbsp; 0<br>
&nbsp;...heck-zero-value-in-simple_object_elf.patch |&nbsp;&nbsp; 0<br>
&nbsp;...s-Do-not-use-__LINE__-for-maintainin.patch |&nbsp;&nbsp; 0<br>
&nbsp;...ands-Don-t-match-user-defined-regs-o.patch |&nbsp;&nbsp; 0<br>
&nbsp;...adian_9.3.bb =3D&gt; gcc-cross-canadian_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;.../{gcc-cross_9.3.bb =3D&gt; gcc-cross_9.5.bb}&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 0<br>
&nbsp;...cc-crosssdk_9.3.bb =3D&gt; gcc-crosssdk_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;...{gcc-runtime_9.3.bb =3D&gt; gcc-runtime_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;...anitizers_9.3.bb =3D&gt; gcc-sanitizers_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;.../{gcc-source_9.3.bb =3D&gt; gcc-source_9.5.bb}&nbsp; |&nbsp;&nbsp;=
 0<br>
&nbsp;.../gcc/{gcc_9.3.bb =3D&gt; gcc_9.5.bb}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;...c-initial_9.3.bb =3D&gt; libgcc-initial_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;.../gcc/{libgcc_9.3.bb =3D&gt; libgcc_9.5.bb}&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;...{libgfortran_9.3.bb =3D&gt; libgfortran_9.5.bb} |&nbsp;&nbsp; 0<br=
>
&nbsp;55 files changed, 4 insertions(+), 1636 deletions(-)<br>
&nbsp;delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fi=
x-for-PR-tree-optimization-97236-fix-bad-.patch<br>
&nbsp;delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New=
-Straight-Line-Speculation-SLS-mitigation.patch<br>
&nbsp;delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Int=
roduce-SLS-mitigation-for-RET-and-BR-inst.patch<br>
&nbsp;delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mit=
igate-SLS-for-BLR-instruction.patch<br>
&nbsp;delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing=
-dependencies-for-selftests.patch<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3.inc =3D&gt; gcc-9.5.inc} (8=
9%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0002-gcc-p=
oison-system-directories.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0003-gcc-4=
.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0004-64-bi=
t-multilib-hack.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0005-optio=
nal-libstdc.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0006-COLLE=
CT_GCC_OPTIONS.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0007-Use-t=
he-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0008-fortr=
an-cross-compile-hack.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0009-cpp-h=
onor-sysroot.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0010-MIPS6=
4-Default-to-N64-ABI.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0011-Defin=
e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0012-gcc-F=
ix-argument-list-too-long-error.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0013-Disab=
le-sdt.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0014-libto=
ol.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0015-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0016-Use-t=
he-multilib-config-files-from-B-instead-of-usin.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0017-Avoid=
-using-libdir-from-.la-which-usually-points-to-.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0018-expor=
t-CPP.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0019-Ensur=
e-target-gcc-headers-can-be-included.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0020-gcc-4=
.8-won-t-build-with-disable-dependency-tracking.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0021-Don-t=
-search-host-directory-during-relink-if-inst_pr.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0022-Use-S=
YSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0023-aarch=
64-Add-support-for-musl-ldso.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0024-libcc=
1-fix-libcc1-s-install-path-and-rpath.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0025-handl=
e-sysroot-support-for-nativesdk-gcc.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0026-Searc=
h-target-sysroot-gcc-version-specific-dirs-with.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0027-Fix-v=
arious-_FOR_BUILD-and-related-variables.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0028-nios2=
-Define-MUSL_DYNAMIC_LINKER.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0029-Add-s=
sp_nonshared-to-link-commandline-for-musl-targe.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0030-ldbl1=
28-config.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0031-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0032-libgc=
c_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0033-sync-=
gcc-stddef.h-with-musl.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0034-fix-s=
egmentation-fault-in-precompiled-header-generat.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0035-Fix-f=
or-testsuite-failure.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0036-Re-in=
troduce-spe-commandline-options.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0037-CVE-2=
019-14250-Check-zero-value-in-simple_object_elf.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0038-genty=
pes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-9.3 =3D&gt; gcc-9.5}/0039-proce=
ss_alt_operands-Don-t-match-user-defined-regs-o.patch (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb =3D&gt; g=
cc-cross-canadian_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb =3D&gt; gcc-cross_=
9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb =3D&gt; gcc-cro=
sssdk_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb =3D&gt; gcc-runt=
ime_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb =3D&gt; gcc-s=
anitizers_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb =3D&gt; gcc-sourc=
e_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{gcc_9.3.bb =3D&gt; gcc_9.5.bb} (100=
%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb =3D&gt; libgc=
c-initial_9.5.bb} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{libgcc_9.3.bb =3D&gt; libgcc_9.5.bb=
} (100%)<br>
&nbsp;rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb =3D&gt; libgfort=
ran_9.5.bb} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tre=
e-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
1-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch<br>
deleted file mode 100644<br>
index dc1039dcc8..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optim=
ization-97236-fix-bad-.patch<br>
+++ /dev/null<br>
@@ -1,119 +0,0 @@<br>
-Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp%3Dgcc.git%3Ba%3Dco=
mmit%3Bh%3D97b668f9a8c6ec565c278a60e7d1492a6932e409&amp;amp;data=3D05%7C01%=
7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;amp;sdata=3DYJsDCL2gI3C2VpIVr4Re%2BSh9JKPzmWMHs%2BHKdhqLAO0=
%3D&amp;amp;reserved=3D0" data-auth=3D"NotApplicable">https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp%3Dg=
cc.git%3Ba%3Dcommit%3Bh%3D97b668f9a8c6ec565c278a60e7d1492a6932e409&amp;amp;=
data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca5=
70ebe%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DYJsDCL2gI3C2VpIVr4Re%2BSh9JKPzmW=
MHs%2BHKdhqLAO0%3D&amp;amp;reserved=3D0</a>]<br>
-Signed-off-by: Jon Mason &lt;jon.mason@arm.com&gt;<br>
-<br>
-From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001<br>
-From: Matthias Klose &lt;doko@ubuntu.com&gt;<br>
-Date: Tue, 6 Oct 2020 13:41:37 +0200<br>
-Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use=
 of<br>
- VMAT_CONTIGUOUS<br>
-<br>
-This avoids using VMAT_CONTIGUOUS with single-element interleaving<br>
-when using V1mode vectors.&nbsp; Instead keep VMAT_ELEMENTWISE but<br>
-continue to avoid load-lanes and gathers.<br>
-<br>
-2020-10-01&nbsp; Richard Biener&nbsp; &lt;rguenther@suse.de&gt;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR tree-optimization/97236<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * tree-vect-stmts.c (get_group_load_s=
tore_type): Keep<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMAT_ELEMENTWISE for single-element v=
ectors.<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.dg/vect/pr97236.c: New testcase=
.<br>
-<br>
-(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)<br>
----<br>
- gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++<br=
>
- gcc/tree-vect-stmts.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 20 ++++++--------<br>
- 2 files changed, 52 insertions(+), 11 deletions(-)<br>
- create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c<br>
-<br>
-diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/ve=
ct/pr97236.c<br>
-new file mode 100644<br>
-index 000000000000..9d3dc20d953d<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.dg/vect/pr97236.c<br>
-@@ -0,0 +1,43 @@<br>
-+typedef unsigned char __uint8_t;<br>
-+typedef __uint8_t uint8_t;<br>
-+typedef struct plane_t {<br>
-+&nbsp; uint8_t *p_pixels;<br>
-+&nbsp; int i_lines;<br>
-+&nbsp; int i_pitch;<br>
-+} plane_t;<br>
-+<br>
-+typedef struct {<br>
-+&nbsp; plane_t p[5];<br>
-+} picture_t;<br>
-+<br>
-+#define N 4<br>
-+<br>
-+void __attribute__((noipa))<br>
-+picture_Clone(picture_t *picture, picture_t *res)<br>
-+{<br>
-+&nbsp; for (int i =3D 0; i &lt; N; i++) {<br>
-+&nbsp;&nbsp;&nbsp; res-&gt;p[i].p_pixels =3D picture-&gt;p[i].p_pixels;<b=
r>
-+&nbsp;&nbsp;&nbsp; res-&gt;p[i].i_lines =3D picture-&gt;p[i].i_lines;<br>
-+&nbsp;&nbsp;&nbsp; res-&gt;p[i].i_pitch =3D picture-&gt;p[i].i_pitch;<br>
-+&nbsp; }<br>
-+}<br>
-+<br>
-+int<br>
-+main()<br>
-+{<br>
-+&nbsp; picture_t aaa, bbb;<br>
-+&nbsp; uint8_t pixels[10] =3D {1, 1, 1, 1, 1, 1, 1, 1};<br>
-+<br>
-+&nbsp; for (unsigned i =3D 0; i &lt; N; i++)<br>
-+&nbsp;&nbsp;&nbsp; aaa.p[i].p_pixels =3D pixels;<br>
-+<br>
-+&nbsp; picture_Clone (&amp;aaa, &amp;bbb);<br>
-+<br>
-+&nbsp; uint8_t c =3D 0;<br>
-+&nbsp; for (unsigned i =3D 0; i &lt; N; i++)<br>
-+&nbsp;&nbsp;&nbsp; c +=3D bbb.p[i].p_pixels[0];<br>
-+<br>
-+&nbsp; if (c !=3D N)<br>
-+&nbsp;&nbsp;&nbsp; __builtin_abort ();<br>
-+&nbsp; return 0;<br>
-+}<br>
-diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c<br>
-index 507f81b0a0e8..ffbba3441de2 100644<br>
---- a/gcc/tree-vect-stmts.c<br>
-+++ b/gcc/tree-vect-stmts.c<br>
-@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info=
, tree vectype, bool slp,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* First cope with the de=
generate case of a single-element<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vector.=
&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (known_eq (TYPE_VECTOR=
_SUBPARTS (vectype), 1U))<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *memory_access_typ=
e =3D VMAT_CONTIGUOUS;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Otherwise try using LO=
AD/STORE_LANES.&nbsp; */<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*memory_access_type =3D=3D=
 VMAT_ELEMENTWISE<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; (vls_type =3D=3D VLS_LOAD<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ? vect_load_lanes_supported (vectype, group_size, masked_=
p)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; : vect_store_lanes_supported (vectype, group_size,<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; masked_p)))<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (vls_type =3D=3D VLS_L=
OAD<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ? vect_load_lanes_supported (vectype, group_size, m=
asked_p)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; : vect_store_lanes_supported (vectype, group_size,<=
br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; masked_p))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
memory_access_type =3D VMAT_LOAD_STORE_LANES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o=
verrun_p =3D would_overrun_p;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If that fails, try usi=
ng permuting loads.&nbsp; */<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*memory_access_type =3D=3D=
 VMAT_ELEMENTWISE<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; (vls_type =3D=3D VLS_LOAD<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ? vect_grouped_load_supported (vectype, single_element_p,=
<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; group_size)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; : vect_grouped_store_supported (vectype, group_size)))<br=
>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (vls_type =3D=3D VLS_L=
OAD<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ? vect_grouped_load_supported (vectype, single_elem=
ent_p,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; group_size)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; : vect_grouped_store_supported (vectype, group_size=
))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
memory_access_type =3D VMAT_CONTIGUOUS_PERMUTE;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o=
verrun_p =3D would_overrun_p;<br>
---<br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Li=
ne-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
1-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch<br>
deleted file mode 100644<br>
index a7e29f4bd7..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Spec=
ulation-SLS-mitigation.patch<br>
+++ /dev/null<br>
@@ -1,204 +0,0 @@<br>
-CVE: CVE-2020-13844<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
-<br>
-From 20da13e395bde597d8337167c712039c8f923c3b Mon Sep 17 00:00:00 2001<br>
-From: Matthew Malcomson &lt;matthew.malcomson@arm.com&gt;<br>
-Date: Thu, 9 Jul 2020 09:11:58 +0100<br>
-Subject: [PATCH 1/3] aarch64: New Straight Line Speculation (SLS) mitigati=
on<br>
- flags<br>
-<br>
-Here we introduce the flags that will be used for straight line speculatio=
n.<br>
-<br>
-The new flag introduced is `-mharden-sls=3D`.<br>
-This flag can take arguments of `none`, `all`, or a comma seperated list<b=
r>
-of one or more of `retbr` or `blr`.<br>
-`none` indicates no special mitigation of the straight line speculation<br=
>
-vulnerability.<br>
-`all` requests all mitigations currently implemented.<br>
-`retbr` requests that the RET and BR instructions have a speculation<br>
-barrier inserted after them.<br>
-`blr` requests that BLR instructions are replaced by a BL to a function<br=
>
-stub using a BR with a speculation barrier after it.<br>
-<br>
-Setting this on a per-function basis using attributes or the like is not<b=
r>
-enabled, but may be in the future.<br>
-<br>
-(cherry picked from commit a9ba2a9b77bec7eacaf066801f22d1c366a2bc86)<br>
-<br>
-gcc/ChangeLog:<br>
-<br>
-2020-06-02&nbsp; Matthew Malcomson&nbsp; &lt;matthew.malcomson@arm.com&gt;=
<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64-protos.h (aa=
rch64_harden_sls_retbr_p):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_harden_sls_blr_p): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.c (enum aarc=
h64_sls_hardening_type):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_harden_sls_retbr_p): New.<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_harden_sls_blr_p): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_validate_sls_mitigation): Ne=
w.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_override_options): Parse opt=
ions for SLS mitigation.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.opt (-mharde=
n-sls): New option.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * doc/invoke.texi: Document new optio=
n.<br>
----<br>
- gcc/config/aarch64/aarch64-protos.h |&nbsp; 3 ++<br>
- gcc/config/aarch64/aarch64.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
76 +++++++++++++++++++++++++++++<br>
- gcc/config/aarch64/aarch64.opt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++=
<br>
- gcc/doc/invoke.texi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 +++++<br>
- 4 files changed, 95 insertions(+)<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h<br>
-index c083cad53..31493f412 100644<br>
---- a/gcc/config/aarch64/aarch64-protos.h<br>
-+++ b/gcc/config/aarch64/aarch64-protos.h<br>
-@@ -644,4 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);<br>
-<br>
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);<br>
-<br>
-+extern bool aarch64_harden_sls_retbr_p (void);<br>
-+extern bool aarch64_harden_sls_blr_p (void);<br>
-+<br>
- #endif /* GCC_AARCH64_PROTOS_H */<br>
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c<b=
r>
-index b452a53af..269ff6c92 100644<br>
---- a/gcc/config/aarch64/aarch64.c<br>
-+++ b/gcc/config/aarch64/aarch64.c<br>
-@@ -11734,6 +11734,79 @@ aarch64_validate_mcpu (const char *str, const str=
uct processor **res,<br>
-&nbsp;&nbsp; return false;<br>
- }<br>
-<br>
-+/* Straight line speculation indicators.&nbsp; */<br>
-+enum aarch64_sls_hardening_type<br>
-+{<br>
-+&nbsp; SLS_NONE =3D 0,<br>
-+&nbsp; SLS_RETBR =3D 1,<br>
-+&nbsp; SLS_BLR =3D 2,<br>
-+&nbsp; SLS_ALL =3D 3,<br>
-+};<br>
-+static enum aarch64_sls_hardening_type aarch64_sls_hardening;<br>
-+<br>
-+/* Return whether we should mitigatate Straight Line Speculation for the =
RET<br>
-+&nbsp;&nbsp; and BR instructions.&nbsp; */<br>
-+bool<br>
-+aarch64_harden_sls_retbr_p (void)<br>
-+{<br>
-+&nbsp; return aarch64_sls_hardening &amp; SLS_RETBR;<br>
-+}<br>
-+<br>
-+/* Return whether we should mitigatate Straight Line Speculation for the =
BLR<br>
-+&nbsp;&nbsp; instruction.&nbsp; */<br>
-+bool<br>
-+aarch64_harden_sls_blr_p (void)<br>
-+{<br>
-+&nbsp; return aarch64_sls_hardening &amp; SLS_BLR;<br>
-+}<br>
-+<br>
-+/* As of yet we only allow setting these options globally, in the future =
we may<br>
-+&nbsp;&nbsp; allow setting them per function.&nbsp; */<br>
-+static void<br>
-+aarch64_validate_sls_mitigation (const char *const_str)<br>
-+{<br>
-+&nbsp; char *token_save =3D NULL;<br>
-+&nbsp; char *str =3D NULL;<br>
-+<br>
-+&nbsp; if (strcmp (const_str, &quot;none&quot;) =3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_hardening =3D SLS_NONE;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; if (strcmp (const_str, &quot;all&quot;) =3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_hardening =3D SLS_ALL;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+<br>
-+&nbsp; char *str_root =3D xstrdup (const_str);<br>
-+&nbsp; str =3D strtok_r (str_root, &quot;,&quot;, &amp;token_save);<br>
-+&nbsp; if (!str)<br>
-+&nbsp;&nbsp;&nbsp; error (&quot;invalid argument given to %&lt;-mharden-s=
ls=3D%&gt;&quot;);<br>
-+<br>
-+&nbsp; int temp =3D SLS_NONE;<br>
-+&nbsp; while (str)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp (str, &quot;blr&quot;) =3D=3D 0=
)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp |=3D SLS_BLR;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strcmp (str, &quot;retbr&quot;) =
=3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp |=3D SLS_RETBR;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strcmp (str, &quot;none&quot;) =
=3D=3D 0 || strcmp (str, &quot;all&quot;) =3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error (&quot;%&lt;%s%&gt; must=
 be by itself for %&lt;-mharden-sls=3D%&gt;&quot;, str);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error (&quot;invalid argument =
%&lt;%s%&gt; for %&lt;-mharden-sls=3D%&gt;&quot;, str);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D strtok_r (NULL, &quot;,&quot;, &am=
p;token_save);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; aarch64_sls_hardening =3D (aarch64_sls_hardening_type) temp;<br>
-+&nbsp; free (str_root);<br>
-+}<br>
-+<br>
- /* Parses CONST_STR for branch protection features specified in<br>
-&nbsp;&nbsp;&nbsp; aarch64_branch_protect_types, and set any global variab=
les required.&nbsp; Returns<br>
-&nbsp;&nbsp;&nbsp; the parsing result and assigns LAST_STR to the last pro=
cessed token from<br>
-@@ -11972,6 +12045,9 @@ aarch64_override_options (void)<br>
-&nbsp;&nbsp; selected_arch =3D NULL;<br>
-&nbsp;&nbsp; selected_tune =3D NULL;<br>
-<br>
-+&nbsp; if (aarch64_harden_sls_string)<br>
-+&nbsp;&nbsp;&nbsp; aarch64_validate_sls_mitigation (aarch64_harden_sls_st=
ring);<br>
-+<br>
-&nbsp;&nbsp; if (aarch64_branch_protection_string)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; aarch64_validate_mbranch_protection (aarch64_bran=
ch_protection_string);<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64.opt b/gcc/config/aarch64/aarch64.o=
pt<br>
-index 3c6d1cc90..d27ab6df8 100644<br>
---- a/gcc/config/aarch64/aarch64.opt<br>
-+++ b/gcc/config/aarch64/aarch64.opt<br>
-@@ -71,6 +71,10 @@ mgeneral-regs-only<br>
- Target Report RejectNegative Mask(GENERAL_REGS_ONLY) Save<br>
- Generate code which uses only the general registers.<br>
-<br>
-+mharden-sls=3D<br>
-+Target RejectNegative Joined Var(aarch64_harden_sls_string)<br>
-+Generate code to mitigate against straight line speculation.<br>
-+<br>
- mfix-cortex-a53-835769<br>
- Target Report Var(aarch64_fix_a53_err835769) Init(2) Save<br>
- Workaround for ARM Cortex-A53 Erratum number 835769.<br>
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
-index 2f7ffe456..5f04a7d2b 100644<br>
---- a/gcc/doc/invoke.texi<br>
-+++ b/gcc/doc/invoke.texi<br>
-@@ -638,6 +638,7 @@ Objective-C and Objective-C++ Dialects}.<br>
- -mpc-relative-literal-loads @gol<br>
- -msign-return-address=3D@var{scope} @gol<br>
- -mbranch-protection=3D@var{none}|@var{standard}|@var{pac-ret}[+@var{leaf}=
]|@var{bti} @gol<br>
-+-mharden-sls=3D@var{opts} @gol<br>
- -march=3D@var{name}&nbsp; -mcpu=3D@var{name}&nbsp; -mtune=3D@var{name}&nb=
sp; @gol<br>
- -moverride=3D@var{string}&nbsp; -mverbose-cost-dump @gol<br>
- -mstack-protector-guard=3D@var{guard} -mstack-protector-guard-reg=3D@var{=
sysreg} @gol<br>
-@@ -15955,6 +15956,17 @@ argument @samp{leaf} can be used to extend the si=
gning to include leaf<br>
- functions.<br>
- @samp{bti} turns on branch target identification mechanism.<br>
-<br>
-+@item -mharden-sls=3D@var{opts}<br>
-+@opindex mharden-sls<br>
-+Enable compiler hardening against straight line speculation (SLS).<br>
-+@var{opts} is a comma-separated list of the following options:<br>
-+@table @samp<br>
-+@item retbr<br>
-+@item blr<br>
-+@end table<br>
-+In addition, @samp{-mharden-sls=3Dall} enables all SLS hardening while<br=
>
-+@samp{-mharden-sls=3Dnone} disables all SLS hardening.<br>
-+<br>
- @item -msve-vector-bits=3D@var{bits}<br>
- @opindex msve-vector-bits<br>
- Specify the number of bits in an SVE vector register.&nbsp; This option o=
nly has<br>
---<br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-m=
itigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc-9.3/000=
2-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch<br>
deleted file mode 100644<br>
index c972088d2b..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigati=
on-for-RET-and-BR-inst.patch<br>
+++ /dev/null<br>
@@ -1,600 +0,0 @@<br>
-CVE: CVE-2020-13844<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
-<br>
-From dc586a749228ecfb71f72ec2ca10e6f7b6874af3 Mon Sep 17 00:00:00 2001<br>
-From: Matthew Malcomson &lt;matthew.malcomson@arm.com&gt;<br>
-Date: Thu, 9 Jul 2020 09:11:59 +0100<br>
-Subject: [PATCH 2/3] aarch64: Introduce SLS mitigation for RET and BR<br>
- instructions<br>
-<br>
-Instructions following RET or BR are not necessarily executed.&nbsp; In or=
der<br>
-to avoid speculation past RET and BR we can simply append a speculation<br=
>
-barrier.<br>
-<br>
-Since these speculation barriers will not be architecturally executed,<br>
-they are not expected to add a high performance penalty.<br>
-<br>
-The speculation barrier is to be SB when targeting architectures which<br>
-have this enabled, and DSB SY + ISB otherwise.<br>
-<br>
-We add tests for each of the cases where such an instruction was seen.<br>
-<br>
-This is implemented by modifying each machine description pattern that<br>
-emits either a RET or a BR instruction.&nbsp; We choose not to use somethi=
ng<br>
-like `TARGET_ASM_FUNCTION_EPILOGUE` since it does not affect the<br>
-`indirect_jump`, `jump`, `sibcall_insn` and `sibcall_value_insn`<br>
-patterns and we find it preferable to implement the functionality in the<b=
r>
-same way for every pattern.<br>
-<br>
-There is one particular case which is slightly tricky.&nbsp; The<br>
-implementation of TARGET_ASM_TRAMPOLINE_TEMPLATE uses a BR which needs<br>
-to be mitigated against.&nbsp; The trampoline template is used *once* per<=
br>
-compilation unit, and the TRAMPOLINE_SIZE is exposed to the user via the<b=
r>
-builtin macro __LIBGCC_TRAMPOLINE_SIZE__.<br>
-In the future we may implement function specific attributes to turn on<br>
-and off hardening on a per-function basis.<br>
-The fixed nature of the trampoline described above implies it will be<br>
-safer to ensure this speculation barrier is always used.<br>
-<br>
-Testing:<br>
-&nbsp; Bootstrap and regtest done on aarch64-none-linux<br>
-&nbsp; Used a temporary hack(1) to use these options on every test in the<=
br>
-&nbsp; testsuite and a script to check that the output never emitted an<br=
>
-&nbsp; unmitigated RET or BR.<br>
-<br>
-1) Temporary hack was a change to the testsuite to always use<br>
-`-save-temps` and run a script on the assembly output of those<br>
-compilations which produced one to ensure every RET or BR is immediately<b=
r>
-followed by a speculation barrier.<br>
-<br>
-(cherry picked from be178ecd5ac1fe1510d960ff95c66d0ff831afe1)<br>
-<br>
-gcc/ChangeLog:<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64-protos.h (aa=
rch64_sls_barrier): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.c (aarch64_o=
utput_casesi): Emit<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; speculation barrier after BR instruct=
ion if needs be.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_trampoline_init): Handle ptr=
_mode value &amp; adjust size<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of code copied.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_sls_barrier): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_asm_trampoline_template): Ad=
d needed barriers.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.h (AARCH64_I=
SA_SB): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_SB): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TRAMPOLINE_SIZE): Account for barrie=
r.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.md (indirect=
_jump, *casesi_dispatch,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; simple_return, *do_return, *sibcall_i=
nsn, *sibcall_value_insn):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Emit barrier if needs be, also accoun=
t for possible barrier using<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sls_length&quot; attribute.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (sls_length): New attribute.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (length): Determine default using any=
 non-default sls_length<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value.<br>
-<br>
-gcc/testsuite/ChangeLog:<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.target/aarch64/sls-mitigation/s=
ls-miti-retbr.c: New test.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.target/aarch64/sls-mitigation/s=
ls-miti-retbr-pacret.c:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New test.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.target/aarch64/sls-mitigation/s=
ls-mitigation.exp: New file.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * lib/target-supports.exp (check_effe=
ctive_target_aarch64_asm_sb_ok):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New proc.<br>
----<br>
- gcc/config/aarch64/aarch64-protos.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
- gcc/config/aarch64/aarch64.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 41 +++++-=
<br>
- gcc/config/aarch64/aarch64.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +-<br>
- gcc/config/aarch64/aarch64.md&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 75 ++++++++---=
<br>
- .../sls-mitigation/sls-miti-retbr-pacret.c&nbsp;&nbsp;&nbsp; |&nbsp; 15 +=
++<br>
- .../aarch64/sls-mitigation/sls-miti-retbr.c&nbsp;&nbsp; | 119 +++++++++++=
+++++++<br>
- .../aarch64/sls-mitigation/sls-mitigation.exp |&nbsp; 73 +++++++++++<br>
- gcc/testsuite/lib/target-supports.exp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
- 8 files changed, 312 insertions(+), 25 deletions(-)<br>
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-retbr-pacret.c<br>
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-retbr.c<br>
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
tigation.exp<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h<br>
-index 31493f412..885eae893 100644<br>
---- a/gcc/config/aarch64/aarch64-protos.h<br>
-+++ b/gcc/config/aarch64/aarch64-protos.h<br>
-@@ -644,6 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);<br>
-<br>
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);<br>
-<br>
-+const char *aarch64_sls_barrier (int);<br>
- extern bool aarch64_harden_sls_retbr_p (void);<br>
- extern bool aarch64_harden_sls_blr_p (void);<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c<b=
r>
-index 269ff6c92..dff61105c 100644<br>
---- a/gcc/config/aarch64/aarch64.c<br>
-+++ b/gcc/config/aarch64/aarch64.c<br>
-@@ -8412,8 +8412,8 @@ aarch64_return_addr (int count, rtx frame ATTRIBUTE_=
UNUSED)<br>
- static void<br>
- aarch64_asm_trampoline_template (FILE *f)<br>
- {<br>
--&nbsp; int offset1 =3D 16;<br>
--&nbsp; int offset2 =3D 20;<br>
-+&nbsp; int offset1 =3D 24;<br>
-+&nbsp; int offset2 =3D 28;<br>
-<br>
-&nbsp;&nbsp; if (aarch64_bti_enabled ())<br>
-&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-@@ -8436,6 +8436,17 @@ aarch64_asm_trampoline_template (FILE *f)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp; asm_fprintf (f, &quot;\tbr\t%s\n&quot;, reg_names [IP1_REGNUM=
]);<br>
-<br>
-+&nbsp; /* We always emit a speculation barrier.<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; This is because the same trampoline template is =
used for every nested<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; function.&nbsp; Since nested functions are not p=
articularly common or<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; performant we don't worry too much about the ext=
ra instructions to copy<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; around.<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; This is not yet a problem, since we have not yet=
 implemented function<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; specific attributes to choose between hardening =
against straight line<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; speculation or not, but such function specific a=
ttributes are likely to<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; happen in the future.&nbsp; */<br>
-+&nbsp; asm_fprintf (f, &quot;\tdsb\tsy\n\tisb\n&quot;);<br>
-+<br>
-&nbsp;&nbsp; /* The trampoline needs an extra padding instruction.&nbsp; I=
n case if BTI is<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled the padding instruction is replaced=
 by the BTI instruction at<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the beginning.&nbsp; */<br>
-@@ -8450,10 +8461,14 @@ static void<br>
- aarch64_trampoline_init (rtx m_tramp, tree fndecl, rtx chain_value)<br>
- {<br>
-&nbsp;&nbsp; rtx fnaddr, mem, a_tramp;<br>
--&nbsp; const int tramp_code_sz =3D 16;<br>
-+&nbsp; const int tramp_code_sz =3D 24;<br>
-<br>
-&nbsp;&nbsp; /* Don't need to copy the trailing D-words, we fill those in =
below.&nbsp; */<br>
--&nbsp; emit_block_move (m_tramp, assemble_trampoline_template (),<br>
-+&nbsp; /* We create our own memory address in Pmode so that `emit_block_m=
ove` can<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; use parts of the backend which expect Pmode addr=
esses.&nbsp; */<br>
-+&nbsp; rtx temp =3D convert_memory_address (Pmode, XEXP (m_tramp, 0));<br=
>
-+&nbsp; emit_block_move (gen_rtx_MEM (BLKmode, temp),<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; assemble_trampoline_template (),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; GEN_INT (tramp_code_sz), BLOCK_OP_NORMAL);<br>
-&nbsp;&nbsp; mem =3D adjust_address (m_tramp, ptr_mode, tramp_code_sz);<br=
>
-&nbsp;&nbsp; fnaddr =3D XEXP (DECL_RTL (fndecl), 0);<br>
-@@ -8640,6 +8655,8 @@ aarch64_output_casesi (rtx *operands)<br>
-&nbsp;&nbsp; output_asm_insn (buf, operands);<br>
-&nbsp;&nbsp; output_asm_insn (patterns[index][1], operands);<br>
-&nbsp;&nbsp; output_asm_insn (&quot;br\t%3&quot;, operands);<br>
-+&nbsp; output_asm_insn (aarch64_sls_barrier (aarch64_harden_sls_retbr_p (=
)),<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; operands);<br>
-&nbsp;&nbsp; assemble_label (asm_out_file, label);<br>
-&nbsp;&nbsp; return &quot;&quot;;<br>
- }<br>
-@@ -18976,6 +18993,22 @@ aarch64_file_end_indicate_exec_stack ()<br>
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_BTI<br>
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_AND<br>
-<br>
-+/* Helper function for straight line speculation.<br>
-+&nbsp;&nbsp; Return what barrier should be emitted for straight line spec=
ulation<br>
-+&nbsp;&nbsp; mitigation.<br>
-+&nbsp;&nbsp; When not mitigating against straight line speculation this f=
unction returns<br>
-+&nbsp;&nbsp; an empty string.<br>
-+&nbsp;&nbsp; When mitigating against straight line speculation, use:<br>
-+&nbsp;&nbsp; * SB when the v8.5-A SB extension is enabled.<br>
-+&nbsp;&nbsp; * DSB+ISB otherwise.&nbsp; */<br>
-+const char *<br>
-+aarch64_sls_barrier (int mitigation_required)<br>
-+{<br>
-+&nbsp; return mitigation_required<br>
-+&nbsp;&nbsp;&nbsp; ? (TARGET_SB ? &quot;sb&quot; : &quot;dsb\tsy\n\tisb&q=
uot;)<br>
-+&nbsp;&nbsp;&nbsp; : &quot;&quot;;<br>
-+}<br>
-+<br>
- /* Target-specific selftests.&nbsp; */<br>
-<br>
- #if CHECKING_P<br>
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
-index 772a97296..72ddc6fd9 100644<br>
---- a/gcc/config/aarch64/aarch64.h<br>
-+++ b/gcc/config/aarch64/aarch64.h<br>
-@@ -235,6 +235,7 @@ extern unsigned aarch64_architecture_version;<br>
- #define AARCH64_ISA_F16FML&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_i=
sa_flags &amp; AARCH64_FL_F16FML)<br>
- #define AARCH64_ISA_RCPC8_4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_isa_fl=
ags &amp; AARCH64_FL_RCPC8_4)<br>
- #define AARCH64_ISA_V8_5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(aarch64_isa_flags &amp; AARCH64_FL_V8_5)<br>
-+#define AARCH64_ISA_SB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_isa_flag=
s &amp; AARCH64_FL_SB)<br>
-<br>
- /* Crypto is an optional extension to AdvSIMD.&nbsp; */<br>
- #define TARGET_CRYPTO (TARGET_SIMD &amp;&amp; AARCH64_ISA_CRYPTO)<br>
-@@ -285,6 +286,9 @@ extern unsigned aarch64_architecture_version;<br>
- #define TARGET_FIX_ERR_A53_835769_DEFAULT 1<br>
- #endif<br>
-<br>
-+/* SB instruction is enabled through +sb.&nbsp; */<br>
-+#define TARGET_SB (AARCH64_ISA_SB)<br>
-+<br>
- /* Apply the workaround for Cortex-A53 erratum 835769.&nbsp; */<br>
- #define TARGET_FIX_ERR_A53_835769&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; ((aarch64_fix_a53_err835769 =3D=3D 2)&nbsp;&nbsp; \<br>
-@@ -931,8 +935,10 @@ typedef struct<br>
-<br>
- #define RETURN_ADDR_RTX aarch64_return_addr<br>
-<br>
--/* BTI c + 3 insns + 2 pointer-sized entries.&nbsp; */<br>
--#define TRAMPOLINE_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_ILP32=
 ? 24 : 32)<br>
-+/* BTI c + 3 insns<br>
-+&nbsp;&nbsp; + sls barrier of DSB + ISB.<br>
-+&nbsp;&nbsp; + 2 pointer-sized entries.&nbsp; */<br>
-+#define TRAMPOLINE_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (24 + (TARGET=
_ILP32 ? 8 : 16))<br>
-<br>
- /* Trampolines contain dwords, so must be dword aligned.&nbsp; */<br>
- #define TRAMPOLINE_ALIGNMENT 64<br>
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md=
<br>
-index cc5a887d4..494aee964 100644<br>
---- a/gcc/config/aarch64/aarch64.md<br>
-+++ b/gcc/config/aarch64/aarch64.md<br>
-@@ -331,10 +331,25 @@<br>
- ;; Attribute that specifies whether the alternative uses MOVPRFX.<br>
- (define_attr &quot;movprfx&quot; &quot;no,yes&quot; (const_string &quot;n=
o&quot;))<br>
-<br>
-+;; Attribute to specify that an alternative has the length of a single<br=
>
-+;; instruction plus a speculation barrier.<br>
-+(define_attr &quot;sls_length&quot; &quot;none,retbr,casesi&quot; (const_=
string &quot;none&quot;))<br>
-+<br>
- (define_attr &quot;length&quot; &quot;&quot;<br>
-&nbsp;&nbsp; (cond [(eq_attr &quot;movprfx&quot; &quot;yes&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_=
int 8)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ] (const_int 4)))<br>
-+<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (eq_attr &quot;sls_length&quot; &quo=
t;retbr&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cond [(match_test &quot=
;!aarch64_harden_sls_retbr_p ()&quot;) (const_int 4)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (match_test &quot;TARGET_SB&quot;) (const_int 8)]<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; (const_int 12))<br>
-+<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (eq_attr &quot;sls_length&quot; &quo=
t;casesi&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cond [(match_test &quot=
;!aarch64_harden_sls_retbr_p ()&quot;) (const_int 16)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (match_test &quot;TARGET_SB&quot;) (const_int 20)]<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; (const_int 24))<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (const_int 4)))<br>
-<br>
- ;; Strictly for compatibility with AArch32 in pipeline models, since AArc=
h64 has<br>
- ;; no predicated insns.<br>
-@@ -370,8 +385,12 @@<br>
- (define_insn &quot;indirect_jump&quot;<br>
-&nbsp;&nbsp; [(set (pc) (match_operand:DI 0 &quot;register_operand&quot; &=
quot;r&quot;))]<br>
-&nbsp;&nbsp; &quot;&quot;<br>
--&nbsp; &quot;br\\t%0&quot;<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)]<br>
-+&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; output_asm_insn (&quot;br\\t%0&quot;, operands);<br>
-+&nbsp;&nbsp;&nbsp; return aarch64_sls_barrier (aarch64_harden_sls_retbr_p=
 ());<br>
-+&nbsp; }<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)<br>
-+&nbsp;&nbsp; (set_attr &quot;sls_length&quot; &quot;retbr&quot;)]<br>
- )<br>
-<br>
- (define_insn &quot;jump&quot;<br>
-@@ -657,7 +676,7 @@<br>
-&nbsp;&nbsp; &quot;*<br>
-&nbsp;&nbsp; return aarch64_output_casesi (operands);<br>
-&nbsp;&nbsp; &quot;<br>
--&nbsp; [(set_attr &quot;length&quot; &quot;16&quot;)<br>
-+&nbsp; [(set_attr &quot;sls_length&quot; &quot;casesi&quot;)<br>
-&nbsp;&nbsp;&nbsp; (set_attr &quot;type&quot; &quot;branch&quot;)]<br>
- )<br>
-<br>
-@@ -736,14 +755,18 @@<br>
-&nbsp;&nbsp; [(return)]<br>
-&nbsp;&nbsp; &quot;&quot;<br>
-&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; const char *ret =3D NULL;<br>
-&nbsp;&nbsp;&nbsp;&nbsp; if (aarch64_return_address_signing_enabled ()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; TARGET_ARMV8_3<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !crtl-&gt;calls_eh_return)=
<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;retaa&quot;;<br>
--<br>
--&nbsp;&nbsp;&nbsp; return &quot;ret&quot;;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D &quot;retaa&quot;;<br>
-+&nbsp;&nbsp;&nbsp; else<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D &quot;ret&quot;;<br>
-+&nbsp;&nbsp;&nbsp; output_asm_insn (ret, operands);<br>
-+&nbsp;&nbsp;&nbsp; return aarch64_sls_barrier (aarch64_harden_sls_retbr_p=
 ());<br>
-&nbsp;&nbsp; }<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)]<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)<br>
-+&nbsp;&nbsp; (set_attr &quot;sls_length&quot; &quot;retbr&quot;)]<br>
- )<br>
-<br>
- (define_expand &quot;return&quot;<br>
-@@ -755,8 +778,12 @@<br>
- (define_insn &quot;simple_return&quot;<br>
-&nbsp;&nbsp; [(simple_return)]<br>
-&nbsp;&nbsp; &quot;aarch64_use_simple_return_insn_p ()&quot;<br>
--&nbsp; &quot;ret&quot;<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)]<br>
-+&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; output_asm_insn (&quot;ret&quot;, operands);<br>
-+&nbsp;&nbsp;&nbsp; return aarch64_sls_barrier (aarch64_harden_sls_retbr_p=
 ());<br>
-+&nbsp; }<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;branch&quot;)<br>
-+&nbsp;&nbsp; (set_attr &quot;sls_length&quot; &quot;retbr&quot;)]<br>
- )<br>
-<br>
- (define_insn &quot;*cb&lt;optab&gt;&lt;mode&gt;1&quot;<br>
-@@ -947,10 +974,16 @@<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (match_operand 1 &quot;&quot; &=
quot;&quot;))<br>
-&nbsp;&nbsp;&nbsp; (return)]<br>
-&nbsp;&nbsp; &quot;SIBLING_CALL_P (insn)&quot;<br>
--&nbsp; &quot;@<br>
--&nbsp;&nbsp; br\\t%0<br>
--&nbsp;&nbsp; b\\t%c0&quot;<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;branch, branch&quot;)]<br>
-+&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; if (which_alternative =3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_asm_insn (&quot;br\\t%0&quot;, oper=
ands);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return aarch64_sls_barrier (aarch64_harden=
_sls_retbr_p ());<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; return &quot;b\\t%c0&quot;;<br>
-+&nbsp; }<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;branch, branch&quot;)<br>
-+&nbsp;&nbsp; (set_attr &quot;sls_length&quot; &quot;retbr,none&quot;)]<br=
>
- )<br>
-<br>
- (define_insn &quot;*sibcall_value_insn&quot;<br>
-@@ -960,10 +993,16 @@<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (=
match_operand 2 &quot;&quot; &quot;&quot;)))<br>
-&nbsp;&nbsp;&nbsp; (return)]<br>
-&nbsp;&nbsp; &quot;SIBLING_CALL_P (insn)&quot;<br>
--&nbsp; &quot;@<br>
--&nbsp;&nbsp; br\\t%1<br>
--&nbsp;&nbsp; b\\t%c1&quot;<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;branch, branch&quot;)]<br>
-+&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; if (which_alternative =3D=3D 0)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_asm_insn (&quot;br\\t%1&quot;, oper=
ands);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return aarch64_sls_barrier (aarch64_harden=
_sls_retbr_p ());<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp; return &quot;b\\t%c1&quot;;<br>
-+&nbsp; }<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;branch, branch&quot;)<br>
-+&nbsp;&nbsp; (set_attr &quot;sls_length&quot; &quot;retbr,none&quot;)]<br=
>
- )<br>
-<br>
- ;; Call subroutine returning any type.<br>
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retb=
r-pacret.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr=
-pacret.c<br>
-new file mode 100644<br>
-index 000000000..7656123ee<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacre=
t.c<br>
-@@ -0,0 +1,15 @@<br>
-+/* Avoid ILP32 since pacret is only available for LP64 */<br>
-+/* { dg-do compile { target { ! ilp32 } } } */<br>
-+/* { dg-additional-options &quot;-mharden-sls=3Dretbr -mbranch-protection=
=3Dpac-ret -march=3Darmv8.3-a&quot; } */<br>
-+<br>
-+/* Testing the do_return pattern for retaa.&nbsp; */<br>
-+long retbr_subcall(void);<br>
-+long retbr_do_return_retaa(void)<br>
-+{<br>
-+&nbsp;&nbsp;&nbsp; return retbr_subcall()+1;<br>
-+}<br>
-+<br>
-+/* Ensure there are no BR or RET instructions which are not directly foll=
owed<br>
-+&nbsp;&nbsp; by a speculation barrier.&nbsp; */<br>
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!=
dsb\tsy\n\tisb)} } } */<br>
-+/* { dg-final { scan-assembler-not {ret\t} } } */<br>
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retb=
r.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c<br>
-new file mode 100644<br>
-index 000000000..573b30cdc<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c<br>
-@@ -0,0 +1,119 @@<br>
-+/* We ensure that -Wpedantic is off since it complains about the trampoli=
nes<br>
-+&nbsp;&nbsp; we explicitly want to test.&nbsp; */<br>
-+/* { dg-additional-options &quot;-mharden-sls=3Dretbr -Wno-pedantic &quot=
; } */<br>
-+/*<br>
-+&nbsp;&nbsp; Ensure that the SLS hardening of RET and BR leaves no unprot=
ected RET/BR<br>
-+&nbsp;&nbsp; instructions.<br>
-+&nbsp; */<br>
-+typedef int (foo) (int, int);<br>
-+typedef void (bar) (int, int);<br>
-+struct sls_testclass {<br>
-+&nbsp;&nbsp;&nbsp; foo *x;<br>
-+&nbsp;&nbsp;&nbsp; bar *y;<br>
-+&nbsp;&nbsp;&nbsp; int left;<br>
-+&nbsp;&nbsp;&nbsp; int right;<br>
-+};<br>
-+<br>
-+int<br>
-+retbr_sibcall_value_insn (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; return x.x(x.left, x.right);<br>
-+}<br>
-+<br>
-+void<br>
-+retbr_sibcall_insn (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; x.y(x.left, x.right);<br>
-+}<br>
-+<br>
-+/* Aim to test two different returns.<br>
-+&nbsp;&nbsp; One that introduces a tail call in the middle of the functio=
n, and one that<br>
-+&nbsp;&nbsp; has a normal return.&nbsp; */<br>
-+int<br>
-+retbr_multiple_returns (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; int temp;<br>
-+&nbsp; if (x.left % 10)<br>
-+&nbsp;&nbsp;&nbsp; return x.x(x.left, 100);<br>
-+&nbsp; else if (x.right % 20)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return x.x(x.left * x.right, 100);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; temp =3D x.left % x.right;<br>
-+&nbsp; temp *=3D 100;<br>
-+&nbsp; temp /=3D 2;<br>
-+&nbsp; return temp % 3;<br>
-+}<br>
-+<br>
-+void<br>
-+retbr_multiple_returns_void (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; if (x.left % 10)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x.y(x.left, 100);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; else if (x.right % 20)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x.y(x.left * x.right, 100);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; return;<br>
-+}<br>
-+<br>
-+/* Testing the casesi jump via register.&nbsp; */<br>
-+__attribute__ ((optimize (&quot;Os&quot;)))<br>
-+int<br>
-+retbr_casesi_dispatch (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; switch (x.left)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; case -5:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -2;<br>
-+&nbsp;&nbsp;&nbsp; case -3:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
-+&nbsp;&nbsp;&nbsp; case 0:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
-+&nbsp;&nbsp;&nbsp; case 3:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
-+&nbsp;&nbsp;&nbsp; case 5:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-+&nbsp;&nbsp;&nbsp; default:<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __builtin_unreachable ();<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; return x.right;<br>
-+}<br>
-+<br>
-+/* Testing the BR in trampolines is mitigated against.&nbsp; */<br>
-+void f1 (void *);<br>
-+void f3 (void *, void (*)(void *));<br>
-+void f2 (void *);<br>
-+<br>
-+int<br>
-+retbr_trampolines (void *a, int b)<br>
-+{<br>
-+&nbsp; if (!b)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f1 (a);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; if (b)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void retbr_tramp_internal (void *c)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c =3D=3D a)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f2 (c);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f3 (a, retbr_tramp_internal);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; return 0;<br>
-+}<br>
-+<br>
-+/* Testing the indirect_jump pattern.&nbsp; */<br>
-+void<br>
-+retbr_indirect_jump (int *buf)<br>
-+{<br>
-+&nbsp; __builtin_longjmp(buf, 1);<br>
-+}<br>
-+<br>
-+/* Ensure there are no BR or RET instructions which are not directly foll=
owed<br>
-+&nbsp;&nbsp; by a speculation barrier.&nbsp; */<br>
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!=
dsb\tsy\n\tisb|sb)} } } */<br>
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigatio=
n.exp b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp<=
br>
-new file mode 100644<br>
-index 000000000..812250379<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp<b=
r>
-@@ -0,0 +1,73 @@<br>
-+#&nbsp; Regression driver for SLS mitigation on AArch64.<br>
-+#&nbsp; Copyright (C) 2020 Free Software Foundation, Inc.<br>
-+#&nbsp; Contributed by ARM Ltd.<br>
-+#<br>
-+#&nbsp; This file is part of GCC.<br>
-+#<br>
-+#&nbsp; GCC is free software; you can redistribute it and/or modify it<br=
>
-+#&nbsp; under the terms of the GNU General Public License as published by=
<br>
-+#&nbsp; the Free Software Foundation; either version 3, or (at your optio=
n)<br>
-+#&nbsp; any later version.<br>
-+#<br>
-+#&nbsp; GCC is distributed in the hope that it will be useful, but<br>
-+#&nbsp; WITHOUT ANY WARRANTY; without even the implied warranty of<br>
-+#&nbsp; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See th=
e GNU<br>
-+#&nbsp; General Public License for more details.<br>
-+#<br>
-+#&nbsp; You should have received a copy of the GNU General Public License=
<br>
-+#&nbsp; along with GCC; see the file COPYING3.&nbsp; If not see<br>
-+#&nbsp; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fwww.gnu.org%2Flicenses%2F&amp;amp;data=3D05%7C01%7Cranjits=
inh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;amp;sdata=3DNQF1eeIa9Xgit9e4b%2FIj%2BJYHzj60pQ0fPPYHh9%2Fhz0I%3D&amp=
;amp;reserved=3D0" data-auth=3D"NotApplicable">https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.gnu.org%2Flicenses%2F&amp;amp;da=
ta=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570=
ebe%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DNQF1eeIa9Xgit9e4b%2FIj%2BJYHzj60pQ=
0fPPYHh9%2Fhz0I%3D&amp;amp;reserved=3D0</a>&gt;.&nbsp;
 */<br>
-+<br>
-+# Exit immediately if this isn't an AArch64 target.<br>
-+if {![istarget aarch64*-*-*] } then {<br>
-+&nbsp; return<br>
-+}<br>
-+<br>
-+# Load support procs.<br>
-+load_lib gcc-dg.exp<br>
-+load_lib torture-options.exp<br>
-+<br>
-+# If a testcase doesn't have special options, use these.<br>
-+global DEFAULT_CFLAGS<br>
-+if ![info exists DEFAULT_CFLAGS] then {<br>
-+&nbsp;&nbsp;&nbsp; set DEFAULT_CFLAGS &quot; &quot;<br>
-+}<br>
-+<br>
-+# Initialize `dg'.<br>
-+dg-init<br>
-+torture-init<br>
-+<br>
-+# Use different architectures as well as the normal optimisation options.=
<br>
-+# (i.e. use both SB and DSB+ISB barriers).<br>
-+<br>
-+set save-dg-do-what-default ${dg-do-what-default}<br>
-+# Main loop.<br>
-+# Run with torture tests (i.e. a bunch of different optimisation levels) =
just<br>
-+# to increase test coverage.<br>
-+set dg-do-what-default assemble<br>
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;-save-temps&quot; $DEFAULT_CFLAGS<br=
>
-+<br>
-+# Run the same tests but this time with SB extension.<br>
-+# Since not all supported assemblers will support that extension we decid=
e<br>
-+# whether to assemble or just compile based on whether the extension is<b=
r>
-+# supported for the available assembler.<br>
-+<br>
-+set templist {}<br>
-+foreach x $DG_TORTURE_OPTIONS {<br>
-+&nbsp; lappend templist &quot;$x -march=3Darmv8.3-a+sb &quot;<br>
-+&nbsp; lappend templist &quot;$x -march=3Darmv8-a+sb &quot;<br>
-+}<br>
-+set-torture-options $templist<br>
-+if { [check_effective_target_aarch64_asm_sb_ok] } {<br>
-+&nbsp;&nbsp;&nbsp; set dg-do-what-default assemble<br>
-+} else {<br>
-+&nbsp;&nbsp;&nbsp; set dg-do-what-default compile<br>
-+}<br>
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;-save-temps&quot; $DEFAULT_CFLAGS<br=
>
-+set dg-do-what-default ${save-dg-do-what-default}<br>
-+<br>
-+# All done.<br>
-+torture-finish<br>
-+dg-finish<br>
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/tar=
get-supports.exp<br>
-index ea9a50ccb..79482f9b6 100644<br>
---- a/gcc/testsuite/lib/target-supports.exp<br>
-+++ b/gcc/testsuite/lib/target-supports.exp<br>
-@@ -8579,7 +8579,8 @@ proc check_effective_target_aarch64_tiny { } {<br>
- # Create functions to check that the AArch64 assembler supports the<br>
- # various architecture extensions via the .arch_extension pseudo-op.<br>
-<br>
--foreach { aarch64_ext } { &quot;fp&quot; &quot;simd&quot; &quot;crypto&qu=
ot; &quot;crc&quot; &quot;lse&quot; &quot;dotprod&quot; &quot;sve&quot;} {<=
br>
-+foreach { aarch64_ext } { &quot;fp&quot; &quot;simd&quot; &quot;crypto&qu=
ot; &quot;crc&quot; &quot;lse&quot; &quot;dotprod&quot; &quot;sve&quot;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sb&=
quot;} {<br>
-&nbsp;&nbsp;&nbsp;&nbsp; eval [string map [list FUNC $aarch64_ext] {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc check_effective_target_aarch64_a=
sm_FUNC_ok { } {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if { [istarget aarch64*-*=
-*] } {<br>
---<br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-fo=
r-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mi=
tigate-SLS-for-BLR-instruction.patch<br>
deleted file mode 100644<br>
index 6dffef0a34..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-i=
nstruction.patch<br>
+++ /dev/null<br>
@@ -1,659 +0,0 @@<br>
-CVE: CVE-2020-13844<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
-<br>
-From 2155170525f93093b90a1a065e7ed71a925566e9 Mon Sep 17 00:00:00 2001<br>
-From: Matthew Malcomson &lt;matthew.malcomson@arm.com&gt;<br>
-Date: Thu, 9 Jul 2020 09:11:59 +0100<br>
-Subject: [PATCH 3/3] aarch64: Mitigate SLS for BLR instruction<br>
-<br>
-This patch introduces the mitigation for Straight Line Speculation past<br=
>
-the BLR instruction.<br>
-<br>
-This mitigation replaces BLR instructions with a BL to a stub which uses<b=
r>
-a BR to jump to the original value.&nbsp; These function stubs are then<br=
>
-appended with a speculation barrier to ensure no straight line<br>
-speculation happens after these jumps.<br>
-<br>
-When optimising for speed we use a set of stubs for each function since<br=
>
-this should help the branch predictor make more accurate predictions<br>
-about where a stub should branch.<br>
-<br>
-When optimising for size we use one set of stubs for all functions.<br>
-This set of stubs can have human readable names, and we are using<br>
-`__call_indirect_x&lt;N&gt;` for register x&lt;N&gt;.<br>
-<br>
-When BTI branch protection is enabled the BLR instruction can jump to a<br=
>
-`BTI c` instruction using any register, while the BR instruction can<br>
-only jump to a `BTI c` instruction using the x16 or x17 registers.<br>
-Hence, in order to ensure this transformation is safe we mov the value<br>
-of the original register into x16 and use x16 for the BR.<br>
-<br>
-As an example when optimising for size:<br>
-a<br>
-&nbsp;&nbsp;&nbsp; BLR x0<br>
-instruction would get transformed to something like<br>
-&nbsp;&nbsp;&nbsp; BL __call_indirect_x0<br>
-where __call_indirect_x0 labels a thunk that contains<br>
-__call_indirect_x0:<br>
-&nbsp;&nbsp;&nbsp; MOV X16, X0<br>
-&nbsp;&nbsp;&nbsp; BR X16<br>
-&nbsp;&nbsp;&nbsp; &lt;speculation barrier&gt;<br>
-<br>
-The first version of this patch used local symbols specific to a<br>
-compilation unit to try and avoid relocations.<br>
-This was mistaken since functions coming from the same compilation unit<br=
>
-can still be in different sections, and the assembler will insert<br>
-relocations at jumps between sections.<br>
-<br>
-On any relocation the linker is permitted to emit a veneer to handle<br>
-jumps between symbols that are very far apart.&nbsp; The registers x16 and=
<br>
-x17 may be clobbered by these veneers.<br>
-Hence the function stubs cannot rely on the values of x16 and x17 being<br=
>
-the same as just before the function stub is called.<br>
-<br>
-Similar can be said for the hot/cold partitioning of single functions,<br>
-so function-local stubs have the same restriction.<br>
-<br>
-This updated version of the patch never emits function stubs for x16 and<b=
r>
-x17, and instead forces other registers to be used.<br>
-<br>
-Given the above, there is now no benefit to local symbols (since they<br>
-are not enough to avoid dealing with linker intricacies).&nbsp; This patch=
<br>
-now uses global symbols with hidden visibility each stored in their own<br=
>
-COMDAT section.&nbsp; This means stubs can be shared between compilation<b=
r>
-units while still avoiding the PLT indirection.<br>
-<br>
-This patch also removes the `__call_indirect_x30` stub (and<br>
-function-local equivalent) which would simply jump back to the original<br=
>
-location.<br>
-<br>
-The function-local stubs are emitted to the assembly output file in one<br=
>
-chunk, which means we need not add the speculation barrier directly<br>
-after each one.<br>
-This is because we know for certain that the instructions directly after<b=
r>
-the BR in all but the last function stub will be from another one of<br>
-these stubs and hence will not contain a speculation gadget.<br>
-Instead we add a speculation barrier at the end of the sequence of<br>
-stubs.<br>
-<br>
-The global stubs are emitted in COMDAT/.linkonce sections by<br>
-themselves so that the linker can remove duplicates from multiple object<b=
r>
-files.&nbsp; This means they are not emitted in one chunk, and each one mu=
st<br>
-include the speculation barrier.<br>
-<br>
-Another difference is that since the global stubs are shared across<br>
-compilation units we do not know that all functions will be targeting an<b=
r>
-architecture supporting the SB instruction.<br>
-Rather than provide multiple stubs for each architecture, we provide a<br>
-stub that will work for all architectures -- using the DSB+ISB barrier.<br=
>
-<br>
-This mitigation does not apply for BLR instructions in the following<br>
-places:<br>
-- Some accesses to thread-local variables use a code sequence with a BLR<b=
r>
-&nbsp; instruction.&nbsp; This code sequence is part of the binary interfa=
ce between<br>
-&nbsp; compiler and linker. If this BLR instruction needs to be mitigated,=
 it'd<br>
-&nbsp; probably be best to do so in the linker. It seems that the code seq=
uence<br>
-&nbsp; for thread-local variable access is unlikely to lead to a Spectre R=
evalation<br>
-&nbsp; Gadget.<br>
-- PLT stubs are produced by the linker and each contain a BLR instruction.=
<br>
-&nbsp; It seems that at most only after the last PLT stub a Spectre Revala=
tion<br>
-&nbsp; Gadget might appear.<br>
-<br>
-Testing:<br>
-&nbsp; Bootstrap and regtest on AArch64<br>
-&nbsp;&nbsp;&nbsp; (with BOOT_CFLAGS=3D&quot;-mharden-sls=3Dretbr,blr&quot=
;)<br>
-&nbsp; Used a temporary hack(1) in gcc-dg.exp to use these options on ever=
y<br>
-&nbsp; test in the testsuite, a slight modification to emit the speculatio=
n<br>
-&nbsp; barrier after every function stub, and a script to check that the<b=
r>
-&nbsp; output never emitted a BLR, or unmitigated BR or RET instruction.<b=
r>
-&nbsp; Similar on an aarch64-none-elf cross-compiler.<br>
-<br>
-1) Temporary hack emitted a speculation barrier at the end of every stub<b=
r>
-function, and used a script to ensure that:<br>
-&nbsp; a) Every RET or BR is immediately followed by a speculation barrier=
.<br>
-&nbsp; b) No BLR instruction is emitted by compiler.<br>
-<br>
-(cherry picked from 96b7f495f9269d5448822e4fc28882edb35a58d7)<br>
-<br>
-gcc/ChangeLog:<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64-protos.h (aa=
rch64_indirect_call_asm):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New declaration.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.c (aarch64_r=
egno_regclass): Handle new<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stub registers class.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_class_max_nregs): Likewise.<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_register_move_cost): Likewis=
e.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_sls_shared_thunks): Global a=
rray to store stub labels.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_sls_emit_function_stub): New=
.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_create_blr_label): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_sls_emit_blr_function_thunks=
): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_sls_emit_shared_blr_thunks):=
 New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_asm_file_end): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_indirect_call_asm): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_ASM_FILE_END): Use aarch64_as=
m_file_end.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_ASM_FUNCTION_EPILOGUE): Use<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_emit_blr_function_thunks.=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.h (STB_REGNU=
M_P): New.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (enum reg_class): Add STUB_REGS class=
.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (machine_function): Introduce `call_v=
ia` array for<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function-local stub labels.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch64.md (*call_in=
sn, *call_value_insn): Use<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_indirect_call_asm to emit cod=
e when hardening BLR<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instructions.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/constraints.md (Ucr)=
: New constraint<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; representing registers for indirect c=
alls.&nbsp; Is GENERAL_REGS<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usually, and STUB_REGS when hardening=
 BLR instruction against<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SLS.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/predicates.md (aarch=
64_general_reg): STUB_REGS class<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is also a general register.<br>
-<br>
-gcc/testsuite/ChangeLog:<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.target/aarch64/sls-mitigation/s=
ls-miti-blr-bti.c: New test.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gcc.target/aarch64/sls-mitigation/s=
ls-miti-blr.c: New test.<br>
----<br>
- gcc/config/aarch64/aarch64-protos.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
- gcc/config/aarch64/aarch64.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 225 +++++++++++=
++++++-<br>
- gcc/config/aarch64/aarch64.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 15 ++<br>
- gcc/config/aarch64/aarch64.md&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +-<br>
- gcc/config/aarch64/constraints.md&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 9 +<br>
- gcc/config/aarch64/predicates.md&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
- .../aarch64/sls-mitigation/sls-miti-blr-bti.c |&nbsp; 40 ++++<br>
- .../aarch64/sls-mitigation/sls-miti-blr.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 33 +++<br>
- 8 files changed, 328 insertions(+), 9 deletions(-)<br>
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-blr-bti.c<br>
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mi=
ti-blr.c<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarc=
h64-protos.h<br>
-index 885eae893..2676e43ae 100644<br>
---- a/gcc/config/aarch64/aarch64-protos.h<br>
-+++ b/gcc/config/aarch64/aarch64-protos.h<br>
-@@ -645,6 +645,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode=
);<br>
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);<br>
-<br>
- const char *aarch64_sls_barrier (int);<br>
-+const char *aarch64_indirect_call_asm (rtx);<br>
- extern bool aarch64_harden_sls_retbr_p (void);<br>
- extern bool aarch64_harden_sls_blr_p (void);<br>
-<br>
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c<b=
r>
-index dff61105c..bc6c02c3a 100644<br>
---- a/gcc/config/aarch64/aarch64.c<br>
-+++ b/gcc/config/aarch64/aarch64.c<br>
-@@ -8190,6 +8190,9 @@ aarch64_label_mentioned_p (rtx x)<br>
- enum reg_class<br>
- aarch64_regno_regclass (unsigned regno)<br>
- {<br>
-+&nbsp; if (STUB_REGNUM_P (regno))<br>
-+&nbsp;&nbsp;&nbsp; return STUB_REGS;<br>
-+<br>
-&nbsp;&nbsp; if (GP_REGNUM_P (regno))<br>
-&nbsp;&nbsp;&nbsp;&nbsp; return GENERAL_REGS;<br>
-<br>
-@@ -8499,6 +8502,7 @@ aarch64_class_max_nregs (reg_class_t regclass, machi=
ne_mode mode)<br>
-&nbsp;&nbsp; unsigned int nregs;<br>
-&nbsp;&nbsp; switch (regclass)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp; case STUB_REGS:<br>
-&nbsp;&nbsp;&nbsp;&nbsp; case TAILCALL_ADDR_REGS:<br>
-&nbsp;&nbsp;&nbsp;&nbsp; case POINTER_REGS:<br>
-&nbsp;&nbsp;&nbsp;&nbsp; case GENERAL_REGS:<br>
-@@ -10693,10 +10697,12 @@ aarch64_register_move_cost (machine_mode mode,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp; =3D aarch64_tune_params.regmove_cost;<br>
-<br>
-&nbsp;&nbsp; /* Caller save and pointer regs are equivalent to GENERAL_REG=
S.&nbsp; */<br>
--&nbsp; if (to =3D=3D TAILCALL_ADDR_REGS || to =3D=3D POINTER_REGS)<br>
-+&nbsp; if (to =3D=3D TAILCALL_ADDR_REGS || to =3D=3D POINTER_REGS<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || to =3D=3D STUB_REGS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; to =3D GENERAL_REGS;<br>
-<br>
--&nbsp; if (from =3D=3D TAILCALL_ADDR_REGS || from =3D=3D POINTER_REGS)<br=
>
-+&nbsp; if (from =3D=3D TAILCALL_ADDR_REGS || from =3D=3D POINTER_REGS<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || from =3D=3D STUB_REGS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; from =3D GENERAL_REGS;<br>
-<br>
-&nbsp;&nbsp; /* Moving between GPR and stack cost is the same as GP2GP.&nb=
sp; */<br>
-@@ -19009,6 +19015,215 @@ aarch64_sls_barrier (int mitigation_required)<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp; : &quot;&quot;;<br>
- }<br>
-<br>
-+static GTY (()) tree aarch64_sls_shared_thunks[30];<br>
-+static GTY (()) bool aarch64_sls_shared_thunks_needed =3D false;<br>
-+const char *indirect_symbol_names[30] =3D {<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x0&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x1&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x2&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x3&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x4&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x5&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x6&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x7&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x8&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x9&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x10&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x11&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x12&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x13&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x14&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x15&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;&quot;, /* &quot;__call_indirect_x16&quot;,&nbsp=
; */<br>
-+&nbsp;&nbsp;&nbsp; &quot;&quot;, /* &quot;__call_indirect_x17&quot;,&nbsp=
; */<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x18&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x19&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x20&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x21&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x22&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x23&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x24&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x25&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x26&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x27&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x28&quot;,<br>
-+&nbsp;&nbsp;&nbsp; &quot;__call_indirect_x29&quot;,<br>
-+};<br>
-+<br>
-+/* Function to create a BLR thunk.&nbsp; This thunk is used to mitigate s=
traight<br>
-+&nbsp;&nbsp; line speculation.&nbsp; Instead of a simple BLR that can be =
speculated past,<br>
-+&nbsp;&nbsp; we emit a BL to this thunk, and this thunk contains a BR to =
the relevant<br>
-+&nbsp;&nbsp; register.&nbsp; These thunks have the relevant speculation b=
arries put after<br>
-+&nbsp;&nbsp; their indirect branch so that speculation is blocked.<br>
-+<br>
-+&nbsp;&nbsp; We use such a thunk so the speculation barriers are kept off=
 the<br>
-+&nbsp;&nbsp; architecturally executed path in order to reduce the perform=
ance overhead.<br>
-+<br>
-+&nbsp;&nbsp; When optimizing for size we use stubs shared by the linked o=
bject.<br>
-+&nbsp;&nbsp; When optimizing for performance we emit stubs for each funct=
ion in the hope<br>
-+&nbsp;&nbsp; that the branch predictor can better train on jumps specific=
 for a given<br>
-+&nbsp;&nbsp; function.&nbsp; */<br>
-+rtx<br>
-+aarch64_sls_create_blr_label (int regnum)<br>
-+{<br>
-+&nbsp; gcc_assert (STUB_REGNUM_P (regnum));<br>
-+&nbsp; if (optimize_function_for_size_p (cfun))<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For the thunks shared between different=
 functions in this compilation<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unit we use a named symbol -- this i=
s just for users to more easily<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; understand the generated assembly.&n=
bsp; */<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_shared_thunks_needed =3D true;=
<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *thunk_name =3D indirect_symbol=
_names[regnum];<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (aarch64_sls_shared_thunks[regnum] =3D=
=3D NULL)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Build a decl representing t=
his function stub and record it for<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; later.&nbsp;=
 We build a decl here so we can use the GCC machinery for<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handling sec=
tions automatically (through `get_named_section` and<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `make_decl_o=
ne_only`).&nbsp; That saves us a lot of trouble handling<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the specific=
s of different output file formats.&nbsp; */<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tree decl =3D build_decl (BUIL=
TINS_LOCATION, FUNCTION_DECL,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_identifier (thunk_name),<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; build_function_type_list (void_type_=
node,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL_TREE));<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DECL_RESULT (decl) =3D build_d=
ecl (BUILTINS_LOCATION, RESULT_DECL,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; NULL_TREE, void_type_node);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TREE_PUBLIC (decl) =3D 1;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TREE_STATIC (decl) =3D 1;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DECL_IGNORED_P (decl) =3D 1;<b=
r>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DECL_ARTIFICIAL (decl) =3D 1;<=
br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make_decl_one_only (decl, DECL=
_ASSEMBLER_NAME (decl));<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resolve_unique_section (decl, =
0, false);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_shared_thunks[regn=
um] =3D decl;<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-+<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gen_rtx_SYMBOL_REF (Pmode, thunk_na=
me);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+<br>
-+&nbsp; if (cfun-&gt;machine-&gt;call_via[regnum] =3D=3D NULL)<br>
-+&nbsp;&nbsp;&nbsp; cfun-&gt;machine-&gt;call_via[regnum]<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D gen_rtx_LABEL_REF (Pmode, gen_label_rt=
x ());<br>
-+&nbsp; return cfun-&gt;machine-&gt;call_via[regnum];<br>
-+}<br>
-+<br>
-+/* Helper function for aarch64_sls_emit_blr_function_thunks and<br>
-+&nbsp;&nbsp; aarch64_sls_emit_shared_blr_thunks below.&nbsp; */<br>
-+static void<br>
-+aarch64_sls_emit_function_stub (FILE *out_file, int regnum)<br>
-+{<br>
-+&nbsp; /* Save in x16 and branch to that function so this transformation =
does<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; not prevent jumping to `BTI c` instructions.&nbs=
p; */<br>
-+&nbsp; asm_fprintf (out_file, &quot;\tmov\tx16, x%d\n&quot;, regnum);<br>
-+&nbsp; asm_fprintf (out_file, &quot;\tbr\tx16\n&quot;);<br>
-+}<br>
-+<br>
-+/* Emit all BLR stubs for this particular function.<br>
-+&nbsp;&nbsp; Here we emit all the BLR stubs needed for the current functi=
on.&nbsp; Since we<br>
-+&nbsp;&nbsp; emit these stubs in a consecutive block we know there will b=
e no speculation<br>
-+&nbsp;&nbsp; gadgets between each stub, and hence we only emit a speculat=
ion barrier at<br>
-+&nbsp;&nbsp; the end of the stub sequences.<br>
-+<br>
-+&nbsp;&nbsp; This is called in the TARGET_ASM_FUNCTION_EPILOGUE hook.&nbs=
p; */<br>
-+void<br>
-+aarch64_sls_emit_blr_function_thunks (FILE *out_file)<br>
-+{<br>
-+&nbsp; if (! aarch64_harden_sls_blr_p ())<br>
-+&nbsp;&nbsp;&nbsp; return;<br>
-+<br>
-+&nbsp; bool any_functions_emitted =3D false;<br>
-+&nbsp; /* We must save and restore the current function section since thi=
s assembly<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; is emitted at the end of the function.&nbsp; Thi=
s means it can be emitted *just<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; after* the cold section of a function.&nbsp; Tha=
t cold part would be emitted in<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; a different section.&nbsp; That switch would tri=
gger a `.cfi_endproc` directive<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; to be emitted in the original section and a `.cf=
i_startproc` directive to<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; be emitted in the new section.&nbsp; Switching t=
o the original section without<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; restoring would mean that the `.cfi_endproc` emi=
tted as a function ends<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; would happen in a different section -- leaving a=
n unmatched<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; `.cfi_startproc` in the cold text section and an=
 unmatched `.cfi_endproc`<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; in the standard text section.&nbsp; */<br>
-+&nbsp; section *save_text_section =3D in_section;<br>
-+&nbsp; switch_to_section (function_section (current_function_decl));<br>
-+&nbsp; for (int regnum =3D 0; regnum &lt; 30; ++regnum)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rtx specu_label =3D cfun-&gt;machine-&gt;c=
all_via[regnum];<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (specu_label =3D=3D NULL)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-+<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetm.asm_out.print_operand (out_file, s=
pecu_label, 0);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asm_fprintf (out_file, &quot;:\n&quot;);<b=
r>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_emit_function_stub (out_file, =
regnum);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; any_functions_emitted =3D true;<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; if (any_functions_emitted)<br>
-+&nbsp;&nbsp;&nbsp; /* Can use the SB if needs be here, since this stub wi=
ll only be used<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; by the current function, and hence for the=
 current target.&nbsp; */<br>
-+&nbsp;&nbsp;&nbsp; asm_fprintf (out_file, &quot;\t%s\n&quot;, aarch64_sls=
_barrier (true));<br>
-+&nbsp; switch_to_section (save_text_section);<br>
-+}<br>
-+<br>
-+/* Emit shared BLR stubs for the current compilation unit.<br>
-+&nbsp;&nbsp; Over the course of compiling this unit we may have converted=
 some BLR<br>
-+&nbsp;&nbsp; instructions to a BL to a shared stub function.&nbsp; This i=
s where we emit those<br>
-+&nbsp;&nbsp; stub functions.<br>
-+&nbsp;&nbsp; This function is for the stubs shared between different func=
tions in this<br>
-+&nbsp;&nbsp; compilation unit.&nbsp; We share when optimizing for size in=
stead of speed.<br>
-+<br>
-+&nbsp;&nbsp; This function is called through the TARGET_ASM_FILE_END hook=
.&nbsp; */<br>
-+void<br>
-+aarch64_sls_emit_shared_blr_thunks (FILE *out_file)<br>
-+{<br>
-+&nbsp; if (! aarch64_sls_shared_thunks_needed)<br>
-+&nbsp;&nbsp;&nbsp; return;<br>
-+<br>
-+&nbsp; for (int regnum =3D 0; regnum &lt; 30; ++regnum)<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tree decl =3D aarch64_sls_shared_thunks[re=
gnum];<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!decl)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-+<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *name =3D indirect_symbol_names=
[regnum];<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch_to_section (get_named_section (decl=
, NULL, 0));<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASM_OUTPUT_ALIGN (out_file, 2);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetm.asm_out.globalize_label (out_file,=
 name);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Only emits if the compiler is configure=
d for an assembler that can<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle visibility directives.&nbsp; =
*/<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetm.asm_out.assemble_visibility (decl,=
 VISIBILITY_HIDDEN);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASM_OUTPUT_TYPE_DIRECTIVE (out_file, name,=
 &quot;function&quot;);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASM_OUTPUT_LABEL (out_file, name);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aarch64_sls_emit_function_stub (out_file, =
regnum);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Use the most conservative target to ens=
ure it can always be used by any<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function in the translation unit.&nb=
sp; */<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asm_fprintf (out_file, &quot;\tdsb\tsy\n\t=
isb\n&quot;);<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASM_DECLARE_FUNCTION_SIZE (out_file, name,=
 decl);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+}<br>
-+<br>
-+/* Implement TARGET_ASM_FILE_END.&nbsp; */<br>
-+void<br>
-+aarch64_asm_file_end ()<br>
-+{<br>
-+&nbsp; aarch64_sls_emit_shared_blr_thunks (asm_out_file);<br>
-+&nbsp; /* Since this function will be called for the ASM_FILE_END hook, w=
e ensure<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; that what would be called otherwise (e.g. `file_=
end_indicate_exec_stack`<br>
-+&nbsp;&nbsp;&nbsp;&nbsp; for FreeBSD) still gets called.&nbsp; */<br>
-+#ifdef TARGET_ASM_FILE_END<br>
-+&nbsp; TARGET_ASM_FILE_END ();<br>
-+#endif<br>
-+}<br>
-+<br>
-+const char *<br>
-+aarch64_indirect_call_asm (rtx addr)<br>
-+{<br>
-+&nbsp; gcc_assert (REG_P (addr));<br>
-+&nbsp; if (aarch64_harden_sls_blr_p ())<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rtx stub_label =3D aarch64_sls_create_blr_=
label (REGNO (addr));<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_asm_insn (&quot;bl\t%0&quot;, &amp;=
stub_label);<br>
-+&nbsp;&nbsp;&nbsp; }<br>
-+&nbsp; else<br>
-+&nbsp;&nbsp; output_asm_insn (&quot;blr\t%0&quot;, &amp;addr);<br>
-+&nbsp; return &quot;&quot;;<br>
-+}<br>
-+<br>
- /* Target-specific selftests.&nbsp; */<br>
-<br>
- #if CHECKING_P<br>
-@@ -19529,6 +19744,12 @@ aarch64_libgcc_floating_mode_supported_p<br>
- #define TARGET_RUN_TARGET_SELFTESTS selftest::aarch64_run_selftests<br>
- #endif /* #if CHECKING_P */<br>
-<br>
-+#undef TARGET_ASM_FILE_END<br>
-+#define TARGET_ASM_FILE_END aarch64_asm_file_end<br>
-+<br>
-+#undef TARGET_ASM_FUNCTION_EPILOGUE<br>
-+#define TARGET_ASM_FUNCTION_EPILOGUE aarch64_sls_emit_blr_function_thunks=
<br>
-+<br>
- struct gcc_target targetm =3D TARGET_INITIALIZER;<br>
-<br>
- #include &quot;gt-aarch64.h&quot;<br>
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
-index 72ddc6fd9..60682a100 100644<br>
---- a/gcc/config/aarch64/aarch64.h<br>
-+++ b/gcc/config/aarch64/aarch64.h<br>
-@@ -540,6 +540,16 @@ extern unsigned aarch64_architecture_version;<br>
- #define GP_REGNUM_P(REGNO)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; (((unsigned) (REGNO - R0_REGNUM)) &lt;=3D (R30_REGNUM - R0_RE=
GNUM))<br>
-<br>
-+/* Registers known to be preserved over a BL instruction.&nbsp; This cons=
ists of the<br>
-+&nbsp;&nbsp; GENERAL_REGS without x16, x17, and x30.&nbsp; The x30 regist=
er is changed by the<br>
-+&nbsp;&nbsp; BL instruction itself, while the x16 and x17 registers may b=
e used by<br>
-+&nbsp;&nbsp; veneers which can be inserted by the linker.&nbsp; */<br>
-+#define STUB_REGNUM_P(REGNO) \<br>
-+&nbsp; (GP_REGNUM_P (REGNO) \<br>
-+&nbsp;&nbsp; &amp;&amp; (REGNO) !=3D R16_REGNUM \<br>
-+&nbsp;&nbsp; &amp;&amp; (REGNO) !=3D R17_REGNUM \<br>
-+&nbsp;&nbsp; &amp;&amp; (REGNO) !=3D R30_REGNUM) \<br>
-+<br>
- #define FP_REGNUM_P(REGNO)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; (((unsigned) (REGNO - V0_REGNUM)) &lt;=3D (V31_REGNUM - V0_RE=
GNUM))<br>
-<br>
-@@ -561,6 +571,7 @@ enum reg_class<br>
- {<br>
-&nbsp;&nbsp; NO_REGS,<br>
-&nbsp;&nbsp; TAILCALL_ADDR_REGS,<br>
-+&nbsp; STUB_REGS,<br>
-&nbsp;&nbsp; GENERAL_REGS,<br>
-&nbsp;&nbsp; STACK_REG,<br>
-&nbsp;&nbsp; POINTER_REGS,<br>
-@@ -580,6 +591,7 @@ enum reg_class<br>
- {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; &quot;NO_REGS&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
-&nbsp;&nbsp; &quot;TAILCALL_ADDR_REGS&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 \<br>
-+&nbsp; &quot;STUB_REGS&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; &quot;GENERAL_REGS&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; &quot;STACK_REG&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; &quot;POINTER_REGS&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-@@ -596,6 +608,7 @@ enum reg_class<br>
- {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; { 0x00000000, 0x00000000, 0x00000000 },&nbsp;&nbsp;&nbsp;&nbs=
p; /* NO_REGS */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
-&nbsp;&nbsp; { 0x00030000, 0x00000000, 0x00000000 },&nbsp;&nbsp;&nbsp;&nbs=
p; /* TAILCALL_ADDR_REGS */\<br>
-+&nbsp; { 0x3ffcffff, 0x00000000, 0x00000000 },&nbsp;&nbsp;&nbsp;&nbsp; /*=
 STUB_REGS */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; { 0x7fffffff, 0x00000000, 0x00000003 },&nbsp;&nbsp;&nbsp;&nbs=
p; /* GENERAL_REGS */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; { 0x80000000, 0x00000000, 0x00000000 },&nbsp;&nbsp;&nbsp;&nbs=
p; /* STACK_REG */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-&nbsp;&nbsp; { 0xffffffff, 0x00000000, 0x00000003 },&nbsp;&nbsp;&nbsp;&nbs=
p; /* POINTER_REGS */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
-@@ -735,6 +748,8 @@ typedef struct GTY (()) machine_function<br>
-&nbsp;&nbsp; struct aarch64_frame frame;<br>
-&nbsp;&nbsp; /* One entry for each hard register.&nbsp; */<br>
-&nbsp;&nbsp; bool reg_is_wrapped_separately[LAST_SAVED_REGNUM];<br>
-+&nbsp; /* One entry for each general purpose register.&nbsp; */<br>
-+&nbsp; rtx call_via[SP_REGNUM];<br>
-&nbsp;&nbsp; bool label_is_assembled;<br>
- } machine_function;<br>
- #endif<br>
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md=
<br>
-index 494aee964..ed8cf8ece 100644<br>
---- a/gcc/config/aarch64/aarch64.md<br>
-+++ b/gcc/config/aarch64/aarch64.md<br>
-@@ -908,15 +908,14 @@<br>
- )<br>
-<br>
- (define_insn &quot;*call_insn&quot;<br>
--&nbsp; [(call (mem:DI (match_operand:DI 0 &quot;aarch64_call_insn_operand=
&quot; &quot;r, Usf&quot;))<br>
-+&nbsp; [(call (mem:DI (match_operand:DI 0 &quot;aarch64_call_insn_operand=
&quot; &quot;Ucr, Usf&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (match_operand 1 &quot;&quot; &=
quot;&quot;))<br>
-&nbsp;&nbsp;&nbsp; (clobber (reg:DI LR_REGNUM))]<br>
-&nbsp;&nbsp; &quot;&quot;<br>
-&nbsp;&nbsp; &quot;@<br>
--&nbsp; blr\\t%0<br>
-+&nbsp; * return aarch64_indirect_call_asm (operands[0]);<br>
-&nbsp;&nbsp; bl\\t%c0&quot;<br>
--&nbsp; [(set_attr &quot;type&quot; &quot;call, call&quot;)]<br>
--)<br>
-+&nbsp; [(set_attr &quot;type&quot; &quot;call, call&quot;)])<br>
-<br>
- (define_expand &quot;call_value&quot;<br>
-&nbsp;&nbsp; [(parallel [(set (match_operand 0 &quot;&quot; &quot;&quot;)<=
br>
-@@ -934,12 +933,12 @@<br>
-<br>
- (define_insn &quot;*call_value_insn&quot;<br>
-&nbsp;&nbsp; [(set (match_operand 0 &quot;&quot; &quot;&quot;)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (call (mem:DI (match_operand:DI 1 &quot;aa=
rch64_call_insn_operand&quot; &quot;r, Usf&quot;))<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (call (mem:DI (match_operand:DI 1 &quot;aa=
rch64_call_insn_operand&quot; &quot;Ucr, Usf&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (match_operand 2 &quot;&quot=
; &quot;&quot;)))<br>
-&nbsp;&nbsp;&nbsp; (clobber (reg:DI LR_REGNUM))]<br>
-&nbsp;&nbsp; &quot;&quot;<br>
-&nbsp;&nbsp; &quot;@<br>
--&nbsp; blr\\t%1<br>
-+&nbsp; * return aarch64_indirect_call_asm (operands[1]);<br>
-&nbsp;&nbsp; bl\\t%c1&quot;<br>
-&nbsp;&nbsp; [(set_attr &quot;type&quot; &quot;call, call&quot;)]<br>
- )<br>
-diff --git a/gcc/config/aarch64/constraints.md b/gcc/config/aarch64/constr=
aints.md<br>
-index 21f9549e6..7756dbe83 100644<br>
---- a/gcc/config/aarch64/constraints.md<br>
-+++ b/gcc/config/aarch64/constraints.md<br>
-@@ -24,6 +24,15 @@<br>
- (define_register_constraint &quot;Ucs&quot; &quot;TAILCALL_ADDR_REGS&quot=
;<br>
-&nbsp;&nbsp; &quot;@internal Registers suitable for an indirect tail call&=
quot;)<br>
-<br>
-+(define_register_constraint &quot;Ucr&quot;<br>
-+&nbsp;&nbsp;&nbsp; &quot;aarch64_harden_sls_blr_p () ? STUB_REGS : GENERA=
L_REGS&quot;<br>
-+&nbsp; &quot;@internal Registers to be used for an indirect call.<br>
-+&nbsp;&nbsp; This is usually the general registers, but when we are harde=
ning against<br>
-+&nbsp;&nbsp; Straight Line Speculation we disallow x16, x17, and x30 so w=
e can use<br>
-+&nbsp;&nbsp; indirection stubs.&nbsp; These indirection stubs cannot use =
the above registers<br>
-+&nbsp;&nbsp; since they will be reached by a BL that may have to go throu=
gh a linker<br>
-+&nbsp;&nbsp; veneer.&quot;)<br>
-+<br>
- (define_register_constraint &quot;w&quot; &quot;FP_REGS&quot;<br>
-&nbsp;&nbsp; &quot;Floating point and SIMD vector registers.&quot;)<br>
-<br>
-diff --git a/gcc/config/aarch64/predicates.md b/gcc/config/aarch64/predica=
tes.md<br>
-index 8e1b78421..4250aecb3 100644<br>
---- a/gcc/config/aarch64/predicates.md<br>
-+++ b/gcc/config/aarch64/predicates.md<br>
-@@ -32,7 +32,8 @@<br>
-<br>
- (define_predicate &quot;aarch64_general_reg&quot;<br>
-&nbsp;&nbsp; (and (match_operand 0 &quot;register_operand&quot;)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (match_test &quot;REGNO_REG_CLASS (R=
EGNO (op)) =3D=3D GENERAL_REGS&quot;)))<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (match_test &quot;REGNO_REG_CLASS (R=
EGNO (op)) =3D=3D STUB_REGS<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || REGNO_REG_CLASS (REGNO (op)) =3D=3D GENERA=
L_REGS&quot;)))<br>
-<br>
- ;; Return true if OP a (const_int 0) operand.<br>
- (define_predicate &quot;const0_operand&quot;<br>
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-=
bti.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c<=
br>
-new file mode 100644<br>
-index 000000000..b1fb754c7<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c<b=
r>
-@@ -0,0 +1,40 @@<br>
-+/* { dg-do compile } */<br>
-+/* { dg-additional-options &quot;-mharden-sls=3Dblr -mbranch-protection=
=3Dbti&quot; } */<br>
-+/*<br>
-+&nbsp;&nbsp; Ensure that the SLS hardening of BLR leaves no BLR instructi=
ons.<br>
-+&nbsp;&nbsp; Here we also check that there are no BR instructions with an=
ything except an<br>
-+&nbsp;&nbsp; x16 or x17 register.&nbsp; This is because a `BTI c` instruc=
tion can be branched<br>
-+&nbsp;&nbsp; to using a BLR instruction using any register, but can only =
be branched to<br>
-+&nbsp;&nbsp; with a BR using an x16 or x17 register.<br>
-+&nbsp; */<br>
-+typedef int (foo) (int, int);<br>
-+typedef void (bar) (int, int);<br>
-+struct sls_testclass {<br>
-+&nbsp;&nbsp;&nbsp; foo *x;<br>
-+&nbsp;&nbsp;&nbsp; bar *y;<br>
-+&nbsp;&nbsp;&nbsp; int left;<br>
-+&nbsp;&nbsp;&nbsp; int right;<br>
-+};<br>
-+<br>
-+/* We test both RTL patterns for a call which returns a value and a call =
which<br>
-+&nbsp;&nbsp; does not.&nbsp; */<br>
-+int blr_call_value (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; int retval =3D x.x(x.left, x.right);<br>
-+&nbsp; if (retval % 10)<br>
-+&nbsp;&nbsp;&nbsp; return 100;<br>
-+&nbsp; return 9;<br>
-+}<br>
-+<br>
-+int blr_call (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; x.y(x.left, x.right);<br>
-+&nbsp; if (x.left % 10)<br>
-+&nbsp;&nbsp;&nbsp; return 100;<br>
-+&nbsp; return 9;<br>
-+}<br>
-+<br>
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */<br>
-+/* { dg-final { scan-assembler-not {\tbr\tx(?!16|17)} } } */<br>
-+/* { dg-final { scan-assembler {\tbr\tx(16|17)} } } */<br>
-+<br>
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.=
c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c<br>
-new file mode 100644<br>
-index 000000000..88baffffe<br>
---- /dev/null<br>
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c<br>
-@@ -0,0 +1,33 @@<br>
-+/* { dg-additional-options &quot;-mharden-sls=3Dblr -save-temps&quot; } *=
/<br>
-+/* Ensure that the SLS hardening of BLR leaves no BLR instructions.<br>
-+&nbsp;&nbsp; We only test that all BLR instructions have been removed, no=
t that the<br>
-+&nbsp;&nbsp; resulting code makes sense.&nbsp; */<br>
-+typedef int (foo) (int, int);<br>
-+typedef void (bar) (int, int);<br>
-+struct sls_testclass {<br>
-+&nbsp;&nbsp;&nbsp; foo *x;<br>
-+&nbsp;&nbsp;&nbsp; bar *y;<br>
-+&nbsp;&nbsp;&nbsp; int left;<br>
-+&nbsp;&nbsp;&nbsp; int right;<br>
-+};<br>
-+<br>
-+/* We test both RTL patterns for a call which returns a value and a call =
which<br>
-+&nbsp;&nbsp; does not.&nbsp; */<br>
-+int blr_call_value (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; int retval =3D x.x(x.left, x.right);<br>
-+&nbsp; if (retval % 10)<br>
-+&nbsp;&nbsp;&nbsp; return 100;<br>
-+&nbsp; return 9;<br>
-+}<br>
-+<br>
-+int blr_call (struct sls_testclass x)<br>
-+{<br>
-+&nbsp; x.y(x.left, x.right);<br>
-+&nbsp; if (x.left % 10)<br>
-+&nbsp;&nbsp;&nbsp; return 100;<br>
-+&nbsp; return 9;<br>
-+}<br>
-+<br>
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */<br>
-+/* { dg-final { scan-assembler {\tbr\tx[0-9][0-9]?} } } */<br>
---<br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencie=
s-for-selftests.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-=
dependencies-for-selftests.patch<br>
deleted file mode 100644<br>
index c8960c6098..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-s=
elftests.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From b19d8aac15649f31a7588b2634411a1922906ea8 Mon Sep 17 00:00:00 2001<br>
-From: Romain Naour &lt;romain.naour@gmail.com&gt;<br>
-Date: Wed, 3 Jun 2020 12:30:57 -0600<br>
-Subject: [PATCH] Fix missing dependencies for selftests which occasionally=
<br>
- causes failed builds.<br>
-<br>
-gcc/<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Makefile.in (SELFTEST_DEPS): Move b=
efore including language makefile<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fragments.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp%3Dgcc.git%3Ba%3Dco=
mmitdiff%3Bh%3Db19d8aac15649f31a7588b2634411a1922906ea8&amp;amp;data=3D05%7=
C01%7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b908daca570ebe%7C353=
9451eb46e4a26a242ff61502855c7%7C0%7C0%7C638044772536973189%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000%7C%7C%7C&amp;amp;sdata=3DJdbuns%2FaI89VTFlRbTtWq70O08RL1CXoP6%2B4zCs=
tpzQ%3D&amp;amp;reserved=3D0" data-auth=3D"NotApplicable">https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fgit%2F%3Fp=
%3Dgcc.git%3Ba%3Dcommitdiff%3Bh%3Db19d8aac15649f31a7588b2634411a1922906ea8&=
amp;amp;data=3D05%7C01%7Cranjitsinh.rathod%40kpit.com%7C9a1d9cf4688c41c7d4b=
908daca570ebe%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6380447725369731=
89%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DJdbuns%2FaI89VTFlRbTtWq7=
0O08RL1CXoP6%2B4zCstpzQ%3D&amp;amp;reserved=3D0</a>]<br>
-Signed-off-by:Steve Sakoman &lt;steve@sakoman.com&gt;<br>
-<br>
----<br>
- gcc/Makefile.in | 6 ++++--<br>
- 1 file changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in<br>
-index aab1dbba57b..be11311b60d 100644<br>
---- a/gcc/Makefile.in<br>
-+++ b/gcc/Makefile.in<br>
-@@ -1735,6 +1735,10 @@ $(FULL_DRIVER_NAME): ./xgcc$(exeext)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(LN_S) $&lt; $@<br>
-<br>
- #<br>
-+# SELFTEST_DEPS need to be set before including language makefile fragmen=
ts.<br>
-+# Otherwise $(SELFTEST_DEPS) is empty when used from &lt;LANG&gt;/Make-la=
ng.in.<br>
-+SELFTEST_DEPS =3D $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftes=
ts<br>
-+<br>
- # Language makefile fragments.<br>
-<br>
- # The following targets define the interface between us and the languages=
.<br>
-@@ -2010,8 +2014,6 @@ DEVNULL=3D$(if $(findstring mingw,$(build)),nul,/dev=
/null)<br>
- SELFTEST_FLAGS =3D -nostdinc $(DEVNULL) -S -o $(DEVNULL) \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fself-test=3D$(srcdir)/testsuite/sel=
ftests<br>
-<br>
--SELFTEST_DEPS =3D $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftes=
ts<br>
--<br>
- # Run the selftests during the build once we have a driver and the fronte=
nd,<br>
- # so that self-test failures are caught as early as possible.<br>
- # Use &quot;s-selftest-FE&quot; to ensure that we only run the selftests =
if the<br>
---<br>
-2.27.0<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/=
gcc/gcc-9.5.inc<br>
similarity index 89%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3.inc<br>
rename to meta/recipes-devtools/gcc/gcc-9.5.inc<br>
index c171f673e9..6a0a892b10 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc<br>
@@ -2,13 +2,13 @@ require gcc-common.inc<br>
<br>
&nbsp;# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;9.3.0&quot;<br>
+PV =3D &quot;9.5.0&quot;<br>
<br>
&nbsp;# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;9.3.0&quot;<br>
+BINV =3D &quot;9.5.0&quot;<br>
<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3=
/backport:&quot;<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-9.5:${FILE_DIRNAME}/gcc-9.5=
/backport:&quot;<br>
<br>
&nbsp;DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot;<br>
&nbsp;NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native&quot;<br>
@@ -69,14 +69,9 @@ SRC_URI =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch"=
 data-auth=3D"NotApplicable">
file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch"=
 data-auth=3D"NotApplicable">
file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch"=
 data-auth=3D"NotApplicable">
file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch</a> =
\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0040-fix-missing-dependencies-for-selftests.patch" data-auth=3D"NotApp=
licable">
file://0040-fix-missing-dependencies-for-selftests.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch" data-=
auth=3D"NotApplicable">
file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch</a> =
\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch" data-=
auth=3D"NotApplicable">
file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch</a> =
\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch" data-auth=3D"NotA=
pplicable">
file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch" data-=
auth=3D"NotApplicable">
file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch</a> =
\<br>
&nbsp;&quot;<br>
&nbsp;S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
-SRC_URI[sha256sum] =3D &quot;71e197867611f6054aa1119b13a0c0abac12834765fe2=
d81f35ac57f84f742d1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a9=
27ce5a0a2915a95cf8f&quot;<br>
&nbsp;# For dev release snapshotting<br>
&nbsp;#S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${REL=
EASE}&quot;<br>
&nbsp;#B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}&quo=
t;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-direc=
tories.patch b/meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-dir=
ectories.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-direct=
ories.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-director=
ies.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAG=
S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSRO=
OT_CFLAGS_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.pa=
tch b/meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.pat=
ch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch=
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.pat=
ch b/meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patc=
h<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-9.5/0007-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0007-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-ha=
ck.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-ha=
ck.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-hack=
.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch<=
br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch<br=
>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-A=
BI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-AB=
I.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
1-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0011-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-t=
oo-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argume=
nt-list-too-long-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-to=
o-long-error.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argument-list-too-=
long-error.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch b/met=
a/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch b/meta/re=
cipes-devtools/gcc/gcc-9.5/0014-libtool.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0014-libtool.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0015-g=
cc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0015-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
6-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0016-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-9.5/001=
7-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0017-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch b/meta=
/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-heade=
rs-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-ta=
rget-gcc-headers-can-be-included.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-header=
s-can-be-included.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-target-gcc-headers-=
can-be-included.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-wit=
h-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
0-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0020-gcc-4.8-won-t-build-with-d=
isable-dependency-tracking.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
1-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0021-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
2-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0022-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for=
-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-suppo=
rt-for-musl-ldso.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-=
musl-ldso.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-support-for-mu=
sl-ldso.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-f=
ix-libcc1-s-install-path-and-rpath.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-=
for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sys=
root-support-for-nativesdk-gcc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-f=
or-nativesdk-gcc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sysroot-support-for=
-nativesdk-gcc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
6-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0026-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-=
and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-va=
rious-_FOR_BUILD-and-related-variables.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-various-_FOR_BUILD-and=
-related-variables.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-9.5/002=
9-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0029-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch b/=
meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-9.5/0031-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0031-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
2-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0032-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-=
musl.patch b/meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-=
musl.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-m=
usl.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-mus=
l.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-=
in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
4-fix-segmentation-fault-in-precompiled-header-generat.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-i=
n-precompiled-header-generat.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0034-fix-segmentation-fault-in-=
precompiled-header-generat.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failu=
re.patch b/meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failur=
e.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-comman=
dline-options.patch b/meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-s=
pe-commandline-options.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-command=
line-options.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-spe-commandli=
ne-options.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-ze=
ro-value-in-simple_object_elf.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
7-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zer=
o-value-in-simple_object_elf.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0037-CVE-2019-14250-Check-zero-=
value-in-simple_object_elf.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-no=
t-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
8-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not=
-use-__LINE__-for-maintainin.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0038-gentypes-genmodes-Do-not-u=
se-__LINE__-for-maintainin.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Do=
n-t-match-user-defined-regs-o.patch b/meta/recipes-devtools/gcc/gcc-9.5/003=
9-process_alt_operands-Don-t-match-user-defined-regs-o.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don=
-t-match-user-defined-regs-o.patch<br>
rename to meta/recipes-devtools/gcc/gcc-9.5/0039-process_alt_operands-Don-t=
-match-user-defined-regs-o.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb b/meta/rec=
ipes-devtools/gcc/gcc-cross-canadian_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.3.bb b/meta/recipes-devt=
ools/gcc/gcc-cross_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-cross_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-cross_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb b/meta/recipes-d=
evtools/gcc/gcc-crosssdk_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-crosssdk_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb b/meta/recipes-de=
vtools/gcc/gcc-runtime_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-runtime_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-runtime_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb b/meta/recipes=
-devtools/gcc/gcc-sanitizers_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-sanitizers_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.3.bb b/meta/recipes-dev=
tools/gcc/gcc-source_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-source_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc-source_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/gcc_9.3.bb b/meta/recipes-devtools/g=
cc/gcc_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc_9.3.bb<br>
rename to meta/recipes-devtools/gcc/gcc_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb b/meta/recipes=
-devtools/gcc/libgcc-initial_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/libgcc-initial_9.3.bb<br>
rename to meta/recipes-devtools/gcc/libgcc-initial_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/libgcc_9.3.bb b/meta/recipes-devtool=
s/gcc/libgcc_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/libgcc_9.3.bb<br>
rename to meta/recipes-devtools/gcc/libgcc_9.5.bb<br>
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.3.bb b/meta/recipes-de=
vtools/gcc/libgfortran_9.5.bb<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/libgfortran_9.3.bb<br>
rename to meta/recipes-devtools/gcc/libgfortran_9.5.bb<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_--

--_004_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_
Content-Type: image/png; name="Outlook-ktbs3pv4.png"
Content-Description: Outlook-ktbs3pv4.png
Content-Disposition: inline; filename="Outlook-ktbs3pv4.png"; size=22485;
	creation-date="Sun, 20 Nov 2022 04:39:57 GMT";
	modification-date="Sun, 20 Nov 2022 04:39:57 GMT"
Content-ID: <7a6bfbd6-16ab-41ef-b0c7-278ceb6873a4>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_004_PN3PR01MB738243B84D54DF57CF62C0118F0B9PN3PR01MB7382INDP_--

