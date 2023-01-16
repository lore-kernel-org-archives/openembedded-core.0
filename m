Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C846AC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 09:26:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.162689.1673861198237181600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 01:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IvlGzYFp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03803bb0c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G901A7004206
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:26:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rIT3QZcaS1GI8dGsqnDInAYPZiXHmIjwZBqA6EcRRi0=;
 b=IvlGzYFpdQi/ZOLGbD/PAkkSIEKwvaB/LNkDaHk8Jys8QbFdJpPxqeeWIiMFS/xWA7qO
 zeJ6JKVAqc+1GXh0xsn7AYTSmW6cWBBf9uX36B02jvErCvaI3EcEZC7Cz1O4T8tXfmdd
 IJdBUVPrS90FWYSTq5pjnnRFP35y11oKyQewG14HMKAifc5CVEwYtSpDnUWKOp5ta5s/
 WR2RhCy3lMdp3UCbcgLkPnNDWV6NEBHlNgP9Xz+9yM0EzVnjYNMbiEVwzAN1X6lN7p19
 N+Gq8y/mjlwsDPAoHj7U4sduSJJg37P/qfQWT+IY1/nYX0CfK5cdRMG4vLdvNtmcjLWV OA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6sk4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:26:37 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30G9Qb9s003904
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:26:37 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6sk4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 01:26:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipJbz3lSWyaSsAjW3PunKjM8CWyZMwJUhlW+fwyfW8+Dy2zKM9zBmvPxr1DUzOqfb+3ydvfE8ZBJBSFpH6Vwq5b+dEq++VF2klaEIc/VR9xiWMTsIHjoRZrFNgewWvGCQcpxrLZvMsXEUT3pp3u+neTFZx7Rpj3TMHnb+sNdyW5HeCfo9cDl6ucCf6dJEH1XQAbiJdgBcBVrq2Ah44Cj3B351D8NynuX5mxwSdUp6T8Bb/t67A/ltxAttmk15leyugKnMA/Xgo5p8Ds3ML0GR8eS2znTwr88c0DDsQw6wVmyDYQQlIbiinRDqN+yuoN3dHG5gIAJXY0WV3ZFmPpJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIT3QZcaS1GI8dGsqnDInAYPZiXHmIjwZBqA6EcRRi0=;
 b=D5/4uHxffnaDJL72I8z5iDCcuWofol8Eyw8fabaZKc/XOnySVR+GYMQcySs8mFClBEDqIQ2qje8IEBecMVXX+XXQ5q6jH/8TFHoSeKQPRzbJAT3Pmp+XgTfrMFRzfpe2UEYxbyjYU3Xm1UY5rgkW0qJw517ov3Qmi7BS3yTIy+9JiL94E75mB30v00fQnC8Lzic9nOW03ylLGn689UqQj/4Bi4azZXBsV0z+rremON0PjWlKhjDqJrLGTE5OVU/2pGksd/oWJXKQikonGD8nEtWALr2ps65GitTXvnR1JrWryzf9eE4+OaY3/qi64ldLYKLe1Uv47oj2bfB4gY7p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.21; Mon, 16 Jan
 2023 09:26:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 09:26:32 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
Thread-Topic: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
Thread-Index: AQHZKYdLXC5S7rwzmUaAsaE+qYJX066gw6gAgAACEfA=
Date: Mon, 16 Jan 2023 09:26:32 +0000
Message-ID: 
 <CO6PR11MB560292113F663792C30B79DFEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
 <CANNYZj9h_X1dKVuPfC+OpL4VOA-=nRy54eZHvrDfieW6AM4vWA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9h_X1dKVuPfC+OpL4VOA-=nRy54eZHvrDfieW6AM4vWA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB6395:EE_
x-ms-office365-filtering-correlation-id: 307509e2-9606-4692-d6da-08daf7a3c178
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SNtgOX566kdTDk3J0S0hMDBtPTR/Zwp4upNxHZ8ELKMGot4sk8hp6OjKRyfqnV4/E8FvtHeHaP4sQV0dVP0VKIgR6itNk0eNSt79se+jN9IFFKDeaHADTh0ekPaflLN4HCcRxjFTPajjVV3MF0w5CONleCHcSPFN4kzfrD5GHn/SbAGGAor/BDq6BjSp4BOEXZemHjPdNAmfEppyfflPie40mZPCmeOujoyYsygDZhlPGwqmeVK3WQSgMdmyN2fiUR8eKZsohtRPWabFgqh9op4phW8u8urUMS2C0eOX5Lp/xIKjS3ZLQN7ap+E0fJhbplkkzxOlCECPAxRf9al9AvONdOTM5fCf8Vkt55KE9SO2+1xTKwR7YFcUQgwdKcbZSw7WTvgpCCyfR4hHLvypmlubtuoGUgPb5VWclSKU0B0S8p364gWXA63ezxmV8EwutiD6iQGYGtszxFAgmM4KK8dAjNOF9OO+cgSSJdDcku5oAr/zY+ZKG3DGMwJ3dnWSPHp1LrwViuHLF80pN5pA1zZplPswbfjuwVuHQUh0b///cbfn+n1YaxrFyIIMhtroOyP4w+PRNaQB9xB3rnmGnaVULZsopsawEoV/Z0VPygMN1j6QTgnqBkAXh0IfXMee72rsS3PWw71U5oCtFSkjHS/KA/5IuGoDvaahScScJ/zOyYi0cYs6IwE32k204XP1DYhGq3PvcIA6fhlEoTJdLlVDc3qnaX6EuiwgPAM5Ppd8In1Iu/nRHX2ml+KbzBjKmdGBZJke+MgV7E1tnv5RvQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(451199015)(66899015)(64756008)(53546011)(83380400001)(26005)(33656002)(66946007)(76116006)(4326008)(9686003)(8676002)(186003)(66476007)(66446008)(66556008)(41300700001)(86362001)(38100700002)(5660300002)(52536014)(8936002)(55016003)(2906002)(6916009)(478600001)(6506007)(7696005)(71200400001)(316002)(966005)(38070700005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmtBOHlFZnlqdERQYjdLa1lNWW9oWlhYT2NSc3FGUlVNOWwvd241clBrR2lK?=
 =?utf-8?B?R2VqL0gyanlHVG1OR3pqUUk0bjN0eFhwR2VjanRrYTJsNHJhYW5OTG0rOXZl?=
 =?utf-8?B?Y0NLdFgwVDFJR1dCNlRKQm5SM2NncVVrcWpUMytaQ0hYSWdGWHIxcExLRjNm?=
 =?utf-8?B?Z2ZOUWQ1VlFjNDJPMUtDcmlpUFl5U0VQVjdUWTRUaDVoZVZEK1V3UXZVZFhw?=
 =?utf-8?B?T1ZPbWdFN09vallmc1pTMlRGdEI5Q2dtTEh2bXRxWCtBSjNQOUJXSytDY3A4?=
 =?utf-8?B?SWY4VzNENUhhTEozNHJVZ0xrQUVLS05uaTNRcGp5eVhHb09hZVprbnN6bjMz?=
 =?utf-8?B?SWREY0tyQUQ1N0RMTS8xVDhJQjZ3Yit0dUoyY3R3OEI2SjdpaVhzNk92ejlh?=
 =?utf-8?B?eHd5VHpUUlkwclIwVVVlNEdxZjBodE5XQ0s3U0o1NVVOeEdjeHZ2Y3ZNbE42?=
 =?utf-8?B?aTVicGdRcGZqMno2cGJReFMzNEVtOW1ybWsrcms4cDkzakRCeVAySlVlNWxX?=
 =?utf-8?B?UStjWCtJc2E0TDhjS3FKSStxeW1OZEZTRUVpSGVKWExScWh5Vy9QRUdwSGdK?=
 =?utf-8?B?MWl0MzZnR3F6cDZnSUxFdmx5WUc5ZXd3aEVweFF6V1RGTTdqT1NSb0Nqd2la?=
 =?utf-8?B?L0pIVExkVWQxQktYSGFiVHhteG8wbmJjUFlKM3NWWXBsWExVb1YvMXY2K3pT?=
 =?utf-8?B?czZ0bWRrODAxZjFMa1l0YjdDbW5DdXY1WFduZVkxeGxJSVBnTGlUYU11MEtZ?=
 =?utf-8?B?ZHNGR0pnZHFIZkwybUc0TXJFYzlTN05YZnJjTGRrNzZoZlJXcHpXd0IybXZt?=
 =?utf-8?B?eGR2L3pkUjQxMFJ2SjhUT3lMcVZpbGw0azd2eGYxUGlKdHBDaXhuNXNidUdo?=
 =?utf-8?B?RDdraGF4SHFXUGtVM2tRV3FNRDNLYVVsTjJycFVtaDdZUEE1M0FkZ3h0eVZx?=
 =?utf-8?B?UC9YK0JYYitIclJ6MmxncEMzZHVqdmFrajhRWndTQlAzRHM4dTZ2c25PVVVn?=
 =?utf-8?B?dWwrZFo3SUJFZ20ySTcrVGpwWkp3QkdzWVVsLyt0aThwa3puR0VYTEFiZXhk?=
 =?utf-8?B?ZStTaE4xM1pDbDg3dWoxMEkxUEU2TGVGTSt6dnEwbmJETW5nUHlZQ0llSnFO?=
 =?utf-8?B?bEpNN1U1ZG1Fajlmb0FFWUdPQ3VRRXVaOFlScFEybk9seVRDbXdBQkszamx0?=
 =?utf-8?B?Tzl1WHZEeW5IMDBHUFJZRXdkcTJnMU1GV1g1aGJVQktvWDhjemtBalFMUFkw?=
 =?utf-8?B?U0NON3NRZm9XNmJxUkNheXRGMHhzMXBna3FGV04rNzRRdFdPWFBCZDBpWDdZ?=
 =?utf-8?B?K2dQV24wUGJReW9KTzV6UGpIT0FPNnVFbm5lRTQ4Q24xMS9tZkhNT0U1c0xl?=
 =?utf-8?B?OFNaSG51WDl1QnNEY0d0dE1nakNtNEdEbFBLK1BUVjB5QUtBeDJIQjErdFZm?=
 =?utf-8?B?VW5tczVRUUJ3Vkw3Rk45UXhMVkpoU0xwZ0tnTHVXMUM1ZWRBL285b1RjMFZ3?=
 =?utf-8?B?aklDTldIa09JQVJIYTd5WGU3RngwcEQ2QmlwSkdReXhPRWhPVksvQUkxeTNN?=
 =?utf-8?B?VXVVVWRLWkNCcS8zblNWcGNHZTl6WXhCSW1rYTU5ZysrNEJ5Nmt3MHhieExs?=
 =?utf-8?B?N2xCNlA5MXZrQzd1QjlTeE1HUFc4dThzRzdTcnZSbm1vM2FrWTRRbE9Kbkw0?=
 =?utf-8?B?eHRwc1I3T1NjT2NaQzNXbllyaFVMeGFQS1c2OUV1WERqdHRjNXpIYk0veGJj?=
 =?utf-8?B?WkQvcWdCc3p3NGFBU2hBbWM0ZkNBYTJKK3NMVmRPS2ZYMWhsNHNPNTZxbTg0?=
 =?utf-8?B?ekVkanhvOEhWZFlIV1luMFBlOEExelJUUWhXNGhmSDB2c2w5MEhPWHZYOHlm?=
 =?utf-8?B?U2E1S2xBTk51blEvZFB4Zm5aSUpVQXR3ME5UQ3IvaFA1SWpWRitOWGNZek1q?=
 =?utf-8?B?Z1ZRRlQ3eDcwcC82QmJtNFJtSXJUTnBLVkZsbmxMT05KK1RHN285UXV3S1hi?=
 =?utf-8?B?MDJEL0NkazBpSWtLU3h1b1ZBTU9VMDZBS1Q1a051eVMzV3hOVVdNejY1NWQ4?=
 =?utf-8?B?TXJKZXlqUjBPaW4vN3FIb1hTZzZyckZidGJKVmVETkJERDg3MWhhNWY5d3RK?=
 =?utf-8?Q?1Qzwh5NbQVEOpnXzr9df1uuvT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307509e2-9606-4692-d6da-08daf7a3c178
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 09:26:32.3530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Dw2/fy7ZMmIoG8B8GO/wfUu1ajH2eDmGvP7nP+gRGmzYkOSqIWu0BAnsNCyyiHIgCw2MPzqJeVdEFE0Ef0DGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-Proofpoint-GUID: osnGknIEu0moXiCJePzCrD9IymlkPxnU
X-Proofpoint-ORIG-GUID: wO6SORvjL1htH5vaLGcPmEiMFsA9oi6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=944 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175966

VGhpcyBpcyBiZWNhdXNlIHRoZSBNQUdJQyB2YXIgaXMgcG9pbnRpbmcgYSBmaWxlIHRoYXQgZG9l
cyBub3QgZXhpc3QuIEFuZCB0aGUgZmlsZSBpcyBwcm92aWRlZCBieSBuYXRpdmVzZGstZmlsZS4N
Cg0KU29tZSBvZiB0aGUgc3RyYWNlIG91dHB1dDoNCm9wZW5hdChBVF9GRENXRCwgIi9idWlsZGFy
ZWEyL2NoZW5xaS9idWlsZHMvYnVpbGQtcG9reS1zeXN2aW5pdC9zZGtpbnN0L3N5c3Jvb3RzL3g4
Nl82NC1wb2t5c2RrLWxpbnV4L3Vzci9zaGFyZS9taXNjL21hZ2ljLm1nYyIsIE9fUkRPTkxZKSA9
IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkNCnN0YXQoIi9idWlsZGFyZWEy
L2NoZW5xaS9idWlsZHMvYnVpbGQtcG9reS1zeXN2aW5pdC9zZGtpbnN0L3N5c3Jvb3RzL3g4Nl82
NC1wb2t5c2RrLWxpbnV4L3Vzci9zaGFyZS9taXNjL21hZ2ljLm1nYyIsIDB4N2ZmY2RkYjExMzMw
KSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkNCm9wZW5hdChBVF9GRENX
RCwgIi9idWlsZGFyZWEyL2NoZW5xaS9idWlsZHMvYnVpbGQtcG9reS1zeXN2aW5pdC9zZGtpbnN0
L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4L3Vzci9zaGFyZS9taXNjL21hZ2ljLm1nYyIs
IE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkNCndyaXRl
KDIsICJmaWxlOiBjb3VsZCBub3QgZmluZCBhbnkgdmFsaWQgbSIuLi4sIDQ0KSA9IDQ0DQpleGl0
X2dyb3VwKDEpICAgICAgICAgICAgICAgICAgICAgICAgICAgPSA/DQorKysgZXhpdGVkIHdpdGgg
MSArKysNCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBNb25k
YXksIEphbnVhcnkgMTYsIDIwMjMgNToxOCBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gcnBtOiBtYWtlIG5hdGl2ZXNkay1ycG0gcmRl
cGVuZCBvbiBuYXRpdmVzZGstZmlsZQ0KDQpJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBp
c3N1ZS4gV2h5IGlzbid0IGZpbGUgZnJvbSB0aGUgaG9zdCB3b3JraW5nIHByb3Blcmx5IGluIHRo
ZSBwcmVzZW5jZSBvZiB0aGUgTUFHSUMgZW52IHZhcj8NCg0KQWxleA0KDQpPbiBNb24sIDE2IEph
biAyMDIzIGF0IDA5OjQ4LCBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+IHdyb3RlOg0K
Pg0KPiBGb3Igbm93LCBydW5uaW5nIGBmaWxlJyBpbnNpZGUgU0RLIGVycm9ycyBvdXQuDQo+ICAg
ZmlsZTogY291bGQgbm90IGZpbmQgYW55IHZhbGlkIG1hZ2ljIGZpbGVzIQ0KPg0KPiBUaGlzIGlz
IGJlY2F1c2UgbmF0aXZlc2RrLXJwbSBleHBvcnRzIE1BR0lDLiBTbyBsZXQncyBtYWtlIA0KPiBu
YXRpdmVzZGstcnBtIGRlcGVuZCBvbiBmaWxlIGZvciBiZXR0ZXIgdXNlciBleHBlcmllbmNlcy4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAt
LS0NCj4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTguMC5iYiB8IDEgKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE4LjAuYmIgDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3JwbS9ycG1fNC4xOC4wLmJiDQo+IGluZGV4IDhlYjBhYjIwN2UuLjNiN2Q0ZDY0MGEgMTAw
NjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTguMC5iYg0KPiAr
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE4LjAuYmINCj4gQEAgLTE4OCw2
ICsxODgsNyBAQCBQUk9WSURFUyArPSAicHl0aG9uMy1ycG0iDQo+ICBGSUxFUzpweXRob24zLXJw
bSA9ICIke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9ycG0vKiINCj4NCj4gIFJERVBFTkRTOiR7
UE59LWJ1aWxkID0gImJhc2ggcGVybCBweXRob24zLWNvcmUiDQo+ICtSREVQRU5EUzpuYXRpdmVz
ZGstcnBtICs9ICJuYXRpdmVzZGstZmlsZSINCj4NCj4gIFBBQ0tBR0VfUFJFUFJPQ0VTU19GVU5D
UyArPSAicnBtX3BhY2thZ2VfcHJlcHJvY2VzcyINCj4NCj4gLS0NCj4gMi4xNy4xDQo+DQo+DQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2Fn
ZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3NTk2Myk6IA0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzE3NTk2Mw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC85NjMwMzI1Ni8xNjg2NDg5DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29y
ZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW2FsZXgu
a2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQo=

