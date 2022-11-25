Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB66C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 05:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41061.1669355781456304340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 21:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LAwseK0u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=832882a814=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP5dTnR002726
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 21:56:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=skS2rx2Ff69YLDvawkkIYy5WRTRZMQnwXz/fdmF6kIo=;
 b=LAwseK0ukRWd0BKFKBSUvMZVkS/djiI99jQhb0174Hb7dyeFi/itXPNQTja+eQCVBErN
 KRXKG5NSjiXQgvnZo8IqSV2sVR+J8YSm6QzRFXrtxa96m5mBeFBE3ig6Oc3oun5mDx7s
 YmxAEX351iP4AJhQvnl9df2SqGmodaJ+STpwdb5eqnQ9A7SSHAx6SMqygG3RUKQOev9p
 BCj4Tki2xoDApyMxIgQvJElgVqFRibUQUtV7wbLVO70BjCmDJelevrg/dkLWLSUQZDBY
 +oQiD4/m+sdk6KRGbWg2XK/d8h8i1pqviV943kdyPKQqZJcQ16t3cV07R/mysodyi9Jh cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6cpse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 21:56:20 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP5r88G028808
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 21:56:20 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6cpsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 21:56:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER/giimH75QFrxqvbZ6dYaxPLxHK4Wur9Cbdlr5Jp96MBQZ9TT9/TOmb9tWO6ST8tNuvLJGThdp4Tm2hcarczzsBvmoisfk+DcSRtKyb90iE3ST+UMaLqS0ASUOpUWWtjtiYsvcM/QofEWJyHL+jNnlLU14YrlCEtDh/lGaECKTndpDMvkIy8pN5N/eCDSYC8QI9BEJdcBufTNlD+GGB7BKWigUq5dJJlbnLp/8YO4P8m8G+2iMHXn7hSll5foztGCswiMHzly6hrJirCj3zkF4NYQ0MHvHN3qG2VLI7PNtzQqSZIChT2MdQFXtSgXdJ5Gbua2zm6CIB+RFECdec0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skS2rx2Ff69YLDvawkkIYy5WRTRZMQnwXz/fdmF6kIo=;
 b=frJ400ueP8js/OQrm2jR+1wcHK31bw1A8qIHj0dWI4LLQfu3NXPfGfGnOabmlMFOzGNmNGhD76bjUIvonu5+nLs+nvQYewYnAgnD+15zRWIth9ypHIkEuEuoE5SwoyRhyQCAjhlkiEpumpT80LACmMj0bUaUIQ0AomVdZ6SnNul9NajYdCyOk7exta8r/kJX/irbsI0fh4ZVlW0yanHEkZc6RQA2B88Ijsd9YTfDtaN/icxutEu/3ZilmTPs5eFI275rHbBQoW52Qq0LkjLriNPrnjAy99OGP4N5rTloejUNuwLCocERY2xoN/LGxhBatjAr/c/GWcXTGaGy/vxS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 05:56:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 05:56:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Topic: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Thread-Index: 
 AQHY/7BG2G3bzAyn2UW4ZPq5312Nlq5N8jsAgAAL9ECAAAxXgIAAAPvQgAAIWwCAAANXgIABDLOg
Date: Fri, 25 Nov 2022 05:56:18 +0000
Message-ID: 
 <CO6PR11MB5602D48B1A9960C0E627C2F6ED0E9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
	 <Y39W7D6ps5v1cCyn@mail.local>
	 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39rTVzD41m41oyP@mail.local>
	 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39zIuEp2//QoOxc@mail.local>
 <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
In-Reply-To: 
 <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CO6PR11MB5571:EE_
x-ms-office365-filtering-correlation-id: bc11117f-cab9-458b-4142-08dacea9c544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vh2b2U1uw7zTw0Rf9ovPy3YoVbzdlic3wzQN9U6fe5xcCXfqgJ2zx1yCe+fBdbdNk/T83jzy35Z3QIebQWJwsreEjWav5uWx3uVkBLsBhT5Mlw8zr5yDg6PveNQQinth0FaZE3EBINP6NsZ1qqHeZyCUuJ4mGdJPWY7UFKrtdmfoAVtSTWimJVZLsCQfyHgjwGxa6Xg8fl8fuazQO2ZPRbilqCbDRR7+PUm7qKWFPELjNTqjWfHpuexHz5i8hA74JLVOSsUvp7QMLhzqNmdkagBoXE20D+nfZBvxGlcfQqeEE0M4rEy5d75KTTdmcW3BWJr+GqLNyP9UGRUhJwCG1ly96SO/oX6MrrjWYKU6AvwnWTsfaOwIOphYFHHGOopLfx3CqkGNazsfOLu+/QPube1Bvl3rFXmPdxtFSus982FMlbE5MAOxkrjAolk5OF+2GN+0diWHh1zFeu5gCJwr1sZBnpaxwKtjHygYdp8md85nJ/VpK4mxeCIt6PGMFu8kDf86dJNRmsZ1/Bfrb1Lq5KCkto+hGm/eMJaaG0UbKdc22ip+rSKHHwGyWD8wV/I2MKArDhzsGbXOYLbhokEGzvqd6Kvq6tJ1EuyG9rEd8Pjqn6K+5XSNwIsgYuxy1bl/GNmtlpnjtVS50RDZ0EUs/H88MUtmKBMsQupglBl9sfhtFbtDK3mwXVfG6OV9nftYGXaU65y6Pn01iuxpglUfqw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(122000001)(38100700002)(55016003)(33656002)(38070700005)(86362001)(316002)(71200400001)(2906002)(4001150100001)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(41300700001)(64756008)(8676002)(4326008)(5660300002)(52536014)(8936002)(83380400001)(478600001)(7696005)(6506007)(186003)(26005)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yml3UERqNjBHZXJzdG5teWZlZWJxZmZaK3p5WVZmYlRSdmhyemtsc1FyWVJh?=
 =?utf-8?B?L25JaWZIOHNFQTFOdm5kQzdGTURmS2p3VGxLdTliS2sxVjdKaCtlaWNWZ05p?=
 =?utf-8?B?dUdaMkQvMkZVRlFhdmVEZ1F1K0VhYyszTEcwWVc3bEZHNUxMOEFGNXRFV1M4?=
 =?utf-8?B?YkpBMnh0WXFCdXdpSExTcVZwcis1S2ZVZzlUcHZrbk9zd0xNcHRCOE0vd0x4?=
 =?utf-8?B?aWxTelVucFdaQjgyb09OUTV0UjVpdVJvb1BaekFsMzVGWFJyYi9SSzFjd3o3?=
 =?utf-8?B?RU55M3J4djFDUzlRZTFhRGM5SWM2OGZjemlqcnRXQzdzQUdXNmpWbGNHdWQ0?=
 =?utf-8?B?L1NDbjlydFU1aUNJU0hPYWZjaXl4bXNCRU41MVRLdHRpRll4bE4yaEEyZ0Iy?=
 =?utf-8?B?UVBSNHcvS0IvQ2wxcENFRGV2bmZnY0lPaW1VQk5nbndFZjZYdURjT3N3ZnpO?=
 =?utf-8?B?VnprTWE2d08xZHBLU3p5ODRvL1NPRU9GakUwZVhhS3VnR2FnZWdaRGdrc21z?=
 =?utf-8?B?QzREL1VQU2NFbVhyR3BKUmpJbDBGN3RQajBQWHhBMXNHdEZaeStGYXhhblFm?=
 =?utf-8?B?SGNVQlNKVnh3TjNRdUtKUWRzQTlIUGNpQXE3eEMwcGh0TFluWUkwV0dzM1cr?=
 =?utf-8?B?WGtaSEJiWHlybGhjenNyTUJVV1h4cE9Pb2JMSnpvZFN3SDl6d0ZPUkpRY0xs?=
 =?utf-8?B?QzRGcFBnT3dZUmplbUJtYjZ0RGppdjQyRitQUDNuTkliVXp6a2V6ZlRsSG93?=
 =?utf-8?B?YXR2bFk2TGJGY2dpUWRzUTJyT3BKdDBCdnVDSGFDTTZhMWpXbkVjeXlkRzYy?=
 =?utf-8?B?MkxzcmlrdWRIMHdpQll2SENDNFp4QVU4T1d1M1UvQ0xwbitic3hwOEFxRTVR?=
 =?utf-8?B?Y0wwR3JCMnB6RGdQc2RrdGFzZFFlcUhiTXFBY3RScG1jLzBNYy9ieEE2bGps?=
 =?utf-8?B?T05oR3JGOGRzMm5ySnpIZHhjTktIbG80aWlKeUNjZ1lCU1VIVFEzSnA5NUl6?=
 =?utf-8?B?eENxL2FCQ1JQQjVzSktTWHdRNFA1L2dJRU1tSi9meDFZOUxSWFVJN0tSTE9q?=
 =?utf-8?B?Sml6TWhicEtqTkJqd2FGSE5sc2pTVmpGMnMxaXYvLzMyVXVUamR1ZHUxS2po?=
 =?utf-8?B?Sm43bW9PVjhudDNYREZidXlNZDBZd3llc08xRStpaGVNM2V1cHdEWHl4ZXNE?=
 =?utf-8?B?MnJCRGRsOFB4eXE3YVFKdk1tSGp4dmdoNURKa2xrYUoyZVl3YTRreDhXV1Ja?=
 =?utf-8?B?UzJ3bjk5SWpaTWN3OW5wUXJZZldEOHVidExTWjJXY0F5SHluMTFmb1hCY05w?=
 =?utf-8?B?cFJ1ZFpnRWkvUkxxQU9Ea1RaWGN1dnhXaFNxWWVZWmhWYURQS1ZzWjlGTjZa?=
 =?utf-8?B?WUFhTGdQbXZ3dkZuenVUL3paNFFFeFJqNmMzMFBOeXNXVHdGeGdJTkRDK0RO?=
 =?utf-8?B?Rm92QWZZaDhIUlY0YXFwMko3ZStWYlNzMzZxbnZXNmhKY3RkR3I4OFZtRWpt?=
 =?utf-8?B?d1hFZWJSakw1dktvWDNwN1drZG5wUWdtWjRMYzFPTlBwa3hWVTh6dTh6RkJI?=
 =?utf-8?B?MWxtMmlTYkZ0clJlaTREL2UwVTJXVmpsYTNvSW9LYVMxZGlPd1pmUS93a0pp?=
 =?utf-8?B?MVphb2FqbDVSVklBbHVXaDlDRUlZaFBvV0E5NTF0NWVwMFZjRUtpODlxM2xj?=
 =?utf-8?B?cU5nT0dQMk5lK3VhK2pFT1pRNUVIVDlpL1dQQUwwT2xhdi83V3F0WXV5NFdI?=
 =?utf-8?B?RnRmNFlVYUpPU05pbFhCK1E1V2JydnJLTWlRTjdSd0JNcHRIRzB2d0hqQWRQ?=
 =?utf-8?B?SlhxdnFqVVA4ZXVPMVdtb3FqY2YrbEQ0VXpIS0R3cEJ6K0tndW5zSnBDV2x0?=
 =?utf-8?B?OGhWb2RRUk13bGlCRzI4c0RCWi9HV0x0eXplSW9uK3FWUGV1MVhzT05aVjRH?=
 =?utf-8?B?SmV5bk9MaGxxaU5EWEdDNFpwZ3ZGQW5pbXh3cG5TNk9GVlFCcXNGdURrd3E2?=
 =?utf-8?B?Tm5DdGNPd1FaLzRjV2tvWUJGWC9vMzhVZW9VNTJ1QVpkbUVGNmtTMkVqSkha?=
 =?utf-8?B?R1VkZXcxdFA5VGRsQkhhUW5YWUd6Tk10aXNnd09BcThya2wrYXB0dGlwRVFH?=
 =?utf-8?Q?I1t0U7LKjMV8HlbOX+94DG3fd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc11117f-cab9-458b-4142-08dacea9c544
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 05:56:18.0413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1nz+v/ocmV6WCU1OfhP24NKXBBDCxCp7YqVChcfzUkHNLX/9vwXKwSx8mKAkN/5flvDMWKIQ9y2IUk/5jnceYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-Proofpoint-ORIG-GUID: vx1U-Gj1qAm1fVeL38MBhCDzCj7KJEgV
X-Proofpoint-GUID: NTCQy6m-RuWFGp2cuUbbX-oU9rWu9NO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=775
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 05:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173760

SGkgUmljaGFyZCwNCg0KVGhlIEFCIGlzIGFjdHVhbGx5IHJ1bm5pbmcgJ2FsbCcgdGVzdHMuDQoN
ClRoZSAnLS1za2lwLXRlc3RzICgtUiknIG9wdGlvbiBtZWFucyAnUnVuIGFsbCAodW5oaWRkZW4p
IHRlc3RzIGV4Y2VwdCB0aGUgb25lcyBzcGVjaWZpZWQuJywgYWNjb3JkaW5nIHRvIGl0cyBoZWxw
IG1lc3NhZ2UuIFRoaXMgaXMgYWxzbyBpdHMgYWN0dWFsIGVmZmVjdCBmb3Igbm93LiBZb3UgY2Fu
IHNlZSB0aGVyZSdzIGFuIGltcGxpY2l0ICdydW4gYWxsIHRlc3RzJyBtZWFuaW5nIGluIHRoaXMg
b3B0aW9uLg0KVGhlICctVCAoLS1leGNsdWRlLXRhZyknIG9wdGlvbnMgbWVhbnMgJ0V4Y2x1ZGUg
YWxsICh1bmhpZGRlbikgdGVzdHMgdGhhdCBtYXRjaCBhbnkgb2YgdGhlIHNwZWNpZmllZCB0YWco
cyknLCBhY2NvcmRpbmcgdG8gaXRzIGhlbHAgbWVzc2FnZS4NCg0KU28gdGhlIEFCJ3Mgb2Utc2Vs
ZnRlc3QgY29tbWFuZCBtZWFuczogZXhlY3V0ZSBhbGwgdGVzdHMgZXhjZXB0IHRoZSBvbmVzIHRh
Z2dlZCB3aXRoICdtYWNoaW5lJyBhbmQgJ3Rvb2xjaGFpbi11c2VyJywgYW5kIGFsc28gc2tpcCAg
J2Rpc3Ryb2RhdGEuRGlzdHJvZGF0YS50ZXN0X2NoZWNrcGtnIGJ1aWxkb3B0aW9ucy5Tb3VyY2VN
aXJyb3JpbmcudGVzdF95b2N0b19zb3VyY2VfbWlycm9yIHJlcHJvZHVjaWJsZScuDQoNClJlZ2Fy
ZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogVGh1cnNkYXks
IE5vdmVtYmVyIDI0LCAyMDIyIDk6NDcgUE0NClRvOiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGlu
LmNvbTsgQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENI
XSBzZWxmdGVzdDogYWxsb3cgJy1SJyBhbmQgJy1yJyBiZSB1c2VkIHRvZ2V0aGVyDQoNCk9uIFRo
dSwgMjAyMi0xMS0yNCBhdCAxNDozNSArMDEwMCwgQWxleGFuZHJlIEJlbGxvbmkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IE9uIDI0LzExLzIwMjIgMTM6MTA6NTErMDAwMCwg
Q2hlbiBRaSB3cm90ZToNCj4gPiBIaSBBbGV4YW5kcmUsDQo+ID4gDQo+ID4gVGhlIGNvbW1hbmQg
bGluZSBpczogb2Utc2VsZnRlc3QgLS1za2lwLXRlc3RzIA0KPiA+IGRpc3Ryb2RhdGEuRGlzdHJv
ZGF0YS50ZXN0X2NoZWNrcGtnIA0KPiA+IGJ1aWxkb3B0aW9ucy5Tb3VyY2VNaXJyb3JpbmcudGVz
dF95b2N0b19zb3VyY2VfbWlycm9yIHJlcHJvZHVjaWJsZSANCj4gPiAtVCBtYWNoaW5lIC1UIHRv
b2xjaGFpbi11c2VyIC1UIHRvb2xjaGFpbi1zeXN0ZW0gLWogMTUNCj4gPiANCj4gPiBUaGUgJy0t
c2tpcC10ZXN0cycgb3B0aW9uIGlzIHRoZSBsb25nIGZvcm1hdCBvZiAnLVInLg0KPiA+IA0KPiAN
Cj4gUmlnaHQsIHNvcnJ5IGFib3V0IHRoYXQgOikgSSBhY3R1YWxseSBjaGVja2VkIHdlIGRpZG4n
dCBoYXZlIGFueSAtUiANCj4gYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoIHRvIHRoZSBBQi4uLiBJ
J2xsIGRpc2N1c3MgdGhhdCB3aXRoIFJQLg0KDQpUaGUgYXV0b2J1aWxkZXIgaXMgbm90IHJ1bm5p
bmcgImFsbCIgdGVzdHMgdGhvdWdoLCBpdCBpcyBydW5uaW5nIHR3byBncm91cHMgb2YgdGVzdHMs
IC1UIG1hY2hpbmUgYW5kIC1UIHRvb2xjaGFpbi11c2VyLiBBZGRpbmcgLWEgaGVyZSBkb2Vzbid0
IHJlYWxseSBtYWtlIHNlbnNlLg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

