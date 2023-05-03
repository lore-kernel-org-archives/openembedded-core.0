Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CC0C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 19:33:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30340.1683142416788787665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 12:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=C81FRqLp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=448760842c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 343Ddu1q023739
	for <openembedded-core@lists.openembedded.org>; Wed, 3 May 2023 19:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=9y1O2o9eAjcMaZN/ToMZc64p/aO0PFdEKjwr1OYYK0s=;
 b=C81FRqLpDTpF56WLYGAHfe1MRqfYASDEONxgQHeNwDbCB4kdMaRR09kJD5UnnU36iNkc
 iXRtIqato0QE5Dv8nqTwHeYHqnCFRi0KWu6sWOPVo8K8d/NqySg2LFuqCvlsn1ldOxRC
 vRXosz1SyFM3FdbNnZNiRAbZZWRKYntzRuE7z6GCKNDeU2FAUCYDCotPC2wzwY4P21Nc
 i/Ffrcss1FOFfTp1K7ndUTymTJhC6RjrFDeBkwTgdHdZ3E0XeNbLRkM3HB94581aDloW
 PypbCCNp0XAcg60MSUX8oZsIFARXFJzN8VvzeIxWLgDAipcWsjezktwPsFQCOhXSF0uD iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3c67w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 19:33:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 343JXZRp024478
	for <openembedded-core@lists.openembedded.org>; Wed, 3 May 2023 19:33:35 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3c67v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 May 2023 19:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW1r/AGMfGIro94kVXvOyO/J6foR7hOZlbTbaq/HeXrzoWabmsqTdeLRYNY+ga78PF/i/O/FtPh9eQhlT9Pl/w5Gs4uaBl4JjPqZetojzGZHns0MfgVMeGnD+9YXiR7NzDdctW78Eosr/JHYvX243zNXbrKlg/elQ+xAkJU0KZxAxr7V2JzmQceLCgFth9ggYxN+YgQx85QOtsIuyHXe6qV+fOPOfAH668b2o9tyb7BGRMm4vv0VEjm21XOnYrfDczHXSMFaAj/OVvYWVFZ8MoCmzEqpQQYid2xQHu4hrEtcXk8ObH3735kV/uzyjGF5gwEpXYFTKZN+kefypF927A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y1O2o9eAjcMaZN/ToMZc64p/aO0PFdEKjwr1OYYK0s=;
 b=Q9QbEKQHz2HFtuYynn9oSUyBrQ7kFCl9Z96MJ+/LuEChbupsNyCNsdejnacmedyVq9zkdmioj6AzNiXKGeYnqs79NaWB4goCOmcjfO3Oa/yMWdmjhs19ENxlnhVN4OrF9WVqnf9LP692ofv7EXitwQ4HDfhDhkXJ1Xkk/b96MOP7w01Jj7DlXp01BVRGwaPJN6pG++cSzYPkc+66X3J9bNCK6RnfurcN64kw5U3GcP61I+j7RtpOxQB8z4mKYw9e14Tolr5ObZKflziVQtn72268GHW0EfqfSh/ni4F1ePfRNxulPAVe8339KNbFEfX6pQ/ZnXECzQT9K1xreyEldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Wed, 3 May
 2023 19:33:31 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab%3]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 19:33:31 +0000
Content-Type: multipart/alternative;
 boundary="------------giMryYXXpRFgAU70xfbg3ori"
Message-ID: <990b6199-2fa9-0a72-9daa-f3816253b944@windriver.com>
Date: Wed, 3 May 2023 15:33:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [AUH] rust: upgrading to 1.69.0 FAILED -> Sundeep to do the
 update.
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Alex Kiernan <alex.kiernan@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com>
 <ad51e892-f8cb-adf9-b958-1e2cad618015@windriver.com>
 <CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4d2124-228a-46c2-2184-08db4c0d46d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USgGp3DHLN7FcQyHMyFnhY/YnqxC5YRgTqeLd95JBuYPNSN9xMrsTs1x7XRBSke7Y4TesIQ8FomIseUeacEh1HSdx+BaVoZi4h2axZX1YYDNve1nPTqm5tovU3u8DgJciJkVzGsoOyOVMJKUI04r2YfDj4kjwA6yo+s4Zcbj8vcEQB3wCQ9tRsooYT70J1sn16eHgF0u+yuX8QOrRpS8c+kc2fCP9IF1Rjkp94vHutghNat/tX8oNsuBRM4xMlGkRUZtCZllf6brUR6uZmwnkpfG+CkYC+e+uPZcAFHkZ5DpciMkYWpvoVOyZhcoAi4yP2XgcnpvVC2mRMX74bS0jx+RmiYPA3LrxIufes23wKfPnITCOfThQuCM/WXEUif9aC8eL7B32kTkgeG7d8tcWm/ocKeT71Z/ETaC3rsysXgwXtB3MuGZeNbkVeJOC8DbIEJs9dlVWjywyvOns3zuGJecM8V583CbHmp2wiOEGJdiIi7HC9GGFhqJlP9m6Gm7mPvOJHivtOdc8MYUNEaNnCp49tQy5AulTDgAsoaTOKhjIyb5UVTgmLSln3YnuFgjADN8xxfA901N/n1ujv2puJexJK1AcXndSGUqZDUsy0hKi8mhQmskynjagFg+jrdstWLTISHPPdPTqUSR1eOvBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(451199021)(2906002)(15650500001)(38100700002)(5660300002)(8936002)(31696002)(8676002)(36756003)(86362001)(2616005)(6666004)(478600001)(110136005)(316002)(6512007)(6506007)(26005)(31686004)(6486002)(83380400001)(186003)(33964004)(66946007)(66556008)(66476007)(4326008)(53546011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHdsbzNkenlYTzUzbFlBTm03bFBEM2tBQ1BKc0ZoOXgza0RmdjRkTGYvRFV2?=
 =?utf-8?B?SU5wc0oxRnhtNkVGWXh5anhXTzBuYjhTcENpSzQrRXF3ejRBZnNwc24wR2sy?=
 =?utf-8?B?NFV3NnM0aWFGak1WcC83R1docXpEZ25LK29weUdMSUw2TnRLWG5BVys5d1J5?=
 =?utf-8?B?WWIvRDlxbnpBTTZlcFd1YUxPSmdhVFdEV24yMHMxVFlzWnAwdkRHcUlvMHow?=
 =?utf-8?B?QWU1ZDh1U2IrWDN2OVVDQnpjQmNzY2I3ckdSNE1yRlJkazRmY2E3YlBOK3p3?=
 =?utf-8?B?U3BnQVFrenBCWDJjZ0x6MlA2T3BSZGFUN0doUTFDSWVDQnJSRHNQU1U0b1hN?=
 =?utf-8?B?SEFxWEN4TkltNGZ6ZXZhb0xWUW9RTXFWTlhsRkhpeFVmSkVZL2E1YkNIS2RZ?=
 =?utf-8?B?OXdsNVJkM1JaT25maEdlaklNTnozdjJuaUg4VStlYXpEVjdjNGI1M01NN1Zk?=
 =?utf-8?B?SFQ1eDEraUcrbGFCS0Ywa0lvTzZkM0dOZGhXUW9Xam82REw0dVRSa21GRHdI?=
 =?utf-8?B?aEFIaVRSaVExQnRvSTNuMEpTWGM0a3hVVUdRRnJNSm53YXNvbXYrNWdQejlq?=
 =?utf-8?B?NHQ3dkI5cS9laThyQk4vYlhFMVBzd29wZGdKTzZqQkpEUGh1WlZQcWcvSndC?=
 =?utf-8?B?WHA2QXJJTkNVV0NxWEhiWVFjSlNaR01xY1hhSk5Kd2JYL3FVZVpOQXJ0Yisx?=
 =?utf-8?B?bXhnSFhVMnA1RTFraDUvVHlWWGJNQjUvdGZZaHBuV2ZjTVowM2Jtb241WnE1?=
 =?utf-8?B?czlmdGY1VE1yengvbHpmNVJCTUIreS9KSkFnRWt3bXVsNUxUQmRxWG9hemUv?=
 =?utf-8?B?NU04eGxiSWFOOHNqWDluK2ZHWUxHc2wrb0J2dzJ1anhXWWFneDJWNnNrekQy?=
 =?utf-8?B?MFI3Y3d3VTBhVGN5TXlRdjZCWVF5bzJFRTlYZzhhN250K0JGWGZSV0RhRU5j?=
 =?utf-8?B?NG9KMndTQ2hBVTVvMWt3dkhVcXJsRHZLWlFLSEQ3ZUw3R1dTanBDdy93b0dH?=
 =?utf-8?B?QlU4VDBRTjI3bHYvTlE5NUlFZ28yV0Z5dmc2Nm4vdFhpbnRFZU4rV1B2TXAw?=
 =?utf-8?B?T0NKUnVUZE40LzNUNXNNOEhYenh4TmdzQlFqQzBueDZncjYxMENoS1RIN1Nm?=
 =?utf-8?B?NGZ2OGoyVDF1REZ0cnNudXhwWWNBcWp4K01WQW1nN0ZoeTAxQlNoZUE2UTB0?=
 =?utf-8?B?b0ZCWWRiYkhKODhuZnBobFJDUGRnUi9qZE81K3R3Y1ZFVWVIY2tsZXcxTXMx?=
 =?utf-8?B?WDgzTEYyUzcrNEU2WHJIUU9tTmtEc2c3alBrMmQxQlgyNHN0bFBDS01wczRP?=
 =?utf-8?B?b0pJamdoTlNLUVIrUmhMZTdTTzNtbnozTi9SOVhjdWpLR05SV3RaZU10d0dM?=
 =?utf-8?B?QmUvaTdCeFQrV2doMWcrRFRyQ0RsMVR4QldJK1pPZXlJV2gxaDNtZVBKOFE4?=
 =?utf-8?B?b1JDTjM1c0QySjY4d0RlVWJJR0ZtTmhQZHI4WmxkTWpwZTg2Uy9jMlppdWNV?=
 =?utf-8?B?WjI2eXdTd1cyWFYvcmtpQ0dma2czT2lTSDM5NDVPNk9BdFVNWk1RdmdjQi9i?=
 =?utf-8?B?SDVUeGRYYWFITzU1bFRBV0tsSmx5eDMxcW9OQ005RkhOaU96eGI5a09FTkRk?=
 =?utf-8?B?WnhocElnK1BBSEsrZ3UxeHp5WVdlYnpzekZXRFoyN0pmamdzQWdlRmkxMStK?=
 =?utf-8?B?bGtXbW9nTjcyOUE2dm80bmRzRlI1Q3hqR0RnUmg0Z0VmbU95a1ZuZXQxTy9H?=
 =?utf-8?B?OTJCRXlmR1UrZ0hzTmprN0ErMTBBY05kZGpyNnFBTG84SGJjWEdzR0lrT0o0?=
 =?utf-8?B?S2JaMld0WjZEOUhtL0phUkRmTE5hTkVyMGRRYXIzUjFMbkRKTUVHVjhHcXBk?=
 =?utf-8?B?YTZnWmZ3TkJMeml0N29HZTNsMDJBalVOejZrZWtzRlRCYncyRkxQR3JUUVZL?=
 =?utf-8?B?a3dTRkswMk03RTRNWDR1TG5RS0wrMUJLRjM5dUJJYzNjTlNGUTdPaVBWWUpp?=
 =?utf-8?B?dW1wU045dTBOWDFoaVVxUGxENEs1cVlQam1uREZUcG5KZVl3YjZ1WGVJMTlV?=
 =?utf-8?B?b2YyS2xiaWdrU0dQdGFGTHNxMGlGVFlkSytnaWRWNklBaElWeFpmY3BMRWow?=
 =?utf-8?B?SDhiZHJUOHF6QnBXK21CWEhQYkRkb1locklYN0x5THdYOVBaaUliWng3RGR0?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4d2124-228a-46c2-2184-08db4c0d46d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 19:33:31.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV00sLhbP3FsFfqGp172Jn4Zk0SUq574FkoEWiBmVTadPph9uh/rc34WJqI+HnvMjY480NlcKNPO+aiKBYHOHEKBFNTRQdzqfqLnMUkd3Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
X-Proofpoint-GUID: UQD07lUXwuUO7sz19k3hSQ3Tvn9uFQ1c
X-Proofpoint-ORIG-GUID: ECJ18T3XI18O9KWYmgh7J00_OwfXLTAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_13,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=816 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 19:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180836

--------------giMryYXXpRFgAU70xfbg3ori
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 343Ddu1q023739

On 2023-05-03 03:39, Alexander Kanavin wrote:
> I think Alex Kiernan already sent an update here about a week ago?


Thanks Alex*=C2=A0 ;-)
I should have checked the list.

It's not yet merged to master or master-next; I think it's stuck behind=20
the gcc-13 update
and many other commits that are causing RP and gang more trouble than=20
usual this week.

../Randy


>
> Alex
>
>
> On Wed, 3 May 2023 at 01:29, Randy MacLeod<randy.macleod@windriver.com>=
  wrote:
>> On 2023-05-01 17:25,auh@yoctoproject.org  wrote:
>>
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe *rust* to *1.69.0* ha=
s Failed (devtool error).
>>
>> Detailed error information:
>>
>> The following devtool command failed:  upgrade rust -V 1.69.0
>>
>> Sundeep said that he will start working on this tomorrow unless someon=
e else speaks up
>> about having the update underway. 1.70 isn't due until June 1st or so.
>>
>> ../Randy
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------giMryYXXpRFgAU70xfbg3ori
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-03 03:39, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I think Alex Kiernan already sent an update here about a week ago?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks Alex*&nbsp; ;-)&nbsp; <br>
      I should have checked the list.</p>
    <p>It's not yet merged to master or master-next; I think it's stuck
      behind the gcc-13 update<br>
      and many other commits that are causing RP and gang more trouble
      than usual this week.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex


On Wed, 3 May 2023 at 01:29, Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2023-05-01 17:25, <a class="moz-txt-link-abbreviated" href="mailto:auh@yoctoproject.org">auh@yoctoproject.org</a> wrote:

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.69.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.69.0

Sundeep said that he will start working on this tomorrow unless someone else speaks up
about having the update underway. 1.70 isn't due until June 1st or so.

../Randy

</pre>
      </blockquote>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------giMryYXXpRFgAU70xfbg3ori--

