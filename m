Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD831C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 16:49:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42115.1707065380972264301
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 08:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ivi2Hkf3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27642a48d3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 414GVTgk032583
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 08:49:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=pTWDqTWsG6sZqsPdNdq
	j8Sfm3zSkzZ6WB8VwiMdo9og=; b=Ivi2Hkf3r7nZyBBkKZgDGa12znStoVhNe6W
	CkmyoXVLJKwE4FwWVlqOWmrnIF48QxcPGRHw9fl3e4Yz0A3IFTw6wGXACnjBhlcW
	SxOGUALTKfjP3nPROtyyRl+X7U/p0fgykip9K97XBzUYGWcteZDAdrXwdd4KkfPW
	WEzmYP4Jqi2Zoy4rhuBxdDj4UtgkPBCk70kRC5YX+QH0PhWBx+6qK37udAMpoIkL
	UZyt7IqF8HidNGWzrMHZE18blmyoBYasA+or+s8jDLnwo/metYHSwI7t0tiATL0W
	+wLMzNU2On9YObT1iF0qvQd4D01DP5KP7JEarVhgXk/AmfZIF0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm0sx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 08:49:40 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 414Gndke020401;
	Sun, 4 Feb 2024 08:49:39 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm0sx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Feb 2024 08:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzwZllsyj9ppNs8pUnFSee1BKHlfEEW75r+BDEY3mikl0CJcNwOQkultdyekgDPo0Q1xLGEG/WBTdKQGfrk5i0UFSzvXJzDGtkb8NLD/qu5XWAqvxqO5+lsZpC9LQyz2xvszY+dCrnoe26cjF5jy/Are1FQ0zvTDxdaHZ6jbaiwUNPGth27UPts9nP0y2K9J4sa1uzEM7gIM3w/MCQmMNDFFl/QDbljoxLuJZYbb6TMBAMPU2fW58BUV2Eh6MCrnivlf9zUgQLQpqDv8BB8j0GWKrAWv/WCEzAfz+Ru+e1hDJrzxpab/D4O+e8dmU/j+aQgUjq4y3TPn2wdxQOcIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTWDqTWsG6sZqsPdNdqj8Sfm3zSkzZ6WB8VwiMdo9og=;
 b=lSrECenkN8S/CDIICPtVwnpNY4/xbYdFC1BK31SzCJeUpR/SXINZRBtr1ik4uxvJ0NV6kVSbHm9V6PhTJHltkWWoLPIl80OkiE1M8VgwP78szxRbHzIG5gbOFecBT8eGyMenikZTpLwQ5l3/q9zPMT7Jw1GP4cCu3sj9jaoI5KOsB1Q3PSbWzVo3hbhWmmy+zCXGtAEJJ0L4zpc37akVn7BJ6Lg/c3s+G6p8oOL/ehzWbS9CLiAuikzBHTTuC3uFeo02/n8rVUJWYJ/PTkcxsJv93Mz3iJfxhhhPNybmHfbUIZOxYUXJuIVSsHbOA60IzkRMHNxeGjvwVWUJQL36nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 16:49:36 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 16:49:35 +0000
Content-Type: multipart/alternative;
 boundary="------------ztxdFlQRnoOE8Cjq0r2Nvd01"
Message-ID: <e71c5b83-5406-441a-8fbc-901c8a6cd4b4@windriver.com>
Date: Sun, 4 Feb 2024 11:49:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] valgrind: Upgrade to 3.22
Content-Language: en-CA
To: richard.purdie@linuxfoundation.org, Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20240203005739.3960031-1-raj.khem@gmail.com>
 <b232edbb6b775c460ca8ce5e4f3e7233435fd871.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <b232edbb6b775c460ca8ce5e4f3e7233435fd871.camel@linuxfoundation.org>
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c94521d-5daf-45ab-a651-08dc25a1449c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37ZkIDj8F5uXvkWa6ilbtne0kTsyd3IWwvvVstvRrFDl68ObMjve6xBACeZCb/KIMuuLaygrNlRg00mgvHKqaveeUWMXuybcq/2FsrnytsCaBkZ11m4KBrREspIG/XXNBl/HaXIXGX+bNoXwkQFWvCAX/AvHwrKbhyv/YF2sXOtsu/SsmXdvc8qoRM7SCnGN4T/e7lCNW+OUFJrdhhDcgWAMO/IaaXJMpmmo3j5RamyItls8F14fjBMFvS6xKqft9SN9rwcvOeaf3to/9ELROMMuh6bVTObkXlhCbpLHK1ZCmSperyoqqfgXxy6uqs24GnpKs1dPj78N35ARXXWma1ipJGVDETWT84cVuCHMZ1ST1ZBP+bDfTbsX1azRebbjkdcWWKweQauUYz3nesNqrARU+iIvzhBEoXpixuW/hVREECOBCmwencAnMpogcJVJ+3jLbVBFKEofMTNejf0Za3k9zRWDCwZYB+0M2UO/oLGreTfKMfMEbtsu778BQG/WyMlm3xNsn8xhktmZCEGWEVwITRSZ/JCK1VnycHdMlRcI9UGvU7AlxpU2e+stTttGIAEtEUyLtYrFnbXrUCLQ98nM3xDU8A9fQjD/0iGxkS/e4OTlf3RoM30U7wii5efMN+e8JBq5qFlUUju1zThh6L2ykhYaf9gcC1Q5tGQmnG0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(346002)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(6512007)(26005)(2616005)(86362001)(33964004)(6506007)(53546011)(31696002)(966005)(478600001)(6486002)(66946007)(66556008)(66476007)(8676002)(316002)(8936002)(31686004)(166002)(6666004)(38100700002)(36756003)(66899024)(41300700001)(2906002)(30864003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXBHR2ZwTEpES0FiTU5EdHFGRkVicDNJYzgwUmpQRjdXVmU2VCtMMHRLUzRz?=
 =?utf-8?B?Vy9YYlE0QzFmMy92MmdVbE81cnNMMkxuRTA5VVBuWndXTmFIS1FJZnNHbW9V?=
 =?utf-8?B?SlhhVVAybDZmeUMwV0FMa3JOMWVuOTIvbkFXRTRtcVhOVklzK3ArQVFrNU5a?=
 =?utf-8?B?dU85NVF2ei9pbnpnSzhJWjl5aFNHUHpvcG9rQVJXR0xCSmNLZGFoN29WeTZ6?=
 =?utf-8?B?QzBEN3FNYW4zQk9BelRqRzZCTldMaWowNGxhQmkwdFBWUmxYclZ2elBVR0xM?=
 =?utf-8?B?b0V1MlhpNUpSN2JEVzFDMi9YVGJBUklEc1d3eXFtT1VzQUk1VGEzbWltTXBB?=
 =?utf-8?B?c0t6alVTYlJraVNZRUdadW5tanNRUzVNTC9UR1NmcmJrMHVXQnZxNHg3Y3Q5?=
 =?utf-8?B?ZWhJaWFvbFZpRUpZZ0NSU0RVakFsQ3BXbi9IdUN6REN6UE5ZY0VkbkR3SXBF?=
 =?utf-8?B?cDZ6T3ZtL25MK1JXQ0RlMjMyN1hFN2JFUDRIb25halVnc1RiNnRndDRNMFdq?=
 =?utf-8?B?aGFVeWJUdTZMYVQ1QUJxSWloUjlpT09LWUE3anFad3ZpUm5uOTMrQ0JvYUpR?=
 =?utf-8?B?SGk1MFZvT0ZkOW5OcnJrallWUXFWMXE5Mm52V1RMNGJEUTZic3Y4a0dLUmNU?=
 =?utf-8?B?MDZoQXBteUtFdXdHRnRtSldrcVRCRGlZNENidldnRlNjTWMxekVOZXJ0V1Q5?=
 =?utf-8?B?cXl2MnhVWnJRTjYzVVAwR2FiYjNNMS9vRXUzbklnbUl4VlZhQkJiNmU5VjVt?=
 =?utf-8?B?TGlLQVBqY3JybkNnWkNoN2tRYkRkenk5N1lENVFRWm0vbW5JWUJOMmtWbVFa?=
 =?utf-8?B?eEl5Qkloc3FaMzhJVnVqK1dwblNtMnZYR2s4MDN4dkxmL1BrWitDemNqODVB?=
 =?utf-8?B?cHV6V254OWJIdzhVaVNiZlp1Ri9TeXlZQVR4WXBQdzBjSTlUOWR6Kzgyak1U?=
 =?utf-8?B?dmN4Z09HeVBhWnNlRVdrWmRUUnhIRmdDNzBxbWJlWXVIUWszbUY1cUsrRy9k?=
 =?utf-8?B?UHljOXprdDlCOTFESEtrMjBCL2RyN01TVXM2UVF3aXJLRTdPeFc5YkdOemxZ?=
 =?utf-8?B?YnVkdEJPU3V6eXdJQktEcUtZbHpNNmFTRE1HeUFEZlBGOUZtdHZRa2FPWTY3?=
 =?utf-8?B?Q1BCWVVJVVRYNFVteFE4L0w5aHBqbjY3VHZ6S2hPaFFoUEoyQlZIbEMwdXJ0?=
 =?utf-8?B?cFZIang3RjI0SlBsODE3NGo4UVBVaDFXNEE0bWJzYVl0RGFObUcwQkp0S1Jq?=
 =?utf-8?B?cXFmWTNZUWlGTTVpbE9ORUlyZFhZRVR6S2JYNFFRcmFsczBidFl5V2oxSW5p?=
 =?utf-8?B?RlYrNktNa3A2bHB2djJldW9NbUR4NFBMQmxiMnVwVkNkUGlpMmw0dTBEM3Q4?=
 =?utf-8?B?dEVobExXd3VDSVB2TTlxVy9SamNJcnovcWpOL3Z3VTZwYXk1VGhJV21ZUWNK?=
 =?utf-8?B?LzlxTTErSDZoWUtidHAvTTY4Z3k2V2VFVjdySWpIUmZEVHlXRkJqNlloM1dV?=
 =?utf-8?B?Q3loOSsvWnFTcXExeGlYamtESWZuUEV3aksydEI3YzBIQVgxcE9nZFNadHRi?=
 =?utf-8?B?d1Z2c2FnZmM0b3E2VnpiT2xMUml0eEx0K0xpbVJHZVFYRG9lOWNqeE0zS09D?=
 =?utf-8?B?OWRQTURjWW0xb1Y0UHBsN3RjOFNudmF3aUY4NWVCUGZLYXFTeDRvNXhlMytV?=
 =?utf-8?B?SEQ4ZGZKVWNrNUkwY0lIWU55T2NvL1M0VFZOVkRvdkpLN0NiZlNQajZYeHUv?=
 =?utf-8?B?aDA1WHBENTZsejA1TlVRaVEycHVONjJkY2ZKOHBlWE90Z3lUSHUwV2RWTk81?=
 =?utf-8?B?amhmc2cvVmxBVWJwdG01SXRGRmtEZ1IyZGNNTXU4TUJGaGt6OXVUbkY3Z0xw?=
 =?utf-8?B?RG0wa0pWOUJVVzF5SWtHcDlqdzEyMGNUMGFkK1hNU2VSaW11eGRMNTh1WU05?=
 =?utf-8?B?QTJoNHhsbG90S0FwWkVxcE5wb3RQbzhvL2dEeks2ckd6elpVeGFDeUdzMnhM?=
 =?utf-8?B?d3l3UTZzZVExSmZmb291QitpZmFNbXJrYkk0aHlXNHV3eFp4L29UbGowOGVB?=
 =?utf-8?B?eU1aL3IzM0JGa1hYZ2p4aUVaK2VEVmpOMjlGL09WWVhxQUNBZ01lTDYwVGMr?=
 =?utf-8?B?NUdwbnArQ0hDNFB0ZWF2MUhkeDRsMGlqOHBIUk9IR1FRNmZ4V0xXcE9tL2l3?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c94521d-5daf-45ab-a651-08dc25a1449c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 16:49:35.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTdqSjajLVxQ1T0bjcnuuKhO+OEWEPDtVCixwKoScUm1bhvnVIN2sYQmE7rgx4fkXpppPcQRq8QQWJJPtXjdfIBZEWBGsouNDM0HKfpFJEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-Proofpoint-GUID: 6fpKT3l8PMGDHOlYcQeIrLT-AdTmku1C
X-Proofpoint-ORIG-GUID: CzG-4NUfbx6Q8dpyme3j0yAhT5a35ZJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402040130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 16:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194897

--------------ztxdFlQRnoOE8Cjq0r2Nvd01
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 414GVTgk032583

On 2024-02-03 4:38 p.m., Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2024-02-02 at 16:57 -0800, Khem Raj wrote:
>> Changes are summarised in Release announcement [1]
>>
>> [1]https://sourceforge.net/p/valgrind/mailman/message/50323635/
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   ...inux-seg_override.c-add-missing-incl.patch | 30 -----------------=
--
>>   ...{valgrind_3.21.0.bb =3D> valgrind_3.22.0.bb} |  3 +-
>>   2 files changed, 1 insertion(+), 32 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none=
-tests-x86-linux-seg_override.c-add-missing-incl.patch
>>   rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb =3D> valgr=
ind_3.22.0.bb} (98%)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x=
86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/va=
lgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl=
.patch
>> deleted file mode 100644
>> index 5e36c28523e..00000000000
>> --- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linu=
x-seg_override.c-add-missing-incl.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 200=
1
>> -From: Alexander Kanavin<alex@linutronix.de>
>> -Date: Mon, 8 May 2023 11:56:35 +0200
>> -Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing inc=
lude for
>> - musl builds
>> -
>> -Otherwise SYS_modify_ldt is undefined.
>> -
>> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=3D38=
2034]
>> -Signed-off-by: Alexander Kanavin<alex@linutronix.de>
>> -
>> ----
>> - none/tests/x86-linux/seg_override.c | 4 ++++
>> - 1 file changed, 4 insertions(+)
>> -
>> -diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-lin=
ux/seg_override.c
>> -index ca8fbfe..4ef4394 100644
>> ---- a/none/tests/x86-linux/seg_override.c
>> -+++ b/none/tests/x86-linux/seg_override.c
>> -@@ -3,6 +3,10 @@
>> - #include <errno.h>
>> - #include <string.h>
>> - #include "../../../config.h"
>> -+#if defined(MUSL_LIBC)
>> -+#include <syscall.h>
>> -+#include <unistd.h>
>> -+#endif
>> -
>> -
>> - /* Stuff from Wine. */
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/=
recipes-devtools/valgrind/valgrind_3.22.0.bb
>> similarity index 98%
>> rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
>> rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
>> index 67a197c5097..85b29ca54db 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
>> @@ -36,9 +36,8 @@ SRC_URI =3D"https://sourceware.org/pub/valgrind/valg=
rind-${PV}.tar.bz2 \=20
>> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch=20
>> \ file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \=20
>> file://0001-docs-Disable-manual-validation.patch \ -=20
>> file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch=
=20
>> \ "
>> -SRC_URI[sha256sum] =3D "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7=
fce11c8a6243b9ac971"
>> +SRC_URI[sha256sum] =3D "c811db5add2c5f729944caf47c4e7a65dcaabb9461e47=
2b578765dd7bf6d2d4c"
>>   UPSTREAM_CHECK_REGEX =3D "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
>>  =20
>>   COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64=
).*-linux'
> This is resulting in failing ptests on arm and x86:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6048
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6233
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6234
>
> e.g.:
>
> http://autobuilder.yocto.io/pub/non-release/20240203-17/testresults/qem=
ux86-64-ptest/valgrind.log
This is the same 14 ptest failures (1) that I saw > 1 month ago and=20
still haven't gotten to.

I have some patches (2) that reduce noise such as:

PASS: cachegrind/tests/ann-merge1
python3: can't open file=20
'/usr/lib/valgrind/ptest/cachegrind/tests/../cg_annotate': [Errno 2] No=20
such file or directory
post check failed: python3 ../cg_annotate ann-merge1a.cgout=20
ann-merge1b.cgout
PASS: cachegrind/tests/ann-merge2

but I haven't been able to make time to work on the ptest failures yet.

Upstream suggested starting with:
 =C2=A0=C2=A0 massif/tests/bug469146, massif/tests/new-cpp,=20
massif/tests/overloaded-new

so that's my plan should I ever get the time during the work week.

../Randy


1)

=3D=3D=3D Test Summary =3D=3D=3D
TOTAL: 792
PASSED: 759
FAILED: 14
SKIPPED: 19
DURATION: 1121
END: /usr/lib/valgrind/ptest
2024-02-04T00:17
STOP: ptest-runner
TOTAL: 1 FAIL: 0


=E2=9D=AF rg FAIL ~/Downloads/valgrind.log
152:FAIL: memcheck/tests/linux/dlclose_leak-no-keep
153:FAIL: memcheck/tests/linux/dlclose_leak
299:FAIL: memcheck/tests/wrap1
300:FAIL: memcheck/tests/wrap2
301:FAIL: memcheck/tests/wrap3
302:FAIL: memcheck/tests/wrap4
303:FAIL: memcheck/tests/wrap5
304:FAIL: memcheck/tests/wrap6
305:FAIL: memcheck/tests/wrap7
306:FAIL: memcheck/tests/wrap8
345:FAIL: cachegrind/tests/wrap5
573:FAIL: massif/tests/bug469146
588:FAIL: massif/tests/new-cpp
592:FAIL: massif/tests/overloaded-new
1511:FAILED: 14


2)

https://lore.kernel.org/openembedded-core/94196e06-f078-4df5-afee-e29c05f=
11b37@windriver.com/#r

rebased locally on master and:

55d23bd803 (HEAD -> master) valgrind: add python3-compile and enable=20
cachegrind
c64d10bec0 valgrind: drop Make-local-function-static patch
63741cbd41 valgrind: drop mips32 opcode patch
08b8f5c88e valgrind: drop context API musl patch
25bf857dca valgrind: update from 3.21.0 to 3.22.0
e135dc30e5 valgrind: make ptest depend on all components
b73804429c (origin/master, origin/HEAD) rpm: add missing dependencies=20
for packageconfig
e41515b5f9 systemtap: Backport GCC-14 related calloc fixes
a7ed494c4a kexec-tools: Fix build with gas 2.42


>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194864):https://lists.openembedded.org/g/openembedd=
ed-core/message/194864
> Mute This Topic:https://lists.openembedded.org/mt/104132068/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------ztxdFlQRnoOE8Cjq0r2Nvd01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 414GVTgk032583

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-02-03 4:38 p.m., Richard Purdi=
e
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b232edbb6b775c460ca8ce5e4f3e723=
3435fd871.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, 2024-02-02 at 16:57 =
-0800, Khem Raj wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Changes are summarised in =
Release announcement [1]

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://sourceforge.net/p/=
valgrind/mailman/message/50323635/">https://sourceforge.net/p/valgrind/ma=
ilman/message/50323635/</a>

Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 ...inux-seg_override.c-add-missing-incl.patch | 30 -------------------
 ...{valgrind_3.21.0.bb =3D&gt; valgrind_3.22.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tes=
ts-x86-linux-seg_override.c-add-missing-incl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb =3D&gt; valgri=
nd_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-=
linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgr=
ind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.pa=
tch
deleted file mode 100644
index 5e36c28523e..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-s=
eg_override.c-add-missing-incl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
-Date: Mon, 8 May 2023 11:56:35 +0200
-Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing includ=
e for
- musl builds
-
-Otherwise SYS_modify_ldt is undefined.
-
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://bugs.kde.org/show_bug.cgi?id=3D382034">https://bugs.kde.org/show_b=
ug.cgi?id=3D382034</a>]
-Signed-off-by: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
-
----
- none/tests/x86-linux/seg_override.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/=
seg_override.c
-index ca8fbfe..4ef4394 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -3,6 +3,10 @@
- #include &lt;errno.h&gt;
- #include &lt;string.h&gt;
- #include &quot;../../../config.h&quot;
-+#if defined(MUSL_LIBC)
-+#include &lt;syscall.h&gt;
-+#include &lt;unistd.h&gt;
-+#endif
-=20
-=20
- /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 67a197c5097..85b29ca54db 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -36,9 +36,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2\file://0001-no=
ne-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch\file://0001-memche=
ck-tests-Fix-timerfd-syscall-test.patch\file://0001-docs-Disable-manual-v=
alidation.patch\-file://0001-none-tests-x86-linux-seg_override.c-add-miss=
ing-incl.patch\">&quot;https://sourceware.org/pub/valgrind/valgrind-${PV}=
.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-path=
s.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-none-tests-x86-linux-seg_override.c-add-missing-i=
ncl.patch \
            &quot;</a>
-SRC_URI[sha256sum] =3D &quot;10ce1618bb3e33fad16eb79552b0a3e1211762448a0=
d7fce11c8a6243b9ac971&quot;
+SRC_URI[sha256sum] =3D &quot;c811db5add2c5f729944caf47c4e7a65dcaabb9461e=
472b578765dd7bf6d2d4c&quot;
 UPSTREAM_CHECK_REGEX =3D &quot;valgrind-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar=
&quot;
=20
 COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-=
linux'
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">This is resulting in failing=
 ptests on arm and x86:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/6048">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/82/builds/6048</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6233">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/81/builds/6233</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/6234">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/81/builds/6234</a>

e.g.:

<a class=3D"moz-txt-link-freetext" href=3D"http://autobuilder.yocto.io/pu=
b/non-release/20240203-17/testresults/qemux86-64-ptest/valgrind.log">http=
://autobuilder.yocto.io/pub/non-release/20240203-17/testresults/qemux86-6=
4-ptest/valgrind.log</a></pre>
    </blockquote>
    This is the same 14 ptest failures (1) that I saw &gt; 1 month ago
    and still haven't gotten to.<br>
    <p>I have some patches (2) that reduce noise such as:</p>
    <p>PASS: cachegrind/tests/ann-merge1<br>
      python3: can't open file
      '/usr/lib/valgrind/ptest/cachegrind/tests/../cg_annotate': [Errno
      2] No such file or directory<br>
      post check failed: python3 ../cg_annotate ann-merge1a.cgout
      ann-merge1b.cgout<br>
      PASS: cachegrind/tests/ann-merge2<br>
    </p>
    <p>but I haven't been able to make time to work on the ptest
      failures yet.</p>
    <p>Upstream suggested starting with:<br>
      &nbsp;&nbsp; massif/tests/bug469146, massif/tests/new-cpp,
      massif/tests/overloaded-new</p>
    <p>so that's my plan should I ever get the time during the work
      week.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p>=3D=3D=3D Test Summary =3D=3D=3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      TOTAL:
792&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASSED:
759&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      FAILED:
14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      SKIPPED:
19&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      DURATION:
1121&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      END:
/usr/lib/valgrind/ptest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
2024-02-04T00:17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      STOP:
ptest-runner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      TOTAL: 1 FAIL: 0&nbsp; <br>
    </p>
    <p><br>
    </p>
    <p>=E2=9D=AF rg FAIL ~/Downloads/valgrind.log <br>
      152:FAIL: memcheck/tests/linux/dlclose_leak-no-keep<br>
      153:FAIL: memcheck/tests/linux/dlclose_leak<br>
      299:FAIL: memcheck/tests/wrap1<br>
      300:FAIL: memcheck/tests/wrap2<br>
      301:FAIL: memcheck/tests/wrap3<br>
      302:FAIL: memcheck/tests/wrap4<br>
      303:FAIL: memcheck/tests/wrap5<br>
      304:FAIL: memcheck/tests/wrap6<br>
      305:FAIL: memcheck/tests/wrap7<br>
      306:FAIL: memcheck/tests/wrap8<br>
      345:FAIL: cachegrind/tests/wrap5<br>
      573:FAIL: massif/tests/bug469146<br>
      588:FAIL: massif/tests/new-cpp<br>
      592:FAIL: massif/tests/overloaded-new<br>
      1511:FAILED: 14</p>
    <p><br>
    </p>
    <p>2)<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://lore.kernel.org=
/openembedded-core/94196e06-f078-4df5-afee-e29c05f11b37@windriver.com/#r"=
>https://lore.kernel.org/openembedded-core/94196e06-f078-4df5-afee-e29c05=
f11b37@windriver.com/#r</a></p>
    <p>rebased locally on master and:</p>
    <p>55d23bd803 (HEAD -&gt; master) valgrind: add python3-compile and
      enable cachegrind<br>
      c64d10bec0 valgrind: drop Make-local-function-static patch<br>
      63741cbd41 valgrind: drop mips32 opcode patch<br>
      08b8f5c88e valgrind: drop context API musl patch<br>
      25bf857dca valgrind: update from 3.21.0 to 3.22.0<br>
      e135dc30e5 valgrind: make ptest depend on all components<br>
      b73804429c (origin/master, origin/HEAD) rpm: add missing
      dependencies for packageconfig<br>
      e41515b5f9 systemtap: Backport GCC-14 related calloc fixes<br>
      a7ed494c4a kexec-tools: Fix build with gas 2.42<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:b232edbb6b775c460ca8ce5e4f3e723=
3435fd871.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Cheers,

Richard


</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#194864): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/194864">https:/=
/lists.openembedded.org/g/openembedded-core/message/194864</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104132068/3616765">https://lists.openembedded.org/mt=
/104132068/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ztxdFlQRnoOE8Cjq0r2Nvd01--

