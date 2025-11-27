Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAD8D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:08:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21968.1764259697850842403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WF78tSc2;
 spf=pass (domain: siemens.com, ip: 52.101.66.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVWd2+Dm3ZokV8uTgE/TVnXCi7DM0d6iNEZOKmqNtv1E47+oEe7Zo99If7/WAcd/ch/8PjNKYZxLjvYcP4jIFxh1kIru3bjdxUPGa2vB3QqCILMYov44wdgd44hqoOnD0wP4YMhyKs+AQlCBw7OLlI9e0ck4NxqI7yho6aMRB0CWJvG9nDSAIa4mHeZETLzfHkVXAVSlVXMNaw/XU1DvWHfh2MXJYZ59sTNvrMk6sXEPnqCq2kv4mvcf96sTm6mWEAs7YFHRFVnPM4URBMRaUZfqPyp1oVLANtC7iv62oertfcfjNwK51a9oZQHApzBNTR2fxy7sbWWso+H+cm4IOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ente0B1Ui2KHdJvYcegrefkecsbmCKDYigsGG46tX0w=;
 b=SUe/oYbOLVyLOonYDiZKC5TSbJBTaetE84PqKmGl+B8JUeJCTLT8/db692akDtBDbVTi5LqOyLML2DUJLvk0LF9lEmtv3uE3W1ucOBtHHKQI7TCrICWjgTFJj29dREqtq8Dagz7kbYqKTonsZmzHiOTeN04XXTRdohTcEqCU0Qhz5kfbbxZffEE4reJrK2ySkad7j5Dk0/LYgaMV9vwLs+IvL7ZNdTBoO8EHPD0MJS5INU3NfdEdNrnf5YMPKuwS/lXgKs8VX/NHKL8W8gZD1bKqLz70ywTi/MKgJdVkDk6AiFnjBgGSGf9WFsvdzt2RYCk0jMghF6YWM8GgLkhBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ente0B1Ui2KHdJvYcegrefkecsbmCKDYigsGG46tX0w=;
 b=WF78tSc2g3wSnHRCFrH/QJYhN7n0FL3BPiVawFeDWbUK8OfFU9A+4lCEEfqXEdXoCzovm9Z3209cYWT1FdSlyhMwVpmMax130V/HSzyk9NG+3z5LX4p+3C5HnqwKBaHOPiAKKEfX+cfoUioEgvWHLDEd2TMYOK6U4E8DiHuCyQfvZXKDRtfUK5+e5kYy/62iy1DkJe2Xla+ypF0bgSBzA0HRsxJRel1qF2W2ohpNm38UCuuyD0SuONxdaM7kbUfOCQLIJYbs5UlaIZpCPOQN8EiaSvqgcpaSCoUtbLWCW8m6a4xG1brEzFOlG9YDDFXVNBJFDHdpb2CW1Gy1ZHBTFg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5234.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:08:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Thu, 27 Nov 2025
 16:08:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Topic: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Index: AQHcW/22yxLF02wKskuG7bN5X9cOULUFuwYmgABi+CCAAJWJgIAABELg
Date: Thu, 27 Nov 2025 16:08:14 +0000
Message-ID: 
 <AS1PR10MB569702E2C81347207AC913EFFDDFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1763849517.git.steve@sakoman.com>
 <e6de433ccb2784581d6c775cce97f414ef9334b1.1763849517.git.steve@sakoman.com>
 <187BB63A9D5CD718.192695@lists.openembedded.org>
 <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
 <AS1PR10MB5697C9581D88FF708572830CFDDFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <e57cb67b-f83f-45bb-a345-b11f49b3ca6b@kernel.crashing.org>
In-Reply-To: <e57cb67b-f83f-45bb-a345-b11f49b3ca6b@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=988567fe-24be-4dec-b24a-6f95496cad1c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-27T16:07:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5234:EE_
x-ms-office365-filtering-correlation-id: 3e8b9585-34de-4586-36bc-08de2dcf2b63
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bjZVeFdWZWRXeEs2bHFuZnBpK1FrS04rOHo5Y1R3OVZVVFFYQjVIdHJOcFAx?=
 =?utf-8?B?TkFxMW1zWVZEeFR4Q0RRMUl4T2s1dTdHMGtIdnRrRGJtNzlPQTZSRWNPWHYw?=
 =?utf-8?B?SG9ObkppdDNrdmRjcVRYN0dibHdJeE9GR251NVJGUURiRnhFajRTaWpSZjRH?=
 =?utf-8?B?RmRnd3QxVHdrRlFOVDBTSWEzVjUvKzRIN2d3V2t3cVJzeUwrZ0RkN0czQ01j?=
 =?utf-8?B?RU9IeHhPNzBrdFUzS3FGMmZiQlJrT3V1TmtxaWhzb1M2VTVNREFMM2wzM0pr?=
 =?utf-8?B?bHNFK25mK3p0YzdLenFkWXZPc240NDBhNVFhenNtMUxkMk8zNTJFeDRXRDdB?=
 =?utf-8?B?cFZXbStqcmk2MFgzZHRjeWZpNXhPai82eUZ3dHVRbUpFUHQ4blpKbS9mLzhm?=
 =?utf-8?B?RGtMVmlnMVdCNituNmFZUzNiRmVTNkhpMFVSUi9GaHRDQ1o2YnZHNDM2UWk1?=
 =?utf-8?B?VWlmdHB6cHRQZ2VHTVJOa21LTTJNTzVGbFRkT2JraWpQRFJ1a3ZSMGI2WU5z?=
 =?utf-8?B?TTF3djBKNlRuL1paYnBNWFRVTzgrU2lJcE15aEtiR2xMZ1VIdyt0dFdwRVox?=
 =?utf-8?B?RzNiRzhrMWV5b3BoNDc2ckpiL1RNQUZuT2pKSmdtVEtuOHpGRlhvZmFadkhX?=
 =?utf-8?B?OVZNeSsvaWpabTRkV1hWT2VWblJDeFBkczFDWXU2QlYzZ2RaZjRWQit4U3Zt?=
 =?utf-8?B?c2lKbDEzWDBpY3c2dEdPYm1VZTJBaGlnSTRoWWJQajBYYjlFa0hWamo1QWZE?=
 =?utf-8?B?aU14YlYvOVU0Y2FXUW9tQzBwNjkxY3VLV0tyWDFCMzc2S3VOWmFUZThjU21l?=
 =?utf-8?B?d1FrTlJWYmVGdHBXQVlIV2IzcmdPcEptTTQ1T2UyUDB2RlBDRXBNL3NRR1NL?=
 =?utf-8?B?YWFrd1crSXl1Q1ZPZVFSZVBQMlBvTUU3MlIxdUpFZUZZUmdzUVU1R3ZyZm1n?=
 =?utf-8?B?L2dBU2pUQ253YXo5MzF4azZjL1JWaUMwaUxwOUQ3Mms3SkYxQldpcUZnTTZV?=
 =?utf-8?B?bFkxbXV4enhsQ1FOY3hVTGtjWUM5dDVTU3JibUJXL1E1OXEvQVUvVUN2SE1i?=
 =?utf-8?B?L0k1dzVCaitTZnpqUXBhd2c5SFd2NWVPckRxUVpna3phbjVFalhsdkdZbFl4?=
 =?utf-8?B?NGdHV0VmZHFPbFhNTlVGOHlkYlMrcGNZVjhNajN0NVBLa2VJV3NCVEpDaE1R?=
 =?utf-8?B?QWlZWjljM29Wd01jdkk2a2d4bVlZWnNZRXU0aUN5ZVN1SW5BRitMdHQzbTZO?=
 =?utf-8?B?eUwvWVJLN3BRcElQa20zZkk3Q1h2cE85RXFJa0QrYm9KdHVsczEzdVU2b0Vo?=
 =?utf-8?B?SXpVYkQ0ZXF0SUgzVnpaTXY1SEk0VGRoalphRHozc2JCcllTU3M5U3M4NGpn?=
 =?utf-8?B?S2lGTjFPN3gwR3hETFJsVGFiZkdEYzJaSnBWa3RJUTRZc1lLb0x1OG9QZENm?=
 =?utf-8?B?bUQ0S2pvSXZJQXN3RDB4bURhQis0NFg1YkJkMEFBbzNqUkcwK0lIQkJrNXR6?=
 =?utf-8?B?eTM3d1BGMEVjTUx6cWZ5cEpwWkhPVzJuY3hLbURxNnFCZ1FHVDFvRVpSL3JT?=
 =?utf-8?B?dDkrSHRZRlRqRlpDZ0NWQSt2UGdMSE4vbC8vMnBVdGFCUG42SlB0OFBIdGpY?=
 =?utf-8?B?dERWdE1uU3dXZXAwL2tkTXJCMDlhUTdId2tvVkRXaVNkUFBqd0Y3TnpTWTBy?=
 =?utf-8?B?QkdwQ002SkwvSVo0THB0VEtmeWV4WjRlaHhNM29CT0NlOUMrRXpGREcrR1Vw?=
 =?utf-8?B?enNKNitxVmJCdEJGcWExMlpXbVVnTVZDbWY0d3RlUlhpakdIM0Q1eW5RRnBG?=
 =?utf-8?B?c2M3MUU1OHhYbmM4bG5NVWxkTTJaWGd0TnhJNkJwdlAwdmN5QUJVM3VuamlY?=
 =?utf-8?B?cDBTMkUyUForMmRhaVhLUDBmQ1lqcTh3SFpOOTBlMGpXcVVtM0hHMzZ1Skpv?=
 =?utf-8?B?SG5WT1RmcVR3NFFyU1FUNkhUdHp1ai9CU0phaC90bUMzeTZkczA5SGhjdW9S?=
 =?utf-8?B?ZGdWZXBtRzV1VVlCcTROTlJ4S0hGeGlLVmlnNWFQME5ES1JQaktRMHFFVWQ2?=
 =?utf-8?Q?wfCDNk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0d4WFhrZGdKZjlHNFVTTmFvcnhyait0QnNlQkFybXYwQmVSekhud1Z2QXFB?=
 =?utf-8?B?cEtTRzV5ZmZadUV4V09tSktIUkxKUTNVR0VsOFJJOEgrVGFsMTZjQndHTVhK?=
 =?utf-8?B?Qy9scUV0eS9tT2JZVEJSKzM3RVBpRWYydk5pblZOY2lCUGpJMnN1azNRcXpC?=
 =?utf-8?B?TnkzNjZ1R0dIMDNueTFiZnVVb0t2b1pwT0dmZWJqVWNBWGM3RWhlWWU5OUJt?=
 =?utf-8?B?OUZ5TW1jTmJUdXMvUUJSWkRyOU1NS1FMSlM3SUVRRWFuc3k2V0dYdUF3WWlS?=
 =?utf-8?B?NzNacitIQmpIUnFLWm9peUJCZE9OcU85Wnd4cTBuOUtHVXQ0S2toQUpLT2lS?=
 =?utf-8?B?dWFxdUx6aDdWWk5sZTIyRDhITzV5dkNsTEU3eDZGaDNpLzVIZGRXWFF0YmVR?=
 =?utf-8?B?SGxjODRHS253SU45bEZxaG9BMGc3RFRhS1VFRkRmT1V4N21SZkYxcmVLSklm?=
 =?utf-8?B?RG1ITlpLNVNCOVh6WWNTRG54UzJKSXd6ZjhWb2dla3I1UERKYjNzcSsyOXFR?=
 =?utf-8?B?YXB5Y2w4TjZpb2VUcDNMcC9zQzNUT3lWc1cwcnZaVDBZL3g2Z1k5bk9MSkZv?=
 =?utf-8?B?STREV2p4M3VxSHVjVzloRlBlcFdCRTZZR1NMUWhPYXdERFdORlNUU3dReFRO?=
 =?utf-8?B?UXlWNXVNRnYrNjVDN1J4RE5kdmloenJaMnVxd3U3aS9ud1hDWTUweXh1eGY0?=
 =?utf-8?B?Y1RzUk1TVUdwMEhiTGt0WDY2NndTa2J3WUIxZDhxRWIyM29wVVltaWJMa0NQ?=
 =?utf-8?B?d0IxZVZwaisrMUJlT0J5RDExSEVFNzRnUmJjQjRQd0prNWNmNU92NEl1TGpi?=
 =?utf-8?B?OVNHT0E4M1d5eDE1NCsrZGtpaHJtN2x5WUVzaUVXMXd6dHM2MkJRKzVhYXpq?=
 =?utf-8?B?UUVaU2NGcXhrQ245bTdLTEtrUFlwRXlKVmlmMGoxbVJDZ1JkSFpGNHgrOVU0?=
 =?utf-8?B?a3VzMTJncHhyNU5lTWpabkdzaE9qOENmL01aNGIzR0htdGdsNitjRlRrWHJp?=
 =?utf-8?B?VW81TEM2WkhRaXFjRWZ3ZEZ5NFhnMXBIeDZJR3VTZWV5ZkZlUzY1aXpqM0xr?=
 =?utf-8?B?WUczSk9jbmNKVzF4b0prWXFMNDZLV0twUXNVdWlBc25kMldTS2JXY0VzWjcw?=
 =?utf-8?B?Y3B5cG5tY1UwVk5tTnhMVkZQN0plQlRBeDI1aG5FNTk2anFrbTJkaVBsZ05t?=
 =?utf-8?B?dXM1SVVRZ3lvbFhwQmQweWdjVHJKTVp1OHNHTnIxYVNPdUZDdjdhbDh6Q1k1?=
 =?utf-8?B?OXYyeXVqcnVwVlJ3ay9hSTljeENOQ3NyQlo5QnkzRHZQT3ovTDJOUWNEdTA0?=
 =?utf-8?B?bnY2ZzgzWkxWNEtpNlpLbCtvSFFPVGtjZFQwaTJUMGV1eDhORjEyR0hEajNW?=
 =?utf-8?B?Vk5tb0tJZGlUcHpaZGJJY0VPUjRCdVg5b0pvNE9hd21JRzBmNFFCVkJpY1dK?=
 =?utf-8?B?ekN6b3gzZm5DRWU0NW5DRTMrNDdqK1dPakdoUk1XTGVqb0dETXUxZm0rU25D?=
 =?utf-8?B?M0k4VW9ZSW0vbTJ2K29CR1BaNG5tNndIRlJuTlpGUnBRSHgyM3JyZStqcWtL?=
 =?utf-8?B?ZC9WeEFPQ2dLTjdqV0JDYzQyMEdXeHl3SEpESE5NVThZVWVjWFUrOVBkWkZa?=
 =?utf-8?B?UExkU3hYdEQrUDB0WngvZDA2VDRWb3lacXFPRHN6RVVSOHZXNHFtMkZZQlJo?=
 =?utf-8?B?dFBQR3ZoYUhlR0FuS2U0N21TT0pEMXFXZXZaejRoWUlic0x4Z3RJUWRPb3hB?=
 =?utf-8?B?MzAxdFRjRXBNbXErU2NIZnpZMkhNa1JXazVpR0JyNXlEdFo2NTBzbW5xS0Vn?=
 =?utf-8?B?OVdYTm1QdmExd2EwWHYzWG9BdG50bDV0czBtNllxVEtYUm9KWmxhVHdqMlBj?=
 =?utf-8?B?UWp2Z2RZVzFleDdsUXRHQUdaMXJpVXpYOVhTUWtwKzZqVWFrQk9xWUEwL05O?=
 =?utf-8?B?aDgzTGNHUzZzUC9mWW1ocmVoOTFwa3VSMWtWRFVjNWlVL3JTRkxXb1BaSndn?=
 =?utf-8?B?WHRrK2VoN0V4RnB6ZUIxSnhYWnpnbjkram9LdGE0YmlIRjdoUWMydGplT3BP?=
 =?utf-8?B?VCsrT2pGckRlODhQNzdYTnhLczlDUWhJUVNRMzBmOU1JMExPdWc5ZWpRcnJH?=
 =?utf-8?Q?a7nAxC2/1l8EUkQMa7mzi06PS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8b9585-34de-4586-36bc-08de2dcf2b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 16:08:14.2443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uK3FQDbqsZKE10gEiFAbA6G9OwCow+WtkOv/TglB9xmzTpsA4XN4n0pAM3Mj0VtCSa9QYhWT6GOB1PvfXXA1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226846

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBIYXRsZSA8bWFy
ay5oYXRsZUBrZXJuZWwuY3Jhc2hpbmcub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MjcsIDIwMjUgMTY6NTINCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+OyBTdGV2ZQ0KPiBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNv
bT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXVtzY2FydGhnYXAgMTQvMjFdIGxpYi9vZS9nbzogZG9jdW1lbnQgbWFwX2Fy
Y2gsIGFuZCByYWlzZQ0KPiBhbiBlcnJvciBvbiB1bmtub3duIGFyY2hpdGVjdHVyZQ0KPiANCj4g
DQo+IA0KPiBPbiAxMS8yNy8yNSAxOjAwIEFNLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PG9wZW5lbWJlZGRlZC0NCj4gPj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhh
bGYgT2YgTWFyayBIYXRsZQ0KPiA+PiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjcsIDIwMjUg
MjowMg0KPiA+PiBUbzogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+OyBvcGVuZW1i
ZWRkZWQtDQo+ID4+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdW3NjYXJ0aGdhcCAxNC8yMV0gbGliL29lL2dvOiBkb2N1bWVudCBtYXBfYXJj
aCwgYW5kDQo+IHJhaXNlDQo+ID4+IGFuIGVycm9yIG9uIHVua25vd24gYXJjaGl0ZWN0dXJlDQo+
ID4+DQo+ID4+IEkgaGF2ZSBhIHBvc3NpYmxlIHdvcmthcm91bmQsIGZvciBtaWNyb2JsYXplLCBm
b3IgdGhpcy4NCj4gPj4NCj4gPj4gQmFzaWNhbGx5IGl0J3MgdG8gZm9yY2UgaW5jbHVkZSBhIGNs
YXNzIHRoYXQgZG9lczoNCj4gPj4NCj4gPj4gcHl0aG9uIF9fYW5vbnltb3VzKCkgew0KPiA+PiAg
ICAgICBpZiBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdnb2FyY2gnLCBkKToNCj4gPj4gICAgICAg
ICAgIGlmIGQuZ2V0VmFyKCdUQVJHRVRfQVJDSCcpIGluIFsnbWljcm9ibGF6ZScsICdtaWNyb2Js
YXplZWwnLA0KPiA+PiAnbWljcm9ibGF6ZWViJ106DQo+ID4+ICAgICAgICAgICAgICAgcmFpc2Ug
YmIucGFyc2UuU2tpcFJlY2lwZSgiR28gZG9lcyBub3Qgc3VwcG9ydCBtaWNyb2JsYXplLiIpDQo+
ID4+IH0NCj4gPj4NCj4gPj4gT24gMTEvMjYvMjUgNjo0MCBQTSwgTWFyayBIYXRsZSB3cm90ZToN
Cj4gPj4+IFRoaXMgcGF0Y2ggYnJlYWtzIE1pY3JvYmxhemUgZm9yIG1lLg0KPiA+Pj4NCj4gPj4+
IE1pY3JvYmxhemVlbCBpcyBub3QgaW4gdGhlIGxpc3Qgb2YgY291cnNlLCBidXQgZ28gZG9lc24n
dCBzdXBwb3J0IHRoaXMNCj4gYXJjaGl0ZWN0dXJlLg0KPiA+Pj4NCj4gPj4+IER1cmluZyBwYXJz
aW5nIG9mIHZhcmlvdXMgdGhpbmdzLCBpbnN0ZWFkIG9mIHRoZSBjb21wb25lbnQgbm90IGJlaW5n
DQo+IGF2YWlsYWJsZSBJDQo+ID4+PiBub3cgZ2V0IG1hbnkgbWFueSBsaW5lcyBzaW1pbGFyIHRv
Og0KPiA+Pj4NCj4gPj4+IFdBUk5JTkc6IDxyZWNpcGU+OiBFeGNlcHRpb24gZHVyaW5nIGJ1aWxk
X2RlcGVuZGVuY2llcyBmb3IgR09BUkNIDQo+ID4+PiBXQVJOSU5HOiA8cmVjaXBlPjogRXJyb3Ig
ZHVyaW5nIGZpbmFsaXplIG9mIDxtdWx0aWNvbmZpZz4NCj4gPj4+IEVSUk9SOiBFeHBhbnNpb25F
cnJvciBkdXJpbmcgcGFyc2luZyA8cmVjaXBlPg0KPiA+Pj4gYmIuZGF0YV9zbWFydC5FeGNlcHRp
b25FcnJvcjogRmFpbHVyZSBleHBhbmRpbmcgVEFSR0VUX0dPQVJDSCwNCj4gPj4gZXhwcmVzc2lv
biB3YXMNCj4gPj4+ICR7Z29fbWFwX2FyY2goZC5nZXRWYXIoJ1RBUkdFVF9BUkNIJyksIGQpfSB3
aGljaCB0cmlnZ2VyZWQgZXhjZXB0aW9uDQo+ID4+IEtleUVycm9yOg0KPiA+Pj4gJ0Nhbm5vdCBt
YXAgYXJjaGl0ZWN0dXJlIG1pY3JvYmxhemVlbCcNCj4gPj4+IFRoZSB2YXJpYWJsZSBkZXBlbmRl
bmN5IGNoYWluIGZvciB0aGUgZmFpbHVyZSBpczogVEFSR0VUX0dPQVJDSCAtPg0KPiBHT0FSQ0gN
Cj4gPj4+DQo+ID4+PiAoYXQgd2hpY2ggcG9pbnQgcGFyc2luZyBzdG9wcykNCj4gPj4+DQo+ID4+
PiBJIHNlZSBubyBvYnZpb3VzIHdheSBoZXJlIHRvIGFkZCBhbiBhcmNoaXRlY3R1cmUgdGhhdCBP
RS9Qb2t5IGRvZXMgbm90DQo+ID4+IHN1cHBvcnQsDQo+ID4+PiB3aGljaCBub3cgbWFrZXMgdGhp
cyBhIGhhcmQgZXJyb3IgZm9yIGFueSBhcmNoaXRlY3R1cmUgbm90IHN1cHBvcnRlZCBieSB0aGUN
Cj4gY29yZQ0KPiA+Pj4gb2YgT0UgYW5kL29yIGdvLiAgKGluIHRoZSBjYXNlIG9mIG1pY3JvYmxh
emUsIHJ1c3QgYW5kIGdvIGFyZSBsaWtlbHkgdG8gbmV2ZXINCj4gYmUNCj4gPj4+IHN1cHBvcnRl
ZC4gIFNvIHRoZXJlIGhhcyB0byBiZSBhIHdheSBmb3IgbWUgdG8gYXZvaWQgdGhlIHBhcnNlIGVy
cm9yIGluIHRoZXNlDQo+ID4+PiBjYXNlcy4pDQo+ID4NCj4gPiBPSywgdGhhdCdzIHVuZm9ydHVu
YXRlLg0KPiA+DQo+ID4gSG93ZXZlciB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IG5lZWRlZCBhIHJl
dmlldyB3aGVuIHB1c2hlZCB0byBtYXN0ZXIgYnJhbmNoDQo+IGhhbGYgYSB5ZWFyIGFnby4NCj4g
PiBUaGlzIGJhY2twb3J0IHRoZW4ganVzdCBtZWFucyB5b3Ugc2VlIGl0IGhhbGYgYSB5ZWFyIGFo
ZWFkIG9mIG1pZ3JhdGluZyB0byBuZXcNCj4gTFRTIHJlbGVhc2UuDQo+ID4NCj4gPiBQb3NzaWJs
eSBzdWJtaXQgYSByZXZlcnQgb3Igb3RoZXIgYWRhcHRhdGlvbiB0byBtYXN0ZXIgYnJhbmNoIGFu
ZCB3ZSBjYW4NCj4gYmFja3BvcnQgaXQgdGhlbiB0byBzY2FydGhnYXAgLg0KPiANCj4gSSBkbyBO
T1QgYmVsaWV2ZSB0aGlzIHNob3VsZCBiZSByZXZlcnRlZCBpbiBtYXN0ZXIuICBNYXN0ZXIgaXMg
ZGlmZmVyZW50IHRoZW4NCj4gc2NhcnRoZ2FwLCBhbmQgcGVyIG15IG90aGVyIHJlcGx5IHRvIFBl
dGVyIEtqZWxsZXJzdGVkdCBJIHRoaW5rIGl0IHNob3VsZCBiZQ0KPiBhZGp1c3RlZC4gIEknbSB3
aWxsaW5nIHRvIHRyeSB0byBzdWdnZXN0IHRoZSBhZGp1c3RtZW50cyB0byBtYXN0ZXIuDQo+IA0K
PiBJdCdzIHNjYXJ0aGdhcCB0aGF0IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgcmV2ZXJ0ZWQuICBJ
dCdzIGEgY2hhbmdlIGluIGJlaGF2aW9yDQo+IGZyb20gcHJpb3Igc2NhcnRoZ2FwIGFuZCBhYnNv
bHV0ZWx5IGJyb2tlIG15IGV4aXN0aW5nIChmdW5jdGlvbmFsKSBsYXllci4gIFdpdGgNCj4gdGhh
dCBzYWlkLCBJIGhhdmUgYSAnd29ya2Fyb3VuZCcgZm9yIGl0LCBidXQgaXQncyBnb2luZyB0byB0
YWtlIG1lIHRpbWUgdG8gUUENCj4gZXZlcnl0aGluZyBhbmQgZ2V0IGl0IGluIGZvciBteSBzY2Fy
dGhnYXAgdXNlcnMuDQo+IA0KPiBNeSBvYmplY3Rpb24gaXMgdG8gY2hhbmdpbmcgc3lzdGVtIGJl
aGF2aW9yIGluIHRoZSBMVFMsIG5vdGhpbmcgbW9yZSBpbiB0aGlzDQo+IGNhc2UuDQoNCk9LLCBu
byBwcm9ibGVtLCBJIGRvbuKAmXQgaW5zaXN0IG9uIHRoaXMgY29tbWl0IHRvIGJlIHByZXNlbnQg
aW4gc2NhcnRoZ2FwLCBJIG5lZWQgdGhlIG90aGVyIG9uZXMgZnJvbSB0YXQgc2VyaWVzIGZvciBw
cm9wZXIgZ29sYW5nIHRlc3RpbmcuDQpGZWVsIGZyZWUgdG8gc2VuZCBhIHJldmVydCBjb21taXQu
DQoNClBldGVyDQoNCj4gDQo+IC0tTWFyaw0KPiANCj4gPiBQZXRlcg0KPiA+DQo+ID4+Pg0KPiA+
Pj4gT24gMTEvMjIvMjUgNDoxNCBQTSwgU3RldmUgU2Frb21hbiB3cm90ZToNCj4gPj4+PiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gPj4+Pg0KPiA+Pj4+IEFkZCBh
IGNvbW1lbnQgZXhwbGFpbmluZyB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcyBhbmQgd2hlcmUgdGhl
IHZhbHVlcw0KPiA+Pj4+IGNvbWUgZnJvbS4NCj4gPj4+Pg0KPiA+Pj4+IElmIHRoZSBhcmNoaXRl
Y3R1cmUgaXNuJ3Qga25vdywgaW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZW1wdHkgc3RyaW5nDQo+
ID4+Pj4gd2hpY2ggY291bGQgZmFpbCBteXN0ZXJpb3VzbHksIHJhaXNlIGEgS2V5RXJyb3Igc28g
aXQgZmFpbHMgcXVpY2tseS4NCj4gPj4+Pg0KPiA+Pj4+IChGcm9tIE9FLUNvcmUgcmV2OiAwMjU0
MTRjMTYzMTliMDY4ZGYxY2Q3NTdhZDlhM2M5ODdhNmI4NzFkKQ0KPiA+Pj4+DQo+ID4+Pj4gU2ln
bmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+ID4+Pj4gU2ln
bmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNp
ZW1lbnMuY29tPg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNh
a29tYW4uY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgICBtZXRhL2xpYi9vZS9nby5weSB8IDYg
KysrKystDQo+ID4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS9nby5weSBi
L21ldGEvbGliL29lL2dvLnB5DQo+ID4+Pj4gaW5kZXggZGZkOTU3ZDE1Ny4uNDU1OWRjNjNiMiAx
MDA2NDQNCj4gPj4+PiAtLS0gYS9tZXRhL2xpYi9vZS9nby5weQ0KPiA+Pj4+ICsrKyBiL21ldGEv
bGliL29lL2dvLnB5DQo+ID4+Pj4gQEAgLTcsNiArNywxMCBAQA0KPiA+Pj4+ICAgICBpbXBvcnQg
cmUNCj4gPj4+Pg0KPiA+Pj4+ICAgICBkZWYgbWFwX2FyY2goYSk6DQo+ID4+Pj4gKyAgICAiIiIN
Cj4gPj4+PiArICAgIE1hcCBvdXIgYXJjaGl0ZWN0dXJlIG5hbWVzIHRvIEdvJ3MgR09BUkNIIG5h
bWVzLg0KPiA+Pj4+ICsgICAgU2VlDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxv
Yi9tYXN0ZXIvc3JjL2ludGVybmFsL3N5c2xpc3Qvc3lzbGlzdC5nbw0KPiA+PiBmb3IgdGhlIGNv
bXBsZXRlIGxpc3QuDQo+ID4+Pj4gKyAgICAiIiINCj4gPj4+PiAgICAgICAgIGlmIHJlLm1hdGNo
KCdpLjg2JywgYSk6DQo+ID4+Pj4gICAgICAgICAgICAgcmV0dXJuICczODYnDQo+ID4+Pj4gICAg
ICAgICBlbGlmIGEgPT0gJ3g4Nl82NCc6DQo+ID4+Pj4gQEAgLTMxLDQgKzM1LDQgQEAgZGVmIG1h
cF9hcmNoKGEpOg0KPiA+Pj4+ICAgICAgICAgICAgIHJldHVybiAncmlzY3Y2NCcNCj4gPj4+PiAg
ICAgICAgIGVsaWYgYSA9PSAnbG9vbmdhcmNoNjQnOg0KPiA+Pj4+ICAgICAgICAgICAgIHJldHVy
biAnbG9vbmc2NCcNCj4gPj4+PiAtICAgIHJldHVybiAnJw0KPiA+Pj4+ICsgICAgcmFpc2UgS2V5
RXJyb3IoZiJDYW5ub3QgbWFwIGFyY2hpdGVjdHVyZSB7YX0iKQ0KPiA+Pj4+DQo+ID4+Pj4NCj4g
Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+Pg0KPiA+
Pj4+DQo+ID4+Pj4NCj4gPj4+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+Pj4+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+Pj4+IFZp
ZXcvUmVwbHkgT25saW5lICgjMjI2ODI3KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjY4MjcNCj4gPj4+PiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTY0MzAxNDMvMzYxNjk0
OA0KPiA+Pj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4+Pj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+IFttYXJrLmhhdGxlQGtlcm5lbC5j
cmFzaGluZy5vcmddDQo+ID4+Pj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPj4+Pg0K

