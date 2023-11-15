Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD52C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 04:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6316.1700022817846402031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 20:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9683a39693=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AF31uoT023848
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:33:37 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kk2pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:33:37 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3AF4Xa8p012310;
	Tue, 14 Nov 2023 20:33:36 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kk2pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 20:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9wS4h/Kd8RDor3wK52hN3VqYko4HjHQxUEial6Y2ItKSE9qNv6G500Gp3neFZl2u3RTeLyoK6mXDRanXb7r3s8ma0hHbhLMWjDmuL71Tu20vTiutZ4IOigPnwaHKGV9J9BtAm865kW4ldv+7TIAXKdcj+OC1GZhMJSCM5Ju78isEEdZ/lN//h8Ms/GaLswwhsNyH+AbETrZ3Yr/AfeNmN+UT4ZG952zPcSdLD1uivg46u7nSAoO0c0UpbO7aSPh3BZMCcvSj1rxAF0SE93w9Ddo/oqzU9jM0bQ3288rw6FT+YyvqABFv6FDTfEDU1sjAn4apXOB9N1b6yDKNe6btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ptzH/z9/zZzHejUYyqrtT5GD9Eq0lL1GZVNXPTQKqw=;
 b=OBjnVKY/yFn9YvLhCeUtZzS5cNlUShkW6uXFAaoORT2ybYpn58ADTwzStd2AkhTve1gKtA5c73n4FLrtCrc4KeQiHi/Jwh12t1qK5lf1qnkSVbjXqTsinvO8nuwlK4l8HoSjS5c3IYaaxMh4FWRE1mbYwe1rR233FzAFYaBcMC2tbiPujBWohbqpyOukGXn2lx/Qcm1AOLRKmRm4p/Q4MmOLOJOSxSHmdxVxAZQIi9PUUmm12b5tgVQjsgcpMkwYKVwjRuq1KIeOEzCoCbi5s5QNut0lL1RJsNWzv3qfqAKBop8hi9l6ULLNKYhBEHzSz24NkiyfmkMSsh83qP2tnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Wed, 15 Nov 2023 04:33:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 04:33:30 +0000
Message-ID: <65fe7118-042c-4c60-b9de-61daf2d6b44c@eng.windriver.com>
Date: Wed, 15 Nov 2023 12:33:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH] openssh: add systemd readiness notification
 support
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231111103028.2896744-1-xiangyu.chen@eng.windriver.com>
 <9E7E1A0C-DC06-4E14-8462-4C972FC905D0@arm.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <9E7E1A0C-DC06-4E14-8462-4C972FC905D0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:404::17)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a33953-3477-453c-65f5-08dbe59404f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WLmlf+kQ/FdzfqYLu6IGvmrg0aRmFRoAVoqa2P69ZJxv+4Y02yomb6BlFwmGm2SEpqPjRrqyhfR5x/9Z7d6SALSAay1oGqDpYhkROeivZu8Lm0upkP6gVuIjBs66553DZ8lHe6WWammmMtnF1LKnnc73kwOWdo9CLZ5y1r4wpaubdfG64BiUiAoJu+YVF5Pf/YA3bUqdxN8QYZtglm8sQXStoSCnOTWv0Ywsyl7ZmJWfIYa0lq7CRT3hq74HWr+S0RhWGAOUdeDQWpBeA+eYjohSF5soxOvjsYt26JUrqXr/Kqe9UsDvRzyY455vyWBwdfJgaGpgNA1Mubz94O/W36YMzzXoaELplcdQd8C8wCLQTjjuh0dHD4+7WZgQWRX4nexFMx5FRJahEKMEinE+nHSVJgVMsnZFlrZF+8NmGuhLiwn77+9MChBUyHERYXCPkL6dZ/0cqK1Q4O+vriQ+dzyUuDEYrM3SqGAelKmW1Q2V7Luq1ySeKji+/LnwvUfMPCnDIclSDJDtYP6RXLvys6pVNA04hVuJJdQE4c90EfSPlXcqFZvk+Nqr5vIBrwgLvzOEnZonk8Rf2hnZO5NXkodb4D8d3s1LFt9q5EBucvDoPIoYYckH3xvQLUd5IgD62wFQonx+DfF+S8jBcQy+Bjew9xsUhl/qJiahl66FUgCS0fwtCqSFTyBCcbeRWgtxZ76n8G9L2o26L9sWwbVjsg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39850400004)(396003)(366004)(230922051799003)(230173577357003)(230273577357003)(1800799009)(186009)(451199024)(64100799003)(38100700002)(83170400001)(6666004)(83380400001)(31686004)(8936002)(6512007)(53546011)(6506007)(2616005)(41300700001)(4326008)(2906002)(5660300002)(4744005)(15650500001)(31696002)(44832011)(8676002)(6916009)(66556008)(66476007)(66946007)(316002)(26005)(478600001)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmFyUDN2MnJ6REQvaUE2eitQalBUZHBZdTNMZC9yV0pKSmsyQ2pHNHhFSTVW?=
 =?utf-8?B?KzJGTVlTWEJjblhwSEo1NzBua3Y1aUpBcG9zUVlzdGRvNVM4Sy9MRVIvVng3?=
 =?utf-8?B?OXN3WGx1aFR5OURpM2lHNm5WcTBVQ09vRE4vZ2ozdWN4UU96dnVacEpLYVZT?=
 =?utf-8?B?OHhnYUtMY3FQOGlnK3VwM1pXRTJ6M0pvSWFlM3dzNzhNdzFIKzEzN0FBbjB3?=
 =?utf-8?B?d0ZMcjBJQ1pEUE9qUDd6RkFUSldNY3B1UnkrSGZPWitlZUdSREphTzNKdmR6?=
 =?utf-8?B?Sytld09wdjFQS21rMXNNRWo4dm95SHJZZWQzWDlrRGZiWGtCRkZkSURrMGx4?=
 =?utf-8?B?SWJmT1V2bk11bFdTYUxmWE1rK3Y1TFVXZVJMa3RGeVZUTzNkRUNDT2cyM0sy?=
 =?utf-8?B?TTBsM3lXZGFOWExlaWIwU2xDWDdpVFhpME50U29sY3RsbFc1aTVRL1VONC9W?=
 =?utf-8?B?QWJVYkljVERBWktZUnZtQkF3NENHTGpLTWFKZE5HNWZORHpHYVVQWlh1TXpJ?=
 =?utf-8?B?SXZpWDBySmdNK0tPNFlCQ2pJWWowSm5uUWxlWmVtYTIvZVp5YmxQYTBORml6?=
 =?utf-8?B?NTlESDF4ZXhWSzJnQ2s3VXQ4dHFHdmhsOEJMQXd6OW9rUVQ2Qmh6ZUZjUjVn?=
 =?utf-8?B?ME11alhLOXl6aUl1UEhmWnplTXlVVDJQYVFTeUlXRGYyRThqbURMTHNmbEY5?=
 =?utf-8?B?ckxzejJxclhRU1FyLzl5RUNoUU03alpxS2FXazQ4WHVKLzlDdS9nYnJzN1pR?=
 =?utf-8?B?b2pvUENUR2kvTnlSdlQvSFM4TkJvVllqdHF1cnJkeXRoQmFVcWs2M1JndjNC?=
 =?utf-8?B?QmxrMG9QVUR0ai9vdGp3bU8rZzZabTd0Y2F2RDYxcXU1Sm1BZkNVNDJ5UFdi?=
 =?utf-8?B?RlZBYXhSdE1JczlacUpDMHZZQTlSdVdaZFoxSC95WFV3YVhESVlHdWpCYlZH?=
 =?utf-8?B?dG9HZ1o2N09yaEoycEdVS3N0ckxCRDB4d0R4cFNoU211cGpoTTZVMktHaGhL?=
 =?utf-8?B?cmkzUmhGc1FoUmZQQWJOSHVFNStvQ3M4WSttN2NJYVBKdjNqZitSUUl2b29R?=
 =?utf-8?B?cTlvYXlSYTEzeVdxQm50eDArcDlIbVprN05KazFyRFBzUVNabnlQZ0FocjM4?=
 =?utf-8?B?T2JqRDVzdUV1RDd4Mld5Mlh5cFppYVJCd0E5TGVISFBNM1kvWEU0aW1ja0U4?=
 =?utf-8?B?Vmw0M0xLZE5NNzVuRk01NUdmc3pTZFN4LzA2OGsxd2w1ZDIvU3AzTDk2N0ts?=
 =?utf-8?B?NW13ZWo4Z204bnZ3Y1Y1c3BWd3RWdGNURWlRWkVrZ216dEd3YmRZS3ZmSGVI?=
 =?utf-8?B?bGt6bDJqaTZWbDlPT2VRa2FlditHTWhtS0U2V2tYZUlieXlUZVhhN3BRM3FJ?=
 =?utf-8?B?UGhOLzVzMDZ0UEx6bENVZW5HVjRyZjFtMlZXcnRGekU3TklTQnZBdEFHckNQ?=
 =?utf-8?B?cEducUxLc0NleFNsRklpRkZIalhKS0NoS21rVm04cWR3bzFzN1gwb0o4MlRG?=
 =?utf-8?B?K2hXL0R3aXN2Y05vOFV4SU1tQS9LOCtZQlRGSjFxWnNWY0h5L2xBVy9kL2FH?=
 =?utf-8?B?NnRSUGFoUENLWml3VmtNN1RtenB0Rk9kZ21DUHdoM1ZkNm9vRHNMcDdpSncr?=
 =?utf-8?B?WEhaTDA4anRqdUJoSmYvQ0NJc0NWOGJYRnp2UkRtVmVnOTE1eHFwZEh2RXVH?=
 =?utf-8?B?WDhHOUpjV2FCMVBNSnVMQ3hMS1hieVBnbHozdW9kRHFoSDNwVEh6Q1J3V3g1?=
 =?utf-8?B?KysyZnBrRTl1ek1PNVhTLzBlbGEzdzVNZnh0TnpzVGFJY1BzQzB5UUxETmZl?=
 =?utf-8?B?TSs3Z0VGcDBOTS91RldyaWYzaXpobUtPbGU1cSsrZUozNnc1aDM4OHVnT2hH?=
 =?utf-8?B?YjdVdGJ1cmExa1pTU2ExL1o4V2doVEw0Y3NweVc2cDNaaXFqZXhOckdjTEZ4?=
 =?utf-8?B?M2tJVWJMQ0hkVmpvOEhzYWpJd2FVUG1haEZjWS9aNlRITy9FZ1lvWkdTWFJk?=
 =?utf-8?B?UEorMk9IeGRRUU5SK1cybHVZZnN5dFZGZG1rSnFrU2dacDJOQURNVkkraUhu?=
 =?utf-8?B?R1cxMGtFT3RNdUhNczYvRStVZ1k0QjYxby81UmNUZ041NW1ybEt6ZXlDNFVM?=
 =?utf-8?B?NjZCdEdLWWRDSUdYcHM0Z3NYWmRZcEUzVzlLenUvWFBDY1RIckZ1TGZPbFNx?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a33953-3477-453c-65f5-08dbe59404f2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 04:33:30.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cukLxKxwAttb5c6DLI7RM9zTBdtimP3/1SK2eMOtSaJ8q8AibEMRZeRkixFJ2RnZlQqlB0Dwyzn6BI0dBNjvoAnbwHIo2K19znN3py+UxhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
X-Proofpoint-ORIG-GUID: 4o0AQCYIMJVnyORL1TOf_NMLbNQqwT60
X-Proofpoint-GUID: xprxdKlUMucGJeIC-7X5rhj7duv2r_fD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_02,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311150034
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AF31uoT023848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190554


On 11/14/23 01:34, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 11 Nov 2023, at 10:30, Xiangyu Chen via lists.openembedded.org <xian=
gyu.chen=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Taken a patch from debain[1] that after sshd listening port, using a s=
ignal to tell systemd
>> it is ready now.
> It=E2=80=99s not Upstream-Status: Inappropriate, this is perfectly acce=
ptable for upstream.
>
> In fact it=E2=80=99s been submitted upstream already and there=E2=80=99=
s a newer iteration than this patch has:
>
> https://github.com/openssh/openssh-portable/pull/375/commits/be18743591=
1cde6cc3cef6982a508261074f1e56
>
> Please use that patch instead, and set the Upstream-Status to submitted.

Thanks for your info, forgetting to check the patches in openssh PR=20
list, resent a v2 patch:

https://lists.openembedded.org/g/openembedded-core/message/190553


>
> Ross

