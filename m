Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5ACE6B25B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 23:43:09 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91444.1766446982264871358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 15:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=IxyY5nJN;
 spf=pass (domain: nskint.co.jp, ip: 40.107.74.95, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUCgaKE0PVGThg/P4C7g1K0W6albf5fa4NnfB8/WLE8e+8XngVOtENjmjJb9o9xMbgfY3fkPXGuoTqzbTtZIQl/Vlw1cdHF1U3jDEzNsWrwB1FEEZLQWILYuy4v1vhJIDnwsCsbt8Zcd+YOJxpGkoDGgz9MVmRC0IP6jn5D1gsnwker4cRlAPa4mZo312IRoxgEChysAl+LJEFChcFcyqVSYi+2msPWDIHCz/bbc22UjmrhQfT2z+mwWuiqF6xhlgJuWqQ/50UeePEczDlasbPBLaQ4IbGfh7X555Esr0cNOZANm9o7VmIeuDeE5i7PqHU6BmaB3iQr8MpzS+71iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPGusGUibtjN6Z3VBPtx9PSJgArkHV35xgVDCcrpMkw=;
 b=sQ7IzuccNNuJiQX1M1Jx0ovcd6iv4zdIihgFxBfn6gVwVaB/iiQ6r3hkCBE6lADjjoypKN5J/iJvo05u/3+6KFrg9KPLbPTF/3x+BAZQHs4dE53olUVEVbAJlRBPPPvzpouFB1TPEq0l0r1rfE1kap6zUu0zaZZZ2kmNwS6x/qe9dB3IHnkx9lo8MbhmwuLMQwnKl4khG5+f+aYpjqF3t4MLqjxSu3nIO1tIs2bZaD5Ops6pe9r/4EgVG/gcbzWfvcWS+ip/Z071HtoSbbJufz31ocmxrB8iU8foWE28/jeaa20iKah/yemiXEVilK17M3g9/b5J5wuH7Sug2tDFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPGusGUibtjN6Z3VBPtx9PSJgArkHV35xgVDCcrpMkw=;
 b=IxyY5nJNmsd5Gl2h29UKrbxtWG0r25HhKicLVDO9Ap0ckBIx1wYLRXj3x3MmZQzAIhyWY8SxEhMa8X9VEvRBfUiqj13+20irbGTU/H+re/P5I0PQF2kOAQ8Z1BOXspmNM3R/aWJIEouc1opJv8N/Do3MAP/e1+ThrEPIdPIysfc=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by OS9P286MB4205.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 23:42:56 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 23:42:56 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>, Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Index: Adxwm3RV7PLHzcUFTp6yQbLT2jCIAwC2WhaAAAnYezA=
Date: Mon, 22 Dec 2025 23:42:56 +0000
Message-ID: 
 <TYRP286MB599533590493E542023BD4C5DBB4A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
In-Reply-To: <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|OS9P286MB4205:EE_
x-ms-office365-filtering-correlation-id: 16c566d0-2ff2-4f9b-c0e4-08de41b3d54e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?i7BqzqcjAn/ymz2C3tusOfv7QS0Nmlo8j4rMJ8LbOPMG0shWq1RVQkqc/1j3?=
 =?us-ascii?Q?tDbEWpXBjCBd7+/eFD0g36UoVlmDi1kOWVZyqUp/8w9hHiCl5x03O1a1m/I7?=
 =?us-ascii?Q?lnLwZW/cWOYxcr1P4dfzOfGym4o0sbWxi2csh+Kbv4BRsFkvjn8ITyB0LNjG?=
 =?us-ascii?Q?PClA5Jrq9rhpQeTUrA5VB7yLsOvNkV0YS1Ah2cP66d1+NN/jR/7UMlstLEhI?=
 =?us-ascii?Q?cshI0xLyTEwuAc68sIqnp1CqkARlQQnRqyLDmCXEgeUitVXSNeM0ij5q3YGb?=
 =?us-ascii?Q?9PinG7B9HKFxrZftoH5ulzlTxSuOsE+Z3+7LqbLCRy0qReQPflA4Dmswh8CI?=
 =?us-ascii?Q?vI1vhG7e3IhMyIqRPIDlhIbhx3ZHAIcvq2viJV8PmNQfjnCz0HPoPHFowWHW?=
 =?us-ascii?Q?Zr9zyftbQAiO+RC7nc+np0RG+oDWfh3tPNnZThSp0Nrj+HqSMc6cJOFx0S/K?=
 =?us-ascii?Q?lx3kxCzBlo4AWjfmhqhXu9NiuVkeLtIXF5xUtjuPnS09Pc3TqWE0K8mxRGd9?=
 =?us-ascii?Q?D1wdlp/5w72/H5vnrgC/EcgVvIJRiE0XWCyqkW3IvpGFOuHB02xX4rhf+Tqq?=
 =?us-ascii?Q?yFxl+0Cml3yl7+e4X90beLP476e9/c12Lk6ELEJXochFWcApDkF3a+xgUBg3?=
 =?us-ascii?Q?NF1AzFa2CuhmB0eS2U8RGQ0YjXCAxI3LtxKZVSJE1tEbps9QbCtkkP+D4BsO?=
 =?us-ascii?Q?/uDIvhgdHuBs2bfup8tTmPa4r+XDqlf1OmGCZYCJIbx6E1SnqIPmfw8CRtlP?=
 =?us-ascii?Q?Mb1uVkXN9VcMCUd1ErHwncLd1KwnhVbio2AEPchR9WBFjWKEldTtSgjOgkNi?=
 =?us-ascii?Q?ERvhMv8hWi8+eVrnvzL/Nwk6OGbQcj5EkUjPtH2Ka8D1d61Y6SNF3AV5j5Gj?=
 =?us-ascii?Q?IHCDAo7KjHK/jfSFwZwHkSLk9UAlOOnHusk+5HPMBX/jVN9cn4s8EtRZkJKo?=
 =?us-ascii?Q?WWOBHq89YX7u/WD9kyziiWVxjqRnWUGajRlRFeXAq0mwH3n7qkCZVm4D83vf?=
 =?us-ascii?Q?J0WIeeSXUngGJgIRRPyjcfz9+1IqqcEuqix89LJPAVHU0g0I/jVejean75UG?=
 =?us-ascii?Q?WLwdMtTOvhEamRei3RApt682zMd7GL8cG5UAdlvV7nPQkZ+X8+sbY9nMA6KD?=
 =?us-ascii?Q?YXWrhjkN9+30/hpTpgXH3IKhMjaDM0jQ3mTJWEBd3fVHunh53jrX4wNPpd1d?=
 =?us-ascii?Q?xw4APOgISjMerD4CkiMKcOKmxFmPcFD2DGxgF39NDyOaqP7teJld2xU+9k0T?=
 =?us-ascii?Q?8Qg7If9lO8IE72OUQY3yLKgYxAvjhfWUtQEbqY1cwyETdCQTuH+otC94JoeT?=
 =?us-ascii?Q?gpYTv9oHbaK7oNAiquXoxWtTtpD3eUXtbLzr+6JsahQC9xPyGMVT7587qwgx?=
 =?us-ascii?Q?fT0n2KASj03ehdkT95GqB6U8XtG+TfstQeizSX9Bk5Zw070b16VX2I8QnTek?=
 =?us-ascii?Q?IVXM0vFOgfEW6BZs7pS1p9zhHFzF2CzoNZbIqX0DcaVDtPJwMOaU18U98XWY?=
 =?us-ascii?Q?Bxj5/GgFu/RI8x++Eye9tPjuVils+af/gQV+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(13003099007)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tp0P0S2d3cNeC/7b6m0GvIeyh89vavb25wbQLkN6IQCIqAZB8tNh/0l1Txhv?=
 =?us-ascii?Q?XU4RkcE9jW3HwADT0pt/iL8+zPdiCLPelDImNxAqDtCXWCTtV5dHyMm5ao9y?=
 =?us-ascii?Q?YxC8FIRm36hE/+lioBLuK2rnyrSJwvSWxQXaETSF6/dYpFNd3mZGJJZAq8Gb?=
 =?us-ascii?Q?6xIKJYdwnHJnRzHQUIQSBU44xV/UN1FfrlpmdXh/5VfNaPalI33r4DSpBobV?=
 =?us-ascii?Q?KvNyQnh3c8ZXA2BfMLpZ55Ahif61oiKkzG7S3WO/Gf116EuSWfyggkEtNPwa?=
 =?us-ascii?Q?8cxolYf1BTfbaizsrq7kLAaE9/0eHg+6wQIRg4B5Fu6A5YxurvuTmUEIWX1Y?=
 =?us-ascii?Q?GDcJo8yTlg3AG85eo3ib8lQwA7MyVe9tf/e7i47ScAjajXBID1mjLXoJdVrn?=
 =?us-ascii?Q?wEZDpptAZjcOFhkxmNvYrQaXp3+unbyqBTGnWXHKmqy0kk+TNsSUyMg0dXVQ?=
 =?us-ascii?Q?1tUF1B4CGInvoa7sFUHIp39z42PwMBBcJubyfrTOiP4n7nO8V0wfzAZQaBdv?=
 =?us-ascii?Q?eqrP9diR1K7P4ZcMdIju2hTcTWN++ZO2vEpAKN0/jjmXnmQ0xro76PU5B+iP?=
 =?us-ascii?Q?EErQGwxvNjP1OYYjjWF9AqWrsXKDDLhJ7fFGmn2pZlN6GAnX19hVpUWA1i/L?=
 =?us-ascii?Q?DtGKbIb6yA95WhK5cj6Uig58Knok4ovXy7NDLuy5ilK+HmRov99tkfXgFQg9?=
 =?us-ascii?Q?5VnzR16yWu4E8MwTEAa7cNJM0FkbXktV+c15KEr0BXMkN2oDjz2p7dzZ+RPu?=
 =?us-ascii?Q?43NY6UCI/okXHAOEG1T6igpRzTP+dAIl003Axl/Z0CeZ8ewfprfiYUWTbFMN?=
 =?us-ascii?Q?mjly1M7XPBVIiK1MRIg6aY5yVUjUmzel4R3jnZrETi7A9kfyN6+wc78f5gUc?=
 =?us-ascii?Q?41cp41oi/K4Ieb4zn+ufXSRn+Ig7YhKunE/1mmH2mGJKhbKHdzxhuMTOMwD8?=
 =?us-ascii?Q?Jr+rqV/AJ6osMNYZsGOQwq547jJvKO+xxnSmQ/XaI/JLWzmR6rt19yuPNZWx?=
 =?us-ascii?Q?sC9eN0iwDoEowi7cfhuiFxD1/WSAm5IpT342AYlbmx8C4jbig9hur90Qzu/F?=
 =?us-ascii?Q?t4ToVH/gTq7fiq22bswVErBgaQYniDGlK/9e9W5PmqJQawg53+Zz4+tH4dmV?=
 =?us-ascii?Q?GD9JpgoneEksuv6XY57O1ibcMxve6hzRl+bNMgEKZ7TYCK1zg1U0DQnDtkPy?=
 =?us-ascii?Q?8/nnDV7F6wonAriLSkMRYKf0Vj0uNPYq9MFfPO30ZYBzELuJ1ZhTIIId+Z2+?=
 =?us-ascii?Q?Unaz/7d/6FfQwihBYarRXdp4Zx3c4W/UilWtHAWqLc+X0QdgQQLSHqj9jkFs?=
 =?us-ascii?Q?4wxgtuINzrBPohUn+eiyJZjKQNVUYnV95dfZWLu2M9/oauCxmksJnT0ULHAP?=
 =?us-ascii?Q?nPNCAhb2apNwFs7jvris6bbS/aEaFTmURD4rMaPV7aSm5mEZhJicXrcdnfB1?=
 =?us-ascii?Q?IZmYArLNxqgjBEslMl5gzEMHa1dwfpK7brMMVFzIdoSXewz/XpLo4TmtDKi4?=
 =?us-ascii?Q?oQYtTJfEAdNMFDJC8PMUdQAKULGukFrHXt8en4r5GIz3gYsNKUohsTXtsgFF?=
 =?us-ascii?Q?I0v2cVe2Y44gpN2rPaNqvjrTtayOoQgupX0HfRBGwts6rUdjQEG7czisTPQC?=
 =?us-ascii?Q?qTklOWWeikQ3v2BlBwlnzrarjHl7hPyJvBRgij5C38HiHKAaDMMHtFlVJDGP?=
 =?us-ascii?Q?GiHzUy8Vgy0LB+5q0KuSCL6WJBIkTN5KSR/f9ldKdImSEDQqvnY7I0+Mo1EZ?=
 =?us-ascii?Q?31RCd/+lrw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYRP286MB599533590493E542023BD4C5DBB4ATYRP286MB5995JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c566d0-2ff2-4f9b-c0e4-08de41b3d54e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 23:42:56.6652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sk6r6WV9T6pjyMDB0SMdUauy7L0QOKr8T0fbLfZPH5o+Odz7hINjM6+1KDdfw8tBGc5/PxvJvci4QpzatVf/TOkYMjzP5b7yeOoUp31QN4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 23:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228442

--_000_TYRP286MB599533590493E542023BD4C5DBB4ATYRP286MB5995JPNP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Thank you for your review.
I will reflect your comments and post v2.

Best regards.
--
Ken Kurematsu <k.kurematsu@nskint.co.jp>

From: Randy MacLeod <randy.macleod@windriver.com>
Sent: Tuesday, December 23, 2025 3:58 AM
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>; openembedded-core@lists.opene=
mbedded.org
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda <ikeda@nsk=
int.co.jp>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Ken,

On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org wrote:

In the NVD database, the product name of libtheora is theora.

This was set to ensure that cve-check works correctly.



Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp><mailto:k.kurematsu@=
nskint.co.jp>

---

 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++

 1 file changed, 2 insertions(+)



diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/re=
cipes-multimedia/libtheora/libtheora_1.2.0.bb

index 04de8507fb..bacaf3aee6 100644

--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42323844fa0950=
2b34eb1d1fece7b5f54da41fe



 UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"



+CVE_PRODUCT =3D "theora"

+



From YP patch review,
Please use:


CVE_PRODUCT +=3D "theora"



to catch both libtheora and theora





Thanks,



../Randy





 inherit autotools pkgconfig



 EXTRA_OECONF =3D "--disable-examples --disable-doc"



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#228198): https://lists.openembedded.org/g/openembedded-=
core/message/228198

Mute This Topic: https://lists.openembedded.org/mt/116854732/3616765

Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core+owner@lists.openembedded.org>

Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rand=
y.macleod@windriver.com<mailto:randy.macleod@windriver.com>]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-





--

# Randy MacLeod

# Wind River Linux

--_000_TYRP286MB599533590493E542023BD4C5DBB4ATYRP286MB5995JPNP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS PGothic";}
@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"MS PGothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	margin:0mm;
	font-size:12.0pt;
	font-family:"MS Gothic";}
span.HTML
	{mso-style-name:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D";
	font-family:"Courier New";}
span.20
	{mso-style-type:personal-reply;
	font-family:"Yu Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"JA" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Hi Randy,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Thank you for your review.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">I will reflect your comments and post v2.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Best regards.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&gt=
;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Randy MacLeod &lt;randy.macleod@windriver.com&gt;
<br>
<b>Sent:</b> Tuesday, December 23, 2025 3:58 AM<br>
<b>To:</b> Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&gt;; openembedded-cor=
e@lists.openembedded.org<br>
<b>Cc:</b> Masahiro Mizutani &lt;m.mizutani@nskint.co.jp&gt;; Yoshitaka Ike=
da &lt;ikeda@nskint.co.jp&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Ken,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 2025-12-18 11:01 p.m., Ken K=
urematsu via lists.openembedded.org wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US">In the NVD database, the product name of libtheor=
a is theora.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">This was set to ensure that cve-check works corre=
ctly.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">Signed-off-by: Ken Kurematsu <a href=3D"mailto:k.=
kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a><o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US">---<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> meta/recipes-multimedia/libtheora/libtheora_1.2.=
0.bb | 2 ++<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> 1 file changed, 2 insertions(+)<o:p></o:p></span=
></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">diff --git a/meta/recipes-multimedia/libtheora/li=
btheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb<o:p=
></o:p></span></pre>
<pre><span lang=3D"EN-US">index 04de8507fb..bacaf3aee6 100644<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US">--- a/meta/recipes-multimedia/libtheora/libtheora=
_1.2.0.bb<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+++ b/meta/recipes-multimedia/libtheora/libtheora=
_1.2.0.bb<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D &quot;eb=
df77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe<o:p></o:p></span><=
/pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> UPSTREAM_CHECK_REGEX =3D &quot;libtheora-(?P&lt;=
pver&gt;\d+(\.\d)+)\.(tar\.gz|tgz)&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">+CVE_PRODUCT =3D &quot;theora&quot;<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US">+<o:p></o:p></span></pre>
</blockquote>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">From YP patch review,<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please use:<br>
<br>
<o:p></o:p></span></p>
<pre><span lang=3D"EN-US">CVE_PRODUCT +=3D &quot;theora&quot;<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">to catch both libtheora and theora<o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">Thanks, <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">../Randy<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> inherit autotools pkgconfig<o:p></o:p></span></p=
re>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> EXTRA_OECONF =3D &quot;--disable-examples --disa=
ble-doc&quot;<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
<br>
<o:p></o:p></span></p>
<pre><span lang=3D"EN-US">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p=
></o:p></span></pre>
<pre><span lang=3D"EN-US">Links: You receive all messages sent to this grou=
p.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">View/Reply Online (#228198): <a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/message/228198">https://lists.ope=
nembedded.org/g/openembedded-core/message/228198</a><o:p></o:p></span></pre=
>
<pre><span lang=3D"EN-US">Mute This Topic: <a href=3D"https://lists.openemb=
edded.org/mt/116854732/3616765">https://lists.openembedded.org/mt/116854732=
/3616765</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">Group Owner: <a href=3D"mailto:openembedded-core+=
owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.or=
g</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">Unsubscribe: <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembed=
ded-core/unsub</a> [<a href=3D"mailto:randy.macleod@windriver.com">randy.ma=
cleod@windriver.com</a>]<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p=
></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
</blockquote>
<p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US">-- <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"># Randy MacLeod<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"># Wind River Linux<o:p></o:p></span></pre>
</div>
</div>
</body>
</html>

--_000_TYRP286MB599533590493E542023BD4C5DBB4ATYRP286MB5995JPNP_--

