Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ECEC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:11:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.20330.1667488302578525438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=cL/i6g6M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8306525b0b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3CHBRW024709
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 08:11:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=iZdduhR/moZDQqV/vLLe1VqbkkZWC2esYh17IBGqiYQ=;
 b=cL/i6g6MORNWHYJrvHXjrO1T2Pd4lkfOMrSGf+t/wk2gQPqCvNrO7asaGWhh7J1Qy3kV
 wqbExxR0XVvIPQHeCYOF5jK4LLAi4FXAnsF1VZNjoJSDy7UJ7XtS3BxAsqw3FMa4UYE7
 oNbFouIS9sy+CyuQTsXaKPqgTXavwzWlgAG07Ji0YY/xI52Bq1XaJYOp2Q2ohd1z8MRl
 aCqSx37LzRYViBGg6Msy9FaizGOV4Roo5xTl256gXecl+hcwnXdIyGahcOXKMmTmJDqo
 WRCYu2vuAOtPzLWVbHoyp86vECUqgmlF9bWY5Iec6zppT8BUOPS7fRMjB5M6BbEL0OOw PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3km4awrgf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 08:11:41 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3FBfjw021899
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 08:11:41 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3km4awrgf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 08:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pz5DUdlImmRjRS5r5UtYuz02WAbFn/K8gjWmjvMfbcQJnTpsuT7p89iwsL1JWVKG2A0aNDvlaa96UBZ6sFoqlc8FmIecEgA9KEs2pYjFKsDB4kzjeXxshTDH0QCCAmMVaT0QJg6iKKb7Tyib/FVzNVJf/MRNCY/F/o7vO1WeGM4O4EGdn1ypZOQcLVzzooov0lkGQDHSqKlqbQvLDROUdKEimx+oQoQ0NS4Ui0feLmelpySt7QLKd5vt4ag1+Ftp1rkw/HocD5ajihOhfmkr+NWlQX6jDpcGbfcgKu9bIVIHCwqWUkOSpoAw7XxzBhU70zRvaho+V7ywoHsQtxRYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZdduhR/moZDQqV/vLLe1VqbkkZWC2esYh17IBGqiYQ=;
 b=QL2+2iMoOouhogWMlWoPB8A6UVhSI4JqBATWWpcFsxowGKAuVBvKrmSD4V//0u8nZfesQB/o7Atgc8FuE12RsaGG5436VEyEK2jBrq2bD2SIJYRD2XEA+tAbuspYCAb5+F3fUEDDfqeV/OXdNBr394yIU65a6cZ+pAVD30R7yDHrKo15FJAKb/QJRIdZU4e0gPs60kUNGjSQH2HOHBRnYasG8I09+1NOX28UTgisipOy9Tdzw4sorGDskKwRAB40UEuTOmaibKqytXPpg/9Nuz51yHXr3PBUnyy9A7PsRYn3dspXf8kSz6w3xPquaZm1wh68Q3Ud9p/5tRD0y84juw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 3 Nov
 2022 15:11:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 15:11:39 +0000
Message-ID: <16cac375-eaef-7561-516d-5fd687618c7a@windriver.com>
Date: Thu, 3 Nov 2022 11:11:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH 1/1] lame: Remove hardcoded rpaths
Content-Language: en-CA
To: Paulo Neves <ptsneves@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220726202337.2141895-1-ptsneves@gmail.com>
 <17b35aa4c6c3c8f0e1dcb309e7897048ec5f8510.camel@linuxfoundation.org>
 <5e177514-1fce-4a2a-b85f-1adfb5623c03@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <5e177514-1fce-4a2a-b85f-1adfb5623c03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a45fc5d-261c-4e8b-10bc-08dabdadb4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sr7z9XBSZsTcmpxJxcVETnxDr6jaXYdtKGYj8yXPOHicMPWZxwWA31DPyqCTixMOMLGMeI65pDSH8nwsULeZrNrvdqPrIjRcKw3eO4tN9C1qeYTiYibCSc6CqMeTFzC0Tu+qM9C//aBhGqbWYrvDxDAWcVttJUpjndLRGYbtCMNIYKXwkJTNTcDMGVlqQErpAGilbzX++Q5ot2xflaZZNf+8fGE6N0EZH33iz2yJN2mOiJ4TGVl2BGLMhJaRtuQZOFLDbPDYsdViVccztl6Qk4QN/PXgC2sd8UR2bOWe6rYEbKFN6voLQPAui6dzepbC5NBn/qLIqMlAjmdXFv+VilGDDuyeUh/f3f++n+zxCUcJHdT8gsIESupuZcb3LBTBOHn4r6VxoRri+qJJYTvb9r8XePnKSqiZQFTbi9ii/HDf1riQK67D9Mc95ETGjd1rs4OJ3Ei6vBB5PNlxFafGvKseaEzSmFUhihpqnrmQcJYNoX/E/PbLfB5XHGErAr7LWQi7kyvXwuK7Q6rkR8hiVX1/xQyDloUjR0bzlA+ayTLFyBShf1AeK4CmosLnUoMKsYQqLjDaaX3mYRsYiMrwDGsq0aM1MezKsq0Ezb48/SealRBBerJZOs0vXPwM0/xTolEnDBxwwHN3pPTqWgUtRE/GzIzuCU1P6CN1ky0tnnHyLpFSg0+4GPzfUivHhoLz2k3M9UV6NdTlji6uu4eahU4tVZvQYtv+/gCMJFBKJ9KUispyS5VW+fjVsoCG8HNI3yCcAKZjt/mEwsLDGTIlQHIoHcfW/Ws4TlYduMdCm1ZamuQsjzotXpqctn1RrLVLcd/HyzazzzM4tLBANkNkEFq77nfny4bDjrXzoRB4o9lEAwvT2J84gGwcdQdRyjYv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39850400004)(346002)(136003)(451199015)(86362001)(6512007)(31696002)(83380400001)(5660300002)(38100700002)(41300700001)(2906002)(8676002)(66946007)(66556008)(110136005)(66476007)(478600001)(26005)(2616005)(6486002)(53546011)(186003)(316002)(6506007)(966005)(8936002)(36756003)(31686004)(6666004)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDMrNTA5NklkaDFndzlDM2Q4SzVnVnZXR0FLOUVaOFpnOVF2Wm5Lc05sWDVl?=
 =?utf-8?B?V01odHJ6QWdYSzR1V1FoNWdWOFNMWUVNejBuVzZiYXFJTDFTQkpJTjFJNjRv?=
 =?utf-8?B?bzZqcGhpaWhGdDhsUVJyaEpaZXJXSTBJTWpLdGFkbzR3V0Ntai9lSTlvbU5M?=
 =?utf-8?B?Vm5jdkhYK1lRUXNBZDNvemdOUXZCWFdSNCtKTDJQNnNORWJsUXhHdXlVaXc3?=
 =?utf-8?B?QjQrR1Q2c3BoMmpQN2xCbk9kcmZxYzJUQkRmVlJVZmpiM1hhd3B0WnFCZjdm?=
 =?utf-8?B?bDl0YjFzYmJQYVJ3VExHcDNmZTFmRXBNNXBzQ0xLaFRHa0Vad2xoK1BsRDR5?=
 =?utf-8?B?SWU0dlBsMktZQWo5dE9ZNnA1Tmg3UHIwYUhIR25XZjhGTDM1Wkx4OVdpU2tG?=
 =?utf-8?B?bVlUbHEvMlRHdW1mNWhlZzJqc1I2c1dOaEZFRmhuWDZHaW80a0VuRGVCUGRr?=
 =?utf-8?B?Y054RVM3eTlNOTRyNXJaenhTTjFqNUhZR0hFOUNaRnI5azkwQ05ublBZWDl5?=
 =?utf-8?B?djB0UjcwVVpvOHB3aDFWdnNKMm1NWlh6M0R3QVdmNDZ0MWFjZUEycmxoNCty?=
 =?utf-8?B?U2VPdHJNcjNOKzl4TVZndVpSc1hPU09RWCtmZ3BBelRHbitONXkxRTcyTmRi?=
 =?utf-8?B?K2JpblFHR1M4Q1JvbW9tSFIzdWtndHd6YW5nWXg2RDdyd2c2QkJ6ZVZUdmRv?=
 =?utf-8?B?NTZ6WnVKN0FHRHgvWTBZL0NyaGFoRG5DUkRmUUxucHVmajNkSE9sNmJ6d043?=
 =?utf-8?B?dDZVQ0RIUkMzRytoaVJiWlZXZ3U1ZjRFSFUzbk94Ly9xSkhJQldjY044WmVs?=
 =?utf-8?B?RVgydTk3cVRHOWtOdmNPS0ZiR3M2M3ZFbTRpdTdmWTR0Znovc3M0VFJIWVQ5?=
 =?utf-8?B?bmNEZTVNT09RdjZlQVowU21RU2tPYTIvdmRYeXNDMHh0VlhncEpYTjdSNDBO?=
 =?utf-8?B?SjRoWkN1Wm84VTN0TE81VDlRVXI3V2hWcmpFMTFld2VaVzFhZ25xeS9ZQ1Z2?=
 =?utf-8?B?WVlobnp4ajBaaCtXRnlEZlFJRmRMQWNCZnd4Z3A0WXExVThSYk9LbFlMbHBr?=
 =?utf-8?B?RDFKcjJWYWoxUnFPL3oyWklDd3JybDNxTzBwcTErUEtQbldOZXZOWXVrb0Vq?=
 =?utf-8?B?cGxSS2I1Q1Z1RXhTdDR1NUcvVC9xRUU0L1lHZ2VHR3laaDBKQVhVK3N6SHJJ?=
 =?utf-8?B?ZDBKN2ZsSUE4cURjRE00WVRhVWpNV3VvcDVVWmpzbzFNRko2RGRXNjhzZVBr?=
 =?utf-8?B?MVpLa0hOTjhmVjJVUjVNQm1xNVJ2MHU5a2pESkJoRjhqNHo3Zk5HKzh5T0pl?=
 =?utf-8?B?RmJxNVozUGhHZ2U0YThxdFBGbmNwRXduTS9lSTlzUHZDM1ljVHVCc282YUJX?=
 =?utf-8?B?RUh6Q0p4QlV1TjFUOEdDOGZjVTNaSWFHdEkwSE9aZHo0Q0VONjFqdFBXblhs?=
 =?utf-8?B?YUViMlI4djZEeS95c01JK1Y1L0k4QlVKOTBZLzAvWWJSV1V5Zk5ocHh5c3Zz?=
 =?utf-8?B?Z0YrdVZ1QW16Q1g0T21aYUdDTDJLWWI3Y2oxb2JzRTFkNjlYSDg1NDV1c1ZD?=
 =?utf-8?B?NVJCakpQTklwMzFCSnh2bHJZaHFhL3NqaFd5bEVuOXVWajZuTTBZdkpaYlJ4?=
 =?utf-8?B?T1ZjcnlFeGwyYUdjRjdPLzJvM0NFQkI4VGlYNnFuMitLelAySE1wUFkvRXNl?=
 =?utf-8?B?blZQdzIxL0oxTURSZFVjVjh0M1BVTVcrditlUlZCVVR1SDB3M3lzQU8vWmRo?=
 =?utf-8?B?dm9KU2tCSFljZUVJNEc2YXl0aUlUekFCakxLTWg4aUxDZURza3BBVlAyQmxJ?=
 =?utf-8?B?blFjT1VFc2VxT3haV0VidTBhSDNJMGhCbjQyR2pROTBTR1orQTM1clV0RDgv?=
 =?utf-8?B?MVpPOFFSWktkeUI2K0syekRZMjNrUWpQRWg5RE5tSlhGcjdmWjFMYlEzc0hy?=
 =?utf-8?B?cWpGbjJwckZnSlNMZXl6VmVKRWJlODNKS1ZwdnNGZDBVOHJ0VkNWWVlhbnJG?=
 =?utf-8?B?NlFzcU1zcmIxdkVoeXcyejd3dDRJaTRIMmtUTWQ2TytCbytjZm5Ib2gwR2Iy?=
 =?utf-8?B?eUpHRnh1UmpYbHdqQkd1Zjh0TGJSZ0NveDEzbXhNSW1HaVJuKzg3bUxXK3BW?=
 =?utf-8?B?czJrbHVrNWN1QTREazRkdjZzWEk4aXlxdUlPcVhyMlpqL2hKS09JejVuc2ZQ?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a45fc5d-261c-4e8b-10bc-08dabdadb4e8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 15:11:39.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqDh1VG3q3nbUj/yRzPHcgUF41F+Q63zAJmbWoh5T3FRDHwY9ZSAGj22jNBTPESgrtdP3kBY3jHsQ4Z2216NLwkRxYvfWxTWL5BpG34I+M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
X-Proofpoint-ORIG-GUID: cYuBaUa4MfIN5Qjg8nj2tzID7V5LQBZU
X-Proofpoint-GUID: qO8JYj8Ft9rVK4WgvYrNZrJIO3gULCwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2A3CHBRW024709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172636

On 2022-07-27 04:32, Paulo Neves wrote:
> I thought of that myself, but did not yet investigate. We have=20
> hardcode_into_libs disabling in 4 "recipes":
>
> git grep hardcode_into_libs -- meta
> recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch:=20
> hardcode_into_libs=3Dyes
> recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch: if test=20
> "$hardcode_into_libs" !=3D yes || test "$build_old_libs" =3D yes; then
> recipes-devtools/gcc/gcc-sanitizers.inc:=C2=A0=C2=A0=C2=A0 sed -i -e=20
> 's/hardcode_into_libs=3Dyes/hardcode_into_libs=3Dno/'=20
> ${B}/${TARGET_SYS}/libsanitizer/libtool
> recipes-devtools/gcc/gcc-source.inc:=C2=A0=C2=A0=C2=A0 cmd =3D d.expand=
("sed -i -e=20
> 's/hardcode_into_libs=3Dyes/hardcode_into_libs=3Dno/' ${S}/libcc1/confi=
gure")
> recipes-devtools/gcc/libgfortran.inc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e=20
> 's/hardcode_into_libs=3Dyes/hardcode_into_libs=3Dno/'=20
> ${B}/${TARGET_SYS}/$target/libtool
> recipes-support/db/db_5.3.28.bb:=C2=A0=C2=A0=C2=A0 sed -i -e=20
> 's|hardcode_into_libs=3Dyes|hardcode_into_libs=3Dno|' ${B}/libtool
>
> The hardcode_into_libs=3Dno did not fix things for the lame case. We=20
> have a patch for libtools that looks like could be the culprit and=20
> need tightening [1]
>
>
> [1]=20
> recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being=
-encoded-into-RPATH.patch


Paulo,

Can you summarize where we are with this bug.
Richard thinks that there has been some progres...

We were reviewing it during the YP bugboard.
I've put the bug in NEEDINFO.


Thanks,

../Randy



>
> Paulo Neves
>
> On 7/26/22 23:34, Richard Purdie wrote:
>> On Tue, 2022-07-26 at 22:23 +0200, Paulo Neves wrote:
>>> Due to hardcoded rpaths tmpdir contamination happened on lame
>>> executable. This commit hot patches libtool to not hardcode
>>> the .libs directory in the rpath. This solves [YOCTO #14863]
>>>
>>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>>> ---
>>> =C2=A0 meta/recipes-multimedia/lame/lame_3.100.bb | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb=20
>>> b/meta/recipes-multimedia/lame/lame_3.100.bb
>>> index 5b42795f4e..2d9bd9d29f 100644
>>> --- a/meta/recipes-multimedia/lame/lame_3.100.bb
>>> +++ b/meta/recipes-multimedia/lame/lame_3.100.bb
>>> @@ -24,3 +24,7 @@ FILES:${PN} =3D "${bindir}/lame"
>>> =C2=A0 FILES:libmp3lame =3D "${libdir}/libmp3lame.so.*"
>>> =C2=A0 FILES:libmp3lame-dev =3D "${includedir} ${libdir}/*"
>>> =C2=A0 FILES:${PN}-dev =3D ""
>>> +do_compile:prepend() {
>>> +=C2=A0=C2=A0=C2=A0 # Stop libtool adding RPATHs
>>> +=C2=A0=C2=A0=C2=A0 sed -i -e=20
>>> 's|hardcode_libdir_flag_spec=3D".*"|hardcode_libdir_flag_spec=3D""|'=20
>>> ${B}/libtool
>>> +}
>> Any idea why lame has this issue but we don't see it with anything els=
e
>> using libtool? I'm wondering if there is an underlying cause we should
>> look at?
>>
>> Cheers,
>>
>> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168549): https://lists.openembedded.org/g/openembed=
ded-core/message/168549
> Mute This Topic: https://lists.openembedded.org/mt/92636379/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


