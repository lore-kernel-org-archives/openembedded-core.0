Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036E3C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 22:02:08 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.82])
 by mx.groups.io with SMTP id smtpd.web11.52335.1701295318623950007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 14:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=krBI5iE6;
 spf=pass (domain: infinera.com, ip: 40.107.95.82, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4OmjW7hmSMBsBMfKsQPGtUB6EV+Rm25RK3CL9r8B955iXeZFdjWPNG6okrGxRL/cGdns39iQhol5Rbw3urTy4B8l0nd0stSCalaLXaiCvtDhzo85yTL77mfa3d/DmYz0g/2R9SvAMVYvWo1pqCAE/F65xh1vs8MKhRDfSRSayuDQYu5jQkpFZMSIsuRlRi79gFEDm72gR4trGEbT+gNWHvhOel/RyG9nwWzDzXHZeYRQf+wudRrV/VuBTFZDTTtSt65rcIO2yT1rd+ue1KvXxuCg/jQb8SxgVYnozMQoIRH2Nkd/3fUqB2/+OdJzsPBHocK5lvrMbcvC7zQud2EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6x/8wGk3R16MK7Pvg/scCo4suNQDyjOChmts6w7S3s=;
 b=S6dDfFrRAdcLg9QQHTExyss7y6Bt9RnqSMsAJScwkhb7dDgGaHSuG63gqRsMtIs+K95ObLHkPNqHiPI+2X0DGiAZwOk/+NX34ZKWM4uE4JfOwPRKDyxLBgv0lfLdRcCsv+WNC77ZG3I1gMFYsHBdNtWykuNdqXQzmvBHrVSML48VXjHCDvrRloH3Frw8OceUT4LBYmp4NAtZ4UZvoMXmsH4wP63XZgSy/B6LNa3Z+FKcnZLSPYtOdVKRrx+trljjADdTtlJLTCrcqqI4997n+b2Bt6hoO2M5v5DJGXZ0PQGEygGmEsub1m3XF3qX2dPxsy6gCrjaowrYFs4jYOallA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6x/8wGk3R16MK7Pvg/scCo4suNQDyjOChmts6w7S3s=;
 b=krBI5iE6FIRwqN+dsuBYinWoKu265JUTNzpfPlyqYd9T+u+QgH8y/2as95BJ4oQ4wnf4hSQWlSv2RdU9uqzFj+H+3D4ftFNAu+7R3boJ83qaPosKPyyJPw+kcX60t/Z+z2+hJ0am7jmh58/6UL89XForZmiMe2ymByjQdrESW7aUf2lraiGdH6jnk5OSVN1NM8HMiV3QhZoV+qbnZxD5ikGrHezgMijBzs6Fqgt9Pw+STi4M+38mIW9u48TCHsFH+U6Q/JOq1bAWMSetO9C+2CbJzdN2CAacVtgJpm5fMWCJX53lnW355WWacrJxVVRj8cuBx7TiYEVpxEMyOJ3o1A==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BN0PR10MB4981.namprd10.prod.outlook.com (2603:10b6:408:12d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 22:01:55 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 22:01:55 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
Thread-Topic: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
Thread-Index: AQHaHuAXCrrFZvI8jkyM7fz89I1/wrCNH2aAgAQMZgCAAGYtAIAASNGAgAAGyQA=
Date: Wed, 29 Nov 2023 22:01:55 +0000
Message-ID: <0b7bf4131c773635c0df1c205c49bf2d016a2729.camel@infinera.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
	 <20231124141108.1397342-3-joakim.tjernlund@infinera.com>
	 <DB5PR02MB10213D2E9905D5D115A8F4EF9EFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <cb756de9310b460726d56f962293d8a3dec54a31.camel@infinera.com>
	 <CAOSpxdYsEfEVAMAFe9_UrLrJHx7jeWgnYBdHSobp9-_mJ8cinw@mail.gmail.com>
	 <948b54403fb2f7a7533b4815cd821afeeac44f52.camel@linuxfoundation.org>
In-Reply-To: 
 <948b54403fb2f7a7533b4815cd821afeeac44f52.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BN0PR10MB4981:EE_
x-ms-office365-filtering-correlation-id: 0e01c1a4-f62a-424c-5ca8-08dbf126cd0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0AItkqS3wMHkg3vNPkJkiaGEAv+rB4KZfXiQUy8A2mZjmNfY8EBvi22UOgg7Ax4KqK72++FZ6grzHKn+a0qL6h41gM9uejr7ZYfdupEMPuHoB/30ltwO3UtsKM3aHek+N059YsM351ZWm2X8kXo8pbTRPz2Q068tRY1PzxLRNy57NI1NIShon22YocIiud/eRB+OxhtL5eWQkPRtmTJF8H81Qv7kC1e6UCI2RUlN4o23Cf4l7U6BdtczLEn680FCtDl1SKTkyuDOPsbURJO6pBlOZP8o1b0mmExSZiC00jEsmJ1FTBcRZSkenjgJ5AckBjHKPR88PqtmcXgoyGjeA9VIVOuwGSVX00GuaZ99bIAAlaqnuvWVbTqoDgQGQWRNbsuA7F9H5ogjMBiy+c8GUYRZWYM5jP4JBmayv73ZG4UMNgJbV6GtPhgkbgvAE0QU9AZxd2iHizwT7hdEs0dVRxm7d401ujfzzdybR+HGTNeUu3eeePsP9EDsbJsRIiofFGU1OwDYdD4tJNtJJ5IKYD6n5YpQNRqRwFxtrt8nET62EfNkQetVu2qskZMpikAPjyy6D8JWIXydbEIz9ZukP58t0hLmyQuk+M+7kOVfBG/ZiERz6atpmE5+YHT7f92sBmJ+DMT3Ds1MWVwHvEyAqeWdmmJyqoM+fXArbTWC/MY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(122000001)(2616005)(38070700009)(64756008)(66556008)(66446008)(54906003)(66476007)(66946007)(76116006)(4001150100001)(91956017)(110136005)(2906002)(86362001)(4326008)(316002)(8936002)(8676002)(5660300002)(6506007)(71200400001)(478600001)(41300700001)(6486002)(202311291699003)(53546011)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YjdObGVVR21qckFlQ1NPMWFReDRBMldraVhESVJjSWNsejJxcUkvSEVheTZn?=
 =?utf-8?B?UTRaV2F6UGhLM2Nra0tUZDBwa0xtNWJiT1RWVUNoQjd3eXZoeStwYUFySDVk?=
 =?utf-8?B?SUhHUklTZlFmVkZvL2NvRTczMmw4SHVvenJ0OXhWOUs2a1l3RDM4MlJNa1JR?=
 =?utf-8?B?MUFPSkRFT0NWeDhiNVo1blZwbGZpSnJ6cE82TjhiMGQvSGlzeU5jNmZiKzhQ?=
 =?utf-8?B?SW1EOHkwb2MzNFN4NGJITVQ5SnRycmtjQlNKNW9UL2FmY1o1RUZKejB0bFR1?=
 =?utf-8?B?TDl5ZGttVlRlL0V2aDFTT0MrODRVV2Z2NTkvY3Z6MGg2WllkQVNDZWdBMzFa?=
 =?utf-8?B?enNMM3ljWmtRd0lZaldjV2JES3BZZXlZRHorazdNTTdub1NlVlNKZUZWN2k0?=
 =?utf-8?B?OXp2M2M2RHdDODQzM2NUSGxqN01lYi9EeFZJRkdNcVdZTjJGejhoNHgxdzB6?=
 =?utf-8?B?c1RkeEJaeVo5bUYrTWtSL210cTE3Mmd4eS9zQnBybUZWRi9VWnQ1Ymd3cWtV?=
 =?utf-8?B?Y0c1VHRPTmE0VnRrK3hYSHBFN0JuS0VuaFJjaU5SZFBJNldLOEdXVkcwVEZw?=
 =?utf-8?B?N0xJQS9zVjZiZ3pQMWhxdWM2Rlh4R1hweTE5Zm8yRUZDYjFhV1paQVhjaWRn?=
 =?utf-8?B?dkpxSjF4cjJ5YVlMM3FJSnkrZDNCZHlVZzFkVVFwS0lJZlNSdmZxazB5Vlpy?=
 =?utf-8?B?bGVWaEFTdzlaM2JzbUtndW1kME9IQTBEakVrNXFBcmd6eGZ2bUUwZkp6R2Vy?=
 =?utf-8?B?TEF2eG8wKzhqN0ozdng3WmlmZFYzcVkvWXBWak9lZSt2aENtSHk0LytUc3Ur?=
 =?utf-8?B?YW1VcVZtL1l1WVY1ZElWMHRPaDJkQVdMZmF4Y2JHRmkzQi9nV1diZ1pEOXlQ?=
 =?utf-8?B?eTh5a0lzSFlaWFBFRmxSM3N3Zm1ZOGRlcGNmWjZPOG9OclNWeFBiK2E3TlM4?=
 =?utf-8?B?T0tnbFJxc2RyY3dlOEQwQlVpVExOVGNReEprNGlrWFV5S0hrZURvTDdXZ0NQ?=
 =?utf-8?B?aFNYMzdrZ1VwV3A4bFRBdDVMVFhrbjd1c3N6ZHZJdHhiSzFQbHhtVmpacWFs?=
 =?utf-8?B?UUZ1ajBzTTVVRFNaSVRpMTNKZUR1NmlkMTZhRnZOSnkrM0N0MW1lODBhYjNS?=
 =?utf-8?B?R0NJcTc4WkRPREhjUjhMeGhDZ3d4MHk5V2VLbmRRc0xJdXZBTFRuTHVST2VH?=
 =?utf-8?B?MkN4Y2FYajVITkp2VERFMEtvSEZGMnNiWGRFR3NIcXRpa2g1eitCN1BqTndW?=
 =?utf-8?B?bkUwbHJsM3pCcmRoK2l5WkQ1bjZhZmhTK2xyUGFZOXlIa3lHdWNPbU5hYkNM?=
 =?utf-8?B?Ui9lM2JDRWVZZFI1MCs4YmpwNGJBajdrNnJhalRNNGlKV3RPcitKL1Jwd2pQ?=
 =?utf-8?B?bityM0VZZjhPb2JaclZjeWJsMGdXL2ZjbTcyWE1YNmpXNU9PWlR5Z0ZZMG56?=
 =?utf-8?B?RXFZNTV3N0hCRjBCWDR6N1JzYW1WNGVtQ3VkYjF0V09lN1o4V21PWDdQeE16?=
 =?utf-8?B?UlNocmJuN0Z6N0l2Y1lrbEFGR1Nrdy9QZnRGWFd0Kzhva1ZpSk5ja1E5RjhL?=
 =?utf-8?B?bi9uV3YyNVY3dEFLa3BYbUJRaWxqdVFkbGFsV3lTeWJ3d1laTXRoUG4yQUVK?=
 =?utf-8?B?Zk5VRWtjUGs4M2ZnazN4UVlGbmNTSTBGMmR3ZlQ4cDA1ckN0R1dWb0FoYWxI?=
 =?utf-8?B?bThtZXljR1BnSlpFZGxIUlRsM1ZOS0ZHdStFbTllR2JNaXZjTElRUjJTVk96?=
 =?utf-8?B?SXAzc1NlQ1BXdTZndDk2b3F1RnFKamEyVkhaREk2UmNidnBJeXhkTTBiNHgr?=
 =?utf-8?B?cHNSczNHYkVONVRvSlVpaDJhV0RkSFRweExBTDJ4SHNBWllxY2NJK2JMSHFI?=
 =?utf-8?B?L1FTckZHb3FKc2Y3d0ZHeDdjeDlzdTd3Q1Y0VDBRNVFDdDFMb0JodkhoNTRx?=
 =?utf-8?B?MXZobUdqMVNnYmh1bVhsMUxPdldLU0dmV2F1ZWs2YzJHeDYyd3RZOTJTY2VS?=
 =?utf-8?B?dUFDNWowQjAzMEF2S1k4bmV6NnB3U0ZqSmxwclQzd2ZPd3NUSVk1cGZERmNJ?=
 =?utf-8?B?YWNFNm9TZmdjejNIa2RMbU53b2xsR1dzZHZ1bEduN2dBM2M5cHVWQ2RzTUVj?=
 =?utf-8?B?RCtENWJDZUJDcXByWWR0T1NlNTNlb3FGYnNQWldhSkE4dG9aNGVCSWpSQncw?=
 =?utf-8?Q?/Tef1foBKcdgar1tTs7hAu/FowkedUpUgJtvz5LsBStQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20A3C62EBE42D946A29CCD106F99F66E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e01c1a4-f62a-424c-5ca8-08dbf126cd0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 22:01:55.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpRdUVtOxCQ1jCDt9ncy51kkEV9u/XpskbkyVAaEyZ75HuQJjNkcBTS2/PKfIkDiBHpl9BO3k0aDvF4ZUytLgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 22:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191463

T24gV2VkLCAyMDIzLTExLTI5IGF0IDIxOjM3ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDIzLTExLTI5IGF0IDA3OjE3IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3Rl
Og0KPiA+IE9uIFdlZCwgTm92IDI5LCAyMDIzIGF0IDE6MTHigK9BTSBKb2FraW0gVGplcm5sdW5k
IHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA8Sm9ha2ltLlRqZXJubHVuZD1p
bmZpbmVyYS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gPiANCj4gPiA+
IEhpIFBldGVyIDopDQo+ID4gPiANCj4gPiA+IEFsbCBnb29kIGNvbW1lbnRzLCB3aWxsIGZpeCBh
Y2NvcmRpbmdseS4gTm90IHN1cmUgaG93IFBXX0RJUiA/PSAiJHtzeXNjb25mZGlyfSIgd2lsbCB3
b3JrIHRob3VnaC4NCj4gPiANCj4gPiBPbmUgYWRkaXRpb25hbCBjb21tZW50OiBhIGNoYW5nZSBs
aWtlIHRoaXMgc2hvdWxkIGJlIHN1Ym1pdHRlZCBmb3IgdGhlDQo+ID4gbWFzdGVyIGJyYW5jaCwg
aXQgY2FuJ3QgZ28gaW50byBhIHN0YWJsZSBicmFuY2ggZmlyc3QuDQo+IA0KPiBCZWluZyByZWFs
aXN0aWMsIHRoaXMgaXMgYSBmZWF0dXJlIG5vdCBhIGJ1Z2ZpeCBzbyBpdCBpc24ndCByZWFsbHkN
Cj4gYXBwcm9wcmlhdGUgZm9yIGtpcmtzdG9uZSBpbiBnZW5lcmFsLg0KDQpUaGF0IGlzIE9LLCBJ
IGNhbiByZWJhc2UgYWdhaW5zdCBtYXN0ZXIuDQo+IA0KPiBJIGRvIGFncmVlIHdpdGggUm9zcyB0
aGF0IHRoZSBhcHByb2FjaCBpc24ndCByZWFsbHkgd2hhdCB3ZSdkIHdhbnQgaW4NCj4gbWFzdGVy
IGVpdGhlciBzaW5jZSB3ZSdkIGhhdmUgdG8ga2VlcCBhZGRpbmcgdmFyaWFibGVzIGZvciBlYWNo
IGZpbGUNCj4gcGVvcGxlIHdhbnRlZCB0byBjaGFuZ2UuIEFzIHN1Y2ggSSdtIHVubGlrZWx5IHRv
IGFjY2VwdCB0aGVzZSBwYXRjaGVzDQo+IGZvciBtYXN0ZXIgYXMgdGhlcmUgYXJlIG90aGVyIHdh
eXMgdG8gaGFuZGxlIHRoaXMuDQoNCldoYXQgb3RoZXIgd2F5cz8gSSBoYXZlIGV4cGxvcmVkIHNl
dmVyYWwgYW5kIHRoaXMgd2FzIHRoZSBvbmx5IHRoaW5nIHRoYXQgd29ya2VkLg0KSSBkb24ndCBj
b25zaWRlciBvdmVybGF5ZnMgb3ZlciBhbGwgb2YgL2V0YyBhbiBhbHRlcm5hdGl2ZS4NCg0KIENo
ZWVycyANCiAgICAgICAgICBKb2NrZQ0KDQoNCg0K

