Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A78FC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:23:18 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2530.1787214192983327054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d5eMjUh5;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13776; q=dns/txt;
  s=iport01; t=1787214192; x=1788423792;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=fZg+l5rX7xmYjBgJj6W9LLbiZ4lIC9dS9/73nGdaWo8=;
  b=d5eMjUh5ADD0oVok+p8X4sL3IqAGziLGYP+cguaA7gAUZEBmHH/bhNQ3
   hsmsd2J9W6y+ifVZViLgwQlvgxcCkFTf5XxpIUO0gbxgbEOx6+Cnwx9q0
   srOUZ2wfeIbk1Ib5guk7TO0eOhkbU4XqURPaw20F6ZFcal8XvDpV3wN/g
   KnGQMNcmkPbUtpTfHf9desUGIej4Rx5PnaXaCpwQsDUkTa3+ZAw9VmlbG
   vFV4Lfxw+tJz3HgN3aq1w6jxaizaC2kygxmiudTUXR+yZz0AECmdGOFnX
   OL2mPBLKEbQDoJq5fhu/JvG5R1oM4UPtX5QxKzb4H2y9DtcZRb96eMtaQ
   w==;
X-CSE-ConnectionGUID: UmQbqTa3QDy87SP4FJK8Xg==
X-CSE-MsgGUID: FgbRRqzKT0CPheYvPMk//A==
X-IPAS-Result: =?us-ascii?q?A0BQAgC5t4Zq/4oQJK1SCB4BAQsSDGWBIAuBPTFTFnICg?=
 =?us-ascii?q?SEaL4gjA4UrhliCIQOeG4F+DwEBAQ4BLgEVDQQBAYQ/RgKNawImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBgQgCAQgRA?=
 =?us-ascii?q?wEBAS8nCh0IAgQKCQiCe4IdFkEDAQIOuCwCihx4gTSBAYNiAdxKAQsUAYE4h?=
 =?us-ascii?q?T+DHgEBKoE1gl2BIxmEfCcbG4FygRVCgmk+gmECAgGBNikeg3WCDiIEgiJ6E?=
 =?us-ascii?q?huBPx6BD5BDUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxceWBsGB?=
 =?us-ascii?q?RIgKkFEIwM+OIEIQQKBdT8jGTZ8gQlegSsqYgIQF0YuFYIKAoJwgSheAgFJR?=
 =?us-ascii?q?Q4JFwttPTcUGQMEgTUFjWUHWyCBfk0BPBwILQErBAErJCx9BhMckx9SjxdHo?=
 =?us-ascii?q?zAKKIN2jCGNPogyF4VbpRGZCCONZ5VnhScCBAIEBQIQAQEGgWg8gVlwFYMiC?=
 =?us-ascii?q?UoZD44tFhyCH4ElhRNRxjV5AgkyAgcCBw4DC5NmAQE?=
IronPort-PHdr: A9a23:JP7h+xeUAMIA7SqA+mlf7d0jlGM/gIqcDmcuAtIPgrZKdOGk55v9e
 RCZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:bunwTqK1qwFfMTYTFE+RiZQlxSXFcZb7ZxGr2PjKsXjdYENSgWNWz
 TZNWTuObqqCYTP8eot+a4ripEMH6pCDxtVmTAcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1TCXg8JLERod9bEDERz
 sREBhIuPiCM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2M0PHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQhieW0b4aJK4PiqcN9sEmSn
 Fjf7UfFWjoiNNGu1wKg8TXrr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:7UcBOKC+O+OIC0nlHeilsseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskdvZJhBo7y90dq7MA3hHP9OkMUs1NiZLXLbUQeTXeVfBM7ZskHd8k7Fh6FgPM
 VbAtJD4bTLZDAQ47eZkWyF+pQbsaS6GcuT9IHjJgJWPHlXgtZbnn5E42igYypLbTgDL6AUUL
 Cb4c1KrSehf3M4UuSXb0NuY8Hz4/fwuNbDexApOz4LgTPisRqYrJLqGRmR2RkTFwhI3aoj9m
 b9lQn47LWIsv2wyBPQvlWjoai+nuGP9vJzQOi3zuQFIDTljQilIK57XaeZgTwzqOazrH43jd
 jluX4bToROwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCvBGmZlSfnLimgkdVZBHoe
 B2NlCixt5q5CD77WPADh/zJldXf3+P0D8feCgo/iViuMUlGedsRMckjTJo+d87bVLHAcYcYa
 hTJfCZwupKelWHaH2clGxuzNuwGkkXJH69MxM/Ugj/6UkKoJi/pHFonvD2kho7heEAYogB6O
 LePqtykrZSCscQcKJmHe8EBdC6E2rXXHv3QSmvyHncZeg60kj22tbKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arDcGVxpVE/h3EXW34BF3Wu4xjzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeX/
 qoIppZD/LqMGOrE4dU2A/1XYVUNBAlIYcok8d+X0jLrtPAK4XsuOCeePHPJKD1GTJhQW/7Cm
 trZkmEGCyB1DHdZpbVummkZ5q2QD2MwXtZKtmuw9Qu
X-Talos-CUID: 9a23:xY+E8WPH4ADWou5DZSxe/lcoE5scXmyNk0zof2GaKjZZR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AyVMCNQzWA1XF0G+CLqMZ6kIoldiaqIqhAno3iIc?=
 =?us-ascii?q?lh5GvDSx9CimlqTfwBaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:23:11 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id D962A180008E4
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:23:11 +0000 (GMT)
X-CSE-ConnectionGUID: TQaeZgJVSBaGRtsT0OeRcw==
X-CSE-MsgGUID: iXSUBiwFSFyS8bzxI7EUsg==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208,217";a="84145615"
Received: from mail-westcentralusazon11013007.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.7])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:23:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D13KOTcTOimxyXj5rClHQ5wOVA4jDrAlOksWsc5GcQ7FT5u5Py1KUROPl1CFuGW89VzdXvx0pjRjQSNOK1+l3AWb4vO4fU20DPiDzidKUwZNxWHm3HMD6v5jr04QPlwm0KBbHlA/Bug21jUI9U9kkucqsceCDKnxyNHLXFfdaRhwoIuEu+TqJhbjtdl+tB1hRDwTshS5YG+1BytTenm5nzWxIZz20Z7fTPmC6SBcA6L8CUrCgEpTArkLKispiM+DtdJmMlzoLpBpHqvmuUlv3qlHZUgu0wvE3uz4tE5T1u3vBmAz/BHDIECoOh7KMWwxZRgtWJ5Y86aF6W5o8oAZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZg+l5rX7xmYjBgJj6W9LLbiZ4lIC9dS9/73nGdaWo8=;
 b=HyFeseCSTUKhE+iDf94ZmqDQdl4ZRz/+dX+UXjN5YGoa9j8aO8HAmnDHDJFz56TiAOMchRBxTa0IAVmdJVGyYNhH5JZ4pc010ZDeXjNPBhdxpdHuxYsEAZBQt/0GEkO3BG6JgOV1xBmsQ1Bb5yKEjbR1DalcWW09Flbk7XNIQGEndC10KyJ4AEK14CTa5d7aTVhVDjOViKmo80WvwCI43dqL5NEczfA9NjTIuiJI5rnDl7iyl6yXzriiim9Kwgn1oBQJQHwlZDgLRSrqpTqnbeLRZMRxDpAk9I+ztaThL0uwZzJj1QrdH4RsHogy7VLeXIkT/vgPhhaqH+43b84c3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 08:23:09 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:23:09 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Deepak Rathore -X (deeratho - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] python3-cryptography: backport stray
 file install fix
Thread-Topic: [OE-core][wrynose][PATCH] python3-cryptography: backport stray
 file install fix
Thread-Index: AQHdL8x4V9hVxe6IuEKeGI3Gf8qmrLammjeC
Date: Thu, 20 Aug 2026 08:23:09 +0000
Message-ID: 
 <DM4PR11MB6189E436A02CB0B253545E03C4A42@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <18CD30D17D38E60D.2965692@lists.openembedded.org>
In-Reply-To: <18CD30D17D38E60D.2965692@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|CH3PR11MB7323:EE_
x-ms-office365-filtering-correlation-id: 0f5804a1-a836-421e-bbd6-08defe9444be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 nIM//gCDBbbhZFqjzqaOPr7/IHeaJguQTApgddayjnBbNUF2O06/ekcXxfMzW/8wBTXXLM4uCN0tCkHBBxScrxtVLv7zRBlFEbL3GyZZ66GthlVZzI0gHh6zHCOwO4K9JGHPJ3/a+8cS/dcrymMJxhBa5iLpI+ifmXZrHal9qYw2TVLupwhpfDva+UKnoPjrpiQt7hBxYEH0q++u9KD85viSBT3Rcd0iOYkqr3pOdvb3U8Z7P7gcsn7wOb3OmXsKCaVxpiBMikTX0RqIbSP5ZzzL+YO4oOyeLdjin/nwgGz7rPJuqda1Y11w8lmPRrg3HioSOL1D6u6LVfojnpYGquimPpn8HWqWLVq5Eikwe5cWBFo92/+7zEdTfpk6HoPMdzqKEdrI+eZN+QlKHK/jkeEO8j446WqOkajRwcHbwj7V57MZ4NR5ubDtt/dClrlqQPcMmFa1Z8gumAQIa9hZFcZtKafrTAAokkly/e5WhGIRPXwjl4U7PQI4O4M+KB0FJVcz/ZjoB07oxyVQRx4XxqE1QLyVCNiynhrXUSYMNr7aHWlpmgAd27kHYt9kmzdHoq4VbF+nOaSo+ZJ4bU2i5USqb9s4S0BHZHSYE/7Y7WyWfAFVCkNzv3DEvywq1N86aKZH2KkDGTgs3Co4Fz/Or8HkduE6AMKercQB1RHQ5aY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?/nYN5SSY0FZL9D1hEmBpa1Y7T89qvg0kvzvBzFZj1Djofoud1Vl6dC6TYP?=
 =?iso-8859-2?Q?aQmoiaBB1BU5MV6DI9mL3CgP7FzFKHVHZQ4rVinphBdFde4RVQCt5ys0RJ?=
 =?iso-8859-2?Q?hzIKmnGi9xM/wWOBqZ/bLmKCUOQuKLhMtpa8x7hGJ7CZfCtbwNmoMaDBaE?=
 =?iso-8859-2?Q?nPAITcohnGvaShAT7f7XY2S0e8xMQOpEVaH7gwmAiK2iWtDk25DOphAxGZ?=
 =?iso-8859-2?Q?ueBq0gX2ZrJsYcKorXejxRWqGx5AenoMtXpUmXMB6P0DtZ2+kD+kp3V2rX?=
 =?iso-8859-2?Q?jeMWO29Xf1x46vxt2piKBy03n1eamC3znno8c7Rxd0AbKzdMHbjNR6SZus?=
 =?iso-8859-2?Q?DhZlxjHKEErem3r2eFN1TVfRUXQfTxCK0GKJbqMpBw61nWsSxULIRoze9b?=
 =?iso-8859-2?Q?/vC3qHW7MNae80Awn2FMC/M5oR7wnbnrkdvhtjDqEC8cqdhDsKAY51GWAo?=
 =?iso-8859-2?Q?q2sOFmowMJ+1vSl+2akpE0gK35lunOKMtwP8EwksW4TZMb9mLrjWkWvZsE?=
 =?iso-8859-2?Q?QjYzYdRZuvj1rW8IKuSdVrIUztv/JcO5nu2DUWPL73lpbDocuQH4T14khS?=
 =?iso-8859-2?Q?JiCFWiXY3NmZgN//WaHRbyLKfR6H0L6wThB8NRjgOCAD7VB1X0Mu7fq2VU?=
 =?iso-8859-2?Q?xmjKbs/Enbd7nQ80ShDhtc5aXEEAaUQfphCZNGIrQbq5m6Qs2yz88UrLlg?=
 =?iso-8859-2?Q?eFN1JmQ+zHoipwElzIr7RvI2DJc3NfwQp8nc8heAnyT5V3dQOaSWS/gmCz?=
 =?iso-8859-2?Q?kjKsEYPJef1WPAEtOa/U4tbRBSfHFhiZdld9c6OC8khdyP8cpeBplMtYuP?=
 =?iso-8859-2?Q?soGgxXTAjHk8jXDlH9NJOOvlGCn9PnpBW9GHs7uoTaRaF9blS8pZumG/zB?=
 =?iso-8859-2?Q?UZPPZk+erYhjJP2PW3/E4AEiS7kbTcGrWj2k2dEdP2i9r7NL67v1hi2836?=
 =?iso-8859-2?Q?KQqj1jRkA4RVebGU7J8X4aiC7yspfTiPQ5MHXePVBZM/elv6ukVbrQhhe5?=
 =?iso-8859-2?Q?xBs86lqAudZN8ztDs40LOk3ceWCggChTA7/meT6gzalp8Grfgw6vth45mk?=
 =?iso-8859-2?Q?iYk6QVvitt7EmjnItDjkh52ZiaokIKTpHXumrU1f/gZusTGR3zdSFL/unb?=
 =?iso-8859-2?Q?r0cZBeydF68JQl+NI9rOD17hxVg7PfWL2nZzjUcFfbVYymvYz0QKCsvTsy?=
 =?iso-8859-2?Q?hhMc/ezVOP8R8UefdX3TGF+KmR1vYbBcQGV+MA7MonC4BGQMolwqddFHG1?=
 =?iso-8859-2?Q?Tq01JxHHZsqQqDfZi08GYMx8MRM7UpUx4GI0o0RCEoeBas/9/CyNZjSxDv?=
 =?iso-8859-2?Q?b6sX5Uh4i6sDgIP/dCyhlrDlQY98ZjBqcdD3UnvJ04bT3XfY56o9CseIwN?=
 =?iso-8859-2?Q?/nQg29SoQJ7HD4J1Oi4W+6R9m9CGTz6qZMuiMan+4UQS3KfIB/QqO11yCK?=
 =?iso-8859-2?Q?mdOXHwQdEPgUZfZ/UupQgUDmZFHx1yexUlmz5Dh5hdnM6rUc3qprsy4LPf?=
 =?iso-8859-2?Q?uOQeonlBtSwRmKoAtJ8HtXwcUzM5Q2M22uxVVu0KmeV6YXyrtQWgTTiYoA?=
 =?iso-8859-2?Q?UzYJTMT9MjmYOGrFqoiLp7RiAgkkmk/uhCJihT6Mfci2f/dM3azaULNwf+?=
 =?iso-8859-2?Q?+3Nuwfba6wUx3EoJxHYOPywDebt5R2/0KbPa1Zs0/VvMtVZAHFRL9hj2xF?=
 =?iso-8859-2?Q?JTDZzBXF10nvltc0xHT6yHJh5EalJB9PYi+c2Qgmq3eZ8obCoGjWyVd/B/?=
 =?iso-8859-2?Q?orlusB4N+bKOylaTPNstR9C6Mq8lz7mknxu6gJT+/loSyP?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189E436A02CB0B253545E03C4A42DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	sPJjdAEruk9VVqsQXYFM5w7QDt0hD+O5THP1BsCAoXi+N4YH7nH1Jb5OzhyjlAfV6wQ72WkGYKcmOAgq+nhBQZLJxC3vTC31cWj8iJpPJ8TItbg4hoeG1vqZR4eB02rnDyO6jOnVbLSLxa8DXYdqQcG6nzCg8sdsglegwqA3Hcj7HhI7JAhl7l6CdbmQHpciIXTyaijHDFV+LYeveLRvpr02qAAaSV3vEHM5XvIvgQ7d82Eey4yAeKkvlBi9qvqgwBO8iJYiPvA8aAXExwFYBvnfL0mP1SVvRuWf3Yir+XyKw5AB5yq3jhOvXWxQPlW6pEniZaHN0to7WUFt4k0fzg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5804a1-a836-421e-bbd6-08defe9444be
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 08:23:09.5003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUSIeKdZof3Wgt30ExT1xXPYGJ+isJmDd049maBDO2rpGEErins/P4xfX8l13dMbo/xmOjgElxIs3U0iw8bQXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243819

--_000_DM4PR11MB6189E436A02CB0B253545E03C4A42DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Team,
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.
Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Deepak Rathore via lists.openembedded.org <deer=
atho=3Dcisco.com@lists.openembedded.org>
Sent: Wednesday, August 19, 2026 4:47 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core][wrynose][PATCH] python3-cryptography: backport stray fil=
e install fix

From: Himanshu Jadon <hjadon@cisco.com>

Maturin 1.12 changed the handling of include entries from
pyproject.toml. With the current cryptography metadata, files like
CHANGELOG.rst, CONTRIBUTING.rst, docs and tests can be installed under
site-packages instead of being kept only in the source archive.

That can cause image install conflicts when packages such as
python3-pyrad and python3-pyexpect are installed with
python3-cryptography, because those packages also install top-level docs
or tests directories under site-packages.

Backport the upstream cryptography fix which marks these entries as
sdist-only. The files remain available from the source tree, so the
existing ptest install path which copies tests from ${S} is not changed.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../python/python3-cryptography.bb            |  1 +
 ...lling-stray-files-into-site-packages.patch | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-=
Fix-installing-stray-files-into-site-packages.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/re=
cipes-devtools/python/python3-cryptography.bb
index 42e8c5ff19..b73123d361 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -14,6 +14,7 @@ require python3-cryptography-common.inc
 SRC_URI[sha256sum] =3D "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49=
468fc9eb16e93d"

 SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark-disable-option.p=
atch \
+            file://0002-Fix-installing-stray-files-into-site-packages.patc=
h \
             file://check-memfree.py \
             file://run-ptest \
            "
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Fix-ins=
talling-stray-files-into-site-packages.patch b/meta/recipes-devtools/python=
/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.pa=
tch
new file mode 100644
index 0000000000..6212c1a43e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing=
-stray-files-into-site-packages.patch
@@ -0,0 +1,55 @@
+From af53f00da0538e7d64625eea9f4ec850a2b7dd2e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Micha=3DC5=3D82=3D20G=3DC3=3DB3rny?=3D <mgorny@gentoo.or=
g>
+Date: Sun, 15 Feb 2026 18:01:37 +0100
+Subject: [PATCH] Fix installing stray files into site-packages (#14319)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix the `include` pattern in `pyproject.toml` not to install stray files
+such as `CHANGELOG.rst`, `CONTRIBUTING.rst`, `docs` and `tests` straight
+into site-packages.  Apparently Maturin did not install them before due
+to a bug, but it was fixed in maturin 1.12.0, leading to the files being
+suddenly installed.
+
+Originally reported as https://bugs.gentoo.org/970090.
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/43e=
b178ee3aae8d0060221118437b03c23570a41]
+
+Signed-off-by: Micha=B3 G=F3rny <mgorny@gentoo.org>
+(cherry picked from commit 43eb178ee3aae8d0060221118437b03c23570a41)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ pyproject.toml | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 75bfcbb94..8ee43d17a 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -106,10 +106,10 @@ module-name =3D "cryptography.hazmat.bindings._rust"
+ locked =3D true
+ sdist-generator =3D "git"
+ include =3D [
+-    "CHANGELOG.rst",
+-    "CONTRIBUTING.rst",
++    { path =3D "CHANGELOG.rst", format =3D "sdist" },
++    { path =3D "CONTRIBUTING.rst", format =3D "sdist" },
+
+-    "docs/**/*",
++    { path =3D "docs/**/*", format =3D "sdist" },
+
+     { path =3D "src/_cffi_src/**/*.py", format =3D "sdist" },
+     { path =3D "src/_cffi_src/**/*.c", format =3D "sdist" },
+@@ -121,7 +121,7 @@ include =3D [
+     { path =3D "src/rust/**/Cargo.lock", format =3D "sdist" },
+     { path =3D "src/rust/**/*.rs", format =3D "sdist" },
+
+-    "tests/**/*.py",
++    { path =3D "tests/**/*.py", format =3D "sdist" },
+ ]
+ exclude =3D [
+     "vectors/**/*",
+--
+2.35.6
+
--
2.35.6


--_000_DM4PR11MB6189E436A02CB0B253545E03C4A42DM4PR11MB6189namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Team,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Deepak Rathore via lists.openembed=
ded.org &lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, August 19, 2026 4:47 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core][wrynose][PATCH] python3-cryptography: backport st=
ray file install fix</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">From: Himanshu Jadon &lt;hjadon@cisco.com&g=
t;<br>
<br>
Maturin 1.12 changed the handling of include entries from<br>
pyproject.toml. With the current cryptography metadata, files like<br>
CHANGELOG.rst, CONTRIBUTING.rst, docs and tests can be installed under<br>
site-packages instead of being kept only in the source archive.<br>
<br>
That can cause image install conflicts when packages such as<br>
python3-pyrad and python3-pyexpect are installed with<br>
python3-cryptography, because those packages also install top-level docs<br=
>
or tests directories under site-packages.<br>
<br>
Backport the upstream cryptography fix which marks these entries as<br>
sdist-only. The files remain available from the source tree, so the<br>
existing ptest install path which copies tests from ${S} is not changed.<br=
>
<br>
Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
---<br>
&nbsp;.../python/python3-cryptography.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;...lling-stray-files-into-site-packages.patch | 55 ++++++++++++++++++=
+<br>
&nbsp;2 files changed, 56 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/python/python3-cryptography/=
0002-Fix-installing-stray-files-into-site-packages.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/re=
cipes-devtools/python/python3-cryptography.bb<br>
index 42e8c5ff19..b73123d361 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography.bb<br>
+++ b/meta/recipes-devtools/python/python3-cryptography.bb<br>
@@ -14,6 +14,7 @@ require python3-cryptography-common.inc<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;abace499247268e3757271b2f1e244b36b06f851=
5cf27c4d49468fc9eb16e93d&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disabl=
e-option.patch \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-Fix-installing-stray-files-into-site-packages.patch" id=3D"=
OWA11a92503-a55f-5af3-614d-f55c9ceb1629" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
file://0002-Fix-installing-stray-files-into-site-packages.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://check-memfree.py" id=3D"OWA64890766-86c4-a932-2f9b-07613725=
543a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://check-memfree.py</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://run-ptest" id=3D"OWAe38e95e6-0754-9ec7-070e-0259155bc3f5" c=
lass=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Fix-ins=
talling-stray-files-into-site-packages.patch b/meta/recipes-devtools/python=
/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.pa=
tch<br>
new file mode 100644<br>
index 0000000000..6212c1a43e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing=
-stray-files-into-site-packages.patch<br>
@@ -0,0 +1,55 @@<br>
+From af53f00da0538e7d64625eea9f4ec850a2b7dd2e Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Micha=3DC5=3D82=3D20G=3DC3=3DB3rny?=3D &lt;mgorny@gentoo=
.org&gt;<br>
+Date: Sun, 15 Feb 2026 18:01:37 +0100<br>
+Subject: [PATCH] Fix installing stray files into site-packages (#14319)<br=
>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Fix the `include` pattern in `pyproject.toml` not to install stray files<b=
r>
+such as `CHANGELOG.rst`, `CONTRIBUTING.rst`, `docs` and `tests` straight<b=
r>
+into site-packages.&nbsp; Apparently Maturin did not install them before d=
ue<br>
+to a bug, but it was fixed in maturin 1.12.0, leading to the files being<b=
r>
+suddenly installed.<br>
+<br>
+Originally reported as <a href=3D"https://bugs.gentoo.org/970090" id=3D"OW=
Ae41523ff-ec66-4d72-0bcb-279765585b9c" class=3D"OWAAutoLink" data-auth=3D"N=
otApplicable">
https://bugs.gentoo.org/970090</a>.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/pyca/cryptography=
/commit/43eb178ee3aae8d0060221118437b03c23570a41" id=3D"OWA3edec6e5-0b88-4b=
d5-980e-b313536f7f63" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">htt=
ps://github.com/pyca/cryptography/commit/43eb178ee3aae8d0060221118437b03c23=
570a41</a>]<br>
+<br>
+Signed-off-by: Micha=B3 G=F3rny &lt;mgorny@gentoo.org&gt;<br>
+(cherry picked from commit 43eb178ee3aae8d0060221118437b03c23570a41)<br>
+Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
+---<br>
+ pyproject.toml | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/pyproject.toml b/pyproject.toml<br>
+index 75bfcbb94..8ee43d17a 100644<br>
+--- a/pyproject.toml<br>
++++ b/pyproject.toml<br>
+@@ -106,10 +106,10 @@ module-name =3D &quot;cryptography.hazmat.bindings._=
rust&quot;<br>
+ locked =3D true<br>
+ sdist-generator =3D &quot;git&quot;<br>
+ include =3D [<br>
+-&nbsp;&nbsp;&nbsp; &quot;CHANGELOG.rst&quot;,<br>
+-&nbsp;&nbsp;&nbsp; &quot;CONTRIBUTING.rst&quot;,<br>
++&nbsp;&nbsp;&nbsp; { path =3D &quot;CHANGELOG.rst&quot;, format =3D &quot=
;sdist&quot; },<br>
++&nbsp;&nbsp;&nbsp; { path =3D &quot;CONTRIBUTING.rst&quot;, format =3D &q=
uot;sdist&quot; },<br>
+<br>
+-&nbsp;&nbsp;&nbsp; &quot;docs/**/*&quot;,<br>
++&nbsp;&nbsp;&nbsp; { path =3D &quot;docs/**/*&quot;, format =3D &quot;sdi=
st&quot; },<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; { path =3D &quot;src/_cffi_src/**/*.py&quot;, for=
mat =3D &quot;sdist&quot; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp; { path =3D &quot;src/_cffi_src/**/*.c&quot;, form=
at =3D &quot;sdist&quot; },<br>
+@@ -121,7 +121,7 @@ include =3D [<br>
+&nbsp;&nbsp;&nbsp;&nbsp; { path =3D &quot;src/rust/**/Cargo.lock&quot;, fo=
rmat =3D &quot;sdist&quot; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp; { path =3D &quot;src/rust/**/*.rs&quot;, format =
=3D &quot;sdist&quot; },<br>
+<br>
+-&nbsp;&nbsp;&nbsp; &quot;tests/**/*.py&quot;,<br>
++&nbsp;&nbsp;&nbsp; { path =3D &quot;tests/**/*.py&quot;, format =3D &quot=
;sdist&quot; },<br>
+ ]<br>
+ exclude =3D [<br>
+&nbsp;&nbsp;&nbsp;&nbsp; &quot;vectors/**/*&quot;,<br>
+--<br>
+2.35.6<br>
+<br>
--<br>
2.35.6<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189E436A02CB0B253545E03C4A42DM4PR11MB6189namp_--

