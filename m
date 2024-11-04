Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765F7D132DA
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:56:33 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.60])
 by mx.groups.io with SMTP id smtpd.web11.59355.1730732191258841030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=eY8jVely;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.60, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qnh9zQrUQIgX0jY1PSIfIyQXceiWlX+FSGz6sKmTRHFm6hCfJSQqF2h/N9XGDnHbjFdBa3oq5CoIef283S+m0bCcZExmOMajAMs9EJC0TBNPHF3fP6SQXzPPeFstqtue6QJtRNvdxjqK5a0ykCeLnnyAH3itrdHQyPtnRkhvNkVLPdHAkDq3OlPXbLlVKj+IhXPjLoJ6YfXynqjlnK3pCkoW04gmyIlBE03LrFIjIkCzYejqIheanJ4VBpxRXtXbJczQYPASz9YGPE6iXrUlbszyRiroPcSO/4NFgAzuVrzLE63IrRdvohzMxZK9dSX7ga63FYO61oiRC/g545uS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtexjD3bUAxXYux9Fbmq6kqp6Ab4W7wwGVzGEPB1Xnk=;
 b=l7uBewYJa0Amg6ZfA69NXwqQhmwbkcEY4RFrvioEJZkaq5mXBk32gEdOvUwQI4zfkaUVOFU873yGuxtfJ4SveNqRUqsoo7QDcTcuN7OejifoOF0ZgD2XTJyTeFFUWcP3513lwORQsCyCWNLfJ8zqVa8svkvTkXLaT98IPsQqWO2OZh3Hbesb9n/HEUuM9IPBcGxWS8kvMlqYG/+b4bkXHQQb3r+ubGBpZiJXLTR15Uh/o66G1FGPiApg6gEPY0XVmGgWX5ltai0wAu6ma/ae3mv4kPJ0PObVz/qG/u1I3AuRiCqJxe2W09twhRkb2FwZOi9wOvGXtJfv6ZVrB9sAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtexjD3bUAxXYux9Fbmq6kqp6Ab4W7wwGVzGEPB1Xnk=;
 b=eY8jVelybS2ZYxAu7F00ueIExu0/S5yPUm326Ff5we5kRHLxzdVegI2IC13x13KzbSecZoiklOxP9wTtLW/9bSMxcMKSAyMI7fN9ipSnpfGrvQSQ0S2wDnmVAzAwALA2YH0Pj6jN8C+0R6I6PgYLDFzsvzRQbkZuYxMMqtr49iYt//BM45JaP4LO6X6AD9+F5axnCK6imbebKVCpTFMZDZtxLMxzR2lwjJPOqUPes2CIcnAj0hryoslvsAsDufdThshoqp36L1L//zZ6GYI6LwlhdgH8a14s32Lnd179CZWtWmuZr9ZV0wtpFJ2oF0HQDvuSNwKF+FFLBNgvVTaDag==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.31; Mon, 4 Nov 2024 14:56:27 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8114.031; Mon, 4 Nov 2024
 14:56:27 +0000
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
 AQHbLJWiyUBsTo4LGkWC2zMcqdySibKi2vWAgAATJVCAAB5AkIAAqcmAgAACVwCAA3sMUA==
Date: Mon, 4 Nov 2024 14:56:26 +0000
Message-ID: 
 <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
	 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
	 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
In-Reply-To: 
 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=32a531e3-e3a0-4c18-b430-f2d1a119b71e;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-11-04T14:32:17Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CY8PR12MB7337:EE_
x-ms-office365-filtering-correlation-id: 4e099c16-06e8-430e-9edf-08dcfce0dbcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MzlVK2wzUUMvZk4zQ1FXdjVoL0dXVkEzWC9LUTNiTnJlZlM3L3pyQWwyamZn?=
 =?utf-8?B?TGxWcWVtVDdONE9PYUhhQ2dCQ3EvcnVWc1JPVHFuaXE5NW01U0syRmFtNEpi?=
 =?utf-8?B?QVlKYWtTb0EwYlNJemFaZEFiRmZBcFA5QWJFckszNlJkZkRsNnlxeGw5cXlv?=
 =?utf-8?B?OWNPRER0TjNZOHh4TWhnQkpXc3c1YXBZK3RMbHhjYWtZY2dDSFhpTHZZdG10?=
 =?utf-8?B?OENmSENuSWhGNjVxZ2xYUy8wMFhzZWozYTVjN1JhZUIybnE1b2k4cEdSbzUx?=
 =?utf-8?B?NU5xYWtobmxmdTgrVm40czVjRU9RbE9mb1p2Vjg2WXNETGtWUjFaeWVMdjZC?=
 =?utf-8?B?L1d5T1FVODVQWG52TnE1RytjUlZrRTNKQUFNMkY1ZnJhaDFLYUhHZks2RjQv?=
 =?utf-8?B?aFZYTXRYS3N1QS91N3BBdmltTks2UGtHazZWTnFENHlURFJldGlvTCthRXQx?=
 =?utf-8?B?TDcrbXhoRzZJODZhRlFBVzlrSjJOYXNNZTJJZFRDRXVtc1I2U2x1RzJrbCtW?=
 =?utf-8?B?YnYzL0VkV2lnY1l1M3ozUjZmRXUrdnF4dUU3NW9TWmUxYkNGM1ZIamRKSHdv?=
 =?utf-8?B?UGRlTlU1OHZabzYvelkwZGIydHhzcDQ1azgwV0VqY2lvUHBWQmlmblBVd0tW?=
 =?utf-8?B?UkFtQ1pNWFphMkEycVM4QU5qV2NQN1B3a0tWY1JKTWZWSmFvRDJ0MmoxWEVr?=
 =?utf-8?B?NFJVK1ZNSWVOUkw4emZoWHpnUWQrdmtLeWx5VVhBazVDcUZTaUtvUElGZ1Zn?=
 =?utf-8?B?c2NGMWV1a3lLTk5CRjRTTHRjQTg3U2NodHYvUWRMTms1emUwMzFiSlhlZE9v?=
 =?utf-8?B?NUlCSzJSWklXYTloMlF0MHBOV3NzTGJRRnBEbUpNUWV6NlpScVJLaUZjdDE3?=
 =?utf-8?B?WUJyQ2dtTk1hZzA5UVlGNXB0WW82Mk93bG5NT0R6YWhsY0Y4UUxpT2dzaUQx?=
 =?utf-8?B?dFBKb3ovcWtpamovbGpzM3RibkljTDV6U1hqcGZaTys5YmdiQ1BTVnZuMVVX?=
 =?utf-8?B?TlVMNS9XaXdrSkZtMzJlSVhPTWhDcVV2cDRJUG1maXBjYmRxMEZqZlZsa3M1?=
 =?utf-8?B?dTB3cy95Z2dpVzZzbWdlaHZRbldEYUdUVFRaYVNTVVZkaU9yeVdlaWFUUnhO?=
 =?utf-8?B?WFBLamdjemMzY0ZjSmdWZjUzMGVuTFU3WFNCcFdjaEVKbDBPZitVb05GbjZO?=
 =?utf-8?B?b1NzTFF3U3VtTkkyZUFKRmErY3g3K29zcFFBaHBkMnNiVVZQejF0cytQVFVP?=
 =?utf-8?B?MHhpbjIxeFZNazhOVzdrRmVqSFRHR3F1ZUlvWWF0Qzk5UjZHU05zTGdyT2U4?=
 =?utf-8?B?YnZLL2NtQ3NjdEpYZHdHdWFhMkp5cXMrMkFTdThheGtJSmxneURNbGhna1d4?=
 =?utf-8?B?QmY0RVJlRERnRFFEZ2Rra2RrMk5zUlN4RlZxWWwvdjBXOUhBY0xxTy9Pd1ZF?=
 =?utf-8?B?QldmSjduTUlHaXlXV2owMTNEVVhGVjhBSEJYVzVJN2RvYnc2TExQYTM5S2Vy?=
 =?utf-8?B?OG9rK3JNSXg2L0IwUnR1b3NXcDVnQ0txY2J0dEpSNDZ6a2UrNWlaWEhuVGRK?=
 =?utf-8?B?Rm4xR0krS1RKT2ZwcjQveEtoaHRrM0htY0R0Smp0VE0xbTJuWU9XeVE4TDMz?=
 =?utf-8?B?R1pGTnFrS0tFeUZlbVVVaEhhM09oMWhxVzcyaVhneUxoTStDZE1MM01RSTJ4?=
 =?utf-8?B?UlNlSmp6cDlERVBKZ2h1ZlQrOUhJaTRGaHVMTlAzSkNYc3ZCTnRDSFFqaytU?=
 =?utf-8?B?dkhEU3NoUVFwVVFoZkozSGtTS3A4KzA0M3dKaTVmcUtwV2gwWmpaSXltMjB4?=
 =?utf-8?Q?adzsJ3shsoZy2jiVbvfO5ri3GnoRS0bUQYYQE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzhTaXdKekJpd1ZYYUtLek1RaUs3ZjhwRXFQUmIwNTZqOUhhZmF6Q3pmY0t6?=
 =?utf-8?B?Nm9nMnUwaFlHa3pwSDIySURIZ3QrUyt1S3luVUdNTXBBdFpJRi9lZldrMmVa?=
 =?utf-8?B?NndzcGNmRjFWTUNmWEdJbDF4ZTVVMFpvdk52RVduNUxQMnltQVlEaWVmNWhE?=
 =?utf-8?B?dERJbkZtd2xNWjFrVEVoNktqQkpScitHUTJ5b2RmNEZWc3lXemY5enIwb3Q2?=
 =?utf-8?B?QnJWcWNaeVlwWDUwRG1TWjdRRld5eWJCY1d0TjB5S3BkbTI2SXBnQ1BOWjN5?=
 =?utf-8?B?SWFKZEp2TVByd0RaR3NCVDAyOG8xcDZwYzZuQUNyQ2VaaFlLM3loU2l2UVpC?=
 =?utf-8?B?cGI5bkYrNmdUdElTMW9WdnB4VlRvNUhMcVRybkFWSHpodytYNjNlQXBucFUr?=
 =?utf-8?B?bFV5eFkwUDhnS05LOHBPREFqbys1QmVoQ2dqVFNyS0Rydzc4cmM1T0diZWJs?=
 =?utf-8?B?TEkxRHFRQTh1cHhpQmJkWk9QRGxIVW5zcGk3VnNtaTFPcE9SQnlZYlRwYzdl?=
 =?utf-8?B?b3VRRFNBT3FRRmFrWjZHaExCL3hBdldGdGNML1hlVlVMRTIzcm1uU09oQ0da?=
 =?utf-8?B?ZXpRR1lWN2xXdG10VUpmUDcycWx6K3NGTVVjMGlZVnpzQmgwS20wSm5PRFp6?=
 =?utf-8?B?dlVLQzdmTGFjS1FSYmlvemtwcXZ3OGJHblYxRy9lTUVKby9JMlFCZ09QZUpZ?=
 =?utf-8?B?K1VOZTVPa3drbllKMGdnTlJSWEFibmd1U09ta0lxa0hJQTR0TGZFbzl4RU56?=
 =?utf-8?B?YzVqakNnMVRSczZjZTdyQ0pIMDFPWFFQb0RNZmtnWnFvWkVzV0JxK0hHZDVo?=
 =?utf-8?B?enpnb0NvT3lIRm1sWk5aVHNZdlgwbndSemdQRnQwenhyb2x5K1J5b29OV2hw?=
 =?utf-8?B?aEJqSnNnY0ZYLzZkbDhiY0xydUVwVVRUaG1mSFBFaEJoVjlybUZYNER3Z0J0?=
 =?utf-8?B?SU45Z0RTMVYwYUl1QkZzbkFaUTlGbWRHMkNXVkFLUDAxQmhqcSs1M2poejZt?=
 =?utf-8?B?VXFHcUN6YkNWVG81Z1lkT2V6cU53UUlzUTRJMUhpQVdiOTlac0s1dW5sblMx?=
 =?utf-8?B?c3JZbGtqbDlld2FVWU9tOExRWDJNUzAvdFF3NEhEeklsSlpQdG4xMGI3K2Qx?=
 =?utf-8?B?ZVpZTkxNclVJR29UR1UrdjlUWmUxcEdjL1NjM21weXNzUlM4bnI2MWpNa1Vx?=
 =?utf-8?B?Y1Myd2t3MktIZ3VVWFFQOHV6WXdJa1BEUE9LQWZndWRjbi9rR1R4U0l4K3pZ?=
 =?utf-8?B?UE4zWDFyaUNkcm93L3lDSlhRN1dOLzNEU3BQS2NnWVliL2dWc2owQzJNdnBF?=
 =?utf-8?B?cGJXRzBDR29UZHMvVEsvQnQrL0MvWnpEVGFydDFNTmt1RG5sL1ljQ0EycTBj?=
 =?utf-8?B?Q0xlSFNjUGp3M2JpRG5YNkkvOVBnYldjZ0hXem4zSm53VUpaNmJLL1dqbjE1?=
 =?utf-8?B?eVBDZmp0L1liNTI5a0JiVTI1Q1hFZjZSQVRTVHlUQk1nTmtaenRCVHgzaUNB?=
 =?utf-8?B?RitnMkhha3pXampCNmZiK20wVlZxb0tLSUNaS3c3c2RXcjR1TVBSTThLNzFJ?=
 =?utf-8?B?ZzJZQlE3QlY2SGNQSDkyQ3BqeHFNcDhpUjVWL1NxTklGcmwrZzhoTjFzSHNq?=
 =?utf-8?B?R2gwYVl3d2FaOWQ2bkhIZ3VmNlZRang2VzZEenpMa3BMblJoRTFzandSbkt2?=
 =?utf-8?B?YnJrUDd3QW9Ia1krODVoeVN5ZnYzT3daQjhWZ2tldkZlcXJreE5CeXk2a21Q?=
 =?utf-8?B?djRUeUdBdThaYjRtYWtCY21sSVEwcTQvQnJXdGU2MU1ubEZVMlNQekV6M0JP?=
 =?utf-8?B?ZlFlSWx3dHpoaVZZVEh4RjJaRmx6aDRhRHhxQWV6MWpmWEIvTzc0d1F0Mlg0?=
 =?utf-8?B?dDBGcFA0emhZNnYwN21kWW5lbTRtVkhPTFVlaU04WjhNbE5pUnRCTkdBdmxh?=
 =?utf-8?B?d3RBa1hXU2JDSTJsT3AzenJObVB5aWt5M3NLQmhxWVJ4RVJDRFFwM2Y1TnMy?=
 =?utf-8?B?RXplL2V2aUI5dXVZYlZxSUVoREVUdU5jQzczOWRPVDlueUtuT3hZVm1LVmZX?=
 =?utf-8?B?a3YvUUtLL2c0aEdpRWs2Q0tCY2ptR3FBdmw5RG92VGFqWjNJUHo2MlovZW1L?=
 =?utf-8?Q?6R3zeQY/TM9bgK4pKb30o5p9H?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e099c16-06e8-430e-9edf-08dcfce0dbcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 14:56:26.9719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMU/b34Q61GxVPxKOyGC5VeoOtlOXKlVMeVTun+LPMsdD8JmOi2ix8PJGCdVifu6Eq2078svPpfzSDXKGL6j0qPiOgLO5mhYvRO00wW5+Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206685

SGkgUmljaGFyZCwgQWxleCwNCg0KPiA+ID4gRXZlbiBpZiB3ZSB0YWtlIERFVlRPT0xfUFJFRkVS
X0JSQU5DSCBvdXQgb2YgdGhlIGVxdWF0aW9uLCBJIHRoaW5rDQo+ID4gPiB0aGF0J3MgYWxzbyB0
cnVlIGZvciBhIHJlY2lwZSB0aGF0IGp1c3QgdXNlcyBTUkNSRVYgPSAiJHtBVVRPUkVWfSIuDQo+
ID4NCj4gPiBJIHdhcyBhbHNvIHdvbmRlcmluZyBpZiB0aGlzIG5ldyB2YXJpYWJsZSBpcyByZWFs
bHkgbmVlZGVkLiBQZXJoYXBzDQo+ID4gZGV2dG9vbCBzaG91bGQganVzdCBkbyB0aGUgbG9naWNh
bCB0aGluZyBhdXRvbWF0aWNhbGx5IHdoZW4gaXQgc2Vlcw0KPiA+IEFVVE9SRVYuDQo+IA0KPiBJ
J2Qgbm90ZSB0aGF0IHlvdSBjYW4gdXNlIEFVVE9SRVYgYW5kIGhhdmUgbG9jYWwgcGF0Y2hlcyBv
ciBsb2NhbCBmaWxlcyBzbyBJDQo+IHRoaW5rIHdlIGRvIG5lZWQgdG8gc3VwcG9ydCB0aGF0IHVz
ZSBjYXNlLg0KPiANCj4gV2UgcHJvYmFibHkgbmVlZCB0d28gdGhpbmdzLCBmaXJzdGx5IHRvIG1h
a2UgQVVUT1JFViB3b3JrIHByb3Blcmx5IHdpdGgNCj4gZGV2dG9vbCBhbmQgc2Vjb25kbHkgYSB3
YXkgdG8gZGlzYWJsZSB0aGUgYnJhbmNoIGNoYW5nZXMuIFRoYXQgd291bGQNCj4gcHJlc3VtYWJs
eSBlcnJvciBpZiBTUkNfVVJJIHdhc24ndCBqdXN0IGEgc2luZ2xlIFNDTSB1cmwuDQo+IA0KPiBP
dXIgZGV2dG9vbCB0ZXN0c3VpdGUgaXMgcXVpdGUgY29tcHJlaGVuc2l2ZSBzbyBJJ2QgYXNrIHRo
YXQgYW55IGNoYW5nZXMgZG8gaGF2ZQ0KPiBhcHByb3ByaWF0ZSB0ZXN0IGNhc2VzIChvZS1zZWxm
dGVzdCAtciBkZXZ0b29sKS4NCg0KSW50ZXJuYWxseSwgbXkgZXhwZXJpZW5jZSBoYXMgYmVlbiB0
aGF0IHVzZXJzIGRvIG5vdCBub3RpY2UgdGhlICdkZXZ0b29sJyBicmFuY2ggaGFzIGJlZW4gY2hl
Y2tlZCBvdXQuIFRoZXkgZ28gdG8gcHVzaCB0aGVpciBjaGFuZ2VzIGFuZCBlbmQgdXAgY3JlYXRp
bmcgYSBiaXphcnJlICdkZXZ0b29sJyBicmFuY2ggb24gdGhlIHJlbW90ZSwgd2hpY2ggb2J2aW91
c2x5IGRvZXNu4oCZdCBnZXQgcGlja2VkIHVwIGJ5IG91ciBidWlsZC4NCg0KSW4gdGhlIGNhc2Ug
b2YgQVVUT1JFViB3aXRob3V0IGFueSBsb2NhbCBwYXRjaGVzLCBJJ2QgYXJndWUgdGhhdCBieSBk
ZWZhdWx0ICdkZXZ0b29sIG1vZGlmeScgc2hvdWxkIGNoZWNrb3V0IHRoZSBicmFuY2ggZnJvbSBT
UkNfVVJJLiBXZSBjb3VsZCBhZGQgYSBmbGFnIHRvIG92ZXJyaWRlIHRoYXQgYmVoYXZpb3IgKGUu
Zy4gLWQpLCBvciBhbHRlcm5hdGl2ZWx5IGhpbnQgdG8gdGhlIHVzZXIgdGhleSBjYW4gcGFzcyAn
LS1icmFuY2ggZGV2dG9vbCcuDQoNCldvdWxkIHdlIGJlIE9LIHdpdGggdGhpcz8gSWYgd2UncmUg
d29ycmllZCBhYm91dCBpdCBicmVha2luZyBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSwgdGhlbiBJ
IHdvdWxkIHByZWZlciB0byBoYXZlIGFuIGVzY2FwZSBoYXRjaCAobGlrZSBERVZUT09MX1BSRUZF
Ul9CUkFOQ0gpIHRoYXQgSSBjYW4gdXNlIHRvIG9wdC1pbiB0byB0aGUgbmV3IGJlaGF2aW9yLiAN
Cg0KVGhhbmtzLA0KQ2hyaXMNCg==

