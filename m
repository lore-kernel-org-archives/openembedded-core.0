Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2E7C54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 01:43:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10353.1710467008611408341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 18:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MBK9cHnf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3804134e78=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F1e3ON009666
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 01:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=SLujGYSKaAvbSJpnhqI
	JBKgOwKUnBir/vdRh7oP7dys=; b=MBK9cHnfkS41SGV2oF6p3yLjxyVYTo+zYxw
	SXSb3MeTrGKweXFURlXK5/ug+SSMM6qNiXbaxqVsggYV8En2anGrNjeZk+2ErhJH
	USG6vtR4ckhurw0nmYjcf3ZQHIhqiARc5kx3+fKZQ88h1Y+nrRadXN9TQX7MiDM7
	RxKcyxRsFij6JOw0vDHsYUaAcErDZdfC7utD9oJRdwyPD7w06BG7DdFB0xXjv7ii
	IGUX+60eAm42gilb0hlmZpWbZEKR/tYIkJoqwXUr1bSN6GQwm9A8IX9qvNrB2AY3
	eJ3Cdu8xvfDyioYgi4+Tsu4EF0Z7gqepZi7liH1uEf7l64j2RDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x9846k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 01:43:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42F1hRM2013345;
	Fri, 15 Mar 2024 01:43:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x9846j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 01:43:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfxEHk0f0qictD2vSJhJY1qgA7Q66qA0mU9JQMdMqoDUtWYy7QEYW3XiXZBPkgcwCxsuE3OulzeWyh3bv9WXg/w6q+DHE53DCbDSQ1aitTR2zH4TSNboI7pLP+YsCFf0Lg3AtB0u09A3SsKUBrPwz5Ar0hkYIuWOuUje/PRjt4b1WutQoaH3uCiRvc/DrDJm8dRkDC17SSVUgP8N/BZOUfeTgBZW8D8LSnZQrJOVi13VZcm8cjnMu+AeP+xEPwA7GajBsD4AoR1JG7+GHfn5GH7/TisO+1nVFqEpf1Q8I649JvxaPBA1Srby69DQyNZaoCKsqFiQ7STDyZxdFXv6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLujGYSKaAvbSJpnhqIJBKgOwKUnBir/vdRh7oP7dys=;
 b=ibLopJc3tfv2JuTMClrHI1LkwvgTeRJpxx6M4wfP5wIJEFOxLDtReoutskYfdFnKadKK7Di2X9RxZthlz7U6hT5XyKi1JTvXO0+CpizzZyxWJm/eETfJ4kjTjnVlwXq9LguXdZDK+yFat2xe9LXjVuu2sSZ+/kF1i16K38PEjfu2BTBVC6oi2yAxZVPRYd9L+goVoStxfkDpltTKnbXws34NuJzoQoKYQEk9o6AJNJsKDLniVeOK+/PzC3ehJ9iBunGOXAtrWWgYjFCTCjfcXeXQyCZ7SVh2Y3Q8zsexjiTNQKfNiDGi626/BErcb28I7CHJBSOd3GnO4PiKwV0pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 01:43:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:43:23 +0000
Content-Type: multipart/alternative;
 boundary="------------Dl0NBMdqiKb74l0vqvSixgI2"
Message-ID: <74240c6b-83cd-45fc-8b12-a3c14d5347fd@windriver.com>
Date: Fri, 15 Mar 2024 09:43:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Qi.Chen@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240307091925.2324637-1-changqing.li@windriver.com>
 <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com>
 <CO6PR11MB560283393549E1690FCDD6CEED202@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com>
X-ClientProxiedBy: TYAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:404:14::31) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 372a8451-aaf8-4ae3-b36f-08dc44914cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zC9rTceiNsXT9rozsAuRrErpPNMRBF0GE1op/XrtjN7Y4ezkgJMe4wd6DaOTDIdaeW+vTOHWMwIUzhpHGMbczCpONDTBc3Ee0XP4ThaLzBA0zp9BKONmWa31kMfExBmfkZTCPtc+fliReJO2oNPqUjrt5w7DmGEoQU05ZW/y0oalWHEmDEVMsWWNdK4BHEIv8lcPv1v+ZEUHbQ+LTWTzvpePY7rRHzTVTKLKvQmHoX/KxMn8FFABs9lqwso76CZ++c/ylufWers5z6csgdouIUXRTk5jHLyCbSpM7nNoX26HDxnbvutDOT55VZL9sPigdgmMqCchBC9FUlrKz2QRqPpcAIuRKbX63W5bvZy/ZQNvZNq4BB82m0OBT+FRpSgtOTQysmKmiU2IdFu2ef322eAImuVn31XGe8qPbnU3AjZrgon8wofqiADssjBuBuGXyy0eOYSVT8GYdxqA7oS2KYIuZj00NxMrCrlD1K7yC1+/97jrH2nDHIhuFGGRr61PemzsPHqdvRHcEXxWjkXHshQbiWFLNCZDTmpOUjDbcvCVarKty1fyVwsufksWRcnD19OfCtQZvQpVm34rwaE/LwrymEvYw6UxbigBWOhIgbc3pwgMMHeUTpsp84GU71W+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2lVZVE0K3lDeUlhblFuTjBLSDJMZjhkdWdIZHp0RGVuMkJyWkMwc3dkK2o0?=
 =?utf-8?B?RnBjWHUrYUd5TVhjcVozVEV3dll6RmtPaW9SeXdiL3UyODUrcHl5RnpKcyt3?=
 =?utf-8?B?Yk9WSTNrYXMrYnNJcWRGTW1HUGdzM1R3QW0yT1dOSGJweFEyeWRpSldiWHQx?=
 =?utf-8?B?Y1c2UE5ESnRUTk1oTXpJT29JbE9oUHRsOGhWQW41ZlhNMzNuK2ZrVm4vUWd4?=
 =?utf-8?B?UVdCRVl2RktMM1drazN0QjlENk1yRXpLb0VUOHlQR21QRW52aW5uQ1M4alo5?=
 =?utf-8?B?T040SmorYWcxL2tYVFdWZnFqSGQzY0lvN2xBRkxMZVdqYi96aFBkRFNVU1N6?=
 =?utf-8?B?TGU3QUFHaGlDaW84T2RWL3I4dllORDV3Qm1PNENJVkhNZG9NaVhNdm02Z0J3?=
 =?utf-8?B?dDNXZ1h3YUx1U3J3akNPSi83ZUFJMFcwMTR0bVZIN0w0VFdEMG1nN0F5Ujdl?=
 =?utf-8?B?RlNNMTVQWlpNVDQxaHplSE5JL2E4K3hvQkViZlpCemdLSXE1R0h3enRJZmt4?=
 =?utf-8?B?ODF5RytyMS8xaUVEMGh2dGVBMTlaamdxYTBLVkp3YklrcGJ1UnhSVVAzRGJX?=
 =?utf-8?B?Mk1xdkZyK2ZPbzBKc090VXM2Q2wyS0IrWWdwK0JuRE1lSFFFeUFLQ1l1UnNH?=
 =?utf-8?B?d1ZNV3ZnOXFiTm9EWnRwTTd3ZHB3Mk9rMm1NWG5uU3YyaWxhSnA0ZzBEZGEy?=
 =?utf-8?B?U3NFQlRoZmhFd0k2d3Y5bmxGRkFtWTh1NEFUZVU5b0pBTkJ4dng0US85RVYw?=
 =?utf-8?B?Y0xtanpXRlZBamh4UEJGQTNZVUcrQ0VlVkhGbjlLOGYrNVExK3FlYkpnRmxQ?=
 =?utf-8?B?bVhBL2xzdUJLREtpSm1JakluV0I4VFp5NTl3RmdNWlg0RHI1dERkSTI3QkVn?=
 =?utf-8?B?QTFzL0ZGV2lvSkw5eURJNWYvYUFPa1l6dHlEUFoyeGllM1NRelJGQm14U1Ix?=
 =?utf-8?B?TFl3T0grUkRWdHMxRzgvTEJmRjFwZHEvUDg3NUhVVUdTZFg2clFFMHpoOVFv?=
 =?utf-8?B?dEpnWjNYdVBudEY3QktaUGF4dFpoVFcrUjNjVkNPN2MwRUJKN2JrVFRFUFZl?=
 =?utf-8?B?Q3kreTdOWDl1VFN5M2VVVS9FZVVTRlBpMFNySUM1OS8rT3RzZlRzL0h1enU3?=
 =?utf-8?B?SlNMSTkwZGk1KzVNQnBHUzk3RDFRNVYrY01DK1YraU1PMTJGUFBjMFE2Nnhx?=
 =?utf-8?B?dVV5SnFyTmdJRTJMeTY4M2VVNVlMV3JmNFh5Zm1LdGl2VHhPSGp3bUZEMGYv?=
 =?utf-8?B?czlSelJDem1CZ0xFSUxxbjlabnRoVjVmOWwzS2dvL0t0TjQvU003bGhROXJW?=
 =?utf-8?B?WEZ5NFZyZ3VKSXNVYVpIaStydy9HTnFMYzJVMWhEZ05JZWQ0cG9pam03SVNC?=
 =?utf-8?B?TmhLdUpOV3I0Mzg2TGtVeHhrUEJlUlVFR25jbGNRaWM5Y0lvdHlVVHl4ZlRs?=
 =?utf-8?B?c2dmNllSVmM0a0dKekJoRDJLakpUOElSV1dMNGxaRGJWemkyNE9PeTB1T01s?=
 =?utf-8?B?N0U5Q0NpT2FTNHZIQ3pJYUJiTlh4dTB2Mmhqbkhrckw1M2UvbFZnRUpYWWNV?=
 =?utf-8?B?RE9GeWdhaVpNbk5vM3BiRFVoNzBRa29Ra3gzVDFTNUU5blM1YzA4ZXJ4dkxk?=
 =?utf-8?B?NXV0MUI5Rno2Wk5iUDdPVVRTL3E3QjFsMlZYTGhERW4vWHlFUE1nNVJEVWQ3?=
 =?utf-8?B?WVcrVVRwTVpiSHU1THJHQTlrM2ZyZnpXdVhMNWRoYXRnaHE0MjJOTm1UbHlK?=
 =?utf-8?B?N0dCaU85VWZhazR5Z2gyM3NvZXF0T1JDZnpEZURzNjFBR3VIYW5hMjRLTkUy?=
 =?utf-8?B?ZXl5N1VpTzRWQUtHcnhWVXZLZXhiVGJuSkZVYlFSdE0xN0pNekZFdTRoU1Fl?=
 =?utf-8?B?OUxlMitGYkovQVIzNEErS2cvRXlabmlCNWN2dXJOVFIwMkpLTWdjY2RlU1hK?=
 =?utf-8?B?TzBtVWNGNWdUMUU4WVM2UlNOdlFiNHg1ZnVyS0V1ZVg2MmVQN1YxU3cveVVn?=
 =?utf-8?B?OExpOXJtcFhvOVNnbGFWUWpWcnk5UnVnaUE4WmhpcEFZU0JUZHhkOXBXRGtB?=
 =?utf-8?B?MUZ3dHdvSkV0WnE2WkFod0FNdzVXem1Tdi9PbVpVbThvdExwTUE3eWNOVjR4?=
 =?utf-8?B?bFA4aEcyNmxxRjlrVGNoUzVmckl6aVJZYldLeER2Q2pYVC9URVROWmR0T2xY?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372a8451-aaf8-4ae3-b36f-08dc44914cf4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:43:23.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/CWAEwFbCsM+jKCjuoAQWYfa0BbC9cTYLSH0pTsI3YGmblvbmSY0IXgAAA+pI9Jp+lC9NyA15/czazCsliWZiaS/+jcYI8R+AeHxsCcms0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-Proofpoint-GUID: R_AjTMSNPwmHHhnj5sTryIfYXKXBTcf4
X-Proofpoint-ORIG-GUID: YNPQr_D4D7yo0lHnaSPnIA9_FO-E3E3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 01:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197122

--------------Dl0NBMdqiKb74l0vqvSixgI2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42F1e3ON009666


On 3/7/24 19:42, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 7 Mar 2024 at 11:21, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org>  wrote:
>> You can see dnf's solution is:https://github.com/rpm-software-manageme=
nt/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>>
>> I don't think dnf community will look into this issue. And I would exp=
ect it to be a complicated one. Because dnf's own solution looks like mor=
e of a workaround. At the same time, yocto based systems will sometimes h=
ave log_lock.pid left in target filesystems. Users typing 'ls /' will not=
ice it.
>>
>> We have an OE specific patch:https://git.openembedded.org/openembedded=
-core/commit/?id=3D742a1b71249f4da1c8d8e13e270b0eb6128a3f66
>> I can see that this OE specific patch, 0001-dnf-write-the-log-lock-to-=
root.patch, does solve some issue. Unfortunately, at the same time, it in=
troduces this specific issue, a easy-to-notice one.
>>
>> My suggestion is that we merge this fix into 0001-dnf-write-the-log-lo=
ck-to-root.patch, because they really belong together. I guess we can't e=
xpect dnf community to devote time into this, as they've already got a so=
lution. And I'm not sure if anyone in OE community is familiar with dnf e=
nough to solve this issue. So let's make things a little better, avoiding=
 users of Yocto systems see this log_lock.pid file when they type 'ls /'.
>>
>> If you have any other suggestion, please let us know.
> We need to find out why it happens, and why it happens only sometimes.
> If lock file does not get properly deleted that is quite possibly
> masking a different issue which needs fixing, and the proposed patch
> just sweeps it all under the carpet in the name of giving users an
> aesthetically pleasing rootfs. So the answer is still no.
>
> If you are having difficulty debugging the situation where the lock
> file does get left behind, can you provide a way for me to reproduce
> the issue? I just build core-image-minimal, and I'm not seeing it:
>
> alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ls
> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/
> bin  boot  dev  etc  home  lib  media  mnt  proc  root  run  sbin  srv
>   sys  tmp  usr  var

This issue only happened when dnf log rotate is happened. maybe install

"a lot" packages can trigger reproduce this issue more quickly.

>
> If you can't provide that, then you can certainly still do more on
> your side: build core-image-minimal with plain poky, ensure the lock
> file gets deleted, then build your own private things where the file
> does not get deleted, then investigate why the code path that deletes
> the lock file isn't being taken in the latter case. You can see the
> code where the lock log (self.rotate_lock) is used in logging.py:
>
>      def emit(self, record):
>          while True:
>              try:
>                  if self.shouldRollover(record):
>                      with self.rotate_lock:
>                          # Do rollover while preserving the mode of the
> new log file
>                          mode =3D os.stat(self.baseFilename).st_mode
>                          self.doRollover()
>                          os.chmod(self.baseFilename, mode)
>                  logging.FileHandler.emit(self, record)
>                  return
>              except (dnf.exceptions.ProcessLockError,
> dnf.exceptions.ThreadLockError):
>                  time.sleep(0.01)
>              except Exception:
>                  self.handleError(record)
>                  return
>
> And the deletion happens in lock.py:
>
>      def __exit__(self, *exc_args):
>          if self.count =3D=3D 1:
>              os.unlink(self.target)
>          self._unlock_thread()

Hi,

Thanks for trying to help.=C2=A0 I had try to find the root cause when I=20
opened the upstream issue, but unfortunately, not got the root cause,=C2=A0=
 I=20
thought

it should be a complicated one. After do more investigating recently,=20
the root cause should be found, and I have send pull request [1] to=20
upsteam dnf ,

will backport the patch if upstream accept the fix.

[1] https://github.com/rpm-software-management/dnf/pull/2065

//Changqing

>
>
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196785):https://lists.openembedded.org/g/openembedd=
ed-core/message/196785
> Mute This Topic:https://lists.openembedded.org/mt/104784184/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Dl0NBMdqiKb74l0vqvSixgI2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/7/24 19:42, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu, 7 Mar 2024 at 11:21, Chen Qi via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen=windriver.com@lists.openembedded.org">&lt;Qi.Chen=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">You can see dnf's solution is: <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf">https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf</a>

I don't think dnf community will look into this issue. And I would expect it to be a complicated one. Because dnf's own solution looks like more of a workaround. At the same time, yocto based systems will sometimes have log_lock.pid left in target filesystems. Users typing 'ls /' will notice it.

We have an OE specific patch: <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66">https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66</a>
I can see that this OE specific patch, 0001-dnf-write-the-log-lock-to-root.patch, does solve some issue. Unfortunately, at the same time, it introduces this specific issue, a easy-to-notice one.

My suggestion is that we merge this fix into 0001-dnf-write-the-log-lock-to-root.patch, because they really belong together. I guess we can't expect dnf community to devote time into this, as they've already got a solution. And I'm not sure if anyone in OE community is familiar with dnf enough to solve this issue. So let's make things a little better, avoiding users of Yocto systems see this log_lock.pid file when they type 'ls /'.

If you have any other suggestion, please let us know.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We need to find out why it happens, and why it happens only sometimes.
If lock file does not get properly deleted that is quite possibly
masking a different issue which needs fixing, and the proposed patch
just sweeps it all under the carpet in the name of giving users an
aesthetically pleasing rootfs. So the answer is still no.

If you are having difficulty debugging the situation where the lock
file does get left behind, can you provide a way for me to reproduce
the issue? I just build core-image-minimal, and I'm not seeing it:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ls
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/
bin  boot  dev  etc  home  lib  media  mnt  proc  root  run  sbin  srv
 sys  tmp  usr  var</pre>
    </blockquote>
    <p>This issue only happened when dnf log rotate is happened. maybe
      install&nbsp;</p>
    <p>&quot;a lot&quot; packages can trigger reproduce this issue more quickly.&nbsp;
      <br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

If you can't provide that, then you can certainly still do more on
your side: build core-image-minimal with plain poky, ensure the lock
file gets deleted, then build your own private things where the file
does not get deleted, then investigate why the code path that deletes
the lock file isn't being taken in the latter case. You can see the
code where the lock log (self.rotate_lock) is used in logging.py:

    def emit(self, record):
        while True:
            try:
                if self.shouldRollover(record):
                    with self.rotate_lock:
                        # Do rollover while preserving the mode of the
new log file
                        mode = os.stat(self.baseFilename).st_mode
                        self.doRollover()
                        os.chmod(self.baseFilename, mode)
                logging.FileHandler.emit(self, record)
                return
            except (dnf.exceptions.ProcessLockError,
dnf.exceptions.ThreadLockError):
                time.sleep(0.01)
            except Exception:
                self.handleError(record)
                return

And the deletion happens in lock.py:

    def __exit__(self, *exc_args):
        if self.count == 1:
            os.unlink(self.target)
        self._unlock_thread()</pre>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>Thanks for trying to help.&nbsp; I had try to find the root cause when
      I opened the upstream issue, but unfortunately, not got the root
      cause,&nbsp; I thought&nbsp;</p>
    <p>it should be a <span style="white-space: pre-wrap">complicated one.  After do more investigating recently,  the root cause should be found,  and I have send pull request [1] to upsteam dnf ,   </span></p>
    <p><span style="white-space: pre-wrap">will backport the patch if upstream accept the fix.</span></p>
    <p><span style="white-space: pre-wrap">[1] <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/dnf/pull/2065">https://github.com/rpm-software-management/dnf/pull/2065</a></span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <p></p>
    <blockquote type="cite" cite="mid:CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">



Alex
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196785): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/196785">https://lists.openembedded.org/g/openembedded-core/message/196785</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104784184/3616873">https://lists.openembedded.org/mt/104784184/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Dl0NBMdqiKb74l0vqvSixgI2--

