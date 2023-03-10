Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73122C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 20:41:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30734.1678480878565539082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 12:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=AQqU/bv+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2433d91694=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32AFvQUC017793
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 20:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=YztK2tlldHIwPAOeNAH9yNA4HU+O3kXO5SlIqIlfY4E=;
 b=AQqU/bv+21d5Im324MLtMMMR9wBgS8Oxa4/m99e1+ZgTRhrowB/vQ3i/PKFH6pit63vU
 /J5orHB9tJ2ZXs4awoQIyqsKbP5dd+plLjyMZllwFgpf8Ziq+HRi6LblOtq8Q0nnfA6/
 2q1BwXUA1hyCkpEWUCxp2SV/J4paRvDZ0dpcPPnHOChJ7ZLRjbe04QiXPnuZdujQEBkK
 ZJNBvp3gNnV3BKv13ScOfxIICZn2yhMwEgBfwLNyO/KZxZpd6UOK6rRuJ6iW0DnRoFPj
 PeqUFK/Rd6zKCw0pfAjRB7ebP3KJvLNPCLzgtJ3LxF5KuDdaoXXizIZdvAAdHDyT9SDh 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amt35j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 20:41:17 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AKd6NL025080
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 20:41:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amt35e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Mar 2023 20:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo2PHfKJelrgC04ULGztVtscoRoXab0HBBrdEfWOgRKFHy+RPoFhymNwLkdoPqV+bLnKMQ2FpG3bC2D7xh2k+P0KOKjqSD42sKLz01FcT0E4BOzPlRS4M/8AZIgnp3fxzOHhCC51hWiINX/JlQNQcI1qfduFGpZLPoQQmgr6CZ2PLN98cVGCHLrzMQVsd8L9avqp6IlpvXbGnVwCRTgK+7S23FIXnDb6kLqRYtuAj0x3r5erFGMsM58FCkdOU+Lyx5W4HFAyTPHTDkw6HRfCVkRXdM2LQ7BQl9GFD/wG5fvrsEKU5icX9kC2xSQ0wVJCv4g/9pFjL5biL9dGz272qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YztK2tlldHIwPAOeNAH9yNA4HU+O3kXO5SlIqIlfY4E=;
 b=EfqZEZEvrS/xJ4w/vjeUC1iiAEKSs35srHQu+AVbmZ3CVdrWJzqW/xtwXV4XnerS6Ao/wc2t6i7FNIkUMDo+VdOaLR2/NHcULKGMJbNTmNWKBmDZzj9piOYl6ql70N8NllAAAdSJ/c55SnP+Vq9UgE9Spl5aT5tbCrVgke4rP+mwozqM0nc7yK2C2cNV6/9EoOUdSnrO6cGHPsVKgRJrnrNDioKSX10GCOLqUHO8dbjEAXKDXyAk0oKIS1kVwZEuVSy+YfojtA5dgwMH8pykPwVz9icd2GntfhfjIAe7E0bfU6ow8VWRU5mAcwTVrDEQGC+XyoEZSKNj2vXfDIqY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 20:41:04 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 20:41:04 +0000
Content-Type: multipart/alternative;
 boundary="------------wf8HdUV2D4h5u9TzjYW3ovNP"
Message-ID: <eb5ed2a9-1331-d16f-e0d8-83d393fbd563@windriver.com>
Date: Fri, 10 Mar 2023 15:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] valgrind: Disable drd/tests/bar_bad ptest
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230309212354.1191371-1-Randy.MacLeod@windriver.com>
 <CANNYZj-W=U=o__xw40Nm0E1QqJ4-U+J-3dQ2CEgCeyAP4exw9Q@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj-W=U=o__xw40Nm0E1QqJ4-U+J-3dQ2CEgCeyAP4exw9Q@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a89d3d-6348-4727-32a6-08db21a7c468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XSQ9qc5DsnRtrK2L7TjUgxXGt+fxJw2l1TEgF7Uvundq+QOrR2gqgaXM3xJhZJd0LluzFRNNyT6Mt+m/UqboMARgJy9AUlsFn3BIIk5zTNbBHUWqpaAV/fcqJnQCEJV8dk7dcxe7epi8FA/4KyFm8Rd/+xsvHmgKtzJmMcvtvdW9fJ11qksw/5NzMgIHDDBIyMPwU4UA3eORJwwTUrK9Bo5S6+72PsHfy5wn3U17sgL35kw10HRgliNI5ojzScAaots0IH+O/0FUla5tq+EBFgS/910/zxS9VNV2/unR0hlOscoduwnQ+IV7+f545deNXCZrvMv84KlZRzrtP8zKYwI4+v2POomT1a7zcwMU5+qguDKjhnmfC2hDVN2kXkQ6twxcmhHUl/fgmtNuyZ8FxEQ4dNM5MU3VQlZn2r0LbvaXeuyjlxY0C1kfhEempKD182wYNO4s5r3FwFU9qvBTqs8kQoVvO7xmTUiNhJPJauNOXFBPDaTsqv1Koj9g/jnvDh7LPoHiVhjUPAPSw0BsVBr+CixcYBXGqoLfCIprGUVrCKL/cImU5MHhZzIggMSLpHXa6Hk5kkc0eGnEP7c8VOfSvqaMdgNzYYU3Aur+hKhALN9UMq8fLlRVoRXP7N9bYwv6b+ez2TaQA9ZDvO4+xC1CbMLLgAYC+kazIOw0/wnPBYnpymeHd3Dx3m7kiMI7HnddXGsqyCOBmsHXGEm3ZPYuPdk1SNrTAThVLKetLVh4ZpNBNDZVSdbPsZg0BqXu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(451199018)(66899018)(2906002)(31686004)(83380400001)(36756003)(5660300002)(66556008)(31696002)(8936002)(8676002)(66476007)(316002)(6916009)(478600001)(4326008)(166002)(38100700002)(86362001)(66946007)(2616005)(26005)(186003)(33964004)(6512007)(53546011)(6486002)(6506007)(966005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDBROTdUQlVzTmJYdC9SK00wUlZSb0t4UnNRaFA2WHVCSjZIVlNFVFRXRVVX?=
 =?utf-8?B?anZxYjFUZ096MEV1cWJOcmw2VHNoN2s2VjQ5SzZkaUhGSGFyYjZ3aTRaZjFF?=
 =?utf-8?B?OVZNZHFUaW5oYTM3ZmpwTVVoYVI2QXBnckpGU2hEdTI1UDgxT09GaGg0MmR2?=
 =?utf-8?B?RHpTYlgzZXRuT2hKYThEUFFxdGFIbHZ6QTB2VGQrdnkyeE1XOWdNZnFDWlpE?=
 =?utf-8?B?SnZKRE1QR1cvZjArQTk2QktQRkkxRkR5Ykk4R3JjODhiUEJKWmEvNCtBd3Aw?=
 =?utf-8?B?MXEvU25QQ1hNK0VseTNTL0tLaEZoRVBXNU5VSThndkNRZDFiNDlWeUg4a0du?=
 =?utf-8?B?dStpRi8ydzlwNHBESkNwQmhqZEVyUGhPeUNQclFSRU1abjdxcnB1Rm5xM3Jv?=
 =?utf-8?B?ZmRoRTh6N0grLytkMEdHMXViTFlvRVFkLzVxSnkyemxzdFhZVXMxdERTYnZq?=
 =?utf-8?B?Y1M2R3ZQeTUrZ3U5clIrR2lnT01iVURUcFFKU3pxRkJDcjB2NjNpTk92VlNB?=
 =?utf-8?B?NGxpbU1ZVXVxdm1oZVBXcXprWU9rb29mTjlmMEVnbGJCS0t0K0xlN2RvR3U3?=
 =?utf-8?B?anBGYVplcFBDR2p0TmcyS3EvT25ubitYNlBFU1F4UGhQQWNVbEpNR29XVi93?=
 =?utf-8?B?NEJKMnpQY1k3TCszRUJqZlZjQk5MRVVyejFmaURFMzMwQzBNK2hnaEVPT3Zr?=
 =?utf-8?B?ellIWENhK3lZQldpeUUzMnBnU3dJa2h1NFl0dGh2dlQxT2UxWVJBbzBsSXgy?=
 =?utf-8?B?NHdUTUw1Z3g2Zm05WGR6cHNJdG45R083Sk1LaVpidEt5aTN3d3VyQUZTMk53?=
 =?utf-8?B?WUc3am95ZUpXZEhmeWFRTVN5cVZmYWN0SmJ3aCtZK1pZdHhqVktjbFF1TW14?=
 =?utf-8?B?OXhSM0JhVmFzTVRGK3FaeHJnNVp0SGZuRUFlS2RiWGo5TDk2bExWREVtWTdU?=
 =?utf-8?B?K0VQTzJVb2R4TEZLZGRnTndkR3c1bmJOZ1pNc3BjZ2M1dnJMb3NsUHhGVlhN?=
 =?utf-8?B?bUxrNVdkWEQyT3ZzUFkxUktFTWkwNGlNNXpXaTZQb3ZlcmVBdWlwZG1MaEMy?=
 =?utf-8?B?aXFKbFRFd2hIWVVpVTlKeGJCS1J2RnluVVVPM3JEVXpweHJHRmZaUlVzOThy?=
 =?utf-8?B?Z3JIWW1GdlRiNnl1N3lDV2U4eHZZS0JZTGt1V0t3MFZjQXBtSUN4QitGRis5?=
 =?utf-8?B?Z2pldVkrakpUUkRISHRndUtHQ0F1cHdDWHZ5WGxKZ1ArTldVMW8waUxNZkk3?=
 =?utf-8?B?SE0vMGJ6ZTBPaVRSYS9WNHE0b0xaQmRVQ3h4d2NqNWgzQndqV3RvaDh3Q3FM?=
 =?utf-8?B?UFZSc203L3c0SEJmOFM5MDVKQlQ0ZFBWZks0YVZRVURtaHNqMllLYVIwZ2hS?=
 =?utf-8?B?dXhjWkRJZWhjTTVCMHBScHQ0Rmhoazh3Z1RCbERzMW85VjJqT0QzZzJPL05O?=
 =?utf-8?B?L21XaWFwbUdhV29ITC9DSE5sRnd0Ty9qL0hLY05sMmtiM0ZGQjhxMXNrYndH?=
 =?utf-8?B?Z05oWFZQcmc2aDFmQ0t6bVdLeHJHZVNEQkZxQmZpUmJwaEpkTmZKTEFlaDBk?=
 =?utf-8?B?NVZYSGV5TWRjOFN4ckJUV3FWZ3N4M21LZnJVbkFDMmNEOThQd25MeTZHeTZu?=
 =?utf-8?B?c0hpT3RxUXp2MThITTBSMVl3L0w0RHBOd0xFeElWczJVN0wzUERhZUsrczl3?=
 =?utf-8?B?aUMwTDBiVlBaRFFWazBOcmJrMktRMnpDZ0I0MmZaaDRBaXFQeXduM2diRzJX?=
 =?utf-8?B?aDhRazhqY1Y2alRVdWRLMmlTOXlvcGNFaHRXc0VxaEZLTWNJeGVpUlVPWUFX?=
 =?utf-8?B?L0pTRTNMejM4ZzEzV052M1N3ODZjUmoxUmI1Q29veGY5SmFFL2tCbUZnNTZX?=
 =?utf-8?B?ZzlGb3pMMy9BYjRBb1BxK2kxWVAwUkVYczM0MHRUSHd2aXhKMlBzUnJhdEFN?=
 =?utf-8?B?bnl6SHh2ekhHamhydU53YkZNWXl5Smw5NWxGd2FjQzNIY1RiVjZjRHFKZU5W?=
 =?utf-8?B?ais5ZWVtbVcwZEhiUDR4WG9pbGpsKzloU1VEOVhMRlVMTmVMam1CNFhHdEY3?=
 =?utf-8?B?cmNMbVJtaHB5a1BSZ296U2diWFIxVlc0akNLdHY5a1dNTGpPbUJhWllBcDZM?=
 =?utf-8?B?WUdnWGsvVkFGRkUySU9RQ2RONlg1RUhqN25oS1k1MFNXdG9zWHg2c2pVMTl4?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a89d3d-6348-4727-32a6-08db21a7c468
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 20:41:04.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcvIePWC6mKWaF1f0HohLJxNFP36cXlfxQMFXM6H4hF3ItnNGacIh1ZeKPn9/9M4hv5FeUIJ3A9V/DTwYVv+kA105PB5SEtCSnpgCrYns80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
X-Proofpoint-GUID: x8MfvX9SQ7FTYonV2gZUaBfdwu4qx4qh
X-Proofpoint-ORIG-GUID: flqj2rL7Av_lR2M-bKjXGgfQUdmpDKaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 20:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178344

--------------wf8HdUV2D4h5u9TzjYW3ovNP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32AFvQUC017793

On 2023-03-10 05:04, Alexander Kanavin wrote:
> Ok, I'll bite. Should we just drop valgrind from ptests? It's by far,
> the most brittle, finicky ptest we have, and doesn't seem to expose
> actual issues, instead just giving everyone a never ending stream of
> intermittent failures or tests that won't work on anything except x86
> configured in a particular way.


Hi Alex,

It's a bit of a challenge but I'd like to keep the valgrind ptests around
since most actually pass and we'd likely never know if the tool was broke=
n
otherwise.

Non-x86 used to be a problem but not so much in hardknott. (1)

We do run > 600 tests and we have a mechanism to skip the
10-20 that are a problem:

=E2=9D=AF wc -l meta/recipes-devtools/valgrind/valgrind/remove-for-a*
 =C2=A013 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
 =C2=A011 meta/recipes-devtools/valgrind/valgrind/remove-for-all

../Randy


1)

commit cbeb9418c43ec834868aa65b774dc09e983d26d9
Author: Qiu, Zheng <Zheng.Qiu@windriver.com>
Date:=C2=A0=C2=A0 Fri Nov 4 14:47:05 2022

 =C2=A0=C2=A0=C2=A0 valgrind: remove most hidden tests for arm64

 =C2=A0=C2=A0=C2=A0 An earlier version of valgrind fixed the defunct proc=
esses bug, so=20
those
 =C2=A0=C2=A0=C2=A0 tests that were skipped specifically for arm can pass=
 now in master,
 =C2=A0=C2=A0=C2=A0 kirkstone, honister, hardknott, and dunfell.

 =C2=A0=C2=A0=C2=A0 Detailed test result with remove-for-aarch64 skipped =
on qemuarm64:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Commit=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pass=C2=A0=C2=A0 Fail=C2=A0=C2=A0=C2=
=A0 Skip
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 624=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 21
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kirkstone=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 618=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 20
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 honister=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 616=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 19
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hardknott=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 609=C2=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 18
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dunfell=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 598=C2=A0=C2=A0=C2=A0 16=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 17
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zeus=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Out of memory: Killed (with=
 many defunct=20
processes)

 =C2=A0=C2=A0=C2=A0 There are now only 12 skipped by remove-for-aarch64 b=
ecause 9 fail on
 =C2=A0=C2=A0=C2=A0 qemuarm64 and 3 more fail on raspberry pi. These are =
tracked by:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14960

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>

>
> Alex
>
> On Thu, 9 Mar 2023 at 22:23, Randy MacLeod<randy.macleod@windriver.com>=
  wrote:
>> This is failing intermettently in the YP autobuilder
>> so disable it until we can fix the root cause.
>>
>> [YOCTO #14311]
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/=
meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> index 5d1e7ed102..e26088f3b1 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> @@ -3,6 +3,7 @@ gdbserver_tests/hginfo
>>   memcheck/tests/supp_unknown
>>   helgrind/tests/tls_threads
>>   helgrind/tests/pth_mempcpy_false_races
>> +drd/tests/bar_bad
>>   drd/tests/bar_bad_xml
>>   drd/tests/pth_barrier_thr_cr
>>   drd/tests/std_thread2
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#178271):https://lists.openembedded.org/g/openembed=
ded-core/message/178271
>> Mute This Topic:https://lists.openembedded.org/mt/97506606/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------wf8HdUV2D4h5u9TzjYW3ovNP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32AFvQUC017793

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-03-10 05:04, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-W=3DU=3Do__xw40Nm0E1QqJ=
4-U+J-3dQ2CEgCeyAP4exw9Q@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Ok, I'll bite. Should we jus=
t drop valgrind from ptests? It's by far,
the most brittle, finicky ptest we have, and doesn't seem to expose
actual issues, instead just giving everyone a never ending stream of
intermittent failures or tests that won't work on anything except x86
configured in a particular way.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Alex,<br>
    </p>
    <p>It's a bit of a challenge but I'd like to keep the valgrind
      ptests around<br>
      since most actually pass and we'd likely never know if the tool
      was broken<br>
      otherwise.<br>
    </p>
    <p>Non-x86 used to be a problem but not so much in hardknott. (1)<br>
    </p>
    <p>We do run &gt; 600 tests and we have a mechanism to skip the<br>
      10-20 that are a problem:<br>
    </p>
    <p>=E2=9D=AF wc -l meta/recipes-devtools/valgrind/valgrind/remove-for=
-a*<br>
      &nbsp;13 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64=
<br>
      &nbsp;11 meta/recipes-devtools/valgrind/valgrind/remove-for-all</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p>commit cbeb9418c43ec834868aa65b774dc09e983d26d9<br>
      Author: Qiu, Zheng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Zheng.Qiu@windriver.com">&lt;Zheng.Qiu@windriver.com&gt;</a><br>
      Date:&nbsp;&nbsp; Fri Nov 4 14:47:05 2022<br>
      <br>
      &nbsp;&nbsp;&nbsp; valgrind: remove most hidden tests for arm64<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; An earlier version of valgrind fixed the defunct=
 processes
      bug, so those<br>
      &nbsp;&nbsp;&nbsp; tests that were skipped specifically for arm can=
 pass now in
      master,<br>
      &nbsp;&nbsp;&nbsp; kirkstone, honister, hardknott, and dunfell.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Detailed test result with remove-for-aarch64 ski=
pped on
      qemuarm64:<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Commit&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pass&nbsp;&nbsp; Fail&nbsp;&nb=
sp;&nbsp; Skip<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; master&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 624&nbsp;&nbsp;&nbsp; 9&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 21<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kirkstone&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 618&nbsp;&nbsp;&nbsp; 10&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 20<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; honister&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 616&nbsp;&nbsp;&nbsp; 10&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 19<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hardknott&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 609&nbsp;&nbsp;&nbsp; 13&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 18<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dunfell&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 598&nbsp;&nbsp;&nbsp; 16&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 17<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zeus&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Out of memory: Kille=
d (with many defunct
      processes)<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; There are now only 12 skipped by remove-for-aarc=
h64 because 9
      fail on<br>
      &nbsp;&nbsp;&nbsp; qemuarm64 and 3 more fail on raspberry pi. These=
 are tracked
      by:<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link=
-freetext" href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
960">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14960</a><br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Zheng Qiu <a class=3D"moz-txt-lin=
k-rfc2396E" href=3D"mailto:zheng.qiu@windriver.com">&lt;zheng.qiu@windriv=
er.com&gt;</a><br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-W=3DU=3Do__xw40Nm0E1QqJ=
4-U+J-3dQ2CEgCeyAP4exw9Q@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Alex

On Thu, 9 Mar 2023 at 22:23, Randy MacLeod <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:randy.macleod@windriver.com">&lt;randy.macleod@windri=
ver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">This is failing intermette=
ntly in the YP autobuilder
so disable it until we can fix the root cause.

[YOCTO #14311]

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/met=
a/recipes-devtools/valgrind/valgrind/remove-for-all
index 5d1e7ed102..e26088f3b1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -3,6 +3,7 @@ gdbserver_tests/hginfo
 memcheck/tests/supp_unknown
 helgrind/tests/tls_threads
 helgrind/tests/pth_mempcpy_false_races
+drd/tests/bar_bad
 drd/tests/bar_bad_xml
 drd/tests/pth_barrier_thr_cr
 drd/tests/std_thread2
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#178271): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/178271">https:/=
/lists.openembedded.org/g/openembedded-core/message/178271</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/97506606/1686489">https://lists.openembedded.org/mt/=
97506606/1686489</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------wf8HdUV2D4h5u9TzjYW3ovNP--

