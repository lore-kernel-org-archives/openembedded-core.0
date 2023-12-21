Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C7EC46CD4
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:47:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1876.1703184442522732287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jtw66ymT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0719615cdd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL7kuu7010396
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 18:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Xa0TgTnJUFCDtLJHJHr
	CXidB+ct7mPYwEinFbJ1rzmA=; b=Jtw66ymTi53H2IrJh7U2NtEQYUEpPoq4aNZ
	ruj7eYpwwTnuBSi6JUovlo2Bj/ysDvsP4MULN4khHReKNNvUOC/xj5SxNN7Bw6e8
	raN9ZpXNDldJk5cJRNZACNtqtGSkYlx7SAoV/57683LXIFKFXkHbymrDyIEqp8u5
	DXsFMx7jp5H9UIVnz7BlEr9bATIP27og2WP+pikO0Ii0s7aNUOq63rocUAPFK0Eo
	JdzsIuFXJU7QCkOsvOV10LiZ53uyvZH1sydjncfKtCh/gZvBrJAvCWEvvLE+anjp
	OyVOP9ujYKuK7fMYCXyYwvXK3+95tC7M72WvFH1G5x3NSgsmCmQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5y0ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 18:47:21 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BLIjqt7001757
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 18:47:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5y0b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 18:47:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fggrE7I/RgJ7hdO97YU2w1NIuJ/XiMS1n5AGMTj9OWdTHWaE9h4zbdivfSaCVwOZCMSetHtUFBsUfOpKRtxDHU9KQoeZj2+UR4ERnNytU/xolVG7Zk2tZ86R+f3+XlWAOZGWOm919VkoLBJDFh5dZhg+H3+Hbe5A1yn5IG3cjKakY8hNit+PHZPsgsxx4Rx59R69gz6TCBaNM5lLppoxfEzSDBYtdJTAlUsbUmK0gvKgqu2CYf+wGZC/dADcSQxQrDkMmNAMY7wtDD3u52Md5us4WtD7NNHjcO4baxiLolQY3AfdorHMTwQq1NA9RnFHSy38mOHXmcJd0oWacvCPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa0TgTnJUFCDtLJHJHrCXidB+ct7mPYwEinFbJ1rzmA=;
 b=Vi/txqoDbxDLoYo7UM4Bhe6klixZcdhVQ1zg1Fi7VjEJdY8bHyDjjv+h7olbOVqSwmadwIimo1+WJwEpGlYxnXxKbhcC6/RAAzqSxOBZKTP8rGZSF/mPAjNtAeOUOe0jhR90tFSjg0VSG7IsAwLm3lJkHEbeRM941K0lN94AiAOonGr8meInPE+bm6hOcFmjobEXsg6Vfg2X7uBwOJF5WJ72R3BrZSLWVQVFuKR7KJXh7sCFfu8wTECd148gy0YQc/FkFYeLY/g8hHQkB2jLRYS8NAOM6QV5oYaHcJGpLlD2jHyhIeLRBUoHVCWLrqk/Av2UaTQ90nEdBuaGtNB0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 18:47:15 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 18:47:15 +0000
Content-Type: multipart/alternative;
 boundary="------------BsXYGgLoNu7iaQbMrJEnphOr"
Message-ID: <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
Date: Thu, 21 Dec 2023 13:47:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-CA
To: zboszor@gmail.com, Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: faf40d34-e2ea-42d0-9d9f-08dc02553f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2eY96wOdPfLTUBLuPy1Mr+ud1DlO7/7k6aXFaMabLF6+dzgG08UTOpL87CjKtyY2N6mfQCp/RMHQbrl+AFYFM23SQes5bm6Jz9WKTshvQrZSeU1KQCn3Q5su9RyGPKsUIYHlAv1FOM5lvTxUisjKpu793Em6mcqCnh4xxgTOKmEeVV26MDrnJiuHLh532VPdNXuGxNXOhKBqeCn9WGHH1RQGaVOi7h1PKCwg0ORUNYvmXDVl/Ei9Iwd8a5l1CoyI+a2YfMA9Z6zRjfVkWU1vgeFujxoTihnQ5AvLYifvSsNAYlqgitbHNyO0K/hkljp5rFsDXHCBhmfsv9AQogqlsGEzYxpGIg22bU6so1Faz7KBP/2x3M5oxcsBXZqtgjEf3rGgfv4x0OPbk/VRkOyn0N7HQSOxvIDBuOGLZ6J0Qr2GPosTE0A1F0xw5VuYZvyAYy7SLV5BL4WO2n4agvWlytheO4z/5W6RX5ujL0optsFFxVLRytjmwE7rBJ/Cwxl8+yUhtNra84rGWzHPiUke7OUkUcovfKjT0s4xlIsKm6X0B7j2SMxiH8WuY2jtznwMbDWoE0MiEOJihbQBMnno/QLK+czP5Kd/qNIU8ae9HTEDQUeQ2+S4WwAooOxMXRxbRCNAl7bPCS3tEbnZRvFxyJWMVRZSO0VK62zYodXi7xOsanuqMIeVueLsnYpHOKib
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(6916009)(66556008)(6486002)(66946007)(6506007)(66476007)(6512007)(53546011)(6666004)(478600001)(33964004)(31696002)(31686004)(36756003)(83380400001)(26005)(2616005)(2906002)(4001150100001)(5660300002)(8936002)(8676002)(316002)(4326008)(86362001)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1p2VW05a3Zwc2MvQVB0bDhVbnlMakd1N3ZuWFowazJHNzMrbWJZMm95ZEJ2?=
 =?utf-8?B?UmxpM2Jza2xuZUlFWFZFTm1UYWZac2hnRGxqRUMzTyt2UU40WHNBcUVTMkly?=
 =?utf-8?B?K0tqdjAxemJ1aC9XZGFYZUl6ekV0cGdwQW1WV1BwZ3lyYUUzUXVWUUFsVldn?=
 =?utf-8?B?TTRHc2JHWi9BUk9FRlpWb3d4THNoMStNb0U5WHNBOUtJZWlRVjhTVzhmWll1?=
 =?utf-8?B?SEozWGJvVGU0T1F3cyt2VElXVGhNT2pHMUVPazJQQzdyK2RKc2picWdaNlFX?=
 =?utf-8?B?YzVTVml4SkY4b2k3ZFl1aVlxNW9oKzZtd2lZZzV2ekRwSnk2bCt5QklGMU56?=
 =?utf-8?B?SnM5dFc4dWUyRFRpYjl1TzIxMVp1enVPdTM4cVQrZkdyYVIrNFBGWTNOTjR3?=
 =?utf-8?B?NXI0K1J6MlhjdktZK2YzalJ4TFJBRVFGNFNwNkFITFF4N0hpTHQ1OHg2dlpF?=
 =?utf-8?B?UmpyVHA2bzYvQmU4WkFHcitVVlU0cXJjQWlKSEhVc1l2K3dBUjl3Nkp4RW1k?=
 =?utf-8?B?MkUrWFRNQzZMV2g0VFc2RFdLRVBLbXhwVDFvd1NyR3c1N1hXVWYwRFJpR0dq?=
 =?utf-8?B?bDFHNXE2Vk5YRXpPK3pIczhnNXk2SlZ5VEw5RnNsNmhEU25pOCt1TStnSkhU?=
 =?utf-8?B?ZjZhQ0h0VkhkNVdzci9rS2t2WlpkK3crVjRadWQxeUpiT1h0SE9SYllKdEcy?=
 =?utf-8?B?SXZRWi9tU0ltcXlpSFFJTWl6UytqQ0t3T3pLRTdxOWR2ajZGYlljc1RTME5t?=
 =?utf-8?B?VlcwM2xpOWlobjlRcm02b1hJTWxERzVlb0hmdmVnWVdLSEgxUzZpM3pJRmJr?=
 =?utf-8?B?cXlJR0wvTEJFUG5TeDBpVVAwQmo0VXZvVVM4WkZhZHdXNkxJNDljVGhwVVMr?=
 =?utf-8?B?Z040WGxjbEIrOXA0dGh2dEpjbXRQblVRazl6R1c3QktMczAzb2lLWGlzV0Nr?=
 =?utf-8?B?VnJrUk4wTGpRVUtOd0cyZXY3VHJzUURXT09QbDgwTVNPUUliMHFNN3ozT0tG?=
 =?utf-8?B?TEpGdHovalVVQ1JqSTNieDlvMHN6NFRDNzcxeFhZMmtncXQ2VTFYNm9NeWVj?=
 =?utf-8?B?aCsrSzUzdmdqU3FXOTNWcHh1d2RHTEEzRTRnY0pyMUl3aDZzZmtsL1hDRDVp?=
 =?utf-8?B?UThQQ2xkOUUvVDJ6eWg5c0FCcjI5QXdIZGdYbWhJZi9BMkFmd2FDTkNwTk9m?=
 =?utf-8?B?NXovM3NFYVhkTXBkSUlTV0dnbTJpemlJUnFlTlVMdVprN2JrajVNQlVYWU5I?=
 =?utf-8?B?QWs1MldXRWpnOVo3c1hoUVlvelk2NXUyd1lRUUczUnBYZEx3USs2azJFc0NZ?=
 =?utf-8?B?bGUyMGlMNXNOcHVncERNeWZRcksxY3hzR3BLRS9FMkU0b201N3ZSdTZETkZj?=
 =?utf-8?B?UjY3MEZlSEhnZEZCY2x4aEhYTlpIOVZ4YlZqdkZ1bGJpWEJEcVBWei9oOC9w?=
 =?utf-8?B?cFc0OXhQa251WHZqUTRIbUVycVBWSDdwMlR0VG94bHQ3UitFb3pIT2ZISklj?=
 =?utf-8?B?Ty9pZWJ4T2p1TFpQenBjVGZGQ2RwYk9rWEs0MUJDbEI1SEVmVzBEQUpNYWVQ?=
 =?utf-8?B?MFBzNTd4MHQzYVdmRDRiNWZRd0RnejgyLzZYcGF5ZndUWGowVUhZbC85RERi?=
 =?utf-8?B?YkJwSFQvUHY5RjFwUXNDMGJWdWhsQTExT0hWcGdCczhSMDlyMXVPWVFPUFVp?=
 =?utf-8?B?REdrYncwaGFGbncvVDRvSGEzMUV2Q1l1UzBRL05iUUZhNlpTNlI5YjNQWERQ?=
 =?utf-8?B?MDlacnNIMkJsMHprbE1oVGJBWnJVT0ZHa3NkdzYxODYyLzM5Q0JaTUIvMlF6?=
 =?utf-8?B?c2JxWE1oY1VtaTlvMFE3Nko0dEYvbFJ6TUp6SkxjNDhIMVJxZ283NnVScFdx?=
 =?utf-8?B?ZHErYXVsREMrS2hoZzhYU0IxMzN5Wk50Ry9JYVI1R1BmYldQR1JwN2lDVXN5?=
 =?utf-8?B?S0VPNVlXb2tYSVNtbTgwenllMUJ2NVl4SDB6dzZUZ2NNRU5MT285MklQNXJh?=
 =?utf-8?B?eVFabkQ1cklYWlF5VXZFTWJjL3NSdVdvUXkvaE9NcnRnY2hsMWxNNGY0MHIr?=
 =?utf-8?B?dlBlblRkL2l5TVQ5N0xoRDIydTFreFNvTEd0QlN6eGFlYWJwdTE0TENwbEJE?=
 =?utf-8?B?TzFyZEZFUCtMWXRmY0IwRHgvR1pEbUZGU0t3cW5EOXMzTFZuVXRDcEVUczdT?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf40d34-e2ea-42d0-9d9f-08dc02553f93
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 18:47:15.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALi7+cXoS8YSfT91qb/eqjXZofJq/ujMOZ5W+pwymzUI0GNwumkaDRnkLtcU1r7cqlTRB91q4taCCN2K7b/wsw1F4pCXWUhrnl/y94yjyI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
X-Proofpoint-ORIG-GUID: 1pni5qxNhOXW8gnj-ftSBPlm2tXfDtCl
X-Proofpoint-GUID: Ewyzlq0jE4hgLa_XmaiDuBBPTTrFe5Pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312210143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 18:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192844

--------------BsXYGgLoNu7iaQbMrJEnphOr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via lists.openembedded.org 
wrote:
> So it's not just Fedora, but Python 3.12 in general.
>
> Googling for problem with threads + fork reveals that
> it is indeed an issue even in C / POSIX: only the thread
> executing fork() will become part of the new process,
> but not the main process starting the thread or any
> other threads from the original process.
>
> The warning is justified, and apparently the issue
> not occurring in bitbake with previous Python versions
> is pure luck.

FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or later.


-- 
# Randy MacLeod
# Wind River Linux

--------------BsXYGgLoNu7iaQbMrJEnphOr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-11-28 4:26 a.m., Zoltan
      Boszormenyi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com">So it's
      not just Fedora, but Python 3.12 in general.
      <br>
      <br>
      Googling for problem with threads + fork reveals that
      <br>
      it is indeed an issue even in C / POSIX: only the thread
      <br>
      executing fork() will become part of the new process,
      <br>
      but not the main process starting the thread or any
      <br>
      other threads from the original process.
      <br>
      <br>
      The warning is justified, and apparently the issue
      <br>
      not occurring in bitbake with previous Python versions
      <br>
      is pure luck.
      <br>
    </blockquote>
    <p>FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or
      later.</p>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BsXYGgLoNu7iaQbMrJEnphOr--

