Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6569DC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:53:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web10.13161.1707835988627078673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mhjXkrnl;
 spf=pass (domain: axis.com, ip: 40.107.7.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTvZ+cFHnmo/4dWcJP542eREVdAH1eCvTOZM+FFABM4V3i+boNvNWrlzXqpNqyc5T1rrIUE5lflqpu15a29YZOegp5Y0RXmhTgdpk0nyoYzx/XkOmtPBPB4akcRTKnGOHy5RR4fMCxDTK9Tl8Bw4X2Ir087iz6gDZRMhTwbVphF6n0LQnwVAViYiivmz2pONVGz7LvaDoGONET/QZPAw2OBATT9RUnBNH9Bqd+gT4u/Msy18UGhGMe9pz5MAHmkDaHXcabbnGAngdikAJQMgIdOVbroI1jNzdJXfCwPl5SQmv5rs+wxvdt/jhc8HoSnF/p5jQU1aHcx30JyJwRWTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4x06qzh9K8BCeeQJvAIX+aMJKUslpi+ZLrYqwkap3M=;
 b=B/iN5B6dMvY35sDD7N0CsJz/PeXqWwrAjvRCne79AdD4YKN8GKDqUylKguxf3FYDyvMpOHzOCLowhP8UR2ADcGJSCqDw6qd/GH+WfroHfngkOOceZov82VeA+h3FhdSVlKO/jN2JcSh2pTC+wXzIPvVNB6fcy6VBlnpzKGe21OkH+1sv4+omlOImVEgS9XULm7lWl5qV+IsMNE5PHudpkNCpSq2yfsKrRapH5t/vAt9I5LMZsNpaRAiColmajjxwDa98thERCTBCfI3NCxYcGI/DfHjHoVUCeIdwN3J/fGNocfoQ7qouhSXC25/tvXPJlOi0UiQgNNXWYBsWXmnvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4x06qzh9K8BCeeQJvAIX+aMJKUslpi+ZLrYqwkap3M=;
 b=mhjXkrnluaP9fVnGpP7GjpbC2t4ELTceHQxIMqUbO5uWyYIn8YIvDIRedwNP1oWF7BzK2xPi+laYaOmlnG9tNHGTyPxY8NgQVUed9ekHyUr+CoKyCcGoRNSa814cJTi6CAe0fJ1rBgYEPeTyILH3GRRGNFOhpPXLOkc0J34BbPM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB6838.eurprd02.prod.outlook.com (2603:10a6:20b:259::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 14:53:04 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 14:53:04 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
Thread-Topic: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
Thread-Index: 
 AQHaW5brazSIMw6oQEqFxN2iZQ3dnrECrHqAgAKZSQCAATLCgIAAZjSAgAATe4CAAGB2AIAAspgAgAA3xnA=
Date: Tue, 13 Feb 2024 14:53:04 +0000
Message-ID: 
 <DB5PR02MB10213031FC2E6FC30DD0F5CEFEF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
 <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
 <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
 <62436f79-ff09-4084-8e94-55e055198b6a@savoirfairelinux.com>
 <41652303df50bbbe33931faf78515af5a8667993.camel@gmail.com>
 <6b9ae9b0-980a-4beb-9daf-c6272662825b@savoirfairelinux.com>
In-Reply-To: <6b9ae9b0-980a-4beb-9daf-c6272662825b@savoirfairelinux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB6838:EE_
x-ms-office365-filtering-correlation-id: c7b80f75-f824-4159-71fe-08dc2ca37bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sOFamfah9rwOywO8MThPUHJ/XMI//aTZWrdTo48uWJoPCUulS7WfmVeMsMpuzBZOdy0a7GEq5TrpNfOXm+gsoZmomJRQjVpAofmuaD1rSsFh2As7keSz8476vbN6m2nrAK3cXkyrtNZpjoAzW48pQQiaRqg4gtQ1Vzzqa7ck54sPHx7z/l6NKEQHAsWVCB+S/WtixD+779Y8LUUVOY59j8y8vYa7XzX55at2G+xiYcbNLQaT2wXIROhQtdc/C9chkmz+a+tPNdDpClvupmmmOFU8z/P7fIKU29Zzse2IPB8GxmuCdny5jqLK665X9jApSqb/nWMeRCNeNfyGN8g6vXm/7QLVLHsq8ozkueKS5p97zTJ/ieIogegg6aTIhBCbsHDtya1ns0NH+ow+dWuJjH+k9XZUXo6LyU6ACrFGkzqA8ek4OuhK0VRLCv3JY+CoL3wwq3jjIoAWLkTp9ZCkTVP6OrK9jr+mEjk81Hvsw8pusesDWx8AwEQr2+04naI9ukzFmB8WXcVOb9u5QZahlsCfNqCOBSdkZ+b9cazSakiRiFKK3GpwXhs3+ZPmw4YjIH6dVgVYKD3Gl79O1FUcY6STwPe5YNAUC/qyg01IrICAPyw0bM9v4OeZITbLVULn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(33656002)(86362001)(66946007)(66556008)(110136005)(64756008)(76116006)(66446008)(316002)(66476007)(71200400001)(7696005)(9686003)(6506007)(53546011)(478600001)(44832011)(5660300002)(2906002)(4744005)(52536014)(38100700002)(8676002)(8936002)(4326008)(26005)(122000001)(55016003)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUNydlRVT3VIVlp1YTJvbUYrYzRUWVhhUy9iUXEvTytDeDNzOHBKdmpadDBX?=
 =?utf-8?B?clRQZ3FSajQwUFdPWWdwRGNiNEZUdFVKWlFjNVhtVEpralQzcG93bnFJU3dE?=
 =?utf-8?B?L2l0KzBZT0pvMzVvRGcvNnR2aElKR0tEMll5ZUtTRlhVRkZKb3NFL3JVSEJn?=
 =?utf-8?B?VW42aldkU090dXljUzBPc3FvelpsblZMS292TnlGWUVtN0k0NGJCWU9KUUxF?=
 =?utf-8?B?THpFc0RTODN2S0ZRZTRlZ0wrd3VjZHVOd2NMUnR2YzB2eEs5MEl1aWZtSm5q?=
 =?utf-8?B?TlNXY3FKb1FEaCtBTDF4WGhUVFBKLzNpamdzdmpmRkU0bmgzMko3TXptWWdt?=
 =?utf-8?B?c3lLdDZFNjJDdTQ0V0RmTDJHekFMNnE3b3VvZHdiNDlEOUlnZGV2V1lqOUpX?=
 =?utf-8?B?RjQwTGFwWTgvNUR6TG9nbkxNUlRhZ0c4dFpoeCtKV0U2Q1c1aTNNNFpFaGtK?=
 =?utf-8?B?UktpR1FDdDd3WXhiVkh2cnBWK3I2UFNIc0d6OVNmUGIwWTNTKy9qQkJsenoz?=
 =?utf-8?B?U0JhK3JibUUwZ0RHTzQwcnZqU2J1cy9pVGFBVEZ5ZlFFTG9CQTBtN1BNUm9J?=
 =?utf-8?B?d2IvYjFITkUrajZudUdlU1I4aXFsamNiSlp4Vys5T3kxTlRMRTBhSEt4Nm45?=
 =?utf-8?B?ZHBSdFZlSHBHR01LSGp2Wm5TQlUrcW84ZTBES2xnbWZlSjNSM1NBZnVEVVRC?=
 =?utf-8?B?M3B0V2p1VEpXVllKditFdXFOWG4yS0QzVlFsZkQyd2J4VU5CWmwvVGgyUG9t?=
 =?utf-8?B?d0dxUFFrNFlINVgydGxjM2FsL2UwNE1ycVdsbndtTExLeEdzZzkwMEswMURC?=
 =?utf-8?B?eHJVQkxId05yR2NYTU1oUjUwWjE5RnI5SlNSKzlIODFIRDBMcHNOY2pmcjEx?=
 =?utf-8?B?V21iQ2RieDdFV2JudHMvSmNvbm05YzYzYlRqYWgydzJGVmw0bCswTVVqNm93?=
 =?utf-8?B?MzU5YWFRb2R3OWIwdzZxeTcvYTIrbmxnTmQ4ODR0a0FPK0NJYnZyRnN3L0xo?=
 =?utf-8?B?L2JMdUhhT1hsZGNnbjA1N0theEtFTkRIbis2Z0VHeXp4UU93MUIyYVJFelFM?=
 =?utf-8?B?WjVZTGV6aU5GTldHck1kWmdpMFVQam5KR1k5cFZJSVh6RHc2Q2JIckRRdVho?=
 =?utf-8?B?czZsR1EvZnV4Zi9jN3ozWjVVOUd1QlYxQllXeUpIcTY5NXVWWFpKMG5XWTgx?=
 =?utf-8?B?bzZVdGREVWZ2WXNCcWlWS1Y3N3JtQ2d1K0ZlbDhCR0h1YkFPU2VFNUdhenE3?=
 =?utf-8?B?S04rUk5sNmI1Z25ueTJoRnMvOG5Qc05wSEcwdHFDaWl1MjYwUlV1cTNkQWhj?=
 =?utf-8?B?aVdXNENYWWNMV2FrM2trd21uZUJxclpWRjY5ZTZLTHU3Wkw1aVZ1anNwNnls?=
 =?utf-8?B?eTBTa1VBazFvcU5rU2VSQ0JnMUY3QTRFUmoyYlVMaGpKU0tMZUpRWjdiMkFh?=
 =?utf-8?B?Q3Y5SUUxNkpPZnprMVRMemkrNkpNNk02aW91MFVtTElFeVNCTWRzZm1EVDN4?=
 =?utf-8?B?Uk00ekc3VHNkQ3BvamoyU1c3L3Yzd1BXY0gvbEdaZUFLaVQ4UUE1MTZvV3h1?=
 =?utf-8?B?VjFVbkszMm5SSXh4NkJzbk5HRDkyS1d5MnpGM0xlSWJJelVHYVJIaTkxWDFK?=
 =?utf-8?B?QTdYWUV4YU9wSE9MYWNCbEhzandjNGNzNVZNNGlzYzduZU5DeDF2UVVUNkZ5?=
 =?utf-8?B?NkV2N1hBYTc1dU5hU1RmMkQ0dVVnQUh1QndXUVpoUDVLdUJ2aWJmaEVUZTBX?=
 =?utf-8?B?Tk5MYnhyVmQvZlJQVC9LQUJXUUg3eWhNK3dhQjhzNUdZa0JFV3lBZitTY1U5?=
 =?utf-8?B?NlFkUDRXbGp3NzBxeVpmc296VXo4TkEyQXdwM0EvUnE3UVdyOXRSSHBhUmhB?=
 =?utf-8?B?Yk41ZVVGMmVjNlQySkNaWVNNWDF4SjNta25JYk5MTzhMS3k2TGZ3SSswczlF?=
 =?utf-8?B?N1U3SVh2Zk9zcHZaOTBTL3lmVzdXTjNvZTVNVkh4N2dlcEJyZ21mUklsbGk1?=
 =?utf-8?B?M1VNNk04REl0dXZOaHVCRitHVEllVjZSL2JrVnMvb1Fob2p5YXJld0tLNkIv?=
 =?utf-8?B?cGZLM0dTaFFRRFBya0F0YmphcTc3MkNmTGFSYTBSckkwMU95enZyQlFwTkVs?=
 =?utf-8?Q?oJjM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b80f75-f824-4159-71fe-08dc2ca37bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 14:53:04.5686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF08fkYwHXVWhrw14PnMU0RyB8163J4wSTWCwV1fvGitjiVe7/19kBvVZCvsAlND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195407

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgRW5ndWVycmFuZCBkZSBSaWJhdWNvdXJ0DQo+IFNlbnQ6IGRl
biAxMyBmZWJydWFyaSAyMDI0IDEwOjIzDQo+IFRvOiBhZHJpYW4uZnJlaWhvZmVyQGdtYWlsLmNv
bQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdnNjb2RlOiBpbXByb3ZlIHNldHRpbmdzIGZvciBu
ZXcgeW9jdG8gcGx1Z2luDQo+IA0KPiBIZWxsbyBBZHJpYW4sDQoNCi4uLg0KDQo+IFlvdSBzaG91
bGQgcmVtb3ZlIHRoZSBpbmRlbnRhdGlvbiBpbiB0aGUgbWVzc2FnZXMgIllvdSBoYWQgbm8NCj4g
LnZzY29kZS8qLmpzb24gZmlsZSIuIGNhdCBoZXJlZG9jcyB3aWxsIGtlZXAgdGhlIGluZGVudGF0
aW9uIHNvIHRoZQ0KPiBtZXNzYWdlIGFwcGVhcnMgaW5kZW50ZWQgaW4gdGhlIG91dHB1dC4NCg0K
SWYgeW91IHVzZSBgY2F0IDw8LUVPRmAgdGhlIHNoZWxsIHdpbGwgYXV0b21hdGljYWxseSByZW1v
dmUgYW55IHRhYnMgdXNlZCANCmZvciBpbmRlbnRhdGlvbiBiZWZvcmUgcGFzc2luZyB0aGUgaGVy
ZWRvYyB0byBjYXQuDQoNCi8vUGV0ZXINCg0K

