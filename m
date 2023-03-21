Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C2AC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 18:02:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20979.1679421727645141456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 11:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=lmAJWtol;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444ea386f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L9vRh1031106
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 11:02:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zf5zHC4vArvrBT9iGQUYoole/zFUTXrElf4WufAB85s=;
 b=lmAJWtolCZCSB9n/t5qLeGp4WC5Nyl1LS1oLALB5G/HNn4LQtmhCUQWbFF4CmkKT27p/
 nVHnBrAdYyNQzwdDWmSsC3PyQ6NT5DnbmjFEPXNblvu2Gt3tgEyAxPZjnp9eH8/NlfnU
 KYf01yLjzaL/NVuo7P5MZYPKdsEm+ER2/XHSaFLwgOIADktw7vMBXKT3ZqNFFcHhq+cx
 GQO4JqeBkYtBE0+pg8cO5uvXIdPAuaNzN4RAPTtEPQWsI0HMewxxwv+P/YGkdW7TVSxs
 SftTOJVsvmL1s1JJKvDlFWXqvKJo+hx/MNfAIV7ulyPFc0d2JFx53C9LPd2a7FZ7AOcO 8w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4u74g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 11:02:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlpXzxVjjAd7LB3c2l++8zf3ASsJSO/2RKEyZg81kB0kTwI7e60trR8HVu+BvibVzMlzp+JHsnXDdJ9R7vwlbdx/2lpsVQWFWa27sxlfG6KSHurHP6mvrtxXv1lB5eYn+Xxz6jaH6usuy0EEt7+LZncoB7jaRPMWZzpUo6cSdU8jL9QO7ear7UhujnAukS/ndw/WV8TUFi29jpTwLzUTF/OP5aadDQz79x0T+oqq7Ip8xuuyCvHNtN0dWvdk8XN65U855BDf01AvLBQR658x9Vqn9lfwXRIbyI9gg9MZf+NEVXDJy72kYyuGV5T3KbTEhEf9oHa/IlfsqNRtaoCX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf5zHC4vArvrBT9iGQUYoole/zFUTXrElf4WufAB85s=;
 b=AnGhuX9hXJ22az7HBagZ8E+qkBPa5Awxpi+UnJtbJN3RLuIgkoc/6Z978ghMrDAuqeLyOm8DPj1NCvQUMF5z6JEqX0u866bhpXq1xj74xQEcJ5QXsq7TbmFr8zZRKv2r9yKdPOUCBhN27N3oZxp9RthUnleqvwqw+9MaFh6f2FvGg85LAH9kG6/d15WBm5PXlvcWQXD3sQNzSuoFIOucYfj+E5xR7fNv8cdh9r4/7PlKg1SinaTQTKVqRVNN4K4SpR7QaHSQ5yVpEbEmAfbSEFHmWSIxDII9OMrrkdkhNMYQGD+kewE5j3iFTb7IDxlAOUIu35r4SMXIw6J5IKr3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 18:02:02 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 18:02:02 +0000
Message-ID: <14eaf6f4-85bb-8e0a-28bb-e4a5f2cadf15@windriver.com>
Date: Tue, 21 Mar 2023 14:02:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [kirkstone][PATCH] go: fix CVE-2022-2879 and
 CVE-2022-41720
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230320200908.1233173-1-sakib.sajal@windriver.com>
 <45c4b6fc-6728-c4f2-78c3-0f42db9d4548@windriver.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <45c4b6fc-6728-c4f2-78c3-0f42db9d4548@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MN2PR12CA0031.namprd12.prod.outlook.com
 (2603:10b6:208:a8::44) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dea5fc-1cd5-4748-ae59-08db2a365f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FSCRbsJRke689S5R3GNuk1MrbqLnD/9HNb9HgkDr+xfBtjaDfd5R/IH3QhmDvNe33RqNDEBh0v1ABotNcEtDwamAqVJ2R+6ZtZIw1IBqMUYsiL05BvPq5CB8kTvwh+GR2h5qcWmiKx3NK2n+ut7AtLhcH//RR+NhJXJWQ8khTAn1K8JaEj/FwL0SWhMr8PmaVmi7bX0+6xR3W4O1TD7K27h3JwiCn+SQqilxqaBKyD6+r0BRN0rykaWN/jC//Y7wodzQTHJ/+CfaHlCfNV5gteUiM//jM/EfeZSfPWhR+JCIXU1l4wEKVUjO8YtHyTNU5uh2vmKVANOytplIaxn3nlUexa/maihBY2JU9W7DgbjBuV6PUQqP4n3WaMy2OWW/DN3tpIaofpuikgB7PDqStHi6AylSdAnLjD1LYHlED/DP2oZcN8VQWiCDi7t0VkEYL2st9IHUwREUfZCvS7DvFtPVNAkm8jkSZtfZdaUi61nLPEcrsNT9gXt/EbIdaPzCgSYe3iXVV9dXIIlKTmUKF7a6/lFC0H0021nRO5mxj192oJG/IAO6LbKRFYirYRspYDwUvuqb0ffI6HVQxnCg1Ul/6Va+SBeA+WlEAnyUl7TAbpjy1VYgQysdkLuiVNQLpmCJcqr53H6ap2/BOCm9Je2aTODAyJH7vlKvc4uhdoM/UN6KKMeWNkFhRosRsvW1SYHT31qd8NOQJPhMG4oRSxItdPFy1jW2zcTills3Oc2KtNWg/2+tWT+APFp/FcT9qYLb4aw5/WPK3K/wuS3XmFbajkiOT3oAkvDBn3Aw5/k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(451199018)(2906002)(83380400001)(8936002)(31696002)(86362001)(8676002)(38100700002)(66476007)(66946007)(5660300002)(66556008)(41300700001)(44832011)(30864003)(186003)(53546011)(6486002)(478600001)(36756003)(6506007)(316002)(6512007)(26005)(2616005)(31686004)(66899018)(403724002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFUvaUlycEJkbkFxUmJ6dnNkZlY0V21lRmhxamJGUUZZMFJ3emFNT3dDUzNU?=
 =?utf-8?B?U2ZKMTJOeUFMM2hIQ2NPbDJtdzFheWFvZWxaeWRVaks4bVUxWUdOdXdoR0M0?=
 =?utf-8?B?dGFMVUM5ZHN2ZlMva1RFNE05cXpHYWRkZjlQUjhOYXZLc0I0eDdzdmdFYUVo?=
 =?utf-8?B?MmZJYUY0QmZyODBValFXUDVlT2FIZDJ1VUQ1aTZmY1BydktNeVVjMmNqUGNF?=
 =?utf-8?B?d25HR1pmeUoyNUE2aEY4RVRxK1BhbUpVYkphaWlka0VJWWhtcyt5a3dTOTY3?=
 =?utf-8?B?d3Q2bFA4MzRXNFcrcS9YRlByWnNDVzl5ZFVwMlZTSEV3NDIyZFdETENSVzJx?=
 =?utf-8?B?Q3FzTXd6Rml4eXNWejlUNjJtTlp4MWVwVEg4L3VJaHNBSUZoK1V2ekE3L21n?=
 =?utf-8?B?ejlmZG1IL253cW90allHTmU1RStORUJROGZoaUtCOTlCdHNzWWxPYTY1STR0?=
 =?utf-8?B?Vk9lUGhsL2JMNW1JcjVVYklhMFEva1lVblQ1ZU1XT3BOQ040R2laOHlyNENx?=
 =?utf-8?B?TjB4MlNUQlFON2NOTlVyRzh6YzhkKzhnT2hvZ0xPSzFiQWhZSmlnbzFYTXRi?=
 =?utf-8?B?aUFBeEpucXIrSFJWOStlcWMxTElCcnliakFiUjEwUlBBNTk3M3BINXN2ejUw?=
 =?utf-8?B?RzA3SFRUZERncGZlV3BETzRST0JINkNUcUR2bGJNbU1QMTBHSWZHaHkyMXlv?=
 =?utf-8?B?RkxnQ1lUSi9EbFB2WTRTcTRUVll3OCtVaW45K3RQSGQ2dDNXMlNMN3M3dHlj?=
 =?utf-8?B?VDVXeEE2aGQ4QS9QSkozWGc2NU9zeDNZRHlSTURaa2gydzZzYmxPeVBLQ3Vi?=
 =?utf-8?B?aTJGcWpVTENwTHZQZ2dkM0hsMWczSGdSTFRhU3h6b2NaWjdCVlhaUThqeDVC?=
 =?utf-8?B?UDFka3NYUXMrSkJYclJlRFlsUlFObXljM0RiSGpxbHJjTmg3U1grQWVuR3VR?=
 =?utf-8?B?TmF6amgzWjZCOTd5MmF0WW9ZODhXcmUzQ3N5cHlXOERDSHJ6Y1BKaHFlVk1j?=
 =?utf-8?B?Z2gvQ1FudG0yNWRsYWI3eHdDMXl4VWloK0dmMU5vVGFuYkNSRE90MjU3U0JK?=
 =?utf-8?B?cEJiY0dWOWVCV2M4S05nNyt3bkJYTFJmd1dRL1ZZNE9qemkxYnhrWlNNYjdH?=
 =?utf-8?B?UEhtWElZVTY1VXhNa3FoMDVKaXBDR1Q1VHJOZ2tDbGNxQk5mS1BJK1NUUmhW?=
 =?utf-8?B?cDNzMGxZUlU4WThwcnp2djBKM0hxbnc3TVJyVGo1eXp1ZjJGQXI1aE10OWor?=
 =?utf-8?B?RTFBVmpCeElNQlRxR0RYdE1TZ0NVc0xIa09oRitEN2lMMnVNRDNKZU54Yk5S?=
 =?utf-8?B?a0x0RmZmN01PUTVGV1FqbldXZmQ4bnduNG1iN2l2dDBqdWNOWkNLbllQNVlN?=
 =?utf-8?B?ZmlzbVA1RXBIdTN3M2NSRDBIZWNzRDUyclhrakk3NHJPSHZQRlpSd21CWDg0?=
 =?utf-8?B?WGhXT1VrRU56S0JZQ1NqVnFHKzladmhIMHhmb3F3R3ZZYWYxbGlkZFZ5Ni94?=
 =?utf-8?B?WCt5QVF4QjlFa2hDa3c4Zmo4UTZXbjFRRytINFEwcjY1WnRCWjBFYkVIQ25R?=
 =?utf-8?B?UkVIMTY0SmZ3Qms1WWl6YVhtZ1J4WklYMEU0QTR5M2c1S3BpYVo3VGJkTUdl?=
 =?utf-8?B?dXNNc0lqbTlaa0plRHR2eGh5MjFBSnFvbityaW5RZU93THRwUFgwck9QU0Ns?=
 =?utf-8?B?NEdDS0NJY3c2dG5ya0FtY1JUTG9OK0VPeGhCOXBNc0JPWGRrMjNiTGlLL1Bz?=
 =?utf-8?B?UVQ0ZTNiN1VKaExrM2VKdFJrQ3Iwb01rOEhEZk5HQ0pzZXZZaHdCMjVFeGww?=
 =?utf-8?B?bXdmYVRiQmNYZG9nR3RXSWNyYmFLdDVwV3NJaGdFMUFpTVpSVlZSSWlLREZj?=
 =?utf-8?B?T2hNMHdxNUhoRENEVnpEZTZRbmtEUHJCZStMeEFodUo4QXYrNE1Jd1pGVnZD?=
 =?utf-8?B?SHpGRG9PNG8xd091TEFsWDVwZi9mVUJNMGdpV1B1Y1BvTGZLbEM1cFNKVEJo?=
 =?utf-8?B?alR0Y0NaZk80U0tkbHdjY0pDQUJiWmxUZTVWUVp5MWU0Snh2aGsveVI2ZWxn?=
 =?utf-8?B?d3ZTUDVFWE1mZkFHOUlaSEplSEF6LzRTa0xGc1BZVUpnOGpnRXVJWHdVa1h3?=
 =?utf-8?B?N0xwa1BCdWFpZWRsNXZ2bm1JSjMxTTNvSlZTNS9NajBWV1hZdmluSEdqRVpN?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dea5fc-1cd5-4748-ae59-08db2a365f3a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 18:02:01.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0VEchvcL2OkDyjVAEdosBzZ9Odz3XG0sAxng8DAPemc21pLvcMnhlOuizCnbAGiB/fT+yjLNMdSRv0h4FLVsDe0W8dg77/mAaK8NMWpnAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
X-Proofpoint-ORIG-GUID: ZH05WGEFYe1vCvvftdA-vWYRM26uG8GZ
X-Proofpoint-GUID: ZH05WGEFYe1vCvvftdA-vWYRM26uG8GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32L9vRh1031106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 18:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178896


On 2023-03-20 17:05, Randy MacLeod wrote:
> On 2023-03-20 16:09, Sakib Sajal via lists.openembedded.org wrote:
>> Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.
>>
>> Modified the original fix for CVE-2022-2879 to remove a testdata tarba=
ll
>> and any references to it since git binary diffs are not supported in q=
uilt.
>>
>> Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-1.17.13.inc       |  36 +-
>>   ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
>>   ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 ++++++++++++++++=
++
>>   3 files changed, 710 insertions(+), 17 deletions(-)
>>   create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar=
-limit-size-of-headers.patch
>>   create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http=
-avoid-escapes-from-os.DirFS-and-http.Dir.patch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc
>> index 99662bd298..f5cf192361 100644
>> --- a/meta/recipes-devtools/go/go-1.17.13.inc
>> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
>> @@ -4,23 +4,25 @@ FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-1.1=
8:"
>>  =20
>>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0d=
d74707"
>>  =20
>> -SRC_URI +=3D "\
>> -file://0001-allow-CC-and-CXX-to-have-multiple-words.patch  \
>> -file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patc=
h  \
>> -file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch=
  \
>> -file://0004-ld-add-soname-to-shareable-objects.patch  \
>> -file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patc=
h  \
>> -file://0006-cmd-dist-separate-host-and-target-builds.patch  \
>> -file://0007-cmd-go-make-GOROOT-precious-by-default.patch  \
>> -file://0008-use-GOBUILDMODE-to-set-buildmode.patch  \
>> -file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch  \
>> -file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch  \
>> -file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patc=
h  \
>> -file://CVE-2022-27664.patch  \
>> -file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch  =
\
>> -file://CVE-2022-41715.patch  \
>> -file://CVE-2022-41717.patch  \
>> -"
>> +SRC_URI =3D "https://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain \
>
>
> Nack.
>
>
> Sakib,
>
> You said this works for you but if you look at:
>
> =E2=9D=AF cat meta/recipes-devtools/go/go-1.17.13.inc
> require go-common.inc
>
> FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-1.18:"
>
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd7=
4707"
>
> SRC_URI +=3D "\
> =C2=A0...
>
> and then
>
> =E2=9D=AF grep SRC_URI meta/recipes-devtools/go/go-common.inc
> SRC_URI =3D "https://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain"
>
> You see that you should stick with the +=3D operator.
>
> I think you said that devtool changed that , right?
>
> If so, and if we can learn why this change even built for you,
> then consider opening a bug against devtool.
>
> ../Randy
>
>
Yes, this change was done by "devtool update-recipe go"

I do not think what devtool did is wrong. go-common.inc is included only=20
by go-1.17.13.inc and the SRC_URI from go-common.inc is included in the=20
SRC_URI for go-1.17.13.inc, in the correct order too, so technically you=20
do not need the +=3D in go-1.17.13.inc file.

Regardless SRC_URI change should not be part of CVE fix, sending a v2 by=20
updating the recipe manually.

Sakib


>> +file://0001-allow-CC-and-CXX-to-have-multiple-words.patch  \
>> +file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patc=
h  \
>> +file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch=
  \
>> +file://0004-ld-add-soname-to-shareable-objects.patch  \
>> +file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patc=
h  \
>> +file://0006-cmd-dist-separate-host-and-target-builds.patch  \
>> +file://0007-cmd-go-make-GOROOT-precious-by-default.patch  \
>> +file://0008-use-GOBUILDMODE-to-set-buildmode.patch  \
>> +file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch  \
>> +file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch  \
>> +file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patc=
h  \
>> +file://CVE-2022-27664.patch  \
>> +file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch  =
\
>> +file://CVE-2022-41715.patch  \
>> +file://CVE-2022-41717.patch  \
>> +file://0001-archive-tar-limit-size-of-headers.patch  \
>> +file://0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patc=
h  \
>> +           "
>>   SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f=
6f1d1fc0c1d784ada0cd300fd"
>>  =20
>>   # Upstream don't believe it is a signifiant real world issue and wil=
l only
>> diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-s=
ize-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-=
limit-size-of-headers.patch
>> new file mode 100644
>> index 0000000000..0315e1a3ee
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-=
headers.patch
>> @@ -0,0 +1,177 @@
>> +From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 200=
1
>> +From: Damien Neil<dneil@google.com>
>> +Date: Fri, 2 Sep 2022 20:45:18 -0700
>> +Subject: [PATCH] archive/tar: limit size of headers
>> +
>> +Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
>> +GNU link names), to avoid reading arbitrarily large amounts of data
>> +into memory.
>> +
>> +Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
>> +this issue.
>> +
>> +Fixes CVE-2022-2879
>> +Updates #54853
>> +Fixes #55925
>> +
>> +Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
>> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-priva=
te/+/1565555
>> +Reviewed-by: Tatiana Bradley<tatianabradley@google.com>
>> +Run-TryBot: Roland Shoemaker<bracewell@google.com>
>> +Reviewed-by: Roland Shoemaker<bracewell@google.com>
>> +(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
>> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-priva=
te/+/1590622
>> +Reviewed-by: Damien Neil<dneil@google.com>
>> +Reviewed-by: Julie Qiu<julieqiu@google.com>
>> +Reviewed-on:https://go-review.googlesource.com/c/go/+/438500
>> +Reviewed-by: Dmitri Shuralyov<dmitshur@golang.org>
>> +Reviewed-by: Carlos Amedee<carlos@golang.org>
>> +Reviewed-by: Dmitri Shuralyov<dmitshur@google.com>
>> +Run-TryBot: Carlos Amedee<carlos@golang.org>
>> +TryBot-Result: Gopher Robot<gobot@golang.org>
>> +
>> +CVE: CVE-2022-2879
>> +Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
>> +Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
>> +---
>> + src/archive/tar/format.go      |  4 ++++
>> + src/archive/tar/reader.go      | 14 ++++++++++++--
>> + src/archive/tar/reader_test.go |  8 +++++++-
>> + src/archive/tar/writer.go      |  3 +++
>> + src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
>> + 5 files changed, 53 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
>> +index cfe24a5..6642364 100644
>> +--- a/src/archive/tar/format.go
>> ++++ b/src/archive/tar/format.go
>> +@@ -143,6 +143,10 @@ const (
>> + 	blockSize  =3D 512 // Size of each block in a tar stream
>> + 	nameSize   =3D 100 // Max length of the name field in USTAR format
>> + 	prefixSize =3D 155 // Max length of the prefix field in USTAR forma=
t
>> ++
>> ++	// Max length of a special file (PAX header, GNU long name or link).
>> ++	// This matches the limit used by libarchive.
>> ++	maxSpecialFileSize =3D 1 << 20
>> + )
>> +
>> + // blockPadding computes the number of bytes needed to pad offset up=
 to the
>> +diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
>> +index 1b1d5b4..f645af8 100644
>> +--- a/src/archive/tar/reader.go
>> ++++ b/src/archive/tar/reader.go
>> +@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
>> + 			continue // This is a meta header affecting the next header
>> + 		case TypeGNULongName, TypeGNULongLink:
>> + 			format.mayOnlyBe(FormatGNU)
>> +-			realname, err :=3D io.ReadAll(tr)
>> ++			realname, err :=3D readSpecialFile(tr)
>> + 			if err !=3D nil {
>> + 				return nil, err
>> + 			}
>> +@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]str=
ing) (err error) {
>> + // parsePAX parses PAX headers.
>> + // If an extended header (type 'x') is invalid, ErrHeader is returne=
d
>> + func parsePAX(r io.Reader) (map[string]string, error) {
>> +-	buf, err :=3D io.ReadAll(r)
>> ++	buf, err :=3D readSpecialFile(r)
>> + 	if err !=3D nil {
>> + 		return nil, err
>> + 	}
>> +@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, =
err error) {
>> + 	return n, err
>> + }
>> +
>> ++// readSpecialFile is like io.ReadAll except it returns
>> ++// ErrFieldTooLong if more than maxSpecialFileSize is read.
>> ++func readSpecialFile(r io.Reader) ([]byte, error) {
>> ++	buf, err :=3D io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
>> ++	if len(buf) > maxSpecialFileSize {
>> ++		return nil, ErrFieldTooLong
>> ++	}
>> ++	return buf, err
>> ++}
>> ++
>> + // discard skips n bytes in r, reporting an error if unable to do so.
>> + func discard(r io.Reader, n int64) error {
>> + 	// If possible, Seek to the last byte before the end of the data se=
ction.
>> +diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_=
test.go
>> +index 789ddc1..926dc3d 100644
>> +--- a/src/archive/tar/reader_test.go
>> ++++ b/src/archive/tar/reader_test.go
>> +@@ -6,6 +6,7 @@ package tar
>> +
>> + import (
>> + 	"bytes"
>> ++	"compress/bzip2"
>> + 	"crypto/md5"
>> + 	"errors"
>> + 	"fmt" +@@ -625,9 +626,14 @@ func TestReader(t *testing.T) { + } + d=
efer=20
>> f.Close() + ++ var fr io.Reader =3D f ++ if strings.HasSuffix(v.file, =
".bz2") {
>> ++				fr =3D bzip2.NewReader(fr)
>> ++			}
>> ++
>> + 			// Capture all headers and checksums.
>> + 			var (
>> +-				tr      =3D NewReader(f)
>> ++				tr      =3D NewReader(fr)
>> + 				hdrs    []*Header
>> + 				chksums []string
>> + 				rdbuf   =3D make([]byte, 8)
>> +diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
>> +index e80498d..893eac0 100644
>> +--- a/src/archive/tar/writer.go
>> ++++ b/src/archive/tar/writer.go
>> +@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, pax=
Hdrs map[string]string) error {
>> + 			flag =3D TypeXHeader
>> + 		}
>> + 		data :=3D buf.String()
>> ++		if len(data) > maxSpecialFileSize {
>> ++			return ErrFieldTooLong
>> ++		}
>> + 		if err :=3D tw.writeRawFile(name, data, flag, FormatPAX); err !=3D=
 nil || isGlobal {
>> + 			return err // Global headers return here
>> + 		}
>> +diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_=
test.go
>> +index a00f02d..4e709e5 100644
>> +--- a/src/archive/tar/writer_test.go
>> ++++ b/src/archive/tar/writer_test.go
>> +@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
>> + 	}
>> + }
>> +
>> ++func TestWriteLongHeader(t *testing.T) {
>> ++	for _, test :=3D range []struct {
>> ++		name string
>> ++		h    *Header
>> ++	}{{
>> ++		name: "name too long",
>> ++		h:    &Header{Name: strings.Repeat("a", maxSpecialFileSize)},
>> ++	}, {
>> ++		name: "linkname too long",
>> ++		h:    &Header{Linkname: strings.Repeat("a", maxSpecialFileSize)},
>> ++	}, {
>> ++		name: "uname too long",
>> ++		h:    &Header{Uname: strings.Repeat("a", maxSpecialFileSize)},
>> ++	}, {
>> ++		name: "gname too long",
>> ++		h:    &Header{Gname: strings.Repeat("a", maxSpecialFileSize)},
>> ++	}, {
>> ++		name: "PAX header too long",
>> ++		h:    &Header{PAXRecords: map[string]string{"GOLANG.x": strings.Re=
peat("a", maxSpecialFileSize)}},
>> ++	}} {
>> ++		w :=3D NewWriter(io.Discard)
>> ++		if err :=3D w.WriteHeader(test.h); err !=3D ErrFieldTooLong {
>> ++			t.Errorf("%v: w.WriteHeader() =3D %v, want ErrFieldTooLong", test=
.name, err)
>> ++		}
>> ++	}
>> ++}
>> ++
>> + // testNonEmptyWriter wraps an io.Writer and ensures that
>> + // Write is never called with an empty buffer.
>> + type testNonEmptyWriter struct{ io.Writer }
>> diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-e=
scapes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.1=
8/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
>> new file mode 100644
>> index 0000000000..6c2e8804b3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-=
from-os.DirFS-and-http.Dir.patch
>> @@ -0,0 +1,514 @@
>> +From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 200=
1
>> +From: Damien Neil<dneil@google.com>
>> +Date: Thu, 10 Nov 2022 12:16:27 -0800
>> +Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.D=
ir on
>> + Windows
>> +
>> +Do not permit access to Windows reserved device names (NUL, COM1, etc=
.)
>> +via os.DirFS and http.Dir filesystems.
>> +
>> +Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
>> +the root to the relative path with a path separator, making
>> +os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
>> +a UNC name. Not only does this not open the intended file, but permit=
s
>> +reference to any file on the system rather than only files on the
>> +current drive.
>> +
>> +Make os.DirFS("") invalid, with all file access failing. Previously,
>> +a root of "" was interpreted as "/", which is surprising and probably
>> +unintentional.
>> +
>> +Fixes CVE-2022-41720.
>> +Fixes #56694.
>> +
>> +Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
>> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-priva=
te/+/1663832
>> +Reviewed-by: Julie Qiu<julieqiu@google.com>
>> +Reviewed-by: Tatiana Bradley<tatianabradley@google.com>
>> +Reviewed-on:https://go-review.googlesource.com/c/go/+/455360
>> +Reviewed-by: Michael Pratt<mpratt@google.com>
>> +TryBot-Result: Gopher Robot<gobot@golang.org>
>> +Run-TryBot: Jenny Rakoczy<jenny@golang.org>
>> +
>> +CVE: CVE-2022-41720
>> +Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
>> +Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
>> +---
>> + src/go/build/deps_test.go                 |  1 +
>> + src/internal/safefilepath/path.go         | 21 +++++
>> + src/internal/safefilepath/path_other.go   | 23 ++++++
>> + src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
>> + src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++=
++
>> + src/net/http/fs.go                        |  8 +-
>> + src/net/http/fs_test.go                   | 28 +++++++
>> + src/os/file.go                            | 36 +++++++--
>> + src/os/os_test.go                         | 38 +++++++++
>> + 9 files changed, 328 insertions(+), 10 deletions(-)
>> + create mode 100644 src/internal/safefilepath/path.go
>> + create mode 100644 src/internal/safefilepath/path_other.go
>> + create mode 100644 src/internal/safefilepath/path_test.go
>> + create mode 100644 src/internal/safefilepath/path_windows.go
>> +
>> +diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
>> +index 45e2f25..dc3bb8c 100644
>> +--- a/src/go/build/deps_test.go
>> ++++ b/src/go/build/deps_test.go
>> +@@ -165,6 +165,7 @@ var depsRules =3D `
>> + 	io/fs
>> + 	< internal/testlog
>> + 	< internal/poll
>> ++	< internal/safefilepath
>> + 	< os
>> + 	< os/signal;
>> +
>> +diff --git a/src/internal/safefilepath/path.go b/src/internal/safefil=
epath/path.go
>> +new file mode 100644
>> +index 0000000..0f0a270
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path.go
>> +@@ -0,0 +1,21 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++// Package safefilepath manipulates operating-system file paths.
>> ++package safefilepath
>> ++
>> ++import (
>> ++	"errors"
>> ++)
>> ++
>> ++var errInvalidPath =3D errors.New("invalid path")
>> ++
>> ++// FromFS converts a slash-separated path into an operating-system p=
ath.
>> ++//
>> ++// FromFS returns an error if the path cannot be represented by the =
operating
>> ++// system. For example, paths containing '\' and ':' characters are =
rejected
>> ++// on Windows.
>> ++func FromFS(path string) (string, error) {
>> ++	return fromFS(path)
>> ++}
>> +diff --git a/src/internal/safefilepath/path_other.go b/src/internal/s=
afefilepath/path_other.go
>> +new file mode 100644
>> +index 0000000..f93da18
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_other.go
>> +@@ -0,0 +1,23 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++//go:build !windows
>> ++
>> ++package safefilepath
>> ++
>> ++import "runtime"
>> ++
>> ++func fromFS(path string) (string, error) {
>> ++	if runtime.GOOS =3D=3D "plan9" {
>> ++		if len(path) > 0 && path[0] =3D=3D '#' {
>> ++			return path, errInvalidPath
>> ++		}
>> ++	}
>> ++	for i :=3D range path {
>> ++		if path[i] =3D=3D 0 {
>> ++			return "", errInvalidPath
>> ++		}
>> ++	}
>> ++	return path, nil
>> ++}
>> +diff --git a/src/internal/safefilepath/path_test.go b/src/internal/sa=
fefilepath/path_test.go
>> +new file mode 100644
>> +index 0000000..dc662c1
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_test.go
>> +@@ -0,0 +1,88 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++package safefilepath_test
>> ++
>> ++import (
>> ++	"internal/safefilepath"
>> ++	"os"
>> ++	"path/filepath"
>> ++	"runtime"
>> ++	"testing"
>> ++)
>> ++
>> ++type PathTest struct {
>> ++	path, result string
>> ++}
>> ++
>> ++const invalid =3D ""
>> ++
>> ++var fspathtests =3D []PathTest{
>> ++	{".", "."},
>> ++	{"/a/b/c", "/a/b/c"},
>> ++	{"a\x00b", invalid},
>> ++}
>> ++
>> ++var winreservedpathtests =3D []PathTest{
>> ++	{`a\b`, `a\b`},
>> ++	{`a:b`, `a:b`},
>> ++	{`a/b:c`, `a/b:c`},
>> ++	{`NUL`, `NUL`},
>> ++	{`./com1`, `./com1`},
>> ++	{`a/nul/b`, `a/nul/b`},
>> ++}
>> ++
>> ++// Whether a reserved name with an extension is reserved or not vari=
es by
>> ++// Windows version.
>> ++var winreservedextpathtests =3D []PathTest{
>> ++	{"nul.txt", "nul.txt"},
>> ++	{"a/nul.txt/b", "a/nul.txt/b"},
>> ++}
>> ++
>> ++var plan9reservedpathtests =3D []PathTest{
>> ++	{`#c`, `#c`},
>> ++}
>> ++
>> ++func TestFromFS(t *testing.T) {
>> ++	switch runtime.GOOS {
>> ++	case "windows":
>> ++		if canWriteFile(t, "NUL") {
>> ++			t.Errorf("can unexpectedly write a file named NUL on Windows")
>> ++		}
>> ++		if canWriteFile(t, "nul.txt") {
>> ++			fspathtests =3D append(fspathtests, winreservedextpathtests...)
>> ++		} else {
>> ++			winreservedpathtests =3D append(winreservedpathtests, winreserved=
extpathtests...)
>> ++		}
>> ++		for i :=3D range winreservedpathtests {
>> ++			winreservedpathtests[i].result =3D invalid
>> ++		}
>> ++		for i :=3D range fspathtests {
>> ++			fspathtests[i].result =3D filepath.FromSlash(fspathtests[i].resul=
t)
>> ++		}
>> ++	case "plan9":
>> ++		for i :=3D range plan9reservedpathtests {
>> ++			plan9reservedpathtests[i].result =3D invalid
>> ++		}
>> ++	}
>> ++	tests :=3D fspathtests
>> ++	tests =3D append(tests, winreservedpathtests...)
>> ++	tests =3D append(tests, plan9reservedpathtests...)
>> ++	for _, test :=3D range tests {
>> ++		got, err :=3D safefilepath.FromFS(test.path)
>> ++		if (got =3D=3D "") !=3D (err !=3D nil) {
>> ++			t.Errorf(`FromFS(%q) =3D %q, %v; want "" only if err !=3D nil`, t=
est.path, got, err)
>> ++		}
>> ++		if got !=3D test.result {
>> ++			t.Errorf("FromFS(%q) =3D %q, %v; want %q", test.path, got, err, t=
est.result)
>> ++		}
>> ++	}
>> ++}
>> ++
>> ++func canWriteFile(t *testing.T, name string) bool {
>> ++	path :=3D filepath.Join(t.TempDir(), name)
>> ++	os.WriteFile(path, []byte("ok"), 0666)
>> ++	b, _ :=3D os.ReadFile(path)
>> ++	return string(b) =3D=3D "ok"
>> ++}
>> +diff --git a/src/internal/safefilepath/path_windows.go b/src/internal=
/safefilepath/path_windows.go
>> +new file mode 100644
>> +index 0000000..909c150
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_windows.go
>> +@@ -0,0 +1,95 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++package safefilepath
>> ++
>> ++import (
>> ++	"syscall"
>> ++	"unicode/utf8"
>> ++)
>> ++
>> ++func fromFS(path string) (string, error) {
>> ++	if !utf8.ValidString(path) {
>> ++		return "", errInvalidPath
>> ++	}
>> ++	for len(path) > 1 && path[0] =3D=3D '/' && path[1] =3D=3D '/' {
>> ++		path =3D path[1:]
>> ++	}
>> ++	containsSlash :=3D false
>> ++	for p :=3D path; p !=3D ""; {
>> ++		// Find the next path element.
>> ++		i :=3D 0
>> ++		dot :=3D -1
>> ++		for i < len(p) && p[i] !=3D '/' {
>> ++			switch p[i] {
>> ++			case 0, '\\', ':':
>> ++				return "", errInvalidPath
>> ++			case '.':
>> ++				if dot < 0 {
>> ++					dot =3D i
>> ++				}
>> ++			}
>> ++			i++
>> ++		}
>> ++		part :=3D p[:i]
>> ++		if i < len(p) {
>> ++			containsSlash =3D true
>> ++			p =3D p[i+1:]
>> ++		} else {
>> ++			p =3D ""
>> ++		}
>> ++		// Trim the extension and look for a reserved name.
>> ++		base :=3D part
>> ++		if dot >=3D 0 {
>> ++			base =3D part[:dot]
>> ++		}
>> ++		if isReservedName(base) {
>> ++			if dot < 0 {
>> ++				return "", errInvalidPath
>> ++			}
>> ++			// The path element is a reserved name with an extension.
>> ++			// Some Windows versions consider this a reserved name,
>> ++			// while others do not. Use FullPath to see if the name is
>> ++			// reserved.
>> ++			if p, _ :=3D syscall.FullPath(part); len(p) >=3D 4 && p[:4] =3D=3D=
 `\\.\` {
>> ++				return "", errInvalidPath
>> ++			}
>> ++		}
>> ++	}
>> ++	if containsSlash {
>> ++		// We can't depend on strings, so substitute \ for / manually.
>> ++		buf :=3D []byte(path)
>> ++		for i, b :=3D range buf {
>> ++			if b =3D=3D '/' {
>> ++				buf[i] =3D '\\'
>> ++			}
>> ++		}
>> ++		path =3D string(buf)
>> ++	}
>> ++	return path, nil
>> ++}
>> ++
>> ++// isReservedName reports if name is a Windows reserved device name.
>> ++// It does not detect names with an extension, which are also reserv=
ed on some Windows versions.
>> ++//
>> ++// For details, search for PRN in
>> ++//https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-f=
ile.
>> ++func isReservedName(name string) bool {
>> ++	if 3 <=3D len(name) && len(name) <=3D 4 {
>> ++		switch string([]byte{toUpper(name[0]), toUpper(name[1]), toUpper(n=
ame[2])}) {
>> ++		case "CON", "PRN", "AUX", "NUL":
>> ++			return len(name) =3D=3D 3
>> ++		case "COM", "LPT":
>> ++			return len(name) =3D=3D 4 && '1' <=3D name[3] && name[3] <=3D '9'
>> ++		}
>> ++	}
>> ++	return false
>> ++}
>> ++
>> ++func toUpper(c byte) byte {
>> ++	if 'a' <=3D c && c <=3D 'z' {
>> ++		return c - ('a' - 'A')
>> ++	}
>> ++	return c
>> ++}
>> +diff --git a/src/net/http/fs.go b/src/net/http/fs.go
>> +index 57e731e..43ee4b5 100644
>> +--- a/src/net/http/fs.go
>> ++++ b/src/net/http/fs.go
>> +@@ -9,6 +9,7 @@ package http
>> + import (
>> + 	"errors"
>> + 	"fmt"
>> ++	"internal/safefilepath"
>> + 	"io"
>> + 	"io/fs"
>> + 	"mime" +@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error,=
 name=20
>> string) error { + // Open implements FileSystem using os.Open,=20
>> opening files for reading rooted + // and relative to the directory=20
>> d. + func (d Dir) Open(name string) (File, error) { +- if=20
>> filepath.Separator !=3D '/' && strings.ContainsRune(name,=20
>> filepath.Separator) { +- return nil, errors.New("http: invalid charact=
er in file path")
>> ++	path, err :=3D safefilepath.FromFS(path.Clean("/" + name))
>> ++	if err !=3D nil {
>> ++		return nil, errors.New("http: invalid or unsafe file path")
>> + 	}
>> + 	dir :=3D string(d)
>> + 	if dir =3D=3D "" {
>> + 		dir =3D "."
>> + 	}
>> +-	fullName :=3D filepath.Join(dir, filepath.FromSlash(path.Clean("/"+=
name)))
>> ++	fullName :=3D filepath.Join(dir, path)
>> + 	f, err :=3D os.Open(fullName)
>> + 	if err !=3D nil {
>> + 		return nil, mapDirOpenError(err, fullName)
>> +diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
>> +index b42ade1..941448a 100644
>> +--- a/src/net/http/fs_test.go
>> ++++ b/src/net/http/fs_test.go
>> +@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
>> + 	}
>> + }
>> +
>> ++func TestFileServerNamesEscape(t *testing.T) {
>> ++	t.Run("h1", func(t *testing.T) {
>> ++		testFileServerNamesEscape(t, h1Mode)
>> ++	})
>> ++	t.Run("h2", func(t *testing.T) {
>> ++		testFileServerNamesEscape(t, h2Mode)
>> ++	})
>> ++}
>> ++func testFileServerNamesEscape(t *testing.T, h2 bool) {
>> ++	defer afterTest(t)
>> ++	ts :=3D newClientServerTest(t, h2, FileServer(Dir("testdata"))).ts
>> ++	defer ts.Close()
>> ++	for _, path :=3D range []string{
>> ++		"/../testdata/file",
>> ++		"/NUL", // don't read from device files on Windows
>> ++	} {
>> ++		res, err :=3D ts.Client().Get(ts.URL + path)
>> ++		if err !=3D nil {
>> ++			t.Fatal(err)
>> ++		}
>> ++		res.Body.Close()
>> ++		if res.StatusCode < 400 || res.StatusCode > 599 {
>> ++			t.Errorf("Get(%q): got status %v, want 4xx or 5xx", path, res.Sta=
tusCode)
>> ++		}
>> ++
>> ++	}
>> ++}
>> ++
>> + type fakeFileInfo struct {
>> + 	dir      bool
>> + 	basename string
>> +diff --git a/src/os/file.go b/src/os/file.go
>> +index e717f17..cb87158 100644
>> +--- a/src/os/file.go
>> ++++ b/src/os/file.go
>> +@@ -37,12 +37,12 @@
>> + // Note: The maximum number of concurrent operations on a File may b=
e limited by
>> + // the OS or the system. The number should be high, but exceeding it=
 may degrade
>> + // performance or cause other issues.
>> +-//
>> + package os
>> +
>> + import (
>> + 	"errors"
>> + 	"internal/poll"
>> ++	"internal/safefilepath"
>> + 	"internal/testlog"
>> + 	"internal/unsafeheader"
>> + 	"io" +@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {=
 + //=20
>> the /prefix tree, then using DirFS does not stop the access any more=20
>> than using + // os.Open does. DirFS is therefore not a general=20
>> substitute for a chroot-style security + // mechanism when the=20
>> directory tree contains arbitrary content. ++// ++// The directory=20
>> dir must not be "".
>> + func DirFS(dir string) fs.FS {
>> + 	return dirFS(dir)
>> + }
>> +@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
>> + type dirFS string
>> +
>> + func (dir dirFS) Open(name string) (fs.File, error) {
>> +-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && contains=
Any(name, `\:`) {
>> +-		return nil, &PathError{Op: "open", Path: name, Err: ErrInvalid}
>> ++	fullname, err :=3D dir.join(name)
>> ++	if err !=3D nil {
>> ++		return nil, &PathError{Op: "stat", Path: name, Err: err}
>> + 	}
>> +-	f, err :=3D Open(string(dir) + "/" + name)
>> ++	f, err :=3D Open(fullname)
>> + 	if err !=3D nil {
>> + 		return nil, err // nil fs.File
>> + 	}
>> +@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, er=
ror) {
>> + }
>> +
>> + func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
>> +-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && contains=
Any(name, `\:`) {
>> +-		return nil, &PathError{Op: "stat", Path: name, Err: ErrInvalid}
>> ++	fullname, err :=3D dir.join(name)
>> ++	if err !=3D nil {
>> ++		return nil, &PathError{Op: "stat", Path: name, Err: err}
>> + 	}
>> +-	f, err :=3D Stat(string(dir) + "/" + name)
>> ++	f, err :=3D Stat(fullname)
>> + 	if err !=3D nil {
>> + 		return nil, err
>> + 	}
>> + 	return f, nil
>> + }
>> +
>> ++// join returns the path for name in dir.
>> ++func (dir dirFS) join(name string) (string, error) {
>> ++	if dir =3D=3D "" {
>> ++		return "", errors.New("os: DirFS with empty root")
>> ++	}
>> ++	if !fs.ValidPath(name) {
>> ++		return "", ErrInvalid
>> ++	}
>> ++	name, err :=3D safefilepath.FromFS(name)
>> ++	if err !=3D nil {
>> ++		return "", ErrInvalid
>> ++	}
>> ++	if IsPathSeparator(dir[len(dir)-1]) {
>> ++		return string(dir) + name, nil
>> ++	}
>> ++	return string(dir) + string(PathSeparator) + name, nil
>> ++}
>> ++
>> + // ReadFile reads the named file and returns the contents.
>> + // A successful call returns err =3D=3D nil, not err =3D=3D EOF.
>> + // Because ReadFile reads the whole file, it does not treat an EOF f=
rom Read
>> +diff --git a/src/os/os_test.go b/src/os/os_test.go
>> +index 506f1fb..be269bb 100644
>> +--- a/src/os/os_test.go
>> ++++ b/src/os/os_test.go
>> +@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
>> + 	if err =3D=3D nil {
>> + 		t.Fatalf(`Open testdata\dirfs succeeded`)
>> + 	}
>> ++
>> ++	// Test that Open does not open Windows device files.
>> ++	_, err =3D d.Open(`NUL`)
>> ++	if err =3D=3D nil {
>> ++		t.Errorf(`Open NUL succeeded`)
>> ++	}
>> ++}
>> ++
>> ++func TestDirFSRootDir(t *testing.T) {
>> ++	cwd, err :=3D os.Getwd()
>> ++	if err !=3D nil {
>> ++		t.Fatal(err)
>> ++	}
>> ++	cwd =3D cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix (=
C:) on Windows
>> ++	cwd =3D filepath.ToSlash(cwd)               // convert \ to /
>> ++	cwd =3D strings.TrimPrefix(cwd, "/")        // trim leading /
>> ++
>> ++	// Test that Open can open a path starting at /.
>> ++	d :=3D DirFS("/")
>> ++	f, err :=3D d.Open(cwd + "/testdata/dirfs/a")
>> ++	if err !=3D nil {
>> ++		t.Fatal(err)
>> ++	}
>> ++	f.Close()
>> ++}
>> ++
>> ++func TestDirFSEmptyDir(t *testing.T) {
>> ++	d :=3D DirFS("")
>> ++	cwd, _ :=3D os.Getwd()
>> ++	for _, path :=3D range []string{
>> ++		"testdata/dirfs/a",                          // not DirFS(".")
>> ++		filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not DirFS("/")
>> ++	} {
>> ++		_, err :=3D d.Open(path)
>> ++		if err =3D=3D nil {
>> ++			t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
>> ++		}
>> ++	}
>> + }
>> +
>> + func TestDirFSPathsValid(t *testing.T) {
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#178840):https://lists.openembedded.org/g/openembed=
ded-core/message/178840
>> Mute This Topic:https://lists.openembedded.org/mt/97740601/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

