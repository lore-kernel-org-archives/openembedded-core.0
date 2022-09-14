Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF96C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:37:49 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.906.1663169865569852520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com
 header.s=pps11062020 header.b=TWfvv9g4;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=6256703cc6=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E83gNK012751;
	Wed, 14 Sep 2022 10:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=H8yboR672QdmFzy7LNDiJNvbgoge3Uwyb+Hjko8VNKc=;
 b=TWfvv9g4kPhT8FktK4g9v61JylMuGBlAf3PgX5PjtGWqbrqNgz6R/ynSFzB5YWxIbEGs
 6nHspORjQgrT2WzZFOWdpaB4zTWUQM/hRP7fwkUgtVVLcslGAhNKkUIQ8ifd5ameZZQm
 WfiG/XT0ym4wWgDh5/cFzhwCyKWm2cJ1oeP/yz1ERAu6lMOOAxzJRvPabIjqAyoqcR2E
 heqSyWQqO/a1cPx8bXmpaRHJdC2lJWP8bqfuMLHANBYhVfDcXMQYDunxr3cBb32jPyN9
 5XSnC8vgcoZB16F5YXqdJs9yYQNSK7ZZSl2gNqVmv+mCTZUbw8mQTOs0AXAqyAa5Pvhl pA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3jjya71vgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 10:37:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf2e4cT6qu3CtAMZs6V3K/WmTUfL/KxzrQjyFZ/kWnFIetzHfyNmRfLedmYB/vwh9eFGLWEeexTRl6GUfH3Ac63BTUlFw14mKIlOX+DPzmc3johnBMqM5tinCgvmQgCsR0wFPKvTJrUxYfRdcI+XjZdh9xlVeG+gPuILUE8zRblsJkR+O0Z19uVtaotMAW+JLgEHrJSk7onoNpTl6W6I3DcBUjKhjMPorrswKv9eopsRnJHkhYiBnfbu+BOc0KlkoCbXlbRDwyYibkP6MZxV/gcPDKdEtNgLlYM5j3EOfTv+1mAk1dl+cEzQy1BDMxTZA4Stexx+II4/M8PaPndZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8yboR672QdmFzy7LNDiJNvbgoge3Uwyb+Hjko8VNKc=;
 b=UrUnk19R1AKP9JpT5qRks/MNPXd4Yf/BEJqO5gsSXQOAfVYTH4X9GleAbdhdv+3ZCQXBbeRXAVZFyY+DjoFJc+3PWvRZ5TPyssv6CN9r1xjpssF3y8ytZTCjX09LmouBXcKbE+YJv9zUpED2145vGtQEpPTnvplGB9K7N1V9QUIbRMewUywea/onLpkhOWLngU5mReAcT4/seVmAPYtbqB52diIVBST1G/VeQsHpLfm+AzFMTQN5HCEP7PpNn97JG6xfoepU5I8MphcGQ5qErDmkPEBKGe0x3/atRYZvMRD2f3T0pCOcOH5nh/Irh5CV70r1s8tBpAdEV9wFHdV8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8yboR672QdmFzy7LNDiJNvbgoge3Uwyb+Hjko8VNKc=;
 b=LvixBubbZNETFygQHfYWjH1qXJxmbsa0xsO366dfAvOhF5W/bbksMQloiRPKwhzVrncqULZfDkOUuKnh4QsI2/HUFx/MIimgyd53kiAyFFdH8DkAHGAerliSow7/EGjJ/Qs8fACE9XgYPKbCvP1s2O9weeOwncnXvecJE/jGzJE=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BYAPR04MB4071.namprd04.prod.outlook.com (2603:10b6:a02:af::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 15:37:41 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 15:37:41 +0000
Message-ID: <7c864dd1-27cc-ff28-dccd-8370ed5fc61f@ni.com>
Date: Wed, 14 Sep 2022 10:37:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Etienne Cordonnier <ecordonnier@snapchat.com>
Cc: Alex Feinman <afeinman@snap.com>, Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org,
        Etienne Cordonnier <ecordonnier@snap.com>
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
 <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SA0PR11CA0132.namprd11.prod.outlook.com
 (2603:10b6:806:131::17) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BYAPR04MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 693180e7-ca81-464d-17fe-08da96670f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jbNnRpVf4O5PpTAHOqTmdp03QNdIZKxGSm42Ag1mjxkItnmLE57Sygg9ST+p4uVFuHvGBEOw8iW26y5DbRD7afmnWQKZ3XajPVlmylPINM4FcqBd6ka8VRUKoEiOb/yOUD9HHACXQSy3C8w8ib6lh+MDFZ/Um2FOsCMCfvI/r1gXB6D0M+Tq/Sz1kIMOWjV8DiR61PaqBvQL9oGzZfMYd/q5zVF++JdjZluMlNQpbfRBAqgFpwN5GaCGLA1MwUvKD/PwwayEogoBRyxzj0LLE81k+aQG1pc49hzbO8kshOYmvGIQDTO8MC1lKCO9YKgRH6DbzxbxL7F9YMNhO3FI+FveCnStYYwRJAzsOzJuzpvjhrSyNycHZG0YrIHlghTxbCsB7SElyoS07OYXV0U7SX4dPSW447xkq1zYMLm+5BK//4rK4z9ss3t4eiPj/F0ycctQI88ZVT8L0c7L3ZBUvg7ZdJBRYjUXMf69bGorvw+1B4ctfwF1h3lxoenpuGGsZAnJgQGXi98NinpYq5VQd8z5p40tBqgYTvSBe6EMoUFRsRilVPDT7c8GXjoEjRvsa2mArGMF4HVaO1xCIg6dGc+ZxHGY0e2x9TmUpwR01AoUCErpeAY2Czmlj/vUxZTFGqvyvkDpHGfToKHCFbgHUolgKJRD98uJqZu68uL0XsDQLPbQrppDZ08xxQ7nK4lm6NhHvEFBWdIesQsVrnc+YoHYsES/qcJxh2GlEWvo6jwNlp6VOMndA1jFtyLuKm4uWS1mupsqY1udb5yiisxJSLh5pf5mEuRULxLuMe0FEOBpC6yncRd25ySM1wakcT/V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(6916009)(36756003)(316002)(83380400001)(6506007)(6666004)(44832011)(6512007)(966005)(478600001)(8676002)(4326008)(53546011)(66946007)(8936002)(31696002)(36916002)(41300700001)(2616005)(66476007)(54906003)(5660300002)(66556008)(30864003)(86362001)(31686004)(186003)(6486002)(26005)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VG9EYmZHbGtmYmY1SXZBMmNjTWVlZUQ0RWtOOW9adFFNSG1vc3NpU1R6Mmdp?=
 =?utf-8?B?N3N2b0lPbmZPbGhrWERKV1g0VDBDQzc2RTBSTHhlenF6TWg0UTFHak4zRmFJ?=
 =?utf-8?B?SFlUaC9nU3htVXRVbVFiU295ZjJzbktmQ0J4UklXdGhDR1Vyd1diR2pYUXpD?=
 =?utf-8?B?aFU3ZTd0Wkd3ZXR4SnpsaVJIc0ZiYmZSdVZmVFVDdHdsUFJEY2pYaXduUmRk?=
 =?utf-8?B?S2FJQkZEMitwVkxwY2JyWFV1TzRtSnF0UEhpNmJBM25zMERLZTNWNmZyVk13?=
 =?utf-8?B?Q2VsUE01M3ZqWXQ4S0JxalJMdjJLL24xQlYyREFMWWFydllPYnBiaVJkWDBq?=
 =?utf-8?B?T0NWWGtwSWYwdVVhRFhTUHZuT3k4eC9hNnNNNzV0M3ZqWjkxc0dwV2pTbVQ1?=
 =?utf-8?B?OWk4ZlFGVTdmd3d2dXhid1ROMVgrUXdlcm50akNEQlZMcklJWG5VbGhUTlg2?=
 =?utf-8?B?Z3N5QW93S3R3bnVaOHRzMktNYnBJS2hjd2pCRGRJVzlsNlkxdjVYMHFZSkF4?=
 =?utf-8?B?emc4T09zejhsWGxzdTdGK2p5S01NbTZ3UXE0YzVRVG9xQWcwVTcvZVVRTExz?=
 =?utf-8?B?dG9sb3FmcHZycGZCK0Z2NUhWWW1Qa1haOURKRkt1YWF4bFZOMEw5bEkreUNw?=
 =?utf-8?B?azg1U0g5SVBFUnViMDBsbGJrUExzaEtpOEZ0c21uV1gvTnlFWkkwVlpZVVM1?=
 =?utf-8?B?OWliRmt3RzZMcnN5bU1NS3g1aEthZVJlU1BxWndDQTNQR016YytzQWdnSE40?=
 =?utf-8?B?VzYwSWFIUDdkUGdEY1YxRlBGNXVPWlNaMEhNa25MN0hVUXFMZGIrOWJxUy9J?=
 =?utf-8?B?K0M4WlFIMG5GZTFtMVZNc3ltZDhJRkEyS1kwQWpCcnFCcWVwSStldnhXUHYx?=
 =?utf-8?B?UzR4NFo4UnJPTmxXZ2dJQVNmMTVuS1JzWDZpeEU5c24vTEc0a3BBcGxwN1Bs?=
 =?utf-8?B?U3dMMUR5NEZhSE9rL0EyNkFCd09CZVAyU0lXc2RWdUUwL1NLT1RVdk5La1pG?=
 =?utf-8?B?NkZKZWlaQjhMWm5iS2NUL2FXdVZIOTNETUlHWmhSUGRSRjU1M0U1eHBXWWVp?=
 =?utf-8?B?dFEwYXFQK09mZnFvc0l3eGJyeC9RYXVEUitnNWc2eGNFL0N3ZjhTZjlMRUcv?=
 =?utf-8?B?eEx4WFFLMDRUNGt3TktvTEs4Tk5vbkQ3OEczbUdsc3Y3dzJHNXk0MDZrejBK?=
 =?utf-8?B?NGc5YklxYnNFSmg1TXlUc0kyc3NCa0JoeUxvU1JJbHo5dUJyRTBlNFJabmdo?=
 =?utf-8?B?V2dZbTBXVjJOV1hLeTI0aXBjOGRXNHFMQ2hOejdNOUF4MFU0MjV6bWVBeWtE?=
 =?utf-8?B?a2c1bDErK0lrc1lTOVpCYzBGeHRXYWkxdHREeEVyYjB4UGNZTjdBNFg0b2o4?=
 =?utf-8?B?OVd6QU1tYk5DTzBnZDFNbHNLdk1ibkxiWElrckhoU1ZFM2hjbFdZWnhlaWxU?=
 =?utf-8?B?eHhkN3pFMGtZMENOSW96N0JpME1zRjlKc1A2bWlHQXZjWFJVcXNOOUVoRTJI?=
 =?utf-8?B?SVMzdlNGSlBoYlU1dUU2NFJSQ1cxRDE3eXRKT0x2b0xPWXZ2QktHWmJvakU2?=
 =?utf-8?B?TEY2YkZUQVRub1JUNEVtYVlyUHJ6MzI5RDB0cFBTYXhOdEJlbmFIbW1HZEJD?=
 =?utf-8?B?N3VNVU54ZFF1SnNqR2NEd0ZZcEM0Rk4rTzdpZkxGVjZTU2U3Tm5uN3pwMVpz?=
 =?utf-8?B?ZzQvZHFUVnZ5akxLVnBWNW1rczdkSTZJVC83QzNCOG1sOGZUODc0ZXlEY3hF?=
 =?utf-8?B?aURPS2pTTC9RNmtUS21qekFSbWFBc01CdkhJYm96L0puUk5GcmMyaWdEZXZV?=
 =?utf-8?B?Z1YvbStxT0lWT3haRzFPdDVmT2JHcDVvUWgzT2R0SFFvZEcxNUZlb1hzbTdR?=
 =?utf-8?B?YWRhN29kbWNQN1RVQmpQK3JFcUtwS1ErbWFEZzVDWXlWQWlULzRMQ3poZ3Bm?=
 =?utf-8?B?d2dFV1plQXNNNzZrcjdnVDFyYjV0NXZ3SVhtN0hSWUQrSFJFVk1tN1BPQnJO?=
 =?utf-8?B?ZEM3eGF2U3BzdFQrUHJ2Mk5zQmhJdTVPLzRjVE5NTVZ1QlU5NS95WWphWUNI?=
 =?utf-8?B?dmxkUjc4RTRzTkdoTmZlNm9ER2ZmL2NUangvNys3OTNHdXpNRmFXYXAraUxG?=
 =?utf-8?Q?2wLXqMou3Qx2ovww37am4tIGf?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 693180e7-ca81-464d-17fe-08da96670f6b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 15:37:41.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5tE9eShv+etrLPJezcVCX0YM29OAPf/TaVAx9V4nb0RllKn0hPlL1T3TCi6zjIOsUoxeUpb83TKelKaPf9/dgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4071
X-Proofpoint-ORIG-GUID: u9b1dMVicgNZXI_KGxBIYnyE7pETG6og
X-Proofpoint-GUID: u9b1dMVicgNZXI_KGxBIYnyE7pETG6og
Subject: Re: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 clxscore=1011
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-00010702.pphosted.com id 28E83gNK012751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 15:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170664

Thanks for checking.

I'd be interested to know if setting a higher compression level for zstd=20
can get us to a similar compression ratio to xz. If so, then I think it=20
could be some real value to distro maintainers to be able to *tune*=20
their compression.

That's not blocking for your new PR though.


On 9/14/22 05:08, Etienne Cordonnier wrote:
> Also note that zstd's default compression level is 3 per default (from=20
> a 1 to 19 scale). I did not test other compression levels.
>
> On Wed, Sep 14, 2022 at 11:58 AM Etienne Cordonnier=20
> <ecordonnier@snapchat.com> wrote:
>
>     I ran a build of=C2=A0core-image-full-cmdline using xz and zstd, us=
ing
>     pre-populated downloads and sstate-cache directories but with
>     empty tmp directory. Here are the numbers:
>     zstd:
>     bitbake core-image-full-cmdline took=C2=A02m52.768s (real), the
>     resulting directory tmp/deploy/ipk is 1.6GB big.
>     xz:
>     bitbake core-image-full-cmdline took=C2=A04m14.214s (real), the
>     resulting directory=C2=A0tmp/deploy/ipk/ is 996M big
>
>     So the build with xz is 47% slower (254/172) than with zstd for
>     this "incremental build" use-case.
>
>     See the 5 biggest packages, the difference in compression-ratio
>     increases with big files:
>     build$ ls -lh tmp-zstd/deploy/ipk/core2-64/ --sort=3Dsize | head -n=
5
>     total 1.6G
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0331M Sep 14 10:39
>     gcc-dbg_12.2.0-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0264M Sep 14 10:39
>     openssl-dbg_3.0.5-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0113M Sep 14 10:39
>     openssl-ptest_3.0.5-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 47M Sep 14 10:39
>     binutils-dbg_2.39-r0_core2-64.ipk
>     build$ ls -lh tmp-xz/deploy/ipk/core2-64/ --sort=3Dsize | head -n5
>     total 963M
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0214M Sep 14 10:44
>     gcc-dbg_12.2.0-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0193M Sep 14 10:44
>     openssl-dbg_3.0.5-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 35M Sep 14 10:44
>     openssl-ptest_3.0.5-r0_core2-64.ipk
>     -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 32M Sep 14 10:44
>     binutils-dbg_2.39-r0_core2-64.ipk
>     ...
>
>     I think for use-cases where the size of the ipk packages matters,
>     xz is better. For use-cases where it does not matter (ipk packages
>     not deployed), build-time matters more than compression-ratio and
>     zstd is better.
>
>     Regarding the enablement of zstd in opkg per default, I'll send a
>     new version of the patch without this line.
>     My thinking for enabling zstd per default in opkg was that zstd is
>     already enabled per default in libarchive's PACKAGECONFIG, and
>     disabling zstd in opkg's PACKAGECONFIG removes only a few lines of
>     code from opkg (opkg uses libarchive for doing the actual
>     compression/decompression).
>
>     On Tue, Sep 13, 2022 at 11:57 PM Alex Stewart
>     <alex.stewart@ni.com> wrote:
>
>
>
>         On 9/13/22 15:20, Alex Feinman wrote:
>         > I do have some numbers. When I was selling this change
>         internally, I
>         > did a comparison on our internal build.
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Combined write IPK t=
imes (=CE=A3 t do_package_write_ipk)
>         > xz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0162m 35s
>         > gz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A052m 13s
>         > zstd=C2=A0 =C2=A0 =C2=A0 =C2=A033m 49s
>         > Compression rate for zstd was closer to xz than to gz but
>         not as good
>         > as xz. For systems that have to cache packages=C2=A0on the de=
vice
>         with
>         > limited storage xz might be a better=C2=A0option, but for the
>         bulk of
>         > projects zstd is the best choice
>         > Additionally, zstd offers much faster decompression than xz
>         so the
>         > rootfs build step that includes unpacking all of the ipks,
>         takes 3m
>         > 58s with xz and 2m 44s with zstd.
>         > One other thing of note - if your build includes debug
>         packages, some
>         > may be quite large. E.g. one of our components produces a
>         2.2 GB debug
>         > package (uncompressed). On large files xz requires a
>         disproportionally
>         > large amount of time resulting in 15 minutes needed to
>         simply write
>         > ipk for the abovementioned packages, whereas zstd took about
>         45 sec.
>         > For frequent tasks like bitbaking a single package this
>         translates in
>         > a lot of saved time.
>
>         Those are certainly compelling performance improvements.
>         Assuming that
>         the final data-segment size is within 5%-ish of xz, then I
>         would agree
>         with the rest of the thread that it should probably be the
>         contemporary
>         default.
>
>         And if we make it the default compressor for OE IPKs, then
>         obviously my
>         criticism in the original PR is satisfied.
>
>         > Bottom line - I think making xz a default package compressor
>         was not
>         > entirely thought through. gzip or zstd is what the default
>         should be.
>
>         ZStandard support was only added to opkg last September [1].
>         Before
>         that, xz was the new hotness that replaced gzip. :)
>
>         [1]
>         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoct=
oproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa294=
&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpXj=
8jGnouPtGIBYyLIZbG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjelt=
E4Ls8&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoc=
toproject.org_opkg_commit_-3Fid-3D5dead419e94bce2e6b743ad786c1daec0e1aa29=
4&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DVG_fgpCGq8Zgu73KQP1wTtb1D1TZftNpX=
j8jGnouPtGIBYyLIZbG8F-85POUcVN7&s=3DMwoq2kkjfZhto6J5OomduJ5Rhyg_oSe-dkjel=
tE4Ls8&e=3D>
>
>
>         > One final note: I could not find a reasonable explanation
>         for why
>         > opkg-tools require code changes to support a different
>         compressor. BSD
>         > tar and GNU tar both can easily accept compressors that they
>         have no
>         > idea about (via -I option) because all of them provide a
>         unified
>         > command line interface for use in pipes. If this were done
>         similar to
>         > tar, we could have used any compressor we wanted, including t=
he
>         > multithreaded versions (zstdmt)
>
>         Well, presumably IPK creation tools can only support the
>         matrix of
>         compression algorithms which your opkg binary can decompress.
>         I suppose
>         someone could try to implement a plugable compression module
>         system for
>         opkg. But given that nearly everyone uses opkg in an embedded
>         context,
>         I'm not sure it would get much use.
>
>         >
>         > On Tue, Sep 13, 2022 at 12:43 PM Khem Raj
>         <raj.khem@gmail.com> wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0On Tue, Sep 13, 2022 at 12:19 PM Alex Stew=
art
>         >=C2=A0 =C2=A0 =C2=A0<alex.stewart@ni.com> wrote:
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> ACK from me - apart from enabling zstd b=
y default.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> On 9/13/22 07:37, Etienne Cordonnier via
>         lists.openembedded.org
>         <https://urldefense.com/v3/__http://lists.openembedded.org__;!!=
FbZ0ZwI3Qg!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR=
8KlV3N64C3fKRHIcFhOF1_vg$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://lists.openembedded.or=
g__;!!FbZ0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85=
fKXXM_VAHZ2LdFx_bxrNjvo$>
>         >=C2=A0 =C2=A0 =C2=A0wrote:
>         >=C2=A0 =C2=A0 =C2=A0> > This allows the use of zstd for opkg p=
ackages by using
>         >=C2=A0 =C2=A0 =C2=A0OPKGBUILDCMD:
>         >=C2=A0 =C2=A0 =C2=A0> > OPKGBUILDCMD =3D "opkg-build -Z zstd"
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> > Signed-off-by: Alex Feinman <afeinman@=
snap.com>
>         >=C2=A0 =C2=A0 =C2=A0> > Signed-off-by: Etienne Cordonnier <eco=
rdonnier@snap.com>
>         >=C2=A0 =C2=A0 =C2=A0> > ---
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0meta/recipes-devtools/opkg=
/opkg_0.6.0.bb
>         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C=
3fKRHIcFFmbls2A$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ=
0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAH=
Z2LdFx_-65pBFo$>
>         >=C2=A0 =C2=A0 =C2=A0| 3 ++-
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A01 file changed, 2 insertio=
ns(+), 1 deletion(-)
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> > diff --git
>         a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C=
3fKRHIcFFmbls2A$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ=
0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAH=
Z2LdFx_-65pBFo$>
>         >=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C=
3fKRHIcFFmbls2A$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ=
0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAH=
Z2LdFx_-65pBFo$>
>         >=C2=A0 =C2=A0 =C2=A0> > index 7b351e8123..e38d9d6f3f 100644
>         >=C2=A0 =C2=A0 =C2=A0> > --- a/meta/recipes-devtools/opkg/opkg_=
0.6.0.bb
>         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C=
3fKRHIcFFmbls2A$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ=
0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAH=
Z2LdFx_-65pBFo$>
>         >=C2=A0 =C2=A0 =C2=A0> > +++ b/meta/recipes-devtools/opkg/opkg_=
0.6.0.bb
>         <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Q=
g!t0JG8eQqpsPs8clofb2phwJc6ONCKBjy-iQukKenLRVzBQvJrKTp8VsgKBI7cR8KlV3N64C=
3fKRHIcFFmbls2A$>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ=
0ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAH=
Z2LdFx_-65pBFo$>
>         >=C2=A0 =C2=A0 =C2=A0> > @@ -30,7 +30,7 @@ inherit autotools pk=
gconfig ptest
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0target_localstatedir :=3D =
"${localstatedir}"
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0OPKGLIBDIR ??=3D "${target=
_localstatedir}/lib"
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> > -PACKAGECONFIG ??=3D "libsolv"
>         >=C2=A0 =C2=A0 =C2=A0> > +PACKAGECONFIG ??=3D "libsolv zstd"
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Building in zstd support by default is a=
 little
>         suspect to me.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Unless I'm mistaken, OE-core will only b=
uild
>         xz-compressed IPKs by
>         >=C2=A0 =C2=A0 =C2=A0> default. So zstd support would be unnece=
ssary for a distro
>         >=C2=A0 =C2=A0 =C2=A0integrator
>         >=C2=A0 =C2=A0 =C2=A0> who just uses upstream OE-core.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> For distros which use zstd compression i=
n their
>         packages, I think it
>         >=C2=A0 =C2=A0 =C2=A0> would be more appropriate to overwrite t=
he opkg
>         PACKAGECONFIG in a
>         >=C2=A0 =C2=A0 =C2=A0> .bbappend.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >
>         >=C2=A0 =C2=A0 =C2=A0This is perhaps fine. I do wonder if there=
 is some
>         performance
>         >=C2=A0 =C2=A0 =C2=A0comparison data between xz and zstd compre=
ssed ipks
>         >=C2=A0 =C2=A0 =C2=A0with opkg, it might help users on making t=
his choice and
>         also if we
>         >=C2=A0 =C2=A0 =C2=A0should consider using
>         >=C2=A0 =C2=A0 =C2=A0zstd by default at some point or not.
>         >
>         >=C2=A0 =C2=A0 =C2=A0> Is there something I'm not considering h=
ere?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0PACKAGECONFIG[gpg] =3D "--=
enable-gpg,--disable-gpg,\
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg gpgme =
libgpg-error,\
>         >=C2=A0 =C2=A0 =C2=A0> > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D
>         >=C2=A0 =C2=A0 =C2=A0"--enable-gpg,--disable-gpg,\
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D
>         "--enable-curl,--disable-curl,curl"
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0PACKAGECONFIG[ssl-curl] =3D
>         >=C2=A0 =C2=A0 =C2=A0"--enable-ssl-curl,--disable-ssl-curl,curl=
 openssl"
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0PACKAGECONFIG[sha256] =3D
>         "--enable-sha256,--disable-sha256"
>         >=C2=A0 =C2=A0 =C2=A0> > +PACKAGECONFIG[zstd] =3D
>         "--enable-zstd,--disable-zstd,zstd"
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0PACKAGECONFIG[libsolv] =3D
>         >=C2=A0 =C2=A0 =C2=A0"--with-libsolv,--without-libsolv,libsolv"
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> >=C2=A0 =C2=A0EXTRA_OECONF:class-native =
=3D
>         > =C2=A0"--localstatedir=3D/${@os.path.relpath('${localstatedir=
}',
>         >=C2=A0 =C2=A0 =C2=A0'${STAGING_DIR_NATIVE}')}
>         >=C2=A0 =C2=A0 =C2=A0--sysconfdir=3D/${@os.path.relpath('${sysc=
onfdir}',
>         >=C2=A0 =C2=A0 =C2=A0'${STAGING_DIR_NATIVE}')}"
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0> >
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> --
>         >=C2=A0 =C2=A0 =C2=A0> Alex Stewart
>         >=C2=A0 =C2=A0 =C2=A0> Software Engineer - NI Real-Time OS
>         >=C2=A0 =C2=A0 =C2=A0> NI (National Instruments)
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> alex.stewart@ni.com
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-
>         >=C2=A0 =C2=A0 =C2=A0> Links: You receive all messages sent to =
this group.
>         >=C2=A0 =C2=A0 =C2=A0> View/Reply Online (#170608):
>         >
>         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKU=
bESWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMr=
vY25Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTm=
phkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVK=
UbESWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgM=
rvY25Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__l=
ists.openembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeF=
aeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78=
DBxgMrvY25Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTm=
phkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVK=
UbESWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgM=
rvY25Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D>>
>         >
>         >=C2=A0 =C2=A0 =C2=A0> Mute This Topic:
>         >
>         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3D=
KvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncd=
L2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4=
vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3D=
KvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncd=
L2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__l=
ists.openembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1=
j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=
=3DQncdL2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4=
vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3D=
KvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncd=
L2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D>>
>         >
>         >=C2=A0 =C2=A0 =C2=A0> Group Owner:
>         openembedded-core+owner@lists.openembedded.org
>         <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:openembedded-core%2Bowner@lists.op=
enembedded.org
>         <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
>         >=C2=A0 =C2=A0 =C2=A0> Unsubscribe:
>         >
>         https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.op=
enembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-=
1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&=
s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K=
-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh=
&s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D>
>         >=C2=A0 =C2=A0
>         =C2=A0<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__l=
ists.openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbE=
SWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY=
25Gwyh&s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>         <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.o=
penembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K=
-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh=
&s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D>>
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0[raj.khem@gmail.com]
>         >=C2=A0 =C2=A0 =C2=A0> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-
>         >=C2=A0 =C2=A0 =C2=A0>
>         >
>
>         --=20
>         Alex Stewart
>         Software Engineer - NI Real-Time OS
>         NI (National Instruments)
>
>         alex.stewart@ni.com
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


