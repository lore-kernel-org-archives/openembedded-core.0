Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC333CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 12:17:49 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10333.1778156264558409107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 05:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lb2vHjlT;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6586; q=dns/txt;
  s=iport01; t=1778156264; x=1779365864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=60SRUtoGdAsfUUF6O6TJ41NmA7Ww2JS1qf3/KnqtAao=;
  b=lb2vHjlT0sJE6y2sNV366sKq7CkT3lkdfRH26oiwyVFkfJsGxCBXlk/V
   lqxpUAKy2zRolKCxSLxgV3xFJJ4fRJmp3dSF3nstKi2Qb5bpWOUP5C7iU
   SsOLy11vyTttPFX1qE9fhmrWh6KB19zOfqyKHGW/fewj6dtaLvnuI8Bdt
   hUWni67d5N/q5FH7OIbuec6QulEPluO2dgBaHoDp2m+rlvIT76G5FeKxk
   qQ99mGuQ76/0oGcety1tG2UIrVA+M/BvEPxW/tWqiq3nfzgSEXDIp/Ibg
   rbNLqQR0nwBjfv2mj/PGl092ABaJ/nsugpDDazvbw3NIJEPgFSnHSaRtH
   Q==;
X-CSE-ConnectionGUID: 9m0EEgHJQp+JKAh5eVHihw==
X-CSE-MsgGUID: 8IAA/0zGQN6tVU+YgkOGPQ==
X-IPAS-Result: =?us-ascii?q?A0B1AwAmgvxp/5UQJK1agS6BK4E9MVOBBgKBIUmIIwOFL?=
 =?us-ascii?q?Ih5A4tki1+GVxSBYQoPAQEBDgEuAQUdBAEBhQYCjTICJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQECAQERZwULAgEIDgMEA?=
 =?us-ascii?q?QEBLiAHCh0IAgQOBQgagmGCHRYHAw8nAwECDqsgAYE9AooqeIE0gQHdRQ2CX?=
 =?us-ascii?q?4FNhT+Ceh8BASqBNYJdgSGFEycbG4FygVeCNzE+gh9CBAEXgR0PHDyDV4IvB?=
 =?us-ascii?q?IIiehQdgVtggzSBZIcWUnIiAyYzLAFVExcLBwWBI0MDgQYjSwUtHYEjIR0XF?=
 =?us-ascii?q?R9YGwcFEiEqbkxlLFwaAwMNISQRWT84C0kFgRlZAoIeGV8jLANOewMLbT03F?=
 =?us-ascii?q?BsDBIE1BYleB1YdD4JGWUsvIEw/Y5NpjxKBfIxjk1lNcQoog3SMHogEB1aEX?=
 =?us-ascii?q?YIAhjIXhASBV4s8mVSZBo4JhAmTYoMiAgQCBAUCEAEBBoFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OX4hXwXN5AgkyAgcCBw0DC5FogX0BAQ?=
IronPort-PHdr: A9a23:QDGdkRzgcXZ/5I/XCzPsngc9DxPP853uNQITr50/hK0LK+Ko/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:YOqno67V4BeERbG6IP8hkgxRtGDGchMFZxGqfqrLsTDasY5as4F+v
 jZKXzrUP/uIYGDxfIslPYTipEgCuZDcm9ZnSQBu/CEzZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2Qqaj9MtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebIhA18t4IUN37
 b86CxkNMx29p+O23+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0wn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbIWEI4PVGZQI9qqej
 jLn1k2+WgM1DfrB1QS4sUOjhcjgpRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:xX4nSa3YB2cAf1hlvKQRJgqjBbJxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K690cm7LU819fZOkO8s1MSZLXjbUQqTXc5fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBZHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616jgvlU046Ku68AX4IVfXCodrkqLLKCCRtOzcXrCO1oXeN8rDVLzi0ty1ybxp/hZsy+2
 nMlAL0op6kr+y6zRHk0WrS5YR9mdfqyNdPbfb8y/T9LA+Cti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqkrd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixthq5FL77WHADurzJlZXf3mP0DwfeCko/iViuL4lGftsREokjRto+dk7bXnHAcscYZ
 lT5YnnlYVrmBWhHjDkl1gq5sCwVXIuGRrDaE0DtsuJlwVyphlCvhElLAh1pAZdyHr7IKM0ut
 gtPslT5cNzZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tTKCZgOlamXkaYzvdAPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGG+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8DXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummZZ5osQD2IwXtdKtmswwFI8vl5CmRliHlgtWiE
X-Talos-CUID: 9a23:yAmfuWDJCghP5f76E3hirGM5FeAHS2We7lT5IxK1N0ZoSKLAHA==
X-Talos-MUID: 9a23:GdmLswSLF+/Ahej9RXS8pRhLc596zJ2IVlwzrNY3tMqjGhRJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 12:17:43 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 802361800014E
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 12:17:43 +0000 (GMT)
X-CSE-ConnectionGUID: LsdeMF41RjuNC6MlLtjv4Q==
X-CSE-MsgGUID: pE8lFzVuQBa/XMRWhYHvCQ==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208,217";a="56968000"
Received: from mail-bl0pr07cu00103.outbound.protection.outlook.com (HELO BL0PR07CU001.outbound.protection.outlook.com) ([40.93.4.3])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 12:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCuj6wReDPrl+MsHPHmrW8CnymS1wA5Fq/G7UP8vCtowOiJP3Doc6K4IWflelxE/EuwPFMo+daCXn291FYbE6yG2vQysDWV07GW439JBcF91Ti62qXtV3lawCMGFk9JS/wYu6kPXc96n2kNx4O40pW8GoR4+whOcBgQbtWYyknzQGYMdPPYqyz/wD1AjbFFLeCGLkgZ4IlQNcYobJJ5IF62aejibJSe4QQzLiGCHxObfOaalvbfWZc7Lj9RgRtUZNNcbVhBUD0Qh8AsyikbTELM43gBZReGBNNkMJ/4ffZC6cPWp2RpZ4E8MPrO7EHcWjcbdIkb//MSVhvA7GOrZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60SRUtoGdAsfUUF6O6TJ41NmA7Ww2JS1qf3/KnqtAao=;
 b=d3bh8rQUJXJtaRQy+w9vdXzTsORrnM5aPYgrMVFfsoH4tgsOR2WViPktpgdrdYNgSm2XSTMLJaxA8LO2n31f8E2HA33TLjcHXZGfnPC5770y3YmRpZ769rGel0LTpanC7aFF4FCMlEXlJhyMk+aItY9dXNF2pescpelbu4RNopOhMaf79g6P8tOJ34j1l88RojGD7mHBnelkj2IEnApfYZaJwfSX82vjW3R01Ey8t/ImtduEXtYgO7ytPhFppI4guSSogrq7jCayOrhAPQv24AW4gnKvnZ1KuBEuCBLJFm8KqByQgywNpLzw36vNaeylWW5cDi6996Vv9Cnmtnf2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 12:17:40 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 12:17:40 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Viral Chavda (vchavda)" <vchavda@cisco.com>, Yoann Congal
	<yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
Thread-Topic: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
Thread-Index: AQHcsfycPqcLW92Kh0u7xE5N1441srWw83gAgFHTuo2AAAQ8AIAAAPyu
Date: Thu, 7 May 2026 12:17:40 +0000
Message-ID: 
 <DM4PR11MB6189AEF992ACB07830D1384EC43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: 
 <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org>
 <DM4PR11MB6189C2259D0CAC50D124C689C43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
 <CANNYZj9CbmTZ7uEVd3AAT8x2jn1T0SQiO=SjE5fr15F+V_=bxw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9CbmTZ7uEVd3AAT8x2jn1T0SQiO=SjE5fr15F+V_=bxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|DS0PR11MB7802:EE_
x-ms-office365-filtering-correlation-id: 581ce26d-c1fb-4b15-ba8a-08deac32a266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|22082099003|56012099003|18002099003|3613699012|38070700021;
x-microsoft-antispam-message-info: 
 knX/MKBwyu8Prpi1hQK3PanbaAEihA72Zk8ccPeRLaIjrZWv9BJQP5Qu56g6yxHjpP//wpCRnEcSocXLG386cDPKU/uJ8N+FOd52D1g13b36uSWzasLgBOvLyIAQ8kbQoctGEpnbkC4/mB7mSdFPkMSmRjWjE/9EknwK22PhirLiICQ+XoxXESIDqDEBRqcpHAigxmE+gpfRzsYbbVwsoVus+jcK3bee2tuHQ8dYY5g3wv3qF2TB2FhkTNaUgmFklM10omc11iIem4YkvggNYY5n5D6F17wv/MD6U+IdtzoBGwMRR7OowA+H3+7uvtfUQlKRehSIS/FhjKaMLgu7EAdR66Y5qBOlmEvr5+j2dkS7idSMqNLeR+9jdLToZ5TYuH2KzSY/VnRYF/p2hcjVPsXqEKS0eTlOJDg+hSVrHJXJF14yX/S6Hv3nIqsQUxaF1kYifFnhOyxVslQ8hbjz81aKqJEzUpO4s2B8jYJDEG+O/ssTlUKkaSdewFqgnZNckxWsDVBCPERIo5H9goSnA/e0XQ5NaYouGuPRkAPO2Z1J+ijrHvAxLO6v+PtwBy+8NDVS+iY8+vOzIIzKkvhKB/ofKZhDNLgcb5SxpWuo/eSOD595IDeHbp7dsBzoebPRoDxvWokQCyuIHzmg1sRHKLlSxwmR4BCUnxV1M9BBfiOpQFL6fpmEqIhR4ppGjAqmMPTEcXZS7daZTBB9HU/PIbyrJuLQ9gQTEtymEpVH4u4mrYjhyq/JyQPGsQVuBnJazUqVWmArBKEA0h3Op5uwRmkQlougfIr4+24V8nqRFEY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(22082099003)(56012099003)(18002099003)(3613699012)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?jXkZzD7bcSvFwW+sXIxf/HwXm6jZOf3GgxN4k7nQb2JYHSx46KvIKiewMw?=
 =?iso-8859-1?Q?42kCeSez8AUqmhvP7/HTbIsg8MjorE20nK4nCJtk8c7iMBrlCt9QsrvzhX?=
 =?iso-8859-1?Q?I+xuatBc0XEJJAjbnrOo0tuUSgG9NYIaoRcfyUPrqGf1EkO0ck7Il1U1qX?=
 =?iso-8859-1?Q?IM0Wwi+4hMxpJjkWQzpqCXVS+xasRLwVj8+qBWBpiD6OeHaG4o7by2ce/b?=
 =?iso-8859-1?Q?J/nun7QWTOhd9HoW/joAz0kr0ky3LMdJV53fOcHGjdUz9pV3ajhMPN0M1w?=
 =?iso-8859-1?Q?CTfJY0Yfk7KXi2ncNEalEffDD3Tq+6MIykmiQfmNmB9keCfHLmF5LLiuCB?=
 =?iso-8859-1?Q?4nGJB/L3DdZgABdvs5JTkjpeWdIL/J6P0Exj8FveBFCY289oBeT4YCA1jE?=
 =?iso-8859-1?Q?JooLbKJ6rIPFbVTYL2n3C5jM77GfJ0GDhJSLHcCgIA402JnVcTMvg0xAkE?=
 =?iso-8859-1?Q?pIEVqyYWkdPl4gEdQVNQZaxfPI+rQeL4s3e0+dr1Z9TZDOs/Kh0ffDc05c?=
 =?iso-8859-1?Q?xdR/KJj3mrGvzoSAEaiMx26C94beGJ78yPGt8t/oE7vVfkf1utr6WNw7jQ?=
 =?iso-8859-1?Q?UpB6WxQpGL4w3HJz3HRizVtHmYvBeYHxNO1ooUDmINGe82UTjoF8pQFa7k?=
 =?iso-8859-1?Q?BVTqotRoLPOK3A+K3QAR2G0Ar/JgPCm27MVY/L4OkbN8tq9aOc4Mj+5jcv?=
 =?iso-8859-1?Q?CbGVra/qweSUw1ZzPizBRvEkhIiqxsq0szXzAysusH0kDq4zU41gNM2SD4?=
 =?iso-8859-1?Q?v9QTCg4xIGXDrm6YbPvSUZLYfOcqn9S0MDsE94eqFJ2lF5tzGT+UWSW4Q4?=
 =?iso-8859-1?Q?yshbj3cIoUY2wTtUC3L4B5hNiJMwN92DcIdX8auniWkw4jc86h2lDmjNAf?=
 =?iso-8859-1?Q?bgm8JwmFDuvO+6P2BD8KVU5Am3/QD2NEsUz5ZkWSYE49qRfYNqDx4F7UfQ?=
 =?iso-8859-1?Q?7GYoXLr2kLQFrjrBB49DiMlAN7NVlUehRHNU53TCYV0cweJEKwGsQAiw1b?=
 =?iso-8859-1?Q?sbQt9OD+BWSNwUMxH7MB/MEi0yDPxtIfXxPtQcVkbpqR5M6uAA36Zk28/J?=
 =?iso-8859-1?Q?u/20d8n1bDkj9/D3O4oRU6YfGRwvvjHziZhftyARxekARpRvC/hvCOkNpe?=
 =?iso-8859-1?Q?zSiaXU7wnCVjxuquAmOVFUl+LkVlcNfPjOMf5z2pJRqAm8IoNH6sNIs4MA?=
 =?iso-8859-1?Q?XrsnPOBgnnXVZHIe3shoWdEgDyqcJgSJDmgJ3ggd4rBcj/Q3zNr68w22KS?=
 =?iso-8859-1?Q?D/w6ZlIenOSgg2luFRib1LAVd8D5W92JkB2qA6Tfdei3QfGnVfbhtMo5JR?=
 =?iso-8859-1?Q?6XuCVL2zPir7RV6Kpipl7IgGdZgg5GgSFh1DzjQ6+vciwtVFrrbfuDbGC9?=
 =?iso-8859-1?Q?xGJcgPeMUipg1dPVuX48nBqUry+KWjhZrpdneL0PEXxiwUjKZVhy0CuHxz?=
 =?iso-8859-1?Q?Ti78CWlMkw7zl3Vpt3EkX2Ai+jlo2JTb9XYtYAUiVybvx6XPwoO8EWwwJa?=
 =?iso-8859-1?Q?69Q6O/tQrLCgEaMNMYguHwLWhP1h+yAp5H2m36DdQK8mxTp1pBWrbnjfiZ?=
 =?iso-8859-1?Q?WiM9g4zxGqxmF2bu1rDT5VXuYekvrQiaZaeStXkBPBwdb0GUbWAet0jRg5?=
 =?iso-8859-1?Q?1aTCwFLx+sB/7W9GUPIl2soIMNhiE1P/MUUghbcVPGeG01we5Su7X5iy5/?=
 =?iso-8859-1?Q?zKgM6J7fMvB53n6o6R13+WBmxFPtK++kUsNaiozJ7/j/KREiOgUK5oBu/a?=
 =?iso-8859-1?Q?fty1tppxAEjIKvfv7YOBE8RstLx0LK//jt1UbHBeClt9aE?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189AEF992ACB07830D1384EC43C2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	vyFDQbXUPTI1nxPP4XseHyzCmVJEfsU6ssW0hiYLhBGsbrxiygzaOufMC7Gsg/L2znzBrQ2toGug9IeHDVjqLzdU1nJfWVZQ8Wnj8Pgee9/UPegBYblTrFRqpcosomAzi+q1IM90hTxbcrcY3svqDoVF5dGoXNM/J6Qc22czpNd4tagKZlTf9n5dnDFtXytJp1W1xXwfaZhNeu/h1UxQP/EIJao+cQfltsCWjSLSOUgNDTYlyA9YnDkdO5/EGKKyI9KwMkBBnEUk2F4rOPJpn7JuFi2E3FPm8d867oFm6CgVJyTxLfATTVRvOvOh2NmmCtE0zxpZ9xk7YShTdM8BXA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581ce26d-c1fb-4b15-ba8a-08deac32a266
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 12:17:40.5623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DELXaht+7MylCVEHrlVzXPJWDQI87HkzKJBOJeuslGfR9fWspFEoBBZ4Q1n2GGXRRyF/42uJLESkF2yYCa81QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 12:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236588

--_000_DM4PR11MB6189AEF992ACB07830D1384EC43C2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,
Thank you for your response.
You mentioned that Wrynose has switched to kirk and no longer uses runltp. =
However, I see that runltp is still present in the Wrynose source, for exam=
ple:
ltp_20260130.bb =AB ltp =AB recipes-extended =AB meta - openembedded-core -=
 OpenEmbedded Core layer<https://git.openembedded.org/openembedded-core/tre=
e/meta/recipes-extended/ltp/ltp_20260130.bb?h=3Dwrynose&id=3D1833a3c485b299=
dd91937d66c9c6ccf5ed04d70b>

I understand that runltp support is deprecated. Could you please clarify th=
e plan and timeline for its complete removal from the Wrynose source?
Kind regards,
Deepak
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, May 7, 2026 5:20 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>
Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>=
; Viral Chavda (vchavda) <vchavda@cisco.com>; Yoann Congal <yoann.congal@sm=
ile.fr>; openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manua=
l CVE Fixes in LTS Releases

On Thu, 7 May 2026 at 13:40, Deepak Rathore via lists.openembedded.org
<deeratho=3Dcisco.com@lists.openembedded.org> wrote:
> You mentioned that runltp has been removed upstream; however, I see it is=
 still included in the Wrynose release. Is there a plan for its complete re=
moval from Wrynose?

What I see is that wrynose has already been switched to use kirk and
does not use runtlp. Can you provide links to where you still see
runltp inclusion?

> Is there any plan to support kirk in the Scarthgap LTS release?

No. Such changes aren't eligible for LTS backports.

Alex

--_000_DM4PR11MB6189AEF992ACB07830D1384EC43C2DM4PR11MB6189namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Alex,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your response.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
You mentioned that Wrynose has switched to <b>kirk</b>&nbsp;and no longer u=
ses <code>runltp</code>. However, I see that
<code>runltp</code>&nbsp;is still present in the Wrynose source, for exampl=
e:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0);"><a href=3D"https://git.openembedded.or=
g/openembedded-core/tree/meta/recipes-extended/ltp/ltp_20260130.bb?h=3Dwryn=
ose&amp;id=3D1833a3c485b299dd91937d66c9c6ccf5ed04d70b" id=3D"OWA85d81b4f-cb=
18-6c79-39f9-66a78cb3f8d2" class=3D"OWAAutoLink">ltp_20260130.bb
 =AB ltp =AB recipes-extended =AB meta - openembedded-core - OpenEmbedded C=
ore layer</a></span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I understand that <code>runltp</code>&nbsp;support is deprecated. Could you=
 please clarify the plan and timeline for its complete removal from the Wry=
nose source?</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em;">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Kin=
d regards,<br>
Deepak</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, May 7, 2026 5:20 PM<br>
<b>To:</b>&nbsp;Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED a=
t Cisco) &lt;deeratho@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;richard.purdie@linuxfoundation.org &lt;richard.purdie@linux=
foundation.org&gt;; Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;; Yoann=
 Congal &lt;yoann.congal@smile.fr&gt;; openembedded-core@lists.openembedded=
.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] Inquiry Regarding Package Upgrade Approa=
ch vs. Manual CVE Fixes in LTS Releases
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Thu, 7 May 2026 at 13:40, Deepak Rathore=
 via lists.openembedded.org<br>
&lt;deeratho=3Dcisco.com@lists.openembedded.org&gt; wrote:<br>
&gt; You mentioned that runltp has been removed upstream; however, I see it=
 is still included in the Wrynose release. Is there a plan for its complete=
 removal from Wrynose?<br>
<br>
What I see is that wrynose has already been switched to use kirk and<br>
does&nbsp;not use runtlp. Can you provide links to where you still see<br>
runltp inclusion?<br>
<br>
&gt; Is there any plan to support kirk in the Scarthgap LTS release?<br>
<br>
No. Such changes aren't eligible for LTS backports.<br>
<br>
Alex<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189AEF992ACB07830D1384EC43C2DM4PR11MB6189namp_--

