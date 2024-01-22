Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC66EC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 05:01:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.66410.1705899662020464866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 21:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ZBr3Q/sH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M4Us9D006187
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=RqK6goFKdld0wg3tsF/eIC2iFFn3A8NL1OPifS7tzuo=; b=
	ZBr3Q/sHR77H+NKJGf7iHIfisyJuQAjiM3qLeeC+i2VGL1MR1J0wskIBLO3ieY7t
	dveICBtxqwxxROwYQjXCyef4u8KvhZaOOPSRKbpvyDEed1Zrj9qZbym+jL+0yspC
	1964AHPVmMdrrsADtJ0w94q5fBEnbTHqcI+W2fTrLCM1yPcmUUQrD8MTs7bxHw/J
	M35If3Lq+yhPp/8elRETyCExu5LcClVWhFqorbxbJzvf9sS3D8DJfW8+uAMfKWVp
	TCPhGbTN1vSV9gWzDdhwnZ1F9f24gKo7Q/nY5kxX5OYkz+cqCo7/66jWrpuq7yn6
	9XN0v8uKQrDMKVeTF1vJ4g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571gut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:01:00 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M510je009210;
	Mon, 22 Jan 2024 05:01:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571gur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 05:01:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgSzvh6cGQl/U7qQmSyz6S+suAEHxUIl1vJKdRkf4Zvp5GWU7Q1P8IJIxVGp6ADQwzuu2tmrjmXuOh4zM0oH0PQ8XX/MSTCrsPqG+HenLSCB0rX/j1Gqo3rTJlXeF7MYQEualEGe1lMgLS5xHEQrCOsDHCDQaIyy3HhvW/8wmKyPRn0+4KVFd6R2dYoytYTl/ymMWJ2j8JLXt3t5vKM2uR3LXlykrbu/ya5ViAPbApxpwZwQb9lEIcrTy6dLZTBRhRJ/87wHhmiZw9i9qbQsIzmHcVCspP1Bm78lDAeos4tpXmj3qBhT+xDiXT0w1bKqZL8Ls1mysg8sPHviX1Rt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqK6goFKdld0wg3tsF/eIC2iFFn3A8NL1OPifS7tzuo=;
 b=LAsrs0oQ+MtaZAcYSgOczaEqNE+eO0wZ60dgvXpytbATIzjsPiUhAI8r6kigI1eBraRT6xRpfxVUL+Rcyryu9PAphBG1igPcHFPJKWlUDJJtzjviDUmuXpU0xzy7McRDly/IomDDtv+74v9Q/nPMVfqlJfswTQF9Ht6YVIgbv5lMibo3JJvGDO7qxaR2UcKJUcO4nNT3XpWC8luhAoCrkdpHC0KqJfTCUYOqoKUk4Ewm+Z1jyV3TvbYfbBZY8EBgZizaaUSg1MdnwajGhr8ZX7Tmc3oNoRhXlTzZ+qRj7L7BaVU+GbwSXUGbJDeaKrjrqYyzFLpBxWjqDkVvVmNP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:00:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 05:00:58 +0000
Message-ID: <0e49bdcb-51d8-0b6a-9932-8404447ead02@windriver.com>
Date: Mon, 22 Jan 2024 13:00:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] devtool/standard: avoid KeyError
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20231226044457.3699093-1-Qi.Chen@windriver.com>
 <0dcd0753b7a5370bff4ecf9862847b64afa673bd.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <0dcd0753b7a5370bff4ecf9862847b64afa673bd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edbc9b9-7c3b-4355-8492-08dc1b071f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A83vzMPoUu6QkEh7CgoGcF1u+pNIaXTJcLbJu2L94V8OGrJoEswSJvjuiTklCRQ9D45VZqELGB332GIVZzDh54V4J3DHoSFO5w1hFmQlY0oKOhnowgCJc0uBfMYm0WdSyalWp/j8cfqlbIU1jQOMdGjeG+SqsKDL8NGG9+tppaYS3QX/CS+hQo1gFuhR7UvvS6RmhkgAeXk3/6r/bqiDRWBDiXySrMGMvUYwsXIeOunEVgPSzeeh9FEvTs10Kz4Ko/4IgNTgRdORqiLKil7q7LubXhYmlBK4Y5nSB5OBDAj0U/ouYlSopj2mfmecNty/ns5eGTwoYyUPCdA6csDgIjy780PB6HMdoOlvx0hcJL4d2B9NnTc62AtMMquqUbvRu45Gn3lJ8nkL0M1mJOoA75nsN+GvcU6A+Of63P8Z4O7W2TVYq19lxjsE5KdqG+Ej1cyZl+lcgg43oJ+Lq3a1NL+Jlir9JGCfOeQrFPiFVrW0pOnRrm/9oLa3CcIENde7Cf6WjIiq997+MpVrn/D+YywVHwZ9TsjZNZDtO6UE21qK6u5dpgWgJM519z+97txuG+IoH7Z++Vt/Uu1iSoiCBb17X4BXx7IiQCcTrjyBPTvkIZFALfbTHjSGTReMMkN+207vqpqVsrXbTFFZwVhRdw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(376002)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(31686004)(26005)(36756003)(4001150100001)(478600001)(6506007)(2616005)(6666004)(53546011)(83380400001)(38100700002)(6512007)(31696002)(966005)(6486002)(316002)(5660300002)(66946007)(66556008)(66476007)(86362001)(8676002)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDZTSG5reHNhZ1hCTTB1N3hWd1llUGxZVFRRSmU3bVRHSlVqYmozNjNuN0V6?=
 =?utf-8?B?ckxIeWxnbnpLeHpNR2VBZ1JNSTVMOEpLM0oybi9oV2V6eXd2U3V1VGZzSGZC?=
 =?utf-8?B?QUtHTE0rWThkdzhEUFNQSFZWdnMrU2QwdExlYlpJQm1XQlZ2ZHRiQ1pvWkwx?=
 =?utf-8?B?dGVQQWlvYkNhQ3hRMS9EYk1Rem5PTlVRTmVOemxoVTFmdTQ2WmpxbXR3OWxi?=
 =?utf-8?B?ekFSU3dVdWcvNkpzbjl4bGc0dDg5RFIrQVBWTVFmMjEyM1dJZUlvYUhXbU5w?=
 =?utf-8?B?SFhuQ0JnK3RxYmVhZnBPVHg2UzRJSEw0WWtxaGtGU0lMMkVhdCtPdlcwdmxK?=
 =?utf-8?B?Z2w1bVljODMxYW5DTE1DQkdwQ1l4MWFwOEkybStpYktIY1Uwcys0V0dYZEtS?=
 =?utf-8?B?QzNMVUZFTHhvTzVndDVydm1LNDQrbUZGaDJEUS9kMGFzQ0N6Wml6Q0lnSlk3?=
 =?utf-8?B?SlNpVHpqL2VEWnUxYnNqdkM4c0Q4b1hCVVdGZG5FbmV1NS95dGhkS3pCSGF3?=
 =?utf-8?B?aUdFRDFjMmU4R3ZWZUh2cHEzZTBBT2NVU2hHWTNVdHN2T29ZclhzbWkxdy9D?=
 =?utf-8?B?Qmo0VG55c1RPZy8yMWVYckwydjNWdjNxR3lMcjhKcDhlNzVVMzh4eU90QlY4?=
 =?utf-8?B?RVA3UkZTZk9NK3FGMUxoZ0QxS0dVeWxkaC9xZjhZWW1aWDZlZ1ZQZ2ZaNmJw?=
 =?utf-8?B?WmJrblFpMm8wekFPQVU0SjFuS3VRajRFSUlZUHV0Q2JlWTBvUWszRFFuZzdv?=
 =?utf-8?B?U21PK25xMGtWUVpqb2NYS0YxTTNMbHFSdlpTaTRSUExTTml5SDI5RCtYdzF4?=
 =?utf-8?B?elFIdFBYc1FZcDFNd2M3Qnc3WTA1NVdLZkE1RGxCZ2lLUzBBNHdaVmV5UG9L?=
 =?utf-8?B?cU9QZzcwU3ZScXpCRjNxSUV3am41R2RpSXh1OFVBMXcrbHpETU12QlFENUtM?=
 =?utf-8?B?Y2dDYzVJMU8vMmJWZmFxMG9HR0dwQllpekRITWFJdHVUbmsySy9vVmhTc3hr?=
 =?utf-8?B?TkR5aGxsa3V1b09sVUFXTUxzajZudnRoNmFZNlVoTExlZVFHRmVidkdiNHMy?=
 =?utf-8?B?bFMwekd4ZWFnQndnTEdGcTluZTM3TDA0SGFFM21HbDNESDBETVVSYU9kQXJ0?=
 =?utf-8?B?QnVnczdGTkRxNlNrUWc2UEtXOXdMUUptL1FiOWFEMExEUXI0ZU9mT2tWZHpw?=
 =?utf-8?B?YUhvWW9NSG9sN005bU55czBCMW9USlBKR1JyN1B4Y2hIZ29IeTdHUzl3K0lB?=
 =?utf-8?B?SHhzNk1seG9xZm9sVFhMRkV0UFQ2NkpNTEFiRmN1cUMxYjJWcWpVcW94Q25N?=
 =?utf-8?B?ZFJMSVdjLzlrRisyMFhFT1R3cktzMGFIcUI4NmtsNTdDUFppSFZhTFZPL1Ew?=
 =?utf-8?B?VlBGNzlNODJvd1pDS2RYVXdQT2xTSVdxMWhMNkp5eXIxc2RuTXdyc2c1bHl1?=
 =?utf-8?B?MFhvcE9icUpIUTZRTEFzWWZrWDVJcUpxVWo3MWxOdngrc0tJZnd4dVFubmtL?=
 =?utf-8?B?Mm1UcWRIUVJLWjludmszRW5kaE5CVmlhc2RiL1huVW02ZjQ0dGJETG0rdE9P?=
 =?utf-8?B?YmFxcVM4T3BDU1JTZDNtTzdIK3FBRHNVam9NNFBrbGRSZEh0SDh3Q0EyUTFy?=
 =?utf-8?B?QjU3c0FiZG1rNEtiRHdiSlJ6REhXKzdSdHNteWVDbE9zN1FiVVQ4RUt1NEN2?=
 =?utf-8?B?OWg2N1NrMTlvMHVUVER5dXhoMjNqVGFjNFVuWG5mNWkzdU9NM2I5SjlERVBB?=
 =?utf-8?B?dGZwb2VpMG92UTFXZ1JERlFTb1VnSmd4NUp3bGh3T1grZjBTS1lrenZueFZW?=
 =?utf-8?B?dUJKM2ptUmEySmFzVUdockFzTFUxSk5qbnFvdHF6WVgwMlRBMXZtZE11T1Yz?=
 =?utf-8?B?OHRHQkRhQmwvZ0xzRWtnRlJUMTBTekFWVVdYbnk2ZjkrcXY0Yzg5TGpHa3hm?=
 =?utf-8?B?YlBxRFRZdlVJendVR0NwMWpSWHhKOU9rdStSaWtCWVI3MnFGKzBHTWtILzA5?=
 =?utf-8?B?bWd6UFRhaWFpMFZLck5Yb0VwSzVTTHF4cDRZbFh4anE5R2NjQXBtL1dyTmRG?=
 =?utf-8?B?NnhhQnoxOHdPUWJqRU1WZVQ3aDRQQjQ1U0U4VFZ1MkZMTFVzYWNucytkMjRj?=
 =?utf-8?Q?GaNxP8NWP86n1kFGYBgixWJZz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edbc9b9-7c3b-4355-8492-08dc1b071f06
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:00:58.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkSi+igGAkv3AS+rqZHO3ticszSWlsWnwJGFSo2zZHdtNlJRz2wHmNGVklVvdLOok02S4171LSnoxkwHvTX5qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
X-Proofpoint-GUID: xwTwqXbO2N88T4HELxj5bvzkunukpO8Z
X-Proofpoint-ORIG-GUID: Z2Dpn9qouKURSzXt7sMkFBcXZS3Daoab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40M4Us9D006187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194112

On 1/20/24 01:19, Richard Purdie wrote:
> On Tue, 2023-12-26 at 12:44 +0800, Chen Qi via lists.openembedded.org
> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The initial_revs["."] does not have an initial value, resulting
>> in the following error:
>>
>>    KeyError: '.'
>>
>> The problem could be reproduced by running:
>>
>>    devtool modify -n systemd </path/to/my/local/systemd/repo>
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/lib/devtool/standard.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/sta=
ndard.py
>> index 559fd45676..5d9b86ed6a 100644
>> --- a/scripts/lib/devtool/standard.py
>> +++ b/scripts/lib/devtool/standard.py
>> @@ -905,6 +905,7 @@ def modify(args, config, basepath, workspace):
>>                       (stdout, _) =3D bb.process.run('git rev-list --r=
everse devtool-base..HEAD', cwd=3Dsubmodule_path)
>>                       commits[submodule] =3D stdout.split()
>>           else:
>> +            initial_revs["."] =3D None
>>               if os.path.exists(os.path.join(srctree, '.git')):
>>                   # Check if it's a tree previously extracted by us. T=
his is done
>>                   # by ensuring that devtool-base and args.branch (dev=
tool) exist.
> Why aren't we seeing other reports of this? How is it reproduced?

I checked the devtool OEQA, there' no test case to cover this.

You can see my reproduce step in my commit message.

When I was trying to add an oeqa to this case just now, I found the=20
problem has been fixed by the following commit.

"""

commit 64d5db2f89b4f3712b55127215ae02ce50dd747a
Author: Jamin Lin <jamin_lin@aspeedtech.com>
Date:=C2=A0=C2=A0 Wed Jan 3 18:13:44 2024 +0800

 =C2=A0=C2=A0=C2=A0 devtool: modify: fix exception

 =C2=A0=C2=A0=C2=A0 Root Cause:
 =C2=A0=C2=A0=C2=A0 initial_revs is an empty dictionary and do not have "=
." key.

 =C2=A0=C2=A0=C2=A0 Traceback (most recent call last):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/devtool", line 349, in <mod=
ule>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D main()
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/devtool", line 336, in main
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D args.func(args, confi=
g, basepath, workspace)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/lib/devtool/standard.py", l=
ine 922, in modify
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not initial_revs["."]:
 =C2=A0=C2=A0=C2=A0 KeyError: '.'

 =C2=A0=C2=A0=C2=A0 Solution:
 =C2=A0=C2=A0=C2=A0 check key exists, then get its value.

 =C2=A0=C2=A0=C2=A0 (From OE-Core rev: fb0db5c48abb4d56233a175fdd349d18b9=
72e452)

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Alexandre Belloni <alexandre.belloni@b=
ootlin.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>

"""

So my patch can be ignored.

Regards,

Qi

> Should we be adding an extra test to improve coverage?
>
> I'm assuming this isn't related to:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15318
>
> ?
>
> Cheers,
>
> Richard


