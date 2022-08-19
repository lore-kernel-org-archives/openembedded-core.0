Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC6BC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 12:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2629.1660913045170507588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f5iFmUhG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5230e6e2cf=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JCKeEn016832
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:44:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=uWXXTl1DPLLrj2JSAkpHuDezB2G+nG2c0nvme299G+w=;
 b=f5iFmUhGklmBYBzvoMtpVgr/7J/UTbNW7nLOXk+g601I5kcgwMwlkDikUh7Ecx5nQYPo
 OrRvWLyBBorSftm8nVvDfMqGwMVxIPt8OWHIjEmWqrIX3FUfhyvtGToa5cspj0LMmkS6
 vec8HNgaSSeFtf9G5LWqvJEP1Qsl/ccJJuDLv9NvaPtANQS73mQBNB4DKJeqbX1JACQQ
 C50xRybPQh+RTKqbUoiuPXjxk1499AG6gGfJhsjjg4WP5NHJVzF/WHliTlzmoiXNTeYc
 nl24ZJe6gN3tMkGkNwX4mAr2v5hLicugouuNvt5ZW1ZJvzAGB/7rD6Esej8UsfnedpZK zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783d7up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:44:04 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27JCi4QP006118
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:44:04 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783d7un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 05:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9TY0rsV1bw7fsxzslLx++1/a6Rn3LlPRy68JpCNBCbBwHSNXPxrDjaavyaIdU36IPoQkCIv3zVrNU8AZl3SGVAlup0Hy2HFVeeuGjU1y99mv4rsMon7QS02O3exJd+JgjjRf9wDn0WbkgnKycjQ4hmYai6HDH7OG/rzu8/nQRNyfkBezgQdGC1s8/aaEHsxq2idTsS1AjeoieW1ldaXaPIBnJFN7wleFk4gvXG0HOBiooMJLvXXqKlQYq69BQL3PD75BC5qjobHIH+/WWtLh80oB4bp+aotOQDihajczktWqFY4XEWbkF43y2KQ4IryCORdb+VX/9Sc1JC8gIXOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWXXTl1DPLLrj2JSAkpHuDezB2G+nG2c0nvme299G+w=;
 b=iqrJY/9X0CHfotWs5Q813mp7/uyiyYlxzVsjroWjCOOoFreIdTriWmkCxFK9S69H5GYQtbW5yazue/CBokQSRNyQ2Z73aBdbFX3J6zGIMW0yTQ6PhVauSUoGuxCX3GWtqL6OJvYq2K4nQNOAdhuJkWF9eTpwC18giz/o9WtEjkGr/e6N5mEv1LWYROVtreckTxTtB0LjRZ1QrPXcbVg/HtCZHYSp7y1RVMy4QT3+mlvfkT0Q8Jq12Ku/n91XuwYKl3CXyZDAjAVeNFNAFlptJGP1yuC+w0gmnmBxqkaRxyGMRimPbgUuJGOTnQEpqWH6rX/mrWh409VtuGOVrcLFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB2947.namprd11.prod.outlook.com (2603:10b6:208:33::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 19 Aug
 2022 12:44:01 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 12:44:01 +0000
Message-ID: <16d8c191-8545-828c-62d1-6e586c905d5a@windriver.com>
Date: Fri, 19 Aug 2022 08:43:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 2/2] selftest: Add regression test for rpm
 filenames
Content-Language: en-CA
To: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
References: <20220819092002.31294-1-pavel@zhukoff.net>
 <20220819092002.31294-2-pavel@zhukoff.net>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220819092002.31294-2-pavel@zhukoff.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12791dc-e7e3-4912-bf7e-08da81e07e13
X-MS-TrafficTypeDiagnostic: BL0PR11MB2947:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s950lNLDQxBzQYC/HzgNvNGLSw4K1pHQRg9vmLYr+0meyPdT4HCfUeZQQNm7WPzZOw4OLwSEOxPi0Imkavj0qEki7pr0pKu6vVMkWAVZIDFzAJilJi6/jOv4O2VK0qdubs8HuDfJAruLRJhy+zOqImpLZ59bbtrjGe7MXc/b4PD0VDDHNl5aKPduBd64xBiQFN57i6p4lWAIFMbdOzMwyxZa90/9u+8Lbhyu1ZyFADlfjW2htJ3BJje0xw936l+x4nPCzLFVY87MsUFNEvLs0zYaKnhuxYw9LdT+AIbQE8aCnMMDQORi+F8aJKlPsCl6drzUOoxeeZLTyt/jiout6xJOLa322NuCuZr5qLd7LYkzkDWuKtbyrOF/yoIVsrX4hrpOa24LcGNTNCbpYy5FV9H2ZH3hVB5k+kME98bAbcxWv75h4F8ygeBxcH2k2rcFZPSadJ/3oKH6UkhqAz0iS9JaBu7EAArpV382xprk3tUE7q0OZCDgEooCEXhbDcAHuQIBHRStuwYmbzZb14liRwI4ZJMIq+8S2sbdbZaAb5xqUT4NrnnCldGc6Bji0g/mzEBWHUE07iccvNpMKQLkF6+YyGGGOqjZAt+7aU0AdGmhqTiLzKh6f1rmJphniS+pHvZDEtYgB0ttTjT0GkuccuIYI3jXlphF9xCpQ7AIW46IzOn+D6x4R6SE2gsdxWoqrgaHb839PgeIuRsjx24gKQuR/IjGgNJI8dIVnBDaOSS+zd/23ERB/gJ6Z+2AaAt0X8cU13qk3kqtqCy29TWGefIWsCIe/wWXANuZGhDslGojDJnAwMUi4Swb7yuv1tvIo7tbCVSC+Fc2aA5R3Wad1JTme4+7vEgnRk1MHdheJWTlKhbgJTRrYH1YmEGOkR4NuWog4t24M0HfP3tFhNg2Jg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(6512007)(6506007)(316002)(26005)(6666004)(52116002)(53546011)(966005)(41300700001)(6486002)(478600001)(31696002)(86362001)(2906002)(66556008)(66946007)(66476007)(8676002)(4326008)(36756003)(8936002)(2616005)(186003)(38350700002)(83380400001)(38100700002)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Uk1uaHUvVDdxcTBvSGJaUnNMa2dyYW1vOEpjRkxsaHZkcVdOUmFxamNTL1dr?=
 =?utf-8?B?bXB5dVU0ZVorVFVqTXovTXkyZUpRM29IdmMybFRDaU5qUi85TWpQTDZ6czRB?=
 =?utf-8?B?Mmwxd053bnJJY1BjVkZLVEVkTXhHczZBem5peUxHVGRPcFNWUmIybmxzTHV6?=
 =?utf-8?B?MGZlTDg2MWx3TXY4QllzTWZzK3kvZk1aNW4zMUltTzJ6dGdpSnY1K2ExU1Bp?=
 =?utf-8?B?N1F2THliWnRrdzhBY0l4bXJ4Ny9jRTVSNUFnaTI0UncxeW05dzRDZzVCR0lB?=
 =?utf-8?B?eExPdGVjVHZFb3lYMmo0NXNEQlRtTHFuNzJ2elA2RzdMd2lNeURLVWtMVDB2?=
 =?utf-8?B?MmJ5S0FNTGMwKzR4Z0RHS0NYYmhMODYzYXd2L2dYNTNVU241NjJqR25FMW8x?=
 =?utf-8?B?dHdrNGNKeldrbDQ0dGZhRFlScXR1Tm1pM3ozMHFlRjVEOFp3SEpsQ0NJTERY?=
 =?utf-8?B?aTlNMWg1akRDeGhBQ0Y3U1ZrVlN4dDk1WVZ6ZzhyNENmNy83Slg2dGU5VVN0?=
 =?utf-8?B?aXhsN1lob1pWTFJ3ZlpkSW1RdTdWRUdEanFCTW5DMDVXcGpWc2c2elkrYm1P?=
 =?utf-8?B?N2t2RDBMYWhIS0FlMEg0NW1DUDczUUl1eFNIbTRkT3dvd0dvMFVFUzVEaXJt?=
 =?utf-8?B?NnRSV2Q4M1dsZ0NvL2JzY1Q2ZUxwd1J6aEJydHgrbmRsZzk4M2RTS050c2NY?=
 =?utf-8?B?Qzl2OVJyN1dmUlhNcmFZUjRqVmw5S01LamJhT0tQS2NjbGhCblM3QzczQkRt?=
 =?utf-8?B?RkF5SE9SVVFRUVMvSFVXWVFPeUNJU0N5ZEs5THFRWjRuV1ZRb0VKcmtzVE1T?=
 =?utf-8?B?ZVRmMHRsSjhMMnBjTk9Xc3JDRnd4QU43akxUdFdoVWFWenpFL21ibDB0QUQw?=
 =?utf-8?B?em9XYko5aE1FdlpjbWJQaHdCN2p1dVJQUlMyOWVZaHRiNHdQUm0ydDFpTldM?=
 =?utf-8?B?QXhMbGFmZjNISHU4cDEramdVWFFwdXZ0VHVTY3p2UkN6dnZUUktwbUd3UUN4?=
 =?utf-8?B?dFlUenc3NUlRa0JneHU1MktOQ243bnBMSEt3QjRXd2V4eXFiY1Q5NHNzOU84?=
 =?utf-8?B?M1AxVWxOa0JyK3BxMzJnb3JuTks0Y1I1eFo5VDVMQ2pxbzZ2NWxubmliOXNF?=
 =?utf-8?B?eERxTktiOGZ6OUkzTm9ld200N0ZycVVuT3E2NnZjd0tLRk1TL3p3ZHR4Wm5v?=
 =?utf-8?B?REJrbjVWWTR2NmtMUG9oTnNCWjRyeWNocStjWklTTGtRVHZ4djZoMlFiVlFr?=
 =?utf-8?B?c0l6aFZoVStvRXNhbGFMYmdONHZKek1jVHM1Wms2R0VWQWdmQ3RTbkVwOXhP?=
 =?utf-8?B?bm1XcE5xMS9sNlVsOURkOHQ2aE8weE1kNzFuNElNc0Fic3lQVi9sUXNIYjlH?=
 =?utf-8?B?S2cwWXA2NXE1bm14QnNnYndnRUU5YThYdmZjSG5WOHMweTJxQXBQYUFTUmdB?=
 =?utf-8?B?aWFYTHg0ZXdEeWNhMHA3aEJzd002Q21ualNIcmdSRFZENTVCditJNjNTdnRh?=
 =?utf-8?B?L3hrNEFVeDZmOXlrZmVxNy9Xa1dya1ZJUGNDWUlBc3NKL2Q3VWZCL21qYUpE?=
 =?utf-8?B?VGw4UXFodzZmRmo4ZVhNZXdTdGVlVlhSSUYvVnYwTWNmSmYzejR1d0pRaVlv?=
 =?utf-8?B?L3JJVklkLzFKMTZMWS9IUjhFT2VqOWt2T0NyZUIzb2hvazlqbTZLYldTdk9y?=
 =?utf-8?B?TVFhTDg3c3gwODdaQ3RxRHpyZUgxbzBCZjR4UVI2QXI1VERRc2hWUEd3TFBZ?=
 =?utf-8?B?aHV2Yys1M3BDd1hZOW5McHo0eEI0REp5M2tHQXA1ZlN3WlRNMjFGUTdsbEY5?=
 =?utf-8?B?S3RHWERIWlVtSG9yek0rZnB1VzZBRzd0T3pObDNvSnU2VElWSkh3WEdVZ25Y?=
 =?utf-8?B?UDJnSG1jSVJ4Yml6S3NtakJoVkJHUWZHZnlyTW4yeXFPU21OaWZwY3FoUmNR?=
 =?utf-8?B?ZGFhNFA1NEFGWXJzVHFEV2w4ZzkraHA4RWFiWjdTckFBdlpNVkc2cCtVNEpO?=
 =?utf-8?B?bTJwTUFYREdIai9IVUoxUXpoT3g4RmpmRWdzaExMUW80REYyWG02cWk4b1pM?=
 =?utf-8?B?T0Y5cy9OWEs3MldxS2V4RVluVkdWaFoxK1NQMXRTR1VLQUFodldmMHR4ZE9n?=
 =?utf-8?B?SU16R2NMdU96STM2amhWUzQzQ2JmSkpPdTRVNU5FcUYycDYxMUo4OVNHclRy?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b12791dc-e7e3-4912-bf7e-08da81e07e13
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:44:01.6102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oJFuybdJ9ObtHdkwfzY96qG/OdaOzsK5XSx/BUgW2MXkXhRCYj8nyFi8v/dBVd5LWoyB6jhuA2xA/Ns7PvAyDyMTAMkI8Tawl44u+vzqpbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2947
X-Proofpoint-ORIG-GUID: MeYqCYS5LTt2QwG9L6TbliqzIge1yC5o
X-Proofpoint-GUID: NFdyPHRA8dhv0XnhYn6qU8ZqaKdbgbOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_07,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 12:44:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169626

Hi Pavel,

On 2022-08-19 05:20, Pavel Zhukov wrote:
> Escaping globs and quoting in rpm spec files is tricky and requires a
> bit of dancing. In addition to that it changes from time to time.
> Adding (simple) regression test for different types of filename
> patterns. Cover bracket in first iteration

Nice.

> 
> [Yocto #13746]
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>   .../recipes-test/testrpm/files/testfile.txt     |  6 ++++++
>   .../recipes-test/testrpm/testrpm_0.0.1.bb       | 17 +++++++++++++++++
>   meta/lib/oeqa/selftest/cases/rpmtests.py        | 16 ++++++++++++++++
>   3 files changed, 39 insertions(+)
>   create mode 100644 meta-selftest/recipes-test/testrpm/files/testfile.txt
>   create mode 100644 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
>   create mode 100644 meta/lib/oeqa/selftest/cases/rpmtests.py
> 
> diff --git a/meta-selftest/recipes-test/testrpm/files/testfile.txt b/meta-selftest/recipes-test/testrpm/files/testfile.txt
> new file mode 100644
> index 00000000000..d1e50ff79a2
> --- /dev/null
> +++ b/meta-selftest/recipes-test/testrpm/files/testfile.txt
> @@ -0,0 +1,6 @@
> +  /mnt/builds/yocto/sources/meta-selftest/recipes-test/testrpm:
> +  total used in directory 16 available 76.4 GiB
> +  drwxr-xr-x  2 pavel pavel 4096 Aug 19 08:59 .
> +  drwxr-xr-x 34 pavel pavel 4096 Aug 18 17:59 ..
> +  -rw-r--r--  1 pavel pavel  408 Aug 19 08:59 testrpm_0.0.1.bb
> +  -rw-r--r--  1 pavel pavel  355 Aug 18 21:54 testrpm_0.0.1.bb~


I assume that you just want a testfile.txt that doesn't have any special 
characters in the name.
If so, maybe the body of the file should be text that explains that purpose.
If for some reason, you want the output you have, it would be nice to 
remove the backup file: testrpm_0.0.1.bb~
because it seems out of place.


> diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
> new file mode 100644
> index 00000000000..e42c7db3b39
> --- /dev/null
> +++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Test recipe for testing rpm generated by oe-core"
> +LICENSE = "CLOSED"

Why did you pick a CLOSED license rather than MIT ?
Our IP group would likely complain about this! ;-)

> +
> +SRC_URI = "file://testfile.txt"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +do_compile(){
> +	echo "testdata" > ${B}/"file with [quotes].txt"
> +	echo "testdata" > ${B}/"file with (quites).txt"


Since I'm being picky, would you rename these files to use the terms here:
 
https://grammar.yourdictionary.com/punctuation/what/fourteen-punctuation-marks.html
i.e.: Brackets, and Parentheses ?


../Randy


> +}
> +
> +do_install(){
> +	install ${B}/* ${D}/
> +}
> +
> +FILES:${PN} = "*"
> diff --git a/meta/lib/oeqa/selftest/cases/rpmtests.py b/meta/lib/oeqa/selftest/cases/rpmtests.py
> new file mode 100644
> index 00000000000..dafbbc21360
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rpmtests.py
> @@ -0,0 +1,16 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +
> +class BitbakeTests(OESelftestTestCase):
> +
> +    def test_rpm_filenames(self):
> +        test_recipe = "testrpm"
> +        bitbake(test_recipe)
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169617): https://lists.openembedded.org/g/openembedded-core/message/169617
> Mute This Topic: https://lists.openembedded.org/mt/93121038/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


