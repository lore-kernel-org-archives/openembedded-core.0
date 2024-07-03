Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C6AC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:35:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.49096.1720010096757067013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7914ccc5d5=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4636KaYg016211
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 12:34:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986bxxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:34:55 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 463CYtkQ021251;
	Wed, 3 Jul 2024 12:34:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986bxxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 12:34:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvgYk6VQvy8PuiHlHLP9TqWOAWTn3zNPoAE6Qb29qH/8lT/VYscMxQfg/bZrDMRd45YjcrIODJ0z76+TDXco6M2x5HTUMdq6pBz+UlkCpJRgr5pBSSd+nKjVMKWSWi/gZqg+qesWwVdKyr835kG6HiHYUV7ck5g75bNdZEIwo0tbpJinZ+QJkntF4CpjHgoD4TJUFWi7PGZx1C3ZJTX5uXz0mkBKko+VrS9nr/X/WmSuZS1dI8AeMOfl6PUD457ryidjq9p0JejYNk1bq69n2T8msSFlWPXUt4nlK2EedPN/Gg4YN/PoEl+sh1fUSLZxi5IQ8C2xrMM4N+FF22nNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+gcWJBnGNB4HHG64AJEXihqABlHva8mp21Z1A7kG7c=;
 b=HMJqbnlWDUzqxvFlFYVyDgP2WX9FVjOpYFd/Yn81HGO3RMtWstNRC/7pF51L+tzdwA3uA+PQ2XQekxSWO4VSpGwEjj/EWgTEyqWkTfVw9SD8SiCLyNPHHfFsjYsR3jCRQHEAm8Rj5fiKFwtHhPfQb/bzZz6hza6stTSiJlmsFC/lT1ajx/ovIcrID30fGz19IdkGxVdAa60efpV2S7t6ji+RyjndxEJpbTdmYD36oWmiUmHlStXAgCPOK6S2ah9x+VhU5N5Thm6TkG52g0SMNEaOJDgpPYre9NSQLBG4FntL1G1s8YMqIz6N8cZOZNlzU/jmU8JtrrWS7LYozea4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 12:34:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 12:34:50 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "sdoshi@mvista.com" <sdoshi@mvista.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] OpenSSL: Security fix for
 CVE-2024-5535
Thread-Topic: [OE-core] [scarthgap][PATCH] OpenSSL: Security fix for
 CVE-2024-5535
Thread-Index: AQHazS2JjtWCGYt+TkWzmoaPLxwjwLHk8D8w
Date: Wed, 3 Jul 2024 12:34:50 +0000
Message-ID: 
 <CO6PR11MB560202EA2C2786E1AE88DCA0EDDD2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <f05f0749-f99e-16b5-f497-becd828beb3c@windriver.com>
 <13008.1719999832883308371@lists.openembedded.org>
In-Reply-To: <13008.1719999832883308371@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH7PR11MB7641:EE_
x-ms-office365-filtering-correlation-id: dd8e383f-ea60-44da-bda2-08dc9b5c883d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cVpJQVBYeFlSakc1QmZid3h5RDlFRWxaV21WMlZDaVhJQVNrL0lkU2pXdXZ0?=
 =?utf-8?B?ZkFMMlIvb0kyK2dHOUxra1B4dURFNGVsRjFIajdhRE5DeUNqeWpjMFpzM1lB?=
 =?utf-8?B?QWlkWVNqQitVd1dFaU94ZnZhdmozbS9yeGZJRitOU1g2ZXBZWFN2UTFtRng1?=
 =?utf-8?B?N3A2N3JOTEVlWGJHWFR1N0dTUUliREQ4VjFMb25pTmw3Y09UR3BpSEM0V0pM?=
 =?utf-8?B?bVk4ajdmcjJjY3VRNTJwdHFzZDN5dzVYYzJOYlZSU0FNaXRHRzNLcVdaNHZi?=
 =?utf-8?B?S0lGMUpuTnlXUzlXZU9ETVB6UFQzRUQ2Q0ZvelJxWENDYkRIVnovRlh4NHR4?=
 =?utf-8?B?ekZyUDNiT2lDUXJFYm9TSVZnbEE2b1MwRURENFYwOXlMVjVSTklCTDlYRmEz?=
 =?utf-8?B?eFdYdzg0U3JoN3c0K3JNa0QyMDRFc2d4ekVwU0JoL0JlUzBSdW15a1cvR3FI?=
 =?utf-8?B?Sk9najlMdGFHTnlaVGpYS3VMU1Z1WHltcGYrN09jMm1sS0xxV084bE9aUHRy?=
 =?utf-8?B?KzBPV21ENGU1ZHlQbFFHdlp3cGtwT0FzeDN6OHkzdCtmaC93MjFQZFBsNFlw?=
 =?utf-8?B?SXAyd01rVTlUaUVQOHk1bEsxWHArSWtUcm8rOUhKVHFUUS9CcDdEeVI2cUoz?=
 =?utf-8?B?MktvbjhsUlRMckFiU1ZvZ1crZ3VCTnpmbndKVUF5ZXlvTTdGNW03Y0h5ZDhG?=
 =?utf-8?B?clpPakk5UFZ4QUM4TkxGbnpxanhVVEdwcEhodm80eWxuSndFRkl6VzFydDlG?=
 =?utf-8?B?VXpTTjRoaEZ6SzRxN3pFZnc0bWJ1cnZXU2phZk1jWm5FVDRkdlpJWHpwYm9Y?=
 =?utf-8?B?S3pYVUN1SGJLblZaSjhoWEVZSXJIOEIxS093S2I0dWRBQkloQzZkRm9PT044?=
 =?utf-8?B?UVFTeVBEVXZlL2VneDZDdVE1LzVBWHlTdVczK0loNFptVk9WWlpkaEJxTmQ2?=
 =?utf-8?B?czJQOXRUbnF2U1F5djNXZ3Q2b1MxRXFGdzZ4VmppTVhqbkx3MVNJdFgyWjBK?=
 =?utf-8?B?Uk5KcHVpT05wM0xlMGNxNjBYWXFJOUJBRzgydXhxNFRYYmtCbEpnUXNNLzY3?=
 =?utf-8?B?VW1vT2JtM3luSTErclFDcnlmMTd2dEl1Y05qQzVFcjFLZEdUcDNJdk5YeVU4?=
 =?utf-8?B?V2NoVUZIYUhVZjlzcFplWmFQMU9VWVhuMDdCQkdNM2huN1gvTzNLQkN0WHRi?=
 =?utf-8?B?dFp4d1FBSjd6eDk0dTBHdWVJeGFudlRUaUhqVkt0NVpwekFjdEpZZ2tjTk5R?=
 =?utf-8?B?YlFDNEhLNW0ySElGMi9JK09NdnFCVVE5STlEWlBYQ3U3VWgzQXBVNStPYm9z?=
 =?utf-8?B?S0hjT1FVTURVK0MvaTBOTUNvSVErMkFkd0l1eU55czBEc0tidkRCdlkrY0Iv?=
 =?utf-8?B?L3FiSWNlSjhDenVid1FzRkwzakhVNSt0UnpEaUtnMWNoOHZXdzB6bDZRQnZz?=
 =?utf-8?B?YWxFaEhzVDU1eXVENXBDaVFMNmd3MFR4WjhlOVRtQ1Z2azhvcXNDejVWc3N4?=
 =?utf-8?B?UkZhN0dIZDFiVDRBUE16dVJ3MW5PMEtacHd5TENQcnJwQk9FNWYrVy9VQjNn?=
 =?utf-8?B?WkpSTjF6ZFNxRWs5K0doUCs2M2t4SlE0WWpSd2NqVHJQVFU0ZjJQdmkzZE05?=
 =?utf-8?B?NUM3M0FSVSs3cjdLTDFZYUpiOEpCSHZJMno5djlueTZ0V0ozaTRiemZUMEwx?=
 =?utf-8?B?YWtHRkpGYWlSblJlU2l5YWw3VmNBSlFzQnUrdnI2Nkt5RjJnMEh6bytVMFNw?=
 =?utf-8?B?RDJNbWpWOE9PYXlKSzU3RWtXTXltandJakxJNFMvRGpUaHI3NnlPc2xGLzRE?=
 =?utf-8?Q?91eZVvNxDHc/H49kaVGDF4bHi3FqnJaIHsvKo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUpCWjdTNmtRVFJUazJmdHh5RzBpRXRkdFNMZUY4SkJWN0FlNHljaVYvNFZI?=
 =?utf-8?B?RHdacDVIdjBJaElXOG9qb0JyS0VtMTZocmV4QUYrTnB1VjdZL2xmc2tHeC81?=
 =?utf-8?B?MTN6MVNWWGY2TkF4WGk2L2FFUjBQVmFzU3VYVUNmRVoyd2NWclJjbzMrcnJO?=
 =?utf-8?B?ZU0yUnRNWkl2cmpQemVWdVUrWmZ2YVE5YmRXWDJsb0RUV1JGUkZqbW5ValZv?=
 =?utf-8?B?RXZ4MHUyMzExMkVnQXlyaE13aTFMSE9oN1ZzeUZTS2VJWWVkY2VLT0kzYlZu?=
 =?utf-8?B?OENsNzkwL08vc3V1RnZTdGc4T0cyWXRHOUgzQkFpZVVXdUozWlY4c0ZFT0tM?=
 =?utf-8?B?RWh0c1hubDl5RDNCek1OU1AwZzBVSGNOL3E3RUFNY1ZjMm9XK2ZDdGFHVGQz?=
 =?utf-8?B?VHo4czNoK0QxTU9DT3RTQlIzcy9MdURKWkQyZlpkZFBLWlNiaVBlekdzb2Nx?=
 =?utf-8?B?QnVVZ2FJSHA1NldUb3BEYnJMMjZhdEt4eWtmRW1aT0RJTVI2ZlZ0YmI3WFpj?=
 =?utf-8?B?OTVkMVZVOVY5dzhVak5vYndRQVNaOHlqSVJ3elFmL0ZiQWJ0VEx6YkVuaThh?=
 =?utf-8?B?OU5GN1FNVTBLbXplcWlhTy9WTitaWGI3TEJDV283TXNIcjhmQXQ4a3JPUWds?=
 =?utf-8?B?ay85NmttL0YxNGJyY3g2MmV5ZExiZmJJU2ZhY29jOHMrcm9jM3ZPRm51T3Zo?=
 =?utf-8?B?Z0VORTdzRk8wbzJEOFR1aWJmN0Y0Z0hBN05ZUGR3anEvY3hxVi9FYThOY292?=
 =?utf-8?B?RnQ5ZUxISkU0dE1OM2FQSkhwQ2lXMXBEcGE2bWxLdkVUWnZkbUJRWXNCTkhI?=
 =?utf-8?B?N25uWmx3a0JQSUlGQVUyZEF2UzNRV3NhUlhYc1BadVpkT0FJbTV3Tm1yanor?=
 =?utf-8?B?ZFdqUEpIUTRKZG94Yi80VXFIa0ZUZ1dEcHFDS3owV2tndXpNbmwrcS80MGRW?=
 =?utf-8?B?Sm4vMXZKejZxczVOWmFZTjJkRVU4bUtYWGxYd1FCY3dBRGc4UmlVaVFwWEtP?=
 =?utf-8?B?aVZraFBjY3pkNFRxVWdya3l3OTZsczd1RmJadGphUStTa25ncnpmOFNPaE5Z?=
 =?utf-8?B?UnNoU2wwWEdMSWMvaVV1dUpEQlVQajUvRWZmZG90R05MWXBHZFdTVGNaWjJH?=
 =?utf-8?B?YWluRDU2dXBiSTdZZVJNejVjWExJcjBtUkVCbkM0a0pMYjJObThFSWNoYlRs?=
 =?utf-8?B?NFhnWFRTaDcyMkIzTTVxdXcvQldrRlFOZ0hFQVR6cm0vUnBqaXZSWVM4eTdI?=
 =?utf-8?B?K2k1Zk4vVWhzZXFLeDR3YS9lZGcyVnA3N24zWnJsVDBGRkthK1VBdC9CZTdT?=
 =?utf-8?B?SnV0bHZ4VW92WUdrZkZXT3ZDQ2tLNkU1Q2tobTFrZHRPcjMzenJDN3hSMGI2?=
 =?utf-8?B?UHhaOEJpQW1LWTdlRkZGRlp4dStLYW04eXg0OFZKbkZPbEZrL0gxQUVwenJm?=
 =?utf-8?B?TFZXQ0c5cjlqenBQUkVEOXl0d1JCREQwNTZyL0hOK1hNbGF4TCtSZHVKODFE?=
 =?utf-8?B?Uk5DdmJNWFRRQUpPd3hZRWREOUJmbnRDOXFsY0ZlcjY0MzVxZlRBLyt1bFlP?=
 =?utf-8?B?enZ3ME4waDVjT0V6M1g2YkxkNmx3dnUxVVQrSG12cVMwWUJ2RUhvNzV2UGF3?=
 =?utf-8?B?cnJUakxGQS9Za2hDem9zc3EvM2xNNGpibGo0L0luVjlQMmJlbFFteVNKck51?=
 =?utf-8?B?S05DbzJJemZxOUoxamhnSjBvTFdWeDlqQU40RTdDajl1VGMzV21EVWMvUHRS?=
 =?utf-8?B?QjM4U2FuYTRyaFlrU3Bzb1ZnZGhhamNtbVZKZ3ZlSGJPYStRMUo2OFU4R1lo?=
 =?utf-8?B?S1BVemZLYkpodUptRVNNYmpKQy9vQVNhNytGbUlUbThwRnhCSWhydVZjbmNF?=
 =?utf-8?B?anhZakxaQm9Fbm9lMXp5TmIwUlZjdkdJRkcwWklvMXJIdGdGL2F5alMya0dY?=
 =?utf-8?B?ckcwUjYzVGRMUkp5dU12UDRNc0EyclZLZHEyT29Ea2paZ0Fhdmc0TXhmZzd4?=
 =?utf-8?B?ZmZlczJYODlmbVFUQkR6Wkk3NDg4QUJ3SXRqcW1Sc3RqcElXTStNVzUvWm1F?=
 =?utf-8?B?a1BPTVVsVVIrUmVVRVFWYUJuOTF0NFVKWXRBYlYxYk90MHk1YXBUcVR6WVE2?=
 =?utf-8?Q?QFrynT+CRx9snRwcYxhivDqJd?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB560202EA2C2786E1AE88DCA0EDDD2CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8e383f-ea60-44da-bda2-08dc9b5c883d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 12:34:50.4576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lI25r47R59uiQQW8zREX5x+9/4xlWYl1wkaf9QVT//cauKVq8oGCDmcqQYt5XTPBAGBSNVa0FRKE4Ve67Ri6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
X-Proofpoint-GUID: S0ui4icCmMxTN82dIwghyacw7hb_oslX
X-Proofpoint-ORIG-GUID: 6Dsln5mNhIyMu7XopZTAmLVuUqCWF1FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201472

--_000_CO6PR11MB560202EA2C2786E1AE88DCA0EDDD2CO6PR11MB5602namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBpbmRlZWQuIFRoZSBmaXh1cCBjb21taXRzIGFyZSBzcXVhc2hlZCBpbnRvIHRoZSBvcmln
aW5hbCBvbmVzLg0KDQpSZWdhcmRzLA0KUWkNCg0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIFNpZGRoYXJ0aCBEb3NoaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMjQgNTo0NCBQTQ0KVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W3NjYXJ0aGdhcF1bUEFUQ0hdIE9wZW5TU0w6IFNlY3VyaXR5IGZpeCBmb3IgQ1ZFLTIwMjQtNTUz
NQ0KDQpZb3UncmUgYmFja3BvcnRpbmcgdGhlIGZpcnN0IDEwLiBBcmUgdGhlIHJlbWFpbmluZyA2
IG5lZWRlZD8NCg0KLSBFc3NlbnRpYWxseSBhbGwgMTYgY29tbWl0cyBtZW50aW9uZWQgaW4gaHR0
cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9wdWxsLzI0NzE3IGFyZSBuZWVkZWQgdG8g
c29sdmUgdGhlIGlzc3VlIHRob3VnaCAxNSBhbmQgMTZ0aCBjb21taXQgYXJlIGp1c3Qgd2hpdGVz
cGFjZSBuaXQgY2hhbmdlcy4NCg0KLSBIb3dldmVyLCB3aGVuIE1hdHQgbWVyZ2VkIGFsbCB0aG9z
ZSAxNiBjb21taXRzIG1lbnRpb25lZCBpbiBhYm92ZSBsaW5rLCBpbiB0aGUgb3BlbnNzbCBzdGFi
bGUgYnJhbmNoZXMsIGhlIGtpbmQgb2YgaW5jb3Jwb3JhdGVkIHRoZSBsYXN0IDYgcGF0Y2hlcyBp
biB0aGUgbWFpbiAxMCBwYXRjaGVzIGFzIHRoZXkgd2VyZSBiZWluZyBhcHBsaWVkIGluIHRoZSBz
YW1lIGZpbGVzIG9mIGZpcnN0IDEwIHBhdGNoZXMgd2hpY2ggc29tZXdoZXJlIGRvd24gdGhlIGxp
bmUgbWFrZXMgc2Vuc2UuDQotIFNvLCB0aGUgMTAgcGF0Y2hlcyBpIGNvbW1pdHRlZCBoYXMgY29u
dGVudCBvZiBhbGwgMTYgcGF0Y2hlcyAoZXZlbiB0aGUgbGFzdCA2KSBhbmQgaSBjb21taXR0ZWQg
aXQgaW4gdGhlIHNhbWUgZmFzaGlvbiBhcyBvZiBvcGVuc3NsIHN0YWJsZSBicmFuY2hlcy4NCg0K
UmVnYXJkcywNCg0KU2lkZGhhcnRoDQo=

--_000_CO6PR11MB560202EA2C2786E1AE88DCA0EDDD2CO6PR11MB5602namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5Ouetiee6vzsNCglwYW5vc2UtMToyIDEgNiAwIDMgMSAxIDEgMSAx
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkFwdG9zO30NCkBmb250
LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlNlZ29lIFVJIjsNCglwYW5vc2UtMToyIDExIDUgMiA0IDIg
NCAyIDIgMzt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOetiee6vyI7DQoJcGFub3Nl
LTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29O
b3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQt
c2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkFwdG9zIixzYW5zLXNlcmlmO30NCmE6bGluaywg
c3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7
DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28t
c3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQXB0b3MiLHNhbnMtc2Vy
aWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlw
ZTpleHBvcnQtb25seTt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47
DQoJbWFyZ2luOjEuMGluIDEuMjVpbiAxLjBpbiAxLjI1aW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0K
CXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1s
Pg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1s
PjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpl
eHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVs
YXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGlu
az0iYmx1ZSIgdmxpbms9InB1cnBsZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxk
aXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+WWVzLCBpbmRlZWQuIFRoZSBmaXh1cCBjb21taXRzIGFyZSBz
cXVhc2hlZCBpbnRvIHRoZSBvcmlnaW5hbCBvbmVzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+UmVnYXJkcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UWk8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjRTFFMUUxIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBp
biAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5Gcm9tOjwv
c3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZn
dDsNCjxiPk9uIEJlaGFsZiBPZiA8L2I+U2lkZGhhcnRoIERvc2hpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPGJyPg0KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgSnVseSAzLCAyMDI0IDU6NDQg
UE08YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbc2NhcnRoZ2FwXVtQQVRDSF0g
T3BlblNTTDogU2VjdXJpdHkgZml4IGZvciBDVkUtMjAyNC01NTM1PG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQi
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1Nl
Z29lIFVJJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzMzMzMzMztiYWNrZ3JvdW5kOndoaXRlIj5Z
b3UncmUgYmFja3BvcnRpbmcgdGhlIGZpcnN0IDEwLiBBcmUgdGhlIHJlbWFpbmluZyA2IG5lZWRl
ZD88L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6JnF1b3Q7U2Vnb2UgVUkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMzMzMzMz
O2JhY2tncm91bmQ6d2hpdGUiPi0gRXNzZW50aWFsbHkgYWxsIDE2IGNvbW1pdHMgbWVudGlvbmVk
IGluDQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL3B1bGwvMjQ3
MTciIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL3B1
bGwvMjQ3MTc8L2E+IGFyZSBuZWVkZWQgdG8gc29sdmUgdGhlIGlzc3VlIHRob3VnaCAxNSBhbmQg
MTZ0aCBjb21taXQgYXJlIGp1c3Qgd2hpdGVzcGFjZSBuaXQgY2hhbmdlcy48L3NwYW4+PG86cD48
L286cD48L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7U2Vnb2UgVUkmcXVv
dDssc2Fucy1zZXJpZjtjb2xvcjojMzMzMzMzO2JhY2tncm91bmQ6d2hpdGUiPi0gSG93ZXZlciwg
d2hlbiBNYXR0IG1lcmdlZCBhbGwgdGhvc2UgMTYgY29tbWl0cyBtZW50aW9uZWQgaW4gYWJvdmUg
bGluaywgaW4gdGhlIG9wZW5zc2wgc3RhYmxlIGJyYW5jaGVzLCBoZSBraW5kIG9mIGluY29ycG9y
YXRlZCB0aGUgbGFzdCA2IHBhdGNoZXMgaW4gdGhlIG1haW4gMTAgcGF0Y2hlcyBhcw0KIHRoZXkg
d2VyZSBiZWluZyBhcHBsaWVkIGluIHRoZSBzYW1lIGZpbGVzIG9mIGZpcnN0IDEwIHBhdGNoZXMg
d2hpY2ggc29tZXdoZXJlIGRvd24gdGhlIGxpbmUgbWFrZXMgc2Vuc2UuPGJyPg0KLSBTbywgdGhl
IDEwIHBhdGNoZXMgaSBjb21taXR0ZWQgaGFzIGNvbnRlbnQgb2YgYWxsIDE2IHBhdGNoZXMgKGV2
ZW4gdGhlIGxhc3QgNikgYW5kIGkgY29tbWl0dGVkIGl0IGluIHRoZSBzYW1lIGZhc2hpb24gYXMg
b2Ygb3BlbnNzbCBzdGFibGUgYnJhbmNoZXMuPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHA+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1NlZ29lIFVJJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6IzMzMzMzMztiYWNrZ3JvdW5kOndoaXRlIj5SZWdhcmRzLDwvc3Bhbj48bzpwPjwvbzpwPjwv
cD4NCjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtTZWdvZSBVSSZxdW90OyxzYW5z
LXNlcmlmO2NvbG9yOiMzMzMzMzM7YmFja2dyb3VuZDp3aGl0ZSI+U2lkZGhhcnRoPC9zcGFuPjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_CO6PR11MB560202EA2C2786E1AE88DCA0EDDD2CO6PR11MB5602namp_--

