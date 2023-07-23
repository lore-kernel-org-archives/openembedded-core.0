Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DADFC001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 14:39:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26780.1690123171371242343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 07:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L9Rf/YXp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6568f342e5=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36NEahl5022688
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 14:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=p4PSwl2eKW0tmCtZYaSjq0FJAUBWyfaJGznpzasgPWo=; b=
	L9Rf/YXpMSMgRtQ11o/rZ1QfUtxePDLC8zADCHmbNLrAy8yOFx4LAnpvTYrQXdo3
	Xa7z/Pqxs5T+31KF6zIfskgNp0kTeXFFNOQlThEqYDE9H7EnZrxunqwdeFF6qIzo
	IqLvWZYsaJRKz8AvB1MXwI9EjmbiZaw+8TdeNsgdgrq28qLsklQDKbA/4WqbiLCf
	FRbVImWgQCjaEe0DKV19whBzw8vjAf0i/ZWBIFT1pIhgPs1LVEIno6pYNxOEVt6S
	mtQnsZVd97aG7NKgo9UBFDvCm12vqptQEs5jz5CYwjEQq6YGtwtGnyTrU06AQvmW
	ccYsPK4UUjjaUeQR0Qa3AQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s04ax0xa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 14:39:30 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36NEdTVG025875;
	Sun, 23 Jul 2023 14:39:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s04ax0xa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jul 2023 14:39:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNp6snBqapuTo6mNTvZJ4cnM5ZvuFhYJTFwGFGiPVld8YXbRTCK/AxHySgWX4GLA25dnRKxpd6j9PzRwVjNDTVSazzQxaAlMRGIPt+/HunJMRznssOLHoASGyHiF3Hd2TxqQ6MQ4SO2036nzqMk5pI17KBOjbcsKr6JGdWuqkJRa/SmL3g03YbtW7BQwNvxRZWiqnxbEFU/bOSOtfwnOYctCRMmHn1oKMCFC+I7mnTW+82nKnGtVKj8lXiTcLoJS5cXiT1b77zO91DS0lPx/fL8QhSibBBBc/pUypTMvtmHXJqjeg/He3WH4ZaJWFEAPN52Xz7NguBZKD8E72FeqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PSwl2eKW0tmCtZYaSjq0FJAUBWyfaJGznpzasgPWo=;
 b=PtxpOcQc+XOH31kNpsP+TSmB2Th+1gZEA3G/LXkzXD9uhHJHdaSoSL6NT4w6VD+aU3iLom4oIkTrqh2aRJwHqh2p4XQG5CNYg3fi0NRTIGiIWQHSEnvkFR6YezeSl6WtPlsN6cF8H5zwoFclzpZCAA9KV0cjJI2SUX5KeQ59lnnlb14POIYYaLbhmCf0YnnKQZz87nLs3ftHlIZ/qTdGCtAn3Gt+0Nl2l8D3bvS+nkjH/jnlDK67//AOTqXANLukBEF97dCqb2f83mAUjChHswZcGUxAyGLj4Zt8Md0O/ncxHXWL497FFEnDBERs5pu0OyfJQDxyWeltWgSAikGjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 14:39:25 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99%7]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 14:39:24 +0000
Message-ID: <30594c28-4885-22a0-3bc8-dd6a439ad783@windriver.com>
Date: Sun, 23 Jul 2023 17:39:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] mdadm: add util-linux-blockdev ptest dependency
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230721105827.1637688-1-ovidiu.panait@windriver.com>
 <CANNYZj_a-+9MdidiWv0bRtQZWuyDebJmWGBSbyikfpkbsFeoYA@mail.gmail.com>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <CANNYZj_a-+9MdidiWv0bRtQZWuyDebJmWGBSbyikfpkbsFeoYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0051.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::40) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|IA1PR11MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: ef12cc1f-78a2-4dc0-2e72-08db8b8a9beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3KvSQvsQgcUbMeXqoTQVypXm1hdbZMviD0RP3lgV6acmUqHH3b8e/j/262nhiKuLLTtv6FsGx6UwujA57ZmtcI57CdrSxZBvkEdhq2YE7gCxJojEF9s1eG64ZvATCufQow6KxkvJ8KzSB/4+skrwgFDINTpPHWoAo2KX+oedtiBm7X12HBQ0N62xKfapUb+W5o7VHMwxeIld1SsCvufIyO7MqxF39e9iwMpiHASdeb7eotY+x4jNGHXc4ksx65+4+4DWBf0GkVoFY3OsYq/NVkIhM138XWugKgKDWVFp0QsOklTqqXIBpURde9gXL3B80pxuoxpkh+T+HjZgYSxQHORH9yhAfbDC/ENTdkKnqROgly+tUp15Y7s/E5mpay4xPVfxg6yToVUt7wZwpLcJLwqX17i3RITQltT9jIQbFeBCQ6aFIAl66HReWai3OK1Y1LiR5eSRAnOT0b2kOvDmEkroNB4zNSK5KVFjNFm4ArQxgx9VpdMyMsIGst95ywe2P2yqu7BBlu/Yc4zxC+70Bel9cK4n9ruX2KYuVQ3lkhA+v3byyDiE2MQuVgazebXkrCKK/XsnBoyXeuu2tNd67XFqZFAtXZTQ3GEApkQQzLT5dm6ORTMTi8EtgAaBVdbhrpjJcLk8oHSRa0ENs0D1IMoK4hDsSds408GVqX4bHfKnTZUG3rQjH3DKBj/BHqCX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(451199021)(31686004)(86362001)(31696002)(66899021)(38100700002)(66556008)(66476007)(316002)(478600001)(41300700001)(4326008)(66946007)(5660300002)(44832011)(8676002)(8936002)(966005)(6486002)(6512007)(6666004)(2906002)(186003)(6506007)(6916009)(83380400001)(53546011)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDU2cXFyV1FXMnlqSnlhSU5SNlQvTHhmRjE1T2h0Y0w2bjczMkdLSzdSc25U?=
 =?utf-8?B?ZkR3UjAyRnhFUDAya2xXakhnaHNzMVBicGxKRmNuUlRPYURLS2NlalFKWmc5?=
 =?utf-8?B?NnlzUitQdi82K1NMZ0dxR09ic2FVam5KTzlRTzdtNlV4bFlFWXhuWVIzVXMy?=
 =?utf-8?B?NGs4eUlZeFE2K21BRWppV0c3REZLeFVrd1F3SDk3UlZaOStMaU9EYndjVGM4?=
 =?utf-8?B?RXdkSEhYV0dCOGs1WjQ5ODJHNTBOdXlMa1dVWTIzc3paVjNaa0tIRjdNVVNz?=
 =?utf-8?B?aXpLcmNZNHdEci9ucFI2YjBGQURGanNoNlp3TGhYSHQwZEV6dGJLSm1Cckgx?=
 =?utf-8?B?WmRNWGJtNGMvYWlxaHRhelNvMEswaFRrMEdVTDJON0hJSnVGQVE3cldUb2w1?=
 =?utf-8?B?UEpKUEY3V3BycTFGZmJsZGlZRmdoa2pnSEwzWVA5SUxUUzBORm00T0hGeVlC?=
 =?utf-8?B?ZHpTenZGVDJvbTFWS1lyVG1MZ2ZGS29BeWFhZE9pMjFKcm9MK0NaNTJxM2JN?=
 =?utf-8?B?UHVmU1dJZHJMNkt2MFRueHFTbWNsSHZSYTZ0d1JNTHRtbXpQRFRBc2JidDRK?=
 =?utf-8?B?eTJ5MEcrU3oxdkpjUWxrMTlkbFFTajJrdE9hRnhqdU5mdnJSaldVZkRPYXl1?=
 =?utf-8?B?SnhUU0RWVnVoaWN0YWRaaVhHaUlzMjBMRWlPckRMQ1UzdTJBNzltTXhIa1FT?=
 =?utf-8?B?YXpTUnZVUVNGSm5WdDNhM3JaWkNmZ2Q4NWM1NURqcURTL1RRdkNIWTRRbXlw?=
 =?utf-8?B?QXBOUVFORjEzK3VPWGJObUdRRWpHWHFwM1dGUi9QOE5ubnFYQUxDNW9ZSWZj?=
 =?utf-8?B?Nnc1RmhyM29EWnUvSlVTZlpPeTlYMnhmK2RiVFRXTThoS3lWcy9nRTNlOHAw?=
 =?utf-8?B?akZTOGlMVHFDQTlpQkpvUWNuZ205WW5kUkQrRjRtNmNuQzdvTmhOeVFxK25J?=
 =?utf-8?B?eUVXbHBncFJualM5ZUJQRThtU1dTZ1FzREZNbHI3NzlvWmN6bUxESW44Wm9D?=
 =?utf-8?B?cWpGT3BtaXkzbEgyN0t6bG1IV3VXMDdLTDh0Zk1EdVBjS1VNQTE3WTB2UUxC?=
 =?utf-8?B?c29Wakk4bXZ2eHlGOFc4N243VlRWaDM3ZkhSbWRjSVk4Y2VEbzFYMXk2aDEv?=
 =?utf-8?B?T0tKMmw0bm9oRlRtVGZIcS93VEpaTnZjRlZ6am43bXdBZXJwRVFwemJ0aGVt?=
 =?utf-8?B?QjFmcWZJQjFyYXpEVERUZVRSbGRyZkZ2Wk1FVVJvU0VKb2RoNWdybnd4THZy?=
 =?utf-8?B?WVJ1ZklyUEtNSUlkNnh0Wk5pbU44QVhTSWd4RkREaklIRkVlQ2xYR2xYT3Bv?=
 =?utf-8?B?c01jaEoxbkRYVUZyWlgraWlwWHpZMEJIVVNtTWpUd05LaFpXdDBrRDA4NlRj?=
 =?utf-8?B?R2tQZ1VRVmJpbmtpUUovNUlPR2ZKSWlxdm92WUtYVUVHODlpb2I1Q1I5ZlNE?=
 =?utf-8?B?L1kyQnFnaW1hNTJyUW9Zb0orNDBFeG5keTNFQzBLbXp4SjVRdlM3N2E5RElG?=
 =?utf-8?B?QUxyUytQdkdLV0d0TDc0TmlzeWNHWWRIZ3pnNXhBM0VwSEhLYzMwd2JUbEVQ?=
 =?utf-8?B?L3M0YU5CTjlETmZtdXJLNlBpLzBvZ3NWbS9idWV4SEtwY3hvNTgzcG5FOGpP?=
 =?utf-8?B?Rk1MSVprOFZGdHdzWmFwcWJ4OHFrNVZ1eW0wK2YwUU0raXlTMkl0NjhvYStD?=
 =?utf-8?B?emVBT25oNW1IUDJRdkYxdURnZ251cG0wdEhjNE5xRnVaaSs4c1RGMFZBWGd4?=
 =?utf-8?B?UVRGdVluZm9CaHRRVUdCcUNLMnpJMUZRUFB4Q1JIVngyeVhwb3FBZTNrRko2?=
 =?utf-8?B?SVVSS3h4R242blVvbHpzQ3A5YUVoOUxJQmQ5WGx5UVk5a0NKUXN5TVdUSGF4?=
 =?utf-8?B?c0RESkVkK1QyVjFaY0F2Q0ZOTzJCSytMa1VLQVhaOTlJZURqeXNmM3VHaDdX?=
 =?utf-8?B?cGgvUE9wVEZPWE1yZGg2TDB2UVZDdll0U3FvN0lJSkJ5T0MyZFdMeU1hQVFE?=
 =?utf-8?B?T3IzSjRNVzJRNE5hZFlCTDg2b0pHWGUveWtBTDc5ejBROHRmaHRBRElhZHZ5?=
 =?utf-8?B?Q1JIM1BjWHZXTXN4b1NHcURQbDdFenpYTG9SKzZMb2o5dDFrU3BhaGx4R1dq?=
 =?utf-8?B?enhudnd6NHZodHFQVktuWkdaVFltUzIvcG53VzBDVEJLbU1TRmh4KzAvUGF3?=
 =?utf-8?B?SXZ2djJRYVV3SnFIWWNGckJIaWgreW1mNTdEaUxIYXlKbzh2bEJvaVNBMTg0?=
 =?utf-8?B?RHFWOVpIQm1qQ096TXI4ZEsrcmRRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef12cc1f-78a2-4dc0-2e72-08db8b8a9beb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2023 14:39:24.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NW4hKJjRCr0OcaszZV9i9HtCAum/YAgwTxSgs49vxtDbxoz5JQfYXyuMpGQqEmJVaOShtFjxGfVg/eCsTHhrrzahdLO/wkJvjXWBbbIFhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
X-Proofpoint-GUID: 1lcIdVsszC4iJLsPaUSTQKe7dkTeOk9l
X-Proofpoint-ORIG-GUID: HESk8Vhi5jxOfn6SY32Lj_HTQQm21WR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-23_04,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307230136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 14:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184755


On 7/23/23 15:08, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Can you please check why the test doesn't fail with the dependency absent?
The testcase fails intermittently:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15159

But it is not clear if it's related to the missing blockdev dependency, 
as I was unable to reproduce the failure manually and we can't get the 
logs from the autobuilder.

blockdev not being available doesn't make the testcase fail directly, 
but it affects some calculations, so I think it should be added as a 
dependency:
...
+++ /sbin/blockdev --getsize /dev/md0
/usr/lib/mdadm/ptest/tests/func.sh: line 334: /sbin/blockdev: No such 
file or directory
++ '[' -eq 0 ']'
/usr/lib/mdadm/ptest/tests/func.sh: line 334: [: -eq: unary operator 
expected
+++ /sbin/blockdev --getsize /dev/md0
/usr/lib/mdadm/ptest/tests/func.sh: line 335: /sbin/blockdev: No such 
file or directory
++ _sz=
++ '[' 119808 -lt -o 95846 -gt ']'
/usr/lib/mdadm/ptest/tests/func.sh: line 336: [: -o: integer expression 
expected

Ovidiu
> Alex
>
> On Fri, 21 Jul 2023 at 12:58, Ovidiu Panait via lists.openembedded.org
> <ovidiu.panait=windriver.com@lists.openembedded.org> wrote:
>> From: Ovidiu Panait <ovidiu.panait@windriver.com>
>>
>> 07revert-inplace test logs contain the following:
>> func.sh: line 335: /sbin/blockdev: No such file or directory
>>
>> Add the missing util-linux-blockdev dependency.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   meta/recipes-extended/mdadm/mdadm_4.2.bb | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> index 50d9548747..fa50325f1f 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> @@ -107,7 +107,14 @@ do_install_ptest() {
>>   }
>>
>>   RDEPENDS:${PN} += "bash"
>> -RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
>> +RDEPENDS:${PN}-ptest += " \
>> +    bash \
>> +    e2fsprogs-mke2fs \
>> +    util-linux-lsblk \
>> +    util-linux-losetup \
>> +    util-linux-blockdev \
>> +    strace \
>> +"
>>   RRECOMMENDS:${PN}-ptest += " \
>>       coreutils \
>>       kernel-module-loop \
>> --
>> 2.39.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184682): https://lists.openembedded.org/g/openembedded-core/message/184682
>> Mute This Topic: https://lists.openembedded.org/mt/100274537/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

