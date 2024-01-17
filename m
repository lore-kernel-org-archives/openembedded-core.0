Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D9EC47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 04:52:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2346.1705467159324259535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 20:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SLLgcYTr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17460ff7c6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H2f8aa031388
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 20:52:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=WJMgupUkt/YpQM4Bga3
	X4ekyR5jIS9IBN2j/PqbCaEU=; b=SLLgcYTrx+wH+o1j7HevKmNe9ZUTuJzHFHX
	pVhC+DoyAqFIoz35GPAamK7KFwgR6Y6q92V86CxanniGQoKINl3YdYJy4/SVhq7C
	U5vkGRaj6lcVBpj/avaoRg7NAI3jzfdhO977VIc48MDEWDNnGvGahHxK2tsw80VR
	3ZRCt8+eTdqVboU1HC7naGtusx3/Iqz4a6GJxr8irwN5SsSPtzNJ3TTWkfZ0/kCD
	bZTio8G/4D2ZKJlQKKnmQZ/6Csc7PCgM8Gy0UZS5iejtY+XodaU+pQlNeKgIsJ3Z
	MBrMvdbTcKv7m2Kge0RQNGOoL8FdXPNOB9dNDfrpVBwNBfiOv1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp43xsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 20:52:38 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40H4qcp4022228;
	Tue, 16 Jan 2024 20:52:38 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp43xsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 20:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJScSRNJE+s8TDZ5hMyMNJwWwj2HxipwqbO7/gTJjvjp2dg2P1GDWmiHKOtJ0rkrtSY6Hb69RxpQpxP+c45KAEStWsbepV87ttLCSCRDFdr6UWay73yN1sznof27t8F8Ja6ecq20YZA/p/4TjswO4wrsX7lCMV9SQsyDvvj2nzJudVKFealB+SlBwSlDc6MuaH4Pj8S1bK8RuZZejz+dww0SqhjinVyD0KF7+VIR+VRb+0lydbOGsj36xT0vd23qIEPiNDxjaO/SVJpFSw9t4Lfd+pmpSVNhSMZp058T60qNXAZ0p4z7WJ08RqRN6l0AMI7ZzQQ1ovqkblFNh3X6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJMgupUkt/YpQM4Bga3X4ekyR5jIS9IBN2j/PqbCaEU=;
 b=GvXDqjU/iw+1SWRH69Kfp5WTxZHfNZh/4AYM8/3cOa4uELO/kRZY6R1PMZLg0cUCUv/DC8Zz8+F1Xqgk/ZCgr0oaOSEBB3V8ygFgOlyp6HfhdIxnpNfNbS+NMJPZy49b7/yMlLCwWdVfJQJU1rOtfhrHzxN5kCVbISSiLqxbkmcUJq9NqqqT3+JUA9IqwBHLZBu9dFXQBPNfQ1cI5dDRtH20dlHS0QfTQDLCGeJvX4r60JKq5NV5Ibsq41bBQf35zYyl5YQ6bziEwG+/cNGjST74ZRs5b0hhtf5L4diYjYReNWREf40ijf7IfN/301oaQJ1BEnw+0Pyxa2LMZ0k6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Wed, 17 Jan
 2024 04:52:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 04:52:32 +0000
Content-Type: multipart/alternative;
 boundary="------------M3lBiMFN1P0N1fxmXCCq1lAg"
Message-ID: <e792c37d-3bab-5951-9509-43e8f20ca327@windriver.com>
Date: Wed, 17 Jan 2024 12:52:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 2/2] openssl: Fix ptest dependencies on
 perl-module-* being ignored by COMPLEMENTARY_GLOB
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, william.lyu@windriver.com
References: <20240116165602.2053194-1-William.Lyu@windriver.com>
 <20240116165602.2053194-2-William.Lyu@windriver.com>
 <CANNYZj_OVth=cfNE_+VY4gb27hNcx45VagwZf1J_eEUEm0Ltvg@mail.gmail.com>
 <CANx9H-B19_Fk2KgK-G=-nCU=D8xfBPim_t810BWu5n1jkvOQUA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANx9H-B19_Fk2KgK-G=-nCU=D8xfBPim_t810BWu5n1jkvOQUA@mail.gmail.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e8f799-8eaa-4ea0-050f-08dc17181cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7fuwfDyUMNLymxVLiMJqZ1bhIZ/uzvff58czdFyi2KdKquIIqcj7DYdQTA+qesaDmnLVcNTQ2RHmUqJKY/a8M4ggxEfsA+hbo1XIDCD2zmECWQyDVdUbY2rg4L2jo1nmt+ecfhfjKMR86/1jfjCefzu1nVhDph4Ef0Xfsh3PEK+UeSUuBQJJ9dAsJBeyuVHfRDpTI2fPDCoGQkrq8XSLuwJHPooJG5PhWI9Xb4UaIAXw/d7rRZAYw4vROm79RI7QCzX5f+M+NeZpVyd/RmX1fwhF2/gUkbWGgZWk/t5rMlkOTN6IMDDKQhPHRJBvku+s8dxHTSXdJdvQrxtdowAfLAEm+VT9vsKQNVNncDWrsux3H8ipESu/g3dXdYOB2QUjlw0JQuoxDGogW/MD+8cyBZbuEqHQAR9jDP461l7yQyhGADkRYy83AJrrgmDXoMyoyutDPVOzrtcqJO2eEPN/YQ7GRQ9pLVZbGrlZHKXiA1ELNSUeHDLm/9BeRBtRLOMnjhH6r1mnaRdAnJxvVHtrFNfxbmFSk2OukVQ55W2O1bFhCdxrfPEz2rqWT5THrsYcRSrVFyCOobdOod2inaekfGUhIqmm46RUZnNFE9kGOHybPfciowUX85BGl63qeGfeo5rg3OpOCwtJ3KNRohPXp7IY1Qz/YruQGCBNRRqJmNM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39850400004)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(31696002)(166002)(86362001)(66899024)(6506007)(66476007)(6486002)(33964004)(4326008)(53546011)(966005)(478600001)(6666004)(6512007)(36756003)(2906002)(5660300002)(66946007)(2616005)(26005)(107886003)(66556008)(8676002)(41300700001)(83380400001)(8936002)(38100700002)(110136005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1hidnRXWmdSc2NUZk50YVBvZ2RTdEsxeFVLbE9neGZjK3Y2TUdJaWJYUHZJ?=
 =?utf-8?B?c290ay9BZElVZFZqcXhjMGRaRHJrRDlNTzRaNVBpWnNEYmFsdXlUaExBeWZF?=
 =?utf-8?B?Q01xb2QwanJZd1FiajdqQTQrNzJuYmUxVEhOaWhzZ0hTOVdtUWc0Y1c4TDhx?=
 =?utf-8?B?ZDQvQ2NRdGdjdm0vd2tpb3BESEcxU2FNS3IwWFRXRnVTZTg4MCtGakJ4OTB5?=
 =?utf-8?B?RXFZalBHTHVYcTNkbXVqbXhCYkdXNlNwM2JpdEFudS96QlkwRmVFTFlqQmJy?=
 =?utf-8?B?VkpzajNJUUozWFZ3MXdXS3FUME1EdDJBb0N0VEtNd2hpZHFkOHFaaEJFT0NR?=
 =?utf-8?B?SnFHVXllMnNOL21MQ3kzWC9mYmFGanh1UXRPTjVuSUhaTlQxUEZnSHMxSGlo?=
 =?utf-8?B?TnoyT0QyYnlEMHkvR0h0eEV1RmtWTGJ2eGxYb0ZJMEdEMTV4TGRoSERISkxF?=
 =?utf-8?B?dTB4YW9xR0NydTM2TUdDdXB5MkJUeVE3NDZESkU4MlFxZ01Kai82MzgxUDFz?=
 =?utf-8?B?aXAyOU5GS1pSMEtDQ09qRmVKR1hyNVJjTW9ON3RMRjJVL0EycmM2bjFZc3Bl?=
 =?utf-8?B?SlRuQk1tTEIwbGFxZUI3aHp3ZkRvNVFMRFdaTnUvZWdYMEJ3MWxMbkFGbzJT?=
 =?utf-8?B?YkdWNE1xZmpSejk0bDBvcTZ3TVV5YTFFQUZpUHMzT0lnWEQxMXk4ZlFFamgy?=
 =?utf-8?B?SnBjaFhDNkNSc0gxdGxDQ05ZbUE5ZkNvSWRyVEpqakFhL1M2bFRlenJNajF1?=
 =?utf-8?B?TDhRMFgrc3NGRGJkZW50ZFVzbEQvSkpkcGhnSmM1ZkJ2Yys2Nk8xUkswUjlO?=
 =?utf-8?B?YmhFZVFmU093NTNWSEc2ZFVkbnpSVFVUblBFY0JoSmxraU9RY2ZNdy90WFNM?=
 =?utf-8?B?VSt5NWVldUxrWURheVIyYkZLRjI4bFdxckpoRERuNEhtbmwwRUEzVi9PVkJM?=
 =?utf-8?B?SkRYNG1sNmRoaXNvUXVWTFlPQUIvUkpKaEhLY3NKaTZTZFd0dUhmdlhGS3ho?=
 =?utf-8?B?akZxU2gzYmVvRVBLbVVpUDJXRTNwLzBVZndOS2c3bjhEQlhNRjBWS0xvNWhj?=
 =?utf-8?B?UFgwODg5THJzeGNQUDRVWHFpVUNrRFo5MDY1V05iUDA4SG9WazJqZG5RTS9G?=
 =?utf-8?B?RytNMGxNT015cnI0bStxNWhtMTFjUnltaVhXWTZjbkZmUkJ2OTFkR0NDVURs?=
 =?utf-8?B?VGtDTS9CYndKSFd6SUZFVW9zaC9HZ2x1b3hmdXJpUERKWjM3UnZyNkl2dXNG?=
 =?utf-8?B?czducG8zclFXOFZaMnVJT09VZUhrV1hMOHFZMk9PQnJ0Q2J6L0RCdFlsK1p2?=
 =?utf-8?B?VnZSd2dORE9TVGNiME5Da2VSaTBvVDlSd2xnZVoyN3BFRDkvS3R3NEhpeE1x?=
 =?utf-8?B?c0ZsUGZEa3lkZ1lEL3p4TnpNRzl0a3lVcjczZnhSczdCMzFZUE1PM3k0TCtm?=
 =?utf-8?B?RllqRExsUEVnUkFObzNhWDdDQm9rOWxsQ3MrTXlRYzdMSlUrSkQrYjd1Rk50?=
 =?utf-8?B?NDNQUnljQ0hlTEtBeWh3eW10dkp1WWZKVnhrM0ZDclNMWW9DWkd1bVdQMHlQ?=
 =?utf-8?B?M1lBVFlrR3BoY0dtS0tPNlhIbzlHMURaZjZhbTdZRmVtb0RjR010MnkrSWNJ?=
 =?utf-8?B?ZVI4aGNRSDBTeXRsR0tNKzZHYk9OdklxaWJHb3VvTDljZEVLNFdxZGFPWGV3?=
 =?utf-8?B?NlZWZDVZMDJ2cHYyME9yc2ZKZmg0bVNFckJTbFd0c3FlMi9QemFKSm5MTTNl?=
 =?utf-8?B?L2d2Mmh2Y2ZlQnl2R2NmeWlLVUFSbGduMFRiVVBHbzlXdUY1UXhiTkdLL09K?=
 =?utf-8?B?UzNQbDB6N1VEZ1l6bG1DL1ZJV1NMbFZPeGZmbS9Hb09MU0JxZEJVQS9Nazhr?=
 =?utf-8?B?ZUxtOEkxUDhaaldwbEJEVUo4UTJqNE5Va1lsejFUUFMyOWREZEcrbVYzdHll?=
 =?utf-8?B?L3AybjBHT0FMQmRiM005V3laZ2VIWTV0VTNWS2hMcEhPVmFSU1BwbC9aN1Jm?=
 =?utf-8?B?TkxVdW96WjRtOHZIRmVCY1BOS0NrTG1uaDQ0aDdONnJzQUxzQ3JJZzF3c3dU?=
 =?utf-8?B?YWh6b2o2aElkL1JpeHpQakdnV2pCaVVsLzRuRytIRTBKR2poem12ME53ajhW?=
 =?utf-8?Q?yjfvm/RP+0FvH+r9aQpmMvBck?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e8f799-8eaa-4ea0-050f-08dc17181cc2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 04:52:32.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn5r8w3Ic/EAYTB0vOYs96ufprKuC5TuTjEQcruj3O/h0Ola0kE958d+8gNEvPOknzbrKH4at+l8WxscbeOtig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
X-Proofpoint-GUID: JVHK3aFsO3Wu8OwteekTV2DvM-R8h7P4
X-Proofpoint-ORIG-GUID: gOhji6hzmvb_p_Llc-F6kVvkQeGqIQwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_02,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 04:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193888

--------------M3lBiMFN1P0N1fxmXCCq1lAg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40H2f8aa031388

Can we change the perl recipe to simply use 'RDEPENDS' for perl-modules?
I don't see what benefit the 'RRECOMMENDS' could give us.

Regards,
Qi


On 1/17/24 02:56, Tim Orling wrote:
>
>
> On Tue, Jan 16, 2024 at 9:21=E2=80=AFAM Alexander Kanavin=20
> <alex.kanavin@gmail.com> wrote:
>
>     How about simple depending on specific module packages? I don=E2=80=
=99t
>     think OpenSSL truly needs all modules.
>
>
> Agreed. I don=E2=80=99t see a compelling reason to add the=20
> perl-modules-force-all complication. This will add confusion in my=20
> opinion.
>
> Iterate the tests and add the required perl-module-* sub-packages one=20
> by one (or by inspection if the test cases)
>
> In almost all cases, RDEPENDS on perl-modules is a short cut and=20
> should be avoided in favor of being explicit.
>
>
>     Alex
>
>     On Tue 16. Jan 2024 at 17.56, Lyu, William via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3=
p7lYRZ7IPV-BvhkVBVlxg$>
>     <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
>         From: William Lyu <William.Lyu@windriver.com>
>
>         Change the openssl-ptest RDEPENDS from perl-modules to
>         perl-modules-force-all which RDEPENDS on the same set of packag=
es
>         perl-module-* recommended by perl-modules. So, when
>         openssl-ptest is
>         added via COMPLEMENTARY_GLOB "ptest-pkgs", its dependencies on
>         these
>         perl-module-* packages still get added.
>
>         Signed-off-by: William Lyu <William.Lyu@windriver.com>
>         ---
>         =C2=A0meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>         <https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYd=
w8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7=
lYRZ7IPV-BvgVPdEvRA$>
>         | 2 +-
>         =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>         diff --git
>         a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>         <https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYd=
w8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7=
lYRZ7IPV-BvgVPdEvRA$>
>         b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>         <https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYd=
w8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7=
lYRZ7IPV-BvgVPdEvRA$>
>         index d041d2d214..7076bd3a7b 100644
>         --- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>         <https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYd=
w8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7=
lYRZ7IPV-BvgVPdEvRA$>
>         +++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>         <https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYd=
w8EvQ!cxKJn1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7=
lYRZ7IPV-BvgVPdEvRA$>
>         @@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D
>         "${sysconfdir}/ssl/openssl.cnf"
>
>         =C2=A0RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-modul=
e-legacy"
>         =C2=A0RDEPENDS:${PN}-misc =3D "perl"
>         -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash =
sed"
>         +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl
>         perl-modules-force-all bash sed"
>
>         =C2=A0RDEPENDS:${PN}-bin +=3D "openssl-conf"
>
>         --=20
>         2.43.0
>
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193872):https://lists.openembedded.org/g/openembedd=
ed-core/message/193872
> Mute This Topic:https://lists.openembedded.org/mt/103766390/7304865
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------M3lBiMFN1P0N1fxmXCCq1lAg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40H2f8aa031388

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Can we change the perl recipe to simpl=
y
      use 'RDEPENDS' for perl-modules?</div>
    <div class=3D"moz-cite-prefix">I don't see what benefit the
      'RRECOMMENDS' could give us.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Regards,</div>
    <div class=3D"moz-cite-prefix">Qi<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 1/17/24 02:56, Tim Orling wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANx9H-B19_Fk2KgK-G=3D-nCU=3DD8=
xfBPim_t810BWu5n1jkvOQUA@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 16, 2024 at
            9:21=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">alex.kanavin@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">
            <div dir=3D"auto">How about simple depending on specific
              module packages? I don=E2=80=99t think OpenSSL truly needs =
all
              modules.</div>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Agreed. I don=E2=80=99t see a compelling reas=
on to add
            the perl-modules-force-all complication. This will add
            confusion in my opinion.</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Iterate the tests and add the required
            perl-module-* sub-packages one by one (or by inspection if
            the test cases)</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">In almost all cases, RDEPENDS on perl-modules
            is a short cut and should be avoided in favor of being
            explicit.</div>
          <div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">
            <div dir=3D"auto"><br>
            </div>
            <div dir=3D"auto">Alex</div>
            <div><br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Tue 16. Jan 2024=
 at
                  17.56, Lyu, William via <a href=3D"https://urldefense.c=
om/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!cxKJn1SS8SQ9ODf0H1I=
fuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-BvhkVBVlxg$" tar=
get=3D"_blank" moz-do-not-send=3D"true">lists.openembedded.org</a>
                  &lt;william.lyu=3D<a href=3D"mailto:windriver.com@lists=
.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px
                  0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">From:
                  William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver=
.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">William.Lyu@windriver.com</a>&gt;<br>
                  <br>
                  Change the openssl-ptest RDEPENDS from perl-modules to<=
br>
                  perl-modules-force-all which RDEPENDS on the same set
                  of packages<br>
                  perl-module-* recommended by perl-modules. So, when
                  openssl-ptest is<br>
                  added via COMPLEMENTARY_GLOB &quot;ptest-pkgs&quot;, it=
s
                  dependencies on these<br>
                  perl-module-* packages still get added.<br>
                  <br>
                  Signed-off-by: William Lyu &lt;<a href=3D"mailto:Willia=
m.Lyu@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">William.Lyu@windriver.com</a>&gt;<br>
                  ---<br>
                  &nbsp;meta/recipes-connectivity/openssl/<a href=3D"http=
s://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYdw8EvQ!cxKJn1SS8=
SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-BvgVPd=
EvRA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">open=
ssl_3.2.0.bb</a> | 2 +-<br>
                  &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
                  <br>
                  diff --git a/meta/recipes-connectivity/openssl/<a href=3D=
"https://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYdw8EvQ!cxKJ=
n1SS8SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-B=
vgVPdEvRA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>openssl_3.2.0.bb</a>
                  b/meta/recipes-connectivity/openssl/<a href=3D"https://=
urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYdw8EvQ!cxKJn1SS8SQ9O=
Df0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-BvgVPdEvRA=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">openssl_=
3.2.0.bb</a><br>
                  index d041d2d214..7076bd3a7b 100644<br>
                  --- a/meta/recipes-connectivity/openssl/<a href=3D"http=
s://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYdw8EvQ!cxKJn1SS8=
SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-BvgVPd=
EvRA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">open=
ssl_3.2.0.bb</a><br>
                  +++ b/meta/recipes-connectivity/openssl/<a href=3D"http=
s://urldefense.com/v3/__http://openssl_3.2.0.bb__;!!AjveYdw8EvQ!cxKJn1SS8=
SQ9ODf0H1IfuN2qyCFPWHDlbuuYvuan7dIN9Nds2MS9DozRKwvNf7Di3p7lYRZ7IPV-BvgVPd=
EvRA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">open=
ssl_3.2.0.bb</a><br>
                  @@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D
                  &quot;${sysconfdir}/ssl/openssl.cnf&quot;<br>
                  <br>
                  &nbsp;RRECOMMENDS:libcrypto +=3D &quot;openssl-conf
                  ${PN}-ossl-module-legacy&quot;<br>
                  &nbsp;RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
                  -RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl
                  perl-modules bash sed&quot;<br>
                  +RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl
                  perl-modules-force-all bash sed&quot;<br>
                  <br>
                  &nbsp;RDEPENDS:${PN}-bin +=3D &quot;openssl-conf&quot;<=
br>
                  <br>
                  -- <br>
                  2.43.0<br>
                  <br>
                  <br>
                  <br>
                  <br>
                </blockquote>
              </div>
            </div>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#193872): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/193872">https:/=
/lists.openembedded.org/g/openembedded-core/message/193872</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/103766390/7304865">https://lists.openembedded.org/mt=
/103766390/7304865</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------M3lBiMFN1P0N1fxmXCCq1lAg--

