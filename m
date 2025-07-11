Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5366AC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:00:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.19])
 by mx.groups.io with SMTP id smtpd.web10.17625.1752249633758111605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SbeXiyFW;
 spf=pass (domain: siemens.com, ip: 40.107.130.19, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTaOf7czlig551c/kjRWO6Qa2qMzfmVNfgnoxPW8LLIODY0xH81+iK1p6SQZV0b9Xq9OVG0/42pLR6M4HdkA1QGP57KtS6eFbBt1oOLyaweDdo7vSeKSCfGLNQqBvPXaM2yj5qCOGXDkAy4cR7gzMahWkdCsUCh8OkjQbiEzmq6y0xvgUPWRKXk+fQdmyFnwcDCYezxblwZX55oPtt4q/bglLjFl1kKly9YVv7jCz8LtW+kxVxJGYaaj9GOXy96jiLLSh+OPfeathOhyvo6TIteqwpgc2Se1yFmlFyKfiibqOTZy/4ifHP0RzxrLV2XwDvy6ha6YFKJX8tpj/SxmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvyV/4N7uTKG6Fr56wOn9+uj8JUJcRC8RvOyx357o+k=;
 b=qhHlROJBtmajQbqR26kNcvcDTsQUzyYzbLwAivDBiMjUUPN8P6UhCkqTXMoy+9u7RBESbXmO+Ly0GgtTIzLv40/yYyd+DwJ6JtyHEPy25MaG086Nf4OLgX7lhi+JgrS7AROWDCwGNTA7ekXfJp8dILh3vF/drRPOkkEEYJHCCyDKIug1+J2la48rmvqcFDqHJKs0P3prLTwcZEUFz3riXNFKRy2iCeD7SQMqfu1FUEGXi6PI8UiB5skydAdN+aRdgJveMmmr44/M/Z6wfAfguiR7eh+FTz/7MFdNv9hKWKcIqph+qj3FFTY/un6zG0Mvn7muUhXVaaoPbTfl+lcOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvyV/4N7uTKG6Fr56wOn9+uj8JUJcRC8RvOyx357o+k=;
 b=SbeXiyFWppAPjJ8oK3ouaYxXbH4vpe02uB0K+T3DGHdRWp72Q2PVXK77zA16TvyXqZ4EXT4fdBk3ZmFjkaRE8jXCcpZUNPV8gMtUlGb4Al8HZZUb3dEHMkvH/amPA/64MUsm/AwaF5Ba7d3xIygLV5BlgOHCDeoQmeW0JYPvjRZA0p9PqI0afy9xrX4+EzkPcv1nMS9t4e3D5X4GSjY/8JxAWBsAR4tRG/f9wB2E29CNPCZttIIqw0+HbWStTYt7vPJ6h+UL9BxkNnCROgrmj7LVvGRYR+4dD9G59VMy+RO0lIIfGEZT006xAdDy+kUFnMJyFFQiEL2iw5BoGlA7DQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7973.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 16:00:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 16:00:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] clang: move BPN assignment from common.inc
Thread-Topic: [OE-core] [PATCH 1/3] clang: move BPN assignment from common.inc
Thread-Index: AQHb8nvVRfwqkA0ro0WSvBhAWgWGF7QtFNlQ
Date: Fri, 11 Jul 2025 16:00:30 +0000
Message-ID: 
 <AS1PR10MB569787861143B77367CF75B2FD4BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250711155136.2172651-1-ross.burton@arm.com>
In-Reply-To: <20250711155136.2172651-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b7d93adc-2754-49ca-9489-09c6825eccf3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-11T16:00:23Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7973:EE_
x-ms-office365-filtering-correlation-id: 6e68a5f2-15f0-412c-3de5-08ddc0940f5b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?bPzg258huVGjG0+6GHUGkzGFpQM9roPRfxnnFjleDDW5pJYVAymtxDSZwaio?=
 =?us-ascii?Q?2d5PVSwxajrjUq1jtHnEl1UPtMD1rrBtF6VhJx8C/XX52gzryF0W3CYiodxr?=
 =?us-ascii?Q?SksVPLpNyyxMBpeftMFflEuA0cr30DDbG/QoOpPctdtEeFmjDkXyUnVOgpbS?=
 =?us-ascii?Q?QXEnnYPYZXt7SamICwEB3iLCzwgXIgT1vVWWs3e0DTY7isC4juQ5UHkJNHdt?=
 =?us-ascii?Q?QRXTDT55pUkbc8M2RXo1QzpgtyXIyTZYrUn9pc7qXzA6euSLvnsQu/iN0dFQ?=
 =?us-ascii?Q?7Y30hRpKJgOA8sji/OK1Ww1bLkUcIWlhdTn4Bep/8lnKiOrJ1SXC1GRm4HCI?=
 =?us-ascii?Q?JMfmktfhtE0mcZXgflpsyPbJ3hu3ZafRpd+1daLLH2k06ZhAGE3pzXtd8eap?=
 =?us-ascii?Q?nUIb2Nye+OeiXvMXiOI5Z2VSM5AWDkq9iv1XrItrnefV2wOSCLJbJLZ9YggK?=
 =?us-ascii?Q?DNPDCw8jCP02FTaFDFJGxuNVwWEH2+AS0kDcnRiC9z3T870a/YZu3i36F5FB?=
 =?us-ascii?Q?zlMyfaE1Fk1ASSQBHfb2D7T6Mxh7euAQfmswxqw0qEIC00kAy1J+bsi3RINm?=
 =?us-ascii?Q?bAHEA8oe3/x6E7s65UBKzsWWcflYdtjxcZf5x47gwOT1lyrOnpCJVV2b3iRD?=
 =?us-ascii?Q?+xw4u7tRxzFEYqGeihWgazEcLV0wixLox3fObLKFdlRIqHTzXOqMDgX6MJsX?=
 =?us-ascii?Q?r+XIrZV1rYmBipBGkmcQvo7S3mg3Hfw0htBNFTqx6aWprH4G/8uvOckp0Xwn?=
 =?us-ascii?Q?w3oseNoDmevxxjLsOED3Po94+mpwJmh+RyGAxobiqtfMiVHQfmEIiFwB7zIW?=
 =?us-ascii?Q?GB1zDPapE6xEpdUzRhNWebhvxbrm6UHc+K6fia4NJ+m8aLo5256nVsK8DDrm?=
 =?us-ascii?Q?a27FR1eKcahq3CE4v36Ztzsq2Idydjruf6gorNCLjgySZVr3QoFUF4z6ExWc?=
 =?us-ascii?Q?HJCPjA/6MfQqbcAtk0fyaVJojDXd/posJqUKYPjBzypTr17v/p0ZsWfhanIJ?=
 =?us-ascii?Q?er4mgT/Q/ZH/8oLrSPPb001kgf0/rEDLn9L8h31uT0FEjDaLpgKX5j2ssCNI?=
 =?us-ascii?Q?8/7umQkMjc0RxSner2euiZgC2W0Bggx/m6oJmzp65zXjjUiioZLdUp86XD9c?=
 =?us-ascii?Q?8NjxMFkDIolIOjO30v+rt/3l5mM3rQ83PEKAT6rtwtmEF/slP+1GpwctyPZS?=
 =?us-ascii?Q?VsO51RbDa1MO3561jYpEgs7uLUFemsjvKIFgGngDhvy+RY51B++O3BpmSIqQ?=
 =?us-ascii?Q?l/Fg2hFFt55nHb4Dw7hHa+vvJownEbMUkroeFRi0QRH8G8QOsog234cB5gPJ?=
 =?us-ascii?Q?os/5N75IATDLkIBmmWduGQaNPDXFV59wUMxSzzlErVOrpQDQH47iJfw+hpa9?=
 =?us-ascii?Q?A3oHdGq9PK+D8m/SNi8wIhvSlSnW3qQ4EQWYry7mIANRAhy+ueRZgzQdTr82?=
 =?us-ascii?Q?ko4ZHGwwhQhkqee7JqjKrReiVH43HcQUeXmGN/YBCwEj1FV+sEP39lDqDl3w?=
 =?us-ascii?Q?37Ideg30Lwf3JdU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pxJKOmK84KfRwdDW3Nx6dwE9FePnPFaJbdSaqTMZAU5/VP+lppIcVcNWx9+f?=
 =?us-ascii?Q?HENOxSIBKMT+PVKvRpA+fAkk4FD//1z+VGakSSmgyrMs8cunHHb1YnDfwRMS?=
 =?us-ascii?Q?0VACb1Ox5DeGlyVEnLQtnkeePuGSf+tx6YbzUEVngYfQwMscQsaMP+/mLvwY?=
 =?us-ascii?Q?DKnbHrlI5x+UQj/rI3I+x+NPuFTkRtXfehVuCmVvBPVMSAQlCSqOOoEUOzyl?=
 =?us-ascii?Q?fXo/QSxmtsrfE779cy6UPjD7Xi6Hspr5dfheCCauEO6ePGZQpT2MkyZtY/ZU?=
 =?us-ascii?Q?jIqOptNc/WCqj+Qc4Jd53827RWCHQuOmiCnRR1SBTYoAIR3vQl4FFATbBUxz?=
 =?us-ascii?Q?IQgbAVK/jyu2IXd4ZKFnaKJexIkh6ABZTLAxTAmQIblJgrWqskS5v2sj4cnL?=
 =?us-ascii?Q?k2Y4SyjvTI90xqKShTCTWLmKQ2kk465mpriAlhRaJeJqEVJEhQZWVfkEihmK?=
 =?us-ascii?Q?KElBiOwwzED+BYdfWqFY7AzxQfiwI/JjX27rhVXqlBdCYhNZH1aBvvuINgAq?=
 =?us-ascii?Q?enlSRyKoZZnrZxEu6iZofmB184kR6Kj1CrrXEp5UVoMOCX5Rv3ocaPn1Ff/b?=
 =?us-ascii?Q?6aWbuhf17PBQYirbD/vbHv0Tp0g/04SkMMB1o6PGFHFQ/qErA6dq/tcZVCXZ?=
 =?us-ascii?Q?7sSB/RbRafX2/H33HW0O0qL4x7I6V+dtGXdz9HJKrIDBQEAfuQu5do/CZtnQ?=
 =?us-ascii?Q?TV50JigKwQqJTky6ckkLR3WeiVPAvzCo0SwwtC36IzFRBqIP8Yv8q4SyMUxu?=
 =?us-ascii?Q?6QQI6ij9BTvMC5I27kY2Tf+be6bEWJHgwj1RHblFucWnNySGwa/GD0j+hh8r?=
 =?us-ascii?Q?80RED3OrCtB01/xdiTqUcKGhht9rvoVliRZjWLSdzVzjRUg5Bl9nylcSXZOS?=
 =?us-ascii?Q?xbIat3uJSTzuvRMSmw/pCxlKgxPxGIhna6UKl9gN6Q2DODR3+e60L5JNtEUm?=
 =?us-ascii?Q?wcPTNbdEv+Cl9ywHe0735gfvxRhIOQc+ZOILEcqCdpcp7ilJPuzAbYJJAwEV?=
 =?us-ascii?Q?rQAiBFlAAzEuJa9eIWYdM81nMk7OlHoiLcKiRCYtH/ApG73vvnokVU/qen0i?=
 =?us-ascii?Q?M1vHZ+3DF4Hc3UQNykp8px7ZJpXFnVBTcEcCGBER9ohV2TXgt+Z+9PSF7l7F?=
 =?us-ascii?Q?Jt1r5ArSNJ4+Q3zvSmXSSYBQLbWAn/RBBbnja5FL1Pag7dXhQpwDGqNYHCwv?=
 =?us-ascii?Q?hes2wSGyhi3KWiXHFBHlrk7SLygfHqD2U1CajMW1n9kmgPSQGa5Zm7DbX3/H?=
 =?us-ascii?Q?tktPlSJFD9dSIHu/tSCEBDYUuHIDmyoBI+weyhpkwPzzno+57SoSvuHMnzJ/?=
 =?us-ascii?Q?cSjpeBfjEVhaU/TlWQ2TCqOTGW3y9hDkldTV3hrvgYOFUJd0QWvJFBEijfhR?=
 =?us-ascii?Q?l6GCDdo6tMHJpbcSOrnCw/1oQiE3jBBEGTC7q7ESZblhkKXgiCQENVBiU918?=
 =?us-ascii?Q?zEJk0LkWX70Oxt0bQPK/GqltftwfxlgI3gkK/Z+UKqJQd1faDWN6hbgccaPz?=
 =?us-ascii?Q?Ys6DJ///RbElXtB/GjYh7auy7x4/Aos88xENf0xltLU0mSIFRzgwzDJd/IMh?=
 =?us-ascii?Q?Y6AoiNoHPmbwAgRMPHWHYdoykKDgBqezf1u63zgG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e68a5f2-15f0-412c-3de5-08ddc0940f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 16:00:30.1600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOXQG4yjNL6Jz3QYFtALoljk3zo3mcbcZuk2nZKBP4mfp5VjI4Uv0gHwNV5Je/7/xVX3raICOp4oY31Fs1jGXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220148

I think that the inc file should now set CVE_PRODUCT when we remove the BPN=
 assignment.
Having a recipe based on clang sources without BPN assignment would mean wr=
ong CVE stats.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Friday, July 11, 2025 17:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/3] clang: move BPN assignment from common.inc
>=20
> There's a BPN assignment in common.inc which means all recipes need to
> either be called clang, or set BPN themselves.
>=20
> Move the assignment to the clang recipes. For now I'm leaving the
> existing BPN assignments in the other recipes, in case there are complex
> multilib-related reasons to retain them.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/clang-cross-canadian_git.bb | 1 +
>  meta/recipes-devtools/clang/clang-cross_git.bb          | 1 +
>  meta/recipes-devtools/clang/clang-crosssdk_git.bb       | 1 +
>  meta/recipes-devtools/clang/clang_git.bb                | 2 ++
>  meta/recipes-devtools/clang/common.inc                  | 2 --
>  5 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> index 456c0d61bc5..0e84d3ac9a3 100644
> --- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> +++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;
>  SECTION =3D "devel"
>=20
>  PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +BPN =3D "clang"
>=20
>  require common-clang.inc
>  require common-source.inc
> diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-
> devtools/clang/clang-cross_git.bb
> index 323cc0d8809..99e48522a0b 100644
> --- a/meta/recipes-devtools/clang/clang-cross_git.bb
> +++ b/meta/recipes-devtools/clang/clang-cross_git.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;
>  SECTION =3D "devel"
>=20
>  PN =3D "clang-cross-${TARGET_ARCH}"
> +BPN =3D "clang"
>=20
>  require common-clang.inc
>  require common-source.inc
> diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/rec=
ipes-
> devtools/clang/clang-crosssdk_git.bb
> index ef162ef153f..234d4635784 100644
> --- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> +++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;
>  SECTION =3D "devel"
>=20
>  PN =3D "clang-crosssdk-${SDK_SYS}"
> +BPN =3D "clang"
>=20
>  require common-clang.inc
>  require common-source.inc
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-
> devtools/clang/clang_git.bb
> index 23dfbb5deb6..2b5d3a27524 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -17,6 +17,8 @@ SECTION =3D "devel"
>  require common-clang.inc
>  require common-source.inc
>=20
> +BPN =3D "clang"
> +
>  INHIBIT_DEFAULT_DEPS:class-native =3D "1"
>=20
>  LDFLAGS:append:class-target:riscv32 =3D " -Wl,--no-as-needed -latomic -W=
l,--as-
> needed"
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-
> devtools/clang/common.inc
> index 37d37ec1975..a9d6f899c03 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -71,5 +71,3 @@ B ?=3D "${WORKDIR}/llvm-project-source-
> ${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>  # The real WORKDIR location isn't a dependency for the shared workdir.
>  src_patches[vardepsexclude] =3D "WORKDIR"
>  should_apply[vardepsexclude] +=3D "PN"
> -
> -BPN =3D "clang"
> --
> 2.43.0


