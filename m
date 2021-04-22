Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.60])
 by mx.groups.io with SMTP id smtpd.web08.1447.1619114309417615232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y8SL6eSr;
 spf=pass (domain: windriver.com, ip: 40.107.236.60, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Khj0NttIHbVQcTnkMEqxPtOLniwitiukZjsRe99GA1ckavlhJ4o6iNY/GARQaAZyBdLzOKk8vlfgnoaurIUbOfdrHXoPb1XKWux2xwYXSkAoPG7E6xnrKlF1QfhPjoqKkRRT5qORQvUSfsbtLBYm7I372vs4bXsbNowAPINmdhv9NWbHI6T6nWqFwTU7dxS/AwqXySovdCy6bzZfQfoFrn6FNVmc4IwrBNI2CafqCt+eDFmpLKXSFmOcwWzd/RSdmou0RW4pzraisTUPZidcXRX6Qy97nf8aVtmzZvXrx3scXEikuW5ZyHM47YJG57CKuiqAP2yR5VFOUlKV3KkFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIFaw+fIchNHLExohWWQ6Sc32xxJLP9z9ccLpLWyC+c=;
 b=UCcPjOsHlgbt/ROOHtXAJgYeyW+hXMSFUx2ITsrB/Dby5UPtVKDSE40K03rqMSCnjzRfjs6AU6hNiiv+Y+LaLK/kvz/SbeQ8x1bat+W3Y6Ynip7tSMmuYUrjYfxBs6UvjP4jrEh0lTxVsrGL+WuxYKZPp4Dk82SWtKPC+lqMlg4TdycaRpvys62WkuCEEp99OwxQyhDi2I4OMHNNnju+r34OTkiGvci44ER7kKNz0JB0jS5eEcAo8wH8S7dogWirBPoNfiHCgQVAznfJXxoHlaysZCq3sBaAJ1z4Z/1qM3JFFC0hOCk20fcWqmCLmVEPeDXnirtHG903tOJSyGnbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIFaw+fIchNHLExohWWQ6Sc32xxJLP9z9ccLpLWyC+c=;
 b=Y8SL6eSrbm8IL4EpRBgWnLTecRWhfh0OViWaEZy4KgeX8shSwYVaqyoJXPDw7ymVtB0iR++5D0NMytJblWBzZhFynkXsRB/J3xVbCd/m+U22iBnCj5My++Y+Sz1dwFvJBzPMfEvSpZyiJXRmujaBdfH25huMB+aXPGvcaBxfo0Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4363.namprd11.prod.outlook.com (2603:10b6:5:14f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Thu, 22 Apr
 2021 17:58:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4065.020; Thu, 22 Apr 2021
 17:58:27 +0000
Subject: Re: [OE-core] [PATCH] oe-time-dd-test.sh: collect cooker log when timeout is exceeded
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210422173655.89313-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f265a2a5-032b-ed0a-ec17-21abd2ebb125@windriver.com>
Date: Thu, 22 Apr 2021 13:58:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422173655.89313-1-sakib.sajal@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:a03:39f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Thu, 22 Apr 2021 17:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a69f941-42a0-42cd-bb3c-08d905b83ab8
X-MS-TrafficTypeDiagnostic: DM6PR11MB4363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4363B76236BCC7ABCE5BE99EF8469@DM6PR11MB4363.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LkKwkoCTShkWXjxBrTwYMsFIOjI/BE2YviN9FlCNyYUu9HmXIm96EOnwY+RdYRzSPr+PTMJqERwsFt5y07DRXVAYjf0ZD5REz5fjngtJUm9ZbpYMoUpa52EcPEONgw6okBXnTHunrsXEivxlUeHmaBp2wlv7l/nYiU1y1Jj56k7/cnXx3kfFVdsr5e6g7TkKwWYrIyLDYu1lS9Yxb/aa9m5f9etsa3kGHnPIQet9yvuun4NVQ1gJwtSQ4tRpSLNWHmjZoDBYX2GkHLmt3HV0VkQ+V/sWNpY4L25GPbXPeNp1Lj4kMzeENQbmN4ZVbHBRMfGs82ZZCYuq5kFmxZTIgXAB0j3yN8WmoazM4QVEZZP0knWYog87sUKNM9iHYofUuvA21maKsksNk3hMlZWp5cw+FytQWiLviqdyyT42inhjzj/ICnsep2i0U3hTYTIiFgP9iY8EOWWVU/Z5IoPICGnt4tb7ZwlQCsFDbO6xOU9x2ghLNeX1MBg+vhdaQERfJvlnGyLmwOgfIGMHBOcLUmtGv/3ixB8dhPP0Y3yzFeuC2pp8Ey5wx4Z8OfVXmJ2Eg4cMKr9yazGHuNUzQwlWZJCIhVISD0A7ffhSWnxnxHpIn3yYHmJJ6y9+Ts1mCo8dMG87fdjMtm3yjO9ayFcyeega3cFiI5JS+stMtYtqvyjO3e6/+iz8GCJS2cx424hi/+zDV4+D5QVm6VEsKRGc55hT3wGRv9RpiFqbP6DgU4V7vKDGvMF5vjgR24DLh1b3myDbKSzPUp9gZy/szzLpVvRFN8UAH8HqsOiikoI3560SRMPaB2Bf7VaqwyNz+Sl+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(8676002)(316002)(2616005)(966005)(956004)(52116002)(6486002)(478600001)(186003)(26005)(31686004)(38100700002)(5660300002)(36756003)(8936002)(6666004)(86362001)(53546011)(66556008)(2906002)(83380400001)(38350700002)(31696002)(16526019)(66476007)(66946007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?anh2M2M3Lyt2VUp1dVZnc0ZLaVdsL2NGVHMrdXFKREkrVUZKNlpVUjArdFNx?=
 =?utf-8?B?WUp6OWxqd0V5VEdiMjd5M2YyRWVHSnFOL28xdnVMMThkM29Mc09rZ0d2YW9u?=
 =?utf-8?B?dWIrbGpxOU45SWY5TU9zdnlLek0vTk1vVERDYXE0QTBaQk1VTysvSWJDZWRt?=
 =?utf-8?B?NDB4WnpZZXI4WGhkUEh6N2REVVRMNXl3V2czZXhNT05ranNwTmcyZGducFZ3?=
 =?utf-8?B?WjFBcGpQSUlhQVpHOTRUdUlzMWtxanUzOU9WdHUrRzgrb0NTUjlaV0FiRFBU?=
 =?utf-8?B?N1hCc3g4VHJCWENKSlIzckZJYVBoanF4Vy96TkNLYmY3Y1FnSGh3WlFXYjVR?=
 =?utf-8?B?Z1Q3N25nVXBXaU5RMllOQWJXSjJ3YXhnR1FGZHlYb1VuZEtlNHVCNHl2VmF2?=
 =?utf-8?B?MStmdm8wOEdsWkVOVjE0VzV3RWtQdjhGZ0xxR0J5ZnJidmxIRjBSZkFvdXhr?=
 =?utf-8?B?ZzRyMGdSVjA2VHM5eXFhbnlGR3dtVG11eDBxWGRtK0FoNzhCNG10T0NwUGZT?=
 =?utf-8?B?WUFqWWR6QkpabTM5dlA4enh1bld5dzByRU1nakRjTnRHcTRXb2xrdWFrR2F4?=
 =?utf-8?B?OGJHeXVoNFBWTndSVEppSWhya3dpSHExcmwwNkYwVzAvbUo1Y3MwT2dvMzRj?=
 =?utf-8?B?VUh5WHlBUEgwZjlxWE5CZ0ROSGx0Z2E1TzdXaUlZci8wU0pGam5GM3BqTEgx?=
 =?utf-8?B?eHVUWlZQY012emM2VGNJS1hiMytUVUdJNldUbXFXajJVYjd3eE1YRnFoTWd3?=
 =?utf-8?B?Y0NZbTQrSERINktzWWowT1VZVGZNbFZIbU5FaWdRVDRiYkVkOU5YQkNFdlVL?=
 =?utf-8?B?NkdMbml5TzdzY1dOVzB5NnpWQlhCdXlWSjFDODNWMkhTcWVCRWl1dFQ0NjVF?=
 =?utf-8?B?cU1TZi93aEcvZ0ZQTHRJdHJyUjA1NWdEZFVwY3BRZFVxYzFrUDliWTFhd3Br?=
 =?utf-8?B?N09NOGNVQnlqa1JZR2lic2o5Njk2WFB2WDJ4dVV5SGVyZ0RWaHZGem5Xbitu?=
 =?utf-8?B?MEJMLzNIV0pZQlg4Znh5RjdsNFh2bTFHSExKcUVFTmN5VlNzOHlqN3Z3N3VP?=
 =?utf-8?B?azJpYksrWVZKTkdqSHNqMW9rUHRNb1FKMUszZlpCbEtrWVkrMlpwSHZZKzVU?=
 =?utf-8?B?Tk5RWmpETGs5SG5hQWdFVzdhMnl2TGNxN01Cb2dxb0JiYVpxZDFOUmcvMHlM?=
 =?utf-8?B?MmlsMTFvSTRGQXliVk1PSW9pWDdsMEE1eU0vU0N1SFQ5V3UzbDh2Nkl0M3VX?=
 =?utf-8?B?SlRYVE94a2FjUkVYSmxQc05uR1pXTE8wRndiWFhZTWFNWTJ3ZUdDWXhjcVBm?=
 =?utf-8?B?N0RrazZRVW12K1VuaWVEeE9CM09kaWJoWWdieURGbjhlaVRBZm1mSGUrOVZZ?=
 =?utf-8?B?bWZzNmJkWjQ4dDNydzFRcCt4ekFQOFNEaXpRQzBubjJIaFA2MVhxWnhtbmpM?=
 =?utf-8?B?K1FjaHdZV3dXZUY1Y3pJaTFBeXUyR0g2SWZjbVlML0Y0L2l2bzg1OEttTWNI?=
 =?utf-8?B?Qjc1U0g1ZFNYeVc1cUp2dkx0VHN1TGxIZXVvUVdxbzhZVmsyYUZSWGcrN3J3?=
 =?utf-8?B?VlNhdFgrcVg2anhSVUNZdStjRmczVW12TjJVbjBkb1FWSWVtRXhRMEpPWWxU?=
 =?utf-8?B?aHordHB6OGk2Rm96eTkvRDdSSUZZdVk5WEhmZlk3SGxqUUJINXYyNU9JeUxI?=
 =?utf-8?B?UDdnc3FXeEZHL1V4eGtzeUhsM0hqekNMeHJTTzJhQS9qNTcvQlJLUDZqRWE2?=
 =?utf-8?Q?8IIup8ZX0AHKJ1qSYyIK0XcDnDml/AFNQVPa9Rc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a69f941-42a0-42cd-bb3c-08d905b83ab8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 17:58:26.8501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrDWMjM+8jLo6f+cr1jweeESm2gYHPDqmUCNctEh36fYL6b0aJ6t3L4TRHLfOcdz4SeCf/LPLj+A7TWR58jXq4nYMZ7MVooWLSkaOXFtfwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4363
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-04-22 1:36 p.m., Sakib Sajal wrote:
> Collect the last 30 lines from the cooker.log
> whenever the timeout is exceeded.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   scripts/oe-time-dd-test.sh | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
> index 459071e732..2c74b49b3f 100755
> --- a/scripts/oe-time-dd-test.sh
> +++ b/scripts/oe-time-dd-test.sh
> @@ -25,4 +25,5 @@ timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=
>   if [ $? -ne 0 ]; then
>   	echo "Timeout used: ${TIMEOUT}"
>   	top -c -b -n1 -w 512
> +	tail -30 tmp/log/cooker/*/console-latest.log
>   fi

This would break on some distros where tmp is tmp-glibc/tmp-musl.
../Randy
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
