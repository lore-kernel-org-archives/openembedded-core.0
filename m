Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E131C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:39:35 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.6527.1675813167179425569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 15:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=ZNUkKn3z;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1675813168; x=1707349168;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zh+k8BJSH/uIxoagI5cB+PVPZQwE+U+Y7jGK/tOMS4U=;
  b=ZNUkKn3z7eQ9i1BgagxwtDJiAbM2GuXUm7rD4f+sBi8q1CU5OrNUCCut
   ABBWnlEF+z1S2UI5bI5Y5YiPKx9A/EQsB30lBOyyWOlIZolT82IcIdYLg
   uAgxCmyNB+sWjnINgvNKm1/sl1j/wnfiDZKRoDbhAh8XkwViLJNyCX9l3
   K0GtuKWZzPzTjV2G1DNExz7yOD4n393xagYy3YoJ1uXMJMSyTLAXqduSp
   2RAeXA8hbgLfSUy4ZB0FU2311EK7v0fqdIxpOt9TUgn+sGp2Iu2HUdfQ6
   hC045VrBa3Bw+zm2xVDh2RppQotiGOQf4VzPwSvwC9LLyZ7vKdGvcWakU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="76137715"
X-IronPort-AV: E=Sophos;i="5.97,279,1669042800"; 
   d="scan'208";a="76137715"
Received: from mail-tyzapc01lp2044.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) ([104.47.110.44])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 08:39:24 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB2jrw+hFdOVMpnVzMDtbcQ5UVfLOxktKyJroF9KPLugAcnhnj4K1xCq5zaJ5lAz0fMQ6z26OFzeSpdIXCxC3Uz8SE8TjofZYZ21/bdH9EOU9vVlX027NgPTxi0evHjHA4HJLug+oIXdwsAtrBSECs1no7Tkx+uC1FgRy3dRmzn5tc4m2VQk6DJ4GMlTk7mIyhgUs4CaMSux8SR0qEekQ3yDf42qw1wa+zsSZKkFyLYhDN/Qvkiwx7IF2uEen3zlvM9+hcZc+/M7Ph5GKLF0hoCivvDqlgFkMXgvUswgUr7GOvgCeVsirDWe3cMdssaTCyRigytYnDGgjy7AvjDwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh+k8BJSH/uIxoagI5cB+PVPZQwE+U+Y7jGK/tOMS4U=;
 b=bhlIweaUVnIVwvrEDOB1V0QY9S3qoiUm11/YeylM1GruZ/O2QCJ18A3IHQbuEQ6RqQTysKZZJjuEpdoNSMrKgw+IBbeUEHeIUrC602tvbZaqMlmWzoonxshjNazed43K2ZK+7fgV+dgVdWca+bODP1ufA25aHcBFdYma1dl5vWXMiaH6azfe/zWYaJz9YI/J7ChYuLIQtfKqNIOoUvV8j1V70C/Zx3s4SKY/UrV+IniyHtc+dhMXdEEi0YtcNwKSFOVUW493qKTjJGZhSvMZnRL0RUKxFPgevyt46xGrZAs68GCWPYWHC7yGu7FPBkGAg+TVh+vQnDMfLVte41ucoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com (2603:1096:404:d8::17)
 by OS3PR01MB6023.jpnprd01.prod.outlook.com (2603:1096:604:d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Tue, 7 Feb
 2023 23:39:20 +0000
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::e15c:dc7d:80d4:9ea0]) by TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::e15c:dc7d:80d4:9ea0%5]) with mapi id 15.20.6086.017; Tue, 7 Feb 2023
 23:39:20 +0000
From: "yanxk.fnst@fujitsu.com" <yanxk.fnst@fujitsu.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Luca Ceresoli via
 lists.openembedded.org <luca.ceresoli=bootlin.com@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdIFttZXRhLW9lXVtQQVRDSCBWMV0gY3BpbzogYWRk?=
 =?gb2312?Q?_ptest?=
Thread-Topic: [OE-core] [meta-oe][PATCH V1] cpio: add ptest
Thread-Index: AQHZOr5BTyUd41HcM0SmRju38JVLB67DwgmdgABjDIA=
Date: Tue, 7 Feb 2023 23:39:20 +0000
Message-ID: 
 <TY2PR01MB4155983B94E7C79FE662E64993DB9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
References: <1667352933-9298-1-git-send-email-yanxk.fnst@fujitsu.com>
	<17419AD8D8969177.20960@lists.openembedded.org>
 <20230207184350.2a116b4e@booty>
In-Reply-To: <20230207184350.2a116b4e@booty>
Accept-Language: ja-JP, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?gb2312?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?gb2312?B?NTBfQWN0aW9uSWQ9ZGYxNjU2OTktZWFlZS00M2QzLTgxZDAtNDZkNTI2YzNh?=
 =?gb2312?B?ZjU0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?gb2312?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?gb2312?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?gb2312?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?gb2312?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?gb2312?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRKlWPz87TVNJ?=
 =?gb2312?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBf?=
 =?gb2312?B?U2V0RGF0ZT0yMDIzLTAyLTA3VDIzOjM4OjMwWjtNU0lQX0xhYmVsX2E3Mjk1?=
 =?gb2312?B?Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEy?=
 =?gb2312?Q?1d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB4155:EE_|OS3PR01MB6023:EE_
x-ms-office365-filtering-correlation-id: 5462a592-618a-4ad0-85a4-08db0964894a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hqyhCCCQK0iQTv9JyK0iz2EWExYByQinWjRR6BCDVobXR1UE25h1D3XrJRTFRoAhyIjHaKUZZR6k1JD9GHqMzBvZCXQw/wLpyB/OXjg8Ave+euTbdps7BJZcyMySmCY6fvYRn/zb7/bRAI3f3E3pSzrU+m1ESLAACwa338ih0ZQaI7kdv1zFeEi3xBcXGi+rso+otRmJGKHxChDQdEXjvsXtEYucbTI8MgBuNAklApw1MIT64aqo97NPfDOwuz9zxzcrMIoR8YkicOBsIwkUcnVl+/Qq6w3ofd5Dv18c8eiepyOp6fJow5LpQBao6+Tcz93DCsz59SssoEKfoV36lTsQLRtCuYNzUuq4NpQ/N8fuHcOjIIVETdhEDvok4t7pzGHivPZc/LUNRNpxHcXMptSUMlw6/5Z8WYiS8VrUfPW4Rpdn0qpz9pdMWgtOTZcoJw6Yc+H6S4Xa8F/lpao+hm+Z34vgdvQO56U2tmHdqShjUS/a6TKhz4jVJ7SJSRkqlGponE0tIAIejEMSnWPg6yfou8MujT4jeO9PugQmA92svzJJFVha05vLvrwL/+wYaTnQRawjnhuaJ2IiiRC8qxdVY3aTN37XpXnUmYLYR2hbOA+iviTJrw1LZHeoEi4TohD4WYWNR4JSPeWvl2dd70u2mzeS8bTy2IUrbQVng32RDDpYJxt6waOaQAqoubEN3D59QyMENGaCo9jj+QiZvkCaLinkwOoaEEIptA99RjEgqdm0vawCR1iI5S8gy8O2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB4155.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(1590799015)(451199018)(85182001)(86362001)(33656002)(110136005)(54906003)(71200400001)(224303003)(7696005)(55016003)(1580799012)(76116006)(5660300002)(66556008)(66476007)(66446008)(64756008)(8936002)(66946007)(41300700001)(4326008)(9686003)(186003)(26005)(107886003)(478600001)(6506007)(966005)(38100700002)(82960400001)(2906002)(38070700005)(122000001)(83380400001)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?SUVPQS8ybXA4RXQ1NHN4bzk2eUUvUGlNY2QzYmxqSTZ6QVk1Z1ZoQ0dHTjdT?=
 =?gb2312?B?TTEreUtRSHNvK3BkeXV3SkdyeFpTYTY2SmRLN2ptYlpsTm5sKy9pTERMa3da?=
 =?gb2312?B?M2IydUdYaU8rVFpDaU5ORnpxK3pxZXZwN2R1L2FXa0xLeFZCTWdiNjhGcFNG?=
 =?gb2312?B?QUdQZ1NjQkVhWWRRQWF4R1FPb1ZiQkxxaGNReU5EZUhBV2x6ejVWYml4ZmdM?=
 =?gb2312?B?akVjdHFqVkRORHlEUklkMVhpT1lFYU9PNy9tTGpxYlp0bEp5ZllGbjh0V25G?=
 =?gb2312?B?ZFo1eTd5Q0RDaWg3ZXhhOWR4LzVzSVYxNys4NFhla0FaRER4VEVqSHBJZkVj?=
 =?gb2312?B?bVA4Lzk1T0FHQ2dMYmVVVlFUZU5RdWQzWU9tTUx2TkVqMXNGRFUwV2doejN4?=
 =?gb2312?B?aHBENUhoSkdjWUtDR1ZJdDkwVzhwdEVZSi8wcXBDakdmZHpYV3Uyc1M1UE9p?=
 =?gb2312?B?TStlemdPOExTdHNYckRlQ2FPRHVrRVRVUHlLQ0ZROG1IRngxUFNmZVVoei9u?=
 =?gb2312?B?UFJHZ3dVK1A3T25uYjdYY3NmT3BWNi9NLzJkY3RZR2drTUZqWkdkRWNIZFQv?=
 =?gb2312?B?MDlBOFU0akdWbTBuOEFOK3NHejh6N052RTJDYUgwUWxXcVdpTFZJd3ZjckNl?=
 =?gb2312?B?TzBmZHBDbGFrT1c5Sm11U3hGcnBzVU5IeHJwdUc3VHpOeXVmS2toSzZ6bjlW?=
 =?gb2312?B?Z0dsRXdtSjQwblk0NVBtM3JDbHA5b1MrLzg2Tnpjc05TNEJvN0k1djhvQ21t?=
 =?gb2312?B?TGVFdFFnT01PbmZIS2ptYlNyNFN6bmNKWldQR2JMVFEreEYwZmlSbkE3Ykl1?=
 =?gb2312?B?OW1oWFY5V0Q1dUd1VVBQbHlmLzh0SnEwdTBTeVltY1BqenFoTXJac2l0eWxN?=
 =?gb2312?B?OXIvQWkybmdyNHp2QndXRWV5SkFwUmdnaWwvcG1NWEpNOGhvRlNrMTFqb243?=
 =?gb2312?B?REozbkhyODBKMGkzeUNZbkxVZkcxVXNLcGNZenM1RmRkdVhKRE1uOFZzbzJn?=
 =?gb2312?B?RFRjbVJUV3B2eEZ1SGdNUkc4NG55NG9oNGVTRDRaV0tGYWVDd2JMU2IyZlM4?=
 =?gb2312?B?ZmtjQmJrT0lhQ1FYV0Y0K3NCdms3cVpjNVhKNUVPYmhJekFua0dOOU5mWjRs?=
 =?gb2312?B?MGRoV2ZCSzQ4WVllT1cyTXhMVnd3SHFrRTR5L244QjEybHQvOGRtTC9NQW9J?=
 =?gb2312?B?L1llaEdPNzh0b0RxMGlFK2oyYVl0YWFoRWtQTUxVby9DdlhLRlYvQi9MUmlI?=
 =?gb2312?B?VlVSWmVjQzZWYkNMOEswRXI4dmIrSXNyY2FLNEprcEI1dFo5clRjV0gvWVh6?=
 =?gb2312?B?NnFNelRvQ3V0ZVVMUkt2dUZ3Tmpaa3RaUDBOelBMdVJtMjk2QUZtVXA0Q1p4?=
 =?gb2312?B?cS84ak5mWFRvbnpoOG5XVTFZZ1Rza0gwdVhLRlI2cjF0NTk0aWdHWnIrTWJB?=
 =?gb2312?B?eFRacG1hT2s0cHZYclZGK1BnME1FU3pFTjdPVUVMcUNzczVXNGNicWV6TFNM?=
 =?gb2312?B?ZE4rVGI3eklQWXFlZVdQajA1WlUxbU5xaTk2T2FjSHFQeWlJaVVBMVdIMzdq?=
 =?gb2312?B?YmhSUGNHRGVIL3NkaXVsemYrRmMyeFl6bjROSHdVd0pnWXNSTHdrVU9rRzJk?=
 =?gb2312?B?VkphM0VzV2VhUDFQN3NmeUliN0RJU2tZMVVkdjZIM2lRM1JhQm01NnZ0cWRI?=
 =?gb2312?B?ak9GM2VsRWJPL0lIZVExMStZTjNaRFF3ck9IL045U0RjT0Z0eVpqUUFWSmo0?=
 =?gb2312?B?c1VobFhjYlJWVWZDTjI5SnM0UHJvczUrYkdLN1lBWU14dzY0OEVpWXlGRGlU?=
 =?gb2312?B?NWlwRHVlTmZsWjc0dWFBNzVycE9rQnpYb1FrUUwzVEhUT0xjdExNQ3NwODZ1?=
 =?gb2312?B?QmJINjFJZnYwMHJiNmZ2STRWSjUrU0EzSWI2RnJmd1J3U05iQjFROTZkY1Jk?=
 =?gb2312?B?OXNjMGRRMW8zZ3pKNHNBMUF2dXcyeFhFQW8vL2xLbmo0bXJlcHkvdHI3VHYz?=
 =?gb2312?B?ZVpyV284VVBlMTNydFcrSGU1elhIRmtWTU1DY3hneng0NlRQU1RTazk0V291?=
 =?gb2312?B?Uk1PUFlPd1R3ZGx4cXJ5OU5Wa0ZBMzB4T204aDlqY1QxNEM3OEkwMUZHNE53?=
 =?gb2312?Q?rrBouYlAlIAl6mma6SUgXOFqQ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rnTIAoSIux1NvHlaM6lfwCL5JzrYWM3Aw8M85LklrAnp89HAEd0YisowvFqmbM11bapd14UCqnCvdirHs1AIpBor+MHMCagCue8F3SBgxvOFCO0BgedyuLy+BBlsHmZsSxLM4hGfFdGaCsjEdWMxZbaYPfODxkSYHpwSYapxR0MfMDGqiNEbGJFHzAg2EfsjKBMqLdYpEYkBC079tZGa6Vo2ua7vO1elVdRC+Nu1FwQ43Yt5jsvRJy+AbtRhhHaxV4QswLEE/hF5K7gVkaYEw5oMeoci3X+KyrTltLMbNReuUWxTd4oIgnTF3QdRNTEZtyJKBMbjp4QMk0lVHzvouuLvrb5v9the2IjElghAT1lP0u/a8ygXqQLyYph/8JQfS/pQNrrNdS6Vmgl7Ad0JANIK009zFLT4+PR0uSEEHyxMPKkTDWdIpIIR4Le9pd9ymRkL9HBmC+qOh+nRFvfM6Dl+44WtUTx8xOWBQeBiL0DaqXt6dlGz3XzikCIWyMmDGptQya+R0ZvGp97N+RwjSVPIXrYuay2Ikw3zAdz05Vf6nl/+W3nLDuhDu36oNrvEZuWI8THZByP5/GdAdnEE2MKXYBYSihMRdLdQtW/qvzCiNwQPftZPfeySWyvbynoFM7NvHVsaPTQftHeim7xhRgLK758sBZ1OWvVd0tJrbpindarZLI24EQDTdQcNuU3zCTQTnyXJnRxcgWUoBxX7RWCPwWCxesf9Jtxvw2Y/2Gfo9ZSOPz3RnqBCGD1bPFPk+JswYzm+nDGuu1OpAx/eUYBrC5b5BMZN8fLhgZ1kFI7DZtiBqaYd9sH86ZnMNWHp
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4155.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5462a592-618a-4ad0-85a4-08db0964894a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 23:39:20.7486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JloJJyZCpLHKSLVMaaDRaf5fYrgR65CcXuX/Vo68/1w5tyirYf1+zH9/dPe/LwVmdL4mpli9t5Z4DrF0ZU1Iyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176834

VGhhbmtzLA0KDQpJIHdpbGwgdGFrZSBhIGNsb3NlciBsb29rIGludG8gdGhlbS4NCg0KQmVzdCwN
Cllhbg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogTHVjYSBDZXJlc29saSA8bHVjYS5j
ZXJlc29saUBib290bGluLmNvbT4gDQq3osvNyrG85DogMjAyM8TqMtTCOMjVIDE6NDQNCsrVvP7I
yzogTHVjYSBDZXJlc29saSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bHVjYS5jZXJlc29s
aT1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Ks63LzTogbHVjYS5jZXJlc29s
aUBib290bGluLmNvbTsgWWFuLCBYaW5rdWFuL+rMINDCv+0gPHlhbnhrLmZuc3RAZnVqaXRzdS5j
b20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBGTlNUIGZuc3Rt
bC1mdWppdHN1dGVuIDxmbnN0bWwtZnVqaXRzdXRlbkBmdWppdHN1LmNvbT4NCtb3zOI6IFJlOiBb
T0UtY29yZV0gW21ldGEtb2VdW1BBVENIIFYxXSBjcGlvOiBhZGQgcHRlc3QNCg0KSGVsbG8gWWFu
LA0KDQpPbiBUdWUsIDcgRmViIDIwMjMgMTg6MjY6MjcgKzAxMDANCiJMdWNhIENlcmVzb2xpIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIg0KPGx1Y2EuY2VyZXNvbGk9Ym9vdGxpbi5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQoNCj4gSGVsbG8gWWFuLA0KPiANCj4gT24gV2Vk
LCAyIE5vdiAyMDIyIDA5OjM1OjMzICswODAwDQo+ICAgICAgICAgXl5eXl5eXl5eXg0KPiANCj4g
Tm90IHN1cmUgd2hlcmUgdGhpcyBkYXRhIGNvbWVzIGZyb20uLi4gOikNCj4gDQo+ICJZYW4gWGlu
IEt1YW4iIDx5YW54ay5mbnN0QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogWWFu
IDx5YW54ay5mbnN0QGZ1aml0c3UuY29tPg0KPiA+IA0KPiA+IGVuYWJsZSB0aGUgcHRlc3QgZnVu
Y3Rpb24gZm9yIGNwaW8uDQo+ID4gDQo+ID4gY3BpbyB0YWtlcyAxIHNlY29uZCBtYXliZSBsZXNz
LCBzbyBpdCBpcyBmYXN0Lg0KPiA+IA0KPiA+IHlvdSB3aWxsIGdldCBwdGVzdCByZXN1bHQgbGlr
ZSB0aGlzOg0KPiA+IA0KPiA+IFBBU1M6IHN5bWxpbmsNCj4gPiBTS0lQOiBzeW1saW5rLWJhZC1s
ZW5ndGgNCj4gPiAuLi4uLi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW4gPHlhbnhrLmZu
c3RAZnVqaXRzdS5jb20+DQo+IA0KPiBBdXRvYnVpbGRlciB0ZXN0aW5nIHdpdGggdGhpcyBwYXRj
aCBnZW5lcmF0ZWQgbG90cyBvZiB3YXJuaW5nczoNCj4gDQo+ICAgV0FSTklORzogY3Bpby0yLjEz
LXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiBGaWxlDQo+ICAgL3Vzci9saWIvY3Bpby9wdGVz
dC90ZXN0cy9hdGNvbmZpZyBpbiBwYWNrYWdlIGNwaW8tcHRlc3QgY29udGFpbnMgDQo+IHJlZmVy
ZW5jZSB0byBUTVBESVINCj4gDQo+IEhlcmUgYXJlIGEgZmV3IGxvZ3M6DQo+IA0KPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzk2L2J1aWxk
cy80Mzc1DQo+IC9zdGVwcy8xMi9sb2dzL3N0ZGlvIA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzY1L2J1aWxkcy82Njg1DQo+IC9zdGVw
cy8xMi9sb2dzL3N0ZGlvIA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dHlwaG9vbi8jL2J1aWxkZXJzLzEwNC9idWlsZHMvNTUyDQo+IDYvc3RlcHMvMTIvbG9ncy9zdGRp
bw0KPiANCj4gTW9yZSBhdDoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0
Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODMvYnVpbGRzLzQ4OTQNCg0KVGhlcmUgYXJlIGFsc28g
cmVwcm9kdWNpYmlsaXR5IGVycm9yczoNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMTcvYnVpbGRzLzIzNjEvc3RlcHMvMTMvbG9ncy9z
dGRpbw0KDQpTZWUgdGhlIGNvcnJlc3BvbmRpbmcgZGlmZm9zY29wZSByZXN1bHRzOg0KDQpodHRw
Oi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlcHJvLWZhaWwvb2UtcmVwcm9kdWNpYmxlLTIw
MjMwMjA3LXllaV80N3h2L3BhY2thZ2VzL2RpZmYtaHRtbC8NCg0KLS0NCkx1Y2EgQ2VyZXNvbGks
IEJvb3RsaW4NCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCmh0dHBzOi8v
Ym9vdGxpbi5jb20NCg==

