Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1277CC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 11:14:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12994.1668683637091687272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 03:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BncLF8sX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83209441af=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AHB5YXV027177
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 03:13:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fJt2tc1qAyXYAY8vv282GwB7ScC+4rMnsnKsmF+5l0U=;
 b=BncLF8sXqdZ/4dt0ReqONW2vTspyQuciWhfbY8XUs1udi2+gmheujXDGW2OwK4E9rz+u
 0NSF5Yq87Fe122xYhZtcR6Qs0pxEFacE26L8JqvJOAcxApBZGBgKrnaLUCmEDMe+htRO
 WatOfeldp4t0uX5vP3wmU/jYS09U03vKkOBShhtG6xYXeP0IzvhKRnfvfFKepCpRj7IG
 sRcZGij6Y27ZfHG1GHO69AhS0NTbTW7K//+f0jby3cy/esWTX2lvtPvww9k8CvfB/Dpw
 l976WOiUEnUqU64N3zla75m3QS0lR1QTe/ivqj0QkkWgeuUaXCmjFpRkR2/9V2Zzv+u2 fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbxvr9f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 03:13:56 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AHBDt27017071
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 03:13:55 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbxvr9f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 03:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npfERNCwZBKUpqU+qVEU8CntoJrht/ktwasY5IhycbOaKKpyLnS86X7aqLnFiVmLzJDSlYp5LwpRsgRYme3ME/t0OTX4Jrc5jhWQl3LCnaKkoKBBYepdQymukXZVJ6BGg/QvRkT1BCb8/EJJSKnmFXX+hvn9pUbt62zm7lZm1RX/bzCNz/+YgIc+1XEVEWjBVXvUfyUH3FdwnXTnWgbBAjLioLh70ITH5XzDrNXLpGlcMrJyoDOSNdjZBP8AKwaGojlGnwAvSswNlTQuRH6yV7lnkxCrW2UMQ5Ru152TwE/YHVnaJoyT3PsHLRfXo1VfpcEtxUQ4LgcgkKbOe4jrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJt2tc1qAyXYAY8vv282GwB7ScC+4rMnsnKsmF+5l0U=;
 b=ELhbiNrSFi2kXMzMLr9iju8kyG3rfojlwBUeZ+3ImXsxMQnh5BohAcY/sprEHQ4QeHyKi2tn0ySQ1XKtyPVGLbgxYGXq6z45oRDnJBUcf0SdFDcBCwuzuQzpQsmYPabwG4Xk5ItXafKvL0+ZTBLGfbgt4PKWe0LuyUHMtASvW1uASM51nbX6ucQdTLUw6x5Wrh1ANDi02BT0V8Lfjpnyupfa7ooa5DO+DAYEbzUOT0roVnkuRlXGvTzdGRkU9CShEa/6MRdU4YOyvMlQ9uWOwNdivJFaFeE2RJiYXhNPTGk9WPgv7fXNblyMk9bx+J+q8/sNAyEaNelvKfjhue90hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6803.namprd11.prod.outlook.com (2603:10b6:510:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 11:13:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 11:13:52 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] resolvconf: make it work
Thread-Topic: [OE-core][PATCH] resolvconf: make it work
Thread-Index: AQHY+PiS8x1U+XLla0m/kvRE5YIDGq5BGVCAgAHebPA=
Date: Thu, 17 Nov 2022 11:13:51 +0000
Message-ID: 
 <CO6PR11MB5602D6408BA858C2715DB88FED069@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221115134531.34920-1-Qi.Chen@windriver.com>
 <CAMKF1sqVM636L3GnsxUxVx_UkWq5MHceBBYYAnM9Q4BN-fGOog@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqVM636L3GnsxUxVx_UkWq5MHceBBYYAnM9Q4BN-fGOog@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH8PR11MB6803:EE_
x-ms-office365-filtering-correlation-id: 8dfc637d-032f-4ef2-6ab3-08dac88ccef8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xsO8GSX49uRHDXKmWH1upAfNOa6+2Q0TIBSWuCKQAboqUSDETyDktpiqVIk9kXTfjrETYpKSIDw0i5AIN5VEH+Pf34VuezhA1qnrFfBWQ9SFmUkV+MiQv2zAtehXVc4xvGwgUmh8zVk2Cn/iawCnEvn6nZdteuDDp9AQNle41f9g7bPJAbEOfbLd6DUrk5XmDZkei950mKaaqAiNnzuUwkw907br84KnMkwpwbE8yWM8dMXOFwPJc8wTmszzkfohfxDoiMju2UOTnc0xq1JmPXTQD09Vuiz5sGMssPYJ1Uhux7V70Ie7sYdnxmyyumP7K+VLvUM1aA80n8jODEtNfXbY+CwgfYLbYNLYb6NHHRzMwT2erqLZyrfVR1tunIL7APabisoJo6J6wZ1aeB2KnznaruHsIGYkmdQww37gmCk21ID5P1x1zb6m2zIVOul7NsBxbWtGtSlxWpWyYttMt4Bvccz9bFcZ5II6yMfVidxvHibpfPKpl9ghC00j59mdN7V0R+SQReFY11S+9o/B3HsnnPJbhnh+QcNMZ5V9e0gslHOS1uVj3b01jnsOOEO/p5iRQZnJtquIa6sc8lu41baW2dqKEJ/y8GBhRvSBB3jmZtra7R1KB8/9AYsLKNhO4XFnQXrEWYa3TXG4TWy/64EhuF6bgSbd8gnd5dzll+JQ0XYNL4rDu0F5kK43/058T3V1bLZ+cYXeFi2wr66Zzxoq8CEDGUBSB4g2lczvlbLvlVUPPvM+luaJpR536aiGqx8w71Qoc2ts0BiQbYGhTg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199015)(38100700002)(122000001)(66899015)(33656002)(6916009)(316002)(4326008)(66556008)(8676002)(66476007)(66446008)(64756008)(76116006)(8936002)(66946007)(52536014)(41300700001)(9686003)(966005)(5660300002)(55016003)(86362001)(71200400001)(2906002)(7696005)(38070700005)(83380400001)(6506007)(478600001)(26005)(53546011)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFJvZkE1dmdxeVFtWWR4RHJWTllGekVxQnhnUzJZRnZ4Nmp3MzlrbkU0U2Vm?=
 =?utf-8?B?RHVHZU9HMERITXozS2JDZzZvRzBFMk1MZ3pNeHJBK2RReVg5WWcrSm5PWjZQ?=
 =?utf-8?B?aUlLVThOWFMrMlAyTXRUNnlZbStPQ1dFRzh6R1daWS9FMDkzcjkrV1hkbVVn?=
 =?utf-8?B?R0xRRjRnS2RjV29PN0t2TDlCdG96QkdkZjFWQ0lNYVhGaUdRMTljbjZrUkh5?=
 =?utf-8?B?Wjh0Ulk4cXJ4M1NucjFSV05VNGV3SlM1ajJPWk9sOXFpbW1ad3dlZGw2M2Z4?=
 =?utf-8?B?VnpTaXNtb2ZaQ2pVN25WVW1MQkI2YmZxa2gvelA5aGFKTlFYUHNPL2JBaWRu?=
 =?utf-8?B?ZnozR1EzeVNaZEFobnhDMEN2YmVmR2xrVXhzaVR0QVowUjlaWVFnT0NUOUo2?=
 =?utf-8?B?aVZicmZ6aEhONS94c1N0OUlSOXYxaWFGek1HRmVyUFNKSmE1NzhCMlhBUyt6?=
 =?utf-8?B?aStaRTByNUorZ2NaSURrMUVwMHJtR2lNVnJ5QjQyVkxORVNhdml0NjhNSktv?=
 =?utf-8?B?Y2lScEQ2TUt3bkt0RFNMK1VNYk42NTRtdWNsNHJYS2p3TGt5ZUhhV0hIbE1l?=
 =?utf-8?B?dlNsYUZMRlRmNEJDVW8zaHA0UTdoV1VlcGcwK21sOXdrUFlyQVpncXlabjcv?=
 =?utf-8?B?aFpkWkZSMjlIclBkaUJWdWRLRDhJK2pCb2FGcGsvakNqRjZOK296WWNEZWRL?=
 =?utf-8?B?cVhBTk9JTzJrY1dYbm54WElGR3VwbVhzbG41dzBFTGJrNW9ENnhQdzV4RHZj?=
 =?utf-8?B?MnNrcmRGNnZZSUdCZVBTY0hSbGVmdTRoaURYRmdRSHR1Z2J6dmxLNkgzOGYz?=
 =?utf-8?B?bDR4VTJRVzYwMERKYkl5QWhKTE1UbmFMbVlldHdKY25lTGVDVHFKT0JnQlow?=
 =?utf-8?B?NVQ3UlV2T2ptbTQrbTZPb0t0U1p5UktMM2drNzhET3pyYjh5VDcrRC9xL2cr?=
 =?utf-8?B?VTN1OWczcVMxM3pBeXYrc2FqWnArODQxUzNEM1N0eXk0WWlURHplZnpuODBU?=
 =?utf-8?B?Q3JBejBJc1ltR1pCeitOcTFiMVpQdXhvNG5OVys0RU4rVS9XdzRkWHI2Yjd0?=
 =?utf-8?B?YTVkaHZ0R2tJcUI3UEFPOUNQRkRoOXNYd2kxN1dRRTJDazJ3ZlNKdzdTQUlj?=
 =?utf-8?B?MlNYRE96TStYcEMxUDlTcERyUWo3SUQvbFFHZURTSHFSZVF2SHhDM2FWdGlr?=
 =?utf-8?B?SVh4RkE3SUlQNXRtY3J2MWJqUy8ybXNLWTRWVnlEbkd2SDhncjEyVEVNQkx2?=
 =?utf-8?B?MElZTzYyeC81YXN3bXRDblJTU2RMYVFqVWNOaWFubzZIdHlMUjljNGJMMjcr?=
 =?utf-8?B?MXBSbXZQM3VleU5wdEhzaCtOUzRwSnR4cVRlM1FkK2VMRTRhbklrOHRSWmRG?=
 =?utf-8?B?RGczRWtOMHNyYWpLcnhHOEFOTE01NFQ2TFUrdzNNVXFFT0hQbWRCVlZCZllp?=
 =?utf-8?B?VUQzM0plQkFpb0o1T0NaZ0h5NFhvNFNMM1hnTUxmOGtUNHJBdERUVDFrSnBJ?=
 =?utf-8?B?UTYwclRBNEtHNUtOMGc2bHNRc3FmOHB1WjhrRFFoZ3RwaFZIeHlnUUFYWDRv?=
 =?utf-8?B?Q2FnT1UvQjJ3ckFkQVZIRFFVYlUzOXVOS09XTFZnaVRSUGl4SlVoS1pvd2tN?=
 =?utf-8?B?ZVBqQmExeERiZXc1ZDc4eHhKdURiK1FUNTJZMmNxd3VVbDhscjFRUWoxczR5?=
 =?utf-8?B?QU4zZnptOWxaQTBDMENxMm5tZElmYmpudm9vVzV5WlFUcVlIN09ZUlNqYTc2?=
 =?utf-8?B?R0JOYjVlMmtTQlQ1Ymt1ZnZQY0FUbWhVUHIvb0wwdVppZHFnM0t4ZVJJM0lC?=
 =?utf-8?B?Q0s5d2xSSk9BUEw2QnlHVUcvS21nUzRFNzE2d2R3VWlMdS95MkxSMHZneURX?=
 =?utf-8?B?VDJjK0JyMktmQ3RqZlU3ZW0zYmhvbWxTZVFqcC9wamdXNjdjVFBGbThSQy95?=
 =?utf-8?B?cEVxdnNZQllCbDRuZ0t2VDhBWWJidnBkWXl0VWxjTUN5c1pFM3Q2YkEyWjUw?=
 =?utf-8?B?Z2t4WXdvc2p3Zlp5VFVYVUhVd1lLQ203RGtDVU85bTUxaHZ4WnNqWU4xOXRV?=
 =?utf-8?B?T0UwQjVPK3UxQjVkckdPZjRIdTlwNjlaQTc5Z0MycVpYZHhPNWdVZnR6UWJy?=
 =?utf-8?Q?b0ocfr0FiGJaaoOERT5/JV2Ez?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfc637d-032f-4ef2-6ab3-08dac88ccef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 11:13:51.9240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ik2lUkUfyFh/gpd0fpleBrcj0rzxFswxccFVnkTbM9FXcrYCLKi6hiMDhzZPiWwEzUsXJnV4erskSO2p1t1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6803
X-Proofpoint-ORIG-GUID: iqEU61GU51-xtGBOkyBk6gBMHdOS5IbO
X-Proofpoint-GUID: WbKs_G-OzMtWEavfuDgFH791uEFjP40K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=886 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 11:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173416

SGkgS2hlbSwNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIFllcywgd2UgY2FuIGF2b2lk
IGRlcGVuZGVuY3kgb24gY29yZXV0aWxzIGJ5IHVzaW5nICdyZWFkbGluayAtZicuDQoNCkkgY2hl
Y2tlZCB0aGUgZ2l0IGhpc3RvcnkgYSBsaXR0bGUgYml0LCByZXNvbHZjb25mIHdhbnRzIHRvIGRl
cGVuZCBvbiBjb3JldXRpbHMsIGFuZCBsb29raW5nIGF0IHRoZSAnLW0nIG9wdGlvbiwgd2UgY2Fu
IHJlYXNvbmFibHkgZ3Vlc3MgaXQgd2FudHMgdG8gaGFuZGxlIHRoZSBjYXNlIG9mIHBhcmVudCBk
aXJlY3Rvcnkgbm90IGV4aXN0aW5nLiANCkJ1dCBpbiBvdXIgY2FzZSwgL2V0YyBpcyBhbHdheXMg
dGhlcmUuIFRoZXJlJ3MgcmVhbGx5IG5vIG5lZWQgdG8gdXNlICctbScuICdyZWFkbGluayAtZicg
Y2FuIGFsc28gd29yay4NCkkndmUgdXNlZCBhIHBhdGNoIHRvIGF2b2lkIGNvcmV1dGlscyBkZXBl
bmRlbmN5IGluIFYzLiBJdCB3aWxsIGJlIHNlbnQgb3V0IHNvb24uDQoNClJlZ2FyZHMsDQpRaQ0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDE2LCAyMDIyIDI6MzYgUE0NClRv
OiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHJl
c29sdmNvbmY6IG1ha2UgaXQgd29yaw0KDQpPbiBUdWUsIE5vdiAxNSwgMjAyMiBhdCA1OjQ1IEFN
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+DQo+IFRoZSBjdXJyZW50
IHJlc29sdmNvbmYgZG9lcyBub3Qgd29yay4gTWFrZSBpdCB3b3JrIHdpdGggdGhlIGZvbGxvd2lu
ZyANCj4gY2hhbmdlcy4NCj4gMS4gSW5zdGFsbCBub3JtYWxpemUtcmVzb2x2Y29uZiwgd2hpY2gg
aXMgdXNlZCBieSByZXNvbHZjb25mLg0KPiAyLiBBZGQgZGVwZW5kZW5jaWVzIHNlZCwgY29yZXV0
aWxzLCB1dGlsLWxpbnV4LWZsb2NrLg0KPiAgICB1dGlsLWxpbnV4LWZsb2NrIGlzIG5lZWRlZCBi
eSBvdXIgYnVzeWJveCBkb2VzIG5vdCBzdXBwb3J0ICctdycNCj4gICAgYnkgZGVmYXVsdC4gY29y
ZXV0aWxzIGlzIG5lZWRlZCBieSB0aGUgYnVzeWJveCdzIHJlYWRsaW5rIGRvZXMNCj4gICAgbm90
IHN1cHBvcnQgJy1tJy4gc2VkIGlzIG5lZWRlZCBiZWNhdXNlIHdlIHdhbnQgdG8gYXZvaWQgcGFj
a2FnZQ0KPiAgICBRQSBpc3N1ZSBjb21wbGFpbmluZyBzZWQgaXMgbmVlZGVkIGJ5IG5vIG9uZSBw
cm92aWRlcyBpdC4NCg0KQ2FuIHdlIGF2b2lkIGRlcGVuZGVuY3kgb24gY29yZXV0aWxzID8gbWF5
YmUgY2hlY2sgd2h5IC1tIGlzIG5lZWRlZCBhbmQgcGVyaGFwcyBqdXN0IHVzZSBhYnNvbHV0ZSBs
aW5rLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNv
bT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2
Y29uZl8xLjkxLmJiIHwgNiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkxLmJiIA0KPiBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNvbHZjb25mXzEuOTEuYmINCj4gaW5kZXggOTRmZDJj
MWE3MC4uM2JmNWVjNmMzMiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45MS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkxLmJiDQo+IEBAIC05LDcgKzksNyBA
QCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIiDQo+ICBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT1jOTNjMDU1MGJkMzE3M2Y0NTA0YjJjYmQ4OTkxZTUwYiINCj4gIEFV
VEhPUiA9ICJUaG9tYXMgSG9vZCINCj4gIEhPTUVQQUdFID0gImh0dHA6Ly9wYWNrYWdlcy5kZWJp
YW4ub3JnL3Jlc29sdmNvbmYiDQo+IC1SREVQRU5EUzoke1BOfSA9ICJiYXNoIg0KPiArUkRFUEVO
RFM6JHtQTn0gPSAiYmFzaCBzZWQgY29yZXV0aWxzIHV0aWwtbGludXgtZmxvY2siDQo+DQo+ICBT
UkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL3Jlc29sdmNvbmYuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD11bnN0YWJsZSBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly85OV9y
ZXNvbHZjb25mIFwNCj4gQEAgLTM5LDEyICszOSwxNCBAQCBkb19pbnN0YWxsICgpIHsNCj4gICAg
ICAgICBmaQ0KPiAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7YmFzZV9saWJkaXJ9LyR7QlBOfQ0K
PiAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0vJHtCUE59DQo+ICsgICAgICAg
aW5zdGFsbCAtZCAke0R9JHtub25hcmNoX2Jhc2VfbGliZGlyfS8ke0JQTn0NCj4gICAgICAgICBs
biAtc25mICR7bG9jYWxzdGF0ZWRpcn0vcnVuLyR7QlBOfSAke0R9JHtzeXNjb25mZGlyfS8ke0JQ
Tn0vcnVuDQo+ICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfSAke0R9JHtiYXNl
X3NiaW5kaXJ9DQo+ICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHttYW5kaXJ9L21hbjggJHtEfSR7
ZG9jZGlyfS8ke1B9DQo+ICAgICAgICAgY3AgLXBQUiBldGMvcmVzb2x2Y29uZiAke0R9JHtzeXNj
b25mZGlyfS8NCj4gICAgICAgICBjaG93biAtUiByb290OnJvb3QgJHtEfSR7c3lzY29uZmRpcn0v
DQo+ICAgICAgICAgaW5zdGFsbCAtbSAwNzU1IGJpbi9yZXNvbHZjb25mICR7RH0ke2Jhc2Vfc2Jp
bmRpcn0vDQo+ICsgICAgICAgaW5zdGFsbCAtbSAwNzU1IGJpbi9ub3JtYWxpemUtcmVzb2x2Y29u
ZiANCj4gKyAke0R9JHtub25hcmNoX2Jhc2VfbGliZGlyfS8ke0JQTn0NCj4gICAgICAgICBpbnN0
YWxsIC1tIDA3NTUgYmluL2xpc3QtcmVjb3JkcyAke0R9JHtiYXNlX2xpYmRpcn0vJHtCUE59DQo+
ICAgICAgICAgaW5zdGFsbCAtZCAke0R9LyR7c3lzY29uZmRpcn0vbmV0d29yay9pZi11cC5kDQo+
ICAgICAgICAgaW5zdGFsbCAtbSAwNzU1IGRlYmlhbi9yZXNvbHZjb25mLjAwMHJlc29sdmNvbmYu
aWYtdXAgDQo+ICR7RH0vJHtzeXNjb25mZGlyfS9uZXR3b3JrL2lmLXVwLmQvMDAwcmVzb2x2Y29u
Zg0KPiBAQCAtNjQsNCArNjYsNCBAQCBwa2dfcG9zdGluc3Q6JHtQTn0gKCkgew0KPiAgICAgICAg
IGZpDQo+ICB9DQo+DQo+IC1GSUxFUzoke1BOfSArPSAiJHtiYXNlX2xpYmRpcn0vJHtCUE59Ig0K
PiArRklMRVM6JHtQTn0gKz0gIiR7YmFzZV9saWJkaXJ9LyR7QlBOfSAke25vbmFyY2hfYmFzZV9s
aWJkaXJ9LyR7QlBOfSINCj4gLS0NCj4gMi4xNy4xDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3MzM0NSk6IA0KPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3MzM0NQ0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85NTA0Mjc4Ni8x
OTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg==

