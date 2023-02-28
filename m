Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F3AC7EE23
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 02:00:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13676.1677549647286916664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 18:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=A/WM5RX5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14238a8117=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S1xoSt028636
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=P9Q0dmI80y3i7Foj5ieyaMpNPBOCzvz9X4l0ysAo4BQ=;
 b=A/WM5RX59gaap1R5MY9ljVLlTuznaZPlAS+Fcq5c0wXfvb+ppRyl9kWex28FG2gCPh1A
 BxbHbU8d67ndIsVdXXibG9XvbEfuYAWC58Hk9d76dlrmvPO2xvOFGkt5AYk0/EoHdCEq
 SRGeM3TMuGOQvL/QVEZ701ybP2G8WCdpFJrBxnwJs/DTZj4pDA7Y9tcw15fvMl9KjedI
 h9PZ3vreop6GKAhdKeKnslkWulcyr0DQMa38DH8kkNfugzyh6jLDPh/O6gCIO6e8d0VH
 96z6aD7NvcibKppEoy1S8cVzo6XPQ0ZWHdKB9cR1ECZp6XlYc4OXswjkTiSix9IbsZjA 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkag91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:46 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31S20jeU030825
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkag90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 02:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkS6eY4+13CRfvZ7vJyvZGdpzBP7dOftbxHvBmHnMiGOtE1a1BA+ox0r+s+1S9sfYLR82c0CdE7R7vL8mvDXtOOvEIyF+/Uafk8p0DceLwG+lCFMbMUSDLh9Ou5gyvLwXG7ooKgqczIMi/+gnnFdviSotzj0JG9wGlEj6BMnvl96GZ5Vt5L9FgFebzcwv4kD+3WnGxIu90xfCMZx1C4cWWfOfl9P8oA+u8h9v5YASSiMraxw4lbHIW+EMnczuHLHHmnfANl71kYIA/RMqRj1+edb1unwAi1pvnMfMlskDhKCp6HBryHyBXSzj+5b+YkUbjVZHrdPto/Id8ztTrWI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Q0dmI80y3i7Foj5ieyaMpNPBOCzvz9X4l0ysAo4BQ=;
 b=RGv9dh3aNRfzO//JkmTavqzEsvRRsU8RVvf4zrKZpEbO31iIMqjEGi/zPYISVdL/6+ZKwAGZ6x+MCkpsQaBiNvW2Hrckb91LyjPFnItkD5jPuTspcH9ilOiSQpfv30SWtjwp4pU3nqsU/KXH2OU/dI9o4zRMODCj/NvrUTCxwqA0XWuDIgDBv0co+aMoCuMynpvkbX/60L/Taozt05xMzadJ9VqEQhDVwb6x/0DQNScsnbLpSC0+VrWvJHlVGmVFroToPYrEOqqA+UPP47QO4gnunLl6GFcUY4S54B8IfiqWDVq4KJZcQ+Nyj2RW7flq6OQbzOYe6Ys8z/W6difJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Tue, 28 Feb
 2023 02:00:42 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6134.028; Tue, 28 Feb 2023
 02:00:41 +0000
Content-Type: multipart/alternative;
 boundary="------------D4gFhPAsvrPjg4WxcQQKdOD7"
Message-ID: <115d65b7-a18d-1fbb-67f9-51d6e9b92b30@windriver.com>
Date: Mon, 27 Feb 2023 21:00:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [kirkstone][PATCH] binutils : Fix CVE-2023-22608
Content-Language: en-CA
To: Yash Shinde <yashinde145@gmail.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
References: <20230226091122.4085470-1-yashinde145@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230226091122.4085470-1-yashinde145@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 85516e1b-4158-477a-2b2a-08db192f97f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N/DbKY/Na+GmjDpuJ68Aq2GUjp3091HiJ5zpO7lBFId9L30kDAwp7fA0JH4Aj0etugKfEvnJAHPIbGvos5KJHiWb6G+uEkmQ5LJXnVkXPJaYx0Qoq0vawrJzsBtnUNkhaWL8/SSAEvulNPkY5FZA36f6RQkD0jPEmVOstDk5urqCdxHlkF2M21rJGqcIwRTXSPGVEPrcSfTcmH3muAfOgdNfDc+MdKTgs4Bcr4JuPkmeptE9Jv12mm15+gkZFAcM7iUUQZnmZMt+k3dVE44l+3vnkzpsyVntrrDhAQBN3tGEZHYtQo9siOFFNidc52c8TYhnx5jegxLikAHgckA+5JcTM8Xkn2cM715ETfogWAiqBGiU8+yBZgHehxOOo3d//9cMJ4drwI7BT74t+XepOv7jQXD5u9gUuMNw06H4iXVOFNe8dygNQ034Kwo2sPNQcD2KugMjYYURpOstU0g0FknXGaW9tEJEOVCfGhZwRTbwITkMWmZD/FLjUtNqFAhgPjtyMB/mzWQifP6ae1uENtCUtmVBsPTm6BbhON0ibDzWoMfN6dNvxfLOBfgF86SkSbgWKaHl7kywvQmH05+yr6YNSoof3ZKWqeAaXW6M9zWqS1CgSui335I7tyw7//TJ0k41UTfuak9VkYJcRJ9KigSkLLqkLer3WB3itgn2tyYTDbUQziEp+HuE2BsesP9xwtlY4P+hiWRWBgjSR+rAT3wqyggxZzWkk4NSsdT24VPOy2R8ssGbCrQEuJ6KtqjS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(451199018)(166002)(86362001)(31696002)(36756003)(2616005)(31686004)(66574015)(41300700001)(6506007)(66476007)(66946007)(4326008)(8676002)(6486002)(186003)(6512007)(478600001)(26005)(110136005)(53546011)(6666004)(107886003)(38100700002)(966005)(316002)(66556008)(83380400001)(5660300002)(8936002)(33964004)(2906002)(30864003)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1h3Rk1WbTRXNTJNamltUkNYbDNUc0ZLS1kxOWZuTEhRZVhZMldzSE9VWXNL?=
 =?utf-8?B?VmVUTnljNHhlcklHWkxlSGh5Z1BSQzdXL3pGditPa3kvbVNERFFSYStnNlcr?=
 =?utf-8?B?Z3MrMXFRTmRMWGsvdmZWMFdPcWxTN1NZQkFzaFpnKzYzM2diMnhrYjdiU0pv?=
 =?utf-8?B?SGFRaVkyUm5tN1BQVzhTc0czNjI0cmtJUnQ2NDJjOFA3akgvSUVaWW9BcHZp?=
 =?utf-8?B?d3hrVlhQZ0JjcENrQ3dnT3UvNUx4NTJZQmRWZkFXOFBISkg3RzJkak9ubC9x?=
 =?utf-8?B?eTkvdVVWcTBpSXdsSTZ3SWNoUFJ6MnBvRXQyTVlwaUpYRWtENmkzMVdtazF1?=
 =?utf-8?B?dkV0U251S2N4VEVtUFVLeTB6akxNaDVIcXNZbmt6K3NIb21VaFRxa2hHejBZ?=
 =?utf-8?B?UkFUOVBzVWN3SXkzOGE3ZzJJd1ZZdUpQM003UUlhamYyUUYwK3Y4MWpVY05T?=
 =?utf-8?B?ZXlBZGhPdDk4Sld3UEVqei9jVGgreTRHb2tSWXp3UlJRWWF4eWlyVXkrVFRS?=
 =?utf-8?B?QXJ6NTVyQTlmWnJ5a0ZTeGNRZHgxZUZlV1NoV1BLUDBhOWJwbzVVYzJoa1lZ?=
 =?utf-8?B?NTVnVFRPdGNmZ0dQUlJEMUtPLzdOa0NVazczUHkvYlc2Ny9GcTF5dkFzWnYx?=
 =?utf-8?B?UmVZdXRGblEzZkJiQW1zbXFtWExOSCt5MVBRUURVaTB1b1BvYWhua3hOa29X?=
 =?utf-8?B?QlJ4K1ZRZnIvYnZaRCtrNjNEWnprc1pSZDdZN0QvdG9veDBXeE9uZGg0STd0?=
 =?utf-8?B?bjBOS242MTltMGdab0NGMGNudkRyZ0NYUURDcU9hWWRTeTRJYlIvRlUwbFRN?=
 =?utf-8?B?dGhIMjh0MjA0d0NnT1RuUGF0VVdodng4WEh3RnJCT3hEb1NncVdvWmFzY0F5?=
 =?utf-8?B?U2plREM2a0c1dzg2MzJxRk9BajlQMSs2NFJrSDhlRERhalVxSkMwOFhJT3pX?=
 =?utf-8?B?QnFZMVNpa2pXL0NpRUFNcGErcStXWkJZUTcyS3pTYWYvS2p6ak9qTE85M0k2?=
 =?utf-8?B?NXJyaUw0dENQSVhOK0NVaGRIcnlLWVlIT1pFQUlZVUtER1pPOVNZUHZnZ09L?=
 =?utf-8?B?cWJKMGVoTjNjSlJzYUsrazVWOHNnSWVlVDJwUkg4MWU0S1hXTm1VSGdRdlVS?=
 =?utf-8?B?MjFNOUZxNEQ5QmdvdzZaWE9GMmRtUzRyQThKVjVGNk9jRDdodE1FR0VEbEFH?=
 =?utf-8?B?d01mcFp6WnNneHpFNWVaNlBTbFVzNEtWTlliVjQzV1dELy9jZS9wSm9palpF?=
 =?utf-8?B?eHE2SFFkSk02aWNGSE45NzdNNDdJQ0lJZ2tWYm9Gem5YWUo1eDZlbXZqLzhv?=
 =?utf-8?B?YlIxZzI0cFdoZ3BMYTQ4UW9mNUM5L2M0WXRNa21uVmNqaHc5aVhwT2hLL0U0?=
 =?utf-8?B?dGVnOGxyMm1rdGhmRndSdkFuenRVaXZ1T2FFbHZra3BTRHo0U1VUQk1RK3pt?=
 =?utf-8?B?cmI4ZXhUa1JpNkJ2RjVEbGFCT0JrWkNxd1Z1NDJmbWVmdGFsRC80SitaOG9r?=
 =?utf-8?B?dmxVeFFWQXdqMDIyNFNNODRvelVNMXBLeHpvTUZ2ZkxKR0IyYW52K1poeVdx?=
 =?utf-8?B?OWFTeGRXL2cyRE1KVmZRNFI2QUE4LzZEd1hkV0lLRFVWZ05MOEJkeStUa0dI?=
 =?utf-8?B?OFZVdDVwa3Z5aGN0YU5BVnExQUxoa3orUkhNVC9WTkwyaWNwS2lOZlZpUy9M?=
 =?utf-8?B?TjVQU0ZQSXZickVpTFlYN0FsUEQ3UDNsbXVqZWZBS3N3TFUzRThKUHBQcXVP?=
 =?utf-8?B?Y0VlNWFja3FlSEhuVGlrZFBPVG1kbmhQN2VlMTFsVTdGWDh6Z2VCbThTS0Zs?=
 =?utf-8?B?SThRWi9QTTRDZlBsRklWL2NWSXBRTzljcHNLaXE2R3ZLd2VaTW9LRUQvdkVK?=
 =?utf-8?B?a1FCdjhyMHN2a2p2eEdzaHVZYXRyUi90SW9USG10cmtSb2k3NGhiQXpwRWV6?=
 =?utf-8?B?OVU0bjZQWFVjRkgvbFI3dmFlUWlZOUN5ZFR2TjlaT1JRUG9wbVdQZ0huWmJM?=
 =?utf-8?B?VFFTWjlaUDZ6c0VzbmxqQW5aaG1lRHhIaEkvQzJkMGNMZkc4WjJ5N0tPSWRZ?=
 =?utf-8?B?dXl1a1JKcmZucjBtUlpCc3loZlZ0MkpRdXI2SG5zYW5xMzdWcjd5TEpYT2JX?=
 =?utf-8?B?RjcyajA2eE1jNGNWbG9nM3BOb3JpczBlb2pQRUN2UTVrRWZ5RmFUYkZ2SXk3?=
 =?utf-8?Q?w1RPfZbgFRkZoIeIl5Py0ck=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85516e1b-4158-477a-2b2a-08db192f97f7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 02:00:41.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo/BLdK2ZH8+U6331QKd2XtmP+isdGEzUplsV6Zt1pbrvvO5G7AzZ0PuWa+n9ogUS6WL+jvcDzO70lFy45PREQ5y0W38HW3m4kGWzy/NPGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
X-Proofpoint-GUID: vfgNsqwBMwbMuY1drHFq1q8SGp7kkmEE
X-Proofpoint-ORIG-GUID: shGy3dYPMpHaFuBG4WbhRR0eVvQXBVGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_19,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177815

--------------D4gFhPAsvrPjg4WxcQQKdOD7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31S1xoSt028636

On 2023-02-26 04:11, Yash Shinde wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb=
.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   .../binutils/binutils-2.38.inc                |   3 +
>   .../binutils/0020-CVE-2023-22608-1.patch      | 502 +++++++++++++++++=
+
>   .../binutils/0020-CVE-2023-22608-2.patch      | 211 ++++++++
>   .../binutils/0020-CVE-2023-22608-3.patch      |  33 ++

This is a large patch so I took a look at it.


The actual fix is: 0020-CVE-2023-22608-3.patch

https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd/dwa=
rf2.c;h=3D88335cb4fb0dddc3b1ca8a1d76c32b88ff85aa89;hp=3Db608afbc0cf260e98=
e2f87ab6d55c935937b2810;hb=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09;hpb=
=3D8fbad19958c9b9c06a710bf7d6589d52f1ed8a64

which is just a few lines.

Unfortunately we do need the other two, rather large patches to make=20
that apply it seems.

The patch that adds a trie seems like a feature but the code is all (I=20
think) file
scope local structs with static functions so as far as the ABI=20
stability, it seems fine
to backport. It will change the memory footprint:

commit b43771b045fb5616da3964f2994eefbe8ae70d32
Author: Steinar H. Gunderson <sesse@google.com>
Date:=C2=A0=C2=A0 Fri May 20 10:10:34 2022

 =C2=A0=C2=A0=C2=A0 add a trie to map quickly from address range to compi=
lation unit

 =C2=A0=C2=A0=C2=A0 When using perf to profile large binaries,=20
_bfd_dwarf2_find_nearest_line()
 =C2=A0=C2=A0=C2=A0 becomes a hotspot, as perf wants to get line number i=
nformation
 =C2=A0=C2=A0=C2=A0 (for inline-detection purposes) for each and every sa=
mple. In Chromium
 =C2=A0=C2=A0=C2=A0 in particular (the content_shell binary), this entail=
s going through
 =C2=A0=C2=A0=C2=A0 475k address ranges, which takes a long time when don=
e repeatedly.

 =C2=A0=C2=A0=C2=A0 Add a radix-256 trie over the address space to quickl=
y map address to
 =C2=A0=C2=A0=C2=A0 compilation unit spaces; for content_shell, which is =
1.6 GB when some
 =C2=A0=C2=A0=C2=A0 (but not full) debug information turned is on, we go =
from 6 ms to
 =C2=A0=C2=A0=C2=A0 0.006 ms (6 =C2=B5s) for each lookup from address to =
compilation unit, a=20
1000x
 =C2=A0=C2=A0=C2=A0 speedup.

 =C2=A0=C2=A0=C2=A0 There is a modest RAM increase of 180 MB in this bina=
ry (the existing
 =C2=A0=C2=A0=C2=A0 linked list over ranges uses about 10 MB, and the ent=
ire perf job uses
 =C2=A0=C2=A0=C2=A0 between 2=E2=80=933 GB for a medium-size profile); fo=
r smaller binaries=20
with few
 =C2=A0=C2=A0=C2=A0 ranges, there should be hardly any extra RAM usage at=
 all.

../Randy

>   4 files changed, 749 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-1.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-2.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-3.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/re=
cipes-devtools/binutils/binutils-2.38.inc
> index 0a4a0d7bc1..30a34d7ba4 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -43,5 +43,8 @@ SRC_URI =3D "\
>        file://0018-CVE-2022-38128-2.patch  \
>        file://0018-CVE-2022-38128-3.patch  \
>        file://0019-CVE-2022-4285.patch  \
> +file://0020-CVE-2023-22608-1.patch  \
> +file://0020-CVE-2023-22608-2.patch  \
> +file://0020-CVE-2023-22608-3.patch  \
>   "
>   S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2260=
8-1.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1=
.patch
> new file mode 100644
> index 0000000000..dd3d533d0d
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.pat=
ch
> @@ -0,0 +1,502 @@
> +From a79c274dad99863f58b9ed627b38908daadb6d7e Mon Sep 17 00:00:00 2001
> +From: "Steinar H. Gunderson"<sesse@google.com>
> +Date: Fri, 20 May 2022 16:10:34 +0200
> +Subject: [PATCH] add a trie to map quickly from address range to compi=
lation
> + unit
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +When using perf to profile large binaries, _bfd_dwarf2_find_nearest_li=
ne()
> +becomes a hotspot, as perf wants to get line number information
> +(for inline-detection purposes) for each and every sample. In Chromium
> +in particular (the content_shell binary), this entails going through
> +475k address ranges, which takes a long time when done repeatedly.
> +
> +Add a radix-256 trie over the address space to quickly map address to
> +compilation unit spaces; for content_shell, which is 1.6 GB when some
> +(but not full) debug information turned is on, we go from 6 ms to
> +0.006 ms (6 =C2=B5s) for each lookup from address to compilation unit,=
 a 1000x
> +speedup.
> +
> +There is a modest RAM increase of 180 MB in this binary (the existing
> +linked list over ranges uses about 10 MB, and the entire perf job uses
> +between 2-3 GB for a medium-size profile); for smaller binaries with f=
ew
> +ranges, there should be hardly any extra RAM usage at all.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff;h=3Db43771b045fb5616da3964f2994eefbe8ae70d32]
> +
> +CVE: CVE-2023-22608
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +
> +---
> + bfd/dwarf2.c | 326 ++++++++++++++++++++++++++++++++++++++++++++++++--=
-
> + 1 file changed, 312 insertions(+), 14 deletions(-)
> +
> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> +index fdf071c3..0ae50a37 100644
> +--- a/bfd/dwarf2.c
> ++++ b/bfd/dwarf2.c
> +@@ -82,6 +82,77 @@ struct adjusted_section
> +   bfd_vma adj_vma;
> + };
> +
> ++/* A trie to map quickly from address range to compilation unit.
> ++
> ++   This is a fairly standard radix-256 trie, used to quickly locate w=
hich
> ++   compilation unit any given address belongs to.  Given that each co=
mpilation
> ++   unit may register hundreds of very small and unaligned ranges (whi=
ch may
> ++   potentially overlap, due to inlining and other concerns), and a la=
rge
> ++   program may end up containing hundreds of thousands of such ranges=
, we cannot
> ++   scan through them linearly without undue slowdown.
> ++
> ++   We use a hybrid trie to avoid memory explosion: There are two type=
s of trie
> ++   nodes, leaves and interior nodes.  (Almost all nodes are leaves, s=
o they
> ++   take up the bulk of the memory usage.) Leaves contain a simple arr=
ay of
> ++   ranges (high/low address) and which compilation unit contains thos=
e ranges,
> ++   and when we get to a leaf, we scan through it linearly.  Interior =
nodes
> ++   contain pointers to 256 other nodes, keyed by the next byte of the=
 address.
> ++   So for a 64-bit address like 0x1234567abcd, we would start at the =
root and go
> ++   down child[0x00]->child[0x00]->child[0x01]->child[0x23]->child[0x4=
5] etc.,
> ++   until we hit a leaf.  (Nodes are, in general, leaves until they ex=
ceed the
> ++   default allocation of 16 elements, at which point they are convert=
ed to
> ++   interior node if possible.) This gives us near-constant lookup tim=
es;
> ++   the only thing that can be costly is if there are lots of overlapp=
ing ranges
> ++   within a single 256-byte segment of the binary, in which case we h=
ave to
> ++   scan through them all to find the best match.
> ++
> ++   For a binary with few ranges, we will in practice only have a sing=
le leaf
> ++   node at the root, containing a simple array.  Thus, the scheme is =
efficient
> ++   for both small and large binaries.
> ++ */
> ++
> ++/* Experiments have shown 16 to be a memory-efficient default leaf si=
ze.
> ++   The only case where a leaf will hold more memory than this, is at =
the
> ++   bottomost level (covering 256 bytes in the binary), where we'll ex=
pand
> ++   the leaf to be able to hold more ranges if needed.
> ++ */
> ++#define TRIE_LEAF_SIZE 16
> ++
> ++/* All trie_node pointers will really be trie_leaf or trie_interior,
> ++   but they have this common head.  */
> ++struct trie_node
> ++{
> ++  /* If zero, we are an interior node.
> ++     Otherwise, how many ranges we have room for in this leaf.  */
> ++  unsigned int num_room_in_leaf;
> ++};
> ++
> ++struct trie_leaf
> ++{
> ++  struct trie_node head;
> ++  unsigned int num_stored_in_leaf;
> ++  struct {
> ++    struct comp_unit *unit;
> ++    bfd_vma low_pc, high_pc;
> ++  } ranges[TRIE_LEAF_SIZE];
> ++};
> ++
> ++struct trie_interior
> ++{
> ++  struct trie_node head;
> ++  struct trie_node *children[256];
> ++};
> ++
> ++static struct trie_node *alloc_trie_leaf (bfd *abfd)
> ++{
> ++  struct trie_leaf *leaf =3D
> ++    bfd_zalloc (abfd, sizeof (struct trie_leaf));
> ++  if (leaf =3D=3D NULL)
> ++    return NULL;
> ++  leaf->head.num_room_in_leaf =3D TRIE_LEAF_SIZE;
> ++  return &leaf->head;
> ++}
> ++
> + struct dwarf2_debug_file
> + {
> +   /* The actual bfd from which debug info was loaded.  Might be
> +@@ -139,6 +210,9 @@ struct dwarf2_debug_file
> +   /* A list of all previously read comp_units.  */
> +   struct comp_unit *all_comp_units;
> +
> ++  /* A list of all previously read comp_units with no ranges (yet).  =
*/
> ++  struct comp_unit *all_comp_units_without_ranges;
> ++
> +   /* Last comp unit in list above.  */
> +   struct comp_unit *last_comp_unit;
> +
> +@@ -147,6 +221,9 @@ struct dwarf2_debug_file
> +
> +   /* Hash table to map offsets to decoded abbrevs.  */
> +   htab_t abbrev_offsets;
> ++
> ++  /* Root of a trie to map addresses to compilation units.  */
> ++  struct trie_node *trie_root;
> + };
> +
> + struct dwarf2_debug
> +@@ -220,6 +297,11 @@ struct comp_unit
> +   /* Chain the previously read compilation units.  */
> +   struct comp_unit *next_unit;
> +
> ++  /* Chain the previously read compilation units that have no ranges =
yet.
> ++     We scan these separately when we have a trie over the ranges.
> ++     Unused if arange.high !=3D 0. */
> ++  struct comp_unit *next_unit_without_ranges;
> ++
> +   /* Likewise, chain the compilation unit read after this one.
> +      The comp units are stored in reversed reading order.  */
> +   struct comp_unit *prev_unit;
> +@@ -296,6 +378,10 @@ struct comp_unit
> +
> +   /* TRUE if symbols are cached in hash table for faster lookup by na=
me.  */
> +   bool cached;
> ++
> ++  /* Used when iterating over trie leaves to know which units we have
> ++     already seen in this iteration.  */
> ++  bool mark;
> + };
> +
> + /* This data structure holds the information of an abbrev.  */
> +@@ -1766,9 +1852,189 @@ concat_filename (struct line_info_table *table=
, unsigned int file)
> +   return strdup (filename);
> + }
> +
> ++/* Number of bits in a bfd_vma.  */
> ++#define VMA_BITS (8 * sizeof (bfd_vma))
> ++
> ++/* Check whether [low1, high1) can be combined with [low2, high2),
> ++   i.e., they touch or overlap.  */
> ++static bool ranges_overlap (bfd_vma low1,
> ++			    bfd_vma high1,
> ++			    bfd_vma low2,
> ++			    bfd_vma high2)
> ++{
> ++  if (low1 =3D=3D low2 || high1 =3D=3D high2)
> ++    return true;
> ++
> ++  /* Sort so that low1 is below low2. */
> ++  if (low1 > low2)
> ++    {
> ++      bfd_vma tmp;
> ++
> ++      tmp =3D low1;
> ++      low1 =3D low2;
> ++      low2 =3D tmp;
> ++
> ++      tmp =3D high1;
> ++      high1 =3D high2;
> ++      high2 =3D tmp;
> ++    }
> ++
> ++  /* We touch iff low2 =3D=3D high1.
> ++     We overlap iff low2 is within [low1, high1). */
> ++  return (low2 <=3D high1);
> ++}
> ++
> ++/* Insert an address range in the trie mapping addresses to compilati=
on units.
> ++   Will return the new trie node (usually the same as is being sent i=
n, but
> ++   in case of a leaf-to-interior conversion, or expansion of a leaf, =
it may be
> ++   different), or NULL on failure.
> ++ */
> ++static struct trie_node *insert_arange_in_trie(bfd *abfd,
> ++					       struct trie_node *trie,
> ++					       bfd_vma trie_pc,
> ++					       unsigned int trie_pc_bits,
> ++					       struct comp_unit *unit,
> ++					       bfd_vma low_pc,
> ++					       bfd_vma high_pc)
> ++{
> ++  bfd_vma clamped_low_pc, clamped_high_pc;
> ++  int ch, from_ch, to_ch;
> ++  bool is_full_leaf =3D false;
> ++
> ++  /* See if we can extend any of the existing ranges.  This merging
> ++     isn't perfect (if merging opens up the possibility of merging tw=
o existing
> ++     ranges, we won't find them), but it takes the majority of the ca=
ses.  */
> ++  if (trie->num_room_in_leaf > 0)
> ++    {
> ++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
> ++      unsigned int i;
> ++
> ++      for (i =3D 0; i < leaf->num_stored_in_leaf; ++i)
> ++	{
> ++	  if (leaf->ranges[i].unit =3D=3D unit &&
> ++	      ranges_overlap(low_pc, high_pc,
> ++			     leaf->ranges[i].low_pc, leaf->ranges[i].high_pc))
> ++	    {
> ++	      if (low_pc < leaf->ranges[i].low_pc)
> ++		leaf->ranges[i].low_pc =3D low_pc;
> ++	      if (high_pc > leaf->ranges[i].high_pc)
> ++		leaf->ranges[i].high_pc =3D high_pc;
> ++	      return trie;
> ++	    }
> ++	}
> ++
> ++      is_full_leaf =3D leaf->num_stored_in_leaf =3D=3D trie->num_room=
_in_leaf;
> ++    }
> ++
> ++  /* If we're a leaf with no more room and we're _not_ at the bottom,
> ++     convert to an interior node.  */
> ++  if (is_full_leaf && trie_pc_bits < VMA_BITS)
> ++    {
> ++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
> ++      unsigned int i;
> ++
> ++      trie =3D bfd_zalloc (abfd, sizeof (struct trie_interior));
> ++      if (!trie)
> ++	return NULL;
> ++      is_full_leaf =3D false;
> ++
> ++      /* TODO: If we wanted to save a little more memory at the cost =
of
> ++	 complexity, we could have reused the old leaf node as one of the
> ++	 children of the new interior node, instead of throwing it away.  */
> ++      for (i =3D 0; i < leaf->num_stored_in_leaf; ++i)
> ++        {
> ++	  if (!insert_arange_in_trie (abfd, trie, trie_pc, trie_pc_bits,
> ++				      leaf->ranges[i].unit, leaf->ranges[i].low_pc,
> ++				      leaf->ranges[i].high_pc))
> ++	    return NULL;
> ++	}
> ++    }
> ++
> ++  /* If we're a leaf with no more room and we _are_ at the bottom,
> ++     we have no choice but to just make it larger. */
> ++  if (is_full_leaf)
> ++    {
> ++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
> ++      unsigned int new_room_in_leaf =3D trie->num_room_in_leaf * 2;
> ++      struct trie_leaf *new_leaf;
> ++
> ++      new_leaf =3D bfd_zalloc (abfd,
> ++	sizeof (struct trie_leaf) +
> ++	  (new_room_in_leaf - TRIE_LEAF_SIZE) * sizeof (leaf->ranges[0]));
> ++      new_leaf->head.num_room_in_leaf =3D new_room_in_leaf;
> ++      new_leaf->num_stored_in_leaf =3D leaf->num_stored_in_leaf;
> ++
> ++      memcpy (new_leaf->ranges,
> ++	      leaf->ranges,
> ++	      leaf->num_stored_in_leaf * sizeof (leaf->ranges[0]));
> ++      trie =3D &new_leaf->head;
> ++      is_full_leaf =3D false;
> ++
> ++      /* Now the insert below will go through.  */
> ++    }
> ++
> ++  /* If we're a leaf (now with room), we can just insert at the end. =
 */
> ++  if (trie->num_room_in_leaf > 0)
> ++    {
> ++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
> ++
> ++      unsigned int i =3D leaf->num_stored_in_leaf++;
> ++      leaf->ranges[i].unit =3D unit;
> ++      leaf->ranges[i].low_pc =3D low_pc;
> ++      leaf->ranges[i].high_pc =3D high_pc;
> ++      return trie;
> ++    }
> ++
> ++  /* Now we are definitely an interior node, so recurse into all
> ++     the relevant buckets.  */
> ++
> ++  /* Clamp the range to the current trie bucket.  */
> ++  clamped_low_pc =3D low_pc;
> ++  clamped_high_pc =3D high_pc;
> ++  if (trie_pc_bits > 0)
> ++    {
> ++      bfd_vma bucket_high_pc =3D
> ++	trie_pc + ((bfd_vma)-1 >> trie_pc_bits);  /* Inclusive.  */
> ++      if (clamped_low_pc < trie_pc)
> ++	clamped_low_pc =3D trie_pc;
> ++      if (clamped_high_pc > bucket_high_pc)
> ++	clamped_high_pc =3D bucket_high_pc;
> ++    }
> ++
> ++  /* Insert the ranges in all buckets that it spans.  */
> ++  from_ch =3D (clamped_low_pc >> (VMA_BITS - trie_pc_bits - 8)) & 0xf=
f;
> ++  to_ch =3D ((clamped_high_pc - 1) >> (VMA_BITS - trie_pc_bits - 8)) =
& 0xff;
> ++  for (ch =3D from_ch; ch <=3D to_ch; ++ch)
> ++    {
> ++      struct trie_interior *interior =3D (struct trie_interior *) tri=
e;
> ++      struct trie_node *child =3D interior->children[ch];
> ++
> ++      if (child =3D=3D NULL)
> ++        {
> ++	  child =3D alloc_trie_leaf (abfd);
> ++	  if (!child)
> ++	    return NULL;
> ++	}
> ++      child =3D insert_arange_in_trie (abfd,
> ++				     child,
> ++				     trie_pc + ((bfd_vma)ch << (VMA_BITS - trie_pc_bits - 8)),
> ++				     trie_pc_bits + 8,
> ++				     unit,
> ++				     low_pc,
> ++				     high_pc);
> ++      if (!child)
> ++	return NULL;
> ++
> ++      interior->children[ch] =3D child;
> ++    }
> ++
> ++    return trie;
> ++}
> ++
> ++
> + static bool
> +-arange_add (const struct comp_unit *unit, struct arange *first_arange=
,
> +-	    bfd_vma low_pc, bfd_vma high_pc)
> ++arange_add (struct comp_unit *unit, struct arange *first_arange,
> ++	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
> + {
> +   struct arange *arange;
> +
> +@@ -1776,6 +2042,19 @@ arange_add (const struct comp_unit *unit, struc=
t arange *first_arange,
> +   if (low_pc =3D=3D high_pc)
> +     return true;
> +
> ++  if (trie_root !=3D NULL)
> ++    {
> ++      *trie_root =3D insert_arange_in_trie (unit->file->bfd_ptr,
> ++					  *trie_root,
> ++					  0,
> ++					  0,
> ++					  unit,
> ++					  low_pc,
> ++					  high_pc);
> ++      if (*trie_root =3D=3D NULL)
> ++	return false;
> ++    }
> ++
> +   /* If the first arange is empty, use it.  */
> +   if (first_arange->high =3D=3D 0)
> +     {
> +@@ -2410,7 +2689,8 @@ decode_line_info (struct comp_unit *unit)
> +		    low_pc =3D address;
> +		  if (address > high_pc)
> +		    high_pc =3D address;
> +-		  if (!arange_add (unit, &unit->arange, low_pc, high_pc))
> ++		  if (!arange_add (unit, &unit->arange, &unit->file->trie_root,
> ++				   low_pc, high_pc))
> +		    goto line_fail;
> +		  break;
> +		case DW_LNE_set_address:
> +@@ -3134,7 +3414,7 @@ find_abstract_instance (struct comp_unit *unit,
> +
> + static bool
> + read_ranges (struct comp_unit *unit, struct arange *arange,
> +-	     bfd_uint64_t offset)
> ++	     struct trie_node **trie_root, bfd_uint64_t offset)
> + {
> +   bfd_byte *ranges_ptr;
> +   bfd_byte *ranges_end;
> +@@ -3169,7 +3449,7 @@ read_ranges (struct comp_unit *unit, struct aran=
ge *arange,
> +	base_address =3D high_pc;
> +        else
> +	{
> +-	  if (!arange_add (unit, arange,
> ++	  if (!arange_add (unit, arange, trie_root,
> +			   base_address + low_pc, base_address + high_pc))
> +	    return false;
> +	}
> +@@ -3179,7 +3459,7 @@ read_ranges (struct comp_unit *unit, struct aran=
ge *arange,
> +
> + static bool
> + read_rnglists (struct comp_unit *unit, struct arange *arange,
> +-	       bfd_uint64_t offset)
> ++	       struct trie_node **trie_root, bfd_uint64_t offset)
> + {
> +   bfd_byte *rngs_ptr;
> +   bfd_byte *rngs_end;
> +@@ -3253,19 +3533,19 @@ read_rnglists (struct comp_unit *unit, struct =
arange *arange,
> +	  return false;
> +	}
> +
> +-      if (!arange_add (unit, arange, low_pc, high_pc))
> ++      if (!arange_add (unit, arange, trie_root, low_pc, high_pc))
> +	return false;
> +     }
> + }
> +
> + static bool
> + read_rangelist (struct comp_unit *unit, struct arange *arange,
> +-		bfd_uint64_t offset)
> ++		struct trie_node **trie_root, bfd_uint64_t offset)
> + {
> +   if (unit->version <=3D 4)
> +-    return read_ranges (unit, arange, offset);
> ++    return read_ranges (unit, arange, trie_root, offset);
> +   else
> +-    return read_rnglists (unit, arange, offset);
> ++    return read_rnglists (unit, arange, trie_root, offset);
> + }
> +
> + static struct funcinfo *
> +@@ -3563,7 +3843,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
> +
> +		case DW_AT_ranges:
> +		  if (is_int_form (&attr)
> +-		      && !read_rangelist (unit, &func->arange, attr.u.val))
> ++		      && !read_rangelist (unit, &func->arange,
> ++					  &unit->file->trie_root, attr.u.val))
> +		    goto fail;
> +		  break;
> +
> +@@ -3679,7 +3960,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
> +
> +       if (func && high_pc !=3D 0)
> +	{
> +-	  if (!arange_add (unit, &func->arange, low_pc, high_pc))
> ++	  if (!arange_add (unit, &func->arange, &unit->file->trie_root,
> ++			   low_pc, high_pc))
> +	    goto fail;
> +	}
> +     }
> +@@ -3874,7 +4156,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
> +
> +	case DW_AT_ranges:
> +	  if (is_int_form (&attr)
> +-	      && !read_rangelist (unit, &unit->arange, attr.u.val))
> ++	      && !read_rangelist (unit, &unit->arange,
> ++				  &unit->file->trie_root, attr.u.val))
> +	    return NULL;
> +	  break;
> +
> +@@ -3916,7 +4199,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
> +     high_pc +=3D low_pc;
> +   if (high_pc !=3D 0)
> +     {
> +-      if (!arange_add (unit, &unit->arange, low_pc, high_pc))
> ++      if (!arange_add (unit, &unit->arange, &unit->file->trie_root,
> ++		       low_pc, high_pc))
> +	return NULL;
> +     }
> +
> +@@ -4747,6 +5031,14 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *d=
ebug_bfd,
> +   if (!stash->alt.abbrev_offsets)
> +     return false;
> +
> ++  stash->f.trie_root =3D alloc_trie_leaf (abfd);
> ++  if (!stash->f.trie_root)
> ++    return false;
> ++
> ++  stash->alt.trie_root =3D alloc_trie_leaf (abfd);
> ++  if (!stash->alt.trie_root)
> ++    return false;
> ++
> +   *pinfo =3D stash;
> +
> +   if (debug_bfd =3D=3D NULL)
> +@@ -4918,6 +5210,12 @@ stash_comp_unit (struct dwarf2_debug *stash, st=
ruct dwarf2_debug_file *file)
> +	  each->next_unit =3D file->all_comp_units;
> +	  file->all_comp_units =3D each;
> +
> ++	  if (each->arange.high =3D=3D 0)
> ++	    {
> ++	      each->next_unit_without_ranges =3D file->all_comp_units_withou=
t_ranges;
> ++	      file->all_comp_units_without_ranges =3D each->next_unit_withou=
t_ranges;
> ++	    }
> ++
> +	  file->info_ptr +=3D length;
> +	  return each;
> +	}
> diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2260=
8-2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2=
.patch
> new file mode 100644
> index 0000000000..8ffb500c1d
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.pat=
ch
> @@ -0,0 +1,211 @@
> +From 73e97e32e1428d63d81d971176772ae69397a1a0 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton<nickc@redhat.com>
> +Date: Tue, 30 Aug 2022 16:01:20 +0100
> +Subject: [PATCH] BFD library: Use entry 0 in directory and filename ta=
bles of
> + DWARF-5 debug info.
> +
> +	PR 29529
> +	* dwarf2.c (struct line_info_table): Add new field:
> +	use_dir_and_file_0.
> +	(concat_filename): Use new field to help select the correct table
> +	slot.
> +	(read_formatted_entries): Do not skip entry 0.
> +	(decode_line_info): Set new field depending upon the version of
> +	DWARF being parsed.  Initialise filename based upon the setting of
> +	the new field.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff;h=3D37833b966576c5d25e797ea3b6c33d0459a71892]
> +CVE: CVE-2023-22608
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +
> +---
> + bfd/ChangeLog                      | 12 +++++
> + bfd/dwarf2.c                       | 86 ++++++++++++++++++++---------=
-
> + ld/ChangeLog                       |  5 ++
> + ld/testsuite/ld-x86-64/pr27587.err |  2 +-
> + 4 files changed, 76 insertions(+), 29 deletions(-)
> +
> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> +index 0ae50a37..b7839ad6 100644
> +--- a/bfd/dwarf2.c
> ++++ b/bfd/dwarf2.c
> +@@ -1571,6 +1571,7 @@ struct line_info_table
> +   unsigned int		num_files;
> +   unsigned int		num_dirs;
> +   unsigned int		num_sequences;
> ++  bool                  use_dir_and_file_0;
> +   char *		comp_dir;
> +   char **		dirs;
> +   struct fileinfo*	files;
> +@@ -1791,16 +1792,30 @@ concat_filename (struct line_info_table *table=
, unsigned int file)
> + {
> +   char *filename;
> +
> +-  if (table =3D=3D NULL || file - 1 >=3D table->num_files)
> ++  /* Pre DWARF-5 entry 0 in the directory and filename tables was not=
 used.
> ++     So in order to save space in the tables used here the info for, =
eg
> ++     directory 1 is stored in slot 0 of the directory table, director=
y 2
> ++     in slot 1 and so on.
> ++
> ++     Starting with DWARF-5 the 0'th entry is used so there is a one t=
o one
> ++     mapping between DWARF slots and internal table entries.  */
> ++  if (! table->use_dir_and_file_0)
> +     {
> +-      /* FILE =3D=3D 0 means unknown.  */
> +-      if (file)
> +-	_bfd_error_handler
> +-	  (_("DWARF error: mangled line number section (bad file number)"));
> ++      /* Pre DWARF-5, FILE =3D=3D 0 means unknown.  */
> ++      if (file =3D=3D 0)
> ++	return strdup ("<unknown>");
> ++      -- file;
> ++    }
> ++
> ++  if (table =3D=3D NULL || file >=3D table->num_files)
> ++    {
> ++      _bfd_error_handler
> ++	(_("DWARF error: mangled line number section (bad file number)"));
> +       return strdup ("<unknown>");
> +     }
> +
> +-  filename =3D table->files[file - 1].name;
> ++  filename =3D table->files[file].name;
> ++
> +   if (filename =3D=3D NULL)
> +     return strdup ("<unknown>");
> +
> +@@ -1811,12 +1826,17 @@ concat_filename (struct line_info_table *table=
, unsigned int file)
> +       char *name;
> +       size_t len;
> +
> +-      if (table->files[file - 1].dir
> ++      if (table->files[file].dir
> +	  /* PR 17512: file: 0317e960.  */
> +-	  && table->files[file - 1].dir <=3D table->num_dirs
> ++	  && table->files[file].dir <=3D table->num_dirs
> +	  /* PR 17512: file: 7f3d2e4b.  */
> +	  && table->dirs !=3D NULL)
> +-	subdir_name =3D table->dirs[table->files[file - 1].dir - 1];
> ++	{
> ++	  if (table->use_dir_and_file_0)
> ++	    subdir_name =3D table->dirs[table->files[file].dir];
> ++	  else
> ++	    subdir_name =3D table->dirs[table->files[file].dir - 1];
> ++	}
> +
> +       if (!subdir_name || !IS_ABSOLUTE_PATH (subdir_name))
> +	dir_name =3D table->comp_dir;
> +@@ -1857,10 +1877,12 @@ concat_filename (struct line_info_table *table=
, unsigned int file)
> +
> + /* Check whether [low1, high1) can be combined with [low2, high2),
> +    i.e., they touch or overlap.  */
> +-static bool ranges_overlap (bfd_vma low1,
> +-			    bfd_vma high1,
> +-			    bfd_vma low2,
> +-			    bfd_vma high2)
> ++
> ++static bool
> ++ranges_overlap (bfd_vma low1,
> ++		bfd_vma high1,
> ++		bfd_vma low2,
> ++		bfd_vma high2)
> + {
> +   if (low1 =3D=3D low2 || high1 =3D=3D high2)
> +     return true;
> +@@ -1887,15 +1909,16 @@ static bool ranges_overlap (bfd_vma low1,
> + /* Insert an address range in the trie mapping addresses to compilati=
on units.
> +    Will return the new trie node (usually the same as is being sent i=
n, but
> +    in case of a leaf-to-interior conversion, or expansion of a leaf, =
it may be
> +-   different), or NULL on failure.
> +- */
> +-static struct trie_node *insert_arange_in_trie(bfd *abfd,
> +-					       struct trie_node *trie,
> +-					       bfd_vma trie_pc,
> +-					       unsigned int trie_pc_bits,
> +-					       struct comp_unit *unit,
> +-					       bfd_vma low_pc,
> +-					       bfd_vma high_pc)
> ++   different), or NULL on failure.  */
> ++
> ++static struct trie_node *
> ++insert_arange_in_trie (bfd *abfd,
> ++		       struct trie_node *trie,
> ++		       bfd_vma trie_pc,
> ++		       unsigned int trie_pc_bits,
> ++		       struct comp_unit *unit,
> ++		       bfd_vma low_pc,
> ++		       bfd_vma high_pc)
> + {
> +   bfd_vma clamped_low_pc, clamped_high_pc;
> +   int ch, from_ch, to_ch;
> +@@ -2031,7 +2054,6 @@ static struct trie_node *insert_arange_in_trie(b=
fd *abfd,
> +     return trie;
> + }
> +
> +-
> + static bool
> + arange_add (struct comp_unit *unit, struct arange *first_arange,
> +	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
> +@@ -2412,10 +2434,8 @@ read_formatted_entries (struct comp_unit *unit,=
 bfd_byte **bufp,
> +	    }
> +	}
> +
> +-      /* Skip the first "zero entry", which is the compilation dir/fi=
le.  */
> +-      if (datai !=3D 0)
> +-	if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
> +-	  return false;
> ++      if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
> ++	return false;
> +     }
> +
> +   *bufp =3D buf;
> +@@ -2592,6 +2612,7 @@ decode_line_info (struct comp_unit *unit)
> +       if (!read_formatted_entries (unit, &line_ptr, line_end, table,
> +				   line_info_add_file_name))
> +	goto fail;
> ++      table->use_dir_and_file_0 =3D true;
> +     }
> +   else
> +     {
> +@@ -2614,6 +2635,7 @@ decode_line_info (struct comp_unit *unit)
> +	  if (!line_info_add_file_name (table, cur_file, dir, xtime, size))
> +	    goto fail;
> +	}
> ++      table->use_dir_and_file_0 =3D false;
> +     }
> +
> +   /* Read the statement sequences until there's nothing left.  */
> +@@ -2622,7 +2644,7 @@ decode_line_info (struct comp_unit *unit)
> +       /* State machine registers.  */
> +       bfd_vma address =3D 0;
> +       unsigned char op_index =3D 0;
> +-      char * filename =3D table->num_files ? concat_filename (table, =
1) : NULL;
> ++      char * filename =3D NULL;
> +       unsigned int line =3D 1;
> +       unsigned int column =3D 0;
> +       unsigned int discriminator =3D 0;
> +@@ -2637,6 +2659,14 @@ decode_line_info (struct comp_unit *unit)
> +       bfd_vma low_pc  =3D (bfd_vma) -1;
> +       bfd_vma high_pc =3D 0;
> +
> ++      if (table->num_files)
> ++	{
> ++	  if (table->use_dir_and_file_0)
> ++	    filename =3D concat_filename (table, 0);
> ++	  else
> ++	    filename =3D concat_filename (table, 1);
> ++	}
> ++
> +       /* Decode the table.  */
> +       while (!end_sequence && line_ptr < line_end)
> +	{
> +diff --git a/ld/testsuite/ld-x86-64/pr27587.err b/ld/testsuite/ld-x86-=
64/pr27587.err
> +index fa870790..807750ca 100644
> +--- a/ld/testsuite/ld-x86-64/pr27587.err
> ++++ b/ld/testsuite/ld-x86-64/pr27587.err
> +@@ -1,3 +1,3 @@
> + #...
> +-.*pr27587.i:4: undefined reference to `stack_size'
> ++.*pr27587/<artificial>:4: undefined reference to `stack_size'
> + #...
> diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2260=
8-3.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3=
.patch
> new file mode 100644
> index 0000000000..603824155b
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.pat=
ch
> @@ -0,0 +1,33 @@
> +From 20c75f063a999f9e849a77613a82b15de78ea45f Mon Sep 17 00:00:00 2001
> +From: Nick Clifton<nickc@redhat.com>
> +Date: Fri, 23 Dec 2022 13:02:04 +0000
> +Subject: [PATCH] Fix illegal memory access parsing corrupt DWARF infor=
mation.
> +
> +	PR 29936
> +	* dwarf2.c (concat_filename): Fix check for a directory index off
> +	the end of the directory table.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]
> +CVE: CVE-2023-22608
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +
> +---
> + bfd/ChangeLog | 6 ++++++
> + bfd/dwarf2.c  | 3 ++-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> +index b7839ad6..8b07a24c 100644
> +--- a/bfd/dwarf2.c
> ++++ b/bfd/dwarf2.c
> +@@ -1828,7 +1828,8 @@ concat_filename (struct line_info_table *table, =
unsigned int file)
> +
> +       if (table->files[file].dir
> +	  /* PR 17512: file: 0317e960.  */
> +-	  && table->files[file].dir <=3D table->num_dirs
> ++	  && table->files[file].dir
> ++	  <=3D (table->use_dir_and_file_0 ? table->num_dirs - 1 : table->num=
_dirs)
> +	  /* PR 17512: file: 7f3d2e4b.  */
> +	  && table->dirs !=3D NULL)
> +	{


--=20
# Randy MacLeod
# Wind River Linux

--------------D4gFhPAsvrPjg4WxcQQKdOD7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31S1xoSt028636

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-02-26 04:11, Yash Shinde wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230226091122.4085470-1-yashin=
de145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Yash Shinde <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yas=
h.Shinde@windriver.com&gt;</a>

Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D8af23b30=
edbaedf009bc9b243cd4dfa10ae1ac09">https://sourceware.org/git/?p=3Dbinutil=
s-gdb.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09</a>=
]

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0020-CVE-2023-22608-1.patch      | 502 ++++++++++++++++++
 .../binutils/0020-CVE-2023-22608-2.patch      | 211 ++++++++
 .../binutils/0020-CVE-2023-22608-3.patch      |  33 ++</pre>
    </blockquote>
    <pre class=3D"moz-quote-pre" wrap=3D"">This is a large patch so I too=
k a look at it.


The actual fix is: 0020-CVE-2023-22608-3.patch</pre>
    <p></p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://sourceware.org/=
git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd/dwarf2.c;h=3D88335cb4fb0dd=
dc3b1ca8a1d76c32b88ff85aa89;hp=3Db608afbc0cf260e98e2f87ab6d55c935937b2810=
;hb=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09;hpb=3D8fbad19958c9b9c06a71=
0bf7d6589d52f1ed8a64">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3D=
blobdiff;f=3Dbfd/dwarf2.c;h=3D88335cb4fb0dddc3b1ca8a1d76c32b88ff85aa89;hp=
=3Db608afbc0cf260e98e2f87ab6d55c935937b2810;hb=3D8af23b30edbaedf009bc9b24=
3cd4dfa10ae1ac09;hpb=3D8fbad19958c9b9c06a710bf7d6589d52f1ed8a64</a></p>
    <p>which is just a few lines.<br>
    </p>
    <p>Unfortunately we do need the other two, rather large patches to
      make that apply it seems.</p>
    <p>The patch that adds a trie seems like a feature but the code is
      all (I think) file<br>
      scope local structs with static functions so as far as the ABI
      stability, it seems fine<br>
      to backport. It will change the memory footprint:<br>
      <br>
      commit b43771b045fb5616da3964f2994eefbe8ae70d32<br>
      Author: Steinar H. Gunderson <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:sesse@google.com">&lt;sesse@google.com&gt;</a><br>
      Date:&nbsp;&nbsp; Fri May 20 10:10:34 2022<br>
      <br>
      &nbsp;&nbsp;&nbsp; add a trie to map quickly from address range to =
compilation
      unit<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; When using perf to profile large binaries,
      _bfd_dwarf2_find_nearest_line()<br>
      &nbsp;&nbsp;&nbsp; becomes a hotspot, as perf wants to get line num=
ber
      information<br>
      &nbsp;&nbsp;&nbsp; (for inline-detection purposes) for each and eve=
ry sample. In
      Chromium<br>
      &nbsp;&nbsp;&nbsp; in particular (the content_shell binary), this e=
ntails going
      through<br>
      &nbsp;&nbsp;&nbsp; 475k address ranges, which takes a long time whe=
n done
      repeatedly.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Add a radix-256 trie over the address space to q=
uickly map
      address to<br>
      &nbsp;&nbsp;&nbsp; compilation unit spaces; for content_shell, whic=
h is 1.6 GB
      when some<br>
      &nbsp;&nbsp;&nbsp; (but not full) debug information turned is on, w=
e go from 6 ms
      to<br>
      &nbsp;&nbsp;&nbsp; 0.006 ms (6 =C2=B5s) for each lookup from addres=
s to compilation
      unit, a 1000x<br>
      &nbsp;&nbsp;&nbsp; speedup.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; There is a modest RAM increase of 180 MB in this=
 binary (the
      existing<br>
      &nbsp;&nbsp;&nbsp; linked list over ranges uses about 10 MB, and th=
e entire perf
      job uses<br>
      &nbsp;&nbsp;&nbsp; between 2=E2=80=933 GB for a medium-size profile=
); for smaller
      binaries with few<br>
      &nbsp;&nbsp;&nbsp; ranges, there should be hardly any extra RAM usa=
ge at all.<br>
      <br>
      ../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230226091122.4085470-1-yashin=
de145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
 4 files changed, 749 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023=
-22608-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023=
-22608-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023=
-22608-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
index 0a4a0d7bc1..30a34d7ba4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -43,5 +43,8 @@ SRC_URI =3D &quot;\
      <a class=3D"moz-txt-link-freetext" href=3D"file://0018-CVE-2022-381=
28-2.patch">file://0018-CVE-2022-38128-2.patch</a> \
      <a class=3D"moz-txt-link-freetext" href=3D"file://0018-CVE-2022-381=
28-3.patch">file://0018-CVE-2022-38128-3.patch</a> \
      <a class=3D"moz-txt-link-freetext" href=3D"file://0019-CVE-2022-428=
5.patch">file://0019-CVE-2022-4285.patch</a> \
+     <a class=3D"moz-txt-link-freetext" href=3D"file://0020-CVE-2023-226=
08-1.patch">file://0020-CVE-2023-22608-1.patch</a> \
+     <a class=3D"moz-txt-link-freetext" href=3D"file://0020-CVE-2023-226=
08-2.patch">file://0020-CVE-2023-22608-2.patch</a> \
+     <a class=3D"moz-txt-link-freetext" href=3D"file://0020-CVE-2023-226=
08-3.patch">file://0020-CVE-2023-22608-3.patch</a> \
 &quot;
 S  =3D &quot;${WORKDIR}/git&quot;
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-=
1.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.p=
atch
new file mode 100644
index 0000000000..dd3d533d0d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch
@@ -0,0 +1,502 @@
+From a79c274dad99863f58b9ed627b38908daadb6d7e Mon Sep 17 00:00:00 2001
+From: &quot;Steinar H. Gunderson&quot; <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:sesse@google.com">&lt;sesse@google.com&gt;</a>
+Date: Fri, 20 May 2022 16:10:34 +0200
+Subject: [PATCH] add a trie to map quickly from address range to compila=
tion
+ unit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When using perf to profile large binaries, _bfd_dwarf2_find_nearest_line=
()
+becomes a hotspot, as perf wants to get line number information
+(for inline-detection purposes) for each and every sample. In Chromium
+in particular (the content_shell binary), this entails going through
+475k address ranges, which takes a long time when done repeatedly.
+
+Add a radix-256 trie over the address space to quickly map address to
+compilation unit spaces; for content_shell, which is 1.6 GB when some
+(but not full) debug information turned is on, we go from 6 ms to
+0.006 ms (6 =C2=B5s) for each lookup from address to compilation unit, a=
 1000x
+speedup.
+
+There is a modest RAM increase of 180 MB in this binary (the existing
+linked list over ranges uses about 10 MB, and the entire perf job uses
+between 2-3 GB for a medium-size profile); for smaller binaries with few
+ranges, there should be hardly any extra RAM usage at all.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3Db43771b=
045fb5616da3964f2994eefbe8ae70d32">https://sourceware.org/git/?p=3Dbinuti=
ls-gdb.git;a=3Dcommitdiff;h=3Db43771b045fb5616da3964f2994eefbe8ae70d32</a=
>]
+
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+
+---
+ bfd/dwarf2.c | 326 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 312 insertions(+), 14 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index fdf071c3..0ae50a37 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -82,6 +82,77 @@ struct adjusted_section
+   bfd_vma adj_vma;
+ };
+
++/* A trie to map quickly from address range to compilation unit.
++
++   This is a fairly standard radix-256 trie, used to quickly locate whi=
ch
++   compilation unit any given address belongs to.  Given that each comp=
ilation
++   unit may register hundreds of very small and unaligned ranges (which=
 may
++   potentially overlap, due to inlining and other concerns), and a larg=
e
++   program may end up containing hundreds of thousands of such ranges, =
we cannot
++   scan through them linearly without undue slowdown.
++
++   We use a hybrid trie to avoid memory explosion: There are two types =
of trie
++   nodes, leaves and interior nodes.  (Almost all nodes are leaves, so =
they
++   take up the bulk of the memory usage.) Leaves contain a simple array=
 of
++   ranges (high/low address) and which compilation unit contains those =
ranges,
++   and when we get to a leaf, we scan through it linearly.  Interior no=
des
++   contain pointers to 256 other nodes, keyed by the next byte of the a=
ddress.
++   So for a 64-bit address like 0x1234567abcd, we would start at the ro=
ot and go
++   down child[0x00]-&gt;child[0x00]-&gt;child[0x01]-&gt;child[0x23]-&gt=
;child[0x45] etc.,
++   until we hit a leaf.  (Nodes are, in general, leaves until they exce=
ed the
++   default allocation of 16 elements, at which point they are converted=
 to
++   interior node if possible.) This gives us near-constant lookup times=
;
++   the only thing that can be costly is if there are lots of overlappin=
g ranges
++   within a single 256-byte segment of the binary, in which case we hav=
e to
++   scan through them all to find the best match.
++
++   For a binary with few ranges, we will in practice only have a single=
 leaf
++   node at the root, containing a simple array.  Thus, the scheme is ef=
ficient
++   for both small and large binaries.
++ */
++
++/* Experiments have shown 16 to be a memory-efficient default leaf size.
++   The only case where a leaf will hold more memory than this, is at th=
e
++   bottomost level (covering 256 bytes in the binary), where we'll expa=
nd
++   the leaf to be able to hold more ranges if needed.
++ */
++#define TRIE_LEAF_SIZE 16
++
++/* All trie_node pointers will really be trie_leaf or trie_interior,
++   but they have this common head.  */
++struct trie_node
++{
++  /* If zero, we are an interior node.
++     Otherwise, how many ranges we have room for in this leaf.  */
++  unsigned int num_room_in_leaf;
++};
++
++struct trie_leaf
++{
++  struct trie_node head;
++  unsigned int num_stored_in_leaf;
++  struct {
++    struct comp_unit *unit;
++    bfd_vma low_pc, high_pc;
++  } ranges[TRIE_LEAF_SIZE];
++};
++
++struct trie_interior
++{
++  struct trie_node head;
++  struct trie_node *children[256];
++};
++
++static struct trie_node *alloc_trie_leaf (bfd *abfd)
++{
++  struct trie_leaf *leaf =3D
++    bfd_zalloc (abfd, sizeof (struct trie_leaf));
++  if (leaf =3D=3D NULL)
++    return NULL;
++  leaf-&gt;head.num_room_in_leaf =3D TRIE_LEAF_SIZE;
++  return &amp;leaf-&gt;head;
++}
++
+ struct dwarf2_debug_file
+ {
+   /* The actual bfd from which debug info was loaded.  Might be
+@@ -139,6 +210,9 @@ struct dwarf2_debug_file
+   /* A list of all previously read comp_units.  */
+   struct comp_unit *all_comp_units;
+
++  /* A list of all previously read comp_units with no ranges (yet).  */
++  struct comp_unit *all_comp_units_without_ranges;
++
+   /* Last comp unit in list above.  */
+   struct comp_unit *last_comp_unit;
+
+@@ -147,6 +221,9 @@ struct dwarf2_debug_file
+
+   /* Hash table to map offsets to decoded abbrevs.  */
+   htab_t abbrev_offsets;
++
++  /* Root of a trie to map addresses to compilation units.  */
++  struct trie_node *trie_root;
+ };
+
+ struct dwarf2_debug
+@@ -220,6 +297,11 @@ struct comp_unit
+   /* Chain the previously read compilation units.  */
+   struct comp_unit *next_unit;
+
++  /* Chain the previously read compilation units that have no ranges ye=
t.
++     We scan these separately when we have a trie over the ranges.
++     Unused if arange.high !=3D 0. */
++  struct comp_unit *next_unit_without_ranges;
++
+   /* Likewise, chain the compilation unit read after this one.
+      The comp units are stored in reversed reading order.  */
+   struct comp_unit *prev_unit;
+@@ -296,6 +378,10 @@ struct comp_unit
+
+   /* TRUE if symbols are cached in hash table for faster lookup by name=
.  */
+   bool cached;
++
++  /* Used when iterating over trie leaves to know which units we have
++     already seen in this iteration.  */
++  bool mark;
+ };
+
+ /* This data structure holds the information of an abbrev.  */
+@@ -1766,9 +1852,189 @@ concat_filename (struct line_info_table *table, =
unsigned int file)
+   return strdup (filename);
+ }
+
++/* Number of bits in a bfd_vma.  */
++#define VMA_BITS (8 * sizeof (bfd_vma))
++
++/* Check whether [low1, high1) can be combined with [low2, high2),
++   i.e., they touch or overlap.  */
++static bool ranges_overlap (bfd_vma low1,
++			    bfd_vma high1,
++			    bfd_vma low2,
++			    bfd_vma high2)
++{
++  if (low1 =3D=3D low2 || high1 =3D=3D high2)
++    return true;
++
++  /* Sort so that low1 is below low2. */
++  if (low1 &gt; low2)
++    {
++      bfd_vma tmp;
++
++      tmp =3D low1;
++      low1 =3D low2;
++      low2 =3D tmp;
++
++      tmp =3D high1;
++      high1 =3D high2;
++      high2 =3D tmp;
++    }
++
++  /* We touch iff low2 =3D=3D high1.
++     We overlap iff low2 is within [low1, high1). */
++  return (low2 &lt;=3D high1);
++}
++
++/* Insert an address range in the trie mapping addresses to compilation=
 units.
++   Will return the new trie node (usually the same as is being sent in,=
 but
++   in case of a leaf-to-interior conversion, or expansion of a leaf, it=
 may be
++   different), or NULL on failure.
++ */
++static struct trie_node *insert_arange_in_trie(bfd *abfd,
++					       struct trie_node *trie,
++					       bfd_vma trie_pc,
++					       unsigned int trie_pc_bits,
++					       struct comp_unit *unit,
++					       bfd_vma low_pc,
++					       bfd_vma high_pc)
++{
++  bfd_vma clamped_low_pc, clamped_high_pc;
++  int ch, from_ch, to_ch;
++  bool is_full_leaf =3D false;
++
++  /* See if we can extend any of the existing ranges.  This merging
++     isn't perfect (if merging opens up the possibility of merging two =
existing
++     ranges, we won't find them), but it takes the majority of the case=
s.  */
++  if (trie-&gt;num_room_in_leaf &gt; 0)
++    {
++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
++      unsigned int i;
++
++      for (i =3D 0; i &lt; leaf-&gt;num_stored_in_leaf; ++i)
++	{
++	  if (leaf-&gt;ranges[i].unit =3D=3D unit &amp;&amp;
++	      ranges_overlap(low_pc, high_pc,
++			     leaf-&gt;ranges[i].low_pc, leaf-&gt;ranges[i].high_pc))
++	    {
++	      if (low_pc &lt; leaf-&gt;ranges[i].low_pc)
++		leaf-&gt;ranges[i].low_pc =3D low_pc;
++	      if (high_pc &gt; leaf-&gt;ranges[i].high_pc)
++		leaf-&gt;ranges[i].high_pc =3D high_pc;
++	      return trie;
++	    }
++	}
++
++      is_full_leaf =3D leaf-&gt;num_stored_in_leaf =3D=3D trie-&gt;num_=
room_in_leaf;
++    }
++
++  /* If we're a leaf with no more room and we're _not_ at the bottom,
++     convert to an interior node.  */
++  if (is_full_leaf &amp;&amp; trie_pc_bits &lt; VMA_BITS)
++    {
++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
++      unsigned int i;
++
++      trie =3D bfd_zalloc (abfd, sizeof (struct trie_interior));
++      if (!trie)
++	return NULL;
++      is_full_leaf =3D false;
++
++      /* TODO: If we wanted to save a little more memory at the cost of
++	 complexity, we could have reused the old leaf node as one of the
++	 children of the new interior node, instead of throwing it away.  */
++      for (i =3D 0; i &lt; leaf-&gt;num_stored_in_leaf; ++i)
++        {
++	  if (!insert_arange_in_trie (abfd, trie, trie_pc, trie_pc_bits,
++				      leaf-&gt;ranges[i].unit, leaf-&gt;ranges[i].low_pc,
++				      leaf-&gt;ranges[i].high_pc))
++	    return NULL;
++	}
++    }
++
++  /* If we're a leaf with no more room and we _are_ at the bottom,
++     we have no choice but to just make it larger. */
++  if (is_full_leaf)
++    {
++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
++      unsigned int new_room_in_leaf =3D trie-&gt;num_room_in_leaf * 2;
++      struct trie_leaf *new_leaf;
++
++      new_leaf =3D bfd_zalloc (abfd,
++	sizeof (struct trie_leaf) +
++	  (new_room_in_leaf - TRIE_LEAF_SIZE) * sizeof (leaf-&gt;ranges[0]));
++      new_leaf-&gt;head.num_room_in_leaf =3D new_room_in_leaf;
++      new_leaf-&gt;num_stored_in_leaf =3D leaf-&gt;num_stored_in_leaf;
++
++      memcpy (new_leaf-&gt;ranges,
++	      leaf-&gt;ranges,
++	      leaf-&gt;num_stored_in_leaf * sizeof (leaf-&gt;ranges[0]));
++      trie =3D &amp;new_leaf-&gt;head;
++      is_full_leaf =3D false;
++
++      /* Now the insert below will go through.  */
++    }
++
++  /* If we're a leaf (now with room), we can just insert at the end.  *=
/
++  if (trie-&gt;num_room_in_leaf &gt; 0)
++    {
++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;
++
++      unsigned int i =3D leaf-&gt;num_stored_in_leaf++;
++      leaf-&gt;ranges[i].unit =3D unit;
++      leaf-&gt;ranges[i].low_pc =3D low_pc;
++      leaf-&gt;ranges[i].high_pc =3D high_pc;
++      return trie;
++    }
++
++  /* Now we are definitely an interior node, so recurse into all
++     the relevant buckets.  */
++
++  /* Clamp the range to the current trie bucket.  */
++  clamped_low_pc =3D low_pc;
++  clamped_high_pc =3D high_pc;
++  if (trie_pc_bits &gt; 0)
++    {
++      bfd_vma bucket_high_pc =3D
++	trie_pc + ((bfd_vma)-1 &gt;&gt; trie_pc_bits);  /* Inclusive.  */
++      if (clamped_low_pc &lt; trie_pc)
++	clamped_low_pc =3D trie_pc;
++      if (clamped_high_pc &gt; bucket_high_pc)
++	clamped_high_pc =3D bucket_high_pc;
++    }
++
++  /* Insert the ranges in all buckets that it spans.  */
++  from_ch =3D (clamped_low_pc &gt;&gt; (VMA_BITS - trie_pc_bits - 8)) &=
amp; 0xff;
++  to_ch =3D ((clamped_high_pc - 1) &gt;&gt; (VMA_BITS - trie_pc_bits - =
8)) &amp; 0xff;
++  for (ch =3D from_ch; ch &lt;=3D to_ch; ++ch)
++    {
++      struct trie_interior *interior =3D (struct trie_interior *) trie;
++      struct trie_node *child =3D interior-&gt;children[ch];
++
++      if (child =3D=3D NULL)
++        {
++	  child =3D alloc_trie_leaf (abfd);
++	  if (!child)
++	    return NULL;
++	}
++      child =3D insert_arange_in_trie (abfd,
++				     child,
++				     trie_pc + ((bfd_vma)ch &lt;&lt; (VMA_BITS - trie_pc_bits - 8))=
,
++				     trie_pc_bits + 8,
++				     unit,
++				     low_pc,
++				     high_pc);
++      if (!child)
++	return NULL;
++
++      interior-&gt;children[ch] =3D child;
++    }
++
++    return trie;
++}
++
++
+ static bool
+-arange_add (const struct comp_unit *unit, struct arange *first_arange,
+-	    bfd_vma low_pc, bfd_vma high_pc)
++arange_add (struct comp_unit *unit, struct arange *first_arange,
++	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
+ {
+   struct arange *arange;
+
+@@ -1776,6 +2042,19 @@ arange_add (const struct comp_unit *unit, struct =
arange *first_arange,
+   if (low_pc =3D=3D high_pc)
+     return true;
+
++  if (trie_root !=3D NULL)
++    {
++      *trie_root =3D insert_arange_in_trie (unit-&gt;file-&gt;bfd_ptr,
++					  *trie_root,
++					  0,
++					  0,
++					  unit,
++					  low_pc,
++					  high_pc);
++      if (*trie_root =3D=3D NULL)
++	return false;
++    }
++
+   /* If the first arange is empty, use it.  */
+   if (first_arange-&gt;high =3D=3D 0)
+     {
+@@ -2410,7 +2689,8 @@ decode_line_info (struct comp_unit *unit)
+		    low_pc =3D address;
+		  if (address &gt; high_pc)
+		    high_pc =3D address;
+-		  if (!arange_add (unit, &amp;unit-&gt;arange, low_pc, high_pc))
++		  if (!arange_add (unit, &amp;unit-&gt;arange, &amp;unit-&gt;file-&gt=
;trie_root,
++				   low_pc, high_pc))
+		    goto line_fail;
+		  break;
+		case DW_LNE_set_address:
+@@ -3134,7 +3414,7 @@ find_abstract_instance (struct comp_unit *unit,
+
+ static bool
+ read_ranges (struct comp_unit *unit, struct arange *arange,
+-	     bfd_uint64_t offset)
++	     struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   bfd_byte *ranges_ptr;
+   bfd_byte *ranges_end;
+@@ -3169,7 +3449,7 @@ read_ranges (struct comp_unit *unit, struct arange=
 *arange,
+	base_address =3D high_pc;
+        else
+	{
+-	  if (!arange_add (unit, arange,
++	  if (!arange_add (unit, arange, trie_root,
+			   base_address + low_pc, base_address + high_pc))
+	    return false;
+	}
+@@ -3179,7 +3459,7 @@ read_ranges (struct comp_unit *unit, struct arange=
 *arange,
+
+ static bool
+ read_rnglists (struct comp_unit *unit, struct arange *arange,
+-	       bfd_uint64_t offset)
++	       struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   bfd_byte *rngs_ptr;
+   bfd_byte *rngs_end;
+@@ -3253,19 +3533,19 @@ read_rnglists (struct comp_unit *unit, struct ar=
ange *arange,
+	  return false;
+	}
+
+-      if (!arange_add (unit, arange, low_pc, high_pc))
++      if (!arange_add (unit, arange, trie_root, low_pc, high_pc))
+	return false;
+     }
+ }
+
+ static bool
+ read_rangelist (struct comp_unit *unit, struct arange *arange,
+-		bfd_uint64_t offset)
++		struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   if (unit-&gt;version &lt;=3D 4)
+-    return read_ranges (unit, arange, offset);
++    return read_ranges (unit, arange, trie_root, offset);
+   else
+-    return read_rnglists (unit, arange, offset);
++    return read_rnglists (unit, arange, trie_root, offset);
+ }
+
+ static struct funcinfo *
+@@ -3563,7 +3843,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+
+		case DW_AT_ranges:
+		  if (is_int_form (&amp;attr)
+-		      &amp;&amp; !read_rangelist (unit, &amp;func-&gt;arange, attr.u.=
val))
++		      &amp;&amp; !read_rangelist (unit, &amp;func-&gt;arange,
++					  &amp;unit-&gt;file-&gt;trie_root, attr.u.val))
+		    goto fail;
+		  break;
+
+@@ -3679,7 +3960,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+
+       if (func &amp;&amp; high_pc !=3D 0)
+	{
+-	  if (!arange_add (unit, &amp;func-&gt;arange, low_pc, high_pc))
++	  if (!arange_add (unit, &amp;func-&gt;arange, &amp;unit-&gt;file-&gt;=
trie_root,
++			   low_pc, high_pc))
+	    goto fail;
+	}
+     }
+@@ -3874,7 +4156,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
+
+	case DW_AT_ranges:
+	  if (is_int_form (&amp;attr)
+-	      &amp;&amp; !read_rangelist (unit, &amp;unit-&gt;arange, attr.u.v=
al))
++	      &amp;&amp; !read_rangelist (unit, &amp;unit-&gt;arange,
++				  &amp;unit-&gt;file-&gt;trie_root, attr.u.val))
+	    return NULL;
+	  break;
+
+@@ -3916,7 +4199,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
+     high_pc +=3D low_pc;
+   if (high_pc !=3D 0)
+     {
+-      if (!arange_add (unit, &amp;unit-&gt;arange, low_pc, high_pc))
++      if (!arange_add (unit, &amp;unit-&gt;arange, &amp;unit-&gt;file-&=
gt;trie_root,
++		       low_pc, high_pc))
+	return NULL;
+     }
+
+@@ -4747,6 +5031,14 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *deb=
ug_bfd,
+   if (!stash-&gt;alt.abbrev_offsets)
+     return false;
+
++  stash-&gt;f.trie_root =3D alloc_trie_leaf (abfd);
++  if (!stash-&gt;f.trie_root)
++    return false;
++
++  stash-&gt;alt.trie_root =3D alloc_trie_leaf (abfd);
++  if (!stash-&gt;alt.trie_root)
++    return false;
++
+   *pinfo =3D stash;
+
+   if (debug_bfd =3D=3D NULL)
+@@ -4918,6 +5210,12 @@ stash_comp_unit (struct dwarf2_debug *stash, stru=
ct dwarf2_debug_file *file)
+	  each-&gt;next_unit =3D file-&gt;all_comp_units;
+	  file-&gt;all_comp_units =3D each;
+
++	  if (each-&gt;arange.high =3D=3D 0)
++	    {
++	      each-&gt;next_unit_without_ranges =3D file-&gt;all_comp_units_wi=
thout_ranges;
++	      file-&gt;all_comp_units_without_ranges =3D each-&gt;next_unit_wi=
thout_ranges;
++	    }
++
+	  file-&gt;info_ptr +=3D length;
+	  return each;
+	}
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-=
2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.p=
atch
new file mode 100644
index 0000000000..8ffb500c1d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch
@@ -0,0 +1,211 @@
+From 73e97e32e1428d63d81d971176772ae69397a1a0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nic=
kc@redhat.com">&lt;nickc@redhat.com&gt;</a>
+Date: Tue, 30 Aug 2022 16:01:20 +0100
+Subject: [PATCH] BFD library: Use entry 0 in directory and filename tabl=
es of
+ DWARF-5 debug info.
+
+	PR 29529
+	* dwarf2.c (struct line_info_table): Add new field:
+	use_dir_and_file_0.
+	(concat_filename): Use new field to help select the correct table
+	slot.
+	(read_formatted_entries): Do not skip entry 0.
+	(decode_line_info): Set new field depending upon the version of
+	DWARF being parsed.  Initialise filename based upon the setting of
+	the new field.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D37833b9=
66576c5d25e797ea3b6c33d0459a71892">https://sourceware.org/git/?p=3Dbinuti=
ls-gdb.git;a=3Dcommitdiff;h=3D37833b966576c5d25e797ea3b6c33d0459a71892</a=
>]
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+
+---
+ bfd/ChangeLog                      | 12 +++++
+ bfd/dwarf2.c                       | 86 ++++++++++++++++++++----------
+ ld/ChangeLog                       |  5 ++
+ ld/testsuite/ld-x86-64/pr27587.err |  2 +-
+ 4 files changed, 76 insertions(+), 29 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0ae50a37..b7839ad6 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1571,6 +1571,7 @@ struct line_info_table
+   unsigned int		num_files;
+   unsigned int		num_dirs;
+   unsigned int		num_sequences;
++  bool                  use_dir_and_file_0;
+   char *		comp_dir;
+   char **		dirs;
+   struct fileinfo*	files;
+@@ -1791,16 +1792,30 @@ concat_filename (struct line_info_table *table, =
unsigned int file)
+ {
+   char *filename;
+
+-  if (table =3D=3D NULL || file - 1 &gt;=3D table-&gt;num_files)
++  /* Pre DWARF-5 entry 0 in the directory and filename tables was not u=
sed.
++     So in order to save space in the tables used here the info for, eg
++     directory 1 is stored in slot 0 of the directory table, directory =
2
++     in slot 1 and so on.
++
++     Starting with DWARF-5 the 0'th entry is used so there is a one to =
one
++     mapping between DWARF slots and internal table entries.  */
++  if (! table-&gt;use_dir_and_file_0)
+     {
+-      /* FILE =3D=3D 0 means unknown.  */
+-      if (file)
+-	_bfd_error_handler
+-	  (_(&quot;DWARF error: mangled line number section (bad file number)&=
quot;));
++      /* Pre DWARF-5, FILE =3D=3D 0 means unknown.  */
++      if (file =3D=3D 0)
++	return strdup (&quot;&lt;unknown&gt;&quot;);
++      -- file;
++    }
++
++  if (table =3D=3D NULL || file &gt;=3D table-&gt;num_files)
++    {
++      _bfd_error_handler
++	(_(&quot;DWARF error: mangled line number section (bad file number)&qu=
ot;));
+       return strdup (&quot;&lt;unknown&gt;&quot;);
+     }
+
+-  filename =3D table-&gt;files[file - 1].name;
++  filename =3D table-&gt;files[file].name;
++
+   if (filename =3D=3D NULL)
+     return strdup (&quot;&lt;unknown&gt;&quot;);
+
+@@ -1811,12 +1826,17 @@ concat_filename (struct line_info_table *table, =
unsigned int file)
+       char *name;
+       size_t len;
+
+-      if (table-&gt;files[file - 1].dir
++      if (table-&gt;files[file].dir
+	  /* PR 17512: file: 0317e960.  */
+-	  &amp;&amp; table-&gt;files[file - 1].dir &lt;=3D table-&gt;num_dirs
++	  &amp;&amp; table-&gt;files[file].dir &lt;=3D table-&gt;num_dirs
+	  /* PR 17512: file: 7f3d2e4b.  */
+	  &amp;&amp; table-&gt;dirs !=3D NULL)
+-	subdir_name =3D table-&gt;dirs[table-&gt;files[file - 1].dir - 1];
++	{
++	  if (table-&gt;use_dir_and_file_0)
++	    subdir_name =3D table-&gt;dirs[table-&gt;files[file].dir];
++	  else
++	    subdir_name =3D table-&gt;dirs[table-&gt;files[file].dir - 1];
++	}
+
+       if (!subdir_name || !IS_ABSOLUTE_PATH (subdir_name))
+	dir_name =3D table-&gt;comp_dir;
+@@ -1857,10 +1877,12 @@ concat_filename (struct line_info_table *table, =
unsigned int file)
+
+ /* Check whether [low1, high1) can be combined with [low2, high2),
+    i.e., they touch or overlap.  */
+-static bool ranges_overlap (bfd_vma low1,
+-			    bfd_vma high1,
+-			    bfd_vma low2,
+-			    bfd_vma high2)
++
++static bool
++ranges_overlap (bfd_vma low1,
++		bfd_vma high1,
++		bfd_vma low2,
++		bfd_vma high2)
+ {
+   if (low1 =3D=3D low2 || high1 =3D=3D high2)
+     return true;
+@@ -1887,15 +1909,16 @@ static bool ranges_overlap (bfd_vma low1,
+ /* Insert an address range in the trie mapping addresses to compilation=
 units.
+    Will return the new trie node (usually the same as is being sent in,=
 but
+    in case of a leaf-to-interior conversion, or expansion of a leaf, it=
 may be
+-   different), or NULL on failure.
+- */
+-static struct trie_node *insert_arange_in_trie(bfd *abfd,
+-					       struct trie_node *trie,
+-					       bfd_vma trie_pc,
+-					       unsigned int trie_pc_bits,
+-					       struct comp_unit *unit,
+-					       bfd_vma low_pc,
+-					       bfd_vma high_pc)
++   different), or NULL on failure.  */
++
++static struct trie_node *
++insert_arange_in_trie (bfd *abfd,
++		       struct trie_node *trie,
++		       bfd_vma trie_pc,
++		       unsigned int trie_pc_bits,
++		       struct comp_unit *unit,
++		       bfd_vma low_pc,
++		       bfd_vma high_pc)
+ {
+   bfd_vma clamped_low_pc, clamped_high_pc;
+   int ch, from_ch, to_ch;
+@@ -2031,7 +2054,6 @@ static struct trie_node *insert_arange_in_trie(bfd=
 *abfd,
+     return trie;
+ }
+
+-
+ static bool
+ arange_add (struct comp_unit *unit, struct arange *first_arange,
+	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
+@@ -2412,10 +2434,8 @@ read_formatted_entries (struct comp_unit *unit, b=
fd_byte **bufp,
+	    }
+	}
+
+-      /* Skip the first &quot;zero entry&quot;, which is the compilatio=
n dir/file.  */
+-      if (datai !=3D 0)
+-	if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
+-	  return false;
++      if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
++	return false;
+     }
+
+   *bufp =3D buf;
+@@ -2592,6 +2612,7 @@ decode_line_info (struct comp_unit *unit)
+       if (!read_formatted_entries (unit, &amp;line_ptr, line_end, table=
,
+				   line_info_add_file_name))
+	goto fail;
++      table-&gt;use_dir_and_file_0 =3D true;
+     }
+   else
+     {
+@@ -2614,6 +2635,7 @@ decode_line_info (struct comp_unit *unit)
+	  if (!line_info_add_file_name (table, cur_file, dir, xtime, size))
+	    goto fail;
+	}
++      table-&gt;use_dir_and_file_0 =3D false;
+     }
+
+   /* Read the statement sequences until there's nothing left.  */
+@@ -2622,7 +2644,7 @@ decode_line_info (struct comp_unit *unit)
+       /* State machine registers.  */
+       bfd_vma address =3D 0;
+       unsigned char op_index =3D 0;
+-      char * filename =3D table-&gt;num_files ? concat_filename (table,=
 1) : NULL;
++      char * filename =3D NULL;
+       unsigned int line =3D 1;
+       unsigned int column =3D 0;
+       unsigned int discriminator =3D 0;
+@@ -2637,6 +2659,14 @@ decode_line_info (struct comp_unit *unit)
+       bfd_vma low_pc  =3D (bfd_vma) -1;
+       bfd_vma high_pc =3D 0;
+
++      if (table-&gt;num_files)
++	{
++	  if (table-&gt;use_dir_and_file_0)
++	    filename =3D concat_filename (table, 0);
++	  else
++	    filename =3D concat_filename (table, 1);
++	}
++
+       /* Decode the table.  */
+       while (!end_sequence &amp;&amp; line_ptr &lt; line_end)
+	{
+diff --git a/ld/testsuite/ld-x86-64/pr27587.err b/ld/testsuite/ld-x86-64=
/pr27587.err
+index fa870790..807750ca 100644
+--- a/ld/testsuite/ld-x86-64/pr27587.err
++++ b/ld/testsuite/ld-x86-64/pr27587.err
+@@ -1,3 +1,3 @@
+ #...
+-.*pr27587.i:4: undefined reference to `stack_size'
++.*pr27587/&lt;artificial&gt;:4: undefined reference to `stack_size'
+ #...
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-=
3.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.p=
atch
new file mode 100644
index 0000000000..603824155b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch
@@ -0,0 +1,33 @@
+From 20c75f063a999f9e849a77613a82b15de78ea45f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nic=
kc@redhat.com">&lt;nickc@redhat.com&gt;</a>
+Date: Fri, 23 Dec 2022 13:02:04 +0000
+Subject: [PATCH] Fix illegal memory access parsing corrupt DWARF informa=
tion.
+
+	PR 29936
+	* dwarf2.c (concat_filename): Fix check for a directory index off
+	the end of the directory table.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D8af23b3=
0edbaedf009bc9b243cd4dfa10ae1ac09">https://sourceware.org/git/?p=3Dbinuti=
ls-gdb.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09</a=
>]
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/dwarf2.c  | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index b7839ad6..8b07a24c 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1828,7 +1828,8 @@ concat_filename (struct line_info_table *table, un=
signed int file)
+
+       if (table-&gt;files[file].dir
+	  /* PR 17512: file: 0317e960.  */
+-	  &amp;&amp; table-&gt;files[file].dir &lt;=3D table-&gt;num_dirs
++	  &amp;&amp; table-&gt;files[file].dir
++	  &lt;=3D (table-&gt;use_dir_and_file_0 ? table-&gt;num_dirs - 1 : tab=
le-&gt;num_dirs)
+	  /* PR 17512: file: 7f3d2e4b.  */
+	  &amp;&amp; table-&gt;dirs !=3D NULL)
+	{
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------D4gFhPAsvrPjg4WxcQQKdOD7--

