Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143ABE6529D
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 16:33:42 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32807.1769963618263543420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 08:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=sicb5csz;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.46, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA2wy3Till5aaKrvUSuikrohMRraZ4EC/vURm535Ds7P2RM2Wx5ZN4LRx/73y0iI3R1BMjXrnDc71p1KW+WSDlzbDsm7SWoby1JDOwF1cN1p1zSeHKWmFdBDKzA9PaznxG2yOGXJktIgcx9VZRnx26VGZV1IjneOO4rZIAm/cttNstVHh5BkZMwDSdDwD3TpM79fmSO6IiFNJX008IfnAZcg9Iu6jc3k3PYNGBdySlj9rlKMgxCOcAmxYdgA+HPd0RGoU+l+CdO/O/1J8kJAzK/oDZ7jbR0zJqarY66UxESYAM3jy+OgNVb7QAaVvmGlAQfED+cbG4PK8WJ+Yk/y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SIQgIB7yYuk2Eta8hqxeAVzGc8OoL5p1/DLSQGuQMk=;
 b=GKJyNGPobzlUCqdB+Hynegt9NRkYE4rX35h9cNOEBpC86GZ0s8QRNrDQdupqKMJZEugNwfilgLbauNcOLo/VZlN37Z0iULCGg+WffDbRuD0oabKN05mmj2rGvrdsKNMXQ59vkdutUaoxfdolksv7KCI3MmjbEuhE/HgzvO7gUb7/WT+WKf3099v1Vdqk5MhT4bHTUfDPo0SuqVqeDPJMPEDLmXdzb84TIsyK4XhNpQdX7fa6ldVY/mgaueGUEf4zcWZHdUsiNNHKeVhxQyK5EcWEqZLvNkAdjAfY6jOqQUsVlnqb8ooQ7QcQa5JStOHAQAILfHyPHrA7wMVnstj1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SIQgIB7yYuk2Eta8hqxeAVzGc8OoL5p1/DLSQGuQMk=;
 b=sicb5cszXHEvdXE16Cb0WqQrmf6ORFE1L8I6uVB+I+XQrYRPtNicbuBAaBBkXxdTrs5kZhjnOpoLzUfE52YwWplUeB4lOIbvE7RiZKXwkjAcbe232vy3pqeqrmOd0WLRXgcvi9cw/MTAievbqg/ZQnt217nUhZU0H15dQjwHkekaaysN7l3KYoHGmA8bW57XzKU58ycsfwFUQkQTxy56tBOR2PcEVXjL7JmjdopDUzcvtjk6loTpsC9Txlgu95MM2hD6PORin4zmJGc5TpQcktkgNpuLd8SPhpV2Z1qamQuGwsGOWeSXsZhRXxSvbWvSvAFq9BuprnZ+IcPNFAQwww==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by PN6P287MB5247.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:302::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Sun, 1 Feb
 2026 16:33:30 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::7264:345e:328b:b469]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::7264:345e:328b:b469%5]) with mapi id 15.20.9587.010; Sun, 1 Feb 2026
 16:33:29 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [poky][scarthgap][PATCH] improve_kernel_cve_report: add script
 for postprocesing of kernel CVE data
Thread-Topic: [poky][scarthgap][PATCH] improve_kernel_cve_report: add script
 for postprocesing of kernel CVE data
Thread-Index: AQHciUfxwdpx2uoQDEOSkbuNDivCjLVuHNr9
Date: Sun, 1 Feb 2026 16:33:29 +0000
Message-ID: 
 <MAXP287MB42409B58ADEACA9F748E644DEE9DA@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260119133103.1151201-1-suresh.ha@bmwtechworks.in>
In-Reply-To: <20260119133103.1151201-1-suresh.ha@bmwtechworks.in>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|PN6P287MB5247:EE_
x-ms-office365-filtering-correlation-id: 2bb24ddf-8980-4e99-0073-08de61afa20c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?NvKiaWwd83+Mob2dpvew8CzDdsYNdh2X57cJL99vKfg1B/iOrVV+vmzTHP3Z?=
 =?us-ascii?Q?LPTEGhcvJBujp6IV58VTo1NNIoLur8M1EEukwtisTEbebLAb4+Fsp+g05BzP?=
 =?us-ascii?Q?88ozYLK6+GTU/R5k5+iZG86PwXITwpa61ja5nh3N5qFor1aScakxxTrQRQTI?=
 =?us-ascii?Q?VzP6/M4CAxP2EFyILRBkm4f48DX60k0OTVoGRR2SiXwY3Y8ebYRL7F4uwGCP?=
 =?us-ascii?Q?Q2f0LXQE1mSxYKJrIbO1REIghBAn14qRPehu9yqWatd6Pjad6ZHKayZH1n3i?=
 =?us-ascii?Q?+rbXcjpCcTstKaHDV0N5KZBlqvlg6rdLJzuOs9N4XIs+94gm7Cjz/YCYsScg?=
 =?us-ascii?Q?8hNE0l0OUgvpsh8nBW2VQTvojQZJLK15sUSi6L9NMplfHfChBDqmp5IjJJkB?=
 =?us-ascii?Q?liEcsdghY5YE1ertRomqTKNevn84t7XXi92NXaEuvUyEEzat8NAUi+0rPgmb?=
 =?us-ascii?Q?CL/ikuJFou8k6yej+vL72Jflj7m4T0dO55SAafCnEvaTNRr4SnWvjdBAoq6Z?=
 =?us-ascii?Q?bfXp+q/vksCBHfpTpdQv2FgXwtmkgMPC0hF1wh50o+7+B02yxSKdVY2oxhO6?=
 =?us-ascii?Q?32nKBv2TI8JDlnOB0EF1hp6NSpP5hsiHCebU40YYZ+AZ0CvyvwWX+Qc3gzL1?=
 =?us-ascii?Q?+3ZjuspCyNXf5M7jKwgTUMIuNfNwy9Y8EXibXH6LuE8OH/3P94uh3stNArii?=
 =?us-ascii?Q?5ATPF/V/G8yrCvozjzrAT0rNZTe6LePy/kfFwqnXMohaqGnix4dr8lvobPmi?=
 =?us-ascii?Q?RGgk6UVgK1/DS6aw85EdQcPj833/k4gxUJH3W0wOWbocYWwjC53Gn6My1XYz?=
 =?us-ascii?Q?1s6/ozryAlZF2bEPeAZYiGA51WZTHC1djC+oxY97KxSkXJW1o0WOAIfb5szT?=
 =?us-ascii?Q?V4cEF02eFauxMS6Tj+0y4sPhfdHix75tsKT4wBz3KoAf/1hNLHXJJllpPKzt?=
 =?us-ascii?Q?I5fYno3rfXdd0Xsw1iiWTDEaEQ0cdxuSQ1DtdbpmHRBBSrstlp3F6PJquXo/?=
 =?us-ascii?Q?8tFUZ19aepoCBt7bSCOo6OyV1qxz/z6H9opeal3RxjO+Gqg3RADRTmbyWc0I?=
 =?us-ascii?Q?c2Dgs1Ti47E6WIqaC7qQAY8TWllFNa86z3Ii99WHgeWRVLEhDos0iupxj8yY?=
 =?us-ascii?Q?PKIC9vZ70wqktv3HBr6cC8HcQ/kSY75f8GRtIfW19oqFEh+jB495cuEG7jpb?=
 =?us-ascii?Q?VRyDW1o6yuLlvA0D6dSpOZHEAMoKavFVwYdSgjqBsEiB3zRx7Z3QJLjTQv9s?=
 =?us-ascii?Q?W1WUBl78+UPd5NcdXyG0Dvw77mV72wLyGhZdUewtVSghMA9C0LOY9TIY9+Fb?=
 =?us-ascii?Q?sxrPMskXatN5s6xIw34yNbLXoovxjBwvL7kjv5nL1ONes2pnMcrmyLT+DgKO?=
 =?us-ascii?Q?ML/Sp9XVj1peeriXIgZh5eTKlM7BbSZlju8fHhLQD2PU6FJjbjL4zSVi6D9W?=
 =?us-ascii?Q?nBFKkFbAJZHs0XKeWXwkZZ3X9UIwXaESTvyGBl7vQ+xjfRbLFnI05DZjXg6W?=
 =?us-ascii?Q?5XQoWswCnmkhZMpxEYUAfVF/WmxH/HjS8gv2ptBNAG5wXP5un3Fet6vxZj1d?=
 =?us-ascii?Q?JM+ezD8auhOm/RZptHSx2r06LPorckXSzIKpdVFXU+plE8BBMfQuHIqFs9Cg?=
 =?us-ascii?Q?abZZ7C7/kJa6bRK98KIo44E=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JxdMp5bJSXs8j6tEMXnltPJAOQR61Dc02fT4gSy3Vib87T9yxb0yICV2g85B?=
 =?us-ascii?Q?OpoT7ND4t7bMD6MeQhtv4/vhHib58lDIA0BnaWFr5AaUdjaY99/QXwhqJL4V?=
 =?us-ascii?Q?TSFIWGHN00QGE3gmnOE9UBSP+xp/8HZhM9O4sOCHu8VhWbZfyUzaA9izGyrP?=
 =?us-ascii?Q?rRp5+CaxdkXKajv+528uT9J4+57zvdWv5e6sOwY8rrzJXQFrmeBdCcgLdk8f?=
 =?us-ascii?Q?A30hbVBxQZ9EomDMQfslsxG8/O6vP1tk8DYQsnkCAL37H7M8w+cmM8RJPTj7?=
 =?us-ascii?Q?1onIncjc3ttFSXBrbqNlmI5E2jdIxuETmpw83cvsIxy3IU8ISLmvLBJpBnX0?=
 =?us-ascii?Q?vcoL1whEzY5t0oZWaEagxA27z9tZdiiM7/+Bhc1FPvzscvi6hwBnHMo5tE96?=
 =?us-ascii?Q?0k0NFNCC1mIbm/lnrCHZCdTFlgK3LENJoRRuSUkhsXnXsBhA/9fxk62lnsmn?=
 =?us-ascii?Q?r9SIXcYH178UuQXg0wiG6zl4i8mkotXyTU422kUCuKYy1Gb1Y2Xhn3WB8XME?=
 =?us-ascii?Q?AfFx5kkVPb8SPaVJGQnSeZ5iLCTnE+gJxtF7h6gfyZeMiXx4l3M+KKNevItZ?=
 =?us-ascii?Q?Oxiel+SZDMYTB/TB28ajsMRn9ZmYXKsu1YZIC0O5KZwqHyaZakJzhiXsl6OO?=
 =?us-ascii?Q?orzaC7TbaynbZAEzbcc16/2TxsV9PFslwx1Fm/ygJJCqKRlBLH6OzX+tivBD?=
 =?us-ascii?Q?C0jIyzhCioNKeMhRnL86JuL5rQWpFxr0foDpQUlCKjvCVgQZMDVoM3rc8n4g?=
 =?us-ascii?Q?1HYvwI0N23os0pkVsR8Tv477bSc4YCGHlE/bYRqk9Vcw4zIh1+1yRXXhHlrS?=
 =?us-ascii?Q?cBopGYX2LEgcseodjgLBFCSbDwGxnaKzxSnfhCJdVnnRezASaq5ep4S0dnC7?=
 =?us-ascii?Q?tAvinOM/gDchI0HdQ1dnvAYh2Sw1rQZdPGJUHUnPhqAFmBt76IYu2DrACcei?=
 =?us-ascii?Q?7feb5IrsNXmKvAf6y6VW6vmn6qXtRpccg7kyxQXS94c0rjHKzmVm1eBYFrR1?=
 =?us-ascii?Q?F7mmK18xjvYBX9ceA8qVjD6XvyhnxKDo2vIh6fq5APA1NpYPX6XYsHVCrq8f?=
 =?us-ascii?Q?7SPZah9msk3XERu+mfYH2PJcOO40pp7baNFyV1SyLazXFMpWIM+MTcZQpML5?=
 =?us-ascii?Q?IZjT6rs10JSq4+SI0bgNCuOsXhezVAvdsN+a9ggiX/xScYugNXiokyrLP8O9?=
 =?us-ascii?Q?65xYWMkviDBFFFQ2L3W4tlRMb2G8Xb+kKruJHolfiLrLuVU8Iy/RL3U4MEJi?=
 =?us-ascii?Q?Xd/f5RX4HlNLGKaF4hy3FdarRcEqjg/9wSscHHaCu+XAKZWSIo4pIkO7nL70?=
 =?us-ascii?Q?GMtXsEb+h/EFXPyekcqTC3QIrxGdIPSuHZMrkBpfZFU337TJnz4gHgt5NovS?=
 =?us-ascii?Q?wneMm7kq1X/OYug7OyyJR/wZNCNUnw5zN415SuNUOYdTwk0AjWCFYFRC+Fj0?=
 =?us-ascii?Q?DKVut10xeF76fkg15tNu6s1Cxga1WQPo3rAIzLolhkDn+hjdrZ8hYD/3TePY?=
 =?us-ascii?Q?QTUwgUZDBw5ogtvbmqVBeyv38XLVwnKz9Uyz6uO9zwe/Aj4tLoaJPjzove3m?=
 =?us-ascii?Q?SnjjiOHJPZajl1nQd0qL4F/+p2Vufr8epDGJpELfhjq2RaGveXbVZ88juVbk?=
 =?us-ascii?Q?EoTFKtkz6szojM9TpOo6PfHJG986MmrBcuUhpxvg6apxxm9lM+xLYZgsO80G?=
 =?us-ascii?Q?in/7Qw/iosgTt0EeVOYbuUCoDIfRE8r6PWkQjnytZYqDN52na58c33u1vMtu?=
 =?us-ascii?Q?QSzrR7ncLhMintn5RqZkJDhaz+XsEl4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB42409B58ADEACA9F748E644DEE9DAMAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb24ddf-8980-4e99-0073-08de61afa20c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2026 16:33:29.8470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEgAl6KAZklIj43JVjZwbnPhhIynyQCkJdmz+kNz39TUJBhSi3n4xoWnHz963Rx4YHZgESqc91+I40SmkpGyJcHcIQOlek+c/8huRHdrKWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 16:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230338

--_000_MAXP287MB42409B58ADEACA9F748E644DEE9DAMAXP287MB4240INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello maintainers,


Could you please let me know whether this backport is being considered, or =
if any additional information or changes are required?


In addition, I noticed a few other related fixes in the mainline branch whi=
ch may also be relevant for scarthgap. Please let me know if you would pref=
er that I submit separate backport patches for those changes as well.


The fix is relevant for the scarthgap as well, and I would appreciate any g=
uidance on the status of backport.

Thanks,
Suresh H A
________________________________
From: Suresh H A <Suresh.HA@bmwtechworks.in>
Sent: Monday, January 19, 2026 7:01:03 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Suresh H A <Suresh.HA@bmwtechworks.in>
Cc: Daniel Turull <daniel.turull@ericsson.com>; Peter Marko <peter.marko@si=
emens.com>; Marta Rybczynska <rybczynska@gmail.com>; Mathieu Dubois-Briand =
<mathieu.dubois-briand@bootlin.com>; Richard Purdie <richard.purdie@linuxfo=
undation.org>
Subject: [poky][scarthgap][PATCH] improve_kernel_cve_report: add script for=
 postprocesing of kernel CVE data

From: Daniel Turull <daniel.turull@ericsson.com>

Adding postprocessing script to process data from linux CNA that includes m=
ore accurate metadata and it is updated directly by the source.

Example of enhanced CVE from a report from cve-check:

{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&data=3D05%7C02%7Csuresh.h=
a%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c=
56488f3c61cd05%7C0%7C0%7C639044263030909714%7CUnknown%7CTWFpbGZsb3d8eyJFbXB=
0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj=
oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DBsKNia%2BODStTgGaRUtZpglMWs7s5Tn0cSH06R%2FN=
gTK0%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2024-26710>",
  "summary": "In the Linux kernel, the following vulnerability [...]",
  "scorev2": "0.0",
  "scorev3": "5.5",
  "scorev4": "0.0",
  "modified": "2025-03-17T15:36:11.620",
  "vector": "LOCAL",
  "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

And same from a report generated with vex:
{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&data=3D05%7C02%7Csuresh.h=
a%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c=
56488f3c61cd05%7C0%7C0%7C639044263030930030%7CUnknown%7CTWFpbGZsb3d8eyJFbXB=
0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj=
oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DbNwat5zDiTj6qNii7ZwAO2nW%2BWr0tpn1FqDMVrT%2=
FkjE%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2024-26710>",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

For unpatched CVEs, provide more context in the description:
Tested with 6.12.22 kernel
{
  "id": "CVE-2025-39728",
  "status": "Unpatched",
  "link": "https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2025-39728&data=3D05%7C02%7Csuresh.h=
a%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c=
56488f3c61cd05%7C0%7C0%7C639044263030942329%7CUnknown%7CTWFpbGZsb3d8eyJFbXB=
0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj=
oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D%2FbXetEZuocKcHrchGkGoLU2rKhPy605fM%2BRygKf=
w10I%3D&reserved=3D0<https://nvd.nist.gov/vuln/detail/CVE-2025-39728>",
  "summary": "In the Linux kernel, the following vulnerability has been [..=
.],
  "scorev2": "0.0",
  "scorev3": "0.0",
  "scorev4": "0.0",
  "modified": "2025-04-21T14:23:45.950",
  "vector": "UNKNOWN",
  "vectorString": "UNKNOWN",
  "detail": "version-in-range",
  "description": "Needs backporting (fixed from 6.12.23)"
},

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
---
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 1 file changed, 467 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
new file mode 100755
index 0000000000..829cc4cd30
--- /dev/null
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -0,0 +1,467 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# The script uses another source of CVE information from linux-vulns
+# to enrich the cve-summary from cve-check or vex.
+# It can also use the list of compiled files from the kernel spdx to ignor=
e CVEs
+# that are not affected since the files are not compiled.
+#
+# It creates a new json file with updated CVE information
+#
+# Compiled files can be extracted adding the following in local.conf
+# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
+#
+# Tested with the following CVE sources:
+# - https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&data=3D05%7C02%7Csu=
resh.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd1031=
4cc68c56488f3c61cd05%7C0%7C0%7C639044263030955837%7CUnknown%7CTWFpbGZsb3d8e=
yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs=
IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DkgOmuhM5qTAwa3AODvJoeFc6pUz%2FeTmTkSd=
W1RJOiqY%3D&reserved=3D0<https://git.kernel.org/pub/scm/linux/security/vuln=
s.git>
+# - https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2FCVEProject%2FcvelistV5&data=3D05%7C02%7Csuresh.ha%40bmwtechworks=
.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c61cd05%7=
C0%7C0%7C639044263030969928%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7=
C%7C%7C&sdata=3DtYCYdFOW5WGgUSVUKSt02HMCe8ynmRzOu78YCO%2Fi2UI%3D&reserved=
=3D0<https://github.com/CVEProject/cvelistV5>
+#
+# Example:
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --kernel-version 6.12.27 --datadir ./vulns
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
+#
+# SPDX-License-Identifier: GPLv2
+
+import argparse
+import json
+import sys
+import logging
+import glob
+import os
+import pathlib
+from packaging.version import Version
+
+def is_linux_cve(cve_info):
+    '''Return true is the CVE belongs to Linux'''
+    if not "affected" in cve_info["containers"]["cna"]:
+        return False
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        if not "product" in affected:
+            return False
+        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D "Linux":
+            return True
+    return False
+
+def get_kernel_cves(datadir, compiled_files, version):
+    """
+    Get CVEs for the kernel
+    """
+    cves =3D {}
+
+    check_config =3D len(compiled_files) > 0
+
+    base_version =3D Version(f"{version.major}.{version.minor}")
+
+    # Check all CVES from kernel vulns
+    pattern =3D os.path.join(datadir, '**', "CVE-*.json")
+    cve_files =3D glob.glob(pattern, recursive=3DTrue)
+    not_applicable_config =3D 0
+    fixed_as_later_backport =3D 0
+    vulnerable =3D 0
+    not_vulnerable =3D 0
+    for cve_file in sorted(cve_files):
+        cve_info =3D {}
+        with open(cve_file, "r", encoding=3D'ISO-8859-1') as f:
+            cve_info =3D json.load(f)
+
+        if len(cve_info) =3D=3D 0:
+            logging.error("Not valid data in %s. Aborting", cve_file)
+            break
+
+        if not is_linux_cve(cve_info):
+            continue
+        cve_id =3D os.path.basename(cve_file)[:-5]
+        description =3D cve_info["containers"]["cna"]["descriptions"][0]["=
value"]
+        if cve_file.find("rejected") >=3D 0:
+            logging.debug("%s is rejected by the CNA", cve_id)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Ignored",
+                "detail": "rejected",
+                "summary": description,
+                "description": f"Rejected by CNA"
+            }
+            continue
+        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g"]):
+            continue
+
+        is_vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected_versions =3D get_cpe_applicability(cve_info, ve=
rsion)
+
+        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id, is_vulnerable,=
 better_match_first, better_match_last, first_affected, last_affected)
+
+        if is_vulnerable is None:
+            logging.warning("%s doesn't have good metadata", cve_id)
+        if is_vulnerable:
+            is_affected =3D True
+            affected_files =3D []
+            if check_config:
+                is_affected, affected_files =3D check_kernel_compiled_file=
s(compiled_files, cve_info)
+
+            if not is_affected and len(affected_files) > 0:
+                logging.debug(
+                    "%s - not applicable configuration since affected file=
s not compiled: %s",
+                    cve_id, affected_files)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Ignored",
+                    "detail": "not-applicable-config",
+                    "summary": description,
+                    "description": f"Source code not compiled by config. {=
affected_files}"
+                }
+                not_applicable_config +=3D1
+            # Check if we have backport
+            else:
+                if not better_match_last:
+                    fixed_in =3D last_affected
+                else:
+                    fixed_in =3D better_match_last
+                logging.debug("%s needs backporting (fixed from %s)", cve_=
id, fixed_in)
+                cves[cve_id] =3D {
+                        "id": cve_id,
+                        "status": "Unpatched",
+                        "detail": "version-in-range",
+                        "summary": description,
+                        "description": f"Needs backporting (fixed from {fi=
xed_in})"
+                }
+                vulnerable +=3D 1
+                if (better_match_last and
+                    Version(f"{better_match_last.major}.{better_match_last=
.minor}") =3D=3D base_version):
+                    fixed_as_later_backport +=3D 1
+        # Not vulnerable
+        else:
+            if not first_affected:
+                logging.debug("%s - not known affected %s",
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": "No CPE match"
+                }
+                not_vulnerable +=3D 1
+                continue
+            backport_base =3D Version(f"{better_match_last.major}.{better_=
match_last.minor}")
+            if version < first_affected:
+                logging.debug('%s - fixed-version: only affects %s onwards=
',
+                              cve_id,
+                              first_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"only affects {first_affected} onwards=
"
+                }
+                not_vulnerable +=3D 1
+            elif last_affected <=3D version:
+                logging.debug("%s - fixed-version: Fixed from version %s",
+                              cve_id,
+                              last_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"fixed-version: Fixed from version {la=
st_affected}"
+                }
+                not_vulnerable +=3D 1
+            elif backport_base =3D=3D base_version:
+                logging.debug("%s - cpe-stable-backport: Backported in %s"=
,
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "cpe-stable-backport",
+                    "summary": description,
+                    "description": f"Backported in {better_match_last}"
+                }
+                not_vulnerable +=3D 1
+            else:
+                logging.debug("%s - version not affected %s", cve_id, str(=
affected_versions))
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": f"Range {affected_versions}"
+                }
+                not_vulnerable +=3D 1
+
+    logging.info("Total CVEs ignored due to not applicable config: %d", no=
t_applicable_config)
+    logging.info("Total CVEs not vulnerable due version-not-in-range: %d",=
 not_vulnerable)
+    logging.info("Total vulnerable CVEs: %d", vulnerable)
+
+    logging.info("Total CVEs already backported in %s: %s", base_version,
+                    fixed_as_later_backport)
+    return cves
+
+def read_spdx(spdx_file):
+    '''Open SPDX file and extract compiled files'''
+    with open(spdx_file, 'r', encoding=3D'ISO-8859-1') as f:
+        spdx =3D json.load(f)
+        if "spdxVersion" in spdx:
+            if spdx["spdxVersion"] =3D=3D "SPDX-2.2":
+                return read_spdx2(spdx)
+        if "@graph" in spdx:
+            return read_spdx3(spdx)
+    return []
+
+def read_spdx2(spdx):
+    '''
+    Read spdx2 compiled files from spdx
+    '''
+    cfiles =3D set()
+    if 'files' not in spdx:
+        return cfiles
+    for item in spdx['files']:
+        for ftype in item['fileTypes']:
+            if ftype =3D=3D "SOURCE":
+                filename =3D item["fileName"][item["fileName"].find("/")+1=
:]
+                cfiles.add(filename)
+    return cfiles
+
+def read_spdx3(spdx):
+    '''
+    Read spdx3 compiled files from spdx
+    '''
+    cfiles =3D set()
+    for item in spdx["@graph"]:
+        if "software_primaryPurpose" not in item:
+            continue
+        if item["software_primaryPurpose"] =3D=3D "source":
+            filename =3D item['name'][item['name'].find("/")+1:]
+            cfiles.add(filename)
+    return cfiles
+
+def check_kernel_compiled_files(compiled_files, cve_info):
+    """
+    Return if a CVE affected us depending on compiled files
+    """
+    files_affected =3D set()
+    is_affected =3D False
+
+    for item in cve_info['containers']['cna']['affected']:
+        if "programFiles" in item:
+            for f in item['programFiles']:
+                if f not in files_affected:
+                    files_affected.add(f)
+
+    if len(files_affected) > 0:
+        for f in files_affected:
+            if f in compiled_files:
+                logging.debug("File match: %s", f)
+                is_affected =3D True
+    return is_affected, files_affected
+
+def get_cpe_applicability(cve_info, v):
+    '''
+    Check if version is affected and return affected versions
+    '''
+    base_branch =3D Version(f"{v.major}.{v.minor}")
+    affected =3D []
+    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
+        return None, None, None, None, None, None
+
+    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
+        for node in nodes.values():
+            vulnerable =3D False
+            matched_branch =3D False
+            first_affected =3D Version("5000")
+            last_affected =3D Version("0")
+            better_match_first =3D Version("0")
+            better_match_last =3D Version("5000")
+
+            if len(node[0]['cpeMatch']) =3D=3D 0:
+                first_affected =3D None
+                last_affected =3D None
+                better_match_first =3D None
+                better_match_last =3D None
+
+            for cpe_match in node[0]['cpeMatch']:
+                version_start_including =3D Version("0")
+                version_end_excluding =3D Version("0")
+                if 'versionStartIncluding' in cpe_match:
+                    version_start_including =3D Version(cpe_match['version=
StartIncluding'])
+                else:
+                    version_start_including =3D Version("0")
+                # if versionEndExcluding is missing we are in a branch, wh=
ich is not fixed.
+                if "versionEndExcluding" in cpe_match:
+                    version_end_excluding =3D Version(cpe_match["versionEn=
dExcluding"])
+                else:
+                    # if versionEndExcluding is missing we are in a branch=
, which is not fixed.
+                    version_end_excluding =3D Version(
+                        f"{version_start_including.major}.{version_start_i=
ncluding.minor}.5000"
+                    )
+                affected.append(f" {version_start_including}-{version_end_=
excluding}")
+                # Detect if versionEnd is in fixed in base branch. It has =
precedence over the rest
+                branch_end =3D Version(f"{version_end_excluding.major}.{ve=
rsion_end_excluding.minor}")
+                if branch_end =3D=3D base_branch:
+                    if version_start_including <=3D v < version_end_exclud=
ing:
+                        vulnerable =3D cpe_match['vulnerable']
+                    # If we don't match in our branch, we are not vulnerab=
le,
+                    # since we have a backport
+                    matched_branch =3D True
+                    better_match_first =3D version_start_including
+                    better_match_last =3D version_end_excluding
+                if version_start_including <=3D v < version_end_excluding =
and not matched_branch:
+                    if version_end_excluding < better_match_last:
+                        better_match_first =3D max(version_start_including=
, better_match_first)
+                        better_match_last =3D min(better_match_last, versi=
on_end_excluding)
+                        vulnerable =3D cpe_match['vulnerable']
+                        matched_branch =3D True
+
+                first_affected =3D min(version_start_including, first_affe=
cted)
+                last_affected =3D max(version_end_excluding, last_affected=
)
+            # Not a better match, we use the first and last affected inste=
ad of the fake .5000
+            if vulnerable and better_match_last =3D=3D Version(f"{base_bra=
nch}.5000"):
+                better_match_last =3D last_affected
+                better_match_first =3D first_affected
+    return vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected
+
+def copy_data(old, new):
+    '''Update dictionary with new entries, while keeping the old ones'''
+    for k in new.keys():
+        old[k] =3D new[k]
+    return old
+
+# Function taken from cve_check.bbclass. Adapted to cve fields
+def cve_update(cve_data, cve, entry):
+    # If no entry, just add it
+    if cve not in cve_data:
+        cve_data[cve] =3D entry
+        return
+    # If we are updating, there might be change in the status
+    if cve_data[cve]['status'] =3D=3D "Unknown":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if cve_data[cve]['status'] =3D=3D entry['status']:
+        return
+    if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
+        logging.warning("CVE entry %s update from Patched to Unpatched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if entry['status'] =3D=3D "Patched" and cve_data[cve]['status'] =3D=3D=
 "Unpatched":
+        logging.warning("CVE entry %s update from Unpatched to Patched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    # If we have an "Ignored", it has a priority
+    if cve_data[cve]['status'] =3D=3D "Ignored":
+        logging.debug("CVE %s not updating because Ignored", cve)
+        return
+    # If we have an "Ignored", it has a priority
+    if entry['status'] =3D=3D "Ignored":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        logging.debug("CVE entry %s updated from Unpatched to Ignored", cv=
e)
+        return
+    logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s=
",
+        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['sta=
tus'], entry['detail'])
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D"Update cve-summary with kernel compiled files and k=
ernel CVE information"
+    )
+    parser.add_argument(
+        "-s",
+        "--spdx",
+        help=3D"SPDX2/3 for the kernel. Needs to include compiled sources"=
,
+    )
+    parser.add_argument(
+        "--datadir",
+        type=3Dpathlib.Path,
+        help=3D"Directory where CVE data is",
+        required=3DTrue
+    )
+    parser.add_argument(
+        "--old-cve-report",
+        help=3D"CVE report to update. (Optional)",
+    )
+    parser.add_argument(
+        "--kernel-version",
+        help=3D"Kernel version. Needed if old cve_report is not provided (=
Optional)",
+        type=3DVersion
+    )
+    parser.add_argument(
+        "--new-cve-report",
+        help=3D"Output file",
+        default=3D"cve-summary-enhance.json"
+    )
+    parser.add_argument(
+        "-D",
+        "--debug",
+        help=3D'Enable debug ',
+        action=3D"store_true")
+
+    args =3D parser.parse_args()
+
+    if args.debug:
+        log_level=3Dlogging.DEBUG
+    else:
+        log_level=3Dlogging.INFO
+    logging.basicConfig(format=3D'[%(filename)s:%(lineno)d] %(message)s', =
level=3Dlog_level)
+
+    if not args.kernel_version and not args.old_cve_report:
+        parser.error("either --kernel-version or --old-cve-report are need=
ed")
+        return -1
+
+    # by default we don't check the compiled files, unless provided
+    compiled_files =3D []
+    if args.spdx:
+        compiled_files =3D read_spdx(args.spdx)
+        logging.info("Total compiled files %d", len(compiled_files))
+
+    if args.old_cve_report:
+        with open(args.old_cve_report, encoding=3D'ISO-8859-1') as f:
+            cve_report =3D json.load(f)
+    else:
+        #If summary not provided, we create one
+        cve_report =3D {
+            "version": "1",
+            "package": [
+                {
+                    "name": "linux-yocto",
+                    "version": str(args.kernel_version),
+                    "products": [
+                        {
+                            "product": "linux_kernel",
+                            "cvesInRecord": "Yes"
+                        }
+                    ],
+                    "issue": []
+                }
+            ]
+        }
+
+    for pkg in cve_report['package']:
+        is_kernel =3D False
+        for product in pkg['products']:
+            if product['product'] =3D=3D "linux_kernel":
+                is_kernel=3DTrue
+        if not is_kernel:
+            continue
+
+        kernel_cves =3D get_kernel_cves(args.datadir,
+                                      compiled_files,
+                                      Version(pkg["version"]))
+        logging.info("Total kernel cves from kernel CNA: %s", len(kernel_c=
ves))
+        cves =3D {issue["id"]: issue for issue in pkg["issue"]}
+        logging.info("Total kernel before processing cves: %s", len(cves))
+
+        for cve in kernel_cves:
+            cve_update(cves, cve, kernel_cves[cve])
+
+        pkg["issue"] =3D []
+        for cve in sorted(cves):
+            pkg["issue"].extend([cves[cve]])
+        logging.info("Total kernel cves after processing: %s", len(pkg['is=
sue']))
+
+    with open(args.new_cve_report, "w", encoding=3D'ISO-8859-1') as f:
+        json.dump(cve_report, f, indent=3D2)
+
+    return 0
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
+
--
2.34.1


--_000_MAXP287MB42409B58ADEACA9F748E644DEE9DAMAXP287MB4240INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hello maintainers,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<p dir=3D"ltr" class=3D"p1" style=3D"text-align: left; text-indent: 0px; li=
ne-height: normal; text-transform: none; margin: 0px;">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Co=
uld you please let me know whether this backport is being considered, or if=
 any additional information or changes
 are required?&nbsp;</span></p>
<p dir=3D"ltr" class=3D"p1" style=3D"text-align: left; text-indent: 0px; li=
ne-height: normal; text-transform: none; margin: 0px;">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><b=
r>
</span></p>
<p dir=3D"ltr" class=3D"p1" style=3D"text-align: left; text-indent: 0px; li=
ne-height: normal; text-transform: none; margin-right: 0px; margin-left: 0p=
x;">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">In=
 addition, I noticed a few other related fixes in the mainline branch which=
 may also be relevant for scarthgap.
 Please let me know if you would prefer that I submit separate backport pat=
ches for those changes as well.</span></p>
<p class=3D"p2" style=3D"text-align: left; line-height: normal; text-transf=
orm: none; margin: 0px; min-height: 20px;">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><b=
r>
</span></p>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px; line-height: n=
ormal; text-transform: none; margin: 0px;">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Th=
e fix is relevant for the scarthgap as well, and I would appreciate any gui=
dance on the status of backport.</span></p>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Thanks,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Suresh H A</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Suresh H A &lt;Suresh=
.HA@bmwtechworks.in&gt;<br>
<b>Sent:</b> Monday, January 19, 2026 7:01:03 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Cc:</b> Daniel Turull &lt;daniel.turull@ericsson.com&gt;; Peter Marko &l=
t;peter.marko@siemens.com&gt;; Marta Rybczynska &lt;rybczynska@gmail.com&gt=
;; Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;; Richard=
 Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b> [poky][scarthgap][PATCH] improve_kernel_cve_report: add scr=
ipt for postprocesing of kernel CVE data</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Daniel Turull &lt;daniel.turull@ericsson.com=
&gt;<br>
<br>
Adding postprocessing script to process data from linux CNA that includes m=
ore accurate metadata and it is updated directly by the source.<br>
<br>
Example of enhanced CVE from a report from cve-check:<br>
<br>
{<br>
&nbsp; &quot;id&quot;: &quot;CVE-2024-26710&quot;,<br>
&nbsp; &quot;status&quot;: &quot;Ignored&quot;,<br>
&nbsp; &quot;link&quot;: &quot;<a href=3D"https://nvd.nist.gov/vuln/detail/=
CVE-2024-26710">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&amp;data=3D05%7C02%7=
Csuresh.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd1=
0314cc68c56488f3c61cd05%7C0%7C0%7C639044263030909714%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DBsKNia%2BODStTgGaRUtZpglMWs7s5=
Tn0cSH06R%2FNgTK0%3D&amp;reserved=3D0</a>&quot;,<br>
&nbsp; &quot;summary&quot;: &quot;In the Linux kernel, the following vulner=
ability [...]&quot;,<br>
&nbsp; &quot;scorev2&quot;: &quot;0.0&quot;,<br>
&nbsp; &quot;scorev3&quot;: &quot;5.5&quot;,<br>
&nbsp; &quot;scorev4&quot;: &quot;0.0&quot;,<br>
&nbsp; &quot;modified&quot;: &quot;2025-03-17T15:36:11.620&quot;,<br>
&nbsp; &quot;vector&quot;: &quot;LOCAL&quot;,<br>
&nbsp; &quot;vectorString&quot;: &quot;CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N=
/I:N/A:H&quot;,<br>
&nbsp; &quot;detail&quot;: &quot;not-applicable-config&quot;,<br>
&nbsp; &quot;description&quot;: &quot;Source code not compiled by config. [=
'arch/powerpc/include/asm/thread_info.h']&quot;<br>
},<br>
<br>
And same from a report generated with vex:<br>
{<br>
&nbsp; &quot;id&quot;: &quot;CVE-2024-26710&quot;,<br>
&nbsp; &quot;status&quot;: &quot;Ignored&quot;,<br>
&nbsp; &quot;link&quot;: &quot;<a href=3D"https://nvd.nist.gov/vuln/detail/=
CVE-2024-26710">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&amp;data=3D05%7C02%7=
Csuresh.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd1=
0314cc68c56488f3c61cd05%7C0%7C0%7C639044263030930030%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DbNwat5zDiTj6qNii7ZwAO2nW%2BWr0=
tpn1FqDMVrT%2FkjE%3D&amp;reserved=3D0</a>&quot;,<br>
&nbsp; &quot;detail&quot;: &quot;not-applicable-config&quot;,<br>
&nbsp; &quot;description&quot;: &quot;Source code not compiled by config. [=
'arch/powerpc/include/asm/thread_info.h']&quot;<br>
},<br>
<br>
For unpatched CVEs, provide more context in the description:<br>
Tested with 6.12.22 kernel<br>
{<br>
&nbsp; &quot;id&quot;: &quot;CVE-2025-39728&quot;,<br>
&nbsp; &quot;status&quot;: &quot;Unpatched&quot;,<br>
&nbsp; &quot;link&quot;: &quot;<a href=3D"https://nvd.nist.gov/vuln/detail/=
CVE-2025-39728">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2025-39728&amp;data=3D05%7C02%7=
Csuresh.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd1=
0314cc68c56488f3c61cd05%7C0%7C0%7C639044263030942329%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D%2FbXetEZuocKcHrchGkGoLU2rKhPy=
605fM%2BRygKfw10I%3D&amp;reserved=3D0</a>&quot;,<br>
&nbsp; &quot;summary&quot;: &quot;In the Linux kernel, the following vulner=
ability has been [...],<br>
&nbsp; &quot;scorev2&quot;: &quot;0.0&quot;,<br>
&nbsp; &quot;scorev3&quot;: &quot;0.0&quot;,<br>
&nbsp; &quot;scorev4&quot;: &quot;0.0&quot;,<br>
&nbsp; &quot;modified&quot;: &quot;2025-04-21T14:23:45.950&quot;,<br>
&nbsp; &quot;vector&quot;: &quot;UNKNOWN&quot;,<br>
&nbsp; &quot;vectorString&quot;: &quot;UNKNOWN&quot;,<br>
&nbsp; &quot;detail&quot;: &quot;version-in-range&quot;,<br>
&nbsp; &quot;description&quot;: &quot;Needs backporting (fixed from 6.12.23=
)&quot;<br>
},<br>
<br>
CC: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
CC: Marta Rybczynska &lt;rybczynska@gmail.com&gt;<br>
Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&=
gt;<br>
Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br=
>
(cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)<br>
Signed-off-by: Suresh H A &lt;suresh.ha@bmwtechworks.in&gt;<br>
---<br>
&nbsp;scripts/contrib/improve_kernel_cve_report.py | 467 ++++++++++++++++++=
+<br>
&nbsp;1 file changed, 467 insertions(+)<br>
&nbsp;create mode 100755 scripts/contrib/improve_kernel_cve_report.py<br>
<br>
diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py<br>
new file mode 100755<br>
index 0000000000..829cc4cd30<br>
--- /dev/null<br>
+++ b/scripts/contrib/improve_kernel_cve_report.py<br>
@@ -0,0 +1,467 @@<br>
+#! /usr/bin/env python3<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# The script uses another source of CVE information from linux-vulns<br>
+# to enrich the cve-summary from cve-check or vex.<br>
+# It can also use the list of compiled files from the kernel spdx to ignor=
e CVEs<br>
+# that are not affected since the files are not compiled.<br>
+#<br>
+# It creates a new json file with updated CVE information<br>
+#<br>
+# Compiled files can be extracted adding the following in local.conf<br>
+# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D &quot;1&quot;<br>
+#<br>
+# Tested with the following CVE sources:<br>
+# - <a href=3D"https://git.kernel.org/pub/scm/linux/security/vulns.git">ht=
tps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kerne=
l.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&amp;data=3D05%7C02%7Csures=
h.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc=
68c56488f3c61cd05%7C0%7C0%7C639044263030955837%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DkgOmuhM5qTAwa3AODvJoeFc6pUz%2FeTmTkS=
dW1RJOiqY%3D&amp;reserved=3D0</a><br>
+# - <a href=3D"https://github.com/CVEProject/cvelistV5">https://ind01.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FCVEProject%2=
FcvelistV5&amp;data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in%7Cdd87cc08dfad4=
91b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C6390442630=
30969928%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC=
IsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DtYCYdFOW5WGgUSVUKSt02HMCe8ynmRzOu78YCO%2Fi2UI%3D&amp;reserved=3D0</a><br=
>
+#<br>
+# Example:<br>
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --kernel-version 6.12.27 --datadir ./vulns<br>
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json<br=
>
+#<br>
+# SPDX-License-Identifier: GPLv2<br>
+<br>
+import argparse<br>
+import json<br>
+import sys<br>
+import logging<br>
+import glob<br>
+import os<br>
+import pathlib<br>
+from packaging.version import Version<br>
+<br>
+def is_linux_cve(cve_info):<br>
+&nbsp;&nbsp;&nbsp; '''Return true is the CVE belongs to Linux'''<br>
+&nbsp;&nbsp;&nbsp; if not &quot;affected&quot; in cve_info[&quot;container=
s&quot;][&quot;cna&quot;]:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return False<br>
+&nbsp;&nbsp;&nbsp; for affected in cve_info[&quot;containers&quot;][&quot;=
cna&quot;][&quot;affected&quot;]:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not &quot;product&quot; in a=
ffected:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
False<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if affected[&quot;product&quot;=
] =3D=3D &quot;Linux&quot; and affected[&quot;vendor&quot;] =3D=3D &quot;Li=
nux&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
True<br>
+&nbsp;&nbsp;&nbsp; return False<br>
+<br>
+def get_kernel_cves(datadir, compiled_files, version):<br>
+&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
+&nbsp;&nbsp;&nbsp; Get CVEs for the kernel<br>
+&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
+&nbsp;&nbsp;&nbsp; cves =3D {}<br>
+<br>
+&nbsp;&nbsp;&nbsp; check_config =3D len(compiled_files) &gt; 0<br>
+<br>
+&nbsp;&nbsp;&nbsp; base_version =3D Version(f&quot;{version.major}.{versio=
n.minor}&quot;)<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Check all CVES from kernel vulns<br>
+&nbsp;&nbsp;&nbsp; pattern =3D os.path.join(datadir, '**', &quot;CVE-*.jso=
n&quot;)<br>
+&nbsp;&nbsp;&nbsp; cve_files =3D glob.glob(pattern, recursive=3DTrue)<br>
+&nbsp;&nbsp;&nbsp; not_applicable_config =3D 0<br>
+&nbsp;&nbsp;&nbsp; fixed_as_later_backport =3D 0<br>
+&nbsp;&nbsp;&nbsp; vulnerable =3D 0<br>
+&nbsp;&nbsp;&nbsp; not_vulnerable =3D 0<br>
+&nbsp;&nbsp;&nbsp; for cve_file in sorted(cve_files):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_info =3D {}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(cve_file, &quot;r&quo=
t;, encoding=3D'ISO-8859-1') as f:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_inf=
o =3D json.load(f)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(cve_info) =3D=3D 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging=
.error(&quot;Not valid data in %s. Aborting&quot;, cve_file)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not is_linux_cve(cve_info):<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_id =3D os.path.basename(cve=
_file)[:-5]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description =3D cve_info[&quot;=
containers&quot;][&quot;cna&quot;][&quot;descriptions&quot;][0][&quot;value=
&quot;]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if cve_file.find(&quot;rejected=
&quot;) &gt;=3D 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging=
.debug(&quot;%s is rejected by the CNA&quot;, cve_id)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves[cv=
e_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Ignored&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;rejected&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;summary&quot;: description,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;Rejected by CNA&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if any(elem in cve_file for ele=
m in [&quot;review&quot;, &quot;reverved&quot;, &quot;testing&quot;]):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_vulnerable, first_affected, =
last_affected, better_match_first, better_match_last, affected_versions =3D=
 get_cpe_applicability(cve_info, version)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.debug(&quot;%s: %s (%s =
- %s) (%s - %s)&quot;, cve_id, is_vulnerable, better_match_first, better_ma=
tch_last, first_affected, last_affected)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if is_vulnerable is None:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging=
.warning(&quot;%s doesn't have good metadata&quot;, cve_id)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if is_vulnerable:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_affe=
cted =3D True<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; affecte=
d_files =3D []<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if chec=
k_config:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; is_affected, affected_files =3D check_kernel_compiled_file=
s(compiled_files, cve_info)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
is_affected and len(affected_files) &gt; 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s - not applicable configur=
ation since affected files not compiled: %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_id, affected_files)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Ignored&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;not-appl=
icable-config&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;So=
urce code not compiled by config. {affected_files}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_applicable_config +=3D1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Check=
 if we have backport<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if not better_match_last:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_in =3D last_affected<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_in =3D better_match_last<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;%s needs backporting (fixed from %s)&q=
uot;, cve_id, fixed_in)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&q=
uot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;stat=
us&quot;: &quot;Unpatched&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;deta=
il&quot;: &quot;version-in-range&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summ=
ary&quot;: description,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;desc=
ription&quot;: f&quot;Needs backporting (fixed from {fixed_in})&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vulnerable +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (better_match_last and<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version(f&quot;{better_match_last.=
major}.{better_match_last.minor}&quot;) =3D=3D base_version):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_as_later_backport +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Not vulnerable<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
first_affected:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;%s - not known affected %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; better_match_last)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Patched&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;version-=
not-in-range&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: &quot;No =
CPE match&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_vulnerable +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; continue<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backpor=
t_base =3D Version(f&quot;{better_match_last.major}.{better_match_last.mino=
r}&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if vers=
ion &lt; first_affected:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug('%s - fixed-version: only affects %s onwards=
',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; first_affected)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Patched&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;fixed-ve=
rsion&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;on=
ly affects {first_affected} onwards&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_vulnerable +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif la=
st_affected &lt;=3D version:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;%s - fixed-version: Fixed from version=
 %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; last_affected)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Patched&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;fixed-ve=
rsion&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;fi=
xed-version: Fixed from version {last_affected}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_vulnerable +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif ba=
ckport_base =3D=3D base_version:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;%s - cpe-stable-backport: Backported i=
n %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; better_match_last)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Patched&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;cpe-stab=
le-backport&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;Ba=
ckported in {better_match_last}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_vulnerable +=3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;%s - version not affected %s&quot;, cv=
e_id, str(affected_versions))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cves[cve_id] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: cve_id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;Patched&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;detail&quot;: &quot;version-=
not-in-range&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: description,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: f&quot;Ra=
nge {affected_versions}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; not_vulnerable +=3D 1<br>
+<br>
+&nbsp;&nbsp;&nbsp; logging.info(&quot;Total CVEs ignored due to not applic=
able config: %d&quot;, not_applicable_config)<br>
+&nbsp;&nbsp;&nbsp; logging.info(&quot;Total CVEs not vulnerable due versio=
n-not-in-range: %d&quot;, not_vulnerable)<br>
+&nbsp;&nbsp;&nbsp; logging.info(&quot;Total vulnerable CVEs: %d&quot;, vul=
nerable)<br>
+<br>
+&nbsp;&nbsp;&nbsp; logging.info(&quot;Total CVEs already backported in %s:=
 %s&quot;, base_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fixed_as_later_backport)<br>
+&nbsp;&nbsp;&nbsp; return cves<br>
+<br>
+def read_spdx(spdx_file):<br>
+&nbsp;&nbsp;&nbsp; '''Open SPDX file and extract compiled files'''<br>
+&nbsp;&nbsp;&nbsp; with open(spdx_file, 'r', encoding=3D'ISO-8859-1') as f=
:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx =3D json.load(f)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;spdxVersion&quot; in s=
pdx:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if spdx=
[&quot;spdxVersion&quot;] =3D=3D &quot;SPDX-2.2&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return read_spdx2(spdx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;@graph&quot; in spdx:<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
read_spdx3(spdx)<br>
+&nbsp;&nbsp;&nbsp; return []<br>
+<br>
+def read_spdx2(spdx):<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; Read spdx2 compiled files from spdx<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; cfiles =3D set()<br>
+&nbsp;&nbsp;&nbsp; if 'files' not in spdx:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cfiles<br>
+&nbsp;&nbsp;&nbsp; for item in spdx['files']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for ftype in item['fileTypes']:=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ftyp=
e =3D=3D &quot;SOURCE&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; filename =3D item[&quot;fileName&quot;][item[&quot;fileNam=
e&quot;].find(&quot;/&quot;)+1:]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cfiles.add(filename)<br>
+&nbsp;&nbsp;&nbsp; return cfiles<br>
+<br>
+def read_spdx3(spdx):<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; Read spdx3 compiled files from spdx<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; cfiles =3D set()<br>
+&nbsp;&nbsp;&nbsp; for item in spdx[&quot;@graph&quot;]:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;software_primaryPurpos=
e&quot; not in item:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if item[&quot;software_primaryP=
urpose&quot;] =3D=3D &quot;source&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filenam=
e =3D item['name'][item['name'].find(&quot;/&quot;)+1:]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cfiles.=
add(filename)<br>
+&nbsp;&nbsp;&nbsp; return cfiles<br>
+<br>
+def check_kernel_compiled_files(compiled_files, cve_info):<br>
+&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
+&nbsp;&nbsp;&nbsp; Return if a CVE affected us depending on compiled files=
<br>
+&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
+&nbsp;&nbsp;&nbsp; files_affected =3D set()<br>
+&nbsp;&nbsp;&nbsp; is_affected =3D False<br>
+<br>
+&nbsp;&nbsp;&nbsp; for item in cve_info['containers']['cna']['affected']:<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;programFiles&quot; in =
item:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for f i=
n item['programFiles']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if f not in files_affected:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; files_affected.add(f)<br>
+<br>
+&nbsp;&nbsp;&nbsp; if len(files_affected) &gt; 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for f in files_affected:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if f in=
 compiled_files:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; logging.debug(&quot;File match: %s&quot;, f)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; is_affected =3D True<br>
+&nbsp;&nbsp;&nbsp; return is_affected, files_affected<br>
+<br>
+def get_cpe_applicability(cve_info, v):<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; Check if version is affected and return affected versio=
ns<br>
+&nbsp;&nbsp;&nbsp; '''<br>
+&nbsp;&nbsp;&nbsp; base_branch =3D Version(f&quot;{v.major}.{v.minor}&quot=
;)<br>
+&nbsp;&nbsp;&nbsp; affected =3D []<br>
+&nbsp;&nbsp;&nbsp; if not 'cpeApplicability' in cve_info[&quot;containers&=
quot;][&quot;cna&quot;]:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return None, None, None, None, =
None, None<br>
+<br>
+&nbsp;&nbsp;&nbsp; for nodes in cve_info[&quot;containers&quot;][&quot;cna=
&quot;][&quot;cpeApplicability&quot;]:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for node in nodes.values():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vulnera=
ble =3D False<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matched=
_branch =3D False<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first_a=
ffected =3D Version(&quot;5000&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_af=
fected =3D Version(&quot;0&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_=
match_first =3D Version(&quot;0&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_=
match_last =3D Version(&quot;5000&quot;)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(=
node[0]['cpeMatch']) =3D=3D 0:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; first_affected =3D None<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_affected =3D None<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; better_match_first =3D None<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; better_match_last =3D None<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cpe=
_match in node[0]['cpeMatch']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; version_start_including =3D Version(&quot;0&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; version_end_excluding =3D Version(&quot;0&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if 'versionStartIncluding' in cpe_match:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version_start_including =3D Versio=
n(cpe_match['versionStartIncluding'])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version_start_including =3D Versio=
n(&quot;0&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # if versionEndExcluding is missing we are in a branch, wh=
ich is not fixed.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if &quot;versionEndExcluding&quot; in cpe_match:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version_end_excluding =3D Version(=
cpe_match[&quot;versionEndExcluding&quot;])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # if versionEndExcluding is missin=
g we are in a branch, which is not fixed.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version_end_excluding =3D Version(=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f&quot;{ve=
rsion_start_including.major}.{version_start_including.minor}.5000&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; affected.append(f&quot; {version_start_including}-{version=
_end_excluding}&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # Detect if versionEnd is in fixed in base branch. It has =
precedence over the rest<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; branch_end =3D Version(f&quot;{version_end_excluding.major=
}.{version_end_excluding.minor}&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if branch_end =3D=3D base_branch:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if version_start_including &lt;=3D=
 v &lt; version_end_excluding:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vulnerable=
 =3D cpe_match['vulnerable']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If we don't match in our branch,=
 we are not vulnerable,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # since we have a backport<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matched_branch =3D True<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_match_first =3D version_sta=
rt_including<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_match_last =3D version_end_=
excluding<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if version_start_including &lt;=3D v &lt; version_end_excl=
uding and not matched_branch:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if version_end_excluding &lt; bett=
er_match_last:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_mat=
ch_first =3D max(version_start_including, better_match_first)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; better_mat=
ch_last =3D min(better_match_last, version_end_excluding)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vulnerable=
 =3D cpe_match['vulnerable']<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matched_br=
anch =3D True<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; first_affected =3D min(version_start_including, first_affe=
cted)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; last_affected =3D max(version_end_excluding, last_affected=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Not a=
 better match, we use the first and last affected instead of the fake .5000=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if vuln=
erable and better_match_last =3D=3D Version(f&quot;{base_branch}.5000&quot;=
):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; better_match_last =3D last_affected<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; better_match_first =3D first_affected<br>
+&nbsp;&nbsp;&nbsp; return vulnerable, first_affected, last_affected, bette=
r_match_first, better_match_last, affected<br>
+<br>
+def copy_data(old, new):<br>
+&nbsp;&nbsp;&nbsp; '''Update dictionary with new entries, while keeping th=
e old ones'''<br>
+&nbsp;&nbsp;&nbsp; for k in new.keys():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old[k] =3D new[k]<br>
+&nbsp;&nbsp;&nbsp; return old<br>
+<br>
+# Function taken from cve_check.bbclass. Adapted to cve fields<br>
+def cve_update(cve_data, cve, entry):<br>
+&nbsp;&nbsp;&nbsp; # If no entry, just add it<br>
+&nbsp;&nbsp;&nbsp; if cve not in cve_data:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D entry<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; # If we are updating, there might be change in the stat=
us<br>
+&nbsp;&nbsp;&nbsp; if cve_data[cve]['status'] =3D=3D &quot;Unknown&quot;:<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D copy_data(cve=
_data[cve], entry)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; if cve_data[cve]['status'] =3D=3D entry['status']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; if entry['status'] =3D=3D &quot;Unpatched&quot; and cve=
_data[cve]['status'] =3D=3D &quot;Patched&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.warning(&quot;CVE entry=
 %s update from Patched to Unpatched from the scan result&quot;, cve)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D copy_data(cve=
_data[cve], entry)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; if entry['status'] =3D=3D &quot;Patched&quot; and cve_d=
ata[cve]['status'] =3D=3D &quot;Unpatched&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.warning(&quot;CVE entry=
 %s update from Unpatched to Patched from the scan result&quot;, cve)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D copy_data(cve=
_data[cve], entry)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; # If we have an &quot;Ignored&quot;, it has a priority<=
br>
+&nbsp;&nbsp;&nbsp; if cve_data[cve]['status'] =3D=3D &quot;Ignored&quot;:<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.debug(&quot;CVE %s not =
updating because Ignored&quot;, cve)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; # If we have an &quot;Ignored&quot;, it has a priority<=
br>
+&nbsp;&nbsp;&nbsp; if entry['status'] =3D=3D &quot;Ignored&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D copy_data(cve=
_data[cve], entry)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.debug(&quot;CVE entry %=
s updated from Unpatched to Ignored&quot;, cve)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
+&nbsp;&nbsp;&nbsp; logging.warning(&quot;Unhandled CVE entry update for %s=
 %s from %s %s to %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve, cve_data[cve]['status'], c=
ve_data[cve]['detail'],&nbsp; entry['status'], entry['detail'])<br>
+<br>
+def main():<br>
+&nbsp;&nbsp;&nbsp; parser =3D argparse.ArgumentParser(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description=3D&quot;Update cve-=
summary with kernel compiled files and kernel CVE information&quot;<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;-s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--spdx&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D&quot;SPDX2/3 for the ke=
rnel. Needs to include compiled sources&quot;,<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--datadir&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type=3Dpathlib.Path,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D&quot;Directory where CV=
E data is&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; required=3DTrue<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--old-cve-report&quot;,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D&quot;CVE report to upda=
te. (Optional)&quot;,<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--kernel-version&quot;,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D&quot;Kernel version. Ne=
eded if old cve_report is not provided (Optional)&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type=3DVersion<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--new-cve-report&quot;,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D&quot;Output file&quot;,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default=3D&quot;cve-summary-enh=
ance.json&quot;<br>
+&nbsp;&nbsp;&nbsp; )<br>
+&nbsp;&nbsp;&nbsp; parser.add_argument(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;-D&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;--debug&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D'Enable debug ',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action=3D&quot;store_true&quot;=
)<br>
+<br>
+&nbsp;&nbsp;&nbsp; args =3D parser.parse_args()<br>
+<br>
+&nbsp;&nbsp;&nbsp; if args.debug:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_level=3Dlogging.DEBUG<br>
+&nbsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_level=3Dlogging.INFO<br>
+&nbsp;&nbsp;&nbsp; logging.basicConfig(format=3D'[%(filename)s:%(lineno)d]=
 %(message)s', level=3Dlog_level)<br>
+<br>
+&nbsp;&nbsp;&nbsp; if not args.kernel_version and not args.old_cve_report:=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser.error(&quot;either --ker=
nel-version or --old-cve-report are needed&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1<br>
+<br>
+&nbsp;&nbsp;&nbsp; # by default we don't check the compiled files, unless =
provided<br>
+&nbsp;&nbsp;&nbsp; compiled_files =3D []<br>
+&nbsp;&nbsp;&nbsp; if args.spdx:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compiled_files =3D read_spdx(ar=
gs.spdx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.info(&quot;Total compil=
ed files %d&quot;, len(compiled_files))<br>
+<br>
+&nbsp;&nbsp;&nbsp; if args.old_cve_report:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(args.old_cve_report, =
encoding=3D'ISO-8859-1') as f:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_rep=
ort =3D json.load(f)<br>
+&nbsp;&nbsp;&nbsp; else:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #If summary not provided, we cr=
eate one<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_report =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;v=
ersion&quot;: &quot;1&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;p=
ackage&quot;: [<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;linux-yoct=
o&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;version&quot;: str(args.kern=
el_version),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;products&quot;: [<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;product&quot;: &quot;linux_kernel&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &quot;cvesInRecord&quot;: &quot;Yes&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;issue&quot;: []<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; for pkg in cve_report['package']:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_kernel =3D False<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for product in pkg['products']:=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if prod=
uct['product'] =3D=3D &quot;linux_kernel&quot;:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; is_kernel=3DTrue<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not is_kernel:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel_cves =3D get_kernel_cves=
(args.datadir,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ompiled_files,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=
ersion(pkg[&quot;version&quot;]))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.info(&quot;Total kernel=
 cves from kernel CNA: %s&quot;, len(kernel_cves))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves =3D {issue[&quot;id&quot;]=
: issue for issue in pkg[&quot;issue&quot;]}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.info(&quot;Total kernel=
 before processing cves: %s&quot;, len(cves))<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in kernel_cves:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_upd=
ate(cves, cve, kernel_cves[cve])<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg[&quot;issue&quot;] =3D []<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in sorted(cves):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg[&qu=
ot;issue&quot;].extend([cves[cve]])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logging.info(&quot;Total kernel=
 cves after processing: %s&quot;, len(pkg['issue']))<br>
+<br>
+&nbsp;&nbsp;&nbsp; with open(args.new_cve_report, &quot;w&quot;, encoding=
=3D'ISO-8859-1') as f:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; json.dump(cve_report, f, indent=
=3D2)<br>
+<br>
+&nbsp;&nbsp;&nbsp; return 0<br>
+<br>
+if __name__ =3D=3D &quot;__main__&quot;:<br>
+&nbsp;&nbsp;&nbsp; sys.exit(main())<br>
+<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXP287MB42409B58ADEACA9F748E644DEE9DAMAXP287MB4240INDP_--

