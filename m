Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B15C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 13:02:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8109.1678798951763066201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 06:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=iztPMrTi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2437f95e4e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EA7qcb012730
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 06:02:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZTY1jPoKrZQ0hBD+52k28Qu37KXAgUzP0Ve1L5QWjXY=;
 b=iztPMrTinOT7gprc94h2msXTGk7uqiwngc7DhHTDMw9jX9dhHCIOnDa9H7acKicJwG4y
 hVFAdsQ0aNOYQe2tlGI59uyPlLKVGDApdHK+IuaRRjJVjl1J9Lwd2ILlonhSuqlTGYdv
 IRYMzBcVQ4lMi6AhZ9RfbBCgTk4woZ//+qifcXED81C5+Pk90tQcxIMYa2Wq9Wh5WTbN
 2W+3SiPLm2lTeV5ztueQBGqNnevKzWQeeHxgZ3Rg+D7mAJNvYRu1MNbscscW7Orp+U93
 UdC56tIaR+bffh7Cnbc7kAmcPJ9uKy014daWv5VX6kI3xbCmKeeae2wD3M6u0jtUaCQE lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8nt8tp06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 06:02:31 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ED2U3p032731
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 06:02:30 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8nt8tp04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 06:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etzEsxpzmopejFVClMCesrha29C/6e/8QtrbTB3IvJxRlHocTzSLbRrO3D2ZKmcXbMpLxVVn4WsqT1YeeD+KQRCGayBcxDmKoeuuVGzKrm5Tm2T9b+s55/ayacSJBQ6UwYhKATuTfL76NOo+4Nzz/fbOp47OHjKvb4P9YZpXsNlp2u2JhURAzCkYZLGmKZ0Yw5DLjhn13TNy+0S5zM4t2rksuaQQQY7i7v9srXtgYmvCcvqly2f4Nmxuhh7O0gQKNPsvoD7SNdz+P8iyKWPVvm3zo3mxbuAv6wGgkYouTTywRMYSUdrouq0S5hjOfYvCbj/L896K0xGzu9DlBzUClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTY1jPoKrZQ0hBD+52k28Qu37KXAgUzP0Ve1L5QWjXY=;
 b=IoI46eF4pPa03BFEqMnhG69g/ejG8arD5F7tU9whBo19w5HWz1WYDyqsMlkYCcSK1RTmTLM4V6ICSPGYuM8dnxzfyLacRy3WCqkCMSPikCiw9TsWbmIfGKexeCgHlfU6rWdGrAO3Gyu+bDP5LTJsYdYKn27HKc3XRm1F4MEAjPNMYk1Usm+ZXOZV+kQGQqoiz0u3lvVV7KEEaodJKCemzz3RVRVqSDyWCMAKOLn76Z+n3pe+01BO8ZBOyaymzUzEAD3yBdZhk4kXwlRoEllwDvSxN9PRmD8x2mqCnGoKPbUTixw4GAYoVufWklLlfUM9i1EruX+iNf8Mpd7EQhRx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Tue, 14 Mar 2023 13:02:24 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8116:ef44:a7f5:2abb]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8116:ef44:a7f5:2abb%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 13:02:24 +0000
Message-ID: <0e37235c-2469-5adf-74a7-1deb79514c59@windriver.com>
Date: Tue, 14 Mar 2023 21:02:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: fix compile error
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20230214142235.38975-1-kai.kang@windriver.com>
 <CA+chaQe7v3SCti7VASE80CcsPaObRk+FXckC5NcVYsrSh5cfCQ@mail.gmail.com>
 <ab763cf8-1627-84c7-f533-738295f13914@windriver.com>
 <CAOSpxda_TCH5eCBB6p1VhjgpAr1Z0a6yf=gT0b1A2hNM+M2sJA@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxda_TCH5eCBB6p1VhjgpAr1Z0a6yf=gT0b1A2hNM+M2sJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0fde0b-f01a-4afc-d575-08db248c5ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	79NAri62eIPzqVyEuJSAL62EZeer6NhdIyol5zZ6IPJVs8rC+7twbprEmpbpnGfj1/ykxkqBjEZwZ8alNFSyl6Xe/kYy9h5CGk/+KN9SZDZO3brYoUM3NJhPOTc6h0riU3P6ortnJIm6LCGO1sGmhz3uvJ+ln7xNDmlxBnucycBJV98U4oON+19dZQaWQqgjw1QtK+vUyGX6+/Y49cXEbftjLZ9WDlPSMuGcnnXU5b29vroqfi87WEZDJMooepuc/HNGHLstYP6RiLj6vm/TUlvL1AqU41FKSymOMVmOLCHJW/6PeRtOyzBAsnOLiTZr33A50qZJLiAufdU+suPAcLT34wUcfLh9Pa7p0ChuzjWkR4rQw7+lNfNgC1GHq4sS5jRR/Lclum58CHAMwtClA2ZdjC+emC3Q8QKuYbqbqwc72bFWPqwdhdmz2/9PFoauMvcPmgZPEedYnD2z6Gb1rgY63DtKipBAXk0qFDHxdlrQTUZb+RYjzvcn5bYArf+v3OV7Jee5x3xb2K5jQv4d51wwodenfVFj3ox7gXenazwK0r7UUkbmftxfg8X2IyBwuAqYEty+iafxnolsjVo0iDZU4AQwRR6BrrjvsYdKqC0LOETsyDrlFgKpkDxkPcRQ7hDs0+kZ3YAzhuqsRTqgbWjW64SVWuSheOzx1LYT7Rb4bZFQTb12xuFgCEj+PylplRAUQFmGllOZKFlWUW+d4LHhMHqiWRz17KL/BOReUXp7AzArz9Sx/SpnGQDj1110rhySRrCWn6+B57qOOSvsTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(451199018)(30864003)(2906002)(83380400001)(66899018)(31686004)(6486002)(966005)(6666004)(26005)(6506007)(6512007)(36756003)(2616005)(5660300002)(53546011)(316002)(186003)(8936002)(86362001)(31696002)(41300700001)(66476007)(66946007)(8676002)(66556008)(38100700002)(4326008)(478600001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFNRVE52aElJOXBIaGxPSnFJbWpZVlZNeUxVRkhseGRodzluTytpcXMwU0tN?=
 =?utf-8?B?VTRkZzhsNlNyNy82Mk9OckxGcWlaVWpUYjZYMkFFSlZWUTVpM1kzelI2b0Jp?=
 =?utf-8?B?akhWbi9UcEgvNVdYQjFPVGk5QzIzRzVLaURkQ1FsZzZLWmZiNkxqWklKWjNQ?=
 =?utf-8?B?cWRleStOS2tQVldpOWZ4UlphVU5XVUhWV3lINnhibnlTaTJyNEtWNUpveDVo?=
 =?utf-8?B?OFJwVjFLekx2OFVCcU5DWmtBa2o2STJNUFMvbUZvbmVJckNWYXlVeGpxVUtw?=
 =?utf-8?B?b2V3RjA4Y0hha3puTTYvaWRCTk51YUtWQlpWWG9CenpoQ3pvRXZ5TE5aWHlh?=
 =?utf-8?B?aU8wek9xcFFjcjJCakp2QVB6MWEvRXZraWYyQ0hRTHlsSFN4UnViRFNoK2lh?=
 =?utf-8?B?STdRWlZyT0lzTnZRQS9VbTdCVVgvU0Z1bm5UKzl5bzg5VlpIcU1POExKSVVa?=
 =?utf-8?B?UURJU3dvbGNTMThsQ0RRcFJRWjdaT1VDUU9ha01acGdkOHFSNHRYM3l3S3ZQ?=
 =?utf-8?B?QjJEa1RibDdDNlRWV1hKeFFJc0grVnZuT3dzK2RKMVg5YjJuZkNhVWZVeVpj?=
 =?utf-8?B?RFpUdEh5QjZuTDNYeXJzQUhMZjd4dG9mOW5aVnh6Ly9ieVA3OTlnNFlGL0Ir?=
 =?utf-8?B?T3lkcmlNWS9Cai9rNHpwR2pQR0NuQ1N3YW5Ybk1mQlFqTWlhRlIrMVhld1p5?=
 =?utf-8?B?Vk5hRmJDaUpqRkZoUHhPRDAvM2xoajdHcGEwdU9OUlBOQmsrK2xINUROdGsz?=
 =?utf-8?B?Vi9MaWZWM0Joak1UdWtMb21WQnVzYkJaU1ZJcmdtUlRuRXlvVkdWWEN3RVUr?=
 =?utf-8?B?bHhqZjZqczhvbVNBMlBxRGhPYVYyOER1cnEvdWtXZVVZdlFWVkY2a0FycFNw?=
 =?utf-8?B?UHB1RC9DaThZUzBFUGVseWFCcVcyeDk1YTdiQyt2NUNCaHpmamxWUXRUR0pw?=
 =?utf-8?B?MTMwRkg5aFBqcXBVSHFPNGxiVnBGSENnQXBUOFVFUDlOMFliT09XejREdFpD?=
 =?utf-8?B?eUxvWG5mbnRoblArTGhReks2eHA4elRkODFZT1k5cld2T1FIQ05pZ3B4QXNE?=
 =?utf-8?B?ZG5USStsVGttWllGVnlWZGt1QlJ0MG5OajVzZEdWeU5UMGt6NXhSWUkrSDRs?=
 =?utf-8?B?VW5FeFV6eStqVGwwNDdVWktsR1BhQzNjNlIzZGhKQS9NWFh5REMzZDcxdXJ0?=
 =?utf-8?B?Q1ozWnQwcmlyR1BlUlUwTkVUcFZaQUJySnExNTVVQzhqUFFySk5uYnZESVVo?=
 =?utf-8?B?TnV6WTFLNGhQMjZwK0dhQUVUMTlQSXAyTmVMQmRWZjVLeWRTQVNMUWpiOHQy?=
 =?utf-8?B?ZXpGQUVPVW9JYWlIV1FBR0puSlk3cWN6d2ZhdmwwZnJpQThJYjI4Tjk5dWx0?=
 =?utf-8?B?YTFQR2tYTmxJSXJYUUEwVGZxWTBjNCsrd0p4ejhvSDhkenA2b0p2bEFHZ3FU?=
 =?utf-8?B?RFdubzBuaXRIUk5LTXR4OHFOYm5wdDFTcFdrQU44ZUt0R203d0hucmdlYi9u?=
 =?utf-8?B?RGZILzZwL2pLVmFrcUQyWklXMzhZb0VEeGs5UDZZL1crNHdrbHg4RnVUUGMz?=
 =?utf-8?B?MGd3bVhEbjRuSXZROTlvWDZNOEZ6NDVqWnNkOG55NHZIZ0dpQktRNXFHdTh6?=
 =?utf-8?B?QWtDOU9OSXMybzVaNHk4cTZKS3gvQ0o5VUV4bkxGTnBsWE42dEU5T09pYkJV?=
 =?utf-8?B?OW13YVFaTERIc2owKzlYV0pFSTdETHBnQmx2aFRXNmhBSHB5L2NGS2duV2dU?=
 =?utf-8?B?STlDMHRGa0VYMlFPanoxK1hweGNHcXJ4SWJzTXAxSmF6bkRWNXdMNUw1OG1U?=
 =?utf-8?B?T3JJOVpFUEUzaXFDNDFJUHlZSUJNYk1qLytjMG1PM2Nsd3hiYU0zdStmblNN?=
 =?utf-8?B?T3ZGNE15Z3dkdDVTb3RJNXlIdjFPR3dTbFVWaC9ySVdPTktzLy9CTklMOXRy?=
 =?utf-8?B?R2x4RWJQbEducUxiN0RhU3BnVHcwQkd4Y1l1RS8yRVBicEhybWtCWCtkV3k5?=
 =?utf-8?B?T29ZZGdXTWg2cVBIYXdET0F4V2FDazIrRlg0TWd2RER1ZGdYTDJMc1J3cDZ6?=
 =?utf-8?B?YjZvdUtjNVdsNWd4ZFFJaHVrZUxSN2Z1Z0Z2VDBlaWowZEVLVEZHekpGTGRx?=
 =?utf-8?B?MDZJOXlnbHMyM2FwT1pGblJlcHVKQVZON2pOSXVncGhVVHZvZGxOTHFJTDhJ?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0fde0b-f01a-4afc-d575-08db248c5ae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 13:02:24.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QN47c0cfN4Hwgi3afeneZGjVGj+R3UGN9YJZqKwGWFgWNC2oO9uUGFIat5C7EzAZ4vu8tu/oXLMhdFYNCF+ObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-Proofpoint-ORIG-GUID: MdFOyB7vmj62F_fbamfc037FFxolPxfv
X-Proofpoint-GUID: Eu5eU0PhyABsQ-pcX92IX5fiOoYtwOgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_06,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32EA7qcb012730
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 13:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178489

On 3/13/23 23:43, Steve Sakoman wrote:
> On Tue, Feb 14, 2023 at 4:22=E2=80=AFPM Kai Kang <kai.kang@eng.windrive=
r.com> wrote:
>> On 2/14/23 22:30, Martin Jansa wrote:
>>
>> Thanks Kai,
>>
>> this should fix what I've reported in:
>> https://lists.openembedded.org/g/openembedded-core/message/176508
>>
>> once this is merged, can you please add both oe-core changes (3 qemu p=
atches) to dunfell as well, so that similar patch is included in both bra=
nches? The broken version wasn't merged to dunfell after my report.
>>
>> You mean CVE-2022-4144.patch and this commit, right? OK, will do.
> Hi Kai,
>
> Do you still plan to submit the above referenced patches for dunfell?

Sent just now.

Regards,
Kai

>
> Thanks,
>
> Steve
>
>
>> Regards,
>>
>> On Tue, Feb 14, 2023 at 3:22 PM Kai Kang <kai.kang@eng.windriver.com> =
wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Backport 2 patches and rebase
>>> 0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fi=
x
>>> compile error:
>>>
>>> ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>>> ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (fir=
st use in this function); did you mean 'gsize'?
>>>   1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &of=
fset, size)) {
>>>        |                                                             =
      ^~~~
>>>        |                                                             =
      gsize
>>> ../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identif=
ier is reported only once for each function it appears in
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>>   ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
>>>   ...ass-requested-buffer-size-to-qxl_phy.patch | 217 +++++++++++++++=
+++
>>>   3 files changed, 276 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-=
qxl-Have-qxl_log_command-Return-early-if-.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-=
qxl-Pass-requested-buffer-size-to-qxl_phy.patch
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc
>>> index b68be447f1..5430718f75 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -93,6 +93,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
>>>              file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msub=
qp-o.patch \
>>>              file://CVE-2022-3165.patch \
>>>              file://CVE-2022-4144.patch \
>>> +           file://0001-hw-display-qxl-Have-qxl_log_command-Return-ea=
rly-if-.patch \
>>> +           file://0001-hw-display-qxl-Pass-requested-buffer-size-to-=
qxl_phy.patch \
>>>              "
>>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have=
-qxl_log_command-Return-early-if-.patch b/meta/recipes-devtools/qemu/qemu=
/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
>>> new file mode 100644
>>> index 0000000000..cd846222c9
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_lo=
g_command-Return-early-if-.patch
>>> @@ -0,0 +1,57 @@
>>> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34=
fc]
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +
>>> +From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 20=
01
>>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@li=
naro.org>
>>> +Date: Mon, 28 Nov 2022 21:27:37 +0100
>>> +Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early i=
f no
>>> + log_cmd handler
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Only 3 command types are logged: no need to call qxl_phys2virt()
>>> +for the other types. Using different cases will help to pass
>>> +different structure sizes to qxl_phys2virt() in a pair of commits.
>>> +
>>> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> +Message-Id: <20221128202741.4945-2-philmd@linaro.org>
>>> +---
>>> + hw/display/qxl-logger.c | 11 +++++++++++
>>> + 1 file changed, 11 insertions(+)
>>> +
>>> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>>> +index 68bfa47568..1bcf803db6 100644
>>> +--- a/hw/display/qxl-logger.c
>>> ++++ b/hw/display/qxl-logger.c
>>> +@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const ch=
ar *ring, QXLCommandExt *ext)
>>> +             qxl_name(qxl_type, ext->cmd.type),
>>> +             compat ? "(compat)" : "");
>>> +
>>> ++    switch (ext->cmd.type) {
>>> ++    case QXL_CMD_DRAW:
>>> ++        break;
>>> ++    case QXL_CMD_SURFACE:
>>> ++        break;
>>> ++    case QXL_CMD_CURSOR:
>>> ++        break;
>>> ++    default:
>>> ++        goto out;
>>> ++    }
>>> +     data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
>>> +     if (!data) {
>>> +         return 1;
>>> +@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const cha=
r *ring, QXLCommandExt *ext)
>>> +         qxl_log_cmd_cursor(qxl, data, ext->group_id);
>>> +         break;
>>> +     }
>>> ++out:
>>> +     fprintf(stderr, "\n");
>>> +     return 0;
>>> + }
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass=
-requested-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu=
/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
>>> new file mode 100644
>>> index 0000000000..ac51cf567a
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-reques=
ted-buffer-size-to-qxl_phy.patch
>>> @@ -0,0 +1,217 @@
>>> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/8efec=
0e]
>>> +
>>> +Backport and rebase patch to fix compile error which imported by CVE=
-2022-4144.patch:
>>> +
>>> +../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>>> +../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (fi=
rst use in this function); did you mean 'gsize'?
>>> +       1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slo=
t, &offset, size)) {
>>> +               |                                                    =
               ^~~~
>>> +               |                                                    =
               gsize
>>> +../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identi=
fier is reported only once for each function it appears in
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +
>>> +From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 20=
01
>>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@li=
naro.org>
>>> +Date: Mon, 28 Nov 2022 21:27:39 +0100
>>> +Subject: [PATCH] hw/display/qxl: Pass requested buffer size to qxl_p=
hys2virt()
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Currently qxl_phys2virt() doesn't check for buffer overrun.
>>> +In order to do so in the next commit, pass the buffer size
>>> +as argument.
>>> +
>>> +For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
>>> +verify the size of the chunked data ahead, checking we can
>>> +access 'sizeof(QXLCursor) + chunk->data_size' bytes.
>>> +Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
>>> +assumed to fit in one chunk, no change are required.
>>> +In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
>>> +qxl_unpack_chunks().
>>> +
>>> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> +Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> +Message-Id: <20221128202741.4945-4-philmd@linaro.org>
>>> +---
>>> + hw/display/qxl-logger.c | 11 ++++++++---
>>> + hw/display/qxl-render.c | 20 ++++++++++++++++----
>>> + hw/display/qxl.c        | 14 +++++++++-----
>>> + hw/display/qxl.h        |  3 ++-
>>> + 4 files changed, 35 insertions(+), 13 deletions(-)
>>> +
>>> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>>> +index 1bcf803..35c38f6 100644
>>> +--- a/hw/display/qxl-logger.c
>>> ++++ b/hw/display/qxl-logger.c
>>> +@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLP=
HYSICAL addr, int group_id)
>>> +     QXLImage *image;
>>> +     QXLImageDescriptor *desc;
>>> +
>>> +-    image =3D qxl_phys2virt(qxl, addr, group_id);
>>> ++    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
>>> +     if (!image) {
>>> +         return 1;
>>> +     }
>>> +@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCur=
sorCmd *cmd, int group_id)
>>> +                 cmd->u.set.position.y,
>>> +                 cmd->u.set.visible ? "yes" : "no",
>>> +                 cmd->u.set.shape);
>>> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
>>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
>>> ++                               sizeof(QXLCursor));
>>> +         if (!cursor) {
>>> +             return 1;
>>> +         }
>>> +@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const cha=
r *ring, QXLCommandExt *ext)
>>> + {
>>> +     bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
>>> +     void *data;
>>> ++    size_t datasz;
>>> +     int ret;
>>> +
>>> +     if (!qxl->cmdlog) {
>>> +@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const c=
har *ring, QXLCommandExt *ext)
>>> +
>>> +     switch (ext->cmd.type) {
>>> +     case QXL_CMD_DRAW:
>>> ++        datasz =3D compat ? sizeof(QXLCompatDrawable) : sizeof(QXLD=
rawable);
>>> +         break;
>>> +     case QXL_CMD_SURFACE:
>>> ++        datasz =3D sizeof(QXLSurfaceCmd);
>>> +         break;
>>> +     case QXL_CMD_CURSOR:
>>> ++        datasz =3D sizeof(QXLCursorCmd);
>>> +         break;
>>> +     default:
>>> +         goto out;
>>> +     }
>>> +-    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
>>> ++    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datas=
z);
>>> +     if (!data) {
>>> +         return 1;
>>> +     }
>>> +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
>>> +index ca21700..fcfd40c 100644
>>> +--- a/hw/display/qxl-render.c
>>> ++++ b/hw/display/qxl-render.c
>>> +@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQ=
XLDevice *qxl)
>>> +         qxl->guest_primary.resized =3D 0;
>>> +         qxl->guest_primary.data =3D qxl_phys2virt(qxl,
>>> +                                                 qxl->guest_primary.=
surface.mem,
>>> +-                                                MEMSLOT_GROUP_GUEST=
);
>>> ++                                                MEMSLOT_GROUP_GUEST=
,
>>> ++                                                qxl->guest_primary.=
abs_stride
>>> ++                                                * height);
>>> +         if (!qxl->guest_primary.data) {
>>> +             goto end;
>>> +         }
>>> +@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t=
 size, PCIQXLDevice *qxl,
>>> +         if (offset =3D=3D size) {
>>> +             return;
>>> +         }
>>> +-        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
>>> ++        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id,
>>> ++                              sizeof(QXLDataChunk) + chunk->data_si=
ze);
>>> +         if (!chunk) {
>>> +             return;
>>> +         }
>>> +@@ -295,7 +298,8 @@ fail:
>>> + /* called from spice server thread context only */
>>> + int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>>> + {
>>> +-    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id);
>>> ++    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id,
>>> ++                                      sizeof(QXLCursorCmd));
>>> +     QXLCursor *cursor;
>>> +     QEMUCursor *c;
>>> +
>>> +@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCom=
mandExt *ext)
>>> +     }
>>> +     switch (cmd->type) {
>>> +     case QXL_CURSOR_SET:
>>> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_=
id);
>>> ++        /* First read the QXLCursor to get QXLDataChunk::data_size =
... */
>>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_=
id,
>>> ++                               sizeof(QXLCursor));
>>> ++        if (!cursor) {
>>> ++            return 1;
>>> ++        }
>>> ++        /* Then read including the chunked data following QXLCursor=
. */
>>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_=
id,
>>> ++                               sizeof(QXLCursor) + cursor->chunk.da=
ta_size);
>>> +         if (!cursor) {
>>> +             return 1;
>>> +         }
>>> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>> +index ae8aa07..2a4b2d4 100644
>>> +--- a/hw/display/qxl.c
>>> ++++ b/hw/display/qxl.c
>>> +@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQ=
XLDevice *qxl, int replay)
>>> +                                           QXL_IO_MONITORS_CONFIG_AS=
YNC));
>>> +     }
>>> +
>>> +-    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_=
GROUP_GUEST);
>>> ++    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_=
GROUP_GUEST,
>>> ++                        sizeof(QXLMonitorsConfig));
>>> +     if (cfg !=3D NULL && cfg->count =3D=3D 1) {
>>> +         qxl->guest_primary.resized =3D 1;
>>> +         qxl->guest_head0_width  =3D cfg->heads[0].width;
>>> +@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, =
struct QXLCommandExt *ext)
>>> +     switch (le32_to_cpu(ext->cmd.type)) {
>>> +     case QXL_CMD_SURFACE:
>>> +     {
>>> +-        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ex=
t->group_id);
>>> ++        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ex=
t->group_id,
>>> ++                                           sizeof(QXLSurfaceCmd));
>>> +
>>> +         if (!cmd) {
>>> +             return 1;
>>> +@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, =
struct QXLCommandExt *ext)
>>> +     }
>>> +     case QXL_CMD_CURSOR:
>>> +     {
>>> +-        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext=
->group_id);
>>> ++        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext=
->group_id,
>>> ++                                          sizeof(QXLCursorCmd));
>>> +
>>> +         if (!cmd) {
>>> +             return 1;
>>> +@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDe=
vice *qxl, QXLPHYSICAL pqxl,
>>> + }
>>> +
>>> + /* can be also called from spice server thread context */
>>> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_=
id)
>>> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_=
id,
>>> ++                    size_t size)
>>> + {
>>> +     uint64_t offset;
>>> +     uint32_t slot;
>>> +@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *q=
xl)
>>> +         }
>>> +
>>> +         cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
>>> +-                            MEMSLOT_GROUP_GUEST);
>>> ++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceC=
md));
>>> +         assert(cmd);
>>> +         assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
>>> +         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
>>> +diff --git a/hw/display/qxl.h b/hw/display/qxl.h
>>> +index 30d21f4..4551c23 100644
>>> +--- a/hw/display/qxl.h
>>> ++++ b/hw/display/qxl.h
>>> +@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL=
)
>>> + #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
>>> +
>>> + /* qxl.c */
>>> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_=
id);
>>> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_=
id,
>>> ++                    size_t size);
>>> + void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>>> +     GCC_FMT_ATTR(2, 3);
>>> +
>>> +--
>>> +2.34.1
>>> +
>>> --
>>> 2.17.1
>>>
>>>
>>>
>>>
>> --
>> Kai Kang
>> Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177179): https://lists.openembedded.org/g/openembe=
dded-core/message/177179
>> Mute This Topic: https://lists.openembedded.org/mt/96960641/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


