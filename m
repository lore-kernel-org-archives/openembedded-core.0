Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C90CC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 08:35:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16247.1707294934110113169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 00:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dCxM3n45;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2767a3df65=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4176pNCI001614
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 00:35:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=5o9vuDuWNIPWgTCzo2QtjKNOTz5Qf9UDrqG2rkQUCSE=; b=
	dCxM3n457pmEDRGcmSDLLrD/pKedmT336FrcDfzPSOWJ+3fNTo0qpthAzZ2wlVcq
	0z9gtuRCUruTXMUwUtmx2lVA3rvJVI5CdUd7blf75YAAvlTsSwlP0dEWaZBlpld0
	248BD+8/MyR8aI881hkUe2wq+o1jPTkvcq8cuSU00kENRwsGUpqeEAx+f68dAcQa
	egJ+WJT25g87OuwDoYLB5d7P+BpKw6qR/c72rwdaoSmguZLlF6xYrYkOR+DgyIck
	vAyo/2CcHsEpnRQ8jBjssvzgSLM1BtSzh5QwPAuAluzqkxCCOCmFQYq+I2XY8bM4
	FB3vPv7qlS5f7KqvHT6ICA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3umfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 00:35:33 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4178ZX69029271;
	Wed, 7 Feb 2024 00:35:33 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3umfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 00:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe/5r0GGltyPij/EpRmpd/RLGhUuyNmn4i38sW8wJfsQnDDgyYUjZl4He1QfpyeW+PMcHMtJ2kHxwDpxv/o9ps0Kz9Kk+0MQhw3+IRB2iWEBFmmlPaiKDJNJ/zOIlPfl5gdJfYTv7IyR+LAUrX5+/v2RYry+YC+eWV+YBLARaxnptN0xMtdpnmExwQsW77FVgzvBC82C2ZJMRrFfKubko4Y5SvfnO368CKLsp/+3tsEQmG2DcC86HDaQu6XynkwbssDlGVma71WHeFqA9AbVExfsnSpRD2eUIm7/jB+MD0XxBwbcSLKn4quwXiMbty0iKPEsXmBQ7GNcPbecR/2VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o9vuDuWNIPWgTCzo2QtjKNOTz5Qf9UDrqG2rkQUCSE=;
 b=T5pX6zgdVDQ6y49M7grQ1Lehr0ag63oHUR5cRDIljIu37/qLHpqYDqaxQtzc+aG7WRilIMuRCFPWIerGgB7/q5fKX8hi7crNcYaCq6/z79l4NbTlR0GWFLMpXZF8yHZm2YwlNGEGYY5wwDFgvLAUFhr4PomCGiwr//6J801sQRiDBTD0P/BwBL2n5sXdRDnJRLoHBP6zOUjDAQhpp0UwB99rpdCeDuLVdnvm7r/nyIpdZ/+/J/rprSDRg5cvIBDt38oyGxeR7jMQzw9nyNj8EstSemK9nK0MyZRjYYxt7Oxkv+NHFnldoOmC/1x3XF54GFnwkJrEy8Ki1kHcvUfkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB5502.namprd11.prod.outlook.com (2603:10b6:5:39e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 08:35:29 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e%4]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 08:35:28 +0000
Message-ID: <9a8e70be-a32a-43a0-8836-8e271b6d42d2@windriver.com>
Date: Wed, 7 Feb 2024 16:35:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] systemd: fix a dead link under /var/log
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240204080105.3614423-1-changqing.li@windriver.com>
 <DB5PR02MB10213A3C2CCB6320EEB1A4FBFEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB10213A3C2CCB6320EEB1A4FBFEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 84de9464-0d6f-4524-c670-08dc27b7bd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EY+DlC42E9pPWTqxRDQ7reXzEDexdPk4S8Z+fKwZ6YiAxZcp/tPOLKD7FrP3SPqyxK/FqhLpGR6cdIi/DyIMNVz6GFr1cGO17x3HJoWu0Q2N7N0PpDlTt9hkSm+Tq9p3js3kGlu5kmFuABR0TwuqXrWqMLXAUJWKxOtxDESXF95anF5AMhlBkh22AGRdNDBiUFCqJaxuGCe/EIqEUHKMHZXhU+NYH8uXtPykswehxo+jywnzDgDElxL+EgrwmIBhWI8T4PnxxnB0dTsu7LPKP03ejMwEGPJV5mTxgnN3zKihHvbnziW89EPj1W0Z2n3TpMTa2o/lhvZ9D1xaWwatmqoZxcA3Eb1XwM233lsXg+aTqnKo1PRXbj6/5uRSpvDspN0i6N8RpWjMUj3Vmwb9hymJvA3dgFo4UxY7/U50BzQZ0idfrGaPt6v3pepvfvl2tkhQ0CcMBdEXLTfxhCmhHgnfZzMXLqP4A6MntWta9CW8wdcGwrFR3j75u+aQuslgehoqsJr034VYSo7lzwDQP+i6sC9fT9ngDtAOuhCM+BIAZQANUAgwDF1zPKmmUOLSX94Hd+6bK0zTMGzC11yCORRPpch63ADOPZECTbOnqkhmPxbsjVHLDQGkgc9k7F02VPC3KiC+GbezoP0JLTt4rvX1/ZKhjN82QqfxMn0/E3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39850400004)(230922051799003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(66476007)(66946007)(41300700001)(66556008)(110136005)(316002)(5660300002)(36756003)(2906002)(8676002)(8936002)(6666004)(44832011)(83380400001)(31686004)(38100700002)(478600001)(6512007)(53546011)(6506007)(6486002)(2616005)(26005)(31696002)(86362001)(43740500002)(45980500001)(457024003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjFLM1BiREhKSmVxOWFXZkQ5WlpwRlIrQXdOUXZ0bXdPUlczclJtbC9JZWF6?=
 =?utf-8?B?VnFwbm5Uayt0aEZja2RwbFloSW51dlRvMFhXaTRzZEN2VG9oaGdyeTlVRlNR?=
 =?utf-8?B?MnJ6dFBwa1JydXk3SGEydHV0WDY4dktSRmd0U2dTdVZ1elhnQ2FhdTZwemxF?=
 =?utf-8?B?UENlN0VQbkxwQnAyZXoxZUY4amxoNkpFNWRLUGRKcVZNVFBQRk5Oc3FKazcv?=
 =?utf-8?B?NWJidjhka0ZtTzZpNnB0bSt5bHFzZlJmaGlHWGxTNjA3VHRUSkFJbWwva1Rn?=
 =?utf-8?B?WmcyTTFkZXFnekswOUNPRTVZN1FIb05Sdld2cW11UjJuQkFGVWtIS0w2SGRN?=
 =?utf-8?B?NVF5eTNQbUgwcGErQzBJZE1JblpxV3BURkxJd1VHdjR5NEJ4eDBaVzdiNkFo?=
 =?utf-8?B?aVhFcFBmMmNYNnpHVnc0SFhLV3NsNmIvZ1JxR3pKYnFUVzhJdHh4S2FuQVRE?=
 =?utf-8?B?dkpudzVkTndzZSsvQ0lxZVpnWUN4UnI0R1RqWnduQnZzenpYOXZsQjlOc3Ny?=
 =?utf-8?B?aHdtMm9KbzVVcG9EcUs2UkRncVpYTXhVakJUT1pIV3NSY1h4VXZBczFiY1JN?=
 =?utf-8?B?My8vbW5xUE53eE5SbVZVczFVN0FtMzhsTkFHaEJuVmNJSVZrUzdXZURzcklx?=
 =?utf-8?B?ekx5anI5aHZzN09HM0s1aTBnUnByMUhlRUw3Q0hBWEpMbTRZdEVXcUVGWVVL?=
 =?utf-8?B?MXRwYXpSRWVEdU9zNDV3Z0xlbE5paXhOTTRrTHArb0UyOVBkSTNDbVlQRDZr?=
 =?utf-8?B?NmFOSTdJWVNvZ3QrNTY2aXk1a1VMZEloMmNxQ2RPajhEWEg5dGFwTmZiUjha?=
 =?utf-8?B?bmltZnY1VXFPZUJZdWt2cjdlVVNnd25sZkptTmdMNUhTNTdTOXkvMmI3ZDdK?=
 =?utf-8?B?Nmp1NjMyS1VybzBINDdqS0NYcFZVNWRtKzNNUWJIb01BUXFZYTJWRXoxRVdT?=
 =?utf-8?B?UkVoSzVuS3o5dXd1QUN6dytramlSbmMxejdEZ3ppLzl0ckZnbVUrTlFJVGFU?=
 =?utf-8?B?R3ErbG1aZXdTSkhYVlgwMW9YTGlkVDV3QUFDZkZxeDhpdVUwK0YrT3NtUiti?=
 =?utf-8?B?NUZiNUY2RUE4bnlRWm5uNnAyYm13M1Q4eFFVb3NZZzQ1TE95SWplOG1qdGNW?=
 =?utf-8?B?YzdXQTNXWS9sOE1GWSs5NzIvdXNiYXArM21XdkRkQ1FJelFPSkQ2NWtWNmVn?=
 =?utf-8?B?b25mOVd0S3QwaTZPbUJwR3ZEcElLUW9zYXB5Z0E3VUdCaWtSQUMycTlUdXpq?=
 =?utf-8?B?YmN1V3dvZW1Rd012WVVNRWVRWGY0MGQ3b0F0ME5UZ1lsbDgzOEZjV2N6NFY2?=
 =?utf-8?B?SGNZYzd2S0ZqSmU2RWQwelNaVE9xc3F5cmk4OExySkJYVTlYRE01U1pmU0Rw?=
 =?utf-8?B?K2dtK2VndUtuOGZ3NFpBK1pkKzVVUnFNWHpYVm9oNkhCc21zelkxemJoN0F1?=
 =?utf-8?B?MTY1Zko5QUhHaHBNcU1NNDFQcDQ2R2pVU0dWRXNGeUd2di8yenpRSldYYm5H?=
 =?utf-8?B?cDg0YUFDS1N0cmc1N0wzWmkwOEFWTE1BSjNWTGorMGJhMXVzblVKSW1OVUFY?=
 =?utf-8?B?Snh0dDgyZ21YdWYzS0F5YjNaWk1kcS9rdFBHZDhZT244UjF2MG1pMDVreGRu?=
 =?utf-8?B?M3kxeTFsZEhmK1RHQjFOM3JJVUkvcXpiR2NhWDk2bHdlSjc4Ym1rMk5jbzJM?=
 =?utf-8?B?WXQ0bVMrcVhtRSttcGk4L2t5TElybTI5RUprWlRHZEZVSkhwRUVWS3UxaUI1?=
 =?utf-8?B?clNpTmlMV1ZDL2xNV3ovdUNsUUVEamUyMVJCQmNlbTJtNU9kYUprRDFOcVBV?=
 =?utf-8?B?WkhZN1pwWEM3bXN0S3o0dkdNZlhKaXZ6NjI4WlJ4THQ4THJTSjBNYWtTRy9x?=
 =?utf-8?B?K2pjS25vK0lTL0wxNml2clJvRE95S25tTHlLdC8vWXBraElVMjRLVC9mNjBP?=
 =?utf-8?B?T3ZmQ3RVQWZpZEsyTDRiNWpTdURrd3cya3ZRMWRFUjNOU0czWXE3RWdkbzly?=
 =?utf-8?B?N1VzQnpxdzN6S3V3WXFqWnAxaDVqRzdqdFBnS0VRQW5YdHFWKzNnMUtCT0k3?=
 =?utf-8?B?enQzeVZIekhpQkFiMTFjSlBTNFNtTTBlYS9EbWE1SW9PaTJETnc1NUx4RDdK?=
 =?utf-8?B?cnV0VnRIS084NWIyUGtVZmZqekpUNjJnd3dZZ3M2VG5PYWhOejRYd1BHdUJq?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84de9464-0d6f-4524-c670-08dc27b7bd0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 08:35:28.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfIZyrXx7s3zjLaoeNEDrV2ktaBHts0OdvAmQaebBdbKYLIDfTN+uiGhVa/fx3O2qDoSI3y8G+KYYCKBFAqN71wzn/0JEXkkDe4cSPP+c2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5502
X-Proofpoint-GUID: et9diEAHc9uaycX5qWFNfAGrAMgGTDVG
X-Proofpoint-ORIG-GUID: uhRix2Gxhn7TBsrzr61IqxMm39UjUojO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195043


On 2/5/24 00:57, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Changqing Li
>> Sent: den 4 februari 2024 09:01
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH V2] systemd: fix a dead link under /var/log
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
>> install README.logs under systemd doc dir.
>>
>> But for OE, systemd doc dir is splited into package systemd-doc, when it
>> is not installed on the target, there will be an dead link:
>> Eg:
>> root@intel-x86-64:/var/log# ls -l README
>> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
>> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
>> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory
>>
>> Meantime, relative path for a symlink also will meet issue like
>> "No such file or directory"
>>
>> Since OE have set ForwardToSyslog=yes, this README is not needed.
>> So remove this symlink from package systemd
> Wouldn't it make more sense to package the link in the systemd-doc
> package, along with the rest of the documentation?

Thanks, V3 is sent.

Regards

Changqing

>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_255.1.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
>> index 9e09c89355..3669d3cdc8 100644
>> --- a/meta/recipes-core/systemd/systemd_255.1.bb
>> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
>> @@ -386,6 +386,10 @@ do_install() {
>>           sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
>>               ${D}/${sysconfdir}/systemd/system.conf
>>       fi
>> +
>> +    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
>> +        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.d/legacy.conf
>> +    fi
>>   }
>>
>>   python populate_packages:prepend (){
>> --
>> 2.25.1
> //Peter
>

