Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F13C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 04:59:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1006.1678856344232302812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 21:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=qVU9Jd5e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243812222e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F4m585032170
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 21:59:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=MEr3geHDArSjSd+foEmjuGRZy8iz6ZBvpHEFHYSGDeU=;
 b=qVU9Jd5eCEUOrDMCnuQTzr7TasA/ossx9vYgArVWF08/JKJGGW8Qsq7kmvkOsUG1LLSp
 5y8QAJqn/81pN08J5FT/MWK9NvX5ZchwlsIEzs3ehym3+h2g/snYrYhX8seVhRUuW3mz
 0uZxG4k7Mg2qHRGskgdxDM1YQBhv86p3GfO2DM7Wsru5pvtyvaMzyvEZ0w8oPGEcIxMW
 jjUaRm9hU4u5sNG48JCwn5w8w5BkyCzTS/uv0ihka2y/Er076XGO0kIkvwmQGPcMUla3
 sqOEwFFmwS/vDJxsroW6ipgRzWzBu3AZjBj2cvvDRDrgpKzWGKdPsEhMRMY+BxxHEMIA CA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2avg6ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 21:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTkfcxftUQRbHog3kUahUevKy+bXR785URDJUvyegsYCFN6Eu9VltvXY1lZ+GJvtWjYBZXPk2f+dFjB+iQQICWLSgmy7nRBZnE6Olmhn+uzM8b0r3TYbSaMF7Lz5qCWxhWFD6b79EuZYTN7q7i66YICeR03bDkG4eG/hehpk2unDhp/j+OQaJjp2vH3jLof5wY6i43/+ReH0QcQjBDdNuQ7i78sX4tcjATfrNan2RYJJ+j7HHOn5UCiH/4MQQOdZmdaVCU7jJYEHuvnUQqNyDwlyA/lgt0L+gl2Cj4S0SG4/BXdGa8cjgx88wyvRHgW3U4m2r3kj+3mdUfMlhcSFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEr3geHDArSjSd+foEmjuGRZy8iz6ZBvpHEFHYSGDeU=;
 b=Ytp/SCG8TeykEej7vH9xwb6DR5vHVd6SHrtQ/6qJ3hZhFenPz6/TT8R7GEmR/eFDSG5qY/GFlEvssAZLnlQynMGAomjvlOypqq8hOGG+2co0t96JNKseJt5Hkr+NO75kGpF3ZuqjM+68tXcC1/pqYrM3GLKRIvMj68n47q1R1t+wXcgtrI0InPYSNCJmaila/dBLnou3uJsZ4ikoPEknxdTj+Lq93EDgufoEVf7HOiAIJmfzNANJRSe5SyKFOWCKt2UuEPe/vkjhnvGczAgMsnpJvpgyaiF6wfu8dwGdEA16IL/ENYNqvmQyU9ZsiCCQ5MUS7qdU5nf4b4+GW7vPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 04:58:59 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 04:58:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Go07vpI5hzyKigFpsWstGnB2"
Message-ID: <a18cf617-1857-4555-90e5-568773f9717b@windriver.com>
Date: Wed, 15 Mar 2023 00:58:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] openssl: update from 3.0.8 to 3.1.0
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <174C7E5950269FC6.10695@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <174C7E5950269FC6.10695@lists.openembedded.org>
X-ClientProxiedBy: YT4PR01CA0221.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::12) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ecc277-51bf-4e14-d0ee-08db2511fcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ynRCjmLghDL9mvnewHQa9jagpWZJ3AIZQtT5KfxwDP61uT7pdae0t0H4VavLASbaMXQ8mdUwyt2QzysrMsqzMKOVCuvIE8ls8dXKa8ZfpYzQGCVMbDw/CqMi4pEy6+u2tTPBSVyrlziDSdmOJEbjdheZjg2RMarriNEdi8/AYfa6IxIxQYAYNheIRvOtdkWeYYMWC3yeP3+skmH0/pUi8dD/3nv7tMntuGBcVKHSu58uzkKz3kMRXky91K1F2bd4pzf5GoksCM3gB1ZE7/Z0fl3PTu2LJ3Ecr/YETYiVj3XpYnEBDDzCTgbRUEaD1g/f/wVji9iVbPGv1MVWLFRcMRGPi9gwAQqDRDFZGr8qBrqwNuOT3Cx8SyAzCAlmppIhFCcGi691W0ReR8KsMJrle6qV/qLQeV3WZfBH31k1f0pbamfd5Vgkir9gYRluR1vRBoPUfBW+p9zfDrE8kuFcwJILoPx8yVfctxMSQqG5enuY4b34Eb5sz5bkiq2D7CgTLjGictj201VLmUgLTAP1ZQ1mF+mWs3JCcpZ1vfxcemjbifKHVW5vtm+JIYgTa3H63S9hIR9cVEFxA4jKXp7IK452i4wvNpfcSmesxlflPsfu8Unk4ic0GSMHEa3YkIf9gbe1l+Ly5xxGW3BT8LOPwbL8JzoCPKcXF0ZdYD9UFA2cLFwliXNRZ2aTZCEi42Ct3HagqQwtAbQzD1CcVNQiee6pROkyaSMULCTHNR3dEFY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(30864003)(36756003)(5660300002)(83380400001)(478600001)(6666004)(6486002)(6512007)(6506007)(26005)(966005)(53546011)(33964004)(2616005)(186003)(166002)(66476007)(66556008)(66946007)(8676002)(6916009)(41300700001)(8936002)(31696002)(86362001)(316002)(38100700002)(15650500001)(2906002)(31686004)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDVMYlQxQ205a3hlSlJqdHJsQnRVMTJVMTc3bUZzL0x6cHVmaXg5S3o2M3kr?=
 =?utf-8?B?VHdxZklIQ3FKL3ZrbzVPblZicGtobFB0TWN1NDBhN2kzL0lTOXFGb0VnL3d0?=
 =?utf-8?B?TzkyNWlYenNHV2ZZazRsRklnUnBQZ0pDV1UwMGJ4OWw4ZldCNm1JWEN2Ni9Q?=
 =?utf-8?B?TDBnWmxsejNvZ1FvR21BejA4bDZEM0ZMQnhBbk11N1lmb1lhWjhlZEFTMzNm?=
 =?utf-8?B?eS9qSFFQMmtKT24zbFRQMmpQbnBWUktaOHFxaytXdlcrN29tYit1QVpjS3B0?=
 =?utf-8?B?S2VnZEUwcVVaNlVXUkt3dDk5UVdsc2kzQlVEQklMdlMzeWNRWmFuSkl6cUp3?=
 =?utf-8?B?UGZkaGdHVnZDWVlxUnBPSEFzWUZjZHB2OFdzZUdPYktOYjQwb0lYemh1T0tS?=
 =?utf-8?B?NlBJeU5vUkhZUmtNeWRmMFlpckFZWEt0RVRuYit5R0NVMm9VOWp1R0pOL3Jr?=
 =?utf-8?B?MmZCZXNkU2tRQnZ1YmdTM0k4K0xsUHJiQ05pQ0NZNXQ2MFhGQjBxRktoMFlh?=
 =?utf-8?B?QnJ1ZVZwbVZNWUVrUWh0LzJGYkN4Ky8yeGswM2oyeXN3VHVOMHAwREdhYlp5?=
 =?utf-8?B?eEQzQjBFaWpTSXN1QU11ZlEyTngzdW52MlVpL0JtVTkxNFNnbGRFQ1BCTU1q?=
 =?utf-8?B?OVQzeWh0YTdjaURmaDk1TzF0TmxPSFo4My9pZkRsQm5TUTEycXFPemU4TVFY?=
 =?utf-8?B?bjZJMWRHZHpxL3Y5OFhoYmJMa3Byck1md0Jldm5DOHJ3UXpHdE9uWXRjUDRw?=
 =?utf-8?B?cmlnVGI1cGVrVkNCSDZhYk5ibHN4NnBDamtOeU9Yd0VDWjhGejhkNDVoR2M1?=
 =?utf-8?B?Tm1Wa3NESXBBVHJCV2dTM3VRSDBkZWVaVkNFUk9rV21zc2R0b28yaUxaN0Mr?=
 =?utf-8?B?L3R2bGQ1SzZXVi9rYXFTKy9zeTlGcHk0VmpoZk1zZHlKME5VbmV0djNRUm9W?=
 =?utf-8?B?bDNzSjZHUENsS0lETDhZem9KSGxaTFB5dUY0NmN1MFBycW4yWExHWlVvWU5I?=
 =?utf-8?B?c2E4dWFXdzJ2S08yaitDalFmQm1uQlY5OHlGS0ZaS2N2ZlRjOTJzRGxwTW8z?=
 =?utf-8?B?dW8yMGROVXJjekpTVGExWUM4U285TWdpQ3lKME9pemdsS24zaU5tYVE5cHhI?=
 =?utf-8?B?R1FOQ3JrWmxVb0xoVXZnc0tRQ09jY256dW9sYUQ0ZE9tdjVlZWNxdkJ0OHVL?=
 =?utf-8?B?eUQ4TUpYM3hoRGNvZGJqNWpEc2VqSFBkWTBnaUxpOStCZnNTMG5wcVRYKzRs?=
 =?utf-8?B?Tko2TXJrZmZYMTZyOFBLRWY3K1hRWi9xeHZ4N0JFck11eEZiN0k2dkhCVmNZ?=
 =?utf-8?B?aWswTTdtSE1odVVIY2pPZkhaN0xMNWFCVldSbmwydWtlYnllZHIrVE5jamhl?=
 =?utf-8?B?SGRraXpPY0duY2krK3FTbE43RVcyRmlPMEVzb2dSVlRzMjhuWGloWkx5NURB?=
 =?utf-8?B?cnowZ0J2ejVvZnIxK1MxYXVlUng1clNCaXRyRGEyU0lJNGhBVlpnNlhJOTYy?=
 =?utf-8?B?WDhZRnVNeXhYblhCUEVnRnljWW9FQjNILzRvWkIrL0hrVXVxd3lXMWdtTGNi?=
 =?utf-8?B?TVlXNzNDWjM2aDVObXpQZkk1VTJza1Uwa0ovQW1samt0Mmx3alN2WkljcHho?=
 =?utf-8?B?KzZ1dkJqdWZJMmJUMWRBKzQ5dFpheVYyVXVHblB6TnEzdFR5WVpjL3ZyOWVq?=
 =?utf-8?B?UnY2SGptVkQvZnhUbTJMcTdjbmJ2VkZwaE96d0FpSUl0ZVpQTFlCeC9CUVE1?=
 =?utf-8?B?aGpjTnRGbS9IUE1DaURLSm1BWE1qSS9IMyttNTEyaUV5S3NCRktmemh1d3BW?=
 =?utf-8?B?dHlTQWlZZ09UMG40b3ZkdDJNYU81Vmh3bUJZZDJ2RmgxRnZlR3lheXZHS1p1?=
 =?utf-8?B?SURyWFVpSFg2SGhab1V2NTRibGpXUzR6TUhoZ3pndmd4NytGZTRhb2tUL3NK?=
 =?utf-8?B?NEhQT0JEWHRVaHJsNFpqZEpWRjRGbEpkQ2NneXRtZzlQdVZOdW4vL3lHb1d5?=
 =?utf-8?B?aW1pY05wYVBQVGFiR0R4TXFJclBJUTBvcUlCR21jV2xONktqa3dVRkw3WTVT?=
 =?utf-8?B?Ykk2TGNKaElPZ1paVEtaZmlDbFFuSHNLSkJtd3pLc1hnZmVqL3YvQUE1YVlj?=
 =?utf-8?B?aGliemRRUXdCM3R3Uk5WSTVnUGVOMnV5R1RlN2NsTSt0QTQ0Sk4ya1VtejVq?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ecc277-51bf-4e14-d0ee-08db2511fcee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:58:59.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hsW+pv8Zc3Zmmg2YGXjhQmwSc4rsKWdIaBrFXDyRaOXsfWb6bHJ8NOJMBFn74tC4F9hDlEWXCmuZZ9n15Dy8rXCOK7TtOWF0SLmvWB0GdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
X-Proofpoint-ORIG-GUID: FwiQV75wlibcTQ_9wGEul6DSysS_tylO
X-Proofpoint-GUID: FwiQV75wlibcTQ_9wGEul6DSysS_tylO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_01,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 04:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178521

--------------Go07vpI5hzyKigFpsWstGnB2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32F4m585032170

On 2023-03-15 00:48, Randy MacLeod via lists.openembedded.org wrote:
> >From the NEWS.md file:
>
>    ### Major changes between OpenSSL 3.0 and OpenSSL 3.1.0 [14 Mar 2023=
]

I know we're in feature freeze but this openssl update that came out on=20
March 14th looks interesting.

I've sent it in before local tests complete so the Europeans / Brits can
put the update through the YP autobuilder tests.


The update was pretty simple and the code change isn't huge.

There's a likely very desirable FIPS 140 updated mentioned in:

https://www.openssl.org/blog/blog/2023/03/07/OpenSSL3.1Release/

 =C2=A0=C2=A0=C2=A0 OpenSSL 3.1 is mostly a small increment over the func=
tionality=20
available in OpenSSL 3.0.
 =C2=A0=C2=A0=C2=A0 The main changes are:

  *

    A FIPS 140-3 compliant FIPS Provider.

    The FIPS provider has been upgraded to be FIPS 140-3 compliant. ...

Local builds are still underway but going as well as expected.
See below for what I have on hand so far.

../Randy


$ cat ../b/ossl-3.1.0/openssl-buildall.log
BUILDALL-QEMU LOG FOR openssl
START TIME: 2023-03-14_18:09:37
HOSTNAME: yow-fedora-builder1
HOST OS: Fedora Linux 37 (Server Edition)
HOST KERNEL: 6.0.14-300.fc37.x86_64
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUILD RESULTS:
[glibc]
PASS: qemumips
PASS: qemumips64
PASS: qemuppc
PASS: qemuriscv32
PASS: qemuriscv64
PASS: qemux86
PASS: qemux86-64
PASS: qemuarm
PASS: qemuarm64
PASS: qemuarmv5
FAIL: qemuloongarch64
PASS: qemuppc64
[musl]
PASS: qemumips
PASS: qemumips64
PASS: qemuppc
FAIL: qemuriscv32
PASS: qemuriscv64
PASS: qemux86
PASS: qemux86-64

...



ptest are also still executing but seem to be in good shape:

Poky (Yocto Project Reference Distro)=20
4.1+snapshot-c9c1d6af8f00ad11cadd400c860a439349ce5b7d qemux86-64 /dev/tty=
S0

qemux86-64 login: root
root@qemux86-64:~# ptest-runner openssl
START: ptest-runner
2023-03-15T04:46
BEGIN: /usr/lib/openssl/ptest
SKIP: 00-prep_fipsmodule_cnf.t .. skipped: FIPS module config file only=20
supported in a fips build
Files=3D1, Tests=3D0,=C2=A0 0 wallclock secs ( 0.02 usr=C2=A0 0.00 sys +=C2=
=A0 0.38 cusr=C2=A0=20
0.11 csys =3D=C2=A0 0.51 CPU)
Result: NOTESTS
PASS: 01-test_abort.t .................... ok
SKIP: 01-test_fipsmodule_cnf.t ........... skipped: Test only supported=20
in a fips build
PASS: 01-test_sanity.t ................... ok
PASS: 01-test_symbol_presence.t .......... ok
PASS: 01-test_test.t ..................... ok
PASS: 02-test_errstr.t ................... ok
PASS: 02-test_internal_context.t ......... ok
PASS: 02-test_internal_ctype.t ........... ok
PASS: 02-test_internal_exts.t ............ ok
PASS: 02-test_internal_keymgmt.t ......... ok
PASS: 02-test_internal_provider.t ........ ok
PASS: 02-test_lhash.t .................... ok
PASS: 02-test_localetest.t ............... ok
PASS: 02-test_ordinals.t ................. ok
PASS: 02-test_sparse_array.t ............. ok
PASS: 02-test_stack.t .................... ok
PASS: 03-test_exdata.t ................... ok
SKIP: 03-test_fipsinstall.t .............. skipped: Test only supported=20
in a fips build
PASS: 03-test_internal_asn1.t ............ ok
PASS: 03-test_internal_asn1_dsa.t ........ ok
PASS: 03-test_internal_bn.t .............. ok
PASS: 03-test_internal_chacha.t .......... ok
PASS: 03-test_internal_curve448.t ........ ok
PASS: 03-test_internal_ec.t .............. ok
PASS: 03-test_internal_ffc.t ............. ok
PASS: 03-test_internal_mdc2.t ............ ok
PASS: 03-test_internal_modes.t ........... ok
PASS: 03-test_internal_namemap.t ......... ok
PASS: 03-test_internal_poly1305.t ........ ok
PASS: 03-test_internal_rsa_sp800_56b.t ... ok
PASS: 03-test_internal_siphash.t ......... ok
PASS: 03-test_internal_sm2.t ............. ok
PASS: 03-test_internal_sm3.t ............. ok
PASS: 03-test_internal_sm4.t ............. ok
PASS: 03-test_internal_ssl_cert_table.t .. ok
PASS: 03-test_internal_x509.t ............ ok
PASS: 03-test_params_api.t ............... ok
PASS: 03-test_property.t ................. ok
PASS: 03-test_ui.t ....................... ok
PASS: 04-test_asn1_decode.t .............. ok
PASS: 04-test_asn1_encode.t .............. ok
PASS: 04-test_asn1_string_table.t ........ ok
PASS: 04-test_bio_callback.t ............. ok
PASS: 04-test_bio_core.t ................. ok
PASS: 04-test_bioprint.t ................. ok
PASS: 04-test_conf.t ..................... ok
PASS: 04-test_encoder_decoder.t .......... ok
PASS: 04-test_encoder_decoder_legacy.t ... ok
PASS: 04-test_err.t ...................... ok
PASS: 04-test_hexstring.t ................ ok
PASS: 04-test_nodefltctx.t ............... ok
PASS: 04-test_param_build.t .............. ok
PASS: 04-test_params.t ................... ok
PASS: 04-test_params_conversion.t ........ ok
PASS: 04-test_pem_read_depr.t ............ ok
PASS: 04-test_pem_reading.t .............. ok
PASS: 04-test_provfetch.t ................ ok
PASS: 04-test_provider.t ................. ok
PASS: 04-test_provider_fallback.t ........ ok
PASS: 04-test_provider_pkey.t ............ ok
PASS: 04-test_punycode.t ................. ok
PASS: 04-test_upcalls.t .................. ok
PASS: 05-test_bf.t ....................... ok
PASS: 05-test_cast.t ..................... ok
PASS: 05-test_cmac.t ..................... ok
PASS: 05-test_des.t ...................... ok
PASS: 05-test_hmac.t ..................... ok
PASS: 05-test_idea.t ..................... ok
PASS: 05-test_pbe.t ...................... ok
PASS: 05-test_rand.t ..................... ok
PASS: 05-test_rc2.t ...................... ok
PASS: 05-test_rc4.t ...................... ok
SKIP: 05-test_rc5.t ...................... skipped: rc5 is not supported=20
by this OpenSSL build
PASS: 06-test_algorithmid.t .............. ok
PASS: 06-test_rdcpu_sanity.t ............. ok
PASS: 10-test_bn.t ....................... ok
PASS: 10-test_exp.t ...................... ok
PASS: 15-test_dh.t ....................... ok
PASS: 15-test_dsa.t ...................... ok
PASS: 15-test_dsaparam.t ................. ok
PASS: 15-test_ec.t ....................... ok
PASS: 15-test_ecdsa.t .................... ok
PASS: 15-test_ecparam.t .................. ok
PASS: 15-test_gendh.t .................... ok
PASS: 15-test_gendhparam.t ............... ok
PASS: 15-test_gendsa.t ................... ok
PASS: 15-test_genec.t .................... ok
PASS: 15-test_genrsa.t ................... ok
PASS: 15-test_mp_rsa.t ................... ok
PASS: 15-test_out_option.t ............... ok
PASS: 15-test_rsa.t ...................... ok
PASS: 15-test_rsaoaep.t .................. ok
PASS: 15-test_rsapss.t ................... ok
PASS: 15-test_sha.t ...................... ok
PASS: 20-test_app.t ...................... ok
SKIP: 20-test_cli_fips.t ................. skipped: Test only supported=20
in a fips build with security checks
PASS: 20-test_dgst.t ..................... ok
PASS: 20-test_dhparam.t .................. ok
PASS: 20-test_dhparam_check.t ............ ok
PASS: 20-test_enc.t ...................... ok
PASS: 20-test_enc_more.t ................. ok
PASS: 20-test_kdf.t ...................... ok
PASS: 20-test_legacy_okay.t .............. ok
PASS: 20-test_mac.t ...................... ok
PASS: 20-test_passwd.t ................... ok
PASS: 20-test_pkeyutl.t .................. ok
PASS: 20-test_rand_config.t .............. ok
PASS: 20-test_spkac.t .................... ok
PASS: 25-test_crl.t ...................... ok
PASS: 25-test_d2i.t ...................... ok
PASS: 25-test_eai_data.t ................. ok
PASS: 25-test_pkcs7.t .................... ok
PASS: 25-test_req.t ...................... ok
PASS: 25-test_rusext.t ................... ok
PASS: 25-test_sid.t ...................... ok
PASS: 25-test_verify.t ................... ok
PASS: 25-test_verify_store.t ............. ok
PASS: 25-test_x509.t ..................... ok
SKIP: 30-test_acvp.t ..................... skipped: ACVP is not=20
supported by this test
PASS: 30-test_aesgcm.t ................... ok
PASS: 30-test_afalg.t .................... ok
PASS: 30-test_defltfips.t ................ ok
PASS: 30-test_engine.t ................... ok
PASS: 30-test_evp.t ...................... ok
PASS: 30-test_evp_extra.t ................ ok
PASS: 30-test_evp_fetch_prov.t ........... ok
PASS: 30-test_evp_kdf.t .................. ok
PASS: 30-test_evp_libctx.t ............... ok
PASS: 30-test_evp_pkey_dparam.t .......... ok
PASS: 30-test_evp_pkey_provided.t ........ ok
PASS: 30-test_pbelu.t .................... ok
PASS: 30-test_pkey_meth.t ................ ok
PASS: 30-test_pkey_meth_kdf.t ............ ok
PASS: 30-test_prov_config.t .............. ok
PASS: 30-test_provider_status.t .......... ok
PASS: 40-test_rehash.t ................... ok
PASS: 60-test_x509_check_cert_pkey.t ..... ok
PASS: 60-test_x509_dup_cert.t ............ ok
PASS: 60-test_x509_store.t ............... ok
PASS: 60-test_x509_time.t ................ ok
PASS: 61-test_bio_prefix.t ............... ok
PASS: 61-test_bio_readbuffer.t ........... ok
PASS: 65-test_cmp_asn.t .................. ok
PASS: 65-test_cmp_client.t ............... ok
PASS: 65-test_cmp_ctx.t .................. ok
PASS: 65-test_cmp_hdr.t .................. ok
PASS: 65-test_cmp_msg.t .................. ok
PASS: 65-test_cmp_protect.t .............. ok
PASS: 65-test_cmp_server.t ............... ok
PASS: 65-test_cmp_status.t ............... ok
PASS: 65-test_cmp_vfy.t .................. ok
PASS: 66-test_ossl_store.t ............... ok
PASS: 70-test_asyncio.t .................. ok
...



--------------Go07vpI5hzyKigFpsWstGnB2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-03-15 00:48, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174C7E5950269FC6.10695@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">&gt;From the NEWS.md file:

  ### Major changes between OpenSSL 3.0 and OpenSSL 3.1.0 [14 Mar 2023]</pre>
    </blockquote>
    <p>I know we're in feature freeze but this openssl update that came
      out on March 14th looks interesting.</p>
    <p>I've sent it in before local tests complete so the Europeans /
      Brits can<br>
      put the update through the YP autobuilder tests.</p>
    <p><br>
    </p>
    <p>The update was pretty simple and the code change isn't huge.<br>
    </p>
    <p>There's a likely very desirable FIPS 140 updated mentioned in:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://www.openssl.org/blog/blog/2023/03/07/OpenSSL3.1Release/">https://www.openssl.org/blog/blog/2023/03/07/OpenSSL3.1Release/</a></p>
    <p>&nbsp;&nbsp;&nbsp; OpenSSL 3.1 is mostly a small increment over the
      functionality available in
      OpenSSL 3.0. <br>
      &nbsp;&nbsp;&nbsp; The main changes are:</p>
    <ul>
      <li>
        <p>A FIPS 140-3 compliant FIPS Provider.</p>
        <p>The FIPS provider has been upgraded to be FIPS 140-3
          compliant. ...</p>
      </li>
    </ul>
    <p>Local builds are still underway but going as well as expected.<br>
      See below for what I have on hand so far.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>$ cat ../b/ossl-3.1.0/openssl-buildall.log <br>
      BUILDALL-QEMU LOG FOR openssl<br>
      START TIME: 2023-03-14_18:09:37<br>
      HOSTNAME: yow-fedora-builder1<br>
      HOST OS: Fedora Linux 37 (Server Edition)<br>
      HOST KERNEL: 6.0.14-300.fc37.x86_64<br>
      ===============<br>
      BUILD RESULTS:<br>
      [glibc]<br>
      PASS: qemumips<br>
      PASS: qemumips64<br>
      PASS: qemuppc<br>
      PASS: qemuriscv32<br>
      PASS: qemuriscv64<br>
      PASS: qemux86<br>
      PASS: qemux86-64<br>
      PASS: qemuarm<br>
      PASS: qemuarm64<br>
      PASS: qemuarmv5<br>
      FAIL: qemuloongarch64<br>
      PASS: qemuppc64<br>
      [musl]<br>
      PASS: qemumips<br>
      PASS: qemumips64<br>
      PASS: qemuppc<br>
      FAIL: qemuriscv32<br>
      PASS: qemuriscv64<br>
      PASS: qemux86<br>
      PASS: qemux86-64<br>
    </p>
    <p>...</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>ptest are also still executing but seem to be in good shape:</p>
    <p>Poky (Yocto Project Reference Distro)
      4.1+snapshot-c9c1d6af8f00ad11cadd400c860a439349ce5b7d qemux86-64
/dev/ttyS0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      qemux86-64 login:
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      root@qemux86-64:~# ptest-runner
openssl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      START:
ptest-runner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
2023-03-15T04:46&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      BEGIN:
/usr/lib/openssl/ptest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      SKIP: 00-prep_fipsmodule_cnf.t .. skipped: FIPS module config file
      only supported in a fips
build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      Files=1, Tests=0,&nbsp; 0 wallclock secs ( 0.02 usr&nbsp; 0.00 sys +&nbsp; 0.38
      cusr&nbsp; 0.11 csys =&nbsp; 0.51
CPU)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      Result:
NOTESTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 01-test_abort.t ....................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      SKIP: 01-test_fipsmodule_cnf.t ........... skipped: Test only
      supported in a fips build<br>
      PASS: 01-test_sanity.t ...................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 01-test_symbol_presence.t ..........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 01-test_test.t .....................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_errstr.t ................... ok &nbsp;<br>
      PASS: 02-test_internal_context.t .........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_internal_ctype.t ...........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_internal_exts.t ............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_internal_keymgmt.t ......... ok<br>
      PASS: 02-test_internal_provider.t ........
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 02-test_lhash.t ....................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_localetest.t ...............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_ordinals.t ................. ok<br>
      PASS: 02-test_sparse_array.t .............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 02-test_stack.t ....................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_exdata.t ................... ok<br>
      SKIP: 03-test_fipsinstall.t .............. skipped: Test only
      supported in a fips build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_asn1.t ............
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 03-test_internal_asn1_dsa.t ........
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 03-test_internal_bn.t ..............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_chacha.t ..........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_curve448.t ........ ok<br>
      PASS: 03-test_internal_ec.t .............. ok<br>
      PASS: 03-test_internal_ffc.t ............. ok<br>
      PASS: 03-test_internal_mdc2.t ............ ok &nbsp;<br>
      PASS: 03-test_internal_modes.t ...........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_namemap.t .........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_poly1305.t ........ ok<br>
      PASS: 03-test_internal_rsa_sp800_56b.t ...
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_siphash.t .........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_sm2.t .............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_sm3.t .............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_internal_sm4.t ............. ok<br>
      PASS: 03-test_internal_ssl_cert_table.t .. ok<br>
      PASS: 03-test_internal_x509.t ............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 03-test_params_api.t ............... ok<br>
      PASS: 03-test_property.t .................
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 03-test_ui.t .......................
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 04-test_asn1_decode.t .............. ok&nbsp; &nbsp;<br>
      PASS: 04-test_asn1_encode.t ..............
ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;<br>
      PASS: 04-test_asn1_string_table.t ........
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 04-test_bio_callback.t .............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 04-test_bio_core.t ................. ok<br>
      PASS: 04-test_bioprint.t .................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 04-test_conf.t ..................... ok<br>
      PASS: 04-test_encoder_decoder.t .......... ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 04-test_encoder_decoder_legacy.t ... ok<br>
      PASS: 04-test_err.t ...................... ok<br>
      PASS: 04-test_hexstring.t ................ ok<br>
      PASS: 04-test_nodefltctx.t ............... ok<br>
      PASS: 04-test_param_build.t .............. ok<br>
      PASS: 04-test_params.t ................... ok<br>
      PASS: 04-test_params_conversion.t ........ ok<br>
      PASS: 04-test_pem_read_depr.t ............ ok<br>
      PASS: 04-test_pem_reading.t .............. ok<br>
      PASS: 04-test_provfetch.t ................ ok<br>
      PASS: 04-test_provider.t ................. ok<br>
      PASS: 04-test_provider_fallback.t ........ ok<br>
      PASS: 04-test_provider_pkey.t ............ ok<br>
      PASS: 04-test_punycode.t ................. ok<br>
      PASS: 04-test_upcalls.t .................. ok<br>
      PASS: 05-test_bf.t ....................... ok<br>
      PASS: 05-test_cast.t ..................... ok<br>
      PASS: 05-test_cmac.t ..................... ok<br>
      PASS: 05-test_des.t ...................... ok<br>
      PASS: 05-test_hmac.t ..................... ok<br>
      PASS: 05-test_idea.t ..................... ok<br>
      PASS: 05-test_pbe.t ...................... ok<br>
      PASS: 05-test_rand.t ..................... ok<br>
      PASS: 05-test_rc2.t ...................... ok<br>
      PASS: 05-test_rc4.t ...................... ok<br>
      SKIP: 05-test_rc5.t ...................... skipped: rc5 is not
      supported by this OpenSSL build<br>
      PASS: 06-test_algorithmid.t .............. ok<br>
      PASS: 06-test_rdcpu_sanity.t ............. ok<br>
      PASS: 10-test_bn.t ....................... ok<br>
      PASS: 10-test_exp.t ...................... ok<br>
      PASS: 15-test_dh.t ....................... ok<br>
      PASS: 15-test_dsa.t ...................... ok<br>
      PASS: 15-test_dsaparam.t ................. ok<br>
      PASS: 15-test_ec.t ....................... ok<br>
      PASS: 15-test_ecdsa.t .................... ok<br>
      PASS: 15-test_ecparam.t .................. ok<br>
      PASS: 15-test_gendh.t .................... ok<br>
      PASS: 15-test_gendhparam.t ............... ok<br>
      PASS: 15-test_gendsa.t ................... ok<br>
      PASS: 15-test_genec.t .................... ok<br>
      PASS: 15-test_genrsa.t ................... ok<br>
      PASS: 15-test_mp_rsa.t ................... ok<br>
      PASS: 15-test_out_option.t ............... ok<br>
      PASS: 15-test_rsa.t ...................... ok<br>
      PASS: 15-test_rsaoaep.t .................. ok<br>
      PASS: 15-test_rsapss.t ................... ok<br>
      PASS: 15-test_sha.t ...................... ok<br>
      PASS: 20-test_app.t ...................... ok<br>
      SKIP: 20-test_cli_fips.t ................. skipped: Test only
      supported in a fips build with security checks<br>
      PASS: 20-test_dgst.t ..................... ok<br>
      PASS: 20-test_dhparam.t .................. ok<br>
      PASS: 20-test_dhparam_check.t ............ ok<br>
      PASS: 20-test_enc.t ...................... ok<br>
      PASS: 20-test_enc_more.t ................. ok<br>
      PASS: 20-test_kdf.t ...................... ok<br>
      PASS: 20-test_legacy_okay.t .............. ok<br>
      PASS: 20-test_mac.t ...................... ok<br>
      PASS: 20-test_passwd.t ................... ok<br>
      PASS: 20-test_pkeyutl.t .................. ok<br>
      PASS: 20-test_rand_config.t .............. ok<br>
      PASS: 20-test_spkac.t .................... ok<br>
      PASS: 25-test_crl.t ...................... ok<br>
      PASS: 25-test_d2i.t ...................... ok<br>
      PASS: 25-test_eai_data.t ................. ok<br>
      PASS: 25-test_pkcs7.t .................... ok<br>
      PASS: 25-test_req.t ...................... ok<br>
      PASS: 25-test_rusext.t ................... ok<br>
      PASS: 25-test_sid.t ...................... ok<br>
      PASS: 25-test_verify.t ................... ok<br>
      PASS: 25-test_verify_store.t ............. ok<br>
      PASS: 25-test_x509.t ..................... ok<br>
      SKIP: 30-test_acvp.t ..................... skipped: ACVP is not
      supported by this test<br>
      PASS: 30-test_aesgcm.t ................... ok<br>
      PASS: 30-test_afalg.t .................... ok<br>
      PASS: 30-test_defltfips.t ................ ok<br>
      PASS: 30-test_engine.t ................... ok<br>
      PASS: 30-test_evp.t ...................... ok<br>
      PASS: 30-test_evp_extra.t ................ ok<br>
      PASS: 30-test_evp_fetch_prov.t ........... ok<br>
      PASS: 30-test_evp_kdf.t .................. ok<br>
      PASS: 30-test_evp_libctx.t ............... ok<br>
      PASS: 30-test_evp_pkey_dparam.t .......... ok<br>
      PASS: 30-test_evp_pkey_provided.t ........ ok<br>
      PASS: 30-test_pbelu.t .................... ok<br>
      PASS: 30-test_pkey_meth.t ................ ok<br>
      PASS: 30-test_pkey_meth_kdf.t ............ ok<br>
      PASS: 30-test_prov_config.t .............. ok<br>
      PASS: 30-test_provider_status.t .......... ok<br>
      PASS: 40-test_rehash.t ................... ok<br>
      PASS: 60-test_x509_check_cert_pkey.t ..... ok<br>
      PASS: 60-test_x509_dup_cert.t ............ ok<br>
      PASS: 60-test_x509_store.t ............... ok<br>
      PASS: 60-test_x509_time.t ................ ok<br>
      PASS: 61-test_bio_prefix.t ............... ok<br>
      PASS: 61-test_bio_readbuffer.t ........... ok<br>
      PASS: 65-test_cmp_asn.t .................. ok<br>
      PASS: 65-test_cmp_client.t ............... ok<br>
      PASS: 65-test_cmp_ctx.t .................. ok<br>
      PASS: 65-test_cmp_hdr.t .................. ok<br>
      PASS: 65-test_cmp_msg.t .................. ok<br>
      PASS: 65-test_cmp_protect.t .............. ok<br>
      PASS: 65-test_cmp_server.t ............... ok<br>
      PASS: 65-test_cmp_status.t ............... ok<br>
      PASS: 65-test_cmp_vfy.t .................. ok<br>
      PASS: 66-test_ossl_store.t ............... ok<br>
      PASS: 70-test_asyncio.t .................. ok<br>
      ...</p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------Go07vpI5hzyKigFpsWstGnB2--

