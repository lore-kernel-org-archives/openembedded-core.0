Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.74])
 by mx.groups.io with SMTP id smtpd.web11.1027.1603316262058567076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 14:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hHBHjLVj;
 spf=pass (domain: windriver.com, ip: 40.107.223.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHbEuwodBF4eDwbfBb+XLrIsOJvmEhbbLggybTl854mz9e8Dlvil7eOf6mAUVGwgbeQAujhElg5+E6t2WVZoytKJYDkwtFBIf5l5fezmmitROpgqj6t+H7XGqid9kNKi8aAqeLU59a8SwcaCOY1ghGkeapKnPIZNrejoxWIPMMMi1Qug4rC1GzxkWAgAnRvgW/NtKKNRhwdOdWVu+0x0MrZEJR57BF4JZjNfNym9A2pwpETUU0FUv7dB6uIVn5AzQ9YFyp+8nEa9WNqV5F+b30SLVr3Vy8MWb5i+65YpuF2wAxNLIvtE/qdGRzpzW38jdfw4Bkhn8on3+d0Nxf7yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXrr+Yprin1EKj4fAJFU9uMkuSwVCQKRcOamKExgsLI=;
 b=kHb7o2ugDUoBvgZP1OFiRZvoqpoQOzKjdnfNyeSIIxm4w6wF9I/XfaYve8VkuAjlPjboFXlEIlo0pYftN/5PhISdtAXl8TppyWc5Hws4wT9VXGrOfI+nRf987D14DhG0f5rBAVQWurJGyUQaiu8dNnHhmxQ97duiYZJGAaNCzlk2WTGihHf8drIUwxr/GjKPw0rYux16xmCQTx7fUJT0qObddRmpF1Ev75aylHtERS5oSxxkHoi95Nf4aibZx/v42wWd1P3kE+LHSrFklPFcUrdVQ081+ul6vpj/U45lwFjHpGYpX7zpc4FnWxFdHI/LeSnH3zgeUq4feA1Ftu7ndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXrr+Yprin1EKj4fAJFU9uMkuSwVCQKRcOamKExgsLI=;
 b=hHBHjLVj+33GFo1pLk3yoedPTQ86vYsnvo4Z27dhAwZgS875LEMCpZb31iV30YwcxegrjN7ohuhlLAkgxPcBi3XsCXrfvcP+qRjEvGNyl1yTUq75NLWHFEtj71xCPKWLBVxca5DUKDhMdii5f7Jsham7qUNv6w/lavUOHvINkEQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 21:37:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 21:37:39 +0000
Subject: Re: [OE-core][RFC][PATCH] buildstats-summary-native: add bbclass for tracking native sstate reuse
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201021193009.3279776-1-trevor.gamblin@windriver.com>
 <d5ea6aa20bab3286b4a372e01418a5cbddd79653.camel@linuxfoundation.org>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1ac98d1f-88dd-5267-c10c-bb78d302f8db@windriver.com>
Date: Wed, 21 Oct 2020 17:37:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <d5ea6aa20bab3286b4a372e01418a5cbddd79653.camel@linuxfoundation.org>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 21:37:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcdde6db-00ad-4a0a-9f6a-08d8760988b2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101F8BBCB91D8579D37E49E9F1C0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FIgoXXH5yAptRvt7Sf1eZQL6hSwGcVlo6fNn/ufYG+5xeJf/FwvDmukTV4os+QajybuBkVz1c57JP0oy+oW2+eoo9wOpUUAa05H0N1V9vj72HPG2oeiGRi0BoApg4Fi825bic/HiiPpXBofWfLMCVcoswnI2rglpWh4uc8EA0B+Jrl7OkS316wSm38Mh0vZ+xMxd5dbyMAX3P3qYmz2B8Va0RQ+3obXuJySmmjXFMrxaT+X80bLsxYLP4MSSs4pwW7w1wIhP/VSHqdhXWrvOp/0gItw1axgZ2Z3dwwK0gfj+1BD3IFrZ/c2+EDr/T1A9uFy8sDEE87me8E8EzUyns0MENnk37Zjd3rThuaUnIZq0URmVG3q4w37w2IsMR8kQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(66556008)(8676002)(66946007)(31696002)(86362001)(53546011)(31686004)(8936002)(6486002)(66476007)(26005)(52116002)(186003)(83380400001)(16526019)(44832011)(316002)(36756003)(478600001)(2906002)(2616005)(956004)(16576012)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nyDht5qz0FLd7GfHzwIUeyaIEoySTk6CyNzD2UDS9c4ePpMD+Fhm/ARIG0szKEB7UlQIZ3996dVJuYOXACyUmyvuWY6kP53oGpI3e6WDHtsXviNLM2/LDDv+NViLJxWLhQ+uVcdJGT3RZvRIwp0bD2c1WKIdWH0HrmsPcM2ydT9mwJGuyK0XDhvJCg2vIGaUny2nXKH2aGDIWWouKJjGaTZ1Ru0zHMTz+oGfHXnWYMum66atD3gjr5t5RlAlQYWjKMsGTXv3m4A0/ysCrgOMtubQplAH4IxC5j9/QG3XhUlU3hUeDLnbFk18JvNrR9EgpPv0G7fMmFlH75JJ/Ab0QXkNS0tdjfI+4BNeh+tAT4Lj1ist+R3Clp0Gei60UiUW1oGnZYqvDxvDvXW76BirYnLQgT3LVC9BWPx6vby0PELvYY3aLBHDyslprXgJpIJcJ6n+gUQI77PJOB3c3z8Lqwh2XTAz8QPZDga+8chKqbg2y2OLlbellH+4K0e1V7l1k1P6DyJQXQVE5abhE/t3gvWm6h5K3CvtVzbc4mONsHn+4Iq5MBHqRkvenGAjyCXEcFyXyITTO8fm3bQl+2OaWpFNKe0BeeeaNN7HwSWkStk6bO7OxhbctZEnzGyu4/RS4P5IuG8Mq9NLqSEks7fvmw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdde6db-00ad-4a0a-9f6a-08d8760988b2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 21:37:39.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kC9zu+9/UBaS2eNWVh/ryG31uYSEXgTi8LS1scancEaGQUL/oWtJ0KWO6fVuEfLEIxWBmJPdY1Ss0auMYPx6YwdsktTvlCyNEinz40smrLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/21/20 5:12 PM, Richard Purdie wrote:
> I'm probably ok with adding something like this but I don't think its
> generally usable for people and that will probably lead to confusion.
>
> Why? Its a wall of numbers which are useful when examining a particular
> problem you happen to be working closely with at the moment but which
> aren't particularly helpful under other circumstances.
>
> Its also confusing as there is no mention of "already existed in the
> build directory" here for tasks which didn't need to rerun at all.
>
> The reason do_package* don't have native versions is that those tasks
> do not exist for native recipes. That does mean about 33% of the screen
> real estate you're using for the message is effectively useless :/.
>
> I could then be really awkward and ask how hash equivalence matching
> fits into this report?:)  I ask that just to highlight there are a ton
> of numbers we could show, but knowing which information the user is
> looking for is actually really hard:(.

That all makes sense. Thanks for reviewing!

Trevor

>
> Cheers,
>
> Richard
