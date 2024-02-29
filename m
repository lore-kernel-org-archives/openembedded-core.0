Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B29C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:27:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21610.1709202467049382441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=378913ab4c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5AToK022823
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:27:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6dabj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:27:46 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41TAQ4fW004857
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:27:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6dabh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 10:27:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV+7k0XGRZlI+owRcWre61ruzLBspY4JxBHw1TkWQZkEQM6vsnqVntPSrOTmC6y7W+s9WQ/CpWJX3uV6DnfqfvR01hHhfDcxDjvuk5isSfpsOhGYw1QTkydPmOw/R1Oqh/VhxBB2Ihln1AOGo6Yk0KANQBRiM59aWSkJounx3bXXKZLPh2/BxlGkwJRp2y9Ncb66H5yqyVJZvdVB4w59WoPtNvSbkNxJLf+FFg5Dh2+8gcP1i1jAQ2de7Rt/s4FFBYBIEpXiFHTtPBHJMzkIX9lXSpuQvXaqnTJ48bhKVuFZjlUhoNsf/GkVX7ZuGv9tf/pyBxn2foDf/h/k+BO1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch1qjpEVMhOTtIGjcqC5+sAINZ4BVyS+d7zkNdrfUR0=;
 b=h2Cis9WkftB2zK0dXQLX/u4FpSVrliQO7NH7JwxjZzVlFajTFzMpzXn5AN1sSuaJqZo+S4qkC2AXASg01TKsdBe4Bx6Lz8OLxS823uahHJQV9XUKUpzO64sMybay33P/o3WAF1IT6vXv5I/ISfJ9LX73PlzFEPd8vkFAp700uSkFNkFpkyHlxIjjTQo3BmlReATpiaIHKRGnZ3tc8MPyNsCSGHg/wqn6x+7q1bXS1IlY5zDCC9Tc6AA3KHSslvVLfR7ukrHACEASFWFnQ6Qu6eAJhAGaFgjQIh1PaLxPdYp9/nYoiIV73f8cqN1wuvSbaVCRzcJZxu5rnC/gzwaiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 10:27:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 10:27:44 +0000
Message-ID: <476d00b2-8d19-40e2-b15a-995cb44edd39@eng.windriver.com>
Date: Thu, 29 Feb 2024 18:27:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in
 run-ptest
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
 <4823ed44-2ba4-4d18-86c2-e6dc426e0a46@eng.windriver.com>
 <CANNYZj-FRp6uO9zVW-82JXBcArSQ6EMB7S444Wff5RNOtv6U1w@mail.gmail.com>
 <baece317-a250-4e8c-adb3-1e3227d0e9a6@eng.windriver.com>
 <CANNYZj-gAZjoAAMUVLhS5NPOz_Lh+NHdCB+pT+ifM2+sPnUGZA@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CANNYZj-gAZjoAAMUVLhS5NPOz_Lh+NHdCB+pT+ifM2+sPnUGZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: db830ed9-4656-44b1-dad6-08dc391110cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e6XzFvppA4x2Z6xHqwoq35dNtCOdpBUwQeeBjnSCuSs4+YY1kh7BM44rhGT5Fe4khji/Ipk7dEEaRhm57HpEXueXqUboGVIPNG5r5r+wK0VsGg4HO65R9kO8ODuImQDZLOBN4TJLfk6HUSByWhNfPpFbXzJzwhc8ttp+BY3Kdw2HODHaKiVDMLaWcglpu7Xqcib7PjfEYfTElecZ69ocsqJUn1sUgZin8pNCKPAF9VdRMA6qgBFElWj1VNBuwpOSE4Ni729aQFGYpBCXtuf31GfVVfa/bESuoQNRf9hmXFDd+DHKu91b8V3B0RBbY9s30jR2L0EHwPNrKYuHJgwjOG5+8FiIQirPevUJ0j4Gr19QSFiVLAPmpkQ3kC9OPUf+FqQ2Ku8EYlyI4W6+o+vSn8VeLFvunFn2uYZMNxvW0QTQU9+gbWeutjq17KEWVr8kxzdN5cHymlchH+plj/v+0w9ARUnytMzBkz/dveIzPjGgyLBgEGSek77aivk+i59mf9OhV5cjl4gLPHnNvq7yjNKguyZtOYrmbCa3ldKh4+outdP3UYEuSpJe1CLaI1zjrhfNwGXqM3wCd8pY4H37bEhv6J6ue+lldLmN2IWuEgmwxfbiAQYnxLaZSsV36EDibE1Pq4NUpcO4U3Q+RCncbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmxyVzk3dFZ3alZ4UVlhVUdZUXFieWZxL01sOXg4dEF6Y2FEYkUzZDhJcVQ2?=
 =?utf-8?B?NDBVWVNzc2ZGNzlJNnNQY3BjRjJMbWF3RDFLY3RnWXJEMHFkUm9xbVljMkQw?=
 =?utf-8?B?c01WNVErME5BWlJaUWQyUnRwQnpaOXhpNVdJbVN2U0FuM1M3T1FhRCtRbHdj?=
 =?utf-8?B?WGllZ1RTZkxKNVpnYk1KRUF6K2RFcUFsc1FlSEowMDh4VFp0KzRGYUtwRk1W?=
 =?utf-8?B?S01ya09BN1FhdEZlanQwMUtiT0ZXRFZDN0luVkFzOGNPM0w4cXAxN3lXQzRv?=
 =?utf-8?B?YlhSZUlNaDJJTlZ3aFRBNEhBbTA4MHN6aFg1c1FMbVJYUGtqMTRaeFdJK0dv?=
 =?utf-8?B?THhKZTFsdmc5OW92YjNuSE8zZDJYSGY5VHpwQkJEZG00NUU0UUtTRnpaZlZB?=
 =?utf-8?B?eDQ0enh5S2tQQ1hFcDNyZVJ3b0ZBWG9LcCt1OTFqeVpIVTBIKzdPamdIVVNq?=
 =?utf-8?B?czZzdHBSVVhGaExUL0lVT1BoUURoeC94SXFKdlY3bUZ6Wnp2T0tzR1crR2VH?=
 =?utf-8?B?b25zU0lLV0RlZlpHUUJ2MjBZRkxTR0hXblJrK3RZd2tUeVdqaDFBZ0QyeFVp?=
 =?utf-8?B?eTJtREZlTGgzOEN4aUFhMFRmd2ZiczM3QXlNV3ZQN1hKMlFWNFA4S1VUWXp4?=
 =?utf-8?B?cU1HaDFLRXVwYzRsZGhXS1RRRkJDTHdpdVZMVzFUTU1CVXc1ZDBkUE1iWXh0?=
 =?utf-8?B?eGJ5Q25TUVVMZCtoMmhKSUZrZjhJREtkemh4d1JCdWdrZjRyaDZ5ODBwdEJx?=
 =?utf-8?B?MVlPSFVUSUp0ekN0RWVRdFcrYUxOQkI1a1hSbjArODZqaFkxckJIUE1aSUVJ?=
 =?utf-8?B?ZjR0Y3NCMmFxclRGUTMzRkZDZGRYeDVXYlNFS1NZVmQzZTU1SzFiaVMxYk9T?=
 =?utf-8?B?Q2RQTWI2RkFYak1jYnJjU2FnemZmOU13Nml1Sk5WR1puYnczUzdaaUhoRHZX?=
 =?utf-8?B?MW9TSUVMaDVXdkI4eWdxWGZ6ZGx1WjlQdm1zVzQzVGZCa3h4WGtLZDB6QWJu?=
 =?utf-8?B?dVlCazNaM0VGRCttRkozS2hQWlp5ZXlHN3Zkck1DUUg1d1FuRE5vSGVqVGRa?=
 =?utf-8?B?eFQrVVpORk1hMEFSZHRsbUU0Y0RTbjlIYmx4elpEeVRaYlk4OVpBcmxZTTdn?=
 =?utf-8?B?bjhjTlBkck9BMEhVdGF4aENRckJxWS9IQTdTcWVoWE9JWEVDRy82bDhONDcw?=
 =?utf-8?B?SkFLYXRpNnZKOWdaUE11VUpLWUkzTlJYbjNncDY5ZEJFWWpnMU85RFlEaGdr?=
 =?utf-8?B?UzkwQ1hoblZzMzFGbGNEWS9WUURKNE1BZy92VVprcWhvOTJqOEhBbG9GdU41?=
 =?utf-8?B?NllkbE5Qd2dNek9kY3lZNHg0SXlWOTREK1V5UCtzSytxL0FaKzYwZHg1WUZY?=
 =?utf-8?B?bnRLbWNFT2pYeEhMUHhVT0pESmg1LzdZVjVBWnN6Sk9CeFArQzQyZEpHb3B6?=
 =?utf-8?B?VzFHbFJqam51MHdUZ2J5d05Pd05MY2UyamxsTElCc2xZL3RKaTN2bzJ3VUZy?=
 =?utf-8?B?bGVuVnpxMGp4cXhsS1ErTlRXanYwTk5Jb0ROVFAvK0Q5VmJBQUhKanZmQUl5?=
 =?utf-8?B?NU4zU1FzcTZ5bDB5QWc2ekNZMlVzQWcybUIyb1kvNDdDWGkxRDF3ZDZPR2Jn?=
 =?utf-8?B?cjFNd21qS1pmK3Arb2QrL3BvRmY2NDJvbng0d2s4RVY4cUFPNGhrT2ZGWTJD?=
 =?utf-8?B?SWtxK2E5azc0OFlnb1ZtYytOdjJwR1g4Wk1jQVNJUVRmUUpKWWNFcUt4VTZ5?=
 =?utf-8?B?Y2lDY2QycWdzc3owaGZkdVE4YWlqc21GM1dQbmV1UGtaWFArdk9oSXdHU3ZQ?=
 =?utf-8?B?YW1xcmdDSWdJaG9ndEVHMHBpdEg5U1pmWXdPWC91ZllMRWVqVzhma2FMVFlC?=
 =?utf-8?B?VGF6OWJxRTFtUTRPZ0lwQjBMU3FVZnJtRWlsQ3o1YnZxOTFsOGdoaGFwVi9s?=
 =?utf-8?B?S2dUc3FSa1gzc0Q3S3pDNWo3NmRXbWtJYTk3d0FWcW5peURwN3BTNmxvcFVK?=
 =?utf-8?B?QjdzTjgxVHd1NWF2Q3JaWmJFWXRoV3JocEpEQnBRSzEzbU5zd0RLeS9OSXUw?=
 =?utf-8?B?RjJtalNSdWM1bGZSOUdrSEZ6by8rblpaMUtKUlNrUkJVcmFkeXFCMDZhU0VG?=
 =?utf-8?B?QnBDWlV0N05IV0RvQlV4dStETmJ6Rk5NcmMvUEpqYll4enNBbTM0VlcxN1hS?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db830ed9-4656-44b1-dad6-08dc391110cc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:27:44.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNhvQVuqb4WEIbchvAagpPZLNgqfTLvyLXKG3r7S7/zZ/XLI4mOA0gqVnkzr7/YSrUQlbABCh8NX6U16WUEzE7gmAq5CVKUhkemQhYF44g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
X-Proofpoint-GUID: jIeX21YwRxHdgkyjj0gN37F3LHYeiz6F
X-Proofpoint-ORIG-GUID: E1LrfE6lxLqgiYonWyBFQEXA4I5pdQRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=954 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196427


On 2/29/24 18:09, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 29 Feb 2024 at 11:00, Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>
>> And also i met a problem, most of cases are comparing test log with
>> pre-test log from maintainer as the test result that line
>> number/space/path/new line is produced causes diff failed,
>>
>> but in fact they are not a real test failure, the result still need to
>> verify by manual, seems cannot do the automation test, any suggestion on
>> that?
> All of this seems to indicate that the bash test suite is not meant
> for independent execution, and is only intended for bash maintainers.
> Perhaps you should clarify this with them first, and then also point
> out specific problems you are facing. Basically, engage with bash
> upstream, and see if they're interested in helping you to improve
> tests to the point where we can re-enable them. If there's no such
> interest, we shouldn't have to continuously add fixes and workarounds.
>
> Whether the whole effort is worth your time is a question I leave for
> you to answer :)

Aha, thanks for your information :)

Yes, from the result, it seems only intended for bash maintainers and 
not fit for other automation yet.

I think firstly i need to check the history of bash maillist to see 
whether others sent this topic and the result of discussion on that.


Thanks :D


Br,

Xiangyu


>
> Alex

