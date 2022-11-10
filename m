Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE681C43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:19:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web09.8801.1668093549389628836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 07:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=RQu4WM+J;
 spf=pass (domain: seco.com, ip: 40.107.22.61, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5pyXbtYxQwVGZg8fHx75N//v41Z8V0WwsLkt2udMee+MFO+8xe2cU/D6LtL8GPazPMMBi+RWwVIpHqEUocjqoscbwtV8ROMgl70mtnVbCknjCoA+1FafNynqcFDaAnNuXHI/UjpnHbgoVI56jiUpErWURRkn2axYUMeTZ2LtMtupLlD8vgFZrpNehflsAUbbu/fJemqzRi5byKe5r7JF5uNsYFoTjjqtBwuvZyrt+eb9U5qXpvUR2EB+NHfTgKhVl778cjihwIJ4hH0fb7kHONWy7/D2YfwSfTJjFoe7WzHQJykkuIAnnlU6eQZIswlZnGZ40a6pClg/vFXBiGI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqs2M8WIKuRwF8Jl+mR2Zsjk1cSKsqHywVbujzNOtP8=;
 b=CKySnc3ixcfz/ZnjOGoN6O2O7uNd/EsGZGWqG/2iVt6PQ+qb2HDx4GWDIfTu7u2CpbrlEdiDEt2zS1/tT7N0Xzv1N9vKXdUsqFnnVHal6Eh21PX0XbbyHkmO8YfBmv6IXgZOwfpxcWji9RwZ8OP8brgsdNL/uWyioqzXImrtkPAIYcHB6ZHOgGMCaMlFB7kRrRgguvpWe2MQ+LS+Ppn5U0DbATVsSraK1IFyo7szLHCKkp6w69sTgagQRqVTmRizqkuNoOVBJT/4+jR6rtewNqGMBZEcvWdhFH3aqUFG3rUCaoXhOCAzgr4vbjszdPXFlHYyxud0FtkR/3IN+EqWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqs2M8WIKuRwF8Jl+mR2Zsjk1cSKsqHywVbujzNOtP8=;
 b=RQu4WM+JRIoHLXeOtkSr8b64lWq9y+8PJkwLymASyZ2haeTqqkJAIki3QsZJhMBImOmlQ6wzZI/Tlw2GCzgVjjTF+n2emaMoxv6Q9/2/bRNXoEK4X6uZemP5P2v7LtFyy2qXxZR4GvuEmNLbT67dAXzz83+e8NFlz4wFPeez5LEjjXE2aUnWto0EKnKTvZCLXOkENXxhOd+jseykzbF67PHztPHN5RUlEDdCGYfzs9PhGlHc1FfAKG05XCsh1B8aTt4BeKTPF6fcRhnslwo9fbpOxg0lRRFoFCfjBr83/WR7upGT85I3dKtQftVFfs61v7pI2/CT00FYm06A2sj+xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8346.eurprd03.prod.outlook.com (2603:10a6:20b:520::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 15:19:04 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d%4]) with mapi id 15.20.5791.022; Thu, 10 Nov 2022
 15:19:04 +0000
Message-ID: <459cc433-e112-4dfa-8faf-5811ce20e6cd@seco.com>
Date: Thu, 10 Nov 2022 10:19:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
 <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com> <Y2wyumeMw77ATwDl@mail.local>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <Y2wyumeMw77ATwDl@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddacc05-2b2a-44df-5d43-08dac32ee73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qZIUJue5OlqMBI2SGbR8c4dSHZN7Uv7dFVFyGhpP5iRVz6hU2zCDon8AffOp7gnXuMTbylx67Ps92aLZo6/k/Wy2ONvB5TGnHrOWSOAqEW2F+oHaS6BLONS/Yd+cWLEJoDyyEKD5dvjMUuB+LZznHV+mR4npfTml9O0e/bKa2+uUGPDLClh7RxVVvfTaNnPSyJftCJhk9Kziy6LPmESnDr9ktAdMAOU3h8RGfIviA4U1Xez63hfogvTXYLjWrtDpIprFDSPud6HpQdvH4tGnxMtMLKkPCHfAv+Sqj88Ducw7vMEHE9YowBz4jnIMq+Ss53dteQ0J/dVp2O7IT2kdlV2AXFj9opc9B8VqWIxAzahXbOjqo+i6LI7v+1gxm9HmUS0YZBaeMQGVFk7WnWIow9ZVkDDH07UA3Ta1vcbZn1Am1PbwND4bB+HGSRAOL5T493QZ0dynsXblhFFgT8FHuUafC7UaxOepFn2pj5kF8WYPl5qEtCDS805lcmbnfAP7o4/f/v9OjDbECr83H7z+V5I937hVL1v4K6Wiju1MQWhVhu6IkQ7np3MyhXaDCZYnw/InUcA25ca6V3aXL6NvI6XdTqJScHxgJCH52nv1DVatTJQtRHvB70uJR4fNru0NRuBr77zAubsJyy2kbOSDR5EAjK0WjaiyZyngwXT8YGy1tgdLi4xSkVH76g88nQp+LnVk/d1TsfW8nb3CTdj+Mb8B1hfR4onzqCRbe2nB1YsMpfN9EmB8ApwMGuH90nHvtpJvVyd7U38cYtGzVInoKlC3M8iYjuoyiF1R/oeQiQB1nM7SWkKch5N4L7JUOl5e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199015)(31696002)(36756003)(54906003)(6916009)(44832011)(2906002)(38350700002)(41300700001)(5660300002)(66476007)(8676002)(4326008)(316002)(66556008)(186003)(38100700002)(66946007)(83380400001)(2616005)(26005)(478600001)(52116002)(53546011)(6486002)(6506007)(6666004)(6512007)(31686004)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWI5MnZGYWloYkVMaktsckYrZlRmSHBtRTJrQTRlQVo4NitBQkJxd0NJWVE4?=
 =?utf-8?B?eXBaQzQvMVMvMnFuRU5Wc05MWjJidUtzVURkam5VV2p1TUNUaURCTDJlWEpF?=
 =?utf-8?B?czBWdWxqSDB3dmxqbXVtZXhDN1dlRnh1YVlUTTQ1NFhhMUl6TTdod1RzSHNr?=
 =?utf-8?B?aGMyUmpleHk2ay9DemdSaFRtbkVtMURtSUtZM2NhSm93MjdtSnZ0TEJCaGJV?=
 =?utf-8?B?OGg3QStKcjlPaUpRNFdHbGd0SWxrcm1PMm43SGdYYjd5citTaTZqZ2tjeEJY?=
 =?utf-8?B?SGJNeG1PbVNDMHRuZlM0YWZaUFozaEp0TFluQ0xBdnpRMjg1dW4vNWJINlFY?=
 =?utf-8?B?U016bG5nanFTdWEwQTR6UnRSYXI4cjJyVWxQL3JTbG1rOE9OVkZ2M1B0NEVi?=
 =?utf-8?B?TUlOSFZaTnRGb2ZHNWJjK2ROVzFSdEpCVlNzZXFjRHJnRXJKQ0VDZWRTcGdO?=
 =?utf-8?B?K24wTzhMN3pMSHkxRXU1YSs0WFhOa3AybXpXV3hZRGw1azZsT09adGE4M2Ro?=
 =?utf-8?B?aGZ4ZVBueUh5S0N3anhLa0xpdkRZZmx6d1BaMTZPZUdOMlRGOS9yWGFyOFVP?=
 =?utf-8?B?eTFOSHo3R1lmQjlHd1R0NTdoWU1iU2hmRTY4VU1QNTlPTS95RHJOMWs3SkJs?=
 =?utf-8?B?Yy92N2NVUjMvL3RlRkdwMTdNeW9XN3Rud0Z2WVBzbmNuaStRUCtMWUc3azRa?=
 =?utf-8?B?b0x2R3BwUjBhQkp5OU9JZVVmcmRaUHJHdjUyMlVOSnZFZ0g4OVRNV1hYQUNO?=
 =?utf-8?B?VU9Cakl6cTZuMXZRRXJnTUw4MUNpLzRadWtLOFBBTEhDSEE1bkxYTDNrcUVI?=
 =?utf-8?B?ek80alJKd2N5dHVTRzJOWU56WmVKVWRoWFExazhOL05ncVdOR3Y4ZFJWcmJv?=
 =?utf-8?B?dHlEMmJCN1pSalV0dlpoM205T2wwOXNvcGpGcFJVeFRtRWcyRmtENi9MVURY?=
 =?utf-8?B?b21hRmcvSFhuaXBKcy9MWHA3MGR6TTF2YVlHQkY2QWo0cjN0UkwrZnlKNEtF?=
 =?utf-8?B?dWlpbURiVWdQbEI5UFBxbFd3QTg0S2x1a3VReWNDMlRSamE4MDRqbGZFYjk3?=
 =?utf-8?B?Z2p0eVY5eitZelh6MVpLbU0vRUI1RXJpY1BzTEhEMHN2SmZLelVaWU5mQ0NQ?=
 =?utf-8?B?azNQWnZJc2JVWjUxOVBsVWk0M0g3YU9DTU1MQ1BITGJsOTZwQUNXaFZka25K?=
 =?utf-8?B?SHRXNE8yaWFKS2h0RHAwVTZJcUQrWnl4S0FoWVlqbXh4SkwxL2MvTnJSMXBL?=
 =?utf-8?B?N0hRckIyUEhieE05MzRmL29XdkNYWmExS3JhODBxOGFYTUNTeUM0YmxrZEI2?=
 =?utf-8?B?OUdlZEJPWlIyUGhNUzVCTzJEUmhRMnczbjlqSFFMRnRBK0NZZTZ3QUdXalIv?=
 =?utf-8?B?Zmx0TzNXL1B6dWZUR29aUXFUbWxhVWY4MVlQbVhYWnZ2dTdyRGRiRXdwL2cr?=
 =?utf-8?B?dWVDWTFxbEkyWTBNc1dwaHB6c1E4RU9kRE5HZGh4c0dyYS84K3AvdGs5ekxW?=
 =?utf-8?B?RFpmcFQxWE8ySmhyQUIrdUM2NWttK21scnF2UTZIb0hSTi8xR3p4dFVJQ3h2?=
 =?utf-8?B?azZUcVcxYUFMRWkvRDAxT2FHN3IxcnJkWUhjN3Z0YVJFS0Q2L0p3RXlKY0Ny?=
 =?utf-8?B?Nys5MGx2TnVmOXBYWHdySmdubG9EbzhyS0NhMTcrdENlakhIcTJDNnNZTm1E?=
 =?utf-8?B?YS9zY1JYYkJoMjdzSFVFK3Y5a3VENWcyT095WGlEUUxiZ1ZVbHU5VHp0NXdI?=
 =?utf-8?B?dTBNVWU4Sk9zWXdCcXE3SjY3T2pnK1U4cVZoaWFmY0FOV2w5ZWxKNUdJQ2Qv?=
 =?utf-8?B?TlcxVmRaYmppYmRENWNDTmN5NFk3Kzc3V0tWdmlYREFJc3J0Qjk2emFvcUl1?=
 =?utf-8?B?OTUzWkU1NXVBRmp4LysyYnlrK2I2cHA4czdMSVU5L1pCcnI4NmsvalBkYmFm?=
 =?utf-8?B?SGUzVjVHc201RzhuUHI5Sk1KNlU5VTJrNm5PY2Q3eE90Q0s1dmd0VzAvVXVZ?=
 =?utf-8?B?TzZ4ZWpZb3I1ekM3UHRSMUxUejRQQndNNDZyMWxUbjVIM3Z6WkNEYWlvRUd5?=
 =?utf-8?B?WHl1eGhON01RZkthNE05Vis5aUN1Ri9QZDhkdUFLaVpEVkxCZExvNWtNOEtU?=
 =?utf-8?B?ZWFuVm55SnNYUTBzWEpTaDJJdHphTnozSkRXSFo2YytEUXUrWjlSRTFZTG8x?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddacc05-2b2a-44df-5d43-08dac32ee73d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 15:19:04.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7xSf1IC1+Zqo6Ux+L7bhTf5sKevpCBZG/fM9M0B1t9x0Flg9f5fJOHOVsb3e1LfUPkRcedaAHwY0Gx73HLJkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 15:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173078

On 11/9/22 18:07, Alexandre Belloni wrote:
> Hi,
> 
> On 01/11/2022 13:54:18-0400, Sean Anderson wrote:
>> > That would result in a lot of messages on the mailing list and ends up
>> > being a lot of work for the maintainers as well.
>> 
>> If you use a tool like b4 [1] it can automatically generate a summary thank-you message.
>> As an example, [2]. This keeps the number of messages down and is not terribly
>> burdensome for maintainers (since it fits into the usual patch workflow),
>> 
> 
> I was also surprised to not receive confirmation that my patches were
> applied. However, unfortunately, b4 is not working with our current
> workflow as I am applying the patches and providing tested branches to
> Richard that he is cherry-picking from.
> 
>> You can set up something like pwbot [3], which integrates with patchwork
>> and your repository. It produces messages like [4] automatically when it
>> notices they have been merged into the repositiry, and marks them as
>> "Accepted" in patchwork. This is even lower effort for your maintainers.
>> 
> 
> This would integrate better but I4m not sure we have a pw instace for
> every repository that compose poky.

I think even incremental changes are good here. We can start just e.g.
openembedded-core and see how that goes.

--Sean


