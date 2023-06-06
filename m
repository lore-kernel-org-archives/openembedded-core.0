Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A57C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 00:32:58 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web11.413.1686011569611453780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 17:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=S8igI1P6;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1686011569; x=1717547569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kgGCtZGUX1TwclGcuHd0j3y/gPzctaveNh6knJfkNGY=;
  b=S8igI1P66GftVbytjyZSv0wOgfBnsYLzJ/IQ2BAj9DKad/iZTR/3KUfc
   aKNTGxHukYFJPyD/nC/UKY4Oeu/KkUk55GIbeHu8KHBmvd2rmAj7R+6Zt
   rL3DP/j8TH6SWXz1UFIXP6F25A0a7fjwd6AZUnNAHZ9rirTo7jYCMms2e
   CNMpgZosfxpWg/rZAoctHPYq3mbNtfuAQnhdXTKrjkqnMbJ3Je+i7xsT/
   cfcelm94q4X/cRKP2tJ+5neTSIgO9wpXP0tMSHqu5+wRfMapj9ahxGr5N
   ZcWs4rZcQTY6cCQWaLlM06akf/CRtTrMHJmhticSDaBtgIEdOXFCrUTIL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="94539019"
X-IronPort-AV: E=Sophos;i="6.00,218,1681138800"; 
   d="scan'208";a="94539019"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 09:32:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T64QIfbsJcdlNE54Dyl0Z6J4BwvDczI7PpEX4ZnAYOwM4vTSS4ZyHyYB52VwN0iAk7P+0V06bi4dc31Kv+SnEKYLkcbhwVbX44PTWDrVzkfjuLEr0PAz1zfhxG2u/QHr0jfY+x4wLcKq4kssNM6CR7wOwIscCoIFo9WClxYm2qDgmPMzuSAk3oYCoSHLALMrzFoCzxGd/4TFl8h6PLdOZ8n5RcqKb+jgezC/bYQMpfVMgoYfku3ZzbLD6Hv5PPlNUn7b2qFfK9vN8fqd5miwgC9dg8h6uQDgbs5leh9MfIaprbTVoBsQd/y8dl3BoVf9utGIvtYlmO9B5gSE8X3U8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgGCtZGUX1TwclGcuHd0j3y/gPzctaveNh6knJfkNGY=;
 b=m+K/dotxhKaMN9kbm74/jWCWgFddEyeaqgFBblSQ46xKPLvJj3Y0mYsQ3VOsrsNX/mtxufbD/uZPXOMuCIdg0V7aCVWNEaR/KNzqu0SW27tSjPA4hchwvF040aRHXiNGPDyxnX6bZgRe0hFcIPlBVPX025diGtL+Pm51/12Ruk3O1Gr5h4TPJ+qvrje+tlXtcXFKzgNLBmL7Q+e4dkrN+/ksh+3G+eZzHQd2WecNZ1L6USB9D1QQDCyXlSMsC97VmuJ4dxVaCUjivENgTl6d9f3MPiLdffwNBGUfw39E9Z67ZZmeXqRjEhtfTWjo6p1slcZl3TgluSlaNBENVpyF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYWPR01MB9407.jpnprd01.prod.outlook.com (2603:1096:400:1a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Tue, 6 Jun
 2023 00:32:43 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 00:32:43 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Is aarch64_be under maintenance?
Thread-Topic: [OE-core] Is aarch64_be under maintenance?
Thread-Index: AdmUVJ7Lf/hFeIQFSMaBIHGjw7h/EgAA3joAACiRHyAABiflgAC+pnoQ
Date: Tue, 6 Jun 2023 00:32:43 +0000
Message-ID: 
 <OS0PR01MB61780EA1007FE1129469789BA052A@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
 <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org>
 <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj-D9T0kiJGc6uY2CU-GAxrQBMF111kUCPsxBMTTG=n6YA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-D9T0kiJGc6uY2CU-GAxrQBMF111kUCPsxBMTTG=n6YA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MTU3YmZkZjMtMWNjOC00N2I3LWIwYmEtYTAyMzgyZWZm?=
 =?utf-8?B?NmUwO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNi0wNlQwMDoyNjo0OVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYWPR01MB9407:EE_
x-ms-office365-filtering-correlation-id: 59890070-7df4-4b92-d0d5-08db66258ad4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TA6zYWojV2bdKih5uK29u8bVCtTdoBr4O7Y1ZyGTE3jGxHUUHXWfiGU3eR+u3qvpeeUCpf4tMvMjfwLO+abDqbh4g2tgqAGj5YPX64PaSg8PkQOGW685aoykmDUczkO0Dw25TWHV2AJYaGfqWtwoI+S8+KmyukKPcu3C2eZ9v0Ix6qXle5Na/widovcHg7wUC/JTXcYpJZpR/zX3bXGyw5NZQLp0zdoNDbo+faczqbhOAarO9039gCGmhdaHn6eaBuyj8EMwEq2njLlrOPhGJ5kR14C9FpaghqtGRXk2u/GrlW2K0l9OUO2reTWHNw/ryfK3vYDXdxz5dzPrCk50YolrSexNbZVIR2cgEeTmZd0bsIhEaRqMvvTO5zoBHhodF1garrU3G4fzu/KqJDUEJnoGcoyhLYH+4pWsRhRkXjZeZkufBdbenHv2DdeZHH32amcZC1hWPX12CuwLyntnI/Ey++fxNF8W1dN2lRblQyS544shmUrlw09lW+tkYQVVE7W1tZkRFw3R8mBjljwiAu3/lB9QeAva7VUDyi5eKrWhhQoMsbpblyvSTup/+NSP1tJgynTY745hxyihKhu1qvTBVxUBwzQD7oBtJxwrKjwwjrLyxFdYJ8DcqorhQ1Kw1LdX7vlHAvk98f73I4ySKN7hQQgWh8PE7YO/L878mjH8QEeeSB1W5Rq4WOzNvhTeMSgBDDT0VlK/ixO6IFCOLg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(1590799018)(451199021)(52536014)(8676002)(5660300002)(8936002)(41300700001)(2906002)(66946007)(66556008)(76116006)(66476007)(6916009)(4326008)(64756008)(316002)(66446008)(54906003)(71200400001)(7696005)(6506007)(53546011)(26005)(9686003)(186003)(1580799015)(83380400001)(122000001)(478600001)(82960400001)(38100700002)(85182001)(33656002)(55016003)(38070700005)(86362001)(460985005)(2480315003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGFMNk15R1IyMTFXeXdRb3puQkIvb05HRUFYLzcrZDJ4WEFMcy9CSWZVTGxZ?=
 =?utf-8?B?Vzd2bE5SbVo3U2daeGpLUisrazNoMWNLQnJKUVpvQTJZY0JGQ3VuQUowWTIv?=
 =?utf-8?B?Ynh6OWpqQjZDdkF4a0pWcm9UQ2hhT25NOFNFVy9uL2gxQlFwZXdxdlI1WnVX?=
 =?utf-8?B?S2FFWWRyRHR1YTdnRUtTMHlreGplTngveGtMaGc3VWdWSDU3MkZqckZaNzlI?=
 =?utf-8?B?dHk4TkVHSWd1Yk5ObCtlT3k0RkRRZHF5OThuZlpoczNBejdqQXNnQVZCTnpJ?=
 =?utf-8?B?SGcvU3dudTI0bytsQ1pzTXFkcXpqcExqbmk4T1RrUnVHL3hTMTBwMHFQYUk2?=
 =?utf-8?B?ZWdoQzBYN0FhaWdUVVhMRUpWQzdDZ3p5SHFyNlA2ekJzMjBSc0FLMVpacG96?=
 =?utf-8?B?RUtjMmRrdTVyVThGSlQ1Tkx0a3V5bGJtbUNIQ09VZDhzamZNMjJhUStSOTFG?=
 =?utf-8?B?Zk94TjhXWms5Y2sxZ1krOHIyWjNMeFVoM2s2dUxXcEdzRkVjTllsNm1DNjl2?=
 =?utf-8?B?WHhyMmVQUW5pS2JsdGM5T1cvMWgxeUxhVmVjQ2FER3VjdldyUHhiYkx5bDNH?=
 =?utf-8?B?dTNKY240YjFRbFBNVmdSaWZQRzhZMHZGUW5aczFGS0h1ZFFKNWVYSHJuaitt?=
 =?utf-8?B?QnpRbElMZ1dJS244ZExzVXIwM0RGY2ltT1dxZXAvMzlwUTgvZ1VKMEd0RFBv?=
 =?utf-8?B?MWdTM1NYTjZvL2p3RUIzcEw4NThWYUVHM0Z5QWN6RTJPeDNOb3JTSk9nUUpn?=
 =?utf-8?B?WUFodmF5UEEvZXNlWjRtVTVKKzdzY0JnQm9WbHFlMU8vS2pSdEhZekxlaDhE?=
 =?utf-8?B?bkRFKzY5ZWhMQTZsaWZjbHhMMm4wWkQ4SEJRK1M4T2NKa0gvREg4Tk9zdEpt?=
 =?utf-8?B?ZmVPdkh5U28wUTU2K3BhWlNiR2dqVFNzZTBJL2tRTzZYa2xwMHhrN0dGTWpN?=
 =?utf-8?B?Z2ZKN2llbWZqNStpQkVtdXZYeHBGNlhrQjJkQzRGbGFNL0VvUy9TalVVNzFz?=
 =?utf-8?B?TXJaZ2o0eG1ZTGdocXo1aFI5YUdUUzZIa2ZURnBZNDYvVExBRGxXRTR0SHB3?=
 =?utf-8?B?K2VNSjFXU00xTG9lTStNZFBJMTgxVzFEQ1VlazE3TkRlNStLSk1SQnV2K1VH?=
 =?utf-8?B?aXRQM2dYQ3EwbU1kYkVoMFVnZi9mM3EvOWpBYit5NXE0d0xkZTBobURBaFd2?=
 =?utf-8?B?MnVaOXBlZldVQ2diSTVTWHhCZXdPblB1eDRYT25vRVI5eldUWU5EVnBZcEpx?=
 =?utf-8?B?bkQwK3ZmakJqcFBsWWdmNGtmZXVmczduV0lWTHh3clBQQTdBeVRZNHhJdTNS?=
 =?utf-8?B?VENuS3QxRkEvRElPSWJnS0dwdmk2alVOQXBjZ1ZBT3pjVXZTSWUrZFk0RjhU?=
 =?utf-8?B?NHA2Q2JNeHJYMG1UcWNRTEtHaStqaVN6aGZzV1pjRGM1QndUQThXb0RKMGU2?=
 =?utf-8?B?SFRqN2Z3UmxLcitIR0FWc0p0VUwySDZHaXRqbC9TMi9vejMyNGdqNDRUNG05?=
 =?utf-8?B?S21rYjNPZjRzMmFHN3NoMzRpM0o3cnpHV3Q0WWhiWnFodm81WTV1MGR1MHZ0?=
 =?utf-8?B?eW5ZRnpPZi9vT0dYMlJQTElFaStGUlUwVU5LNXIvQmNwMHQyL0Zmd1JNRHBv?=
 =?utf-8?B?dDB4ekM5emRIeXp6aEwrVUFhNzNiNGZhOUVUem9KaGNSa1JDaTBBMDZIZ2gv?=
 =?utf-8?B?OHBvc2w0aDVGWHd5MHVjeGFnK3kzS1JOc2xvcmdLNFJVS3V1ZEwxZVpqR1Fa?=
 =?utf-8?B?ZUJtUUZOeENLdE1YdnhWd1dxeDZ4VGg3ckdURkdVMTN6cVRtRlFsOVVHYk5J?=
 =?utf-8?B?UFRrTHU1N3ZuQkowTkdxYVkvb0pTRVJQUTYzeEVoMkFIWWpBL3NkeDNmUStk?=
 =?utf-8?B?QjJMaWprR3hTN3c4YW01L0UwQTRmMGkwemRaRmtXemdpTlNueGc2MG9SUFFO?=
 =?utf-8?B?WDNCbGVOcHQ4V2wzaDNvU3M1WS9MWVFlZTVzVnZZQTBVME03cHRpUHlJemZ2?=
 =?utf-8?B?UC80bWJ3S0VHR1F0dzJVRXQ1V2t6YjcwOHBkRFJsU2Jzdnh6SEFDaDdISkJm?=
 =?utf-8?B?NlpTNmNsS1A5T3MwZEttUFU4L1NPMEcrUWo1eDB4UkhMMWhyMlp4UXR0VktZ?=
 =?utf-8?Q?i0ckGEaPJOAepL7/cN3wUofap?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tnMVvuHkqDZVG6dOji/mx9I2d/9hMTyP5McBfSar9Wxs0VJsIl5wyryVs/EVDdvz1uqkKuI74t0Svy4eBSGNNTk2ZWUjwg8AiVVPzYanWTSudIbeDRN+ho5+k7tJizgJC+Kjrv6LgMAyjAYnERQFelFLuwlJfeaMrtq8k8FMEIjR3rJXdwKmRZKJBHWDEsFtOj7gKp34yavoIUF4ZvKsac8nyiYtmY+EXUw1BCmraZoU5g/M0spqv57l52zcSZqW0dsIhBqkOHMpizebRaLfj3TRLCI1t6M3TvsFeTqOqjgzJJ3Mq9eFjtCE3HbvV55LqmABdDHK1GWV+cdF0yr+kV975wsTk03y+2Ek07QupeaGLlgTU+TnyIftXOkdF8kRfpnCUcKLoEQBSHVbZKxDRImFHgwPaUUE1UMxKXXlQCDeadeQaRzNPkNK6FiJ6FWFO2LBG2+xjTTQnyeoDpqr4CwhH6qsnAa6V00V7HrCAjLOnK8+Tl0wg4xsq1HhuFXd0AkL3CPUFuGUSYC6S+AGX5TFKbYHFm4sNu2P5R5O2p3Xlku7E0isyELBlul243K45Rx8aDnj8cPR+CRlftITCB4pOmACjxd41W+DxLCzBNvR26q9vcaY1G57z/x+/7GxPQ7t56UQ02sFCewjVWjFT1aEvVQPxCAdzClL3SbkmXqXF/I+qUmMaJgW+T/3epQNmAFPyZL9jcPL6p5UKPIuTRESNO5Px2UUaZ8crfmRBesPuvVbSzjh6AsDRDHyIrWuj9M9c3TbNdM9xJCb7CaQWgzg3rVeRztuE0pruQ6s5RG5CMV/DmKgK2C0kkxZi74H80hCFPPwqZmH/RALNVEnX9dv/8BySKKQRNKlC5vlROxUXQ2qxohOuOBDqxKFg1uJ
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59890070-7df4-4b92-d0d5-08db66258ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 00:32:43.1819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pf2HkiGRmuFHVnmqZ8pPr0J0uML2/v37hwL0cgcFjc1FgtMNeXBKRW0DD9vhnY6kW6/O35HUwi0vRk4SRckDHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 00:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182402

SGksIEFsZXgNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KDQo+IFByZXN1bWFibHkgcWVt
dSB1c2VybW9kZSBoYXMgcmVncmVzc2VkIGluIGJpZyBlbmRpYW4gbW9kZSBiZWNhdXNlIG5vYm9k
eQ0KPiB0ZXN0cyBpdCwgYW5kIHlvdSBuZWVkIHRvIGxvb2sgaW50byBob3cgaXQgZmFpbHMgYW5k
IHdoZXJlLg0KPiBJdCdzIG5vdCBzaW1wbGUsIGJ1dCBpdCdzIG5vdCBpbXBvc3NpYmxlIGVpdGhl
ci4NCg0KWWVzLGl0IHNlZW1zIHRoYXQgcWVtdS1hYXJjaDY0X2JlIGRvZXNuJ3Qgd29yayB3ZWxs
LiBJJ20gbm90IGZhbWlsaWFyIHdpdGggaXQuIEkgbmVlZCB0byBzcGVuZCBzb21lIHRpbWUgdG8g
dW5kZXJzdGFuZCBob3cgdG8gZml4IGl0Lg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi9ob21lL2xlaW1oL2J1aWxkLXViaW51eC1h
cm12OGJlLXRlc3QyL3RtcC93b3JrL2FhcmNoNjRfYmUtdWJpbnV4LWxpbnV4L3hvcmdwcm90by8y
MDIyLjItcjAvbWVzb24tcWVtdXdyYXBwZXIgL2hvbWUvbGVpbWggL2J1aWxkLXViaW51eC1hcm12
OGJlLXRlc3QyL3RtcC93b3JrL2FhcmNoNjRfYmUtdWJpbnV4LWxpbnV4L3hvcmdwcm90by8yMDIy
LjItcjAvYnVpbGQvbWVzb24tcHJpdmF0ZS9zYW5pdHljaGVja2NfY3Jvc3MuZXhlDQpxZW11LWFh
cmNoNjRfYmU6IC9ob21lL2xlaW1oL2J1aWxkLXViaW51eC1hcm12OGJlLXRlc3QyL3RtcC93b3Jr
L2FhcmNoNjRfYmUtdWJpbnV4LWxpbnV4L3hvcmdwcm90by8yMDIyLjItcjAvYnVpbGQvbWVzb24t
cHJpdmF0ZS9zYW5pdHljaGVja2NfY3Jvc3MuZXhlOiBJbnZhbGlkIG5vdGUgaW4gUFRfR05VX1BS
T1BFUlRZDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KDQpCZXN0IHJlZ2FyZHMuDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDIsIDIwMjMgMToyOCBQTQ0KPiBUbzogTGVpLCBNYW9o
dWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIElzIGFhcmNoNjRfYmUg
dW5kZXIgbWFpbnRlbmFuY2U/DQo+IA0KPiBPbiBGcmksIDIgSnVuIDIwMjMgYXQgMDQ6MzYsIGxl
aW1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPiA+IEl0IGhhcyB3b3Jr
ZWQgYXQgc29tZSBwb2ludHMgaW4gdGltZSBidXQgaXNuJ3QgcGFydCBvZiBvdXIgYXV0b21hdGVk
DQo+ID4gPiB0ZXN0IG1hdHJpeCBzbyBpdCBsb29rcyBsaWtlIGl0IGhhcyBzdWZmZXJlZCBmcm9t
IGJpdHJvdCA6KA0KPiA+DQo+ID4gSSBoYXZlIG5vIGlkZWEgYWJvdXQgaG93IHRvIGZpeCB0aGVz
ZSBidWdzLCBDYW4geW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucz8NCj4gT3IgY2FuIGFhY2g2
NF9iZSBiZSBhZGRlZCBpbnRvIHRoZSB3b3JrIG9mIG5leHQgcmVsZWFzZT8NCj4gDQo+IFRoZXJl
J3MgYSBoaW50IGFib3ZlOg0KPiANCj4gQSBmdWxsIGxvZyBjYW4gYmUgZm91bmQgYXQNCj4gL3Vi
aW51eC1kZXYvdWJpbnV4MDAxL2J1aWxkLXViaW51eC91YmludXgtMjAyMzA3L2J1aWxkLXBva3kt
dGVzdC1hcnY4YmUvdG0NCj4gcC93b3JrL2FhcmNoNjRfYmUtcG9reS1saW51eC9mcmliaWRpLzEu
MC4xMi1yMC9idWlsZC9tZXNvbi1sb2dzL21lc29uLWxvZy50eHQNCj4gDQo+IFByZXN1bWFibHkg
cWVtdSB1c2VybW9kZSBoYXMgcmVncmVzc2VkIGluIGJpZyBlbmRpYW4gbW9kZSBiZWNhdXNlIG5v
Ym9keQ0KPiB0ZXN0cyBpdCwgYW5kIHlvdSBuZWVkIHRvIGxvb2sgaW50byBob3cgaXQgZmFpbHMg
YW5kIHdoZXJlLg0KPiBJdCdzIG5vdCBzaW1wbGUsIGJ1dCBpdCdzIG5vdCBpbXBvc3NpYmxlIGVp
dGhlci4NCj4gDQo+IEkgdGhpbmsgd2hhdCBnZXRzIHRlc3RlZCBvbiB0aGUgYXV0b2J1aWxkZXIg
aXMgZGVjaWRlZCBieSBZUCBtZW1iZXIgY29tcGFuaWVzLA0KPiBhbmQgZXhwYW5kaW5nIHRoZSBj
b3ZlcmFnZSBhbHNvIHJlcXVpcmVzIGFkZGluZyBoYXJkd2FyZSB0byB0aGUgdGVzdCBjbHVzdGVy
LiBTbw0KPiB5b3UgY2FuJ3Qgc2ltcGx5IGFzayB0byB0ZXN0IG1vcmUsIHlvdXIgY29tcGFueSBu
ZWVkcyB0byBqb2luIHRoZSBwcm9qZWN0IGZpcnN0LiBJJ2QNCj4gbG92ZSB0byBoYXZlIHJpc2Mt
diBpbmNsdWRlZCBmb3IgZXhhbXBsZSwgYnV0IGl0J3Mgbm90IGhhcHBlbmluZyB5ZXQgYmVjYXVz
ZSBvZg0KPiB0aGF0Lg0KPiANCj4gQWxleA0K

