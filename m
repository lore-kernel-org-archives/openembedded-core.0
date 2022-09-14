Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA433ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 05:49:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2933.1663134585459956928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MPz7cZgd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6256f4cbec=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E5HV0m018395
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:49:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=tiERiK6LS1aTLLOM77T0Re60gMYNjlcJ7TMVld4Tb3w=;
 b=MPz7cZgdiP+AHR6bFAjClPuGTW7z42OtF6YOi5NhLP1p78NQz3id4IYBiRIk6sb+HuCM
 19Nik7mpeyhCO/DPJ9nFpOrm5FdK6yLe4CXx4DBy1nqH3Ef8/Oy6JdtUlf0XzKgy5zuX
 hZwTBIoGk3HulncfF7Uc4BA7wCF0EODP/+FQv/xot7FsmiMcmrR5mQ9yGomvhhNPMWv/
 IdpsoyzJLe9eyTdC8mEo3BCv9ExtKdYKPDvO5XFdq1wEKHutgLpe6l5RImfc3VUPu4Lo
 wIEnv3rPOvY7BpyPFz1hNl9MUymS+xKkZvj5y/WcMMX97h4g3pyMHJP/EW2hEHSYx8wG 8g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr731-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:49:44 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E5nivD031826
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:49:44 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr730-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 22:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1XWOMoO61SachWuOO3zyQOA9SdWwrotaILDq7Tfzsf0NRNZbqP6eBwFJmBCi0JEbwssq5b5wfAO7Ae2NUxxgUZUTi4hUPSjJT607kZuJCm04fOzEsSqiOCrRolU/wpitKk6voymmqp1GGegbq/hNc80wQXd2EH4k5pTjviCdToOX8oLRrVhrM712ajxqIRcZsrHttRh6c1i+mNdQH+Kgjpu229xIDhORMeGNUKH/n1BOTNEb8Rm39+WGUzb6AqY5kiqmn6rgzkB7kehOZ7+UtNMg59gvrf2foxlktQF2wi4AgCvsg2Fxqj03wGrZXjyztOVlRUDK2LFRj8Szoku0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiERiK6LS1aTLLOM77T0Re60gMYNjlcJ7TMVld4Tb3w=;
 b=V0s6WalQK0ZSNHG4hG3IRvQoJhmO+4kV6jIxgWi2qU5G8d2WsuFXuDHs8vQwRzViby9vp/QmYwsJ2L+2Ys2RJaOrD0ayHi0DTHCIxuaC0uvLyCKbP+jOGa7C8SMrEArW0V7OY6U2v1sdQdTnVQHGzINkYu3MAvZg5m7+NUduf6PE+j/lhoGz0Gw0KZvYDIy1B2htRLaMauOZaMEpuEDfGnvXumerIQ/II6iiO3Ep834zWJ5oHsMBRXpn7Sp55Xq6m9biF936AOQZJbBcyRNWTkPQFxxAfGWefKxgh2km4FCep0adEA3TJHjYfxBmK8x5LwH6uh31SrSuvJ5whvv5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 05:49:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 05:49:42 +0000
Message-ID: <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
Date: Wed, 14 Sep 2022 13:49:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Alexander Kanavin <alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: 
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:404::29)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 30335d18-27db-47ff-07ae-08da9614ebaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jqvJ3//QKvP5B2UKHjp8frwLJ8eLh79AKp+QSyBLEEPlDEXm70b0uJOI/iI7Z33uupSPzIksjdL1ChOtouzg4XuUK4werfUBVHW0+GJXo8oitdPGg8IgnTRV+QmVHnj0qWIq41IlZIKqfJGXR2LhvoQn3lBS+PLNDaczEmvzfiUHDPuC58JrLMiOs2+n39dI7bDnG82jnwIh06l42Z1oGtSDcTSLJGlV6Ly18WsrL0W20wra7l+YWufdOWb7qFZ5zGzLQEWuIKuRffpMUsXqXJnIcsPfqc0qVH6Lv7O/Cj1X8GH81pfTOkom5n20HjirTTqYNE/fHl6oCX7pM7l+bHWuINS6FENxDJRPmnOtIstpktdKP/6t4Hq9etbZmPwwXo9RY/Nzl+m5MUSRgBKAiVot5xp92exwDUxI+kna4cAlIZeHO1gL+TmTGwy52eTw4zrMrjitG4YFAmRVhPDibX/VqlhQHtyz0D4tQPrPTvf/r35iHIZQZOhkVfwNnaHuxrhrAvinzbhlrLsaNtha5Dssg2/LrEwgDtGAmR6F9O1Y1gO6roIPwx1BRaT9Bv/F51WiCKJwUlD/DhOtkLYIAfzUt8JaegIBnMO4SePZJoJoYSMJ3oL+wvNT6Er6W2alAFKCM1Ot7DiRiszoPoTiSYlNNGLOW5+oCpUdNZFSwyvW5o4WzTRVSf6/2kTzO0auwfnibFwGIq17RL+JMMz59fpNoWwDmX4Uqz25h86TU+AMGILuUjZ8zGkAMO01qsPPOnNTHx/r/qsEbqFXv3XgMlS56z4239BMRaRPe+QocfPFsXIQfnD5SLCDjeSBJ6WhmgIuv+eBzf8rZu7q7SeUOyrIGhfeUWQN/RWeUIi+ssA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(451199015)(4326008)(6512007)(8676002)(53546011)(83380400001)(36756003)(31696002)(6486002)(2906002)(54906003)(6666004)(5660300002)(2616005)(478600001)(966005)(316002)(186003)(66556008)(31686004)(66946007)(6506007)(41300700001)(66476007)(26005)(8936002)(6916009)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUlkS2NkRVhkYnEveWR2eThGeUIra2gzcDJXUjdkNGJDZkRKbXVMUFg1YWNY?=
 =?utf-8?B?UThLM20xN1FVOFZCRG5DVmhzdWpud1hFWmdOVUlCaFUyMnJKWjFZdjAzd1l3?=
 =?utf-8?B?QnR3OXRsRURpUSs4aW84c09Wd1VrN1l4NFduS1VJbW4xQkVzNm1jRm8yKzJS?=
 =?utf-8?B?ZnpjYzBOU2VsV0RLUXFWTCsrayttdGpOQUhKNkQ3SEJ5SCtUenphdWpaWXZW?=
 =?utf-8?B?Ri84VWlJRnQ1RW5iNlZBZVBBYUFvTlM5TFA4Smw0eTJZYUt0dTUzOHNpVjY1?=
 =?utf-8?B?WmQyTGhKU25hbk5nWjBjZHV6cFJMbTJlV2NDTWFwVHExaUdVNVQrdHN1NVRP?=
 =?utf-8?B?WUVqdDRTZ24yMUVUZEpPMWZBd0hBM3gzazZJK3BPbjB2ZldVZ0hwNUdGcVMv?=
 =?utf-8?B?c1Y2algweDRINkMyeEdIZWttQnN5NThpb09UWFNzbElZRk9xQWRGclMrMHhk?=
 =?utf-8?B?QU4zckZnazMrdDY3VlZWeTJjdW0ySWZleXhBTGt5NlV1VmRjZ1ZEYXBBRlZS?=
 =?utf-8?B?Tno2Wlp2cjRyQW9kb1hUZFl4Y3ZYcVp1UTYzRFJBK0JJbkkzdVFLRU83RTZx?=
 =?utf-8?B?VStCTjVLYXg0M2hWZGRjQVVQeDNpdk9STTZ5NEZmTVRKUFFrQW9mVVBHeDJT?=
 =?utf-8?B?UFFrZ3BBTUdPelNGMW5pSjBKVElLNFlNMWdWQ2hodmpxdUVTRkR1SHFua3F6?=
 =?utf-8?B?THpDVklMRXNGZnZMRmxPSDN0QWtJT2FOL3hrd05YaG9wNmYySFBMOEZiWGZ3?=
 =?utf-8?B?clBQUUY0Z0ZZL0NNV3hIUlJrZm1MZGovQktRWjV0amtNL3JNelVpR09NbVp0?=
 =?utf-8?B?WjVoSXpOZ21PWHRZdzhTRllCa1JoV3FNQmtDdHlOdmtYelBmMW40alVVZGdG?=
 =?utf-8?B?ZkpCUW1PMTc2ayt5RVhSdTFYS3VSK3hNUG1CU1Z2YmIvaE1XcnJxL2E0T002?=
 =?utf-8?B?d1REdS9GZzVFOEJwOUprTFB2RnBaZUZIQWMzd00wdXgxeVVBTzJvWmtSWDkw?=
 =?utf-8?B?VWdVZGllRld3TjdoVFA2MGErdmtORldSbDd6L3c4SnhmVC9OZWxyVTJLa2Rq?=
 =?utf-8?B?T3I0TUxwTW9EUktpV014cEZKVi9zdW1XZitua0pnVG9TUUpzUmthdlR0dmxF?=
 =?utf-8?B?czQ4SlpXUjJ1aFNHdW1nUFBTSVl1Zm1FUDZUYnNVMFVKYlo0UmNXNkI0Vnlr?=
 =?utf-8?B?M3FRTXdjSXgxSGxsbG9kbThWc2k0VUtuMUtGMVI0bEExUG5lZ3pOVW5nMWtU?=
 =?utf-8?B?Zk1Wb1hKeUlvLzR3blFiUVFBR1VwaXZjemZPSEhNTXlTbk9WaDUwTFJReVdp?=
 =?utf-8?B?Q0JjODFlVlBFUEFTZEEyNzNPS1M3OFluN1FXa3RzQkp4emcxM3JCRWI3Z2hW?=
 =?utf-8?B?eGw0TEJrcEMyOXBWNXZLSzJZU2MrS3JXZm1mMDdpSEVoQ2RDeHNXTzJiSnZ0?=
 =?utf-8?B?bnV5Kzh5Z1hJaFZvWWh1cXI2aitBUDJPd2F3cXBxdmdIakFNZWdNNi9ZbTVm?=
 =?utf-8?B?NVhTVWpMZWhhZXdTczNMaGlvdWJlaWJLajhBdkNiWUdpUWMwY0tQU2pnNElR?=
 =?utf-8?B?TnN3VXcwdUR0V0VJNVk4aHBYVHhUUStPQXdnenR3Rnk4ZEVGL3AvMXRwTFdI?=
 =?utf-8?B?TUdFRkk3bE9LMW03WUFSa3FMbGZEZzcyS2VPWE9pdXRQSEk0cVI2UTZyeEU5?=
 =?utf-8?B?SGZRVHZFUlQwZXlUQXgyaThmTkhGSWRDWUYwaElCcFl4V1grMnVVcEdBVWJm?=
 =?utf-8?B?aUZrTGowUHU1ZnVJbkVMcFdDN3Y2SFVPelgybEFuRy9RUDlweDVCZGpNSjVF?=
 =?utf-8?B?RzJLMGRJVVNsa3YzWE56cFZFRTVsWHp4N3NxQTA0cVVoTTlvem11ajY0bHdE?=
 =?utf-8?B?U0ZoZll1ajJHMUJNb2MxZXFuZVFxM1lueWd6Y3I1bFhvQ0dQZTlLNmRnVmVO?=
 =?utf-8?B?R3RqRVJJZ0NheDdCazlnNmFEakgyQ0dLT2FBbVM0NVp1WU1mTzdoWnB0WkNX?=
 =?utf-8?B?dWxxaXpMeXBtbWZoMGovSnZNNVJlaUFQZUtOT2xSVmxNcDVnVUNPaXVNQjZ3?=
 =?utf-8?B?TGpiM01DVDBjYTNvS3NJWElNVHlCRzBoaGh3a2xlMHFzVDJIRlpGbzJUVkpK?=
 =?utf-8?Q?mEP8/osVNsYGlLi5aqFrYJjtK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30335d18-27db-47ff-07ae-08da9614ebaf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 05:49:42.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DG3bPYOTCClJ6h0atJIUS/qR8Ra5FRQeWPGSpj7TFDgVCJMTfMbv7jy/oifDpJ32wg8rGgI1C/CrqSus0yAHfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-Proofpoint-ORIG-GUID: oPeb0rQmw_XPyazyRcCyHcdFP8CA7YXj
X-Proofpoint-GUID: r6GVca1SqrEsZkza0l8Rmi-lVilRnCAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_02,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 05:49:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170633

On 9/14/22 13:00, Alexander Kanavin wrote:
> Hello,
>
> this is done for reasons of discoverability and consistency with
> machine and distro definitions: they all should be under
> meta-somelayer/conf/. This way both tools and humans can easily find
> the config templates, and be certain that this is the only location..
>
> Alex

Hi Alex,

I'm reluctant to agree that this is like machine and distro, because 
it's a hard requirement that machine and distro definitions be under 
some layer, otherwise how can bitbake get info about it? But 
TEMPLATECONF seems to be a different case, it could be everywhere 
because it's used by the project setup script.

In our case, the TEMPLATECONF is <project_dir>/config/, and layers are 
<project_dir>/<layer>/. This directory hierarchy has been working for 
years until recent changes.

Do you think such directory hierarchy makes sense? How about we deleting 
such check if there's no strong technical reason to do so? By 'strong 
technical reason', I mean that some codes in oe-core are written based 
on this assumption (this is the part I'm sure about).

Regards,

Qi


> On Wed, 14 Sept 2022 at 05:27, ChenQi <Qi.Chen@windriver.com> wrote:
>> Hi Alex,
>>
>> Why must TEMPLATECONF be under a layer?
>>
>> Regards,
>> Qi
>>
>> On 8/31/22 19:13, Alexander Kanavin wrote:
>>> specifically that ../../layer.conf exists, and that second-from-last
>>> component in the path is 'templates'.
>>>
>>> This requires tweaking template.conf creation in eSDK bbclass, as
>>> we need to ensure that the path in it is valid, and exists
>>> (which may not be the case if the SDK is poky-based).
>>>
>>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> ---
>>>    meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
>>>    scripts/oe-setup-builddir                    | 5 +++++
>>>    2 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
>>> index 56e24c4eed..925cb313fc 100644
>>> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
>>> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
>>> @@ -438,7 +438,8 @@ python copy_buildsystem () {
>>>        else:
>>>            # Write a templateconf.cfg
>>>            with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
>>> -            f.write('meta/conf\n')
>>> +            f.write('meta/conf/templates/default\n')
>>> +        os.makedirs(os.path.join(baseoutpath, core_meta_subdir, 'conf/templates/default'), exist_ok=True)
>>>
>>>        # Ensure any variables set from the external environment (by way of
>>>        # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
>>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>>> index 5d644168cb..bf832ee0ca 100755
>>> --- a/scripts/oe-setup-builddir
>>> +++ b/scripts/oe-setup-builddir
>>> @@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
>>>                echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
>>>                exit 1
>>>            fi
>>> +        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
>>> +        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
>>> +            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
>>> +            exit 1
>>> +        fi
>>>        fi
>>>        OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
>>>        OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#170101): https://lists.openembedded.org/g/openembedded-core/message/170101
>>> Mute This Topic: https://lists.openembedded.org/mt/93368468/3618072
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


