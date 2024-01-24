Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6638AC47DDF
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 12:48:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.21507.1706100502257388595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 04:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xr681fDq;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xr681fDq;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TmvfW9Jn9rYCSALt7OpFauee8X+xnzEkZNa5FBUdZI9EIwk03Au4/3Kvq+D+R9trqflPq+V6Gbgwulct16MquMZVWtBG9uJfndgrUSA3XRayHIBoWMQ0t+Tggvzu2q/X/agu6H3XpCzoj5LpWqjD38pVD+ulcfmmOdFQ21AJLezY6D4tZaoxFGrmHqubQxBb7tH674VO7nV7R9yH7rnThBpJ9W9+ueAO8s7x624JcFE42hh/DZe6hX+KWRXmJWBNbyJXblLfLxPxBnS9iY+Iz3QvSkYN0eOevhPCPs0to2Iq0BqZ7QwOlmuBxc1RJhh4SAaYc9BLhJ6PV4QXeDLubw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3I52TS4nWnvoCSJZ34EMAs4/Ium9oy6D1Lp0sq1Ogc=;
 b=FSctyUM+1aUGZ6Gbg1ZQ3Inq5puylpgjy+ai8t63uKytg0E/UeVADmRNtaPmZzWFQ3DQ/b4gk2ldTEDUT4e7b+W4rF04V6i1WWnkvuLcDik48nyMMZfZbD8AehQhdbNCSPieQMBAFYf4Mor27houwDaMXHcys3I42tD8GoWvS8uJbio2E2koLYyN53xjFqmvTdmv/HrrIR29XAt+MN3UUU3D2atR4YjsCDyhEFK7a9yzZ+cUa3cJnHIlIUZsUkBzk5B29QO30dcTg8i4b8fCBH1bY09WkkzaNzYN0ONMwG5/relilD+WpJkhXQ2z6HQHJ+qtgyvdQdmy48nMynBgJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3I52TS4nWnvoCSJZ34EMAs4/Ium9oy6D1Lp0sq1Ogc=;
 b=xr681fDq4tR/NyYllLmk1OmYWZwGkeM02OqLO5VBqbaA4eKb6Vv1t5bf8OUQxLevit1QY5O79LxW6dlf14vQWVKSFNtSbeVfNrJAUSsHJ945zgEzStlv7NNbH0oXH0xVZL4dAKgLcv6Zp6Y/ZDH9WjsNjFrC0GRPvbzt0p6te6o=
Received: from DU6P191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::9) by
 VE1PR08MB5565.eurprd08.prod.outlook.com (2603:10a6:800:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 12:48:15 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::95) by DU6P191CA0067.outlook.office365.com
 (2603:10a6:10:53e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 12:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 12:48:14 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Wed, 24 Jan 2024 12:48:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f04785d537a3812
X-CR-MTA-TID: 64aa7808
Received: from a8374535e1e0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A564352-6FCD-4DFC-B647-333604282614.1;
	Wed, 24 Jan 2024 12:48:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8374535e1e0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Jan 2024 12:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhGY4cItPA63p7YlbOOvB0dKGLu8YTbSmJkkebT56SVuBBM1cu4i5zLl67vO2ZX0u3lBak/cke445YE9f2HVsB9nl/6vtMmLovqtEucAudGwsHCLLyW189mCbrRJqL4eGIkmp+Rthi7qcgREILVbnge6vuHMBK5wBv5hwj8twNxW7uJpFQqcKJVzSKqtCOgY+VGccqsjZDQe1PngmXpco/Zv2OiMoyvV8/fZ9rZUD0e08LBlBz6Buv0lZp11kAcyMNzUpU3be+sbJ+xmchvbmCiLaB7p93WUjczIwGwQQSdVoydCHxGYud6f5UCO28R+4IP7IBhHP/47cXK2CZQ4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3I52TS4nWnvoCSJZ34EMAs4/Ium9oy6D1Lp0sq1Ogc=;
 b=CDyKO6n/vj0IdE/JVz6jsZgOEZdUW4uc7m8mOw29Qu5I/ts67ltA4nU08zCgH/krMQsdO/dpIrSo1uBId7z0Tg0S0PY3viUzl/TsHsboWCzzsxpGtdaHHdd1+3PcKCE6juIJTTwC7Dj70BOEQvVY4YE2Y4xUbB5QsuauPGsSHYPfz7Pl+je32/nCes2SVIb39BHVthzFp38LB95s60YNiQ5QFcaQQPxaANo55fCIDsytC4Bpdg7s3RFI02S63zpQNOGsVHC8FrLoZn5lXqT4dd0/+F55wOZRmBPNKSZxuqCkqZ2lTFfwxzBFdtVj91sPaDVtND48A+/pKOaeTvM/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3I52TS4nWnvoCSJZ34EMAs4/Ium9oy6D1Lp0sq1Ogc=;
 b=xr681fDq4tR/NyYllLmk1OmYWZwGkeM02OqLO5VBqbaA4eKb6Vv1t5bf8OUQxLevit1QY5O79LxW6dlf14vQWVKSFNtSbeVfNrJAUSsHJ945zgEzStlv7NNbH0oXH0xVZL4dAKgLcv6Zp6Y/ZDH9WjsNjFrC0GRPvbzt0p6te6o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9695.eurprd08.prod.outlook.com (2603:10a6:20b:615::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 12:48:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 12:48:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "festevam@gmail.com" <festevam@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>, Fabio
 Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH] pulseaudio: Update to 17.0
Thread-Topic: [OE-core] [PATCH] pulseaudio: Update to 17.0
Thread-Index: AQHaTgW4T18QM5KHCU+rHeSOUM4k87Do6w0A
Date: Wed, 24 Jan 2024 12:48:05 +0000
Message-ID: <2BCFD2D0-00F8-416B-A490-1DA742DD93C3@arm.com>
References: <20240123140833.1372704-1-festevam@gmail.com>
In-Reply-To: <20240123140833.1372704-1-festevam@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9695:EE_|DB5PEPF00014B8E:EE_|VE1PR08MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: b450129c-4aba-4237-bc4e-08dc1cdabafd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 snhwlJIbaeRDVzico7DVx62wl4RhEAPu48KVmXIxR/wihDgtOIApzHA3+Ay6mlWQQ+fqYHfGaLM4K3yxlqJT8/4X6CVinVP3agcZhcrIwDO+rod5a3ycZDZVm8YGLwTo5PYNrfzx4h3WeQcUcX8fQ2j6Twgk9bNdUkpY7VWJ/58JYs3K3t0l6gJr0wTMn2u3je2IwzF1q+WnL9nkskq6IedQMNQZlzLp8u5DNOrhHDtUzkqlWCKNsOXvEGvdjjvcJ4LkODWfIJY/3jnRnuorbGfPAwEQRNu6h9YzZM96k0BiqOpSLX8boDtmojmqA4/efb/yOJfqgJ/GQtYN4YWGPsOpji25AMCM+Fp/WUNCIaowkPTqr0MuHt+a6A1G3bjJyA3G76oScsj2NYG50MgSikxDbWtlXTUKpUgCy3g0PNTijsCAW3sgz4Gb5/AvkHQ+lFM9N5ZRbhDYpf5naW9AdCPuqV3DCzrYydbze/R7OafVmJwpnGBwEGJZH0kiJ7lH6Lywo3tZP5hGlwTVilnTbQyfl9Ocq8191funrQzNKci7qg9zzolTgefeJiOyW9XHQbJNjP800NNOaqG3JIV7GAzZ/hFQn8UJ6Gx/RiRzeA4G5uU+YT9ESxHJQCWq82CJCIoTFmWQUVltD9XBOsN9cXG1RnmJmpxhyIDyIurzc2FuDDipcI3Z5snns6a1rWGy
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(122000001)(38100700002)(2013699003)(33656002)(36756003)(86362001)(38070700009)(66556008)(316002)(66446008)(6916009)(64756008)(54906003)(66476007)(91956017)(66946007)(76116006)(15650500001)(2906002)(5660300002)(8676002)(4326008)(8936002)(2616005)(26005)(71200400001)(83380400001)(478600001)(6506007)(6512007)(6486002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEE9E52C3F1C5041AF7C0931D33FF9A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9695
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	421cb03b-ef67-471a-43e4-08dc1cdab5e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zdb3mgE8w/diwDIzpNkaJ0iGMp2nE8WwSbKU6Wthuw2gVRV8XRyBV63N0xAhPbZJkEgItwo6v1t94v368OqGXv2y9S5oZtspqJP4rUZcAP3mzlaAl7nm/FDq43p9kNHiNOHyfkMQuREQ1+oWAHY01gvqqAkpvseOQAyA+Y8Z6evmpxVdBFfUVEysjNNygQV1UvGEJymRghU3E8tp2Hneoj9VHwpfzs80vEBMLAhmeHASPpKYfktJA4rCx9E1waE/ppLDyOXxMx2sGh0K15AKWdCjUhJ5OSU+IvM3ECMifEBeYDbpfp5WDjUK+kcqWY0dnrySHjeNnAH5vQ+dcOpmNaFKTWS9RF05Mu1Uaqi+riFPw6DF8psKBK0iKVaUNe9oJy1ldaMXrQ0E5h/hg2d+FfWXjWw+JObpbzw45aJHrooxXnP8iQpfUvlbkOYD0JR7y1a8b1NCrfCh+MmjqpGqdVi2PWZdyEw7jmGyLKfOet+VjX1ylDCET6lDR8hAE7D+eTUxUh0SeM+iqMNGZZ9eG9NTjhW7uSCcUhIt+PEdqFBp2c+JFzRYw+4BKGB2fwMlwM1ab7Ak6a9991cRqh1IDl9dWVYC8OLLXSv8HoZSBp7SV6F0ptpvlxGdW+3B7HasUJq6AGQI44mYghCtBhBKD7qWWRPPG7kcKUFA4SRPW5NIlMgSQVa2Jm27YHGxZGxTTjUl5XtN+j9PRHyR+UJylnKQzzJF0npkAFMpbZHjKDY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(36840700001)(46966006)(36860700001)(83380400001)(47076005)(356005)(81166007)(2013699003)(36756003)(33656002)(86362001)(41300700001)(82740400003)(6486002)(6862004)(8936002)(8676002)(478600001)(15650500001)(40480700001)(6512007)(6506007)(53546011)(4326008)(70586007)(316002)(70206006)(54906003)(107886003)(2906002)(2616005)(26005)(5660300002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 12:48:14.5407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b450129c-4aba-4237-bc4e-08dc1cdabafd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 12:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194269

T24gMjMgSmFuIDIwMjQsIGF0IDE0OjA4LCBGYWJpbyBFc3RldmFtIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxmZXN0ZXZhbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ICtGSUxFUzoke1BOfS1zZXJ2ZXIgPSAiJHtiaW5kaXJ9L3B1bHNlYXVkaW8gJHtiaW5k
aXJ9L3N0YXJ0LSogJHtkYXRhZGlyfSAke3N5c2NvbmZkaXJ9ICR7YmluZGlyfS9wYWN0bCAqL3Vk
ZXYvcnVsZXMuZC8qLnJ1bGVzICovKi91ZGV2L3J1bGVzLmQvKi5ydWxlcyAke3N5c3RlbWRfdXNl
cl91bml0ZGlyfS8q4oCdDQoNCkl04oCZcyBiZXN0IG5vdCB0byBhZGQgZW50aXJlIHRyZWVzIGxp
a2UgJHtkYXRhZGlyfSB0byBmaWxlcywgYXMgdGhlcmUgbWF5IGJlIHVuZXhwZWN0ZWQgY29uc2Vx
dWVuY2VzLg0KDQpJZiB5b3UgcnVuIGJ1aWxkaGlzdG9yeS1kaWZmIHRvIHZlcmlmeSB0aGUgcGFj
a2FnaW5nIGNoYW5nZXMsIHRoZW4geW914oCZbGwgc2VlIHRoaXMgZGlkIG5vdCBkbyB3aGF0IHlv
dSB3YW50ZWQ6DQoNCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVkaW8vcHVs
c2VhdWRpby1kb2M6IFBLR1NJWkUgY2hhbmdlZCBmcm9tIDcwODU1IHRvIDAgKC0xMDAlKQ0KcGFj
a2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLWxvY2FsZS1h
ZjogRklMRUxJU1Q6IHJlbW92ZWQgYWxsIGl0ZW1zICIvdXNyL3NoYXJlL2xvY2FsZS9hZi9MQ19N
RVNTQUdFUy9wdWxzZWF1ZGlvLm1vIg0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcHVs
c2VhdWRpby9wdWxzZWF1ZGlvLWxvY2FsZS1hZjogUEtHU0laRSBjaGFuZ2VkIGZyb20gMTA0MDEg
dG8gMCAoLTEwMCUpDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9reS1saW51eC9wdWxzZWF1ZGlvL3B1
bHNlYXVkaW8tbG9jYWxlLWFzOiBGSUxFTElTVDogcmVtb3ZlZCBhbGwgaXRlbXMgIi91c3Ivc2hh
cmUvbG9jYWxlL2FzL0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8iDQpwYWNrYWdlcy9jb3J0ZXhh
NTctcG9reS1saW51eC9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8tbG9jYWxlLWFzOiBQS0dTSVpFIGNo
YW5nZWQgZnJvbSAzOTg4NSB0byAwICgtMTAwJSkNCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxp
bnV4L3B1bHNlYXVkaW8vcHVsc2VhdWRpby1sb2NhbGUtYmU6IEZJTEVMSVNUOiByZW1vdmVkIGFs
bCBpdGVtcyAiL3Vzci9zaGFyZS9sb2NhbGUvYmUvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyIN
CnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVkaW8vcHVsc2VhdWRpby1sb2Nh
bGUtYmU6IFBLR1NJWkUgY2hhbmdlZCBmcm9tIDYwNjMyIHRvIDAgKC0xMDAlKQ0KcGFja2FnZXMv
Y29ydGV4YTU3LXBva3ktbGludXgvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLWxvY2FsZS1iZzogRklM
RUxJU1Q6IHJlbW92ZWQgYWxsIGl0ZW1zICIvdXNyL3NoYXJlL2xvY2FsZS9iZy9MQ19NRVNTQUdF
Uy9wdWxzZWF1ZGlvLm1vIg0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcHVsc2VhdWRp
by9wdWxzZWF1ZGlvLWxvY2FsZS1iZzogUEtHU0laRSBjaGFuZ2VkIGZyb20gMTkzNyB0byAwICgt
MTAwJSkNClsgc2tpcCB0ZW5zIG1vcmUgbG9jYWxlIHBhY2thZ2VzIF0NCnBhY2thZ2VzL2NvcnRl
eGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVkaW8vcHVsc2VhdWRpby1sb2NhbGUtemgtdHc6IEZJTEVM
SVNUOiByZW1vdmVkIGFsbCBpdGVtcyAiL3Vzci9zaGFyZS9sb2NhbGUvemhfVFcvTENfTUVTU0FH
RVMvcHVsc2VhdWRpby5tbyINCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVk
aW8vcHVsc2VhdWRpby1sb2NhbGUtemgtdHc6IFBLR1NJWkUgY2hhbmdlZCBmcm9tIDU3NzI2IHRv
IDAgKC0xMDAlKQ0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvcHVsc2VhdWRpby9wdWxz
ZWF1ZGlvLXNlcnZlcjogRklMRUxJU1Q6IGRpcmVjdG9yeSByZW5hbWVkIC9ldGMvZGJ1cy0xL3N5
c3RlbS5kIC0+IC91c3Ivc2hhcmUvZGJ1cy0xL3N5c3RlbS5kLCBhZGRlZCAiL3Vzci9zaGFyZS9s
b2NhbGUvc3YvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2Jhc2gtY29tcGxl
dGlvbi9jb21wbGV0aW9ucy9wdWxzZWF1ZGlvIC91c3Ivc2hhcmUvbG9jYWxlL2VsL0xDX01FU1NB
R0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvdWsvTENfTUVTU0FHRVMvcHVsc2Vh
dWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9iZS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91
c3Ivc2hhcmUvbWFuL21hbjEvc3RhcnQtcHVsc2VhdWRpby14MTEuMSAvdXNyL3NoYXJlL2xvY2Fs
ZS9ubC9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbWFuL21hbjEvcGFtb24u
MSAvdXNyL3NoYXJlL2Jhc2gtY29tcGxldGlvbi9jb21wbGV0aW9ucy9wYWN0bCAvdXNyL3NoYXJl
L3ZhbGEvdmFwaS9saWJwdWxzZS1zaW1wbGUuZGVwcyAvdXNyL3NoYXJlL2xvY2FsZS9oZS9MQ19N
RVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL2phL0xDX01FU1NBR0VTL3B1
bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvbm4vTENfTUVTU0FHRVMvcHVsc2VhdWRpby5t
byAvdXNyL3NoYXJlL2xvY2FsZS9wbC9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hh
cmUvbG9jYWxlL3B0X0JSL0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9iYXNo
LWNvbXBsZXRpb24vY29tcGxldGlvbnMvcGFzdXNwZW5kZXIgL3Vzci9zaGFyZS9sb2NhbGUva2sv
TENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9ldS9MQ19NRVNTQUdF
Uy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL2JnL0xDX01FU1NBR0VTL3B1bHNlYXVk
aW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUva24vTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNy
L3NoYXJlL2xvY2FsZS9odS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9j
YWxlL29jL0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9tYW4vbWFuMS9wYXgx
MXB1Ymxpc2guMSAvdXNyL3NoYXJlL21hbi9tYW41L3B1bHNlLWRhZW1vbi5jb25mLjUgL3Vzci9z
aGFyZS9sb2NhbGUvc3IvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2Fs
ZS9wdC9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL2lkL0xDX01F
U1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvZ2wvTENfTUVTU0FHRVMvcHVs
c2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9oaS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1v
IC91c3Ivc2hhcmUvbWFuL21hbjUvZGVmYXVsdC5wYS41IC91c3Ivc2hhcmUvYmFzaC1jb21wbGV0
aW9uL2NvbXBsZXRpb25zL3BhcGxheSAvdXNyL3NoYXJlL2xvY2FsZS9oci9MQ19NRVNTQUdFUy9w
dWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvdmFsYS92YXBpL2xpYnB1bHNlLnZhcGkgL3Vzci9zaGFy
ZS9sb2NhbGUvcGEvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS96
aF9DTi9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL2RlL0xDX01F
U1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvYXMvTENfTUVTU0FHRVMvcHVs
c2VhdWRpby5tbyAvdXNyL3NoYXJlL21hbi9tYW4xL3BhZHNwLjEgL3Vzci9zaGFyZS9sb2NhbGUv
ZXMvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL21hbi9tYW4xL3BhcmVjLjEg
L3Vzci9zaGFyZS9sb2NhbGUvYWYvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJl
L2xvY2FsZS9tbC9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbWFuL21hbjEv
cGFjYXQuMSAvdXNyL3NoYXJlL2xvY2FsZS9ydS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91
c3Ivc2hhcmUvbG9jYWxlL2l0L0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9i
YXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvcGFyZWNvcmQgL3Vzci9zaGFyZS9tYW4vbWFuNS9w
dWxzZS1jbGktc3ludGF4LjUgL3Vzci9zaGFyZS9sb2NhbGUvbHQvTENfTUVTU0FHRVMvcHVsc2Vh
dWRpby5tbyAvdXNyL3NoYXJlL21hbi9tYW4xL3BhcmVjb3JkLjEgL3Vzci9zaGFyZS9iYXNoLWNv
bXBsZXRpb24vY29tcGxldGlvbnMvcGFjbWQgL3Vzci9zaGFyZS9sb2NhbGUvZGEvTENfTUVTU0FH
RVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL21hbi9tYW4xL3BhY3RsLjEgL3Vzci9zaGFyZS9s
b2NhbGUvdHIvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9kZV9D
SC9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL3NpL0xDX01FU1NB
R0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvemhfVFcvTENfTUVTU0FHRVMvcHVs
c2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9ndS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1v
IC91c3Ivc2hhcmUvbG9jYWxlL2ZyL0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFy
ZS9tYW4vbWFuMS9wYWNtZC4xIC91c3Ivc2hhcmUvbWFuL21hbjEvcGFwbGF5LjEgL3Vzci9zaGFy
ZS9sb2NhbGUvc2svTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2Jhc2gtY29t
cGxldGlvbi9jb21wbGV0aW9ucy9wYWRzcCAvdXNyL3NoYXJlL2xvY2FsZS9jYS9MQ19NRVNTQUdF
Uy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvbG9jYWxlL2VvL0xDX01FU1NBR0VTL3B1bHNlYXVk
aW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvbXIvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNy
L3NoYXJlL3ZhbGEvdmFwaS9saWJwdWxzZS1tYWlubG9vcC1nbGliLmRlcHMgL3Vzci9zaGFyZS9t
YW4vbWFuMS9wYXN1c3BlbmRlci4xIC91c3Ivc2hhcmUvbG9jYWxlL3NyQGxhdGluL0xDX01FU1NB
R0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvY3MvTENfTUVTU0FHRVMvcHVsc2Vh
dWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS90ZS9MQ19NRVNTQUdFUy9wdWxzZWF1ZGlvLm1vIC91
c3Ivc2hhcmUvdmFsYS92YXBpL2xpYnB1bHNlLmRlcHMgL3Vzci9zaGFyZS9sb2NhbGUvYm5fSU4v
TENfTUVTU0FHRVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9rYS9MQ19NRVNTQUdF
Uy9wdWxzZWF1ZGlvLm1vIC91c3Ivc2hhcmUvYmFzaC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL3Bh
Y2F0IC91c3Ivc2hhcmUvbWFuL21hbjEvcHVsc2VhdWRpby4xIC91c3Ivc2hhcmUvbG9jYWxlL2tv
L0xDX01FU1NBR0VTL3B1bHNlYXVkaW8ubW8gL3Vzci9zaGFyZS9sb2NhbGUvb3IvTENfTUVTU0FH
RVMvcHVsc2VhdWRpby5tbyAvdXNyL3NoYXJlL2xvY2FsZS9maS9MQ19NRVNTQUdFUy9wdWxzZWF1
ZGlvLm1vIC91c3Ivc2hhcmUvbWFuL21hbjUvcHVsc2UtY2xpZW50LmNvbmYuNSAvdXNyL3NoYXJl
L3ZhbGEvdmFwaS9saWJwdWxzZS1tYWlubG9vcC1nbGliLnZhcGkgL3Vzci9zaGFyZS9iYXNoLWNv
bXBsZXRpb24vY29tcGxldGlvbnMvcGFyZWMgL3Vzci9zaGFyZS92YWxhL3ZhcGkvbGlicHVsc2Ut
c2ltcGxlLnZhcGkgL3Vzci9zaGFyZS9sb2NhbGUvdGEvTENfTUVTU0FHRVMvcHVsc2VhdWRpby5t
byINCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3B1bHNlYXVkaW8vcHVsc2VhdWRpby1z
ZXJ2ZXI6IFBLR1NJWkUgY2hhbmdlZCBmcm9tIDMwMTMyNyB0byAyOTkwNTQwICgrODkyJSkNCg0K
QWxsIG9mIHRoZSBsb2NhbGVzLCB0aGUgYmFzaCBjb21wbGV0aW9uLCB0aGUgdmFwaSBmaWxlcywg
YW5kIHRoZSBkb2N1bWVudGF0aW9uIGlzIG5vdyBpbiB0aGUgcHVsc2VhdWRpby1zZXJ2ZXIgcGFj
a2FnZS4NCg0KV2hlbiBjaGFuZ2luZyBwYWNrYWdpbmcgcnVsZXMsIHBsZWFzZSByZW1lbWJlciB0
byB2ZXJpZnkgdGhlIHBhY2thZ2luZy4NCg0KUm9zcw==

