Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19E0C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 13:58:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8666.1678888700124974782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 06:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QhafOKZ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243812222e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FBe6dI015248
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 06:58:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=J0eZDStkNY2Ds5K8N/nvF9pJWvCIZiIpiuILuHeDcgY=;
 b=QhafOKZ0HDEwBOkGZvpJlcP6SoV7ijKf0RpOU5oUQ7rgebtGPR4IDFEy/podXw6EE1XW
 tcKNAOujsNvdRmm37k+pBOiJoc/auAIMzfYsvGXd8WHQvT0rmFGQDK1QdjEnrEMwukbJ
 EwwGcVWwdNWMv9htFg9V7uTpDh4Kj2icq+oVIJMzz9jbTmI+1kR8Rf9TpNQcWjoK58xU
 cnSnQkyLtfVOSeCiGFzkFI/Iq2oak7q/y3l/3eeY95sIkUAk1jZUTmeyeMI/MRPvdYUd
 Uu8Yy3BDV+L0jg77JVJtRNpwvGcrY7Q/CXaw0OPIRuu+ybgqxOWpX2XslS3Vl4Mmbjar JQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2avgju1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 06:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXVChaY9VCnMH92v2IJEv0XT3CJXT3wTPrVl1z8iu2sjOXEv7ovEdISznfhKyZjpXnVtFQmMK4X5pdhcsVOF5iUy+ZBzcTWZo/E8vJS+WUDN7nenT6+VHUY/fwww3UDpIDe/uXcy8TicZn+c5SUpp1++t9gZ/+ED/mVDP3kfDPQgWO9mqXjr/c6WzNhoj0GrmniCeS6Vj+6A8vGsvOGMbv9LE9n+omxxc7N1XpygM9ObWunyXw7QhlGTVRXVm7TcuJeBz9y9hCE+O/tCoNDuhAYsX466bQQ50mcjoa9QAFK1FrGqX9GIkbsNjaNtJv6Dm85QxUgMl00AmrLU2BLyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0eZDStkNY2Ds5K8N/nvF9pJWvCIZiIpiuILuHeDcgY=;
 b=La/lZzRDvJ6P4bz7lMEd1MfI6WIF+YkOHlxu9s1MMTZGGA9+fm/yhRHOsZp6+NGT3hOIC2AppCDffUt7It7WE6+Oo5RQNvgSPI9OYFn79CD6JXuAmmYv2sCOsxdAVLnlQt9JTuvTK07tmZjImlOW+kNnPalwVQ4zFHgqXBXe0izXhj8dsXnUbTyCNb/rdyN1btWoMGpS8w5uYpRA2r81+YjiIQfiJeD1/6g/4NUAM3Y7Anu+Es+P+JqLd74zuM+1HQqEqzUzo+NTebGL08fXrBILBbyiKhcCBrydMl5xV+Qx0wcLj9CFiDZH7tSljjEpgZ69Vfj0wCZonOgoEpQ5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 13:58:16 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 13:58:16 +0000
Content-Type: multipart/alternative;
 boundary="------------0J5HoTFihMZ2kCjhpZmGY7tn"
Message-ID: <d09171b0-beac-2437-b367-6749154a5356@windriver.com>
Date: Wed, 15 Mar 2023 09:58:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] openssl: update from 3.0.8 to 3.1.0
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <174C7E5950269FC6.10695@lists.openembedded.org>
 <174C7EF34675A6EF.8829@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <174C7EF34675A6EF.8829@lists.openembedded.org>
X-ClientProxiedBy: YT4PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::10) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb0c4f8-bb8e-4ecb-f433-08db255d5336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DfwUL2Xo1z1G41CPxP6vcX/b/a+Ns1lNv8u8Flnm6EGS7y5fqy0C8VSf5Xf+5bjU1uZIQfirkcGv36TU7fooqpza0OJJH9NptukXgFqbfmd4MfC+7Y9Yivyop3JiUp9ZWS96FCgS2RZx6OGyxriqrQfgDUE5dGsqJQLnSRVbqJqBvsDbm06HhAxBFm/uixCxAu8hNKDz6quSNLfQS5YGefr7RsemXf2VMIGHOHZKT5AWqRsOqMaEkD9owbeb/UD8o7dn1aB/WcCxbFNbDpXPFfli23r2+Jg8llSlQnZDtDay/QUACg7qdRsRIMHoP70CpW7c7tY1VIZmlw0ZwEXSYfR59NDRgj+YMPmrMS4pgwXZd/I/Vyfs1YT9dpe2LP6975CY8N5FajZSH9vnsJ/TBD+G6jFwtG0kdTfPSGm+IeBzLwpuQh9f3ziMaQa8KqxfC0XWVnEwqc7aHYO6eoXtxe2S5cQx4jghhymgImN8CApIUJ6S5/rkDcuUuTmsxGj4gx1UsoiRhgrnDLFNcsrv9njenOmeK60ZHDcrBS9O7+FvQTiEK7iO9DTQ9fNZjpaeL+Zkwv0ZN5aDXFt7MB9Fd1hNkkplaPMEVqSaZf+BjorbDTgagWR2YoXVh7ukYJ9TaoiZT7igAJeVh/srlpS4DtqxIOHeGavTezmpT+rnOQ19MCKmx6F/GHP8nnrzGVAFoXVtaVigbPPA4+uVOenqemkKdsGlvvhk0z7q5jrL3+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199018)(316002)(478600001)(83380400001)(2616005)(38100700002)(31696002)(86362001)(6486002)(6512007)(53546011)(33964004)(6506007)(26005)(186003)(36756003)(41300700001)(6916009)(8676002)(2906002)(5660300002)(30864003)(31686004)(8936002)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUhsY3dWWlQyOWg1Yk8wdFZjdXlvcmo2bzI3U01vaVlXTW43MnJmcFRYb2t6?=
 =?utf-8?B?cm51OGhtL3k1dEdJSkhRWkNLcktWZTRqMk52LzFVbGlDeFBpM1B2ZTJEdnN1?=
 =?utf-8?B?Y0Rmd2VVczNFdGtvc0lEVnRPRkhnMjE2eVRXbTlzRGtWOXpPZTlxaXJ3V2Zr?=
 =?utf-8?B?Z1dsWS8vSHo1eFB6TTJ4TW1PK0pmWlNHdUlsTjNDUjZ1Z3JTT1VLMlpJN1E2?=
 =?utf-8?B?bDRUWFJWQmowYmh5THI3UmZnaDRYS3VIbEVlcmRJT1hKSXNabE5VTlNqSEQ1?=
 =?utf-8?B?YW5CVWF5SllWNG94aTMySzVmYjNOUkRVbThkNVVHNnZSVGd1N0ZiWFRhVjMy?=
 =?utf-8?B?ZGNGODdEektuN0t6c0VraG1EemYvbEkvemg2NDJmdjVwTGdVMjRmZVQ2OEl5?=
 =?utf-8?B?VndZN1ZUZGFaM0NGTGZJUExOZG53K3NOSmw0SHJvTkdYWHYyVWRtaGNqdkpC?=
 =?utf-8?B?aEo1V0xseVgvTjc5OEExbHRDbGhiT0pINGZNUUQyWG1PcEtrcHpiaUJuWkIr?=
 =?utf-8?B?Q3Zmakg0dk1vTE1FaFcrOERlbFZNdFlhUkpkMlRjcytQUGhaS2pRbzRScXFl?=
 =?utf-8?B?VGE4c0w1bFdGNzIrMk05NG5UZDc4bGNlWFhPcHNRZmd6Q2h1SEptcGJibjlh?=
 =?utf-8?B?TlpseUFvU1BrUjBpWExOb2lWRVcrR1hNb3grVlc5dURMMHlhc081a3ZZMGlj?=
 =?utf-8?B?OTdodTJvT05VRCtjNGdVZWJEZWpVZm41Si95TytTSmtIck9jZnpsOVF1Q3NI?=
 =?utf-8?B?N3RsVmlSeFc0YWM3Q0ZFT01Vc3lzTDhrU01sUDd5eGd2eW5uZlRrT1k4aTdk?=
 =?utf-8?B?cHhxK1o2RG9GeGN0djl2dHhmdENnU1pWMWU3N2ZCRW5MSk9HMTNhWHBSbmFv?=
 =?utf-8?B?QkY5d3JZREs5cXFyclJ4dm9xelh2VGQrSGozb0wyVFA2NWR0Q29QMnpKUlVR?=
 =?utf-8?B?ZnhjS1liUUFBWGE4algralhKWnlpTlJIMWlPWkQrRDd5NlNDOXROVXpNUG4w?=
 =?utf-8?B?bjN1bnRDNFNzdlozM1JyZ0pYbnhWWWg5aVpLZktVQ09qTWY3OStrUmhySVlZ?=
 =?utf-8?B?SDV1dzQwa0dIQ1dDSDlZb21ZMXd2cGNSZ3l5TmhyK3lyeDQzL2lEUWluRDhR?=
 =?utf-8?B?aytyZzBLVmxSOGplZ0svVSsrSndkN0U5MnU5WkVuSDRocWZZRmx0ZVNSVWVN?=
 =?utf-8?B?QzdZN3VuOXRNMGY2ZGw3MTlocHlOUzhaaUF4Z1VzZnR3UVo0Rm9IcHdxcnda?=
 =?utf-8?B?dlB0MGQwVGYvcnVOYWRWc2RIdktHM2orQ1RQT2NGZVBHY3dqZUgwVjdhNjN1?=
 =?utf-8?B?ZlJBMERTd29vK1BuNXlSODUzcmM1SG9DbitRMDZEWFpycHRpRkxPSDgxQi92?=
 =?utf-8?B?bGtkZGJnaVdkVy82U0ZtOEpJVjRlOTcxSzRFN2lSS2ZDWmFST0g2S2dJZEpp?=
 =?utf-8?B?S1NsL0JhWFhiQ3k2eTZQcml0bXFUaStPcTlJczREODBBNkc5UitFbUZDOCs0?=
 =?utf-8?B?b29lU250VVg5NWZNTys1WDBMYUlMZlo1RC9GaEQwRDJ0WXFEUUhnSi9PZE1k?=
 =?utf-8?B?bmhZRkkxRk9TVmR6RzBxbCtJYWNzaGZWUDJCTEl1c05jQWduVzF6U25XcExu?=
 =?utf-8?B?c0lLV2lPakdmTy9WRDJIaDdGN0xiT1NRL3E0ampwb29hb3pzaEsrSXJvbW1I?=
 =?utf-8?B?Yy9yalpCdzU0Y1l1OW9rVkZ5bWZPVlhWZGlqUGFNRitBbHh1WnFNVzJnbTNE?=
 =?utf-8?B?Qm1SMkc2ZmRkWTIyaFJtTXJGaENGWGhmc0ptWmlpTkVpQmM0UEEwQ3hnd25u?=
 =?utf-8?B?M3VPOUR4Z3I2eDVvYXlBWTBXazhHZkc4Vm5iaEdhZjVHeDI4T0kzYVd1VUNu?=
 =?utf-8?B?T1JaUXlndEV6WHBGS2p3N2UrVVdPVTVwcnRPSGhDRDBHNXo4SkgwNFRhYkZw?=
 =?utf-8?B?Snd2ZnMvUnJhemNINTNMTGV3WGxXU0ZKcU9IdExTc1laTzlTMCtuMUxnOStP?=
 =?utf-8?B?M0tpbnl2djlKRVJUemNMMitKVDQvQW1WWTZ1ZjR1anNGV0F5MGRSNFNCbEZG?=
 =?utf-8?B?L0h5WHRqQU9vdkxURU5yU2VETFB6M1NwMEdNcDZKcnVxYzZVQ3lYRGVSeUVT?=
 =?utf-8?B?Q3YzOGxmcWxEL1BaZVZkaXdkdE5DTW55SnI3ZUdYcUFUZk1KSHZld3pPdUdY?=
 =?utf-8?Q?3bzJZTetaexm3WwNQDqX9Nc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb0c4f8-bb8e-4ecb-f433-08db255d5336
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 13:58:16.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvVIoFs/b1WtAQZ9Rqa6QKZNobnkrq/BRZTvjEwYUghgw0tRnB2jT1G40ExeokUyYHDUSsL5JlVk+bzn7bWA4KENmkJzLTj9xn2LOPg96eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
X-Proofpoint-ORIG-GUID: HCKkKpYJWUPU0Bo-0M86JRdgXmrD34ii
X-Proofpoint-GUID: HCKkKpYJWUPU0Bo-0M86JRdgXmrD34ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=873 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178550

--------------0J5HoTFihMZ2kCjhpZmGY7tn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32FBe6dI015248

The ptests all passed or were skipped as you'd hope and expect from=20
openssl.
Results below.

../Randy


On 2023-03-15 00:58, Randy MacLeod via lists.openembedded.org wrote:
> On 2023-03-15 00:48, Randy MacLeod via lists.openembedded.org wrote:
>> >From the NEWS.md file:
>>
>>
> PASS: 65-test_cmp_ctx.t .................. ok
> PASS: 65-test_cmp_hdr.t .................. ok
> PASS: 65-test_cmp_msg.t .................. ok
> PASS: 65-test_cmp_protect.t .............. ok
> PASS: 65-test_cmp_server.t ............... ok
> PASS: 65-test_cmp_status.t ............... ok
> PASS: 65-test_cmp_vfy.t .................. ok
> PASS: 66-test_ossl_store.t ............... ok
> PASS: 70-test_asyncio.t .................. ok
> ...
>
>
PASS: 70-test_bad_dtls.t ................. ok
PASS: 70-test_clienthello.t .............. ok
PASS: 70-test_comp.t ..................... ok
PASS: 70-test_key_share.t ................ ok
PASS: 70-test_packet.t ................... ok
PASS: 70-test_recordlen.t ................ ok
PASS: 70-test_renegotiation.t ............ ok
PASS: 70-test_servername.t ............... ok
PASS: 70-test_sslcbcpadding.t ............ ok
PASS: 70-test_sslcertstatus.t ............ ok
PASS: 70-test_sslextension.t ............. ok
PASS: 70-test_sslmessages.t .............. ok
PASS: 70-test_sslrecords.t ............... ok
PASS: 70-test_sslsessiontick.t ........... ok
PASS: 70-test_sslsigalgs.t ............... ok
PASS: 70-test_sslsignature.t ............. ok
PASS: 70-test_sslskewith0p.t ............. ok
PASS: 70-test_sslversions.t .............. ok
PASS: 70-test_sslvertol.t ................ ok
PASS: 70-test_tls13alerts.t .............. ok
PASS: 70-test_tls13cookie.t .............. ok
PASS: 70-test_tls13downgrade.t ........... ok
PASS: 70-test_tls13hrr.t ................. ok
PASS: 70-test_tls13kexmodes.t ............ ok
PASS: 70-test_tls13messages.t ............ ok
PASS: 70-test_tls13psk.t ................. ok
PASS: 70-test_tlsextms.t ................. ok
PASS: 70-test_verify_extra.t ............. ok
PASS: 70-test_wpacket.t .................. ok
PASS: 71-test_ssl_ctx.t .................. ok
PASS: 79-test_http.t ..................... ok
PASS: 80-test_ca.t ....................... ok
PASS: 80-test_cipherbytes.t .............. ok
PASS: 80-test_cipherlist.t ............... ok
PASS: 80-test_ciphername.t ............... ok
PASS: 80-test_cmp_http.t ................. ok
PASS: 80-test_cms.t ...................... ok
PASS: 80-test_cmsapi.t ................... ok
PASS: 80-test_ct.t ....................... ok
PASS: 80-test_dane.t ..................... ok
PASS: 80-test_dtls.t ..................... ok
PASS: 80-test_dtls_mtu.t ................. ok
PASS: 80-test_dtlsv1listen.t ............. ok
PASS: 80-test_ocsp.t ..................... ok
PASS: 80-test_pkcs12.t ................... ok
PASS: 80-test_ssl_new.t .................. ok
PASS: 80-test_ssl_old.t .................. ok
PASS: 80-test_ssl_test_ctx.t ............. ok
PASS: 80-test_sslcorrupt.t ............... ok
PASS: 80-test_tsa.t ...................... ok
PASS: 80-test_x509aux.t .................. ok
PASS: 81-test_cmp_cli.t .................. ok
PASS: 90-test_asn1_time.t ................ ok
PASS: 90-test_async.t .................... ok
PASS: 90-test_bio_enc.t .................. ok
PASS: 90-test_bio_memleak.t .............. ok
PASS: 90-test_constant_time.t ............ ok
PASS: 90-test_fatalerr.t ................. ok
SKIP: 90-test_fipsload.t ................. skipped: Test is disabled=20
with disabled fips
PASS: 90-test_gmdiff.t ................... ok
PASS: 90-test_ige.t ...................... ok
PASS: 90-test_includes.t ................. ok
PASS: 90-test_memleak.t .................. ok
PASS: 90-test_overhead.t ................. ok
PASS: 90-test_secmem.t ................... ok
PASS: 90-test_shlibload.t ................ ok
PASS: 90-test_srp.t ...................... ok
PASS: 90-test_sslapi.t ................... ok
PASS: 90-test_sslbuffers.t ............... ok
PASS: 90-test_store.t .................... ok
PASS: 90-test_sysdefault.t ............... ok
PASS: 90-test_threads.t .................. ok
PASS: 90-test_time_offset.t .............. ok
PASS: 90-test_tls13ccs.t ................. ok
PASS: 90-test_tls13encryption.t .......... ok
PASS: 90-test_tls13secrets.t ............. ok
PASS: 90-test_traceapi.t ................. ok
PASS: 90-test_v3name.t ................... ok
PASS: 91-test_pkey_check.t ............... ok
SKIP: 95-test_external_gost_engine.t ..... skipped: No external tests in=20
this configuration
SKIP: 95-test_external_krb5.t ............ skipped: No external tests in=20
this configuration
SKIP: 95-test_external_oqsprovider.t ..... skipped: No external tests in=20
this configuration
SKIP: 95-test_external_pyca.t ............ skipped: No external tests in=20
this configuration
SKIP: 95-test_external_tlsfuzzer.t ....... skipped: No external tests in=20
this configuration
PASS: 99-test_ecstress.t ................. ok
PASS: 99-test_fuzz_asn1.t ................ ok
PASS: 99-test_fuzz_asn1parse.t ........... ok
PASS: 99-test_fuzz_bignum.t .............. ok
PASS: 99-test_fuzz_bndiv.t ............... ok
PASS: 99-test_fuzz_client.t .............. ok
PASS: 99-test_fuzz_cmp.t ................. ok
PASS: 99-test_fuzz_cms.t ................. ok
PASS: 99-test_fuzz_conf.t ................ ok
PASS: 99-test_fuzz_crl.t ................. ok
PASS: 99-test_fuzz_ct.t .................. ok
PASS: 99-test_fuzz_server.t .............. ok
PASS: 99-test_fuzz_x509.t ................ ok
All tests successful.
Files=3D250, Tests=3D3354, 588 wallclock secs (11.78 usr=C2=A0 1.17 sys +=
 465.74=20
cusr 114.46 csys =3D 593.15 CPU)
Result: PASS
DURATION: 589
END: /usr/lib/openssl/ptest
2023-03-15T04:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0


--=20
# Randy MacLeod
# Wind River Linux

--------------0J5HoTFihMZ2kCjhpZmGY7tn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">The ptests all passed or were skipped
      as you'd hope and expect from openssl. <br>
      Results below.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2023-03-15 00:58, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174C7EF34675A6EF.8829@lists.openembedded.org">
      
      <div class="moz-cite-prefix">On 2023-03-15 00:48, Randy MacLeod
        via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:174C7E5950269FC6.10695@lists.openembedded.org">
        <pre class="moz-quote-pre" wrap="">&gt;From the NEWS.md file:


</pre>
      </blockquote>
      <p> PASS: 65-test_cmp_ctx.t .................. ok<br>
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
    </blockquote>
    <p>PASS: 70-test_bad_dtls.t ................. ok<br>
      PASS: 70-test_clienthello.t ..............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_comp.t ..................... ok<br>
      PASS: 70-test_key_share.t ................ ok<br>
      PASS: 70-test_packet.t ................... ok<br>
      PASS: 70-test_recordlen.t ................ ok<br>
      PASS: 70-test_renegotiation.t ............ ok<br>
      PASS: 70-test_servername.t ............... ok<br>
      PASS: 70-test_sslcbcpadding.t ............ ok<br>
      PASS: 70-test_sslcertstatus.t ............ ok<br>
      PASS: 70-test_sslextension.t ............. ok<br>
      PASS: 70-test_sslmessages.t .............. ok<br>
      PASS: 70-test_sslrecords.t ............... ok<br>
      PASS: 70-test_sslsessiontick.t ........... ok<br>
      PASS: 70-test_sslsigalgs.t ............... ok<br>
      PASS: 70-test_sslsignature.t ............. ok<br>
      PASS: 70-test_sslskewith0p.t ............. ok<br>
      PASS: 70-test_sslversions.t .............. ok<br>
      PASS: 70-test_sslvertol.t ................ ok<br>
      PASS: 70-test_tls13alerts.t .............. ok<br>
      PASS: 70-test_tls13cookie.t .............. ok<br>
      PASS: 70-test_tls13downgrade.t ........... ok<br>
      PASS: 70-test_tls13hrr.t .................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_tls13kexmodes.t ............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_tls13messages.t ............
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_tls13psk.t .................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_tlsextms.t .................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 70-test_verify_extra.t ............. ok<br>
      PASS: 70-test_wpacket.t .................. ok<br>
      PASS: 71-test_ssl_ctx.t .................. ok<br>
      PASS: 79-test_http.t ..................... ok<br>
      PASS: 80-test_ca.t ....................... ok<br>
      PASS: 80-test_cipherbytes.t .............. ok<br>
      PASS: 80-test_cipherlist.t ............... ok<br>
      PASS: 80-test_ciphername.t ............... ok<br>
      PASS: 80-test_cmp_http.t ................. ok<br>
      PASS: 80-test_cms.t ...................... ok<br>
      PASS: 80-test_cmsapi.t ................... ok<br>
      PASS: 80-test_ct.t ....................... ok<br>
      PASS: 80-test_dane.t ..................... ok<br>
      PASS: 80-test_dtls.t ..................... ok<br>
      PASS: 80-test_dtls_mtu.t .................
      ok&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: 80-test_dtlsv1listen.t ............. ok<br>
      PASS: 80-test_ocsp.t ..................... ok<br>
      PASS: 80-test_pkcs12.t ................... ok<br>
      PASS: 80-test_ssl_new.t .................. ok<br>
      PASS: 80-test_ssl_old.t .................. ok<br>
      PASS: 80-test_ssl_test_ctx.t ............. ok<br>
      PASS: 80-test_sslcorrupt.t ............... ok<br>
      PASS: 80-test_tsa.t ...................... ok<br>
      PASS: 80-test_x509aux.t .................. ok<br>
      PASS: 81-test_cmp_cli.t .................. ok<br>
      PASS: 90-test_asn1_time.t ................ ok<br>
      PASS: 90-test_async.t .................... ok<br>
      PASS: 90-test_bio_enc.t .................. ok<br>
      PASS: 90-test_bio_memleak.t .............. ok<br>
      PASS: 90-test_constant_time.t ............ ok<br>
      PASS: 90-test_fatalerr.t ................. ok<br>
      SKIP: 90-test_fipsload.t ................. skipped: Test is
      disabled with disabled fips<br>
      PASS: 90-test_gmdiff.t ................... ok<br>
      PASS: 90-test_ige.t ...................... ok<br>
      PASS: 90-test_includes.t ................. ok<br>
      PASS: 90-test_memleak.t .................. ok<br>
      PASS: 90-test_overhead.t ................. ok<br>
      PASS: 90-test_secmem.t ................... ok<br>
      PASS: 90-test_shlibload.t ................ ok<br>
      PASS: 90-test_srp.t ...................... ok<br>
      PASS: 90-test_sslapi.t ................... ok<br>
      PASS: 90-test_sslbuffers.t ............... ok<br>
      PASS: 90-test_store.t .................... ok<br>
      PASS: 90-test_sysdefault.t ............... ok<br>
      PASS: 90-test_threads.t .................. ok<br>
      PASS: 90-test_time_offset.t .............. ok<br>
      PASS: 90-test_tls13ccs.t ................. ok<br>
      PASS: 90-test_tls13encryption.t .......... ok<br>
      PASS: 90-test_tls13secrets.t ............. ok<br>
      PASS: 90-test_traceapi.t ................. ok<br>
      PASS: 90-test_v3name.t ................... ok<br>
      PASS: 91-test_pkey_check.t ............... ok<br>
      SKIP: 95-test_external_gost_engine.t ..... skipped: No external
      tests in this configuration<br>
      SKIP: 95-test_external_krb5.t ............ skipped: No external
      tests in this configuration<br>
      SKIP: 95-test_external_oqsprovider.t ..... skipped: No external
      tests in this configuration<br>
      SKIP: 95-test_external_pyca.t ............ skipped: No external
      tests in this configuration<br>
      SKIP: 95-test_external_tlsfuzzer.t ....... skipped: No external
      tests in this configuration<br>
      PASS: 99-test_ecstress.t ................. ok<br>
      PASS: 99-test_fuzz_asn1.t ................ ok<br>
      PASS: 99-test_fuzz_asn1parse.t ........... ok<br>
      PASS: 99-test_fuzz_bignum.t .............. ok<br>
      PASS: 99-test_fuzz_bndiv.t ............... ok<br>
      PASS: 99-test_fuzz_client.t .............. ok<br>
      PASS: 99-test_fuzz_cmp.t ................. ok<br>
      PASS: 99-test_fuzz_cms.t ................. ok<br>
      PASS: 99-test_fuzz_conf.t ................ ok<br>
      PASS: 99-test_fuzz_crl.t ................. ok<br>
      PASS: 99-test_fuzz_ct.t .................. ok<br>
      PASS: 99-test_fuzz_server.t .............. ok<br>
      PASS: 99-test_fuzz_x509.t ................ ok<br>
      All tests successful.<br>
      Files=250, Tests=3354, 588 wallclock secs (11.78 usr&nbsp; 1.17 sys +
      465.74 cusr 114.46 csys = 593.15 CPU)<br>
      Result: PASS<br>
      DURATION: 589<br>
      END: /usr/lib/openssl/ptest<br>
      2023-03-15T04:56<br>
      STOP: ptest-runner<br>
      TOTAL: 1 FAIL: 0<br>
      <br>
    </p>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0J5HoTFihMZ2kCjhpZmGY7tn--

