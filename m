Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608DDC3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 00:07:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1375.1705363671093866719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 16:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eDJy1rog;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17456644bb=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40FN8mEo002643
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:07:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=kr8qG
	E9IPVCjXvFD5YmO19FCatpEidxLwHkPLNTRJTE=; b=eDJy1rogK8xvY7+G6UftM
	cLVT0nmNGa8INujeM5AxmjL7+GVAHTqPGHYKS+iY8nSNp14YRHg2j6PipA9NrNIU
	QxBNbLSnSNgqpQbPaQPOwYGkXQp544TXI+OrQ0UwWbppjcVoRJB2CITiovlJHu6P
	1+x6eZLAuEDUg3znwCP6OYkDeSe6j009GmakmB2NgM1Dy+PBubRXbDDFJ0HXzbDL
	0yUGS5JfFu1E/MhZ4s+k4XkbUMm+QYjpklyhfVOe6Kh2Orl8vusaegScASKDuF19
	zRtATJe0qoZLt3y8WmdXt4DlaIeZ+LNu96qgsM3x3CyhdgDwOOg4F+XOiaFNoaoL
	A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp42d47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaCCLC+aWvnHMTGSnSa+RtjxcIkvxU4W3ex/4LvdCDN1W2phdtPlkFn3TNob4na4RRzS8R5uFfU4s8xIKnCfMMZB2kFo94EUrkQys2OjFF0k1Q69/OJAIjKb9EDts95X1Nc8oR2TaKEcN24A1JNP2wa+7P6mdlZcd9e8+yPnCs64FbfatvnxdM+o6OwXJ0y89z5SXlDJybPCskRGVOERx8vzSqcDNgZePGmlp+DbY9cnup+2XKa02JrVrLAn9gp9XT11N/OX4xI1k//vdx2eWw4h/Ea/pr5j8TeBmP0Y8xbugxJXlaz+TAsId+L8rbJTJeszBk/ROBNVsI2XWNWlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr8qGE9IPVCjXvFD5YmO19FCatpEidxLwHkPLNTRJTE=;
 b=MRl2Bx203fbKAuf8vH7x9pcKEz3vc8MeRwkqSxuTnxACM/simk2JUvNMomHdJ0ACseIqyNKE+uxTEf7czBAxlpSxNnDSOBO6k48+/OPH1UCKbht/Bi/a4kJiOanKgBq0HZX9uTKj+4eeaj2yuhVDZG+CB7Ew0Za+IAMBl+kaLRwDnVcqtoDaYKbRuzb97pNSxRdoisBAJpxfZ4TPRfGXYzE9N8Q/3H9qc+2E8WQqdHOdAJLWjMA7Ew6bXTeNQxumKH5XnuQOR0fxYR/RNATqgv6UezQTweHGab3H9mJpNwAlsTT7Bt6eLRZ7zE7F4W73K2DWBVOeJAIDf9n/RsCErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Tue, 16 Jan
 2024 00:07:47 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 00:07:47 +0000
From: "Lyu, William" <William.Lyu@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: "ptest-pkgs" image feature misses ptest package dependencies due to
 COMPLEMENTARY_GLOB ignoring all RRECOMMENDS
Thread-Topic: "ptest-pkgs" image feature misses ptest package dependencies due
 to COMPLEMENTARY_GLOB ignoring all RRECOMMENDS
Thread-Index: AdpID/bzmbN1T9eUQdGlsoQAILjkig==
Date: Tue, 16 Jan 2024 00:07:47 +0000
Message-ID: 
 <CY5PR11MB634272E04107134EBD25ED0EEE732@CY5PR11MB6342.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6342:EE_|DS0PR11MB7460:EE_
x-ms-office365-filtering-correlation-id: 969d40cc-120d-4493-e295-08dc16272bd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MqeK/13FL7eG1S45YmeHnt4LB3KUtbTnyvlTy5h6LX6aN7TOTL8g8ko7XJBccuwE9O3ciY5khPvzO+S28lTbpigp5BhaiZXmqdGlmvWr11MuFqbwMwTirg5yp2QZOKsiEZehZMy2LPRAJjLw2+giAsvR4h0ZxtK5etAFnJbPR1j+6XOoNKDVcVCEl4rF/YKuUFeJLioFgV6a71pqz+0lHk7iK5pnIMXv0YGLMD/5oxXKLpxYIxgiR8nXb9AwO1yZUjCC9/2oVDjv8rW6tgphX6iZy9DbEsJAaszVjwfAyfYeyDxSMyTZraHjr34NnOFFFJ96abOWjev0tWde40hcEkQEn2xVRUlVK68vAJ0PBnfepIQ6/l0UVQ0JTjRxmMbV8TXdX7Oh+/GKShkO4k8EwnghsQ5Es3DSExt6J9dZWf71WX5Y4i1FxkKb05HAkjyQOmeRZTJ1npsjCUlVEGSbBbNZBI05fJOKpKYvCCLxsVB3wZnOllL2UhsCStSBgO0hV7zylprVCnZiOZNGy759hl3a32AthTJspIyxhI4wSvVpHWVIvNKvHT1/FSojNBINQKAYP0T/HRmWZAuSPIJMVp0baT9aMqfvcbu/SkbAKJTdulvufjq1l356Ny/KSZXUTBAEhJWlYlUyVQbY7WHuNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(107886003)(83380400001)(26005)(9686003)(66946007)(38100700002)(122000001)(52536014)(5660300002)(71200400001)(8936002)(8676002)(4326008)(41300700001)(478600001)(966005)(2906002)(6506007)(66476007)(64756008)(66556008)(66446008)(76116006)(316002)(6916009)(7696005)(86362001)(33656002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmVTRVJXV29YVk1IT2RCaTZ3Mmk2NmRXWkU2SjBzOEIwOGh0alEwUDUzY0lw?=
 =?utf-8?B?bjlwVWlWOWdaaUxBMnlpekRkOFc2YjRBc1VDZWNjbjErVXVlaUloa0tNMkhO?=
 =?utf-8?B?ZVM1T09ISkxIaG9RVlBqODErbU1Da29xTE5wcTZSWGpUSGJzZ2dZcFp6TzF4?=
 =?utf-8?B?MytuQ2FZU2FmeUp1d29Ic1JQeFdDeWZjRlZzMHZNNnFpNysySi9vU2ZJMlFE?=
 =?utf-8?B?M3QzOXU1cEd3L2pZWnRvK2Rib3JLT0hBOVdxZ1dGeFp1QkozRWFnUXNDazho?=
 =?utf-8?B?RzYyY0h4bVZEdnNJTEppZThaRFU4Q2ZzM1JHVDdVQXNxK2xsT2IyUGV5RTNG?=
 =?utf-8?B?WlNCTmpqYWdBMWVDbzZMTnFZRW9sNFh1T2MxQ0NGbG1ZdVZsdFNsdHBNYzlq?=
 =?utf-8?B?LzBtV25yelJDR2gxNngxY2JnU0RoT3RPSVpDSUQ5b29LQTFIV3hrQWNJNGJX?=
 =?utf-8?B?SmRGaHN3aE8rc01uRmxNdnJsOXcvNmM3RG9Fb29YZ1V1d28zZmFGVWp3Z1hw?=
 =?utf-8?B?RC9FQ1ZNQWZ0THVQdGJua2JkY1E5WG1OWEN1d1FDRWhma3MyZzRTR1JtQmw4?=
 =?utf-8?B?eVBwcEN4Sm9ZQURxemJzQTlPOExad1U0SWt5K3VZVEhXMTg2N0tOZ2JEZ1hJ?=
 =?utf-8?B?R25vWGZSODVSMVBtQjdTTW1IMFV5d3QrWThwRkcxaklSNEs1UG9GREFGSGNZ?=
 =?utf-8?B?bXp0L2RLT0hkWHFoUVRhbno1dTVRV3ZjazZJSGFjV2xuZys4UGlBbnVsSGF1?=
 =?utf-8?B?cjBBcFNnNkJ5Z2JaU3p4RnJ0amhyRUNwR2YwVGh1ZEdLaE9iRVMvUC82dHRJ?=
 =?utf-8?B?K3h3b1BGZlNjTTRmVWdaMWF2T0w4NkFBRmJqbytPcWdFS2FOK1hjekphTHcw?=
 =?utf-8?B?YzNJbjV0Ui9mRHMyYjlyeVliZ0lxbDdNNnlsSW1BemZidStXSHJsWEczanps?=
 =?utf-8?B?blZ5d1ROUi9SZll0T3NQVmlxUktVbm9neVN1aXpnaWF6NkpPWTEwQ2hjRXpD?=
 =?utf-8?B?UzhaTnFTT3drVzRmMFRXakxQTW44NStKZEZ1RXVDOEgrL3o2VnB0MHZlRWxa?=
 =?utf-8?B?MElyKzMrZVhQQ1pNK2ZjU2xEUmp3RG1DaHNQSWJLTDU1OTR3ZEJTSUdlOUVv?=
 =?utf-8?B?VG9ubjBRZkRxWm5WQjFYNVhvSWNUU3NQMVR2L1Z4Q0NsRDRWdEVxa2VKTyts?=
 =?utf-8?B?MGxwLy9UOVZFczNkMDFqZU5PSnZYbWplRjBYT1VWVFh4Qkt5MFpEVEM2L1JX?=
 =?utf-8?B?a2R1eUFGeXlENFBrK3FOL3JlV2VreE5tVXVRU3N3c0x1TlRyK1ozd0ZTc2po?=
 =?utf-8?B?cHFScDI0WjA0U1R0dmJUL1FrRlhDblJGYS81VVQrMGM3SU5wM3lsRG9VOFNn?=
 =?utf-8?B?djJuMFpWbGhlSkFxbUNCRzROUkVDa0Z2VEJlSW00eVcxTFY3V1A2WHVtZmMw?=
 =?utf-8?B?U28wZUtkaU1INWFLM2VGd0FsWkQ3eEtqcWMzd3lUcHYyUXpqcEdvb1BTWTZn?=
 =?utf-8?B?SUhVUE00dm8yNmJpcUVKV0NBaHB2SG1pOFVpRTd0YmdQZHBCUTRrU1UrWkFY?=
 =?utf-8?B?eFdiMkd6cXRDTWNNMzhnWUNPb3AzTFlFcSttSnVjd1NsUFhQZEVwM3B6bCtr?=
 =?utf-8?B?SjQySUhTV2IxdGlublVJV0ZHeXEwZzc4U3RkS2dQQjZvdGYvTlpJTjY3TU5B?=
 =?utf-8?B?YmZRdzA5dGplck8vbGZNWlMyQW5wWVhjZG9ZV1hKc3VvZ2szNHd2NE9aRTBT?=
 =?utf-8?B?OXFvMTFGb1NEWElEZmpUZE90ZUdtTHEvY1BhZFdvSXJHWmswWGZ3VG9MTHB0?=
 =?utf-8?B?L1l5SXJQTDZiUnFLenFzUm5WNnJ0NjlsRjJ6YkUwcnBlVFozbm45MEtacHB3?=
 =?utf-8?B?eXhrOTV3Nnh2RmFHWW9oTk1DK0lWZmxPSUlaNit6dlpaVHZmeE82a2pxdm1E?=
 =?utf-8?B?a2VQR1lGTFp5dG84bnRzd0x2ZXo3bDJ5MzE2ay9XUDg5ekc3VC95NnU0MVh2?=
 =?utf-8?B?VEh1c21POVJ5aThqaGUzeFBtcC9oMkhqWVVWSXIrb0RjeVIrZU9VWktzSlI2?=
 =?utf-8?B?WjY0QU00YlJDdm1TZUJKaUlmeGhUTEUzak80T01obUhHTXUzZ0pxUkg0ZlF3?=
 =?utf-8?Q?pQM7oKkCIPUbaVFd3zcs8PlUo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969d40cc-120d-4493-e295-08dc16272bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 00:07:47.4542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJfKBr5ICAsm0iBOctC6aUUjdcqQ7JM9OALSSbS9vwoG4m58ENUoSi3AE0dHX2D20pngG4M21kIK3CWnF2IgsCf3RwxcgPEmXHelk2+Sw5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
X-Proofpoint-GUID: Xfj4zf3NKBkRdmGWHAjzysi0gEE2rRay
X-Proofpoint-ORIG-GUID: Xfj4zf3NKBkRdmGWHAjzysi0gEE2rRay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=706 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193807

V2hlbiBJIHRyeSB0byBidWlsZCBhIGNvcmUtaW1hZ2UtbWluaW1hbCBpbWFnZSB3aXRoIHB0ZXN0
IGZvciBvcGVuc3NsIGluc3RhbGxlZCB1c2luZyB0aGUgZm9sbG93aW5nIGNvbmYvbG9jYWwuY29u
ZiBtb2RpZmljYXRpb25zLCB0aGUgb3BlbnNzbC1wdGVzdCBpcyBpbnN0YWxsZWQgYnV0IHdpdGgg
bWlzc2luZyBydW50aW1lIGRlcGVuZGVuY2llcy4NCg0KICAgIERJU1RST19GRUFUVVJFUzphcHBl
bmQgPSAiIHB0ZXN0Ig0KICAgIEVYVFJBX0lNQUdFX0ZFQVRVUkVTICs9ICIgcHRlc3QtcGtncyIN
CiAgICBQVEVTVF9FTkFCTEVEID0gIjEiDQogICAgSU1BR0VfSU5TVEFMTDphcHBlbmQgPSAiIG9w
ZW5zc2wiDQoNCldoZW4gSSBib290IHRoZSBpbWFnZSBhbmQgdHJ5IHRvIHJ1biB0aGUgcHRlc3Qg
Zm9yIG9wZW5zc2wsIEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3IgY29tcGxhaW5pbmcgYWJvdXQg
bWlzc2luZyBkZXBlbmRlbmNpZXMgaW4gdGhlIG91dHB1dDoNCg0KICAgICMgcHRlc3QtcnVubmVy
IG9wZW5zc2wgLXQgMzAwMA0KICAgIEJFR0lOOiAvdXNyL2xpYi9vcGVuc3NsL3B0ZXN0DQogICAg
Q2FuJ3QgbG9jYXRlIEZpbGUvU3BlYy9GdW5jdGlvbnMucG0gaW4gQElOQyAuLi4NCiAgICAuLi4N
Cg0KVGhpcyBlcnJvciBpcyBkdWUgdG8gcGFja2FnZSBwZXJsLW1vZHVsZS1maWxlLXNwZWMtZnVu
Y3Rpb25zLCBhbG9uZyB3aXRoIHNvbWUgb3RoZXIgcGVybC1tb2R1bGUtKiBwYWNrYWdlcywgbm90
IGJlaW5nIGluc3RhbGxlZCAtIHRoZXNlIHBhY2thZ2VzIGFyZSBtaXNzaW5nIGluIHRoZSAubWFu
aWZlc3QgZmlsZSBpbiB0aGUgZGlyZWN0b3J5IGNvbnRhaW5pbmcgdGhlIGJ1aWx0IGltYWdlLiBU
aGUgZGVwZW5kZW5jeSBmb3IgdGhlc2UgcGFja2FnZXMgaXMgYXMgZm9sbG93cy4NCg0Kb3BlbnNz
bC1wdGVzdCAtLShSREVQRU5EUyktLT4gcGVybC1tb2R1bGVzIC0tKFJSRUNPTU1FTkRTKS0tPiBw
ZXJsLW1vZHVsZS1maWxlLXNwZWMtZnVuY3Rpb25zDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXC0oUlJFQ09NTUVORFMpLS0+IHNvbWUgb3RoZXIgcGVybC1tb2R1
bGUtKiBwYWNrYWdlcw0KDQoicHRlc3QtcGtncyIgYWxvbmcgd2l0aCB2YXJpb3VzIG90aGVyIGlt
YWdlIGZlYXR1cmVzIGFyZSBkZWZpbmVkIGFzIENPTVBMRU1FTlRBUllfR0xPQiBpbiBtZXRhL2Ns
YXNzZXMtcmVjaXBlL3BvcHVsYXRlX3Nka19iYXNlLmJiY2xhc3MgaW4gb3BlbmVtYmVkZGVkLWNv
cmU6DQoNCiAgICBDT01QTEVNRU5UQVJZX0dMT0JbcHRlc3QtcGtnc10gPSAnKi1wdGVzdCAke01M
UFJFRklYfXB0ZXN0LXJ1bm5lcicNCg0KRm9sbG93aW5nIHRoaXMgcGF0Y2ggdG8gcGFja2FnZV9t
YW5hZ2VyIHJlZmVyZW5jZWQgYnkgbGluayBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2NzMwMywgcmVjb21tZW5kcyByZWxhdGlvbnNo
aXBzIChzZXQgdmlhIFJSRUNPTU1FTkRTKSBhcmUgYWx3YXlzIGlnbm9yZWQgd2hlbiBpbnN0YWxs
aW5nIGNvbXBsZW1lbnRhcnkgcGFja2FnZXMgWzFdLiBUaGlzIGNhdXNlcyB0aGUgbmVjZXNzYXJ5
IHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGZvciBvcGVuc3NsLXB0ZXN0IG5vdCBiZWluZyBpbnN0YWxs
ZWQuIEkgYW0gbm90IHN1cmUgaWYgdGhpcyBpc3N1ZSBvbmx5IHBlcnRhaW5zIHRvIG9wZW5zc2wt
cHRlc3QuDQoNCk5vdGUgdGhhdCwgaWYgSSBmb2xsb3cgdGhlIGFsdGVybmF0aXZlICJtb3JlIHNl
bGVjdGl2ZSIgWzJdIHdheSB0byBpbmNsdWRlIHRoZSB0ZXN0cyAoc2VlIHRoZSBmb2xsb3dpbmcg
c2FtcGxlIGNvbmYvbG9jYWwuY29uZiksIEkgY2FuIHByb3Blcmx5IGluc3RhbGwgb3BlbnNzbC1w
dGVzdCB3aXRoIGFsbCBkZXBlbmRlbmNpZXMsIGFzIG9wZW5zc2wtcHRlc3QgaXMgbm93IGV4cGxp
Y2l0bHkgZGVjbGFyZWQgYXMgcGFja2FnZS10by1iZS1pbnN0YWxsZWQgaW5zdGVhZCBvZiBpbXBs
aWNpdGx5IGRpc2NvdmVyZWQgdmlhIHRoZSBDT01QTEVNRU5UQVJZX0dMT0IgInB0ZXN0LXBrZ3Mi
LiBJIHdvdWxkIHNheSB0aGF0IHRoaXMgbWVhbnMgdGhhdCAicHRlc3QtcGtncyIgaXMgbm90IHZl
cnkgcm9idXN0IHRvIHVzZS4NCg0KICAgIERJU1RST19GRUFUVVJFUzphcHBlbmQgPSAiIHB0ZXN0
Ig0KICAgIFBURVNUX0VOQUJMRUQgPSAiMSINCiAgICBJTUFHRV9JTlNUQUxMOmFwcGVuZCA9ICIg
b3BlbnNzbCBvcGVuc3NsLXB0ZXN0Ig0KDQpbMV0gaHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5v
cmcvZGV2L3JlZi1tYW51YWwvdmFyaWFibGVzLmh0bWwjdGVybS1DT01QTEVNRU5UQVJZX0dMT0IN
ClsyXSBodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1B0ZXN0I0FkZGluZ19wdGVz
dF90b195b3VyX2J1aWxkDQoNCldpbGxpYW0NCg0K

