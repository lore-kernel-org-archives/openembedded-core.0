Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B82C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 01:44:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12347.1702518245563433065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 17:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0712141339=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE1cNZi008081
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fg03v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BE1i4he013921
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:04 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fg03u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 01:44:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRhQHPx9PzIvg8uwdDNvngCO8jrc+B+P0pytmwf4BNPFeFOj7L1xvFYxPXY/eW6SBj/nDp0zEdE+FBWtE++Gaq8ZkmoR5VJDNGNe+BAAiSD1ehhc+Lf70hm+WPH4PWsdHkf4NpYj2C86lbP5yBj0TGH385x5UmKKfuNFINFpKucY6xoxaw1Ci9VXEya7Rk/dYNiyIxOqlzVGBcFKlcHq863hdpjQaz0IpWv800FGnY9vxCObl9S00Z5Y0He1g1mk+rSECBrCPt2t+ELSRnHI1rklx1O3WxMlDOI7NSGoa7JC7l3B/wHSMdKCk3m9XKHyB5sfZyX7h42Qj1YCGmHFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvrncsHHpJ7YQv50z0eY6Q5XkSF1jwXM/sH7unjuWE8=;
 b=NFVJ3fS39UiXRhy6NsqNbEzlKcs7mUUHpX4cw3Bw+6SU8UqXkh1sIUGvNhJ+TDVrSdGxbL7VTja57DPVqjEhdCQ8xFt/E3yInG3bMWNsKMruFJ1Wr1t3gdqHH24EPEpO7y8Oel0IKmQlBQIYHKcalhEc6QYul3ZUcQ0NQqcgM1+R3dWhlMsAebXp2XIU8Uhpozj+6y5lXN6CgIlLcwqhd7Q8Z9SA3f5/2N3rl1FxK1g3ZM1Ml5fEcSCB71JzgcPXxiaEhZk9NhN0jvhac33OXztFDHPI9gqzfFGLXIWl4+2Y5KYZvgg+OuJ2F0YTn+WkK6kO5putMDqiUUu5miKPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.36; Thu, 14 Dec
 2023 01:44:02 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 01:44:02 +0000
Message-ID: <3b1244d5-9d4a-4dd1-8113-cfb071ffe993@eng.windriver.com>
Date: Thu, 14 Dec 2023 09:43:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] lttng-tools: add a flag to test the userspace
 only
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231201140430.792362-1-xiangyu.chen@eng.windriver.com>
 <DE373712-4DD5-41A8-AB9C-5D4B0BC083F8@arm.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <DE373712-4DD5-41A8-AB9C-5D4B0BC083F8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e25aae-57ca-440a-87e5-08dbfc462651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tWmv4s+oJBXrXBAnbVt0TKGKOZd7yqwNNr1hk0Lu5eEp1+qdZBv5N4KNmk+LQy50ZfSmpF6Lk1hMtqL/WlaQYwiycuJKmyWYrJ3KOrUSGRyHPT1lwl3Zr039PW+FgbCN38UNK9XN+I8JCWhJn/FGLWsg4jvz0EfEQQau7rZ+JBagVyU0S5gC9N6bwMwMlktCaQuNg5CV6QU7TFZfH+dBBYvAY8f7wIA3/pz3kdnj8JlpUyW/+4EIgBnN+LN6KAaS4jsz8xCo8YQWpCTAqB2vxNt8rO006ebFe+xLGnJ/VXWXsmEY2pJ6d5nW5wMSFCGXOOFJBnso+1fO91K4vIa28vb8sDn/DDOSOoc2/bueD4Bn5ua5HDwqFwPEtTOGYiue/VWliHE3Mkg39mKnrKPwcOqnjXU2/gjhi90HNILD5w80yYTjSmLkpNLjHTkXn8d8tQrRcm0VE341xe0FgFOaLax1rWteayBU4EVxWklAQpfwds3EeXYcp9KwfA9xN2KGjIfCnTQeiAaFLg07y2S8QoW2UcuDJrLLZTbH8gMfYU3To42jgAjm32Z3fgK293d407XKbx0SbfCFVTj3FiyD6PTMu0DWBuc4g3j7ZM04zujBz8cE3/1ItSlWOWE5KiMeFl/MZGVwBNzQKCmbVmjpLVdVnPUmRO8YOBA+6ypoP8l2KVTAFiuYzsNVCZ0pvt5A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(53546011)(83380400001)(6486002)(6512007)(2616005)(6506007)(44832011)(5660300002)(8936002)(4326008)(8676002)(41300700001)(6666004)(2906002)(38100700002)(478600001)(26005)(316002)(66556008)(66476007)(6916009)(66946007)(31696002)(83170400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0hCY0Z2OFhISGljMGtSc3hXRlFMbGVqSmRwZjlNSU1zSm82TGhVUmttdExX?=
 =?utf-8?B?ald5a2MvcDVLOVN0SkZOYkhwVWdUTlY2MVJBSkt5V2JkMGZrQ1FLZ1RDT0Nw?=
 =?utf-8?B?WUxweDhkUzFjdG9BNXZmNHZUbGhpOXlzdkRYYzR3SFJXR09UL21jbFUvZUts?=
 =?utf-8?B?VmI3eG5BdVRRQ3ZteVlGSnJOVk5kWVhzL0hncERnNzY0MXlySGZnTzloUmdV?=
 =?utf-8?B?WDFYTTk5V04rL3NUWTgvN3pQNm80ZTVEQlJtaXhEdFl5c3BjOVAvZ2lqcldL?=
 =?utf-8?B?d3J5T1dud3FETHEzN2E5b1ExWFpyWkF4eWtocmpYT3ljOTlPT3NLMXFoWTZs?=
 =?utf-8?B?MHdReVRTQVdzTG9NQkNxWk1uVmx6M0V6bFJQc3BhUkRKcEE5bmlJOHFPTlli?=
 =?utf-8?B?eDkrY2NTQVRXazFrcVgwbjJBV0piVFV2c1Erc2RLZVNwZmVseHJhSC9STFJr?=
 =?utf-8?B?RjFERkxPa0k1b3VYbXBPVTI4S2NaRU01VUJOTlRIYlVUYnlnRmpLdi9LekFW?=
 =?utf-8?B?RldHZlVBV0EyVmZoY21SS28xNmRGOWFOK2hleDlaR0hwZmNzYW9wS05hQmcv?=
 =?utf-8?B?N2t4ejl1UHh3THE2K3g5U0xtQ1hjZmg3Um9KcTZnc0tqck54VERQZldUUDB0?=
 =?utf-8?B?OTUxdWNZYzEzUldJNCtTdytKajhhOFZtblNMS1NUSVQ5dnBmMWRsUHJUWFpS?=
 =?utf-8?B?SnVSaytaNHA3dTdrZCtmVlZkOG9nUTlyWHF6RHJuMysrc3JoeHJ3VldONlhV?=
 =?utf-8?B?UFd1aVNCZFdnZlZWU0ZWMG9pcytJQm5YbnlDRE1HTVNGUG5DbnNDbTRDb29t?=
 =?utf-8?B?N2hXUCtXMWhQaG9FNVRkSEZSd25zQUdieEFnZzA2Zi96UWlnY2VWWHpRaDNG?=
 =?utf-8?B?a0RYUkhhQ3JHVFh0UjBSMHIrYWFtOXR4WWJmWGJLQXFGS2llSFVDeThCOXo2?=
 =?utf-8?B?R2U1dTF1QkFUelRmMmhqeU93KzVPbnQwT2FaOFpma21jYUpRbytmV0NNekpo?=
 =?utf-8?B?MDNBV0VmSFJtTGtneXpXdDBjUVpDNVZ6RU9KM0s0YUJ2eUZBRmx4ZDB4QjdT?=
 =?utf-8?B?RDFKRExMeXN2bERSL0d4amN5Z3hzZFp2bFQreHlCSVhLQjFUbmZWVWpseHlt?=
 =?utf-8?B?MWRhNy9JYVhISFFpLzR5QzBkY2taQTJab3RlSU9udHpyTGpYMUFXRldNOXVL?=
 =?utf-8?B?d1pkRk5SYzF5bmJ6c0FzSW1SWGJiNWpvOEJ2elJXdE5ncW1jTGtwZVM2S0hG?=
 =?utf-8?B?S2NRRU9Ic1VFaFNkQy8xTTdKdkh1SVkyK2xYMFk5VGx0bEhweEI0WkZqb2JW?=
 =?utf-8?B?NzFQQTN6eFQrMnFwazNNc0E1L2FrcjZQTlVoWlBaSVRCeWRCNHZkVzdLN3lM?=
 =?utf-8?B?TWU2NURqU3RBc2UrK21FcjRZbUtpSjN5bGw3NDFHRjN2bDRMQ3EybkJVcUhX?=
 =?utf-8?B?eXpLVlRvL2hkOFV6QjJYdXFzMHBhWmVVaHg5N2lmaFlEUFRENGlNNUYyaHBC?=
 =?utf-8?B?SmZUQ3FNM1JmRlJmTHJQcDIzVUZuRnUwcHVwenpobVZaYlN4ZFk3Qmc3c21Q?=
 =?utf-8?B?S3JxcW92TTBJdU5UMW00Y0NuWDEyRWU0OFdNcG1mUXpZYnpWMWRFR0Vma3p1?=
 =?utf-8?B?cVFqNlpRSXpuVmZlK3JoZFo5ajRVZXZkVEFKSkRMWlNOcUpqMnlZZXYxYXJV?=
 =?utf-8?B?YUNORDZTaEhlS1QvZFJxdFpGNmJLeU1WQkwwK0MzVlNvUTMzWFZ3K3FTSDBz?=
 =?utf-8?B?dWVBWUNIZE5rM1JVNWxsUGIxRXVpVnArMjF6THVaRDMxM0tmWExiNzdnc3Ny?=
 =?utf-8?B?OW9WTVlRUzd3dmp1OHoxamd2QTR0djhLUXN6N2ErSFpWeTNpVmY4SDRaRkJV?=
 =?utf-8?B?MkhxcnMyM0h0NFBUTVpTbTRoRU56VndkOUFTUktSZHlGN01qNjUyWXRGd2F1?=
 =?utf-8?B?TWpRaU45RmNXL0NPYUdUcWV6OUtlY2wwSlptUWxlcVNjSkJmYWRubFhqYnpm?=
 =?utf-8?B?cStTZWRzUVVNWmJYQi92dE81V2ZPU29ycXpidzdBalFNa2hDbEZnZG9ZSDZk?=
 =?utf-8?B?R2pSQVFFZDJOcDVkdEJlc3lET0VDTllDUHpqQmZGL3dhSHZYRUoxSm9HV1g1?=
 =?utf-8?B?RElVQWFuMHRlQXZ0cllBdWNKOGlPZ3ozajJPM3dNYkpQMW5rQnVmTm05QjRW?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e25aae-57ca-440a-87e5-08dbfc462651
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 01:44:02.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MtBjrmmZSHqqSSFGEKjvvCc05AxY+qEebnPoeN6OG73dc78S/jSD8isXS4RpurfsvjRplSpiR8R4CgqX+Yh+u7KS9ok3253hj/mIykA9tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
X-Proofpoint-ORIG-GUID: iLdR-zgr3XaqF8s0kytshW4tt8eBCrHO
X-Proofpoint-GUID: VEtwNBQVVIqJRcs1-AV_HlKOJVrvMhio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192334

Hi Ross,


On 12/13/23 18:56, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 1 Dec 2023, at 14:04, Xiangyu Chen via lists.openembedded.org <xiangyu.chen=eng.windriver.com@lists.openembedded.org> wrote:
>> If running the userspace test, just raise an environment variant
>> "export SKIP_KERNEL_TEST=1" before running the ptest, it would skip
>> lttng modules related test. Without SKIP_KERNEL_TEST=1, the ptest
>> would run all test cases.
> Is this something we want to automatically do?  Checking if the module can be loaded before running the ptest, or something.

How about make the kernel module detection as an function encapsulation 
in testing script instead of

export environment variant by manual? Calling the kernel module detector 
function before

testing kernel related features in test scripts, if kernel module is 
normal run the test, otherwise, skip it.

That can keep ptest automatically to test both all cases and userspace 
cases only.


Thanks,

Xiangyu


>
> Cheers,
> Ross

