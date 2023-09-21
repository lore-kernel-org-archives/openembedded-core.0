Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F53CD495A
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 06:00:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9729.1695276045761575415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 23:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=reVLldsf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=762864786e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38L4KvqS031910
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 23:00:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=wCsIy/WfRZKij7wRGzb5JR69XsL+/51qlrsJIRL9srM=; b=
	reVLldsfR0sSU6qpV8hHCEFgOzptxtIG2lQYRUpbMFQCFTfjBZjJU1wqKelDhUh1
	dVN1/0Ip6E4PbzHBqesaFg67kLIZspZ+Xc2nPJPkHDv8K3TtDuSNnxHUxeE+k4+F
	vPnXBvBgZULUQrkwoQf9LZwktt+8jALFvhzwMsDn4XOeMAH6bQ86e0Uw1CpAQNt7
	RUDSRIgQCtx88z5AghSuIO7kZPBI4M1gfq8C9+ghgJ73hE6jUGvfMiXwYZmSdoQV
	Vt/nCy0xSqZpyseuY6e1MXmYdrEX5SqNhGjhoWV2Z18bsoITYR+pM09GjFbNQ4iG
	y9WSJsahh4alxTSxeZqIig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t57n0v4rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 23:00:45 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38L5voBX007438
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 23:00:44 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t57n0v4rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 23:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiqsRU90q8QON/CSRAz5xf3ZiRU3z94GK74WWPeQVTmmb5ifluAOr0r0oObjMefpfNMKzX8HQVQPbzluWKi8AzdS5hz0diSmwJOS8Xz0/9RG4CV80Ucl044Dje2PUe70i6Qurdll4Ht7njnsezf/XgVD5ALEBx3N9ZqGLJch4fSu2fe/Os9WXit6pvT5DnWVZxP1TZlk6Rjm9Ztfbt3hpiv13mn8tKJtxRSEFBkcB4oU08DQATOygJUu/gf4VbIuQwQQ1WfHdtsfpEaCge8PI+K2OirbVzYU/d9sYqWzSavS5525Yd8JnQOhtvE3cRjM6W6OlhKkJDWpPOc3IX4P/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCsIy/WfRZKij7wRGzb5JR69XsL+/51qlrsJIRL9srM=;
 b=dihX0h+JIJn7cV3LarW6jAgM4hlTjJjTQwYKva0cidXJ9plQ4MM45gDXyC7sgCx7xWfY+HeCKzOe/fqE3HLlpd5SzROhBm6pOsikn0z7mSK9APQjBQAofJqh1WYxi7M1fK/e11XfJ035MstHatyJ9dIuakxeGiaKdJKR6bAvLrL0MZY4mdEGwnOhb8++usV9vv6guqycKZYaxgRA0VlqLHynEMtc2+ZN4qG9YHsr43NWJo9q24NrOjXTKScU+3dMxRuIKXvb6vOl5KP4qIpWjEAk1DlBPjCzY2W/gTviG//tHtPYNmUbT8vI2AXupvPOvR7/VfYDUgSev7a0kjAhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.41; Thu, 21 Sep 2023 06:00:41 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a%5]) with mapi id 15.20.6792.024; Thu, 21 Sep 2023
 06:00:41 +0000
Message-ID: <ceb175fb-1c54-9a7c-99f3-1ca77a480ce5@windriver.com>
Date: Thu, 21 Sep 2023 14:00:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] adwaita-icon-theme: 43 -> 45.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230921051435.1234043-1-kai.kang@windriver.com>
 <CANNYZj-zpfLCd-7W6LMf-PhOTRWZnCq_gGCMtNf-UT6r1ox1Gw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CANNYZj-zpfLCd-7W6LMf-PhOTRWZnCq_gGCMtNf-UT6r1ox1Gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e33ad4-10b6-4dba-ecdb-08dbba6815d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WnN4bEL69VWj8w6O8zwelM7dqNP+gmXQZDSj0Dxjw0Rp4nl5P2EjA1qYJskHgdOWE8XVf7xXwWr9SnAfbsbtTZcjgG5vBhDyWsANMgbngJt2gm+4+E16d4LveFSq81uGZrL7Uj4GjSZGuY5/SqlyxWNEIQMwEtkhI6LpeFR9HRpxEaVdIa+dXRfElxYjsBO7b9UBBkQIO+InZhDqX1DYDPV74sFxZ63NO2A3viu/sq+v7flWLSJQwtjlA/j9SWmhvl5M+g8HMccRDPvUhiBaosLKl69bymSksNfBvUi0qVbJFt9fn9OXzdRdJcOu+Lz5y0bguoIXixEsFKhV+fOI3Tk1Dr8PPvBtrntVi8sSqhYryoW9fiRXtD+T6S94AZo5MbajV2ggOQiimkXxPj4nDqKntGjurhb4QFVYqBn4j9eOEmu4ajEcV1sbmbBCw4F1+FKRydtW98nJeMAr0r1FryhRtnVYhibLGauPCv+SIAlWEZUbiNQjOvrn4D4WQMTyVGKQ5DBBR2xFMfhZ0Br2PtnCi+2jvmybaicfaf3ZCFKotXOsREQXp8Gco1tImTxuf/x86HG5MAh4mECCEmEyFFoIZBI8Gc+tw2YJjOn4Y3F64mq9DYk+iRyUnNZOPYwj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199024)(186009)(1800799009)(2906002)(5660300002)(6506007)(53546011)(6486002)(6666004)(8936002)(31696002)(4326008)(31686004)(83380400001)(86362001)(4744005)(8676002)(41300700001)(26005)(66556008)(110136005)(6512007)(38100700002)(66946007)(478600001)(966005)(36756003)(2616005)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a21MM1JDbzRodnlkR24vSHo4S1F6ZFNXaWsvb2VLWUhWclVlV2FUNGRBNTdX?=
 =?utf-8?B?aFdub01CbmhodURJbXpRbVJCRXpFa0FWc3pqWmcxUkNwVjFucUFkL1l3TUNv?=
 =?utf-8?B?RzV4K2VWOWF1dUdoWVU2b2VpVmZJanplT3dpeHk4M2tGdUwvU0tsNjc3Z3dx?=
 =?utf-8?B?ZDVTTzJvZ2ticEFlTmVKcnFWRnJEUEIvMWF0VXBXTmp3bzk1K2JNMUZiaUUy?=
 =?utf-8?B?S2JrV2pObDdsUE5rYVoxQ0xXajdJbWVSUU4wa3A2eGd1dHdXdldPTWZ5c0Vw?=
 =?utf-8?B?QmhGdXpQemZ2UmRtays1SWVhZHUxSEMrNlVydStLSlN0UmVxK3FnNmp1NVBt?=
 =?utf-8?B?TXNFd1l0cW1KYnNqa3VDL1h1emlKbWlmcEJyTmRSNW5LazMwUDFTNFNlb3F0?=
 =?utf-8?B?Y2tudUhKeFpJM29oUk5uY0dTekJodDBBTXdYZUl0NnBLTmRNNFNUZStDNjRm?=
 =?utf-8?B?ejJlTHY0eDd6dnFUWWhaZG14KzFHRitheXg3MXQ1cFJZMTVBUGpDUnVLUlMx?=
 =?utf-8?B?cThIYUlOTVFpT2xGcitQSG41QnZDaU5xL296a3hBeXlzTWdMOTNEZFNQSU54?=
 =?utf-8?B?Um1WWTAwbnRlY1U5cVA4cG5ubmNDNGlKN2c3SjNwaXVVWHFIYlBmY0I2TUsz?=
 =?utf-8?B?eGRkUG9ySEhNTlYvcUY0VGdLeVRzbjR2UjZ6eDhGamw4MjBLcFprVnJDRzUz?=
 =?utf-8?B?aVEvRFpFU0VVaWlmcEFiNXdjeFFobHlZTktNWXdIZ1FQQmd2Z1F6aFFLRVB0?=
 =?utf-8?B?ZWpaelIwdlQxQUdlWjBYMldlMjR0R2xLeFlkWWVYRml3SDZVTS9jNkwvS3Rn?=
 =?utf-8?B?YWlIb2tQb21ZblpFeE1EcEU0Ukxrd003TS8zTU96RTd5TFB2Y1hPYUFNcjNH?=
 =?utf-8?B?SHZuOUNVUUZiS1pINzhWM05DV01xT2xLOTIycmV4bk9FKy9OdFAvUzVjbzI5?=
 =?utf-8?B?NFphZHNRb3UrNUFCYWJpMG04ZW1ISVVEenlFZVFuaFF1Q0VDNjJBZkUvRFVE?=
 =?utf-8?B?ajlJSE1vRk9DaDR1OW1mOUhxZ0Vra1pIaW9qZ0M4ZlNjZGp6M0l0dkFxVXQ3?=
 =?utf-8?B?bWE5UVZKN3QyWkI3eVpCdWxQMGh4ZllHMUpSamJiQXRxTGR6cFhkK3lwcmUx?=
 =?utf-8?B?VkRrRlpRdzRBQ3JLcDBCOHpmcjlTdWN3MjRvd2NmRGNCZTI0N1duMHVYaFVp?=
 =?utf-8?B?b0dPQjFhWnFzVHcrZUVQeVZJMlcxdk1Yc0xzZ2t3S2ZMMWpLeGp3OXRVOUxy?=
 =?utf-8?B?WXg4aytEYityVmdRZEQ1dytxSWRvWXFJZHBUR2FvSEowSnRHdEZJOVkvNFd0?=
 =?utf-8?B?Z0dZQlJ4VG1mZFQxZzhQVFFyWHpxMlVRS09iNTBpTVFQRktMN1pBVjl6cG9W?=
 =?utf-8?B?QWR0OEtHZEEySWVaakx5dWdOTk5PdlFMQjBORmpTRVF1dDQzYTBzYURYUXF4?=
 =?utf-8?B?QXdYUXdoeEVvVE5VOWJIL1lmL2RNazN4RmZhTUFvMFgybWx1UStJWGJGK1o5?=
 =?utf-8?B?OFNoS2JpdS82TzBGcmZSMVpwbkc0RUpuOGJTTmNTUHB3b0lsUkVvVHgyZWRh?=
 =?utf-8?B?N0JtWTEweVVqNWp3TjNPM2JlVEJ5SUU1UGdtNnBCWGlEc2JCQlU0MjJJSXFW?=
 =?utf-8?B?eTJCeFNBZFE4dzhlZUMyczlYVExVejUwMkJUUWd4aXprQU1pMWlTNkVyWEVO?=
 =?utf-8?B?YjdkRDBBSnlUY1JoclpCR0UrWGZZQnJPVERvSXVSL0Zibm5PcnRSQ0xIM2VZ?=
 =?utf-8?B?U1I5OWhSUzY0dmlMV2ZjWStBbFJhTzJUR3ZSeWZvS0xlNGVJVncxeHN2YU5a?=
 =?utf-8?B?UDQ5R3VGWDFoZWE5OWRFaUhTWUNIZVk5Zm1TYVE4MmRtY0lFQk1SZklEaCt4?=
 =?utf-8?B?SExIWERvWUxEc2FtSTlKTm5XYk9wV1FQRDMrSVVpT2h1TmdPVTdHSHYrVnhz?=
 =?utf-8?B?VS9KTUdqZ25zeXdHOHVYMW5QSUFLVnBMN29CL2hYd2Z2eUQ3by9MUE1RZFpW?=
 =?utf-8?B?WUsyWVc2RGl0WXZXcnNTZzEwVjZLSXF3OFRwT0YyNGorcXAzcE0yMXdyUUFy?=
 =?utf-8?B?YjZkM0Z1NG1Pd1FOcElicjZkTmpiTGd2MUxMRll5NDdjWHIrVEh0SHp6NGhj?=
 =?utf-8?Q?Pr3HosRORvtJs2ebA78FHK3H1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e33ad4-10b6-4dba-ecdb-08dbba6815d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 06:00:41.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80UZZfZqEN7TkEM+ZgvMOPN0KppbmvdxFWRhuaf3Gqbk+jqZSGDPZ/xW3y5yTdqwF+nqjPfFdQtBSTvF/wJBEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-Proofpoint-GUID: d5XdD2ESvvXxp10OvuUwlOjpLKG0xiTL
X-Proofpoint-ORIG-GUID: _5dHGF6bqb-iASXs0vuZnix1BqOtdwe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_03,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309210051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187973

On 9/21/23 13:49, Alexander Kanavin wrote:
> On Thu, 21 Sept 2023 at 07:14, Kai Kang <kai.kang@eng.windriver.com> wrote:
>> -inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
>> +inherit allarch gnomebase gtk-icon-cache meson
> gnomebase inherits autotools by default via GNOMEBASEBUILDCLASS, so
> that needs to be reset, and then inherit meson is redundant here.
ok.
>
>> +               ${prefix}/share/licenses/adwaita-icon-theme \
> This should probably go to ${PN}-doc?
ok.
>
> I also got a fail here with the same update:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5795/steps/14/logs/stdio
>
> This has potential to mess up sato icons, and that would fail QA
> checks inside feature freeze and make RP grumpy, so we should probably
> hold this update until after that. Or someone needs to verify that
> sato still looks ok.

I'll send v2 though it may be merged in next release.

Regards,
Kai

>
> Alex


-- 
Kai Kang
Wind River Linux


