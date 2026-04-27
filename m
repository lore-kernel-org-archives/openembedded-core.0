Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AA3FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 16:40:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.398.1777308043259868630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 09:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YVKG2YMV;
 spf=pass (domain: siemens.com, ip: 52.101.72.4, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibAE4B06TQg+IxNkPIs9f6vDXFgQhrAwzjQuuvvoCxUk4hmu6SZf8oug26N1j2L+couyeamqtKdQSAfUGrSwELz2aNd+R1kIOtB5GdPJAd4wTwEs+rrPJOsuZ9afANYBnWgGuiBiGaFKzFstbjPIckjfMOc0YOMxEIe9kNiCx70mXBsl2GaZegTGa/k5sB7HMJ1IzoQnmbfdOwNBNCHdfeVbGmULdPe+S18RQPppcZzhHIlK/sv+any1r/oxIfLZaoD1AWjWC4+92OWyYnuXB4S4iDCrmUitCmqU0eO37pav6mtPnwSLJaX+rJ1anGB4ta5LWX9aALH9UvN8cijwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhHaiz0VrmRk+ydvaYtmXwFRXAmshsR0hhry5lVY6JU=;
 b=ddplD+lil08zFomLYXFLYxwRSRkgvOrDGx6nJ2cBwaonlaIwDym3I6HolXqkB0YIPLb4Ux7jpjAHE0jPP4KMNTMJ7ueZFvvfniNU7vpOlxIGe2qNMJddRO2IFPkWiLLgwDLJO5evEv1zuPwgss00CDhbROHFvoa54t/J6uY8M390mgcek41eQhLyabNptb3Mawrcu1zmvD1i4TVMUsvl3KDOeT6ntdgdZsCoUXbIeYAbKM4ENRdb1lEQWUKYwDFGvOWweomiNQs04svivz6K0iLVRVLQYm0YgTsRnXl4rqtbs6HrNetBhzAeWP3CPbv1ny3zq3Z24PiNprPqHR7QdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhHaiz0VrmRk+ydvaYtmXwFRXAmshsR0hhry5lVY6JU=;
 b=YVKG2YMV/0Po7qKVXf4xn12Zn06ZEq+WZeq0qS1xppBEDPiXVDl49gzPukMRHjGCowWCkYqbqe64wPLssqg3bkPRJoAzQiX5w5CUfttSFT1v4U1SGMArtq+BYzLODxxwQtduADWl8u3smRjWvIRbAeN/dKyee/UlBqQES5vT8NmbKFC+PvRRmAfyrtKzg/RrdD58R5YG4MWAcIUkxiOr4IbG60uzs2emhFwcKIDEkDd4cDy5X8LlFUPJyesopjNLqah/t/LhJB6HRSzsR7LW10eUa4Ms9wj574Gik2CcOdJ423TJy+QnZqFUbL31O4eCjbc4RsnRs/I7EgZtoxAeiw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB8093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:40:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Mon, 27 Apr 2026
 16:40:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-Core ML <openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH v2] ffmpeg: set status for 4 CVEs
Thread-Topic: [PATCH v2] ffmpeg: set status for 4 CVEs
Thread-Index: AQHc1i4hbu4W22BCrkK7XI/HpWxyY7XzHGxw
Date: Mon, 27 Apr 2026 16:40:38 +0000
Message-ID: 
 <AS1PR10MB56973A58CCD25A3BF979FE49FD362@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260426185025.13217-6-peter.marko@siemens.com>
 <20260427101042.5132-1-peter.marko@siemens.com>
In-Reply-To: <20260427101042.5132-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=809a9d66-9f5b-4f78-93ab-7cd116b2c2be;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-27T16:39:18Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB8093:EE_
x-ms-office365-filtering-correlation-id: 5994160c-c315-4128-9fa3-08dea47bb67b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|55112099003;
x-microsoft-antispam-message-info: 
 OTRni+VoiYlA+PHcB/7hlnKVEfgq6Yx+v7NgZEEiU3aV81ARtPkX/vEhi5xxQCNoYNy9xcsaULoUsbjQFCimKMXiFnaLAvMxPew/5SwX0ThL530LBsMVp9PhNJWpz6DFPOOzOcYhuLXqFuN9ms/0wp2nvR3+Zw0WYNLk1lJ9ySGhnZyK7TL0ty29tVkVeWN4IGTmnyj1k5CQ/Apd3LUkQDPJOoRSoodbKjlKZHBwvugPjqfp9J31ZyT+W2FffHWrKCyhM2f5xFbA5dL7PalY/lYSin+SD/T6gxbOafMFdtuNlHLiQJ2xwyoOxrQittQiVPsp+0PSBMgtMdBRLL+BzNyy7iq1AiHvB5C8GSG58wdauxKJ9LqecOijaAf6jvsO7Yr6hsBIHMTbr2+2SRlkYnYf2a46LCx4NsMiGgSXpZq+Dgcwv1io0by0bIDJ9eS0AA+G9B1/jlhBcz68Nf+o9WQQbG2NPzIMxZH+BoCCS89N2feRB+uKmjLP5NtFqyUVDca3hsunZuwdinOK/Z8ZLbwIka4VwtZzqeEiiu1ZTXi9mhO9DXum5lTfY6/M9oybeYjS/QqPqRie+S9Pp3pYok4H5B2E4U7CbACVbPb8HVrdqFI3yjR1Y2wbfMIJdOmSYBu7AhbFlqjuEQgdbfpYcbSabArH8XrJq932dIhzJeNWe3c02FDc0ofTNo9eoKVu/QfILEbahtXi0RQPrrJbLuHNTYC4kxxVAipYuJvoZxNl/CkNljMgGBCvpvKaVNMCwD1fWiPBunFETfYb78/lEOT6V5ZmN2vQ+P2/lkuXtXU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7rdCv1fuPZvuVHaQ0oOSmjixeRuKkSWw35CUTVyvo4f/xyXEXRsJVEJNj1s6?=
 =?us-ascii?Q?cFht25DLonW55Y1jZ5Cwb33CfTN3HQkmoZg6ygPVR7kSkTC77VcnWjO9H9uN?=
 =?us-ascii?Q?oJpyESqLQ0saNg9urhZgF6UfgWe1nCgEOw1v46XQhqKNUk7+CRTEZkIPlVxl?=
 =?us-ascii?Q?XD+lDHJK0O8oKjLJTqL6IKtn++AtszInYA/68feOutObkEUrDnRrLd8tmPrG?=
 =?us-ascii?Q?vReY8sZ+T9MHk55FzDRZpph4RthOs9pVMAqVEbYggeaYSFDZDInADsyOmd/b?=
 =?us-ascii?Q?OyKjmMgeumUS5nmB8+GZXn+DvbrONVX3TxqIs7MxnFzip3XZe5JBWt8jn+rF?=
 =?us-ascii?Q?hblqs4lwEzIeWB0s5Kh9N/bXQMrdDfbPnn5UHw3lt8bjim/1y2DLsLpoFNie?=
 =?us-ascii?Q?ysxWwTmJNwzBykqTuuNZGHV4hHOVqV6LPVh8JJhT48DOU6x/fTSL51EO+7TB?=
 =?us-ascii?Q?Bbtode6CgkNqRieM6ENS7QX3QydicUeMg/pn8JCWEuw4FxbNTHqOUx1ZVLNZ?=
 =?us-ascii?Q?9D111rKRRsMualwCFiqH6CTc34IEFzgfQP+YvpkLqnSN2mTSHGH5XvE2YBxh?=
 =?us-ascii?Q?OzPvGhJOBKwKdpUU0Jl+Uyv3iHHSV9WhelajN3bvuFg13gkXD0bGsjWlsOZX?=
 =?us-ascii?Q?k3rG04pWZOMTAjFsb+Whc/5CaMqYr564SFlQxrGDosIs4OTgWqjGU8TkoizA?=
 =?us-ascii?Q?6YKFuPsEmRg7JWkFjnVXhFNaYMKba5m2iZsKfh/fwmpLAZoKVuhsqoG5cszX?=
 =?us-ascii?Q?x5n/ogHfWmLOsjOAQdZtWtiKcWYhiBMmmyJ4bUmjbGecPJA9Fu2KEHvYF3lG?=
 =?us-ascii?Q?LsLRroXgP3WOOF0whMd65mYWa5nnFH/7GyUzQBguEEjp3wCH7epY/yFbwoSC?=
 =?us-ascii?Q?CpCLGilLSVpWRELnQWKD0ZT7RUL/8tV63snT8J49DsQgWEBi3uBrXNNH/t5K?=
 =?us-ascii?Q?pNqUBJQNNhc5XkjIxMKEoSmXTnXV1qR3f7A7OEGN+aKnpwIGuWu99b5rTmEO?=
 =?us-ascii?Q?ttZtwId0MGdVvv8p7DtVc5lPy+beWk/i6EOZzZ0B2ihUKN19LHlLEh9HM3r8?=
 =?us-ascii?Q?UxCgvXZ/wJwpA/0HBKMqq6wUs8IdyAYkCQO2b4hAJ/8R0aEwGei4pCMUHISd?=
 =?us-ascii?Q?AjCvH39aPLwv8Gc4+JolyJTPJr02gVW16WJ+T2QgNrsXtMe1ylbtXfwf6jbE?=
 =?us-ascii?Q?YmexeWWC4oag5nFPIN0TMu1S/uUOaBFQSb+sDeVvG7H8xNCAhWAOaqvHj/Pl?=
 =?us-ascii?Q?dVSxTQTEp69hmZWMaFR70jCnQZwj2S+yGCFzXYS6JkI9Tqm9tD1c9MiDv/pC?=
 =?us-ascii?Q?5YyIIYTe+QvruZmzigJ4urC69fOish5HoLDPV1e22t1IMa3vmBwlWDUi9hH2?=
 =?us-ascii?Q?U5IoxhI8L71F6sh9FH/n4rqRKavD5BTeqM4c7K0MNoyujchNVDMXucA5vjtZ?=
 =?us-ascii?Q?yTelm6blT6JBWcxamCoy3JcCjjuud/Xdnk4FkjIrpI7t2VqJHcX/ybSgXSOu?=
 =?us-ascii?Q?GlsFoPbS79NnzEM7Qc91yK6fB8FCqJasyLQXI9QVBbJQD2BBl3j1+gN1+UEy?=
 =?us-ascii?Q?P+OzRitm4cpkeelCucZu6snY6AYLD1noaP6NVsTL9Uo1yQgG09u80El/V2tZ?=
 =?us-ascii?Q?ZTGWi/1Q2C/BWjC/mx0qJ0x4oWb5fv1/48r4lWmX5VeP8dB+6nKOp+CiqpDI?=
 =?us-ascii?Q?H2Sr/V72MgwQC0tzuQKCgNt4PzmdJ3D8FbQuS3//yyVP+VTDM9Cv5s21pXQP?=
 =?us-ascii?Q?r34ezfk1UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5994160c-c315-4128-9fa3-08dea47bb67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 16:40:38.2312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWLEB9IO0TocyeBtCFkg01VafHqgW87mbGo4eg145FYCZEWofWpukgoWEaV7LUWQoeVmwlHstvR8+h+zCj3ZTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 16:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236020

Could you please take one this instead of the old version to master-next?

ffmpeg: set status for 5 CVEs
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3De941054f6f1381742a5af02c85f8174cc776a81f

Thanks,
  Peter

-----Original Message-----
From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Monday, April 27, 2026 12:11 PM
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [PATCH v2] ffmpeg: set status for 4 CVEs

From: Peter Marko <peter.marko@siemens.com>

These reappeared after update of sbom-cve-check tooling.
Fixed version found by links from Debian security tracker.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 7bb7de3d25..b6d3ceb6dc 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -176,6 +176,10 @@ CVE_STATUS_GROUPS =3D "CVE_STATUS_WRONG_CPE"
 CVE_STATUS_WRONG_CPE =3D "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE=
-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
 CVE_STATUS_WRONG_CPE[status] =3D "fixed-version: these CVEs are fixed in u=
sed version"
=20
+CVE_STATUS[CVE-2022-2566] =3D "fixed-version: these CVEs are fixed since v=
5.1.1"
+CVE_STATUS[CVE-2025-9951] =3D "fixed-version: these CVEs are fixed since v=
8.0"
 CVE_STATUS[CVE-2025-25468] =3D "fixed-version: these CVEs are fixed since =
v8.0"
 CVE_STATUS[CVE-2025-25469] =3D "fixed-version: these CVEs are fixed since =
v8.0"
 CVE_STATUS[CVE-2025-12343] =3D "fixed-version: this CVE are fixed since v8=
.0"
+CVE_STATUS[CVE-2025-59729] =3D "fixed-version: this CVE are fixed since v8=
.0"
+CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this CVE are fixed since v8=
.0"

