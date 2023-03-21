Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4094DC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 00:10:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1363.1679357431850038605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=DT8JQA4L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2444f1a2c9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KNfTqU018920
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 00:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=pWtU0nlPx/i0IvoxX2JHHfuyfV9dzFo5xzJKkTmo/2w=;
 b=DT8JQA4L9FbqT0kLRDcH7G3bMUIwJmY3jLTMGhxAYDHNHOFEJsDuEHEWp3jNCz58J9z3
 zOdX8PKQ6EBjGlso+M5VXN7s5wlsWkZAmwbXjD9MnkOHIDNy70Etp1AwmNOT1Y08kS0A
 h85MtP1DUAEFb6m70Kthc2bvtnIKxrFDc3y/avTqWSxrJdliOU/dfvY6hyS8x2+hm4LX
 0ZF3TIeuIZCvC6VIVvfcSdnfaYyfIkxscV3tu28Yxloy0DX0+fLlirt5e4caPr5T6yN6
 wWSOlVV0rWN1POnKhpUajs0s+HUsFnGk/xoDDqAlJ426rg1t0Xhd/RWZkQnD0CmKPntg Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49ate7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 00:10:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32L0AUUd012803
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 00:10:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49ate7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 00:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BONdyHrbrNmEYMvM260tELn5jsJvmJ5IsNxnLnGsmAac1A5dmXKbIahL7w2ndIBo+KakbylIzLH5OBjOHx2lmPaQ6EHMWE+fJgLKW0aTXTZmPzTbeH3h4gJI+J2PWzN62uws9zOo3At6lpYQRbFOMx1uENJa2vIrHMmlyKj9xNYOZs21mpj7oCwRd/7dG5vGVt0Yzlud/b10jTH/9ktMt0k6spvL/iyd1V9IotmPKQGNFSeq6PFm6HkEsN9j+Ox/Z+6yHKnJS9NXLcTBSD9dzMI7EY8KH4IVBmd1oNIrTdCdC+pkFCEuRG/c/AdJ8yfNc9KpGmKTJOKMBfuBjtscEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWtU0nlPx/i0IvoxX2JHHfuyfV9dzFo5xzJKkTmo/2w=;
 b=dsH2Vr/U0D9iTBmKcFWdPVCMB6Q+4MsHhITwaJPHy9UPQXn1DCwJhocakb9R+FK88FjQe2nytN/Jubm6UztOI72eM7MYRATug5E1+BG7afKKZpVSZfTCsT7VIRLOauGQ7VzSzddo2SxS3v/X4PYj8KwbcwutdTn3OKJ3Pp9USG3aYceom7Ge5hEMoDNe+vG+zxUT3qcnpZfsj+TMbDF5rIIQVliUuZ6M9upxIxylScZhqab/QT8biuxGREDzq/On7FztEvVnBjiIPnrsI5wWTZM+N+Qv1XwdYffDoGGSgkrDCk2KRXDQY83asMm22+vAswpO04ZA4sEySP/EfQoVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 00:10:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 00:10:26 +0000
Content-Type: multipart/alternative;
 boundary="------------0wYjp0Hqpmb0FRcqkyZa54kf"
Message-ID: <43cec714-9f32-be48-2041-b138c7e61450@windriver.com>
Date: Mon, 20 Mar 2023 20:10:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for
 CVE-2023-23916
Content-Language: en-CA
To: badganchipv@gmail.com, openembedded-core@lists.openembedded.org,
        "Yu, Mingli" <mingli.yu@windriver.com>,
        "steve@sakoman.com"
 <steve@sakoman.com>
References: <20230315093506.41960-2-badganchipv@gmail.com>
 <15189.1679317672786305038@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <15189.1679317672786305038@lists.openembedded.org>
X-ClientProxiedBy: YT3PR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5bb437-559a-4141-27ef-08db29a0ac49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HmNPEjihj4z3zHnAeLlUBbxXkX2G5OMMICDA8Qcw183PCrn9bzflrvVfToypLSJDE0+SwO9UBru6mxhXQtH2iDJlF51stNNqqoaYJLiyFGxZM0HHbukuRXkBKItsr283rPqI8o8Yr5Y1xzucFbQtSm4Q43gbvRjLcq3U6xhMufwoL4TDBORN9kVv6JPGc4WXopWRc7hx+uCvZRdSsKn6IeFglva29SqqdeBASWvGrxMA1YveXhZJP9qRzlRuh2fjPP0FoaZstSA5dMVJ6MAKrHx1v7M504BWGyNdKHCUcWcS5KSb4RijcHcjWLYNs5xCgAxP6DT+EZCM0iBdp+0J1aEU5J4LkfdUOUbWmGLF5QNBrN17NhJ3xKUIyOFZ0JQHjWMEePOGzmNrokgyvc7KcADo2Q3pOUrrKN2XZyXkf2I4Zuiu1aR3Rxrx28lhfXnajsBL+Pxwb5OUL23X0lIjuygjvRmdU5+XjKbzc/QbCbqLYil1GCLbvSBIKOWPF6t0ZLuRq84I92LlmgZ+4Meo9WPMuuGCWTeeEAoYDF0U+lsAJCTqF0tCv7DsgW6ZFge6MahdWXc2am0E38b6CNnOLq0RLH7Tv1GN5cm4k+VTGhugYASbogzdsZJppdYnULFVHd4i/CIUTfd2M9z1JbyBLvwHapMDs0RdQS6uDjklT7VR91ceM6Pl6xLBYI/MeMtZ/O2ZG+uAZxEWZObvDyEWJ7w6+Oto9HQIgVaIhPmAIYcgI+ZbH1XSFi3rppNOKs/5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(376002)(366004)(396003)(346002)(136003)(451199018)(41300700001)(8936002)(6486002)(966005)(5660300002)(2906002)(186003)(166002)(2616005)(478600001)(38100700002)(66556008)(110136005)(31686004)(316002)(6506007)(6512007)(83380400001)(26005)(86362001)(53546011)(36756003)(33964004)(31696002)(66899018)(66476007)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1NqSnEwYkI0cDJuU1F3cTRpZG90S3hXNW1MR1IxYXQzZEVxeTVMSHZnSkpM?=
 =?utf-8?B?UzZiTUlIck5qdDNnR2g2d2VleGdWNUdZa2grRXhmNmR6L0ZhWmtxdUd5alRR?=
 =?utf-8?B?aVlZL1lsVTFId2JqV1dSVVVRd2FiNGpXRTlKQm5hUWNKanVKTjhVOCtsVGpl?=
 =?utf-8?B?S1NvWWpNMmJIN1NzWEh6OWthci84S3Jhdk1Bc0VRMzFqZjZpSjVxUThuOFV1?=
 =?utf-8?B?ay8rdjM0U1NRNTJsWUh3dG91NVZqcUpybFlXTitnU3RRSjROM3p2b2EzTnBm?=
 =?utf-8?B?bWd4bWxuL3NpUUFxbVlFMVFRTDdCVTBacmR0MGt1WlFHQzE2ckVlKzlLMUdR?=
 =?utf-8?B?REc5Q1ZJWllDL28xSjNONDdJOWJBM0NsWnp3M3hBb2N6TXlqeHZRSkw2VmpG?=
 =?utf-8?B?czd4UmY5QnNHZ2xFUW00OER3ZEVGK0h3L3FJNkp1MTZ5N1dsWDhTaUR5RUw4?=
 =?utf-8?B?eVhmd2tZTHM0V1M1MGd2QUNaWHdIdlhPazd3UnlKNFZYa2kxNVFpOWdLeFcz?=
 =?utf-8?B?a3E1QWVCM2owNU1jV0FibGdGUUhobjk3c21kK291NVM3cjFzdmQ3U1haNEtn?=
 =?utf-8?B?eWQ4S2Z1dTVwWllObXVFWVFaTHFnTE85S2xBWVJnY21HblQ2SklSTUZBWkU4?=
 =?utf-8?B?N2t2TER5dnhLdWt3aDhOdS9NZ1ViRVBQNERBRVZPZE5IMHl1eUZOYkFPbE1x?=
 =?utf-8?B?d2dNVlBhS1pxck05c01UOHA5eGhqQlBtdUxXbW1UcHVQWjBIaFJnakN5dnFW?=
 =?utf-8?B?cWZaT3FyWVNqZ1EvR3RsMisxZlBuOTdxV092TEdPZmtLVzVaRGJtd09rZVB4?=
 =?utf-8?B?Q1B4MmQrRG5OSFZZTmlPMkNJVEU3MTNybzBBV2VtYUovb295TkFKTWI0M1dj?=
 =?utf-8?B?elQ1aFVhUmRUVEYzWFVXTllZK3dPeEZIam82dTZwZDU1NmVJYXJBNENmcXJt?=
 =?utf-8?B?czI1ZUZkZ1N4MEN4UzF5REtId242c1FBUEhlMThWbFd4VCs1V29HMlA1NHA3?=
 =?utf-8?B?d043bFVXQ2VVdEZTZDZVclVCV2J1b2ExWi9RUElQUWtKTUdmS3FWdldZVGxa?=
 =?utf-8?B?cm9Va3FVU0l6L3h3eFh0cjdhNGp4UE9BM3BVRGJFRUovVUJwMlJrQ2Rjb2cx?=
 =?utf-8?B?MUJIeFpRWVRSQjFQdjE3ald6N0FJcElDa1BaNUlPK3Vrc1ZZOWs5UkFYUWMz?=
 =?utf-8?B?QTdCTEVKaHAwaUZtZlgraGZDbXp0T09CTy93WjlIT0EzYjV0M0N4dFdJYzVZ?=
 =?utf-8?B?VUtMcWsya2dzYUVFbTdVS3VxYXM4Z1J0eWdVek1jaXFTeWg4MnBSdlN6NFNC?=
 =?utf-8?B?OWlsc1duZ1F5M1NPNElmZENERHhHSGgySHlhWFRIMTVaQ3BXTXdBb3k5Umtv?=
 =?utf-8?B?enRwRm1rTHVrMWVha3BrVDVBNS81OHRwNGxFYjA1TXI1S1hYZ0JXdGpDV0xR?=
 =?utf-8?B?YTZrbGhnR0tFYUJwNUZwVDVXU2xNdG03L2ZXQVgrMnlGeGQ1T3I5YndubThB?=
 =?utf-8?B?alBqSFhMTHdFY1J6MDZTTzlPaW1zaXR5aDZZbHdieGp2S3N3dGRuSHlQWkJl?=
 =?utf-8?B?NW5SZFd4eW9odWN6U3dhREl0N3dxL01VYTl3WWorOVdKT0xTeVZDN3lad3VN?=
 =?utf-8?B?WjRsL2R3TjU5QVhKeXBDVzJreWZTcTMxV1BxT0hXUWFHZ2tMWDJKZ3JFU1l1?=
 =?utf-8?B?bDBXeTFJemRKL0FrSUpGV1FRaS9iekpTWWlIVkJXblVFc3FGbHdZVmlFZStp?=
 =?utf-8?B?VmFQVFNqQVNnR2RFdVJXb21WUW1IQmoxRDBDdFdXYXlhM1VVcHk4NmQrZm90?=
 =?utf-8?B?ZlgrNDY5S1JtNENRclVDbENuUHUxN3BGM0lKSFhKRk03VXpNa2pKZ2xaSTQ3?=
 =?utf-8?B?ZUJIbkVxNXVibUJDR1hGZEpVOEF6dTZCV3dHTTF2VVVGRG5HYVhXYkN5Rm5R?=
 =?utf-8?B?Z1M1QmFTVXRNRWFYUzNML0RkN1FNSXRMYys3N2lZSnpQUjFPYlZ5cnMyTlBl?=
 =?utf-8?B?dGdNWEp5VkI2cWlLaDhUSmcrVmtSYUxFSXVuK2x5OHpJR1B1YTBwYm05M2hB?=
 =?utf-8?B?bmExMkRlWW1rSmtjOWJBK2hDZzhjcUdlMy8vT2NEeGxhQlNaTisyZ0pUeHdP?=
 =?utf-8?B?WkhlUDNLT3BxdHZTR2FibEdOV2ZlMThpWlBCbE9UYjRmWFNWMHE2cUhySWZU?=
 =?utf-8?Q?JT2gJDV6Zy2+red6u2V76Qo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5bb437-559a-4141-27ef-08db29a0ac49
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 00:10:26.6444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nwxF+GfCVnU3MOLvZ08j+cLx4jHb8tEONhoHNpoqD+cQ07nV7xsb+lxhrShFuivfSGSRtjvt2VRgg5FjadQQxwW3aBHdjyu1qgelAoCiYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-ORIG-GUID: uKYh3PS9kQGb23O0DhPWYdptFNBQSxJD
X-Proofpoint-GUID: Qwnm7N7aAlDJUb12Q7M6mt7m-YPnf5aD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_17,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=955 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 00:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178845

--------------0wYjp0Hqpmb0FRcqkyZa54kf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32KNfTqU018920

On 2023-03-20 09:07, Pawan Badganchi via lists.openembedded.org wrote:
> Hi Steve,
> Could you please take this patch to kirkstone branch?

Pawan,

Thanks for the curl fixes but this also seems to have the wrong upstream.

    +Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/mai=
n/c/curl/curl_7.81.0-1ubuntu1.8.debian.tar.xz]


Did you see Mingli's=C2=A0 re-work of your patch:

https://lists.openembedded.org/g/openembedded-core/message/178519

and the issue that Steve found to the other curl CVE fix:

https://lists.openembedded.org/g/openembedded-core/message/178650

?

We'll need the right upstream and to fix or understand and document the
autobuilder issue and the doc change.


../Randy


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178812):https://lists.openembedded.org/g/openembedd=
ed-core/message/178812
> Mute This Topic:https://lists.openembedded.org/mt/97623776/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------0wYjp0Hqpmb0FRcqkyZa54kf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-03-20 09:07, Pawan Badganchi
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:15189.1679317672786305038@lists.openembedded.org">
      
      Hi Steve,<br>
      Could you please take this patch to kirkstone branch?
      <br>
    </blockquote>
    <p>Pawan,</p>
    <p>Thanks for the curl fixes but this also seems to have the wrong
      upstream.</p>
    <pre class="moz-quote-pre" wrap="">   +Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0-1ubuntu1.8.debian.tar.xz">http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0-1ubuntu1.8.debian.tar.xz</a>]</pre>
    <p>&nbsp;&nbsp; <br>
      Did you see Mingli's&nbsp; re-work of your patch:<br>
    </p>
    <p>&nbsp;
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/178519">https://lists.openembedded.org/g/openembedded-core/message/178519</a></p>
    and the issue that Steve found to the other curl CVE fix:
    <p>&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/178650">https://lists.openembedded.org/g/openembedded-core/message/178650</a></p>
    <p>?<br>
    </p>
    <p>We'll need the right upstream and to fix or understand and
      document the <br>
      autobuilder issue and the doc change.<br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:15189.1679317672786305038@lists.openembedded.org">
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#178812): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/178812">https://lists.openembedded.org/g/openembedded-core/message/178812</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/97623776/3616765">https://lists.openembedded.org/mt/97623776/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0wYjp0Hqpmb0FRcqkyZa54kf--

