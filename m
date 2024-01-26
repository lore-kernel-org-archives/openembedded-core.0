Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A016C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 11:09:41 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web10.13423.1706267377618468059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 03:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=J5YVCd0l;
 spf=pass (domain: infinera.com, ip: 40.107.100.87, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDOBlUA0W0ySpgkPEv3GE/kvGgyf6d3xL7AmIcEFagtTKa/tPtZM93hcqP0XnSVPUu6cN5Rb2iofzyztUsvPs5j7D7PP/qSFfEhw/h87QLwzJAVJiDPRhwjkY6ySz5J1Du57le3AgquLvm733Opn3dvrAkfiFRBVEpg/tgcTbpN/dD4RHiykuq8cgcvVql390Ku2/acHAAgB/c/R3EnorznXas6S88Qv8eC9WeN0JeI3FUivGF5OM7mKxvDP/Yryzfo+vySJIl/9c7dnZEvybWe5B3aPVgt26HGgTR6Ambb6D7qAQqa/gr11IQqt9OwRohTaWp0kxwBvnVK47E4dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDrP7Wq/pKC1O9XwY/2qRU5m0MyG1PsgLHRmA0INvho=;
 b=iDVa2lqzN5EMkIBUqy3dPV/GsN87IQNtQJNcPLpt7p9blCDkbY+K3378N3Qp8hO/Vm3bEoVSm9ydkV/x6bvJ8wJVz2nRb92pcn7ZbzG3gQzYJYs5T931Xla2YN9I/KMN3hpPk9BdjE1gq65JDa6qqqufuLsjtLJE4zkKv58KfXukXu6RgrqEbaGbETHg2MqZVcqcdgFboXUI6BHSinHL80ifNooK0yz9J+XTTybu3LOf2R/+nk83XpjsxqmX3ay+OHlyqfxkRL7YlV3QM/ZyJ64AHYJ5YQFXyTGAJYfWLObN4Vy3W8E/FAjQCrfDeh38JRCiQqUNbjmWl2DjNki/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDrP7Wq/pKC1O9XwY/2qRU5m0MyG1PsgLHRmA0INvho=;
 b=J5YVCd0lHxgu9x6ndXmEDdhFaZ6gbi5qLxVPswQqvOLoWJqkil7kWJkIE8SChv2P36LuZabOeSlm+FE4IhON7J5OMwY21SD3d+b2osQ/8eE6jYPeHbySpicXlcYsTrlAnOPAeK/XQNwBBJrjVOoFeZXlBLl7sLasNu8PhtXF6I+GAzejAw7ow4dCJul+GBmAUjSuHkgb0NNy6yrRIX9/x7qxhTUtzHapLYEjVh6cEkURFzfOd9wW2ZtnWrzSGk1bkCO+U2OF23QrbTzRtLSOYhMZAyAnlU+VY0UHHg6oPlCLAVt4CKhsbPqKCbG4O5p7V3QqKqreyLw4RNfd/bC1hQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by IA0PR10MB6820.namprd10.prod.outlook.com (2603:10b6:208:437::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 11:09:34 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 11:09:33 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
Thread-Topic: oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Index: AQHaUEgkMNzCIETAnkmJ7AygmSs1uQ==
Date: Fri, 26 Jan 2024 11:09:33 +0000
Message-ID: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|IA0PR10MB6820:EE_
x-ms-office365-filtering-correlation-id: 43eb226f-4695-48f3-0853-08dc1e5f46da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jNjvQSWFDoiPfu6liMd2Pl3zHCjXNeiZgcTBsQ8oYdoEHgGTYQEAKkNRAsS6e5xl9jCaSXkj3zcWhy9+iVV02Z9xP/1RlrDJHBYjRp9e2HulcFRysp0m61zmVm0VcpJgXHIxtmoUqShWJFFZy2ddmsEJtj2NwW4tqRHkdzWNgz5tO0ZpSgnkZiM6Plq/xK8YB/MmFJa4sxp+5agyrDuKgBJ0SE52l4ckXLyC29kfcYfBVFJSZbnL6BJLuCOIMNmMTtbxEPB9N6EMSW9k0Xsvwqcr4V4qrhnUx21lCXy/wI1NjBmaQfcvNr+Vl72Pi2cX6pX/xjagMlsHCAh8nOgsRByw0CK3kif7ViUy+CIiqO0igWiX2ZG1MLFDnUJZ6W9U+1rRNpvMZm9smI3mqSCbxZb5kjC+ETVAqt0Z+Fyp2dA/yVniQE7JMnsTGtM8PJ0rRYc1o4dJqabNZHi3R6qfqntWy8C8rCpwbOFx7FAZZ7Zlzqd7TjdIN38quvGt0nM+duMYj5RpC+yRF02c+ruRi9i3dTqit+Xn+aoof2a/iqH+DxVVVS7Ksj86qTqJIp8Sy5fPCDyhmeTfzGRkxpWgCGBfpjwQKLgnYbfjXYldDh9T20EPl0tKB/bbcndSFVx5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(6512007)(6506007)(83380400001)(41300700001)(66556008)(316002)(6916009)(64756008)(66446008)(66476007)(5660300002)(8936002)(36756003)(2906002)(66946007)(38070700009)(76116006)(91956017)(8676002)(71200400001)(86362001)(478600001)(6486002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzFpeDBoRnh6OVp6UjdlMStCV29Qd3pYa2dReDRXQ3laZFZSZ3FObzRHMTBu?=
 =?utf-8?B?VDR2V1c5b0ZNdXh0N2NQN1AvdldKcHltZlFGYjl0dlppa3dIUmtmaFlGRUlL?=
 =?utf-8?B?cTdTSStYQVAxc0RUdjVmVGxnNFJKQlgwNlZtQXc1R2hzTW1iU2dId2JaTlho?=
 =?utf-8?B?di9iKytVSjJsbkh0eHMwOXJjZStNbkg4bEg0OEJHZTVuQ2hvT2liYi82Ny9l?=
 =?utf-8?B?N1QwdmcxKzZvWUs2NzJWbGVReGV0bHByaVZocExFajkvenpLaUwyMHVTUERR?=
 =?utf-8?B?UXMxZm04M25zT094UDkzQmZZc2lyajdvRGNxUm1DYnoyc2xYNTQybFVYZlJS?=
 =?utf-8?B?SEVOa0VBbnRuYzhGejg5UndFeFBUbHdzYWRBSmhLdHlsRHlxeFNadzFBNStK?=
 =?utf-8?B?N1g3NXYwR2ZYMVJQQkdzSmIwRlYxMDY0Yi94dzlFWTZ0UEVPVFB6cjIzMDJ4?=
 =?utf-8?B?VVlJSmZzNTlCOFZpbFlCVWlHN0VLbDh3MGpEcjBoRFhqOXdwZllqcDl5R0xj?=
 =?utf-8?B?aUZaR1RtZkU0MnlLNS9Od3RYWUVXenhzVmx0ZUhvcmdUV0tXZld6V29GRnRm?=
 =?utf-8?B?TGNRc2Q0RVM4UUs4dUM5MFZES1JEZ2ZsTjBVVG5PaGh4Q0lBeDltS2s1U0o5?=
 =?utf-8?B?ZHN2ZDh6RFNFZ0FPYkdjUm5wdmF6QzYvdm1jZ3RBVENiVkFZalp4a1RRQlM3?=
 =?utf-8?B?U2ZMYjNKdVFoVXlIeFZrYzJsVG11N2RVNzlpcVc1eFpYN05ZYzdVQUE0WDY2?=
 =?utf-8?B?eSswU0FyL1ZBdGhMZkJEUUpKUm1KL3p3c0JSL1hITjRQdUpieExXdXRZVGFG?=
 =?utf-8?B?WHhHdmo4Q2M0MFQ0ZytlNGRJeFY4ZitOT3JNQWJXenIycHZ6eWVVcjJwZUdL?=
 =?utf-8?B?WUEyV2xKdDczQnNKTjNzYUJLeEc0NDU2Q0w1YTFseDBaaW5MZTRWQSsrTDVn?=
 =?utf-8?B?akRud0dDL3pwU2ROcGIwL3J2QTlkNGgrcnh0M0NzaTNod293UTZoR3JGWk1H?=
 =?utf-8?B?a2laSXhDN1cxTFljMEE3TElmRXVnczQ4Ukt0UFBPQ0h0NWJpT3JHd0lKN1px?=
 =?utf-8?B?RSt1aUhxeUIwK20vczZqZHA2cGpmSTBUMFFwOWFXMHBicnpzMDVyK1JjOS9H?=
 =?utf-8?B?VDlrRnVLZTc1VjRBdGJjODlXYXV1TCswTzhoeG9JSWJjRGZreDNpRVA0TDZD?=
 =?utf-8?B?KytGaTVTd1RRN2JwamhuM2VFRXFHWlZnM1Q3bXQ0OXkzeGw2MzRRQ2d4bU92?=
 =?utf-8?B?NW9EQmpNWjZrZ012djE0ZzZkandxR1kvaFRUS3RXRm1rN0Q3RjJIeUtBcGtS?=
 =?utf-8?B?WmNTcVJHNXhnbEZORjgwb0VKTU94QUhodGVEQTJqWjhDTE9RRXduRUdxWXdV?=
 =?utf-8?B?cHRGZGVHeDdFYzdpaGFMbFpneW9WU3cveVpKK1AvR0w4NW1KN2UxODRIVjEr?=
 =?utf-8?B?OVhIdUpSWE1nSnZSZzZXcHZGRHdIUStWRi9NbWZDbEhYNXAvdjFaVUpieVRq?=
 =?utf-8?B?Nnk3ZGFCLzMwMHVjeHlXQWdSWmVrLzhFczZwbklLSjdWNjRnS3V3RCthY0x2?=
 =?utf-8?B?V1JodHV0WlI2ZHhXQWdPekNQS09IWk43ejBkTlp6Q0V3a1hnbW00NEY1Zks3?=
 =?utf-8?B?RXNTU1dwQ3J3M3hqbllBdkRrQU1OV3poY0NROFU1UkdiZ24rYlZMbUsyRmwx?=
 =?utf-8?B?SERmbnE4ZzRzVXRoaWF1ZS82aUNLSFU2NWttUXVZMXdWL3hNRkZYU2tlTmU5?=
 =?utf-8?B?elArMEQ4Y1dyMjZwMXlhR2xOVlgxZXBvbkxkaUtUQWVjajZWMTdudzZSY2RL?=
 =?utf-8?B?S1NsY1hSZCtCaGgrS1NyMnovMUNzZ0pBTFA2SUp3c2Z0RDk0RlJYRDVqUEx0?=
 =?utf-8?B?a3VVd1Jya0hqY1k0VzlnMHJlZ2NqYXRyRm0rVEpoN2FVNmdLbjdtRjRYajIr?=
 =?utf-8?B?TlV1TE9kTWs2MUY0cys3ejRFME1qcHpYZ2lUMWRWV2tXdSs1b0hkVzZoZ054?=
 =?utf-8?B?UHRpYTVCMmFoTU1CelRCN1NacmxtOWxMMkU5Q3pWWktVS0VIVmhyY0kzQTRr?=
 =?utf-8?B?QlhKRzZCZGxnSGJuUkUwaGl5NkJtZDl5MlRONGl4b1M1RkQyRGJDQXlFaElT?=
 =?utf-8?B?MkNTSjYvZjdsSXlqc1AxeVdjSHJ1YSs1MDRKeSt1WjVyTFJlRDl1OTQwTzRJ?=
 =?utf-8?Q?vwPhKmYoO8RzMNoAq1+SmrYFON9RmMvcIGn0qHmDvfSW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D83AE27E55AC941BC1AE70E94726C8B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eb226f-4695-48f3-0853-08dc1e5f46da
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 11:09:33.8688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4iDrex+GlpO6gfjFMvu3HOHkujn0uPSncM1BuwjhXUIFB09HxweYQeFCRdkdBKytJQDi4a4e//BhhdA2IJiug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 11:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194351

SW4gcG9reS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2NvbnRleHQucHkgdGhlcmUgaXM6DQogICAg
ICAgIGlmICJidWlsZGhpc3RvcnkuYmJjbGFzcyIgaW4gc2VsZi50Yy50ZFsiQkJJTkNMVURFRCJd
Og0KICAgICAgICAgICAgc2VsZi50Yy5sb2dnZXIuZXJyb3IoIllvdSBoYXZlIGJ1aWxkaGlzdG9y
eSBlbmFibGVkIGFscmVhZHkgYW5kIHRoaXMgaXNuJ3QgcmVjb21tZW5kZWQgZm9yIHNlbGZ0ZXN0
LCBwbGVhc2UgZGlzYWJsZSBpdCBmaXJzdC4iKQ0KICAgICAgICAgICAgcmFpc2UgT0VRQVByZVJ1
bg0KDQogICAgICAgIGlmICJybV93b3JrLmJiY2xhc3MiIGluIHNlbGYudGMudGRbIkJCSU5DTFVE
RUQiXToNCiAgICAgICAgICAgIHNlbGYudGMubG9nZ2VyLmVycm9yKCJZb3UgaGF2ZSBybV93b3Jr
IGVuYWJsZWQgd2hpY2ggaXNuJ3QgcmVjb21tZW5kZWQgd2hpbGUgcnVubmluZyBvZS1zZWxmdGVz
dC4gUGxlYXNlIGRpc2FibGUgaXQgYmVmb3JlIGNvbnRpbnVpbmcuIikNCiAgICAgICAgICAgIHJh
aXNlIE9FUUFQcmVSdW4NCg0KICAgICAgICBpZiAiUFJTRVJWX0hPU1QiIGluIHNlbGYudGMudGQ6
DQogICAgICAgICAgICBzZWxmLnRjLmxvZ2dlci5lcnJvcigiUGxlYXNlIHVuc2V0IFBSU0VSVl9I
T1NUIGluIG9yZGVyIHRvIHJ1biBvZS1zZWxmdGVzdCIpDQogICAgICAgICAgICByYWlzZSBPRVFB
UHJlUnVuDQoNCiAgICAgICAgaWYgIlNBTklUWV9URVNURURfRElTVFJPUyIgaW4gc2VsZi50Yy50
ZDoNCiAgICAgICAgICAgIHNlbGYudGMubG9nZ2VyLmVycm9yKCJQbGVhc2UgdW5zZXQgU0FOSVRZ
X1RFU1RFRF9ESVNUUk9TIGluIG9yZGVyIHRvIHJ1biBvZS1zZWxmdGVzdCIpDQogICAgICAgICAg
ICByYWlzZSBPRVFBUHJlUnVuDQoNCkkgc2VlIG5vdCB3YXkgdG8gZGlzYWJsZS91bnNldCBhbnkg
b2YgdGhlc2UgdmFycyBzaG9ydCBvZiBtb2RpZnkgdGhlIHNyYyBmb3IgdGhlIG9yaWdpbmFsIG1h
Y2hpbmUsIG1ha2UgdGhlIHNyYw0KdHJlZSAiZGlydHkiIGJlZm9yZSBydW5uaW5nIHRoZSB0ZXN0
Lg0KDQpJbiBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3JlcHJvZHVjaWJsZS5weSB0aGVy
ZSBpczoNCiAgICAgY29uZmlnID0gdGV4dHdyYXAuZGVkZW50KCcnJ1wNCiAgICAgICAgICAgIFBB
Q0tBR0VfQ0xBU1NFUyA9ICJ7cGFja2FnZV9jbGFzc2VzfSINCiAgICAgICAgICAgIElOSElCSVRf
UEFDS0FHRV9TVFJJUCA9ICIxIg0KICAgICAgICAgICAgVE1QRElSID0gInt0bXBkaXJ9Ig0KICAg
ICAgICAgICAgTElDRU5TRV9GTEFHU19BQ0NFUFRFRCA9ICJjb21tZXJjaWFsIg0KICAgICAgICAg
ICAgRElTVFJPX0ZFQVRVUkVTOmFwcGVuZCA9ICcgc3lzdGVtZCBwYW0nDQogICAgICAgICAgICBV
U0VSQURERVhURU5TSU9OID0gInVzZXJhZGQtc3RhdGljaWRzIg0KICAgICAgICAgICAgVVNFUkFE
RF9FUlJPUl9EWU5BTUlDID0gInNraXAiDQogICAgICAgICAgICBVU0VSQUREX1VJRF9UQUJMRVMg
Kz0gImZpbGVzL3N0YXRpYy1wYXNzd2QiDQogICAgICAgICAgICBVU0VSQUREX0dJRF9UQUJMRVMg
Kz0gImZpbGVzL3N0YXRpYy1ncm91cCINCg0KVGhlc2UgYXJlIGhhcmRjb2RlZCBzZXR0aW5ncyB0
b28gb2Ygd2hpY2ggc29tZSBjb3VsZCBuZWVkIG5lZWQgdGV3YWtpbmcsIERJU1RST19GRUFUVVJF
UyBmb3Igc3VyZS4NCg0KU28gcmVwcm9kdWNpYmxlIGJ1aWxkcyBkb2VzIG5vdCBzZWVtIHVzYWJs
ZSBvdXRzaWRlIHBva3kgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlID8NCg0KIEpvY2tl
DQo=

