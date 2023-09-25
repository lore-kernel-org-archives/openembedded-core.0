Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC093CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 05:53:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55647.1695621230342105846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 22:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KyB8hS5h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7632916375=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38P5PnHE020016
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 05:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=0oQmJFzv/XXRHdTkpANWzT6zmrIRgU8EuCPxnPd8zYg=; b=
	KyB8hS5h+YMy17ByT412mhlg4u8bbdykO42unRuAEvrkSCnBatMsdqaEt7QBtWrI
	L5CXytvcE58ycD5cRtEOL41FDaQtF85eARb+DEJN3joCo9tOE1lK4q0sI16GDnzg
	yJzzxnsZBCixrTJKUh/7zaF/6hBVtFpB8g/KOE+L07K5nfFr9oxMOGZUk9Cr16J3
	vj10v5FJGuIzO2Z6AsQl1DMe7RBhzErFczpJV6QHMRESazkXcG4ngQJ6nX70Os5/
	cHLRw8lHYnXB+IrmH7szm1fGNIIwj5GEt/s+KZTIkSCvVL8jVVnF6t1VXG0sso1j
	lH+Ve4B7DV0zWTFVqFP44Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q069d4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 05:53:48 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38P5rmYa023948;
	Mon, 25 Sep 2023 05:53:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q069d4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:53:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahyjk3TrNNjZHMBMZiM2yJ9QU9e1YdtcLku21HrU2rwCqvIut4qS6MiPhSV0KxA9tt1slDC6x5xRXsE+f3yIFNSqTKqWUu2qxDrbFeFcRoHIfNUAgdbTP53DSJPAODWX2plttjXCddm/laKBaBXQsyCAD+kDfs0RsL9qRq3U4W5j5+tVLYEgJBkoD1lWScC8OX7C4ct/tBidXwFHo1ODxw4PyXihpY5lqvsxqnSA9AKBvymzTXN4mg4ESCFbcWX/JqgocpWtLUvVE9isQBGJ9y81paAjG6XQ24Myk7z0LCkwOkRr4WDhyW0s5oP81CLbPcC+7avu/ucqNy64nuyung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oQmJFzv/XXRHdTkpANWzT6zmrIRgU8EuCPxnPd8zYg=;
 b=ejkF3BZOvoKIkgZS6OR/jmQ4sK1L2qw4dKG+JVLtuuYILvRr5qYn5dpHZtWURvdeoGIIKQCM27N2v6XZN4HWg0cW5NahjoY59/5Bhv/0x7vNBb8JoMTtA9WrGReUCM4WzNDrtqlawt8BbUhbwgErEgQL2JE4ArnqfpQ6wWZrYvLMOwK2p+i9fKLaZHk+43IOoJulSoGAwiuBhDqhFXsszMCGOLNAbcQkPMg2103gspand1AuNfXvlw6bzSsezaSDrMX6ha4rGmpVOULl4w1373M9NMrh60+W2qolDFasXc41CTIXz8KOlBjTdrgydn+lm0mPX96BDPBFcRjPPFO5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 05:53:44 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c7ac:afc9:882e:4e0c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c7ac:afc9:882e:4e0c%5]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 05:53:44 +0000
Message-ID: <bcf22b80-6530-ec87-26d0-55939427b761@windriver.com>
Date: Mon, 25 Sep 2023 13:53:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] multilib.conf: Remove the incorrect
 PKG_CONFIG_PATH setting
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230920090617.3414561-1-mingli.yu@windriver.com>
 <7f68f713e1415261131f0b01a05d7ba8258bb048.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <7f68f713e1415261131f0b01a05d7ba8258bb048.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8a0cc5-5612-42bd-e4e9-08dbbd8bc6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sd2YfGoYTPpW1tqU1ZsyBI7yNiWBznVTdwjEf5ZcMMDPmXfQR1r5z9L1QciVCyfgL0Mh0i0xRACbtUfrfYI8hDFFGmqVCs8OifgT/x+CxWpIKd1Is3M2oWEItz1l89RgXxJlPzvSaKhPL1r5WO7ut7QZXKF7WT+b+y9/HG+Loo98N+KVrl9ULC/4Di2Vc9VJJWLamiL5+DEuNxYft6uvE01a+1HBRMEgJ36el+dSAIgA/kC+e2rIF+p8N3JT98sb2d4dsdZVbN6tRqEUXGql4b+1sYrgq/nORmx/3kSbMF14DzcMDt4mK7WWUH8TLR7yLCeN9eg/2tDokCdOXwKtcvwFJUzq85fF2gITppu5b2OZAZjDKKw9mpKHv1Fh5BtJpefiq9f8uyk613JtOz2QOPcDCg4Ovm6LHzdgRYWmxyRm0yAD1WgrJ7AH6AE5NjaCpDZoFdLjqteVfGgGHPesGdg9D+PTOrn50j7XdCbGJR2HwlwGkzDmJvypcQUz6P37ohbzZ47jPsJIW9dUX7ovO+LOAL2ZK6cHP9X/hrfLAcT4ufij/WYQx3X56gUJdBMYgsFasKxkrZaNtAvzZqTz741KnMxQTgdqAkbwnNeV9fCseeCCDrwTfmEWDZhiamQGG/cJ5BHHKNbN65J2h9V7WA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(38100700002)(66476007)(66556008)(110136005)(41300700001)(316002)(66946007)(2616005)(53546011)(26005)(6666004)(6486002)(6512007)(6506007)(83380400001)(8936002)(86362001)(5660300002)(478600001)(31696002)(8676002)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejNyYVVoMnFaVDhsNGVZSFZRWitWYVpvbWZiWjNwVnVnVU1aNzVFSnQyMkR4?=
 =?utf-8?B?dTFvRFZCUFBuL3VJR2preGdOTWNTVi94aVRTVDNJR1ZVRWpzUU9HZDhPWHA3?=
 =?utf-8?B?UFhLNWlHTm5xMG9UYU5uUWVlOWJ4ei9INXZETlUwTHJQNzlBcUVFWmxiMVFn?=
 =?utf-8?B?UzlJOGd0SndzU3Bna25LY2F3YVpIRWp0VWpHbXRnaXd5RnM1WUJTVndPeGVn?=
 =?utf-8?B?VC9URGNZQ0xGQ1czL1diSnAvRmJRZ1MzaW1kbUk4bWloMmxab2Z1M1J5cElW?=
 =?utf-8?B?RlR3OUVEL3FTOUgrYkxYOVFjZ1NBOFJGMXFVWXdtVVVqSHF6TzRTZHV6UmdB?=
 =?utf-8?B?a0p6VU5Vb3VJRmdJVDZUeHZMcVRQNHkzeXNBYVVuVEtIMEZ6MmEvRk8wL3cv?=
 =?utf-8?B?NE1qV2V6Mnl0dWVOeEQ0UVhUUzhKUW1nd05lOGwrcVN1TzVabHV2NHVJa3BK?=
 =?utf-8?B?b1c4VTY2anJyUllxcVFuZm5FUmU1SVdHSTcySll6SFB6RGVNem1RcFhEcW9X?=
 =?utf-8?B?eCszYU81R0JNYWI4OVJxeWtVKy83TlorKytrTjJ1NWRiWjBDdkhGMDZVdzFj?=
 =?utf-8?B?OU1peWtaT0hwS2daVkNPTStWdjYvTGhJclNaWElMOHZza2h4SzBSOC94T0hI?=
 =?utf-8?B?Smt5a01idWo5aTZhQU43cTd6dG5mNjN3a0FwQTM4M3M5ZjNpWVNwVnNuVzlF?=
 =?utf-8?B?RHNVY0JIOEh4YXVGL3lCVVFoV051OWZmNjh2QmNWYUlIajJFOGptSDdlK2Zk?=
 =?utf-8?B?c0JtZ3piVWxzb0dNVWd4TGc0TWpVWkJCN1ZGMWxIZzlNVFJLK3FuK0hsUGRJ?=
 =?utf-8?B?ZmZ5OENOb0ZYRm5uMHhtaEMrUDFRODJleXNOR2pSUGJRQm94K3AxMEZCZjE4?=
 =?utf-8?B?TGFleWNzVjhYeWIvOUgrOTV4bHp0bE9FL0QwazB0b0NLOW1GaXp3UlZxdDVK?=
 =?utf-8?B?WE50YytzSkJBVXNETEZ2MGlxT256b0VnRjFzMEQ4L2pxVDlhYkxSNDg1SlhV?=
 =?utf-8?B?SUQyTXc5bkxsa25JL1pPbEdMNU1MVHlFNERaS2FyRUk3cEFDWW5ob3hmVTU3?=
 =?utf-8?B?S0Q1MER3R2RPaXhSanFQQ2IrSGVJNW8zaGRoUk1mdkRjRENmdXA3QSt4WXEx?=
 =?utf-8?B?bWxzY0ZGV2xLWDNCWTk2aE8yWHg2c2pJR2pLOTg1Ymh1ZUczWHI2ZEt2bFJJ?=
 =?utf-8?B?Y2NCWUt6elFmS2trVHhoa25BUXVJZUxaMHFRN0tWME9wNjdQbERUUU1XN0VJ?=
 =?utf-8?B?aXQ4dnFxd08zOXhldWpXM0dQQkRLTGM2Tlh4aUc4cUNBdUNCdDQxaDlaeWt2?=
 =?utf-8?B?Z2N4bndpNXlBN3h4MC9MSW5ydzlvYXNIT1loNExxTGFuN3B3M3gvS2VIZGpB?=
 =?utf-8?B?ZHdmZW1LdFRjV3ZtQTNlTjAyd1czbFBXSFNKZ29WUlczNURwYk1pV3N4dFBY?=
 =?utf-8?B?VFFVcm5WWTRsQXBKOWNpUEdVSEgwMXNjTW9qWkJVU3I1TlEreWVNb1pmblBo?=
 =?utf-8?B?TEFXWS81VHZVQ25GdjlzQ2JzaFRucWpKVmRMMFBIRlBkVXJ2UnFhaklPaWdz?=
 =?utf-8?B?OCs3R25IamIwSGEzd2gwdHFCUm9NK2trV3NXYU1EWlhxN1ZWT1B1YStWbGQ2?=
 =?utf-8?B?cXFRTlRQU1E5aWpIdkxvelVaQTVlTlFkQ0FmZUsyQmNFQVBBSXBnNjl3VndZ?=
 =?utf-8?B?MmIrVXZ3OEZhMC9IcWdLR0JlSWVOUG5RVGpBUmc3b3ZOUitpY1hqTlRMSWFS?=
 =?utf-8?B?azcrNUduKzBQMVhDYmV4Tzkwb1NybDdubkhxWlZOczZxRE16eENVSkNoUUx0?=
 =?utf-8?B?QXVzYjR2SnZPZ3lyay9sMVQ1OEQzRVBxZkUwanRmd0lycjZQc2prQVhzSTlq?=
 =?utf-8?B?eHZiWWRYbGt6MVVra0NJNWVhcmdIaDdFZk1kWHJLS2tIbS9GY2R6SEdOeDlk?=
 =?utf-8?B?Y0VxNmVTQkdQamw1UTRHMGVNZElhQVY5UWtPNWxOUXJUenZUWW5FR0hRZUlL?=
 =?utf-8?B?NHFWeTdydW5WV0ZHWkwxYll2N1NoemlGbU53a3BRalVyV0lYb1F5YmQxL1ZG?=
 =?utf-8?B?MFAxSVNyWnlxaS81eHN1VzJXRElKd2x4YzVmU29RSEQxcUJKRFFCbVk5SUFy?=
 =?utf-8?Q?Wvpn8P/F7W08pQLOJ88oT16mA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8a0cc5-5612-42bd-e4e9-08dbbd8bc6dc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 05:53:44.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItfjWenBDvk/kgclk7L7elCRKvryWPyGFZBV5IEXDxPUcsqIRTeD4XKlc/oZ/lXdaQQDPBKeBFW6CMaFtMA/MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
X-Proofpoint-GUID: UbqnJzjnM3yuU5_EWVBgpFCVpZg0LJC8
X-Proofpoint-ORIG-GUID: Gup2CMMmoyaT2RvGbnTnp1OOyQB3i1bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_03,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309250040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 05:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188171

Hi Richard,

On 9/20/23 18:41, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Wed, 2023-09-20 at 17:06 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The PKG_CONFIG_PATH is set as ${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig
>> in multilib.conf. But there is no ${WORKDIR}/recipe-sysroot when multilib
>> enabled such as below:
>>    $ bitbake lib32-php
>>    There is no ${WORKDIR}/recipe-sysroot and only ${WORKDIR}/lib32-recipe-sysroot
>> exists which already covered in meta/conf/bitbake.conf as below:
>> export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
>>
>> So remove the incorrect setting in multilib.conf.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/conf/multilib.conf | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
>> index ef3605a73d..09546315b8 100644
>> --- a/meta/conf/multilib.conf
>> +++ b/meta/conf/multilib.conf
>> @@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
>>
>>   OPKG_ARGS:append = " --force-maintainer --force-overwrite"
>>
>> -# When multilib is enabled, allarch recipes will be installed into the MACHINE
>> -# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
>> -# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
>> -# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
>> -# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
>> -PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
>> -PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
>> -PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
>> -
>>   # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
>>   # ${MLPREFIX}${BPN}
>>   NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
> 
> I'm not sure this is correct, did you check something with a dependency
> on an allarch recipe that has a pkgconfig file?

Yes, I have checked the recipe font-alias which uses pkgconfig and 
depends on the allarch recipe encodings and also checked the iso-codes 
recipe.

Thanks,

> 
> Cheers,
> 
> Richard

