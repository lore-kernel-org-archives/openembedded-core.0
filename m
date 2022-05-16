Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1020DC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 05:35:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25064.1652679331280972626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 22:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hokjbZUJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=213577d59f=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24G5MRph007481
	for <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 05:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QkjUgiAEhirM0h4oRNPL+YSN8ifrn72BGeiwfbOAOdc=;
 b=hokjbZUJwSaHPb7aX2ThfIf0wU6iRZ6CBD0dMdTxkxyCLCGzC2QwBt1MNcgODygAqo0b
 z7IRwafJC+7YxUQEPrcvg9338hvg5ypUDTZgZ7AsyI6yED+BTzepHG5qf9cVaq+qRNBF
 D/ke+fMtYIrw68wdnZ3kmK0ioSK7czgoYzkwAhwaznwsvMpFFCEjyNPDBzC5GB0K5YPx
 VXE5M36fMXVn9ZmESIlAOD8gYbQBlJ4cs62IJTfwqzWkkUCsRrLI9/GkKMHdHvwEzCII
 p02L4BU+egSJ7miGDBhckglIDD0iSOwHMklGbkaGHT/AWgrTu6zfSCS2EzqOyDP4kLtg mw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g21n19e91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:35:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24G5ZTrT032114
	for <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 05:35:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g21n19e8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 May 2022 05:35:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHdl52svrfpINC4n4zI7uXDoQWyjtz8VBp38E5iWZuxRJV4kQowJqp/jtUNr+GtTpxxsCwsBgUvpvuZMGNofnVZobSl/2GSC3AEuK2meQP+X1N+1qUEHFqZQDui+EMFA/kRLQb8vXzaBNs2ZfE1jjh0BTNUFME/by1qdTICXaAuUby1zpEnLRUOXyKQ1z+N/eOe+esBevTEYQ9WAubfyAFPjctRXryoKOaFVEI1yYw0GVUaub4aaLdSQ+BQzC6/09lt4VmYiZOmIbm/n4jBCZ0RtiIlgomloxBr0JPncK+UPzy9zirJXZ2w8PWNiDPjZEEw6emZ6tfPKqxZ/iATgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkjUgiAEhirM0h4oRNPL+YSN8ifrn72BGeiwfbOAOdc=;
 b=g/W+Q7PVXi4MKVZ9zFg/rhndbedJGw2qxBQtvwLIdv+bOMRadpiEkpjKUhSTTQd1J+klI5TvqNVqL56337KTe0gB+Di599LYHVc68/RgAM6a9orHpvwN7C3E5934yfbIp9ItH0M2nqm89qabi5ivWyVUgdO3Lp/Wl+AwetzFa0tFLFfi2+V4CmiSwGKEf7eaMQg5wD8DlinYyj+qfI+0DERYXQP+glqCSV13W9EC6cT3BF9p7fsEP+3MyBC144i0rft9G93H8KPEHbynAL8l3Iz9vI17HebrLfxwNtkPVQ/H/GR1jIJksOwuu2OVgFCozv/LTlxNmnd1pat63pHRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 05:35:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 05:35:26 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Jacob Kroon <jacob.kroon@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] About the sstate cache directory hierarchy
Thread-Topic: [OE-core] About the sstate cache directory hierarchy
Thread-Index: AQHYFBWVAKo8dlCVoUuKwtN/3Afrx60ho9OAgAAA7+A=
Date: Mon, 16 May 2022 05:35:26 +0000
Message-ID: 
 <CO6PR11MB560215A82C5EC730F9D95DF8EDCF9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
 <ac2d4184-10ce-01b2-2fd7-454cf8080452@gmail.com>
In-Reply-To: <ac2d4184-10ce-01b2-2fd7-454cf8080452@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64fcb919-e5e8-4e82-7f14-08da36fde1c1
x-ms-traffictypediagnostic: DM6PR11MB4642:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB464237E280B2FFAD600C4349EDCF9@DM6PR11MB4642.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OIX2FRl9W+0AXrYKJxvJr8+5/DTdJo548FG7iAECaI7Gu1VE4rHs0ldMx1uSm8mprqBo8HB0rSh0AfuRl8XAheJ9qp7SqN+g4mNeGYXg/7QZO07Q2rllKeKYGVGfU0KjZPnzt7t5r9LSzzAW+orW7rBcWNpEFG/W5vmXnAqPDCzrlh2bW5ECZBmd1VRtjslJuTwA2CwqdBi9diaYsPEjv/pDM6pIeiiJylnx0dOWIVGF5GMYM+552mro0sJac4z1LM0dqlQFEitz8ketVq6ifLeRhxBnWPMjIpe9OstbXB5swyXFXau87k2YxreYe64bJnN+7xYUrx5oyenji0DU5IoAX9D8mIgGT4nElqQgUT3zCEp3o1ScqDVCh5H7ft1MoDCOpy9BJkKkp230oXGyd6E6Ar6h2ju7t2oAbBMp9sAkjfe5V15MKeDibrrKSiEWYLCS3TwYjRnVR89MZcEsCMzZFrCHkZ0VopJaW6x/PtCLSslqeRbeE0JMjVuShevarTHhDFCdODCkz+kiU70WKc+oU0Ho4NqJJhdJOas4w2tlPgy56iWv/9zWlVDxGOUGyFaRQLqIdpXOEsGx/uti/ViTA6QfEZ2ZSSudP2CeONWxMbxAqZveSWhiCGuLvKllfbfV8SqLDg3snnM4PCW0MQCC6dO3bjs+6rl019Jo2F2khySc6miG8LUsMRE37ru0GcKaYW7b481VhQWQDM1I95zog+VKN6DmOwIqnIyqoxz8rVKReOumQc2xOICCo57NFl5ENlbZpzahKzjTtMbmTlRVssRRhoJA4xYC11RfC9k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66446008)(66556008)(64756008)(66476007)(66946007)(86362001)(76116006)(26005)(186003)(8936002)(53546011)(508600001)(71200400001)(52536014)(7696005)(5660300002)(55016003)(33656002)(38100700002)(38070700005)(2906002)(110136005)(6506007)(316002)(122000001)(83380400001)(9686003)(9126006)(21314003)(49910200006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QmZiLzNYQTErVkE1Z2ErOFVBS3RDV25nZ1ZySVRnVVY3M1VZNTdSbkNsdStu?=
 =?utf-8?B?VlNINmRjUy9Ga2tGQmdBam9CUVcvSnBLQ2xyMW95ZDFRWVhzRkZuRmo5dzRr?=
 =?utf-8?B?VnFMT0JZRER3ZEtFbE1jNzNpMytsM1poVVR0ekZTM0JuLzZYK1RIdm13WGdX?=
 =?utf-8?B?UnVXVkdzR0RmM1JKdFJnd0gwaVA1WTNxekMra2x6T0xsTW5MTS9QUnBCMU5I?=
 =?utf-8?B?d01RSFRRa3RzWmxHeTVzeVFpK1owc2VWK2tpQ05tL2RtWlNZalhvVk9tQTVr?=
 =?utf-8?B?K2ZpL285T0FBejEyUVdvaE9DVWNtOCtraVlKS2RPS0lDMTZwc2hValZQQTVw?=
 =?utf-8?B?aGpESVFvVkExVEd4L2RoSHpTMnNOM2FuUkRZaTNpRThXdFlQY2l6d1RudEVR?=
 =?utf-8?B?eDF6dTFYMXFSQldNTFIrY2NFUDA5ZzU2OHlQWXRoOUdQT3ZncnRuQWptOXNk?=
 =?utf-8?B?eUl6TGxDTXNQb3BrYVJmV1Y5YUQ4MHY0VHVlTlNhSzhScFhzcVpQcE51SmVr?=
 =?utf-8?B?Mm5xeFJaUm9wcUtwK3liVzMwTmo3bzh2SS84Ym8vVTlNQUZnSDJqTjczdWQw?=
 =?utf-8?B?d3NmSElsR0hONTFNMmRrU3UrY1djM1ZibzAxNXZLQi9KMmtVdVJJajRmLzJk?=
 =?utf-8?B?Y21oUU9WbHdXN3pGM29xSGNmdlBBWHlwM0x2eDhUaFo5a2VsSHQ2NlNOcG9J?=
 =?utf-8?B?bjlVRmRBMUFkZXJ4RmRZUTlYY1phZENBQWVyYTZnS05BZktObEJlcE1FWXY1?=
 =?utf-8?B?ZjZsUWJkSWhBUERLOXNrQ0ZSU25PSjBNMnpyVDRuZ0FzckQrQ0Jtc1hGeWx0?=
 =?utf-8?B?eC80RjhzbGpGSG0waEQxZkx4SzdnVnFmbFNWWk51OEQxZFBiQWRBSFVrNWRo?=
 =?utf-8?B?OGNxUzVOVm1hMmxzMzFKMEFzUi9uelJjaDVtNUZJU1UxRVBBYm9xVUVuaEhT?=
 =?utf-8?B?TVVENHVLckJwMEg0NTAwRXR0bXN5QUl2TVlVbEl6dnRYSjYxb1NqMk93RGJm?=
 =?utf-8?B?Yko5aVc3bU1SSC95OTZLRXZEL0FlVUFJbE5KbERYaitkNE9HdXNNYVVoV0Rt?=
 =?utf-8?B?WnY1QTlTVW9aQlNzdUIwU041dXlLdVk0VUdqb1hhUDFkeTB0d2FoRlBnYVdG?=
 =?utf-8?B?aWxhYjMzejlSTjF1dytKUkpoR2hBeDBJRVJKWDlSOW1ianNxS3lBSlY1d01l?=
 =?utf-8?B?MGVCcmRXUUxBVFB6RFhqano4elhGMDE3TDdhS29ad1F4WE9hMHpRcEVWK3M1?=
 =?utf-8?B?M2dnWnd6QVNaVDVTWCtHWEwwVlpIZktPcjNLNzdURk1DQzBIVDlhakhNbytG?=
 =?utf-8?B?NDJ5WDFJeXlWQnNDSGt2SXdmTm1kZmNMZnBBSTAxbEk0RTM0VWN4TXhzTUdp?=
 =?utf-8?B?S08xQkpuNnJhbFZnUTdpUno3WlNzYmNWdGoyNFZaVHhmeEkvYWlLWmoyaDJs?=
 =?utf-8?B?YTRSMy9ESUJzbHpHK25FN09wS2haWWxWM3A4aFJVZHVuc3dSalNjUFZWWTZy?=
 =?utf-8?B?UjR0YitnTlhVNEprWE1SSFR3QzlTYi9LZEgvVVIvT2R1QW9vQnlFLzJDM0F3?=
 =?utf-8?B?dVJTSzJJUXgya0tGdDE5M081UStxZElYTU8rK3k4NVdEOFhVVFJrT1EzY083?=
 =?utf-8?B?bVFPQUZWaXZHSFVkcXd1NW1YeXFYaWxhT3NvUzBZREhqNDlFUmpBT3B1QXNr?=
 =?utf-8?B?bHJ5ZzRLMHEwVDk1SDdiMmIvVzdTbE9QZVdQOWYvY25jeWk0RThNMmlVL0ZP?=
 =?utf-8?B?WWhib0pFbHdtU3htNmZPbkJYaEtSbldkRTVodDhNVzR6bFpSbTY4bVovaUJ1?=
 =?utf-8?B?amcvMXVOUVVsbE9XSnQxOGEvWS9OQ0RWaGt1TElqVW56M1lmWTE4QnlzUXZM?=
 =?utf-8?B?NWJuMitVcGZENXlBVFUvL3o1SFlVaW1uMzhkWlFWK1c2QlE2SUVNMTJpYUVi?=
 =?utf-8?B?YU9CTWoyQWJJWjJNUG9Xczl2WER4Y2tud1ZIWkVsTldNOUVIYXJ1d3EwWElB?=
 =?utf-8?B?b1E4c1pzTE0yNFNOdko2Y3FHQXZwaGlSUlVUVXpUTnRRVFZ5U0wxTWZJN1py?=
 =?utf-8?B?aFppNkY2OXVVV2o3Y0M0emZsdTU2aUdaTjUxeHRnRWpXRVdVZUhPZGQ1WlMz?=
 =?utf-8?B?WGI3S1FsOWxJam92L1h4ZlF4RHVDZWpjOUV3MnNTSTZockhEVkM2WS9kcnlm?=
 =?utf-8?B?UHE2WEJsMENBcmZvMktVRFZJQ1k5eGROMTVKNFNQempxalJ6U1NXSU5aU0FI?=
 =?utf-8?B?cnFadkdES0h6aGVPMXhFY3FvUEZwU3drT0tFKzR0QVMyZEpIdWl4UlBGYzlN?=
 =?utf-8?B?Vm1ac1JRTDY2R2dKTnUyQnd2UGpYTEExV3JXbHc2NEorZDQ2TUFwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64fcb919-e5e8-4e82-7f14-08da36fde1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 05:35:26.8214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 yK+f0fl82Qe0oiESnrBpAJR4TRrnEV7wjacTXbbcMv39JWeDuICJ9D5gf4jgGgad9E9hnB3dyFPkV9d1wWmCVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
X-Proofpoint-ORIG-GUID: QYWAb80GTXmAFfF5zdWpAJgcJOLfsmVH
X-Proofpoint-GUID: mWmVNkvhv1-Ek2y2S62JzVxn3VCA1B57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=729 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205160030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 05:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165663

SGkgSmFjb2IsDQoNCk5vLiBJIGhhdmVuJ3QgZG9uZSBhbnl0aGluZyBzaW5jZSB0aGVuLCBiZWNh
dXNlIEkndmUgYmVlbiBpbnZvbHZlZCBpbiBzb21ldGhpbmcgZWxzZS4NCg0KUmVnYXJkcywNClFp
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKYWNvYiBLcm9vbiA8amFjb2Iu
a3Jvb25AZ21haWwuY29tPiANClNlbnQ6IE1vbmRheSwgTWF5IDE2LCAyMDIyIDE6MzAgUE0NClRv
OiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIEFib3V0IHRoZSBzc3RhdGUg
Y2FjaGUgZGlyZWN0b3J5IGhpZXJhcmNoeQ0KDQpPbiAxLzI4LzIyIDA4OjA2LCBDaGVuIFFpIHdy
b3RlOg0KPiBIaSBBbGwsDQo+IA0KPiBJJ20gc2VuZGluZyBvdXQgdGhpcyBlbWFpbCBiZWNhdXNl
IEknbSB3b25kZXJpbmcgaWYgd2UgY2FuIGNoYW5nZSB0aGUgDQo+IHNzdGF0ZSBjYWNoZSBkaXJl
Y3RvcnkgdG8gdXNlICR7UE59IGFuZCB0YXNrbmFtZSBhcyBzdWJkaXRvcmllcy4gSG9wZSANCj4g
dG8gaGVhciB5b3VyIG9waW5pb25zLg0KPiANCj4gQmVsb3cgaXMgdGhlIGxvbmcgc3RvcnkuDQo+
IA0KPiBSZWNlbnRseSBJIG5vdGljZWQgdGhhdCBydW5uaW5nIGBiaXRiYWtlIHh4eCAtYyBjbGVh
bnNzdGF0ZScgdXN1YWxseSANCj4gdGFrZXMgbW9yZSB0aGFuIDEwIG1pbnV0ZXMuDQo+IA0KPiBB
ZnRlciBzb21lIGludmVzdGlnYXRpb24sIEkgY2FuIHNlZSB0aGF0IG1vc3Qgb2YgdGhlIHRpbWUg
aXMgc3BlbnQgb24gDQo+IGZpbGUgc2VhcmNoaW5nLiBUaGlzIGlzIGJlY2F1c2Ugd2UgaGF2ZToN
Cj4gDQo+IFNTVEFURV9QQVRIU1BFQ8KgwqAgPQ0KPiAiJHtTU1RBVEVfRElSfS8ke1NTVEFURV9F
WFRSQVBBVEhXSUxEQ0FSRH0ke1BOfS8ke1NTVEFURV9QQVRIX0NVUlJUQVNLfS8ke1NTVEFURV9Q
S0dTUEVDfSpfJHtTU1RBVEVfUEFUSF9DVVJSVEFTS30udGFyLnpzdCoiIA0KPiANCj4gDQo+IEFu
ZCBvdXIgc3N0YXRlIGNhY2hlIGRpcmVjdG9yeSdzIGhpZXJhcmNoeSB1c2VzIGhhc2hbOjJdL2hh
c2hbMjo0XS8gYXMgDQo+IHN1Yi1kaXJlY3Rvcmllcy4NCj4gDQo+IFRoaXMgZXNzZW50aWFsbHkg
bWVhbnMgdGhhdCBhbGwgc3ViLWRpcmVjdG9yaWVzIGFyZSBzZWFyY2hlZC4gVGhpcyANCj4gd291
bGQgdGFrZSBhIGxvbmcgdGltZSwgZXNwZWNpYWxseSB3aGVuIHJ1biBmb3IgdGhlIGZpcnN0IHRp
bWUuIEkgbWFkZSANCj4gc29tZSBjaGFuZ2VzIHRvwqAgb3V0cHV0IHRoZSB0aW1lIGFuZCB0aGUg
bG9ncyBhcmUgYXMgYmVsb3cuDQo+IA0KPiAkIGJpdGJha2UgZ2xpYmMgLWMgY2xlYW5zc3RhdGUN
Cj4gV0FSTklORzogZ2xpYmMtMi4zNC1yMCBkb19jbGVhbnNzdGF0ZTogUmVtb3ZpbmcNCj4gL2Fs
YS1scGdncDcyL3FpY2hlbi9MQVQvYnVpbGRzL3NoYXJlL3NzdGF0ZS1jYWNoZS8qLyovc3N0YXRl
OmdsaWJjOmNvcg0KPiBlMi02NC1wb2t5LWxpbnV4OjIuMzQ6cjA6Y29yZTItNjQ6NzoqX2RlcGxv
eV9zb3VyY2VfZGF0ZV9lcG9jaC50YXIuenN0DQo+ICoNCj4gDQo+IFdBUk5JTkc6IGdsaWJjLTIu
MzQtcjAgZG9fY2xlYW5zc3RhdGU6IFRvb2sgNjExLjg4NjU3MTQwNzMxODEgc2Vjb25kcw0KPiBX
QVJOSU5HOiBnbGliYy0yLjM0LXIwIGRvX2NsZWFuc3N0YXRlOiBSZW1vdmluZw0KPiAvYWxhLWxw
Z2dwNzIvcWljaGVuL0xBVC9idWlsZHMvc2hhcmUvc3N0YXRlLWNhY2hlLyovKi9zc3RhdGU6Z2xp
YmM6Y29yDQo+IGUyLTY0LXBva3ktbGludXg6Mi4zNDpyMDpjb3JlMi02NDo3OipfcGFja2FnZS50
YXIuenN0Kg0KPiANCj4gV0FSTklORzogZ2xpYmMtMi4zNC1yMCBkb19jbGVhbnNzdGF0ZTogVG9v
ayAxLjMyMTkzMjc5MjY2MzU3NDIgc2Vjb25kcw0KPiBXQVJOSU5HOiBnbGliYy0yLjM0LXIwIGRv
X2NsZWFuc3N0YXRlOiBSZW1vdmluZw0KPiAvYWxhLWxwZ2dwNzIvcWljaGVuL0xBVC9idWlsZHMv
c2hhcmUvc3N0YXRlLWNhY2hlLyovKi9zc3RhdGU6Z2xpYmM6Y29yDQo+IGUyLTY0LXBva3ktbGlu
dXg6Mi4zNDpyMDpjb3JlMi02NDo3OipfcGFja2FnZV9xYS50YXIuenN0Kg0KPiANCj4gV0FSTklO
RzogZ2xpYmMtMi4zNC1yMCBkb19jbGVhbnNzdGF0ZTogVG9vayAxLjQ3MDgxNTY1ODU2OTMzNiBz
ZWNvbmRzDQo+IFdBUk5JTkc6IGdsaWJjLTIuMzQtcjAgZG9fY2xlYW5zc3RhdGU6IFJlbW92aW5n
DQo+IC9hbGEtbHBnZ3A3Mi9xaWNoZW4vTEFUL2J1aWxkcy9zaGFyZS9zc3RhdGUtY2FjaGUvKi8q
L3NzdGF0ZTpnbGliYzpjb3INCj4gZTItNjQtcG9reS1saW51eDoyLjM0OnIwOmNvcmUyLTY0Ojc6
Kl9wYWNrYWdlX3dyaXRlX3JwbS50YXIuenN0Kg0KPiANCj4gV0FSTklORzogZ2xpYmMtMi4zNC1y
MCBkb19jbGVhbnNzdGF0ZTogVG9vayAxLjI1MTkzOTA1ODMwMzgzMyBzZWNvbmRzDQo+IFdBUk5J
Tkc6IGdsaWJjLTIuMzQtcjAgZG9fY2xlYW5zc3RhdGU6IFJlbW92aW5nDQo+IC9hbGEtbHBnZ3A3
Mi9xaWNoZW4vTEFUL2J1aWxkcy9zaGFyZS9zc3RhdGUtY2FjaGUvKi8qL3NzdGF0ZTpnbGliYzpj
b3INCj4gZTItNjQtcG9reS1saW51eDoyLjM0OnIwOmNvcmUyLTY0Ojc6Kl9wYWNrYWdlZGF0YS50
YXIuenN0Kg0KPiANCj4gV0FSTklORzogZ2xpYmMtMi4zNC1yMCBkb19jbGVhbnNzdGF0ZTogVG9v
ayAxLjIzNjk4MDE5OTgxMzg0Mjggc2Vjb25kcw0KPiBXQVJOSU5HOiBnbGliYy0yLjM0LXIwIGRv
X2NsZWFuc3N0YXRlOiBSZW1vdmluZw0KPiAvYWxhLWxwZ2dwNzIvcWljaGVuL0xBVC9idWlsZHMv
c2hhcmUvc3N0YXRlLWNhY2hlLyovKi9zc3RhdGU6Z2xpYmM6OjIuDQo+IDM0OnIwOjo3OipfcG9w
dWxhdGVfbGljLnRhci56c3QqDQo+IA0KPiBXQVJOSU5HOiBnbGliYy0yLjM0LXIwIGRvX2NsZWFu
c3N0YXRlOiBUb29rIDEuMTY2ODQyNjk5MDUwOTAzMyBzZWNvbmRzDQo+IFdBUk5JTkc6IGdsaWJj
LTIuMzQtcjAgZG9fY2xlYW5zc3RhdGU6IFJlbW92aW5nDQo+IC9hbGEtbHBnZ3A3Mi9xaWNoZW4v
TEFUL2J1aWxkcy9zaGFyZS9zc3RhdGUtY2FjaGUvKi8qL3NzdGF0ZTpnbGliYzpjb3INCj4gZTIt
NjQtcG9reS1saW51eDoyLjM0OnIwOmNvcmUyLTY0Ojc6Kl9wb3B1bGF0ZV9zeXNyb290LnRhci56
c3QqDQo+IA0KPiBXQVJOSU5HOiBnbGliYy0yLjM0LXIwIGRvX2NsZWFuc3N0YXRlOiBUb29rIDEu
Mzg1NTY4MzgwMzU1ODM1IHNlY29uZHMNCj4gV0FSTklORzogZ2xpYmMtMi4zNC1yMCBkb19jbGVh
bnNzdGF0ZTogUmVtb3ZpbmcNCj4gL2FsYS1scGdncDcyL3FpY2hlbi9MQVQvYnVpbGRzL3NoYXJl
L3NzdGF0ZS1jYWNoZS8qLyovc3N0YXRlOmdsaWJjOmNvcg0KPiBlMi02NC1wb2t5LWxpbnV4OjIu
MzQ6cjA6Y29yZTItNjQ6NzoqX3N0YXNoX2xvY2FsZS50YXIuenN0Kg0KPiANCj4gV0FSTklORzog
Z2xpYmMtMi4zNC1yMCBkb19jbGVhbnNzdGF0ZTogVG9vayAxLjQ4ODQxODEwMjI2NDQwNDMgc2Vj
b25kcw0KPiANCj4gSSBmaWd1cmVkIHRoYXQgdW5saWtlIGdpdCwgd2UgZG8gaGF2ZSBrbm93bGVk
Z2Ugb24gb3VyIHNzdGF0ZSBvYmplY3RzLiANCj4gSXQgZG9lcyBub3Qgc2VlbSBuZWNlc3Nhcnkg
dG8gdXNlIGhhc2ggdmFsdWUgYXMgc3ViIGRpcmVjdG9yeS4gU28gSSANCj4gY2hhbmdlZCB0aGUg
c3N0YXRlIGRpcmVjdG9yeSBoaWVyYXJjaHkgdG8gdXNlICR7UE59L3Rhc2tuYW1lLyBhcyBzdWIg
DQo+IGRpcmVjdG9yaWVzLCBhbmQgaGVyZSdzIHRoZSByZXN1bHQuDQo+IA0KPiAkIGJpdGJha2Ug
bGliZ2NjIC1jIGNsZWFuc3N0YXRlDQo+IA0KPiBXQVJOSU5HOiBsaWJnY2MtMTEuMi4wLXIwIGRv
X2NsZWFuc3N0YXRlOiBSZW1vdmluZw0KPiAvYWxhLWxwZ2dwNzIvcWljaGVuL0xBVC9idWlsZHMv
c2hhcmUvc3N0YXRlLWNhY2hlL2xpYmdjYy9kZXBsb3lfc291cmNlDQo+IF9kYXRlX2Vwb2NoL3Nz
dGF0ZTpsaWJnY2M6Y29yZTItNjQtcG9reS1saW51eDoxMS4yLjA6cjA6Y29yZTItNjQ6NzoqX2QN
Cj4gZXBsb3lfc291cmNlX2RhdGVfZXBvY2gudGFyLnpzdCoNCj4gDQo+IFdBUk5JTkc6IGxpYmdj
Yy0xMS4yLjAtcjAgZG9fY2xlYW5zc3RhdGU6IFRvb2sgMC4wMjA2MzA1OTgwNjgyMzczMDUgDQo+
IHNlY29uZHMNCj4gV0FSTklORzogbGliZ2NjLTExLjIuMC1yMCBkb19jbGVhbnNzdGF0ZTogUmVt
b3ZpbmcNCj4gL2FsYS1scGdncDcyL3FpY2hlbi9MQVQvYnVpbGRzL3NoYXJlL3NzdGF0ZS1jYWNo
ZS9saWJnY2MvcGFja2FnZS9zc3RhdA0KPiBlOmxpYmdjYzpjb3JlMi02NC1wb2t5LWxpbnV4OjEx
LjIuMDpyMDpjb3JlMi02NDo3OipfcGFja2FnZS50YXIuenN0Kg0KPiANCj4gV0FSTklORzogbGli
Z2NjLTExLjIuMC1yMCBkb19jbGVhbnNzdGF0ZTogVG9vayAwLjAwMTE2MDg2MDA2MTY0NTUwNzgg
DQo+IHNlY29uZHMNCj4gV0FSTklORzogbGliZ2NjLTExLjIuMC1yMCBkb19jbGVhbnNzdGF0ZTog
UmVtb3ZpbmcNCj4gL2FsYS1scGdncDcyL3FpY2hlbi9MQVQvYnVpbGRzL3NoYXJlL3NzdGF0ZS1j
YWNoZS9saWJnY2MvcGFja2FnZV9xYS9zcw0KPiB0YXRlOmxpYmdjYzpjb3JlMi02NC1wb2t5LWxp
bnV4OjExLjIuMDpyMDpjb3JlMi02NDo3OipfcGFja2FnZV9xYS50YXIuDQo+IHpzdCoNCj4gDQo+
IFdBUk5JTkc6IGxpYmdjYy0xMS4yLjAtcjAgZG9fY2xlYW5zc3RhdGU6IFRvb2sgMC4wMDA3NTU3
ODY4OTU3NTE5NTMxIA0KPiBzZWNvbmRzDQo+IFdBUk5JTkc6IGxpYmdjYy0xMS4yLjAtcjAgZG9f
Y2xlYW5zc3RhdGU6IFJlbW92aW5nDQo+IC9hbGEtbHBnZ3A3Mi9xaWNoZW4vTEFUL2J1aWxkcy9z
aGFyZS9zc3RhdGUtY2FjaGUvbGliZ2NjL3BhY2thZ2Vfd3JpdGUNCj4gX3JwbS9zc3RhdGU6bGli
Z2NjOmNvcmUyLTY0LXBva3ktbGludXg6MTEuMi4wOnIwOmNvcmUyLTY0Ojc6Kl9wYWNrYWdlXw0K
PiB3cml0ZV9ycG0udGFyLnpzdCoNCj4gDQo+IFdBUk5JTkc6IGxpYmdjYy0xMS4yLjAtcjAgZG9f
Y2xlYW5zc3RhdGU6IFRvb2sgMC4wMDEzOTk1MTcwNTkzMjYxNzE5IA0KPiBzZWNvbmRzDQo+IFdB
Uk5JTkc6IGxpYmdjYy0xMS4yLjAtcjAgZG9fY2xlYW5zc3RhdGU6IFJlbW92aW5nDQo+IC9hbGEt
bHBnZ3A3Mi9xaWNoZW4vTEFUL2J1aWxkcy9zaGFyZS9zc3RhdGUtY2FjaGUvbGliZ2NjL3BhY2th
Z2VkYXRhL3MNCj4gc3RhdGU6bGliZ2NjOmNvcmUyLTY0LXBva3ktbGludXg6MTEuMi4wOnIwOmNv
cmUyLTY0Ojc6Kl9wYWNrYWdlZGF0YS50YQ0KPiByLnpzdCoNCj4gDQo+IFdBUk5JTkc6IGxpYmdj
Yy0xMS4yLjAtcjAgZG9fY2xlYW5zc3RhdGU6IFRvb2sgMC4wMDA3NDg4NzI3NTY5NTgwMDc4IA0K
PiBzZWNvbmRzDQo+IFdBUk5JTkc6IGxpYmdjYy0xMS4yLjAtcjAgZG9fY2xlYW5zc3RhdGU6IFJl
bW92aW5nDQo+IC9hbGEtbHBnZ3A3Mi9xaWNoZW4vTEFUL2J1aWxkcy9zaGFyZS9zc3RhdGUtY2Fj
aGUvbGliZ2NjL3BvcHVsYXRlX2xpYy8NCj4gc3N0YXRlOmxpYmdjYzo6MTEuMi4wOnIwOjo3Oipf
cG9wdWxhdGVfbGljLnRhci56c3QqDQo+IA0KPiBXQVJOSU5HOiBsaWJnY2MtMTEuMi4wLXIwIGRv
X2NsZWFuc3N0YXRlOiBUb29rIDAuMDAwNTg5NjA5MTQ2MTE4MTY0MSANCj4gc2Vjb25kcw0KPiBX
QVJOSU5HOiBsaWJnY2MtMTEuMi4wLXIwIGRvX2NsZWFuc3N0YXRlOiBSZW1vdmluZw0KPiAvYWxh
LWxwZ2dwNzIvcWljaGVuL0xBVC9idWlsZHMvc2hhcmUvc3N0YXRlLWNhY2hlL2xpYmdjYy9wb3B1
bGF0ZV9zeXNyDQo+IG9vdC9zc3RhdGU6bGliZ2NjOmNvcmUyLTY0LXBva3ktbGludXg6MTEuMi4w
OnIwOmNvcmUyLTY0Ojc6Kl9wb3B1bGF0ZV8NCj4gc3lzcm9vdC50YXIuenN0Kg0KPiANCj4gV0FS
TklORzogbGliZ2NjLTExLjIuMC1yMCBkb19jbGVhbnNzdGF0ZTogVG9vayAwLjAwMDgwMTA4NjQy
NTc4MTI1IA0KPiBzZWNvbmRzDQo+IA0KPiBJdCdzIG11Y2ggZmFzdGVyLg0KPiANCj4gSW4gYWRk
aXRpb24sIHRoZSBzdWIgZGlycyBub3cgZ2l2ZSBtb3JlIGluZm8sIHdoaWNoIHNob3VsZCBwb3Rl
bnRpYWxseSANCj4gbWFrZSBzc3RhdGUgY2FjaGUgZWFzaWVyIHRvIG1hbmFnZS4NCj4gDQo+IEF0
dGFjaGVkIGlzIHRoZSBwYXRjaCB0byBxdWlja2x5IHRyeSB0aGluZ3Mgb3V0LiBIb3BlIHRvIGhl
YXIgeW91ciANCj4gb3BpbmlvbnMuDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IA0KPiBDaGVuIFFp
DQo+IA0KDQpJIHRob3VnaHQgdGhpcyBzb3VuZGVkIGludGVyZXN0aW5nLiBIYXMgYW55dGhpbmcg
Y29tZSBvdXQgb2YgdGhpcyB0aGF0IEkgbWlzc2VkID8NCg0KSmFjb2INCg==

