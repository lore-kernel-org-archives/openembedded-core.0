Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB1FD1BDED
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 19:57:46 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.61])
 by mx.groups.io with SMTP id smtpd.web11.888.1730750256110441210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 11:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=RQZyERcv;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.61, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SetSC4NrhMM/YV3uFocJfi2Zrco3Yvl5+WQWwVE3MZ/TJavY5WfLl6hv2FQv0XP9JDRe8dURSZo5r6YPo/t3kADmY8Z8OVwUNFALdtWAh84H82JZn9MEVndNQyrmbl9Y/vh3F/oLDvDp2t/aGRZ0SCcNWQML1J2pd5jb9fUqlEQHmZemJZTIcU1GcwatjGXu5M0Fxxeh6olTySAQ79FnWXu5jqlVFSAC9RFjLySGqnthGrupPZPIJxiqA7mGVevq0ZVCRNcc/K2EIZFSADwO7VK294RoFSUisrLI+h0GYggK/6prpXUjUirHsKJUg9bZVu8VmVnncI+DO8meM0JEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tse9QxH1BJz7u8hSlfxwaJP7O4l9mVPhYMF8AelBmEs=;
 b=ldMiWabh55poVElztJqr63778W2GpjskadLaDICBVROlfsySZz55GQvLCE8OMfMuSO//4ZN7zDFMSx9rqXMXBb50jP9RpuuX1+GbD7lpDIUq6eS1mFO3spnGE4jRGIOhqW435X7KDwlfTEB1UYsXd7xdvSut6yAGW3CHkOa6AHRswJh11Z3BOFNhOWYV5fM8MCUa/THNOgN/QChUmwExMUIAohJd7qaqQHgh9qTW8pfDrudTsCyKfMiImzOWbMhQUMb6xr7QYZK9LEAH59fz7gZdn5m98KODckLkRRs6gyrS39lA9CdELKcb5jiJhAyVmY0RFl1zub9EEWADCHbikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tse9QxH1BJz7u8hSlfxwaJP7O4l9mVPhYMF8AelBmEs=;
 b=RQZyERcvdLw+hbRw/0jPvNloIB9v9RzoQO+CCV4iA9axta+eF1NHHaPgshUE8A+bJfIvAAZWaiz6airTg18BtkgZ1/LfG0TN40njG3XmsdfG/jbHRlspKA5SEdEZCK4kl5HGBSjGpD7esffCU5bNZkGp4lDVWlu1aVKsI82q9apbmceCvIFQWjZqLcaJ9GCMpYIfBKgh8uPeAiREDcZ+1178LoA4htR1rDtqjFjY/RJq1fZ8FZ+fyy/cuYD3egAQEyCJTD9hpgMnM8pDuGkppg3ZHhk2bnjVL5M2PJAtff1bDEo1SLHJEYcZufLyoyZA5HXF5FaTSezCInIU4pCAiw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:57:32 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8114.031; Mon, 4 Nov 2024
 19:57:32 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Topic: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Index: 
 AQHbLJWiyUBsTo4LGkWC2zMcqdySibKi2vWAgAATJVCAAB5AkIAAqcmAgAACVwCAA3sMUIAALk+AgAAKjqA=
Date: Mon, 4 Nov 2024 19:57:32 +0000
Message-ID: 
 <DM8PR12MB5430A540AB3CABA956D1CA888B512@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
		 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
		 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
	 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
	 <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
 <ae554f47fe13215139c6ea3cd88e5c8fdf29707f.camel@linuxfoundation.org>
In-Reply-To: 
 <ae554f47fe13215139c6ea3cd88e5c8fdf29707f.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=a144cc78-7eb1-4780-a9f4-cd574f501ee8;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-11-04T17:55:48Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|LV8PR12MB9109:EE_
x-ms-office365-filtering-correlation-id: 7c7368cd-1c21-43a4-5895-08dcfd0aebac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cjJCOUlzS0NtV2dZa1g3RENQY1lFVEtyZ3F0TFVJVHVQMjEwU2ZTcEliTXhl?=
 =?utf-8?B?QmdnWkNDWStEVUFxYzloRmZLeUZOWDM3eVNLTmcxbVpydkFxRHhuZ2hsclQy?=
 =?utf-8?B?YW1qdnB4aWxPNWNtbTdza1pKRlVObEhUVm9ZU3FKb2tWZUVqZlBPTW80QjBu?=
 =?utf-8?B?czExeUdvbVN0SEkvRk5oZi9wMkVEZGxnRXBrcHlpVlp1YU53dE11QjBoWTVh?=
 =?utf-8?B?Q2N2bWpaaXU5WDFZdWVOQlZaOW1haU9qeU92Si9CS2hQWlpWS3IxcXgzdm1m?=
 =?utf-8?B?aFoxcWhHVFQ3MzB0Y2g3aWVaNXlWWVNPVHNQUHNQWXhaRk5WTlRNMGRDNkl3?=
 =?utf-8?B?TmVTZjRuOWpNbW9MRmczb0UxTXBseVZFY1BwRFgydVFLcExDOTNhMjNmay9G?=
 =?utf-8?B?Q1hOaWg3OEpDYmFOV1paOSthNXNyMkdZV1BPVGpDNnNJLysxd2lRbXlYaHZW?=
 =?utf-8?B?YjFVeC84MlhKUHl3MUR3SnhKL1BmZGxURzFyM0JsWkdkai81eEdNK21jM295?=
 =?utf-8?B?WG9FbUNkb1NTZDBFRlNMUjVkdU9TR29PRnIyTjE2MXMxNi9rdUhHZDZ5c0VT?=
 =?utf-8?B?YVgwNXVDZ3J4OUlJQ1BFazdNZ2RKTnNUenFoam50eUpWclZLcHhDaitZdFFr?=
 =?utf-8?B?eEs2VWhidDZBaFdUVStjM1g0NzBMZjhGeFQwN1dzTGh3aG5yNkhzSVp4K2lu?=
 =?utf-8?B?RzBaaGNac000SFNQeldwSXFKZVlaSzRiYStEdWhFU3VEQ1B0cnFwbmdzRkFn?=
 =?utf-8?B?YThnZitXRm9GSEtZUjc2bXBmYTQ0UEdZeXZkMmJDL0p1eHJ6Y1crNlhxNE94?=
 =?utf-8?B?VjQ3bmpOblk1emRQTjlNSzV3eW9qL2c0ZmxnMHpFTWNBVkNGMGNyRUlQcVFw?=
 =?utf-8?B?Q3ZBMFhKaHNSc2Qyem1aQ21PZHdxYmhTMXA5UlN1OXdjbWRrc3hVc09CY25U?=
 =?utf-8?B?ZElseWMrTS9hRkpYL2hId2tiTHo2RGttZHdHMWlFQjExZ05obzk1ZGVIMW45?=
 =?utf-8?B?d2xvWFhXeFBZbGViLyswVnZiS3U0THZnT1RHemcvTGhUa3FMdHk1OGpzVEw1?=
 =?utf-8?B?dUxHTGpRa0tqSEhJdGFrVm96K3NCTFBCTllTTUNNamFrb1RLUTRuRCttZTNp?=
 =?utf-8?B?aHpVcGRWelJ6bUhxSithc3gyZTVXS3V3VStWKzR4bEVnZFlSQ1pMeHBQbXZn?=
 =?utf-8?B?SHNOUGdkMEhrOEJGaTZ0L1plamtqLy8zcGhOMmJIR0laK2ZIOWkxM1pqYXB3?=
 =?utf-8?B?ZloveDd6dFV2SjVyLy94NkdwMGtHbC9aUE4vRm5pTFJJckZNazV6dDFjOXNN?=
 =?utf-8?B?NjJQdDNBazRzQUlvWURZVTNHSlRDRGJzZUtBUCtPcXArVDJKVjZBc0FvWVo5?=
 =?utf-8?B?UlBLL1RSU1h5UW52eUhtNy9BWSttZE5rclpWL3o0ZXlBK1JJeTd5NzFDUjNw?=
 =?utf-8?B?b2RLa21wZ29XMVNQcTBybVo0d0VUTzZBWEhnVkxCWlMrY1daMWlRRmtid2tx?=
 =?utf-8?B?eHRkNWlLNGFrWnZNL0NmMERnNUVkYk5oVlNKQUxheGlrWCtwRUNPWDAxL3RV?=
 =?utf-8?B?QjEzS25MVDhYUjJLYVcrZXY3WlFDZ3Z4TlVGRFVjREJWZ2dtdmJkNUl6M2Q1?=
 =?utf-8?B?aGtkZGxxZHhyUFRyM2pWTnM1eUpYSjJ2NUFTb1BXUWZmOTVkalMzbVphWE5W?=
 =?utf-8?B?WlpzRHMrSjFGdjBNMVdRZVZqZll5TVc5dVVLZU5iaS8vbkE3T3NUb0tSSWNz?=
 =?utf-8?Q?a51ofE/rDl8dDSrHJAcTITbpaRBIf++IR5FVJB3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVpKWnBLc214bDloVXhtdGk5RC9KN0dZOVhCbno4WTlmTWorSzZLVkNEZGZ3?=
 =?utf-8?B?OTdGWFZ6OHVlcGVJZ3cxd09weGRaeUFlZWpVcjMzbEExbWp4eUdKdUNPRDhW?=
 =?utf-8?B?MDc5TVliVU1iYWo0NkdPTVQ5ckVBQlo0MSsyTmxVaGlSZkFGNHhMd09RczN4?=
 =?utf-8?B?L2xyRzh6azMvWFA5aXdWbWM5aVBuWVRjYlcyb2ozY0grdVczK3M0MGdHYWo1?=
 =?utf-8?B?V3Q0K04vYWVZQ0wwMCtkaEVEVDQwQmE5eldkejIwaGxBQWRWajBKbFFUSXZW?=
 =?utf-8?B?cHlNTkFBTGYrQUVUU2dFcjJ2WmhMRXp2bDRTWnMwZy9HbGw0Q2xiblNuM0ZS?=
 =?utf-8?B?dnFpS0toeHBOYTE5WkpHbVdhNTVnWXBjaktETWkvaGh4MlFnZzRsZVlOd1hx?=
 =?utf-8?B?VFpZWHllNDZYcU1CRm16a25SdHhqNkFLZmxZRlU3cVNQa2NML0pxZ0xKUTBa?=
 =?utf-8?B?Wk9kNlMvNmh4QzZjaXBSY1U2T1ZQSkt3bzJnblNGL2xmUlhEQUhmRHllWFRt?=
 =?utf-8?B?eHRLclpoRWUrdVgxV0NaOUdQYk5nNFFsZUpGTDRBU3FWbUVTZ3o2Rjc5Z2JH?=
 =?utf-8?B?YkpVbXlGa1JJYXBTS3lSR0w5VDZJYXB5cUY0YXB1QTZZcDVuL1JWSnhmT29r?=
 =?utf-8?B?cG1Pb2laTG9Qc0R3TVdOZXpOWUdlSmc1Tm5ZQWJUMjVVQTRkMmdOVlowcE9C?=
 =?utf-8?B?aGFDblkyR29IRTl4MExLaVpNQkgyQWRta2UwcUJUQkdVTG9Jc243aEhoeHZ2?=
 =?utf-8?B?b3ZTd0JCZFRBZjh1eFZHYTFtaXBGY0ExSEl2N3ZFUW9zV214QXhUcGhBWWFo?=
 =?utf-8?B?SEhlQXdQc01LbkxhQkZwem1INjRLMG53dW9yUVV2ZEd4Tm96SUJWNlQ2K0hW?=
 =?utf-8?B?ZWRKRDEvT21SQXo0QWtPZEFNTDlSM04veXNYRGN0MWlFRGN0YU04QU4wTjhD?=
 =?utf-8?B?UnNOV1FaYzFtNXV4clFXcFRjMmdqWDByRDk3U2ROK2RLUHY3cktsSGVWcHBO?=
 =?utf-8?B?c08xWXdZdUF5TjRob1cxdE52WFVsWHYyYlp5bTFEQVV0bXVMOTRzczU0RC9T?=
 =?utf-8?B?bmFVQ0R6cW9TcU0xaTJZSWJQNitta05WWWFSN21nOTNHQlFhWWtlMmV1Szkw?=
 =?utf-8?B?VXg2QWE5ZE1qOUxvK3dUUHB3ano3d2VYZWdyd0UyZnlFdW85Q0ozNTZ1ZHBJ?=
 =?utf-8?B?WVhUTlR3OEJldzVoQm8yblJPK3NzT2ZGMUhibUgrem1TZmZSZ0tzeG1yN3BQ?=
 =?utf-8?B?TFZtR01iME04Y3VqeTZpMmZjNVJXeXNJc2RYZGV5L0NaQXhacStuTE9jTWti?=
 =?utf-8?B?N08ydHpKeTEvN09SaUtqb3BTeG1rOXpROThmeDNJN3c2R1NUODFwYkxTR3VD?=
 =?utf-8?B?Z0ovTlpady9oUmFhanpLa3ZIZGVYZ2ZnMGlFSldQRTg1TzM1cmQzclNsZ2NG?=
 =?utf-8?B?OG1ubVpuSlJyclFkcWFFYUxLSlNxeW5nampvak1LU1ZPdEFpMU5CM1MrbEUr?=
 =?utf-8?B?Y0JldjdDZ3F2TkpudlBFSUlSdzlpSVR0aHhEbktiSmZQc3g5WVV3ODhoU0x5?=
 =?utf-8?B?NEtwK3BLdnhpejY4Z2RsM1NGS1RuMVRuRzVISzFLZFBhUXdmUzNRRWpGb0Fo?=
 =?utf-8?B?SDlqejEvaE95OUQxQk04L291MVBjNHQ3aW1nQUo1dWwrVU5OamROWit2dENW?=
 =?utf-8?B?Y05aVGRJcVo0OHAxZnJXRXVYMDdrS3lyRm1CR2pZMzVlczNUYmpOZ01yTDNQ?=
 =?utf-8?B?WDRDbzhKR1ZFRFlqZjBsWVR2eDBFS2ovL0x6eUJwVm5hYXQxSEpOSEl2ZXlE?=
 =?utf-8?B?Rjd2THpDQ2NsL2N5S2owNHFwWFhvei8rU1h4ckhaaUtCb1ZlN09MOFhxcEU3?=
 =?utf-8?B?eE1CWklCVzRuaG9nRjJTSXoyQkVCZkZUOElNRWNKN2U4RnZ3MnJ2SmxIVGVV?=
 =?utf-8?B?V3lmWllZSXdRc2NvbWc2ZTBjQ1dGc3RES1FEbVpjaXBta1d3NnhoWmRUOVF1?=
 =?utf-8?B?c1pLOXdxditHZldXamU1WksvM2Q2bWpydnNoK2NYM2lRMzk1Kzl4bExld0lU?=
 =?utf-8?B?RzlpYlBsVUdYc3J4NmNDRGoxOGhmendFald2UjljRmMvRUEzbHcxUGFjekND?=
 =?utf-8?Q?ZGgfB5MvIw6bhvkwVoywjh4bx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7368cd-1c21-43a4-5895-08dcfd0aebac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 19:57:32.4648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCS+sormRv+/13QEfAtOVWaXnY5rv1br4dEo7so4rivY5+tCnyP1btRihp0JqnidmNQFEvKuxRRcbTcJwTNw28s2RP+jA5yJvENDWLU7Zm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 19:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206693

SGkgUmljaGFyZCwNCg0KPiA+IEludGVybmFsbHksIG15IGV4cGVyaWVuY2UgaGFzIGJlZW4gdGhh
dCB1c2VycyBkbyBub3Qgbm90aWNlIHRoZQ0KPiA+ICdkZXZ0b29sJyBicmFuY2ggaGFzIGJlZW4g
Y2hlY2tlZCBvdXQuIFRoZXkgZ28gdG8gcHVzaCB0aGVpciBjaGFuZ2VzDQo+ID4gYW5kIGVuZCB1
cCBjcmVhdGluZyBhIGJpemFycmUgJ2RldnRvb2wnIGJyYW5jaCBvbiB0aGUgcmVtb3RlLCB3aGlj
aA0KPiA+IG9idmlvdXNseSBkb2VzbuKAmXQgZ2V0IHBpY2tlZCB1cCBieSBvdXIgYnVpbGQuDQo+
ID4NCj4gPiBJbiB0aGUgY2FzZSBvZiBBVVRPUkVWIHdpdGhvdXQgYW55IGxvY2FsIHBhdGNoZXMs
IEknZCBhcmd1ZSB0aGF0IGJ5DQo+ID4gZGVmYXVsdCAnZGV2dG9vbCBtb2RpZnknIHNob3VsZCBj
aGVja291dCB0aGUgYnJhbmNoIGZyb20gU1JDX1VSSS4gV2UNCj4gPiBjb3VsZCBhZGQgYSBmbGFn
IHRvIG92ZXJyaWRlIHRoYXQgYmVoYXZpb3IgKGUuZy4gLWQpLCBvciBhbHRlcm5hdGl2ZWx5DQo+
ID4gaGludCB0byB0aGUgdXNlciB0aGV5IGNhbiBwYXNzICctLWJyYW5jaCBkZXZ0b29sJy4NCj4g
Pg0KPiA+IFdvdWxkIHdlIGJlIE9LIHdpdGggdGhpcz8gSWYgd2UncmUgd29ycmllZCBhYm91dCBp
dCBicmVha2luZyBiYWNrd2FyZHMNCj4gPiBjb21wYXRpYmlsaXR5LCB0aGVuIEkgd291bGQgcHJl
ZmVyIHRvIGhhdmUgYW4gZXNjYXBlIGhhdGNoIChsaWtlDQo+ID4gREVWVE9PTF9QUkVGRVJfQlJB
TkNIKSB0aGF0IEkgY2FuIHVzZSB0byBvcHQtaW4gdG8gdGhlIG5ldyBiZWhhdmlvci4NCj4gDQo+
IFRoZXJlIGFyZSBhIGZldyBjb25mbGljdGluZyB0aGluZ3MgaGVyZS4gV2UndmUgdHJpZWQgdG8g
bWFrZSBkZXZ0b29sIG1vZGlmeQ0KPiBiZWhhdmUgdGhlIHNhbWUgd2hldGhlciBpdCBvcGVyYXRl
cyBvbiBzb21ldGhpbmcgc291cmNlIGNvbnRyb2wgYmFzZWQgb3INCj4gdGFyYmFsbCBiYXNlZCwg
aW4gYm90aCBjYXNlcyB3aXRoIGFuZCB3aXRob3V0IHBhdGNoZXMgb3IgYWRkaXRpb25hbCBjb25m
aWcvZGF0YQ0KPiBmaWxlcy4gVGhhdCBpcyBhIGdvb2QgdGhpbmcgaW4gZ2VuZXJhbCBidXQgSSBj
YW4gc2VlIGhvdyBpbiB0aGlzIGNhc2UgaXQgZG9lc24ndCBkbw0KPiB3aGF0IHRoZSB1c2VyIHdv
dWxkIGxpa2UuDQo+IA0KPiBIb3cgY2xlYXJseSBpcyBkZXZ0b29sIHNheWluZyB3aGF0IGl0IGlz
IGRvaW5nPyBJcyB0aGUgdXNlciBiZWluZyB0b2xkIHRoYXQgYQ0KPiAiZGV2dG9vbCIgYnJhbmNo
IGlzIGJlaW5nIGNyZWF0ZWQgdG8gaG9sZCB0aGVpciBjaGFuZ2VzPw0KDQpDdXJyZW50bHksICdk
ZXZ0b29sIG1vZGlmeScgZG9lc27igJl0IHNheSBhbnl0aGluZyBhYm91dCBjcmVhdGluZyB0aGUg
J2RldnRvb2wnIGJyYW5jaC4gSXQganVzdCBzYXlzOg0KDQpJTkZPOiBTb3VyY2UgdHJlZSBleHRy
YWN0ZWQgdG8gL3doZXJldmVyDQpJTkZPOiBSZWNpcGUgPHJlY2lwZT4gbm93IHNldCB1cCB0byBi
dWlsZCBmcm9tIC93aGVyZXZlcg0KDQo+IEl0IGlzbid0IHVucmVhc29uYWJsZSB0byBob2xkIG91
ciBsb2NhbCBjaGFuZ2VzIG9uIHRoZSBiYXNpcyB0aGF0IHRoZSB1c2VyIHdhbnRzDQo+IHRvIHdy
aXRlIHRoZW0gYmFjayBpbnRvIHRoZSByZWNpcGUgc28gdGhlIHRvb2wgZG9lcyByZWFsbHkgbmVl
ZCBhIHdheSB0byB0cmFjaw0KPiB0aGF0Lg0KPiANCj4gSSB0aGluayBVSSBwZW9wbGUgbG9va2lu
ZyBhdCB0aGlzIGZyb20gdGhlIGJpZ2dlciBwZXJzcGVjdGl2ZSB3b3VsZCBjb25zaWRlciB0aGUN
Cj4gYmVoYXZpb3VyIGNoYW5naW5nIGRlcGVuZGluZyBvbiBjb250ZXh0IHRvIGJlIGNvbmZ1c2lu
ZyBhbmQgcGVyaGFwcyB0aGUgcmVhbA0KPiBpc3N1ZSBpcyB3ZSdyZSBub3QgdGVsbGluZyB0aGUg
dXNlciB3aGF0IGlzIGdvaW5nIG9uIChwZXJoYXBzIHdpdGggc29tZSBkZXRhaWwgb24NCj4gKndo
eSogaW4gdGhlIGRvY3MgdG9vKT8NCj4gDQo+IEknbSBub3Qgd29ycmllZCBhYm91dCBicmVha2lu
ZyBjb21wYXRpYmlsaXR5LCBJJ20gd29ycmllZCBhYm91dCBtYWtpbmcgdGhlDQo+IGV4cGVyaWVu
Y2UgaW5jb25zaXN0ZW50LiBBIG5ldyBtYWdpYyBjb25maWcgb3B0aW9uIGRvZXNuJ3QgcmVhbGx5
IG1ha2UgbWUgZmVlbA0KPiB0aGF0IG11Y2ggaGFwcGllciwgaXQganVzdCBmb3JrcyBvdXIgVUkg
aW50byB0d28gc3RyZWFtcyBtYWtpbmcgdGhpbmdzIGdlbmVyYWxseQ0KPiBtb3JlIGNvbmZ1c2lu
ZyB0byB1c2VycyA6KC4NCg0KRnJvbSBteSBQT1YsIGl0IGtpbmQgb2YgbWFrZXMgc2Vuc2UgdG8g
aGF2ZSBzbGlnaHRseSBkaWZmZXJlbnQgVUkgYmVoYXZpb3JzLCBzaW5jZSBJIHNlZSBhdCBsZWFz
dCB0d28gZGlmZmVyZW50IHR5cGVzIG9mIGRldnRvb2wgdXNlcnM6DQoNCjEuIExheWVyIG1haW50
YWluZXJzIChsaWtlIG15c2VsZikgd2hvIGNhcmUgYWJvdXQgY3JlYXRpbmcgcGF0Y2hlcyBmb3Ig
dXBzdHJlYW0gc29mdHdhcmUgdGhhdCB3ZSBwcm9iYWJseSBkb24ndCBjb250cm9sLg0KMi4gRGV2
ZWxvcGVycyAobW9zdCBvZiBteSBjb2xsZWFndWVzKSB3aG8gdXNlICdkZXZ0b29sJyBhcyBhIGNv
bnZlbmllbmNlIHRvIHRlc3QgYW5kIGRldmVsb3AgY2hhbmdlcyB0byBvdXIgY2xvc2VkLXNvdXJj
ZSBjb21wb25lbnRzLiBUaGVzZSBhcmUgb3VyIEFVVE9SRVYgcmVjaXBlcy4gU29tZSAobW9zdD8p
IG9mIHRoZXNlIHVzZXJzIHByb2JhYmx5IGRvbid0IGtub3cgYWJvdXQgZGV2dG9vbCdzIHBhdGNo
aW5nIGZ1bmN0aW9uYWxpdHksIGJ1dCB0aGF0J3MgZmluZSBzaW5jZSB0aGV5IGRvbid0IG5lZWQg
aXQuDQoNClNvIHRvIG1lIGl0IG1ha2VzIHNlbnNlIHRoYXQgdGhlIFVJIG1pZ2h0IGJlIGEgbGl0
dGxlIGRpZmZlcmVudCBmb3IgdGhlc2UgY2FzZXMuIA0KDQpUaGF0IGJlaW5nIHNhaWQsIEkgdW5k
ZXJzdGFuZCBpZiB3ZSBkb24ndCB3YW50IHRvIGZyYWN0dXJlIHRoZSBVSS4gSSdtIHBlcmZlY3Rs
eSBoYXBweSB0byBjb250aW51ZSBtb2RpZnlpbmcgb3VyIGZvcmsgb2YgcG9reSBpZiB0aGF0J3Mg
dGhlIGNhc2UgOikuDQoNCj4gQXMgd2VsbCBhcyBtYWtpbmcgZGV2dG9vbCBjbGVhcmx5IHRlbGwg
dGhlIHVzZXIgd2hhdCBpdCBpcyBkb2luZywgY291bGQgd2Ugc2V0IHVwDQo+IHRoZSByZW1vdGVz
IGluIHRoZSBnaXQgcmVwb3Mgc28gdGhhdCBwdXNoZXMgZGlkIHRoZSBleHBlY3RlZCB0aGluZyBp
bnN0ZWFkIChpLmUuDQo+IG1hcCBkZXZ0b29sIGJhY2sgdG8gbWFzdGVyL21haW4vd2hhdGV2ZXIp
Pw0KDQpJIHRoaW5rIHRyeWluZyB0byBiZSBjcmFmdHkgd2l0aCByZW1vdGVzIGlzIGdvaW5nIHRv
IGJlIGV2ZW4gbW9yZSBjb25mdXNpbmcgdG8gdXNlcnMuIFdoYXQgSSBjb3VsZCAqbWF5YmUqIHNl
ZSBkb2luZyBpcyB0aW5rZXJpbmcgd2l0aCBzb21lIGdpdCBob29rcyAoaHR0cHM6Ly9naXQtc2Nt
LmNvbS9ib29rL21zL3YyL0N1c3RvbWl6aW5nLUdpdC1HaXQtSG9va3MpIHRvIHdhcm4gb3IgbnVk
Z2UgdGhlIHVzZXIgc29tZWhvdy4gRXZlbiB0aGF0IEkgZmVhciBpcyBub3Qgd29ydGggdGhlIGNv
bXBsaWNhdGlvbnMuDQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=

