Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF6D2168A
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:02:07 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45490.1764860523444738385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 07:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WhWmwH+f;
 spf=pass (domain: siemens.com, ip: 52.101.65.64, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reUpEWDNv/nNvB+f8jrmoPPgWteX9hy28WQSnPQOQC8TlEYWB8GIcri+1utJd7lisN/3Swbx97bQq6aqDvYOthd+iQSEVY3uk5M2UbC6SNxqFOb3JL1z1t/Q/Rk0xDlzQnI0O2WHjqW7nio3Bdj0eDDFHmvrn9PUxL5vSGrFXIdIy87NszGKVr9Bj3ago6BsHsMsggH0X6nqFweWjPQMnUa/4DZWQVcM3q1LbN1CnI7n4kfmUw7rX/q5Ov9YioIG3FjX/N0tgE2g6wjzrUW1XpEshGsfKHJDtVcG9aDovZnH/C/v7DNGBRkpGyHgteLwooA5f2Bjr6aFj78ZmNCOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RgULdCFVACbr+lsETYLKb2qNlHaRZZeS4snUpIZvow=;
 b=qmNspXxnlKEXfHXW5n8msImvMvyEv6BaBFuPQGJG51+tNPUeeGFikZe4hiTn4uqDDT6LLC1qeWg7Nx9QkJt28bZNGa1f2gsk8CwAoPB2lS0oj2SlbTvLMz6w3rX5dVujP73K266P9X403G1pj75S7la3h8N5qjCMo7gDa8mZ9u9ZHcam0UaBpn3Cq1R7PXj0ECo5EyPECzpJOT/VWUvG7aLfqUS6XXpdouJG0hXpPoAaM0guhauhd2eK6VvNjCJymZdCQTXfMra1Q7c5R5B6QoDq2CN3BuRUkSrrfEpVO4r819OKeP3eV4P/sp8wAWXtboqxsuaXHOnskLQOt007HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RgULdCFVACbr+lsETYLKb2qNlHaRZZeS4snUpIZvow=;
 b=WhWmwH+f5qII8EOul6yBWaQvPqlGRR6eECQ9lq8ACmsL6XqjozVpKlMJgvulAqT8Y+GBydIyoViLUPc6H3COzaO1pph6+VNSA9Zk8vXsshYdtf7WqgKnEsH2fePK1XTiIC/m64vstOqfzSXUnibJToBqrrD8O04QFU5gqC0CzUqv5FXnsMzB0z7EUXGEz1f3YztPX2qT2ETSuXFnV0QzjCUgKcT9dLfTNLRDA2jpX7M2IcJu4ot1gRytTG9yMjENOBPwewfZrxL3MhUJUzkCuKVkPTDrM5ZFaNICb78YfieISE4HH0pokRhJNIh0mR9bmqx6ckcy9d79IsSao45aQA==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by DU0PR10MB7457.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:422::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:01:58 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50:b275:11f4:adef]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::50:b275:11f4:adef%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 15:01:58 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Topic: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Index: AQHb1GD0aUSYMKpcc0OEPTqqoT5JarUSpQUAgAAFIb4=
Date: Thu, 4 Dec 2025 15:01:58 +0000
Message-ID: 
 <AS1PR10MB5724417B1328B03E60727C4E8EA6A@AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
 <20250603082419.409564-12-adrian.freihofer@siemens.com>
 <0d773cb9aace446eb588342c42d17916@diehl.com>
In-Reply-To: <0d773cb9aace446eb588342c42d17916@diehl.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-04T15:01:57.983Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|DU0PR10MB7457:EE_
x-ms-office365-filtering-correlation-id: 54fe9721-7ae4-4089-0c9f-08de33461295
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|31052699007|376014|1800799024|10070799003|39142699007|366016|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?zSxLIsX+PcB/jhTChRyQGEklob+9zgOgT2orCoYQzO1vmiSFiYWuwAFc/+?=
 =?iso-8859-1?Q?MTjz4cBB51J+/xYNAHtfO6Upkdvxy+EPrQohYBRItJJRdH1XIJiiQ47xgT?=
 =?iso-8859-1?Q?1oEYjUrvD4zJqzWL1jZ69gx9eDpolp7suLOleUtqRlLtcT4Ho6xwc5+fWB?=
 =?iso-8859-1?Q?c6nkBU3Kf/gZYDry/diOqFI8Zni6ItU143x5l50IOi+JY3roOJ9jz1FOFX?=
 =?iso-8859-1?Q?IweZin9bQpKq9hon4JFOji/e9oW4ATpfeL28bR2K2FK/h5IgS9EpdfcJRp?=
 =?iso-8859-1?Q?ufigfzUk0JiZoxFMSO/ITnK79vFowfG38v7bUVsy5vLA8Osvb78G+2CKQp?=
 =?iso-8859-1?Q?xGACJ1HxpaGIYKmWvYqF8xI0xF876abBEgvkCAzPWhqraWtT7tSLCxzwFp?=
 =?iso-8859-1?Q?t8gyCDFVGMXaIloNnOuEkLKjdlRudjrH+8jgnG0iGU9qqyOcPtUTkFTSm9?=
 =?iso-8859-1?Q?/uPxfdh7m1d0IxFHt6yML5msltn/ugHJoAL6E4qKIP4NanTXxhgQlj4tjP?=
 =?iso-8859-1?Q?ZfEj6MX/a0wSIGCI1B21DSEofXHDHY9Fc3vB3+q2gIbInMFwcLmoaNLCYI?=
 =?iso-8859-1?Q?LMhSXZuvlzDHn7p/H5Vb4WKcyd9c8qzzS3FDQf5xB7C06//9zL6TRcfB+b?=
 =?iso-8859-1?Q?K2YD5jS+8QnhdSF84mboiIKo7RXYnq2EjHhND34w0FTR0M9aNi9ynZFhce?=
 =?iso-8859-1?Q?RKpAyXF6gRJM00EHT6Lf8GtnD96BUzwHOPhyhPkDGsQI5763VAmJ0IreQw?=
 =?iso-8859-1?Q?n7ojeEetpoAfNdGJ51aNocUf+7yAfTaHrAwJK4ceAnPbBBhpU8DV49oElb?=
 =?iso-8859-1?Q?8v6Ly7uVf5r+vRaiRp0IheLBAtZIx6AAuQdKbv/+FS0HSV3fqfIknvoQo7?=
 =?iso-8859-1?Q?imGNkWul9CmyFDtY7hKsbCQuKx7x+Y9AGQTj0kjTZsTLwjyf/Tr+nN1j5p?=
 =?iso-8859-1?Q?7+bV2Y1EoeJoeMKb5YHETrIBTEDuJ5B8dz9k2UIswaqsC/q5bogZROn37Q?=
 =?iso-8859-1?Q?MikAjSRX8iurSMUoTqM/60N20Hf1y+BrgAmgcMCwsuNZu3NSZibx0ieIbA?=
 =?iso-8859-1?Q?2YjR016QDFXKAbuh4NPVZ7x+7kUbP4eBubq6N9QhaAgXDnI5Bj1WBCU8uw?=
 =?iso-8859-1?Q?lINXcHtIXnWMygT7acMVYWF8bEcZz9wZRH8SPmtnJZ/GOnJGgjlOeQIZrv?=
 =?iso-8859-1?Q?0LsVHo139hxvFdnyg1EorYI/Y3KK83VWhI6SnemLr4CRD58cP7xq9o/Og+?=
 =?iso-8859-1?Q?XB4paMaeLn6wb8fSpWpCHfmdvx01uvov9B3BghToY6KJOAmR5K56OHz6YB?=
 =?iso-8859-1?Q?B55Pir0b7gEN25mEKHmK3miCaAabyqzYlMrmOCyOCsw0p/eD1zrueOnufQ?=
 =?iso-8859-1?Q?GIDDTeDsht84nrRPqKMmsUEGtup37IeA9xQutrirdqIgWsHw7MRk8SBXQJ?=
 =?iso-8859-1?Q?PSEeqcx/XVHNjw1Dqs2pybTMEsAs//YOyzlz4FzSVx5HcaC1UQWr94DN2K?=
 =?iso-8859-1?Q?RCJXOFCiKmVZcBlQs1E2sfh2h/NHj+Yb6I3XxfP/KSmM+rHCzVdfr8/7VC?=
 =?iso-8859-1?Q?aTLkEl72o91UptMXCqj0pCGIoIU4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(376014)(1800799024)(10070799003)(39142699007)(366016)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TM/RY8VMpWZ530MED+oFM70T/hLAnWkC/B/aGhvcMDOQF+UK0VIWeCHdgf?=
 =?iso-8859-1?Q?ZhYBd4Lxl0usG3OjQyIE2/tYcWvnDxaC/LQ2J/UxvkCQss9Ami0l7Xl6p8?=
 =?iso-8859-1?Q?YaNjmqbH37tdVlcTLbin5s4ZoJQqiU3Pqqw8JRpGLpg5vnD0bbmAfdst2U?=
 =?iso-8859-1?Q?Rje5IIBfeZwORCJVhJ0PGVz43FoRohDHIF7CP34i+5Q6DpS+XBcdWERO1F?=
 =?iso-8859-1?Q?YCPPO6Aw1CiCjHJOAm10VSABOBdl9zyZBXxEKldSl31HTZjuhZQk1jH5tJ?=
 =?iso-8859-1?Q?t7tYMh4DPIgSDafVoA09QAjkAg3AahBd0JWCQXk5drRj3PtF/X5MgfMoBm?=
 =?iso-8859-1?Q?dozEBCEPP9royXryHrZz01lzIePgs4Uh1BHKKLwVFwBvIxdqihJc0aa5PY?=
 =?iso-8859-1?Q?+oVnrbpdCROytErQ/A4IMqBWrWmPxdlpeOF3cgVyaxmQgK2s9dQpQfuJwd?=
 =?iso-8859-1?Q?ByH+EVgdDl0i3ujjYUEwbMeT/nDDKYGAmHtBZx9VLZP/dJ8NpHQp3yQ7+1?=
 =?iso-8859-1?Q?AisSlAKEyBjdW/UKb7ST9jHnb7TzFlcvD0wEetceC4ZhdpiO3ZvguwUuk+?=
 =?iso-8859-1?Q?9/9bbAyjcTq+XnRT0MSBjRDARDMollCsQPPQ23enCiSatKvLFGiyEGBKYc?=
 =?iso-8859-1?Q?0DfHmYSGESAi4LAy8VGXl9cfSvz+JsbembMEcXX03qoJOvt4L11OEuVi2s?=
 =?iso-8859-1?Q?tY6eimh5OexPke77IGGVLsv85UsM52Qmz4QkJhODUQao6GaCWPdEdZroIO?=
 =?iso-8859-1?Q?5V/TRrmhe2qrg+jcDkRF5rXrJuS57Z7Y/UnzvxvkuYBiHS8zwPkNLyodQ2?=
 =?iso-8859-1?Q?Vy6Mf1w2Pdn1OzEGmaHVeWpuBadttWASNXlRYOg/g/j0k9YKpqLnL5Nu8V?=
 =?iso-8859-1?Q?tm26YWMZyIFH8dmMTNZQNx/LFLXseGQXDzL69fv3QmjAScT1Twq0wKUHFX?=
 =?iso-8859-1?Q?x+96qwj3dsAfITC/tT7PUjyyJ2tYNdSv7T7Ey/jlZEo/OYDIV1dCkRXcuW?=
 =?iso-8859-1?Q?Ez5rPqoWANU185kRCzMRCFtsgtjUipVC2ZSzeqk2LmQfTC3R8jLovfMMaU?=
 =?iso-8859-1?Q?VEXnGapNG5NPi1lGSPH0H5HlnTBuYJMYQOf5a+gWTkdUvSdwemrm0HvBaN?=
 =?iso-8859-1?Q?pyl6ZUL1Y9q1n9pEOMwHg+ZSX3hCVF2SIAtc3mqQHGXVe+qPRW8/rOt/Nk?=
 =?iso-8859-1?Q?HF5EmRNZ9rGFpjwXUberFdmlN8IXpwwc3v8kkyMJzLIm9IH7xoLIzzK1sU?=
 =?iso-8859-1?Q?5jsNtqRB0XKaLTu8/Nwl4EzECeEonOlZpsh3j2E/azrfsdyCD+g0TuPDB5?=
 =?iso-8859-1?Q?BPk+WS7in/rw1UgwnQUQ2TYGBeFu6259eUlRKFTTG1J0O2yFfX1BLPXxQf?=
 =?iso-8859-1?Q?6pmzxQETlJBaqDr/6m4Fbl0brZUOEfpGw/l7VNPg/bT4E4w8j/VW+Ehm1N?=
 =?iso-8859-1?Q?mLPFLwdTtOR51Lx3r2fhpdhZE4nq+0zBJt01pLwFNvEkB0dsQ1CPFuMhFt?=
 =?iso-8859-1?Q?BbWAEc3HwgXZbT/rouqdJAtux0doAYANbCTIZM72M4ekEs+dzmx9cRHnPJ?=
 =?iso-8859-1?Q?wgc8/mkxef2i6zl8GQbLRwXKiQFymgAj+BeCfNA7yNfmNI4MVW3gpmvbkD?=
 =?iso-8859-1?Q?AdyDYD4xDBGrtXofK8XNSTALFJaDEt1hFDV05RW5xHBKF3eiv7ziEcBL4Z?=
 =?iso-8859-1?Q?MoEGSsSjKbcUt1Op7JDRvvDhTag15eR8bl6AzbW5?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5724417B1328B03E60727C4E8EA6AAS1PR10MB5724EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fe9721-7ae4-4089-0c9f-08de33461295
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 15:01:58.5651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2kinmaClSFSjRe6MhkwS1QgB+sQTcF/YMGKpx6lmpGd1l0D9+qQVo85ABSocDBGa0vYEXfQm4jNY+u52IYlr2CKj95XAxTmgi0OsHATZuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227298

--_000_AS1PR10MB5724417B1328B03E60727C4E8EA6AAS1PR10MB5724EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Denis

I'm not entirely sure which FIT image implementation you are using: the one=
 from oe-core or the one from meta-openembedded. Since you are asking me pe=
rsonally, I assume it is the one from oe-core.

I suspect that the classes from meta-openembedded are not compatible with t=
he FIT image implementation in oe-core. But I'm probably not the right pers=
on to answer this question, as I don't even understand why a second FIT ima=
ge implementation was necessary instead of improving the one in oe-core. Fr=
om my perspective, it would probably be better to extend the run_mkimage_si=
gn function in oe-core with PKCS#11 support than to maintain a second FIT i=
mage implementation in meta-openembedded.

Another approach is to perform the signing within bitbake using a key from =
a file. Signing with a more secure PKCS#11 backend can be performed as a re=
-signing, which is done independently of bitbake as the final step in the r=
elease process.

Regards,
Adrian

--_000_AS1PR10MB5724417B1328B03E60727C4E8EA6AAS1PR10MB5724EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Denis</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'm not entirely sure which FIT image implementation you are using: the one=
 from oe-core or the one from meta-openembedded. Since you are asking me pe=
rsonally, I assume it is the one from oe-core.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I suspect that the classes from meta-openembedded are not compatible with t=
he FIT image implementation in oe-core. But I'm probably not the right pers=
on to answer this question, as I don't even understand why a second FIT ima=
ge implementation was necessary
 instead of improving the one in oe-core. From my perspective, it would pro=
bably be better to extend the run_mkimage_sign function in oe-core with PKC=
S#11 support than to maintain a second FIT image implementation in meta-ope=
nembedded.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Another approach is to perform the signing within bitbake using a key from =
a file. Signing with a more secure PKCS#11 backend can be performed as a re=
-signing, which is done independently of bitbake as the final step in the r=
elease process.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Adrian</div>
</body>
</html>

--_000_AS1PR10MB5724417B1328B03E60727C4E8EA6AAS1PR10MB5724EURP_--

