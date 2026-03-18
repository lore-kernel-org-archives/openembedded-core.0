Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A54103E174
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:57:57 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13363.1773838676632676883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 05:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fTBDfT4A;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7858; q=dns/txt;
  s=iport01; t=1773838676; x=1775048276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=dMBxWQfT2xJna26epA4hCY0ZOOVVj3iAmsEmpRVINIA=;
  b=fTBDfT4AbI2NAqiaI0zusFU/LmH5MGgjGdP6WyQqvRDngv/6VgKocSYp
   vCfkI4zwvYpi2fAaT9ywYmf3pbWe3y53RaUAoKXkOoL3k/l8oRuiGoX+1
   5Q+jCx0NcgqV3BZnYKau4dEBZnlMkasu22p6SCKNVqSbDMAL/XMGkWx/2
   YNpCHuD4LDEbguddrtpPxDT70JLiEI0BFQ816Q5r5G7BAnik5Xjq3EyRH
   SuAeSEwPsWjPtOXYLWCdvPuJ4n2BEXr37dQT5m3tt0iFJT2SZcboj6mI+
   OU0DxRg0USuamAY0pa07EUHkrV96cv/UtZ/iIBXlMg0u/hBsNfT8O3/zi
   Q==;
X-CSE-ConnectionGUID: GucAAeJLRbS6/WVaGCvSNA==
X-CSE-MsgGUID: cW1snAPQRxyhgLAi//jqzg==
X-IPAS-Result: =?us-ascii?q?A0CYDABkoLpp/43/Ja1aHgEBCxIMZYEgC4E9ATBTB34Cg?=
 =?us-ascii?q?Q8SSQSIHwOFLIh5A5dDhleBfw8BAQENAi4BFQ0EAQGFBwKNIgImNAkOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQECAQERZ?=
 =?us-ascii?q?wULAgEIEQQBAQEjCycKHQgCBAENBQgagmGCHRYZJwMBAg6oUQGBPQKKKniBN?=
 =?us-ascii?q?IEB4C4VBYEzhTyCfRsBAQUlSWyCXIEgARmEeicbG4FygRVCgmg+gmEEAYE0K?=
 =?us-ascii?q?zyDV4IvBIEOgRR6FB2IIoFvgRg7gR2FXlJyIgMmMywBVRMXCwcFgSMQMwMqL?=
 =?us-ascii?q?y0jDzwFLR1wDCcSDx0XFB9HERsHBRIhKoEiggEPhmV5Ay5eGg4iAigRXEo+C?=
 =?us-ascii?q?1IFgiwCgQcDC209NwYOGwMEgTUFjGlcO4FBASxFAQEGGB43FQYrTwtrFSpaC?=
 =?us-ascii?q?JJrGg4vjxCOX5UXCiiDdIp4gSaNPogyF4QEgVeLPJlUhEyDN5EDIo1nlWAHD?=
 =?us-ascii?q?IUaAgQCBAUCEAEBBoFoPIFZcBU7gmcJCj8ZD1aOCYhVwB94AgE6AgcCBw0DC?=
 =?us-ascii?q?4ZGiyKBfQEB?=
IronPort-PHdr: A9a23:hqkxDRY1RVOSzGD4z8dgNcH/LTAchN3EVzX9orIuj7ZIN6O78IunZ
 QrU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:5RD8g6ps3Cu3A8IV089cnBWvkDteBmJBZBIvgKrLsJaIsI4StFCzt
 garIBnUOvbcYDD2Lox1OoXj9UsGsZKBn9I1HQQ/qCA0Qi9D9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8UM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0slqCkhn+
 N48Ejo2MFe8ueuZ66yAbMA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7Wz1VtEqcuYI84nPYy0p6172F3N/9JI3SFZ8IzhjCz
 o7A12/GWwocHeSm8yqU8n2Ir+6I2iHiSo1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:5N1RFqENEDAvN8BspLqF85LXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKPTOW9ldAQ7sSl7cKrweQfxEWs9Qtqp
 uIEJIOSeEYb2IK8PoSiTPQe71Psbv3lZxAx92us0uFJjsaEp2Imj0JcTpzZXcGPDWua6BJc6
 Z0z/A31AaISDA8VOj+LH8DWOTIut3Mk7zbQTNuPXQawTjLpwmFrJrhHTal/jp2aV5y6IZn3X
 nOkgT/6KnmiPem1x/a2VbU6pRdiPHhxtFACMHksLlUFtzrsGmVTbUkf4fHkCE+oemp5lpvus
 LLuQ0cM8N67G6UVn2poDP2sjOQkgoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx86q
 RWxGiU3qAnSC8o3R6No+QgZSsa0HZckkBSyNL7SEYvCbf2XYUh6rD3OnklS6voUhiKsrzPW9
 MefP00rMwmA29yKUqp/VWGBLeXLygO9tDseDlehiSYvgIm6UxR3g8WwtcSkWwH8494Q55Y5/
 7cOqAtj71WSNQKBJgNSdvpbPHHQVAleyi8el66MBDiDuUKKnjNo5n47PE84/yrYoUByN83lI
 7aWF1VuGYucwa2YPf+k6Fj41TIWiGwTD7twsZR69xwvaD9XqPiNWmGREo1m8Wtrv0DConQWu
 q1OphRH/j/RFGeVbphzkn7Qd1fOHMeWMoatpIyXE+PuNvCLsnwuunSYJ/oVfLQ+PYfKyrC61
 c4LU7OzZ97nzSWs1fD8W/sZ08=
X-Talos-CUID: 9a23:Sex1yG/RtuD1KP6l4u+Vv2EJEekMf1/59n3rfQiHN29GY6Oub3bFrQ==
X-Talos-MUID: 9a23:FyAcGQRfnJ8GV8nERXTnu2h5Mu5Q2p6+GUACtbwH/I6GLD5/bmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:57:55 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 9D2CC180004A2
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:57:55 +0000 (GMT)
X-CSE-ConnectionGUID: 2sP1oztYR4GbLmMSdsLdSw==
X-CSE-MsgGUID: CdZxtlkZQaGwuWIrT2i+dA==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,127,1770595200"; 
   d="scan'208,217";a="68825220"
Received: from mail-ph0pr07cu00603.outbound.protection.outlook.com (HELO PH0PR07CU006.outbound.protection.outlook.com) ([40.93.23.91])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUCzRNRzzBwMN2a/bdRmvILyD9Vmn568WTEyo5ooSBYs5eVYHzzg7KCz2ssvIuY/yEI+vRNQP/goP7ygzPdQboXIphmvPcCcvyE7jcdhEh/TY3IGPeTemiOJHO2xaMvLztjm804pP5Y8+8tVklPYp5niKApCprbQvtj33WVGSMFT8tozREpZidotIgJPwf4FDT8bsWq1CAXKL+OdYOAr5Sg4PBgi+3CByicB2VLnFHRFJ314N8tLPNfQ9toMwHtP1G5VPExFW/79oYoF705fmJMEZGVKQhjo12o6dopYUuhmdTdpksinkPksyKmEbG4qZ2vqvaGNd4VTYypoBJhCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMBxWQfT2xJna26epA4hCY0ZOOVVj3iAmsEmpRVINIA=;
 b=E8zpVfak9HFc670GH0EwrIylFNNmyhkyAGaw6Dn8yD9aYS7cswZg0Wly3HThV0Du1A0MgS5pFJOOezi+nUxwHW2SKeLxgSx8pxu7kGHDt5140Fc5QrcmkkLQh4TCSKBjl3FEHyrE/dc/qv+89ioK75HmdP1fQz4NJTiCpAu3g34f4eKaubbikjkKedVxQGTdu7vWe6pioX5zhLRAUbDEiw5HM56MMgouuyWU1gUjz3s0jn6rbgoHFYsRBmvtFfbjJ848YVec1a7x1CMJssEhEIDCm7BYROaFrCnBQHsz+jAtx9JGoO38TTpnxUcuH25tEnw0AUENoLfFen4tDFbk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by LVXPR11MB9779.namprd11.prod.outlook.com (2603:10b6:408:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 12:57:53 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:57:53 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect CVE
 assessments and runtime warnings - cover letter
Thread-Topic: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect
 CVE assessments and runtime warnings - cover letter
Thread-Index: AQHctpmRucsvdbshz0mIBlG/elKiurW0IbGAgAAekmA=
Date: Wed, 18 Mar 2026 12:57:53 +0000
Message-ID: 
 <DS0PR11MB740501DF6D22149CE85C0E31DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
 <DH5UZL3U1MAB.1SVC41PGSAO8X@smile.fr>
In-Reply-To: <DH5UZL3U1MAB.1SVC41PGSAO8X@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|LVXPR11MB9779:EE_
x-ms-office365-filtering-correlation-id: 9666edc4-2f2a-46ce-b193-08de84edf7b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|7053199007|56012099003|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 TCCW+5Q53A0Pth6nkhNcv5lhXnexj7uQERDDGGaJHxB4tKxLTT0V1wlxBJRBLKO2cZzoDOj9ihqlIq4o84jCMTJfDIiTEYsm5OgXyGZTVqNlAW4ZlwuBd0TgdYtoE3HvDMQDgeGqv4cWtK0y+Py2Kvi81rUjLEVsl7t0qoOrWezCrZaL9dvJGSSyvrpobMdXqvpl8f430UlV7yfuIyHczAprbrIJnX3+S0J80BeHW4cW6hUWfriYffod1fQIgOQqIPnfGI7UL7E5KASF3XYf3EM4KfHrkaP+OCXqJ7G+byfPk5MJ9pv5pDgcRFokClpHiB4XWLjY67naTF0pdPCMVH/WKVxFM3w3uO+pTtzi1kCFHZMgGXVTKaXvGJSZpMBL3v26q3/W5miVAiqI25gqBncOY9gX36buA/ymaeIbGsaTuLq7E/QJsDazRzIHLsO/zU8TdPlfTFTa70be2iVeL+rCTRAESX7ABiMVXreIieoyNYJOOFzwHiWomkML0J4a3K4J9rsH5NvXzUhz2Tl5Gs+BcndVNhqZWxSk5HNh5Z8OlGIR0UOC1kfctlpfY2kDtBCaRw2rs05mv1nZFhkpPLCjauhBBgKoGK2JCHVtgvSs+CMOhJZ4oaK1u0qEgiO4a0JQPyTRFKugnsNnJ0cVvTnyoen3y4zU600rb7QEIo+RyMpdsNZE4pf4YW3PihkFA/NosZrcKXM1NhwdTbXZv9tRMeI0vFEOXei6xzhe3Sv25HgbrzD3xVzfBdcjjWJWtF1HzzOjCv6ecqLUlA9/AJ5olua8+CgTA6HL+f4nZ0s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(7053199007)(56012099003)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fbEOjTdfKyT8Nl7DDJ2Az3hDvuQF9UL1hc8EFOIeWwSgdsLnxAI+ab341LKh?=
 =?us-ascii?Q?NPjQmjgqm8/+rQV9gflBkiqEzBZ1h90bQsgp8i9wM0pmo/EH5VSb4cLc3BDN?=
 =?us-ascii?Q?4oxMsXOjeE8jHdNgaRG+UBZ/y2rcSD0zV5STlemjjGl2lRkTd/r9IRNd6uEI?=
 =?us-ascii?Q?amlps80VOjbcb0YQ+nu8FHA0I2szUk4qdMun6gd0+JOyCVozelZB0SLmohbc?=
 =?us-ascii?Q?Sd+2c7kMQNP/c2PVV4ShR4bCyxP4Ysw6YoSgtOhloZ/s4vD1XpO5Au1fdUDN?=
 =?us-ascii?Q?OWgV69/hlCFEQ1Esg5X6qkKQkjxixFDjgRi/qCvSZKHOP5jx5BOFBomYBt8g?=
 =?us-ascii?Q?cXdRe5MHj6Uqai/PMFQt4vllbMUPzy40ijbdNUYi6g+W9hBcZMVX4oyR3zkj?=
 =?us-ascii?Q?uWuYjRewYTxouKjMhWIVefzWUULE5FZIVP7ceI4Wmr92m+duz6Ay7hqdB9/J?=
 =?us-ascii?Q?cw6bPAeAu8P0RtIpPYF1eCwzA9rKE1l1O6omb8t64zAKdoncjOYh+97z3ir9?=
 =?us-ascii?Q?3SVRDiZQ+ujy2XAerg6O17BFqNNQ/Qq1piFWWx/TJfxG1NarBg4JmE6P1kZL?=
 =?us-ascii?Q?RgYYvoVpY3Bhg3jmypSSk6xavQs0SYXp2kQwZWHVhQfWv0ezl+yvnbv8u19e?=
 =?us-ascii?Q?VuTBtHk1HsQCZ8gIAjrO2mSp5h19S/4V3O3fwudVIybH8ryLlAKO2hFmcpAP?=
 =?us-ascii?Q?wpgt4hiEWNiCsDzBqve9uN4CUwMDX2X9MNJ6NmMltrJiuA/JkMBajki4ogde?=
 =?us-ascii?Q?evK9diqFzXUEqGAbZcgCQ2Hn8nzI9wTh7fA7ar0djxPP2jv3UEzPOcY/l80R?=
 =?us-ascii?Q?RMNBKDNiRFjJYbuNAdxBuEMH4sfSKaYvXKF6uhcLSwGrHWHMbEjGKM/1jR52?=
 =?us-ascii?Q?mloxowR1lv2Tsf+At2ivur+LW0BsdeJmQDlshuTnV9APLet22RMibHGpK8iZ?=
 =?us-ascii?Q?tn31xCx4iHEnRW8EOZjkVOnuNLvjLOjbTDXQaiqSg89YpGA6ZHsUDBqt6o2j?=
 =?us-ascii?Q?66QBEX1p8rLFZSNGT02cFbFBnk+IR1lzPI1yEYx9ArYRaYWyKriuICyaeOru?=
 =?us-ascii?Q?JBtc6TIWymFNtKDJ7AiRWtZhKNSmbDDqKtJYQmvGS7v6r1y1R2+55btUij0y?=
 =?us-ascii?Q?SDZ9G5/nVo00Udlcezm/8J7n+HKKjuroa+W+MjTCNLcnWOB7K4RZ0qt5NVmg?=
 =?us-ascii?Q?//5vtO/tqOB73nx+y6Lueh8YBmtogmP/bKvkzlaGIS+OM6X5vteAvq44sjj4?=
 =?us-ascii?Q?sR71NJ63cg2K1C8byGLFEXYNhVsyMJIWuwxtjHTbOwyq8itOV6fWmNMwE+BK?=
 =?us-ascii?Q?JxB+wESgrKRtz5gnxsDSkJZzux1cCPEUwYx//1G5mar0l5pVHGdLAMbm0whp?=
 =?us-ascii?Q?JYSfxd74CJ/kkj9TanOVQ6mVEczlzVN8OjRY0RLZ6IIZdwC1Huhs9p8JS7v3?=
 =?us-ascii?Q?rAuKbH1f5VS0RR1irUS0/pU6MvKTpp/ywPdar5oIqluQglw1FY7Qwjpbi0ry?=
 =?us-ascii?Q?r0UFr/Ank1pSksKES1WMZkU66N0gTa85LrN3n0rO9fPMm/QhsljXCoFruD0D?=
 =?us-ascii?Q?DkfDgsLKe6QV/IPmvh8IHM61bjKZcs1LVZsPY5I/LUzciE9EdCtJxkKIJ4ea?=
 =?us-ascii?Q?vFXSsoveQMLzRhOl1C5Irsvlhm9YHqX2NkpJkeAGA4QU1CqiPaPz97Vu1FfG?=
 =?us-ascii?Q?eM5f7yIFb/D83vqj3q9EK3VK+Y0EVAtEkOwZ4VhNPZfHOFrs?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB740501DF6D22149CE85C0E31DC4EADS0PR11MB7405namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	U6GPBpjHK3Kf4jfNs5eo1hJ9lfOaa81QHr5gP04Bev/fHXvWOJ/qO3v2pFbH8BVtRgXL/q0w5pqtTocr81p+PETEjIyEUKHuqkcxOtq9pbbF5GHpja6p/PIN1JT+/p0z5iWz5RnuftBsplI8/HV2jMIZvgCtplsB2ZaVcE8TCaspmDCXkylY5UN0GtAI0m5S6GG+dchiIfyNg7nZQmZRQ8ur4DmQY8UdQBUdiRAplMLoPxpcFjFPQZkVZ3r/BCOdxBU7PkILfNkFxAbWWyFQ2HNQ96ZDoiLmnW6Q1aSbjhFkuqPETKU70mvPCKt7y9ngy0WFDK4qrw6/z+dlX9t8zw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9666edc4-2f2a-46ce-b193-08de84edf7b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 12:57:53.0973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7wbZLLFW6zz3rJRWbL2hSf16QsP6dHDmFBOxJb2rn+u9sWfbMg5I6c6fB4sECTGz+NVy0nsbFUvcIQDf7jvdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9779
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233385

--_000_DS0PR11MB740501DF6D22149CE85C0E31DC4EADS0PR11MB7405namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I will share the new series of patches, which includes a few additional one=
s. I will attach the corresponding output files to that.

Best regards,
Het
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, March 18, 2026 4:37 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral Cha=
vda (vchavda) <vchavda@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect =
CVE assessments and runtime warnings - cover letter

Hello,

On Wed Mar 18, 2026 at 6:39 AM CET, Het Patel via lists.openembedded.org wr=
ote:
> From: Het Patel <hetpat@cisco.com>
>
> The patches address the following bugs:
>
> 1. Incomplete CVE Assessment Details: Currently, the `detail` field is mi=
ssing for approximately 81% of entries, rendering reports unreliable for au=
diting. These changes ensure that the rationale for a "Patched" or "Unpatch=
ed" assessment is properly recorded, allowing for a clear distinction betwe=
en version-based assessments and missing data.
>
> 2. Runtime Warnings: Corrects four instances where debug calls were missi=
ng the required log level parameter. This change eliminates the runtime war=
nings that currently trigger during every CVE scan.

I appreciate that you trimed down your previous try to cleanup CVE
checking code[0]. But I still feel like it is too intrusive for stable
inclusion.

Can you please provide examples of some CVEs having "Incomplete CVE
Assessment Details:" so I can understand the problem?

> Testing:
> - Applied cleanly to the current `scarthgap` HEAD.
> - Verified via a full CVE scan.
> - Confirmed that all existing CVE statuses are preserved with no regressi=
ons observed.

Can you provide output (log+json) both before/after to verify this
claim?

Thanks!

[0]: https://lore.kernel.org/openembedded-core/20260220053443.3006180-1-het=
pat@cisco.com/#r

> Het Patel (4):
>   cve-check: encode affected product/vendor in CVE_STATUS
>   cve-check: annotate CVEs during analysis
>   cve-check-map: add new statuses
>   cve-check: fix debug message
>
>  meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++--------------=
------
>  meta/conf/cve-check-map.conf   |   9 +
>  meta/lib/oe/cve_check.py       |  74 +++++++++---
>  3 files changed, 197 insertions(+), 132 deletions(-)


--
Yoann Congal
Smile ECS


--_000_DS0PR11MB740501DF6D22149CE85C0E31DC4EADS0PR11MB7405namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Yoann,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will share the new series of patches, which includes a few additional one=
s. I will attach the corresponding output files to that.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Het</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, March 18, 2026 4:37 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;; Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix inc=
orrect CVE assessments and runtime warnings - cover letter</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
On Wed Mar 18, 2026 at 6:39 AM CET, Het Patel via lists.openembedded.org wr=
ote:<br>
&gt; From: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt;<br>
&gt; The patches address the following bugs:<br>
&gt;<br>
&gt; 1. Incomplete CVE Assessment Details: Currently, the `detail` field is=
 missing for approximately 81% of entries, rendering reports unreliable for=
 auditing. These changes ensure that the rationale for a &quot;Patched&quot=
; or &quot;Unpatched&quot; assessment is properly recorded,
 allowing for a clear distinction between version-based assessments and mis=
sing data.<br>
&gt;<br>
&gt; 2. Runtime Warnings: Corrects four instances where debug calls were mi=
ssing the required log level parameter. This change eliminates the runtime =
warnings that currently trigger during every CVE scan.<br>
<br>
I appreciate that you trimed down your previous try to cleanup CVE<br>
checking code[0]. But I still feel like it is too intrusive for stable<br>
inclusion.<br>
<br>
Can you please provide examples of some CVEs having &quot;Incomplete CVE<br=
>
Assessment Details:&quot; so I can understand the problem?<br>
<br>
&gt; Testing:<br>
&gt; - Applied cleanly to the current `scarthgap` HEAD.<br>
&gt; - Verified via a full CVE scan.<br>
&gt; - Confirmed that all existing CVE statuses are preserved with no regre=
ssions observed.<br>
<br>
Can you provide output (log+json) both before/after to verify this<br>
claim?<br>
<br>
Thanks!<br>
<br>
[0]: <a href=3D"https://lore.kernel.org/openembedded-core/20260220053443.30=
06180-1-hetpat@cisco.com/#r">
https://lore.kernel.org/openembedded-core/20260220053443.3006180-1-hetpat@c=
isco.com/#r</a><br>
<br>
&gt; Het Patel (4):<br>
&gt;&nbsp;&nbsp; cve-check: encode affected product/vendor in CVE_STATUS<br=
>
&gt;&nbsp;&nbsp; cve-check: annotate CVEs during analysis<br>
&gt;&nbsp;&nbsp; cve-check-map: add new statuses<br>
&gt;&nbsp;&nbsp; cve-check: fix debug message<br>
&gt;<br>
&gt;&nbsp; meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++------=
--------------<br>
&gt;&nbsp; meta/conf/cve-check-map.conf&nbsp;&nbsp; |&nbsp;&nbsp; 9 +<br>
&gt;&nbsp; meta/lib/oe/cve_check.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 74 +++++++++---<br>
&gt;&nbsp; 3 files changed, 197 insertions(+), 132 deletions(-)<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB740501DF6D22149CE85C0E31DC4EADS0PR11MB7405namp_--

