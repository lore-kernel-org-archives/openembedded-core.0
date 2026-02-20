Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42E2C55174
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:34:51 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34647.1771580082807052837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=g7DTRMtz;
 spf=pass (domain: siemens.com, ip: 52.101.84.24, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGeaza6T85AxDXg9KmnKfoLH4FQCMAUkJ4jjjWi1Msshn5p16hOoxP/Q/cE8dp45N/36FGUmp62oA3J8aO8iA14NslCWGHVi/j9dyWwt8iFaooYxz5O/FJOQan6gykrotYOsDjwfq+clGXh58YHDVVJxLmR9+eCye7lSMIoZpSEYVvhpaQW3RjFJORh5ys7q5LH61WdZDoa0td6XfOkQJVP2pTkdoQ03hGB6TCPrZF8Wn/vREyUSpd4daaZpEqNdllgtBBHLPIghpGaqHa4mgAz8PgMXtosr2OLMWj1CphKF8BoBYAuUO6VQOx72noGrVzHWjhf+fCPm+nDc37+Qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78OeOSP5IMLXWR/bfgTIUAuo6MeOnFJ9VrF7WZpnUag=;
 b=wbNh7cIph3HNEgZJMU9w22F1HWDHIUcZiJO0M0nm2B7rTe+HBbFjzl/s7m7Z/2duJrdVDNfFM3Cd5+wldp3EO0PxoXzt+1wYOk4zeWfWeobU7l4Ezb0EreYfdmHCGUYKEx30DResyz4a1j4ZkKiWnC8v3OJ+lzbbOyyXYkIhmD7e/CUlVgMqwzLfnMgDy66pyTlQA4i02P+aNkV06LCFr46rysY+8KVeKyEmXtXHnKf2im9rJPvVfFGFt6XV/bgBgs3xS+QiJTLIuoVFURD+s6mlec7ryt0eR/UAMZACjj0nwjqGBsU6OPTR0RKpghvM+gQ7oikyKqgUSxxHUJpejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78OeOSP5IMLXWR/bfgTIUAuo6MeOnFJ9VrF7WZpnUag=;
 b=g7DTRMtzd4OEJtyrfsLAkzpHzyLQJo+WjgkVFPlkkyaBRuZUdgOLphZKnQai5RdXbRRkPnhBAbfxAgVKolDst0bo7k37njb56G0HUkQXOtscKCuoyh7P75aETnXRhFtsBcyCiN5nBxKlmvXii6HXakTSTE0pqIt7EXY3N5ILawIpdLTppIihxkeUuGP/K6nn5jFO6l0FCNP6yByOV4rQrPV+dotwb3f33DkKx2/78dZp0ArP1BzKKqquVKjw0l2BHhc2eKaVqLjZ28EXaySf6Mh6hP4u6MUyu1jHbV7FFL7StMamQmd+sSXNyZKRNFtHYHd6UBonCyDn0LfhLlpgeQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8995.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:34:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 09:34:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "hprajapati@mvista.com"
	<hprajapati@mvista.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
Thread-Topic: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
Thread-Index: AQHcoiPEVP3Wd2ChOEesMjQ+w/5dbbWLUzKAgAAAkmA=
Date: Fri, 20 Feb 2026 09:34:39 +0000
Message-ID: 
 <AS1PR10MB5697467AA218F394FEB5052CFD68A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260220044322.8015-1-hprajapati@mvista.com>
 <DGJONZ9P9Q10.336H4HB6V1RSM@smile.fr>
In-Reply-To: <DGJONZ9P9Q10.336H4HB6V1RSM@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=41028223-92cf-4178-b3b0-dafbd54e34d8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-20T09:33:51Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8995:EE_
x-ms-office365-filtering-correlation-id: 631191c6-cad9-4278-9476-08de706344dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a1dqR0VOUHhXNDBaQ0VndVMyLzhtSVhJZ0VUNmh0aXE5ZVgxZ1NJM2ZGUGdE?=
 =?utf-8?B?dko2K2VwTXVmSTFwb3UxWXQremwxZWNOY0wzaGNmcjV5dmlMdm91Nk8yTDBs?=
 =?utf-8?B?cy83OXVwK1Q0Uk1wT2JmWDRwb29OVGFTaklLbWd3OU9tSzF6a3FDb2g3NzZN?=
 =?utf-8?B?dEp2MXI0MW53YzZGamdrRXlHOHp2UThLZlp0WUN5ZERNMlhhdktEQkpoVHpk?=
 =?utf-8?B?RjlOTWI2V21LK3hxYmpwWEl1dVN3M1pveWZWNEU5blhjVDNKajREM0hTbElP?=
 =?utf-8?B?UXlQaGZZTUY4WEZLTjZPNGg5T09uSThTVXhpNTRuOGc1RjI2UlRXdWU0QzB1?=
 =?utf-8?B?c2llelFzdWpxZHl3QzVuOWtJRU9tby9ZOXlkMENwNkVtYjNSN2hORTdEV0Ix?=
 =?utf-8?B?Nmgvbm5UQVNBTjVkTlZ1ZkUzQWlUSzNsRlJ3RUtZY1RNMDNsUmtmTlo1OFBX?=
 =?utf-8?B?RDMxclZrNFRtdVNUYXVTeWpKVUExWlo3VjBMT0w2ZTJmbklyV1A0eFhRVzhj?=
 =?utf-8?B?anBrWGEyUU83K0pCVXovL1RIeW55eXVSVU81MjlOVUI2RmJpd3hHSEc0Sm5w?=
 =?utf-8?B?NnFqTjJJZTROZHFIb1BHYmNQQmVBK1BnUExTNGN4QzJWNWdRMXU5aE1HZFIx?=
 =?utf-8?B?M0V2SHBnRGtRTVF2MkJvYUE1cVVlYUpDOVNOYUptRmF2K2VvemEvM0drOTNH?=
 =?utf-8?B?ckxJbXFHeHovc2FqaTB2UklEZUdJT2UvanAwVWQ4eXlwVHROMVEvZWsvakJI?=
 =?utf-8?B?WEQybXBIV1lsZ1U2eEphR0s2L0FQOUQwVFVxaVVHMSt1WTVGN21xZVdwQlpX?=
 =?utf-8?B?S0ZsdHVvWE5CcUlVWnErS1NhWUYxTDlPVFI2czYwWitWdkVDbGNSVmU2eUdR?=
 =?utf-8?B?T3dvOG14ZkRmVC9mYWZjTzQ5ZmFiWUx0c2NCb2dxZTRObytYZ05ZUExZUmlK?=
 =?utf-8?B?dkRNejRWQ1UrMXF4S1VBRzhTaGZ6aVB0MDVEbGJLREdyMVgxMnUxYmlEdmRX?=
 =?utf-8?B?M1RpeEphbFZOMUhHYXhTRTc1bjZrb1RjWmFOVTNVNnZLQnFXOU5Ud3JkZ0pP?=
 =?utf-8?B?aHl4Z0EyMXhxak9MMWJQZ1hNQ0NoS2pkMUxPV3FFVVFVemk0RVRXU3VJcmZJ?=
 =?utf-8?B?aE9OYlVQSlY1OEJkdVRGSGV0UnpTZTZ5V0djQ21zT0cxZFptYmg2V1FVcE15?=
 =?utf-8?B?eGVVZXNreENwWnY1YzRsdTBwcmVjSXI4MmVUeEZNM2ZRQ3RFdEgyT0pZYTNU?=
 =?utf-8?B?NDc3aHFkeVREUWU3aW94UklJYXJLNzRuZEM5eVVtZkxLZnFtbDBXVVpYdkRN?=
 =?utf-8?B?aFRHZml6VlI3bVZVVGluOXFBNkprS2JjUTNMYURyWkRRQUV5Q2RTdjNCRjdZ?=
 =?utf-8?B?RGVDbUxEYmxyZlNQYitlTURwZUY4ZXVZbUszOUwvNndZOWFUU042ekZhcVI0?=
 =?utf-8?B?Mm9DUzhTLzIrK1NoMzIwVkg4NlJTaVI1akxOMGZNN1dQSTk1ZWtNUnl3ZHh5?=
 =?utf-8?B?OHdVajI0SnQzb2xNL2pUdlFqSkdSRERBU09DbkpRRlZ2d09qdFNSVUt5SVJZ?=
 =?utf-8?B?LzVNNm9pSDhkU210TTQrcy96VHZia1EvM2JjVDhDMjQvaHUweUVWRVlFcHpa?=
 =?utf-8?B?TFp5R3hFeUR4ekJqZEg5Z1RUbTJWTlh6SmFMblppSnR4NWVDc2tZeUNBRzJD?=
 =?utf-8?B?M2FWTWx6WlZRUjBvRzFudFRyZFN4d1g0cDRkai9ERXJLbnNYajhSdFBjTXFV?=
 =?utf-8?B?MUR1NlJoS29WMys2NFBWR1ZRYmd4NVV5UldMUnBNK2FCT2dIcmxTM3JiSHdz?=
 =?utf-8?B?ZWN6a2NvSjYvSDA2N2ZXdE43WWMxNGVVWE00cmRXWHArekRlRUF1eXBzaWc1?=
 =?utf-8?B?aFZiSVFVcWdxVHBmZHhtY2d4eHNvVjcxdHdnSERZMFRKekI0M1BwaUdVYW1J?=
 =?utf-8?B?NC9lOUloTmNNam1HcDZ2WjAxcW55SjZQT1hkVVlZQlVMT0s0ak5PeExudWtK?=
 =?utf-8?B?OXJWNHFtS1lYc0RmYXVyTUhhcmdRUkw2bTd5aEREWHpicGpPejl2V2h3K3lh?=
 =?utf-8?B?a1AyS2pFa0VZOEdocG5DODNRd0dFcVlGUWgyaWFMUWNTZFNNK09sc3ZsWFJr?=
 =?utf-8?B?NS9PeEFXbkRIUUthK09YRVV0bS9aaHNLZGtOcS93cDFKWk5FbEJhY0NhQVhH?=
 =?utf-8?Q?rJTI6JlrEwWDmIMtS9h27m4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q2FBUzVscDBsTUJlQ2tYWURqcFh1eis2SDFoY0s1dmFHT1IyaXNFRDY0ZDlY?=
 =?utf-8?B?N25ySmpuajBoKzFDbEtMNVZFZHkrRlJHVExsNFZOb1FwSnVYVUxFL0FhRlpy?=
 =?utf-8?B?VGdHWGpvWlpKUzhPcjgwSFpwWnF3dHJTN1pDVVJUTE5oYmtUWVdPR1hLKzZ6?=
 =?utf-8?B?RzF1V0Y3THNxYVhBMldlajhQdDVnaDBEWit0NnBGWWFpTjFFT2tYeG4zUEZx?=
 =?utf-8?B?dEJyMWhoTUZOSVMzdXAwT01qK1QyU1lhNmZ5dUZ5dFp5REVTME04OE9ubFBV?=
 =?utf-8?B?aU8yZnVlcUZrdWJNbWUwSmVNSzlodWhMQ0d6NXgzNHp5QmFqZjBDUG1DRUpy?=
 =?utf-8?B?SVdEMHlkMFJXa2tyL282QlRKQnZ0VWxMVzFtNmdvakRzaWJ6R2M2TGFIZUtC?=
 =?utf-8?B?bGtsV3NNUFZtdndEOTNjaStRV1Z2YWFocnBvZG11TWhSQWFaVUJsZUxmelM0?=
 =?utf-8?B?MkVEMWNlRTBUR2tBRyt0NjJyYUprRnBwY0dzTm42WmZkNGJFWUY1Wi9ONkFx?=
 =?utf-8?B?SmhsRGFYVmUxcXVFUXBvaGxES2RwZlZETS9ET21xVGpuUEVZM01kL3pQZ0JJ?=
 =?utf-8?B?OFVIQUQyamNob2pvb05hZC9wVVdhZXR5Qm5XSDFGWnF6REZKTTg1a0dsK2dz?=
 =?utf-8?B?ZHA5NFlzOEs3bUVybEpqNmgzdUZMM1FUb3BSemN1d3ZCMHI4WjZVZFZhck1w?=
 =?utf-8?B?V0dTYUlOUVcrWEZidm55Z3lvSmQ3cVIxUVBHbUhyU0dNYndQRVlUc2QwZHFa?=
 =?utf-8?B?cGVjT2RzeHM1amJ3UmZUVGw4VzNqU0lsZ1gyMnBWNVhHZGUvRG1ZNU5MQ3p6?=
 =?utf-8?B?WlpPZnoza0FIejZRbGFzUng5QjdIK3dHQXo2aXRDaHYwZlArc0E0cGVLU3RD?=
 =?utf-8?B?UGJKY1krWitsOUpZUm9EdVFDdkNxNC9UeElUK1JFamRlOU1CV0FNNEZiWjZT?=
 =?utf-8?B?R0YyTlhtSjJjTzJuMTRYV1VzZkVBZ1FSRFg5aE0ybVBORllRSUNoaDcyYml3?=
 =?utf-8?B?RFNRTkFqREptNkI1QWI0Qm9qdHhRRVY1cmtqcUdCK0I3eFFPQ01hVnc5Z2Vq?=
 =?utf-8?B?UzB6NUxmRStjU2xMQTN0SEtJMEhqa1JRdEJpQlBZUG1ZOFBVN1E1MzlldW85?=
 =?utf-8?B?Qk5yVWpXYUVGcnB1SUUvNzNKRFB1ZVl1ZDFlNzNyK2d2N0Mvc0FCdVJIanB2?=
 =?utf-8?B?RTFqKzBNNENwcnRDVXIrNkNmb3pDUHpqK1Z0cFpQMzJibG1pNnU1MmN1cWs2?=
 =?utf-8?B?RXBuWmF1YVUvaDFFZjJCaVJPZStEWVFIZXp1eU00YStpSGd3S2FHbmIxL3k5?=
 =?utf-8?B?YjNWeTJUVHJVL1BsNlRVaU5VWENGNSsycm1YUDdFdVZPV3pZQTRiMXdwMHlY?=
 =?utf-8?B?SHEvMUlYK0I2Ym1CWmJjQVhVYmlSMERORjVqVWs2S3A1WlpnSXJrbEVGektI?=
 =?utf-8?B?NFlRYkV6QTlPTXFsZlZjQWtuS3hvR2JqZWx4WENqYW9nVUFaZ3FxT3k4YnIy?=
 =?utf-8?B?ejFKWGFXV1U4ckQxTk5FMFYwQmdDbHdwM1V3eXExZG1pRnFuSUd5byt6TWIx?=
 =?utf-8?B?aHpNY3FrekVKOGQzQnlnMWZlcmZkSVEvRU9IRUNISzJjeWhzL0dJM01tZmRL?=
 =?utf-8?B?RitOdXNQaUsyNm5rOHQ2ZVF5YUVSU09iZmlISkFxM3E5TDVQRVRjbzRvMEcx?=
 =?utf-8?B?QUgvWDBJdS91QW5ucjYyb2xQZnFad0FuSFRPVTVlbFB0K0dJVzNkc2tqY0Zq?=
 =?utf-8?B?VmNaakUydG9lTHdOMU95dGtpVDRERFVSeGFrVGNPZTkybkxLWTN1K3RDMGpT?=
 =?utf-8?B?dXVLVWRRa3JFb1B6anVMRWVMdmsvMVNwd0Z2QUNqeUdWMFdMbG9YbGtIbGxi?=
 =?utf-8?B?ejVZbjFETEJrNGZkdHRaaVhUeHljaDNLY1FzeWYvZlJoNUljZ3FBNUlMK0ZG?=
 =?utf-8?B?aWpCdXRvZWtiOFpiT0Y0TzFTMTkveG0zek5UeC91aC8vMjFuVVNWd0N6aTdh?=
 =?utf-8?B?dmxlK2VxazA4bjV6UjFmVEJPVG5hRjlYZi9sUXVNQ2tXZkN3NVVWbE1wVmRn?=
 =?utf-8?B?YkF1Y0V0WGVab05waEtWQkpBWVBVRnpNVW5JRUlOaHN0VTdLODhWSzBwZjFx?=
 =?utf-8?B?TGRzS2llWUN5R2IrQkV4MThFTWdQTnJ3YUFvWGlmbGZ5aUhRTGpOSmtydGpw?=
 =?utf-8?B?NjRoSDZxTG50MGw2MEdQMG4xR3Bib0dVSjc1QWFxdlJYR3FNYTV5WGVGY21T?=
 =?utf-8?B?Zk1ydHRpc3c1SDQ0MERWN2dGYkFtTmNnUzhJRE94cE5rU1cvR3JSbFQ2cmZR?=
 =?utf-8?B?azdlK1l1LzlrYzExemdMN1hhRm1ZL1doNmxVdk5mazFTbkhZWEp5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 631191c6-cad9-4278-9476-08de706344dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 09:34:39.2234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +e+9f7tqL9A2/NGy+p3QKnx+PNvkW0PQEV4CgJJarbCPIlS+PU3AYFu5Y02OZmePrOs/GyU51H4QOvxp6uJGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8995
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231498

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyMCwgMjAyNiAxMDozMg0K
PiBUbzogaHByYWphcGF0aUBtdmlzdGEuY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFUQ0h2
Ml0gb3BlbnNzbDogZml4IENWRS0yMDI1LTY5NDE5DQo+IA0KPiBPbiBGcmkgRmViIDIwLCAyMDI2
IGF0IDU6NDMgQU0gQ0VULCBIaXRlbmRyYSBQcmFqYXBhdGkgdmlhDQo+IGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+ID4gQmFja3BvcnQgcGF0Y2ggZnJvbSBOVkQgcmVwb3J0OiBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS0NCj4gNjk0MTkNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEhpdGVuZHJhIFByYWphcGF0aSA8aHByYWphcGF0aUBtdmlzdGEuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vb3BlbnNzbC9vcGVuc3NsL0NWRS0yMDI1LTY5NDE5LnBhdGNo
ICAgICAgfCA2MSArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9vcGVuc3NsL29wZW5zc2xf
My4yLjYuYmIgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2
MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC9DVkUtMjAyNS0NCj4gNjk0MTkucGF0Y2gNCj4gDQo+
IEhlbGxvLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlZCBjb21taXQgbWVzc2FnZSwgaXQg
bG9va3MgYmV0dGVyIG5vdy4NCj4gDQo+IEkgc3RpbGwgbmVlZCBhIHdoaW5sYXR0ZXIgZXF1aXZh
bGVudCB0byB0YWtlIHRoaXMuIENhbiB5b3Ugc2VuZCBpdD8NCg0KV2hpbmxhdHRlciBoYXMgIm9w
ZW5zc2w6IHVwZ3JhZGUgMy41LjQgLT4gMy41LjUiDQoNClBldGVyDQoNCg==

