Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE02FC25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 21:58:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.134231.1698098290737188750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 14:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B9O6v5NB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86603963c2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39NCxCvl027238
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 14:58:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=zXTBvyZpA9GDDOnDzXe
	VPJyOMq9e/ixUtb922W00Lsc=; b=B9O6v5NBkLezYS+A6ABQkJ8x+SST9QabjA3
	UgR/YZ0kclBqFAa8oGqSHy2TORLPVbkDOZp5EqdcxxOBkUhhF94J7No8bW/DmDPJ
	+TBtiAQsobcJ7Jil5Lrv1S+Culvkgxi1sIMKG9noan2e3s8RJWFyStO+uL40zxiR
	8jRbSvmrtmEIXEQLyCWgAuAUsMjCnOTWPGhjtsxMKI1UItECWCuWp6XS4LAw/mzk
	35R+u8zd9TEzjrxEGqEW2my5TFs69SX9rkxC98WIzwv/67OHZJ5eYAwjPGCPARGv
	kp/5dla9XBT1M9Y4mXgJpbkHKjB033I2YUBUdE737HlG2rrGElg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tve5fa6d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 14:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbhIVB+5o57XlA0q4NNiN6SUzB5Ikid8Tahvra6iS3YX7wjD533cterZ1dva1zDU0mQHCFPG9tPkmfeFIVY7Bt2HI0kjUCWhGhES6pSmM5veS/V5KghA+rbSV86JeodtnmIABGbPxmKdwvShkF3ZNnnDHQmA1QZ1IBMNDOYYhWE8sAGyk1m8sWS70hGPrbPTIeIakTBy3urf50qPXNTn88iUg4d8Smc9Dq5fl/kvfS3kLuxiIlY96yIbnCk+2u12Q69WS+hLrqREvRU0CP/kDz1ZT8ZOH3s3rbRMz8CRzn7ek/XIZ6p1ujnAmTFhuri91xxpDJ+9ABO9vrGigAGyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXTBvyZpA9GDDOnDzXeVPJyOMq9e/ixUtb922W00Lsc=;
 b=JPNUyV+B2xvrpBDlo7P9RjvoHgWCu0n8/h6BCbmq2jDUKsoNWxLEIj5MX7evTUw2NVP6BFmbTlSa9pCW8iQo6rZdOrX6oJW/fHXXO6C1r0k+7/XfcO1DDZwQ2vh03F5X4l9BAPVoGBrKa+w4vKSV+eG+hoLnU5oap4TFuLacSXx175IOTh/p0+SxDcpa0xhyW2m0YzEXfqj+tsy0ujXwUAPA/5QeG7scOXClK4JBY1rO5XaGy3PwxjqgyZIh2sSF0iwpp+b7F94pTwJGUJkMsvdVCpEjf9pMuRgepKjwF0rsD9laF67CR/RT11wVXGtM+Om0Q3dPl6GwPso9FPRv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Mon, 23 Oct
 2023 21:58:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 21:58:06 +0000
Content-Type: multipart/alternative;
 boundary="------------owrkNNh4lPyFdeiyyqKWqJbs"
Message-ID: <309760a2-7e63-48e3-8461-431eb393dd22@windriver.com>
Date: Mon, 23 Oct 2023 17:58:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][kirkstone][PATCH 1/1] linux-firmware: upgrade 20230625
 -> 20230804
Content-Language: en-CA
To: meenali.gupta@windriver.com, openembedded-core@lists.openembedded.org
Cc: Hari.G.Pillai@windriver.com
References: <20231020042517.1165317-1-meenali.gupta@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20231020042517.1165317-1-meenali.gupta@windriver.com>
X-ClientProxiedBy: BYAPR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:74::43) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2a5f05-7cc1-4e97-dea9-08dbd41322fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MVCXnWPtlh1ksixu6mO3l4LV/NB63zoGdBqk4Tazxwqgzar33CJDrSbru4jzgpMiKuREdAfUwsAgoQNtugjM9jOf6lFXONVZlzVjqko9zJhxyrW8muJ2NNJYCqHXjHImuf3xF/GGU92v1zWXGCObe31Hgf9T9+sZFmaWCKc6wlhJzoZZ9JoB73deUtBqLfxJ/hvEq4Y5yV69HGU7ghVHqB/rwFrpw3Cha9wxrkAdC/6e4cYZMtDfhst42OagoTY9WBBCZHjSIzKfpONBeoAwfK1eC1oK6KSEab2JRD+2dbbVNG8eYKjTQTSq7A11gJoB4O21yYvkdrFMHUD0L6aFoNB25SO8Lb81ie30kFyUgvwS0IWBybLbXw/mQcZbHiaC1va1ZxfJ3nV2SYm9B9h+9VleSzvsIMyRpjlAWulAdyVh7ikBdDlzVf3QITytyIG0B4d2Iq4/Nrz13CMSj1j+YtsaVrmVajUgkaA0v+a9I+JIaeXxsmb5CUjZRdCXFfUhaARNGnM6Y83CAvyeFRX1+Clq0Cg9zgfzIf5ky8nva4TdIlR+UZRbtW+M1IeyVkg/htxRwKjsxiIlnVAnrQYfPFPiP4AAs5c7rhvMr0locFY8AAO9N3VBelm7YgUePwb8WIcQL7ZR1o9OzECvPLEo3D+XcJ++/3nKtQkmNhNC7Yg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39850400004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(41300700001)(38100700002)(166002)(316002)(66476007)(2616005)(66556008)(66946007)(478600001)(6506007)(107886003)(33964004)(6486002)(53546011)(6512007)(6666004)(83380400001)(966005)(86362001)(36756003)(5660300002)(31696002)(4326008)(8936002)(8676002)(26005)(31686004)(66899024)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUhmaDFsT01rMTFFUUlZNXNTODNkbW5kblNCaWV3RUx6a3lVSEZwZ3BqRVgw?=
 =?utf-8?B?NStXYmx3aTJvK25lNUFmWW9MSVJHdllzSGFQTkNwRE9lTXcrT0ZUSGdoLy9i?=
 =?utf-8?B?Y3J0c09VaWNlcVk3Mk1HbnFPZXVuUDB5RFYwdmV5UXIyb2tqWk1kQTc0LzZV?=
 =?utf-8?B?WGUvdnNSWm44QXBmREFYeW9ZWGdkNXpHcEV6dUpwMG1FR2Y1VnRsVjJnem5Z?=
 =?utf-8?B?YlN5U3piYWVQa0podG9seE5oaEg2aXdMdHpvQytmQXJUdEpkdDBldVVEQmM3?=
 =?utf-8?B?YS9mQjR2WDJyZ2kxeFdDMEl6dHNIK0lTak11VnVBNk9kUEJNTFNucXBKWTBV?=
 =?utf-8?B?MStKcjhhc3czdHR6R09YQzA2cGdtMERINm9GRUUrYkFzMWh6QmRaOU9kYzFj?=
 =?utf-8?B?RDlzNzYzRDBDVnY2RzNMSkRNcEc1T0NIWXRHbUlNQnhzWkU0cDR0eWpVc3ov?=
 =?utf-8?B?SnV3Q0dyWFRhbWYyMXRBT1NaN2h5SkZoOUdsMEJqQ3N5eUZxbDcwcXBqV2xw?=
 =?utf-8?B?c1BNVEMvalJhRktGeFNXODk1OG9vaTRrcXpWQS9CNCtXb2NkNWVINzJHSVk5?=
 =?utf-8?B?Rm05TzZxUHk0aTRPREhvRVppQ2hwWEhTZ3BWcUhWRGJIVk9ocldFbkk2UGJ1?=
 =?utf-8?B?SDhuQUVPL1E4QXpoQ2M2Z2pWL3BwTk9yQVhLM3ZSK1plR0hDdGNKMWdVZmlr?=
 =?utf-8?B?Zll4RE9tZXMwSUFWc2piOVZGZWNuTTd5YnFUQUY1dWpYWmZXcmVVZXVTckhE?=
 =?utf-8?B?czhPYmJ3b2dHSlhCelc4MmJlN2N5MFNPd2FvVCtjVThkMzZZMXBUM2FHZ1U5?=
 =?utf-8?B?Y0NQcnBNZVpQZzZuZWt3MjgzRVdhc2orMmRpZ2NZQ2h2MlNwQVNqWWl0K1Iw?=
 =?utf-8?B?SngwMGg4TXZONXZQVjAvSzBLdW5uY3RydU9XdXl4MFR1QkQ3bytzZ3BkN1B2?=
 =?utf-8?B?ZW5FNS9SczU5TU01bWlsSzlWdk9zeFdweU5IeWdCMU5OYTVUZTFZellhbjlP?=
 =?utf-8?B?LzdUUnFQcW1XaVozelJPM0RCTGxHSWs1cms5bHpNWFg0UDMyNnFjUHlkdkZN?=
 =?utf-8?B?OS9jOEM5LzMvMmFsZ0hiZGlCZUs4OXFsTDNKaE1yNnBDb1F3b1pNeWZGTTIy?=
 =?utf-8?B?b3lYaUkxWjZESlVjN2VkeUtyZnlNTVpnUG9admxTbUlYd09NUllmWXJldFR6?=
 =?utf-8?B?MXhiWmdzQXMrZG1qQVg2NWhIMWxxMGFxcVE4bWUwNDdSNnpkYktxcTJ5aTBq?=
 =?utf-8?B?UU1JbFlSd2RCdWZueDZVL2JkalBEOVVNZDhycTFvWHp4eFgxTElxZFVQR2Uy?=
 =?utf-8?B?VEkwYWp2VEFkdm4xNDA4YjJqWTdQQTFvL3QyV1NCdk8wTWsveFJzdjg2Z2I5?=
 =?utf-8?B?Z1grcUJZWEM4bTZYRTJFMDVVODVGNGNEMlNBU29VOTVzMjExM3ZjUGt4M2w4?=
 =?utf-8?B?bDZoVzY4bDJnby9VMG5aU1U2WmJ0ekhnZFViWGQ5SzN1c1VUN0tLc0JjTE8w?=
 =?utf-8?B?UUlJQlhYWkx2RDU4bFQxV2NEVnFYdGFPOWVNUXAxMW5vcVdaUWtic1MxbUJ1?=
 =?utf-8?B?ZTFxTDdJZ0prWUdBQkdJdXRlVUpSbXNrcVpraitRdjdXcmViOG9taDBzcUcz?=
 =?utf-8?B?ajVZbXRoN21KS1hZck5OZnFhdGdEZDQza2pPRDBSRGRMYW8rc3JmSTNXMVZD?=
 =?utf-8?B?WHRsN2lTcVJFazBySzFPVXNJdDR3ZDF5aUxSTUJBTkRsV0prN2srMk5ObnlG?=
 =?utf-8?B?WUlYc2doTzVQb1FLYklOMys3djY5REthN2tocmFCaEFGZmloYzVHZ3dPM0Z5?=
 =?utf-8?B?Y1h5VGhuWXhaQVJmWlJrbjNSVGtzaVIyRFNCWjljejlybENoODV5Z1gwOVM0?=
 =?utf-8?B?WFZ6S3VVQ3FSQW1NSytxaGhra3pwd3Zrd3pHcnZFV1FrM3drZzZQbUt0R1pz?=
 =?utf-8?B?c0ZzaFFSdkIrUHcvTVZPd1EyTVM0bFNYaTY3MVpPWFA4YjZBdURIdDdqZlRB?=
 =?utf-8?B?NEZoaEFPeUY2UmI1TEkyeUs4VVhTTmM1Z0JEbjhWWGs5RjlscU9iMGJPT0VV?=
 =?utf-8?B?dFhUUEtYUDdZZVdOR3o5b1FoSUN1cFcra0F1UTQwZi9UNGpUdmNTSDBBbXFY?=
 =?utf-8?B?RkZRWG9xWDVsRllKMzBXa2JYVUZEN2ZjUW5zV2NvaHV0OEM3OEVXT2xJNjJC?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2a5f05-7cc1-4e97-dea9-08dbd41322fa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 21:58:06.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJQbsh1XI6Wl4s4d5e3srO69js4iW+BZYc0/TEwTDJVnqG4H8hsxNc51OFd/Dj9Bhz/nLV6JQx+26GlyRUNIN0StxFgnI/5NWwfsMusNXzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
X-Proofpoint-ORIG-GUID: pD1Fgbx90z7RcnN5kLWtmtYbcIT_WmaS
X-Proofpoint-GUID: pD1Fgbx90z7RcnN5kLWtmtYbcIT_WmaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310170000 definitions=main-2310230193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 21:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189634

--------------owrkNNh4lPyFdeiyyqKWqJbs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-20 12:25 a.m., Meenali Gupta via lists.openembedded.org wrote:
> License-Update: additional firmwares
>
> upgrade include fix for CVE-2023-20569 CVE-2022-40982 CVE-2023-20593
>
> Changelog:
>        https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
>
> References:
>        https://nvd.nist.gov/vuln/detail/CVE-2023-20569
>        https://nvd.nist.gov/vuln/detail/CVE-2022-40982
>        https://nvd.nist.gov/vuln/detail/CVE-2023-20593
>
> Signed-off-by: Meenali Gupta<meenali.gupta@windriver.com>

To save others from checking:

Mickledore and master already have 20230804

https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb?h=mickledore

Meenali,

Next time, it would be good to include some indication of that in your 
commit log or even as a reply to your own email
to save other people from having to check.

And as you may know, this is already merged to Steve's -nut branch and 
out for review as the latest batch of updates.
https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

so no need to resend.

../Randy


> ---
>   ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
> index 6765226b9d..4defab434d 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
> @@ -134,7 +134,7 @@ LIC_FILES_CHKSUM ="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \ "
>   # WHENCE checksum is defined separately to ease overriding it if
>   # class-devupstream is selected.
> -WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
> +WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
>   
>   # These are not common licenses, set NO_GENERIC_LICENSE for them
>   # so that the license files will be copied from fetched source
> @@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>   # Pin this to the 20220509 release, override this in local.conf
>   SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>   
> -SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
> +SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
>   
>   inherit allarch
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189492):https://lists.openembedded.org/g/openembedded-core/message/189492
> Mute This Topic:https://lists.openembedded.org/mt/102075429/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------owrkNNh4lPyFdeiyyqKWqJbs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-20 12:25 a.m., Meenali Gupta
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231020042517.1165317-1-meenali.gupta@windriver.com">
      <pre class="moz-quote-pre" wrap="">License-Update: additional firmwares

upgrade include fix for CVE-2023-20569 CVE-2022-40982 CVE-2023-20593

Changelog:
      <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/</a>

References:
      <a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2023-20569">https://nvd.nist.gov/vuln/detail/CVE-2023-20569</a>
      <a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2022-40982">https://nvd.nist.gov/vuln/detail/CVE-2022-40982</a>
      <a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2023-20593">https://nvd.nist.gov/vuln/detail/CVE-2023-20593</a>

Signed-off-by: Meenali Gupta <a class="moz-txt-link-rfc2396E" href="mailto:meenali.gupta@windriver.com">&lt;meenali.gupta@windriver.com&gt;</a></pre>
    </blockquote>
    <p>To save others from checking:<br>
      <br>
      Mickledore and master already have 20230804</p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb?h=mickledore">https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb?h=mickledore</a></p>
    <p>Meenali, <br>
    </p>
    <p>Next time, it would be good to include some indication of that in
      your commit log or even as a reply to your own email<br>
      to save other people from having to check.<br>
    </p>
    <p>And as you may know, this is already merged to Steve's -nut
      branch and out for review as the latest batch of updates.<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut</a></p>
    <p>so no need to resend.<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20231020042517.1165317-1-meenali.gupta@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{linux-firmware_20230625.bb =&gt; linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb =&gt; linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d..4defab434d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc\">&quot;file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     &quot;</a>
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = &quot;57bf874056926f12aec2405d3fc390d9&quot;
+WHENCE_CHKSUM  = &quot;41f9a48bf27971b126a36f9344594dcd&quot;
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = &quot;git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= &quot;b19cbdca78ab2adfd210c91be15a22568e8b8cae&quot;
 
-SRC_URI[sha256sum] = &quot;87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d&quot;
+SRC_URI[sha256sum] = &quot;88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688&quot;
 
 inherit allarch
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#189492): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/189492">https://lists.openembedded.org/g/openembedded-core/message/189492</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102075429/3616765">https://lists.openembedded.org/mt/102075429/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------owrkNNh4lPyFdeiyyqKWqJbs--

