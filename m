Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A574D4415D
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 13:25:00 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.85])
 by mx.groups.io with SMTP id smtpd.web10.20721.1732022698264963672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 05:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=HhZ01EVi;
 spf=pass (domain: kpit.com, ip: 40.107.57.85, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl8brHZ3CvzBUuoYFmWw+iSDMG6VbuL5TyaVD1lgL3N0Qhiut4bLtZriktSxJCLyM9tz+Kb6WfrzWtjKzA0+jG76YIH6P0oka/i6n/ca/U6g/RO2SH++CKgPsbFWkjoRQhxRxoKL2emM3/fmi8u7ddFXwMwafZTd5nRSOphbLfnIhToGVZs6GerJwPI7igjzIwGAp9+Dbr2KZQgENyrTdVfgHEBxFwXBIh6OWdNKD/6OmykjdO+NFggTzV1SbwHSyuQdysNh7rYd4faWiQNCguQGl6SdYNAzjAIDi5mo4yA16LneX9huPu2JSd8NTzmprAHUiKPiGObzNWnp6Cv7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLa10E5fzPVGxYpwSm9Jw8N7OB6Z3l7Roo3pzR+fGmo=;
 b=ygLNBMaDhtQM8hBVc45E9r92n1KJc+A7Y5/Wj1g43I/s3z1wew4iF1V2CGB6549VqdX/R55w7/xJu3G/WKYbvlwwwgqzUu/jd02ZwARbZvI2eDEVF+b3JWTdT7EhbDX51E4vbX8ruIpUSBrD12G3PIhLjs1gm+8IfTQsBdt15QzvZAnIxCvQAKKid2kmiC37DiDuNivb3QnxXfucTMK0exvy9ngLvddwvNAn4lvMcUZCN7fragm2mzKD0s1ChYjp3ons8JScVm6CVoRo1Js5IPSN7uukak08hFZDRIWmp/QthWxmPFc6Pyh3Fi0VggWNU/YZVfTKRh6xcVaAqSKGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLa10E5fzPVGxYpwSm9Jw8N7OB6Z3l7Roo3pzR+fGmo=;
 b=HhZ01EViCJ8bMLxpISixp4P0JpvTMttrfWF7l5SwcENbiO9Q1mBzpBD6iNOorBSMjhXKF85tw848cSt4Dw6fEwtFXgPwca1Tgvg0tQruEPMKJQyZlALQM19csySh/lQe349Qw22nqYtIUNhHaBWgaaYajTu20Zjg0ipDbf5AqPE=
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c4::9)
 by MA0PR01MB5810.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 13:24:52 +0000
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52]) by MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 13:24:52 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Topic: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Index: AQHbJFpbHy++pk2/YUSzB73vGbvKOLKSbr6AgCw8pKKAAAMkAIAAESqv
Date: Tue, 19 Nov 2024 13:24:51 +0000
Message-ID: 
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9355:EE_|MA0PR01MB5810:EE_
x-ms-office365-filtering-correlation-id: bcad90be-421d-4832-12ee-08dd089d8cb2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?pIQfRbA/1um7OGJ0fjv1Yk+W+3z/4LduZVHfhwzwQbj2QDbs7TVw0p05NG?=
 =?iso-8859-1?Q?whb8zfD2itSpbm1aKEhWe/mXSx0FG+41mNmc8xMedVX5VT9urBcPdAD3v4?=
 =?iso-8859-1?Q?jwiZ/WH1kKPWXcGo/NQ8fDN78obdY/fbRKsPK2QJ9DRQ3Lgtg0UzBawpfw?=
 =?iso-8859-1?Q?/Hcsvl4W4iDI67z7XPJPlbawZ18znB/k0pvM5JXJCYro/HGIQo+9k4X22a?=
 =?iso-8859-1?Q?JgQSr8/NnSyENuLenM/ivCRrt1/RaIDZZZEtNh7eloMTDLs3wW9WE0R5F1?=
 =?iso-8859-1?Q?Nci+PqOIm9eX4R1gFZI/usQjf0KJg3/9Glcc8PQovpPHLll6DfGDh1crYB?=
 =?iso-8859-1?Q?L4nN+pyzN0B7kmCxBju93g0NMf2Geat7w3WKPABPn+f23nfCTNuXQXIIdG?=
 =?iso-8859-1?Q?ldIJciWyjN6X0q7LMKbTv48lrnhYHWfXk4RhcrR61yHoZD1Ih9jtgv6QLs?=
 =?iso-8859-1?Q?9qmnR5J3K/XFX6pBRj1HZL1H6cy0LDdJaXC9RWrfLHU3aOQRK2bgQgsZLw?=
 =?iso-8859-1?Q?CMZBTPbRe4IhXYSplFdmkOckh8xyGy40fvpRAjl0S7E8Iw2SrbTdsbAcmL?=
 =?iso-8859-1?Q?ksq8DYJTajbcJcFeuHepG6RV70hPvh9QFRPBABrsjXLZ60Lu+3n0ztZ5zD?=
 =?iso-8859-1?Q?JGOFQpuuh58ljUqYTwRni3Ih2GhG5V692DPHcwsY6dCYWh1dJ0i9/bEVYw?=
 =?iso-8859-1?Q?92oxH5OlDRLoYA4SQ/MuI8NLbok0bKN+WHO1KVN1eGAlZmtl4cpfjEufAi?=
 =?iso-8859-1?Q?I/8KDg7NXx1jdXbaP2Sft8daxXNRKBu1H3TrH379pwgA86E2X2quUCngzl?=
 =?iso-8859-1?Q?c9stj0OFzuBkB9T6i+G36eYPeS4i6F24PHzlzXFRSLoiZlNwFASqQfOj50?=
 =?iso-8859-1?Q?daq4/027F8rTW8AR275hwGxT8fv4OlNTep+w0pZUG3PfYgcg/W/5xwYCG0?=
 =?iso-8859-1?Q?srKZa60QkDWDT4z/m4vtypl2RdrTLV3YoSY1idKGgaXzOInNYaRTwTczaF?=
 =?iso-8859-1?Q?9ldKkEO5xcbodQBG4gqoTt6/5pFCGHRp4feSkcIsg9sbEVjld5EEl67suS?=
 =?iso-8859-1?Q?zGuxG6RbdAF1wrh1SI3AqJa7xv93iWZpnI8D45P6zQmBb2qgfy/ZT2XIjP?=
 =?iso-8859-1?Q?Z24gihYVo/x1b+a4RApL8W7A+1vtkLqwoHn5CDgxyY9viD0Dr8EV6VCjJg?=
 =?iso-8859-1?Q?KHB7RU+0fFDhOkdGupHDd0G2CTss68e0R7E04q+E7gDBOi8WeYCNz/P0qW?=
 =?iso-8859-1?Q?miSAJnOTMHPDd95IdiPrqkm2VW4+0vmh4zB4gopQ3EFGEXh1fDJ0M9Fqdw?=
 =?iso-8859-1?Q?+cCul2RbA00/1B92Hp7yx6g28EPEUB6TTbopTOQltHCM8u8jn0Bg2D2heU?=
 =?iso-8859-1?Q?BAI584fNJf?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2fF6gFvKhVvYX4bOgVv/CXqRsMbpW7bu4oXPCRRpc4ur2jw13Fb8VHBqy0?=
 =?iso-8859-1?Q?WmfpLAC+K9UvahdhVXr50CWwkGbC2SF/VzGG3wg+5UwZcTkuXP9OOeqWq6?=
 =?iso-8859-1?Q?bPN0I7dEvAEuTsJERGVgQ7SVb+whIG8l1aWTNZhl2qWX6NUtk5lh+M5nxD?=
 =?iso-8859-1?Q?HUrQoLXMjO8m9D+fbdW4kr8+Cg0Qer0cZ4Q7j7otG3FwuQQvWatFGjdd2p?=
 =?iso-8859-1?Q?ohEN/yWOquSuUNwcv/W5gejhkE62WljY793fWaIcFh95xWtOoWDw5FtA7I?=
 =?iso-8859-1?Q?5ilcZkarNfsWsEPOa2CgoUITEPUslfKc/67Pzuhg+opq7xU8XpPV7/KYnX?=
 =?iso-8859-1?Q?itYlMZxkyJnOF3gSrGphW4PqEs/wGSrMTxRQqWQOFhLOn7zgpUR7gtusk/?=
 =?iso-8859-1?Q?VfLt3AwrDaZIf66eUwOprWNCjRbKtb/WSIqYIRmIf53/bI1tatreXiJKdf?=
 =?iso-8859-1?Q?4xETaKp9FLUVWCtuBsqfxasgrUdZNl5Yyhk254FFuy9RYUQ4XIvJa2ZMRM?=
 =?iso-8859-1?Q?+KlfgFjuku9nMJoiUXfh8qdZTOllZqHl6T4961ivRo8/MCiMXvlY193o+v?=
 =?iso-8859-1?Q?3TKwOENSpKU57etkBRFE1TyyhM7tivHKjqgMD18Jxx47bOlAaD9eKC0Ovh?=
 =?iso-8859-1?Q?dYZ/WttlXGglh/gFYQ56SHwLQqezxTdtP64/fuYOoZ54AP4ULgRDs07pwa?=
 =?iso-8859-1?Q?0YqIU72fncP2Rthdr/M1Mtz5W+v3KupMXHxRk7VGa0Q9z+zps3KwxDexnu?=
 =?iso-8859-1?Q?OAnDc6LVaR8EIPu81EAGvXqkAJztJ+Stq6Oj19RfyBYVoqP+2DgHtgIyiX?=
 =?iso-8859-1?Q?/aStvX8AVNsy0kztVU9w7nwnNcSbmf/QKYcsK1A6vjqBUh3fcRM3Sab6vK?=
 =?iso-8859-1?Q?gf9JjN0qDyvqFpdjbmDDAa9QogMSmY2E1WXFppTz4z/4OIYtJLiFY6B2uA?=
 =?iso-8859-1?Q?5KmjH8RYOm0Bkge5dy+CCnWuTRwEboa1Tt46stREZ0+Xaosk3jjaOaR546?=
 =?iso-8859-1?Q?MzUMZFbMt1P4EODsvmh5FQBvydosJyp9cE8acrnCDyyOlSpHmbeZAE4UaU?=
 =?iso-8859-1?Q?BE5hpjoH1xxPx04TmkXi3TGTcqfAXyR5DVnaUrfTqp8o9aGuv9OTEQZwUs?=
 =?iso-8859-1?Q?MYwQXOb7MSXBYT650YtJroQ+6bLH8PpANncGeIz6Z78jHRZBEf2rakXpBU?=
 =?iso-8859-1?Q?3y2GZsVaTz0MoOcJCtaBczdFBB6/i3B7594cBcYxIlUDmw8vjAHF4IyfxX?=
 =?iso-8859-1?Q?4d/Ru+uPWORXyTv/KXzWqzq8JToE7fThP8o/Tp5ab1bSNMzlVm4GMkwRVb?=
 =?iso-8859-1?Q?/ZAr4n8CYzchrOb/esenPm9sl3NV/tTKxyMKEJjc0Wt1rvaExd9Rm6BHke?=
 =?iso-8859-1?Q?IXiO+ZKeTppFLyYCg+M7FDSGnUQvTLDHq6tqidWKya0H08V1n6gr9iRcCJ?=
 =?iso-8859-1?Q?BHZPvQtl+tD1pSTiAcVCZpXk2D26igSDnT3PKvNe591v3Ma3XB8UztYm3F?=
 =?iso-8859-1?Q?F6FObHrZHpG9HdJnZoYU5Ys78f3aRiXJm9uUcXRDIL1O4Bb4fcAWncYS70?=
 =?iso-8859-1?Q?zWROKg2CsMeLRNKJwZqwD01R1xomUXYczNWKVNDAB7rsLikB8hEmb+ZDAu?=
 =?iso-8859-1?Q?Xcgb5r4ElMYbk=3D?=
Content-Type: multipart/related;
	boundary="_004_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bcad90be-421d-4832-12ee-08dd089d8cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 13:24:51.9556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vSb5TgOWO15dVISP81e/yzvTxFjj85LVC/nU7/wG9Wk1iiEl6IHgp7sLzt94r3zfTG2fmWdBbtWZliwbh4kXBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 13:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207390

--_004_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_"

--_000_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

in yocto , Libyaml are sourced from https://pyyaml.org/download/libyaml/yam=
l-0.2.5.tar.gz

when I tried to run the test using above source . It only execute two test =
binary.

yaml-0.2.5/tests$ make check-TESTS
make[1]: Entering directory 'yaml-0.2.5/tests'
PASS: test-version
PASS: test-reader
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for yaml 0.2.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# TOTAL: 2
# PASS:  2
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
make[1]: Leaving directory  yaml-0.2.5/tests'

So added few more test binary and an example yaml file as test input. So be=
low are the test binary .
 run-emitter
 run-dumper
 run-parser
 run-scanner
 run-loader



[cid:6e137582-c02d-4e71-a295-5ee18e5b2928]<https://outlook.office.com/bookw=
ithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmEmai=
lSignature>         Book time to meet with me<https://outlook.office.com/bo=
okwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmE=
mailSignature>

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, November 19, 2024 5:37 PM
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: thakur.virendra1810@gmail.com <thakur.virendra1810@gmail.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>=
; wangmy@fujitsu.com <wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Tue, 19 Nov 2024 at 13:02, Virendra Thakur via lists.openembedded.org<ht=
tp://lists.openembedded.org/> <virendra.thakur=3Dkpit.com@lists.openembedde=
d.org<mailto:kpit.com@lists.openembedded.org>> wrote:


Below test does not require any argument to be pass. Its is a simple binary
> +       test-version and test-reader


 run-emitter|run-dumper|run-parser|run-scanner|run-loader
Other test require an argument and yaml file which it needs to perform task=
. Like parsing or emmiting or to perform run-loader test

This does not quite answer this part of my question:

How does the test suite work upstream and why can't we
simply use that?

I still don't understand why a custom yaml needs to be created.

Alex
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
in yocto , Libyaml are sourced from <a href=3D"https://pyyaml.org/download/=
libyaml/yaml-0.2.5.tar.gz" id=3D"OWAcac45923-aff1-dad8-cbcf-a0a89326bffa" c=
lass=3D"OWAAutoLink">
https://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
when I tried to run the test using above source . It only execute two test =
binary.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
yaml-0.2.5/tests$ make check-TESTS</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make[1]: Entering directory 'yaml-0.2.5/tests'</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
PASS: test-version</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
PASS: test-reader</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Testsuite summary for yaml 0.2.5</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# TOTAL: 2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# PASS: &nbsp;2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# SKIP: &nbsp;0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# XFAIL: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# FAIL: &nbsp;0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# XPASS: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
# ERROR: 0</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
make[1]: Leaving directory&nbsp; yaml-0.2.5/tests'</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
So added few more test binary and an example yaml file as test input. So be=
low are the test binary .</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
&nbsp;run-emitter</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
&nbsp;run-dumper</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
&nbsp;run-parser</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
&nbsp;run-scanner</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
&nbsp;run-loader</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td><a href=3D"https://outlook.office.com/bookwithme/user/fcab7d9903984b91a=
5841c51f49bd5ec@kpit.com?anonymous&amp;ep=3DbwmEmailSignature" id=3D"OWAbf4=
1dd3c-3ff2-e6f7-3575-e52fa478274c" class=3D"OWAAutoLink"><img data-outlook-=
trace=3D"F:1|T:1" src=3D"cid:6e137582-c02d-4e71-a295-5ee18e5b2928"></a></td=
>
<td></td>
<td><span style=3D"color: rgb(0, 120, 212);"><a href=3D"https://outlook.off=
ice.com/bookwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous=
&amp;ep=3DbwmEmailSignature" id=3D"OWAacce5b00-1ded-bc63-1d20-53446d357c17"=
 class=3D"OWAAutoLink" style=3D"color: rgb(0, 120, 212); text-decoration: n=
one;">Book
 time to meet with me</a></span></td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Alexan=
der Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, November 19, 2024 5:37 PM<br>
<b>To:</b>&nbsp;Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Cc:</b>&nbsp;thakur.virendra1810@gmail.com &lt;thakur.virendra1810@gmail=
.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@li=
sts.openembedded.org&gt;; wangmy@fujitsu.com &lt;wangmy@fujitsu.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [master][PATCH] libyaml: Add libyaml pte=
st</span>
<div>&nbsp;</div>
</div>
<div style=3D"background-color: rgb(247, 244, 169); font-size: 12pt; color:=
 rgb(255, 0, 0);">
<span style=3D"font-family: &quot;Work Sans&quot;, &quot;times new roman&qu=
ot;, garamond, serif;"><b>Caution:
</b></span><span style=3D"font-family: &quot;Work Sans&quot;, serif;">This =
email originated from outside of the KPIT. Do not click links or open attac=
hments unless you recognize the sender and know the content is safe.</span>=
</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">On Tue, 19 Nov 2024 at 13:02, Virendra Thaku=
r via <a href=3D"http://lists.openembedded.org/" id=3D"OWA591e4e16-a9ca-e54=
e-9897-809021747cdc" class=3D"OWAAutoLink" shash=3D"IFmwTSAe0nFZxtfpMDd5mg8=
vz3lc/errUxb5GOYR7H2Ih7ZxcJzVhJkyny0LeZ2SlINfJXxpUmD66rKQFQpXo/mKCGEJjfckp6=
XurYvPciOeTL144dCESpewFl/5DXNskcdBcjn6mKpOU8rh3zEd1OUSdW2NXDEZWv9EED3UIDk=
=3D" originalsrc=3D"http://lists.openembedded.org/" data-auth=3D"Verified">
lists.openembedded.org</a>&nbsp;&lt;virendra.thakur=3D<a href=3D"mailto:kpi=
t.com@lists.openembedded.org" id=3D"OWA5f36b94e-903f-13a6-9cf6-287f041a4da9=
" class=3D"OWAAutoLink">kpit.com@lists.openembedded.org</a>&gt; wrote:</div=
>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div id=3D"x_m_8462282516339188922Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Below test does not require any argument to be pass. Its is a simple binary=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test-version and test-reader&nbs=
p;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;run-emitter|run-dumper|run-parser|run-scanner|run-loader</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Other test require an argument and yaml file which it needs to perform task=
. Like parsing or emmiting or to perform run-loader test</div>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">This does not quite answer this part of my q=
uestion:</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">How does the test suite work upstream and wh=
y can't we<br>
simply use that?</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">I still don't understand why a custom yaml n=
eeds to be created.</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">Alex</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_--

--_004_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_
Content-Type: image/png; name="Outlook-bnscsucd.png"
Content-Description: Outlook-bnscsucd.png
Content-Disposition: inline; filename="Outlook-bnscsucd.png"; size=528;
	creation-date="Tue, 19 Nov 2024 13:24:51 GMT";
	modification-date="Tue, 19 Nov 2024 13:24:51 GMT"
Content-ID: <6e137582-c02d-4e71-a295-5ee18e5b2928>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_MA0PR01MB935507E141ADD1CD9E3A28839D202MA0PR01MB9355INDP_--

