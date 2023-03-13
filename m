Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091C7C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 07:29:33 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web11.14439.1678692566091090814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 00:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=C78GA5Fn;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1678692566; x=1710228566;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1AmbxFX/lCVVVn3hUn8MsgT9O5rVP4lr30sJWkY9Q9M=;
  b=C78GA5FnfpxTzorll2VgFIZTaJKuJb7ycJilMHUF0ZPjcW4aGufBjxNO
   Xv3Aepdn5NrRciUZr/yiyj5jSyAYZjGGZ5QI8cbWGE8DowNC8zZTvEuKR
   wiX+77vgeXpIKTzlbTwGTMuCzE+bs1c87Do+78tBEDMioNlRSEyW7YNpq
   WKQthbo3tFHtDigRwMPgLPJJwqi4qtOR8CgD4bHpPrzC4N9gLBxyXBW10
   xCuFIMLR2Fc7rVSWwi38Y0Qd3DzEUBtud+zXh/SBoA9ckLSQsOKxC9azK
   6HDEttMYCwBZme8N39NTLQ71x1iUB16ETYtpyZVU+sV+rrfz4sttDofQp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="87386016"
X-IronPort-AV: E=Sophos;i="5.98,256,1673881200"; 
   d="scan'208";a="87386016"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 16:29:23 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXMi0PRy25rJwSkYU5DHIkbeB6WH+1z3MEZZZqLaeaINPHzOaJzKms8p9wa2hrr5OngTSphhAN6b7xvn0ik4d2+Fh5EwSQYhFQuqk5xSaEg5vRMRAQS0eNXg1ZFFtg+Y9GddSMgFBQ1PkGjwDyVNoReTpRyk1JDPLNDP5fuwrg7XR3Z7Wri+WSRV9ljH412wYijxAV1qu6DevEBd9U1dQs1cz2xXfHq2CYoYpvCJRCws87GSQjVafcVVk8I7W4K31PxuSj6UiXbMsOmhbwA0rYxqag2kTcyWxkfoqNmhEtWUfp5VMC9NwIGUjsLzi129YMfESzE0c/ksC39TFifOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AmbxFX/lCVVVn3hUn8MsgT9O5rVP4lr30sJWkY9Q9M=;
 b=VwVNZDw9HZseQFiEilZdG71u+b+HEe1uA3zV1w9bEhZ8StN9bGyO1D60DsNUSh6f20TQ4rQzGBOn7UxHXXLXFkDfWDc+MYyX6w+Fgd59QctpT7e2myziK9XSNqZVlO67foVOMxhC3ygK+bLlEQNecHSc1S4LqxRWPrbvIO7SI/BIWtl1WTC57fYaGB8H4SVE3Sl/I9RR8KGxmGi0VabOPJRruU6kGVIFxBrZkU+I1ylEOi6LUkBvpbpT8ggvkmPOCrK4CskVp8nv12TyAwreHySSPnQIIunBnV5qdDImeBoVt2+Sb/8yYUkA3GF5QGoEZR9Cppo3JXcCjN9bpLQ/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYYPR01MB10513.jpnprd01.prod.outlook.com (2603:1096:400:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:29:20 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:29:20 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
Thread-Topic: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
Thread-Index: AQHZUV8DbGSLjGaCO062gUVFv+D43a7wm+gAgAe7H4A=
Date: Mon, 13 Mar 2023 07:29:20 +0000
Message-ID: 
 <OSBPR01MB18456733D9BEA9717A0DFE45DCB99@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
	 <1678239619-21210-4-git-send-email-wangmy@fujitsu.com>
 <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
In-Reply-To: 
 <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YjhmZTE3NGEtMjI1NS00MDJlLTk1YjYtZjE3OGI2ZWNj?=
 =?utf-8?B?ZDcwO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMy0xM1QwNzoyNDo0NVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TYYPR01MB10513:EE_
x-ms-office365-filtering-correlation-id: b9ed0a03-6402-4daf-14fe-08db2394a915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7BpSLSmX5/BWXEjFfA07jq3eEFZ6j9sdy4sfY9x/rYx1RGgnYNDxozsuwWIqxW1RmvpIJIYcW8sjJg8nxbHlNflkbSmBy8qwTOCzX2k7ps++CGKAvM4dWpR+JfQYVQC5TogM8bGLekfG9hdyc1b2p68YAQlU1foB3gh+8S6irnAI2K0HsDTYEhzdN0VY6CrrlAD24Xee4KWSaSiB30m1YQ9UNfHxh2gF1EGBV+/9hynfQEzF7IWgwp+NDcCPx/AEPgsCv7+CRUx4acsDPx18ZAs49YXP7h7HT3vIRE/MX90F0y8ykKZyIX3xEpWyaYraJ+TvNykJKaOZawpj3G8RTvzBBEaOh4VLg8vdg37Qbl9VFzIwqW6rx6pVBwNCg6R2sSo0xns8iN/l5ThGn5SUC12NEZk6i9trMl+AUnO+qAFa/YbcybtjDBqdvEKsMh2TYn7F8z6eb2GPr24az7YYFhVXjW5XXZrihqID5NKemgcE/7TRWLUjSfRB3uymdHJkEZhn4MC0MofnnT//9iwrZ7kNCRv2avt9JKkMrqiR7AKxMh4phse7NokLQpv5i9ry+AjPeKb/tOoHe74rDYQxuonYrBoHyyUaIrcfBH3UyzJA8EFne9wdT8sBdXtGkzU1R05IAVTSAW1m15v7bR/VDhE5M3qAPvwhLbRdmNpfnbmIZCdamRh4sTv68QkBTEVR6MYyL0eROEeKgwtdS9a4pw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199018)(1590799015)(5660300002)(85182001)(83380400001)(186003)(478600001)(6506007)(71200400001)(7696005)(966005)(26005)(53546011)(9686003)(38070700005)(66476007)(8936002)(76116006)(66446008)(66556008)(66946007)(52536014)(33656002)(8676002)(64756008)(55016003)(86362001)(110136005)(316002)(38100700002)(41300700001)(82960400001)(122000001)(2906002)(1580799012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ODVkTDFJeTF2NlA1K0xrV21CVU9sOXZUM1lQSG11WnprRnlMQjl5MHZiYmNO?=
 =?utf-8?B?T2F1cGdBODBYRzNnQUZnQlZjalFGQkRuZ2srN0Q5VU1YMVE5VXlYdk5OR1ps?=
 =?utf-8?B?UEZlbFBQVjFuTGxvK1E3cWh6OUpQNWNKeVVob1VxOGRIMUdldlFFUFVqcDRV?=
 =?utf-8?B?Zy9hdWdEaWFidWdoY2wvdG0wdWpUdE42Nk45OENZZEw3THZybUJwTXNxVHhi?=
 =?utf-8?B?ajBSbURpN1dkRmcycjRVQUo1aWpDaDdjT3VNdWhPejhQeWdSd1VXV0tBazVt?=
 =?utf-8?B?Q3BQeHY4Ym1LZHk1ZlFtS3o1Y0VkVHlDRTlmL1ZZUWdjT29TbUlnVFhhTUho?=
 =?utf-8?B?Nm5kSnJzclZicHpIUWE1MkhrZ0dXVU5sTXkya3o1dGZuNnEyd0c2TnRHWVgz?=
 =?utf-8?B?OFEvMHJIbkVzKzU0azVZeEN5RmVzL3hReEFPTGRyTm13VXVVK3pwOEhzLzMw?=
 =?utf-8?B?TUQrMkltZndpamNlOExRT2tNZWF0a1pzeWNqWU00bjhMdEhZZ1dwMTg5MVNN?=
 =?utf-8?B?U1MzZnBvNncxVW5lMWk2REI5Y0hYZnRwZ0FaQkU5UWJNa3NKdjE0S2FTOHRT?=
 =?utf-8?B?Tkh4T1JmVC8xczZSZlpvanEzTjNtdDJxb1l6TUhQUEs5b2dES3pReHd4bC9D?=
 =?utf-8?B?VWp3QWVpQkNjenFqQ24xUjFtZXJaNGNRNUQ0THFNbisrSlR3MUEwSTZiQ0ZG?=
 =?utf-8?B?a29wOGpyS09YbnBoeHRTY0dSV1g4TjVMaEpDVWRVNkZKODRHTzRaUnhzb3hk?=
 =?utf-8?B?aEwvVXRFUjY1ZHNhRXMzTzBTY1ZGZU52ZkpjSlNvUjNSWEhGTDNRdXBjbkZY?=
 =?utf-8?B?VVBLTjhiVi80VzFkMlBzcG9peWt6bmZrbkt4TVNQNUVpZC9jVWVpVEhGWGhk?=
 =?utf-8?B?QnBjME9ZYmtoN0JrZ2ZmWWk5L29QU2xhUGxHWlREYzlOOGwrQVZPREsxcXZi?=
 =?utf-8?B?MTJtS3lCaXdQNXhtL2piUk5iSUxraG0wdjRvZ3ZaV0NMYWlMVm1xbGZvL0li?=
 =?utf-8?B?NmR0d0haZ3FpOEZxSXpmd0JLZGY0OThwd0ZoUVBmUXFkQUZpSUFtaURha1Az?=
 =?utf-8?B?akZZSW8yeWVlU2xRYnJCNmJmYkZmMmRtNE5iMk5jbHdtT0I5S0RsSWI4anhL?=
 =?utf-8?B?d0hiQ1E4WHVPM3A2NlR2NnJoV3p1WWFWRi9tOUs0ZmFUNnNBU09SY3V5aisz?=
 =?utf-8?B?RlpqU3pESjRDY2RESUo2dFVzeDJtZXpGRWl6bm9teDBqYnpNUm1EdVNKS2xs?=
 =?utf-8?B?bzBkR3k3b1JiNnJ3OFlEQm9TTEpENVZRanZJQm5ML3EyOU5MM0RUcXRoWVJZ?=
 =?utf-8?B?SjJPQ1Q0N1VuRlA4OFlTL2VJSDQzWkVnTnBFR3ZSRzNwY3hnTGtIYVpSRTJ1?=
 =?utf-8?B?UTVDT3hMVWc1dFAyWGg2ZklycGlCSWVQOTl6cTdLeFRia1RnZ2QwNG45bTBs?=
 =?utf-8?B?QzBoQ1VuQWdPMTRNSzhXWklFWTUybGRDT3dmVDh0TU0vZnVVNklNcUZvbzNW?=
 =?utf-8?B?dGNxR25pekFENXBMMjdmRE1xTDBETGRaYUcyWlBVU0h2cG52NzF5dWtCMFNs?=
 =?utf-8?B?TDEzTUE5VXpCVGlzMnJudFpmbW1CcEorVHpSK3ArclI3bnc3Y1JPcTd5QjZv?=
 =?utf-8?B?Zmlwa2J6S3RPakVIRllQRTdoZHNBUXFhdTVidHZIQ1ZLRTYwaUNkcmFvaUlx?=
 =?utf-8?B?cjFUMTZsSDIxYVZEeGZTSjFXb1dqdEpzdC85RTg5eG85Skw0YVJWRk42TGdR?=
 =?utf-8?B?b0FRaUR4WFcrcmFDdzZwRWlWaEhyLzZsbGw2b2VZdFpmTkM0OVpUeVo3bTAx?=
 =?utf-8?B?bU9YVFRYU2NxUlh1eHlqSGtJNzkyLzJaV3hPVGxsSVh5aWQyRlNlclpIc3dU?=
 =?utf-8?B?ZGM2N1ZWS3lmSFNXcXUrQU5zRmhrRDF4WEFieXZPT1JIYkRBWFpoaDRMYmNU?=
 =?utf-8?B?YVFZa1ltUyt0WWFOUVhrWDBPL2ZYcnhLZHZNdHlPN0xQREorZytjTUhJRGVB?=
 =?utf-8?B?UUkzS0NLUjlpc2ZGaGxNbGNFc3h1OGJmQ2xUcUcxSlVNbDdlTWt0b3FVZkpE?=
 =?utf-8?B?aXN1T2pubDJ6bXFzZ3lTWEV4STBTamRyUU03VE4yMTB6NUd6eHBSTzlQalB6?=
 =?utf-8?Q?Nb/GqbKLhLzPJ71qTwVmCeOTe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fGC8qF+HBk5XKUbfSpKaI3U8WurItP3wJh038IrDoTSsDnR9ZAlclcuCRNaB8GVeSvP2Kl34pp0/hZEicbl7G7Gg8eE375mvaaUYqHws8XeZvM5tZEHURDm5yZYScRSJLLtNwUkhX8+mtNE1ecw2LcNGxsrKPIPJhf3Gu77CnYfSXWgHpop/MMGsc2SDDmpbDz7eoulZG1mFotypfbjubq83za1QAgSMg8IHi68ecqt6lziUkJoMzo2dsRpg2DdpnocZoxJgPeS+jxhHp5qtE/btRA8sGGf6TioXiJdsyE1s+OR7+0kdTFV48ZMqIOu9F1ydeFfePIpg6ugCUMVcimL3pZNh1+fm4ZmYbtAa5u7jN+MydGt452MVfFCA9y/GdWN86Z7vtCLCvOrMo4+Oh7YxrjZFIsnbFSdBfrNXEPDBOPG6rBwIug30FWbyPjAa3661IvqE79tVYk1dtKQOLb5JyNN//1WqIddciaoqmxzHDZ1OBFCD3aWEzn//rdH/UtEO2CojJDu4rNfP8qsALYVk9VyzckJ69XkdPfqeR9IIr0j1FqNw7+ypV25ejLBOW4naiXgpKj+jAQaxMqL/rTBb1tULfWoGSyg33vxNmLRr27Vz7UX5Qfo9qYYr9uXajtLcbpkmKX/SROeovxFoi96xGeIAsIed5ilUj5WY3yRnYP0oUzQ89kBmI/vPSU3lerM6Tq1txJtOQn1XmoJh9gdjUpdtJtMdSgo1qCr7t/BmsMASMgXmJrTU7JGnTfhUyI7p7Jl7rl+Am53gDlNxsqvLULdyB0VzsQYxqOu5Kx4vFN4F1eXtbdWHZoRdwN318RfslXNjeqJ+q1n0FclrFA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ed0a03-6402-4daf-14fe-08db2394a915
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 07:29:20.1451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGwCyocqBzP48kTuCVWpbO84esmi7J0hEi+EjlehymBxv5/uUZyxFCsFZcC6dNMD2/JS1TAnX5YST7br+aflDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178409

V2hlbiBsaWJ4Y2IgaXMgY29tcGlsZWQsIGl0IHdpbGwgcmVhZCBsaWJkaXIgZnJvbSB4Y2ItcHJv
dG8ucGMgdG8gZmluZCB0aGUgbGlicmFyeS4gDQpJZiBkZWxldGUgdGhpcyBsaW5lLCBsaWJ4Y2Ig
d2lsbCByZXBvcnQgYW4gZXJyb3IgYmVjYXVzZSBpdCBjYW5ub3QgZmluZCB0aGUgZGlyZWN0b3J5
IG9mIHRoZSBsaWJyYXJ5Lg0KDQpJIGhhdmVuJ3QgZ290IGFueSBiZXR0ZXIgd2F5IHRvIHNvbHZl
IHRoaXMgcHJvYmxlbS4NCg0KwqAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1l
bnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQu
KEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4
NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1
DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5z
dC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5
LCBNYXJjaCA4LCAyMDIzIDU6MjEgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3
YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIFYyIDQvNV0geGNiLXByb3Rv
OiBGaXggaW5zdGFsbCBjb25mbGljdCB3aGVuIGVuYWJsZQ0KPiBtdWx0aWxpYi4NCj4gDQo+IE9u
IFdlZCwgMjAyMy0wMy0wOCBhdCAwOTo0MCArMDgwMCwgd2FuZ215IHdyb3RlOg0KPiA+IEZyb206
IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBFcnJvcjogVHJhbnNh
Y3Rpb24gdGVzdCBlcnJvcjoNCj4gPiAgIGZpbGUgL3Vzci9zaGFyZS9wa2djb25maWcveGNiLXBy
b3RvLnBjIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZA0KPiA+IGluc3RhbGxzIG9mIGxpYjMy
LXhjYi1wcm90by1kZXYtMS4xNS4yLXIwLmFybXY3YWhmX25lb24gYW5kDQo+ID4geGNiLXByb3Rv
LWRldi0xLjE1LjItcjAuY29ydGV4YTU3DQo+ID4NCj4gPiBUaGUgZGlmZmVyZW5jZXMgYmV0d2Vl
biB0aGUgdHdvIGZpbGVzIGFyZSBhcyBmb2xsb3dzOg0KPiA+IEBAIC0yLDcgKzIsNyBAQA0KPiA+
ICBleGVjX3ByZWZpeD0vdXNyDQo+ID4gIGRhdGFyb290ZGlyPSR7cHJlZml4fS9zaGFyZQ0KPiA+
ICBkYXRhZGlyPS91c3Ivc2hhcmUNCj4gPiAtbGliZGlyPS91c3IvbGliNjQNCj4gPiArbGliZGly
PS91c3IvbGliDQo+ID4gIHhjYmluY2x1ZGVkaXI9JHtwY19zeXNyb290ZGlyfSR7ZGF0YWRpcn0v
eGNiDQo+ID4gIFBZVEhPTl9QUkVGSVg9JHtwcmVmaXh9DQo+ID4gIHB5dGhvbmRpcj0ke3BjX3N5
c3Jvb3RkaXJ9JHtsaWJkaXJ9L3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcw0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4g
PiAgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veGNiLXByb3RvXzEuMTUuMi5iYiB8
IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94Y2ItcHJvdG9fMS4x
NS4yLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94Y2ItcHJvdG9f
MS4xNS4yLmJiDQo+ID4gaW5kZXggNGU0NDcyYTljMS4uMGZkY2E3MzJlOCAxMDA2NDQNCj4gPiAt
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94Y2ItcHJvdG9fMS4xNS4yLmJi
DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veGNiLXByb3RvXzEu
MTUuMi5iYg0KPiA+IEBAIC0yOCwzICsyOCw2IEBAIERFVl9QS0dfREVQRU5ERU5DWSA9ICIiDQo+
ID4gIFJSRUNPTU1FTkRTOiR7UE59LWRiZyA9ICIke1BOfS1kZXYgKD0gJHtFWFRFTkRQS0dWfSki
DQo+ID4NCj4gPiAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiA+ICtpbmhl
cml0IG11bHRpbGliX3NjcmlwdA0KPiA+ICtNVUxUSUxJQl9TQ1JJUFRTID0gIiR7UE59LWRldjok
e2RhdGFkaXJ9L3BrZ2NvbmZpZy94Y2ItcHJvdG8ucGMiDQo+ID4gKw0KPiANCj4gSWYgdGhlIC5w
YyBmaWxlIGRvZXNuJ3QgdXNlIGxpYmRpciBhbnl3aGVyZSwgd2Ugc2hvdWxkIGp1c3QgZGVsZXRl
IHRoYXQgbGluZS4gSXQgaXMNCj4gYmVpbmcgaW5zdGFsbGVkIGludG8gYSAibm9hcmNoIiBsb2Nh
dGlvbiAoZGF0YWRpcikgc28gaXQgc2hvdWxkbid0IGJlIGxpYnJhcnkNCj4gc3BlY2lmaWMuDQo+
IA0KPiBBbHNvLCB3ZSBzaG91bGQgKm5ldmVyKiBiZSBwdXR0aW5nIHBrZ2NvbmZpZyBmaWxlcyB1
bmRlciB1cGRhdGUtIGFsdGVybmF0aXZlcw0KPiBjb250cm9sIQ0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0KDQo=

