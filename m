Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993F8C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 01:48:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10017.1713232128168992877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 18:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CaV5KV9i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48365d46fe=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G1mlY2022939;
	Mon, 15 Apr 2024 18:48:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4NH208kPT973VgZ1jrYPC92dJW0Y26KIkZkyS18FQtE=; b=
	CaV5KV9i2qiRnQ7+U/oE1WLvllphZxGT3RxGFj1gyzQ/MT97390UTDN1NPTMFqBq
	r7d/oghCxu4HqwqXKkVIknGr3ahVS0c7w+/yZL8qIqMLrctYuFyzXoD/YrrkfpBy
	i315eNaEBDgWP/4/9eJwsRnuP31BCqtq1LF7U4xvLgJHy09bQhQTzLNFZ0Fmu436
	Xp5KL2vIUdV506qHtTzWTgF1sEw4kHwfTEnZzmHoZ7tRQrOIzOFVEmEKyGJzsTmq
	Pj7dgQ/IAw8bqUO59lHhLLgWwWgv9RM0kn7ZMtlEd+u3km8qZ9m89kNOdGsAqDW2
	i4Rf6YcSn/7S7tASf/o/Mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgsx8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 18:48:47 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43G1mkh5022932;
	Mon, 15 Apr 2024 18:48:46 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgsx8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 18:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/N2jH/rINoq4sVqtXA8UrRywGLEj1fJo37vKSirIWcTSePcpSELcqs55LNOVNTEr/aaqp55IFAgWFZ08XmZyS97atEGUUZdM62kIOBCOf2/MD03TWy7g098GhgCyylNEEyg6BULzpYZPJAB4j5uLRN+hMn5f8lW1SlESlM7Db5zHu2+vV8Q6dzO8jzg9DCrlb7RLKgQUk8tXCxDR2rbqWfr6RaqWuMiqjBeuEfCo6exkZ7wg5s1Zrfonf+Na+q3IOqH58dTHbFWlvuOcKSzt8CZC/WmV7H6l6DhkYEp9St+lc0M6mqe4ZQOyUjZcQfLe6LEZNVSfCrMUTQJ6lFS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NH208kPT973VgZ1jrYPC92dJW0Y26KIkZkyS18FQtE=;
 b=PqWPzmqNbJyIxtTwVkthkcAYiOp2OuR4ZQbB592X6Y+i6zzZW//lVzvNLHk/WNyY8xKmIfXXhabrcDhNXB3mQyeTzZ5/yqOjRsQqH67a85pY/tUNQmV4g0NQJwYOFy/JUw8VtYZWVIA86hCntZnA/UznDaP+NsCJkzVVq825QVbUJ3XW1tMLrYoEHlKF7JR9l2MbCgit76Wk/NWakpdJsLo7pw5SSGJWTzCxcOscF/185ty4fdYDKBz3W6eel/aeMCnMpod+55diuUffa0qB+2dFE0vdX7ioc3WvIufnDDy4tOik9HmUdTlq14t6LizQWLlbzwqd+8yuixSTvZDWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 01:48:44 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 01:48:44 +0000
Message-ID: <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
Date: Tue, 16 Apr 2024 09:48:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        changqing.li@eng.windriver.com,
        openembedded-core@lists.openembedded.org
References: <20240415083019.1867284-1-changqing.li@windriver.com>
 <7440987a5a3496bd4f88931728c7d7f686099c62.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <7440987a5a3496bd4f88931728c7d7f686099c62.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a30010b-d803-4629-8cc9-08dc5db75984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DhiPh7dhKnttI0C8dk5+TAavSAkYvzQHWNgyPFwZ+7TpizZALNVeshxvfZeo0VPNts+hVrtdgQAVA8rho5JoJcEWj+EGyllEJh0AaAEvocNyJYZtSzw5wWznpB0ZisjNoKeq9OX+SK6KO6BxzGfvQf7ZEfUCZSR2EWz29OsMptF01RZtIcnjUyxTZ2ppbB7P2wk8SUlt51aLUhyT2kVWGwiUUhA5aA8Val4vR1KN8Hl+L/MczCKWXJ9RXjHc6yN5P+z3znXCgQ54Cr8enQ11VqE0BqJ+vyujZu4wdzh1EUpVOqnCIdjU+AFQcLap0CwLUCIoWgusRWMVFLL+5G5JY+3Cyv8jU2Vjoz2A4CBgrHVOyBgouvy2Is13znDJWnwleuTDx5QMfdnfWQQym01qcOhlmb/2+dEHERKS4MI/W3BBc/yXlYnVQys2LdTD8HSYuirOA4YGANvv9oAX81lnagiCxB2XrwVb6n89HFCoRsOp8sZ1z2J3weVfeMFefNlnulOmPv0Q2sthoHsyUWTNVdCdYEFLiDZi8sEbusj5zfuMpr3i/9RCieAts3jS+RZ5wKtr2jxfwhHPYG2Dk3o+doRFAGTSsZLmoDmTiVjN2PKcPD3C91FMtD3tK9oAHtm6XajZsMz1QU5dP53V4y3T/nNUwheYk9SzGxHTY3SDjxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlIrODJranZJL0xTcTM0MXFuWmEyMnNQSDIzVVRxTFpKWFJKVW0vdDlvU0pW?=
 =?utf-8?B?ckV5VGEvdG9wU1E0R1ZrMFlWdUE3eU92d0s5UlVtRGdKMU4wcnVFdzlMWFo3?=
 =?utf-8?B?cmJBNzd2MU9pYkxzMDJJdmNuSnhWRU5IM2dXdmFLWVNDc0JLU2NnK1BuNWhC?=
 =?utf-8?B?ODREdTkwbzA3VW9JM3hDNnp1WElkci9pbmo4YUw3QThvVjJSMnE0YkpNbWdi?=
 =?utf-8?B?b1VPMnkzMk51S3Z1RXU4Q25sSXdKVXNLRzBwSVE3Tk9SM1FCcnNFRitoT3RC?=
 =?utf-8?B?aWlkNER1TkhvYUI1UG0yNXFGVGdBeG5weUgwUzhaMmw0YXNCb3dPbE12RnEy?=
 =?utf-8?B?S1pKK25zWkhHMGJhUk9nSEZtR0g4SnJZWmU5MjNxcWVjWVhtYklXVVRGSlRL?=
 =?utf-8?B?THVWUVB1c0lvbFYvc1lQMEg1anFndGZVQWRjVWNiMGEweUtlM010VkQ1Y09M?=
 =?utf-8?B?U0Zub0FGWVg2b00vYWFOS0sxajFQRFRSQmdyanRaUGs2TVJFTzBwK1hMNjRB?=
 =?utf-8?B?WFA2VWtvNUZBS0drWFhwRjRpZmJ0WXpsb3V6ZGNDbTRZQkcvSGxybWk4QjJa?=
 =?utf-8?B?TnBEeGNIdG1UcjU1aGxNTEZ2cFhXaWQ4ZWRwTzFndWhrSHZIVVVQOUp1NTJu?=
 =?utf-8?B?RUlhdmRJaEhKWkVxeU9LMmRiYW9CR0N6OWVUb2R0czJ6MWtQUmFjMFBZeVEr?=
 =?utf-8?B?eDdmZjBYMGRGMU0vV3NhR0FORFZvdXFrMTczODl1bEJPYk9xd1pBQ2NSb2xG?=
 =?utf-8?B?TXZUQzVGVWxPejhEUjR3VlJWeUY1YW9XNkhBVlFudkVtWEFoMERIWDl0WUJS?=
 =?utf-8?B?Y0NrSnRMSTFUMllvc2IxeXZvZTRDdktuOE1TYzRzbXI3SWYvc0tuTGFXK1BG?=
 =?utf-8?B?OGcvbGZmcjVCL0lXZzRsSGNXb09WNzFoSExDRlFML2NDRHpxRktGeUtGUmo2?=
 =?utf-8?B?bis2ZXdPb1pxeEdjOEdBUWhIMUpaeUNVaytNdmlhb2tKNURiUzVCbmYxMWM3?=
 =?utf-8?B?QldwUi9MK2ZXSU9NSGw0c2ZMOEgrQnY4VWZXU1p1UXp4N29KR0ZOdFZYVkJW?=
 =?utf-8?B?THJSZFkzT2wwZk1BK1MrN25XamJvY0Q1bjlJKzNtVTBQZDljY2tnUGxYblZ6?=
 =?utf-8?B?dHZYZDM0K0tLb2N0Y3U0bGxYZmtmNHFjMW1pOWo1NC9UY2NJOWZLMWE3SC8r?=
 =?utf-8?B?VUdLWVJ1Yk5SaC9FSTBtK1lUR3pMeG5OTFl6UHl6U1JXZ21ibm1yenN3L3Ny?=
 =?utf-8?B?TzV1MFhjcUQ3N2VsQ1BRbXl2amdlam8zbVpKVFZrWVJSNFcrTjMwM3JiSHJi?=
 =?utf-8?B?VXMzSktpM0tqTnI1V1hkaFJNQm9CRy9OWVI2RkpEUmYzOE8wZG9vM3laS2pC?=
 =?utf-8?B?dmNRRlNuOFhsMzBPUFFZaHNtdTh5eEtvcmRWMGZmT3lpM1YrRUMrS3lsRWty?=
 =?utf-8?B?UVZ1MjVzd1RKSVdEZW1JTVNpRGM0VmNDTUZUY1NES2g2amNQYUU3NVVWSDhR?=
 =?utf-8?B?eW5jcm5JaVY4czdFZ3BlZ3hCZzVNRG9kczhrNVMyY1pKblRKazBmWmk4Z29k?=
 =?utf-8?B?RXFWYTE2WVJHZVNOYmhvU1JQMkJ0Ti9leHpVMVNGbkl0UFhyeHdjN0VnbDZB?=
 =?utf-8?B?YUJHdWw1UmJCOEozYi93VU1Vb29XcWQwMUxKbkVyaEhmbDFCQkNOalI2Ulls?=
 =?utf-8?B?MTlIL3VnUlRXNURoaThoYW8wZ3UyOVBITUYwRVdwem1ZeWI0ZzhVU0taSm05?=
 =?utf-8?B?ZzZWZ1NRcENMMEhadE9WbVFkWGxKeU9PeEMxUGU5Ymo0ZXlERXNxeFptM1NB?=
 =?utf-8?B?aHEyMEhWZ0prNFlGSy9OZ1RaTGt0bi9JTHJwQjAyZGdzc2ZqNWNxT1dUc2hM?=
 =?utf-8?B?a2Z5bnZKQ2NjY1pTNGVaeUNOZnpQQmFCc1JKL3FacU14QmNqZHRNOUg1OWdr?=
 =?utf-8?B?RXUvMGd3aEw2MnZxcW5vU3hXYlVPSWhKMkxrL2NuajVVbU9qT3k1OTA3RTFT?=
 =?utf-8?B?azM4WGxpTmtkelh6Vkp6VGRGQk5YNnd4QXhzaTFZRm54SEl1ekI0V0VoRkZt?=
 =?utf-8?B?TG9CWHdTakJKbmZpNS9YZERyNzZNd2JPb09lRUt0OTArMzZHTlJReCtxYy96?=
 =?utf-8?B?bkordGYvbHR5dzBGQTlDQ1A2ZGZKampKKzBMc0JmTXZpdjZlMnVaTjF6ZW5j?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a30010b-d803-4629-8cc9-08dc5db75984
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 01:48:44.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Rf97fw4saARNhi8qUE8RFcVf0pJXiqpHs4F7F3DXAYr7AXp9hpCV+4jyCLgOqm+Hssya6WgeKzZaoPgJg5NaxvvBFjX7Ae6U2mel9VWqgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-Proofpoint-ORIG-GUID: f97Yxb2_h_RdsC89xP9OtnDQIXIv9eL_
X-Proofpoint-GUID: oZT3HSiFwZ53NlhUpFqe171AWN5QjfhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_01,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43G1mlY2022939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 01:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198246


On 4/15/24 18:05, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2024-04-15 at 16:30 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> When there are tarballs in local mirror file://, do_fetch will
>> create symlink under DL_DIR, eg:
>> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-pr=
ebuilt-2.33.tar.xz
>> after user update path from localmirrorA to localmirrorB, because
>> do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
>> be rerun, so the symlink will not update to:
>> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-pr=
ebuilt-2.33.tar.xz
>> then, do_upack will failed since the tarball cannot be found.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/classes-global/base.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/ba=
se.bbclass
>> index 0999b42daa..5094a1540e 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -139,6 +139,7 @@ do_fetch[file-checksums] =3D "${@bb.fetch.get_chec=
ksum_file_list(d)}"
>>   do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
>>   do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
>>   do_fetch[network] =3D "1"
>> +do_fetch[vardeps] +=3D "PREMIRRORS MIRRORS"
>>   python base_do_fetch() {
>>
>>       src_uri =3D (d.getVar('SRC_URI') or "").split()
>>
> Changing PREMIRRORS or MIRRORS should not change the output of the
> task, ever, so do_fetch shouldn't depend upon them.

The failure case I met is like this:

I have a project with PREMIRRORS setting, and the tarballs are under it.

PREMIRRORS:append =3D "file:///project/path/to/localmirrorA"

after first bitbake pseudo-native, there will a symlink under DL_DIR:

pseudo-prebuilt-2.33.tar.xz ->=20
/project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz

Then, Since all the tarballs are moved to /project/path/to/localmirrorB

I changed PREMIRRORS:append =3D "file:///project/path/to/localmirrorB"

Then bitbake pseudo-native again,=C2=A0=C2=A0 do_fetch=C2=A0 will not rer=
un since no=20
signature change.

do_unpack rerun since one dependency=C2=A0 change, it will try to unpack=20
${DL_DIR}/pseudo-prebuilt-2.33.tar.xz,

but since do_fetch not rerun, ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz=20
still point to localmirrorA, but localmirrorA not exist

since localmirrorB replace it.=C2=A0 Then will cause do_unpck failure:

NOTE: Unpacking /build/downloads/pseudo-prebuilt-2.33.tar.xz to=20
/build/tmp-glibc/work/x86_64-linux/pseudo-native/1.9.0+git xz:=20
/build/downloads/pseudo-prebuilt-2.33.tar.xz: No such file or directory

So this is why I want to add this depends,=C2=A0 and want to make do_fetc=
h=20
rerun and resymlink to /project/path/to/localmirrorB

Regards

Changqing

>
> Cheers,
>
> Richard
>

