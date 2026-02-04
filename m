Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F181FE9D3E7
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:30:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21570.1770215437103511877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=g58l2JBs;
 spf=pass (domain: ericsson.com, ip: 52.101.72.53, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlA84fPUGk3ucQIYt5QEMMo9Z08sSYxu0RT1tcdf6xE16BrVqdqZBBHLswqqgu7plwFI+g43KcX0Y/Koh9Ut46ZnPa41kToNMBPiqzrXBjf1X2i63FnEQ8lHQKZzrVg1UMG/Uw1RR8MMOyxnE9z2k5PqYw25e7x/mP3y3ActRYoWRdxoC50zdhocNxc3CC79mVFRe/LWhaza7nKk8VN3ZVEQxAumbSuBYj/fR/0euUHhVIGaPmHhw/7ysoIFGn9sDvnmYg+ta1IWFY+tlo5nJ0tXZ3ZABfsfka6qfkCHhL5FNfsrndMo3+yRh2NAB4+h+0NR/tYWb8Xej/6szSd/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5k2LNc/zGT/QZFtDjsaARAimmSEdpIH10vUlqOwrRA=;
 b=nncLCvC8FdQxX72ZPiDntzG45yM+9TETuxiuLqbS+l7iA+wLNRUIULCsD/+PHAj+/2IKOhqkQVNd9zlyVU5y9/+hWnq3pNVyKx5msp06hqcrsIu08OTQn5R8p1a/SCIh4GOYPBLNIvHbJ6Xtx3mVFgdwHGdDxfpGvs9H++m0EpEvsyQKPVb5EkG6ysgcrAAn1qX217wCboP/OkiNtY7FGMxwNZi3KEXC0s6rMILkKNpnwtYVmuD4d2bfheZNjZonxRQC3A3NBrIOZOYanvyoFGCzpxIPGRrSIzwmJdviaSMUosg79PWCybA3N3CsdL5JiJ1AczMdCx9YGWWZ8OTGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5k2LNc/zGT/QZFtDjsaARAimmSEdpIH10vUlqOwrRA=;
 b=g58l2JBsArWDvI0sTj5dnqKPz0gj3ttiipxYOOZkLXG6qNQtGYOhklj9g6Q8QVnosgtchCUoXY4c7O7i0QE1HL9lsy0orUmLHw1+VXGPGEKWS3DMWdexmy3xcSqzCCWfc0rDiRTMWKATTeBrhY26o6iCoU6qwc3XTKyhiCoyYimVSkCXoxG8cw57l+nh5AAQG9DdH0nGqxWHhBM4FQNsPMciO8TQ6oA+UUysK/0TCVvUkPn8Lvag8p+oswlvn/ykWtXGdoXueDGaO3UaPpnCyRL7MLug3KZhghvg+g1O5UFBKrOE4Evjg/9MQB8coD6UPWnTSIGQMUIyhFtrgCeoEA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV4PR07MB11315.eurprd07.prod.outlook.com (2603:10a6:150:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 14:30:29 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:30:29 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: ValentinBoudevin <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>, ValentinBoudevinSFL
	<valentin.boudevin@savoirfairelinux.com>
Subject: RE: [PATCH v7 0/4] generate-cve-exclusions: Add a .bbclass
Thread-Topic: [PATCH v7 0/4] generate-cve-exclusions: Add a .bbclass
Thread-Index: AQHclIZIegLqnhx7Lky0wO+3xvR9LLVym/Xg
Date: Wed, 4 Feb 2026 14:30:29 +0000
Message-ID: 
 <PA3PR07MB10721809C70726B09ECC77F108A98A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
In-Reply-To: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV4PR07MB11315:EE_
x-ms-office365-filtering-correlation-id: 31dd143b-84d8-48e1-6ccf-08de63f9f233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|19052099003|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VUt2blVvRXNOK0I0UTZSQWJCZ1ZHZTJBNzNoUzFQVWdwVldqZUZRKzd2djVO?=
 =?utf-8?B?L3AwZWxtWCtSNzU2NDNZSXNWQTgwQ21hc1lHS0dNTzIyWWh1MGFFOHlBM0Nn?=
 =?utf-8?B?OTZhdFNUUFk2MFNuaDd2ZzVBamk2ZFMxd0JNZkhHbGd1SFphc0Vnc2xxcjFV?=
 =?utf-8?B?RGVTcER4cEdmMmJVbURWMHNka05oTW1LRTV1QmlxVkJwNWJTeittczZ1Q2dj?=
 =?utf-8?B?NER0aXg3SDZjNWtIWllsQXR3UHNObWsrT2hkN0FHS0ZIZ3RPSk5XK1ZiaC8r?=
 =?utf-8?B?WHhuSHRQSjlZNTF6Zmdma3FhVVIzL3dvcFJmOThtV0RCUGJpaVIvSFJtcmdh?=
 =?utf-8?B?RWorUFNsWXBGVk9lQVRldkptSE9idUhiSU9XM3U2OHN5Wi9KRC9XbGR2VW9M?=
 =?utf-8?B?Mmw5QXViMStJeHIvWkNqcWVTOHo3ZmgzWkVPNTIxOGFBTWc2cUNjZjZNQ0xK?=
 =?utf-8?B?cStLZHpVekhvYzNodk4rN0VWTlN0d3JPL0FHMGJqcU5XRWNTSE4rRTJTK0N1?=
 =?utf-8?B?dVRFK2ZsYmNxLzd4VFpMMURUMXRwcm90Z3ZMYjZweEhERjNwRXdQSmUwMzd4?=
 =?utf-8?B?bzNXbW9sNU5ZQVRpeFJXUnpuaEtwMTlkcWRUWjU4RUlyZTdKR0hoczEveGZy?=
 =?utf-8?B?WjVhUlYwR09ONVZ6NngzSVJ4RmlzVktVTUc1dUZXVktubTdERHFDVHFYU213?=
 =?utf-8?B?TUVWa2hvNVI2Ti95WkZ2dnhVZ2ErZmlSd3FJOEgzQnVyQkhCUXFOemFIQ0R2?=
 =?utf-8?B?UWRpSDg3YnlDOVpZQWJxUUxMWUZkK1czZzNyOGpyanl1a2c1YUlhSTNxZTBE?=
 =?utf-8?B?aEZmWGVnNGVwcW9ORG5lcFE4a2FKeGg3WnJLTVFnMkoyekRaS0VJNFZDRndy?=
 =?utf-8?B?L3J4bUxZRExDUkg0blMrZzFFd0trUVRzRk5tMkw5emFTaEdpSm1ob3BkcEdp?=
 =?utf-8?B?SzJjTDlZTWt6WFN5Vyt1Zkk0Y1UrL1UrOWoweUhIbEZUUkREVGxkYjlBQ1hy?=
 =?utf-8?B?dFpKMXBKOEc5c2w0RHkva3RDdDRCNkFUS0JqamM5bVJyd2FjRStvWWdZNXRU?=
 =?utf-8?B?eEt3LzdpMVNLUm5oQm1vL1hQYVNSd0JSbDlCZFM5SjIvZHo1Yk44ZU05ODlH?=
 =?utf-8?B?a2dERXVvdmxxMi9lbGZGN1VzMUhvT2t0akZ6SlBOYTlWbGpER2c2aWpEVWpj?=
 =?utf-8?B?cUVKWWsySGtaTTR5bmc3WUtySlRlcThobENPQmpnRHlpd04zaVU3TjBLYllj?=
 =?utf-8?B?S2lYUnV6bFYvbUVLb0p0QmtCWnphei9LU1FyMGpuUFlBeENDQVFUcGdxQ3dP?=
 =?utf-8?B?ZzYyQ3JmOVBxOTRPMXV6OFhqTCt5czk5M0ZmakdUVW5nNnNLUUVnSHdmL3dT?=
 =?utf-8?B?SHdnMWwyNHo4TWJCcWMzbk1nSS9PMEtFMFI1Nld2c2pEZ2JCWnR1MXNvKzJS?=
 =?utf-8?B?YXZGK09oS3R1bmhNYnRlTWVEdlRpWkIwaURRWUZxWHlhZXkwSmtWRndaMjZL?=
 =?utf-8?B?Vk85TlJDOTNKeElock9WaVFzR000SEJHekVLdEtpREZXZUpxd1dHRDJBZ290?=
 =?utf-8?B?aHNSbnBNR2ZaaW9VdmdCR0pMaVZMaG0za3JBb09KMkMyV2ptajhmUUQ1b2FN?=
 =?utf-8?B?RW9yTDF5V1JWRWhQbTMzRUt0MkxrT2Q2UUgrYVNCZDhsNzQ0bCtjWndTNjFz?=
 =?utf-8?B?Y2dmWkR3YTV0Tk45a08wZUhsdGE0ajR4bXJ0S3lMa0lHdHp3RXNxazcrSy9D?=
 =?utf-8?B?NEN4WE51aFlmTXl0VjFsb3JmeENKU2RqMW9KMXlqZm5pRGF4SmtxcnVJTmVh?=
 =?utf-8?B?QUFBWDZkQm92RWdDa0JySUpIYU9rYTY1SEhLWlhjQjhIdXAyblF2aFNTNGxk?=
 =?utf-8?B?Z3VGMjRQWUdydnBQeGQ2c2pKRTBBWUw1d3pSQlJxNWVnZFRGWlJMWEZ0MEtU?=
 =?utf-8?B?Ti90dmVjRlR5Z1o3a3AxYnV4MnhEeGh6WElTQXFhTUhOQWhweTcvZ28zVGxM?=
 =?utf-8?B?VmNUeFlZaGtUZ2Z2Q0tFSzlTamJmdUFXaXhYTHprR2Qzc1VuYWFXL0dpMjJa?=
 =?utf-8?B?NWlhUkM3aWVIZWY2M0pCbzBrODVuQW42Um9CU3JSQzk2ekhGUDNFczEyZ2NI?=
 =?utf-8?B?dHNnQklkd1lWSzlyZkE1czJTUkNsRW11eVNsSXJwa2N2RElhR1RDblNLRVc1?=
 =?utf-8?Q?7DmjwvyZNLk1fmH5wLZRqvs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19052099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UEhSeHh0ZkZQQWlJUlBGSzNGd2pOektaVndjS2RPdEFSeExmMXl3YkJSUStx?=
 =?utf-8?B?NEVqMjRkbkxKazZrbC8xNnBTT1ZMdk5PQ2NQM2c1UVlGcHY1ZVlhMjhZbnRx?=
 =?utf-8?B?SUVzZ3RMZkxqdDRYdEg5aGlXSEp6MklVL0k3bFpYeGhTM0tWb0JZV0JuWVdt?=
 =?utf-8?B?ak5NNjlIQlh6QVdiTFNBdTNjM0VBQnExS1gzeDVPaTZGa1FwR2JMRDgwcVZG?=
 =?utf-8?B?QmMyRUh5enV5RDBHRFI4bHBocUhXa0p2dTN5Ri9DdDhuUFlOaGVGaXRPQVRW?=
 =?utf-8?B?K2lMOU1TbkhwYmV2ZzV3R3BjY3VYUGFxeDVYb1draUxSTVVrKzB2WDlPUklj?=
 =?utf-8?B?MmFBbVVJdXlzbk9laGlSWHlqSU5OY3EwMEw3Zi80cm5GMUk4Z1hDUG1Fc1c4?=
 =?utf-8?B?MXgvWDRXZE5GUjllTEpLOHAwQy9qUjkxU3lhMHVuUGMzRnJiUWZ1VG1YejFR?=
 =?utf-8?B?RW1UdDViZGdvVGdKZ0E1TFpINWs1QzhuOXFaNFE0bG1lQzVvbjlhQ1pBWHZl?=
 =?utf-8?B?emNOenVZVUpBdFpXMlgra3ZrY25wd0RiMmwvdlNsZHR3YnBPTzVrSDhySHVJ?=
 =?utf-8?B?Sm9SZjV4WFNUYzFGS3J2eFRkeVlxd3d6WTdLNWZlL1d4YXFUbEM2WkM3RGJx?=
 =?utf-8?B?cFcrblQwVUU3a2ZscWxQcGJyR2JQRlJXcmJ3SHlHNFVXMjB4RUhuSXlvZTdJ?=
 =?utf-8?B?d0VLYms5WUhGUG94WnR0UkZudHd4UDNXRU05eFdMalRJd3ZDQTZSZEtITEJG?=
 =?utf-8?B?RndpaVpjQWZBaU8vcHhpOTA2d2xBN3NKeTF0S2oraWoybmc2dU9nS1lRbFM3?=
 =?utf-8?B?ZTRCTFRVcGc0dnFuYzJtMEs5eDJibGhITXRhRjErVytlOUZYY09McEJnYVJO?=
 =?utf-8?B?NGxBclltS0dBdURQcTU1c1IrQVNFeDIySkRlVm0rUU1LeTBSNEErWUtrcjJi?=
 =?utf-8?B?L2ZWTi94cFF4L2FXcHNmRE5LQ242clZ3K2VHRDBXajJWOXVZb2hucHlOejAx?=
 =?utf-8?B?S2p4SHEwTC84bW1SSmtqSUxkZ1JxU0JuaTltUTJKMFg0NUhhUEhlakJlVHg2?=
 =?utf-8?B?eHFhSXRxb2VUb0dnUmd1Z1BFSkJhY1AxdkNMNTZVNG9Ic1RYWE9sdUpBTExU?=
 =?utf-8?B?dXVTUEUxYUkzazRxYlZrM3RncG1MOFhvLzgyQis4eWIwOWlCVGVpUzdneWhK?=
 =?utf-8?B?dERvUlozVyszMVZwOVNIUU1Wczl1Z3Vpb3d3b1dNRnhPUnRsbG5HYU51eVhY?=
 =?utf-8?B?YytYUGpaSjIwOGw2UHI5ak13SkorcGQrYktkY0pRSjRlTUk0dmo5WGhhaU5N?=
 =?utf-8?B?SUJWZEhLZGxFR2V1NlUvd3Zwa1VIWHlUQjhIOXVRVVo1b1VGNjNFazFvczNE?=
 =?utf-8?B?TU02ODRCT3l4ZzZhUUhtZUZ1Z0JtK3VURHdJQkVBaVZKMkVVNnJqaW4vVTBQ?=
 =?utf-8?B?emRCY0RvdVZsd3F1KzB2dThFZVN3UW1mckh6TUExWnUyN2Fxb1J4ZWh2c29N?=
 =?utf-8?B?by9HbFNuWERiMFhId0JaenpNamdMYmFtdnB2ZFRSUExsR0xxVEFCS3dFa2dx?=
 =?utf-8?B?UjBFV001V1VtdGd6SnhwV0pqWGREbTVjMFpmTmdST09QOHI2Wng0MUVEcElV?=
 =?utf-8?B?Mll3Q0t5OExiSWdjK3RkSmpNeU9PYkVWQnUvWFVPWUNzZ2Foczl0cDZWUVBq?=
 =?utf-8?B?UVFzNkFwb2lpS0Q2WTFMUUdRNHE5MDBzczM1Qnphb01YTm4yNDNRMlJLRVdr?=
 =?utf-8?B?ZWtNcnB3cDBndW1XVDJwcVhhblNFTXRjVEhValFaTFhqZ0ZCN2VHT0ZZbXJV?=
 =?utf-8?B?bEFES1FmT2hkcnJ0L3ZhVFNCajhhMjFpVXQrcjhsd0J3dlBzS29BYVlSWU10?=
 =?utf-8?B?MUluRGJGV0R5djNNSER5WHBEQlpZZXVzZCtzMzVXTm4rSXl4bXpLcWY2WjNO?=
 =?utf-8?B?RG95MHM1cTlrTTVVenVQMUdJREZGRnVaT2pyb255OFZsL1c4TWdkdUM2WXlR?=
 =?utf-8?B?aFRxbEFoTnBtenJPWjNFaWhDY3R1Q0dEcklaN1ErSHVXSzBSdkFpbTVIR043?=
 =?utf-8?B?dk80eittV2ZjZ1JEZm5ycGFvR3ltVm02K3B1Znh6K0FETzhJbHVrMEpVcS9u?=
 =?utf-8?B?YVVJcVlyczEyRU0xT0FGV1lmNFpUSkRQNjJjMW1vZWs2Q0w2WXVFUTJZMWp4?=
 =?utf-8?B?V2xrajJlNzNBTXZRdFlCbTIyRGo1Z3pTTHNMY1NMbGo2T2ZpU1FnSHdpdExp?=
 =?utf-8?B?NFJ6ckhLNzVGZFgzK3J1eWRPRnlZZEFDb2JWZlp2TFZQZGhkdzJCaXI0WFow?=
 =?utf-8?B?ZlZpbjViZ3NvdldoYVdFcmpESitEQ2YyRFFQRS9HU1pXbzBFTThtZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dd143b-84d8-48e1-6ccf-08de63f9f233
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 14:30:29.4277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bHA5aTgw42RqoRXBq7k/FdcT/1qIWAmMifXu0R/IJOrAMFMJMWEfKCJloZadRm18TtqK8akjmj4F7nyUO0bTMbPnvczobAJ4i3uZQ2gXwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR07MB11315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230535

VGhpcyBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4gSSBoYXZlIHRlc3RlZCBpdCBvZmZsaW5lLiBP
bmx5IGEgc21hbGwgdHlwbyBpbiBwYXRjaCAzLg0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWYWxlbnRpbkJvdWRldmluIDx2YWxlbnRpbi5ib3VkZXZp
bkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgMiBGZWJydWFyeSAyMDI2IDIxOjUyDQo+IFRv
OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBEYW5pZWwg
VHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT47DQo+IGplcm9tZS5vdWZlbGxhQHNh
dm9pcmZhaXJlbGludXguY29tOyBWYWxlbnRpbkJvdWRldmluU0ZMDQo+IDx2YWxlbnRpbi5ib3Vk
ZXZpbkBzYXZvaXJmYWlyZWxpbnV4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY3IDAvNF0gZ2Vu
ZXJhdGUtY3ZlLWV4Y2x1c2lvbnM6IEFkZCBhIC5iYmNsYXNzDQo+IA0KPiBGcm9tOiBWYWxlbnRp
bkJvdWRldmluU0ZMIDx2YWxlbnRpbi5ib3VkZXZpbkBzYXZvaXJmYWlyZWxpbnV4LmNvbT4NCj4g
DQo+IENoYW5nZXMgc2luY2UgdjY6DQo+IC0gVXBkYXRlIHRoZSBtYWludGFpbmVycy5pbmMgZmls
ZSB0byBhZGQgbmV3IG1haW50YWluZXIgZm9yIHRoZQ0KPiAgIGN2ZWxpc3R2NS1uYXRpdmUgcmVj
aXBlLg0KPiAtIFVwZGF0ZSBjdmVsaXN0djUtbmF0aXZlIHJlY2lwZSB0byByZW1vdmUgdGhlIHZh
cmlhYmxlcw0KPiBDVkVMSVNUVjVfREVGQVVMVF9TUkNSRVYgYW5kIENWRUxJU1RWNV9VU0VfQVVU
T1JFViBmb3IgYSBmaXhlZA0KPiAgIFNSQ1JFViB1c2FnZSAoQVVUT1JFViB3aWxsIGJlIHJlY29t
bWVuZGVkIGluIHRoZSBkb2N1bWVudGF0aW9uIGlmIHRoZSB1c2VyDQo+IHdhbnRzIHRvIHVzZSB0
aGUgbGF0ZXN0IGF2YWlsYWJsZSBjb21taXQpLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2NToNCj4g
LSBBZGQgYSBuZXcgY29tbWl0IHRvIGFkZCBhIG5ldyByZWNpcGUgY3ZlbGlzdHY1LW5hdGl2ZSB0
byBjbG9uZSB0aGUNCj4gICBjdmVsaXN0djUgcmVwb3NpdG9yeS4NCj4gLSBVcGRhdGUgdGhlIHNj
cmlwdCBnZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5weSB0byB1c2UgcHJvdmlkZSB0aGUgSlNPTg0K
PiAgIGZvcm1hdCBvdXRwdXQgd2l0aCB0aGUgSU5DIG91dHB1dCBhdCB0aGUgc2FtZSB0aW1lIHVz
aW5nIC0tb3V0cHV0LWpzb24tZmlsZSBhbmQNCj4gICAtLW91dHB1dC1pbmMtZmlsZSBvcHRpb25z
Lg0KPiAtIFVwZGF0ZSB0aGUgLmJiY2xhc3MgdG8gdXNlIHRoZSBuZXcgY3ZlbGlzdHY1LW5hdGl2
ZSByZWNpcGUuDQo+IC0gUmVtb3ZlIHRhc2tzIGFuZCB2YXJpYWJsZXMgZnJvbSB0aGUgLmJiY2xh
c3MgdG8gc2ltcGxpZnkgdGhlIGNvZGU6DQo+ICAgKiBSZW1vdmUgdGhlIGRvX2Nsb25lX2N2ZWxp
c3RWNSB0YXNrLg0KPiAgICogUmVtb3ZlIF9fYW5vbnltb3VzIGZ1bmN0aW9uIHRvIHNldHVwIFNS
Q19VUkkgYW5kIFNSQ1JFVi4NCj4gICAqIFJlbW92ZSB0aGUgdmFyaWFibGVzIEdFTkVSQVRFX0NW
RV9FWENMVVNJT05TX1NSQ19VUkksDQo+ICAgICBHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19TUkNS
RVYsDQo+IEdFTkVSQVRFX0NWRV9FWENMVVNJT05TX05FVFdPUkssDQo+IEdFTkVSQVRFX0NWRV9F
WENMVVNJT05TX1dPUktESVIsDQo+ICAgICBHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19ERVNUU1VG
RklYLCBhbmQNCj4gR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfVU5QQUNLX0RJUg0KPiAgICAgc2lu
Y2UgdGhleSBhcmUgbm90IG5lZWRlZCBhbnltb3JlLg0KPiAtIFJlbW92ZSBkaXJlY3QgaW5jbHVz
aW9uIGluIGxpbnV4LXlvY3RvLmluYyBhbmQgbGV0IHRoZSB1c2VyIGluY2x1ZGUgdGhlDQo+ICAg
YmJjbGFzcyBpbiB0aGVpciBrZXJuZWwgcmVjaXBlIGlmIHRoZXkgd2FudCB0byB1c2UgaXQuDQo+
ICAgVXNpbmcgRU5BQkxFX0tFUk5FTF9DVkVfRVhDTFVTSU9OUyB2YXJpYWJsZSB0byBlbmFibGUv
ZGlzYWJsZSB0aGUNCj4gZmVhdHVyZSBpcw0KPiAgIG5vdCBuZWVkZWQgYW55bW9yZS4gSW5jbHVk
aW5nIHRoZSBiYmNsYXNzIGlzIGEgY2xlYW5lciBpbXBsZW1lbnRhdGlvbiBjb21wYXJlDQo+IHRv
IHNldCBhIHZhcmlhYmxlDQo+ICAgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGZlYXR1cmUuDQo+IC0g
QWRkIHRoZSB2YXJpYWJsZXM6DQo+ICAgKkdFTkVSQVRFX0NWRV9FWENMVVNJT05TX09VVFBVVF9K
U09ODQo+ICAgKkdFTkVSQVRFX0NWRV9FWENMVVNJT05TX09VVFBVVF9JTkMNCj4gICB0byBjdXN0
b21pemUgdGhlIG91dHB1dCBwYXRocyBvZiB0aGUgZ2VuZXJhdGVkIGZpbGVzLg0KPiANCj4gQ2hh
bmdlcyBzaW5jZSB2NDoNCj4gLSBQYXRjaCAyLzQ6DQo+ICAgKiBSZW5hbWVkIHRoZSBiYmNsYXNz
IHRvIGtlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5iYmNsYXNzIHRvIGJldHRlcg0KPiBy
ZWZsZWN0IGl0cyBwdXJwb3NlLg0KPiAgICogQWRkIG5ldyB2YXJpYWJsZSBFTkFCTEVfS0VSTkVM
X0NWRV9FWENMVVNJT05TIHRvIGVuYWJsZS9kaXNhYmxlIHRoZQ0KPiAgIGZlYXR1cmUuDQo+ICAg
QnkgZGVmYXVsdCwgdGhlIGZlYXR1cmUgaXMgZGlzYWJsZWQgdG8gYXZvaWQgdW5leHBlY3RlZCBi
ZWhhdmlvciBvbg0KPiAgIGV4aXN0aW5nIGJ1aWxkcyB3aXRoIGxpbnV4LXlvY3RvLg0KPiAgICog
QWRkIG5ldyAiX19hbm9ueW1vdXMiIHB5dGhvbiBmdW5jdGlvbiB0byBzZXR1cCB0aGUgdmFyaWFi
bGVzIFNSQ19VUkkgYW5kDQo+IFNSQ1JFViBvbmx5IGlmDQo+ICAgdGhpcyBmZWF0dXJlIGlzIGVu
YWJsZWQgd2l0aCBFTkFCTEVfS0VSTkVMX0NWRV9FWENMVVNJT05TLg0KPiAgIEFsc28gcHJldmVu
dCBmcm9tIG1vZGlmeWluZyBTUkNfVVJJIGFuZCBTUkNSRVYgdmFyaWFibGVzIGluIHRoZSBkZWZh
dWx0IGxpbnV4LQ0KPiB5b2N0byB1c2VjYXNlLg0KPiAgIE5vdywgdGhlIHJlY2lwZSBkb2VzIG5v
dCBoYXZlIGFueSBpbXBhY3Qgb24gdGhlIGJhc2ljICJsaW51eC15b2N0byIgcmVjaXBlIGlmIHRo
ZQ0KPiBmZWF0dXJlIGlzIGRpc2FibGVkLg0KPiAgICogQWRkIG5ldyB2YXJpYWJsZXMgR0VORVJB
VEVfQ1ZFX0VYQ0xVU0lPTlNfREVTVFNVRkZJWCBhbmQNCj4gICBHRU5FUkFURV9DVkVfRVhDTFVT
SU9OU19VTlBBQ0tfRElSIHRvIGN1c3RvbWl6ZSB0aGUgd29ya2luZyBkaXJlY3RvcnkNCj4gcGF0
aCBvZiB0aGUNCj4gICBjbGFzcy4NCj4gLSBQYXRjaCA0LzQ6DQo+ICAgKiBVcGRhdGUgdGhlIGlu
aGVyaXQgc3RhdGVtZW50IGluIGxpbnV4LXlvY3RvLmluYyB0byByZWZsZWN0IHRoZSBuZXcgbmFt
ZSBvZiB0aGUNCj4gYmJjbGFzcyB3aXRoDQo+ICAgImtlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVz
aW9ucyIuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAtIFBhdGNoIDIvNDoNCj4gICAqIEFk
ZCB2YXJpYWJsZXMgdG8gY29udHJvbCBvZmZsaW5lIG1vZGUsIHNvdXJjZSBVUkkgYW5kDQo+ICAg
U1JDUkVWIGZvciBkZXRlcm1pbmlzdGljIHRlc3RpbmcgKEdFTkVSQVRFX0NWRV9FWENMVVNJT05T
X1NSQ19VUkksDQo+ICAgR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfU1JDUkVWLA0KPiBHRU5FUkFU
RV9DVkVfRVhDTFVTSU9OU19ORVRXT1JLKS4NCj4gICAqIFVwZGF0ZWQgZ2VuZXJhdGVfY3ZlX2V4
Y2x1c2lvbnMgdGFzayBzY2hlZHVsaW5nIHRvIGJlIGV4ZWN1dGVkIGJlZm9yZQ0KPiAgIGRvX2N2
ZV9jaGVjay4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+IC0gUGF0Y2ggNC80OiBJbmhlcml0
IHRoZSBuZXcgYmJjbGFzcyBpbiBsaW51eC15b2N0by5pbmMgaW5zdGVhZCBvZg0KPiAgIGluZGl2
aWR1YWwgcmVjaXBlcy4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+IC0gUGF0Y2ggMi80OiBS
ZW1vdmVkIHRoZSBtYW5kYXRvcnkgZXhlY3V0aW9uIG9mIHRoZQ0KPiAgIGdlbmVyYXRlLWN2ZS1l
eGNsdXNpb25zIGNsYXNzIG9uIGV2ZXJ5IGJ1aWxkLiBJdCBub3cgbmVlZHMgdG8gYmUNCj4gICBt
YW51YWxseSBydW4gdXNpbmc6DQo+ICAgICBiaXRiYWtlIC1jIGdlbmVyYXRlLWN2ZS1leGNsdXNp
b25zIDxrZXJuZWwtcmVjaXBlPg0KPiANCj4gVmFsZW50aW5Cb3VkZXZpbiAoNCk6DQo+ICAgZ2Vu
ZXJhdGUtY3ZlLWV4Y2x1c2lvbnM6IEFkZCBvdXRwdXQgZm9ybWF0IG9wdGlvbg0KPiAgIGN2ZWxp
c3R2NTogYWRkIGEgbmV3IHJlY2lwZQ0KPiAgIGtlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVzaW9u
czogQWRkIGEgLmJiY2xhc3MNCj4gICBnZW5lcmF0ZS1jdmUtZXhjbHVzaW9uczogTW92ZSBweXRo
b24gc2NyaXB0DQo+IA0KPiAgLi4uL2tlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5iYmNs
YXNzICAgIHwgIDQ2ICsrKysrKysrDQo+ICBtZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRh
aW5lcnMuaW5jICAgICAgfCAgIDEgKw0KPiAgLi4uL2N2ZWxpc3R2NS1uYXRpdmUvY3ZlbGlzdHY1
LW5hdGl2ZV9naXQuYmIgIHwgIDE5ICsrKysNCj4gIC4uLi9jb250cmlifS9nZW5lcmF0ZS1jdmUt
ZXhjbHVzaW9ucy5weSAgICAgICB8IDEwNyArKysrKysrKysrKysrKystLS0NCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUg
MTAwNjQ0DQo+IG1ldGEvY2xhc3Nlcy9rZXJuZWwtZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMuYmJj
bGFzcw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvY3ZlbGlzdHY1
LW5hdGl2ZS9jdmVsaXN0djUtDQo+IG5hdGl2ZV9naXQuYmINCj4gIHJlbmFtZSB7bWV0YS9yZWNp
cGVzLWtlcm5lbC9saW51eCA9PiBzY3JpcHRzL2NvbnRyaWJ9L2dlbmVyYXRlLWN2ZS0NCj4gZXhj
bHVzaW9ucy5weSAoNTUlKQ0KDQo=

