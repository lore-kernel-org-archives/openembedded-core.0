Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65007C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:58:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.949.1643925536222972835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LWFPx/i7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90331aff7d=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 213LeFiq013965
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 13:58:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Zk6qtIhYhCzN5AX1p8yFSMcELZwb+aEImtYzCk861j0=;
 b=LWFPx/i72txiM/+lyGgOjYNTTq+DYfadY6BlbR3bMndPEykA9Y9lS2vnF7l4HAUvJcFh
 VUV8KebR15t5IwLJRuFBOmwYyg35zr26zjjAsTx/SEaMvaTCltq/gMtK/RKMWq6GDWTa
 YsZkBY6OWoqd9FBjf43fr7bw1hGE1Vno8Uf53ajDLIVhxDhN0I6sRezY7t+Z5lVHbndi
 QYZhg1Lpm1XcW/nFx/7lNjlHa8+L/qKjrMud57GFRUK5aB7Q2SfIpx3fWfQ9ah2RLPcQ
 RfRmDlpDvUmQfmGHVMytxiJwKL2elXUMbeQ6zIK3bxgZ9g2P8/vWlIXXGIWcp5N1jXp4 qQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgg7uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:58:55 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 213Lwt27021882
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 13:58:55 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgg7ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Feb 2022 13:58:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0J9+Bj/rJV0PmprK4gLWMQIZs3aivZW0aKT/dpRcM0o18A9OtkFBg41qU1PAiBp73JI3wniLS/AzsmvDcRaeNpLQCXsXnQkrM0WkMKVRZUMH3bAJKZfdaZOdURoLis/kUGBdMme/Gudw/V3Cdz2wzqz1eB8fIMuG2IuOaBJLcBwKUuUTdrTCQfof2oriXn86oz1s7ZfDVeui4pxDDZ9PLHP2zbxOgzpd4P5BKArGQGJXblqLJC/rD6qFuDgM18KqK92xMxacRnm2qjBlBDIWLqOA225HJ8i5DEB0IJhe2/hK9rn+sv2QEeqzdeRypqoK8sx6DClaiC+inreWBwQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk6qtIhYhCzN5AX1p8yFSMcELZwb+aEImtYzCk861j0=;
 b=NPN0t7nxJw83eewzNBeHhXfE+tne+cwmLioHHEm2eyNb7d1qTmL1fJK54pmEkki8AzgOe8idrJELnB83wbvXAH5REk3Hc8VUcYWSvwivHoRpry101UNqmn8AFheRWAGejaXL2ny77wpargstf2L7n609FK0rmfkqRNTjzVyhMDtidBfbPmEVhknzyay6lidOG82vUC46eLGXSDS/q3Ub3fMywdrWZivKApGqps670RdSrBccE9Xm768J6t9EpoXaPITV80Yu7OhS+xMxIQkQNzrjndikc30DlHD8z2DCGUb0VM5jos3t374YE4Nsl6TAAibGsoubv0CJu6lKOhHJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN8PR11MB3729.namprd11.prod.outlook.com (2603:10b6:408:81::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 21:58:51 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 21:58:51 +0000
Message-ID: <aca6f0c0-decb-2fdc-03f9-54a8cb896e09@windriver.com>
Date: Thu, 3 Feb 2022 13:58:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, ticotimo@gmail.com
References: <20220203170724.1319808-1-saul.wold@windriver.com>
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fff3ab3-7ec7-40e4-a928-08d9e7605cea
X-MS-TrafficTypeDiagnostic: BN8PR11MB3729:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB372987EF820255BF219756D2EE289@BN8PR11MB3729.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	px9/OyTsxTotHcl6MafIsH2fSb7rK420GTVj58B6NOd6Gi+Ro0Pv3qsrWHgcfmtD9OKRFMQfAtad443qTiTLYZPBGf3DhoTCrcv4ylWCPO0siSWFvi4HgRSKy7wd7pO94x40MyXqjZDskgy43e8n4i4Dq/HaWVajwjEztHPrf44Ojqur9FCu/nU0elJd4b3FhEPqU4U3mfn97rn0boXzkanUER79d+UhuFyWmoaQHHNOyh5e0JHnRK1/8DE1v+5cbfaHxj/bnksNWkbZmzmMEniyL6XnQEbhCT0Qr/g9x6BIqr17YUcdoJjmO7RIZG2zvAg+M6BCuXRCRvbLR7fnqyyxjfWmm77QyHCPO5Fe2JZlXro8KBQf9i0ajWzM2IVokZU0hk5dmsfQCOYfcIQW2+mcKl/2YxMiOiFo/Xo2X9CtyoexVCClyLr5Qru1H2oOxMCuRe+6mqDdO6bc8mgOEh6VHAQzFWLyiCKHaY6Rz3DEYLYcvl4UEapCztN9gBMkpwsv9IO12Wzh6+ihW256l/5WIDYlMhHDmE7iEoPE65SdEr7jpig+Kch/qTxARvHss90ESWiCJn2o/wMGqjMqpdwo/R6F7g2Ki6TY+DGIsUSTuwP4iV4FxnvzqdvDEsANmwfRk1/Y5ughdxdeCuoT+rjliDAdxY5yiX1aTWv3lSf+Vmq8IZRvz1c5M0R86ZOQbB22jBFDnXC0gsWWUo1rLd6KEMHsIyW5uY/sytkbfoaNc8sOqnPToYsQKXa+7GmXte6ho0xN/dgbOtaVtZb6BQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6486002)(8676002)(66946007)(66476007)(316002)(8936002)(508600001)(86362001)(5660300002)(83380400001)(6512007)(52116002)(38350700002)(26005)(38100700002)(36756003)(53546011)(2616005)(186003)(6506007)(31686004)(66556008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0ZSR04rUHcvaFlSNjBLZ2tKRnFSNnNJR0ZXZGlBWjY5UjBPYVFtZVhkVmNu?=
 =?utf-8?B?YzEwVGJHc3lwUm82Z015V1luQkc1UFBNTGtpc0dsMXNmY051MHlvd2J4bjdj?=
 =?utf-8?B?c3g3RFMyQTQ2NEFaSUo5RUVuZWpOMjR3NzFVemIwZmVVR2pvNGRtNDRwM2xR?=
 =?utf-8?B?dWMrejJFaVdZL0g4Yy94SkRrM2Q4TlF0Z3p2NWNwSFdHS2p1SFVqU0FnUkhp?=
 =?utf-8?B?MmFQek42QlZkNHlaaVVad2p5eUNML0RLUXlNekU1UlhvaThWY3Q2UWEyZ2h0?=
 =?utf-8?B?alRjVzFYM1hEdUtCRElGcXUrZmIrWW8zM2p3eEZOQU1tbm0ybDVvMTRNVWZ0?=
 =?utf-8?B?cmpSZnBoTGN6WGJ1Mm0zc2FOR0pESmZQaG1iUWZSdkkvM1VaWVFCblJabkxI?=
 =?utf-8?B?NkFrN3dRYkpZci9SUXVZcmYxMVZWYnVidE9YQ3pqY1JUcUFOZjNYQ25jdEVq?=
 =?utf-8?B?emc5b2h2U0xmUEttTWlOLzBERjZGcGVGd0tvZTBqVW11SEFncTU3SW5FdzFU?=
 =?utf-8?B?K2tuaHl1R1VMdExwcWRYc0grcUZXYUhJS09NeUZ4SVYvay9oV2pKYzU1SUNa?=
 =?utf-8?B?S0RoZlZ3cDU2N3QrMkt2clJ5Zk5oTVdmaGtCMHExa3J0YnQ4Qjg2TjM3UzAz?=
 =?utf-8?B?YkI1UktDM0RkbkhWY0FZSXlUWDFONEFlWEFlako2L2xDcDlkaGtiMFJJQXJV?=
 =?utf-8?B?bUpMOHFnVzh1cmtQYVpBSU55MHNZb2xLQjNNd2tsZUVrbkVHNU13c29lZ25B?=
 =?utf-8?B?WkZIU2ppN0RlUzBhN3BTc0Ryb0VVQkZsdTlucmdtSzNrRjhCSHdiMFRVdHYw?=
 =?utf-8?B?UXVqNjdFRXViTXJzOFgyT1pvR25qSzM1VXhwSkV3MVJZU3E3TEhnM05BcFFI?=
 =?utf-8?B?TVdmQ0Ftc1FTTHB1bFlRSFYwTEhJTUExdjJHY3J4QmVoQ29DRlVYNUY1VEdm?=
 =?utf-8?B?THlOYng0VE1lYXJmMkd4TmFrQXA0SkttejBoZS9sTTNRV0kzN2xjektiNEtq?=
 =?utf-8?B?b0xJOVh0RHo2NnZ4b2ZnWHM0OTBtcFdFbFdaWkUzNE84ZUJMS2prUDZwN1h2?=
 =?utf-8?B?aWlrZVl5YjdLWjdqbEZRcFRNQ2RoN1NlcFhJUnNsU0JxNnN6TXdkWkQ5MWFr?=
 =?utf-8?B?NEJtVFJITnhKNkhYUndOd0I5dEQvVWVpZXVKZXA3Z0lNYkdNZC8xaDZ1Z0dZ?=
 =?utf-8?B?eTVHU1dLbjg0ZFNIK2RMaUZXVEZjU3hMZUVSd05yZDRQYmJSWDI2VjA0OTJ5?=
 =?utf-8?B?bXp6OE02VUNWeDdETUdpUC9Tb1dXM1hXUE1sMEE0WHBuOTljbjZsN0p2dU51?=
 =?utf-8?B?aFRnSUtRdXlCSExUbUdHUEFMd3V3anBNVnZmV1k3Umd3b2w4bnM0ZUQ1dWsy?=
 =?utf-8?B?SXhFQjg2WnBiQUx6M0puTWhlKzRJdmN4L3NOWUFDb2NNZGplUGxOVXBuVzFp?=
 =?utf-8?B?ZUF1YVZPS2FUYmdWSms5aHZtbk5DSnJlTU1wMWhhMGk3REpOMXVoZFF0WUpm?=
 =?utf-8?B?MERIUVAyeGdkcXZ3WWZsbWt6TjA0azRqVEZSRVppVmkzeC9Lc1BGUkl0RmlZ?=
 =?utf-8?B?V1VUM0FkWUFXY0dhOWpnU3M1dE5EVHFQMGZXdkw1bDl5S0UyV3l5SEw0TXpT?=
 =?utf-8?B?WHI1TEdFcnVJM05vamVhZEk2UlJNL3YyTnpZT1hsM01wUmdpbm5IcGdRL0U1?=
 =?utf-8?B?N2owS1I0WTVPbW9na05GQzA0ZDJ4QitGVmZuSjZiTXBPdzFBS2JRd08rZUpo?=
 =?utf-8?B?cDdNZGNxUzRkeUtia2RpVFEzOFBSR1VyMExuTzhNWnkxdExLQXY0UVdkOVRP?=
 =?utf-8?B?cld6MTVtZW5BK3QzL3F2VkZmZEtXSStsVXFEOXhkVWR6NmllT2tYMjMvWm1T?=
 =?utf-8?B?Tmw4M3ZKMW5LQlVBanY5cTM1SkJhZEE4YmVvVEcwajU1VnJOelBmOXlrcUow?=
 =?utf-8?B?c0pVYTNkMUgvZkpnUTl1UTlvUkNZNlV1MncxZ2dxV2VuNkJGUWkrdnl6MXo1?=
 =?utf-8?B?K1NQVlRscXh2dDRkUlhuVU5WbUZlRGI1Ukh2NDk4Q3EyZnJqR2MzeUhUOFBt?=
 =?utf-8?B?V3YveG9MMk5Sb1U0L0pwb3FnNVNJbG53NXNMaGtnV3ZzTi91dEd4bE1SSlEx?=
 =?utf-8?B?RkhKTFFoblQwM2NwNUdvT2xhUnZHK0xpNmdqTnpoSTlEWkxBVGFMMC9QcGNF?=
 =?utf-8?Q?dJk7/eudi/aTABrCJh3COjg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fff3ab3-7ec7-40e4-a928-08d9e7605cea
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 21:58:51.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Jlkw+FFgQB0BUxnYzUQ9u4N4R/so0NeNbP0Wv14gUHOvRuWlRhnrY9Jd1u5srgbt5csOv55Kbk74HPCAcSBwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3729
X-Proofpoint-GUID: 6enpWDcBpwFVYO5PYSBOeUOYbFlQKNir
X-Proofpoint-ORIG-GUID: dP6x89pdq8_E63J78QqVXEHZ8AdFLWvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:58:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161322



On 2/3/22 13:24, Richard Purdie wrote:
> On Thu, 2022-02-03 at 09:07 -0800, Saul Wold wrote:
>> When a file can not be identified by checksum and they contain an SPDX
>> License-Identifier tag, use it as the found license.
>>
>> [YOCTO #14529]
>>
>> Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   scripts/lib/recipetool/create.py | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
>> index 507a230511..9149c2d94f 100644
>> --- a/scripts/lib/recipetool/create.py
>> +++ b/scripts/lib/recipetool/create.py
>> @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
>>       for licfile in sorted(licfiles):
>>           md5value = bb.utils.md5_file(licfile)
>>           license = md5sums.get(md5value, None)
>> +        license_list = []
>>           if not license:
>>               license, crunched_md5, lictext = crunch_license(licfile)
>>               if lictext and not license:
>> -                license = 'Unknown'
>> -                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
>> -                    "and replace `Unknown` with the license:\n" \
>> -                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
>> -        if license:
>> +                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
>> +                license_list = re.findall(spdx_re, "\n".join(lictext))
>> +                if not license_list:
>> +                    license_list.append('Unknown')
>> +                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
>> +                        "and replace `Unknown` with the license:\n" \
>> +                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
>> +        else:
>> +            license_list.append(license)
>> +        for license in license_list:
>>               licenses.append((license, os.path.relpath(licfile, srctree), md5value))
>>   
>>       # FIXME should we grab at least one source file with a license header and add that too?
> 
> I think to close this bug the code may need to go one step further and
> effectively grep over the source tree.
> 
> We'd probably want to list the value of any SPDX-License-Identifier: header
> found in any of the source files for the user to then decide upon?
> 
That's moving in to the create-spdx.bbclass territory I think. The 
change would need to be much larger. and I will likely have to shelve 
for a while.

> Or am I misunderstanding?
>
Maybe it's my misunderstanding, Tim has mentioned the LICENSE related 
files in the bug report.

Sau!


> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

-- 
Sau!

