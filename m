Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675E8C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:12:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2587.1676365966356992449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 01:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MP0hiUrG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E7PAov009347
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:12:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xeFBI0N7ERH8BQVksI9QVSr31kr1TnOCeXy0PsJZJew=;
 b=MP0hiUrGhFp/u9R2iqPYXnLj2LvLsc+SmTwOJy9OtLUqa+O/nYInIevlaBHISpg+N1H9
 EbekFbDmjiEza5djApGAZNkikFIVasYWncm9dSffb83MwRixKYGQ9n+K2zVQRllG0wZ/
 RlGH9uxH7UUR45aowyyrQVM9jm4r+P3t8ybdT8O9B00Mo4h2qHSUC4RSZLmkbu5N8u48
 DlBmogJM7ivQOeAP5GIowDDMbtxz3POjXg2/WZXsDJImZcxppQeZyut78yD/5KJfdL5j
 Jhp7y6mTT9Cbp6eKmcOcXnViLdnjzF75oE/zTF0k7u+x/Ul3NDIBHoviG0ZO5vKEVaW7 cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768aa5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:12:45 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31E9Cjkm003811
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:12:45 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768aa5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 01:12:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTAXdEa58ur/tajLgSnNOBHZ4pYBmZykvcQEj252pCn2CuxCHY1SV9uLN9kdFNW/4sw3WbCwJUeLbk5a7QkKqbu8xDKJ4duOwqJk5nW2nzh/vqN4y/I4zGG/8iMx48pfQtWvksd3EhPrgHyvmqPqpfVnJNT6pvW0mgnjOgehXeFNxBOgvBHTFAxfX84RaBkfAv0QOMxbUu+Iw45aLq/AgWScQwomPMw4+5XBQPT3EVJVtNLp3I9Y9hnjAO2CiYsrCzBaEgMG0vQYhYV/CcktfISRJi3tIgBe4C4tQV0QiOWLb9748TuNOUPg9KVEpnYJR6/Qi6TM96xJWGl1+0IYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeFBI0N7ERH8BQVksI9QVSr31kr1TnOCeXy0PsJZJew=;
 b=VnSoQUaiZNetCX8jS/leckzK89eumRx5rC6RlagTMDky57V6BHW0zbPQeyrVvV20Wz9cWsOqfSbPk0aS4RmLkzIStDlf5pAwmTvVJtB2YfFDlViyy+rIxjKk+gTjpEDiGboRixRll/0IbnnRIZ+uqkGmDvGBl1A4gRwic47IjY+2rYrrS6/feAhnBbom3HwvGwcfJcc6mi62P8yJ0X3BFRhxHDS0q8zlkO8T6ezQAX6RKTXXFzB0XVPeXFzZnQKGg+G3uZ4K397+8yL0DT1+fWrWN+lvPu2J1fw+qmKaFbSwNCzzBjlvOG+PHo+Ne5+tI7bHPlyzRUzfun71j0mUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 09:12:42 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:12:42 +0000
Message-ID: <4e074d0e-a609-9c16-d11c-0cc285c16216@windriver.com>
Date: Tue, 14 Feb 2023 17:12:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [OE-core] [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it
 is not defined
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1676363203.git.liezhi.yang@windriver.com>
 <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
 <ff0ea75fcce5de13f380fb9fa3abaa80d1cb2506.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <ff0ea75fcce5de13f380fb9fa3abaa80d1cb2506.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: e412e0a1-165a-4e5d-8f34-08db0e6ba040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VQvn2n2Pq6EOkbbMQdGmqVxDFd6gI/wS1iGABwHHKYqEbaTFXaRWKKotGGj1g1uRWhMtyul97FAD2Qio3jYFP4ZU1TDAafuQB5hmM6xs8mXM9HPZ/rFK+EMgLsso392tIZ9LIO45Bc/gSix3ebO/Wa+D3UqNloQq7/XCPu3hEg4DLpnDOHjaWWwevI0HH1yPLFwKoQoRlmZ9pb8EAe02cbl+sTx3YjjDfwDGWoWCGR3yQ0qJOl6f/dSCEyvWq4Or1d3qk/x2EZalk5s79GN9/rX3MY+liN6y/nJYo58mExEhsgPYobgSXy4mPfj8qrZ9C6i2oOTob0YCZtdpDmItt4fjjEM8lAGC9KZMqqH4fNUY3fE9/xHOuBreNY2Jpp3WhutRtjTcWbQPLJ3cSvq4fVACstO0yggXOgJo7h63dsjsU3UG3xjE8RR8esFG+U73by+r5zG6LVu7bOBd9ku2WG7CtpP6qRJutUjMh7Y/9C9LVaFQ+2WbqwjWqn6rpWwo0dKqEOIY9sp3jQr+ThydjKLAlwFv+k0v/VnvP4cbI1+2eJp3WR8tLOGHXxQ+48JqMqSu1bwk0IsFfLRZ60t/fBIdk8PNyEA9uvqZbQDJXi9BP7J+U6ffQFBo9S4y71uvFwLCAtZhhu7j84QsucU4dy2yTfK9/0lSu9Jv5HYa+DrzUUE5CcSybif3qxsRaF9J0j3hMeg0oDMxL+w9OKu8YK9eqzebNQB2Z2WOXgr0GYTTAZQ1hHp1Qcc0Bc5LniaZn4PTnbwrOEHEf7YbvVwQX3RzhwMZ6iNGg1770x1NxDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199018)(31686004)(36756003)(6666004)(110136005)(316002)(83380400001)(6512007)(26005)(186003)(6506007)(53546011)(2616005)(2906002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(31696002)(86362001)(66556008)(4326008)(8676002)(66476007)(41300700001)(66946007)(9126006)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZllpS09RbDh1LzFDMEk2NUhjWFNTb0pUQ3VRMEpSUER5aVJEV1FlU3crZFA5?=
 =?utf-8?B?enIyY21PZjVKZnlFZVRrakt6eDJqUmZIR3RhSCtxNEd1dDQvK1l4ODhiYTVD?=
 =?utf-8?B?L2tSbnBGU0MrZkk4Q2xBdTNoVVlXNXdub3dOYjExdWo2TFdkRUJPMlJ3QWtG?=
 =?utf-8?B?UDU5a2I2NXRhR08wck1sL0RlSThDUlNnV0lVVUVBamNGTTR3U1RTS2o3VDBI?=
 =?utf-8?B?V2JzZkEvalZWQ0M0M3k5bHhaamFhU3VFK29kM2pqL0dZclNEQktOY01SVENH?=
 =?utf-8?B?anVBb0VZQkxWZmhRS2hPU3RsWmNJSjBmVlNsQWJuZ3ZpWi80ekw3eC9nS1ky?=
 =?utf-8?B?SlRua2gxdDMrMkl2dlNWbndTV1plaU4wbDMrMnJOS2JrVzRpOC91T0RNUU5j?=
 =?utf-8?B?QU11NWRMMTFRL3drdG5HckJlc21ISVlRNCtkRkh2UmVmMVhFNEdlUFJzcXJ1?=
 =?utf-8?B?VGkxR0R5ZHA3Z0dsTDI3U0MvbUp3L1RWaDVKQnE1ZlpUV0gwUVhJYmlKakZW?=
 =?utf-8?B?dGplQTF5TVRtV2ZnaDZTT05SWGNubXN1aStMbnN0aldBTWFSTENnMUxqTUhh?=
 =?utf-8?B?VktsWkYxaVN2OHF1c1FCd1BPRjBnMlo5cXYxcEEyVktJT2hka3ovR01hZ2Nn?=
 =?utf-8?B?VVR5U0JEcUVnVkhOZ0tsU2JyTGNrbkN0Q1QvZi9RUmxubWUwQ3o5dlVNdUFL?=
 =?utf-8?B?bmd2NHVaeTEyVTBuajM5c2xHSXJUTnpseUJwcUlsN1RScDhvUmQycDNwbWV6?=
 =?utf-8?B?eGk1L0FGb2FKdlYvZDNLS0ZVMDdha2NMbitxSmdTREdPdlFUN3NkNTYzR3ND?=
 =?utf-8?B?Q3NSbExjV0paTjFMclE0SVQ5bERWbmRQQnljTnVOS3lINGZPRWx3aHhsdFJR?=
 =?utf-8?B?djkxNjIxZlNUb0pzNER0b1BGWWFNZzZpeVc0VWI1MlpzNWpxeGN0eEtlUXNJ?=
 =?utf-8?B?ZGsrZmwrWFoxdjNMR1hDeWxxeURaY3lwNUc5WjVqNGpSWStlZGZXRVcwcEky?=
 =?utf-8?B?d3FsYlhWUmdsdE1xdUZ6S1FFUzRDTjNJWlM3RFh3OUxmSGp1eTVyb3pNUGVh?=
 =?utf-8?B?akxJZ1lmd1Z1MnpRZXBIdUxtVVVRS0M3RkJ0MzJTOVBEa0tXbEluZnpzSFh3?=
 =?utf-8?B?WDlCS0QyZklReERTU0Q4N0djVGtPWVdtblRXNWpsZTFVak5kS3hyN1JuMkd0?=
 =?utf-8?B?YktlUExkVUQrYzhGckdqdjdTZE9uSGZOVk1udEZiQlJiTHBHRFYzbHoxV215?=
 =?utf-8?B?bTY1YTltSDBucUd4M0ttNVIyWDdtMEhkNmVtK2VnQ0VMN2lrZktrMmFQUElR?=
 =?utf-8?B?MWFxNUdBZU1zTmYyczBmZ1RNRER4QWlpZWpIcXpnaENqdytkWlh3NlZPRVFq?=
 =?utf-8?B?cnZWT0hEdG8weUo4amZsVHlNZzdKQ2ptUFFZaDJjWlV2TDYwazNQR015cEtl?=
 =?utf-8?B?L1d5ZFo1K29HanNWL0VOZlFXWFNZOVJ3ZmZRWXBuQnAxY2t5QXR6U0UzQ0dP?=
 =?utf-8?B?cEZ0Tkp1bWVtRUsvamhxLzlES3ZoWCtsOGt3ajlvRlZSNGR5M1VpbUZWWVVz?=
 =?utf-8?B?aTlrb09VL00rNkpiWk5GVklaOTRVMm9CbzljaFR2aG5hb1pnSHRRaW0wd3ZY?=
 =?utf-8?B?d0tkdmxqVDNGZlBwZnUzOWp4MFBZUlN2S1hvM2o0QVhlVzdsWnppOWpZd01U?=
 =?utf-8?B?U1JaWUZuRmNFVWZRT2RJQVZsU2tQTEtWb3JQbHVkcUNZOGtwQ0RBNXdVd2V4?=
 =?utf-8?B?Z0h6LzBncS9zdEZWVFFGYm52Sm15ZEZsN1hsUDkzR1pzeTdBWFZxdm44UGJW?=
 =?utf-8?B?R2V0TmJGWWtlN1VlNDg1K0luS0lDVTQ4UnpxdkhHbDVCa3dQejZoQkNnSWVX?=
 =?utf-8?B?UjFsSTNiN05RVjlJeEJ2Z01sSVhteHNleFlSQTh1Rk9sMFZIamt5a1I2TElI?=
 =?utf-8?B?U0J1M1VJMTN2Y09DZ0grN1I1YnlHd0FZeHZocmNlZExGRWU1eTlRUTAxVmty?=
 =?utf-8?B?WE16UXRkNzdCdDZEOVNIYjNjQlloS05HemtVNlNmZlFzUHhPMDl5M1lpc0xJ?=
 =?utf-8?B?aW44Y29qMllzcEErRERRbm52Nko0eXpTekRYdlRNaHRvR3ZERXhDVzhJeTRi?=
 =?utf-8?B?R1B2NVFIS2FQbElvc3g2UjZVc0h2Q0J0anZ0WC9TcndlUXZqWk5PQ3VtVzdp?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e412e0a1-165a-4e5d-8f34-08db0e6ba040
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:12:41.8588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFAslJwgu3Cd4i9rrRD4U9QBRE9qLvX0kPCzPmxqul5q5BKj3r0Wj78SGcd9a5lgOy8YqM2ucsIHQGovmHOa42aO+ybojlCJ1kiXRPZv+Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-Proofpoint-ORIG-GUID: 5odk05MM2xGrUxJSTAuqBDW5DYLtyLk_
X-Proofpoint-GUID: durIsOioF3JVjydZ6s9v-6B8f27VLBrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=997 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177134

Hi RP and Alexander,

On 2/14/23 16:47, Richard Purdie wrote:
> On Tue, 2023-02-14 at 00:28 -0800, Robert Yang wrote:
>> The PACKAGE_FEED_ARCHS is highly related to ALL_MULTILIB_PACKAGE_ARCHS, set it
>> automatically is better than manually, for example, we may forget to upgrade
>> PACKAGE_FEED_ARCHS when ALL_MULTILIB_PACKAGE_ARCHS is changed if set it
>> manually.
>>
>> The workflow is:
>> Use PACKAGE_FEED_ARCHS if it is defined, if not, check DEPLOY_DIR_XXX/<arch>, add
>> <arch> to PACKAGE_FEED_ARCHS if it exists.
> 
> This says what the code does, which I can see from the patch. What this
> doesn't say is *why*.
> 
> What issue is this change needed for? When would we currently need to
> set these things manually?

This is used for online package feeds (When PACKAGE_FEED_URIS is set), the
default PACKAGE_FEED_ARCHS is None, so "dnf install/upgrade" or "apt-get update"
doesn't work by default, we must set PACKAGE_FEED_ARCHS to make it work, but
it's hard to maintain PACKAGE_FEED_ARCHS manually since we can't add more/less 
archs:

1) When add less archs in PACKAGE_FEED_ARCHS, "dnf update" can't find the missed 
packages.

2) When add more archs in PACKAGE_FEED_ARCHS, "dnf upgrade" will report
"can't find package feed" errors.

We must set the accurate package feed archs to make it work correctly, but
different builds may have different values since recipes can set PACKAGE_ARCH.
Set it automatically (when not set manually) can make it work smoothly.

> 
> The multilib variables are not really meant to be used in generic code
> and the multilib classes are meant to to be getting in the way like
> this. Does this mean multilib is not setting up something correctly?

No, multilib works correctly, I just use it find archs in DEPLOY_DIR.

// Robert

> 
> Cheers,
> 
> Richard

