Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE11EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 21:49:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.401.1689716953120955618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 14:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=T9HR93Y3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6563d21e7a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36ILF0Qx025486
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:49:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from:cc
	:in-reply-to:mime-version; s=PPS06212021; bh=yxL3ETxFXAFkjdsAUCu
	Hv1TKRhNyFLZqcBxlgXBSP0U=; b=T9HR93Y3ezOsJhscj1IyxuV3xLF1toY8tYO
	8OutnualJb/Ep5cKP5/zQ3TzEMMuaYpYcqC1Jofal9chheTMTA4TlBDZ74kb9syp
	KOQ1L3UjmoZnXA4Vy6s2/VNiOCAJ/PW+S7DLhQk3PN3Va6uCMYb2Mo3HG5ws7StH
	jrEgzE4zk1fOw8z7hlej9Cg72BXqEsZT19e5bA/ZGECuKol6eirK4Y6CXwAXEg/5
	oERnQuEb7Qeb7/rTRy+52pF1nAkXfR/lE5dxuFZZ/uFkemWlxi8fro1cn0Y5uXOc
	q+A5O5gqYTlI5XHJXYCqsqKINKnYJi/CwwUiwAgA3FbBRxZUMAA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqyb3da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:49:12 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36ILnBaI026120;
	Tue, 18 Jul 2023 14:49:11 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqyb3d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 14:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwPa7iQu9RcMYUD8nyL1hIcjvJ+MJjwVq0jse8DmtisY9XlsQcGjDYURSyVgBKVd+01qHLY+AsrXJJr6GUsbD6Sf+3c2UnDbE4p1LMB3Z12f7uw1ACZbRLcIdT7HnlzLHoDPwxfaFAQvJYyjiXYm9kCRf1T+9IYtr0y1zFsMqapSeUc3y6pZpgNEqcIQdnr+8I/TDR8XC+qv3+obJ3M8eR0TAjtBBLd7h3bzgEDwmqbs4AQIqKUBBQxdLu9QDUcZHVXE8v+MMb2VNdCKjUBMhJQ/DoUw9ok2h4gZZFeK7i7F5C57x3epEBZQqZBx7PDYpEkGYxkizATnhxtE2UjqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxL3ETxFXAFkjdsAUCuHv1TKRhNyFLZqcBxlgXBSP0U=;
 b=M5Zwg8Q0HxoapXKxd2MmYLGPbQ8VvOIT2tU86ww5MHWSa+o38q1rBnZcpaJnWTT52fmkQgME/JJPVE+JzuEjz0jZmOZGQE/UAMGVCGqcEYpm0QJExqKjZwLK1/+WYY5jAou6jsQ+jcuETjdZc+sNepM+OClpM9j9Hx8FBrY2Fvol7OfT2tXeDx10SJQ3WhmbUGr/fBDqXoDbxO88mfMDFgdEqxI+0maeOEw18vRWyAF/9WylQm2GSncfXxaxFB+6Jqms9YUXcuYITA8nBXT/a/6fWvXqSb1e1tersCgvv3hGRQJl82x3d64Xut44I2VS8EtBzBp+b1I4DXvG5bjjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 21:49:04 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 21:49:03 +0000
Content-Type: multipart/alternative;
 boundary="------------gtl0A8QWxEYvdBUzShiG26om"
Message-ID: <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
Date: Tue, 18 Jul 2023 17:48:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][mickledore 02/26] dmidecode: fix CVE-2023-30630
Content-Language: en-CA
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
        Yogita.Urade@windriver.com
References: <cover.1689373875.git.steve@sakoman.com>
 <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: Kang Kai <kai.kang@windriver.com>
In-Reply-To: <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 40eb0cb3-ad10-4190-146a-08db87d8cd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bhVLIC7j5Vapdz0SWzDKa3j3TMSSxcd2GZyeBmppQywIlgxPgBdwaW70hn3UBUXT8mUuUaTjvO8Qugp9Wi8inhQPdY/7MTuq+1/UxLJ5BhEB4e6DSAAxzBjSZu9uCrzUk1XT1pj2woL/IDN+8Ewe9id/UeZQyCew/sKqNMwdBPvytunykenM8ReCiN21NT+j5vbbnoEsQGm8E7R4BZiizMnAHbSFeENJbr5h+AeAb7KYNbNqPDgMa8mi4/fiOU4vRHP2j5FrKtIz4jh2/5GKUGkfGxVi1SuSYNrK0EBc6CFH+hTrmxsOpOU/ePUXqsVvK2zd/kHCr0nqGQQ8B/KGPI2n+j2lAwqY+qn/qpi7Ia5iY8ylhqLg4GvrIqBhaZHunhP7PZM4Bs5Zuva9auPeIDFPW/a8iOghfAxD3PYqtpZH1J4R7sYAXOerRcEzaayl7ME0VHa9DqgFs9pkjmSiFMFPWe2CLA4hUPzjS8eASmIX+tPweObJTshj5zRHdovBEVq4Qb8jEdbf+YWretlnPn/A7x61n85KEzFa1CeH3AyrZqZOzJZUZBlLBAp91DMxqO4VmVdV+RItNCRuV8L1So5tpS8BeyoTXwGvHnputhXpHPFdDj/VIDvjZ7ICU9ONNi/stUm9ywGqqV6KOZXEuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(396003)(136003)(366004)(451199021)(2906002)(6512007)(38100700002)(966005)(2616005)(166002)(83380400001)(186003)(6506007)(107886003)(5660300002)(26005)(86362001)(31696002)(53546011)(36756003)(8676002)(30864003)(21615005)(4326008)(478600001)(33964004)(6666004)(6486002)(316002)(66476007)(66946007)(8936002)(6636002)(66556008)(41300700001)(31686004)(66899021)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzlPQVJvVXowaHBaak1OZXViWmRhUjF5LzdzaG54N2VoNE9IUEZYaTdSbkhS?=
 =?utf-8?B?VWRjK0NNVEJDbFcxM1BWTUVlRXdEU0FLdHNYS3M3dElOMnc0QkQzZWZkUzBW?=
 =?utf-8?B?V1VkTEFKcldOdWYwZGJnZkdHWHRpK2pXeU83REZNcXlBclhsVERadHFSMHgr?=
 =?utf-8?B?UTJ5RUhLUURwUERNOVNuRGo5NWVtQ1ZTRVpjaTlOazU2a3JQN1NEUGlMQTVx?=
 =?utf-8?B?OXBST0FHb3dLWFhiNy9ZdUNzT2xDZGZLSkZSN2oyczNzdjQraEZXMExSMUFv?=
 =?utf-8?B?dEsrUE9rK0hwdHZRMCsreTBEVUt1NjZLRnVEQW03VWduem04dGZaNmk2T05j?=
 =?utf-8?B?QWhTZmlHcUtnKzNNdFgzTzR6dENzT283Uk1YYzNKdUV3SnJPY0NIRkR0OFBw?=
 =?utf-8?B?c05VTmdNZ29POGVDWHcyenFKR2grUzN0WFl3b3VESXRidkVtVzl4bDVNeEE0?=
 =?utf-8?B?RkpjQU16ZVYzaGF0VEZ4VDhKdXl4ZzhkczdxQUhYOE1Pbk9Tb3lKRWtVSjh5?=
 =?utf-8?B?U2t0TnZ3eFd3bXpiMW5SWFBSKzNiV3VZa1VvTG9BNzEwd0s3T2d5U2VLS2Ro?=
 =?utf-8?B?OUc3VDVVYXJwY3FMY0lQNWpiUHVuUXJRSTlWbENJV1MvNU9HQUlycUJCSEJO?=
 =?utf-8?B?QWNSdUdES1dVc1k0Y1NaMHhYZkU1Q1QyRjRqQi9DSW1adDRjOUZHNUlBbXgx?=
 =?utf-8?B?UVdkdU1JcjlJMlcwOEM4eXpVc2x5bU50T1NieWsyb1VyYXJQaWYxL2ZKNFBr?=
 =?utf-8?B?elYwWW91OWk4MVBJQk5Wck1uVGZoWmtOUUtsNTEyMkdtdi9Rcy84MHlmWmVB?=
 =?utf-8?B?VHNvQkxVQmJhekNBNmZWSWIrT0tZT0JmS04xcUQzY2lhc212L2ZDd3NnVWFr?=
 =?utf-8?B?elkwY0k5YXhQSUF0ckRQRDN0UndmNHFhallsdUN4WG4wRW9hUzYvZy82Z0JT?=
 =?utf-8?B?NTJEZitiNGkxT25LSWw3S2FnVUtaUC82cG5oWXNsNnBrUFhHUE5IRlFKK0Rx?=
 =?utf-8?B?RnlUbElNdFlSM3MwSmhva2ViNWdvTjdYRC8rZ1FDekJ0dGJ0dDBtbzZLWTRO?=
 =?utf-8?B?Z3dRRDV2dTVNN3psdm80VXlPckhrbEZJVjJXZlN2MEo4QUdETXVNUG4vbmdk?=
 =?utf-8?B?WEhzVkR3WGt5WURuamk3SmNUVURQMTYwUEdRODNHS3llMlQ0WjRMRUZMNFZO?=
 =?utf-8?B?VEhsdDJmWWF4dFZVZzR2NHYxNmxFMGREZTA3Qmc0WW14STVUY1ZQRmw2M2JL?=
 =?utf-8?B?NHl3VytGNDV4M2RiS1Ryc2p5WEY5cTcvUTNsSjFDVUl1U1ZVSlRIT1N6dUpB?=
 =?utf-8?B?VVpoS244eGpLSDd4SVdRSWdMQU1tS1RZdGZuY2NpSmZtWURyY1BwY3RrUS9E?=
 =?utf-8?B?TjRqWDZGc0oyeVJzaWNIUTdXemxTL3dDYXhCR2NDRzFhNnBPcmpUOFlKYnJp?=
 =?utf-8?B?UGM5MHZVbGJTVmJaT1RwMXJoSWdCNkNxSS93bDNER1YrVG92SGZwLy9xUSsy?=
 =?utf-8?B?Ui9tdVdXZENkUkJZSHA3cnpWUWsxMnhjZ1NFYWxJRVp0RmRtTEx5bzc4Zkxa?=
 =?utf-8?B?dGFkOENpaHgxSG9XeFhCbEM0NWl5N1FMUFdTU1FQUWZZL2YxVDJKMzVDcGVs?=
 =?utf-8?B?bDhZSDJaaG4vbkxpNDR6eFlZQ1ZIcHltTzNybHhyUkFoZjYvZ081d2w3NE9Z?=
 =?utf-8?B?S0JQa0VqeldIUmd6VHBGUkRrNERDQVhnWllIZnIwTkpYbEpjOXJxdy9vTnBj?=
 =?utf-8?B?MjA2UE9Tb3I1VTBrRHNhMnU4OUlDVHJxeEE5K3gvSkhSeWdpQUdwMFcyV3VC?=
 =?utf-8?B?SlBJbUk4ZWpmOTBkbzRkd3VjRWUyNklHQWVCOXdtL3JqU25pQ1Q5aUNiRVlS?=
 =?utf-8?B?bjZSR1lWbER2SEZOeTg2Zy9TYzhHaFRicXBWbzN6UkVieUZ2QSsreEsraFZp?=
 =?utf-8?B?SlczeUEvZVlHbFUzS3ZEQi9SNnU3Z2FrTmRIY0xIMmJGNXY0NlZMR3BwbGhQ?=
 =?utf-8?B?MVd0RFJuMzc4cmZRZnFCZ2ttRG45aXBxdExjazgwOVhqdDZYOEYyN0o4QTBx?=
 =?utf-8?B?Z3RKZ1VPMUdkcUZtZFd6dmN6VUFCQnhrRVVmQW8yQ2UrNE50NCs5bjhCQURL?=
 =?utf-8?B?ejhZOFhtTy9xSHYrV3VrR2RzdTZ0U3RVT3VZUGdFeS95U3pmVUR5Tzl0QkZG?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eb0cb3-ad10-4190-146a-08db87d8cd57
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 21:49:03.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSQAOR4Fa2A/akQAeVo7zQ/UIMfMEQzH5bc/zVHjnohl8ZI73uHddOg9aVIG2QhTjeQ64xd62rlcOr/Eh0YssmAPDoQWIbC8p8yWGOQgL7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
X-Proofpoint-GUID: n_CvjlkyINXrtW7DRafqUYu7puM14-CV
X-Proofpoint-ORIG-GUID: SJz_H7fRXF34_9csY5royyWnCsznj6OM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_17,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307180197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 21:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184560

--------------gtl0A8QWxEYvdBUzShiG26om
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36ILF0Qx025486

Add Kai,

On 2023-07-14 18:32, Steve Sakoman via lists.openembedded.org wrote:
> From: Yogita Urade<yogita.urade@windriver.com>
>
> Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
> This has security relevance because, for example, execution of
> Dmidecode via Sudo is plausible.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-30630
> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016.=
html
> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017.=
html
>
> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   .../dmidecode/CVE-2023-30630_1.patch          | 237 +++++++++++++++++=
+
>   .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
>   .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
>   .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++


Summary:

 =C2=A0 =C2=A0 I think this can merge but we should agree on how to handl=
e dmidecode.


Details:

These changes work but it's bringing back 4 patches rather than bumping=20
the version to 3.5
and picking up 2 patches. My conclusion is that it's okay but we should=20
probably talk
about how to maintain dmidecode since it just produces a bunch of=20
programs for dumping
HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can probably=20
update to 3.5
( or even 3.6 when that's out).

Do you agree Steve?


The patches back-ported are:

=E2=9D=AF rg -i "subject: \[PATCH\]" /tmp/dmidecode-mickledore-cve.eml
201:+Subject: [PATCH] dmidecode: Write the whole dump file at once
444:+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an=20
existing file
531:+Subject: [PATCH] Consistently use read_file() when reading from a=20
dump file
606:+Subject: [PATCH] Don't read beyond sysfs entry point buffer


Two of these patches would be picked up if we update mickledore to 3.5 -=20
so let's look at what changed:

=E2=9D=AF git log --oneline dmidecode-3-4..dmidecode-3-5

484f893 (tag: dmidecode-3-5) Set the version to 3.5
8baf2f5 Fix a build warning when USE_MMAP isn't set
b9ebecc dmioem: HPE type 242: Fix ID on 32-bit systems
189ca35 Ensure /dev/mem is a character device file
8427888 dmidecode: Use the right variable for -s=20
bios-revision/firmware-revision
6ca381c dmidecode: Do not let --dump-bin overwrite an existing file=20
<---------- Added.
d8cfbc8 dmidecode: Write the whole dump file at=20
once=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <--------=
-- Added.
39b2dd7 dmidecode: Split table fetching from decoding
11b168f dmioem: Avoid intermediate buffer (HPE type 216)
9d2bbd5 dmioem: Decode HPE OEM Record 216
3d68350 dmidecode: Drop the CPUID exception list
c1a2520 dmidecode: Add a --no-quirks option
67dc0b2 dmidecode: Fortify entry point length checks
f801673 dmioem: Typo fix (Virutal -> Virtual)
90d1323 dmioem: Decode HPE OEM Record 242
f50b925 dmioem: Update HPE OEM Record 238
ac24b67 dmioem: Decode HPE OEM Record 230
c3357b5 dmioem: Fix segmentation fault in dmi_hp_240_attr()
a1a2258 dmioem: Decode HPE OEM Record 224
fb8766a NEWS: Fix typo


My summary of the changes above:

 =C2=A0- support additional HW,

 =C2=A0-=C2=A0 fix bugs, typos and build warnings.

 =C2=A0- internal program restructuring: 39b2dd7 dmidecode: Split table=20
fetching from decoding

I was a bit concerned about:

 =C2=A0=C2=A0 3d68350 dmidecode: Drop the CPUID exception list

but it's pretty arcane (1) and only affects HW from 2008 or earlier

so we should be okay with that change!


Steve,

Do you agree?

Thanks,

../Randy



1)

commit 3d6835047f80691678e5db3127f9d573956413f0
Author: Jean Delvare <jdelvare@suse.de>
Date:=C2=A0=C2=A0 Fri Dec 16 04:37:04 2022

 =C2=A0=C2=A0=C2=A0 dmidecode: Drop the CPUID exception list

 =C2=A0=C2=A0=C2=A0 Back in 2003, I had a system where the CPU type was n=
ot set. I added
 =C2=A0=C2=A0=C2=A0 a quirk so that it would still be recognized as x86, =
and the CPUID
 =C2=A0=C2=A0=C2=A0 could be decoded.

 =C2=A0=C2=A0=C2=A0 A few more exceptions where added over the years, but=
 in effect, the
 =C2=A0=C2=A0=C2=A0 list was last modified in 2008.

 =C2=A0=C2=A0=C2=A0 Having such an exception list isn't actually a good i=
dea, for the
 =C2=A0=C2=A0=C2=A0 following reasons:
 =C2=A0=C2=A0=C2=A0=C2=A0 * It requires endless maintenance work if we wa=
nt to keep it
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 up-to-date.
 =C2=A0=C2=A0=C2=A0=C2=A0 * It adds some (admittedly minimal) burden to t=
he sane systems.
 =C2=A0=C2=A0=C2=A0=C2=A0 * If we were to add more entries to the excepti=
on list, it wouldn't
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scale well (linear algorithmic comp=
lexity). This could be improved
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but at the cost of more complex cod=
e.
 =C2=A0=C2=A0=C2=A0=C2=A0 * It sends the wrong message to the hardware ma=
nufacturers ("You can
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get things wrong, we'll add a worka=
round on our side.")

 =C2=A0=C2=A0=C2=A0 Therefore I would like to get rid of this exception l=
ist. Doing so
 =C2=A0=C2=A0=C2=A0 has the nice side effect of simplifying the code and =
making the
 =C2=A0=C2=A0=C2=A0 binary smaller.

 =C2=A0=C2=A0=C2=A0 If anyone really needs the CPUID information on such =
non-compliant
 =C2=A0=C2=A0=C2=A0 systems, there are other ways to retrieve it, such as=
 lscpu or
 =C2=A0=C2=A0=C2=A0 /proc/cpuinfo.

https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D3d6835047=
f80691678e5db3127f9d573956413f0



>   .../dmidecode/dmidecode_3.4.bb                |   4 +
>   5 files changed, 528 insertions(+)
>   create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023=
-30630_1.patch
>   create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023=
-30630_2.patch
>   create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023=
-30630_3.patch
>   create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023=
-30630_4.patch
>
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1=
.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> new file mode 100644
> index 0000000000..53480d6299
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> @@ -0,0 +1,237 @@
> +From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 200=
1
> +From: Jean Delvare<jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 09:40:23 +0000
> +Subject: [PATCH] dmidecode: Write the whole dump file at once
> +
> +When option --dump-bin is used, write the whole dump file at once,
> +instead of opening and closing the file separately for the table
> +and then for the entry point.
> +
> +As the file writing function is no longer generic, it gets moved
> +from util.c to dmidecode.c.
> +
> +One minor functional change resulting from the new implementation is
> +that the entry point is written first now, so the messages printed
> +are swapped.
> +
> +Signed-off-by: Jean Delvare<jdelvare@suse.de>
> +Reviewed-by: Jerry Hoemann<jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Reference:https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b92=
0e96ed832cfb4bdd664e808
> +
> +Upstream-Status: Backport [https://github.com/mirror/dmidecode/commit/=
d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++-------------=
-
> + util.c      | 40 ---------------------------
> + util.h      |  1 -
> + 3 files changed, 58 insertions(+), 62 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 9aeff91..5477309 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_=
header *h, const u8 *data, u16 ver
> +	}
> + }
> +
> +-static void dmi_table_dump(const u8 *buf, u32 len)
> ++static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
> ++			  u32 table_len)
> + {
> ++	FILE *f;
> ++
> ++	f =3D fopen(opt.dumpfile, "wb");
> ++	if (!f)
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("fopen");
> ++		return -1;
> ++	}
> ++
> ++	if (!(opt.flags & FLAG_QUIET))
> ++		pr_comment("Writing %d bytes to %s.", ep_len, opt.dumpfile);
> ++	if (fwrite(ep, ep_len, 1, f) !=3D 1)
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("fwrite");
> ++		goto err_close;
> ++	}
> ++
> ++	if (fseek(f, 32, SEEK_SET) !=3D 0)
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("fseek");
> ++		goto err_close;
> ++	}
> ++
> +	if (!(opt.flags & FLAG_QUIET))
> +-		pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
> +-	write_dump(32, len, buf, opt.dumpfile, 0);
> ++		pr_comment("Writing %d bytes to %s.", table_len, opt.dumpfile);
> ++	if (fwrite(table, table_len, 1, f) !=3D 1)
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("fwrite");
> ++		goto err_close;
> ++	}
> ++
> ++	if (fclose(f))
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("fclose");
> ++		return -1;
> ++	}
> ++
> ++	return 0;
> ++
> ++err_close:
> ++	fclose(f);
> ++	return -1;
> + }
> +
> + static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 =
flags)
> +@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 =
num, u32 ver, const char *devmem,
> +		return;
> +	}
> +
> +-	if (opt.flags & FLAG_DUMP_BIN)
> +-		dmi_table_dump(buf, len);
> +-	else
> +-		dmi_table_decode(buf, len, num, ver >> 8, flags);
> +-
> +	free(buf);
> + }
> +
> +@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
> +
> + static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> +-	u32 ver;
> ++	u32 ver, len;
> +	u64 offset;
> ++	u8 *table;
> +
> +	/* Don't let checksum run beyond the buffer */
> +	if (buf[0x06] > 0x20)
> +@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *=
devmem, u32 flags)
> +		memcpy(crafted, buf, 32);
> +		overwrite_smbios3_address(crafted);
> +
> +-		if (!(opt.flags & FLAG_QUIET))
> +-			pr_comment("Writing %d bytes to %s.", crafted[0x06],
> +-				   opt.dumpfile);
> +-		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
> ++		dmi_table_dump(crafted, crafted[0x06], table, len);
> +	}
> +
> +	return 1;
> +@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *d=
evmem, u32 flags)
> + static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> +	u16 ver;
> ++	u32 len;
> ++        u8 *table;
> +
> +	/* Don't let checksum run beyond the buffer */
> +	if (buf[0x05] > 0x20)
> +@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *d=
evmem, u32 flags)
> +		memcpy(crafted, buf, 32);
> +		overwrite_dmi_address(crafted + 0x10);
> +
> +-		if (!(opt.flags & FLAG_QUIET))
> +-			pr_comment("Writing %d bytes to %s.", crafted[0x05],
> +-				   opt.dumpfile);
> +-		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
> ++		dmi_table_dump(crafted, crafted[0x05], table, len);
> +	}
> +
> +	return 1;
> +@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *de=
vmem, u32 flags)
> +
> + static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> ++	u32 len;
> ++	u8 *table;
> ++
> +	if (!checksum(buf, 0x0F))
> +		return 0;
> +
> +@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *d=
evmem, u32 flags)
> +		memcpy(crafted, buf, 16);
> +		overwrite_dmi_address(crafted);
> +
> +-		if (!(opt.flags & FLAG_QUIET))
> +-			pr_comment("Writing %d bytes to %s.", 0x0F,
> +-				   opt.dumpfile);
> +-		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
> ++		dmi_table_dump(crafted, 0x0F, table, len);
> +	}
> +
> +	return 1;
> +diff --git a/util.c b/util.c
> +index 04aaadd..1547096 100644
> +--- a/util.c
> ++++ b/util.c
> +@@ -259,46 +259,6 @@ out:
> +	return p;
> + }
> +
> +-int write_dump(size_t base, size_t len, const void *data, const char =
*dumpfile, int add)
> +-{
> +-	FILE *f;
> +-
> +-	f =3D fopen(dumpfile, add ? "r+b" : "wb");
> +-	if (!f)
> +-	{
> +-		fprintf(stderr, "%s: ", dumpfile);
> +-		perror("fopen");
> +-		return -1;
> +-	}
> +-
> +-	if (fseek(f, base, SEEK_SET) !=3D 0)
> +-	{
> +-		fprintf(stderr, "%s: ", dumpfile);
> +-		perror("fseek");
> +-		goto err_close;
> +-	}
> +-
> +-	if (fwrite(data, len, 1, f) !=3D 1)
> +-	{
> +-		fprintf(stderr, "%s: ", dumpfile);
> +-		perror("fwrite");
> +-		goto err_close;
> +-	}
> +-
> +-	if (fclose(f))
> +-	{
> +-		fprintf(stderr, "%s: ", dumpfile);
> +-		perror("fclose");
> +-		return -1;
> +-	}
> +-
> +-	return 0;
> +-
> +-err_close:
> +-	fclose(f);
> +-	return -1;
> +-}
> +-
> + /* Returns end - start + 1, assuming start < end */
> + u64 u64_range(u64 start, u64 end)
> + {
> +diff --git a/util.h b/util.h
> +index 3094cf8..ef24eb9 100644
> +--- a/util.h
> ++++ b/util.h
> +@@ -27,5 +27,4 @@
> + int checksum(const u8 *buf, size_t len);
> + void *read_file(off_t base, size_t *len, const char *filename);
> + void *mem_chunk(off_t base, size_t len, const char *devmem);
> +-int write_dump(size_t base, size_t len, const void *data, const char =
*dumpfile, int add);
> + u64 u64_range(u64 start, u64 end);
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2=
.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> new file mode 100644
> index 0000000000..dcc87d2326
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> @@ -0,0 +1,81 @@
> +From 6ca381c1247c81f74e1ca4e7706f70bdda72e6f2 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare<jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:03:53 +0000
> +Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existin=
g file
> +
> +Make sure that the file passed to option --dump-bin does not already
> +exist. In practice, it is rather unlikely that an honest user would
> +want to overwrite an existing dump file, while this possibility
> +could be used by a rogue user to corrupt a system file.
> +
> +Signed-off-by: Jean Delvare<jdelvare@suse.de>
> +Reviewed-by: Jerry Hoemann<jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport
> +[https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e770=
6f70bdda72e6f2]
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + dmidecode.c     | 14 ++++++++++++--
> + man/dmidecode.8 |  3 ++-
> + 2 files changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 5477309..98f9692 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -60,6 +60,7 @@
> +  *https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
> +  */
> +
> ++#include <fcntl.h>
> + #include <stdio.h>
> + #include <string.h>
> + #include <strings.h>
> +@@ -5430,13 +5431,22 @@ static void dmi_table_string(const struct dmi_=
header *h, const u8 *data, u16 ver
> + static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
> +			  u32 table_len)
> + {
> ++	int fd;
> +	FILE *f;
> +
> +-	f =3D fopen(opt.dumpfile, "wb");
> ++	fd =3D open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
> ++	if (fd =3D=3D -1)
> ++	{
> ++		fprintf(stderr, "%s: ", opt.dumpfile);
> ++		perror("open");
> ++		return -1;
> ++	}
> ++
> ++	f =3D fdopen(fd, "wb");
> +	if (!f)
> +	{
> +		fprintf(stderr, "%s: ", opt.dumpfile);
> +-		perror("fopen");
> ++		perror("fdopen");
> +		return -1;
> +	}
> +
> +diff --git a/man/dmidecode.8 b/man/dmidecode.8
> +index ed066b3..3a732c0 100644
> +--- a/man/dmidecode.8
> ++++ b/man/dmidecode.8
> +@@ -1,4 +1,4 @@
> +-.TH DMIDECODE 8 "January 2019" "dmidecode"
> ++.TH DMIDECODE 8 "February 2023" "dmidecode"
> + .\"
> + .SH NAME
> + dmidecode \- \s-1DMI\s0 table decoder
> +@@ -159,6 +159,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainl=
y useful for debugging.
> + Do not decode the entries, instead dump the DMI data to a file in bin=
ary
> + form. The generated file is suitable to pass to \fB--from-dump\fP
> + later.
> ++\fIFILE\fP must not exist.
> + .TP
> + .BR "  " "  " "--from-dump \fIFILE\fP"
> + Read the DMI data from a binary file previously generated using
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3=
.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> new file mode 100644
> index 0000000000..01d0d1f867
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> @@ -0,0 +1,69 @@
> +From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare<jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:25:50 +0000
> +Subject: [PATCH] Consistently use read_file() when reading from a dump=
 file
> +
> +Use read_file() instead of mem_chunk() to read the entry point from a
> +dump file. This is faster, and consistent with how we then read the
> +actual DMI table from that dump file.
> +
> +This made no functional difference so far, which is why it went
> +unnoticed for years. But now that a file type check was added to the
> +mem_chunk() function, we must stop using it to read from regular
> +files.
> +
> +This will again allow root to use the --from-dump option.
> +
> +Signed-off-by: Jean Delvare<jdelvare@suse.de>
> +Tested-by: Jerry Hoemann<jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidec=
ode.git/commit/?id=3Dc76ddda0ba0aa99a55945e3290095c2ec493c892]
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + dmidecode.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 98f9692..b4dbc9d 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
> +		pr_comment("dmidecode %s", VERSION);
> +
> +	/* Read from dump if so instructed */
> ++        size =3D 0x20;
> +	if (opt.flags & FLAG_FROM_DUMP)
> +	{
> +		if (!(opt.flags & FLAG_QUIET))
> +			pr_info("Reading SMBIOS/DMI data from file %s.",
> +				opt.dumpfile);
> +-		if ((buf =3D mem_chunk(0, 0x20, opt.dumpfile)) =3D=3D NULL)
> ++                if ((buf =3D read_file(0, &size, opt.dumpfile)) =3D=3D=
 NULL)
> +		{
> +			ret =3D 1;
> +			goto exit_free;
> +		}
> +
> ++                /* Truncated entry point can't be processed */
> ++                if (size < 0x20)
> ++                {
> ++                        ret =3D 1;
> ++                        goto done;
> ++                }
> ++
> +		if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +		{
> +			if (smbios3_decode(buf, opt.dumpfile, 0))
> +@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
> +	 * contain one of several types of entry points, so read enough for
> +	 * the largest one, then determine what type it contains.
> +	 */
> +-	size =3D 0x20;
> +	if (!(opt.flags & FLAG_NO_SYSFS)
> +	 && (buf =3D read_file(0, &size, SYS_ENTRY_FILE)) !=3D NULL)
> +	{
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4=
.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> new file mode 100644
> index 0000000000..5fa72b4f9b
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> @@ -0,0 +1,137 @@
> +From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare<jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:58:11 +0000
> +Subject: [PATCH] Don't read beyond sysfs entry point buffer
> +
> +Functions smbios_decode() and smbios3_decode() include a check
> +against buffer overrun. This check assumes that the buffer length is
> +always 32 bytes. This is true when reading from /dev/mem or from a
> +dump file, however when reading from sysfs, the buffer length is the
> +size of the actual sysfs attribute file, typically 31 bytes for an
> +SMBIOS 2.x entry point and 24 bytes for an SMBIOS 3.x entry point.
> +
> +In the unlikely event of a malformed entry point, with encoded length
> +larger than expected but smaller than or equal to 32, we would hit a
> +buffer overrun. So properly pass the actual buffer length as an
> +argument and perform the check against it.
> +
> +In practice, this will never happen, because on the Linux kernel
> +side, the size of the sysfs attribute file is decided from the entry
> +point length field. So it is technically impossible for them not to
> +match. But user-space code should not make such assumptions.
> +
> +Signed-off-by: Jean Delvare<jdelvare@suse.de>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport
> +[https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D2b83c=
4b898f8325313162f588765411e8e3e5561]
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + dmidecode.c | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index b4dbc9d..870d94e 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
> +	buf[0x17] =3D 0;
> + }
> +
> +-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> ++static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem=
, u32 flags)
> + {
> +	u32 ver, len;
> +	u64 offset;
> +	u8 *table;
> +
> +	/* Don't let checksum run beyond the buffer */
> +-	if (buf[0x06] > 0x20)
> ++        if (buf[0x06] > buf_len)
> +	{
> +		fprintf(stderr,
> +			"Entry point length too large (%u bytes, expected %u).\n",
> +@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char =
*devmem, u32 flags)
> +	return 1;
> + }
> +
> +-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> ++static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem,=
 u32 flags)
> + {
> +	u16 ver;
> +	u32 len;
> +         u8 *table;
> +
> +	/* Don't let checksum run beyond the buffer */
> +-	if (buf[0x05] > 0x20)
> ++        if (buf[0x05] > buf_len)
> +	{
> +		fprintf(stderr,
> +			"Entry point length too large (%u bytes, expected %u).\n",
> +@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
> +
> +		if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +		{
> +-			if (smbios3_decode(buf, opt.dumpfile, 0))
> ++                        if (smbios3_decode(buf, size, opt.dumpfile, 0=
))
> +				found++;
> +		}
> +		else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> +		{
> +-			if (smbios_decode(buf, opt.dumpfile, 0))
> ++                        if (smbios_decode(buf, size, opt.dumpfile, 0)=
)
> +				found++;
> +		}
> +		else if (memcmp(buf, "_DMI_", 5) =3D=3D 0)
> +@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
> +			pr_info("Getting SMBIOS data from sysfs.");
> +		if (size >=3D 24 && memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +		{
> +-			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
> ++                        if (smbios3_decode(buf, size, SYS_TABLE_FILE,=
 FLAG_NO_FILE_OFFSET))
> +				found++;
> +		}
> +		else if (size >=3D 31 && memcmp(buf, "_SM_", 4) =3D=3D 0)
> +		{
> +-			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
> ++                        if (smbios_decode(buf, size, SYS_TABLE_FILE, =
FLAG_NO_FILE_OFFSET))
> +				found++;
> +		}
> +		else if (size >=3D 15 && memcmp(buf, "_DMI_", 5) =3D=3D 0)
> +@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
> +
> +	if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +	{
> +-		if (smbios3_decode(buf, opt.devmem, 0))
> ++                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
> +			found++;
> +	}
> +	else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> +	{
> +-		if (smbios_decode(buf, opt.devmem, 0))
> ++                if (smbios_decode(buf, 0x20, opt.devmem, 0))
> +			found++;
> +	}
> +	goto done;
> +@@ -6114,7 +6114,7 @@ memory_scan:
> +	{
> +		if (memcmp(buf + fp, "_SM3_", 5) =3D=3D 0)
> +		{
> +-			if (smbios3_decode(buf + fp, opt.devmem, 0))
> ++                        if (smbios3_decode(buf + fp, 0x20, opt.devmem=
, 0))
> +			{
> +				found++;
> +				goto done;
> +@@ -6127,7 +6127,7 @@ memory_scan:
> +	{
> +		if (memcmp(buf + fp, "_SM_", 4) =3D=3D 0 && fp <=3D 0xFFE0)
> +		{
> +-			if (smbios_decode(buf + fp, opt.devmem, 0))
> ++                        if (smbios_decode(buf + fp, 0x20, opt.devmem,=
 0))
> +			{
> +				found++;
> +				goto done;
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/re=
cipes-devtools/dmidecode/dmidecode_3.4.bb
> index bc741046dd..4d5255df64 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
> @@ -6,6 +6,10 @@ LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>  =20
>   SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
>              file://0001-Committing-changes-from-do_unpack_extra.patch =
 \
> +file://CVE-2023-30630_1.patch  \
> +file://CVE-2023-30630_2.patch  \
> +file://CVE-2023-30630_3.patch  \
> +file://CVE-2023-30630_4.patch  \
>              "
>  =20
>   COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-li=
nux"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184284):https://lists.openembedded.org/g/openembedd=
ed-core/message/184284
> Mute This Topic:https://lists.openembedded.org/mt/100151225/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------gtl0A8QWxEYvdBUzShiG26om
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36ILF0Qx025486

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Kai,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-07-14 18:32, Steve Sakoman via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:f92e59a0894145a828dc9ac74bf8c7a=
9355e0587.1689373876.git.steve@sakoman.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Yogita Urade <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:yogita.urade@windriver.com">&lt;yo=
gita.urade@windriver.com&gt;</a>

Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
This has security relevance because, for example, execution of
Dmidecode via Sudo is plausible.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2023-30630">https://nvd.nist.gov/vuln/detail/CVE-2023-30630</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.nongnu.org/archi=
ve/html/dmidecode-devel/2023-04/msg00016.html">https://lists.nongnu.org/a=
rchive/html/dmidecode-devel/2023-04/msg00016.html</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.nongnu.org/archi=
ve/html/dmidecode-devel/2023-04/msg00017.html">https://lists.nongnu.org/a=
rchive/html/dmidecode-devel/2023-04/msg00017.html</a>

Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
Signed-off-by: Steve Sakoman <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
 .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
 .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Summary:</p>
    <p>&nbsp; &nbsp; I think this can merge but we should agree on how to=
 handle
      dmidecode.</p>
    <p><br>
    </p>
    <p>Details:<br>
    </p>
    <p>These changes work but it's bringing back 4 patches rather than
      bumping the version to 3.5<br>
      and picking up 2 patches. My conclusion is that it's okay but we
      should probably talk<br>
      about how to maintain dmidecode since it just produces a bunch of
      programs for dumping<br>
      HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can
      probably update to 3.5 <br>
      ( or even 3.6 when that's out).</p>
    <p>Do you agree Steve?</p>
    <p><br>
    </p>
    <p>The patches back-ported are:<br>
    </p>
    <p>=E2=9D=AF rg -i &quot;subject: \[PATCH\]&quot; /tmp/dmidecode-mick=
ledore-cve.eml <br>
      201:+Subject: [PATCH] dmidecode: Write the whole dump file at once<=
br>
      444:+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite
      an existing file<br>
      531:+Subject: [PATCH] Consistently use read_file() when reading
      from a dump file<br>
      606:+Subject: [PATCH] Don't read beyond sysfs entry point buffer<br=
>
    </p>
    <p><br>
    </p>
    <p>Two of these patches would be picked up if we update mickledore
      to 3.5 - so let's look at what changed:<br>
    </p>
    <p>=E2=9D=AF git log --oneline dmidecode-3-4..dmidecode-3-5</p>
    <p>484f893 (tag: dmidecode-3-5) Set the version to 3.5<br>
      8baf2f5 Fix a build warning when USE_MMAP isn't set<br>
      b9ebecc dmioem: HPE type 242: Fix ID on 32-bit systems<br>
      189ca35 Ensure /dev/mem is a character device file<br>
      8427888 dmidecode: Use the right variable for -s
      bios-revision/firmware-revision<br>
      6ca381c dmidecode: Do not let --dump-bin overwrite an existing
      file &lt;---------- Added.<br>
      d8cfbc8 dmidecode: Write the whole dump file at
      once&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;---------- Added.<br>
      39b2dd7 dmidecode: Split table fetching from decoding<br>
      11b168f dmioem: Avoid intermediate buffer (HPE type 216)<br>
      9d2bbd5 dmioem: Decode HPE OEM Record 216<br>
      3d68350 dmidecode: Drop the CPUID exception list<br>
      c1a2520 dmidecode: Add a --no-quirks option<br>
      67dc0b2 dmidecode: Fortify entry point length checks<br>
      f801673 dmioem: Typo fix (Virutal -&gt; Virtual)<br>
      90d1323 dmioem: Decode HPE OEM Record 242<br>
      f50b925 dmioem: Update HPE OEM Record 238<br>
      ac24b67 dmioem: Decode HPE OEM Record 230<br>
      c3357b5 dmioem: Fix segmentation fault in dmi_hp_240_attr()<br>
      a1a2258 dmioem: Decode HPE OEM Record 224<br>
      fb8766a NEWS: Fix typo</p>
    <p><br>
    </p>
    <p>My summary of the changes above: <br>
    </p>
    <p>&nbsp;- support additional HW,</p>
    <p>&nbsp;-&nbsp; fix bugs, typos and build warnings.</p>
    <p>&nbsp;- internal program restructuring: 39b2dd7 dmidecode: Split t=
able
      fetching from decoding</p>
    <p>I was a bit concerned about:<br>
    </p>
    <p>&nbsp;&nbsp; 3d68350 dmidecode: Drop the CPUID exception list</p>
    <p>but it's pretty arcane (1) and only affects HW from 2008 or
      earlier</p>
    <p>so we should be okay with that change!</p>
    <p><br>
    </p>
    <p>Steve, <br>
    </p>
    <p>Do you agree?</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p>commit 3d6835047f80691678e5db3127f9d573956413f0<br>
      Author: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:jdelvare@suse.de">&lt;jdelvare@suse.de&gt;</a><br>
      Date:&nbsp;&nbsp; Fri Dec 16 04:37:04 2022<br>
      <br>
      &nbsp;&nbsp;&nbsp; dmidecode: Drop the CPUID exception list<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Back in 2003, I had a system where the CPU type =
was not set. I
      added<br>
      &nbsp;&nbsp;&nbsp; a quirk so that it would still be recognized as =
x86, and the
      CPUID<br>
      &nbsp;&nbsp;&nbsp; could be decoded.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; A few more exceptions where added over the years=
, but in
      effect, the<br>
      &nbsp;&nbsp;&nbsp; list was last modified in 2008.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Having such an exception list isn't actually a g=
ood idea, for
      the<br>
      &nbsp;&nbsp;&nbsp; following reasons:<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * It requires endless maintenance work if =
we want to keep it<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up-to-date.<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * It adds some (admittedly minimal) burden=
 to the sane
      systems.<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * If we were to add more entries to the ex=
ception list, it
      wouldn't<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scale well (linear algorithmic=
 complexity). This could be
      improved<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but at the cost of more comple=
x code.<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * It sends the wrong message to the hardwa=
re manufacturers
      (&quot;You can<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get things wrong, we'll add a =
workaround on our side.&quot;)<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Therefore I would like to get rid of this except=
ion list.
      Doing so<br>
      &nbsp;&nbsp;&nbsp; has the nice side effect of simplifying the code=
 and making
      the<br>
      &nbsp;&nbsp;&nbsp; binary smaller.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; If anyone really needs the CPUID information on =
such
      non-compliant<br>
      &nbsp;&nbsp;&nbsp; systems, there are other ways to retrieve it, su=
ch as lscpu or<br>
      &nbsp;&nbsp;&nbsp; /proc/cpuinfo.<br>
      <br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.savannah.no=
ngnu.org/cgit/dmidecode.git/commit/?id=3D3d6835047f80691678e5db3127f9d573=
956413f0">https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D=
3d6835047f80691678e5db3127f9d573956413f0</a></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:f92e59a0894145a828dc9ac74bf8c7a=
9355e0587.1689373876.git.steve@sakoman.com">
      <pre class=3D"moz-quote-pre" wrap=3D""> .../dmidecode/dmidecode_3.4=
.bb                |   4 +
 5 files changed, 528 insertions(+)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_3.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_4.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
new file mode 100644
index 0000000000..53480d6299
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
@@ -0,0 +1,237 @@
+From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jde=
lvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Date: Tue, 27 Jun 2023 09:40:23 +0000
+Subject: [PATCH] dmidecode: Write the whole dump file at once
+
+When option --dump-bin is used, write the whole dump file at once,
+instead of opening and closing the file separately for the table
+and then for the entry point.
+
+As the file writing function is no longer generic, it gets moved
+from util.c to dmidecode.c.
+
+One minor functional change resulting from the new implementation is
+that the entry point is written first now, so the messages printed
+are swapped.
+
+Signed-off-by: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jdelvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Reviewed-by: Jerry Hoemann <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:jerry.hoemann@hpe.com">&lt;jerry.hoemann@hpe.com&gt;</a>
+
+CVE: CVE-2023-30630
+
+Reference: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808">https:=
//github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664=
e808</a>
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c25e7d5b8c2bb=
348bb206">https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c=
25e7d5b8c2bb348bb206</a>]
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 ---------------------------
+ util.h      |  1 -
+ 3 files changed, 58 insertions(+), 62 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 9aeff91..5477309 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_he=
ader *h, const u8 *data, u16 ver
+	}
+ }
+
+-static void dmi_table_dump(const u8 *buf, u32 len)
++static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
++			  u32 table_len)
+ {
++	FILE *f;
++
++	f =3D fopen(opt.dumpfile, &quot;wb&quot;);
++	if (!f)
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;fopen&quot;);
++		return -1;
++	}
++
++	if (!(opt.flags &amp; FLAG_QUIET))
++		pr_comment(&quot;Writing %d bytes to %s.&quot;, ep_len, opt.dumpfile)=
;
++	if (fwrite(ep, ep_len, 1, f) !=3D 1)
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;fwrite&quot;);
++		goto err_close;
++	}
++
++	if (fseek(f, 32, SEEK_SET) !=3D 0)
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;fseek&quot;);
++		goto err_close;
++	}
++
+	if (!(opt.flags &amp; FLAG_QUIET))
+-		pr_comment(&quot;Writing %d bytes to %s.&quot;, len, opt.dumpfile);
+-	write_dump(32, len, buf, opt.dumpfile, 0);
++		pr_comment(&quot;Writing %d bytes to %s.&quot;, table_len, opt.dumpfi=
le);
++	if (fwrite(table, table_len, 1, f) !=3D 1)
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;fwrite&quot;);
++		goto err_close;
++	}
++
++	if (fclose(f))
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;fclose&quot;);
++		return -1;
++	}
++
++	return 0;
++
++err_close:
++	fclose(f);
++	return -1;
+ }
+
+ static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 fl=
ags)
+@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 nu=
m, u32 ver, const char *devmem,
+		return;
+	}
+
+-	if (opt.flags &amp; FLAG_DUMP_BIN)
+-		dmi_table_dump(buf, len);
+-	else
+-		dmi_table_decode(buf, len, num, ver &gt;&gt; 8, flags);
+-
+	free(buf);
+ }
+
+@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
+
+ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+-	u32 ver;
++	u32 ver, len;
+	u64 offset;
++	u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+	if (buf[0x06] &gt; 0x20)
+@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *de=
vmem, u32 flags)
+		memcpy(crafted, buf, 32);
+		overwrite_smbios3_address(crafted);
+
+-		if (!(opt.flags &amp; FLAG_QUIET))
+-			pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x06],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x06], table, len);
+	}
+
+	return 1;
+@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *dev=
mem, u32 flags)
+ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+	u16 ver;
++	u32 len;
++        u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+	if (buf[0x05] &gt; 0x20)
+@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *dev=
mem, u32 flags)
+		memcpy(crafted, buf, 32);
+		overwrite_dmi_address(crafted + 0x10);
+
+-		if (!(opt.flags &amp; FLAG_QUIET))
+-			pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x05],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x05], table, len);
+	}
+
+	return 1;
+@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devm=
em, u32 flags)
+
+ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ {
++	u32 len;
++	u8 *table;
++
+	if (!checksum(buf, 0x0F))
+		return 0;
+
+@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *dev=
mem, u32 flags)
+		memcpy(crafted, buf, 16);
+		overwrite_dmi_address(crafted);
+
+-		if (!(opt.flags &amp; FLAG_QUIET))
+-			pr_comment(&quot;Writing %d bytes to %s.&quot;, 0x0F,
+-				   opt.dumpfile);
+-		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, 0x0F, table, len);
+	}
+
+	return 1;
+diff --git a/util.c b/util.c
+index 04aaadd..1547096 100644
+--- a/util.c
++++ b/util.c
+@@ -259,46 +259,6 @@ out:
+	return p;
+ }
+
+-int write_dump(size_t base, size_t len, const void *data, const char *d=
umpfile, int add)
+-{
+-	FILE *f;
+-
+-	f =3D fopen(dumpfile, add ? &quot;r+b&quot; : &quot;wb&quot;);
+-	if (!f)
+-	{
+-		fprintf(stderr, &quot;%s: &quot;, dumpfile);
+-		perror(&quot;fopen&quot;);
+-		return -1;
+-	}
+-
+-	if (fseek(f, base, SEEK_SET) !=3D 0)
+-	{
+-		fprintf(stderr, &quot;%s: &quot;, dumpfile);
+-		perror(&quot;fseek&quot;);
+-		goto err_close;
+-	}
+-
+-	if (fwrite(data, len, 1, f) !=3D 1)
+-	{
+-		fprintf(stderr, &quot;%s: &quot;, dumpfile);
+-		perror(&quot;fwrite&quot;);
+-		goto err_close;
+-	}
+-
+-	if (fclose(f))
+-	{
+-		fprintf(stderr, &quot;%s: &quot;, dumpfile);
+-		perror(&quot;fclose&quot;);
+-		return -1;
+-	}
+-
+-	return 0;
+-
+-err_close:
+-	fclose(f);
+-	return -1;
+-}
+-
+ /* Returns end - start + 1, assuming start &lt; end */
+ u64 u64_range(u64 start, u64 end)
+ {
+diff --git a/util.h b/util.h
+index 3094cf8..ef24eb9 100644
+--- a/util.h
++++ b/util.h
+@@ -27,5 +27,4 @@
+ int checksum(const u8 *buf, size_t len);
+ void *read_file(off_t base, size_t *len, const char *filename);
+ void *mem_chunk(off_t base, size_t len, const char *devmem);
+-int write_dump(size_t base, size_t len, const void *data, const char *d=
umpfile, int add);
+ u64 u64_range(u64 start, u64 end);
+--
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
new file mode 100644
index 0000000000..dcc87d2326
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
@@ -0,0 +1,81 @@
+From 6ca381c1247c81f74e1ca4e7706f70bdda72e6f2 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jde=
lvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Date: Tue, 27 Jun 2023 10:03:53 +0000
+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing =
file
+
+Make sure that the file passed to option --dump-bin does not already
+exist. In practice, it is rather unlikely that an honest user would
+want to overwrite an existing dump file, while this possibility
+could be used by a rogue user to corrupt a system file.
+
+Signed-off-by: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jdelvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Reviewed-by: Jerry Hoemann <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:jerry.hoemann@hpe.com">&lt;jerry.hoemann@hpe.com&gt;</a>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/mirror/dm=
idecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2">https://github.c=
om/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2</a>]
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ dmidecode.c     | 14 ++++++++++++--
+ man/dmidecode.8 |  3 ++-
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 5477309..98f9692 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -60,6 +60,7 @@
+  *    <a class=3D"moz-txt-link-freetext" href=3D"https://www.dmtf.org/s=
ites/default/files/DSP0270_1.0.1.pdf">https://www.dmtf.org/sites/default/=
files/DSP0270_1.0.1.pdf</a>
+  */
+
++#include &lt;fcntl.h&gt;
+ #include &lt;stdio.h&gt;
+ #include &lt;string.h&gt;
+ #include &lt;strings.h&gt;
+@@ -5430,13 +5431,22 @@ static void dmi_table_string(const struct dmi_he=
ader *h, const u8 *data, u16 ver
+ static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
+			  u32 table_len)
+ {
++	int fd;
+	FILE *f;
+
+-	f =3D fopen(opt.dumpfile, &quot;wb&quot;);
++	fd =3D open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
++	if (fd =3D=3D -1)
++	{
++		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
++		perror(&quot;open&quot;);
++		return -1;
++	}
++
++	f =3D fdopen(fd, &quot;wb&quot;);
+	if (!f)
+	{
+		fprintf(stderr, &quot;%s: &quot;, opt.dumpfile);
+-		perror(&quot;fopen&quot;);
++		perror(&quot;fdopen&quot;);
+		return -1;
+	}
+
+diff --git a/man/dmidecode.8 b/man/dmidecode.8
+index ed066b3..3a732c0 100644
+--- a/man/dmidecode.8
++++ b/man/dmidecode.8
+@@ -1,4 +1,4 @@
+-.TH DMIDECODE 8 &quot;January 2019&quot; &quot;dmidecode&quot;
++.TH DMIDECODE 8 &quot;February 2023&quot; &quot;dmidecode&quot;
+ .\&quot;
+ .SH NAME
+ dmidecode \- \s-1DMI\s0 table decoder
+@@ -159,6 +159,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainly =
useful for debugging.
+ Do not decode the entries, instead dump the DMI data to a file in binar=
y
+ form. The generated file is suitable to pass to \fB--from-dump\fP
+ later.
++\fIFILE\fP must not exist.
+ .TP
+ .BR &quot;  &quot; &quot;  &quot; &quot;--from-dump \fIFILE\fP&quot;
+ Read the DMI data from a binary file previously generated using
+--
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
new file mode 100644
index 0000000000..01d0d1f867
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
@@ -0,0 +1,69 @@
+From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jde=
lvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Date: Tue, 27 Jun 2023 10:25:50 +0000
+Subject: [PATCH] Consistently use read_file() when reading from a dump f=
ile
+
+Use read_file() instead of mem_chunk() to read the entry point from a
+dump file. This is faster, and consistent with how we then read the
+actual DMI table from that dump file.
+
+This made no functional difference so far, which is why it went
+unnoticed for years. But now that a file type check was added to the
+mem_chunk() function, we must stop using it to read from regular
+files.
+
+This will again allow root to use the --from-dump option.
+
+Signed-off-by: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jdelvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Tested-by: Jerry Hoemann <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:jerry.hoemann@hpe.com">&lt;jerry.hoemann@hpe.com&gt;</a>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3Dc76ddda0ba0=
aa99a55945e3290095c2ec493c892">https://git.savannah.nongnu.org/cgit/dmide=
code.git/commit/?id=3Dc76ddda0ba0aa99a55945e3290095c2ec493c892</a>]
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ dmidecode.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 98f9692..b4dbc9d 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
+		pr_comment(&quot;dmidecode %s&quot;, VERSION);
+
+	/* Read from dump if so instructed */
++        size =3D 0x20;
+	if (opt.flags &amp; FLAG_FROM_DUMP)
+	{
+		if (!(opt.flags &amp; FLAG_QUIET))
+			pr_info(&quot;Reading SMBIOS/DMI data from file %s.&quot;,
+				opt.dumpfile);
+-		if ((buf =3D mem_chunk(0, 0x20, opt.dumpfile)) =3D=3D NULL)
++                if ((buf =3D read_file(0, &amp;size, opt.dumpfile)) =3D=
=3D NULL)
+		{
+			ret =3D 1;
+			goto exit_free;
+		}
+
++                /* Truncated entry point can't be processed */
++                if (size &lt; 0x20)
++                {
++                        ret =3D 1;
++                        goto done;
++                }
++
+		if (memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)
+		{
+			if (smbios3_decode(buf, opt.dumpfile, 0))
+@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
+	 * contain one of several types of entry points, so read enough for
+	 * the largest one, then determine what type it contains.
+	 */
+-	size =3D 0x20;
+	if (!(opt.flags &amp; FLAG_NO_SYSFS)
+	 &amp;&amp; (buf =3D read_file(0, &amp;size, SYS_ENTRY_FILE)) !=3D NULL=
)
+	{
+--
+2.40.0
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
new file mode 100644
index 0000000000..5fa72b4f9b
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
@@ -0,0 +1,137 @@
+From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jde=
lvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+Date: Tue, 27 Jun 2023 10:58:11 +0000
+Subject: [PATCH] Don't read beyond sysfs entry point buffer
+
+Functions smbios_decode() and smbios3_decode() include a check
+against buffer overrun. This check assumes that the buffer length is
+always 32 bytes. This is true when reading from /dev/mem or from a
+dump file, however when reading from sysfs, the buffer length is the
+size of the actual sysfs attribute file, typically 31 bytes for an
+SMBIOS 2.x entry point and 24 bytes for an SMBIOS 3.x entry point.
+
+In the unlikely event of a malformed entry point, with encoded length
+larger than expected but smaller than or equal to 32, we would hit a
+buffer overrun. So properly pass the actual buffer length as an
+argument and perform the check against it.
+
+In practice, this will never happen, because on the Linux kernel
+side, the size of the sysfs attribute file is decided from the entry
+point length field. So it is technically impossible for them not to
+match. But user-space code should not make such assumptions.
+
+Signed-off-by: Jean Delvare <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jdelvare@suse.de">&lt;jdelvare@suse.de&gt;</a>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://git.savannah.nongnu.=
org/cgit/dmidecode.git/commit/?id=3D2b83c4b898f8325313162f588765411e8e3e5=
561">https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D2b83=
c4b898f8325313162f588765411e8e3e5561</a>]
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ dmidecode.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index b4dbc9d..870d94e 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
+	buf[0x17] =3D 0;
+ }
+
+-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, =
u32 flags)
+ {
+	u32 ver, len;
+	u64 offset;
+	u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x06] &gt; 0x20)
++        if (buf[0x06] &gt; buf_len)
+	{
+		fprintf(stderr,
+			&quot;Entry point length too large (%u bytes, expected %u).\n&quot;,
+@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *d=
evmem, u32 flags)
+	return 1;
+ }
+
+-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u=
32 flags)
+ {
+	u16 ver;
+	u32 len;
+         u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x05] &gt; 0x20)
++        if (buf[0x05] &gt; buf_len)
+	{
+		fprintf(stderr,
+			&quot;Entry point length too large (%u bytes, expected %u).\n&quot;,
+@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
+
+		if (memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)
+		{
+-			if (smbios3_decode(buf, opt.dumpfile, 0))
++                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
+				found++;
+		}
+		else if (memcmp(buf, &quot;_SM_&quot;, 4) =3D=3D 0)
+		{
+-			if (smbios_decode(buf, opt.dumpfile, 0))
++                        if (smbios_decode(buf, size, opt.dumpfile, 0))
+				found++;
+		}
+		else if (memcmp(buf, &quot;_DMI_&quot;, 5) =3D=3D 0)
+@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
+			pr_info(&quot;Getting SMBIOS data from sysfs.&quot;);
+		if (size &gt;=3D 24 &amp;&amp; memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D=
 0)
+		{
+-			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, F=
LAG_NO_FILE_OFFSET))
+				found++;
+		}
+		else if (size &gt;=3D 31 &amp;&amp; memcmp(buf, &quot;_SM_&quot;, 4) =3D=
=3D 0)
+		{
+-			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FL=
AG_NO_FILE_OFFSET))
+				found++;
+		}
+		else if (size &gt;=3D 15 &amp;&amp; memcmp(buf, &quot;_DMI_&quot;, 5) =
=3D=3D 0)
+@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
+
+	if (memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)
+	{
+-		if (smbios3_decode(buf, opt.devmem, 0))
++                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
+			found++;
+	}
+	else if (memcmp(buf, &quot;_SM_&quot;, 4) =3D=3D 0)
+	{
+-		if (smbios_decode(buf, opt.devmem, 0))
++                if (smbios_decode(buf, 0x20, opt.devmem, 0))
+			found++;
+	}
+	goto done;
+@@ -6114,7 +6114,7 @@ memory_scan:
+	{
+		if (memcmp(buf + fp, &quot;_SM3_&quot;, 5) =3D=3D 0)
+		{
+-			if (smbios3_decode(buf + fp, opt.devmem, 0))
++                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, =
0))
+			{
+				found++;
+				goto done;
+@@ -6127,7 +6127,7 @@ memory_scan:
+	{
+		if (memcmp(buf + fp, &quot;_SM_&quot;, 4) =3D=3D 0 &amp;&amp; fp &lt;=3D=
 0xFFE0)
+		{
+-			if (smbios_decode(buf + fp, opt.devmem, 0))
++                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0=
))
+			{
+				found++;
+				goto done;
+--
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/reci=
pes-devtools/dmidecode/dmidecode_3.4.bb
index bc741046dd..4d5255df64 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" =
href=3D"file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">&quot;file=
://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
=20
 SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Commit=
ting-changes-from-do_unpack_extra.patch">file://0001-Committing-changes-f=
rom-do_unpack_extra.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-30=
630_1.patch">file://CVE-2023-30630_1.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-30=
630_2.patch">file://CVE-2023-30630_2.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-30=
630_3.patch">file://CVE-2023-30630_3.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-30=
630_4.patch">file://CVE-2023-30630_4.patch</a> \
            &quot;
=20
 COMPATIBLE_HOST =3D &quot;(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-=
linux&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#184284): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/184284">https:/=
/lists.openembedded.org/g/openembedded-core/message/184284</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/100151225/3616765">https://lists.openembedded.org/mt=
/100151225/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------gtl0A8QWxEYvdBUzShiG26om--

