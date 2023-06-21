Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72344EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:04:25 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.5959.1687334662471534398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 01:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=aXMH6VCe;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5194; q=dns/txt; s=iport;
  t=1687334662; x=1688544262;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+/Ht+Kl0pmip4xTdoy7zVuWg02EzCciitKTl2XF5I0o=;
  b=aXMH6VCebzO6N4mSwE6z1X+sbTdfYSsoAg1qVQIufnpym+2dCHLxvTQE
   VelVElKuycYuIA1I4k7EFdwwQGrylnA47Qh+UCEfNrqBdqdXNKu43dteK
   BJpoZBJAxLw93GOwQ2cvDEB44jE6Sl0MMoZot3sB/kvSz6F9Vhc3x3jWH
   o=;
X-IPAS-Result: =?us-ascii?q?A0BJAgCCrZJkmJRdJa1aHgEBCxIMQCWBHwuBYVJzAlkqE?=
 =?us-ascii?q?hotA4ROg0wDhS2GMYIkA51vFIERA1YPAQEBDQEBLg0JBAEBghKCdAIWhWwCJ?=
 =?us-ascii?q?TQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOE?=
 =?us-ascii?q?CeFaA2GBAEBAQEDAREREQwBATgLBAIBCBEDAQEBAwImAgICJgoVCAgCBAESC?=
 =?us-ascii?q?BqCXAGCXAMBEJZdi28BgUACiVYaNXqBMoEBgggBAQYEBYFKAkOwWwmBFS2JO?=
 =?us-ascii?q?oNeghWCMycbQIFNgRVDeYFvPoEFgV0BAQOBID8Vg0Q5gi6CGIdBhFGFZQeBQ?=
 =?us-ascii?q?zGJZYEob4EegSB6AgkCEUEmgQgIX4FzQAINVAsLY4EcUjqBRgICEToPBVJ4G?=
 =?us-ascii?q?wMHA4EFEC8HBDIJFgkGCRgvJQZRBy0kCRMVQQSDWAqBDT8VDhGCWiICBzY/G?=
 =?us-ascii?q?1GCIzcDRB1AAwtwPTUGDh8FBCQeK4FXMD6BEgJFoB0Dgk9PgQ4BK4ERBwOBE?=
 =?us-ascii?q?ZMZIIMwrXIKJ4Nhi3yNGoggF4VXpAELmA8gjTuaNQIEAgQFAg4BAQaBYzqBS?=
 =?us-ascii?q?QsHcBWDIglJGQ+OIBmDW4F/gxWKZXULAi4CBwEKAQEDCYtIAQE?=
IronPort-PHdr: A9a23:0Xm6OhHJn82169LfPnV56p1Gfu4Y04WdBeZdwoAsh7QLdbys4NG7e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HToeVNNFpPGbkbJ6ma38SZUHxz+MQRvIeGgAYXSjtit0Oya8JzIaAIOjz24Mvt+K
 RysplDJv9INyct6f78swwHApGdJfekeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:Jz8IUaKi6LkWvNy0FE+R0JUlxSXFcZb7ZxGr2PjKsXjdYENS1j1Uy
 mQZDT/UPvqOajOgetsnPYvnpxxS7MXUzdNjHQEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39/00s7wobVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQQ8w7ojOfMGZHt30SiHn9Mq0
 4kRjYCJHFJB0q3kwIzxUjFCGC14eKZB4rKCeCL5us2IxEqAeHzpqxlsJBhpZstDpaAmWicXq
 axwxDMlNnhvg8qty7K6VvNriuwoLdLgO8UUvXQIITTxUqt2HMmaGP2iCdlw1nAzv/5LEfvlP
 eUSSR9eVCTgTBkWEwJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoO93Pd/SORN5JhQCfv
 m/A8mHzDx0WOdDZziCKmk9AncfVli/9HYkVDrD9r6Qsi1yIzWtVAxoTPbemnRWnokCvR8pSI
 lYZxgp0sKYy9xewEoXFQyTt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4othpNYJOWCgeGGJC6
 7OZoz/6LWcw7+DNGBpx4p/R/GziY3FERYMXTXZcFVNt3jX1nG0kYvvyojtLCqW5iJj+Hiv9h
 mnQ6iM/nL4Uy8UM0s1XHGwrYRry/PAlrSZstm07u15JCCslPuZJgKT0sDDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbm2D2w4yT8J4qWT1k5JGQWy2yG8mTKuOGphcEQIFn
 GeI0e+szMYJZSDzPfMfj3yZUp5zlsAM6ugJptiNPoYRPfCdhSeM/TplYgaLznvxnU03+ZzTy
 r/FGftA+U0yUPw9pBLvHr91+eZymkgWmziJLbillEvP7FZrTCPPIVvzGAHQPrlRAWLtiFi9z
 uuzwOPTkEkOALOmM3mNmWPRRHhTRUUG6VnNg5U/XsaIIxFtHycqDPq5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:UMjWqahVXzrfq14OHB6D/8YIBXBQX3J13DAbv31ZSRFFG/FwyP
 rOoB1L73HJYWgqN03IwerwR5VoIUm3yXcH2/huAV7EZnirhILIFvAu0WKG+V3d8kLFh5ZgPS
 kLSdkENDSdNykesS++2njFLz9C+qjJzEnLv5al854Fd2gDAM0QjHYaNu/YKDwKeOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhgYwHEnbD2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJp5mLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4N1HqWxa0+
 UkkS1Qevib2EmhOl1dZiGdnDUI5QxeqUMKD2Xox0cL7/aJHQ7SQPAx9L6xOiGpm3bI+usMnp
 6iGwmixsFq5dSqplWk2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZJIMvW0vFQLA
 BVNrCU2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZLyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR/2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKggFCvsuk6SRloeMMYYDaxfzO2zGu/HQ0ckiPg==
X-Talos-CUID: 9a23:Z4AP5GG0zOM4VMGXqmJp5VIMF8k/f0H9lmreI0zjEjo1cKGsHAo=
X-Talos-MUID: 9a23:pf3ZAwoRlU4A0F8d8/QezzslN/5W5qijMxoimrUjivG0FQN0Yh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jun 2023 08:04:21 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 35L84LHQ023846
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:04:21 GMT
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,259,1681171200"; 
   d="scan'208";a="3237413"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1vH6Dpd60XrLh0PRNzUz7z4l/xDmEB9v1IWYpmbGydQaEbZOYbi0dfqVj9tU9HLKxbKUK6KBvnXo24eS4ff76ZLHNM19pJMzsdfsMxVGQbh2V33Hti+0SJtAAucafQo0rojeHNu34Ilku1kGGk8dqDDx5eRhNZQ5nF9uTSVUijMQpBPpPYMc0ZcZ4T8pPDlfLVW3gwIelRygArbhG16Z7POmxgQmdGoUmF3ayeZ06jv1BgqaojDQd74M5I9iTyRWbhRRGFSj8pAmhCaLP5YN5O+F305+c5RpoQwgOYEfl5gc5nPmGCrf4UWUuhOpCidt5rGFQ+5x51YG4jNwgEuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/Ht+Kl0pmip4xTdoy7zVuWg02EzCciitKTl2XF5I0o=;
 b=KFipK/FGk8Z5cT8gXa0M5SwXJ1gKMTNqX9ZVE/2aqO5c+mvHCLKzE3m1BAJbMhDYekNKEgaViNsegd/JYy2FER1xo3AJty3bLAeqzEYP3rqafTqyoxNbHUp/vyFzzdNMWfCAdQhcAZLcR+FVv600UfZs2JPUsJ0bnPOMPS7h2zp7ytgJYtu7B6ojgREJ1SEnPJh+PUyctUBf51Axxk2NnsjuOZBnt7MfuBh3U4+m11N4TSD6GAqfYz7RGq+2ihoKyhBCHB30lqJEPT9Rhr0AzgimYETl7+j5Hd86rU+SIGczruayuUC2r6E3VjBuCihIyNHOqIWxv+pBRP1S76wTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/Ht+Kl0pmip4xTdoy7zVuWg02EzCciitKTl2XF5I0o=;
 b=lKbDhZMbFkXTAxGQfSYxvNKIrCYDzzxMgPEEHrrFDydGJt65kd6OB9AngaSstk68zO3Ld9GB6uVj9D3nYxNHcPpLx4vuydcqufzr7Gt/eqIOFElah5U1QefXDqN21KhOu4Sci68u/nFN0YhDfs83oFCrjpyefSSG+aDOF73CsOA=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 08:04:20 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Wed, 21 Jun 2023
 08:04:19 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [OE-core,dunfell][PATCH] cups: Fix CVE-2023-32324
Thread-Topic: [OE-core] [OE-core,dunfell][PATCH] cups: Fix CVE-2023-32324
Thread-Index: AQHZni4XJ1rNIN3lekaIXP+aOLKzA6+U8HNA
Date: Wed, 21 Jun 2023 08:04:03 +0000
Deferred-Delivery: Wed, 21 Jun 2023 08:03:21 +0000
Message-ID: 
 <SJ0PR11MB6717769519ADFAB3420CD874DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17684EF49825A362.24824@lists.openembedded.org>
In-Reply-To: <17684EF49825A362.24824@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SA2PR11MB4779:EE_
x-ms-office365-filtering-correlation-id: 3d6fdc16-6e95-495f-46f3-08db722e1df4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 j+hD14XzCZj84aNcAHrmkQtCMZH1mUVGzdU9bfcs8n3atIvhHCk6eaz8rc2h2xFen/nu7JxzohZ7A0W2pq9ldkFG5NAbXz4KZXNFGXTpKm23oZoT4yOhlfT0rW0zfZK4hrY5l8gUNUgN3NQiVuhaKMcA0BwzELkoMifhmUw5vxKU45AEoGhtVZkOBZDYta79I6PyDTcFEwGHHI0UudnS25kXz8er9pbhRbeB16Ap2pfxp1Y1eU/mCTrDWpqwGfa1LOy77ATm2u7HVriwaOHjXgDEXcv/8NFUc/HHk1uBX1mc/Q93zCBGY/OkGt/hLDFUf9fr4KM3kYpuOFLA2nUY+gRdPi8Kt3NTUIi427dPN/oGHumdBRquobZKGAIKEjK8Ucex90/vC+caqFboPUvXjU/+sG5NJ+Iop/C62sUEJo+sBlPxlLMbcuuh2noRh7P8jeso8UIpQc2VuMjqkV45h+cXwkJB1hgUZRVNHkMzjNMfhtkhtQvkZpQYp+E18xLYQh1vFqY6SzpjL7GaXVYvdssh2hAgX06dCbrNlomDmisHAT/RO7UIAHyGG2MD7lXuZlxPygVnX62AQ9YqRymwetPygaGHar8LeTnODuccE/6xWAnyI4moP0BoTStoLsDmCV+mHP4mZlMTqSPPSBWcBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(76116006)(66476007)(66556008)(66946007)(66446008)(122000001)(55236004)(186003)(86362001)(38100700002)(9686003)(64756008)(6506007)(38070700005)(26005)(83380400001)(966005)(110136005)(478600001)(33656002)(7696005)(71200400001)(55016003)(2906002)(41300700001)(6666004)(8936002)(5660300002)(8676002)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVJmZE5IZzBZRk9KRzJuTGdjWDIvZDk0RzlZc2xPTHcrdVM3dU4zZnMxalJo?=
 =?utf-8?B?TVdXVGNKZ0xhMjQzdUd5aEE4d3g2eit2eEdEMDBsVGNzR3pLY3ZnT0Vkc2xT?=
 =?utf-8?B?cEdjUCtXeG5rV2F6ZzRzUnRDb29Ba1pzZVczVWNzOWcxeXRkdGdteUc4M1Q3?=
 =?utf-8?B?UitPRm1IYy91bWdPdlpaTkFxdnlQUDZ5Y2dXYlFNeml5RHAzRGF3SGpiTzRn?=
 =?utf-8?B?MWFxeVFHanEvMjV3Vm1haVlUeHpFNitpN1hmQXhTdDkzZHc1bVFpUmxXUWVn?=
 =?utf-8?B?amxnek03VFZzQmpiUHdXZmRNcVNYYWdvUDZtWWp5cXRkTVE2dVphOXZQRTJT?=
 =?utf-8?B?dE85MXpkVHNmdkczY3RMaXlrSTg5bmhhWXpOR3p1b2xBR082RmZBUFduN1lS?=
 =?utf-8?B?K3B5cFpTcTlSTVVpaExpN2YvbjZwK2dNRjYxOEc5TUs0YU52NXJMYTlUdTV0?=
 =?utf-8?B?VGlzSkQ3K0hLaVhtQWwwVy8xZUVBdSt0NzVTRGJ3TjdiQzNKMEw3bmVqZWt6?=
 =?utf-8?B?UTByMkM4ZEI5STR1TUNXa3Z5UEZIVWVjNXVXL1M1dmpsbEo3YnVqUFBNbFQ4?=
 =?utf-8?B?bE5yMERNKzQ2NUF6RkhJQjZGYkJTTHVlbC83M3ArV3d6bmU2TFJydHlianFQ?=
 =?utf-8?B?dDlDbEJneEpHWU1jTTN6ZW9LVVNBMng1Z0FySlNhc2FvcVNkMStkbkFlcFVL?=
 =?utf-8?B?VXNic0toa01hMDdJcDNaVVVhY09LOThCUG81Z0hZTVZKdHFpdEhIeUFxcTdj?=
 =?utf-8?B?cGVEekRzN1FLRUdGK0piUHJ0WFQ0bllxZEdlN1RXUlJDTi80L29lejlEQ2Zv?=
 =?utf-8?B?dlRrRnJqY1NnaVkrbHd4Z1lUQTZuckRxSk1Sb2tvTWZkRmdGU2ZxZzJRT1hh?=
 =?utf-8?B?YU5ISmJBdEt1R2xiQXJjbStvM3JUMGxHNmI0UXlWODNvWUFuUy9lQVdYckp2?=
 =?utf-8?B?NTFRUnVmcGdTa0NHNkV5RHhpaWcrQ2xJaTNxb2grQTVmazdVeVhNcFlVRUdw?=
 =?utf-8?B?RXlTNG5zMGJxdXc2R1IxczRjK0dEVk51c3R0VDE4V0puUk5MeTFlbDl4SDU4?=
 =?utf-8?B?UWJlcW5mOGdsSDN2M2dnT2tMc1J5Si9SWlBnZ2V5ZGQrSGFPT0pWMmNMUFls?=
 =?utf-8?B?T25ydjlGSWNYSloxakM4SzNxdEJtWGVKUFB2c3dZazZVMkFTUVZDdVE0WlAw?=
 =?utf-8?B?ZGZmdWRhWXBVUGRZUlVubXBNTUFxNk56Y25zZDhtL2NkWWtpWWlmVE9JVTQx?=
 =?utf-8?B?emhqY0I4WlkxZGdUWk91YTVNb3V2dEhveDFhOEtOR1lLYnJjWHpyYlJ3TU1M?=
 =?utf-8?B?c3djZ1lrc2tuYWxCdFhIUFlIdm95UVowWHBvTlNzcGNua1dYb0t2UUlmWVNk?=
 =?utf-8?B?REoxajBXbXdhdEszR1lQS3R5L2cybDZEc1c0VXJHTlVrT3RFelFMMFowZmpm?=
 =?utf-8?B?MzkrOXhYRnpMeTlPVmdWUW8xV3ZnSzJaRkZxMEZ6ME9vbG9OcFR6c2xXR0o3?=
 =?utf-8?B?VVJXa3dJYkdydkdzTC82Z3M2RzBJbEVBQk1rMVdERE41V0M2Ri8zZjZLOVVu?=
 =?utf-8?B?VGxGcE1JaGNBR0xMZUIzbStWdHVRM2NPMFVla2dGRHUwbjJEOENQN0dZai9s?=
 =?utf-8?B?elVLbmhZa0hkd0ZHRTJBNDZrL0JvL2ttTVpNOUE4dHQrVFRzMkhUeE9NaXZ4?=
 =?utf-8?B?VXk2a05XQ3dEVHA5SWYzaVFQL3JxaDhMMTVsb0ZJbWorM1pUOWJTUUxvbDhx?=
 =?utf-8?B?SnMvRFJ0RWhwRVlIMll0Ym9xWWdKN29jVUdvaStKWjVVanRWTmlyUDQ0eHJC?=
 =?utf-8?B?U2Z3N2xIZ3dmaDR4d2oxK0kyNUJ2OFJDR0NZZnhMTDJJenI0MTVEdVJld0ZG?=
 =?utf-8?B?Y2dTc2hRazh4dTNmZTkrZ24zTEJjaDJ4aTQ2aEUvV2tGQTVSK0hQcFNHRWVn?=
 =?utf-8?B?MmRSakhaU0FxcXlvOG1GR01jMnhMODVwN3h4N29FMzBmeVhicGFHZm9yVGVs?=
 =?utf-8?B?c1JDbXQzV0pOaGMxWlVKSk1qd1JES21pRERkRStjaVdxUjB2cGViQjIvcnRl?=
 =?utf-8?B?b0JHUVFIZjRXS2pHSlp3K1owZVFOTlNMTDZQL0RzUFQ3cHcvYlhRcHZFU3hp?=
 =?utf-8?Q?BJlfLmLYm+3GKiBeYXH8z1E/h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6fdc16-6e95-495f-46f3-08db722e1df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 08:04:19.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjL2PVxiBqfSkWF51mT5rk9jQvPoJ+QULzuJ+DH27qdWBqs4IsqH/7NIcStMdnOr0opJouP2nFHWVT35Ahc5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183175

SGkgU3RldmUsDQoNCkNWRSBmaXggZm9yIGN1cHMgcGFja2FnZSBpcyBhY2NlcHRlZCBhbmQgbWVy
Z2VkIG9uIG1hc3Rlci4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVk
ZGVkLWNvcmUvY29tbWl0L2E0YmRiYzgyZjdlNWNjOWE1Y2I2MDNjYjcyMGYwOWIwMjE2YjBhMGUN
Cg0KSXMgdGhlcmUgYW55IGNvbW1lbnQgZm9yIHNpbWlsYXIgZml4IG9uIGR1bmZlbGwgYnJhbmNo
Pw0KDQpUaGFua3MsDQpTYW5qYXkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBTYW5qYXlrdW1hciBrYW50
aWJoYWkgQ2hpdHJvZGEgLVggKHNjaGl0cm9kIC0gRS1JTkZPIENISVBTIElOQyBhdCBDaXNjbykg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNCwgMjAy
MyAxOjA0IEFNDQpUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
Q2M6IFNhbmpheWt1bWFyIGthbnRpYmhhaSBDaGl0cm9kYSAtWCAoc2NoaXRyb2QgLSBFLUlORk8g
Q0hJUFMgSU5DIGF0IENpc2NvKSA8c2NoaXRyb2RAY2lzY28uY29tPg0KU3ViamVjdDogW09FLWNv
cmVdIFtPRS1jb3JlLGR1bmZlbGxdW1BBVENIXSBjdXBzOiBGaXggQ1ZFLTIwMjMtMzIzMjQNCg0K
T3BlblByaW50aW5nIENVUFMgaXMgYW4gb3BlbiBzb3VyY2UgcHJpbnRpbmcgc3lzdGVtLiBJbiB2
ZXJzaW9ucyAyLjQuMiBhbmQgcHJpb3IsIGEgaGVhcCBidWZmZXIgb3ZlcmZsb3cgdnVsbmVyYWJp
bGl0eSB3b3VsZCBhbGxvdyBhIHJlbW90ZSBhdHRhY2tlciB0byBsYXVuY2ggYSBkZW5pYWwgb2Yg
c2VydmljZSAoRG9TKSBhdHRhY2suIEEgYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxpdHkgaW4g
dGhlIGZ1bmN0aW9uIGBmb3JtYXRfbG9nX2xpbmVgIGNvdWxkIGFsbG93IHJlbW90ZSBhdHRhY2tl
cnMgdG8gY2F1c2UgYSBEb1Mgb24gdGhlIGFmZmVjdGVkIHN5c3RlbS4gRXhwbG9pdGF0aW9uIG9m
IHRoZSB2dWxuZXJhYmlsaXR5IGNhbiBiZSB0cmlnZ2VyZWQgd2hlbiB0aGUgY29uZmlndXJhdGlv
biBmaWxlIGBjdXBzZC5jb25mYCBzZXRzIHRoZSB2YWx1ZSBvZiBgbG9nbGV2ZWwgYHRvIGBERUJV
R2AuIE5vIGtub3duIHBhdGNoZXMgb3Igd29ya2Fyb3VuZHMgZXhpc3QgYXQgdGltZSBvZiBwdWJs
aWNhdGlvbi4NCg0KUmVmZXJlbmNlczoNCmh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWls
L0NWRS0yMDIzLTMyMzI0DQpodHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFuLm9yZy90cmFj
a2VyL0NWRS0yMDIzLTMyMzI0DQoNClVwc3RyZWFtIFBhdGNoOg0KaHR0cHM6Ly9naXRodWIuY29t
L09wZW5QcmludGluZy9jdXBzL2NvbW1pdC9mZDhiYzJkMzI1ODkNCg0KU2lnbmVkLW9mZi1ieTog
U2FuamF5IENoaXRyb2RhIDxzY2hpdHJvZEBjaXNjby5jb20+DQotLS0NCiBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYyAgICAgICAgICAgfCAgMSArDQogLi4uL2N1cHMvY3Vwcy9D
VkUtMjAyMy0zMjMyNC5wYXRjaCAgICAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKw0K
IDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoDQoNCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jDQppbmRleCAyMWM1NmUxNDMwLi5kNmU3ZDk1ODAw
IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMNCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jDQpAQCAtMTQsNiArMTQsNyBAQCBT
UkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9hcHBsZS9jdXBzL3JlbGVhc2VzL2Rvd25sb2Fk
L3Yke1BWfS8ke0JQfS1zb3VyY2UudA0KICAgICAgICAgICAgZmlsZTovLzAwMDMtY3Vwc18xLjQu
Ni5iYi1GaXgtYnVpbGQtb24tcHBjNjQucGF0Y2ggXA0KICAgICAgICAgICAgZmlsZTovLzAwMDQt
Y3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaFwNCiAgICAgICAg
ICAgIGZpbGU6Ly9DVkUtMjAyMi0yNjY5MS5wYXRjaCBcDQorICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMjMtMzIzMjQucGF0Y2ggXA0KICAgICAgICAgICAgIg0KIA0KIFVQU1RSRUFNX0NIRUNLX1VS
SSA9ICJodHRwczovL2dpdGh1Yi5jb20vYXBwbGUvY3Vwcy9yZWxlYXNlcyINCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTMyMzI0LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9DVkUtMjAyMy0zMjMyNC5wYXRjaA0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLjQwYjg5Yzk4OTkNCi0tLSAvZGV2
L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvQ1ZFLTIwMjMtMzIz
MjQucGF0Y2gNCkBAIC0wLDAgKzEsMzYgQEANCitGcm9tIDA3Y2JmZmQxMTEwN2VlZDNhYWYxYzY0
ZTM1NTUyYWVjMjBmNzkyZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQorRnJvbTogWmRlbmVr
IERvaG5hbCA8emRvaG5hbEByZWRoYXQuY29tPg0KK0RhdGU6IFRodSwgMSBKdW4gMjAyMyAxMjow
NDowMCArMDIwMA0KK1N1YmplY3Q6IFtQQVRDSF0gY3Vwcy9zdHJpbmcuYzogUmV0dXJuIGlmIGBz
aXplYCBpcyAwIChmaXhlcyANCitDVkUtMjAyMy0zMjMyNCkNCisNCitDVkU6IENWRS0yMDIzLTMy
MzI0DQorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCANCitbaHR0cHM6Ly9naXRodWIuY29tL09w
ZW5QcmludGluZy9jdXBzL2NvbW1pdC9mZDhiYzJkMzI1ODldDQorDQorKGNoZXJyeSBwaWNrZWQg
ZnJvbSBjb21taXQgZmQ4YmMyZDMyNTg5ZDFmZDkxZmUxYzA1MjFiZTJhN2MwNDYyMTA5ZSkNCitT
aWduZWQtb2ZmLWJ5OiBTYW5qYXkgQ2hpdHJvZGEgPHNjaGl0cm9kQGNpc2NvLmNvbT4NCistLS0N
CisgY3Vwcy9zdHJpbmcuYyB8IDQgKysrKw0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspDQorDQorZGlmZiAtLWdpdCBhL2N1cHMvc3RyaW5nLmMgYi9jdXBzL3N0cmluZy5jIGluZGV4
IDkzY2RhZDE5Li42ZWY1ODUxNSANCisxMDA2NDQNCistLS0gYS9jdXBzL3N0cmluZy5jDQorKysr
IGIvY3Vwcy9zdHJpbmcuYw0KK0BAIC0xLDYgKzEsNyBAQA0KKyAvKg0KKyAgKiBTdHJpbmcgZnVu
Y3Rpb25zIGZvciBDVVBTLg0KKyAgKg0KKysgKiBDb3B5cmlnaHQgwqkgMjAyMyBieSBPcGVuUHJp
bnRpbmcuDQorICAqIENvcHlyaWdodCDCqcKgMjAwNy0yMDE5IGJ5IEFwcGxlIEluYy4NCisgICog
Q29weXJpZ2h0IMKpwqAxOTk3LTIwMDcgYnkgRWFzeSBTb2Z0d2FyZSBQcm9kdWN0cy4NCisgICoN
CitAQCAtNzMwLDYgKzczMSw5IEBAIF9jdXBzX3N0cmxjcHkoY2hhciAgICAgICAqZHN0LAkJLyog
TyAtIERlc3RpbmF0aW9uIHN0cmluZyAqLw0KKyAgIHNpemVfdAlzcmNsZW47CQkJLyogTGVuZ3Ro
IG9mIHNvdXJjZSBzdHJpbmcgKi8NCisgDQorIA0KKysgIGlmIChzaXplID09IDApDQorKyAgICBy
ZXR1cm4gKDApOw0KKysNCisgIC8qDQorICAgKiBGaWd1cmUgb3V0IGhvdyBtdWNoIHJvb20gaXMg
bmVlZGVkLi4uDQorICAgKi8NCi0tDQoyLjM1LjYNCg0K

