Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7BCC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 08:19:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4830.1643357989184313547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=FfBjcSyM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8027849047=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20S8JmhA015011
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:19:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jh0nJ1I2HsOqHy1QdwvLog2oz9TSTUdjyL4UVjQ0qlA=;
 b=FfBjcSyM/guubNUcwfICIH2B5+74PM9YR0Vrp2gVNkW/2q6rLGIhqD8s0j5wOcJcgvWx
 D9cprh25RYPohbMmNFEfnySey3qspBbmgx72xAEsaWbZBbOhp9vXyf7cRzWHSxu6iPnR
 XVonQY5m+4/KaQWF7LYajx4i4nmtRXk3RhXQJQkGcssUgmi6eXBcKrZ3w7iZBeFmLowf
 idnfEVHBT6VGEpmRJ1vuS2btBwWhvbjAvlWoC4n4m3JnFyqlcmIsHk8h2qM+tPOOlhCK
 IC5SOovuf+yaxA3+Vt/cUGFGU+9JgbM/9diV3A9+cNup6yQz6D8mW42xunrsRnTObWMa 8w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dugc9h3jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:19:48 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20S8Jma4015003
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 00:19:48 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dugc9h3jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 00:19:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPKQm/+qUhFrH4pFaltnF/Thbfnmc+3QeQPQlppBXXCT9jwbeWUh06vmv0jF38fo/bMgEfLFdnlKgkQdliDGuknJcRl50r+F++Ei3jG1aXo5wifOfBHCjHIA0zxhN0TdmDOzXyV/ZDb/zDv49ewKMnRerqpUpaWAdTSftlWmnc4aFY+IFJ8dk9EQjSvG/cDfOeHoZfKgW3e9PoJgPJTrqcC69JbdMzIK74noZ5hLCMdCDDUFXRtVMxeHQ3L7yolydTlcqcU3k3Q4vIsASROLGLM/yzriPGc4EQgCWD91Um4h/PplpXd3VgD5bfKvWmwS2YdlHx6JW6rO5CaWjyHjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh0nJ1I2HsOqHy1QdwvLog2oz9TSTUdjyL4UVjQ0qlA=;
 b=jv7Q7bpMHSrE5Ztr4HSDSPBkCZ6zxovR6gK4P2OntzUime3hPWTfv/hEdPaSjZJmFiDqi2VciMF4Qfc752XfvfoQiBrt1Xjy8lGBIMp5ijkDuQn7VVFd4lJx4p16y8i5LweuJ8LPvce1H7EwpB4TThQXUgueFezSERWUn34Hu8Kk3odkuZVjIRIq0n6E5g87nA052lWj8PqG3I3/As1FxdW/0l+A2+2kb8oYIxBMEPYhQkv+fo5rRKoYWY3tMtceatwP4/4xJt2lO4f2LGgMJPZG3RkWeZJwgiC73S93s91mmOPVteOy24J4Xeb6VEbnZIUzbrKMsgzmWbZhyhH5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 08:19:46 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::adac:a79f:395f:9202%5]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 08:19:46 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: support persistent /var/tmp
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <16989323AFD32DAC.17148@lists.openembedded.org>
 <16A0074A273CDC4D.26797@lists.openembedded.org>
 <11e3b9fb-0673-db2f-5f6a-4f10d48cda0c@windriver.com>
 <0f44c9945b6ffc2583dab6eabd796b2af7633ee4.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <aba5d54b-01ee-a33a-8367-1d45b2764ce3@windriver.com>
Date: Fri, 28 Jan 2022 16:19:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <0f44c9945b6ffc2583dab6eabd796b2af7633ee4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f459293-c0d4-44a1-d6e0-08d9e236f19c
X-MS-TrafficTypeDiagnostic: BN9PR11MB5452:EE_
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB5452106DE830720AF349807F82229@BN9PR11MB5452.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OkKB95ke0AMYT0vDnhQSLa/0wcCYQTAzzyf0+CLXDYLfI/PSPASV7gsT6M3w9uu6cPj+SWC6bBnXnbfml/fIgkD9Xc6is9o9fTtcwvo177bKq7glY9vuZmnxqchs8ihMkJuvmRNSg43/Fze59w2gWepR6Vfs/nMntHoCha19pCxO7+SOg3ulqC803rbkhynPPOIFYcq3/aWJy2+X6meveHsEwcfEaizAmBWj+a489LHhjxFru3GWs/jBfSGdpmwTEjLxaHZDUaqVP7Kwy74hooMvM0bY9Zj7aZFO8dLK89L+wxjCSP1OOXwuw72dGOPZllCTZLmoIzuPNvFmli1/kpJi0mPgP+xPvH536yvhqcCR57rZy78BpYfry714dD9uol7MPuKWfNEZhglVrEELFww559DcyYUtenn2s9xrLRHl2DGMjMpbUeFBtY959XOikMgpxPihfXPUBpqrq13YECUjnSCXimuZ96wx7C/oa/NyxB2G38CR0t1qh8q+xhs5EH7pYSkinfVM5KR4c6Np8HmpahFFY+uKTPH+co8WubLbvMUrz6H9O70zYJo+M776f7o3T+zw6aCMkMFNcezHgtWOLxRMCxd0ob3wW9gDeUvDKr0vaDTKrUIMq6uFt1gE7RZy+lrnDwCAVkrYm5kFwsqHq3D/NoVP3Yt8VutTXTS1xViBswgQEu2luqAo0pVzbBEdZLzlKmSppstEqD7135sPQLPi4Dsxy9OdrxhW+zjtjdNYuyuI5rWEqRKZyftfKv5mQLk+uJ1veTBLsmDZvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(31686004)(6486002)(316002)(6666004)(6506007)(6512007)(508600001)(52116002)(53546011)(8936002)(83380400001)(66946007)(66476007)(66556008)(36756003)(8676002)(5660300002)(44832011)(2906002)(38100700002)(38350700002)(26005)(186003)(2616005)(31696002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1NaNWtZM3k5K200YWpNWHBVaENRQWhSYS81Rk5MODBUclh3Qk9iYXBYTlFQ?=
 =?utf-8?B?Y3hMYWRJTk1pOWZXa3hXMFN4YUhZV1c0eGNaS1plYVl3U3JUMnQvcWxuWFV5?=
 =?utf-8?B?OW1SOUhwK25BNGVpMTRnYTNnVDNUMWdoYW9GVDBhZWNwQmNTTlp3Ukd4VEFT?=
 =?utf-8?B?LzZSdEtQSm9zM2N4Q2kyOTlTdlRMRVUxbEpMRlN1a1VTYXhvclI5eUIrdS9a?=
 =?utf-8?B?T1F6bkkzalFaa3pOSmxQc25qdHdkdzNYZ3JHODhwYklFcm9DVXJLTjV2eHlB?=
 =?utf-8?B?ZmJRVHRURUVkVEJpN1VQS3NFamZpdU9yVWM1dGJGNkxhMmZkN2VTcUdNcW9h?=
 =?utf-8?B?eUFvSHprYUVtTnNjT1ZQSEN6dWNEVVl2blZDV3ltNkNHLzh4d2tZSGx4QVhG?=
 =?utf-8?B?Z205d2VTMERDaE8xb1BtR2NrbnJJL1M3RUw2cE8xN1ljcXdnbVMxUTUxc1pi?=
 =?utf-8?B?ZzJWZkszdE9YVEtVYkxuT1ZGcWNkUDdRZmdPU2FBbjdwa3h6ZTg0ZTNqU1dR?=
 =?utf-8?B?K0kzTVA1N21YeWo2QTl6MHlUUmdOSzZWaXp6ME5zcGFYVjFjcUxQNUk1TFl0?=
 =?utf-8?B?T0Q2Qm9CelBNOUY5a1dZeC82T2FjRXRRN0pSN2hjUkV3MWhHOTVZVGs1TUhz?=
 =?utf-8?B?YlBFOUVmc2xOZWNiZFBCaU5PR3NyRTllRGNoMWtycnFybUhXTk4rbWZubnIx?=
 =?utf-8?B?V2JvT01oV3NCK2prbS9BRHZIUHZRZ0tXby9zamo0TWlnd2pZdlJyY2dHVFVV?=
 =?utf-8?B?SUlmUUdIVEpEcEVoNjFFeUVsaUttRTNjbmR4cW8xYXRuRlF0MkNFaHpJMEgr?=
 =?utf-8?B?ODU4VzRZVGVtY043cDNDYTRKU1hBa0RrNEx3RHg3OTlmM1dxeGI1cVBWVVJO?=
 =?utf-8?B?akZLbWpnZ1NpMCtSWTFiYThkbVNhckpsV3podTVJb0daejJUQXVIMmNMaWM1?=
 =?utf-8?B?dENFSVN2RmxCNkxDa1paWTNVZCtOeTNkZTZvS0huWDZyemhEbzZxWUF0SzVQ?=
 =?utf-8?B?aWpBVUk3Qm5yYitHdWtFYkxZcldoZGFUa2JPUFdTY0dOUjAwc1BwdERkNWp5?=
 =?utf-8?B?a05CSmNBa3BGOVBnenNVUHlVMXpkQnZTaE5pZnVSUWZ6VHJrUGpabnBkcnZC?=
 =?utf-8?B?YWJvbGtPK204Uzk0TzBrN2gzeXdhelVodFBKTVlib20zclR0QzRzdHpzZmty?=
 =?utf-8?B?d0p5RGxZaFB6U3R0aDJHczZNKzNKOTNrUDBxTzFSTy9RZVJhNjJOMzFya1JE?=
 =?utf-8?B?anFpQlFZVWFNa0haWWdHTkQranNqbWx2bkd3dG5pUzEvZkVRQ1Zuc3JjZ0lI?=
 =?utf-8?B?QlkzMVZ4dkpYYkFSa0VJaXFDcUtRZ24yR0J0QkJZT2Q3WFhqVWQrNzFtTjBF?=
 =?utf-8?B?a3hVMmhnbmtoTHg0Z3pKZ2xHS1JWN05QZ0wyaHpTUHNsVWpuSVlUbjN3KzNi?=
 =?utf-8?B?V2M2QmtlRGRSek9IempBSzRFMmxkcW5nQmJEWnRaNDdRcVJhQ1d5alEzSXNQ?=
 =?utf-8?B?SE1ScHRjc2JmT21PNWp0TXVRcXpFV2ZJYnVjZE81Z24rZkdaSnA5dWo0UjJX?=
 =?utf-8?B?V3BEcDYxWDFGMDJ3VDVOZ0RUSi9PeWx5TmN4S21TeEhvMnJEWGNDTXpETXYv?=
 =?utf-8?B?cEVnbmVoU2k2TjhnQUxCbit2RXNUUGw2NXlJRTRTd0VDNnVjYW4vNGtDaElr?=
 =?utf-8?B?NHdWUm5Tajl1bndIM2JuUDdKNHFyS0pXKzdaNzVNb1Q5THZCOHVFRkg4MkRq?=
 =?utf-8?B?YTAyeitoMUFSaW41WmJxbkFSZ3FtcStheTNMS2RPUytqMVpRZmFIcERpUWpS?=
 =?utf-8?B?YWE5OTZJN1lZekx5QUJ0RHcyb1JkSDBDTDJVWFFOTG1HNFh4NXBBRW4rNStt?=
 =?utf-8?B?TnJlME5najhtREZSNk8yc2JONG96bTdIaG1MSFlJQXl4TTRITDNZNkRzVTdz?=
 =?utf-8?B?emlmbzFoWlBkZ2hXRy96YTZFMjBuNndVbUlBQ3ZMVDZRZWNTZ1ZLam5UdHVa?=
 =?utf-8?B?T1g5N1hoSEMwOXVMYjdFRmIwZW5OYXozZmVzSktPR1RTOFNNd01IYThwdlFC?=
 =?utf-8?B?VzdGUlhvcmU3TnBPeFQ0Unc4R3Q2RUNHOXdEUkZKV0pBVnpHYUFYa3JQT0to?=
 =?utf-8?B?RGZFLzRUQTBsUVNKZkZ4ZW5obGxxRklxdlVvTGl6MklSZXBob0xsNVZzMW1M?=
 =?utf-8?B?MlRxV0RHZ1pmYyt5RjN4TGdRd1RrVkpkekJia2VFcjlBZ2g5dnRFNTlZS1Vn?=
 =?utf-8?B?WmhmdVdGVkZhM3M3ckNjQzFzdk13PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f459293-c0d4-44a1-d6e0-08d9e236f19c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 08:19:46.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p85pwnbt03sztvoZ8WVWQDWdwhRxNvBIMPbgPkRw82QBfGe7HBh4+uLYT27A9hTk7KfJQXbnHc55MLXD7O2v0MLMBNmdtTd/zYhXEkZsTPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5452
X-Proofpoint-GUID: 6taW6ecFs3kLEwAdtoafTRMHt6TdMBwd
X-Proofpoint-ORIG-GUID: M2cBC0jZgdAy6_zywikVCKOBzXdtIHG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_06,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20S8JmhA015011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 08:19:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161069


On 9/13/21 7:00 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, 2021-09-13 at 11:42 +0800, Changqing Li wrote:
>> ping
>> On 8/30/21 4:11 PM, Changqing Li wrote:
>>
>>> On 8/6/21 9:21 AM, Changqing Li wrote:
>>>
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> Steps:
>>>> 1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
>>>> 2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
>>>> 3. docker run -it --rm poky:latest /bin/sh
>>>> 4.
>>>> /var # ls -al
>>>> drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
>>>> drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
>>>> drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
>>>> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock ->
>>>> ../run/lock
>>>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log ->
>>>> volatile/log
>>>> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../r=
un
>>>> drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
>>>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp ->
>>>> volatile/tmp
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
>>>> /var # cd log
>>>> /bin/sh: cd: can't cd to log: No such file or directory
>>>> /var # cd tmp
>>>> /bin/sh: cd: can't cd to tmp: No such file or directory
>>>> /var # cd volatile/
>>>> /var/volatile # ls -al
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
> Sorry, I appreciate this change hasn't had feedback. Unfortunately I'm =
finding
> this one hard to review. I'm also worried because it changes a number o=
f key
> areas of the system init process in a way which looks very tailored to =
a
> specific use case.
>
> I suspect we do need to have some kind of better configuration of this =
area of
> the system but I'm not convinced this patchset does that, it looks more=
 likely
> to adversely affect other use cases in favour of a specialist one.
>
> I am unlikely to want to make changes in this area until the next relea=
se now,
> sorry :/.
> This is one of the problems with not having enough people with speciali=
st
> knowledge to help review, too much falls to me and I just don't have th=
e time to
> dive into each different thing and stand a chance of making the correct
> decisions. This is frustrating for everyone.

Hi, Richard

I understand what you said.=C2=A0 And since there are still have 3 months=
 before

3.5 release,=C2=A0 how about consider this patch?=C2=A0 if you have any s=
uggestion, I

can refactor this patch and rebase it to least=C2=A0 master and resend it=
.=20
Thanks.


I rebase this patch to latest master locally and test following scenario:

1.=C2=A0=C2=A0 default VOLATILE_DIR=3D'yes'=C2=A0 + systemd

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /var/log=C2=A0 /var/tmp=C2=A0 link =
to=C2=A0 /var/volatile correctly

2.=C2=A0 default VOLATILE_DIR=3D'yes'=C2=A0 + sysVinit

 =C2=A0=C2=A0 =C2=A0=C2=A0 /var/log=C2=A0 /var/tmp=C2=A0 link to=C2=A0 /v=
ar/volatile correctly

3.=C2=A0 VOLATILE_DIR=3D'no'=C2=A0 + systemd + image_install:append =3D "=
 cups"

 =C2=A0=C2=A0=C2=A0 /var/log /var/tmp are persistent storage, not link, c=
ups create=20
/var/log/cups correctly

4. VOLATILE_DIR=3D'no'=C2=A0 + sysVinit=C2=A0 + image_install:append =3D =
" cups"

 =C2=A0=C2=A0=C2=A0 /var/log /var/tmp are persistent storage, not lin, cu=
ps create=20
/var/log/cups correctly

Thanks

Changqing Li



