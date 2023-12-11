Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491C1C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 01:06:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97784.1702256784423039094
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 17:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qbiAIGGS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0eLrL029189
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 17:06:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=9+KR0xyCrO6PeDaxCsp
	vrasdMnNRcG4nkYzQYHtFpJ4=; b=qbiAIGGSeoFLfxaWTsZjHrCWapU6UkEYNcj
	l9Q4jEAg3KDQWXHkYXo/4vsW7bYhD+NqR0IOY8NK8+vEDBFYv9QD78cqEPFvJZM6
	qZ2UH+490JtmQ3aQYWHBjs3EEC45o3AQuQglqoqtfxC8lKI2483IQD8PL/vDNXn0
	nMzBFBQpsXtu04PQSrfv/pjBtq8c1M5kynay4Ut9o4B3oMANX9DGV/uUwFGVsCdJ
	0Xzo1nkU/3HLViwWqPq5lREDmYe4TOIVbCna/jkoLBU7FigZ+U2OeGgmcwbA8oDP
	rC9tCKi2ryCO+TbICXdSq4t74bYNFX+pFCj44MOMWSGtSPrKJ0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvrmkrw7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 17:06:23 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BB14F2a023311
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 17:06:23 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvrmkrw7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Dec 2023 17:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfXvY4oJxK6TvB+/8c35lxPeMsKoToemLRkltYzd/IXRSYEStm5rHBUWl2PJ/Z9TI1zwKD9C7s8/6MmBAAxkp9tAt33psRJdRt3sjwJh4zQwXPDA+aCoJmAKQA+4auf/O8KXPU98JvpberS2s8U6hVOQAlCPqLanp1h17Zw5ZglfGpd5G/pTkbyoqMrBjF6WA21hL/EpXi+6sVJXA69srxybPeotfuQRTiiQQqDjLvTy5mZo2jg5ze1VBc7NbH5DEaAzGqG50J+fPtVpaixaq5E4nxS81Bu45WMFo0ePAKbTzeFC6dwYQLYMMtyxfhO9du5E/ve49dVKqTojP+EvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+KR0xyCrO6PeDaxCspvrasdMnNRcG4nkYzQYHtFpJ4=;
 b=fOF7Ok+rJSzuJ8JJv7Up8M9Zu0+pIdCfDOjlmtj13KXhFWSzVshBdWlYqGVPg2u4hOpqKZStzuITu7JxmMDpHeT9w0CgDe/dLfkNl2LkzRryu2VPiWY0g6sl91Xr3qFdbLoODL8TjDFdzkIfok3OxLkV70LscEum35GRHlOEoqyUmhFMXSehqyObk1f4sZb2GVtNZFEV8KWbwZGUXmDv8YBCGIX0cA9UBjC7mmnVko87+KfHyG++Uasuj92MpF70Bc3z6nBimcPC78NwT2BHXSmph6jQN8p9gj90HZdlrHXepwI8WR5Zyzdkrrb68MiSnP3YpbULbYT0PajOL2T8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 01:06:20 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 01:06:20 +0000
Content-Type: multipart/alternative;
 boundary="------------KVaKWaVOzcidOJjdagNaWHYK"
Message-ID: <bc2babc3-1f32-4180-93a7-fde091684726@windriver.com>
Date: Mon, 11 Dec 2023 09:06:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rpm: workaround to remove dnf lock file
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231208101253.4042712-1-changqing.li@windriver.com>
 <20231208101253.4042712-3-changqing.li@windriver.com>
 <CANNYZj-OuHemaODiLGi+KpUyGCwGF1GvyEjzekRxYjUEOJOzRg@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-OuHemaODiLGi+KpUyGCwGF1GvyEjzekRxYjUEOJOzRg@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0081.apcprd02.prod.outlook.com
 (2603:1096:4:90::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8654d4-0df1-4b1e-f005-08dbf9e562d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OGnDrcKjme/UOwulKUQtQnGM1y9vMj6rFMefgnuN5eojIhSDYyCSKlns+qtk7B6H8brULhcHElChneY6n7oxFQ2nVgA058lqL5e2kDStx8vzBtibg6Wqjp40PBRsduoqyfAnN8qMesDwXjB8RrezOYp9tWSsc8QFiTmHVN8UHXmRBG3jvdTa1l7qq/9/XXQfrHX5hsU8sO0aFYs4Umdm+khcUnk83eV+MAMjEt7DBt52O0tJlOxPIz+EaTxh33oQkmUXbMLZFNHw2n9AHz9QIv6108ycxuK2L2MQ80QPL3xj/g1RMJGEUhHCYcddr7QXYVqj+i30JH18guFnz+q+3ulcvIPe5RiQiMURDbO0bNXZOKeuchh3w2SPZGwzw/d/MN7ovYxczIw49P9NSOusuaYkFskimGRwUtg2sYPP2dKOs67h7hlAmDhl9z/CiQz4Jol2c+BWBO5YG6z5dFzBbYjoZYuKY2ckG9Rf7utwdcA+AxLC+tlxkG3eS+ovJUqcma3HZ9DvBWvhr7qR9hgXK9gDpuAazMRhqiQyn04i+nPJ14TMROf5goHQ+sIUsgWDUr4gAo/ajEFLAQqaGwu0hjOgW4xF5hcmc5cUeFmUSKrJpOLTNIRDoZXHKofF1RimBkz8Sy7QKkkk7rr0m5wBz07iw+PyjWV7DUuJoJwqqe1ju6jtZBjVW/GWgU4SdqDl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39840400004)(396003)(136003)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(6512007)(33964004)(6506007)(53546011)(5660300002)(26005)(2616005)(44832011)(36756003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(31686004)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(316002)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0NtZDh6YmhnVW9zWEtmMUk4QmtHbWNLZ0VzeFZzYVNkdzlycUlidG9OdVdP?=
 =?utf-8?B?NzhFa2QzaUJlQ3FDVXhERW45Z240OXFsTUdYUWdIbWRFQlBRSXRjTjlQcndW?=
 =?utf-8?B?RHhxeFRlQlY1MmNLbFZGQXhOZkZ5eHBxVDB3am9iN244TmFYRkc4NW5wcUNn?=
 =?utf-8?B?YWhpVng5T1Fub1hkaTZxY1A3UWRmdjFZcXU0N3NqMEt2djVEMGZzZ3RZRnNR?=
 =?utf-8?B?K3B1QnFPRDRWQWlrZzNZZHlEY0tNcWNJc3RJcHhYMUkwbllUNHFwdlowTFFF?=
 =?utf-8?B?NjFQSGpwVzFaYlk1WTE4MCs1TDFrVmdjNFd6Q1czdTFaaEVJZkljSWF6TXlD?=
 =?utf-8?B?bFg3aVlRQVRTemlXZ1JLemlIbTNUY1I5anFlNUYrV2NPZDVzQ0FPdXNoZ0tp?=
 =?utf-8?B?ejZ5VXFteGNPU3ZsUHBpQndVM3dVZUoyRFVlRGpWeUtrRFhURDhJZWpQeG5N?=
 =?utf-8?B?d2diUmxzcDJaeUJ0QUg2emtNRlFEV21rQXdiREVlSk54VXNBcGR0aHB4MWY0?=
 =?utf-8?B?UlE4RndPKy9VTzBDdFpjbUd3NEZyMTNUQklpS3dCMjV4Ym9JZ1pZamx1cGZy?=
 =?utf-8?B?NDNUMDlydWFiZGJGVnZ1TVBqQWYwckZOaTlzRWtmRXAvNC9vM1NuekUzWTg3?=
 =?utf-8?B?bzlqK3pxakhyL2NqZE44NENTVjhiYlFtOVczZWlDdmdjTWtNRkU2ZDBEYjJQ?=
 =?utf-8?B?Z2lqM3UzbUhwMllvWkJGcUNnMUE4QVRWL1liMm5OUnZ0a0xIMnFYZ1VXNEJx?=
 =?utf-8?B?RE1jUHBMOGlqaDI0TGF4TnpnL2psMGFSYnl1cXM4YWV1d09JR0c5S2NtVnBB?=
 =?utf-8?B?OGpPTG52UnBJNXFBWjU4MkNXZGRzaDdkaUFmckt0Y1VvOVBwb0VXdzdLYmpi?=
 =?utf-8?B?S0JqRnJ2aXRhZzNVWGZsTVpKYlFaSldxWEFUS0N5ZlFuc20yeVlLWWFhazU1?=
 =?utf-8?B?MkVBVHcxMmFaTENhd0NYVWVsYU81RHZiSlZXWG9TcnpBank5Sngrcm1SZHIx?=
 =?utf-8?B?OFhLWkFsZXJHTDZrVVVLU05BQnBuU3BuSkpGVVMzQnltQjdRcGUxSG1tRGVy?=
 =?utf-8?B?ajRwVWp4dmRhRTRza2ZDd1ZUZXVDQ3hFV3FwYUpES2ZVajdSWjRPSFkzdEph?=
 =?utf-8?B?d0RSRHhycFpHREZ3eXdkLzhZYmlHK29VKzdzQzVGVEtXQk9XMXdxQ1pacVcw?=
 =?utf-8?B?elNBVFdNSFVxNWFmNXByZysxcEoyMHk3Z2pzSlpsRG4rZ3RTRGRKWTVsN1pV?=
 =?utf-8?B?Q092RDV3eWQyMGNPWUcwRkQ5WFRiVmRRSTZscW1OTWM3N3pDL253TmhZQUp3?=
 =?utf-8?B?WWVraWJBSnZFYzBxK3hkMHJDbkhsWGtKMnlKbmRaTFhEb1FkdWFNQ0ZLREp0?=
 =?utf-8?B?OFhmOFVKK1FTcy9wMjlJZnowOEYxNitpOHV2bk80K0xPZTFqVmRWUzBLYXRs?=
 =?utf-8?B?VVR3bU03THl0eC84M1M3MU5OMFptaTdrdGJyQ1RJN3JyWnpEUmNLRzNQQTZL?=
 =?utf-8?B?azNmaUV5R3ZHUlRTa2Y0eWRZMlJpYm52U0pWbjhFblVwb3BxNVlrdzd4MUow?=
 =?utf-8?B?NUZLRXhoNnNPakdsbEEwL05DYno5YkZ3Wkl5Rm9oOHdHR0xOeUUxcGVWQ2tv?=
 =?utf-8?B?dEFyM1lTT2pHbEJEeE1wMmFyY2VLd0tGdyt4VWJMTFp6UW1HTjRRazRvZndM?=
 =?utf-8?B?bGw0Y1k2U0VDWVhROXlXS1UrRU9scVhtVHZKN0tDVEN3a2krNEtwcXR1ZUR3?=
 =?utf-8?B?Z1p5Y0FvR3ErN0lNNVM1MEcvakQzalBLTzc3S1JTYmJJSnNvajk1bEVwck1W?=
 =?utf-8?B?dTd2SjNpcFNtMTQzTU5PaDNJZGlHbGxGTGlnYzdWSnQ4V0VZdWdIOFRobmFR?=
 =?utf-8?B?NUFTWk5qaDRNUVdqTVh6MHplUGpJLzJWWURna3dyTmhoWkI2TFNJNWU1eDFL?=
 =?utf-8?B?d08rdzRnM1FmMGNnMktkSXpLejBpRTRPWGtHb3I3VXZuTlpUdG9qR0UwOVNS?=
 =?utf-8?B?ckNlNlgyMUdkaDU4LzUwaFFRam5OdFpvbnlMVTBSM0NOYkhicGVTaGVUdkVk?=
 =?utf-8?B?QmRHZnE5bzZuWHhYV2E5aUFhbzdMQ29ZQmR1L3kyTXZ0ZmNNR2N4MXlMLy9t?=
 =?utf-8?B?aGZpeThlZExSdWwyakplODVWbFd6QVJKZ3A1ZGt0djdBdHFTTzBLZzZ0TXpm?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8654d4-0df1-4b1e-f005-08dbf9e562d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 01:06:20.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1pxywzn+KqUONg5Fxamobl2IAUx9GMHM/f8INeIj26Idv0jr86p/kdH85aJdOBs9GLNBcJ0J0UuNnGEY1Cuh5DkMkI31bl6Yvkf1uKrNB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-Proofpoint-GUID: PAgbxKDDYyDY2vdmUsrDlFpdiBVTGsxQ
X-Proofpoint-ORIG-GUID: t3lfIUs6nuzBaG4CE70_3s0qHiNJjGZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 01:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192137

--------------KVaKWaVOzcidOJjdagNaWHYK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BB0eLrL029189


On 12/8/23 18:21, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 8 Dec 2023 at 11:13, Changqing Li
> <changqing.li@eng.windriver.com>  wrote:
>> dnf has a bug, refer [1], it cause that log_lock.pid may not removed
>> after dnf exit. And for native dnf, since we change the lock file path
>> to /, it will never be removed, and make the rootfs not clean,refer
>> [2][3].  This patch is a workaround to fix above issue.
>> @@ -420,3 +422,7 @@ class RpmPM(PackageManager):
>>           os.chdir(current_dir)
>>
>>           return tmp_dir
>> +
>> +    def _remove_dnf_lock_file(self):
>> +       if os.path.exists(self.rootfs_dir + "/log_lock.pid")
>> +            os.remove(self.rootfs_dir + "/log_lock.pid")
> Both the description and the code in the patch seem to imply that
> sometimes dnf leaves the lock file behind and sometimes it does not.
> If that is the case, we need to dig deeper into the reasons why.

Yes, sometimes dnf leaves the lock file behind and sometimes it does not.

I think it is related to in which condition this dnf issue can be=20
reproduced. I am not

very clear about the exact reproduce steps now. That's why existence=20
check is added.

Maybe I can take some time to find the step.=C2=A0=C2=A0 And a v2 version=
 will be=20
sent.

//changqing

>
> If that is not the case, please change the removal to be deterministic
> (remove the existence check), so that it produces an error if the lock
> file is not actually left behind by dnf. That way we'll also know when
> upstream resolved the issue, if ever.
>
> Alex
--------------KVaKWaVOzcidOJjdagNaWHYK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/8/23 18:21, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-OuHemaODiLGi+KpUyGCwGF1GvyEjzekRxYjUEOJOzRg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 8 Dec 2023 at 11:13, Changqing Li
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@eng.windriver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">dnf has a bug, refer [1], it cause that log_lock.pid may not removed
after dnf exit. And for native dnf, since we change the lock file path
to /, it will never be removed, and make the rootfs not clean,refer
[2][3].  This patch is a workaround to fix above issue.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -420,3 +422,7 @@ class RpmPM(PackageManager):
         os.chdir(current_dir)

         return tmp_dir
+
+    def _remove_dnf_lock_file(self):
+       if os.path.exists(self.rootfs_dir + &quot;/log_lock.pid&quot;)
+            os.remove(self.rootfs_dir + &quot;/log_lock.pid&quot;)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Both the description and the code in the patch seem to imply that
sometimes dnf leaves the lock file behind and sometimes it does not.
If that is the case, we need to dig deeper into the reasons why.</pre>
    </blockquote>
    <p>Yes,&nbsp; <span style="white-space: pre-wrap">sometimes dnf leaves the lock file behind and sometimes it does not.</span></p>
    <p><span style="white-space: pre-wrap">I think it is related to in which condition this dnf issue can be reproduced. I am not </span></p>
    <p><span style="white-space: pre-wrap">very clear about the exact reproduce steps now.  That's why </span><span style="white-space: pre-wrap">existence check is added.</span></p>
    <p>Maybe I can take some time to find the step.&nbsp;&nbsp; And a v2 version
      will be sent.</p>
    <p>//changqing<br>
    </p>
    <p><span style="white-space: pre-wrap"></span></p>
    <blockquote type="cite" cite="mid:CANNYZj-OuHemaODiLGi+KpUyGCwGF1GvyEjzekRxYjUEOJOzRg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

If that is not the case, please change the removal to be deterministic
(remove the existence check), so that it produces an error if the lock
file is not actually left behind by dnf. That way we'll also know when
upstream resolved the issue, if ever.

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------KVaKWaVOzcidOJjdagNaWHYK--

