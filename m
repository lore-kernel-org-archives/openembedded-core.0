Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.66])
 by mx.groups.io with SMTP id smtpd.web11.29562.1599184778909388266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 18:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pfmLuh5c;
 spf=pass (domain: windriver.com, ip: 40.107.220.66, mailfrom: heng.guo@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvfOMXTmD/ObtwJh21m2f96yJqZu6VVxbVgFZEUlWpUk857jvMV6UVkO2M1G/j2Guagqsp1Z+fSX7Z5xur5SLC2J4qnp8vWShDcfKTiHzialoWjUSRvPzFMQm5km0Dyu7y8cz55Gxdx8OKj9yEnsfP+ngXGhj7WC4Wy6HuvjiB61ITnOFh/mGpmTB30LCVBXUyYg92G27Kj7A2ws2oIUTjoLQhcLLriA0BKBE4zyW6K3i8z8Hp+UiANbYtelsfCla9OM1XtDEj6E4wlqS4pAxSLjl/Tmap8bn6GZJm0QxAd6U/6MIuvUVWp/AOU2oPaVmAz/tKltnMhGlAEurZB5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bn3sU1/ej5IUBcpe1ZPrys4sx5OdAODE3LwDPfGAkY0=;
 b=FNrW07O6CvphZANBcEdaargO1VK0eyKwyEQDTvTPhxaZF5fACVmL286ndAgrB8nVQ2f4SbR7LJNfbOoVXNqOnlPdavW0M9NDc1aE1mFM7OrwzdUZCWc57K7vNhN70ucle+uvXU+KHTH8hlMlM4YbVMzUd/1vianYaZ9Tmvf50XDzs33mkDSdAw+DAJ4KEeZtREinmubenhKu47t3sBXushzhwTWzCT7+PRNK/VIV/3wZILW9jd3a1jIL9tZbonkG82Qa19ckeBfT/bk1KqyRAP1dOnc1NqI6QcNLjqDpg4LFC4KWGaj/LT61jcTw6HLZnpN2Klmj69zpwBOk0YdBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bn3sU1/ej5IUBcpe1ZPrys4sx5OdAODE3LwDPfGAkY0=;
 b=pfmLuh5cK8ih72VLMq75n70deqbfQSjTnYuPHmF6Edoxx4Jef/JhSZv/SuL+IRdMBQrlZoTQDPTBUqaZtYt6gUdtxh7Ql66PoS9HwASXoM3fxtN5p1PgnTg0K4ODKhPyyojzCUO3NB1eIIxJ5JUnS/hW4QrZPLE7VGfLg0aviqQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3404.namprd11.prod.outlook.com (2603:10b6:5:59::29) by
 DM6PR11MB2668.namprd11.prod.outlook.com (2603:10b6:5:c7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Fri, 4 Sep 2020 01:59:37 +0000
Received: from DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::a9ce:cc5b:a5b1:6e35]) by DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::a9ce:cc5b:a5b1:6e35%4]) with mapi id 15.20.3348.015; Fri, 4 Sep 2020
 01:59:37 +0000
Subject: Re: [OE-core] [PATCH] python2: fix segmentation fault in ptest test_bigrepeat
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200903092448.26165-1-heng.guo@windriver.com>
 <029196ff18a0d039ea41d70db9497c0a8c0db1d0.camel@linuxfoundation.org>
From: "Heng Guo" <heng.guo@windriver.com>
Message-ID: <c549a7ab-0b5d-3763-c745-70c7abf4eb92@windriver.com>
Date: Fri, 4 Sep 2020 09:59:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
In-Reply-To: <029196ff18a0d039ea41d70db9497c0a8c0db1d0.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR0302CA0002.apcprd03.prod.outlook.com
 (2603:1096:202::12) To DM6PR11MB3404.namprd11.prod.outlook.com
 (2603:10b6:5:59::29)
Return-Path: heng.guo@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.155.91] (60.247.85.82) by HK2PR0302CA0002.apcprd03.prod.outlook.com (2603:1096:202::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend Transport; Fri, 4 Sep 2020 01:59:35 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5aa5697-f04b-4454-a18c-08d850762d51
X-MS-TrafficTypeDiagnostic: DM6PR11MB2668:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB26689ECAE314F6BFA59F89398C2D0@DM6PR11MB2668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RLkYrVzbwLKBgK7SFNU+brrxtbQervKjDrFa69thriS6YYfsXq54/KDJ+zl8Epe5vpM/3RC+jVw4g/+Tj0RISajm8WuNtgsaemIRWWDJ8OAx2u5idi/6jzUbvW/PR5bxavs7Mu1UNsHaqzlUaTvgZacUPITTnEaGlIP3YLoEN+JNRBxeNXTsbBH0radXeNxLKwIvYWz+MzldOR/6VHsWqNidpG+RtaJAuiF1PEJSefG1md9PUhfT92wD3XylEHlVu/Zk3C07x45hZ/a9iQT+Ad+v8PvVg3h+G33RhsMROqqPlSZ4X03iKMUSo7HfQrC32yPz0DCNO/aiXsN4ESf5APcCZmfd9NJoEVaWEhZOAlAsjqR8Zn+uGjycfmCGfxMerN4wBCsRl2+1z07jQPdMy6eBvnPJyk1/ujyJ/WfQ782Ll67pFbTYcABMtdMqklWkNMuOfs2Z/9OA6MBNJYbi1TKekVa/ljyILl9bEKI4eu4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3404.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(52116002)(66476007)(5660300002)(66556008)(2906002)(2616005)(956004)(26005)(6486002)(16526019)(6706004)(16576012)(316002)(186003)(478600001)(6666004)(966005)(31686004)(8676002)(8936002)(53546011)(86362001)(36756003)(66946007)(31696002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+22fPciolHiDHeTSI9O71T8bVx/llNNrO1E6I7y3pkgwI9eopwfVt8rGi/y2lZXj1KkQSfz0CQwvB562fCN6mbeHGL8bkpwXJpsdhWZR05Sa3DcGnzp8l6iCNGvfBks6sYnIbScFWwpgBUmeFSyAFVOq8jHCPlW59mkbaG8MgAHUgM8vObH8Srb8zZkpcVoKn81MekUkQ6ar+BawxYpmgZl6BpFvgQ4iWj76un0RG8fvJs3wH/54DMIoeujQ7G1n9pg8UYFK8rHCYbtMPBILFDaGnXtWw6K7/SsoK02aPnZdKE32A9QWHL+QBN36julBDZty77TgqJGwYPIiOnJJ+xoINZpYhdyeyP+kbkOOcQCPCWtAq7M9Jxv1Kzj53poDC+A1aebVJge2MA8IfXwVJnCodbC48GWMUdQFUINUtydEjrDb7bT9IDAi2a8VAcwQ0sFVZCIwygd7hEA/jgYY2x/nAYJOqLhmG1a681wDyTHy/cP7JD321Tb6HdSLOdjGQd5WRzHkAdoKYNUV3KlEWh6GZQ04suMcY4kDsThi36D5eeTheApRjwQA3PQcozSucHITYQgs4+upM09XYKqfrCyphzHlxI6X6QxaMkcPLbf97ooYFlCroot+b+9be7cZVBv4BUQK+fFIFNHF6Z/AfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5aa5697-f04b-4454-a18c-08d850762d51
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3404.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 01:59:37.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z179UrarQNN31JOZC+DBaufKECFLbRp6JqHkf/vcDoHAQYVXMUkDtezMUxTGcX3NQRos3jQxdXg6iR7b0oCQTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2668
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/3/20 7:12 PM, Richard Purdie wrote:
> On Thu, 2020-09-03 at 17:24 +0800, Heng Guo wrote:
>> Segmentation fault at case test_bigrepeat of python ptest. a similar
>> bug
>> can be found at https://bugs.python.org/issue33153.
>>
>> tuplerepeat() in Objects/tupleobject.c uses a questionable check that
>> relies on signed integer overflow. A singed integer overflow is
>> triggered by ptest case: test_bigrepeat.
>>
>> Python2 is out of maintainus, so backport the related patch from
>> python3
>> commit:
>> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b
>>
>> Signed-off-by: Heng Guo <heng.guo@windriver.com>
>> ---
>>   ...segmentation-fault-in-test_bigrepeat.patch | 33
>> +++++++++++++++++++
>>   meta/recipes-devtools/python/python_2.7.18.bb |  1 +
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python/0001-python2-
>> fix-segmentation-fault-in-test_bigrepeat.patch
>>
>> diff --git a/meta/recipes-devtools/python/python/0001-python2-fix-
>> segmentation-fault-in-test_bigrepeat.patch b/meta/recipes-
>> devtools/python/python/0001-python2-fix-segmentation-fault-in-
>> test_bigrepeat.patch
>> new file mode 100644
>> index 0000000000..45087bfb8d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python/0001-python2-fix-
>> segmentation-fault-in-test_bigrepeat.patch
>> @@ -0,0 +1,33 @@
>> +From 031d06e1e670d40b6500cce4134ab35ec8858a8b Mon Sep 17 00:00:00
>> 2001
>> +From: Heng Guo <heng.guo@windriver.com>
>> +Date: Wed, 15 Jul 2020 15:42:13 +0800
>> +Subject: [PATCH] python2: fix segmentation fault in test_bigrepeat
>> +
>> +Port from:
>> +
>> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b
>> +Only merge codes related to tuplerepeat() in tupleobject.c.
>> +
>> +Signed-off-by: Heng Guo <heng.guo@windriver.com>
> 
> Missing Upstream-Status tag, also which branch is this against? The
> recipe no longer exists in OE-Core.
[Heng]: https://bugs.python.org/issue33153 the same bug is reported to 
python2 over 2 years and on hold over 1 year.
For python branch: remotes/origin/2.7.

> 
> Cheers,
> 
> Richard
> 
