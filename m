Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D7E103E171
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:54:37 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13286.1773838469438406305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 05:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KroRI+BP;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23728; q=dns/txt;
  s=iport01; t=1773838469; x=1775048069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=BnHDhcFzollvVDY6gBC4OxBYqBkRE3pVvN/sIDUCNH8=;
  b=KroRI+BPPsLMQVfyfjWld02tnEC3DXEtHGetob6x25M2FKsIN5e07CQG
   LLJLjR4cZP6eQUDjqX7n3GE46xcYxO3XG+AGrPrK+9Ka/S09ARcvuYDPT
   wKl9dMY2qhRiex40i0j8KWIiICK2B3whQUQU4WDLU0EZFSLmltdMCfNDx
   ze8x175hcX/cywbguqPQsAzfYK/M19tlacrV/tVsYC/RPc/mSmwZOxAAt
   Ng3sriiX8gXKmL9B9XNd7Ul5P/HjD9Gp8s9L1eqssXCv2ZCB3W6WMINlP
   u6Zs877wWQzjUBpUU9zEik/Q+2QE1qm7u5T5t6KBz4Pa2eesa6cn0MRVg
   g==;
X-CSE-ConnectionGUID: oLJcBoyaQDi+XVoJPjfHjQ==
X-CSE-MsgGUID: J1rdFf3VSsq4d4hbrzW3mA==
X-IPAS-Result: =?us-ascii?q?A0ASDwBOn7pp/48QJK1agS6BK4E9ATBTB4EAgQ8SSYgjA?=
 =?us-ascii?q?4UsiHkDi2SSNoF/DwEBAQ0CLgEVDQQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBEWcMBAIBCBEEA?=
 =?us-ascii?q?QEvIAcKHQgCBAENBQgagmGCHRYHAzYDAQIOqEABgT0Ciip4gTSBAd1DDYJeF?=
 =?us-ascii?q?AEFgTOFPIJ5HwEBKoE1glyBIAEZhHonGxuBcoFXgmg+gh9CBAEXgR0rPINXg?=
 =?us-ascii?q?i8EgiJ6FB2EYoZHO4Z7UnIiAyYzLAFVExcLBwWBIxAzAyAKLy0CFA0iDxoFL?=
 =?us-ascii?q?R1wDCcSDx0XFB9YGwcFEiEqgSKCAQ+GZXkDLl4aDiICKBEDWUo+C1IFgiwCg?=
 =?us-ascii?q?QcDC209NwYOGwMEgTUFjGlcO4FBbAcBgQ0BKxcJLwEKIR0DlFA9jxCjBXEKK?=
 =?us-ascii?q?IN0jB6NPoIAhjIXhVulEC6YWCKNZ4QJlwQCBAIEBQIQAQEGgWg8gVlwFTuCZ?=
 =?us-ascii?q?wlJGQ+IAIZfiFXAH3gCAQgyAgcCBw0DC5FogX0BAQ?=
IronPort-PHdr: A9a23:lHcfzxXr7c2bxL/X/nb+cH2/C0zV8K3PAWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:stPggaAe+hB0EhVW/3fiw5YqxClBgxIJ4kV8jS/XYbTApDMn0WdRz
 GsfXmyHbPaDZDPweowga9+zoBgAsZfWm4MxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExNFMB2sxLIQh1uc0MV9J1
 8QaJhAPV0XW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8XBY4mlfuAjXjkeDoeo1WQzUYyyzSNllwtgei0a7I5fPSoHN9ZsEjDm
 Fnd5jj1XhEQLs6gkj+spyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeAuhhZX59bFPc3rVnTjKHV+A2eQGMDS1atdeAbiSP/fhRzv
 nehlNLyDjspu7qQIU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:OFCbU6EuhyczdYpTpLqF85LXdLJyesId70hD6qkvc203TiXIra
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
X-Talos-CUID: 9a23:o8cgi28HMKw42FREel+Vv0kwOMsPdWzU9VvRYH+GDkRRSrO1S2bFrQ==
X-Talos-MUID: 9a23:7GUr3gknzIm1Nc45OrQXdnpAbd1kzar1NnsWiMkK58mOLz5PYDK02WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:54:28 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 3832F1800012C
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:54:28 +0000 (GMT)
X-CSE-ConnectionGUID: cEiygpdFQnWw87o8dV2L2w==
X-CSE-MsgGUID: C78Vv5/QTyCqjDvIrQnLGA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,127,1770595200"; 
   d="scan'208,217";a="73816715"
Received: from mail-ph0pr07cu00601.outbound.protection.outlook.com (HELO PH0PR07CU006.outbound.protection.outlook.com) ([40.93.23.89])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:54:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtZJaFrvvPzUNXiA2b1aTAZ57N+8MIZ0rNNPUpEeRWzyQYT1yWobY9Hz6qMl23RadawIT2aDn6YgzIBJ0XCZ9cvkT3onWTEHDVt6FYL2MPj91GT3YrS39pSZslr/8+1saHIdIYSHF+PREeS+7F/oYRrpYWMCIoW5BR3THFMX1JTUQDGm108GxL+9d4I4qHnFISctUmtZP7qx4HCph3HyaBwVZLdiUMJPyYbIEXDgl2HviI//8o71vnoOhtJt2agy3bptinjjD4QIwrgY2QrLv/8d8y/J2lOXXsh5i5QyTOtfZbrlsAn783+GVALV3IzeyxoPftvnVLBjftjHtOEmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnHDhcFzollvVDY6gBC4OxBYqBkRE3pVvN/sIDUCNH8=;
 b=aZi98wYXuDLOCw7ynU8nve6WT011X8UlSpP4Z/erm5h50kEpOv8n32uzMMAmbILlT9AsoK8byEiG5nM1QJXyk2ZvShy+bujcj9IQiKyk7+RKDOpBWF1JeQRNZHn0BsPFJ/EJ6hvfSuqBuVqyhZ0EClcJkta4DJGzPTgUPL8bjjZdssOusm539i5uObn4vK4KEskxgKAPHT0s8RCBiATgzH/CoLT2h0WwLT/Q7sZ3MeutSK19iOUESog6zu7ZsRRL3OBEND8fF+uXIio9FFW9jMm6bwNyilF0xtbVd9mhbFXniSIoX/9t6iZo7FdwsMWxPaoOoIN8zLpYG4JFKHvsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 18 Mar
 2026 12:54:25 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:54:24 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Topic: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Index: AQHctpmSSEmwhP2/VUGDnacVUPPxqLWz5SIAgABaSAo=
Date: Wed, 18 Mar 2026 12:54:24 +0000
Message-ID: 
 <DS0PR11MB7405C10E9AA218628B238FF6DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
 <20260318053906.26606-2-hetpat@cisco.com>
 <AS1PR10MB56970E86A59E00B8CA3F389DFD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56970E86A59E00B8CA3F389DFD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=02211f1f-7979-4330-9646-2299942f0bd0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-18T07:19:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|PH3PPF957B3B2A8:EE_
x-ms-office365-filtering-correlation-id: cacb91c5-a222-4e29-5037-08de84ed7b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003|18002099003|56012099003|22082099003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 bSLIR6At7YvFNHkfankCWJSJ6opDjyFgY1z7StjI7GWC852wMHPj2nrGLfK6+BxC7fjFBT98h/sOTxQ05WHrjdi2zOZuJoHuDpr58lxMIMJ3l2f+sjbhjaxMu7RtoEd1n590Y1ahVClCEhccPv+WNCqYBjBMS/7ZeVvSz5EmaavLF0gOhb2zZIvER21P8AlkumW3xOGVr1PWBc6qNzPdpCoGqJUtXIiOw2RYlegICgG9gaOT4IBkKwYO02HQCxRW9w5Jxpsd8bbFyTGVdWYgPTNYe5DcTx4NRdnsgdbfyNZ0Cwc68xl1o8g2+O0QXFXDiwS26TDY7o6oX0+qNMT9ur88IC2nl15m8sZE6y2Vc77NfbOkGUEPuKH/5nUE3Wtyfm5YUR+3+aVY3LUIk0fRIfV2Y3nqtPcOmKeiXQH3N7AccM1Kc3me4wwvsAqiDL4vBcvKn2ViJdWkctLcwcEoa/4LHdqxZwkSsubjwEchoqptI8SEZEO3D1PxOMCLVIBoHVNCR3NDZqA2fi3YYfl+A/17SJY5CgnCBv3P9QloHOZ2B9e1Y5onqMw8LjxKkvXohNVVcw9rD2AiaogO0XuRRXifq5gs2/5zcpF/fzKAYq3Sox+lfiTWgNIfXoBtVcjVM6st3d9UjxurbSMJvUatxyMeVrRhL6DLcqlTy6AQG+MElt46kKNY11NQxVu3EginOFI6w0cBqPkBP3z8QbMsWHN6p9tdPEDPqb0L7KOo0KYisNUdpEREH/wDb5tLHWqr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003)(18002099003)(56012099003)(22082099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kVEvyEzzk/Vybl+VtqVC893j+NdsyFZkOheYTcJPeN5wB52FJ0xp1QmmeNAx?=
 =?us-ascii?Q?G9Nt1M1evI57tdVVX1GAkcgdm1woyakMvrgRVAFEhrGNPDY10uZyBXfAgDpn?=
 =?us-ascii?Q?ucbMZexNhHRmDj74Of4wweWruB0vzbL3hQqWHzwQaEB7Y5s84CSj3XS0qnmG?=
 =?us-ascii?Q?TIcZRdZAgJmcvO20wBI+gqfTnrQuCbL1+YEdQRVqUwLOG2zEW5cTYevLpOmF?=
 =?us-ascii?Q?GBUT9WXqVLwkbGzFt+b+XazAFESxCEoRV2JWN6naFaQ9HmXGcskdcwyQX/nw?=
 =?us-ascii?Q?z0Q67Fh+msRSFMoumjlZB1TV8DE/4kGE7jz7qMBfp3WOtRbAVY5TROCPJ/Bw?=
 =?us-ascii?Q?1nm1i4yYYeq4iCQN5h4ASpb9g9NK4p5lRhU4cfpQUNPZR7bV39k3tVPBJ6XJ?=
 =?us-ascii?Q?hMF+bNt43AofncKjwFOHVsgWVgkOD4XeOxrTzp41/NUV13DNS0cqbHNJ5XbU?=
 =?us-ascii?Q?Ctgij8TGrF/902xzztILZcHCu9pLEhV6ZurgzKSuT2yxICMPDU9rZ9trtAxZ?=
 =?us-ascii?Q?kJMwLGTmQx3O191XSrzM/tii3KX2nGBTksIvnA9ucgkW875UTViV3lG8HY3Z?=
 =?us-ascii?Q?rtQMduzY3+9DwsOV4fLy/izvfo9Rb7Lrofd3oNWwpHQhGCjlp3+M3SMEgVst?=
 =?us-ascii?Q?d/krSEdLiRcB36KdmGzc6Aylh/Ds5dWUU0iP8/pXmDsuRfof1wn34qgY9IYZ?=
 =?us-ascii?Q?sJUMHvrDvqxmJWC0hDONRK1rpPYDiKmrl4MxFIpHMNHsvQBQTlsIZwPnH9KL?=
 =?us-ascii?Q?e2NWp4TQ1NwNsIWtOxF8LaBed0teNGhcpBDLECUtoQv961mOltYZq6D1DDI3?=
 =?us-ascii?Q?YFtSZYBiP3GEm6UyQJi1qZmC0MWJp6UN5GJBcXI0W0tqCoEduFz+O482J/i5?=
 =?us-ascii?Q?akCVd27PG6Ptf6w8qB38A355iOfwB+SlCfE17+IAqk6yjJ0cKfz0pK8FFA4G?=
 =?us-ascii?Q?rMPedqD9vo5w+IdwvQeOXnUXvl04HdIJsGFPDsSPFe9lNLNwKoMWlLq/PLgj?=
 =?us-ascii?Q?C02HR4IfPhvFktECug/WYLwLHphv4NtHfaZkYEiKhjLQdswTzwu0QNKpuahE?=
 =?us-ascii?Q?iDflUiH8iZ/6w3qJjvzRVpYRZmbXZaY+Envf871hWf76LoM7ukzrcKlXnIvN?=
 =?us-ascii?Q?jlw9a6P1pOvrVQJB699eAB9nxxKSoTN/Jx+BPm8cmqGr31NK7KelSYpx+nKr?=
 =?us-ascii?Q?8Mpv6Sfd3eU1vM2UHqroxgwQWPZ0GmcAR/zT87/KiDDBHulc9t2Q+1ufjKIq?=
 =?us-ascii?Q?CznW7LGmY7vKzRj4zjX0CzLDACCVFzq3ndwWpOB9mAUEnJDRjwG8pzVQUIXk?=
 =?us-ascii?Q?VicdFYNOtyVjyPpc63g8J96Yvv0j+XNSGePm+QPPlRslpVi00acTLRO+nqtP?=
 =?us-ascii?Q?SgMe/geaGWDxCuQqJFpEWREjCXnQWsa/e7iEXSVzEyAFsQO+2apFFgiaD/ZY?=
 =?us-ascii?Q?nlijAgbBE7+y+Qd7vPbTHJCl82Ax2bqBj6w67gHLyk59WUVIVdPiXNsFGxco?=
 =?us-ascii?Q?Dp/je6wEZGY11oMHcr/Wd8vs/K7rYFIte7cF4vGAVyYchakx4EvDKpUVjdY2?=
 =?us-ascii?Q?foIJfAed9aAYXgld/a2ESuXvEbnGf3tCBa9ir2rLoxsg9z9FYQS5rtVnkRaY?=
 =?us-ascii?Q?5sg7lmln0UHNLusdl5fGMEYqTw1oX3VKBquUF4M2uAvwGb9zsbhuKBrVaEwK?=
 =?us-ascii?Q?hlp8jbcyYRoO8RxDzwJT6YGyh/gpA/T8sUXcvpy3jpKaZc0D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7405C10E9AA218628B238FF6DC4EADS0PR11MB7405namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	oeNlTjq36UuoKPM4Zrymt0Tdw3ePUn3JrWLFOm8mAJv5J3iRiZC9Aa9dlohQzxfJPPxIRVBS07r6QaZgzwlCISsjUFgkHNxWtm13pk3jV7fegrgVzuSFBKsF5SRNFQNAhuPQvijMQ/qLcKHwN8RpyGdQnpZq9014H5BcxjcXSU0GojgyNkKLW5pxHZWbteaC7MxST1Uf4OHmmJLMGCakeE2tikuigFZ8d3gh4CmvwL9tIbx6lAwBp7aZNsbnFqqnbMudg2X584DakKe/wh9KJbMRww77Wqf3uNUzhOT60pC4UjdJ6xx64RoJ1gTibOi8RGgo5PeGRcqtwLB6URv57A==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacb91c5-a222-4e29-5037-08de84ed7b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 12:54:24.9001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJqSQLygyiBKVB6hAbA0lZ6hhWCdo/ttnU3pP8bR7Nb6mO6G6EA+7W87hXTTT6Acxafs6eMGUptvBWnPc7keqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233383

--_000_DS0PR11MB7405C10E9AA218628B238FF6DC4EADS0PR11MB7405namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for the response. I will include these additional patches in the new=
 series as per your suggestion.

Regards,
Het
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Peter Marko via lists.openembedded.org <peter.m=
arko=3Dsiemens.com@lists.openembedded.org>
Sent: Wednesday, March 18, 2026 1:01 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral Cha=
vda (vchavda) <vchavda@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affecte=
d product/vendor in CVE_STATUS

This commit needs two additional fixes:
https://git.openembedded.org/openembedded-core/commit/?id=3D3c4d8ca41ac0b42=
9af92bf0ea84f1dfd0cda9e1f
https://git.openembedded.org/openembedded-core/commit/?id=3Dcc33dd9176726cb=
4b2d2f142ed1bc655da8e0a9f

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Wednesday, March 18, 2026 6:39
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
> product/vendor in CVE_STATUS
>
> From: Marta Rybczynska <rybczynska@gmail.com>
>
> CVE_STATUS contains assesment of a given CVE, but until now it didn't hav=
e
> include the affected vendor/product. In the case of a global system inclu=
de,
> that CVE_STATUS was visible in all recipes.
>
> This patch allows encoding of affected product/vendor to each CVE_STATUS
> assessment, also for groups. We can then filter them later and use only
> CVEs that correspond to the recipe.
>
> This is going to be used in meta/conf/distro/include/cve-extra-exclusions=
.inc
> and similar places.
>
> Backport Changes:
> - Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the
> commit history for this file diverges from the base commit
> itself (9c9b9545049a in the scarthgap branch).
> - Additionally, the changes do not introduce any major features
> and are primarily focused on code restructuring.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/classes/cve-check.bbclass | 24 ++++++++++-----------
>  meta/lib/oe/cve_check.py       | 39 ++++++++++++++++++++++++++--------
>  2 files changed, 42 insertions(+), 21 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 3f4704fb4e..de5ddf6f04 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -316,8 +316,8 @@ def check_cves(d, patched_cves):
>      # Convert CVE_STATUS into ignored CVEs and check validity
>      cve_ignore =3D []
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Ignored":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Ignored":
>              cve_ignore.append(cve)
>
>      import sqlite3
> @@ -500,11 +500,11 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDP=
E"),
> d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
>          write_string +=3D "CVE STATUS: %s\n" % status
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            write_string +=3D "CVE DETAIL: %s\n" % detail
> -        if description:
> -            write_string +=3D "CVE DESCRIPTION: %s\n" % description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            write_string +=3D "CVE DETAIL: %s\n" % status_details['detai=
l']
> +        if 'description' in status_details:
> +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> status_details['description']
>          write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>          write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev2"]
>          write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev3"]
> @@ -632,11 +632,11 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>              "status" : status,
>              "link": issue_link
>          }
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            cve_item["detail"] =3D detail
> -        if description:
> -            cve_item["description"] =3D description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            cve_item["detail"] =3D status_details['detail']
> +        if 'description' in status_details:
> +            cve_item["description"] =3D status_details['description']
>          cve_list.append(cve_item)
>
>      package_data["issue"] =3D cve_list
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 7c09b78242..767d1a6750 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -132,8 +132,8 @@ def get_patched_cves(d):
>
>      # Search for additional patched CVEs
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Patched":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Patched":
>              bb.debug(2, "CVE %s is additionally patched" % cve)
>              patched_cves.add(cve)
>
> @@ -227,22 +227,43 @@ def convert_cve_version(version):
>
>  def decode_cve_status(d, cve):
>      """
> -    Convert CVE_STATUS into status, detail and description.
> +    Convert CVE_STATUS into status, vendor, product, detail and descript=
ion.
>      """
>      status =3D d.getVarFlag("CVE_STATUS", cve)
>      if not status:
> -        return ("", "", "")
> +        return {}
> +
> +    status_split =3D status.split(':', 5)
> +    status_out =3D {}
> +    status_out["detail"] =3D status_split[0]
> +    product =3D "*"
> +    vendor =3D "*"
> +    description =3D ""
> +    if len(status_split) >=3D 4 and status_split[1].strip() =3D=3D "cpe"=
:
> +        # Both vendor and product are mandatory if cpe: present, the syn=
tax is
> then:
> +        # detail: cpe:vendor:product:description
> +        vendor =3D status_split[2].strip()
> +        product =3D status_split[3].strip()
> +        description =3D status_split[4].strip()
> +    elif len(status_split) >=3D 2 and status_split[1].strip() =3D=3D "cp=
e":
> +        # Malformed CPE
> +        bb.warn('Invalid CPE information for CVE_STATUS[%s] =3D "%s", no=
t setting
> CPE' % (detail, cve, status))
> +    else:
> +        # Other case: no CPE, the syntax is then:
> +        # detail: description
> +        description =3D status_split[len(status_split)-1].strip() if (le=
n(status_split) > 1)
> else ""
>
> -    status_split =3D status.split(':', 1)
> -    detail =3D status_split[0]
> -    description =3D status_split[1].strip() if (len(status_split) > 1) e=
lse ""
> +    status_out["vendor"] =3D vendor
> +    status_out["product"] =3D product
> +    status_out["description"] =3D description
>
> -    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
> +    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP",
> status_out['detail'])
>      if status_mapping is None:
>          bb.warn('Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallba=
ck to
> Unpatched' % (detail, cve, status))
>          status_mapping =3D "Unpatched"
> +    status_out["mapping"] =3D status_mapping
>
> -    return (status_mapping, detail, description)
> +    return status_out
>
>  def extend_cve_status(d):
>      # do this only once in case multiple classes use this

--_000_DS0PR11MB7405C10E9AA218628B238FF6DC4EADS0PR11MB7405namp_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Peter,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the response. I will include these additional patches in the new=
 series as per your suggestion.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Het&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Peter Marko via lists.openembedded.org &lt;peter.marko=3Dsiemens.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, March 18, 2026 1:01 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;; Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode =
affected product/vendor in CVE_STATUS</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This commit needs two additional fixes:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D3c4d=
8ca41ac0b429af92bf0ea84f1dfd0cda9e1f">https://git.openembedded.org/openembe=
dded-core/commit/?id=3D3c4d8ca41ac0b429af92bf0ea84f1dfd0cda9e1f</a><br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dcc33=
dd9176726cb4b2d2f142ed1bc655da8e0a9f">https://git.openembedded.org/openembe=
dded-core/commit/?id=3Dcc33dd9176726cb4b2d2f142ed1bc655da8e0a9f</a><br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<br>
&gt; core@lists.openembedded.org&gt; On Behalf Of Het Patel via<br>
&gt; lists.openembedded.org<br>
&gt; Sent: Wednesday, March 18, 2026 6:39<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Cc: xe-linux-external@cisco.com; vchavda@cisco.com<br>
&gt; Subject: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affect=
ed<br>
&gt; product/vendor in CVE_STATUS<br>
&gt; <br>
&gt; From: Marta Rybczynska &lt;rybczynska@gmail.com&gt;<br>
&gt; <br>
&gt; CVE_STATUS contains assesment of a given CVE, but until now it didn't =
have<br>
&gt; include the affected vendor/product. In the case of a global system in=
clude,<br>
&gt; that CVE_STATUS was visible in all recipes.<br>
&gt; <br>
&gt; This patch allows encoding of affected product/vendor to each CVE_STAT=
US<br>
&gt; assessment, also for groups. We can then filter them later and use onl=
y<br>
&gt; CVEs that correspond to the recipe.<br>
&gt; <br>
&gt; This is going to be used in meta/conf/distro/include/cve-extra-exclusi=
ons.inc<br>
&gt; and similar places.<br>
&gt; <br>
&gt; Backport Changes:<br>
&gt; - Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the<br>
&gt; commit history for this file diverges from the base commit<br>
&gt; itself (9c9b9545049a in the scarthgap branch).<br>
&gt; - Additionally, the changes do not introduce any major features<br>
&gt; and are primarily focused on code restructuring.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;marta.rybczynska@syslinbit.com&gt;=
<br>
&gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&g=
t;<br>
&gt; (cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)<b=
r>
&gt; Signed-off-by: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/cve-check.bbclass | 24 ++++++++++-----------<br>
&gt;&nbsp; meta/lib/oe/cve_check.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3=
9 ++++++++++++++++++++++++++--------<br>
&gt;&nbsp; 2 files changed, 42 insertions(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index 3f4704fb4e..de5ddf6f04 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -316,8 +316,8 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Convert CVE_STATUS into ignored CVEs a=
nd check validity<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_ignore =3D []<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in (d.getVarFlags(&quot;CVE_STAT=
US&quot;) or {}):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status, _, _ =3D d=
ecode_cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if decoded_status =3D=3D &=
quot;Ignored&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status =3D decode_=
cve_status(d, cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'mapping' in decoded_st=
atus and decoded_status['mapping'] =3D=3D<br>
&gt; &quot;Ignored&quot;:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cve_ignore.append(cve)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import sqlite3<br>
&gt; @@ -500,11 +500,11 @@ def cve_write_data_text(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;PACKAGE VERSION: %s%s\n&quot; % (d.getVar(&quot;EXTENDPE&quot;),<=
br>
&gt; d.getVar(&quot;PV&quot;))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVE: %s\n&quot; % cve<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVE STATUS: %s\n&quot; % status<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _, detail, description =3D=
 decode_cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if detail:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DETAIL: %s\n&quot; % detail<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if description:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DESCRIPTION: %s\n&quot; % description<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status_details =3D decode_=
cve_status(d, cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'detail' in status_deta=
ils:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DETAIL: %s\n&quot; % status_details['detail']<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'description' in status=
_details:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DESCRIPTION: %s\n&quot; %<br>
&gt; status_details['description']<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVE SUMMARY: %s\n&quot; % cve_data[cve][&quot;summary&quot;]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVSS v2 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;scorev2&quot=
;]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVSS v3 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;scorev3&quot=
;]<br>
&gt; @@ -632,11 +632,11 @@ def cve_write_data_json(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data, cve_status):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;status&quot; : status,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;link&quot;: issue_link<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _, detail, description =3D=
 decode_cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if detail:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;detail&quot;] =3D detail<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if description:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;description&quot;] =3D description<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status_details =3D decode_=
cve_status(d, cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'detail' in status_deta=
ils:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;detail&quot;] =3D status_details['detail']<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'description' in status=
_details:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;description&quot;] =3D status_details['description']<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_list.append(=
cve_item)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package_data[&quot;issue&quot;] =3D cve_=
list<br>
&gt; diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py<br>
&gt; index 7c09b78242..767d1a6750 100644<br>
&gt; --- a/meta/lib/oe/cve_check.py<br>
&gt; +++ b/meta/lib/oe/cve_check.py<br>
&gt; @@ -132,8 +132,8 @@ def get_patched_cves(d):<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Search for additional patched CVEs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in (d.getVarFlags(&quot;CVE_STAT=
US&quot;) or {}):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status, _, _ =3D d=
ecode_cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if decoded_status =3D=3D &=
quot;Patched&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status =3D decode_=
cve_status(d, cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'mapping' in decoded_st=
atus and decoded_status['mapping'] =3D=3D<br>
&gt; &quot;Patched&quot;:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bb.debug(2, &quot;CVE %s is additionally patched&quot; % cve)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; patched_cves.add(cve)<br>
&gt; <br>
&gt; @@ -227,22 +227,43 @@ def convert_cve_version(version):<br>
&gt; <br>
&gt;&nbsp; def decode_cve_status(d, cve):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp; Convert CVE_STATUS into status, detail and descrip=
tion.<br>
&gt; +&nbsp;&nbsp;&nbsp; Convert CVE_STATUS into status, vendor, product, d=
etail and description.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D d.getVarFlag(&quot;CVE_STATUS=
&quot;, cve)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not status:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (&quot;&quot;, &quo=
t;&quot;, &quot;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return {}<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; status_split =3D status.split(':', 5)<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out =3D {}<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out[&quot;detail&quot;] =3D status_split[0]=
<br>
&gt; +&nbsp;&nbsp;&nbsp; product =3D &quot;*&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; vendor =3D &quot;*&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; description =3D &quot;&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; if len(status_split) &gt;=3D 4 and status_split[1]=
.strip() =3D=3D &quot;cpe&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Both vendor and product =
are mandatory if cpe: present, the syntax is<br>
&gt; then:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # detail: cpe:vendor:produ=
ct:description<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vendor =3D status_split[2]=
.strip()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product =3D status_split[3=
].strip()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description =3D status_spl=
it[4].strip()<br>
&gt; +&nbsp;&nbsp;&nbsp; elif len(status_split) &gt;=3D 2 and status_split[=
1].strip() =3D=3D &quot;cpe&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Malformed CPE<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('Invalid CPE infor=
mation for CVE_STATUS[%s] =3D &quot;%s&quot;, not setting<br>
&gt; CPE' % (detail, cve, status))<br>
&gt; +&nbsp;&nbsp;&nbsp; else:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Other case: no CPE, the =
syntax is then:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # detail: description<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description =3D status_spl=
it[len(status_split)-1].strip() if (len(status_split) &gt; 1)<br>
&gt; else &quot;&quot;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; status_split =3D status.split(':', 1)<br>
&gt; -&nbsp;&nbsp;&nbsp; detail =3D status_split[0]<br>
&gt; -&nbsp;&nbsp;&nbsp; description =3D status_split[1].strip() if (len(st=
atus_split) &gt; 1) else &quot;&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out[&quot;vendor&quot;] =3D vendor<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out[&quot;product&quot;] =3D product<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out[&quot;description&quot;] =3D descriptio=
n<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; status_mapping =3D d.getVarFlag(&quot;CVE_CHECK_ST=
ATUSMAP&quot;, detail)<br>
&gt; +&nbsp;&nbsp;&nbsp; status_mapping =3D d.getVarFlag(&quot;CVE_CHECK_ST=
ATUSMAP&quot;,<br>
&gt; status_out['detail'])<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if status_mapping is None:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('Invalid=
 detail &quot;%s&quot; for CVE_STATUS[%s] =3D &quot;%s&quot;, fallback to<b=
r>
&gt; Unpatched' % (detail, cve, status))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status_mapping =
=3D &quot;Unpatched&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; status_out[&quot;mapping&quot;] =3D status_mapping=
<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; return (status_mapping, detail, description)<br>
&gt; +&nbsp;&nbsp;&nbsp; return status_out<br>
&gt; <br>
&gt;&nbsp; def extend_cve_status(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # do this only once in case multiple cla=
sses use this<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB7405C10E9AA218628B238FF6DC4EADS0PR11MB7405namp_--

