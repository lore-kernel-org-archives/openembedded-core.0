Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA1CC4829C
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 02:30:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29820.1707618630014912759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 18:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=h/gLnzTO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=277125336e=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41B2U9nN023402
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 02:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=y3nT8n9d7TKGHgjo0Nitj4qdZQ5ISRHFkAXNCX2Yjp8=; b=
	h/gLnzTOET5LtFjF4qBqMX3cZwl/wHJODPfW/HUMbMPft9mDDW56OUSzQl+kPf9S
	C1v3dmgjy7b+ycxVee3DHAG2s5j9hh5Mfn6KGnrp9BiqZwV61QeYWbOtSCic+Ozc
	OciGPuP40gIFJTHI3FTO1lwoltWReliP8ubULJRDwYBryhZytfMjfAf9d+gcXtjn
	6NITkP3kdZqvqBnECU7mPYNf0/625Xw3THXMENIcR7ee9J+uK2giG4MLIXW0kaFJ
	vO0MlO7zhC3bI2Ps/H1hoJAS3oR0if9Jk5mEP5dfuJaajoTPg5v6oCtSQMBVbwnD
	UNXCvFe6MOwWSI+Nq/SFzw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxrqff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 02:30:28 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41B2USu6023531;
	Sun, 11 Feb 2024 02:30:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxrqfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Feb 2024 02:30:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtPFDQqjhE5PO1T5UQQ2RiS5z/yw48+rcHd8jjB0ZZt9VpMj/ljg20HBz5tEEjTM/nJzXCHymXZ4fG+ZASEvBV7roaekPzsiYkmcFx7awYVRhNwuLBcpk9mrulIysaFy3ZwqIMtmxxAC/JSVRSGuSWeSmCrbDLYiIwnb7Vg3E/EjhLt8q8qdeTORzbmWtxSYRFeKHAZgGYAQmKE7kEfFcWQrTQl3u1jpqOLhxmWSI+ofnAc+2hN05jYorxqyZM0m0pBG858uXfr6Uvhgad5rVmsih6KzVsYO1m6+CxeG7hBOhSdRekCCUI8wqhBIc7yKWVWtxdHq3aorepFjTBsEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3nT8n9d7TKGHgjo0Nitj4qdZQ5ISRHFkAXNCX2Yjp8=;
 b=OtvDvfaaJeUHg+OYoex+XlfArDNaOVXY3YPemmPz/92o6aenZFvMZonpFTr8rUS4LYlBcwvrZmqlJMmDjwJYVg1PFXORmOV+RmIxvQKw6pw3iWzq6tfOMcJDJOuCInmL+ODT6OQLm+ogj/5nV2AhdBGRwo05g39+zRcpDr9JrJHZtLi703Rl6IkOQNrnk2moefufFyQAirSnyBFkR3dG0LJOa82RZws3s/hWIxNHLhpB7qucbLxy1ov+7K+tjTIZXSNldVQZ2Djhy2fxhdXoZBxXvJAnZhKSlKrGkKCHXr5ASS1Iq16FA3h5EFyZIDgr7kJSp9Mb8q3avRqVq26RMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Sun, 11 Feb
 2024 02:30:26 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::6d54:dbbc:e339:ade7]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::6d54:dbbc:e339:ade7%4]) with mapi id 15.20.7270.028; Sun, 11 Feb 2024
 02:30:26 +0000
Message-ID: <34f1ca06-e471-47c7-9eb5-597e98c06ca7@windriver.com>
Date: Sun, 11 Feb 2024 08:00:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
Content-Language: en-US
To: Alex Kiernan <alex.kiernan@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAO5Uq5TfNcuKkYX2krym5uN5t+ThbQ29Y8gfhq9kmLwYyHXfjQ@mail.gmail.com>
 <26286.1704984874999023341@lists.openembedded.org>
 <17AA2B18BB6DAD55.13033@lists.openembedded.org>
 <CAO5Uq5QnLcc54Hu4_hEtcxgAO9ap-82caQMpWoFBCj_rbJbdVg@mail.gmail.com>
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CAO5Uq5QnLcc54Hu4_hEtcxgAO9ap-82caQMpWoFBCj_rbJbdVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: df6e2c1b-48e6-499e-8a63-08dc2aa967c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FisnJypSDykaAtmLGirh1/nmy79ao+u4T6GgQSW0QrxBolP1ZQXK8f7Md8UC2URrBIDPBKUisB6e/hyebFjtAMfAjaEqh/BrLJ9R4U3nXBvWkfNkVFWytkom9joWD51/Q/B0i/JDBB2CWzXtn7TXJ5tMwqDlwE3bBDtR17PfI9APpovq5m0ohLR6IPYywYM8J2NU7uMaCdhHuqlQ691GmpHRTrac8Z291yFgN1JcdE+WkHWODcODP9Rmeb6uHIRCcXG23IauKaQvL/xtWBfB47cqKqNW/Hi5TT8I7SlKweCeqL3DGGvv9vXOunRrJ14x2QHvy8+B5cTbGRc2lJMFwDhr3pghhFHX5FZoi7mMXgPi7nazfCDChChbNDWDFqefbWfML/uzNjKupS1zG9DC0cYrVSBdGjroDqnVKgUtmdo0Y3k4D+7seT7kQA/SXdsrD7MdPeDPayNz6mofDppKiglX0CFGOytNzZUSu/BzP4yfhXUqsKfqXawb6sRq4R8EHTYS9vBx75hGciLdodpo3PK0u6IccA3XihswaiX8zfg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(376002)(366004)(396003)(346002)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(41300700001)(66899024)(5660300002)(31696002)(110136005)(86362001)(2906002)(38100700002)(478600001)(66476007)(6486002)(8676002)(966005)(66946007)(36756003)(316002)(8936002)(66556008)(2616005)(83380400001)(6506007)(6666004)(52116002)(53546011)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eU55Y2JyLzFGbENiSlNtcEdmcEhKQnhmQzJQSHZLbGVtemViWlZaSGQvcGtp?=
 =?utf-8?B?d1VnRHRvcGFoOXEyWUd5Y2x2cG0zNlVmRDAxSlJPL0RNM2NSc3NjSkUvWE1Z?=
 =?utf-8?B?VHdSUXRMUU8rbjZoMUpwaWVjWUxZMHBwWkhaeWoyaVk4M2hCMy9uWVNXbkhu?=
 =?utf-8?B?Mk40ZGZRMlRnZzhzQXVRc3hBN3RsQ3VmYzZHckhTMlJzSlJscFNVYWNUaExu?=
 =?utf-8?B?K0twQmswSHV2Y1R3V1hiTDZna2lwTmp1NkM4c0pVbXBPWkNZRGcvbUQ5cjJu?=
 =?utf-8?B?WUYzQy9McmFCSDNFU3Q3ZFp2Wk5vRFp5N1ZWSjVKdzNqKzU2YU1sY0ZyVVk3?=
 =?utf-8?B?TnQ3V1gyT3MwUmpDTHhvRHRFSW5id1BHMkNLOHdyZWwyb0dyRnZKWlkzY09Y?=
 =?utf-8?B?dFk2Z3IyemNoUjhwQ2FiSWFsMllnTkVaV3J5YmZ5Rk5xWGJxdVUySGFBUFpL?=
 =?utf-8?B?NVd5bVcvNmFMOUwrU3pXcjJ0MlZFUE9oNFd2SzBOaW80aDdOb0VScGM5RWJo?=
 =?utf-8?B?MFpTZmx0bE1EdHRUR3hrUjM0dUQrcUJrVmwwNmMvZmwzc2tua0tlV3FCaEJE?=
 =?utf-8?B?bzFLZW5nUktnODQ5Qkl0UGZmTHc3K2Q0bWxoTUNoRWFGSktVQkthak5xZHJT?=
 =?utf-8?B?N1U2SzI5L09FVzdNNE9VZ1VFb3BFSytYVGxyQmQyU0xTbFZRRmtLNmV0WEVu?=
 =?utf-8?B?NFR0ZFB6Zm1HVytNbjRiOFNNalZjQzlHV3ExV09FUnhDMm5oeG1oWklnN2ZZ?=
 =?utf-8?B?Wm4yWUtvTHVjdFdTS2NnMTRtcFMzZXhaUzk1cEtRbXFwT1hEZmFTdXR5NkJ1?=
 =?utf-8?B?NkhZUXQzZGJVdVEwOC9IZk9HSWF0YUE3ZFlqcmJxMTJqeWkxd0p4OHZNS09s?=
 =?utf-8?B?OTU1bUQrMTF2a0x5Z3N3aTFtNm1OZE12UW1KYTVSRHBHanJZOEFNN2srelVS?=
 =?utf-8?B?bVpwNlBhZlNiZVRnZHpkY00rVGRHYzUwMmprL21rSGxsVVhXd0U5QkpZQUNG?=
 =?utf-8?B?UkR1bVllVG9tSHVlOFhNTCtkU2J4WVRKZHpkbnlBZ29oVklZWlByU1o3ay8w?=
 =?utf-8?B?NXkzWld6NjRZZ21DeDJ2L0hMaDdWNHFjVng2QVBSRHl1cXk2NnV0L2srRUY5?=
 =?utf-8?B?MHdQRU8zMTV1Mmk1M1BVemxXNCtuaHJPWjYwc2lTVnJ4VDR2YTJ5VU5FN2xQ?=
 =?utf-8?B?NSt3cG94K0ErK0dqTjdFTXFldThER1FwR0ErektPdnBtOFZPNWRkb0REV2ZK?=
 =?utf-8?B?Uzl4YkJOeThWMlo2VmtyWlBYSzZSVHM5YTZiVThXOEF1VnUzNGMvbGJwK0t6?=
 =?utf-8?B?VTBTR2tOeGFkbUcvTVdiSmkxcnhoenVEMXU1MlYyWHFieG9kQ1o5NlF0NkRU?=
 =?utf-8?B?TGNhZFpPamQzdHZFMWZKU01VMzFZMTZoUjZnY1VOVDF5Ly9zMnFDZ1pGTE0y?=
 =?utf-8?B?NDV5cUlIaENUbzZOK3UzRWNYNGc4NGlBbEd3KzFycy8zNW92VjNRUnlQRUZ0?=
 =?utf-8?B?UFExNWdZYXpWd3k1VTlKUVNGaHN4M2NOREtVS1RySWoxRlFKU09PRWwxVDkx?=
 =?utf-8?B?NjVLRUsyNWJjVTZTd0dKN0pUNjY4ZCtjR00zbFVtTUIyWVY2ZElXNDliYXQr?=
 =?utf-8?B?YzREdW81MXVwNU14cHM3OVVCYlFwc20wdkVJREJhYWJ6eWwvdlJFZ3RwcmdT?=
 =?utf-8?B?emlScDhKcGhUTVZROUpHRjdvNDRrajR5bXhMSC9ESlRvSm5RbjZSbVpTZ256?=
 =?utf-8?B?dkR6N2kzaG9VcEwvN2tja21TY3A2T1U2VVVmbDgwYks1NzF0MUdSNDUwY255?=
 =?utf-8?B?Sy9rTlo1RURqMlRteGxwTnFuaTRERElkUjBOdWI1L3FsWFJhVlcySktoYmty?=
 =?utf-8?B?SUROVVkySmZjdkhvMU5lbWFibzFBeE81TzFhQVZsL0d4MGNtbC93aGRjdlhr?=
 =?utf-8?B?RXM5Q3NOeGVQL0JFdmVhb0ZNd01oSEpKTEh6VXBUSXBkNm9uak5SUk5YV1d1?=
 =?utf-8?B?VEEzbFg4T1pBQjd6N2dFT2Y2VTlCcFVQQ1ZGTnZVU21tSkdpTEpreGFoT3Iw?=
 =?utf-8?B?UTU3b1RNQ1U5NTltOFRsQnFWWkxIb0MzaytLdFV4bUkrK3dYNkVaZ1ZDYWlL?=
 =?utf-8?B?N2tHT1N6Q3c2V0ppTUl6bkQwbG1qRWU3eDE3TzhXKzZQSlAwbUtxdTZldUs5?=
 =?utf-8?B?WllWSEtHdmQxd0RlUUZDWmtJd3h2SXZTMVpFaVlkcW9PdWdBM3k0OFRCbVJD?=
 =?utf-8?B?aUdhQ3hOaGtPOHZWQjFqclQyOWhBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6e2c1b-48e6-499e-8a63-08dc2aa967c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 02:30:26.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8NSDmPCMYwFp3rlfpnHWNrOeb7Z8gfIwzJfQfXpjxzbqISbx8vhk7qoT+9Dy0CzL47IvYMBQK+VAiWfjLn/Ieg1jlc1lftUSTmaJJCrvG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
X-Proofpoint-ORIG-GUID: SFbp439omIf5nJzZAXUPkyjLiRy1dFeN
X-Proofpoint-GUID: zmzaJMU_xB1nG5oaUU7kGspc34RlIMG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-11_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402110020
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41B2U9nN023402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 02:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195281


On 10-Feb-24 17:33, Alex Kiernan wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sun, Jan 14, 2024 at 9:00=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org=
>
> wrote:
>>
>>
>> On Thu, Jan 11, 2024 at 2:54=E2=80=AFPM Sundeep KOKKONDA via lists.ope=
nembedded.org <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> w=
rote:
>>> On Tue, Jan 2, 2024 at 02:54 PM, Alex Kiernan wrote:
>>>
>>> Closing this off - for whatever reason the buildpaths check wasn't
>>> getting run when I was testing stuff, so what I thought was a fix,
>>> wasn't.
>>>
>>> Hello Alex,
>>>
>>> Are you working on fixing this issue?
>>>
>> I'm not at the moment and I don't think I've anything useful as a dire=
ction at this point.
>>
> FWIW I pulled in 1.76.0, we're still seeing the same reproducibility is=
sues:
>
> WARNING: rust-1.76.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libderive_more-1faee1ce80838df0.so in package rust contains
> reference to TMPDIR
> File /usr/lib/libdisplaydoc-c60c5da2941c7f1c.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libicu_provider_macros-503ba5e62e8977cc.so in package
> rust contains reference to TMPDIR
> File /usr/lib/libzerovec_derive-02237fc3421c90c4.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libderivative-58d493bafc99c13f.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libserde_derive-a1b27683d4bd4bd3.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libproc_macro_hack-f0b1af1c81588855.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libyoke_derive-c488be35990c06f4.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libunic_langid_macros_impl-01f309d5ed553f7b.so in
> package rust contains reference to TMPDIR
> File /usr/lib/librustc_fluent_macro-3554f4fe539dac9e.so in package
> rust contains reference to TMPDIR
> File /usr/lib/libthiserror_impl-d74aaa58e138729b.so in package rust
> contains reference to TMPDIR
> File /usr/lib/librustc_index_macros-4bc894c1875c7c9b.so in package
> rust contains reference to TMPDIR
> File /usr/lib/libtracing_attributes-7e254d62927f0d68.so in package
> rust contains reference to TMPDIR
> File /usr/lib/libthiserror_core_impl-f6328e975dbf41e3.so in package
> rust contains reference to TMPDIR
> File /usr/lib/libderive_setters-095386c54d928d42.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libzerofrom_derive-23d9112afea1dfeb.so in package rust
> contains reference to TMPDIR
> File /usr/lib/librustc_macros-66ca7e6161e7a266.so in package rust
> contains reference to TMPDIR
> File /usr/lib/libdarling_macro-11d884e730198868.so in package rust
> contains reference to TMPDIR [buildpaths]
> WARNING: rust-1.76.0-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libderive_more-1faee1ce80838df0.so in package rust-dbg
> contains reference to TMPDIR
> File /usr/lib/.debug/libdisplaydoc-c60c5da2941c7f1c.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libicu_provider_macros-503ba5e62e8977cc.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libzerovec_derive-02237fc3421c90c4.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libderivative-58d493bafc99c13f.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libserde_derive-a1b27683d4bd4bd3.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libproc_macro_hack-f0b1af1c81588855.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libyoke_derive-c488be35990c06f4.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libunic_langid_macros_impl-01f309d5ed553f7b.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/librustc_fluent_macro-3554f4fe539dac9e.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libthiserror_impl-d74aaa58e138729b.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/librustc_index_macros-4bc894c1875c7c9b.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libtracing_attributes-7e254d62927f0d68.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libthiserror_core_impl-f6328e975dbf41e3.so in
> package rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libderive_setters-095386c54d928d42.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libzerofrom_derive-23d9112afea1dfeb.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/librustc_macros-66ca7e6161e7a266.so in package
> rust-dbg contains reference to TMPDIR
> File /usr/lib/.debug/libdarling_macro-11d884e730198868.so in package
> rust-dbg contains reference to TMPDIR [buildpaths]
>
> Tree is here https://github.com/akiernan/poky though I'm not able to
> look at it more at the the moment.

Hi Alex,

I also observed such warnings in the rust build. Raised a bug &=20
discussing with upstream on the same.

https://github.com/rust-lang/rust/issues/120825

https://internals.rust-lang.org/t/rust-libs-are-not-reproducible-from-1-7=
5/20290



Thanks,

Sundeep K.

>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195263): https://lists.openembedded.org/g/openembed=
ded-core/message/195263
> Mute This Topic: https://lists.openembedded.org/mt/103433093/7677583
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sundeep.kokkonda@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

