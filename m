Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606A2C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 22:29:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.web11.5620.1737066576014773086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 14:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K4U2Tx3L;
 spf=pass (domain: siemens.com, ip: 40.107.162.14, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI1qsok/kYZ0tB/u8Ax4JOZ4pZwB0ACjp11tAuJfuokehsc82qqov1j7nl9uxu/4zbD2adFnR2BRQe8BEABII/YKKQE5CE7cV40Srr8KQytwIybTGWz8c0o5LUJgcZWn2e0hgx1S4Qphi68HOM8qNHtWosic40jO2gllTkF42eJ371LxSPUR3vLuwlplIXdrpbbfMeJ+atE+EM11c89KpBJi1z+IELoSfrwoFo4Rd6ao990fHvD5ISSuNjm8XG984G+u0EO+vb79OWb1e50M8vGrCVfyXOs0b0tZRHqMRXLSJbFUl/ou2J+6eZx/uGWqM+9HBzE7TKs9CAKLNHCIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uqZI5iT4a0xN1uNw/5UzK/xZh4f2zGdDQVTn4Tc+dw=;
 b=VBFheOlpQxnqYGFkjJwr5qqOAHtQ99nPX/ad/GwlnbtJgzEXKuBVYZeFMWiyfRl2f416tGXjtppVPyGoj3CiijuGCc6jCnpCrnoS4f7/u4eRdGMn6Tce1H9SL4boydauB8oMiMIEKeVDvMEvKReNqYk4H5Fp8XNHGUON/9Tj+KoqNu/V+eIDtY9lS2+VkJyL95+fJmXQGRWf5ZYfECBg2QOUiFLE+zofCD25fwbOsjGFNmhCl9tD+cpWOSXrsgzECH/Uxs+1kBkGzq9+yYU3kRiIU7hHpU9nVvHVlnktCvxwN/0xDxUmeM/do5onlrsNnQmY8Ca6ZrL4Ex7Mte16wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uqZI5iT4a0xN1uNw/5UzK/xZh4f2zGdDQVTn4Tc+dw=;
 b=K4U2Tx3Ls2hejz9a5YGFbQPuAgCn4AhdNVkz990wFl5vYfmmKdw3N6F0jML3PzbPgTFmyqRiGl5EMAcNlNJNcwIxwXwXfd2yfjtqQo+dCLW+KkyF2xfzstgZTQsKLEg05smFtcqVVZBz/85eHcMQIR/O1oYzIOCbrmCEui6OB9cikpVG3t2ZypmjCRbXJUXFeAfPuLH8mARZ7XzxPhe673gaiTyWwSmC7O35sg3b8N8sERkiPgHKNeQF0CSSQzo0M31wAaBCwxuslGJtcD8reHT0ihlrsXg0fYeTnWr6VUCmZwBZnfKOpO256FIjESsuymJxBC/NEfFeYy+QBca0OQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6314.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.6; Thu, 16 Jan
 2025 22:29:33 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:29:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][kirkstone][PATCH 1/1] socat: Fix CVE-2024-54661
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] socat: Fix CVE-2024-54661
Thread-Index: AQHbZ+QG8Hd30LGfHUeensJMfr/pC7MZ+7Sg
Date: Thu, 16 Jan 2025 22:29:33 +0000
Message-ID: 
 <AS1PR10MB569775D9B73EF2C9C1AF4D64FD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250116065747.1926599-1-archana.polampalli@windriver.com>
In-Reply-To: <20250116065747.1926599-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d65012e9-dcf4-43ec-984e-3bcff84da901;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-16T22:26:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6314:EE_
x-ms-office365-filtering-correlation-id: 8f9ae1c2-9870-4c63-1e14-08dd367d4016
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Yx9jLoqavA702CKLt+/N3HWSxjqaVrlXtF8KjQG/w8j1TuWTCHosKl/GbhHQ?=
 =?us-ascii?Q?DZvqdzbYKPkzMofmr86Ln2F6Ik2vdgeFdrCUIqEQkf/LPEJ57Wp16WxHm5Jj?=
 =?us-ascii?Q?IxuD3MQKwn4E4gDrjALm2UiDhVw2vf2KaxBVnyUzgDWuLeU5diOgvBYP15Gg?=
 =?us-ascii?Q?/klyg/eaXD2kGkjttzofDbV1cYM9zGZEl2zGPPN2akpU+3c/R98ZmobEiqHc?=
 =?us-ascii?Q?vVlOiUIl3CqKYuEo58CO1YLiSDN6q5obeKtNTF4YxdxmOHWlra7L4PYIp927?=
 =?us-ascii?Q?elEYzFkk3dDHAFGsToLNfeNf7qt6+2tKHAMLKMWCf+tUhIc5UZVV74fBk1Px?=
 =?us-ascii?Q?azZvwgT+NeGDhe1QzLsH2IxMgriatvW4lrbAsR8gE5BDNrYRzXm/TWyOZ+kH?=
 =?us-ascii?Q?of11lH9wgHXdFGyrVuBf1Je1U5B1kZ9rQ+LFfa6wmki876UvNAx3OuM6B7+N?=
 =?us-ascii?Q?1OntQXT0TGyY0cKIY6RD2kBjhecDGOSkS0K9f8Ofv04JIZxMruvKU/wLP4Eg?=
 =?us-ascii?Q?I878fACUi/zljvZhhZU4Y+6M1IQPGD8xp4Qer4kglWKYTbbR8k+ETXp8baGX?=
 =?us-ascii?Q?FVPit23j/BVrWRXSMDNkJKHJrnykRQagTN2sH0nZ+ElUHMqfGyHlxADPaxfs?=
 =?us-ascii?Q?1LxX1LudKcCxyYywkaR5rAahLveQIahxuDQlCbe1LbQjkfNEX1rxkgAL6Evu?=
 =?us-ascii?Q?IoL7P0A0ob6zJxnwm46HYFmDkMyEc2FFRWQsJY56xcTRrsxdMTVvDX6GUc9S?=
 =?us-ascii?Q?XtoSXFqLQXQy4GBizKzLf9Twki//yDkMAm3RNOkduAbpRB/nsrIXJk6D//jq?=
 =?us-ascii?Q?ZA1ffDUPNy/JAhi3ei7d838arRh4ZArey0ODO69jW5bgUNGNiqduyUUeddnH?=
 =?us-ascii?Q?JDhHrl6Yjxu/FXiIAXIXVvH7sXcTI3GFWkD0G3NXyJEMgGQO/zXCdre37H5z?=
 =?us-ascii?Q?zJ9sK+P26ucQj1t/Th05A6vio2+sPXtCaNNw0K7uafr2TWfymNVCKErUajo+?=
 =?us-ascii?Q?U6D7yKJOqHg/QBrctG3A389uekUj/UidYHIrofd/s06E8IFp7CDarBl2qdRm?=
 =?us-ascii?Q?0J8V6FT5KQC5tEdha20x+79lQa56Xy0X2vjaGg3/aKRtL5eFOdDDk81DtZ33?=
 =?us-ascii?Q?+vaw4iP7y9a0iCh8HqpIVv0/h+FKzKs3/yvShjE4DXgKdo36BU6Bdr6e1F4Z?=
 =?us-ascii?Q?LajpLsLyNFoebKbUi2i97I/C4PzKU1QMtzj3MyvEMVeHhxVpr+igkTTXidvX?=
 =?us-ascii?Q?HRxdB4wpiLB8aRbGCPMaK5RQP3UhEbds9lamGehXXrWXBgVwWSY+sIsWGQLm?=
 =?us-ascii?Q?/y7kA3FGbx12PipVeELrIYl2fEJkFEkrA4t9LjjhXLQrfopKcFMQW4L+ngQb?=
 =?us-ascii?Q?6qHB+z1hiMa0iQuIX3R4u514s4in?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GDN1VbvBb2lR22ExmvPzEQ30udtnTwHCigYdAkf3knDu4tLUZLCvrk0D4ouh?=
 =?us-ascii?Q?JYjzrdfoneHfTgIDVr3ldCyID3kHHL1zOtacQNzuyREerVYsN9YY5ecoCE4F?=
 =?us-ascii?Q?tU0OcdZcXF0Fh+DZmbKRkOzh7qPnCxgMeIljL+FhMvpwl9rSjUbgXKwZbd3y?=
 =?us-ascii?Q?ztOKq9zLhXUqsGOGxjplso1kJ2Q4sDEWN4h/UiTO1yPVPW56yDtD5DqxNih5?=
 =?us-ascii?Q?QdIhbgFyAjUKbx1y4r5/h+fHCQBDiGFEbe8FKnhx0Bltegxo6pxjRRXPCxKL?=
 =?us-ascii?Q?TRVPZnKwpzj893N2G8IOZa5xaCR2QChZdOiHkXQFg2pAZX9qhAzKMPpOYOM5?=
 =?us-ascii?Q?r97Rwsc9bCner5RsFNGqLtUBHS7tqBGg+xnMczLyzJcNRkO2K3rYoYWSkltc?=
 =?us-ascii?Q?xFVc/CMuzP3dvvV90qY5SRCwKSUoRdj47Fg0h9f6OsQzPYNAScWbQusP0e7Q?=
 =?us-ascii?Q?zVPi5wtK3VCdMNFbTtgjar2nlUmYx5p7nRTcSdBj9fU67KNERQd0KeleVVHZ?=
 =?us-ascii?Q?0kL5CS60+cC1mosYxY6Q8ri9sosfr2/uDEtK2GwTQmoVd3FqLlpvKG3E168g?=
 =?us-ascii?Q?PjL4+7GYYcNuP2zoQx8hPvJ3uoA5sZg+I54/uuFKi7D1uaFCdNDtFLf6a4Fs?=
 =?us-ascii?Q?dPIlF6tqhvHrBORAnOox6doNyG2KdaND9jwsFaE8rVKEM6asDc3rkw6PBzYk?=
 =?us-ascii?Q?2pm3GpwWnflBxMhnJ7bV5UtVCuhLz8/Yr5T93bqBBcdyKlkuJFc+XDbris3E?=
 =?us-ascii?Q?uqhphYn/GGGRLPoLBxARJzotrne5/NlE52fwr/WMc1K5ag2LbhHDjF2CJ2hS?=
 =?us-ascii?Q?DfPbotsDXKZGmp74wZ5xeEH8lFUuQBpGNl7+72qoM8NTyuDedkYU0R0z2+98?=
 =?us-ascii?Q?Mqzet9b4WgPD9KgdeoVMA1Zkux0jISU/D3GgejbuFrj3mnHC7f9iBYUUkFWk?=
 =?us-ascii?Q?kXAFfXR72WJLW5rBRMzEWPy5BUtX79/RWnPeDbqQVEN7F8m37QCMWBvodtIK?=
 =?us-ascii?Q?oeGezAD5ylaKbu+kB7AeDoBiLZU154ITXtwlXFrGdGKaINF6/02DWz4+32r4?=
 =?us-ascii?Q?7egO451u8vQVoqIjXbKpvaBFuE/l8zTmAOzGCFkh42X1wjgxhHHCIccKhhuB?=
 =?us-ascii?Q?obtQ5hXHjrab9Mlxx+Re6lpR0hqxHJ8yXXTkLaLBYvMG6bokmwrvhPb1Qxtf?=
 =?us-ascii?Q?D2v51HH7RV76aeXUMmYpbUD5aR1vO4XCooLxZjJ5ciqiwlkvXpVDirRWiRo2?=
 =?us-ascii?Q?K2l6mDIzU7ulliF1db7RvhbkZnoXjVDwqK14aa4U4ev3yTouaLa9y+BYpUsH?=
 =?us-ascii?Q?bpXisI8mFJjUkan9rbozmPOoK4O3GpIBEdo1aPNdTSwk85iOQRCOcenFThMC?=
 =?us-ascii?Q?fVJj+rWKJfNV8LlQSTFRpiOSHJimGEPWrKfq69JgL5Z6exszA6NdXNhMDYtg?=
 =?us-ascii?Q?m1wrCHxyS6i6a+ecPZofl/w6lHGVupIiPhhasVS2CxRiyCxsLLEJlB9yGfpw?=
 =?us-ascii?Q?Ou1m1rjtFTGEJ3UEhvdhFGFPm4PBWe9iXbnFlvTjU7IehCg8IZitppjNQIzn?=
 =?us-ascii?Q?xbXM+8us4lndKPI0bA8MfnjJOz9N1NmSsC00F0Jk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9ae1c2-9870-4c63-1e14-08dd367d4016
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 22:29:33.0275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZT8nLHzVPyUQCyldquEKdApbufI8kk4nzGePCQaiAp/YnhdFHxFjnV4UaNzwjgmoCqh1TP94HK50l0NavzBwig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 22:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209972

This patch cannot work.
It picks only one line from a larger commit.
And $STDERR is I think not initialized here.

I have sent a patch picking the whole commit.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Polampalli, Archana via
> lists.openembedded.org
> Sent: Thursday, January 16, 2025 7:58
> To: openembedded-core@lists.openembedded.org
> Subject: [oe-core][kirkstone][PATCH 1/1] socat: Fix CVE-2024-54661
>=20
> From: Archana Polampalli <archana.polampalli@windriver.com>
>=20
> readline.sh in socat through 1.8.0.1 relies on the /tmp/$USER/stderr2 fil=
e.
>=20
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2024-54661
> https://bugzilla.suse.com/show_bug.cgi?id=3D1225462#c7
>=20
> Upstream-patch:
> http://www.dest-unreach.org/socat/download/socat-1.8.0.2.tar.bz2
>=20
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../socat/files/CVE-2024-54661.patch          | 31 +++++++++++++++++++
>  .../socat/socat_1.7.4.4.bb                    |  4 ++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/socat/files/CVE-2024-
> 54661.patch
>=20
> diff --git a/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
> b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
> new file mode 100644
> index 0000000000..aa170bc895
> --- /dev/null
> +++ b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
> @@ -0,0 +1,31 @@
> +From da5d4bd0a79a9adb69469fe4e542b6874eec663c Mon Sep 17 00:00:00
> 2001
> +From: Archana Polampalli <archana.polampalli@windriver.com>
> +Date: Thu, 12 Dec 2024 13:00:06 +0000
> +Subject: [PATCH] socat: Fix CVE-2024-54661
> +
> +readline.sh in socat through 1.8.0.1 relies on the /tmp/$USER/stderr2 fi=
le.
> +
> +CVE: CVE-2024-54661
> +
> +Upstream-Status: Backport [http://www.dest-
> unreach.org/socat/download/socat-1.8.0.2.tar.bz2]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +
> +%% original patch: CVE-2024-54661.patch
> +---
> + readline.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/readline.sh b/readline.sh
> +index b6f8438..5c59458 100755
> +--- a/readline.sh
> ++++ b/readline.sh
> +@@ -26,5 +26,5 @@ mkdir -p /tmp/$USER || exit 1
> + #
> + #
> +
> +-exec socat -d readline"$HISTOPT",noecho=3D'[Pp]assword:'
> exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=3D0,stderr 2>/tmp/$USER/s=
tderr2
> ++exec socat -d readline"$HISTOPT",noecho=3D'[Pp]assword:'
> exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=3D0,stderr 2>$STDERR
> +
> +--
> +2.40.0
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/reci=
pes-
> connectivity/socat/socat_1.7.4.4.bb
> index 5a379380d1..86ca5879be 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
> @@ -9,7 +9,9 @@ LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>=20
> file://README;beginline=3D257;endline=3D287;md5=3D82520b052f322ac2b5b3dfd=
c7c7
> eea86"
>=20
> -SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.=
bz2"
> +SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.=
bz2
> \
> +           file://CVE-2024-54661.patch \
> +          "
>=20
>  SRC_URI[sha256sum] =3D
> "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
>=20
> --
> 2.40.0


