Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AECC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2740.1639595703246350080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 11:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GQWTxJ/B;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79836c4bb3=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BFDNVql012736;
	Wed, 15 Dec 2021 19:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jiKJN5dfcUD1T1C/IZ/zZl56RF1NZaN7TBEbrRI1rC4=;
 b=GQWTxJ/BWlaQvxo4nvsomW9iBwmA1e/X8ie0jLUqm3kuhps+V1sBAsQBly5qHUs9g4WW
 Xh8i12HjaOWEQfEFvdIYeJP2xcOjyxEpIofIznUQ2JqCY7mqL2VbAqbSRWcvRCDCfd1h
 NhZ6p8V4ELHrBVYHN+gH0/TTLiy47gsQ0mRsPS5t/42M9cxTrpNgwig8a3kMpDVYaCbT
 7PSNjrdnixG5ncBp2EohQVlhMkSFnWAGuDpnRM5u7awUBuXjKWoTJ7wvEb2fHyD152aX
 qk10ZhuWqt2YwNboYXkNyh1tBLK0kzQA2gG9bUYzGcu7Lvub16VgwtT4dKaQMds1uRsG 5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cygan8ag1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Dec 2021 19:15:02 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BFJF1xe003580;
	Wed, 15 Dec 2021 19:15:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cygan8ag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Dec 2021 19:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj9iNth5h+qElD+lXNamxp5RQ1w5+K9wgIcnrkmXj44u1fRW0MNzzhyhHzq7bVCIbU6ykAV1FkNNVkjDltXd0uKtGK76zEes7ewkTnvOBU5RHfHfIvz88mRuig4lcybu8JqrvnUAN7W0jPMMIDreonMxRIUYX2T/zhlrtowCn7azO4t4K2pwiexJ3QOkHiN6kvAWsipToD6ghYhDzVYdgxOc7rvLX0/bUn6LlUrcRAAq0g3bqrFjdyqDnOOqZNRyCBxIuGxY7Rrhymupr56ulvH7xXpuw5YCuYS0WqDxrbVG+KMKjPMqDZxwTFvvCAvukdV+jdCE9xBIM8tjWPt4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiKJN5dfcUD1T1C/IZ/zZl56RF1NZaN7TBEbrRI1rC4=;
 b=cZNldd+IpYHSVjdwy3vNLaSv9IXd6+GkZN5wU603pMsyqx4xa7eMjvS9xDq/IsZePBU2t4eqfVsjbB/gEyjnsHdtzvYqD2aBQpA82yz4aXTds49Sg1jx16Abg1TXCFgZTfGJ76nPB3XuKExbIGDh5WbybtqYPKqUPCaG8IskMf2xhpBr4BjP+zLc8tXivMXRX/mhjonh4Kx0ulSgvuwYVmWGgTE/WgDYVPJeQttCLePs9dOnGlMoTcr0LpuRK96iCQBnNed90OjT15pecBQtROPvt8wwdDvo91yHDxkqQQbUa7wn/Zqz5Dnnj4jO+yLJIqplAyRUqdDq6984okgnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 19:14:59 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a%5]) with mapi id 15.20.4778.017; Wed, 15 Dec 2021
 19:14:59 +0000
Message-ID: <05fa2924-615e-de46-9887-c175f9d3d9d0@windriver.com>
Date: Wed, 15 Dec 2021 11:14:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [oe] Help with Inclusive Language in OpenEmbedded/Yocto Project
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, yocto@lists.yoctoproject.org,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0048.namprd12.prod.outlook.com
 (2603:10b6:301:2::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d66b1d-4406-43d5-b123-08d9bfff2fc4
X-MS-TrafficTypeDiagnostic: MWHPR11MB1680:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB16808CC67FED6A9988FECF53EE769@MWHPR11MB1680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SEEYsj6p9K4IhuidIeKTfh/5cepp+SDtyOkgIgLQw7CdB8212ubUe98+q4N8gxftx5D4CqdTUWk06jnZjmaPI/xU65QbS3UCkpcDHiDBPJqIjCJPZ8YXViAqlAIFMae/pHUpmZXk7HAV4qGS3s2yvCcnHg2zb+zNjsIMEcxZs3AKtmlmds3B1tKEgU1tOuHYTMVFj7EYdZWNUYdaMKd31XjYq40uFiVXx9mptzUScVSsBc+HPKwlkp5ZI8iu8VCc8mctdwCrYVvjXDpFV48i7UHpT4rYAWidNeiTH0iLPvPFdb2LUJzjhposKfYgduPafMd2jIYIKEuTeAgMX/tc5KL1envEOVIlrHRSwA0S/VlcQHdxbdFLDNUBXM/PEmCgrxRSDyf+Slvz281s5ynMtJRvA76KE/wkclStpKI52RQMT+ZrfgLfT5MIXholK8el0ON+Ou6kPznE49SBMBdiaA490iPyyUJ25tnvv5MmT1gKAA3lSnGNgJy2s4XmikeIm9/IsZjTEMl5BjQ7qKwPrCZpKXtiApPeZ/5DneuQBGMfsOtGfyyvJJj6+8js9ggTBc5V9CG5UYEQgYl+0n/IhhLyR1Io1fDt+L97kItSX/T6tDqR5OIJhGf+RgxOcLkjKDQOlUZUFeX9opImfU2Psw1lzCxB3yJPgPtbONOSh5Kk1JWWh4QyZGhh3VeKz1ZrhJELCdZqPCYx78gywtI+pqFtnPb2UKwmeg44zldRWw3lyIeLgpY6b2/OvUg11DjiO9chTZtXaYUpn6heaqF3uZwpPtOkpwY+nJKdDmDE9gFWBK3soDNqNxw0dRyS204kofsIXQGlm231ncFyQn+0e4+Ps06lC227QEGr/7g2XEux6ROggh2lwyaKT8zdw/T8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(38100700002)(6506007)(38350700002)(186003)(508600001)(66476007)(8936002)(66946007)(2906002)(52116002)(66556008)(966005)(316002)(31696002)(83380400001)(8676002)(6486002)(53546011)(31686004)(86362001)(5660300002)(6666004)(2616005)(26005)(36756003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVF3dk1nYnkxUUJtWlViT2R5Nk5CUWNVamlnWkk1KzJnbERtS0ZISklOSUhQ?=
 =?utf-8?B?cUFUQUdBZTh0YmxSL3hCTlZnSUxwR0tqQTBaZlNnRGQrVzVrZVA1ejgraDdN?=
 =?utf-8?B?ZFJFWXkycWdIa3ErYjRNd1h3SlQ2VVBwd1ZBbUt0TFVNaDkxZzEyU0NpUUli?=
 =?utf-8?B?MU1UTURCbUlCdkZCbEYxRmhWNkxvTkNqbCtnSk1GRmJhQ2ViZ0o0QlhkZkh5?=
 =?utf-8?B?d1hIUGxaQXNYNWtIM3hLUmJzTThJVUFIbXFiNE0yNW9UQXFhSmZoWURqTXlu?=
 =?utf-8?B?bDFwUGIzVUI5ZGVWK0hIVThObjA1MFAxSFg5MU5vMmNrY1pVczJGZFZGcVln?=
 =?utf-8?B?WE82RktMZXo2aDhFR1NwUEhNVnpvN3JxZ3RzcDEwb0ZJc2N4b3c4dEpuYWRF?=
 =?utf-8?B?YlRPOFV2MElnNkhYYW9ZU1ZpY0VqWDlkNDV5d1dNTjJXbFF5Tm9oTTBZcUhr?=
 =?utf-8?B?UGEyMytSM1laMEMvOWpOaVRxbFdDc29mTThaNXhwKzFvZG5JeXZVdTdDVGgx?=
 =?utf-8?B?RVlkZUZhdStOZ1liQjFTalJ6cEV1YWYrWnRuQk13QkI2eEVEbnVCdkFNT2ZF?=
 =?utf-8?B?Y0FXeUNlNXNVVTQvaU1TaENlaHdsK1o3Sk1ETTh4Ry9NVXhtVGhFeDBDeW5l?=
 =?utf-8?B?c1E3NDJKN3cxOEtOTmZGSmtEY3c3ZXFJWFZzUjZ1L0VQczNZd3RXdXJIRUV3?=
 =?utf-8?B?aU5OSGszQllrSEZrbUxTUDVXTm0rWDJ0TFdlYTlGMVpJek1ydHREWVpYeS91?=
 =?utf-8?B?WEhhT254V3J5MlU0RHc0dFpNdlZjZzB4YmdNbDRwSTlTdTJnWG9uOGRISU8y?=
 =?utf-8?B?eHZKbkJxMndOd0M4NEUweFgxdzl1NlNPNUVxQjdoNHljQi9JaU5STmtHT3Mv?=
 =?utf-8?B?MGcvWnRyMFNHbkxoYkNhWnZQSkdENWNEY0kxWTU5MUZINWNZSzlMaWVTSFNr?=
 =?utf-8?B?VDJxODVsby9RMDNhNjl4NG9OOURJbjJrQ0lFbFNiZjBubGpmY09vU28xT2k5?=
 =?utf-8?B?OEJmZGY4cXgyYmc4STRseU8vcFp4cnBXOXp4WWNqNEswUjRQSk1WZXVXL050?=
 =?utf-8?B?bUlONnZUOHRIbE9Pa3l3MlltbG5HbHRpa1BpY0hFM0dPcjBKeFp4K3lYTkh2?=
 =?utf-8?B?UGxYajBuSnd2UUd4NTNxTVM5UlpUZUdVUm1KOWl5VkF0aE1hQ1U4Mm9KbGtP?=
 =?utf-8?B?M1FLMzlZR2ZqZkZSckxOWEhhM3B0S0k2aEI4cnFYMFArdVNIQUYyN0d4anhp?=
 =?utf-8?B?SXZQQ2ZqWW5CZUhRSGd3MlJ4Z2M5dldpeG0xV1JyVG52b0V5SkxEaEJGaWtT?=
 =?utf-8?B?YW12RC82ajlLUlJpeEdkUldMcDQ2citoeUNSRVBMbXZIRDVMQWxBUFlVWFRn?=
 =?utf-8?B?VkM1THZvbElBbWdnMlErazhYYk1MQ3greSs1eEwvZldjNTRnSEpsb3Njd3Ns?=
 =?utf-8?B?OVBPRDZSNFRQcE5XODcrNGlHZjFMQUgwL2duSzJJK2pON1d2YWFUL0V1OVdy?=
 =?utf-8?B?U1JrUjEyOTBsc0lpRnY2OXZMVXBXc0JJN0RITjlFZmxlRHNwaE1CZ0pPeUFt?=
 =?utf-8?B?M3p0dGtKWmRsT0xRajB4SWF6dkd4d3lJV00rUy9XMlpPMURSMHI3YlowTEUx?=
 =?utf-8?B?RzN1Y0tpckNMRCtpU3Rld1pPSUFpNjhTVU9RZitmRzZwMzVUdWFkZEhxYmhF?=
 =?utf-8?B?c1ZkZlJHdnFXNG90RmIvcmJxMk1WUkIwS1Izek1oZ3JGUVJGTmZmdFRzbHdj?=
 =?utf-8?B?QWtZWUdyaVoxMWNzRVJBbkRDb0sxNTVZTE1ISm9iNXM3OG5PWkx0Nk5zN0Zk?=
 =?utf-8?B?bTdMQXpabWswb0lhSGM0dS8xRXhud05RZjd4dmtubGxCYm43QkJrNENkNlhu?=
 =?utf-8?B?Uyt6YUgrS1pFemlpTnlSVEdXbUpmblVHd1hzN0Y0eEVmd2dVOGVQaHlCNTRx?=
 =?utf-8?B?MVg4bS82TXY5NFBGaGRxVEpvR1Rjb0RMaWFIczlzb3dVUjBiQmpZeTFPZDVs?=
 =?utf-8?B?VDRMMHo5Wk4zQStzek53NmlLNDJsckdBbFhIN3dmQ1VocEJqUzN2YU1DRGtW?=
 =?utf-8?B?RElPTDNQd1hieUN2NzZjc0RHT0NkWHdMS3BWdXZJckM1TFpSMUlFUUNDL1JU?=
 =?utf-8?B?R0FkSnlKZlE3bS85R0JaM2piM01vNHRCL3VlSzhFTE95cFliTUlQQTBZMmJj?=
 =?utf-8?Q?YD5iGsKCaZjA2SPwbn8A3cU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1d66b1d-4406-43d5-b123-08d9bfff2fc4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 19:14:59.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0Z1O83/iC+kAlFsi/iaszk4rRNtxO9vadktNASYmgrU1hxwJnnOut6CnSrOVrg6yJuocDboNLmbrWWxqI5OhHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
X-Proofpoint-GUID: rIGgfYoclZQjLDIFMtjz6VlbXYQ3OnTk
X-Proofpoint-ORIG-GUID: _wjXNyshBl84S8z6K_MrUgurZfzQC3gM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_11,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=981 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159739



On 12/6/21 17:01, Jon Mason wrote:
> This email is a follow-up from the session held on Friday at the
> OpenEmbedded Developer's Virtual Meeting (see
> https://www.openembedded.org/wiki/OEDVM_Nov_2021)
> 
> The session was not recorded, but the slides can be found at
> https://docs.google.com/presentation/d/146ueVVTMeA8JI43wqv5kFmdYEygqqmfGH0z1VRL2bDA/edit?usp=sharing
> 
> The outcome from the discussion was that inclusive language changes
> are something that we want to accomplish in the kirkstone release
> timeframe (with an exception for the "master" branch name, which will
> be handled at a future date).
> 
> There has already been a pass at collecting the needed changes at
> https://wiki.yoctoproject.org/wiki/Inclusive_language
> 
> This is not as simple as a find/replace of offending words.  There is
> a desire for backward compatibility or to provide some kind of "you
> want X, which is now Y" (which complicates things).
> 
> The intention of this email is to see who is interested in helping
> out.  Once we know how many people are available and what time frames,
> we can plan out a roadmap.  So, please email me (or respond to this
> thread publicly) and I'll add you to the list.  There will then be a
> follow-up zoom call in the next week or so to plan out the roadmap.
> 
I am interested in helping out also.

Another low hanging item might be changing the names of patches that 
include the offensive terms like the following (which I will add to the 
wiki:
meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
meta-openembedded/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
oe-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
oe-core/meta/recipes-core/udev/udev-extraconf/mount.blacklist
Can't really rename this one or we rename it in oe-core but it gets 
named back on the installed system.

meta-secure-core/meta-integrity/files/ima_signing_blacklist
Same as above

meta-secure-core/meta-efi-secure-boot/recipes-bsp/efitools/efitools/Fix-the-wrong-dependency-for-blacklist.esl.patch

We would have to re-generate the patches to have the subject match the 
fixed language.

Sau!


> We will document the roadmap and everything else on the YP wiki page above.
> 
> Questions and comments are welcome, but not interested in debating the
> necessity or timeframe of this task.  It has already been decided.
> 
> Thanks,
> Jon
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94219): https://lists.openembedded.org/g/openembedded-devel/message/94219
> Mute This Topic: https://lists.openembedded.org/mt/87555753/4950653
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Saul.Wold@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


