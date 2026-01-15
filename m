Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F74D3CC9E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 01:25:39 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26339.1768440330244974395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 17:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=JRWlBX6k;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.21, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJOTAA+5C/J1Xvx/9PqirNwMNCxGQI+cf6a83pBWgmwG/cwyUcwh+eMwF7ph9USlOkb2uB1e7OdjeITf7xvqXI+rpc35Un6p+QQwxMVTMO3HriB6+L0IfA79uq8Z0UpWsuttkT/5oy+51A5mqkObeMVc/s0yrsFwWhTFqGqverU2l6d3URpKjtwK7lyql/jDc+y75vUiLyfji0xQnW9+Xg/y35JQdJpj3mZk4uumy96tLK/k3SAiQ32HQknhQHz0YTkPj5Y24sxMgqHtmE86rapQpZf5pYPRhs46BCl+Bhu10koapEGj1/KbO91f8A0TCetbpJy/TjhF3X+BzL2lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puRjNt0M6oL3lhSGcW32H129wsUKTUuwDt2+4IjZ7IY=;
 b=cK3PDB4Jh0PPpJRm8cY+pxROx1ecl2Fs2R5gQ9X3Fwb5/7K80Y+ZTxINLvag/kIcly1kaYnwCgpROp1FtG32Kczq439JFDtBr73frfQkXDwGGus8pYv8yehhF3OH8VaoJjZ7OTuFRWDxSbwEAsK7e4fCdlHkXTOLCQ+tR+OFJZfUr4pT1AE6NWdbr0whDCG5At9l4K2hFvkmEfvBNYfzr4xyjpV4xcQHdutULbeSFvQMu0vF05HEoX4m2g1OWb1nP8eVLzjuao2YUj0YXYbKeoME9Q84pUWex/S4YBsTJ6gFHg3hpRSg+fnpDTU951UcJSDuryPgEaYDEI/EABW9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puRjNt0M6oL3lhSGcW32H129wsUKTUuwDt2+4IjZ7IY=;
 b=JRWlBX6kOvMoaFtfRfXLu/v+q5xIzD/khxa+4KCLGBPa0+KMi8IjJTkf4LxNnAHXfBSm0BZyB3ozB7x/7fKaVbJSPkphtyVbyDj+roZ/xuZR+BNeIlcy+xzy2uqEVv/42iaJRdEsZkJ4spdlzb3WFtL4SXJZliddXutyBuW+7C4ftb+zLF/nBQF9Z1NZiC3qupDD/5C6rzHVIe5YlzWnU90poODW0QgsG2/HEMWq4d6NEIN/xD4y503215wfr5wa1h7yDA6mUOP8Gevb+oYejP5c/vNw+zi7PF7sCRZKYhsIwz+lIWc3rGipFaxDv7Ct9FsTRiHV6ivqdiD1QDyWOw==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYWPR01MB11216.jpnprd01.prod.outlook.com (2603:1096:400:3f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 01:25:25 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 01:25:24 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdIGxpYmNhcC1uZyB1cGdyYWRlIGRlcGVuZHMgcHJv?=
 =?gb2312?Q?blem?=
Thread-Topic: [OE-core] libcap-ng upgrade depends problem
Thread-Index: AQHchFl2CM/CK/+Tg0KKigpNzBI947VRp1IAgAAAdoCAAMpl0g==
Date: Thu, 15 Jan 2026 01:25:24 +0000
Message-ID: 
 <TY3PR01MB10110A1748D642BEEBE6F99169B8CA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: 
 <TY3PR01MB10110411E2A03C12CAB153BCB9B8EA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <DFOC9XA7U7FI.N5FIE3FOCY5E@bootlin.com>
 <DFOCB6REM2EQ.2O1LSJOYV18PG@bootlin.com>
In-Reply-To: <DFOCB6REM2EQ.2O1LSJOYV18PG@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-01-15T01:25:24.050Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYWPR01MB11216:EE_
x-ms-office365-filtering-correlation-id: 411600b2-cb7a-4c90-7d2f-08de53d4f570
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7142099003|7053199007|13003099007|8096899003|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 =?gb2312?B?ejFZT0ZvSG1nRFR3Q2FTTzNJUXBydE9ZSFZnTElhNXprU0hDRXZPY0QrMjYr?=
 =?gb2312?B?NitJNFhZQ0dsdTI2OGNJdkUwQ1VmQjJldll0UGk5NU9mN3NhcW13dFBDQWdx?=
 =?gb2312?B?L0VrR3gwazkyTUYyLzVqOUN0cjRpaTFobkIwbTF1b2lJTDdXcnFCTG41c3lB?=
 =?gb2312?B?Zk40dzY3WUtYeWVya1Y1VTVQcThaTGhWK3l6SFAwVjZpMXdRSTVlTHBJK05Q?=
 =?gb2312?B?WGd5MjZzbVZLNVFRWC9LQlZlUmNvOWY2eXdkcHZZZ042N2JiY3JhaHNYVUo5?=
 =?gb2312?B?RGo4MTlnVEUzTlNqQWxGd1F6azR6dzZkZFlwdDBhMndrMTdMeDhCVXUvNitk?=
 =?gb2312?B?SE5CV3paYnRQSDZhbGtpN0Q5NkIvd1RiL1R6NlpOU1Fod0RHS3U4OFJRT3Ju?=
 =?gb2312?B?SWc2RUF0Q2RiQlA4cHBGa3c5a29uZXE0SFovcW5GU3B0MGJySWhsb291R2t5?=
 =?gb2312?B?TU5qS0pMeTZZMk9PQVJ3ZEltQnBoQ3MyNWJnYXZobERSaEZ5dFR3VEhkL1BB?=
 =?gb2312?B?eHFkOGtRWVhhaFFxSDdtZXY2QTRteDBHaW0zcmpIWDNCQmd1RlBWcFJVTUZJ?=
 =?gb2312?B?ZEdnakFPVXJTNDhXTDM4NU4raWxFNnJjSUN2N1pVOWlKSTU1YVp1VDcyVmFG?=
 =?gb2312?B?OUZLdlMxVWw0ZVdzUHZaQkd6Q1FDblIrZFMwOUY1RlFIbXJCamVLTDUwakRW?=
 =?gb2312?B?a2pqVWt2OU55Qk1BVVR6RXBhRy83RUkvNXVkMDIzNHZHYklocTM5dzFubVFn?=
 =?gb2312?B?Y2dVZFNMeDVwYXB5NGpLbU5jQWVyMVNsT1lGZkgwK0JhSWZkYzA2RExKMmhW?=
 =?gb2312?B?YnZ3RExNNEtVNnRHa1N6VXRmcGplR0pYL3JiMElGSTZOUktIa0lHelQvQjlY?=
 =?gb2312?B?QUFjYW5xb292RzFRNWlpaDdTdDNwNUxNaXJXeWZPMEJEclFkUE5ENnhDQlhI?=
 =?gb2312?B?TytaVlk3TWtZYjBNdk83b2JvVjZFRlgzS3VrM3dCRWx5K1VlUURnUVAzNUc1?=
 =?gb2312?B?eE5DRW81MzB5TTlDU1JiZ3JrQ2xBRCt1WDc0ZnhRVUJGS01MbHlXWFlEdmNr?=
 =?gb2312?B?K3NNY1MzaUNYSFFDbmZYb0JjRURlZTBwdVo3T05Oc2ZaR3N3cGZ5bEl2ZGZh?=
 =?gb2312?B?TTQ0Q3J4R0dobUZoWlJTQlB3ZEFxaTZ6QVd3TzNVNjFjZUJNUzMvSTRqS3Uw?=
 =?gb2312?B?Tk8rVCtTSDN6N0RmQ0JnL3lqWlNjRzJBZFNFQnpPZHNXaDlQbytpbWN2WGZj?=
 =?gb2312?B?a2VMMWdYOXhicWZ0UUFiaFNjd2xORllkUWh1SndJUGVNRzdTRy8xOGtyL1dI?=
 =?gb2312?B?S0pBaVFTVE42U0x3Ny9oYW5FZ0REdGRMeVZSQndhN20wRW5IL3dWbDJ4bGtB?=
 =?gb2312?B?L3NEOVY4Z0dXZ3huQ293aUJONndVRisrbjBLWUZpZTVNNWlMbHJKUkxJZ0E5?=
 =?gb2312?B?dlpFeEwxUVA2Q1o5a0VvK2hTaVF6WlFaNG1YUCt5L2ZTL0dNT3YxV2l2cG1X?=
 =?gb2312?B?S1NsdlNNV21QU1dnNm4rY212WS9PWFo1RHF0dzBKMmRGTVUyVlNsUTAyZmFi?=
 =?gb2312?B?dVBoNm9mNmw1cVlVS2gzTnJCQVlmbkQ3ZVNxalV1bXVXQk0yTlJGZ3pldEJP?=
 =?gb2312?B?YWFqRGZVd1ZZYzVENTlWNGJrQXhDdlhTQW1YQlZtU3ZnRXRGdmxmZlFxeDQ2?=
 =?gb2312?B?OTN2R3pyQ05zTTg3TUJ1eTRoWmxVR1Bhck1PaFpNajBCQXg5TjVFajBFekRu?=
 =?gb2312?B?ZnhYMDFuMjNNclBNMXo2RzI2a0xMVWlPQlBIcVZRWmFTQ2REQ0lCMHVLVTlw?=
 =?gb2312?B?SnMza2Q1TWNadXZoM0IyM1ZPd0VIMG1raktjTXFST2pVNGFOQVJnT2pkbGFO?=
 =?gb2312?B?WFNWWEh4WGdOaW82Y29ZVHF0UU12UUJybS84aDh1UFZJczY1YnZ0R3EwaHYw?=
 =?gb2312?B?OVEwN0dHU0NmdE4xQjRJRHdlZVZrcGltRFZLWWFlTGpGMG9RazljMFFwTC9J?=
 =?gb2312?B?QVYvVXZzWEpCZTZBMWpLaFBYeUlnTkRPUmJJOEZrZUZXUlZNNCs4bDJhU2Js?=
 =?gb2312?B?Zlg0MTYvemNQd2FWd3YwOWlnU1VUVEtWcFg0UFI2UnpqUXppaldLZEtJdG5C?=
 =?gb2312?B?aTBhQy9lMVlJbFh5Ly8xTy9EN25sZDFveXZPVGNzQW9ISUl0U1RzUUlmZ3JS?=
 =?gb2312?B?Q3c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007)(13003099007)(8096899003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ME14RUg3OXZsUWhYb2hVQmpSOVQycGt6WjQ0R0JwOXZXYmYyd2pNQWJXOFAx?=
 =?gb2312?B?R0RGd254UVl2U2kvVWd0WGNTQzlGZ0twUFRRakZ6eTFxZjI5WlVRSUZJSGlw?=
 =?gb2312?B?MmV0VXVoQXRXRlZDTC83blJVZjlnbE9tek9MZWxMblc3YjcrM2MzMWp6b3Nt?=
 =?gb2312?B?a2Z6MDZsSVpic3AxUFN0bkxmMitNT3l1UU4xb2t4ZmF5Tk9BbmJDZ2ZVZFJz?=
 =?gb2312?B?dENYeFVjL0NUVkJRRzFZUVk4SjJYQ0UydFRDRVBXSEY1dEhqL1lUSno2MmVz?=
 =?gb2312?B?VWl0UmI4a01KcDlEQS9nc1kra1hiREtTbkMrQnhIQThkeHludmNQTzFKeFlz?=
 =?gb2312?B?WW1nYjA5R29ycy9RZHYxUmhkaVBmeS94VWk4clp2a1E5SVkzK093TUM4cnN6?=
 =?gb2312?B?SUNZQXFRc2xvQk43bVd4MDFmMmJYelJFMk91dk1ZcG1hQ09uSlJ0dmtBWUdk?=
 =?gb2312?B?RjVVNHJuVW5kaUdCUEYrQjlxSjRMU2lsMTNmL2ttejZuQ2hzTkt2SFNEcHZ4?=
 =?gb2312?B?Mko4WG0zVThkZjQ5WEU4RHdjbFJoUHNVWjRLbGx1dm5TK2J1aGhPR21iU1Qx?=
 =?gb2312?B?NEcxczY2T1BlMTNkSURaWHBEYlUxRkdCVVVFVHBIZXNZU0RSNnRFK2hUQnRn?=
 =?gb2312?B?VWFGTm1odGtFcXIwbThYVHpvZCt6ZEkrYnlkQU96N2Y5Y29oUWJ4cnNYWVlB?=
 =?gb2312?B?YWJodlpKc09QOGRCL2k2eUphektGRFZHUnlSbFJ2dWVsVC9ua1crbUNjaFc4?=
 =?gb2312?B?VHlRUEVhMCtidXJnUndPaUgycFgzQjFvODZ6OGRGckFSWlVBa0twTU8rUElJ?=
 =?gb2312?B?ZXlUU0FLaFdyVEI5RXVXSkU4MGt3K0VYOXg2Qi9NdndpcC9mSlVXSkxWZWxD?=
 =?gb2312?B?OHR5clpkbk1pMlJ0dEdGNUJTZzcxcEhvUTB1NXVYWmhzUWNZWWtSSmxzVDJF?=
 =?gb2312?B?YXdkQnNrOE1hZGdzeXk1cXRtem5tdjZIenFwamEzTXo1ZE5jWFRMcDhhS3RO?=
 =?gb2312?B?MlJUR1VZM1llZXZLVFRURVpGRHFtWm40MWZZejRGK0QrM1JGc3Z5NGRSTlY4?=
 =?gb2312?B?Y2JHb1ordk9Od3Vtekxrc1NXaURCU1lRYWJlTldqdG5VakkrTFZ5MmFiWUc0?=
 =?gb2312?B?aTRnNG1MbWVSd01zT3BMWTBINWNhS3dzUzJ0TGEzTmJaR0lLNmdwV0Nqais5?=
 =?gb2312?B?OGFpRmN4Y3NZdmtEbVhjYklzRDZpOUg3Y09vbFVEai9pUmlmeXc3aExaWCts?=
 =?gb2312?B?ZmEwclZBcHNvTmsxa2g1WDdCUDg3VXVITVpIRDgrVFp4U2hoNDAraUxzSFJi?=
 =?gb2312?B?QnlxaXdydS84dlVZMDBrT1I0UW5TQjlES3N2NUtSdlJqL2FyZ2VxL2lyYVRK?=
 =?gb2312?B?YUJTVDlOSW1ZQzdhSFQ5UndpTUlHaDN6MlBpbFZKWWhYblM0N1lRbHI1Sjlj?=
 =?gb2312?B?aFRad1JuSENVR3FoNlBaYVRQUkVRZGd5dnEyUlJSVU83azNlUTJUcW1OME5i?=
 =?gb2312?B?L0xDZG9MYjlzT3lGUm9JcE9ReXBYdjYvK1JFZFl1c3FTSURXaUZsc1pYVll5?=
 =?gb2312?B?aERYc0JTMkFvRFYrQnZrdzhDeHQ3RDE1OWhhajBqYWJFRGxVN2MrQWlITSs3?=
 =?gb2312?B?QUJYejFoUk03ZHNUWm5CSXNhdHpCVHZ3dnRHdmxmcU5Qc1Nob1gxMVBZeEZv?=
 =?gb2312?B?WFNRSG1sVFBCZXprWkJJM05GaVZPMmxaUE1sVVBBZlpMZWtSc1VkUDBBQmc0?=
 =?gb2312?B?UUhkRjg0MmIxZElkK1N5NVJHUERLd2lnQlUyS1daNnRtRHNoTjFnZHBzbnVY?=
 =?gb2312?B?aUlQbXdTMkFEa3JEalhMZXVQM1REUFM2LzB5THRYNFl0eGl6U1BHcUpwWW9J?=
 =?gb2312?B?WXFsazhBbnNFU3pqNlRSSmY0bk1NRnZ1cWQ3elVyTnRsSEV2d1NWMjJ5VHVP?=
 =?gb2312?B?OHNQL1lGZU02K2V1WGtGTnkwRUs3WDFwckJzdHVVNWlhYXNvLzFkdW5xaEpo?=
 =?gb2312?B?YmJyVldCbFhOUmh2TU8waWpFTEdzNG5DM3BjanJkSjk1SUs2ZU90bi84NEpO?=
 =?gb2312?B?eGRLeElZU2VHc3pzOEpaSXVXRk51MW1yL3ExZk15QXNyd2M2cER0K2ZHcU83?=
 =?gb2312?B?L25DR0lVUmMzclptR2FDUEJLNU1ZZm55Ulh2WmQ1N0tTTEo4Qk5HOUdNUHVz?=
 =?gb2312?B?L3NXc0JQaHJNekd2NG4wZkh6dFpGcTJCdk9qeWc1aFF4RkE4U1V6SkdjMlEv?=
 =?gb2312?B?R1RYandFREN6MkszU0tkNkdZeFZlSWpIWU55REtHcE00R0RrL2Z4czdWTHQ5?=
 =?gb2312?B?OEdkY3g0bGwzMmZDb29aTVc4UVo1ZlFnREdoVFc0OVZTM2Q0aEpDdz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110A1748D642BEEBE6F99169B8CATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411600b2-cb7a-4c90-7d2f-08de53d4f570
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 01:25:24.8772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reDAH0W++Bp7TPQhgEOY7aO9Gn473rHajBVe1ti8oBSYJiBIPr9aCVz6J6+cC9fXefLxxfDNTqpugujo0GusnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 01:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229379

--_000_TY3PR01MB10110A1748D642BEEBE6F99169B8CATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQW50b25pbg0KDQogICAgWWVzLCBhZnRlciB0aGF0IG1haWwgSSBmb3VuZCBhIHNvbHV0aW9u
LiBBbnl3YXksIHRoYW5rcyBmb3IgeW91ciBhbnN3ZXIuDQoNCkxpdQ0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCreivP7IyzogQW50b25pbiBHb2RhcmQgPGFudG9uaW4uZ29kYXJk
QGJvb3RsaW4uY29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jHUwjE0yNUgMjE6MTgNCsrVvP7IyzogTGl1
LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVdIGxpYmNhcC1uZyB1cGdyYWRlIGRlcGVu
ZHMgcHJvYmxlbQ0KDQpbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGFudG9uaW4uZ29k
YXJkQGJvb3RsaW4uY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KT24gV2VkIEphbiAxNCwg
MjAyNiBhdCAyOjE2IFBNIENFVCwgQW50b25pbiBHb2RhcmQgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+IEhpLA0KPg0KPiBPbiBUdWUgSmFuIDEzLCAyMDI2IGF0IDg6MDEgQU0g
Q0VULCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4+IEhpIEFsbA0KPj4NCj4+IEkgdHJ5ZWQgdG8gdXBncmFkZSBsaWJjYXAtbmcgZnJvbSAw
LjguNSB0byAwLjksIGJ1dCB0aGVyZSBpcyBQS0dfQ0hFQ0sgZXJyb3IgZHVyaW5nIGRvX2NvbmZp
Z3VyZQ0KPj4NCj4+IHwgY2hlY2tpbmcgZm9yIGdhd2suLi4gKGNhY2hlZCkgZ2F3aw0KPj4gfCAu
Li9zb3VyY2VzL2xpYmNhcC1uZy0wLjkvY29uZmlndXJlOiBsaW5lIDE0ODYyOiBzeW50YXggZXJy
b3IgbmVhciB1bmV4cGVjdGVkIHRva2VuIGBMSUJCUEYsbGliYnBmLCcNCj4+IHwgLi4vc291cmNl
cy9saWJjYXAtbmctMC45L2NvbmZpZ3VyZTogbGluZSAxNDg2MjogYFBLR19DSEVDS19NT0RVTEVT
KExJQkJQRixsaWJicGYsJw0KPj4gfCBOT1RFOiBUaGUgZm9sbG93aW5nIGNvbmZpZy5sb2cgZmls
ZXMgbWF5IHByb3ZpZGUgZnVydGhlciBpbmZvcm1hdGlvbi4NCj4+IHwgTk9URTogL21udC9jb250
cmlidXRpb24vYnVpbGRfaW1hZ2UvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRp
dmUvMC45L2J1aWxkL2NvbmZpZy5sb2cNCj4+IHwgRVJST1I6IGNvbmZpZ3VyZSBmYWlsZWQNCj4+
IHwgV0FSTklORzogZXhpdCBjb2RlIDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQuDQo+Pg0KPj4gSXQg
c2VlbXMgbGlrZSBsaWJicGYgaXMgbmVlZGVkIGFzIGRlcGVuZGVuY2UuDQo+PiBCdXQgbGliYnBm
IGlzIGluIG1ldGEtb2Ugbm90IGluIG9lLWNvcmUuDQo+PiBEb2VzIGFueSBvbmUgaGFzIGV4cGVy
aWVuY2UgYWJvdXQgdGhpcyBwcm9ibGVtPw0KPg0KPiBUaGlzIHByb2JhYmx5IG1lYW5zIHRoYXQg
dGhlIGxpYmJwZiByZWNpcGUgbmVlZHMgdG8gYmUgbW92ZWQgZnJvbSBtZXRhLW9lDQo+IHRvIG9w
ZW5lbWJlZGRlZC1jb3JlLiBDYW4geW91IHNlbmQgYSBzZXJpZXMgdGhhdCBhZGRzIHRoaXMgcmVj
aXBlIGZpcnN0LCBhbmQNCj4gdGhlbiB1cGRhdGVzIGxpYmNhcC1uZz8NCg0KQXBvbG9naWVzLCBJ
IGp1c3QgcmVhbGl6ZWQgeW91IHNlbnQgYSBmb2xsb3ctdXAgcGF0Y2ggb24gdGhpcywgc28geW91
IGNhbiBpZ25vcmUNCm15IGVtYWlsLg0KDQpBbnRvbmluDQoNCi0tDQpBbnRvbmluIEdvZGFyZCwg
Qm9vdGxpbg0KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9i
b290bGluLmNvbQ0KDQo=

--_000_TY3PR01MB10110A1748D642BEEBE6F99169B8CATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Antonin<br>
<br>
&nbsp; &nbsp; Yes, after that mail I found a solution. Anyway, thanks for y=
our answer.<br>
<br>
Liu&nbsp;</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Antonin=
 Godard &lt;antonin.godard@bootlin.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C214=C8=D5 21:18<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core] libcap-ng upgrade depends problem</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from antonin.godard@boo=
tlin.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
On Wed Jan 14, 2026 at 2:16 PM CET, Antonin Godard via lists.openembedded.o=
rg wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Tue Jan 13, 2026 at 8:01 AM CET, Yiding Liu (Fujitsu) via lists.ope=
nembedded.org wrote:<br>
&gt;&gt; Hi All<br>
&gt;&gt;<br>
&gt;&gt; I tryed to upgrade libcap-ng from 0.8.5 to 0.9, but there is PKG_C=
HECK error during do_configure<br>
&gt;&gt;<br>
&gt;&gt; | checking for gawk... (cached) gawk<br>
&gt;&gt; | ../sources/libcap-ng-0.9/configure: line 14862: syntax error nea=
r unexpected token `LIBBPF,libbpf,'<br>
&gt;&gt; | ../sources/libcap-ng-0.9/configure: line 14862: `PKG_CHECK_MODUL=
ES(LIBBPF,libbpf,'<br>
&gt;&gt; | NOTE: The following config.log files may provide further informa=
tion.<br>
&gt;&gt; | NOTE: /mnt/contribution/build_image/tmp/work/x86_64-linux/libcap=
-ng-native/0.9/build/config.log<br>
&gt;&gt; | ERROR: configure failed<br>
&gt;&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt;<br>
&gt;&gt; It seems like libbpf is needed as dependence.<br>
&gt;&gt; But libbpf is in meta-oe not in oe-core.<br>
&gt;&gt; Does any one has experience about this problem?<br>
&gt;<br>
&gt; This probably means that the libbpf recipe needs to be moved from meta=
-oe<br>
&gt; to openembedded-core. Can you send a series that adds this recipe firs=
t, and<br>
&gt; then updates libcap-ng?<br>
<br>
Apologies, I just realized you sent a follow-up patch on this, so you can i=
gnore<br>
my email.<br>
<br>
Antonin<br>
<br>
--<br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB10110A1748D642BEEBE6F99169B8CATY3PR01MB10110jp_--

