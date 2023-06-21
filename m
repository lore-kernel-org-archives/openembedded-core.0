Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4A6EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:58:43 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.3927.1687366717264614935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com header.s=pps11062020 header.b=lVv1cN0d;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=55365019b9=charlie.johnston@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8PUBt026044;
	Wed, 21 Jun 2023 11:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=Ussxnh0SnkRxf1IjDjwyvt3Zv/7qWVQz+IWXa5gmXL4=;
 b=lVv1cN0dOF/Ys/To92s34QKN6OAziWh1wpq7NXsLNxvQYPZjDvAE0QtmdJxL3ABqeJ1d
 8MR1xYbJd+V5K/hDPaJmX6WNWkjAQxh1tkozHi4ibtx699ompQD7HRIOUV6BHo7Vzfv/
 GoycncJJqrd2Nqk7gucagKTehhJRPc09oENm89NGXzEvVh7ct7DE4QVKlnwdo6WfsObF
 LZgJLTsh2ZniXZyATfjLQyc5hw7xe44i9jPEKLxci+X9SeHw6OHVtcfXXH1FemudflVn
 3BmSoTQ4Ouz4Xs7r9Zi2qGYpMZcEQAU5ohymRaAp0it1gt7IN4H+fKTCSS+GUs7SEzd9 QA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3r9an56kym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 11:58:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVi8R1y5XE4VaGwDIdoF4YTsG4zyzKOexcz+lZMP0xh4Xw3fAc+X2ajjI34tgVUMTEf7oWPZqIncGoNu0fMwiPVASsgv75OcxrKvcKwPILt+ojsp7AlFahjJARu15eRJPIije1JhWoBcPW7RiCfhOZTPjgRw1YVQcBUynWcBvgE7f3fCT/EYFrHUU87AXGIaXcjzH7PWTikWMUnz8+UqeqHwLoX3xlOYHYY6zGMTbAOULKIhnzdLrfgrYf3V4X2mHRqsbrF/tw9Q2MY0ebuaUIEuVFCgB+wLbWxykzOxN9uMDpXDZ2C0vR0UF9VBuIJtGs4fuql308q4I7m8xF7HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ussxnh0SnkRxf1IjDjwyvt3Zv/7qWVQz+IWXa5gmXL4=;
 b=MfMEL2uJ2j3Zf7HBYoPXAHIv7QUUAyqkD/62Ydy/dEr1R3LmbGOWTgq6TZ0pEJxSdkDE2u98utEnXHybAwCpf1LdGN7mUHF8GSUL1sxtWMFBYwhi/vW2xgsurHbs0TKwa6Er97XPrF0M4x2dDLD5d1vv48yOcoO+4TI1tftfk5OozzwCdg52eyYo1Dl2mVYvmPqx0txmR1xM9GKJdAxVnKpG37awbyEj3ltBz9UCb7MgfWVvFhCRgF8zgWHT+Owgv6J9amzwwNsLT9InRGB4DsqtduVJnDV8uOqfmOe4wGEreWuf7VrsEWKWnv/PVbBGAUH6lIQO2fiQqvbAcLt/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ussxnh0SnkRxf1IjDjwyvt3Zv/7qWVQz+IWXa5gmXL4=;
 b=XTWsPjcZxoXvI8dbbliBGO4dnnK0lK4BPMwjRpsgi/e2OfPubMFwou3RcbcbYIuOrUguUkeJpB/kNy+2hFU6Y+6ZQSJFyiDzUWHAtz7cEfijY4FKR9lq5nvZm+5OMBIiWAd8op2J5hN2Sn+yRdhYEkMzpDE3cxyrUbF5PdUUpr0=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB9057.namprd04.prod.outlook.com (2603:10b6:a03:53e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 16:58:33 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 16:58:33 +0000
Message-ID: <7f54a675-add4-54a8-1b22-227841244e17@ni.com>
Date: Wed, 21 Jun 2023 11:58:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] Building SDK from Feeds
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.stewart@ni.com
References: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com>
 <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::6) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d343cd-c1f9-4b2a-3a85-08db7278bf16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pSNXYF1Y5SKn4IU8Q4y+uqUa2lHjkZuJEzFMbn55j/4p6v9h+RgW5rm4M4UnY/J6HrJQuc0ByR8cSjSHs9YZiAYVA+s5OAybz6/2zIqGUiSoTSBFflXK6jKRfbxxSd6rIwzWDSrvHAPMuBKw+UCzomv5MAiGuMVo3eF+bHJN68LaGyfllkybi5GDDYxGMuJsZezHFtU8sdlvsTy4RoAt4V0zDS+8b7uX8QTFC4CwyS/rrA5FhpH1zDBlsfsF6WYQz/5uOXuziNbqilfw/z7KpmlRaNZQSrTjBM62YjJnQAjNz2qhPJpQ5bCytanCFgKi5koAW2czV9khA9Boi9egIIYLnxmIP3tGjJlx9HbJxfT4PKPpXpofHAK77aXFv7PHUCSv24J4gdh7k41uJ1ykQ7wMRpsPUqlo4I7a2rQQUSPp0jgIdLTZn31tzMsjf+g9JxR2VjDsRwIBGXGUfOmBPfhyQzkXSwJKq8LPq7zIgZK2mQCEpTQP0Vo0HlLzsHdTjrZ298HZThp9KJXOWNE1zCO8sX12122uVeRbMWXXWsNUx+rBFKxOCFYgRFM5l86GH0xDPSpuMHCMWtvhMDnHZTCd8mLDCT+yq9b2l+HMFZY1cw7ofChypDT36vUlHhSub9rGAGiaf5keAz8i3x/Zeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(66556008)(2616005)(38100700002)(83380400001)(66946007)(66476007)(6916009)(41300700001)(8936002)(8676002)(316002)(186003)(26005)(6512007)(31686004)(966005)(6486002)(53546011)(6506007)(66899021)(478600001)(4326008)(44832011)(5660300002)(86362001)(36756003)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmUvWVBHMnl5VUlCNmt3UHc3ZFVsTTlDZEtoaEg5N08vMG90cVY3Z05NOHEv?=
 =?utf-8?B?d09vTXVQV3BWOTIwRXo0Q2R0ck8xblRpSFQwWHlhNU1ZbkxMSmZYcUhjUDdz?=
 =?utf-8?B?NXlTUkFiMHNTRVZvRXEyckQ2Q3BVVURoSE1LQ2FBdVpHbGVrdE5qeXlLTHQ2?=
 =?utf-8?B?WnpNVWFWNjM4V2w5QjduanpUSFNWM0p6dTEwSjZGYm9JR2lPOE5LczJIdW5W?=
 =?utf-8?B?elhJTy80RSt5V2M0ZWYxVG5icktYOXRlYWpJQTRQYUJ2ZkZnNVl1YXNiZExu?=
 =?utf-8?B?ZWYrSjRrR2FkV2t6Mk4zcTM4eUZsdUtaOEdoSCtGUEhXbnlhUkhUR3NQcSsr?=
 =?utf-8?B?UERUQWNvU3h6RVVZNEdiTnB4OVgxK0s2V2NRWGxLaGUzQ21CRDI1ZVRmTC83?=
 =?utf-8?B?V05pTHNkak14WWQ3cW96eUVsZllFdEw2ejdxYkRnVlRyTWp3VEJXbm9BSXpp?=
 =?utf-8?B?OGNRUzZHZ1NBZjdNRHNKeFRDQXFvTDQ1bWRTQnpsZDY0dGJDQy9mMmRPUENZ?=
 =?utf-8?B?V0tpM1FrcUFYSHNWTkMycE1NeXN4Q1QxS1hxQUJWZk4wcGRGdytvQ1Vhbmc5?=
 =?utf-8?B?S1Mya1lmSGpiblI1L2JVUVJxYmd2QnEvRS9KTE15MWFMMVNSWWE5VWExYm8z?=
 =?utf-8?B?dzhONDhpdzY4dWtOWG1nV0hNRzdSSUxmTTU2UHRrelU2VFhrSldkaC9CYW84?=
 =?utf-8?B?SFBmMWxpeEhmU0RIZi9seTZkYmdFb21DMUVuWkk0aGdOWmlGNlI1cFZISjUy?=
 =?utf-8?B?ZVBKZk1kMzBVbjd4b3I5ODQxSXlmWlE2MWowQVdSMDY3V1RXNEJhM2ZaWG83?=
 =?utf-8?B?MnRySWgvN1FDUEpIaktIbnkvYkVveE94bFZwQzc0M1hWdHp1VWkwS1V2TEVK?=
 =?utf-8?B?RDJxOHVPMXJDQnA1ckJEdUZmY21FRWhUcnVlTy84RnUrVHRyV3ZhZDdoSmhj?=
 =?utf-8?B?d3JSTmd4OTNSVGlBUzl6SmlaYTgrdDkvMnVpNG0zN1BxQStpS3JSREl0N1Ju?=
 =?utf-8?B?Y3hxZWM1My9MTEpVK3NWVXNocVA4aVBndk50RHZ3Sm4xSFhFamRzVW41azd3?=
 =?utf-8?B?UmNYOEZVbGZ2QzFFNVAycitoWldWYkFtdllWT3pQbDIxRmttQ0hJUTI0S3Fv?=
 =?utf-8?B?dDdXMG5tbHRxSEdWdVJqVmdZczhvTTdkNW1IUnVaK0xBU3psVU5CQnc0T0Rs?=
 =?utf-8?B?RStlZHFNM2ZyMHhPK0ZwRWRoYjNYUzJmb1h4SlJySTlvRVdrY2lSVnFkNlo3?=
 =?utf-8?B?NHVsdmVsL3F1WER6ZTR5K0VrMEg5aFlpMUZzZ2lUOUdPWEFqcVdPZ2MvcTBx?=
 =?utf-8?B?ZkgrTFJ6S2k2TGtWdVdWZHUrZ3BsYXdla29OZjl2VGNaZ3ZwVW9Vd3kzM2lV?=
 =?utf-8?B?d0VPVE15czVianJUMmdaYUpRVkV6M3lZOUZZRWw4VGVVYUxFY3dQN05Ld2c1?=
 =?utf-8?B?OXl2UXJ2MGxhQjVVZExzUktKem9CWnRZUVBnaTRNVStEY1Q3MkVPT3daczVD?=
 =?utf-8?B?RTlMZ0hyRk84NURnTjdUSG1LYldKbWtVYkJzM0IrYy9JZG9nOG1rblF3eTNz?=
 =?utf-8?B?MVAxSTltWGNzei9tcXRqdWV5VDV4RkgwQWsvdHkvbngwdUpjYjA3R2FyUVlI?=
 =?utf-8?B?Q21MbTVxRzNlT2NTSUc4NTlwY0NaUmFvQ3ByeURvTHJnanRLYnRHbG1NZmhC?=
 =?utf-8?B?ZHFBQnAycXZ2Wi9TekFlbnZkVE1HbWRpSExROE9XMTRKUUxROXVEc3hvYVcy?=
 =?utf-8?B?cE0wOW5sZC9Mc0ZNcVAwREdWVHI0YnNySzhTMTNrbSsxYVptSkIzRWF3d1lj?=
 =?utf-8?B?TWNYcFhsKzBSbCt4MngyREZrZ2Z1MWpiOVJKSHhIUWNTK3BSb3JoSkU2cnpO?=
 =?utf-8?B?YmxxWHBMTlVNa0FDYWY1eHh0U3JSdFVUNWZLR1o2M1ZHSGlRaXF5RmNCMzFV?=
 =?utf-8?B?eCtNQjdWYWtPL3JzMzdRMS9SSm5BWkZNdk1BdVdoSTcyNHBFMFl4NEZwdVlq?=
 =?utf-8?B?SG4xYUhMcFBXbzlPcmd1L0w4OHVQdzV1RkZuOWJwaWtHQmtGNW5GZFp0OGVN?=
 =?utf-8?B?WUV5cWJkSDRoaytjeVhkdVkzUXpCUVpWbzQ0VktkeXBUaXBhekx4Uk1wRnlT?=
 =?utf-8?B?eUxvbU1ZZGZqY2M3czFHUzNPQVpIckNFbEErbnI0QlNxckhnZzcvWWRRTHQ0?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d343cd-c1f9-4b2a-3a85-08db7278bf16
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:58:33.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLQHj8jgLVDiYUEeI7Oc19YR98C88D0hIJYdC8edLaw8/ehmJgpWY/5AAWj0mijm4WC6ETwMVnRROTGkuWYRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9057
X-Proofpoint-GUID: K0SzxQBg0d_3MflxROnuMGcX8K-N9niy
X-Proofpoint-ORIG-GUID: K0SzxQBg0d_3MflxROnuMGcX8K-N9niy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1011
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 mlxlogscore=627 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-00010702.pphosted.com id 35L8PUBt026044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183193

On 6/21/23 11:52, Khem Raj wrote:
> On Wed, Jun 21, 2023 at 9:47=E2=80=AFAM Charlie Johnston
> <charlie.johnston@ni.com> wrote:
>>
>> Hello,
>>
>> I'm trying to build an SDK (or even just meta-toolchain) from feeds. F=
or context, there are some dev packages in our feeds that aren't in our O=
penEmbedded build that I'd like to include in the SDK. The normal process=
 I use for building an image from feeds is to build the packages from OE =
locally, build a package index, and then build the image using those feed=
s and our internal feed server.
>=20
> How do you do that? do you have a customized image builder ?

We use BUILD_IMAGES_FROM_FEEDS and IPK_FEED_URIS.

>=20
>  I'm having trouble figuring out all the architectures and packages
> that need built to do the same for the SDK.
>>
>> Trial and error got me to a few of the dummysdk architectures and pack=
ages, but is there any documentation on the required packages to build th=
e SDK that I would need to include in a feed? Has anyone tried to do this=
 before?
>>
>> Thanks,
>> Charlie Johnston
>> e. charlie.johnston@ni.com
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183189): https://urldefense.com/v3/__https://lists=
.openembedded.org/g/openembedded-core/message/183189__;!!FbZ0ZwI3Qg!qa6SD=
HssPBrq2FqBFAP20IFtUc_1ZwFNBZ2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63xO9=
29zE0$=20
>> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedde=
d.org/mt/99680369/1997914__;!!FbZ0ZwI3Qg!qa6SDHssPBrq2FqBFAP20IFtUc_1ZwFN=
BZ2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63xeX1JCHE$=20
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.or=
g/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!qa6SDHssPBrq2FqBFAP20IFtUc_1Zw=
FNBZ2Eb2GwiHfbMH_EXNtRBhK_4PcthoywMYetFi01E63x2Ls-m1k$  [raj.khem@gmail.c=
om]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


