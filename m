Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1577E9413C
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 00:10:21 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.84])
 by mx.groups.io with SMTP id smtpd.web10.9256.1696637412362531846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 17:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kceLkqQs;
 spf=pass (domain: axis.com, ip: 40.107.247.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHR4KAO2AU7759jdpaGrj6B27bOJC4eHU8JnrHM3/Qkgs0Vc03s5zfoVxt7tFnUXPN4nnYN6fvSnDnnu8l6fjLouxpjrEznf8u7oh0Hbg9fuinrnUB7mD53mzPFG+kB3n32CQuyvdaQq8zkmms+nIbyVeJkwrn2yrFU4BEAP3cPRhwc4ckKLARGpUAxxe0MOUDoqDViRpogI1al02rCzH/l/XNnUAtvR1+52jnPVzJWdSXnU64ZSmcbOwcJudP8WzjCPTvQ1c1uO/zKHCOwHTFIZ5FqA8ywZtIzefzwpjsFdzHLhCJPXeGe6ecRGfRGcSFfhpUQ46DaHjY21tWIkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+b5xRhLw47Q+MR1fdtKNSIixBgIwiVpOqShPeo7AhcQ=;
 b=T/tLPDWqFDfsOehMjtp6l9Wfba2GtXQcGGFbJR1NOsp36nMN3YzeQox7xW3aKLnuh8WxCZPbaaSG6VodtjgY3y2tvMRPuJWCjy9RY+sEtUm8zM9PpojBVMj6ZY95DTtc3//mLPRnLZvSR876ILlZBSKC71/kIPJi6Te+9qhO0DVZay+xeF+/G83+2oeK8Uphq2x0TiBLWvpxMeeUFyd0lKh3OL0QVE9dh41W454DQ9NpWkuEuyUlqEA8NpBVGbYSAW4Q9hPfJxbu3BrbVJvBpNbsVD1fixUR9sla4RzkOJT8rAT3eeM9BogB7eRuirhOn4FJ6reTnk19bpSB6OkBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+b5xRhLw47Q+MR1fdtKNSIixBgIwiVpOqShPeo7AhcQ=;
 b=kceLkqQs4weDIcGRFCDfAxayo1F9fAqdwKsj4ZPuoXiSJl8MohaQb7RokYzIB38E8+/RTQQZNApfJzBFpf+tViTfAZlNyq2HyD1lGhldz+TCjcDgjdwWf7c5W8PbDeokwxPBhyegtSGbkYNOCeaRLGYnFCYneLDWRqDLsO40wUM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB8869.eurprd02.prod.outlook.com (2603:10a6:150:bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.43; Sat, 7 Oct
 2023 00:10:06 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861%4]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 00:10:06 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ryan Eatmon <reatmon@ti.com>, Max Krummenacher <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Subject: RE: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
Thread-Topic: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit
 the default dependencies"
Thread-Index: AQHZ2L4oPF6GUCcjNkC8EKy0eC4xga/+p5iAgAFL9oCABLmCkIA5BORg
Date: Sat, 7 Oct 2023 00:10:06 +0000
Message-ID: 
 <DB5PR02MB102137FBE08231C9BCE1598EBEFC8A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <f81f270d-709f-01ce-97aa-785abb75d872@ti.com>
 <178087E768B3479B.27804@lists.openembedded.org>
In-Reply-To: <178087E768B3479B.27804@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB8869:EE_
x-ms-office365-filtering-correlation-id: c971c03b-fb86-43e6-82a3-08dbc6c9c2ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3ytzjdwnAg+/ZAhuF4o4nya2iLUUtSVnK5YuEb/ielz6hZthol3u/9+cEMivP8NkVGPsbBB4TVXXkXzj9uwdGnmjJtGC3gYoUP+TNZTjQideBD4JTlIaILQ/oGt3Ls15jzynoCvfKHg4uSoikAKM5fvmoTHYLWsBWLrSXhsIvbzJKS1V9Bq9waRVFSwsGDuQLkMI3CgAz5LfLyMzq8OU4FU0xN20u14DWjt6cF6pP4X6/dyh3zOwmnxSO8wCAIVd5mLTCmG+bGtB5E9UPHiCQ0qGPyLzVIy/IKjEHHc77O/cTKSKNJ6ybX+HXZylMc/T3eIZaBnHv7DvEmhkqFrcN/TU4qXWJLu0upl6n6RJOhHvbFJv68738k6662N4hwzGhVVWkdBOFPO7EFLX9XX3AxEDepQ7n+ifFJPCvaIXm3nye3ALHFQuZ1weTJCWTlWl/mC/FnriKAhCofh4pszSIJfhVSAt6tscouQuGJT/KgdLg5aGB7irPPNurp96B+tdNB+DFEOIwmRELeshj2mrv2hQG0Twqf21Z9omztTbYQ5MxR0X00M7JLw/ROzIeuf5a+uht97xL+OkIaZVEo5txVgu0sFrDZRvwja6DLTh0GW+0xQD/AmxUqeIorAIPcTp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(7696005)(9686003)(6506007)(53546011)(26005)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(38100700002)(38070700005)(110136005)(478600001)(122000001)(83380400001)(71200400001)(33656002)(86362001)(316002)(8936002)(8676002)(44832011)(52536014)(4326008)(5660300002)(55016003)(41300700001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFNKemtqTU9pWGRFQytIRnBNVEVIckdGcTZjeXBvWHMweGtJNldlaXMxbExG?=
 =?utf-8?B?cDRLUitaRCtqSERIdXFnWWF2UmlIeCsrR1ZyeXpvamdXZU05QzEzcTUra2c4?=
 =?utf-8?B?UTRIaG5admVwMCs1Z2J0WXRkbVRndHZzdjhkK0hGTWduZjV4N3NLT2JTMlNr?=
 =?utf-8?B?TkloWm1FbXJJME11L1RnWHhEZnp4S1NRQzlrMzEwZld5NDkzeTcrYlRnQXhs?=
 =?utf-8?B?ZmNScXpPOUE1YWNTeXAxWURzMHdxdU9RSW5kY2JmbHIwQUdEaXB3YzNBOW9p?=
 =?utf-8?B?VmY3MWlyWXZIZUxBQ1NjZnBraXFnOU52ckVDWmtyMGNDa041THVKaS9xRGtu?=
 =?utf-8?B?aEJQZmExcjZmcDlXeVBJemNYOU9VU3RTRTFmaEc4bS93WFhTYlFwUHZsZnpl?=
 =?utf-8?B?SzFCMWdYZ2xXdGZYemRJL3dFU2FZOVpHc3NGcm5CL1BZRWl0YndmSnJmRGth?=
 =?utf-8?B?ZjRUdnhDcjlWYmRhK1ZUREhtQ1p2Q1hDMFhRak52N0tMekR5VFBRb3oyODhE?=
 =?utf-8?B?amdCZFI5a1VOZHdrNFAzaENVdlZZR2FXQllCN0FvcG1ZbHoxSTlXeXYxaWUv?=
 =?utf-8?B?bG1tTHhTT0RpNnZxQkJtWDFCdmYzeUs4cEIvZXByUUF1cnpaK0N0YTRMdmlu?=
 =?utf-8?B?V0lncUZWNENtclFFemgyTzZ5WWljSTB3M20wR1lORUZMcmxlVHRldTFpNXVu?=
 =?utf-8?B?RkU3Q0crTStPSUF3MjlwT0NCb1hWVzhIbWhwNThBM3pvOTBLckMrYmtkQ2hC?=
 =?utf-8?B?ZG9OcCswejkxT0dzTEx0L2dyNnR2eXc1bGdSTTRESDBPZEl1ai9YeTNGYy9X?=
 =?utf-8?B?SERKcm9xWVdRV1pKMWxOT0VRaXNQcEZraXZHeG1vMWJqaENkTUNVQzlXY3Nl?=
 =?utf-8?B?d1RiQlVNejY1NmhNengxOVdwR0FOZTdkSk8yMlJSbStYcFFNR0s5c084SXNU?=
 =?utf-8?B?SDNuTHNhSm9yblduU2p2NUwwenNnYkdHREVrVmhHV2lCWWNtMHVtby9lcFVr?=
 =?utf-8?B?aDNSdVpXSG1tUS9xSTdKWWpmK3hiMXc4Y0E4aEVMcmZxZCtMeWRSRjdFNE9N?=
 =?utf-8?B?MHhKdW9NeUlyZnBiOUw3U1o3MHhqdXhNVEw3bUJMWWlMQUdHWTF4c3hRbXpk?=
 =?utf-8?B?UVFDMnhsWW1PNVN3bWkzSVd1YXFFNGpGcGtwSVFLaTR0MS8vOGsrclRNV2tM?=
 =?utf-8?B?bTUyZUxVUytEbytXWEZCY1NKU3pJZzRWdWpTVkdkZkdQYjhMYnV4ZGNpVEZM?=
 =?utf-8?B?U1V2N2RnU0p5MW5rTUFQcFBZZjlSd0VUWEZSVWFkcmNvOXl4UUpHejBhd1l2?=
 =?utf-8?B?MmFxQ1ZoKzQ5OEd5MGs3NXZpV2JhcTRoQm5oM1ZzUUMyNnhmbWYxSXQ2T08r?=
 =?utf-8?B?Y1ZPOUJCa0RYUi9nbkRHTjVsU1g0cy9kOGRjcnpkeEcyQUFYQlBnSkc1RlVJ?=
 =?utf-8?B?QmdObnkxUnVpOFYwZllpWjFqcFU4LzJVMUVJaFFRc0F2THhVQXFmMHVRanM5?=
 =?utf-8?B?Y2RFRzNiRmszOGtkOVkxZVVJNUlSS3ZFNHF3MHNLQTJwVHBDVXZZQ2dMYmNH?=
 =?utf-8?B?MzdHdVVnbUM0Q2RlbEdyOW5YZXkrdU5yemZqWFROWUhXL2M5bVVUcjRVN0hU?=
 =?utf-8?B?TDhDOWxZb1FJL1N5Q2lNdDNEYXRzZGJnemFVNzlUZVY5YTdtM2NUVlJxT0dV?=
 =?utf-8?B?Q2YwVENBRmlGSVpsNHZ0SDhCZzVRSi9EV2R4OWRjTk80VmNoVk1helZpcG1W?=
 =?utf-8?B?UldIUnoxc3FpUVBJVkwvUlU3Y1M5U3dRcThqcElVN2VxQVM1Uzc5NmxqZFVx?=
 =?utf-8?B?MkZod1lUREpKWitnalFHNENaNS9CMCtjNlI2SlF1UGhQSklDTWxKcGZxZ3hQ?=
 =?utf-8?B?a3ZJbkp2WGEzQXNnM21ucUhtYVViZDg4SFNNTTNhZ012QVBuSzNKeWlZV1d6?=
 =?utf-8?B?ell5N1BvMUhma2htb3BSaFJZRW8wbE5qY0srbS9leHlkKzJFNWt5N0dVemdl?=
 =?utf-8?B?eHNPZm5naGNRbWxRWStlbFE5V3RvajhyRlUvQnl6cFNucUFON3pLM25pTWNC?=
 =?utf-8?B?Q2NjM2ZhVitZam1JcmVOaU1XWmlpTmc2dU1NdXpwb3FJUVNnMDVTQVJJaXNH?=
 =?utf-8?Q?08gY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c971c03b-fb86-43e6-82a3-08dbc6c9c2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2023 00:10:06.4108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YG7KdLNHJw0H047lqK/PC6OXkV6ARbDMDKlVn4VWi8vSJ1hiY3/fOon85OBwqnqI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 00:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188795

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IFNlbnQ6IGRlbiAzMSBh
dWd1c3RpIDIwMjMgMTk6MjgNCj4gVG86IFJ5YW4gRWF0bW9uIDxyZWF0bW9uQHRpLmNvbT47IE1h
eCBLcnVtbWVuYWNoZXIgPG1heC5vc3MuMDlAZ21haWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1t
ZW5hY2hlckB0b3JhZGV4LmNvbT47IFJhbmRvbHBoIFNhcHAgPHJzQHRpLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtvZV1bT0UtY29yZV1bUGF0Y2ggMC8xXSBSZXZlcnQgImJpbl9wYWNrYWdlLmJiY2xh
c3M6IEluaGliaXQgdGhlIGRlZmF1bHQgZGVwZW5kZW5jaWVzIg0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFJ5YW4gRWF0bW9uIDxyZWF0bW9uQHRpLmNvbT4N
Cj4gPiBTZW50OiBkZW4gMjggYXVndXN0aSAyMDIzIDE5OjEwDQo+ID4gVG86IFBldGVyIEtqZWxs
ZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgTWF4IEtydW1tZW5hY2hlciA8
bWF4Lm9zcy4wOUBnbWFpbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+ID4gQ2M6IE1heCBLcnVtbWVuYWNoZXIgPG1heC5rcnVtbWVuYWNoZXJAdG9yYWRl
eC5jb20+OyBSYW5kb2xwaCBTYXBwIDxyc0B0aS5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtvZV1b
T0UtY29yZV1bUGF0Y2ggMC8xXSBSZXZlcnQgImJpbl9wYWNrYWdlLmJiY2xhc3M6IEluaGliaXQg
dGhlIGRlZmF1bHQgZGVwZW5kZW5jaWVzIg0KPiA+DQo+ID4gT24gOC8yNy8yMDIzIDQ6MjMgUE0s
IFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4+IEZyb206IE1heCBLcnVtbWVuYWNoZXIgPG1heC5vc3MuMDlAZ21haWwuY29t
Pg0KPiA+ID4+IFNlbnQ6IGRlbiAyNyBhdWd1c3RpIDIwMjMgMTA6MTANCj4gPiA+PiBUbzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUGV0ZXIgS2plbGxlcnN0ZWR0
DQo+ID4gPj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiA+PiBDYzogTWF4IEty
dW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT47IFJhbmRvbHBoIFNhcHAN
Cj4gPiA+PiA8cnNAdGkuY29tPg0KPiA+ID4+IFN1YmplY3Q6IFtvZV1bT0UtY29yZV1bUGF0Y2gg
MC8xXSBSZXZlcnQgImJpbl9wYWNrYWdlLmJiY2xhc3M6IEluaGliaXQgdGhlDQo+ID4gPj4gZGVm
YXVsdCBkZXBlbmRlbmNpZXMiDQo+ID4gPj4NCj4gPiA+PiBGcm9tOiBNYXggS3J1bW1lbmFjaGVy
IDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPg0KPiA+ID4+DQo+ID4gPj4gSGkNCj4gPiA+
Pg0KPiA+ID4+IFdpdGggY29tbWl0IGQxZDA5YmQ0ZDcgKCJiaW5fcGFja2FnZS5iYmNsYXNzOiBJ
bmhpYml0IHRoZSBkZWZhdWx0DQo+ID4gPj4gZGVwZW5kZW5jaWVzIikgYXBwbGllZCBJJ20gZ2V0
dGluZyBhIGxvdCBvZiB0aGVzZSBlcnJvcnMsIGkuZS4gcWENCj4gPiA+PiBkb2VzIG1pc3MgbGli
YyBhbmQgY29tcGlsZXIgcHJvdmlkZWQgbGliczoNCj4gPiA+Pg0KPiA+ID4+IEVSUk9SOiB0aS1p
bWctcm9ndWUtdW1saWJzLTIzLjEuNjQwNDUwMS1yMiBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZToN
Cj4gPiA+PiAvdXNyL2xpYi9saWJ1c2Muc28uMjMuMS42NDA0NTAxIGNvbnRhaW5lZCBpbiBwYWNr
YWdlIHRpLWltZy1yb2d1ZS11bWxpYnMNCj4gPiA+PiByZXF1aXJlcyBsZC1saW51eC1hYXJjaDY0
LnNvLjEoR0xJQkNfMi4xNykoNjRiaXQpLCBidXQgbm8gcHJvdmlkZXJzIGZvdW5kDQo+ID4gPj4g
aW4gUkRFUEVORFM6dGktaW1nLXJvZ3VlLXVtbGlicz8gW2ZpbGUtcmRlcHNdDQo+ID4gPj4gRVJS
T1I6IHRpLWltZy1yb2d1ZS11bWxpYnMtMjMuMS42NDA0NTAxLXIyIGRvX3BhY2thZ2VfcWE6IFFB
IElzc3VlOg0KPiA+ID4+IC91c3IvbGliL2xpYnVzYy5zby4yMy4xLjY0MDQ1MDEgY29udGFpbmVk
IGluIHBhY2thZ2UgdGktaW1nLXJvZ3VlLXVtbGlicw0KPiA+ID4+IHJlcXVpcmVzIGxpYmMuc28u
NihHTElCQ18yLjE3KSg2NGJpdCksIGJ1dCBubyBwcm92aWRlcnMgZm91bmQgaW4NCj4gPiA+PiBS
REVQRU5EUzp0aS1pbWctcm9ndWUtdW1saWJzPyBbZmlsZS1yZGVwc10NCj4gPiA+PiBFUlJPUjog
dGktaW1nLXJvZ3VlLXVtbGlicy0yMy4xLjY0MDQ1MDEtcjIgZG9fcGFja2FnZV9xYTogUUEgSXNz
dWU6DQo+ID4gPj4gL3Vzci9saWIvbGlidWZ3cml0ZXIuc28uMjMuMS42NDA0NTAxIGNvbnRhaW5l
ZCBpbiBwYWNrYWdlIHRpLWltZy1yb2d1ZS0NCj4gPiA+PiB1bWxpYnMgcmVxdWlyZXMgbGlic3Rk
YysrLnNvLjYoR0xJQkNYWF8zLjQuMTQpKDY0Yml0KSwgYnV0IG5vIHByb3ZpZGVycw0KPiA+ID4+
IGZvdW5kIGluIFJERVBFTkRTOnRpLWltZy1yb2d1ZS11bWxpYnM/IFtmaWxlLXJkZXBzXQ0KPiA+
ID4+DQo+ID4gPj4gUmV2ZXJ0aW5nIHRoZSBjb21taXQgbWFrZXMgdGhlIGJ1aWxkIHBhc3MsIGFs
dGVybmF0aXZlbHkgYWRkaW5nDQo+ID4gPj4gdG8gZGVwZW5kcyBpbiB0aGUgcmVjaXBlIHdoaWNo
IGlzIHVzaW5nIHRoZSBiaW5fcGFja2FnZSBjbGFzcw0KPiA+ID4+IGZpeGVzIGl0IHRvbzoNCj4g
PiA+Pg0KPiA+ID4+IERFUEVORFMgKz0gIiB2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1jb21waWxl
cmxpYnMgdmlydHVhbC9saWJjIg0KPiA+ID4+DQo+ID4gPj4gSSdkIHByZWZlciByZXZlcnRpbmcg
cmVtb3ZpbmcgdGhlIGRlZmF1bHQgZGVwZW5kZW5jaWVzIG92ZXIgZml4aW5nDQo+ID4gPj4gZWFj
aCBvZiB0aGUgcmVjaXBlcyB3aGljaCBkbyB1c2UgdGhlIGJpbl9wYWNrYWdlIGNsYXNzIHRvIGFj
dHVhbGx5DQo+ID4gPj4gaW5zdGFsbCBiaW5hcmllcyBydW5uaW5nIGluIHRoZSB0YXJnZXQgdXNl
ciBzcGFjZS4NCj4gPiA+Pg0KPiA+ID4+IEFueSBvcGluaW9ucz8NCj4gPiA+DQo+ID4gPiBCdW1t
ZXIuIEkgZ3Vlc3Mgd2Ugd2lsbCBoYXZlIHRvIHVwZGF0ZSBvdXIgcmVjaXBlcyBpbmRpdmlkdWFs
bHkNCj4gPiA+IGluc3RlYWQuIDooDQo+ID4NCj4gPiBXYXMgdGhlcmUgc29tZSBpc3N1ZSB0aGF0
IHlvdXIgcGF0Y2ggd2FzIHNlZWtpbmcgdG8gc29sdmU/ICBUaGVyZSB3YXMNCj4gPiBub3QgbXVj
aCBleHBsYW5hdGlvbiBpbiB5b3VyIHBhdGNoIG9yIGRpc2N1c3Npb24gYWJvdXQgaXQgb24gdGhl
IG1haWxpbmcNCj4gPiBsaXN0IGJlZm9yZSBpdCB3YXMgYWNjZXB0ZWQuDQo+ID4NCj4gPiBPciBk
aWQgdGhpcyBqdXN0IHNlZW0gbGlrZSBzb21ldGhpbmcgdG8gZG8gc2luY2UgdGhpcyBjbGFzcyBk
b2Vzbid0DQo+ID4gYnVpbGQgYW55dGhpbmc/DQo+IA0KPiBJdCBqdXN0IHNlZW1lZCBsb2dpY2Fs
IHRoYXQgc2luY2Ugbm90aGluZyBpcyBidWlsdCwgdGhlcmUgc2hvdWxkIGJlDQo+IG5vIG5lZWQg
Zm9yIHRoZSBjb21waWxlci4gSSBkaWQsIGhvd2V2ZXIsIG1pc3MgdGhlIHBvdGVudGlhbCBuZWVk
IGZvcg0KPiB0aGUgcnVudGltZSBsaWJyYXJpZXMuDQo+IA0KPiA+IEp1c3QgbG9va2luZyBmb3Ig
YmFja2dyb3VuZC4NCj4gPg0KPiA+IFlvdXIgY29tbWl0IGlzIGFsc28gdGhlIHNvdXJjZSBvZiBh
bm90aGVyIGVycm9yIHdpdGggdGhpcyB0aGUgc2FtZQ0KPiA+IHRpLWltZy1yb2d1ZS11bWxpYnMg
cmVjaXBlIHRoYXQgSSd2ZSBiZWVuIHRyeWluZyB0byB0cmFjayBkb3duIGFsbCBsYXN0DQo+ID4g
d2Vlay4gIE1heCBqdXN0IGJlYXQgbWUgdG8gZmluZGluZyBpdC4NCj4gPg0KPiA+IEknbSB2b3Rp
bmcgdG8gcmV2ZXJ0IHlvdXIgcGF0Y2ggdW5sZXNzIHRoZXJlIGlzIGNvbXBlbGxpbmcgcmVhc29u
IGZvcg0KPiA+IHlvdXIgcGF0Y2guDQo+IA0KPiBJZiBpdCB3YXMgbm90IG9idmlvdXMgZnJvbSBt
eSByZXNwb25zZSBhYm92ZSwgSSBhbSBpbiBmYXZvciBvZiByZXZlcnRpbmcNCj4gbXkgY2hhbmdl
IHNpbmNlIHRoZSBlcnJvcnMgcmVwb3J0ZWQgYnkgTWF4IG9idmlvdXNseSB3YXMgbm90IHBhcnQg
b2YgbXkNCj4gdXNlIGNhc2UgYW5kIGRpZCBub3QgYWZmZWN0IGFueSBvZiBvdXIgcmVjaXBlcy4N
Cj4gDQo+IC8vUGV0ZXINCg0KUGxlYXNlIGFwcGx5IE1heCcgcmV2ZXJ0LiBJIHRob3VnaHQgaXQg
d2FzIGFwcGxpZWQgYmFjayBpbiBBdWd1c3Qgd2hlbiANCnRoaXMgd2FzIGRpc2N1c3NlZCwgYnV0
IGl0IGFwcGFyZW50bHkgbmV2ZXIgaGFwcGVuZWQuDQoNCi8vUGV0ZXINCg0K

