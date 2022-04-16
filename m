Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146EEC5AC78
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17316.1650102509579046023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dZIcsV/A;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=110578f926=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23G9mTsw029938
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:48:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2ZSyWa5mANfWtWCiYPzNCEa2dglvyzGk+Sgs+TbAgBk=;
 b=dZIcsV/A05/Op9CRoKYHqYkAj8j0A0SA/5Q/Mf5+Y5Q2YxktxWEY4Nl4Btj6A8G9p0N1
 ofhhWpdtVSy2fD4PZh0fpVfABnRTnsIpBP9fNPOBe3A1E9EtUzMVkw9I1RpK6XffMl5r
 KNJz9YQeTRwBJF74SSYyZUgRFe7S85CtyZhJorilMxCBrcABx3J+ECAB+AgiMoitJfxh
 3+UY0kQYLV9lQpxqvd//L3grDHSToYyvQpvsIbc9BjcGkQQGPQf2AqdoWbUUo/QlXU0w
 Z1DPxkOWrHK9A3ItgZcQtEyqY9BnEaHLgAe7hbZtmLrQpxcGkVLgovS+KrKvZZh1uitv vQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3101y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:48:28 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23G9mSxY029931
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:48:28 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3101y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Apr 2022 02:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqipMmaeFuQSjR/oGe5QsIQFc3RkH6ZqhlkLwVU9B8f2JX36wHnVGu3+QRiNvXuND2d4LnLl2khiiylU3VgTDNC4RbL19p5ASQ3zUFKkRTP2+h6yr0pyHY+be7Z/cC08uBJAldXTclU3YKPZS0/8tABRtrC/Xbn72DQBIcOxfTEYlPAxK+53o9d/y/y2efkwkkCTXiATEVzcdOjVYmXn7z+KKIejm7vY5Z1P5nENhGbRWoB0jzg/epk/KX4nGZYCVq+5RAJhuaiD/oDWJpcc71GHnV9xAaSCDWMZSi8kEzd+3iZ5S7CBEqX963e2setYrQHxelI6wp7VJA3/cMjRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZSyWa5mANfWtWCiYPzNCEa2dglvyzGk+Sgs+TbAgBk=;
 b=H/hICvrXmiIyVXwuC/+ibpwQiZTwZreiQaOuovaRoyXrn31vltY2yRo+4JKqRFpdYhSIAkKr14xn6ZVJI9W5gfcjNh91vVOpGKo68OiXO4+36oWT0CwZkXYVkoEjXT9wk7TPACigacqiqxFeUoe/C61knOiEvz+U+REeL3iV0F69rYbaBlP7ajl1yTJDUlY3U5xy3tS7Lp5TUbP9jt4r0CwBwPIo6Ku0RIQ7o+pz/onCtib/P6Bfj/rtk/nBmxxe2F9adjza0Jvars0ouuWe075rjZZqBGNfPagp9wO//3mf0ONeuxxMkH9ShLZLYaXRNKsVuiCuxp68HlNylx49FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by DM6PR11MB3100.namprd11.prod.outlook.com (2603:10b6:5:72::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Sat, 16 Apr
 2022 09:48:25 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e%3]) with mapi id 15.20.5164.020; Sat, 16 Apr 2022
 09:48:24 +0000
Message-ID: <8062c9cb-3fee-7c9c-ef87-a19b777ca2c1@windriver.com>
Date: Sat, 16 Apr 2022 17:48:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        oe-core <openembedded-core@lists.openembedded.org>
References: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddd48eb8-3b58-4b3a-26be-08da1f8e3fb5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3100:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB31000338823637BDE0876C7AFFF19@DM6PR11MB3100.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KpVOvE6Gj7QqNEX9y9rHgjox0Hn5WeWSmSs9ab7eX9LDUYrKEHQmbIarPhTTRqr849CNOBLtb+if6JYME0GaDxKMyKgFTIlCpjz9Jxg0QiyCyUS6NZyeZtKYlvivQc8mqjWT6+NYgVr+iPwziPSxaLw7FbORv7sLMOwGS2IWd8xaCciERU8h0sgl+/7duKB0e/ObD3zR1atv2GiPLY4rb2e01c0whBOLmjJHssXifTX5vC1UtJSPG2BQaOT2ihH0/AMhNT468X+s1UbLvZX6YuOLoXqpXYiy6oq4kToO3wQiznAYR6YPZKdWtpGnyJBS3YvMrIfjt/f7Rzal+R7jszceG5JktMUX0sliW0J8XhlmGZsFlZbWtcIGK2W/N5LTPWAQZRExZmVYGvchBlcOAdoG3ZQldWMTa4uF6jrcDpwJyt6TV6tGOjDLLVMRevjT3noESXlUmoLMn4K1XztvmrFbY3dFxlJkcngrTxsVcLXDxHYuCIHUY/THt7SxizDJp2LjxOFWhhwZl/aFmULxHqfaps30LcezgTI2/sFISabWGpEScLbbTWfNafAkgiY58mb5nxIZrOmQg13bXDO6RoicjQtRVjOGJschjpGcdSYMp5RYRV+ISp2CyU9X9eYET8sN0X3jKfrRqbO6slFNVe+sJYrV0AqCwDoIczkNUtszaRuU7VryBGfP2i+L/wlS16Pejp1KIz3dn1toA394xxoRycwiRBqjN/1gZfWEora0pBhgspGwlg3TWOvuMH1brCv/FIb/iVkuvI+F3trEy/zvDRkzjITWuUipoIPnVivOVsEDgJ0lxttpzU3QglRc1fBqxbwb1fBmYNuUYcKB7M6adrThe4SVg5rjHXRkRtMUWX6KzuQfmHaaYI1aaoL7e2lqHqJJpQJ+VWJjwCJWZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(5660300002)(6666004)(6512007)(6506007)(31686004)(53546011)(36756003)(52116002)(2616005)(966005)(6486002)(508600001)(38350700002)(2906002)(38100700002)(31696002)(86362001)(8936002)(316002)(110136005)(66946007)(66476007)(8676002)(66556008)(9126006)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0V3ekw1eVF2V2hHSEVsVmgvWjZtaEJXZjdwTHJrRENTNzdPN2xYT3N6Sk5V?=
 =?utf-8?B?YlhoVW1wL3ZiUlMzN2hBSXF6Wk5USVpaS3BQY09HY1hXVjZYMGQ3dkR5VzhY?=
 =?utf-8?B?cjI4Mng1aVhhNjdFOGN5UXYvTTR2R005WWJDR0J4VWNiYjRPVzg5N0ZkR0Zv?=
 =?utf-8?B?d3FSaDIwUWFRdFNRVEdnYWFnVVJrb05CV2VzKzdKek5OR3NNeUFtQWlZTlNN?=
 =?utf-8?B?NFFhQ1AwYzczVVVYVXUrU05rWDNnd000d3UzdkdTekhxcUtmZTA2MzEwRTlG?=
 =?utf-8?B?T1Y1UVcrcGV2Y1NqRDdIOUtwVFJDZkNRRzNaYXQ1TDdJWHcrRnlXS2E3ektX?=
 =?utf-8?B?MWNiWUNXcjlkS1ZNY056ZFhBbEFqRnJUcmxNZDdXSWNjVThTUXZKTDhJUUM1?=
 =?utf-8?B?czR1cUpmZlJMUHRXTnkwYzZoVldKZ2E2dCtrWDFOd3orT1paaTYwNHgvZ1U3?=
 =?utf-8?B?QzlCNWhaYlhoVmM5M3grZXI4Rm1sNUpSdnZDMEw5Z1FwV2NrcnR0YlhpalZZ?=
 =?utf-8?B?TUpTeEFBSk0yN0xRTjVZb2x4SFYwTVJpU3dITk5GV3UxOE9PK244aXhYUGVF?=
 =?utf-8?B?S0dHdGRnL2twMENIMFpkR08zOGpkb1dWak9rMDVWYWkzVUkvamt6dTFncElt?=
 =?utf-8?B?OXF1UFNhVkNVVUtLVTNBSWdsV2NhRXE3MkNnSnp0cVFFYyt6dS9LeFZPNDVY?=
 =?utf-8?B?UzFiY1hKS1RPU2lHTE42c0xFRHMrcmxvVXlVeWl1VjFONFdVbkZiaVczeUo1?=
 =?utf-8?B?cUxkOTc2K1EzL2tpcXUwRTVHUFJTejBBcVlkZW5ZbU1RRDAvQmo2RVN2MmVV?=
 =?utf-8?B?T2hKcHV1eCt6MGQyb1NocEtlL2FIQjdEeGQrcEt2MFozL3lTcW5OWGhNRis1?=
 =?utf-8?B?Q2pRR1d2NGdodnpTT3lNWFhnbFd0MkpEN1ZFNDVKNlZ2OFFPVWtkVFFoK1Jq?=
 =?utf-8?B?RmFyTE96T1FoNktNQUFNcHNVZmhUSUtkak14QzRDTDVGNGR6NklyM2x3djYx?=
 =?utf-8?B?ZEVXNG1zQm5aSHVLZjNmeGlNamI4UEZnK0xQcEkxSTAwU3hvb3Z4OVRBdVdN?=
 =?utf-8?B?OHhMbHJnYUxUbldVb005eWpJbXJISXVpREJrcFUzeFZseDA2K1F2TTJZNDA2?=
 =?utf-8?B?UnB3eDQvbnBBWkQ4bDE4bmh4M0RjWlNtV3AxUGlMWUs4K05GZWtyYXgrKysr?=
 =?utf-8?B?ZmdnUnlTcjg0OGpCbW9UNWJNWElhMWdmZG1KaUtOUEdNaHNtTTVGcFJtTlJP?=
 =?utf-8?B?ZVMyK1hlcytWTXlQTUF0WTVvWXY3dUhNQzlUdzRCbVZwdlpnR0dqOHB1MXBw?=
 =?utf-8?B?WWQxNExIRmxVWXhydjNUV2l4allMQitwZ1ZybSswYWc2dTVKelJUcC92ajBp?=
 =?utf-8?B?WDdoWVh5T0VZRFdIOWg3SjhPVXhmc3JPZUJ4UFFkSm8zTWRuaTdTZG11Q0lV?=
 =?utf-8?B?cktiOUVxSjVaZ3ZTNE9OdWtBbHJBdFJGTzU4OTNYZ3pDOE5EejNDNy9EK2RT?=
 =?utf-8?B?VUdiTUY0c2ZhN01qUWR3QXVmVjJqTkIxQzJ4dzViMGNocDlEY1FMYnUyMzRm?=
 =?utf-8?B?Z2RIdXVHaEVEZEFaOW94WSt6blZ6OUx1Q091bGlCYjlCeTQ1a3dTY3ZQT0VF?=
 =?utf-8?B?Uzl1ZU5UczZ2RHB0QS9sNERUZ0VXL1U4R3N6OW16b2ladjhUMnJwcEp1ZS9M?=
 =?utf-8?B?K0RSNm9zcTNTN3VQMDRYQlV4U0RJd3Q2QnF1Wml2ZmY5RGxTOVpuK1kreGRY?=
 =?utf-8?B?QjB3K2M0OXVjakpia1ltTmt4ajMrMjR0OUxNSU1sUHNjS0t5Umd0bU52SGk1?=
 =?utf-8?B?MFpza1hpUUozcEFudFE5QVJpVE9JZi9sWSttSUs4NVo5dkhQODA5QnpiTUpU?=
 =?utf-8?B?MHBiYkVCWlE5M29RSGlkR3JLTFYrcUJ0NExnNTV6WTF3YzlPaVdydVVJcjBz?=
 =?utf-8?B?MXV1WVp2QVZGMTRlcTZqaXFOYnhUb2FXRU9qc0xxUzM4bXAxU1E5R2YyNDE4?=
 =?utf-8?B?UFY0eXNNTG1uS294RTJOZmNrQk5DYzN6K1lUNHdPODdwM1RqbjdlSnhrbThT?=
 =?utf-8?B?em9mekZERGsrVGVVZU54OWhtTm1oV0s3Tk5aTE00MGJQZm9KNU9BSTBpd3Jj?=
 =?utf-8?B?Ky9yYzhqUnhacGt4WTZDZU1mK1RwVUJEQlZLc1pxOXFKQTNvMEl4SEtUc1o0?=
 =?utf-8?B?dEtpa0RsRjJHVWhVZU1uNDYxN2lWc252VGNWeVptd0RpWEtIWVNuZlFjTjBZ?=
 =?utf-8?B?emxUL1pRbmpwSDVhSmV0SmR1Vm1DVXI3QlMwUjRaaFhsM0pFNDFubTlqNmtN?=
 =?utf-8?B?NEZzckpxK21ld2dZZWNUV2h6OUpydUQrTFo2UkwvejN1NWtOa3RnSXAvejV6?=
 =?utf-8?Q?FgSpJVOotmJZXREA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddd48eb8-3b58-4b3a-26be-08da1f8e3fb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2022 09:48:24.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0uet4/ZpN5y65Zcx647SR41WRtUD21uOtlpKQlzmaAm6HYTnWGOotEfFu5oJb833MOb2Hpajc4/2+0sDVo5OQ8NuRCkIPfKOpLS+PStxXOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3100
X-Proofpoint-ORIG-GUID: AJ0Ya3EafytZNMq7UTMyDiBJAt9TppBm
X-Proofpoint-GUID: NNusL5Jw2X6TBm3YMYTMB6B6D5zCJkK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-16_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204160063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164528

Hi RP,

Thank you very much, I'm trying to run the test cases, but I found that you've 
already fixed them, thanks again.

// Robert

On 4/15/22 15:01, Richard Purdie wrote:
> On Fri, 2022-04-15 at 11:55 +0800, Robert Yang wrote:
>> Hello,
>>
>> The following two recipes use the similar sources, but their LICENSE are different
>> in the recipe:
>>
>> meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
>> SRC_URI =
>> "http://xorg.freedesktop.org/releases/individual/lib/libxshmfence-1.2.tar.bz2"
>> LICENSE = "Proprietary"
>>
>> meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>> SRC_URI = "https://www.x.org/releases//individual/lib/libxshmfence-1.3.tar.bz2"
>> LICENSE = "MIT"
>>
>> There is a COPYING file inside ibxshmfence-1.2.tar.bz2 and
>> libxshmfence-1.3.tar.bz2, they exactly the same:
>>
>> $ diff libxshmfence-1.2/COPYING libxshmfence-1.3/COPYING
>>
>> Please check the end for the full contents of COPYING, it's not either MIT or
>> Proprietary, but should be a free software.
>>
>> How to fix the LICENSE name, please? Add a license file called libxshmfence? Any
>> comments is appreciated.
> 
> Having looked at a few SPDX licenses, I think this looks like HPND:
> 
> https://spdx.org/licenses/HPND.html
> 
> I suspect the license set in the recipeutils-test is there for testing purposes
> and not as a "real" license but we probably need to make that clear, or only
> modify it at runtime in the test.
> 
> Cheers,
> 
> Richard
> 
> 
> 

