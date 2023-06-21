Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B88DEB64DD
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:03:45 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.5942.1687334617030334437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 01:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=h0GMS6xw;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5162; q=dns/txt; s=iport;
  t=1687334617; x=1688544217;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SVejvtfsJE07aK1DUoYh17g/FvWZyGXM6Hhxd/AhqqM=;
  b=h0GMS6xwKZ3TvNwiByRiogsYp2wJuB+WQ0wth8+AleLVEzHE3DgSrADZ
   cqFSsvW3i1REhMq8E06njWDiy7gehT9IC+UDDN2+d6XvhrWhtQLvoiVh/
   BoXzDAjva/7Bv743+oSmwQnoX9tFNMs9gHs2R6CsXRfeBbsqFM3ZK2jQX
   g=;
X-IPAS-Result: =?us-ascii?q?A0BJAgB0rpJkmJRdJa1aHgEBCxIMQCWBHwuBYVJzAlkqE?=
 =?us-ascii?q?hotA4ROg0wDhS2GMYIkA51vFIERA1YPAQEBDQEBLg0JBAEBghKCdAIWhWwCJ?=
 =?us-ascii?q?TQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOE?=
 =?us-ascii?q?CeFaA2GBAEBAQEDAREREQwBATgLBAIBCBEDAQEBAwImAgICJgoVCAgCBAESC?=
 =?us-ascii?q?BqCXAGCXAMBEJZbi28BgUACiVYaNXqBMoEBgggBAQYEBYFKAkOwWwmBFS2JO?=
 =?us-ascii?q?oNeghWCMycbQIFNgRVDeYFvPoEFgV0BAQOBID8Vg0Q5gi6CGIdBhFGFZQeBQ?=
 =?us-ascii?q?zGJZYEob4EegSB6AgkCEUEmgQgIX4FzQAINVAsLY4EcUjqBRgICEToPBVJ4G?=
 =?us-ascii?q?wMHA4EFEC8HBDIJFgkGCRgvJQZRBy0kCRMVQQSDWAqBDT8VDhGCWiICBzY/G?=
 =?us-ascii?q?1GCIzcDRB1AAwtwPTUGDh8FBCQeK4FXMD6BEgJFoB0Dgk9PgQ4BK4ERBwOBE?=
 =?us-ascii?q?ZMZIIMwrXIKJ4Nhi3yNGoggF4VXpAELmA8gjTuaNQIEAgQFAg4BAQaBYzqBS?=
 =?us-ascii?q?QsHcBWDIglJGQ+OIBmDW4F/gxWKZXULAi4CBwEKAQEDCYtIAQE?=
IronPort-PHdr: A9a23:UvGvfBCdZAOJRv1NSYFXUyQVoBdPi9zP1kY98JErjfdJaqu8usikN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7HuEY7Tk96w28i5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:ahECH6Oy07+AkHHvrR2kl8FynXyQoLVcMsEvi/4bfWQNrUomhWFSm
 mUdXjyGO/qLZGChfdt3b4Tg9E8DuJbTy9NhQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl70Eo68wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjhJo9poebtMTUnkJrWvQsNNL2
 YppuZPlHG/FPoWU8AgcewNTHyc7Nqpc9fqeez60sNeYyAvNdH6EL/dGVR5te9ZHvLcsRzgSp
 ZT0KxhVBvyHr/m9wLOnUO5grs8iN8LseogYvxmMyBmGUKd+G8mTG80m4/dY2GgR2cZURM/Qb
 vdCNWVzaiT9X0ZAbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3mN8DYUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rvXEkSW+U4UIGfjhrLhhgUaYwSoYDxh+uUaHTeeRtBSaZ/cFA
 kMvxHQI8/Ed93a6Ef3xUEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblToqBYcNrTKU+drG1QXO
 k+1c8DBXmMw7eXEIZ6J3vLF8mPoYHl9wXoqPHdcFWM4D8/fTJbfZy8jo/55G6Kzy9byAzy1m
 mrMpykljLJVhskOv0lawbwlq2z2znQqZldljukyYo5Dxl8jDGJCT9DxgWU3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bYGKG0QM/RMB/p2zFF5ufkWZ4vmkWyKBBbJ5sRNMVS
 BS7Vf55vcUKZyL6McebnaroUZ1xpUQfKTgVfqmEMoURCnSAXASG5yppLVWBxHzglVNErE3ME
 cnzTCpYNl5DUf4P5GPvH481iOZ3rghgnjm7bc6gkHyaPU+2OST9pUEtagXeN4jULcqs/W3oz
 jqoH5LRl0QPDrWvMnO/HEx6BQliEEXXzKve8qR/XuWCOQFhXmomDpfsLXkJJOSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:MjZt6K/KOH3UoTEgySNuk+Fwdb1zdoMgy1knxilNoENuE/Bwxv
 rBoB1E73DJYW4qKQ4dcLC7UpVoMkmsi6KdhrNhcYtKPTOW9VdASbsD0WKM+UyZJ8VxnNQtrp
 uIH5IObeEYSGIK8foSgzPIXOrIouP3ipxA7N22pxwAPGIaCZ2IrT0JdzpzeXcGIzWucKBJba
 Z0kfA3wQZIF05nCvhTAENpY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 n4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv2/VXEO0aKSAWQR4Z
 zxSiQbToBOArTqDyaISC7WqkvdOfAVmjnfIBGj8CLeSIfCNUMH4oJ69PJkm13imgQdVBUW6t
 MR44pf3KAnVS/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtH+9Pa1wah4S0rpXWd
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1llu1EU+fHNcnW2AW4OSITr/c=
X-Talos-CUID: 9a23:W2yb5W2uy5mvn7Yw7tg2C7xfJJoBTliH5XjrHRGeVz9GS4eEFnuc9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ATDXPvg69GyYtu9AaUosvHhPwxoxo5/uPV0YXyKw?=
 =?us-ascii?q?IsvTfaXNsPQegsG+4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jun 2023 08:03:23 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 35L83MRR021597
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:03:22 GMT
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,259,1681171200"; 
   d="scan'208";a="3243508"
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbjuJ0ScMkEzItNd/7+vUv2kGUmnGCGqBjj/dJzdvbkL7i3D/Km4YTfIrRBWFLjPS9pOS2/dVM3R5eWFYQLUlbgxYpsuGd6nE/sJetxB2NhqCB++yiUVADLDRd9RqPtnIYijJt2/MfwqYK9Q7ig66qxo0ZFfWK9PRHn+be2FhjnpMXdxb9neooA7yNgs95xN7tjHph5LB6GhGreDq3oSyPGlX6JkG5kJoenKfiGlWTyl+wKiEa68LyK+8ijHThIii4nkXhkZn6nw7YOMpcuUYPgoDzJG1Xm4IecJPuRE9VP6HMLFZ5zhI02F2bQd5aT7tUCzB7oiFC+4D5Atckw1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVejvtfsJE07aK1DUoYh17g/FvWZyGXM6Hhxd/AhqqM=;
 b=ofreIr1BBIlDKdYTaxVwoyXyVN/To3XRfjspx3aDXqydpBvF6IYkSonyGFxHLKOYZ4lM+l1Iip7hi/NTjKJ0FCetvrkuQ9cLu1CSU+YeRSZaSE75Lkt+hCFbUY5esEWlB3M1ZI6iZN1/XPJjqscVWHt0BpopzJ342fGZOeKFgEhkaoVsSfjfhFw2fKcAHQ0gveYF7xz9/WUqz37OfZidlCWo2LhFbc1/wU0jy9ltaCmM6lHq/2kOV4GdEoLPv+fgxe0vL2niqFH5Ha2r/jMeCU68t5HLE0UH4xnx3Zmzek6VKjewfTh/kov3vDfwcHEhl1SB3lg01sCAtOe3ASYGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVejvtfsJE07aK1DUoYh17g/FvWZyGXM6Hhxd/AhqqM=;
 b=TBScmse/7Ua17Mc+bngOxqKJChDjG1voOXXo6wGiExTtwxLeUBJXNLj7+Tn0UYq0gJ2ujll/mjr/xNLjVNgkU1fljJHRJvqkcu/+fI/auKBL7lwfi020w7aJJqudlpIWz0vX6c+F0ljAItv72vTW9QJlYwQXHPqbTOczo3gXb4I=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 08:03:20 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Wed, 21 Jun 2023
 08:03:20 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [OE-core,mickledore][PATCH] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core] [OE-core,mickledore][PATCH] cups: Fix CVE-2023-32324
Thread-Index: AQHZni7ynJsTtLjgSUGBylAVyLps96+U8DQw
Date: Wed, 21 Jun 2023 08:03:03 +0000
Deferred-Delivery: Wed, 21 Jun 2023 08:02:56 +0000
Message-ID: 
 <SJ0PR11MB6717D52424A3F7FFF4926A99DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17684F4A5AE4FC5E.24824@lists.openembedded.org>
In-Reply-To: <17684F4A5AE4FC5E.24824@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SA2PR11MB4779:EE_
x-ms-office365-filtering-correlation-id: 17abe30a-84c5-4383-57c4-08db722dfa37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1DWH+JriHpZZzSgj01qa7Yul6zWC3fyx4915GYytJ/l8Ky8ra1vCva63fAZrU3O2LnhYx1UL9MbBwxh1/csYjIKAHQNB1vC7v2Kl5bRqM2rM4ifGecTS9d1Z9Kw+kUitGOaN+T5BSf5I2ekLE+o8wWrMp2cZIdMSI34Vxz4mChWNKuhdlkaQ/ZmQbrYKLy1boK5C0riuOZz11c6VRCaAvOtGituKkDmyC2i4t8Qb1dnm90W/VpgEeTPp/Bvq13ul1gR5+i+bvbbsfXblzeGnwjZiqrZ9WAC7viID3FUW8qI9DGdUpuCEL9Ut1i9BavMV3aRcaL71D53nHSXnyQtAF90QXuAqpmHCzLvkuJFnCS10KVLuG2Qrk6HI5YHzYceb3E1NdVCQ3+WR6GUaYwR76jHujv8iA2o7UNgq1UpvcWY1comXRfWVJctrCpbr13Yy25HIHRCLcTI5oO1EDqrSVXOWEDvaEm9bxQTFnLAXWzXyvYYtWdR/GTH7ryIbdB0pTEI6eB2gwjeI7ZTP/418hahWLZwZkA1SI8vleHPaY2Oos0jYfp9LdTs8uFY+vQmUcFGAUSzdetjYwbDVpoC+dTlC8sOqpp61lP/3wukd+ZvFj76FdK7bO/+/33HAR6RV6sao0CiwseCQgaImMaaPng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(76116006)(66476007)(66556008)(66946007)(66446008)(122000001)(55236004)(186003)(86362001)(38100700002)(9686003)(64756008)(6506007)(38070700005)(26005)(83380400001)(966005)(110136005)(478600001)(33656002)(7696005)(71200400001)(55016003)(2906002)(41300700001)(6666004)(8936002)(5660300002)(8676002)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yk9ndWk0ckxvVUVaQlZqbUpSWVhVdVFXWFRQUFNXeVhNVkhXUGowUjlpTGU4?=
 =?utf-8?B?cDI3RStNRnRYMTFLQVRkZVhJazFUTFJIcllQTEdHQ0VSMmN4YmVvZVhXV3lK?=
 =?utf-8?B?SHViMmxUTEZ5UXc4OE8vbHA3d3pZUzFNa1FlcnUzYjQvTlN6WHhweXRNcndU?=
 =?utf-8?B?WnV5cDhQN0M0b2JJQkJLdmNXRjFiUlJXL1VLT2JxMnNhcWVhN00vWmRTYkZ1?=
 =?utf-8?B?SHRaTCtsanBPY2tLcVZvZXJ5VTdlY25HTDRDSGtRaGU0TDloT21LbXdib29P?=
 =?utf-8?B?Vm8rdmRaYVp0Zy9YNnBldVhKTjVHZDhGRkU0alFUbmtwN1lTbTc2aDFTTkQv?=
 =?utf-8?B?WC9Od0NQYWZwdGNQSUlzTGpnSTJiWXMyK2tGekZOcHlsSjRaUjVHbkU4REZU?=
 =?utf-8?B?M0hESmJUWGIxWlNkVTllYW00RUczMlpVcTh6T2ZGb1NtQitOVUthVncvdW1m?=
 =?utf-8?B?QStvOUpheU9DdVZOWUxnMGxtTnd2WWI4VWhzeldCNGlnQ1R2MGZEVnJ6RHpK?=
 =?utf-8?B?OGlxbHRnQXpVdjJtRkYvdTZxWnJ5dm01WjFGWXZYbzloNlZ1Y1JobzJJWUR3?=
 =?utf-8?B?ZDlIR1NjdThmcXlMV2wrVVAra2xnUnA4b1lJaEpZcmk1bDVCc28yejBRd0V1?=
 =?utf-8?B?UVZXcVllT1VhNXZKVUJ6bkwrclRIcThnUXFFRU1GdFp6T3krUGFDL3d2SHR3?=
 =?utf-8?B?YWMvdTJlZ2JCWlFSZUpRdG1mOTdOazdSZVkxVkIzRHhIUjJLMjFFRGFvaDdP?=
 =?utf-8?B?Y25iZFhLbUJITzAwRXBRa3JDdXlUalBWcUgzWWdzb0lPTC80bHFrRWFvekRq?=
 =?utf-8?B?eUFtUVloUWJ6R21nd243Z2JFVXBnZi9GYjlhVlR4SDQ4MEdSZDd0eEtwRTFQ?=
 =?utf-8?B?SC9SNTBnUWxpb3VYM2lzOGtIalB2d3FhWWpvcmlaeFJ3VFVDR3Y4WW9TZXIv?=
 =?utf-8?B?emEzZlVQN0M5aUdKdVpvNGZRK01IV1N4N0NDRTNxM3VpVWpJWVFkZmthNjVC?=
 =?utf-8?B?UFdoZmtEdG54VnNHSFJiM1RPc3dPV1hTTlc5NU5FUXVITjhjbWc0TXFJUThq?=
 =?utf-8?B?dDlnQXlqNEZmY2R0K0FSNXo1WGUrb2hVMU9vd2V2a3hYcVgrclFKS1p4NUM0?=
 =?utf-8?B?Uit2U1paakVhK1VOR1RaWWwvOXZNaGpCVncycVBwckMzcGhmQjBURkJtemV0?=
 =?utf-8?B?V3J2KzZPK0N2d2JBbjRsRm9rSEQybi83SWVWL0FNM2kyNnExVEorVVBERk5M?=
 =?utf-8?B?L1V1bmVDMVlleXFBQ1NrQm1NVmhQM2g4SDFDVUZWbG9tZFdUOEgxN1FXVXIx?=
 =?utf-8?B?TVhKZHRKSzNqejJPdHFzNEhlTVpxMmdGK0FOVjBnNzB4NkNHN0Mrb1ptZTBH?=
 =?utf-8?B?RUtpSDMwMTdkbGhwRnlrT3JJRlVnemsxVGpzNHRwMnZUWTlsdFFOY0NveTNC?=
 =?utf-8?B?cXQwZjFIendpd0l2Zy9CQ1IxbU5wMWpBaThiL3Y4QXpDSndIM25UV1FwQjRP?=
 =?utf-8?B?andVVnB3dE5WRFNPT3o5bDZKc1FIcFI2OTlFUEdzZnFkaTAxaTlOUmhlWFp4?=
 =?utf-8?B?N1N2MTNnd25jcnVkd2pQNjhKZll2d0cwMWg0NW9Fbk5nUnRNTG9nVVRUQ1A4?=
 =?utf-8?B?emtIZ3MzSnpQMDhiS0tzNng1c2FMMnMxUlFvZVgrRmJMdWhWSWdqdzh2TWg3?=
 =?utf-8?B?WnV1ZiswN2kvYjdVV1RRbjZkVk1HN2IrRXI4cG1wcm15WUZsemlnL1VlNjdE?=
 =?utf-8?B?Ynd1cndPNFFVVjdjU25tMkVYSzJCbXJrRFlGcmZzRURCNEdybGtnRGNwZHY5?=
 =?utf-8?B?WURxQWxrMk5mNE9qOE9sN2RWVmVIUFhTZklvSitHZndqY1JSMkFRUmtNTUZ0?=
 =?utf-8?B?dkxtN1Z2NFJkRUxRS2pHNUxpWnJoQjJ2VDE0dEpWcjIzb0hNMVRQVnJGeGFN?=
 =?utf-8?B?akdGVUsyTjZCL1JHNjRsYlYyeFgxRTlvdWhGYndyaTlObmxNT0VTSVpoWlRm?=
 =?utf-8?B?elQ4SEpsdGx4eFNrN2dEMnVpd2lrQ0plSHdjRGp5NlRzc3V1T05yNXlOMWRs?=
 =?utf-8?B?NFZHVllWM3ZUcS83NHlnTzM0U0lnelNZOUlZTzdnb3Y3N3RWbTU2WEJTeS9x?=
 =?utf-8?Q?lFJ+E8HsZqWWorZc1Ffl6v9/n?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17abe30a-84c5-4383-57c4-08db722dfa37
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 08:03:19.9471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4I+M5hp7l7lun235A0TYAGW9cPNZDj3ms/2cbub1EpWw6aK7Ydjx62iy5q3d1KDLoCZW16hyccaOTumCXmGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183174

SGkgU3RldmUsDQoNCkNWRSBmaXggZm9yIGN1cHMgcGFja2FnZSBpcyBhY2NlcHRlZCBhbmQgbWVy
Z2VkIG9uIG1hc3Rlci4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVk
ZGVkLWNvcmUvY29tbWl0L2E0YmRiYzgyZjdlNWNjOWE1Y2I2MDNjYjcyMGYwOWIwMjE2YjBhMGUN
Cg0KSXMgdGhlcmUgYW55IGNvbW1lbnQgZm9yIHNpbWlsYXIgZml4IG9uIG1pY2tsZWRvcmUgYnJh
bmNoPw0KDQpUaGFua3MsDQpTYW5qYXkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBTYW5qYXlrdW1hciBr
YW50aWJoYWkgQ2hpdHJvZGEgLVggKHNjaGl0cm9kIC0gRS1JTkZPIENISVBTIElOQyBhdCBDaXNj
bykgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNCwg
MjAyMyAxOjAwIEFNDQpUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KQ2M6IFNhbmpheWt1bWFyIGthbnRpYmhhaSBDaGl0cm9kYSAtWCAoc2NoaXRyb2QgLSBFLUlO
Rk8gQ0hJUFMgSU5DIGF0IENpc2NvKSA8c2NoaXRyb2RAY2lzY28uY29tPg0KU3ViamVjdDogW09F
LWNvcmVdIFtPRS1jb3JlLG1pY2tsZWRvcmVdW1BBVENIXSBjdXBzOiBGaXggQ1ZFLTIwMjMtMzIz
MjQNCg0KT3BlblByaW50aW5nIENVUFMgaXMgYW4gb3BlbiBzb3VyY2UgcHJpbnRpbmcgc3lzdGVt
LiBJbiB2ZXJzaW9ucyAyLjQuMiBhbmQgcHJpb3IsIGEgaGVhcCBidWZmZXIgb3ZlcmZsb3cgdnVs
bmVyYWJpbGl0eSB3b3VsZCBhbGxvdyBhIHJlbW90ZSBhdHRhY2tlciB0byBsYXVuY2ggYSBkZW5p
YWwgb2Ygc2VydmljZSAoRG9TKSBhdHRhY2suIEEgYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxp
dHkgaW4gdGhlIGZ1bmN0aW9uIGBmb3JtYXRfbG9nX2xpbmVgIGNvdWxkIGFsbG93IHJlbW90ZSBh
dHRhY2tlcnMgdG8gY2F1c2UgYSBEb1Mgb24gdGhlIGFmZmVjdGVkIHN5c3RlbS4gRXhwbG9pdGF0
aW9uIG9mIHRoZSB2dWxuZXJhYmlsaXR5IGNhbiBiZSB0cmlnZ2VyZWQgd2hlbiB0aGUgY29uZmln
dXJhdGlvbiBmaWxlIGBjdXBzZC5jb25mYCBzZXRzIHRoZSB2YWx1ZSBvZiBgbG9nbGV2ZWwgYHRv
IGBERUJVR2AuIE5vIGtub3duIHBhdGNoZXMgb3Igd29ya2Fyb3VuZHMgZXhpc3QgYXQgdGltZSBv
ZiBwdWJsaWNhdGlvbi4NCg0KUmVmZXJlbmNlczoNCmh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4v
ZGV0YWlsL0NWRS0yMDIzLTMyMzI0DQpodHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFuLm9y
Zy90cmFja2VyL0NWRS0yMDIzLTMyMzI0DQoNClVwc3RyZWFtIFBhdGNoOg0KaHR0cHM6Ly9naXRo
dWIuY29tL09wZW5QcmludGluZy9jdXBzL2NvbW1pdC9mZDhiYzJkMzI1ODkNCg0KU2lnbmVkLW9m
Zi1ieTogU2FuamF5IENoaXRyb2RhIDxzY2hpdHJvZEBjaXNjby5jb20+DQotLS0NCiBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYyAgICAgICAgICAgfCAgMSArDQogLi4uL2N1cHMv
Y3Vwcy9DVkUtMjAyMy0zMjMyNC5wYXRjaCAgICAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysr
KysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNo
DQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jDQppbmRleCBkYTMyMGIxMDg1Li5kNzc3
NThmZDNmIDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMN
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jDQpAQCAtMTUsNiArMTUs
NyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vY3Vwcy0k
e1BWfS1zb3VyY2UudGFyLmd6IFwNCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LWN1cHMtZml4LW11
bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2ggXA0KICAgICAgICAgICAgZmlsZTov
L3ZvbGF0aWxlcy45OV9jdXBzIFwNCiAgICAgICAgICAgIGZpbGU6Ly9jdXBzLXZvbGF0aWxlcy5j
b25mIFwNCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMy0zMjMyNC5wYXRjaCBcDQogICAgICAg
ICAgICAiDQogDQogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuUHJp
bnRpbmcvY3Vwcy9yZWxlYXNlcyINCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
Y3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1
cHMvY3Vwcy9DVkUtMjAyMy0zMjMyNC5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IDAwMDAwMDAwMDAuLjQwYjg5Yzk4OTkNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIzMjQucGF0Y2gNCkBAIC0wLDAgKzEsMzYg
QEANCitGcm9tIDA3Y2JmZmQxMTEwN2VlZDNhYWYxYzY0ZTM1NTUyYWVjMjBmNzkyZGEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxDQorRnJvbTogWmRlbmVrIERvaG5hbCA8emRvaG5hbEByZWRoYXQu
Y29tPg0KK0RhdGU6IFRodSwgMSBKdW4gMjAyMyAxMjowNDowMCArMDIwMA0KK1N1YmplY3Q6IFtQ
QVRDSF0gY3Vwcy9zdHJpbmcuYzogUmV0dXJuIGlmIGBzaXplYCBpcyAwIChmaXhlcyANCitDVkUt
MjAyMy0zMjMyNCkNCisNCitDVkU6IENWRS0yMDIzLTMyMzI0DQorVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCANCitbaHR0cHM6Ly9naXRodWIuY29tL09wZW5QcmludGluZy9jdXBzL2NvbW1pdC9m
ZDhiYzJkMzI1ODldDQorDQorKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgZmQ4YmMyZDMyNTg5
ZDFmZDkxZmUxYzA1MjFiZTJhN2MwNDYyMTA5ZSkNCitTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgQ2hp
dHJvZGEgPHNjaGl0cm9kQGNpc2NvLmNvbT4NCistLS0NCisgY3Vwcy9zdHJpbmcuYyB8IDQgKysr
Kw0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQorDQorZGlmZiAtLWdpdCBhL2N1
cHMvc3RyaW5nLmMgYi9jdXBzL3N0cmluZy5jIGluZGV4IDkzY2RhZDE5Li42ZWY1ODUxNSANCisx
MDA2NDQNCistLS0gYS9jdXBzL3N0cmluZy5jDQorKysrIGIvY3Vwcy9zdHJpbmcuYw0KK0BAIC0x
LDYgKzEsNyBAQA0KKyAvKg0KKyAgKiBTdHJpbmcgZnVuY3Rpb25zIGZvciBDVVBTLg0KKyAgKg0K
KysgKiBDb3B5cmlnaHQgwqkgMjAyMyBieSBPcGVuUHJpbnRpbmcuDQorICAqIENvcHlyaWdodCDC
qcKgMjAwNy0yMDE5IGJ5IEFwcGxlIEluYy4NCisgICogQ29weXJpZ2h0IMKpwqAxOTk3LTIwMDcg
YnkgRWFzeSBTb2Z0d2FyZSBQcm9kdWN0cy4NCisgICoNCitAQCAtNzMwLDYgKzczMSw5IEBAIF9j
dXBzX3N0cmxjcHkoY2hhciAgICAgICAqZHN0LAkJLyogTyAtIERlc3RpbmF0aW9uIHN0cmluZyAq
Lw0KKyAgIHNpemVfdAlzcmNsZW47CQkJLyogTGVuZ3RoIG9mIHNvdXJjZSBzdHJpbmcgKi8NCisg
DQorIA0KKysgIGlmIChzaXplID09IDApDQorKyAgICByZXR1cm4gKDApOw0KKysNCisgIC8qDQor
ICAgKiBGaWd1cmUgb3V0IGhvdyBtdWNoIHJvb20gaXMgbmVlZGVkLi4uDQorICAgKi8NCi0tDQoy
LjM1LjYNCg0K

