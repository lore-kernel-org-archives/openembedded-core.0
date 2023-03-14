Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D405C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 00:49:28 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.2548.1678754960992581777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 17:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=P9p+Za8g;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1678754961; x=1710290961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jolUV4n9bdKfSmRjYsDDlmcK024MZdwo87Sv469lHZU=;
  b=P9p+Za8gH5cRsOqWPdyu3KWbIKsz0CNcNQmF7qNtUgSzu8C8+LaH6/AV
   TuIJDWSlR7kXsNmcdjcDbVYlkd1UMmkCi/wTJ0PiJVWg8xs11WMLXw1h5
   gmTW2PrLkWkriEDluQokwrtqTZY7zcfwc4KVg03/tLwkSSQPuT7rzu5dW
   Dwx+i21jX+D6+nEK4Fnb2gTawEnZpjhR2IbdUS4+1u6FSV5k1gVWaL5xe
   ggYJn//Zz2JG+levFoKV9ZWF0Ueziti+G97J7gQB46y73IfWgeP7IYItO
   R37oKWMhwaDsCE/aKAqzdBpgmYV6HmncrZC7pg4q+FElr43vYslvig/Rt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="87268358"
X-IronPort-AV: E=Sophos;i="5.98,258,1673881200"; 
   d="scan'208";a="87268358"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 09:49:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdR7CIVhQVJVA7te6IBovPWdzuW7fLzsT8vSCE+xAIKDYB/9ozChu0c8Z50qmF7XWW9Rk5rjCOlyZFWgz0N/1unPawzo1Cj8EJ2ZFL0STCDzo3tFoO3THl9hA4xfQjIvUzWQ4kNNVfR9DO6GU70G5MgSSdPPlAMRlmgFR2fZdse8vWpQK50kiKt5RuswGFNnUtqYVAsKNvbD4fZ6hQ3Fm/SeaSySTWnQzrmLI6I9seXTivX9NWmSqm5JtefMB2+Wv0z8T+tSlo66Z1BAHj13AddrQWvMEgjt0FQiUU/aQey3SkCjeezbq0HGLJz5mbpHAMBUdYhoZqmOmyD9rHxkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jolUV4n9bdKfSmRjYsDDlmcK024MZdwo87Sv469lHZU=;
 b=XHO0w4DAUx1vqNMq//JrnC+1lp9bNSK/SYh1rDb8YIjuOf2hrMV1ig5Gwqe7S/+zEGOz5VXoF2ss/yXB+nOxzMzBUJ7GGdLhiDMwP+ggeiJw2umHmBAcWseLr37maerrC7yLWriCfCROCN2Tg6C9lEfp1krVDwZznQWI2jWhgwlBMAsQUrqYjV5xMt9YCtmGwBxyzNwNdQ+EWYeL7kqk9utCtwJ/NAfMWUCSP8fka3NUFs/x7JRN5TwgReRtlgL1urM0mBFLloJOnLmPRMyytD+FLA597zv3ii515ArQN2ipxC1dEOCZo/xXoXYylRe1wArezC3RzrFWx2E97i8IyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYWPR01MB10996.jpnprd01.prod.outlook.com (2603:1096:400:394::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 00:49:14 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 00:49:14 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
Thread-Topic: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
Thread-Index: AQHZUV8DbGSLjGaCO062gUVFv+D43a7wm+gAgAe7H4CAAAcrgIABHE3w
Date: Tue, 14 Mar 2023 00:49:14 +0000
Message-ID: 
 <OSBPR01MB18457B80A5B04BB8024B8F08DCBE9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
 <1678239619-21210-4-git-send-email-wangmy@fujitsu.com>
 <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
 <OSBPR01MB18456733D9BEA9717A0DFE45DCB99@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CANNYZj8LM7xWvqVJeZBqcOO=YTjx6008mTpoEp-gHxZnNm28Kg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8LM7xWvqVJeZBqcOO=YTjx6008mTpoEp-gHxZnNm28Kg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OTZkNDI0YTUtNGMyYi00MDQ0LTllMTYtZmNmNWFkOTA5?=
 =?utf-8?B?NTY2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMy0xNFQwMDo0Nzo1N1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TYWPR01MB10996:EE_
x-ms-office365-filtering-correlation-id: 7dcdba9a-1461-4f45-9f3b-08db2425eef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ++uVxLHMMoDgaxGKStOmn1n40NuaVu+B7kFWkQoftVq/uO6axQFvVQaKJSTigAaLXPSXLW4HvjD7Aqa/tZRK/Rlhu18F6tF4e9/8Y05BQm68V7vMvZCGLIxjlB17NLjDZrek4YugIfmF8MDed4RDZgaaA08tHp0fxVZGgk8QQjAYeif1C50RN1GDSSnulYrpVeFnTJzJJ/wKeF7aNEp6Md2BmQ2mvltGCbz4FDCtRnFI1f9JF9PhVKQtB3jN1lKuwCEx2xg5CTljfmGZYdJme27//aE+KTWucG5t+xivjStJEoePYd5aNnYrn5YFUITRO82CmRvjFecvacDtEeFccCFQx+cM4RbHggbgnQmRdoLRDaOdu75pilbHXLTDm/PrgJvvyRHCrpjmCJTl6Ohcaym9CDegf1a344gzwdA3VuqmjjiGemvlRRMIyMPu21J+z6xlEYWVmahNV/37yJgKlQak/v8ZpZpbDfoF0mO1XWysiMh6GpSB58ii+u/o8sF6tridEnjYYHu6ImKofsKvXNDV10QwhV5IGdkzHpcHETZ5yWQtM7WZE9/9XjbJC4SbojSJZO0OJYhVYgSAMRuhlU9iQPHvXtSb2ZiloCJLY7naDRDSpsf+NKHZ3bCeJG7WKnpKLRixRIL9qB7TiYsC4zxg3xBzWOORsA+ych4OGamw3bJFVLvVlLA7Q+DzAbt47p1KfmKaYT/kepbhS/ZgqX+rKCxWWle0fdhlXE5h5+Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199018)(1590799015)(86362001)(1580799012)(478600001)(5660300002)(9686003)(71200400001)(55016003)(966005)(85182001)(33656002)(7696005)(186003)(26005)(53546011)(2906002)(6506007)(41300700001)(38100700002)(82960400001)(122000001)(4326008)(6916009)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(8676002)(83380400001)(52536014)(8936002)(54906003)(38070700005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWZ6cGxWTWljcEw5RmM0Z2ZydmdxeURQMyt3bS96cmJ0YWR6ZGdIbUx1MFRG?=
 =?utf-8?B?bWNFaHFScFk4OTVjTndsS2VTMzdDbkRhZk1kV3NlN2NmaGp0WmxyampJZHpa?=
 =?utf-8?B?T2lmQVRWNGdNeU1wN2cwQUVkREdWbk5GT2xYdnRId0lmSDIzUThZaUFVNjZT?=
 =?utf-8?B?TU9ZVHJ5eW52RW9QTmpZNjF5ZXQyK25xcW1jQXhYdWxGK2tGbzNzNHZSNW5R?=
 =?utf-8?B?STlOdkRZNWZ2SVBpNXZXTTQvR3dhNCtEQnhFSnhXcWFGQ2dQc2pMdnIzTDNk?=
 =?utf-8?B?LzZJclFneWtCTE1TUjA0c01Bd0EzVGh5bWxtWHhJLzhrQVUvUHgrRlFReUVO?=
 =?utf-8?B?WFdqQ0V1SFF6UFZyT09ublJnNzJUZlBJMk5lcGlpMzRPZGZ2NEtLZWhHOXlw?=
 =?utf-8?B?YzRlN29HdnE1aGdLZGsxNXAwQnlmZmJhamdtTVIwdE93V3dFME50RnhmbW9r?=
 =?utf-8?B?dUZva1BwN2Y3aVFnQ3MxcTVJMFMvSjJYVDZ6ZStpN2NOYmp6V25oVHhZUjVC?=
 =?utf-8?B?TERmeE5HVG1ZRWdkcGNyTlZyM3Eva0NaSTVhMllzQ1NxUU1IeTFjcFpPa1lD?=
 =?utf-8?B?Q2VydW5oVmpkc3MweXFrUnhtK1duWUs2Ui9FakFHK0NvWGZETmx6ejZNS1NB?=
 =?utf-8?B?QWJhcnF4QmFNby8wNTliVTY3SWlyWEk0UUErS1RCQW1KLzREb3d0RTFobW9x?=
 =?utf-8?B?b0lFeWxhVG1oVDAwcHJaTzhyd2FYcnFlbEVPWGR0aW1FQmV2ZHhOWDJNdDNV?=
 =?utf-8?B?RFFjNnF6Y0ZoQVlnTEFYdGk5U0pmWFVqK1hKbGpuYlhLZ3lZVFpCd3pIY0tI?=
 =?utf-8?B?VkJKSTFmNGJzR25NR21JSGVKSTNYMmNDaUVwUE9jSVZDZDBLbFdQdm55bDY3?=
 =?utf-8?B?S01uZDV0YjBGWTExR20ydy80QzNuU3ZEaFdWNEMweXB4WHJGcDNJK2FCRDVw?=
 =?utf-8?B?Y2lySkhwUG9RTkxRYTdpRXFFRWN3RG1Gdys0dHVldU5NSGg1TjNsRyt3Ny9w?=
 =?utf-8?B?STJEYi9JZzFNa3M2ajB3bWxWb0J3UFBQdmVsUm8xL3A5ZHRNYTcyTmhMdTYr?=
 =?utf-8?B?dGFIa2trTXRLQ1YxTVlZZnJZanluem96OUZxb29IWGNBN1l2SS8yOEFCWTJz?=
 =?utf-8?B?ditIRjhWMjUwMktZYWVyMGJVdXJDUXRJR0lObmNHQTJlc1BLZ21PaVVZdFBi?=
 =?utf-8?B?cnZUd1k4NDhqWlQzNURWWGREQVB4STg1b1hUcXhVL1lmVXcwb0hxT0JzUk52?=
 =?utf-8?B?OFpUV3M2Uk1kSk1uVGdXOUsrNyt6RU1KWVpYZFJCaW5HNmVZdXdncWhWUlYy?=
 =?utf-8?B?MS93Zi95elMrNFkrTWdKbWpnM2ZMNDNMS0pRc0c2b2c2dGhOTUhqZDh4K1ly?=
 =?utf-8?B?WkdTVU5Ld3dicVh1NEFLaHVGNWExdkM4UjZjd2N4bUZPUTV3cXpWREV2T0ho?=
 =?utf-8?B?dG00Z3ZyRGUwODlJMzJ4QTlYWWZUaDkxK0lza3NWaTA5ZnV1REJ3Uys1REV0?=
 =?utf-8?B?T3BjVDVGRngyK2Jja1hDV0V2WjNvZWVmTTBLMGQ4TW8wVVN2NGxBQlFWV290?=
 =?utf-8?B?Q0FoL0JrdkZQOVRVNER6K0Y2NjhvbE5yaW40RVpIVkZ3aUYya1htWVl5dGtR?=
 =?utf-8?B?elFSd3BYN2RKRjhsMHNkMlVhU2x0OVFlNGlxaDMzaG5QTFR4ZTBxM0hMeUZI?=
 =?utf-8?B?WE12VTk4ekZ0SWNMOU5HbkV2dzlzdGFpU3hFbGNDM09rcllvNHd1ZXNNSm44?=
 =?utf-8?B?ZkdtWGxqcGZFck5lWlpoaE9xWnVHdHZ5Yjd6MWVkWE14bDFVNzFpbys0N2V1?=
 =?utf-8?B?TEU0dDB1Uy9rQ3dYZ1NpOHNwK0RvbEFxQ2pFbWtqUWdoNUdnWjkzcnA3QkJY?=
 =?utf-8?B?U3JILzRIQnpyUUJLUVVtQWJIeG85TzBVT0tSYTByVHJYWGt0SzFZTmpZZ09O?=
 =?utf-8?B?YnBhb1htYXZza014U2NjdjRoOHVna0VDaDdMQW1qN0JpeEhjMU5Tb05BclFw?=
 =?utf-8?B?d1Y1ZU1FU0xiTWhoZkhlRXlBM1QzbGRvRHc4dkhSRU56ODZCVzVFZ1VnQUVi?=
 =?utf-8?B?R1J2eXUzS1diejJyRGszSzVjSkdaL3RIeUpFakNCSUlPSlV4THpWOVBFWS9a?=
 =?utf-8?Q?DF7msvPej7vBLTITPlp4+aZ7B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gyM68W1Lc49y6fWyc6txO2IHgkq5ZphHTvn+4M4cvok9ONsuhDbdsfBCVDiwjDk8py+0NOshYRITEzoqsmYm75ofnVcZ+oQm39eJ/MRojnNMKR7E4H9egAQTqdB2RJYagkJtkBMPTsL1EeWc1JMrtKsPCegXx8ekTngecfsIJktfgOhRPlpmgPRy5TH9MO7XlE+UIcTPTbd9+vDpyUuxH5+MV9gdmqs1iNBRor93x9OlMZlhjFi9286eQ3kSDSbIuxnuhC2DODdtgwDsXvzF3dVDoGcGrNfbGsHPU1oG1x2+0kXX17oesv+VuUa3WYfrzPUi0xfZgW6GK74Gf4svuQRP7jllgJomdTV7L8arFtsJV86NSep3VO6ih+AtVWRKNjlAYH/zobxHuw0xAog+oGgMsQZLrQ7T+JVGxed0KZFEZ72ecGcK8UW2Aq8O5hFKUc4dZnxAqEypS85OzhWbw/lNRf97APg4CjDptvsnTzBJWJB9EKOywWT7YiGfCpumdtKHsjK8wWMeEQtQHzTO7qA+UwpP2FIO4dZ7G6A0cammUI7/Kgop1MDwnHIJGkI/DiP+YjV1NVHe9QfZ6YQDdQW+4VMvQin91Pk6rTqz8hltCuL9YmhuWF1CdgzkF2M5tAM+UgvRQ/KH8JH8rMJlfVeIyiwomdntY79UhH0ZnxIDx7EiTimz+D7KpI0Ri9sn+NQyDjRmnG5wnCZw2UgIjX5g8Ga1K99BdX9bhvReRGqG5dEP480RvtVAxklxw812aldrqQWVA8oeYdQSh5ZC3qfphwXpcNOEWX66QW1ltvBi/IUR0Lm+tw8v2KBT7MqqwzHe9wFt4IKLLv9tIjBB14ziD0JLLFSfeWe15tgc4ExrOKrcO76ivB6EE9d4iWKr
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcdba9a-1461-4f45-9f3b-08db2425eef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 00:49:14.4274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x88tsBTtGrPENfPOtPA+K88yiE13yn25J9tq4cnpTMSAzQKnmpOL4v7tvGZFB/jApZgLvSxZeKztcU20wQQRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 00:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178472

bGlieGNiIG5lZWRzIHRvIGZpbmQgdGhlIHB5dGhvbiBwYWNrYWdlIGluIHRoZSBwYXRoIHNwZWNp
ZmllZCBieSBweXRob25kaXIgcmVjb3JkZWQgaW4geGNiLXByb3RvLnBjLiBJZiB0aGUgbGliZGly
IGxpbmUgaXMgZGVsZXRlZCwgbGlieGNiIHdpbGwgcmVwb3J0IGFuIGVycm9yIHdoZW4gY29tcGls
aW5nOg0KfCBGYWlsZWQgdG8gbG9hZCB0aGUgeGNiZ2VuIFB5dGhvbiBwYWNrYWdlIQ0KfCBNYWtl
IHN1cmUgdGhhdCB4Y2IvcHJvdG8gaW5zdGFsbGVkIGl0IG9uIHlvdXIgUHl0aG9uIHBhdGguDQp8
IElmIG5vdCwgeW91IHdpbGwgbmVlZCB0byBjcmVhdGUgYSAucHRoIGZpbGUgb3IgZGVmaW5lICRQ
WVRIT05QQVRIDQp8IHRvIGV4dGVuZCB0aGUgcGF0aC4NCnwgUmVmZXIgdG8gdGhlIFJFQURNRSBm
aWxlIGluIHhjYi9wcm90byBmb3IgbW9yZSBpbmZvLg0KDQpUaGUgZmlsZSBjb250ZW50cyBhZnRl
ciBkZWxldGluZyBsaWJkaXIgYXJlIGNvbXBhcmVkIGFzIGZvbGxvd3M6DQpAQCAtMiwxMCArMiw4
IEBADQogZXhlY19wcmVmaXg9L3Vzcg0KIGRhdGFyb290ZGlyPSR7cHJlZml4fS9zaGFyZQ0KIGRh
dGFkaXI9L3Vzci9zaGFyZQ0KLWxpYmRpcj0vdXNyL2xpYg0KIHhjYmluY2x1ZGVkaXI9JHtwY19z
eXNyb290ZGlyfSR7ZGF0YWRpcn0veGNiDQogUFlUSE9OX1BSRUZJWD0ke3ByZWZpeH0NCi1weXRo
b25kaXI9JHtwY19zeXNyb290ZGlyfSR7bGliZGlyfS9weXRob24zLjExL3NpdGUtcGFja2FnZXMN
Cg0KIE5hbWU6IFhDQiBQcm90bw0KIERlc2NyaXB0aW9uOiBYIHByb3RvY29sIGRlc2NyaXB0aW9u
cyBmb3IgWENCDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERl
cHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNU
KSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUt
ODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJ
TDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTMsIDIwMjMg
Mzo1MCBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCBWMiA0LzVdIHhjYi1wcm90bzogRml4IGluc3RhbGwg
Y29uZmxpY3Qgd2hlbiBlbmFibGUNCj4gbXVsdGlsaWIuDQo+IA0KPiBPbiBNb24sIDEzIE1hciAy
MDIzIGF0IDA4OjI5LCB3YW5nbXkgPHdhbmdteUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4gV2hl
biBsaWJ4Y2IgaXMgY29tcGlsZWQsIGl0IHdpbGwgcmVhZCBsaWJkaXIgZnJvbSB4Y2ItcHJvdG8u
cGMgdG8gZmluZCB0aGUgbGlicmFyeS4NCj4gPiBJZiBkZWxldGUgdGhpcyBsaW5lLCBsaWJ4Y2Ig
d2lsbCByZXBvcnQgYW4gZXJyb3IgYmVjYXVzZSBpdCBjYW5ub3QgZmluZCB0aGUNCj4gZGlyZWN0
b3J5IG9mIHRoZSBsaWJyYXJ5Lg0KPiANCj4gV2hpY2ggbGlicmFyeSBpbiBwYXJ0aWN1bGFyPyBD
YW4geW91IHNob3cgdGhlIGVycm9yLCBhbmQgdGhlIHBvaW50IGluIGxpYnhjYidzDQo+IGNvZGUg
d2hlcmUgaXQgaGFwcGVucz8NCj4geGNiLXByb3RvIGRvZXMgbm90IGluc3RhbGwgYW55IGxpYnJh
cmllcywgYW5kIHNvIHRoZXJlIGlzIG5vIHJlYXNvbiBmb3INCj4geGNiLXByb3RvLnBjIHRvIHRl
bGwgd2hlcmUgdGhlIGxpYnJhcmllcyBhcmUuDQo+IA0KPiBBbGV4DQo=

