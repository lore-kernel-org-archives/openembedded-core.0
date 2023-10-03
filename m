Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336D2E75421
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 04:53:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.101713.1696308822804658359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 21:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VOn2dv53;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86407c84d8=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3934jEWK031982
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Oct 2023 21:53:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=rXx92WhoDYkb6CuDTCCDdeb8yG+Xeg/QMW9VIfJRXp4=; b=
	VOn2dv53vD8aTQDQmNVJ2wDohU4w0IMKpupWs2yhdJdxmmZ+nD4JV2PXWZsU/ox8
	3yRHOKI58YKFzXkxk7Ogn4gCkvvCSDRERAKEI4+JswDOIStoihIWvuLhD09WyJ4i
	pY3iegelalwo6ugObcB3hEXDdPUOmUXhyD4YezBjxoT6Puxq3TN+fmNFVlI+/OPf
	3icPKgN4OmSMb6oc81zoiez0BtvYk7bmS/KZS+1urHhwdXdibyRoqIE8u9duCiAf
	/Gz3TGg/LiKG0Xw3q801qOl5opcjwgtKb1j0Vv7yiqV/tDHNNbVv/4y+FW2bwlrP
	inTVOi+1pXFy8FOAGmDstw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0javn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 21:53:41 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3934rfia009799;
	Mon, 2 Oct 2023 21:53:41 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0javm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 21:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBEEoHZHDgRsAr6vytwQnK+oINNCN8jhYX2wG48Az+hk4r7X0qXhLZ6Vr6nObOKO9RKvdzbLugjs7EpdUO+1n0UEOD2c/MtAivROO+n2sqXl2kRI+CwizAj3AQkEoQjCm0AWDbb6BwKjpVnmJSuYhQUeTktvLM1muiPmo54hUTHok27Q/OiHDQrHcpCy3Mb5AtjDH81IR9lVCbs5gKCDLw42bUTbVx240bfV7LwAyoIlCa5/865GMXonWdN7ZljGT7JS7HgXg24QjnsIt+rKPFZPLng7x9ZCLK5V6qqXgUHqzOtR3Xc0n4cnEiK0GXKZ+F1foS5XHNIEqFrHzdkocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXx92WhoDYkb6CuDTCCDdeb8yG+Xeg/QMW9VIfJRXp4=;
 b=cEq7MvHj6OPB8kjE2h2l9pNNqBYyM3cAiUUOw2ofFBZhKQt6FGCcSC+auP2OSqXOtZJtm+XSZvXGvkwHt70stoS9zdAyVmIKD33TLrdi+zwI+0Z3Rg8tpdJWlWRE2evIwY0G36fktanNk1DZC7Y9pD0bKABvVSbdE36/GWlbTMDeg8Js5WwUs5GYU24dEn3Wwo7v7a3YIMMhhS7RIIJjWo8kYnn2PFF0DXVaFy7o31O6SUFK02TL+kwKzZ/2rjGa2nQIdbGMmG2WREcE+C7NjsheIlBlyrRkmoQ3O5kWIlpwosk8dABMjB0B0xg5PWv6D3/VY6Mlg404XilX9EtEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 04:53:38 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3%4]) with mapi id 15.20.6813.017; Tue, 3 Oct 2023
 04:53:37 +0000
Message-ID: <a4b14149-8f60-f9cf-ae1f-0d4708acad98@windriver.com>
Date: Tue, 3 Oct 2023 10:20:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-jinja2: fix for the ptest
 result format
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230929082419.3767306-1-narpat.mali@windriver.com>
 <CAOSpxdaUj7LKkPi51=ziCcyArmSLOg70snjFJm5Bk5qrz0gkWA@mail.gmail.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <CAOSpxdaUj7LKkPi51=ziCcyArmSLOg70snjFJm5Bk5qrz0gkWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|SN7PR11MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 2396354c-9f2c-449b-a0f3-08dbc3ccb49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gbb1FzdT440Dq2f7LCANRITTkQREKISbZrfB2zqyZSTthCY7FVUw6NRvIM1XJSUcPe4HH1vXwuCO/RTHTfpbZrQbcw1QXwh2DnHSyZOHhYmQwjkU2LA533W7skIjmJ9QYbJ/xVVGAT/xugQy1SSvyxEdjWVWNzm9F/0pmjXRZ5INLTkQWa1089G0so6PitAP979eiRx6w0dHkowzPgKiKw4pgQyZ33JO2eRU79rdfuFE/+y0k8ty+YwOMmDumPz9EKpXKterc/WmPY2W8H/aTiUzwzHfR5ASMtVdSYrEyYfU2vkKhsJj2y1mTkoee8A6mbWTMdsWYSbf2CaOg7B4HcmMZcBq/BQ0+mhzo2cVAmSEb04X8LzJmQQmFE8L8ZlsixkEunBlQJ5vyFCC8BbOupJN3I0kPmhkWHLdlZaBNZ9bvM+8tUfxR/BV6Mo6/FE+zcyAjbJiLXj7lV+8vv7c5xR+Whsl9oQYEuo7mOeymCjsiiMla1co8HR1NpAjT97iJ6vNPXzPv0pF7tRmiiAK0ZF+UE5m7Xii1a8uyPps+HWU9qMmOjOa9XNoJwwjYgzmsG3rYa+w6WeBAq1AcyeLTDjwLhZhQaYmjWIYif0plav7huANIRQkK7KiFdsNYDP9lG5SrjX7AW7aDyNr3gd3Zw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39850400004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(5660300002)(66899024)(6486002)(6506007)(55236004)(53546011)(86362001)(31696002)(8676002)(83380400001)(4326008)(31686004)(8936002)(966005)(41300700001)(38100700002)(66946007)(478600001)(6512007)(66476007)(66556008)(36756003)(26005)(2616005)(6916009)(6666004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzZ5L09ldExzK01BQ2YrOG53TDZRVUoyYW5iS1hwcHNKQjJpWHR3VHJOd0VF?=
 =?utf-8?B?MC9Bd1RCSmVEZ1UrK2QzY1l2MUVYTzJRcUVWSUV6ZUE1QnZEbzVVWERrY29E?=
 =?utf-8?B?VHlOTUR6cFk2VmpoVjJTUHhDYjJqRkhsalR3bjlXZ1BqYktNOWtsdmF2Q0sw?=
 =?utf-8?B?cXJ6Y0JDSk1Za2F4L1paT1EzYmJqQi9ySHJLdFZsMGFLNXBPU3ByN2huVjg1?=
 =?utf-8?B?bmdTeGhDYjVaUjIwdVlkdDZ0UlQzYnUrTlppdmQxdlRnMzhScTZGRUFOYmpL?=
 =?utf-8?B?Z3hFV0tyRUFCdnhGS0VqK21Tb2l4b3dGTEp4ZXlUWGRuZDJqQkZYT2NDRXR2?=
 =?utf-8?B?OGdMSjErMmZsQjBqdHBkbWV2TndETDMvb05ZR24rZ2N1V2RZUmFTYWJzSlMx?=
 =?utf-8?B?VVpRN01DTWNVVWlURzQvUHMrbFZPQ0NCS2NsVGJQRWw5WHgzTnFpRE0wQVVR?=
 =?utf-8?B?OStaTmhiLzRGQ1hIQnFaWElPSEs1cThveTYxYnFnakhYZy9uUlpKWTU4YXUv?=
 =?utf-8?B?NG9OMUdhMlVVcE1lSGQ4WnNSd241eGQ1a1pCTzVYQXYyWlVoZlY1ZU1TUngr?=
 =?utf-8?B?eUd1YUdCbGd0RW9pMm1iNy9leFRtTWU3VythZXNJL0VQMVBZazd4VDNaM2dU?=
 =?utf-8?B?a1cvd3NteUp2bHk3OTVZSUgvUWNjQkNGSTdTYisxamRtNHpFWHJBT2crNUZn?=
 =?utf-8?B?R1BuOWxSdkpvMmxNTjJobENuWHJyNE5pUHliSUpnTmpwWEI4Y0RYYlFGd2My?=
 =?utf-8?B?K2UrREpaSUpDQUJvWi8xZnIzeVR1Q3ovTHpuV3FIOVA3WG90TUQ2aGZtbUxQ?=
 =?utf-8?B?cVZROFJGcys2Y3hhbGhaVm5UL3hoMzNWajdyaWlUV0U2and5VEhQVEhwR3px?=
 =?utf-8?B?dEtnbWhVSTM4VmN2ZnByVWdUQVc1V3BKSFpQTnNGdDY0cVErL1RtRUxramNX?=
 =?utf-8?B?RFV4TTNKR1d0RVNwMUdaSElSRmlyMURaUld1cDhKQkc1cGVpYXJOSldVTzRN?=
 =?utf-8?B?dzUyUFhJUUdmSzNTR0NyYWs1eDNqTWl2N1ZXZVE4cS9GaXZNV1BXZ0I3bDBM?=
 =?utf-8?B?WXdoZ3FNdjk4bnorM2t4MnJUbDNVaGNoU0J0aVFIcW1oNFlEc0h2VkdWZXNt?=
 =?utf-8?B?VU42RHhQQzUxYnQ3MWtKNjE1bnJDNkFoZWFTZklxeE9yQ1Y0RFF2Zmd5UW5B?=
 =?utf-8?B?dW1wTDdKYXovaFVZeFhUY3JWYXFRUVJ5ZFB3UndLZ1RreFo5TkFKMlVTUW1x?=
 =?utf-8?B?SlZ5QjNmQWRpeUNwYlQ1NmgveFAweGtzanQzNy9lYTRDS3BBWThuSWVwMWVa?=
 =?utf-8?B?R3JBUHppWlV2UjZNQ0tKSDhTaWVoUXpXWEdGeFp5S3JQUDdTTTRxOHJtMnZj?=
 =?utf-8?B?dHUxbXYraUkwWXprVERZY0xOYkVSM2dDUERDVWwwU01tbzI1ZjB3Ylk0UzVQ?=
 =?utf-8?B?TEsybXF4SDFDLzd5NXB5Z0hwUXlEYitzM0xNT3NXa3paNkpMWS85U3hPODd5?=
 =?utf-8?B?Q0VRWGQ1VGFWNVEvTmVFSzZ6VXFWTnoxenA3TThIZjhoM1V1NFBQc20xZ0Jj?=
 =?utf-8?B?ZzByUXN6RmVaMHBuSXlMWmFhZFRNUkNkcFh3alZVbW85TVlCNTVJUDV6WkNU?=
 =?utf-8?B?bnZpWGZSL3NEeTVhZ3pDaS9VMU91T1ZkZll6U29aSjc3YWs4dDIyc3BIb3gr?=
 =?utf-8?B?VFp6djdsQUlOMFV6N1RTaks4dE4vTEoyY1UxUkhvaTUrT1VkRUNlS1RtN2py?=
 =?utf-8?B?V0ppNHRscnZoTGtuTUZSVEVvWjl0SGNlSlprZ29XcXJ0Wk9SN0FUeDJKVjRk?=
 =?utf-8?B?MU91MFdTRGVLbDBSVHdnd2krajJGTmtuZEZXY0tLRXdadXVaZnpxVjgrdlA4?=
 =?utf-8?B?UDVuWCt4cFNjRGpqN3NlYjJPUDVDOEVubFZhVlZxSjIvbVZBVXViT3ZpMy9y?=
 =?utf-8?B?akZyOHVMQkF6UU5LVlVqOEFSaUVCMG1ySk5IaGFwdW5QTno1NWRRcER1czhO?=
 =?utf-8?B?TDNmYXo5RVpsdGtNTXIxUE1xRFRFbTJLU3htaW9yRFRRWDdhR3cxeEJmM2pr?=
 =?utf-8?B?QnRSNXM0K2VadFUxTGY5MjJvdG9KeHBTY0FkNkdLWEtuTnNiSDJzNk9oeDBV?=
 =?utf-8?B?ODZYem5MV0pZNlMrVUZhZXJaVTRENDRQYVRZU25MdTAxb3IrT1RTTnU5UURR?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2396354c-9f2c-449b-a0f3-08dbc3ccb49b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 04:53:37.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3FdpSYSe+E5vwdnSxMlNaD8GBjEz2ikHmUkr8iKVWlGiVYhVpZOkvjkzN8Iu9jcFgWnfpC5Pkzp9Hq0F3Q7eSY9zDT9iBfrZaeJ88Jig34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
X-Proofpoint-GUID: EJ3giYXJwDeOkx9YoIAT0_Ifhlfr5kKZ
X-Proofpoint-ORIG-GUID: qHsGMfgL3opHQ9KkSZ91asfhiUgOrAPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_02,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310030038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3934jEWK031982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 04:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188621

On 02-10-2023 20:04, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Sep 28, 2023 at 10:24=E2=80=AFPM Narpat Mali via
> lists.openembedded.org
> <narpat.mali=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> The output of python3-jinja2 ptest should follow a unified format as b=
elow
>> result: testname
>>
>> Reference:
>> https://wiki.yoctoproject.org/wiki/Ptest
> Is this also an issue with the version in the master branch?
>
> If so, please submit a patch for master branch too.  We don't want to
> fix this in a stable branch without also fixing it in master.

Hi Steve,

In master branch, it has been already fixed using=20
"python3-unittest-automake-output" instead of sed to reformat the output.

https://git.openembedded.org/openembedded-core/commit/?id=3Ddef25193748fa=
c40c4120e9a6e8861ae4c7ae760

../Narpat

>
> Thanks!
>
> Steve
>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/m=
eta/recipes-devtools/python/python3-jinja2/run-ptest
>> index 5cec711696..3004024619 100644
>> --- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
>> +++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
>> @@ -1,3 +1,3 @@
>>   #!/bin/sh
>>
>> -pytest
>> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]=
//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPP=
ED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKI=
P" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s : %s\n", $NF, $0}e=
lse{print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"S=
KIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{pri=
nt}}'
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188394): https://lists.openembedded.org/g/openembe=
dded-core/message/188394
>> Mute This Topic: https://lists.openembedded.org/mt/101653794/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

