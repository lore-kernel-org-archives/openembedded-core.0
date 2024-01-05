Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE5CC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:08:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19255.1704442074574704301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 00:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QdPC2GtK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1734235549=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4055fAEs022767
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jan 2024 00:07:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=raxcX+/ZL7KLQPAiUo7
	fWSRegRGCNfaERR3u7ksHDQs=; b=QdPC2GtKz2OsXac4q5pBL0F6YLeVVybqqgW
	ZWLhIzIb8jdu6B0QYmJR/O8p/+1zduGo9Zezr7PT5iJtIubPnoqcrge8q3ASe1Ou
	KPm1jpX0lwhX9v1+/oo6zERiCu1cQ25MpQngbF1wZIWkagszjyuaAPsVYHEqfxXQ
	9JDWH7n974ojDraJZD3/o9HF4Uy6FXlkAm3uS9iiozJd8vWZm2mktDCVvMzQh6jF
	jl0xd/NV5LbxO7DhA07/zovQEZCHh4pFAcRZk0ABxSSGCfu++Sj9Cp3BXGVJkm7D
	G2AMmAOI9UrrnyEaDQGARE0yD8qC5tVLNPKPiHoCif0LzchpdKw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ve12a0pav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 00:07:53 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40587rV3026201
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jan 2024 00:07:53 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ve12a0pas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 00:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFkVvcx1wLvyAgNtPw4B4uSJesZ+/cQJc2/A0qOra3Kzhqx9ESplVeVZJPjvkr2mPeXAZYARfscPyJReQhjtCh2haQ/+Afq6qdpXj01tC7R9vpD8aR0jyWYxAul0/uQDXq9UtiH75sgImUA9UEe8kxiICP/zuGDHlor+V1rqSWqHj1D+YJ0uj3PF0tQnjtXan94n1RjnzAUuVGJJRf7oA+n9FhKLEJXCZup6OSG+lV4ersh/pc93E74KBM+Ahw8u9homFkjhQ7vAzs+nWUn2yu/FpfB9eChXseso9LNLFjWs5xaq4LnnxMQCkb5/c0sg04027vaqf7t7NPWKuxmNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raxcX+/ZL7KLQPAiUo7fWSRegRGCNfaERR3u7ksHDQs=;
 b=jBRnLiuEQIVllwG8XmUDxHTmWp2cQXe4B6YM+raLcGkZlOgBU8iDt/0s/h/fVkXuoaD96WbHEecLr67U4UMYQ/zqG7EDhE8NHPBMaVYo225FbG3qW2TpV2nBOFIGv08+fGxmQh2JcIShqzwE6gpsfrx2nirgL7CqaBUcAbv3BfI8t+a3qBTdojO/1cadeso1izJDk43OyPLXvM7OpU6VPBWygxHsh4fwO6FBof5/FV4GCP3+J8+CBTzxbRYIqTBtOi+UbyHr0sMOn0GtbpGz3+IK/mdzhfAnFy6ldntZhcXycdJvInbaJNOrGKZhmXKbTEbv3OkTFtXa5QaCkxeM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 08:07:48 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::ad41:7447:863e:ec3c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::ad41:7447:863e:ec3c%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 08:07:48 +0000
Content-Type: multipart/alternative;
 boundary="------------v1mibDi8yPxQhQAN25IB1RE4"
Message-ID: <37e79ce1-ef26-499a-a45d-6cf08a95242c@windriver.com>
Date: Fri, 5 Jan 2024 16:07:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH V2 0/5] Fix persistent tmp
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <179FA115B6317FAF.20566@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179FA115B6317FAF.20566@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 989d76de-11d9-43db-991a-08dc0dc567a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3y9IqidJfu6nuF/q4S7OllifoHlCChGO5lGRU50o6fYkSP89cEMXgkf0oBXUYTOXTCY3psFWboY9GVBOP+ce/VdQc7z79jCddAmO1l3w7wRyz1Wj2QMkGmPqE4z6a55aQbLEnWaubJ6H9usRUkjPJEerUh2w2k+Z2kIT5KMwIm10GmIioDB6oqq6AQimsbmBI2xU8xiIGWGLlTn5TOayOBVwetXPA6Prm3DnsOUeXbXxOOPxCBwtL3SLcoE+W1b9/Y0CQ9yXFXc3/R/jaPymNVUNeokht7q2R/gUrjOIzJNxvWh8eICRIWqli3c9AmFNuJolnWQYJJWtZiayWhUFMnNEXQpDVvgiATshhxrWELCNvI7Ir0H6S7ktgVks5tAqH6INppxrt5hsIPTQLZ5ki89aNgZCGZzmHMz8Dwtd1bu7pAeppHqufxiND68RfBF/Y5MWjb+y/v97NnYc8L9miB+BNEb7lAtiuNwfX8f63j/jIkuLwUYEjTFypDuU3BeNkLN9PG9WtCDhb40n6w6PSOT20+w0RYKeVHlKaDHYrlCVfFQU/7ITB6hJ5DwUZ5sxKyddIiDVeb64AeUnqn6MPPHcWPZYlFeZpxx1wqL7unCbgMWk3EpNmaPJae/pdFZ5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(31686004)(66899024)(53546011)(66556008)(966005)(478600001)(6506007)(66946007)(66476007)(6486002)(33964004)(31696002)(86362001)(6512007)(38100700002)(166002)(2616005)(83380400001)(26005)(2906002)(30864003)(21615005)(6666004)(44832011)(316002)(41300700001)(110136005)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnZrNTdDQk5wc2lkNUp6QmdxMFU3bkFpakNnczY5VWJKNHFBbUJVS3JpdTBJ?=
 =?utf-8?B?bVljSXpqUEMzVFZDWkpPTUNSanZSdTdZM0kwVTFtRElBVTlCdjgyM0lZR3lY?=
 =?utf-8?B?MGtNM2Y5dXlMRysxWGx2bVZLQWVTWXNqdGltdEVRMlZxSzhuMzdUQmdCT3V5?=
 =?utf-8?B?WWJTSFdnTXUrZk1ZeEFJK3k4RmNEUTNBVEdZUWE1VXdPUG5qdCtLaVBJbjU0?=
 =?utf-8?B?K0x3K2ZHR29XQzJDQjhyb0M5S1hFY2FzOGk5YnlFeWxKUjd4MStNSFNnMGF3?=
 =?utf-8?B?SzZzS2RDZng5dXRBeXUxZUd4V0lWL2psK1pSSkVWQzg1QnBsanpNbnF1cHlQ?=
 =?utf-8?B?dzFMdFZsL05oOVBVaEhYb0UrMGZRcEpjSUl6MmE5YVhPYnZUaUFrTDhIV3Vj?=
 =?utf-8?B?RmdtZzNNNjU2enlOYXArZ091dElqSjVOalF6YjZGb3NWWVFMUmFYWlNNNk1Q?=
 =?utf-8?B?NEJhVm4yZVYrSlJHWm0xdmNSbVl3TnRnTjViV0Uyd2d0RXI1a3YrUjhSaXFG?=
 =?utf-8?B?ajJnRDNyalhiQzJ4a2VIc0l1NWV4NHJFUjA1SHlaUlZvRkdjRTNKTFY0NzF6?=
 =?utf-8?B?TDhaajlwQzFRWGhQTGV5UGNBaXdDc09QZUtJNFAyWU5jK0IrMG1iQXZ2M0dJ?=
 =?utf-8?B?R240a3hYNG1ZdkNEYld6K1NLWXVpd2VqczR1MlB2bFYzWmlqWm1kNmUrZFZv?=
 =?utf-8?B?ZHJxY2NBaGVCaGRiWS8zb09nMWwrSXljYVpFbTRqWXEvTndVTEU3VXluSGZH?=
 =?utf-8?B?YWpkdXdEc29mVmtIcTBEWVovK3Z3YnlualFrb1FSN3dOVlYzZFJ6cWhyUzNU?=
 =?utf-8?B?MkRnVmp0d3lDZTBycUtML3M1Z3J2KytVK1NpbzBUeWJYT0dvZDFKYlBIRldD?=
 =?utf-8?B?eENCWUF0Q2ZGdldqK3BIVERzVlpqcUJyRWE4a0ZmRUt4Y2o3YTgrSVE5d1Fl?=
 =?utf-8?B?ak1MRFFtYTBBSElPbDl1YnhEZURmUlFTY3ZWZlJVUU1uMEVMbEd0OUlsR3hy?=
 =?utf-8?B?L0ZCeXZRT2lKNkZoZUxhR1RDNEtpMEhmTE15OTk3L0F2MUZuNlFYZkJsSWlk?=
 =?utf-8?B?ZnNncnIvb04rM3pQSlh3RlIvU2V6ZzFKdlY0RTcxVldBOVc3bGhqTURkcnRw?=
 =?utf-8?B?ZjFVdUtVSnNHREpKaHYrM3VrQmI3bEhVM2FHbFF1dUNuUGhQWnAxT3BVaDNs?=
 =?utf-8?B?Vjc3YXBvdGE5UEpRdGM3ZlVPd2VGVGdGSHZlU3pud3VVRzNOWXJSbHZ2RDNy?=
 =?utf-8?B?V25sSHpzTHB2SzdDQ2tGWUVNem8xTUNWS2x2dXRiMWNOSHAvMjRHV2tGMWFN?=
 =?utf-8?B?bExJVFlYU2JKb085TUk1b0FUWU5KV2VkR1VoNG16bUlmZVVtTktpUnFRYjBn?=
 =?utf-8?B?YUZKdDFKSXlvbzUrZEYyNDRudGxRVC9UdVZUdFYzUjNQSjZ5bUJqZ2cvTEVh?=
 =?utf-8?B?aHp0b0hMeXcxVUNMYW4reUpZSGdNbnBmQUNZT2lZYUxVYSt3S1lhL0RPbWFG?=
 =?utf-8?B?Q0xSSk1qRlRXVVArcGlFeHQzcjdjdHFINndqYzY2S3Bka1pxT0VJdFF4eWx5?=
 =?utf-8?B?ZUxVQkN1REFxaUFCOGdRakpGTmJ0SENGSVhYV1U0QWl2ekxNZngrdSthamJD?=
 =?utf-8?B?M29HK2x2ODdQTkhWYkJmeXBrYnUrTExHTktRTi91c25rUjYyZlZ3ZWN3ZE9v?=
 =?utf-8?B?OHpjclI3RUxaNmFsTG9yNzN0dGgwcDB6QlpNOXBWdUdpTk83K0hObnYzaVdk?=
 =?utf-8?B?UmY1RFdoN1ZVbTU1WGNCN01pRUVtc3NQdkFBdjZhTXdaSGs1QnRHTXdoelJr?=
 =?utf-8?B?cGJQbE1jdVNsT2JVdWNkL3RiNFJpT1l1QjNISC9ZQmFNaDUxMFUvb1RTWTlw?=
 =?utf-8?B?alI3a001dVQ4UzZCbklEdHo1NU5MelE4bDhPWFZXR0ZVY21TVXlabXpnL1Z0?=
 =?utf-8?B?VGg0OWlUeENoU2VndEZiSm9oQzdnOW94bnBhbS9EU21TaTczYldrS1VBMmV6?=
 =?utf-8?B?cHhxd1hWSkE1LzhTS1FnOXRPczh5Zy9sR1huMTJ0UjQwbVc4b1Qwb0NvZmdl?=
 =?utf-8?B?ZDZJSithMnAydDFjeDVmbW5kdXBycmF6eTROY2hJZjJxYWl3QkxKZUd5dWhN?=
 =?utf-8?B?TGhYNC9LdFVVd09Za001YitNVDFyWURub0J1MldEREFiRmo5ajc2OWNlcEFV?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989d76de-11d9-43db-991a-08dc0dc567a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 08:07:48.0859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEju/AU6XMHxTkhDu+i/+89T+lzvE6P8Cy3i0xaIwfLBxO/h+DGpUiZI4eONALoUBB0IMriJvtU2eWIRXQ0Z3/7YV9Xb4FfYpuX4ZP2Rf6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
X-Proofpoint-GUID: iGZLGhHii6Xx8g7qiO3B6JtHMi-O5l8c
X-Proofpoint-ORIG-GUID: wo5kzwYDwvaf1ID2NlwrpJpBNM4A0hB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401050068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 08:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193346

--------------v1mibDi8yPxQhQAN25IB1RE4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4055fAEs022767

Hi, Richard

I had send a similar patch before, subjected as "bitbake.conf: support=20
persistent /var/tmp",

and you have replied me with some concerns on 2021/9/13.=C2=A0 But I noti=
ced=20
that another variable VOLATILE_TMP_DIR is added in 2023.

but as I tested, it not works, so I make this patch to make it work for=20
both sysV and systemd. Not sure if you still have those concerns now,

so just kindly ping to check.

Thanks

Changqing

On 12/11/23 08:58, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Hi, All
>
> Currently, VOLATILE_TMP_DIR not works,
> set VOLATILE_TMP_DIR=3D"no", VOLATILE_LOG_DIR=3D"no", after boot target=
,
> /var/tmp still link to tmpfs /var/volatile/tmp
>
> lrwxrwxrwx  1 root root   11 Mar  9  2018 lock -> ../run/lock
> drwxr-xr-x  4 root root 1024 Dec  4 07:55 log
> lrwxrwxrwx  1 root root    6 Mar  9  2018 run -> ../run
> drwxr-xr-x  3 root root 1024 Mar  9  2018 spool
> lrwxrwxrwx  1 root root   12 Mar  9  2018 tmp -> volatile/tmp
> drwxrwxrwt  4 root root   80 Dec  4 07:55 volatile
>
> So I do some research, fix this issue and do some other changes accordi=
ngly. Please
> help to review this patch, thanks.
>
> Targets:
> 1. Support persistent tmp,  For persistent tmp, only /var/tmp is persis=
tent, /tmp is tmpfs,
>     For volatile tmp, /tmp link to /var/tmp, /var/tmp link to /var/vola=
tile/tmp
> 2. make systemd and SysVinit have the same directory structure.
>
> Currently, systemd and SysVinit have different directory structure, the=
 difference focus on how to handle /tmp.
>
> when volatile is enabled, for sysVinit, /tmp link to /var/tmp, /var/tmp=
 link to /var/volatile/tmp
> refer [4][5]. but for systemd, /tmp is a directory, it is mounted by sy=
stemd as tmpfs. /var/tmp
> linked to /var/volatile/tmp.  And for systemd, refer [6], set different=
 age for /tmp and /var/tmp.
>
> Since volatile disabled not works, ignore the difference when volatile =
is disabled.
>
> With this patch, VOLATILE_TMP_DIR will behavior like this:
> For both sysvinit and systemd:
> 1. VOLATILE_TMP_DIR=3D"yes":
> /tmp link to /var/tmp,  /var/tmp link to /var/volatile/log,  /var/volat=
ile is mounted as tmpfs
> In this case, for systemd, /tmp and /var/tmp will set to the same age, =
10d.
>
> Compare to current behavior, there are 2 changes:
>     1) for systemd,  /tmp changed from a directy to a symlink to /var/t=
mp
>     2) age of /tmp and /var/tmp will be same
>
> 2. VOLATILE_TMP_DIR=3D"no":
> /tmp is a directory mounted as tmpfs, /var/tmp is a directory on persis=
tent fs, and keep the age as [6]
>
> Change like this in order to meet [1][2], also maybe [3] for systemd.
>
> Compare to current behavior, there is one change:
>     1) for sysVinit, /tmp changed from a symlink to a directory
>
> [1]https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s18.html
> [2]https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html
> [3]https://systemd.io/TEMPORARY_DIRECTORIES/
> [4]https://git.openembedded.org/openembedded/tree/docs/usermanual/chapt=
ers/recipes.xml#n3535
> [5]https://git.openembedded.org/openembedded-core/commit/?id=3D12c4acd7=
ac5a27cf3676065b60f1c8395c96854c
> [6]https://github.com/systemd/systemd/blob/main/tmpfiles.d/tmp.conf
> [7]https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.h=
tml
>
>
> Test Result of following cases:
> 1.
> SysVinit
> VOLATILE_TMP_DIR=3D"yes"
> VOLATILE_LOG_DIR=3D"yes"
>
> root@qemux86-64:~# ls -al /tmp
> lrwxrwxrwx    1 root     root             8 Dec  8 08:51 /tmp -> /var/t=
mp
> root@qemux86-64:~# ls -al /var/log
> lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/log -> /v=
ar/volatile/log
> root@qemux86-64:~# ls -al /var/tmp
> lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/tmp -> /v=
ar/volatile/tmp
> root@qemux86-64:~# mount | grep volatile
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:~#
>
> 2.
> SysVinit
> VOLATILE_TMP_DIR=3D"no"
> VOLATILE_LOG_DIR=3D"no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 .
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   13 root     root          2960 Dec  8 09:24 dev
> drwxr-xr-x   20 root     root          1024 Dec  8 09:24 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
> drwx------    2 root     root         12288 Dec  8 09:22 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  161 root     root             0 Dec  8 09:24 proc
> drwxr-xr-x    4 root     root           240 Dec  8 09:24 run
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
> dr-xr-xr-x   12 root     root             0 Dec  8 09:24 sys
> drwxrwxrwt    2 root     root            40 Dec  8 09:24 tmp
> drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x   10 root     root          1024 Dec  8 09:24 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x   10 root     root          1024 Dec  8 09:24 .
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
> drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root             9 Dec  8 09:24 lock -> /run/l=
ock
> drwxr-xr-x    2 root     root          1024 Dec  8 09:24 log
> lrwxrwxrwx    1 root     root             4 Dec  8 09:24 run -> /run
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    2 root     root          1024 Mar  9  2018 tmp
> drwxrwxrwt    4 root     root            80 Dec  8 09:24 volatile
> root@qemux86-64:/var# mount | grep tmpfs
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1012164k,nr_inodes=3D=
253041,mode=3D755)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=3D1048576)
> root@qemux86-64:/var#
>
>
> 3.
> systemd
> VOLATILE_TMP_DIR=3D"yes"
> VOLATILE_LOG_DIR=3D"yes"
>
> root@qemux86-64:/# ls -al /tmp
> lrwxrwxrwx    1 root     root             8 Dec  8 08:49 /tmp -> /var/t=
mp
>             8 Dec  8 08:49 /tmp -> /var/tmp
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al tmp
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatil=
e/tmp
> root@qemux86-64:/var# ls -al log
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatil=
e/log
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1012160k,nr_inodes=3D=
253040,mode=3D755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=3D405732k,nr_inodes=3D81=
9200,mode=3D755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=3D4096k=
,nr_inodes=3D1024,mode=3D755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> 4.
> systemd
> VOLATILE_TMP_DIR=3D"no"
> VOLATILE_LOG_DIR=3D"no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   14 root     root          3260 Dec  8 09:16 dev
> drwxr-xr-x   21 root     root          3072 Dec  8 09:16 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
> drwx------    2 root     root         12288 Dec  8 09:16 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  173 root     root             0 Dec  8 09:16 proc
> drwx------    3 root     root          1024 Dec  8 09:16 root
> drwxr-xr-x   11 root     root           320 Dec  8 09:16 run
> lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sb=
in
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
> dr-xr-xr-x   12 root     root             0 Dec  8 09:16 sys
> drwxrwxrwt    9 root     root           180 Dec  8 09:16 tmp
> drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x   10 root     root          1024 Dec  8 09:16 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x   10 root     root          1024 Dec  8 09:16 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
> -rw-r--r--    1 root     root           208 Mar  9  2018 .updated
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    4 root     root          1024 Dec  8 09:16 cache
> drwxr-xr-x    6 root     root          1024 Dec  8 09:16 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run=
/lock
> drwxr-xr-x    4 root     root          1024 Dec  8 09:16 log
> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    5 root     root          1024 Dec  8 09:16 tmp
> drwxrwxrwt    2 root     root            40 Dec  8 09:16 volatile
> root@qemux86-64:/var# mount | grep tmpfs
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1012164k,nr_inodes=3D=
253041,mode=3D755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=3D405732k,nr_inodes=3D81=
9200,mode=3D755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=3D4096k=
,nr_inodes=3D1024,mode=3D755)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=3D1048576)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> 5.
> SysVinit
> VOLATILE_TMP_DIR=3D"yes"
> VOLATILE_LOG_DIR=3D"no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   13 root     root          2960 Dec  8 09:40 dev
> drwxr-xr-x   20 root     root          1024 Dec  8 09:40 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
> drwx------    2 root     root         12288 Dec  8 09:40 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  159 root     root             0 Dec  8 09:40 proc
> drwxr-xr-x    4 root     root           240 Dec  8 09:40 run
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
> dr-xr-xr-x   12 root     root             0 Dec  8 09:40 sys
> lrwxrwxrwx    1 root     root             8 Dec  8 09:40 tmp -> /var/tm=
p
> drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x    9 root     root          1024 Dec  8 09:40 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x    9 root     root          1024 Dec  8 09:40 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
> drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root             9 Dec  8 09:40 lock -> /run/l=
ock
> drwxr-xr-x    2 root     root          1024 Dec  8 09:40 log
> lrwxrwxrwx    1 root     root             4 Dec  8 09:40 run -> /run
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
> lrwxrwxrwx    1 root     root            17 Dec  8 09:40 tmp -> /var/vo=
latile/tmp
> drwxrwxrwt    3 root     root            60 Dec  8 09:40 volatile
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1012164k,nr_inodes=3D=
253041,mode=3D755)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
>
> 6.
> systemd
> VOLATILE_TMP_DIR=3D"no"
> VOLATILE_LOG_DIR=3D"yes"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   14 root     root          3260 Dec  8 09:46 dev
> drwxr-xr-x   21 root     root          3072 Dec  8 09:46 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
> drwx------    2 root     root         12288 Dec  8 09:44 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  173 root     root             0 Dec  8 09:46 proc
> drwx------    3 root     root          1024 Dec  8 09:46 root
> drwxr-xr-x   11 root     root           320 Dec  8 09:46 run
> lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sb=
in
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
> dr-xr-xr-x   12 root     root             0 Dec  8 09:46 sys
> drwxrwxrwt    9 root     root           180 Dec  8 09:46 tmp
> drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x    9 root     root          1024 Dec  8 09:46 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x    9 root     root          1024 Dec  8 09:46 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
> -rw-r--r--    1 root     root           208 Mar  9  2018 .updated
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    4 root     root          1024 Dec  8 09:46 cache
> drwxr-xr-x    6 root     root          1024 Dec  8 09:46 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run=
/lock
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatil=
e/log
> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    5 root     root          1024 Dec  8 09:46 tmp
> drwxrwxrwt    3 root     root            60 Dec  8 09:46 volatile
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1012164k,nr_inodes=3D=
253041,mode=3D755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=3D405732k,nr_inodes=3D81=
9200,mode=3D755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=3D4096k=
,nr_inodes=3D1024,mode=3D755)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=3D1048576)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> Changqing Li (5):
>    bitbake.conf: set correct FILESYSTEM_PERMS_TABLES
>    base-files: update dirs1777 and volatiles according to
>      VOLATILE_TMP_DIR
>    initscripts: support persistent tmp
>    systemd: support persistent tmp
>    eudev: create dir /tmp if persistent tmp is used
>
>   meta/conf/bitbake.conf                        |  5 ++-
>   ...fs-perms.txt =3D> fs-perms-volatile-log.txt} | 32 ----------------=
---
>   ...tent-log.txt =3D> fs-perms-volatile-tmp.txt} | 27 ----------------
>   meta/files/fs-perms.txt                       |  3 --
>   .../base-files/base-files_3.0.14.bb           |  8 +++--
>   .../initscripts/initscripts-1.0/volatiles     |  1 +
>   .../initscripts/initscripts_1.0.bb            | 12 ++++---
>   .../systemd/systemd/00-create-volatile.conf   |  3 +-
>   meta/recipes-core/systemd/systemd_254.4.bb    | 23 +++++++++----
>   meta/recipes-core/udev/eudev_3.2.14.bb        |  4 +++
>   10 files changed, 40 insertions(+), 78 deletions(-)
>   copy meta/files/{fs-perms.txt =3D> fs-perms-volatile-log.txt} (53%)
>   rename meta/files/{fs-perms-persistent-log.txt =3D> fs-perms-volatile=
-tmp.txt} (59%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192130):https://lists.openembedded.org/g/openembedd=
ed-core/message/192130
> Mute This Topic:https://lists.openembedded.org/mt/103100474/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------v1mibDi8yPxQhQAN25IB1RE4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi, Richard</p>
    <p>I had send a similar patch before, subjected as &quot;bitbake.conf:
      support persistent /var/tmp&quot;,</p>
    <p>and you have replied me with some concerns on 2021/9/13.&nbsp; But I
      noticed that another variable <span style="white-space: pre-wrap">VOLATILE_TMP_DIR is added in 2023.</span></p>
    <p><span style="white-space: pre-wrap">but as I tested, it not works,  so I make this patch to make it work for both sysV and systemd. Not sure if you still  have those concerns now, </span></p>
    <p><span style="white-space: pre-wrap">so just kindly ping to check.  </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks</span></p>
    <p><span style="white-space: pre-wrap">Changqing
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <div class="moz-cite-prefix">On 12/11/23 08:58, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179FA115B6317FAF.20566@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Hi, All

Currently, VOLATILE_TMP_DIR not works, 
set VOLATILE_TMP_DIR=&quot;no&quot;, VOLATILE_LOG_DIR=&quot;no&quot;, after boot target, 
/var/tmp still link to tmpfs /var/volatile/tmp

lrwxrwxrwx  1 root root   11 Mar  9  2018 lock -&gt; ../run/lock
drwxr-xr-x  4 root root 1024 Dec  4 07:55 log
lrwxrwxrwx  1 root root    6 Mar  9  2018 run -&gt; ../run
drwxr-xr-x  3 root root 1024 Mar  9  2018 spool
lrwxrwxrwx  1 root root   12 Mar  9  2018 tmp -&gt; volatile/tmp
drwxrwxrwt  4 root root   80 Dec  4 07:55 volatile

So I do some research, fix this issue and do some other changes accordingly. Please
help to review this patch, thanks.

Targets:
1. Support persistent tmp,  For persistent tmp, only /var/tmp is persistent, /tmp is tmpfs, 
   For volatile tmp, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp 
2. make systemd and SysVinit have the same directory structure. 

Currently, systemd and SysVinit have different directory structure, the difference focus on how to handle /tmp.  

when volatile is enabled, for sysVinit, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp
refer [4][5]. but for systemd, /tmp is a directory, it is mounted by systemd as tmpfs. /var/tmp 
linked to /var/volatile/tmp.  And for systemd, refer [6], set different age for /tmp and /var/tmp.

Since volatile disabled not works, ignore the difference when volatile is disabled.

With this patch, VOLATILE_TMP_DIR will behavior like this:
For both sysvinit and systemd:
1. VOLATILE_TMP_DIR=&quot;yes&quot;:
/tmp link to /var/tmp,  /var/tmp link to /var/volatile/log,  /var/volatile is mounted as tmpfs
In this case, for systemd, /tmp and /var/tmp will set to the same age, 10d.

Compare to current behavior, there are 2 changes:
   1) for systemd,  /tmp changed from a directy to a symlink to /var/tmp
   2) age of /tmp and /var/tmp will be same

2. VOLATILE_TMP_DIR=&quot;no&quot;:
/tmp is a directory mounted as tmpfs, /var/tmp is a directory on persistent fs, and keep the age as [6]

Change like this in order to meet [1][2], also maybe [3] for systemd.

Compare to current behavior, there is one change:
   1) for sysVinit, /tmp changed from a symlink to a directory

[1] <a class="moz-txt-link-freetext" href="https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s18.html">https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s18.html</a>
[2] <a class="moz-txt-link-freetext" href="https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html">https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html</a>
[3] <a class="moz-txt-link-freetext" href="https://systemd.io/TEMPORARY_DIRECTORIES/">https://systemd.io/TEMPORARY_DIRECTORIES/</a>
[4] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded/tree/docs/usermanual/chapters/recipes.xml#n3535">https://git.openembedded.org/openembedded/tree/docs/usermanual/chapters/recipes.xml#n3535</a>
[5] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=12c4acd7ac5a27cf3676065b60f1c8395c96854c">https://git.openembedded.org/openembedded-core/commit/?id=12c4acd7ac5a27cf3676065b60f1c8395c96854c</a>
[6] <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/blob/main/tmpfiles.d/tmp.conf">https://github.com/systemd/systemd/blob/main/tmpfiles.d/tmp.conf</a>
[7] <a class="moz-txt-link-freetext" href="https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.html">https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.html</a>


Test Result of following cases:
1.  
SysVinit 
VOLATILE_TMP_DIR=&quot;yes&quot;
VOLATILE_LOG_DIR=&quot;yes&quot;

root@qemux86-64:~# ls -al /tmp
lrwxrwxrwx    1 root     root             8 Dec  8 08:51 /tmp -&gt; /var/tmp
root@qemux86-64:~# ls -al /var/log 
lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/log -&gt; /var/volatile/log
root@qemux86-64:~# ls -al /var/tmp
lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/tmp -&gt; /var/volatile/tmp
root@qemux86-64:~# mount | grep volatile
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:~# 

2. 
SysVinit 
VOLATILE_TMP_DIR=&quot;no&quot;
VOLATILE_LOG_DIR=&quot;no&quot;

root@qemux86-64:/# ls -al
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 .
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   13 root     root          2960 Dec  8 09:24 dev
drwxr-xr-x   20 root     root          1024 Dec  8 09:24 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
drwx------    2 root     root         12288 Dec  8 09:22 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  161 root     root             0 Dec  8 09:24 proc
drwxr-xr-x    4 root     root           240 Dec  8 09:24 run
drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
dr-xr-xr-x   12 root     root             0 Dec  8 09:24 sys
drwxrwxrwt    2 root     root            40 Dec  8 09:24 tmp
drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
drwxr-xr-x   10 root     root          1024 Dec  8 09:24 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x   10 root     root          1024 Dec  8 09:24 .
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root             9 Dec  8 09:24 lock -&gt; /run/lock
drwxr-xr-x    2 root     root          1024 Dec  8 09:24 log
lrwxrwxrwx    1 root     root             4 Dec  8 09:24 run -&gt; /run
drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    2 root     root          1024 Mar  9  2018 tmp
drwxrwxrwt    4 root     root            80 Dec  8 09:24 volatile
root@qemux86-64:/var# mount | grep tmpfs
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
root@qemux86-64:/var# 


3. 
systemd
VOLATILE_TMP_DIR=&quot;yes&quot;
VOLATILE_LOG_DIR=&quot;yes&quot;

root@qemux86-64:/# ls -al /tmp
lrwxrwxrwx    1 root     root             8 Dec  8 08:49 /tmp -&gt; /var/tmp
           8 Dec  8 08:49 /tmp -&gt; /var/tmp
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al tmp
lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -&gt; volatile/tmp
root@qemux86-64:/var# ls -al log
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -&gt; volatile/log
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012160k,nr_inodes=253040,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

4.
systemd
VOLATILE_TMP_DIR=&quot;no&quot;
VOLATILE_LOG_DIR=&quot;no&quot;

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -&gt; usr/bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   14 root     root          3260 Dec  8 09:16 dev
drwxr-xr-x   21 root     root          3072 Dec  8 09:16 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -&gt; usr/lib
drwx------    2 root     root         12288 Dec  8 09:16 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  173 root     root             0 Dec  8 09:16 proc
drwx------    3 root     root          1024 Dec  8 09:16 root
drwxr-xr-x   11 root     root           320 Dec  8 09:16 run
lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -&gt; usr/sbin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
dr-xr-xr-x   12 root     root             0 Dec  8 09:16 sys
drwxrwxrwt    9 root     root           180 Dec  8 09:16 tmp
drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
drwxr-xr-x   10 root     root          1024 Dec  8 09:16 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x   10 root     root          1024 Dec  8 09:16 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
-rw-r--r--    1 root     root           208 Mar  9  2018 .updated
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    4 root     root          1024 Dec  8 09:16 cache
drwxr-xr-x    6 root     root          1024 Dec  8 09:16 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -&gt; ../run/lock
drwxr-xr-x    4 root     root          1024 Dec  8 09:16 log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -&gt; ../run
drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    5 root     root          1024 Dec  8 09:16 tmp
drwxrwxrwt    2 root     root            40 Dec  8 09:16 volatile
root@qemux86-64:/var# mount | grep tmpfs
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

5. 
SysVinit
VOLATILE_TMP_DIR=&quot;yes&quot;
VOLATILE_LOG_DIR=&quot;no&quot;

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   13 root     root          2960 Dec  8 09:40 dev
drwxr-xr-x   20 root     root          1024 Dec  8 09:40 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
drwx------    2 root     root         12288 Dec  8 09:40 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  159 root     root             0 Dec  8 09:40 proc
drwxr-xr-x    4 root     root           240 Dec  8 09:40 run
drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
dr-xr-xr-x   12 root     root             0 Dec  8 09:40 sys
lrwxrwxrwx    1 root     root             8 Dec  8 09:40 tmp -&gt; /var/tmp
drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
drwxr-xr-x    9 root     root          1024 Dec  8 09:40 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al 
drwxr-xr-x    9 root     root          1024 Dec  8 09:40 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root             9 Dec  8 09:40 lock -&gt; /run/lock
drwxr-xr-x    2 root     root          1024 Dec  8 09:40 log
lrwxrwxrwx    1 root     root             4 Dec  8 09:40 run -&gt; /run
drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
lrwxrwxrwx    1 root     root            17 Dec  8 09:40 tmp -&gt; /var/volatile/tmp
drwxrwxrwt    3 root     root            60 Dec  8 09:40 volatile
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 


6. 
systemd
VOLATILE_TMP_DIR=&quot;no&quot;
VOLATILE_LOG_DIR=&quot;yes&quot;

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -&gt; usr/bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   14 root     root          3260 Dec  8 09:46 dev
drwxr-xr-x   21 root     root          3072 Dec  8 09:46 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -&gt; usr/lib
drwx------    2 root     root         12288 Dec  8 09:44 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  173 root     root             0 Dec  8 09:46 proc
drwx------    3 root     root          1024 Dec  8 09:46 root
drwxr-xr-x   11 root     root           320 Dec  8 09:46 run
lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -&gt; usr/sbin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
dr-xr-xr-x   12 root     root             0 Dec  8 09:46 sys
drwxrwxrwt    9 root     root           180 Dec  8 09:46 tmp
drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
drwxr-xr-x    9 root     root          1024 Dec  8 09:46 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x    9 root     root          1024 Dec  8 09:46 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
-rw-r--r--    1 root     root           208 Mar  9  2018 .updated
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    4 root     root          1024 Dec  8 09:46 cache
drwxr-xr-x    6 root     root          1024 Dec  8 09:46 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -&gt; ../run/lock
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -&gt; volatile/log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -&gt; ../run
drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    5 root     root          1024 Dec  8 09:46 tmp
drwxrwxrwt    3 root     root            60 Dec  8 09:46 volatile
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

Changqing Li (5):
  bitbake.conf: set correct FILESYSTEM_PERMS_TABLES
  base-files: update dirs1777 and volatiles according to
    VOLATILE_TMP_DIR
  initscripts: support persistent tmp
  systemd: support persistent tmp
  eudev: create dir /tmp if persistent tmp is used

 meta/conf/bitbake.conf                        |  5 ++-
 ...fs-perms.txt =&gt; fs-perms-volatile-log.txt} | 32 -------------------
 ...tent-log.txt =&gt; fs-perms-volatile-tmp.txt} | 27 ----------------
 meta/files/fs-perms.txt                       |  3 --
 .../base-files/base-files_3.0.14.bb           |  8 +++--
 .../initscripts/initscripts-1.0/volatiles     |  1 +
 .../initscripts/initscripts_1.0.bb            | 12 ++++---
 .../systemd/systemd/00-create-volatile.conf   |  3 +-
 meta/recipes-core/systemd/systemd_254.4.bb    | 23 +++++++++----
 meta/recipes-core/udev/eudev_3.2.14.bb        |  4 +++
 10 files changed, 40 insertions(+), 78 deletions(-)
 copy meta/files/{fs-perms.txt =&gt; fs-perms-volatile-log.txt} (53%)
 rename meta/files/{fs-perms-persistent-log.txt =&gt; fs-perms-volatile-tmp.txt} (59%)

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#192130): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/192130">https://lists.openembedded.org/g/openembedded-core/message/192130</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/103100474/3616873">https://lists.openembedded.org/mt/103100474/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------v1mibDi8yPxQhQAN25IB1RE4--

