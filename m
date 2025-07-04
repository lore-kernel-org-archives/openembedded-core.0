Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F0BC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 10:42:47 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web10.9799.1751625757674674369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 03:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=JevkSsMq;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=IgRSG+qu;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=273210243=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751625757; x=1783161757;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e9ELdFbFQr8B9MMw9k48J9bYfuEjyOkJBdyOpVuVj+g=;
  b=JevkSsMqLdlwhpJG1rgMa/DaAhW2TOP+PowhkibUEPp4NNeAYlmUTZfP
   v88y+q3hzkO3IdJE5V4OyR+2NLz8EXHlgkr4fTdOUILefis+PfOfraXos
   BeSidLdKmqaLyzl8genOvM0D8FsHQAKTYAN+gvL6RjOblcSiv4djkkwKF
   o=;
X-CSE-ConnectionGUID: 7yeUkLkYRgyggcfK7XipiA==
X-CSE-MsgGUID: 5qf9crUoSjGHxwThuucibQ==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Jul 2025 12:42:35 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 04 Jul 2025 12:42:35 +0200
Received: from smucmp15c.bmwgroup.net (HELO smucmp15c.europe.bmw.corp)
 ([10.30.13.137]) by esabb1.muc with ESMTP/TLS; 04 Jul 2025 12:42:35 +0200
Received: from SMUCMP11F.europe.bmw.corp (2a03:1e80:a15:58f::224e) by
 smucmp15c.europe.bmw.corp (2a03:1e80:a15:58f::1:49) with Microsoft SMTP
 Server (version=TLS; Fri, 4 Jul 2025 12:42:34 +0200
Received: from SMUCDZMP07.europe.bmw.corp (192.109.190.47) by
 SMUCMP11F.europe.bmw.corp (10.30.13.94) with Microsoft SMTP Server
 (version=TLS; Fri, 4 Jul 2025 12:42:34 +0200
Received: from OSPPR02CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.47) with Microsoft SMTP Server
 (version=TLS; Fri, 4 Jul 2025 12:42:34 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 AS4PR09MB5840.eurprd09.prod.outlook.com (2603:10a6:20b:583::16) with
 Microsoft SMTP Server (version=TLS; Fri, 4 Jul 2025 10:42:32 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 10:42:32 +0000
X-CSE-ConnectionGUID: Mw+eXe7cR8qfS12CmCfgfQ==
X-CSE-MsgGUID: yQMQNhXdRKmUSYFp0hWWMg==
X-CSE-ConnectionGUID: 8aGTM1GUSq6hlb+N3x4TMQ==
X-CSE-MsgGUID: SW3+/5uyS7aOsGKn0Q8xeQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TM1ul+GlLyszwOu0D9lBLK2BiSCGEK7SLj4V/aSLUdwP5Otkxs7A2MJiX5oRDRqDfj4giagqKwcDPOaFn5/qf9y1u0pZksAn8ldNqWdf/EMktuHBky+a3+nar4IkifC8+roJ5/+lvgaLXmaPCkA9zJfPHCVQaiP9rSb9wiNrWMmdr03a62gxrV6R4vHZMSiUtJU1Yu/Jc/vsEVy7Z1nLJTAYVrCOpE4oLJKNPBM1hlDlk4npJ9Cu26ZtgzKMlzKN1w2t9IOM5h0U8QD2zdzFUyI4pG7btCZLOtxPYV7gtUhz28Fqn064xnVXZ09H/8Jat912or8z/p5gUOFERTk+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9ELdFbFQr8B9MMw9k48J9bYfuEjyOkJBdyOpVuVj+g=;
 b=vSxbHGUA+NFPXFMMC49jz/cvL0si3K2y+Wb8G2hW34ZsNz1nT3hUeBOMnO2JjlzTnlwyNT0Drc/7+ZQ5w9nJvybdzHezs5cm9dZEMA6B4RZ5XuuQn/59/qMx+Gz54QUIu7ZYk4ldh/2FzBVBidXsKVXh/PBT1MdHdvPYQeJRxmcjdKN8GF/IbM2pn8yxTy4H7apQIwNVR5wvQPiiX9mpKu4mV0dbKwftu99Wgon0q5ZluF3dyJRjSAF4NYZZs+OoTg9R1LNGVJTpZ/mwAZEWKPrS7akktyMQkDXJ9DhlFuZNSzVi9o3n/Q+ArkZ8vCKVi6q60qQDQ1IIsyG5cU9jvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9ELdFbFQr8B9MMw9k48J9bYfuEjyOkJBdyOpVuVj+g=;
 b=IgRSG+qubzUeLUVR6JvPbJToEV//jOakM8AJ8EsljRNY8H5h06Dcllmn1YrocthCXzPYl0OsiOwLfXMDglacfT2d+njtABsJK2rtV58/3kjX59tlu58SHVE/nKFVjm0Kn5fioTSf8xiMKMRTkXhaGBLL4pK8ekC40e7acX5/qt1piypw3E6rcffV1yuYL6zPBhxrTFc/JDcuEigaFIvKIsDTtzW+RqJCv4xGMc+2aqqPBprTHIznSXAVHha8WVqueDrq3zx1sUWmsV8JjbwDsp4/YnP9wD943sPyb8qpEyKvOzBrYT3Sf/jQ0Ef02eXKsnjG/Gcwkv3q8aiae5mc6w==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [PATCH v5 7/7] cmake: upgrade 3.31.6 ->
 4.0.3
Thread-Topic: Patchtest results for [PATCH v5 7/7] cmake: upgrade 3.31.6 ->
 4.0.3
Thread-Index: AQHb7B5E5DF4xTEea02Z0AajyKU7rLQgakGAgAFd2qs=
Date: Fri, 4 Jul 2025 10:42:32 +0000
Message-ID: <DB3PR09MB62022DAAFCBC1C4C94CF7C8BEA42A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250703132720.3378569-8-Moritz.Haase@bmw.de>
 <01010197d08c5818-3f5aaf18-6f85-466c-bbce-f34ed9768245-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197d08c5818-3f5aaf18-6f85-466c-bbce-f34ed9768245-000000@us-west-2.amazonses.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|AS4PR09MB5840:EE_
x-ms-office365-filtering-correlation-id: 9dbe2064-d80e-4c07-1704-08ddbae77b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XYhhhLQByDDXZX6fatLWx34+V0QLopwYhderrp4YKtWkTDp6BeAQPokCl+?=
 =?iso-8859-1?Q?1nnjsYciDntpu51e7RK6K2BjYAjmN+cTboVAycPEFn0Apjxb4YxybVsz+w?=
 =?iso-8859-1?Q?6KPWD8vQ4uN5e3i+2iQPuXuK9Wy+Eb/+lTR/nNx/eZF7GJOP7p/9cfu0C3?=
 =?iso-8859-1?Q?2FigIjUBb4AFLL+EmRbmKTGhPCy48lTD9plVNG9+J7FajPT0jYF/TkHNMF?=
 =?iso-8859-1?Q?6iYYyI8CEfCIfTOAkcddB9R0/22Iwk20y74OpvPRYu+2y6cZ8LSVaaUOSI?=
 =?iso-8859-1?Q?rEhwdn+vDRhEue8zT13snvIykskfG0KEbjJNBtNf17bRHwPm9jRJXZyQvS?=
 =?iso-8859-1?Q?NzBjCN5Qf0tcFeZWmvSquiJkNStqO5sf4ANJrHDj+g4TQsJ38DKYvQUV4d?=
 =?iso-8859-1?Q?jMBXFxZ31LYs/39WfLXCulMOIgGhuApjf66XHYz5EI0DiTtF0RhgvI2yi3?=
 =?iso-8859-1?Q?PgGJ+pj9nbnPIThFNzTfvu334FCwx0U6+p1s2mBZBcWY/VX50KnrQ9pPFc?=
 =?iso-8859-1?Q?egxnwWsAYNeBCSGI0zeLb2r6ReJX/s+uMXfKsl62svslPETxeere3EjTge?=
 =?iso-8859-1?Q?Jae4e//amaKFtKSRnLIcr9PSRq6rEZUFwJycdmSyVuepNZLLQEh6vdYmPq?=
 =?iso-8859-1?Q?/u6G8RqCDYJWBj8d9wXlmv87OTgDJe+em8W31+6zfYuFyLy48IADun9DBo?=
 =?iso-8859-1?Q?Bmvpc/Esjrf5cwB4+X35mtI/0mkB894tmZfP7uBYENfSMI7DTmX+liWlVz?=
 =?iso-8859-1?Q?e3FdezCOH2ETm92f+y87PdmJ6/rXq1B9MldWfJAkDYl9vd4AwC5WSVB8Iq?=
 =?iso-8859-1?Q?eQ30nTR3YMjSd5sHtwNbrSv2ONDUZu77ImeEQjprmqf6+2Lja0gu7WM2Zb?=
 =?iso-8859-1?Q?k0qe/k2pLKWkZUE3DBAglipZkyYHbGPTclguHWYJYccSRjxUsBcKYo5DMN?=
 =?iso-8859-1?Q?Mh4CU9Dr5kHy+oF5B6Lmw0JlMc4LoEaLIOplIol9VLGgtnKZ3JFbacBXTk?=
 =?iso-8859-1?Q?0EGJvzT5JC1iW2ZTQ0XK0IcMM4GxzgHeH6vfIE4jyLeZN414H55H2Cg/9s?=
 =?iso-8859-1?Q?j2SU/D3tLVa0BU/d6QG0OC2wMqQY8pefJKnsutRB2VBxxXcMYespNlaATj?=
 =?iso-8859-1?Q?YGxvPxlq77aT0qL4YzAqol46yCDDi6zHDRny+NIFUOCAWZ2I7vGk1g5zla?=
 =?iso-8859-1?Q?ZJ6xwFzeeaw1I4EjHG2aICESnEASwoxkcWIjOhbfsvo6hWxDrd1TMgmYVV?=
 =?iso-8859-1?Q?7rBWtn5IJT8PcBJI/Jgj37HnriTbJcmKsWpDec3Oah1cSRP2VPCBLzEGOK?=
 =?iso-8859-1?Q?048e68LUJCqC53vIvRYGKvaR/dC16HFJ/w4yMGD5JtBIHVcSo7YYqowbBo?=
 =?iso-8859-1?Q?cR0PDMgbduQV7IOY8T+ij0rFA2HxZbzBLjcU1Ob/Bbc+wM2RGLUTw701Jx?=
 =?iso-8859-1?Q?6Eh8ASTjMp4pS8DD62aONw4UOmU+66+3xloyruUDLuyUueLpcRMlCc873l?=
 =?iso-8859-1?Q?w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EByAwwPA/KxO3R0dTCGj+EkEa02IzAQAborgxI13sRg7YOp5C8F1aTkZkl?=
 =?iso-8859-1?Q?J15cAd3hei/gtCLyi1tm9pGr2I8fAokhTBE76NxDZWZaly1LPZylCoXevv?=
 =?iso-8859-1?Q?gBZ7FYkEG9aoa/wBJ+8Ad4AH7u5L+NH2itapSTwFt47hNn+WDnJjfmcL+b?=
 =?iso-8859-1?Q?zYzcj9QWB0xxdnM9/uTWhFdlTO0vwUUWWSBzA8vBgLtgRteIrsSoH73Pzw?=
 =?iso-8859-1?Q?sU8lXPHOs7LJzghRo4CPjvcOGSR/7VqcgCLzZ+pha6pxFZj5zVJsikkCU5?=
 =?iso-8859-1?Q?5r8JeoVya45EmImnmZQT6kZ+IUnzN0VOCgfU9AmsIuOQPiTAG7/LlU6kv7?=
 =?iso-8859-1?Q?7x9BRPFkO+Sqm1b5wLKDJynA1z0b3S9SjZjEIryGZESmxJd7XFKWcmEw9j?=
 =?iso-8859-1?Q?jb+lI6ZFyj+jcaTHJYsTmwbSu8QsgAWvsrHuw8oDQBrE06nERzFIHXOXOr?=
 =?iso-8859-1?Q?mz6V71EVKp6P5ugs1dTpqTOgoWywD9qZDqy97TVWHdrXL5rFDh9uR+O2gm?=
 =?iso-8859-1?Q?UZrcXyz1vKGh7mQ8wgU348G5zU5UegDtanXFCMAitXAVZ+py/nSFjUa3yo?=
 =?iso-8859-1?Q?mBZ3Tq0BG4XNBMiX15VMtHQy1s6Se8QetEYBhXUopLopVe24+9hwRmRZ0+?=
 =?iso-8859-1?Q?/nqROHbKqbakSA0Pug5jmJpEiNjRM8Rfo1g6nNAY7QWsnjd4U3KDR6o+ZL?=
 =?iso-8859-1?Q?cKUxpRf6CKJgrENcIlIyjRCUWoNYhJ1Ss4ZbR1gIMy5cJ4aMk9hPWP8J66?=
 =?iso-8859-1?Q?jNSM2HpAW4NPLleUHQkRXXYGJJJ6zYb9lj7NHN3PDLYtqQZvq4558aTGZi?=
 =?iso-8859-1?Q?9XKmSZwhEZVukQ5YPREzbBodZ7VV2kvxfuUJ5CGOya1z91+n0z8zB6uF3f?=
 =?iso-8859-1?Q?q8DxOViIsASmfxEcfPVs4HlgNFpF9DTxqulIfO7pI9zfD+Exzmr0bV3v24?=
 =?iso-8859-1?Q?96fRVV7xckH6wNl7i4z3qL5/d8I1ojJXw8WlMK4NLS8N57cgt77qj/vkTS?=
 =?iso-8859-1?Q?54S+bZi6FwyiQrWCb4+259xD4FooR5AzsiDQl1TMIslNAHODJspyhH/OUa?=
 =?iso-8859-1?Q?+Cdw9i6PoHcv79+VolfGTLFRoB8+nYp11DLx5Qj8M3Gr+PC3Z9l/azJeg0?=
 =?iso-8859-1?Q?C9X89T9CTnvJBx5pDeRNgPzmbd9lCnNVY1SjvQeHPIyvvSztiGKJ/9n4jO?=
 =?iso-8859-1?Q?d1NHqjUcQNa0cywziloxGafyfHnQNy5QnpcNgi6rUwhse0m91CHnF6Jskx?=
 =?iso-8859-1?Q?pS9tAldBNgcbNVX2xw36aY8uT+fKETV7D7XplzKxaH75tmV0xkmS3edYgI?=
 =?iso-8859-1?Q?JV2Ip73s38DSAHM68RtDPXCgFROP01NWetZbeXt6EA1/2ms8Hwy2E+gI58?=
 =?iso-8859-1?Q?G2B0DrtOiuahrC2aVxrgdM7GrtRZQGnC1p/p7qFuAUqbn68447x7fmXCcZ?=
 =?iso-8859-1?Q?p3nPNPXuuEjEll0y+iEUsF89AzMxkrtzzvsnIIDzYHiDSmRfddzL8ToKwd?=
 =?iso-8859-1?Q?+BcY1tQ4Sfh8PDN/EeE7sQxxv+AZscEQPVLmMmTwpWaaSWBbBg4au6nmp0?=
 =?iso-8859-1?Q?KwFMhtaQmjC9PUZuKysTDW3DpeO3kBI/a3L0UkTlDix+mzJNDWeAdQf8Vp?=
 =?iso-8859-1?Q?7460KMMqqU1Uffn1WQZRKHBdntT5FDqz7J?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbe2064-d80e-4c07-1704-08ddbae77b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 10:42:32.6283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6D5nfNVN8c/A+5/UV3lFQyJ5yeq951S1769PLz8fMnxPmU2hktuN6b+5cUU2yMhS3eYJOu5pGZS+P8Fcl2gAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB5840
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 10:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219916

Hi,=0A=
=0A=
as mentioned in a previous iteration of this patchset, this seems to be a f=
alse positive.=0A=
=0A=
Reported as https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15927 .=0A=
=0A=
Moritz=0A=

