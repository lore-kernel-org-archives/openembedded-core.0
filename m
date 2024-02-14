Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31E3C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 15:30:32 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.82])
 by mx.groups.io with SMTP id smtpd.web10.43689.1707924627560794667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ktm5nMpe;
 spf=pass (domain: siemens.com, ip: 40.107.13.82, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/FsQ3jwtK6z5QTwYRT/ruEqQ/kJf2AznOwD0mGvNS9JMUoJNwDO5146CttWCc70B5kX13ufzOHIlv/u4iXdWYUFHXTbiV769qRFCu03Q40tOKNrIHMgYCnvZLxdJJkz6Jju7+RpEX6/Nt3QtUQmx+09ORyRoowYqst4lRl7ZHpQpcvTmnubKhtBBuCnsdgTz9iCaxKqAdWqyQgT8/+aTe8qgZtMr2C6Owc2uxNsWuaoM2xj7ctmyA87ar7tjSsSQWzZjSyinmvCtCt0L0DdPTD6a0HHov7h6255MpN0kM4PsM6gFmq3/WtulHHAY/4MeVUT20mOCDisfm7qvJ1J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqxvhFw05m329ppZU0UFKzv3l64AJZtFEx+7zyAhbmM=;
 b=hlesEAMlVbZtK8hlp1KEb5v0hujnHesphdw/SeD5w4i4FQMV2kr2k2X9MFuWMM8B3hIs2QZSLJ2XtxnEOxkbeKNp5LdGLn6rX2jbpJPVOomBeT7Kma0aH/wj29wziNtO3vh9ofkFfuN+QSEjtbuRqNMYYR6fKNp7Mv5QVzyjPJyplQV4gnM55CIcgjP5L/7oC15fVHbtBouhfnDby+ntPfnR5JjqQuO445pRqpoGVUdOveNriHUguQteQi6qDDLe2wY/JVWTpcUhHCp1ce7O8sfMyQuS4ETFpRbeiXEG6lW/zh+gFWdNoquOpDOilq9qgw60zc+IyTbBiFRtXnohTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqxvhFw05m329ppZU0UFKzv3l64AJZtFEx+7zyAhbmM=;
 b=ktm5nMpe67sInFoDXsepVfIKujCMQh8rx7xrvZLt3wYiaDfBYy7HHI8tpyuINOeKX3rHHjxrjScVk1JAS+lPUJisFaiNYONfegGCFONikHDu60nKogUvf/4Xsd5Vnwx4xldRQPhfnJYeE+n6XXS/Y96g5pF1+3LZikLYCxsNvMtFrU7fmNBesG0yvVq33SGtosH08qksrKHqJVKkh/yxATjpC7Zcs+Dtqp4imZ5MdWTTEDzIu0XEUnHuNDHp+O+Vj+GEnab//JmUOJrNwSp8pri1xnLZl35fnPJVvYvJSrBVKpUH1m9irGAmBv+4F3GqIAe2KKOyrdQ0LfaOzaFUZg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 15:30:23 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7270.033; Wed, 14 Feb 2024
 15:30:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>,
	"peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
Subject: RE: [OE-core] VS Code plugin and multiple build directories
Thread-Topic: [OE-core] VS Code plugin and multiple build directories
Thread-Index: 
 AdpejlwvkIVHrQ98QLWkzxa8yv//hQAAtIMAAAtW5oAAGkBsgAACGQqAAAAxnwAAAOztAAAGaaqAAAGEn4AAAHi2wA==
Date: Wed, 14 Feb 2024 15:30:23 +0000
Message-ID: 
 <AS1PR10MB5697F8B9B490FD7E9A3484B8FD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
 <2ec56f88fc1b7afd00d1dabcf818b56d92f9cffb.camel@gmail.com>
 <CANNYZj_wbPa9UEKPXmhcg_QZ2tfvYDOcf-jT_+L=EC5eZqHxpg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_wbPa9UEKPXmhcg_QZ2tfvYDOcf-jT_+L=EC5eZqHxpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c73d2e1b-82eb-44a0-bedc-979140684e70;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-02-14T14:56:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5266:EE_
x-ms-office365-filtering-correlation-id: 581d9a43-e8e1-4ca3-0d75-08dc2d71dca4
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YvbCrdOdH8B2UYxeSXnF1o5GN6+G3cVEzzyPKtR+PDRtuioV5/lnQH+ouuwrQttXDl8+P0JPs2yT8hXb5oMnv+rNDHm0nV7PDdCYYCavkeLSizSWpTWp2lGM5JcaDgIlpySRPVNJOME9CIyzEz9DQGig4/VeRPRsxZXbgHHtV/4CqfUusKoVkFNApO4pOWxKYq8bz/hwmCLEecpNZBw8oNMzI2SmT+rKb931lLU7ZAuY9J9rgVgH4ksFazse85gCehNAXymD7wzcA5eXf8P639CTBvAfH5o1mVtnO9grwBsVgEoJCXrezHdEpu96FCUx3zFn8enhgTSenNcZ2WjVX+GU/S91pbVnDqWW6ML7J70w8L9KcHeJ9/GydXeINRbTDKe/koqoUIRdQi9nF0OKzpKXbnQALSt0A4bXpm20tRyhf4pe+9TzMIgcBRSFvwFQAE1FGkiULMXyS6ByziJ707XUEcMX4Y9CxGq/I3zhio1lLDsrBWn8kbW7ptKO5LZMzFrawcSL/+M8+av6eLotyA4UkYqEPIsCtCTRTNdum6JFouI2x0VlOjYNTdZVB1K2GG7mqA2fLJhH7G5cUtMhXDHD4+6H4gdlm0t/GyPg5rY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38070700009)(4326008)(26005)(76116006)(8676002)(41300700001)(66446008)(52536014)(64756008)(66476007)(8936002)(66556008)(66946007)(6506007)(54906003)(71200400001)(966005)(9686003)(110136005)(316002)(33656002)(122000001)(7696005)(38100700002)(82960400001)(86362001)(478600001)(55016003)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEhNSlZTdDZaUUpITXoxMUpNMHBqN09md25uMWhDaDJ5SlJNTlo4Nm5GT043?=
 =?utf-8?B?U2Y1VGpBRW1mek1SN3hXUFhnT2ZMblRVR2UrNTFZSTI5azVMdnR6UllHUXh1?=
 =?utf-8?B?S3lMNFlXV2xqV3E2Z1N5ZlNHOEc2dE9vTFpEOWFYTUNRWkFlc0NKeE5YaURO?=
 =?utf-8?B?Ujh4dTlpN3loLy9lbENPWi9Bb2dmN1I0NWxSdWZvOFRSNER6MGFMR2FDd3Za?=
 =?utf-8?B?OVNSMjlpYXZYWUhuN1hKMG82V2VxNURmVlFaQ0wvWmUyemtKRUJFZUFpNG9J?=
 =?utf-8?B?TGowSG5FZ1hzQnE4cGs5Z0cxcTV1bFI1UDFyY2V2VXpGc3E3MjQ4ME81c0Mx?=
 =?utf-8?B?VmZKRWhUNm45ZXFqYmRoYlN3Tzk3NTVJUjBFV0FwSFdQK3dKeWxidXMxOU5F?=
 =?utf-8?B?QlJlaFY5NHJUK2g4Zi9VaEpzLzBLZ0s4cjNqZ1RScmoxRCthSmVDd0NGeFdu?=
 =?utf-8?B?TURYUzB0dGxlRm5kWmFGb0d5ZzlyWG5ROFltNGJGSDQ3WlEzRUs2aDB2akl5?=
 =?utf-8?B?Q3BsaDltWWRrMzhtS1dvMEpoV3hPeUIzdTY0czJXUlg1d2duQkx5OHNMME1y?=
 =?utf-8?B?QzBXeWVieCtwM1VhNVUwK1VQRmN3RDlrdUtLVkZEWWZwU0kwVU5Pc05iR3lz?=
 =?utf-8?B?T3hxZy90M3Q2c2FIRzQ4RGJYQXcvLzJwUVBxa0g2MHRqcnl1RGRBRFJpTGl4?=
 =?utf-8?B?ZDZLcHNUWFhXUkZ1WDJ4RkJSV0FQVlR3L1A4L3laL1NHVWhvS1JXd0FTbHdH?=
 =?utf-8?B?aldzYVBnTmZKZEY3ZnJvcFZWSXp2cFlRWGpxYW1ZUWdvRlBjclkxUzk1MUpX?=
 =?utf-8?B?NUxxZ3BscU5wVmV5OXowVnVaVURGaXJJNVpqZFJhSTBYdjQ2eFlRVW1WSlNE?=
 =?utf-8?B?TWY5N3VyaWloVFliV2Y4ZmFJZnY4TVdXQTIyRk5PUjdSNkg0alhjV0JmQWZC?=
 =?utf-8?B?Q3E3RktwM3N6T2dWUDhRZXloSnkxS2VSV1luUDc4SjdrUGZUaEphZGlJNW1M?=
 =?utf-8?B?VWJveTVnUGpGOU1TNklSTnQramNXS0VyLzE3Q09rNmRFbmRVSjMzSTFoZ25m?=
 =?utf-8?B?eUVTV1RQS01CRW9WNlpSK0puQkpkZTlhanpaYmdQWDQ0Mko4UjZxVXMySXk1?=
 =?utf-8?B?bWtVK0tlLzAxKzlESW5kd2NXc0pGaEU2WEJvVE9RQm04OE9pU09BRnNpbUFs?=
 =?utf-8?B?SHZtaTBmaXA4aWo2THlQRFREbHA3ekNyOE9zdVJqckE1VUJMVDA2Rlo0STBh?=
 =?utf-8?B?amZGNHAvMEk4TDNxK0FBdzRYbjBHQlJkdEFjUTNIWFJWRmV0ejV2S1VIVFN6?=
 =?utf-8?B?R0tPVWcrbE9kdGNoN0lRd25pS0Z6aCszcDJLMDliemxMdlFnL0g0S1QwdnRT?=
 =?utf-8?B?UWdzZE9hc2dscDVkb1djV00rU0lmMnVXbjJXZjZrOWN6RU5JYWc1ZkRYWlJV?=
 =?utf-8?B?ZG5DU251Z0hBemNobGNYaEJPSnMwRnRjT0JQNlhHbGtTaGdzK0h4RnJoS3Mw?=
 =?utf-8?B?d051MzhLSzIxL0NYQmJkajJHZTFvbUVYT0VEVzJ6YTRkQ09oV29vTkxuNkdz?=
 =?utf-8?B?SEhHaXZRbHVPWlM2am04TmM5WnZDdEhDakNzNFh6MEhVdXVPNjZZeVAxVEpo?=
 =?utf-8?B?UHord1NWbEJtN2lLUXk3UFc3Rzl1U3FjM1ZySGVhWDRhQ2ZVMzdtUnNjazE1?=
 =?utf-8?B?azFwS3FkSit6TXJMTER6SURpYnloQjRBQ1VZYllaQWRabEw0amxzNDM2OHpo?=
 =?utf-8?B?RUlpRHZnVVZFeEZqOUJ0SW0wTHVwZDg5MkFpcy8yRHY1c3E3M09qSktXNDBM?=
 =?utf-8?B?ZXo3QTQzY2dmbWVWcUJYYmNJbkM4aDZUbE5pL2krUzFtNkl3YTZCb0RVMGxU?=
 =?utf-8?B?VEJsOHRHQ1d6ZkczSE5ubFY1WkJ6ekwrR1hEMHVFaVZjdzBzc3FZMlQrNkhm?=
 =?utf-8?B?eXBUeHhNTVBVOVhqWXRQVjZVd3BiZFFMSkNrWTdPbGcxZi9EbHhmcSszTlht?=
 =?utf-8?B?TWdLbkFiWDR3Y1BjdTdBekpZQmtHVEZNZVlGdnpMY2YveXM1bDVjS3lEL3k5?=
 =?utf-8?B?SEp5bDd5Q1g5T1VIVnU4Vm9RZEFjWERsU2tRVVkybWs5ZVpDMnVhclQ4M2Q3?=
 =?utf-8?Q?+Das9g/nEAUeLDGq+dgrGoxRx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 581d9a43-e8e1-4ca3-0d75-08dc2d71dca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 15:30:23.6021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89wFieh80136JIgTWZihrxWM4koeWSZPiuF2k7zoeXX+dCgYtyy+/Wnb59AseMKWN8EHHWIQ+8kISh0MRh9Pnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 15:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195483

SGkgQWxleCwNCg0KSSdkIGxvdmUgdG8gZ2V0IHJpZCBvZiBvdXIgb3duIG9lLWluaXQtYnVpbGQt
ZW52IHNjcmlwdC4NCg0KQnV0IHdoZW4gbWlncmF0aW5nIGZyb20gS2lya3N0b25lIHRvIFNjYXJ0
aGdhcCBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1p
dC8/aWQ9YmNmYWViOGVkNTAzY2UxYTVhZGQzZWM4ODJmMGUwYzNiY2NmZDNkMiBoaXQgbWUgaGFy
ZC4NCkluc3RlYWQgb2Ygc2hvcnQgYW5kIGNvbWZvcnRhYmxlICIuIG9lLWluaXQtYnVpbGQtZW52
IiB3aGljaCBJIGp1c3QgZG8gaW4gZnJhY3Rpb24gb2Ygc2Vjb25kIHZpYSAiLiBvZTx0YWI+PGVu
dGVyPiIgYXMgaXQncyBhbHJlYWR5IGluIG15ICJtdXNjbGUtbWVtb3J5IiwNCkkgaGF2ZSB0byBk
byBsb25nIGFuZCBjcnlwdGljICJURU1QTEFURUNPTkY9bWV0YS08cHJvZHVjdD4vY29uZi90ZW1w
bGF0ZXMvZGVmYXVsdCAuIHBva3kvb2UtaW5pdC1idWlsZC1lbnYiLi4uDQpPciB3aGVuIEkgaGF2
ZSBtdWx0aXBsZSBjb25maWdzLCB0aGVuIGl0J3MgIlRFTVBMQVRFQ09ORj1tZXRhLTxwcm9kdWN0
Pi9jb25mL3RlbXBsYXRlcy88Y29uZmlnPiAuIHBva3kvb2UtaW5pdC1idWlsZC1lbnYiDQppbnN0
ZWFkIG9mIG5pY2UgIi4gb2UtaW5pdC1idWlsZC1lbnYgYnVpbGQtPGNvbmZpZz4iDQpZZXMsIGl0
J3MgbWF5YmUgbmljZSB3aGVuIHlvdSB1c2Ugb2Utc2V0dXAtbGF5ZXJzLCBidXQgd2l0aCBsYXll
cnMgYXMgZ2l0IHN1Ym1vZHVsZXMuLi4NCg0KVHdvIHRoaW5ncyB3ZSBhZGQgYWxyZWFkeSBpbiBr
aXJrc3RvbmUgYXJlOg0KKiBCQl9FTlZfUEFTU1RIUk9VR0hfQURESVRJT05TOiBjb25jdXJyZW5j
eSBsZXZlbCBhbmQgY3JlZGVudGlhbHM7IG1heWJlIEkgY2FuIGNoYW5nZSB0aGlzIHZhcmlhYmxl
IGlzIGRpc3RybywgSSBkaWRuJ3QgY2hlY2sgeWV0DQoqIFBTMTogdG8gaW5kaWNhdGUgdGhlIGJ1
aWxkIGNvbmZpZ3VyYXRpb24gaW4gYWN0aXZlIHNoZWxsLCB0aGlzIGNhbm5vdCBiZSBzZXQgaW4g
ZGlzdHJvIG5vciBpbiB0aGUgdGVtcGxhdGUsIHNvIGl0J3Mgd291bGQgYmUgYSBsb3N0IGZlYXR1
cmUgZm9yIHVzDQoNCk5vZSB0aGF0IHdlJ3JlIG5vdCByZWFsbHkgdXNpbmcgYSBzcGVjaWFsL2N1
c3RvbSBzY3JpcHQsIHdlJ3JlIGp1c3QgYWRkaW5nIHR3byBleHBvcnRzIGF0IHRoZSBlbmQgb2Yg
dGhlIG9yaWdpbmFsIG9uZSAob2YgY291cnNlIGl0J3MgYSBjb3B5IGluIHJlYWxpdHkpLg0KDQpB
bnkgaGludHMgaG93IGNhbiBJIG1hbmFnZSB0aGlzIHdpdGggYSBkZWZhdWx0IHNjcmlwdD8NCg0K
UGV0ZXINCg0KPiBXaGlsZSB3ZSdyZSBhdCBpdCwgSSBzdGlsbCBzdHJvbmdseSBkaXNhZ3JlZSB3
aXRoIHRoZSBpZGVhIHRoYXQgb2UtaW5pdC1idWlsZC1lbnYgbmVlZHMgYW55IGtpbmQgb2Ygb3Zl
cnJpZGluZyB3aXRoIGEgY3VzdG9tIG9uZSBmcm9tIG5vbi1zdGFuZGFyZCBsb2NhdGlvbnMuIEp1
c3QgdXNlIHRoZSBzdGFuZGFyZCBvbmUgcGxlYXNlLiBXZSdyZSB0cnlpbmcgdG8gbW92ZSBhd2F5
IGZyb20gc2V0dGluZyB1cCBidWlsZHMgd2l0aCBjdXN0b20gc2hlbGwgc2NyaXB0cy4NCj4gDQo+
IEFsZXgNCg==

