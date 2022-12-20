Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6241C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 14:29:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.51279.1671546548787119572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 06:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=LdWRF3sS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93534e26d5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKEFvZj024517
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:29:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=WagQQv+YhaH8Bps/BX3V8RRodoGlr8cwpUa1v8ltCFM=;
 b=LdWRF3sSiD8vkjLn/gG8nJd/lcStAIb37oDGEVzLbL3gzNpFhz7llbu1AtSKQR1rKzP3
 FW+zjPHqySQLGQeTAjsBXF4C95i58KVPuWsS/FjfygwCqE2fVS4eat707YLiBtZY+19L
 R7isuipMkgPV13Xb3EOTSn17TnLt6JCdE8N0pCYEg2lrdV8boYKBVF83MLb7BHqbMA3/
 m16nvIUWoUC+OIKIIhj58ycxzOnuI2nq7ISqXBk2SGCKUyMbrCLXCm4aJVy381Jwr/Eu
 Dhw1SZhRvk6r2wsLv7urdqDOevGfW9HGCV7ubfq4AJ/4az4C3Tr1p8P4ypvJYtdTlw4x Nw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5qa2b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:29:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqLuf/vroEesPJXscs7+0XO76ZtH/iCw6voRnNNp6qE+EakHkWVYoy1egJcIp7dCD2nmHQvER9HC/w+JXyUImxJxUdMYCE3R3b8HEgqgeaikggo9UO9n4AtZ1NtUOsFW+qX1FJvW/BrsVH1xX+9jpPnCTE++PtHtOzkl2vKNK+Dm56b5HtyRTgFhs2dtiTOwRtjn6AEDn6Ix7z1IaetzKxs2GvbikGHglaUZAB8RUqER27tfmu0621CVxU4JJqMaqIwYN2uwmTH+HIRzy0EW35P6RJus1S5Jz/phPY0qkVmflScfBb3thB8oplrteQ+5Wl7cXxZ/11mfPMiGLe7zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WagQQv+YhaH8Bps/BX3V8RRodoGlr8cwpUa1v8ltCFM=;
 b=L64Yefem0t8zyQ+cCSUnZBzquQahHfviwOMOxHTrq5fhBn6cZkzegvkg/YzzEJ99HT+nVp+tnUt/VLQ47tZPdtUM+41jvmhwn348tEdqePDXP3oKsYuCa7Qq+DMZ/klHS2TIbAKI4Kh+Snzzo/ZQInlFuFQrRV7GXVWOkXhp0rHOguXmyqj64lxdStosPdm/tcVvvQwT22Fd5MhivMgxyqJ8cEEUenpQao/k2H5K68OkH14yq4c9m81wd1bQ+xu27AKHmUS2N/yyj6vYzPF9fCgLQHPj8lMKubdA5/5Ps6C8QVLYUp3zewLcd0rsLOlFpNmPldkg2JXt3pSzceoh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:29:05 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:29:05 +0000
Content-Type: multipart/alternative;
 boundary="------------wWqZe7xWAdkJrfyAd00otsg2"
Message-ID: <971b4e7b-a7c3-dd0f-1640-4014bae5a472@windriver.com>
Date: Tue, 20 Dec 2022 09:29:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
Content-Language: en-CA
To: archana.polampalli@windriver.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Saun, Manoj Singh" <ManojSingh.Saun@windriver.com>
Cc: "Mali, Narpat" <Narpat.Mali@windriver.com>,
        "G Pillai, Hari" <Hari.GPillai@windriver.com>,
        "Kang, Kai" <Kai.Kang@windriver.com>
References: <20221220062956.609061-1-manojsingh.saun@windriver.com>
 <MW4PR11MB58228FD9C6AA67968C7C494584EA9@MW4PR11MB5822.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <MW4PR11MB58228FD9C6AA67968C7C494584EA9@MW4PR11MB5822.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ca227-4dc2-405a-1bed-08dae2968c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YXroFEvmdU6S/+dFFyMFWC9z5AnsQruLQMA8Le2E7t0iW7EGe47BZf3R+Lmc4PPHCy2JDjOXGqmFpEwnPMj4SE6287gP2y+YEYTd5FgCT2CG2u3W3zZ394fBL1QH+4SBazTVsQGBLy35cb+MBj9crK0gP88955etgQqR9sTupAX8+UZmjuck8Zb84O8APBVux1NoTnZeaawyCgpA+Qt3+Z2YWGgfxS1r+y5m0PYaAFdTRswrfr7ERaIIV2XrO4BS2Pu9z1U4ncAFfBOSxwJjh8ovK10WFimySYFqo0jJMe3Ui/FmgZkRZuveGotP8eg6qLPq2zm7CUnSOrplYYDjaZyN9HpjOMozQe1I3hs0Ry35bo2JRkhgCD5LFqJxglK5qyXim5Pzd050IjKjYqo4j2VHymBTX1a+jCCT1CHNg9X0FtSJjEvwO7fX58t1SWvqkzA/fdkiLHEmBF5mJ/e6bxOV5uDjvwPDcqmBYU+IthsFerVCVf8KhRMukUxZ8b/lQqz5QSDRPva1TsPZxRSBKKH2GQV6Ufga3/lezABMtZbPTlrOlIVpxxOHqmaRFQHbJyNjYNDLT8skJ84J4KJa40+cpRlQXB+CNt6FSr8U5gJOlZF7s40e0xBgd0KrxEzSoevuW2pNAxmEqrUJloXSytEf5RxfJPIercfgK0DkAQ9Z7J0Jq0NNj3X6B3qCox8moksM21Q+f3zTAC5QxiwJqzY5/sH/rPEFFP0bHxgDqVY/q3RJGpKYCLKg2xcbzUFR4TTqQdyn63LTy4fp8Gux7DCQcKYXOL+o2ssZyg8PkOY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(451199015)(66476007)(66556008)(66946007)(86362001)(4326008)(31696002)(8676002)(19627405001)(316002)(5660300002)(36756003)(8936002)(41300700001)(53546011)(2616005)(107886003)(6666004)(186003)(6506007)(6512007)(33964004)(26005)(83380400001)(38100700002)(54906003)(966005)(6636002)(166002)(478600001)(6486002)(110136005)(66899015)(2906002)(31686004)(4001150100001)(21615005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWtQbmpEd2tHMERYYjQzQlZUajEyeVJFdG5meFdhRTFTWEQ3bjFPWGxkRGtz?=
 =?utf-8?B?SWxFQmFRNHlmU0ludkhZNUxheEJCbVR2VWxjaDRqMy9vMzFqVW1VTVljMFBN?=
 =?utf-8?B?anRsdHh6WWNza2ZXK2ZLNm4yYkNYQkhJRWgvU1B6dGxVREgwTUcwWDU1TWc3?=
 =?utf-8?B?WGptdWt2a0VJU3grR0JIV0l2ZkIzU1d5NnUxNDdZRG9EcDZyWnNyKysxNm9O?=
 =?utf-8?B?VkdHcGd3R0xsWkc2TXBKTnNSekpkdndTWFZkQjdiR3FTNnFZU0pZNUhKcDhw?=
 =?utf-8?B?ZE5CQzNrRGJOM2F6aXFjVVBjRGRtcC9uVURVZjlOc3RZK3N6UzdYUk9rME9O?=
 =?utf-8?B?SUZGcEVMbkF1bUdnaU13UVlTQW0yaXkrVW9UOG84OSt1amZNYlczcVhWejhJ?=
 =?utf-8?B?YVdTc1RiOWpBZENnaTVITVcrV1N6ZGYrajFycWkrL0dkaEF1RXlVQ1AxZy9l?=
 =?utf-8?B?ZkpqNy80Tzh2d3NEaWdORzRNNzYrVWFlNS9XTklCeGE3MVl6NklGVTFaams1?=
 =?utf-8?B?RnUwSWRyZlBhbmFZMVBqS3BhT3U5RS9QbDEyVjY2c2V3RWtETWRsRURUUEZk?=
 =?utf-8?B?VmN3cDdKM2xvakczTnNuQUxwWTA5SExBOXhPSUpLTVF1dGdSTlFLeVdaSlVI?=
 =?utf-8?B?RmExVnFRbFpraHNRL3cxdFNrcmNuZTJ3MmMzNXJzeGZaMjhySVpXMWJOS2Nn?=
 =?utf-8?B?NDNlbit2M1hUVGxqVlFGV2ZobnQ5RmVmSEVXcE5VZWpEMFFpWW1XWDVNendD?=
 =?utf-8?B?WmkxKzE0ejJTQzZ5bDNlTXRtTmV5MGpDV0NaNDg3alRBWitINXptK1pGMEFQ?=
 =?utf-8?B?V2Z0Q1N0UVJBM1BSbFYzK0REdG1nKzRLTW02STJMcnYrRC8zWDE5ZDgvallw?=
 =?utf-8?B?ZVFUL0tlT3ZaaDhtd25zVDA3WWZSTEVNLzBKTStTR0RZVEI0akFwZHB6ckhm?=
 =?utf-8?B?cEtob1ZvVHVzTDNPMFR4VGNSZ28vK3lEUWZ4REZCelNScTA2bGQxUUJQS0U1?=
 =?utf-8?B?ei81T1hKTU54eFFHa0FFd2RrKzUzOXQ4Q3JLd0t3ZUJjd3pTOFhHWlVzNmNG?=
 =?utf-8?B?TnRVMFJSNUJFallpWkhTSEJVYTZCT1VKVXZMWHQxeHFweGNuNHF4Z0xOQTRj?=
 =?utf-8?B?d3RsT1R0MWtMUFE0YU81ZGlUYklGR3RjRGNKVlA4bkRlQjNWdFZKY1dOR0xx?=
 =?utf-8?B?bkliSHRBRktpZDYwT3lvY2YvVnVzWU5nSk94OEhGSG1mUjVNRkI0WjNRUTM2?=
 =?utf-8?B?aHpReDl1TnB2KzZHaGlSSVdKampjRW0yYXdDa0N6VXQyNW5jKzIxUkE5QU40?=
 =?utf-8?B?RDg1MWk5OGF3eUNYc3VjSmJ1V05MZS9tZ1lJWmhlU3lpSlpEL1F1QVVhQnZC?=
 =?utf-8?B?SVpCaUthYTZqTUhjbTNoNHgwSFZiYVVVMUFPRXNIMVlmTTZzZi9RRHN1cjdG?=
 =?utf-8?B?UWRScEFKSXJZc0NCaDBaZ29LaTQ5ZE9oMnJ6ZUxmbHhPSHQ2QThvVVZNU29I?=
 =?utf-8?B?ZXZBMkZxcHVQZDRKaGtYMHdMNU5HL2xYVFJWQ0EyLzdSMGo2Q09veHVKL0ZH?=
 =?utf-8?B?ajh6QTRMSERMVUliQzc2eW1XOHJ0b1pLZVZQc0dmMEVGWUdxZkk3WmF4cFRF?=
 =?utf-8?B?WjdlUzFMaXpPcVcwUWVNQnFTNUk1bjhuazYweHBaaXBQcncrZ1h2ZlFqS3Iv?=
 =?utf-8?B?QlhaTUZqaUUvcGNTaXFnQkc1MHJFVTBXR1drRUZaVzBGb05OQzhVcjF4b2My?=
 =?utf-8?B?ZGE0MXRlR2Vic3BZL1RKQnhQK2hiL2FrWWhTc3M1WE9qQms5NHI2cEdoQnpP?=
 =?utf-8?B?bE1SQUQzc2QrTkw3T3JldzFseHVINm1lYUZWZklicmFYNUE3djlwclloSnVQ?=
 =?utf-8?B?YUc3TjlBTXVleHdqTW1IeGR4eWkzTDVPUytiUDNSN2d0bkc5VDUvSSs4ZWdy?=
 =?utf-8?B?L2wyOHZneUVwMVBhUnpWYnB4MndOa0ROby94MFFoR051T25QOEJlNnVuRTdV?=
 =?utf-8?B?RnUvbjFVODFxdFhVN0lkR0lrVGl6Vk9lRlhEaDM1UnloOE9ueWdKTGtPZCtV?=
 =?utf-8?B?YlFPemVpZHhQWmZ5aCt2TlVYYzJnb1VQN01aVlgxNmYwS3h2QmVQREJGbDVG?=
 =?utf-8?B?d1JvR2ZDWnJEempKWXpKNFdpNmdtbE5oZGRuOE81cUVjeHpXTTZRUXUzTHNR?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ca227-4dc2-405a-1bed-08dae2968c7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 14:29:05.7602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UZ3shE1Z0BQgkfTy7niFa4Kues2YmIZC05ANPYEByDDtF1XoRCK0fp0498Q0AKGTcJUSp8xXtubCIPZSPjvrEodH9Krb1ebzCcXz/X2AiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-Proofpoint-ORIG-GUID: w7xoN0PzzSIeKLBUeSZgsz7NavEqw5Ce
X-Proofpoint-GUID: w7xoN0PzzSIeKLBUeSZgsz7NavEqw5Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_05,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 14:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174853

--------------wWqZe7xWAdkJrfyAd00otsg2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BKEFvZj024517

On 2022-12-20 01:34, Polampalli, Archana via lists.openembedded.org wrote=
:
> Hi Manoj,
>
> Please remove [meta-oe] in patch subject, it should be
>
> [OE-core][PATCH 1/1] libksba: fix CVE-2022-3515


Hi Manoj,


Instead of patching, please update to release 1.6.3 and add ptest=20
coverage since
the source has some c code in the tests directory.


../Randy



>
> Regards,
> Archana
> -----------------------------------------------------------------------=
-
> *From:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> on behalf of Manoj Saun via=20
> lists.openembedded.org=20
> <manojsingh.saun=3Dwindriver.com@lists.openembedded.org>
> *Sent:* Tuesday, December 20, 2022 11:59 AM
> *To:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org>
> *Cc:* Mali, Narpat <Narpat.Mali@windriver.com>; G Pillai, Hari=20
> <Hari.GPillai@windriver.com>; Kang, Kai <Kai.Kang@windriver.com>;=20
> Saun, Manoj Singh <ManojSingh.Saun@windriver.com>
> *Subject:* [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
> libksba: integer overflow may lead to remote code execution.
>
> Reference:
> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
>
> Upstream-Status: Backport=20
> [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dcommit;h=3D=
4b7d9cd4a018898d7714ce06f3faf2626c14582b]
>
> CVE: CVE-2022-3515
>
> Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> ---
> =C2=A0...e-overflow-directly-in-the-TLV-parse.patch | 42 ++++++++++++++=
+++++
> =C2=A0meta/recipes-support/libksba/libksba_1.6.2.bb |=C2=A0 3 +-
> =C2=A02 files changed, 44 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644=20
> meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-di=
rectly-in-the-TLV-parse.patch
>
> diff --git=20
> a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-=
directly-in-the-TLV-parse.patch=20
> b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-=
directly-in-the-TLV-parse.patch
> new file mode 100644
> index 0000000000..e2cb842a4d
> --- /dev/null
> +++=20
> b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-=
directly-in-the-TLV-parse.patch
> @@ -0,0 +1,42 @@
> +From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
> +From: Werner Koch <wk@gnupg.org>
> +Date: Wed, 5 Oct 2022 14:19:06 +0200
> +Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
> +
> +Upstream-Status: Backport=20
> [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dcommit;h=3D=
4b7d9cd4a018898d7714ce06f3faf2626c14582b]
> +
> +CVE: CVE-2022-3515
> +
> +Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> +
> +* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
> +used sum.
> +--
> +
> +It is quite common to have checks like
> +
> +=C2=A0=C2=A0=C2=A0 if (ti.nhdr + ti.length >=3D DIM(tmpbuf))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gpg_error (GPG_ERR_TOO_LAR=
GE);
> +
> +This patch detects possible integer overflows immmediately when
> +creating the TI object.
> +
> +Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
> +---
> + src/ber-help.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/ber-help.c b/src/ber-help.c
> +index 81c31ed..56efb6a 100644
> +--- a/src/ber-help.c
> ++++ b/src/ber-help.c
> +@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct=20
> tag_info *ti)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti->length =3D len;
> +=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> ++=C2=A0 if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->len=
gth)
> ++=C2=A0=C2=A0=C2=A0 {
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti->err_string =3D "header+length woul=
d overflow";
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gpg_error (GPG_ERR_EOVERFLOW);
> ++=C2=A0=C2=A0=C2=A0 }
> ++
> +=C2=A0=C2=A0 /* Without this kludge some example certs can't be parsed=
 */
> +=C2=A0=C2=A0 if (ti->class =3D=3D CLASS_UNIVERSAL && !ti->tag)
> +=C2=A0=C2=A0=C2=A0=C2=A0 ti->length =3D 0;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb=20
> b/meta/recipes-support/libksba/libksba_1.6.2.bb
> index f6ecb9aec4..c25c23ef0f 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.2.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
> @@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinf=
o
>
> =C2=A0UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
> =C2=A0SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> - file://ksba-add-pkgconfig-support.patch"=20
> <file://ksba-add-pkgconfig-support.patch">
> + file://ksba-add-pkgconfig-support.patch=20
> <file://ksba-add-pkgconfig-support.patch> \
> +=20
> file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch"=
=20
> <file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch=
">
>
> =C2=A0SRC_URI[sha256sum] =3D=20
> "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
>
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174843):https://lists.openembedded.org/g/openembedd=
ed-core/message/174843
> Mute This Topic:https://lists.openembedded.org/mt/95781520/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------wWqZe7xWAdkJrfyAd00otsg2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-12-20 01:34, Polampalli,
      Archana via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MW4PR11MB58228FD9C6AA67968C7C494584EA9@MW4PR11MB5822.namprd11.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);">Hi Manoj,</span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><br>
        </span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);">Please remove
          [meta-oe] in patch subject, it should be&nbsp;</span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><br>
        </span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe
            UI&quot;, &quot;Segoe UI Web (West European)&quot;,
            &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont,
            Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size:
            11pt; font-weight: 600; background-color: rgb(255, 255,
            255); display: inline !important;" class="ContentPasted0">[</span><span data-markjs="true" class="markdse4i8rx5 ContentPasted0" data-ogac="" data-ogab="" data-ogsc="" data-ogsb="" style="font-weight: 600; font-size: 11pt; font-family:
            &quot;Segoe UI&quot;, &quot;Segoe UI Web (West
            European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; margin: 0px; color: black; background-color:
            rgb(255, 241, 0);">OE-core</span><span style="color: rgb(66,
            66, 66); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 11pt; font-weight: 600;
            background-color: rgb(255, 255, 255); display: inline
            !important;" class="ContentPasted0">][PATCH 1/1] libksba:
            fix CVE-2022-3515</span><br>
        </span></div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Manoj,</p>
    <p><br>
    </p>
    <p>Instead of patching, please update to release 1.6.3 and add ptest
      coverage since<br>
      the source has some c code in the tests directory.<br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p></p>
    <blockquote type="cite" cite="mid:MW4PR11MB58228FD9C6AA67968C7C494584EA9@MW4PR11MB5822.namprd11.prod.outlook.com">
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);">
        </span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe
            UI&quot;, &quot;Segoe UI Web (West European)&quot;,
            &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont,
            Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size:
            11pt; font-weight: 600; background-color: rgb(255, 255,
            255); display: inline !important;" class="ContentPasted0"><br>
          </span></span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe
            UI&quot;, &quot;Segoe UI Web (West European)&quot;,
            &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont,
            Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size:
            11pt; background-color: rgb(255, 255, 255); display: inline
            !important;" class="ContentPasted0">Regards,</span></span></div>
      <div class="elementToProof"><span style="font-family: Calibri,
          Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,
          0, 0); background-color: rgb(255, 255, 255);"><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe
            UI&quot;, &quot;Segoe UI Web (West European)&quot;,
            &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont,
            Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size:
            11pt; background-color: rgb(255, 255, 255); display: inline
            !important;" class="ContentPasted0">Archana</span></span></div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> on behalf of
          Manoj Saun via lists.openembedded.org
          <a class="moz-txt-link-rfc2396E" href="mailto:manojsingh.saun=windriver.com@lists.openembedded.org">&lt;manojsingh.saun=windriver.com@lists.openembedded.org&gt;</a><br>
          <b>Sent:</b> Tuesday, December 20, 2022 11:59 AM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>Cc:</b> Mali, Narpat <a class="moz-txt-link-rfc2396E" href="mailto:Narpat.Mali@windriver.com">&lt;Narpat.Mali@windriver.com&gt;</a>; G
          Pillai, Hari <a class="moz-txt-link-rfc2396E" href="mailto:Hari.GPillai@windriver.com">&lt;Hari.GPillai@windriver.com&gt;</a>; Kang, Kai
          <a class="moz-txt-link-rfc2396E" href="mailto:Kai.Kang@windriver.com">&lt;Kai.Kang@windriver.com&gt;</a>; Saun, Manoj Singh
          <a class="moz-txt-link-rfc2396E" href="mailto:ManojSingh.Saun@windriver.com">&lt;ManojSingh.Saun@windriver.com&gt;</a><br>
          <b>Subject:</b> [OE-core] [meta-oe][PATCH 1/1] libksba: fix
          CVE-2022-3515</font>
        <div>&nbsp;</div>
      </div>
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
            <div class="PlainText">libksba: integer overflow may lead to
              remote code execution.<br>
              <br>
              Reference:<br>
              <a href="https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html</a><br>
              <br>
              Upstream-Status: Backport [<a href="https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b" moz-do-not-send="true" class="moz-txt-link-freetext">https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b</a>]<br>
              <br>
              CVE: CVE-2022-3515<br>
              <br>
              Signed-off-by: Manoj Saun
              <a class="moz-txt-link-rfc2396E" href="mailto:manojsingh.saun@windriver.com">&lt;manojsingh.saun@windriver.com&gt;</a><br>
              ---<br>
              &nbsp;...e-overflow-directly-in-the-TLV-parse.patch | 42
              +++++++++++++++++++<br>
              &nbsp;meta/recipes-support/libksba/libksba_1.6.2.bb |&nbsp; 3 +-<br>
              &nbsp;2 files changed, 44 insertions(+), 1 deletion(-)<br>
              &nbsp;create mode 100644
meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch<br>
              <br>
              diff --git
a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch<br>
              new file mode 100644<br>
              index 0000000000..e2cb842a4d<br>
              --- /dev/null<br>
              +++
b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch<br>
              @@ -0,0 +1,42 @@<br>
              +From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17
              00:00:00 2001<br>
              +From: Werner Koch <a class="moz-txt-link-rfc2396E" href="mailto:wk@gnupg.org">&lt;wk@gnupg.org&gt;</a><br>
              +Date: Wed, 5 Oct 2022 14:19:06 +0200<br>
              +Subject: [PATCH] Detect a possible overflow directly in
              the TLV parser.<br>
              +<br>
              +Upstream-Status: Backport [<a href="https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b" moz-do-not-send="true" class="moz-txt-link-freetext">https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b</a>]<br>
              +<br>
              +CVE: CVE-2022-3515<br>
              +<br>
              +Signed-off-by: Manoj Saun
              <a class="moz-txt-link-rfc2396E" href="mailto:manojsingh.saun@windriver.com">&lt;manojsingh.saun@windriver.com&gt;</a><br>
              +<br>
              +* src/ber-help.c (_ksba_ber_read_tl): Check for overflow
              of a commonly<br>
              +used sum.<br>
              +--<br>
              +<br>
              +It is quite common to have checks like<br>
              +<br>
              +&nbsp;&nbsp;&nbsp; if (ti.nhdr + ti.length &gt;= DIM(tmpbuf))<br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gpg_error (GPG_ERR_TOO_LARGE);<br>
              +<br>
              +This patch detects possible integer overflows
              immmediately when<br>
              +creating the TI object.<br>
              +<br>
              +Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929<br>
              +---<br>
              + src/ber-help.c | 6 ++++++<br>
              + 1 file changed, 6 insertions(+)<br>
              +<br>
              +diff --git a/src/ber-help.c b/src/ber-help.c<br>
              +index 81c31ed..56efb6a 100644<br>
              +--- a/src/ber-help.c<br>
              ++++ b/src/ber-help.c<br>
              +@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t
              reader, struct tag_info *ti)<br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;length = len;<br>
              +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
              + <br>
              ++&nbsp; if (ti-&gt;length &gt; ti-&gt;nhdr &amp;&amp;
              (ti-&gt;nhdr + ti-&gt;length) &lt; ti-&gt;length)<br>
              ++&nbsp;&nbsp;&nbsp; {<br>
              ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;err_string = &quot;header+length would
              overflow&quot;;<br>
              ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gpg_error (GPG_ERR_EOVERFLOW);<br>
              ++&nbsp;&nbsp;&nbsp; }<br>
              ++<br>
              +&nbsp;&nbsp; /* Without this kludge some example certs can't be
              parsed */<br>
              +&nbsp;&nbsp; if (ti-&gt;class == CLASS_UNIVERSAL &amp;&amp;
              !ti-&gt;tag)<br>
              +&nbsp;&nbsp;&nbsp;&nbsp; ti-&gt;length = 0;<br>
              +-- <br>
              +2.34.1<br>
              +<br>
              diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb
              b/meta/recipes-support/libksba/libksba_1.6.2.bb<br>
              index f6ecb9aec4..c25c23ef0f 100644<br>
              --- a/meta/recipes-support/libksba/libksba_1.6.2.bb<br>
              +++ b/meta/recipes-support/libksba/libksba_1.6.2.bb<br>
              @@ -22,7 +22,8 @@ inherit autotools binconfig-disabled
              pkgconfig texinfo<br>
              &nbsp;<br>
              &nbsp;UPSTREAM_CHECK_URI = &quot;<a href="https://gnupg.org/download/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://gnupg.org/download/index.html</a>&quot;<br>
              &nbsp;SRC_URI = &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \<br>
              -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="file://ksba-add-pkgconfig-support.patch&quot;" moz-do-not-send="true">file://ksba-add-pkgconfig-support.patch&quot;</a><br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="file://ksba-add-pkgconfig-support.patch" moz-do-not-send="true">file://ksba-add-pkgconfig-support.patch</a>
              \<br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch&quot;" moz-do-not-send="true">
file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch&quot;</a><br>
              &nbsp;<br>
              &nbsp;SRC_URI[sha256sum] =
              &quot;fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971&quot;<br>
              &nbsp;<br>
              -- <br>
              2.34.1<br>
              <br>
            </div>
          </span></font></div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#174843): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/174843">https://lists.openembedded.org/g/openembedded-core/message/174843</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/95781520/3616765">https://lists.openembedded.org/mt/95781520/3616765</a>
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

--------------wWqZe7xWAdkJrfyAd00otsg2--

