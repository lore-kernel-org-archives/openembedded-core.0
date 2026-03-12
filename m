Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E4FED2F2
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:58:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17221.1773305909129879322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=pAUbJy3j;
 spf=pass (domain: siemens.com, ip: 40.107.162.21, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy33VsvivKTSR4L2xRjuagxnN0kPHPIx1ldZJrjCMonhPUmrlmAk5mOf9AEA2v+To8q3tGhdbW95PTLRquRG/WYBqX+LVxR7aqsaWwiQHwv+AoAGIhCcMCGrXbnUhIwI94fs1HUM87BjpfIwa6OJ27tyFfcrOsdwpYTk3LTxrBYInAaWTFT7+Ur8u5O184cSS7yhzpQPq9y53ifKihndcRG7IKxSgtyaWHqmawvTp1Q6+D7kUMGKMx79dzgWc3bc/SIUbtcXIx4FLKwkRXP6arnpZ/Wy/WXfZG0rf7X1iGuR4oPOeJNkXFZlI+E2k95da1sjlsksoWXUvv3LVgDI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcfulHWiQLDyCnxEk6Zljlu0xEj0/8D8UbbBBf6gAFU=;
 b=EwFGpBXUesGoiozsAIP04EP6ISdDkAsYhEOWUCRboHrkJNF6IPzXsRol/xPD6nX5lde0yX5Hnya7iq4DYxH3rOrIEpPB8MJrb0q3s0PI5LkcwwZG0uqCUQ6YrSsLcmk1nEY7JIp2yG21qquxzXUAbwrjWNNWePCXBCFNFJX0kNvtoMaj2of6x7kTAyrQ0+9yDkIJA4EFrajM/szq2Nxs8ndM0hUnfbJpg5H+ASA/q2JILg7XQHc7UeeOtuPNldz+c5ny9db8xvLAStvjdw618a0GYAvJdqdB339FA1AOk2CY7tYRMA9Nb+nm9jU0ai+HfgInxGLeaHs4Uzlg4bQeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcfulHWiQLDyCnxEk6Zljlu0xEj0/8D8UbbBBf6gAFU=;
 b=pAUbJy3jyRDW6h7RU1AJF8lYn9shezNsG2NUTwoCqs0bgiRHc9gV7eba746trO7EKojqrXE7Vao1rqN0fFKbfIKGX/U3gllDizBD5M4nJxgsyIr68cqQKNSPWmjYmMC7xW4l34fZ2JLg6nvLGF2GZISWKvUnYu1btoXl84pOP68xeRoeX6Lv3SIYK5c6XyY4N3P4PRl650M2biVgOs+y+JCxVghBq5qMLx6Iid8/W72cy3hN/UFs1NZiHCTCqSS0Tg9MEh8S0EME47CjbzOxHb3sn+2KpM9TUQJHOYGOr84trgSVji+yng0u0bC0E16cMMxH2c9do5M2HI9PHLdkzA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU4PR10MB9046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:563::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 08:58:24 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:58:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "deeratho@cisco.com" <deeratho@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: RE: Inquiry Regarding Package Upgrade Approach vs. Manual CVE Fixes
 in LTS Releases
Thread-Topic: Inquiry Regarding Package Upgrade Approach vs. Manual CVE Fixes
 in LTS Releases
Thread-Index: AQHcsfycPqcLW92Kh0u7xE5N1441srWql1SA
Date: Thu, 12 Mar 2026 08:58:23 +0000
Message-ID: 
 <AS1PR10MB56975F5D6969FA7DA67B247DFD44A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cd579e46-9090-4858-9ffd-e64688be2dba;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-12T08:53:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU4PR10MB9046:EE_
x-ms-office365-filtering-correlation-id: 20b2ccea-1340-41ab-1010-08de80158456
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|3613699012|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 RlwHxqZ9p2aZJ5gPQQ+Cx4GulXVMS8uvdGsza3MCojueeMv4b8qC1PGQ+v/zpTpLaLhHmL+1bZLzOuzdtQiYUsmmSDuJijJazdP5N58jFvSG7ZRHB8iLl+3IT7IcbkCeLg+t+Yt0pAcSE5m8sZLs6kmewZq9SVwNhBbToZdG+I0DzUBf1AvvcruTLcS+vSPfaCUaXMoir3Y2bU109EGE0wB1h7rrSrC7Hn/lzwr2timyS0suvoJnT5euiHbHAAkQDvhrUTvh4Z1Eh+RIWr0YxAvwkJDfUZyd+/Nm48e12kx7vWVI0hhv2DkcKw6rEIMrnyWOE2aRwlAQBxJqqUvyUkcJlQaKY9ibZLMkfRQsHitcgKMpO+/brckp6g1YHczecvffyEJHZrObb3xMvnqVR7cxXTBzJ1DqjfzMcpHvihP91qI9CT26tLvpZu7ErQBWDJtlk4nGFM5tDUBeiBCcmhdPp3W1azJ/S5w0fN4ltV5grjnVNrPXrBKq1NPc5x5fX1tDhitGiuVn+PG17OBruNdly3dGcOwO04gzk8rYCcchUSeqWC49j88fBUW45+Mv+QOaDbJDYKCCdvGJklyfZMpNLXkasAJ0uY5xzpQU/V93mBUcVAo2QN5zU8l33QtZssa8HQVeWb5vgpEti5J+4p8RN2Ag5el8qi9hjq865tdE8rcWXM3YRB9hjyBbZRleOZpXeaaHdI/zOQM4tgsN6o+xCY2isQ5RpNW+vPagdeLPnm8v/3MqXZJv0xdwkE0YGlPqnbDz/Cxieft+jr6lz5u1Rl6JBksI2ATzajtF3xGHvrP3EbwCqjPzWUXe6yV5KibSjNdLfEZA0KAKtnXcOA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(3613699012)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kiO6Sdd4JVqXZnR7BUu9AUWhjFdYRJLLpSuUc84OMO/z7uw9B7aQ4SEPpQeN?=
 =?us-ascii?Q?TnTWArFAFp4Ip0+S4YRfsMCqKQLZiVGKiVP16TJS4YgcTNpa3KOaHH7bLIj0?=
 =?us-ascii?Q?g76x6RvXxIG/Myfdu2VR1dmjvl2JlIpDV1hpmrLhbojpcWIh33yRRJ3kdiFi?=
 =?us-ascii?Q?57nq6lkgd2MlNjw00Z9b8nUNgoqnp3CoBHUctNhdKDLERnLKFYcxFxZT7Dui?=
 =?us-ascii?Q?xoV835Tnq9arpY6oQyY4h0n0yEE9oyMUXWSkhYRE2VrxZGUNS9Ae9R2jfizp?=
 =?us-ascii?Q?/y+qOBfLMwQrnh/Nyz2nIuueFSnhwbKoV5IA6p+DfElC9naIb1E6e3ZNMqyv?=
 =?us-ascii?Q?VEsdTPDfO+B5jO7ngqOt1c7Q5bQOFKh0MFfEYHglroIUBztsCSp0/adgTHEf?=
 =?us-ascii?Q?nGCk/8StlwiyvCBpS6ImxQLY8oDTp+5NwCT8HqdUnjCBtDB2/1KUg/yzpUSb?=
 =?us-ascii?Q?I1+EMqumzxgMTGxSlgohtBJeiD9xMZfM/0DtTPM1fcAFqweIS9q05eMOQZ37?=
 =?us-ascii?Q?AOk5hwQYj9zSKIDU1xMx8S0StzQGGlGUscUthld8NXpx314mKGPzTANZHard?=
 =?us-ascii?Q?+EeP9eh6sq7faUzDpCxDO99P2VR171bQ+06NV3jFoQqofuhgvYc3usPU6uvH?=
 =?us-ascii?Q?GMpg+BWpgubewdt+GENrUeAH9wmw0gqMOZub1gjVwh3OOrvmkkbunP1WWGzu?=
 =?us-ascii?Q?N8toU37aAmZi0vKCoDuXSsOpFa9unyTSXHNXKEfnXwxdDaM+YJVl27b9v9Y1?=
 =?us-ascii?Q?pd++j7V2+E17QZ231wXrdJRwJXSTB61fgK0sVQDCtgQ/TyEPjroisD5k+MiN?=
 =?us-ascii?Q?bFlsGJDXQzol2VJrfThPP9qjgstaNc7bPwOOYy0LsUEv5qFJCpK71wG5I1H+?=
 =?us-ascii?Q?sKBpqX/MdB2g0SuW+mq4Ni91qsAoeM+GRQSYrXu0Fjor6NQRcthSLJNwvaqG?=
 =?us-ascii?Q?GKRsOqU2GKAl1/4qIWSKG/5tzcSG0rPlG0dCsN4o7FtDFFDmCczZWt3sUZkJ?=
 =?us-ascii?Q?LY4oMcT8qQoQkN4VV36Nw6ak+SLYZTqjKXY1HHzmrWFYBCo998Jg2ovuAlxN?=
 =?us-ascii?Q?VeUeWz84UKkXIHkM7c3HXY13A8w5eF3XjQWlikEURrhTJ4rlkP0K5Wt7heNY?=
 =?us-ascii?Q?KI+VYRfrakdOkEl8LGpBxkUtAA/Z3S70TFPv/lQJkea2LUkjmJvouNL37YZ8?=
 =?us-ascii?Q?rmHsRFdOq7AJXnG+USvShy2I4esbXn3AZX1iNmMr9RC5GmbTV9vXi0zFxsBG?=
 =?us-ascii?Q?juMOBt4USYcnt0uF1hs3zQ6T1OrqyGDcKdqiSzEWWo4V8KeoZhNjpvCcsb4a?=
 =?us-ascii?Q?xQB4Y2f4fnaJUvhWqD934cjZIlU+GycNq61xx2pInGC3yIVOWtGja9IdGbiG?=
 =?us-ascii?Q?PNx6gQDNDsMatRYrSra/WBp1Mzkonx+YXFJkX7k9OPgZw8W9HWyOcS55vGGM?=
 =?us-ascii?Q?IWFV/zEqxM4XbhG99tCEpvPBGyB8EzuRV18HcXWLXLWqnP12UUvJyJKYNd9W?=
 =?us-ascii?Q?vK6AtF0fe0ByhTpXK3DtNl9FgJLUOyR7QSEBIqK7X3XCzJK7+LxM265JdY8V?=
 =?us-ascii?Q?449+AnQhvpFgwpzcJ6ZobLonknXw6abj5Cf8futOj5GZtGsI0tNWbYk0Q8xN?=
 =?us-ascii?Q?88dYlhR5CbTuX2pwngZcu392Yo8cNz401p7XvgvY7eMx42Ni3RKV8gkHrhAA?=
 =?us-ascii?Q?OmQWD0NFKq4VoLyINil2SjBqAFGswB4v1BSd2KcB9tps3DYhhg7X9M9HnghQ?=
 =?us-ascii?Q?eA/jBMl7dQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b2ccea-1340-41ab-1010-08de80158456
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:58:23.5375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mm96gCaUFTDxumiiVur44AIkuJcYu6rpJ6av2P/K5a8i/W4LH9RwvyL6Segenp3spPqc0jbbOBOZsjz/d0B2wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232933

Hello Deepak,
this was during last couple weeks and the decision is here:
https://lists.openembedded.org/g/openembedded-core/message/232562

Yoann,
It would be great if Yocto project would document this decision under follo=
wing page:
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
I'm not sure who can do that.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Deepak Rathore via
> lists.openembedded.org
> Sent: Thursday, March 12, 2026 9:46
> To: openembedded-core@lists.openembedded.org; Yoann Congal
> <yoann.congal@smile.fr>
> Cc: Viral Chavda (vchavda) <vchavda@cisco.com>
> Subject: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual =
CVE
> Fixes in LTS Releases
>=20
> Hi Yoann,
> I hope you are doing well.
> I am currently working for Cisco where our team focuses primarily on:
>=20
> *	CVE fixing for OSS packages
> *	Package upgrades
> *	LTP execution and validation
> *
> 	Package testing
>=20
> As part of our work, we also submit CVE fix patches to the community from=
 time
> to time whenever new vulnerabilities are reported.
> I am reaching out to understand more about the list of packages that the
> OpenEmbedded community prefers to upgrade directly instead of applying
> manual CVE backport fixes within LTS releases. Having this information wo=
uld help
> us align our internal workflows with the community strategy and avoid any
> duplication of effort.
> Could you please share the details or point me to the relevant documentat=
ion or
> list that outlines this package-upgrade policy for LTS?
> Thanks in advance for your support, and please let me know if any additio=
nal
> information is needed from my side.
> Best regards,
> Deepak Rathore

