Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15F3C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:57:23 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.43595.1723460237570487998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=MB/YjzIu;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10646; q=dns/txt;
  s=iport; t=1723460237; x=1724669837;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VDVRBn1W3rkq1rhU/MCu4TMv0KKs/L9Eb9gRUT3xjEc=;
  b=MB/YjzIufgoraXmFQIBYqBzF8QXcXAfM2VQEAgPV1nE3YwUzSkTePkvN
   nf4W/37RhuP5uuJ7QBvfxW5wdNObSaDCymZHRehC8frfnU49h52nk+m97
   6mx5E7L6AAm+CFDEVal+tWjrhRuj8K6kXnxstItnXjaA6Lyki/0uc1gMO
   g=;
X-CSE-ConnectionGUID: 1wLzOm2HRYKrzj5w+Q5Lxw==
X-CSE-MsgGUID: XmUSDvkcSXCN/jWs4PTAaQ==
X-IPAS-Result: =?us-ascii?q?A0AAAACt6blmmJBdJa1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEWBAEBAQEBCwGBcVJ7AoEcSIRVg0wDhE5fiHMDi?=
 =?us-ascii?q?2KSMIElA1YPAQEBDQEBLgcPBAEBhQYCFolMAiY0CQ4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBBQEBBQEBAQIBBwUUAQEBAQEBAQE3BQ47hXUNhlkBAQEBAwERERFFD?=
 =?us-ascii?q?AQCAQgRBAEBAQICJgICAh4HChUICAIEAQ0FCBqCXgGCMAMxAwGhbgGBQAKKK?=
 =?us-ascii?q?HqBMoEB3TgNglgYgQIuAYgsHgGBbINgVIQ7JxuCDYEVQoJoPoIfQgWBNCsFE?=
 =?us-ascii?q?CODITqCLwSDM4Ikhk6CJIJOJkMEBQcOhCdXD1dygRMCDIFGgT18JohMLHeIT?=
 =?us-ascii?q?wlJexwDWSECEQFVExcLCQVoiGEKgXmBKimBSyaBCxaCd4E1gR0CglqBZwxhh?=
 =?us-ascii?q?ECDMmKBDYE+gV4BSYJ4MBskC16BTIEFOhWBMAV+gll0VUQCDQI3gRIdQAMLb?=
 =?us-ascii?q?T01Bg4bBQQ6ewWlAYFcAYF2Rg2BAAEnJC8LNwcDMjBNHg+WS4t/oiZxCiiDb?=
 =?us-ascii?q?IwUjTKBfoYrF4QFgVakZphvIpFckU2BG3GDFwIEAgQFAg8BAQaBZzqBW3AVO?=
 =?us-ascii?q?4JnCUkZD1iNYh+IVsgIeDsCBwEKAQEDCYsCgX0BAQ?=
IronPort-PHdr: A9a23:oOUHGxQnctpaSK2NTir2p8t4QNpso47LVj580XJvo6hFfqLm+IztI
 wmFo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:6TYvjK/Kt4y5UOIhtVGBDrUDrH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2tNUW6FPvnbazf1LtgnPYi3pBsDvJCGnYNlHgBs/i9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEzmB4E7rauW8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4ujyyHjEAX9gWIsYjtNs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lvIqkK3eMtIVt/1
 uYKKm0SLSneo/KplefTpulE3qzPLeHxN48Z/3pn1zycXbAtQIvIROPB4towMDUY358VW62BI
 ZtCL2MzMHwsYDUXUrsTIJ44leivimP2WzZZs1mS46Ew5gA/ySQqi+OxYYeOIIDiqcN9rkOln
 U7Y/G/CMjo8c96g0ma9zlulv7qa9c/8cNlPTOLjrKECbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIwa3O7kPJQGMFVTVGLtchsafaWADGy
 HfQgPf7Ijk1kIekamiP9OqL7grvHTgKeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+sq
 9xthHZi74j/nfI2O7OHEUcrag9AS7DTRQIzow7QRG/gvkVyZZWuYMqj7l2zARd8wGSxEAbpU
 JsswpT2AAUy4Xelz3flrAIlR+rB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RCJ4lgLucUKYCH1Pcebhr5d7ex3lsAM8vy4CZjpgiZmOMEZmPKvpXs3PBXBhQgBbmB3zv1ha
 P93jvpA/V5BVPw4l2DpLwvs+bQq3Ss5jXjCXoz2yg/v0LyVIhaopUQtbjOzghQCxPrc+m39q
 o8HX+PTkkk3eLOlOEH/r9VMRW3m2FBmX/gaXeQNKL7aSuencUl8Y8LsLUQJINY/zvkKzraZp
 RlQmCZwkTLCuJEOEi3TAlhLY7L0VpE5pnU+VRHA9370s5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:e8dB4qtDDybD7sf4g3hNZoKN7skCM4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tKLzOWyVdAS7sSo7cKogeQVBEWmdQtr5
 uIH5IObOEYSGIK8voSgzPIUurIouP3jZxA7N22pxwCPGMaDp2IrT0JdjpzeXcGPTWucKBJb6
 Z0kfA33wZIF05nCfhTL0N1LNTrlpngrr6jSxgAABIs9QmJih2VyJOSKXKl9yZbeQlihZM5/0
 b4syGR3MieWveApSP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CClCpdmpDt1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6jh2f5q8CRfkN5NyMBv/MdTvLq0TtmgDhO6t
 MM44tfjesPMfr0plW42zEPbWAzqqP7mwt4rQdZtQ0ubWJXUs4ikWVYxjIULH/FdxiKtbzO14
 JVfZvhzecTflWAY3/DuG5zhNSqQ3QoBx+DBlMPo8qPzlFt7TpEJmYjtYQid007hdkAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiTcg8Sj7wgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3f071E8WB0JBC7xiISmSgWjbmzN1Y+vFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTGPPnJXuGI/cB4+Q/YeglFZAzarxjhj9gYSP6niviEPyfitDm
X-Talos-CUID: =?us-ascii?q?9a23=3AUKcMKGjWPq/b2YdLmVh0UyGVtTJuK2L53lDVeW+?=
 =?us-ascii?q?COEVzWr/IVhyppYd0jJ87?=
X-Talos-MUID: 9a23:jC//ygj7cqavyI6b/v4FBMMpBMJV2IiwC0s2ob4g/Mu7LnBIBx6UtWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:57:16 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 47CAvGT1002100
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:57:16 GMT
X-CSE-ConnectionGUID: 86WMhSftQBaR6WQGg46OKw==
X-CSE-MsgGUID: Fi4wX56uQoS+oXaI2b9ckQ==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,282,1716249600"; 
   d="scan'208";a="19947920"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr79/WwA3BL7wfeuJMcIlEq8y2+pW/9f7eM4nDFE3gQdtc73FKIYSkeWMtEQGF6k85E5YISm6P/nbUDJVvNfn1x4uhBcEZIQprpo+FSmYRWS+LaEYWTbrDEDaKQVqtWjF6Ctmg96lKN1kIjJNMJUkSM+HE9OdMqBMCYIaDDpdGRmryY2XLKmBHB/N2Feq98JDpzUkE5ybIEflgUNO4zprffOV3z11nnrUBuEWEYfBvmT6ift+Op8MSbAgv02skFdAAKkO/NuxEh2GFnbG/6xmE+44yMzGbBIQZogjK+D0U+MP41CvZ9ciSbVazwT6Jrsm402R9qb0e835loM7icAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDVRBn1W3rkq1rhU/MCu4TMv0KKs/L9Eb9gRUT3xjEc=;
 b=IK9ppgj/3OSbxuRDXafgggrFp4WBqUptehenXefQ1++tkCrpeurNc09j8ejTxtgJSeNMT8QDhN6mOuOVpmDzYMEsYvBTTcD5ohFy3ea5/3kO0CZH8UswijMLQqTU5+nZI4unwSrs8eJ/oCTEC8qe/SeVGd+MhCWVMw87S5GxoLrjMC8rhaI7pkDAlVO3GlqHznpudqKmDlYNAstfah8cC/sheagmgHKzya+f+yG9t5p1zNmlyLXb5Xne7Dc3yuGp/4hxroFbRYMhovdzNWiBL0rych1p9b6z5tbfRE4AR+EnOSKyIHBBH/swbrhHVI/ovCkBRyR/VRI9D7Crg4zGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 10:57:13 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%4]) with mapi id 15.20.7828.030; Mon, 12 Aug 2024
 10:57:13 +0000
From: "Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)"
	<dnagodra@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Marko, Peter"
	<Peter.Marko@siemens.com>,
        Marta Rybczynska <rybczynska@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: 
 AQHa3YRHiRZeDkJzN0OXxSVyh6EHW7IFa/cAgBYzP8CAABBAgIAH0/owgAACrYCAAAc84A==
Date: Mon, 12 Aug 2024 10:57:13 +0000
Message-ID: 
 <SN7PR11MB6971938B0B4D66FACEDEA77BD4852@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
	 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
	 <AS1PR10MB5697AE3874C9EECA6BF35D8BFDB82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB69712420AA4D5D916BB5AB3DD4852@SN7PR11MB6971.namprd11.prod.outlook.com>
 <473ab1e470cecab864a742af39a0c7c7fea70ae8.camel@linuxfoundation.org>
In-Reply-To: 
 <473ab1e470cecab864a742af39a0c7c7fea70ae8.camel@linuxfoundation.org>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|CH3PR11MB7940:EE_
x-ms-office365-filtering-correlation-id: 2e8c0624-5f22-435c-21ec-08dcbabd85b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NGpZR2dJWHRzUlVLaml3YUJaVTVmdjR5VXlvaEhSKzFXRWhCeUpldWRRTHZV?=
 =?utf-8?B?WDd5eTVFZ245MkZ1ZjlQYkFhWmFONEovSzFmTHkyMnpFaHBwUlN6bjhqOHNi?=
 =?utf-8?B?K1l0N0N2eVFkSDdzRVVudE96aXRscGFwMVdaOUlnSDh4eWNDUXFOK0tQcDZp?=
 =?utf-8?B?TjdGOFZ3OHQyVG96eEE1bGVUSG1qemlHSFArcndmOGFRUEh0UDZwNVBDVXo2?=
 =?utf-8?B?cHgzVGpDWDZNbmdobGtoZzZ4Ty9iVXRpN2daWlJ0a0VkcWgrZ0FOcm9LUFdl?=
 =?utf-8?B?cmJ0eCt4NjhwM3NTSHlnaDFmcmhna25tYWVKWHhzMFF2V3lHZlQ0WmZVOWo0?=
 =?utf-8?B?SDBIV01VYnF3dGFrd29ZUGdXcXFOVEJhWU9VTjJjd2lQeHZvVU1BKy9rNkxk?=
 =?utf-8?B?cGZBUDBRcTVyYXRNdWtheXhmT0tIM2JYcDZTK0dhMTBXV2loTWJaaEhmaXFL?=
 =?utf-8?B?N2RsdkQ2RzF6RnIyUVJOYVB2WHpYakJCRzduK2pPUkZXSXNYK1JKZDB5TU5L?=
 =?utf-8?B?ajQwK0pndEVCY1ZJME5BOVpPcFdpWXFTSGc4eEl6b0VoUWI3L3V1bDByaTRB?=
 =?utf-8?B?Q2hyOHJ0ejlNN1QwYlRrRUp5K2pxM3dUclZZaWNHakc1TUlYRHh1QjN6TERU?=
 =?utf-8?B?WE5tdFZtajFDY3RnNlR0bmNpbHU0NWQzR0pHUmhkS3kxM1l5T1BudUZQU3Bt?=
 =?utf-8?B?Wi9hL2dlOWhJcHFMTEwyelhCSk01RHNnVVVURDkwUnkwNmU0d3Q5SE5JYVpM?=
 =?utf-8?B?L0ZsV0plemRtWVUvZTZkVWFyRTRzc2toNHB5eGx5V0VwL3pOVG1zbm5udEM0?=
 =?utf-8?B?c21xYlZjVEpPL2Nsd2ZvdFZHMzBPcVB2VWxQbXBYN3B4U2IrVTRvT25HZWNp?=
 =?utf-8?B?NnRGMkptVDRCWmVKQk1tYlMvdDBzZ0J3MFNoQy80eUJKZUFoZnFhWk9vanMz?=
 =?utf-8?B?Z2xyOEpCT0M3ZXNtNTFKODBKdldjT3BRZFVMRWhIN3FIZTRYRHVXdU55ZW5x?=
 =?utf-8?B?dzFobENSY0J4T3ZTQzhZMHB0WnJFMzgvczJ0NHlrdmpMUE5xVEF1aVU5cjBw?=
 =?utf-8?B?VmtaV3NJWGJWY1c3amRhZWF4dlp1Z1VQUkF6NUo2RVV5RFRLYTRFWW1rSm5W?=
 =?utf-8?B?WmpCZkpSblcyWmxHSXVieHpLeDNsSXA1Q1JkRzN0OHJydVlRaHMxN2RoMVBE?=
 =?utf-8?B?NXVacFY0TGFycmhGV21zOEVrb3J0enNmR21TckdnaWt5VHVpV1grN1RsV2lB?=
 =?utf-8?B?bFhnaGZQeVhqdVNRSTRWa1RyeGVvdlhmZDArNzhzZFVOOTErZ2lvdXRkbUoz?=
 =?utf-8?B?NXl6bUNmTWZ2NXM0OHdTR2IwWlNnRmdReTJoWTh0KzZuOWJ5SUhTNGhQa2Fl?=
 =?utf-8?B?U21yN1ZYM01MR0pmL0lKQkNzT0VrMm0zU2xuc0FRM3F1dkdIVzFIYzlPb2RX?=
 =?utf-8?B?L0doWS9sUjBYS1Yxb1JSZlNETzY1VTNiN0hhU3hxMXYyZXhzZnZNOUxySE0r?=
 =?utf-8?B?dXBTVEI0SXNwempacmNsT1VjbGpSUEtBRGN2SzRPN0doVTBxUEJCTXB1dXdR?=
 =?utf-8?B?SDFYZGxlWTBIWkhOcThPYjBScHF5ZUdjUlJ4MEd2MGJyWVRLbWdnOEU2eGp1?=
 =?utf-8?B?dXFHWXIwa3VvZkwzN1R6UzJvN2hxWVFBZ1V6dGQ3dlpxbmFXL1c4cmVxSVZE?=
 =?utf-8?B?RG52eGhBbmZQaXA1WWFPcmVrY1ZYNVNUQit2QWt3VTN1Rjd0Z2d2YnNRNnlI?=
 =?utf-8?B?K1oxa0VwVGhrV3lmSmpjQTZ6VjlwSTdWODIyZkUzek93Z0FFQVJNd2QyU0Ux?=
 =?utf-8?B?cmdqUU04OXgyWU1VMFdoWENVdWxWL0c1eGF2OHpEU2JZRG9UVlIrdWVNTksy?=
 =?utf-8?B?bFJYd3o4TTVxWDExOEpjeS9PR2Q3TmVPVmpnMmRBQXFuZVE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlMyd3BBUmRTUE5zR2RGNGI2dnFjdndkZjkwYm9Uckp5Mk14TWdaUHBXWGhX?=
 =?utf-8?B?cHd1Q2JrNi83MGozbFRCMGRDNS83OTFzbDVJTFFPaE5rRFZ4K0o1ajFBNElt?=
 =?utf-8?B?SkVFWklWUnFZbmRDaFIyMDM2emdxYkhKR2lZL1ZUZWFCamEzMlVmWVByVUsr?=
 =?utf-8?B?b0VCeHdkbEN3VnlpUWoxU2FKN2lRTzFVaWNTUzlML21yWU5EMWUwT0ovSGk1?=
 =?utf-8?B?UC90bVEwb1F0SUhpNWwwUE1BeWJobnpFWHc1NWRqN2UwTllIMWxGdHgzRDBQ?=
 =?utf-8?B?WU03S0FXSTBMOGN1emF6ZndTL040bjNHS1NNYysybnF5RmR0V1RDWGtGSXh5?=
 =?utf-8?B?ckhuN0hDY1hPTTVYRHR5K3Q4S05wMGt5dmhaOUdpM3dUemNuU3RHTUVPdlV4?=
 =?utf-8?B?OHMvbC94cTVyRDF2T0V2ZHJLc1czTkVrUlMyU0t5dDF1K3dmWU92Wm00YjMw?=
 =?utf-8?B?SjZqbWNRb3hueHd4UkRUUmdvbE1JMHBWRW9qWkYrWTFXSXF1RTYyN0FGWjRu?=
 =?utf-8?B?MkdiY1diajhDSWVlTXR3SElhQUhsQlhWMCtTV0ZWZVIyNlJ5MUdsRGZzYkha?=
 =?utf-8?B?QTM1U2hsY3FwOEJ1V3pTSUswZnZWdllMVUxtQWhpL09SRmhhVjJFaDMwc1l6?=
 =?utf-8?B?K21mYm1UMk1BaVlhd3dyTVBiY2RqZGV1bHVFUVZIVU40Vk80dG9udFdFcDZV?=
 =?utf-8?B?V0czUWVaV1BOTlc3RFJUK01RUXpWd1NoaEpxOWR1eVZic0hUVFQvU0RqSlhh?=
 =?utf-8?B?VTVpa1hITFdrZTFQdTJDalh3a1hMd0JYR2laQ2d3dkxKS21RS1VpWXNKcGZw?=
 =?utf-8?B?R09ZQ2lhK3R4OUpXczVEWWF3dDB0S0VveDJWc0JTbDVncVRteDN6N3AzbWZ3?=
 =?utf-8?B?VlpMRmtoM1AyOFJsYkdLS2F0NXJvWHQ2VWdFcHJkVlRkNDhmZEZFOEcrSXpB?=
 =?utf-8?B?dXA2eklSbzVROHNpRXBXdEEvWStzVVdXZlZSK3J1MXdIZDVFWXh1NVpUcGxC?=
 =?utf-8?B?Q2RKa3o4RE4wL2llSVdxOVRXTFhTZnFiQUFDaC92UldBNmV0V1g1bDhSZUNQ?=
 =?utf-8?B?N25yZHBJUkkyYUFvUHhnVnNhNHAraTVmcnZuSDhIcm1jRVRoQXNFcFI0SXBK?=
 =?utf-8?B?S3c2R2Z2QzFiU29nUlM4MjArancydEdmSHlORzlaaDAzTmN3RGVxUU1YWDk1?=
 =?utf-8?B?VzBBK2xKS3ZtSmh6c2lGMnhTOEttc01rUkNzNlhzaCtKNURDdmRJemNEaDky?=
 =?utf-8?B?RnFad2RvY2s4THE1dWZjT2NyM0lhOUgvY0JJRlVBUVEycE9TTHM2S0VEWGxs?=
 =?utf-8?B?NnVUaTBMc3MzY0RuSldnUTJZa3VaTFFIdlkrbmVoc0I1cVZ4WlV3ZExnKzZ2?=
 =?utf-8?B?aElIdkhqTGNXaHk4N3I2WUx0K2VWeFdVT3BGQnprWDNqck9qQ0lNN3Z1dW9t?=
 =?utf-8?B?WEwzV3RhVk40TThWSEFCTjQ1LzZvdUJmZ2dERW41RVhZYUxRcGdCNk8yOGs0?=
 =?utf-8?B?WXByaDZRRTdyVUtQSGt6SWovUHovandzL0VHdmN4bks0NnV6TUNWb0hFOEY2?=
 =?utf-8?B?YVloajlIc1k5RUVPTDk3VHR3elJxOWtZdnZYSUhtNW4xL2gxbTRsTVBrbVNs?=
 =?utf-8?B?Ry9XYVRZMnR0R2cwWU5tYktaVkFuOXVDdU9GWEZiMFhPMHZHQVlaSXNLNjV2?=
 =?utf-8?B?SzBBZEk3R3hrL0NrVlJuZUlHck1RSFFicDlZT3lWRklIQ1lCTlN3U1k5TjNB?=
 =?utf-8?B?akdTa1MwV25SV0lrRDVqZHhiMFZJY1ZXZUNrNmNWalhMbVBicGRYRUF4MTls?=
 =?utf-8?B?NjBNZjVLR1ZHc2xMcnhwaC9MM3g5Zld4djlnZXpTZFlSbE5tOVljYWVWS1hY?=
 =?utf-8?B?a3BkbTFzZFNscHM5SXZtWmkyd0JaZGllUGdZRTdRZXcyYVdSMGRlMnFzc0l2?=
 =?utf-8?B?SzRwZWJtRnV0VkE2OWgxNEEvMDBONE1sbG1iaEZsclZSamFEWklVZ3pQdjIv?=
 =?utf-8?B?emg2Zkgyajc2ZzJuY3lZTHJjRnFPenNVekRnUWZmamdHb1dQWW53NjZnWWlG?=
 =?utf-8?B?UGx2N0hFc2xia0I1NWM2WnF3d29YaHFIcGJDVnRlYXhvRWo4eVRCcUdRelBt?=
 =?utf-8?Q?hcmU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8c0624-5f22-435c-21ec-08dcbabd85b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 10:57:13.3968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMlM27W3OZ1bEahKYgDMEvJ2JXjeegHFamJQ5Gh+Se4lV9Equ1rohHKcpeb5DCDdo0BeZsLPBZzD9MS71D0Ouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203220

SGkgUmljaGFyZCwNCg0KSkZZSSwgaXQgc2VlbXMgdGhhdCBrZWVwaW5nIHRoZSBuYW1lIHNhbWUg
Y29uZi9jdmUtY2hlY2stbWFwLmNvbmYgYWxzbyBkb2Vzbid0IHdvcmsuIEF0dGFjaGVkIGFyZSBs
b2dzIGF0IHRoZSBib3R0b20uDQpNYXliZSBkdWUgdG8gdGhlICdtZXRhJyBkaXI/DQoNCkJUVywg
eW91ciBuZXcgcGF0Y2ggKGJpdGJha2UuY29uZjogSW5jbHVkZSBjdmUtY2hlY2stbWFwIGVhcmxp
ZXIsIGJlZm9yZSBkaXN0cm8pIHNob3VsZCBhbGxvdyBpdCB0byB3b3JrLg0KDQoNCj4tLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPlNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDI0IDM6
NDYgUE0NCj5UbzogRGhhaXJ5YSBOYWdvZHJhIC1YIChkbmFnb2RyYSAtIEUgSU5GT0NISVBTIExJ
TUlURUQgYXQgQ2lzY28pDQo+PGRuYWdvZHJhQGNpc2NvLmNvbT47IE1hcmtvLCBQZXRlciA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+OyBNYXJ0YQ0KPlJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21h
aWwuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPkNj
OiB4ZS1saW51eC1leHRlcm5hbChtYWlsZXIgbGlzdCkgPHhlLWxpbnV4LWV4dGVybmFsQGNpc2Nv
LmNvbT4NCj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNrLW1hcDogTW92
ZSAndXBzdHJlYW0td29udGZpeCcgdG8NCj4iVW5wYXRjaGVkIiBzdGF0dXMNCj4NCj5PbiBNb24s
IDIwMjQtMDgtMTIgYXQgMTA6MDggKzAwMDAsIERoYWlyeWEgTmFnb2RyYSAtWCAoZG5hZ29kcmEg
LSBFDQo+SU5GT0NISVBTIExJTUlURUQgYXQgQ2lzY28pIHdyb3RlOg0KPj4NCj4+DQo+PiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+IEZyb206IE1hcmtvLCBQZXRlciA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+DQo+PiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDcsIDIwMjQg
NDowNCBQTQ0KPj4gPiBUbzogRGhhaXJ5YSBOYWdvZHJhIC1YIChkbmFnb2RyYSAtIEUgSU5GT0NI
SVBTIExJTUlURUQgYXQgQ2lzY28pDQo+PiA+IDxkbmFnb2RyYUBjaXNjby5jb20+OyBSaWNoYXJk
IFB1cmRpZQ0KPj4gPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47DQo+PiA+
IE1hcnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21haWwuY29tPjsgb3BlbmVtYmVkZGVkLQ0K
Pj4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+ID4gQ2M6IHhlLWxpbnV4LWV4dGVy
bmFsKG1haWxlciBsaXN0KSA8eGUtbGludXgtZXh0ZXJuYWxAY2lzY28uY29tPg0KPj4gPiBTdWJq
ZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNrLW1hcDogTW92ZQ0KPj4gPiAndXBz
dHJlYW0td29udGZpeCcgdG8gIlVucGF0Y2hlZCIgc3RhdHVzDQo+PiA+DQo+PiA+DQo+PiA+DQo+
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+ID4gPiBGcm9tOiBEaGFpcnlhIE5h
Z29kcmEgLVggKGRuYWdvZHJhIC0gRSBJTkZPQ0hJUFMgTElNSVRFRCBhdCBDaXNjbykNCj4+ID4g
PiA8ZG5hZ29kcmFAY2lzY28uY29tPg0KPj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDcs
IDIwMjQgMTI6MTcNCj4+ID4gPiBUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8
UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPj4gPiA+IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgTWFydGENCj4+ID4gPiBSeWJjenluc2thIDxy
eWJjenluc2thQGdtYWlsLmNvbT47DQo+PiA+ID4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPj4gPiA+IENjOiB4ZS1saW51eC1leHRlcm5hbChtYWlsZXIgbGlzdCkg
PHhlLWxpbnV4LWV4dGVybmFsQGNpc2NvLmNvbT4NCj4+ID4gPiBTdWJqZWN0OiBSRTogW09FLWNv
cmVdIFtQQVRDSF0gY3ZlLWNoZWNrLW1hcDogTW92ZSAndXBzdHJlYW0td29udGZpeCcNCj4+ID4g
PiB0byAiVW5wYXRjaGVkIiBzdGF0dXMNCj4+ID4gPg0KPj4gPiA+DQo+PiA+ID4NCj4+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+ID4gPiBGcm9tOiBNYXJrbywgUGV0ZXIg
PFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPj4gPiA+ID4gU2VudDogV2VkbmVzZGF5LCBKdWx5
IDI0LCAyMDI0IDEyOjA0IFBNDQo+PiA+ID4gPiBUbzogRGhhaXJ5YSBOYWdvZHJhIC1YIChkbmFn
b2RyYSAtIEUtSU5GTyBDSElQUyBJTkMgYXQgQ2lzY28pDQo+PiA+ID4gPiA8ZG5hZ29kcmFAY2lz
Y28uY29tPjsgb3BlbmVtYmVkZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4g
PiA+ID4gQ2M6IHhlLWxpbnV4LWV4dGVybmFsKG1haWxlciBsaXN0KSA8eGUtbGludXgtZXh0ZXJu
YWxAY2lzY28uY29tPg0KPj4gPiA+ID4gU3ViamVjdDogUkU6IFtPRS1jb3JlXSBbUEFUQ0hdIGN2
ZS1jaGVjay1tYXA6IE1vdmUgJ3Vwc3RyZWFtLQ0KPndvbnRmaXgnDQo+PiA+ID4gPiB0byAiVW5w
YXRjaGVkIiBzdGF0dXMNCj4+ID4gPiA+DQo+PiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4gPiA+ID4gRnJvbTogb3BlbmVtYmVkZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZ8KgPG9wZW5lbWJlZGRlZC0NCj4+ID4gPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIERoYWlyeWEgTmFnb2RyYSB2aWENCj4+ID4gPiA+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyNCwgMjAyNCA2
OjQ1DQo+PiA+ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPj4gPiA+ID4gQ2M6IHhlLWxpbnV4LWV4dGVybmFsQGNpc2NvLmNvbTsgRGhhaXJ5YSBOYWdv
ZHJhDQo+PiA+ID4gPiA8ZG5hZ29kcmFAY2lzY28uY29tPg0KPj4gPiA+ID4gU3ViamVjdDogW09F
LWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNrLW1hcDogTW92ZQ0KPj4gPiA+ID4gJ3Vwc3RyZWFtLXdv
bnRmaXgnIHRvICJVbnBhdGNoZWQiIHN0YXR1cw0KPj4gPiA+ID4NCj4+ID4gPiA+ID4gLSBUaGUg
J3Vwc3RyZWFtLXdvbnRmaXgnIGlzIHRvIGJlIHVzZWQgd2hlbiB0aGUgQ1ZFIGlzDQo+PiA+ID4g
PiA+IGFjY2VwdGVkIGJ5IHRoZQ0KPj4gPiA+ID4gPiDCoCB1cHN0cmVhbSwgYnV0IHRoZXkgYXJl
IG5vdCBwbGFubmluZyB0byBmaXggaXQuDQo+PiA+ID4gPiA+IC0gSWYgdGhlIHZlcnNpb24gdXNl
ZCBpbiBZb2N0byBpcyB2dWxuZXJhYmxlLCBpdCBzaG91bGQgbm90DQo+PiA+ID4gPiA+IGhhdmUN
Cj4+ID4gPiA+ID4gwqAgIklnbm9yZWQiIHN0YXR1cy4gVGhlIHBhY2thZ2UgaXMgc3RpbGwgZXhw
bG9pdGFibGUgYnkgdGhlIENWRS4NCj4+ID4gPiA+ID4gLSBBbHNvLCB3aGVuIHRoZSBzdGF0dXMg
aXMgZXhwb3J0ZWQgb3V0IG9mIHRoZSBTREssIGl0IHdvdWxkDQo+PiA+ID4gPiA+IGJlDQo+PiA+
ID4gPiA+IMKgIGluY29ycmVjdCB0byBwdXQgaXQgdW5kZXIgSWdub3JlZCBjYXRnb3J5Lg0KPj4g
PiA+ID4NCj4+ID4gPiA+IFRoZSBwdXJwb3NlIG9mIHRoaXMgZW50cnkgaXMgdG8gcmVtb3ZlIG1l
YW5pbmdsZXNzIENWRXMgZnJvbQ0KPj4gPiA+ID4gcmVwb3J0cyBzbyB0aGF0IHVzZXJzIGRvbid0
IHNwZW5kIGNvdW50bGVzcyBob3VycyBvdmVyIGFuZCBvdmVyDQo+PiA+ID4gPiBhZ2FpbiBvbiBh
bmFseXppbmcNCj4+ID4gIm9wZW4iDQo+PiA+ID4gPiBDVkVzIGlmIHRoZXkgd2VyZSBhbHJlYWR5
IGNsb3NlZCB1cHN0cmVhbS4NCj4+ID4gPiA+IElmIHlvdSBsb29rIGF0IGNvbW1lbnRzIG9mIGVu
dHJpZXMgdXNpbmcgdGhpcyBjYXRlZ29yeSAoNyBpbg0KPj4gPiA+ID4gb2UtY29yZQ0KPj4gPiA+
IHNjYXJ0aGdhcCkNCj4+ID4gPiA+IHRoZXNlIENWRXMgYXJlIG1vcmUgb3IgbGVzcyBpcnJlbGV2
YW50Lg0KPj4gPiA+ID4NCj4+ID4gPiA+IFNvIHRoaXMgcGF0Y2ggaXMgZnJvbSBteSBwb2ludCBv
ZiB2aWV3IHN0ZXAgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4NCj4+ID4gPiA+IElmIHlvdSByZWFs
bHkgbmVlZCB0byBzaG93IHRoZXNlIGR1ZSB0byB5b3VyIENWRSBoYW5kbGluZw0KPj4gPiA+ID4g
cHJvY2VzcywgeW91IGNhbiBlYXNpbHkgb3ZlcnJpZGUgdGhpcyB2YXJpYWJsZSBhc3NpZ25tZW50
IGluIHlvdXIgb3duDQo+bGF5ZXIuDQo+PiA+ID4gPg0KPj4gPiA+DQo+PiA+ID4NCj4+ID4gPiBJ
IHRyaWVkIHRoaXMgaW4gbXkgbGF5ZXIsIGNyZWF0ZWQgYSAuY29uZiBhbmQgaW5jbHVkZWQgaW4g
bXkgZGlzdHJvLmNvbmYgZmlsZS4NCj4+ID4gPiBUaGUgaXNzdWUgaXMsIGl0IGdldHMgb3Zlcndy
aXR0ZW4gYnkgY3ZlLWNoZWNrLW1hcC5jb25mIChhcyBpdCBpcw0KPj4gPiA+IGluY2x1ZGVkDQo+
PiA+IGxhdGVyKS4NCj4+ID4NCj4+ID4gSWYgeW91IGNyZWF0ZSBtZXRhLTx5b3VyLWxheWVyPi9j
b25mL2N2ZS1jaGVjay1tYXAuY29uZiBpdCB3aWxsIGJlDQo+PiA+IGluY2x1ZGVkIGluc3RlYWQg
b2YgdGhlIG9uZSBmcm9tIG9lLWNvcmUvcG9reS4NCj4+ID4NCj4+DQo+PiBJIHRyaWVkIHRoaXMg
YXBwcm9hY2gsIGl0IGluY2x1ZGVkIGJvdGggb2YgdGhlIGZpbGVzLCBhbmQgbXkgY29uZmlnIHdh
cyBvdmVyDQo+d3JpdHRlbi4NCj4+DQo+PiAjDQo+PiA8cGF0aD4vZGlzdHJvL29wZW5lbWJlZGRl
ZC1jb3JlLy4uL215LWxheWVyL2NvbmYvZGlzdHJvL215LWN2ZS1jaGVjay0NCj5tDQo+PiBhcC5j
b25mICMNCj4+IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVk
LQ0KPmNvcmUvbWV0YS9jb25mL2Rpc3Ryby9kZWZhdWx0c2V0dXAuY29uZiBpbmNsdWRlczoNCj4+
ICMNCj4+IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0K
PmNvcmUvbWV0YS9jb25mL2Rpc3Ryby8NCj4+IGluY2x1ZGUvZGVmYXVsdC1wcm92aWRlcnMuaW5j
ICMNCj4+IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0K
PmNvcmUvbWV0YS9jb25mL2Rpc3Ryby8NCj4+IGluY2x1ZGUvZGVmYXVsdC12ZXJzaW9ucy5pbmMg
Iw0KPj4gPHBhdGg+L2Rpc3Ryby9vcGVuZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtDQo+
Y29yZS9tZXRhL2NvbmYvZGlzdHJvLw0KPj4gaW5jbHVkZS9kZWZhdWx0LWRpc3Ryb3ZhcnMuaW5j
ICMNCj4+IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0K
PmNvcmUvbWV0YS9jb25mL2Rpc3Ryby8NCj4+IGluY2x1ZGUvbWFpbnRhaW5lcnMuaW5jICMNCj4+
IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0KPmNvcmUv
bWV0YS9jb25mL2Rpc3Ryby8NCj4+IGluY2x1ZGUvdGNtb2RlLWRlZmF1bHQuaW5jICMNCj4+IDxw
YXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0KPmNvcmUvbWV0
YS9jb25mL2Rpc3Ryby8NCj4+IGluY2x1ZGUvdGNsaWJjLWdsaWJjLmluYyAjDQo+PiA8cGF0aD4v
ZGlzdHJvL29wZW5lbWJlZGRlZC1jb3JlLy4uL29wZW5lbWJlZGRlZC0NCj5jb3JlL21ldGEvY29u
Zi9kaXN0cm8vDQo+PiBpbmNsdWRlL3VuaW5hdGl2ZS1mbGFncy5pbmMgIw0KPj4gPHBhdGg+L2Rp
c3Ryby9vcGVuZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtDQo+Y29yZS9tZXRhL2NvbmYv
ZGlzdHJvLw0KPj4gaW5jbHVkZS9pbml0LW1hbmFnZXItbm9uZS5pbmMgIw0KPj4gPHBhdGg+L2Rp
c3Ryby9vcGVuZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtDQo+Y29yZS9tZXRhL2NvbmYv
ZG9jdW1lbg0KPj4gdGF0aW9uLmNvbmYgIw0KPj4gPHBhdGg+L2Rpc3Ryby9vcGVuZW1iZWRkZWQt
Y29yZS8uLi9vcGVuZW1iZWRkZWQtDQo+Y29yZS9tZXRhL2NvbmYvbGljZW5zZQ0KPj4gcy5jb25m
ICMNCj4+IDxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLQ0K
PmNvcmUvbWV0YS9jb25mL3Nhbml0eS4NCj4+IGNvbmYgIw0KPj4gPHBhdGg+L2Rpc3Ryby9vcGVu
ZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2NvbmYvY3ZlLQ0KPmNoZQ0K
Pj4gY2stbWFwLmNvbmYNCj4NCj4NCj5Gb3IgdGhhdCB0byB3b3JrIHlvdSBuZWVkIHRvIHVzZSB0
aGUgc2FtZSBwYXRoLiBBYm92ZSB5b3UgaGF2ZToNCj4NCj5jb25mL2Rpc3Ryby9teS1jdmUtY2hl
Y2stbWFwLmNvbmYNCj4NCj5idXQgaXQgd291bGQgaGF2ZSB0byBtYXRjaDoNCj4NCj5jb25mL2N2
ZS1jaGVjay1tYXAuY29uZg0KPg0KDQoNCiMgICAvPHBhdGg+L2Rpc3Ryby9vcGVuZW1iZWRkZWQt
Y29yZS8uLi9tZXRhLW15bGF5ZXIvY29uZi9jdmUtY2hlY2stbWFwLmNvbmYNCiMgICAvPHBhdGg+
L2Rpc3Ryby9vcGVuZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2NvbmYv
ZGlzdHJvL2RlZmF1bHRzZXR1cC5jb25mIGluY2x1ZGVzOg0KIyAgICAgLzxwYXRoPi9kaXN0cm8v
b3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9jb25mL2Rpc3Ryby9p
bmNsdWRlL2RlZmF1bHQtcHJvdmlkZXJzLmluYw0KIyAgICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVt
YmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRl
L2RlZmF1bHQtdmVyc2lvbnMuaW5jDQojICAgICAvPHBhdGg+L2Rpc3Ryby9vcGVuZW1iZWRkZWQt
Y29yZS8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvZGVmYXVs
dC1kaXN0cm92YXJzLmluYw0KIyAgICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUv
Li4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJz
LmluYw0KIyAgICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVk
ZGVkLWNvcmUvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbW9kZS1kZWZhdWx0LmluYw0KIyAg
ICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUv
bWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbGliYy1nbGliYy5pbmMNCiMgICAgIC88cGF0aD4v
ZGlzdHJvL29wZW5lbWJlZGRlZC1jb3JlLy4uL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvY29uZi9k
aXN0cm8vaW5jbHVkZS91bmluYXRpdmUtZmxhZ3MuaW5jDQojICAgICAvPHBhdGg+L2Rpc3Ryby9v
cGVuZW1iZWRkZWQtY29yZS8uLi9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2NvbmYvZGlzdHJvL2lu
Y2x1ZGUvaW5pdC1tYW5hZ2VyLW5vbmUuaW5jDQojICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVk
ZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9jb25mL2RvY3VtZW50YXRpb24uY29u
Zg0KIyAgIC88cGF0aD4vZGlzdHJvL29wZW5lbWJlZGRlZC1jb3JlLy4uL29wZW5lbWJlZGRlZC1j
b3JlL21ldGEvY29uZi9saWNlbnNlcy5jb25mDQojICAgLzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVk
ZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9jb25mL3Nhbml0eS5jb25mDQojICAg
LzxwYXRoPi9kaXN0cm8vb3BlbmVtYmVkZGVkLWNvcmUvLi4vb3BlbmVtYmVkZGVkLWNvcmUvbWV0
YS9jb25mL2N2ZS1jaGVjay1tYXAuY29uZg0KDQoNClJlZ2FyZHMsDQpEaGFpcnlhDQoNCj5DaGVl
cnMsDQo+DQo+UmljaGFyZA0KPg0KPg0KDQo=

