Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.63])
 by mx.groups.io with SMTP id smtpd.web11.4713.1603336665790113028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 20:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HrxiGfuh;
 spf=pass (domain: windriver.com, ip: 40.107.236.63, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2bOPPI48xtbL3AEn9evwNJEyAElUYfnrwOm5BcMttRHcXMjjhLfdoi3lGUmwNm/AW0s2XJGTyOg1dIl4+98OjbyEJKn5gkDG/KxYAZWtEklqxKiKwkVJQ9Gl2po9UcKyyWI/iXpfu4w5T/amuFNeT77nHtTQnNfHy6uRWZlWkmB41aGs027dtvBvEMAwjCTkXfbYSLOsZbZe4J8gxdeD3ZJ+6qAkzLxLfhsqKGi+3M3A7GpQt7QSDI3shxP62IGQd85S0ZzR5ajLY6mSGEzRYpryHyEqCAGTxtp188jrvCnBipEMyS2eds/08DRzQmxaZCz5AZ8SQ7kNJ06d/xTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcRKiZBbw20hj81xmqGvkm2wmS3+P32nmSAWBKORFUc=;
 b=EjRkWds37YkZvXo03I5On1VxLNcy7qzCgR2RAE4KDyfVQF+VAykeEqh6XTGJShYe3aoXygWD7fN/lkxuuLk3A+NcTLGp6LaFItegUZ2vBG9ZRdlZ8bprNOeB3CKDLGV0t0I1NEStmmXUie7QZn7Mt0ucQrg4h6qGFBJZru48JSfcm3M6Kb9lBfUkB7uJzHddGt9Hbl8PTdiL4tk3DSvfwOO7TmgSk4KNZtjc+GDg6Qyf8MpAQlIMSwyoUBMqp8qGjlzuTQZz4j8x+ZsiqPl5/QLFl/m13TFgz/x3j3fpuMqkyo8QFyFS2QOE4l9DxVwD/GQhA2PP5WMwSd/wcKgZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcRKiZBbw20hj81xmqGvkm2wmS3+P32nmSAWBKORFUc=;
 b=HrxiGfuhT2OZ31mM9z5O3IrxJWGKbLbwZoQ8Uf6UXRY73la7VQHwVy1mS226gSyB+vLaJNBm+lwMLSWsIEEJbDyPJye+pgqCYp0Y6uwuze4OZEEbqQhcvQWq55ZUfj/+55T1AeNCP84K7ivXYlsqShzh1bpztk/OlB4SSHLM6Mw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 03:17:43 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 03:17:43 +0000
Subject: Re: [OE-core] [PATCH] tcl: adapt to potential psuedo changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201021092401.41424-1-mingli.yu@windriver.com>
 <CA+chaQdwgNY7j6xBzzgeYXGv+V=BqiAxuy1_OovZTN88Bc7wbQ@mail.gmail.com>
 <c1d1aef4a2b900c727360463d929730d671d7f81.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5b753c50-6902-2023-a391-7a9e88462a1e@windriver.com>
Date: Thu, 22 Oct 2020 11:16:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <c1d1aef4a2b900c727360463d929730d671d7f81.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.9 via Frontend Transport; Thu, 22 Oct 2020 03:17:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e993f8d4-e08c-4b0f-89ab-08d876390a47
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33981D14A4BED8A35CED0757F11D0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d2DeVvO4WMTjGfR6vVKyiucU4Rd/8gbTK1VyAfcG0jM2KTCzFUgL/YYaHFgiXhNtkeDpyY39DeMNzX/FshzYr9AZB45q+lH0U8diPJmT4SFtnQ763fnWly9U5RVuSeR4vYeSizRZR2Ho7MQJfrh4vpZhkBS+EzJN/yyqSjoFPrwom4SSS2NFxGpJeXt9K3mtb3Dmu7uuSNxCJqGjMKdSoC+94THTX0a2df38GS+mRqkSuS9GkVQbU3vsHQ+GcmJ8DIa44OAKUbO/Tex3mecjLejmYr22OcxsBZgjOXRUkJgPv+71RwhgW4ysySZBiodBxziy/uMYKI+6g3q0NQ0PojZAGZf/+yCnHX4JylgxkOisNVONcQ5T7q2r9mBbap0JepBYsruQIih0vG9PZMIDThFCKwAxU6e2Yq50f626K8DYb5S3thK49in9/aQgZNYPwohD6F646XOj5U0PoYjtlR3LVhBN1UOb5TTnrPtSAZ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(956004)(36756003)(2616005)(53546011)(186003)(31686004)(16526019)(8936002)(966005)(478600001)(6666004)(8676002)(52116002)(26005)(5660300002)(86362001)(2906002)(4326008)(6706004)(4001150100001)(316002)(16576012)(66946007)(6486002)(31696002)(4744005)(66556008)(110136005)(66476007)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YnaMHDGnt4ipoY3FNR3piicOIFyAW1OdKOJKJ6tG3rCVFDBsfUsGeTMS8KdB5S+CQ0rtMhbU9UTcJ5B+6e8/5VEq719Suw/1NcO7thVN5DR89bYDazXgaJLVidVJluu5aYuu6BsZxLHL9MLDEja9AgPLDfRLF2DG8KH8f2pY3UDVJx6HrAWUwuDsPMRSTzFTC5ATOJg3/ub7/SnGEhmqg9GmdCGJAjdY1LHw4XEnXH8c7VSVJAn2pZB+wE/5CpR1wnrTix4+SzItzWCp6uWOXwsLQKVqnDkeoeZ4enMJ8SRHCj0hV9bytMUdkYBLsqzCPav9GXmB9xOHU+NniUY2SW7BLfX4jqOKiGpmiTQch5Txb7YyU9U6IgPayaymc8bjyuwHzlUu6Vmd3cYagRx/GugkqljCCxyuuwRCMFX7OpzICEZPlhzyyE/C8SMYOF4QGob2zvICgYGCATNBQZdQeDWp7XAKVNq+noadurOnfFgcedm/BudD0Li2NYyZ5NQ+mTt/FojiKI06aK+Gsltze0iGIMmS7tEVHpUtYLQqoRspXwRIFRUcJLm89FR2avCN07Xc134kpp29dZubb03qz3Mpoc14DZXtLQmOI7ssNOuglJc6b4ORQ64ou54R6qYkr409T1qq3okh5RLbjOmgew==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e993f8d4-e08c-4b0f-89ab-08d876390a47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 03:17:43.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oqmrk31tdTw2SKgivIdMrlD7itixcAsMkis3QcQnbGLFBjYsUoqTkIkrmGJ0tYokWL0SrNV+LGEnPB0D699t/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/21/20 6:41 PM, Richard Purdie wrote:
> On Wed, 2020-10-21 at 12:11 +0200, Martin Jansa wrote:
>> There is typo in the commit summary and doesn't base.bbclass do this
>> automatically already?
>>
>> See
>> https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396
> 
> I think the issue is because the recipe is setting:
> 
> S = ${WORKDIR}/${BPN}${PV}/unix
> 
> but we want
> 
> ${WORKDIR}/${BPN}${PV}
> (no /unix suffix)
> 
> in the ignored paths so that code won't help?

Yes, I will send v2 to explain more why tcl is special.

Thanks,

> 
> Cheers,
> 
> Richard
> 
