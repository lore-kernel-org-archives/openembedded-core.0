Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC966C6FD1F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 02:23:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5381.1679279019922708297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Mar 2023 19:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=kmzLTjbG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24432260e7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K2Kj2R024100
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 19:23:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ulCFaLgEZpywgLU1OjF7L+B/7CV61R0t9copxy/xi5I=;
 b=kmzLTjbGIwI4ZF3TSiqEEpt3RKdQWLxvuS8H0eg82gqfrJ8M/W9VgVcOXou5P60QebI2
 OrYwZ9ElcW4lAnPWmnRLOFQMICK4E7Dty7kA79z0BzOi2Fo1yXIW3fmHqXR3Z49HY55o
 E+A/pD1fAyxbXWy3gzrM+84/csrFtLQsA1tZ2VlQ92EIAMC9LZS2NC51X6+gpHTuKZGK
 LmUo8UWgLP/KeYeWQtvJydBe3Bh51x0M61EyuChRd2wTlcfl6ZBPS1mQZ00uGHrHD8sA
 6+7lS+ANWquqScf2Q8WIYtq8RNFYaxkGuX8u2HJLG3U4LMpO2xiUc+qT8oM0RKhDePai 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pdctmh3n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 19:23:39 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32K2Ncp1029589
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 19:23:38 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pdctmh3n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Mar 2023 19:23:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCRpic7xLjqXbWOVnPYyLHznV7/lnjg6Y/fNZVSgfRg/sgSRQ5cnrVwfDH45UqXb/kghFxKBlQUnjz42Ey5Z7IxdK8N/ZRGD8aoz29JtueqZaIfJaXT1hdNYO78yEQoF1B1obn3aSyIuECgStHTm94uFu4m+1J5N2u6tpTWX5OG/u04+oF4L3vN+2VTZwzZKkdYWIQa9QphxPGmapBvvBk5UhpZjeAPeaPG5aU/by61tFikiuBbcFB3dY1Q19A+Bw9kJHUWAndBQHmxSetj+O17vvOBhVsf7nMM322aKhyc1unZUiXepP0tamkRE9KflIpm+Ytm51BdZxpXXecDECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulCFaLgEZpywgLU1OjF7L+B/7CV61R0t9copxy/xi5I=;
 b=iWvixcLrPl4uSbBSyngbfq5cbi4yoyThbFho+j3yKNNQm1B2g21noCZd6LFJM/5Fbx5WwAzuq1wotR8OusHTzUwp/6DMrjabwMfhHrxKu2rLpfvqfwsSdIf8t0yv8VBW/rpQ1BWD3Wh8y0S8a31jTM1ZNfvKidg32N0YGJnjFK53ZdVHhRJeJMwUHkPk8cgr92llyAI3+UKd/u8irgLUPvDAZaIsMS4ItNme7hoRvaiYifOMpWb68Eq+VhdNAqenTQHYYIeC4RSE5/hefpNO9ISc3Xio3vVluO3hzPbWAJa2awOProTZu4R2Hj+0OTC7ziVV4qv6aum/7o7M746haw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 02:23:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 02:23:30 +0000
Message-ID: <335648f9-d1d3-fe27-f492-1fdda85fa3fc@windriver.com>
Date: Mon, 20 Mar 2023 10:23:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
To: Marek Vasut <marex@denx.de>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Armin Kuster <akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
        Kristian Klausen <kristian@klausen.dk>,
        Nick Potenski <nick.potenski@garmin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230227191548.95504-1-marex@denx.de>
 <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
 <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
 <CO6PR11MB560219C3F043786F9A9EF378EDBD9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <4cea1d51-8291-48a9-629c-8ebdd1a97e71@denx.de>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <4cea1d51-8291-48a9-629c-8ebdd1a97e71@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:4:7c::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7c53ea-cd29-4e61-1b20-08db28ea1821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+EcCvXDVztcBpmPnADXOZPpQi6d5HA3izrJznmDsEyzcm7toAQSlzOkHg+IFyq59h/hK5vTnVJNQ+IW0k4NSitM3K3vOR0P91kTSo9/1xltlv+1INMV0i39XAh6/ZRgkqm6tlcSUahHsziKBWOn0HdA3YAA3UFcsnHOsJ4al4f4dLs4y9Ol3HqGlmXCL4NF+n2uR+fjz+jGN8XH2oWW+ypE0aC4mgNt0IjXyyNAQxiWnHR2ZKfSk2KF5bc4QOvdpf+ocwaA5Z9v855CuPpvLQCNe5loYaZrfftsslNFDAyMlNei+nykgXW8tUN6WLtuDZElwyQF5fBxdH7qRgiFETIhOCYZarWLMKCOUHKohiNo18xwk+6OR6P7g4wisiPPoN4de9uztRG07ys2HMIrUqMbCbbIsRWeXRx/RDkMX1P10rv6vdIOdONuUclmC4TTr+axHfLW9ZBz02kquAG03H6jxM/aCAvUG7N1fGzIVuhUfMu9eq5zTXlo3JGvOSUCOmVHfH4EY+glc3WLJA4URc7P8/Mz02+5WkHXr69uQivsyebZD/cvpsezplZbNPKSGrehEXekA51Ng7KBLx60ip4GJYB9bvd/5W1YvzWr4syrzqwqGv3B9NfYB3yxIN9J9duY9WTgIVYt2tIsECao6iUcKSu8j4gFmAw9N3d8QGATa6Lq0LqoLudqiAWLYNIC390MqPe1u9ATAqmQF44OeRMSoZIjDcdGbY61BUy+u6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(451199018)(2616005)(186003)(6486002)(4326008)(478600001)(6666004)(83380400001)(316002)(110136005)(66476007)(66556008)(66946007)(8676002)(6506007)(26005)(6512007)(53546011)(54906003)(31686004)(41300700001)(8936002)(5660300002)(38100700002)(36756003)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjIrMnlYVzJib0ZydWY5RnpjU2pFc1IyaWhQS09LcDZvRFowRzYxOFRzUmN1?=
 =?utf-8?B?ZXVyc2RtcmRWWXZwZEc3aTFITjkydHJRM3lVTzlmMjR2MHAzVUlGWnhSU28x?=
 =?utf-8?B?WnJWUGIvOWVySzdQYk1IMU9FUTlhSTdZNWw1VDNuUE1FY09la3FSdTB4V3p2?=
 =?utf-8?B?S3dMV1g5WStsY0JBaVRQd0Z3QStvc2dRVUxWV3MzM3FvbHVUZ3NlMDQ2WVF1?=
 =?utf-8?B?Q3h3Tlg3QTBkTGpaQVFmeDg0azNYeFJlWnJLanZZRjVlbDd0TEJaL2hxUnMv?=
 =?utf-8?B?U2QvRmJsK1JQSjVHT2lJWms3M1pibVhGaHNFUzFmNkVmUzBvR1hNdXBiNE80?=
 =?utf-8?B?M1ZFN1VRZ1JhM05sVTZJZGRUM3BpV2xNdHNjZzBqYUZjdVhyOHlzbnpZK0lD?=
 =?utf-8?B?elBDVUdyUzY0QzhXVVBkd0JTNVJ5aDdycmRMV1MrbDNhakxEVG9jeU9VYWZt?=
 =?utf-8?B?bEw0aGNsUjNHV1RzRWZ3dWduQ0NWdksxMnd2V2Y4WjlYL2tBL2k4eElsS2V3?=
 =?utf-8?B?TWE1dnpoN2RRVlZRL2trbFAvMWJyYUhIaTIweW9zSEFvbGR0NSszeHNRRXJ3?=
 =?utf-8?B?Nkw5cWlTbnZWTE01SG83WlNnTXRPNVY4U2FGVW9GcUk0TEQ2NjlUQWxtSCtk?=
 =?utf-8?B?Ly80Q3B2YzI1SlB0NlgrRDZzMU5YUGlnZzdLVG1SWWJEUm5tNXF1c1pJb0Nz?=
 =?utf-8?B?NURLNTJoSHhJbDRlMjQ0L3VNSHVwelpQUE8ySStEc3pRcm5oYTdrcHEwTnNX?=
 =?utf-8?B?c3F5Wnlid1Jnd0NuYkttakZxamNpbHVWdEl1MzBQdExWVlNJUWZVKzhCYTFG?=
 =?utf-8?B?L2hEVWROMnZyL2hyNnJkMXFIMTNJaVUvMlJHM2V5VlFZTEc2Q09jUmtnL0N1?=
 =?utf-8?B?dUs0UGpmK0lLZnpHU3V3SjNZd0tZNXAwenpBZUpZcmJhczJNc2JNdE9PVlJo?=
 =?utf-8?B?WXFmQ2xvenpnbVVacHhhSWtBcGxzZ0Y0MXdqajZYSG16b2N0amZCMUlrckk0?=
 =?utf-8?B?RENDYkZMMDhkd2k5Z1B2OHB6cnRqdkJOL1d5dW5TZitPRCtwQUcrK0V5SkNO?=
 =?utf-8?B?Wm4rMGZZL2xUV1huNjFHYnpzdmNkS3lmT1A3ckF1WGxVRXhCMUpoektabE80?=
 =?utf-8?B?U2pZOWtnOXJKL0M2aDVLaURwWk1yK3BNTFh6SzFoeVQzcklLZGF1aG9wa1pB?=
 =?utf-8?B?aHhxWitNeWJqc3ovYkRFaXF4UWJrSWN0c29qbEk4OTVHajJjR0xYSlFqVGlB?=
 =?utf-8?B?MElZQXlkenJxWUVoRDM1eG01WjFaL3oxNUZJSS9tSmJxODlsZk1nb3Urek9k?=
 =?utf-8?B?ZkdnSXNpY0RLTGtyN1VRMjlrYzhLUTk5UTE0dEZWd015eGlJdlNBK0w3MU5O?=
 =?utf-8?B?czF5OTBFYVhiUVZ6VzJ6LzhjZ0kyaHVvdGZjY2pFQVFxTGd4bjRnRFlhYVFw?=
 =?utf-8?B?VEhqekhLQVVMcHNmMjZERm9Ed0p0dkcrMTNrelRMNlZvTDdPbDFKTjFrVExF?=
 =?utf-8?B?U0I5RitKdkVKQjl3Z1lPVlRlR2pIcVZpQ3VKcnBEMVV4RWRlNktNSmdCUEhG?=
 =?utf-8?B?Q1hUTWZ0VHlwZDAzK0FSb3oySkR5UFI2YnBSS0xjN3NhWVFNQ1czaUxtaXZF?=
 =?utf-8?B?cTZzVEFlTWIzT0NDN3o0bjBaaHE0Nm4veEM1cDkrZ2lGMEh6eWlHNm5IelUr?=
 =?utf-8?B?Z29KL01ZaGNqdUhab0c1N09Pc3RaZWN3U3F4bE5aODZyMlp1ZFVjREpDM2Zh?=
 =?utf-8?B?RmI4amM4R3FVRGhqMTNQbGcxcWk0V3pvZE5VTXBGWXFsWXFhRFloWFM4MElB?=
 =?utf-8?B?VENHQnBKU0VFK0tmVUQ4aTREVENnMkMreGJCL2RKYzJQTk5XR0ZlQnI2L0hn?=
 =?utf-8?B?eExwRkRpZEdEejhBN3VCSDRQWEthbEsyMisyZ1RrWDBiUGJDdVBHTXZYc3JH?=
 =?utf-8?B?Y25PREZ6Y3ZFc1NUZ3V1ZTRueVNDY0NtMVROaURUK2pBQlVhcjNJbTFBbFZs?=
 =?utf-8?B?L1I5bXNVdWF6OWdvTGo0MFBYSHlKK3VnZU13NG1pZFRXTjBGbUJmM2ZENmh4?=
 =?utf-8?B?KzNJTWdQajRTZmZtNHZCZU40YmxwbnB1bUlJVlU5a2RYNEtmT3M0N2R0VDVS?=
 =?utf-8?Q?3odu3PDdMnvxqqysHtCJZAqhU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7c53ea-cd29-4e61-1b20-08db28ea1821
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 02:23:29.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnODppTlUhiwp34F95fLAb84YPPfrmkp8HnXloFJRHYtYMWOlfHERp+zdfAKHcdluASIhdsHJiVt5XvOU9Vseg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
X-Proofpoint-GUID: vTEJhOAHDYu4iwdf0hGVL3NFpRAMME2I
X-Proofpoint-ORIG-GUID: dKWORxxKUJVsZ2bdzJI4G-NkNPqHA_HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-19_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1011
 mlxlogscore=809 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303200019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32K2Kj2R024100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 02:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178798

On 3/20/23 06:55, Marek Vasut wrote:
> On 3/17/23 15:32, Chen, Qi wrote:
>> Hi Marek,
>
> Hi,
>
> sorry for the delay
>
>> I used the following line in local.conf and the firstboot worked:
>> IMAGE_PREPROCESS_COMMAND:remove =3D "systemd_preset_all;"
>
> But doesn't that also inhibit the rootfs-time preset-all ? I would=20
> like to keep that, I just need for the systemd firstboot units to run=20
> on first boot to do first boot system setup things, which they won't=20
> without the 'uninitialized' in /etc/machine-id .


1) Lacking of /etc/machine-id file also triggers firstboot.

2) systemd firstboot does 'preset-all'. If you enable firstboot, then=20
you don't need rootfs-time preset-all.

Regards,

Qi


>
>> -----Original Message-----
>> From: Marek Vasut <marex@denx.de>
>> Sent: Friday, March 17, 2023 7:54 PM
>> To: Chen, Qi <Qi.Chen@windriver.com>;=20
>> openembedded-core@lists.openembedded.org
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>; Armin Kuster=20
>> <akuster808@gmail.com>; Bob Henz <robert_henz@jabil.com>; Kristian=20
>> Klausen <kristian@klausen.dk>; Nick Potenski=20
>> <nick.potenski@garmin.com>; Richard Purdie=20
>> <richard.purdie@linuxfoundation.org>
>> Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id=20
>> with "uninitialized" text in it
>>
>> On 3/15/23 11:10, ChenQi wrote:
>>
>> Hi,
>>
>>> This patch is forcing systemd to do preset-all at boot time (first
>>> boot) in a function that simulates 'preset-all' at rootfs time.
>>>
>>> If we look at the comments above the changed line, we can see that th=
e
>>> /etc/machine-id file was deliberately created as empty, for the
>>> purpose of making systemd not treat the system as first boot.
>>> """
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also =
create
>>> /etc/machine-id, which
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesyste=
m read-only before
>>> generating
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 #
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /e=
tc is generated at
>>> runtime
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script sho=
uldn't run at all and
>>> we
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
>>> """
>>>
>>> I'm going to send out a patch to revert this patch.
>>
>> Hmmm, the problem is that without this patch, systemd firstboot does=20
>> not work and I would like to use that. How can we accommodate both=20
>> options, i.e. no breakage for you and working systemd-firstboot ?



