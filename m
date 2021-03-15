Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.44])
 by mx.groups.io with SMTP id smtpd.web09.3182.1615772488113435154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 18:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DqeuNzKz;
 spf=pass (domain: windriver.com, ip: 40.107.68.44, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5WDE8V4gaEShTVlX4tTAu8hYrDkzaK+IGVUu/IIvSqiVFIh99SGXle7lk4B1pWqroL0SzwTPyMkNcViWxPcmUg1cbRYPueJ4NpZ5tnCmLjRE7chPRNPc2kUCWkTeO18JiZeSYYLfxWMVT8hxTFeT9pmHhBFaUn+sDYm8ykjow9Ni714K05CaRgHl37DExLaHjBMwKq3UGRAGMDgPRvxDTRme9X7t3oV14QVR3Ez2NCzm12HDo4XfipjuTD/jntktttF/CjSx9cBQsv9O6BPkKermmOiD/ZZGC1RfeBfRf4rnRAfWIXgFiMcVpOtq27QLN2zhqPyr8dhGbafHlbzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5tduxs7bKWJF0gd/vKKXGm2aVuiDWyisPiAyKvxC/Y=;
 b=OF2EJYV04BuvSAmy83gbaYgo9Kb1qXn04UNbxeLK3VYwxhnyO/NM8Ak5SMAYziKNFQo1l+ovGO9gQDHqKf+M8xTIiL3qPysQF5tzwAbCnBd7iR5bsUUSC5alHZHkshnJT22a5d5cgrZl/VQwB1fDcmRHCWnYdEhfz6/ea4Kyi9JrJ28ddwNrOmbhjK8tee/cBgWeOAdd66oUrKBOBH3EYEEAZsLVrhck3C+giFr7npWbwORwklXCyv4rm5JCpTuyutkCKOtwzkNYGKd4Ix0dSg9k8JFjLr3ChB+XkUxSBvtjfOcMe1hWFKJa0quVv7cw+33T1kMTSmao/pWHsI1qXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5tduxs7bKWJF0gd/vKKXGm2aVuiDWyisPiAyKvxC/Y=;
 b=DqeuNzKzljZmv6HcqUw19Apm5twMkVeqPKdiWfYzFvjcBFGbxZjvhXZXMGrAf5jMwWk7HLpR2B9FEYx+bYkU2CXurrOi7LiDXcSvucbieUbyPaAoW7L48RLZKIV+lDJlOKR8rxraExf6UqHMB1GF/6nlHjEeoiEIyDio3Jd5tec=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 01:41:26 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 01:41:26 +0000
Subject: Re: [OE-core][PATCH] base-files: exclude METADATA_REVISION for signature computation
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210308055241.13462-1-Qi.Chen@windriver.com>
 <3d64079d725c3c0ddd31a117bffe41f64002970b.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <63484b29-897b-abb1-84df-061e21de393d@windriver.com>
Date: Mon, 15 Mar 2021 09:51:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <3d64079d725c3c0ddd31a117bffe41f64002970b.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0159.apcprd02.prod.outlook.com (2603:1096:201:1f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 01:41:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac168cfa-1a29-4271-6ec3-08d8e75371fa
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4845AF4802C910407C552754ED6C9@SJ0PR11MB4845.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/iiWqLCqWIbT+6AOokXBxvspBOx8n4LaVZgjlQuRylhdd1daWeG7CBmOsMleKXATf3e8FQEp243LLyB51+z5LQR5viCndQq7gSPomv7aOzMl0M2naRYyS1NgRjaelAgnPkgdS8+LzlYrcLU22fr1ykd4qKjdhf/GYICBAA6s6JeZuK6ucFbrtjG6kvCqaRo3Tyh8A21SAQOth2zNf00dWYIkrQy4NPmeFgpPaKicYDimYk/LNi0EzNJWrD4K1Zn4QJRMEk6CHN6ZN8g1j3eGfsNXn9gHobmymQFJYW8UhgK2RJ3xddAN6VfRh1mmJK6s7443dxWtBIf4djLxfI6+W4uAz5j4S9c7D3lVG4nU8w+PmTtj9JwGE5c1N8RLsxu1/CV/j+j0zFafVJ3/i7cSI/sGyjsuh3dg0NevLn4nmNkULHPPxoUr8EFXFEoU0n90ZLJzORwR/+92fN4AtkPxqtUmytBSo7XraRtPysZxsacEdFulyE0X8ZpU0V+qfubCARceTk96nzfv36Rdpb6cpHGW5MqlrNKSPVLMCesCb4cLI4uC78Otp/fOjWe32twZ3TZNmDewblDyGyF5TszI8hu8yxt4DIdchmoIu16OfxP+hBBON9I+L2qZmY7k14Vtzit7seCbzy0V7g+L1Yr+Nd8MEIlNurM6aeN575/tZpjRCnc/yTesNzbGiDYLsQ8I2DbFiS8TSjog2e4GhudikKyIcycGq87oVuJP6+D7ffEBGEZN+Dk7mi6eYVIJruew
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39830400003)(2616005)(53546011)(2906002)(26005)(52116002)(478600001)(956004)(6666004)(8936002)(66476007)(6486002)(5660300002)(966005)(316002)(86362001)(8676002)(6706004)(66556008)(16576012)(186003)(16526019)(83380400001)(36756003)(31686004)(31696002)(66946007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a2hXakxXWUVvNXRaVUc2SlVlVUhIZmFXdG9wMUduOXcxTWxETHNiUGpXVlhh?=
 =?utf-8?B?R2NRdmVKbmZ1ZDZvWDEzK3AvZHF3NjhUL3pmdmdiM3pxakxLcFlGSHUzcG9W?=
 =?utf-8?B?eVVuODNkRVNJcFBxdnpFa0tBZktEWnZqT1gveVVzN3YzOWwzN0s4K01EREZ6?=
 =?utf-8?B?UXNNUjNVZmVxZENnZUNrRk1DclUvZG1ISllkZVg0S0ZUVE9xYUFCQThjaXJM?=
 =?utf-8?B?YlhtcGJyMVdKTlFJcVloOGppVEJlT3A2RStvNTFaY0dZYzRzTGJqNjkwakhX?=
 =?utf-8?B?eGRmbXZhRXRzTFBpUVBBQ2VWOVNmQkZIZmhPQjNzRzZ0ckZ1UGZRV1BqaFNz?=
 =?utf-8?B?bDJEbnRQajBXUGNxYVNxYTJ6NlluWXFKQnBNaXVNUWxpemZaa2VMTFRKTzFv?=
 =?utf-8?B?SGJ4QTZrN05xUGs1R0FJSFNSQmhhb1Q5RXdWbUVEbEtjQUptcDNaa2Z1Tnlq?=
 =?utf-8?B?NjVXbU9kNnlJbll4dkJQbytGUGo2ZzVpcFN2U0RTNElHa0Zlb0RCV1VFS0dH?=
 =?utf-8?B?QklSQXp6WVVlRDhaZWlSa05zZnFxVUFHRndYcENRVkIrb1lKQUJFaXhyUzRC?=
 =?utf-8?B?U3BEK0VmTU5YZ0ovT3RtOFg0aTFjenlScWZIbkQrL1dmM1VLZC9lRm9qR0M2?=
 =?utf-8?B?UVhHRXROT0JqUkF6K3k5QnF3ZjlQRTB2dmM1UzA5bldmV0lSeGNGcDFRZTkz?=
 =?utf-8?B?Y1V6TUdsaEhJUW9qVkU5c1FCcFA1Z09Bb0NVU1RJMEFOMUlqcUhrTWVjeEhF?=
 =?utf-8?B?alNHRGxpbnFRbW5KTGI2QWM1N0kzZnB4cFFNZ1p2eitmdXBmY0MwZlV3bmRl?=
 =?utf-8?B?R2NpVGt6enZrclkwRGNyc0IzcUVUbkRjcEU1dGsyWDh1a01qb3BrRWRYOElo?=
 =?utf-8?B?VzBpN3hkekt6bnRISXBrc09ZVHBzNnVvMUMyOGVwRGpkeFBRL3V6eXkxdi9h?=
 =?utf-8?B?TVhLMk1MOFYzQTllYldYcDNISE0wVURDeDR0Tm1MSHVZanROMW52N0RTQkQz?=
 =?utf-8?B?V3FXdGNGV0J2TCtGQmptTFdpRW9hY0Y1cWNON1hZRHk3dTRRYnF6Z3NHclg2?=
 =?utf-8?B?RHo0YWN0TDJnTFltRU4vc1lnSDAxNWFETTB0NjBMN3JOdVNmRGJMSUkwQjZP?=
 =?utf-8?B?bitMY0NiQUU2VzhmbE92UGpQZmRDWW9oYklPazNDUGpXTFRIMVh5eURLemRU?=
 =?utf-8?B?MllHMGhKNkJmZ3ZUSllNc1lvbWpXZHowQjVmOGp5TEtCemFLMWlvWGRkdG4w?=
 =?utf-8?B?eFBEcnVLcHlmeS9rUExMVmJJSExiU3NQOVRtRStjcGFTT0R2VysyYUJpRFRQ?=
 =?utf-8?B?VTUrUHRIT240SHZsS2JYRWVFbXdLcExTWUFHY1V2YW0wN2dYdGtVTGtVZHFO?=
 =?utf-8?B?RkxsSm52WUFKcXY1bmdEV2NvVlBMNnZySm5kWGIyUGJiRXF2dHRZL1I2elRn?=
 =?utf-8?B?U2lESk1DZEduSGZZNW1hTm8yTkIyc0hZc0plMVhlUVpkS1c3ZnJKTjAyVEl4?=
 =?utf-8?B?N01mclZzYnVaN1ZDcWEyemhsc2x3bytQR2gvYWZHLzBkZ1pmT3Zmam5ieVM5?=
 =?utf-8?B?KzZGbm5KV2V6OHEyc2FYbkxyOTVMdlVtbWxPd2E5cWZDcmpYbGQzNEgwNUty?=
 =?utf-8?B?TE0vbmhCNmJKRURmNkQ0RXkrVG1SUGdBWFhxNmtJbVE2b2F6TWs4azFNUlNB?=
 =?utf-8?B?Y1doNFZFeUNWb1VBNm8vR0lnZXE2a01xcHFlTVBpejd6NWZ3a2RZZGM0N0sv?=
 =?utf-8?Q?suaG9auZOPD4ZSiKqUsBY6muE2x9IoD0JzugEfy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac168cfa-1a29-4271-6ec3-08d8e75371fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 01:41:26.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1F7gd8Ce9uPFnRMSyuvvOJOLukotSgHzegQuLuHDW5SfKi908s/qPt+kYzrl3z1WfncR98k1yy10JPi3ciZ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2021 12:35 AM, Richard Purdie wrote:
> On Mon, 2021-03-08 at 13:52 +0800, Chen Qi wrote:
>> A previous commit changes poky's DISTRO_VERSION to include METADATA_REVISION.
>>
>>    """
>>    poky.conf: do not write current date into distro version, use git hash instead
>>    """
>>
>> This results in base-files do_install depend on the METADATA_REVISION, which is not
>> expected, exclude it.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 94299431f6..338e75580f 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -144,6 +144,7 @@ do_install_append_libc-glibc () {
>>   }
>>   
>>
>>   DISTRO_VERSION[vardepsexclude] += "DATE"
>> +DISTRO_VERSION[vardepsexclude] += "METADATA_REVISION"
>>   do_install_basefilesissue () {
>>   	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
>>           if [ -n "${DISTRO_NAME}" ]; then
> Unfortunately this causes cache validation issues and hence
> multilib conflicts:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3222
>
> Cheers,
>
> Richard
>
>
Thanks. I think we can drop this patch.
We record meta data revision in base-files, we have 'base-files' in 
SIGGEN_EXCLUDERECIPES_ABISAFE, and we record METADATA_REVISION in eSDK 
to avoid warning. Current status is good from my point of view.

Best Regards,
Chen Qi
